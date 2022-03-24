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
      ?auto_407565 - BLOCK
    )
    :vars
    (
      ?auto_407566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407565 ?auto_407566 ) ( CLEAR ?auto_407565 ) ( HAND-EMPTY ) ( not ( = ?auto_407565 ?auto_407566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407565 ?auto_407566 )
      ( !PUTDOWN ?auto_407565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_407568 - BLOCK
    )
    :vars
    (
      ?auto_407569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407568 ?auto_407569 ) ( CLEAR ?auto_407568 ) ( HAND-EMPTY ) ( not ( = ?auto_407568 ?auto_407569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407568 ?auto_407569 )
      ( !PUTDOWN ?auto_407568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_407572 - BLOCK
      ?auto_407573 - BLOCK
    )
    :vars
    (
      ?auto_407574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407572 ) ( ON ?auto_407573 ?auto_407574 ) ( CLEAR ?auto_407573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407572 ) ( not ( = ?auto_407572 ?auto_407573 ) ) ( not ( = ?auto_407572 ?auto_407574 ) ) ( not ( = ?auto_407573 ?auto_407574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407573 ?auto_407574 )
      ( !STACK ?auto_407573 ?auto_407572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_407577 - BLOCK
      ?auto_407578 - BLOCK
    )
    :vars
    (
      ?auto_407579 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407577 ) ( ON ?auto_407578 ?auto_407579 ) ( CLEAR ?auto_407578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407577 ) ( not ( = ?auto_407577 ?auto_407578 ) ) ( not ( = ?auto_407577 ?auto_407579 ) ) ( not ( = ?auto_407578 ?auto_407579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407578 ?auto_407579 )
      ( !STACK ?auto_407578 ?auto_407577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_407582 - BLOCK
      ?auto_407583 - BLOCK
    )
    :vars
    (
      ?auto_407584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407583 ?auto_407584 ) ( not ( = ?auto_407582 ?auto_407583 ) ) ( not ( = ?auto_407582 ?auto_407584 ) ) ( not ( = ?auto_407583 ?auto_407584 ) ) ( ON ?auto_407582 ?auto_407583 ) ( CLEAR ?auto_407582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407582 )
      ( MAKE-2PILE ?auto_407582 ?auto_407583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_407587 - BLOCK
      ?auto_407588 - BLOCK
    )
    :vars
    (
      ?auto_407589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407588 ?auto_407589 ) ( not ( = ?auto_407587 ?auto_407588 ) ) ( not ( = ?auto_407587 ?auto_407589 ) ) ( not ( = ?auto_407588 ?auto_407589 ) ) ( ON ?auto_407587 ?auto_407588 ) ( CLEAR ?auto_407587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407587 )
      ( MAKE-2PILE ?auto_407587 ?auto_407588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_407593 - BLOCK
      ?auto_407594 - BLOCK
      ?auto_407595 - BLOCK
    )
    :vars
    (
      ?auto_407596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407594 ) ( ON ?auto_407595 ?auto_407596 ) ( CLEAR ?auto_407595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407593 ) ( ON ?auto_407594 ?auto_407593 ) ( not ( = ?auto_407593 ?auto_407594 ) ) ( not ( = ?auto_407593 ?auto_407595 ) ) ( not ( = ?auto_407593 ?auto_407596 ) ) ( not ( = ?auto_407594 ?auto_407595 ) ) ( not ( = ?auto_407594 ?auto_407596 ) ) ( not ( = ?auto_407595 ?auto_407596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407595 ?auto_407596 )
      ( !STACK ?auto_407595 ?auto_407594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_407600 - BLOCK
      ?auto_407601 - BLOCK
      ?auto_407602 - BLOCK
    )
    :vars
    (
      ?auto_407603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407601 ) ( ON ?auto_407602 ?auto_407603 ) ( CLEAR ?auto_407602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407600 ) ( ON ?auto_407601 ?auto_407600 ) ( not ( = ?auto_407600 ?auto_407601 ) ) ( not ( = ?auto_407600 ?auto_407602 ) ) ( not ( = ?auto_407600 ?auto_407603 ) ) ( not ( = ?auto_407601 ?auto_407602 ) ) ( not ( = ?auto_407601 ?auto_407603 ) ) ( not ( = ?auto_407602 ?auto_407603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407602 ?auto_407603 )
      ( !STACK ?auto_407602 ?auto_407601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_407607 - BLOCK
      ?auto_407608 - BLOCK
      ?auto_407609 - BLOCK
    )
    :vars
    (
      ?auto_407610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407609 ?auto_407610 ) ( ON-TABLE ?auto_407607 ) ( not ( = ?auto_407607 ?auto_407608 ) ) ( not ( = ?auto_407607 ?auto_407609 ) ) ( not ( = ?auto_407607 ?auto_407610 ) ) ( not ( = ?auto_407608 ?auto_407609 ) ) ( not ( = ?auto_407608 ?auto_407610 ) ) ( not ( = ?auto_407609 ?auto_407610 ) ) ( CLEAR ?auto_407607 ) ( ON ?auto_407608 ?auto_407609 ) ( CLEAR ?auto_407608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407607 ?auto_407608 )
      ( MAKE-3PILE ?auto_407607 ?auto_407608 ?auto_407609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_407614 - BLOCK
      ?auto_407615 - BLOCK
      ?auto_407616 - BLOCK
    )
    :vars
    (
      ?auto_407617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407616 ?auto_407617 ) ( ON-TABLE ?auto_407614 ) ( not ( = ?auto_407614 ?auto_407615 ) ) ( not ( = ?auto_407614 ?auto_407616 ) ) ( not ( = ?auto_407614 ?auto_407617 ) ) ( not ( = ?auto_407615 ?auto_407616 ) ) ( not ( = ?auto_407615 ?auto_407617 ) ) ( not ( = ?auto_407616 ?auto_407617 ) ) ( CLEAR ?auto_407614 ) ( ON ?auto_407615 ?auto_407616 ) ( CLEAR ?auto_407615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407614 ?auto_407615 )
      ( MAKE-3PILE ?auto_407614 ?auto_407615 ?auto_407616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_407621 - BLOCK
      ?auto_407622 - BLOCK
      ?auto_407623 - BLOCK
    )
    :vars
    (
      ?auto_407624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407623 ?auto_407624 ) ( not ( = ?auto_407621 ?auto_407622 ) ) ( not ( = ?auto_407621 ?auto_407623 ) ) ( not ( = ?auto_407621 ?auto_407624 ) ) ( not ( = ?auto_407622 ?auto_407623 ) ) ( not ( = ?auto_407622 ?auto_407624 ) ) ( not ( = ?auto_407623 ?auto_407624 ) ) ( ON ?auto_407622 ?auto_407623 ) ( ON ?auto_407621 ?auto_407622 ) ( CLEAR ?auto_407621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407621 )
      ( MAKE-3PILE ?auto_407621 ?auto_407622 ?auto_407623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_407628 - BLOCK
      ?auto_407629 - BLOCK
      ?auto_407630 - BLOCK
    )
    :vars
    (
      ?auto_407631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407630 ?auto_407631 ) ( not ( = ?auto_407628 ?auto_407629 ) ) ( not ( = ?auto_407628 ?auto_407630 ) ) ( not ( = ?auto_407628 ?auto_407631 ) ) ( not ( = ?auto_407629 ?auto_407630 ) ) ( not ( = ?auto_407629 ?auto_407631 ) ) ( not ( = ?auto_407630 ?auto_407631 ) ) ( ON ?auto_407629 ?auto_407630 ) ( ON ?auto_407628 ?auto_407629 ) ( CLEAR ?auto_407628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407628 )
      ( MAKE-3PILE ?auto_407628 ?auto_407629 ?auto_407630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407636 - BLOCK
      ?auto_407637 - BLOCK
      ?auto_407638 - BLOCK
      ?auto_407639 - BLOCK
    )
    :vars
    (
      ?auto_407640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407638 ) ( ON ?auto_407639 ?auto_407640 ) ( CLEAR ?auto_407639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407636 ) ( ON ?auto_407637 ?auto_407636 ) ( ON ?auto_407638 ?auto_407637 ) ( not ( = ?auto_407636 ?auto_407637 ) ) ( not ( = ?auto_407636 ?auto_407638 ) ) ( not ( = ?auto_407636 ?auto_407639 ) ) ( not ( = ?auto_407636 ?auto_407640 ) ) ( not ( = ?auto_407637 ?auto_407638 ) ) ( not ( = ?auto_407637 ?auto_407639 ) ) ( not ( = ?auto_407637 ?auto_407640 ) ) ( not ( = ?auto_407638 ?auto_407639 ) ) ( not ( = ?auto_407638 ?auto_407640 ) ) ( not ( = ?auto_407639 ?auto_407640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407639 ?auto_407640 )
      ( !STACK ?auto_407639 ?auto_407638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407645 - BLOCK
      ?auto_407646 - BLOCK
      ?auto_407647 - BLOCK
      ?auto_407648 - BLOCK
    )
    :vars
    (
      ?auto_407649 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407647 ) ( ON ?auto_407648 ?auto_407649 ) ( CLEAR ?auto_407648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407645 ) ( ON ?auto_407646 ?auto_407645 ) ( ON ?auto_407647 ?auto_407646 ) ( not ( = ?auto_407645 ?auto_407646 ) ) ( not ( = ?auto_407645 ?auto_407647 ) ) ( not ( = ?auto_407645 ?auto_407648 ) ) ( not ( = ?auto_407645 ?auto_407649 ) ) ( not ( = ?auto_407646 ?auto_407647 ) ) ( not ( = ?auto_407646 ?auto_407648 ) ) ( not ( = ?auto_407646 ?auto_407649 ) ) ( not ( = ?auto_407647 ?auto_407648 ) ) ( not ( = ?auto_407647 ?auto_407649 ) ) ( not ( = ?auto_407648 ?auto_407649 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407648 ?auto_407649 )
      ( !STACK ?auto_407648 ?auto_407647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407654 - BLOCK
      ?auto_407655 - BLOCK
      ?auto_407656 - BLOCK
      ?auto_407657 - BLOCK
    )
    :vars
    (
      ?auto_407658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407657 ?auto_407658 ) ( ON-TABLE ?auto_407654 ) ( ON ?auto_407655 ?auto_407654 ) ( not ( = ?auto_407654 ?auto_407655 ) ) ( not ( = ?auto_407654 ?auto_407656 ) ) ( not ( = ?auto_407654 ?auto_407657 ) ) ( not ( = ?auto_407654 ?auto_407658 ) ) ( not ( = ?auto_407655 ?auto_407656 ) ) ( not ( = ?auto_407655 ?auto_407657 ) ) ( not ( = ?auto_407655 ?auto_407658 ) ) ( not ( = ?auto_407656 ?auto_407657 ) ) ( not ( = ?auto_407656 ?auto_407658 ) ) ( not ( = ?auto_407657 ?auto_407658 ) ) ( CLEAR ?auto_407655 ) ( ON ?auto_407656 ?auto_407657 ) ( CLEAR ?auto_407656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407654 ?auto_407655 ?auto_407656 )
      ( MAKE-4PILE ?auto_407654 ?auto_407655 ?auto_407656 ?auto_407657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407663 - BLOCK
      ?auto_407664 - BLOCK
      ?auto_407665 - BLOCK
      ?auto_407666 - BLOCK
    )
    :vars
    (
      ?auto_407667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407666 ?auto_407667 ) ( ON-TABLE ?auto_407663 ) ( ON ?auto_407664 ?auto_407663 ) ( not ( = ?auto_407663 ?auto_407664 ) ) ( not ( = ?auto_407663 ?auto_407665 ) ) ( not ( = ?auto_407663 ?auto_407666 ) ) ( not ( = ?auto_407663 ?auto_407667 ) ) ( not ( = ?auto_407664 ?auto_407665 ) ) ( not ( = ?auto_407664 ?auto_407666 ) ) ( not ( = ?auto_407664 ?auto_407667 ) ) ( not ( = ?auto_407665 ?auto_407666 ) ) ( not ( = ?auto_407665 ?auto_407667 ) ) ( not ( = ?auto_407666 ?auto_407667 ) ) ( CLEAR ?auto_407664 ) ( ON ?auto_407665 ?auto_407666 ) ( CLEAR ?auto_407665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407663 ?auto_407664 ?auto_407665 )
      ( MAKE-4PILE ?auto_407663 ?auto_407664 ?auto_407665 ?auto_407666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407672 - BLOCK
      ?auto_407673 - BLOCK
      ?auto_407674 - BLOCK
      ?auto_407675 - BLOCK
    )
    :vars
    (
      ?auto_407676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407675 ?auto_407676 ) ( ON-TABLE ?auto_407672 ) ( not ( = ?auto_407672 ?auto_407673 ) ) ( not ( = ?auto_407672 ?auto_407674 ) ) ( not ( = ?auto_407672 ?auto_407675 ) ) ( not ( = ?auto_407672 ?auto_407676 ) ) ( not ( = ?auto_407673 ?auto_407674 ) ) ( not ( = ?auto_407673 ?auto_407675 ) ) ( not ( = ?auto_407673 ?auto_407676 ) ) ( not ( = ?auto_407674 ?auto_407675 ) ) ( not ( = ?auto_407674 ?auto_407676 ) ) ( not ( = ?auto_407675 ?auto_407676 ) ) ( ON ?auto_407674 ?auto_407675 ) ( CLEAR ?auto_407672 ) ( ON ?auto_407673 ?auto_407674 ) ( CLEAR ?auto_407673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407672 ?auto_407673 )
      ( MAKE-4PILE ?auto_407672 ?auto_407673 ?auto_407674 ?auto_407675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407681 - BLOCK
      ?auto_407682 - BLOCK
      ?auto_407683 - BLOCK
      ?auto_407684 - BLOCK
    )
    :vars
    (
      ?auto_407685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407684 ?auto_407685 ) ( ON-TABLE ?auto_407681 ) ( not ( = ?auto_407681 ?auto_407682 ) ) ( not ( = ?auto_407681 ?auto_407683 ) ) ( not ( = ?auto_407681 ?auto_407684 ) ) ( not ( = ?auto_407681 ?auto_407685 ) ) ( not ( = ?auto_407682 ?auto_407683 ) ) ( not ( = ?auto_407682 ?auto_407684 ) ) ( not ( = ?auto_407682 ?auto_407685 ) ) ( not ( = ?auto_407683 ?auto_407684 ) ) ( not ( = ?auto_407683 ?auto_407685 ) ) ( not ( = ?auto_407684 ?auto_407685 ) ) ( ON ?auto_407683 ?auto_407684 ) ( CLEAR ?auto_407681 ) ( ON ?auto_407682 ?auto_407683 ) ( CLEAR ?auto_407682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407681 ?auto_407682 )
      ( MAKE-4PILE ?auto_407681 ?auto_407682 ?auto_407683 ?auto_407684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407690 - BLOCK
      ?auto_407691 - BLOCK
      ?auto_407692 - BLOCK
      ?auto_407693 - BLOCK
    )
    :vars
    (
      ?auto_407694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407693 ?auto_407694 ) ( not ( = ?auto_407690 ?auto_407691 ) ) ( not ( = ?auto_407690 ?auto_407692 ) ) ( not ( = ?auto_407690 ?auto_407693 ) ) ( not ( = ?auto_407690 ?auto_407694 ) ) ( not ( = ?auto_407691 ?auto_407692 ) ) ( not ( = ?auto_407691 ?auto_407693 ) ) ( not ( = ?auto_407691 ?auto_407694 ) ) ( not ( = ?auto_407692 ?auto_407693 ) ) ( not ( = ?auto_407692 ?auto_407694 ) ) ( not ( = ?auto_407693 ?auto_407694 ) ) ( ON ?auto_407692 ?auto_407693 ) ( ON ?auto_407691 ?auto_407692 ) ( ON ?auto_407690 ?auto_407691 ) ( CLEAR ?auto_407690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407690 )
      ( MAKE-4PILE ?auto_407690 ?auto_407691 ?auto_407692 ?auto_407693 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_407699 - BLOCK
      ?auto_407700 - BLOCK
      ?auto_407701 - BLOCK
      ?auto_407702 - BLOCK
    )
    :vars
    (
      ?auto_407703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407702 ?auto_407703 ) ( not ( = ?auto_407699 ?auto_407700 ) ) ( not ( = ?auto_407699 ?auto_407701 ) ) ( not ( = ?auto_407699 ?auto_407702 ) ) ( not ( = ?auto_407699 ?auto_407703 ) ) ( not ( = ?auto_407700 ?auto_407701 ) ) ( not ( = ?auto_407700 ?auto_407702 ) ) ( not ( = ?auto_407700 ?auto_407703 ) ) ( not ( = ?auto_407701 ?auto_407702 ) ) ( not ( = ?auto_407701 ?auto_407703 ) ) ( not ( = ?auto_407702 ?auto_407703 ) ) ( ON ?auto_407701 ?auto_407702 ) ( ON ?auto_407700 ?auto_407701 ) ( ON ?auto_407699 ?auto_407700 ) ( CLEAR ?auto_407699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407699 )
      ( MAKE-4PILE ?auto_407699 ?auto_407700 ?auto_407701 ?auto_407702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407709 - BLOCK
      ?auto_407710 - BLOCK
      ?auto_407711 - BLOCK
      ?auto_407712 - BLOCK
      ?auto_407713 - BLOCK
    )
    :vars
    (
      ?auto_407714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407712 ) ( ON ?auto_407713 ?auto_407714 ) ( CLEAR ?auto_407713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407709 ) ( ON ?auto_407710 ?auto_407709 ) ( ON ?auto_407711 ?auto_407710 ) ( ON ?auto_407712 ?auto_407711 ) ( not ( = ?auto_407709 ?auto_407710 ) ) ( not ( = ?auto_407709 ?auto_407711 ) ) ( not ( = ?auto_407709 ?auto_407712 ) ) ( not ( = ?auto_407709 ?auto_407713 ) ) ( not ( = ?auto_407709 ?auto_407714 ) ) ( not ( = ?auto_407710 ?auto_407711 ) ) ( not ( = ?auto_407710 ?auto_407712 ) ) ( not ( = ?auto_407710 ?auto_407713 ) ) ( not ( = ?auto_407710 ?auto_407714 ) ) ( not ( = ?auto_407711 ?auto_407712 ) ) ( not ( = ?auto_407711 ?auto_407713 ) ) ( not ( = ?auto_407711 ?auto_407714 ) ) ( not ( = ?auto_407712 ?auto_407713 ) ) ( not ( = ?auto_407712 ?auto_407714 ) ) ( not ( = ?auto_407713 ?auto_407714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407713 ?auto_407714 )
      ( !STACK ?auto_407713 ?auto_407712 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407720 - BLOCK
      ?auto_407721 - BLOCK
      ?auto_407722 - BLOCK
      ?auto_407723 - BLOCK
      ?auto_407724 - BLOCK
    )
    :vars
    (
      ?auto_407725 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407723 ) ( ON ?auto_407724 ?auto_407725 ) ( CLEAR ?auto_407724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407720 ) ( ON ?auto_407721 ?auto_407720 ) ( ON ?auto_407722 ?auto_407721 ) ( ON ?auto_407723 ?auto_407722 ) ( not ( = ?auto_407720 ?auto_407721 ) ) ( not ( = ?auto_407720 ?auto_407722 ) ) ( not ( = ?auto_407720 ?auto_407723 ) ) ( not ( = ?auto_407720 ?auto_407724 ) ) ( not ( = ?auto_407720 ?auto_407725 ) ) ( not ( = ?auto_407721 ?auto_407722 ) ) ( not ( = ?auto_407721 ?auto_407723 ) ) ( not ( = ?auto_407721 ?auto_407724 ) ) ( not ( = ?auto_407721 ?auto_407725 ) ) ( not ( = ?auto_407722 ?auto_407723 ) ) ( not ( = ?auto_407722 ?auto_407724 ) ) ( not ( = ?auto_407722 ?auto_407725 ) ) ( not ( = ?auto_407723 ?auto_407724 ) ) ( not ( = ?auto_407723 ?auto_407725 ) ) ( not ( = ?auto_407724 ?auto_407725 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407724 ?auto_407725 )
      ( !STACK ?auto_407724 ?auto_407723 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407731 - BLOCK
      ?auto_407732 - BLOCK
      ?auto_407733 - BLOCK
      ?auto_407734 - BLOCK
      ?auto_407735 - BLOCK
    )
    :vars
    (
      ?auto_407736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407735 ?auto_407736 ) ( ON-TABLE ?auto_407731 ) ( ON ?auto_407732 ?auto_407731 ) ( ON ?auto_407733 ?auto_407732 ) ( not ( = ?auto_407731 ?auto_407732 ) ) ( not ( = ?auto_407731 ?auto_407733 ) ) ( not ( = ?auto_407731 ?auto_407734 ) ) ( not ( = ?auto_407731 ?auto_407735 ) ) ( not ( = ?auto_407731 ?auto_407736 ) ) ( not ( = ?auto_407732 ?auto_407733 ) ) ( not ( = ?auto_407732 ?auto_407734 ) ) ( not ( = ?auto_407732 ?auto_407735 ) ) ( not ( = ?auto_407732 ?auto_407736 ) ) ( not ( = ?auto_407733 ?auto_407734 ) ) ( not ( = ?auto_407733 ?auto_407735 ) ) ( not ( = ?auto_407733 ?auto_407736 ) ) ( not ( = ?auto_407734 ?auto_407735 ) ) ( not ( = ?auto_407734 ?auto_407736 ) ) ( not ( = ?auto_407735 ?auto_407736 ) ) ( CLEAR ?auto_407733 ) ( ON ?auto_407734 ?auto_407735 ) ( CLEAR ?auto_407734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_407731 ?auto_407732 ?auto_407733 ?auto_407734 )
      ( MAKE-5PILE ?auto_407731 ?auto_407732 ?auto_407733 ?auto_407734 ?auto_407735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407742 - BLOCK
      ?auto_407743 - BLOCK
      ?auto_407744 - BLOCK
      ?auto_407745 - BLOCK
      ?auto_407746 - BLOCK
    )
    :vars
    (
      ?auto_407747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407746 ?auto_407747 ) ( ON-TABLE ?auto_407742 ) ( ON ?auto_407743 ?auto_407742 ) ( ON ?auto_407744 ?auto_407743 ) ( not ( = ?auto_407742 ?auto_407743 ) ) ( not ( = ?auto_407742 ?auto_407744 ) ) ( not ( = ?auto_407742 ?auto_407745 ) ) ( not ( = ?auto_407742 ?auto_407746 ) ) ( not ( = ?auto_407742 ?auto_407747 ) ) ( not ( = ?auto_407743 ?auto_407744 ) ) ( not ( = ?auto_407743 ?auto_407745 ) ) ( not ( = ?auto_407743 ?auto_407746 ) ) ( not ( = ?auto_407743 ?auto_407747 ) ) ( not ( = ?auto_407744 ?auto_407745 ) ) ( not ( = ?auto_407744 ?auto_407746 ) ) ( not ( = ?auto_407744 ?auto_407747 ) ) ( not ( = ?auto_407745 ?auto_407746 ) ) ( not ( = ?auto_407745 ?auto_407747 ) ) ( not ( = ?auto_407746 ?auto_407747 ) ) ( CLEAR ?auto_407744 ) ( ON ?auto_407745 ?auto_407746 ) ( CLEAR ?auto_407745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_407742 ?auto_407743 ?auto_407744 ?auto_407745 )
      ( MAKE-5PILE ?auto_407742 ?auto_407743 ?auto_407744 ?auto_407745 ?auto_407746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407753 - BLOCK
      ?auto_407754 - BLOCK
      ?auto_407755 - BLOCK
      ?auto_407756 - BLOCK
      ?auto_407757 - BLOCK
    )
    :vars
    (
      ?auto_407758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407757 ?auto_407758 ) ( ON-TABLE ?auto_407753 ) ( ON ?auto_407754 ?auto_407753 ) ( not ( = ?auto_407753 ?auto_407754 ) ) ( not ( = ?auto_407753 ?auto_407755 ) ) ( not ( = ?auto_407753 ?auto_407756 ) ) ( not ( = ?auto_407753 ?auto_407757 ) ) ( not ( = ?auto_407753 ?auto_407758 ) ) ( not ( = ?auto_407754 ?auto_407755 ) ) ( not ( = ?auto_407754 ?auto_407756 ) ) ( not ( = ?auto_407754 ?auto_407757 ) ) ( not ( = ?auto_407754 ?auto_407758 ) ) ( not ( = ?auto_407755 ?auto_407756 ) ) ( not ( = ?auto_407755 ?auto_407757 ) ) ( not ( = ?auto_407755 ?auto_407758 ) ) ( not ( = ?auto_407756 ?auto_407757 ) ) ( not ( = ?auto_407756 ?auto_407758 ) ) ( not ( = ?auto_407757 ?auto_407758 ) ) ( ON ?auto_407756 ?auto_407757 ) ( CLEAR ?auto_407754 ) ( ON ?auto_407755 ?auto_407756 ) ( CLEAR ?auto_407755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407753 ?auto_407754 ?auto_407755 )
      ( MAKE-5PILE ?auto_407753 ?auto_407754 ?auto_407755 ?auto_407756 ?auto_407757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407764 - BLOCK
      ?auto_407765 - BLOCK
      ?auto_407766 - BLOCK
      ?auto_407767 - BLOCK
      ?auto_407768 - BLOCK
    )
    :vars
    (
      ?auto_407769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407768 ?auto_407769 ) ( ON-TABLE ?auto_407764 ) ( ON ?auto_407765 ?auto_407764 ) ( not ( = ?auto_407764 ?auto_407765 ) ) ( not ( = ?auto_407764 ?auto_407766 ) ) ( not ( = ?auto_407764 ?auto_407767 ) ) ( not ( = ?auto_407764 ?auto_407768 ) ) ( not ( = ?auto_407764 ?auto_407769 ) ) ( not ( = ?auto_407765 ?auto_407766 ) ) ( not ( = ?auto_407765 ?auto_407767 ) ) ( not ( = ?auto_407765 ?auto_407768 ) ) ( not ( = ?auto_407765 ?auto_407769 ) ) ( not ( = ?auto_407766 ?auto_407767 ) ) ( not ( = ?auto_407766 ?auto_407768 ) ) ( not ( = ?auto_407766 ?auto_407769 ) ) ( not ( = ?auto_407767 ?auto_407768 ) ) ( not ( = ?auto_407767 ?auto_407769 ) ) ( not ( = ?auto_407768 ?auto_407769 ) ) ( ON ?auto_407767 ?auto_407768 ) ( CLEAR ?auto_407765 ) ( ON ?auto_407766 ?auto_407767 ) ( CLEAR ?auto_407766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407764 ?auto_407765 ?auto_407766 )
      ( MAKE-5PILE ?auto_407764 ?auto_407765 ?auto_407766 ?auto_407767 ?auto_407768 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407775 - BLOCK
      ?auto_407776 - BLOCK
      ?auto_407777 - BLOCK
      ?auto_407778 - BLOCK
      ?auto_407779 - BLOCK
    )
    :vars
    (
      ?auto_407780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407779 ?auto_407780 ) ( ON-TABLE ?auto_407775 ) ( not ( = ?auto_407775 ?auto_407776 ) ) ( not ( = ?auto_407775 ?auto_407777 ) ) ( not ( = ?auto_407775 ?auto_407778 ) ) ( not ( = ?auto_407775 ?auto_407779 ) ) ( not ( = ?auto_407775 ?auto_407780 ) ) ( not ( = ?auto_407776 ?auto_407777 ) ) ( not ( = ?auto_407776 ?auto_407778 ) ) ( not ( = ?auto_407776 ?auto_407779 ) ) ( not ( = ?auto_407776 ?auto_407780 ) ) ( not ( = ?auto_407777 ?auto_407778 ) ) ( not ( = ?auto_407777 ?auto_407779 ) ) ( not ( = ?auto_407777 ?auto_407780 ) ) ( not ( = ?auto_407778 ?auto_407779 ) ) ( not ( = ?auto_407778 ?auto_407780 ) ) ( not ( = ?auto_407779 ?auto_407780 ) ) ( ON ?auto_407778 ?auto_407779 ) ( ON ?auto_407777 ?auto_407778 ) ( CLEAR ?auto_407775 ) ( ON ?auto_407776 ?auto_407777 ) ( CLEAR ?auto_407776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407775 ?auto_407776 )
      ( MAKE-5PILE ?auto_407775 ?auto_407776 ?auto_407777 ?auto_407778 ?auto_407779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407786 - BLOCK
      ?auto_407787 - BLOCK
      ?auto_407788 - BLOCK
      ?auto_407789 - BLOCK
      ?auto_407790 - BLOCK
    )
    :vars
    (
      ?auto_407791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407790 ?auto_407791 ) ( ON-TABLE ?auto_407786 ) ( not ( = ?auto_407786 ?auto_407787 ) ) ( not ( = ?auto_407786 ?auto_407788 ) ) ( not ( = ?auto_407786 ?auto_407789 ) ) ( not ( = ?auto_407786 ?auto_407790 ) ) ( not ( = ?auto_407786 ?auto_407791 ) ) ( not ( = ?auto_407787 ?auto_407788 ) ) ( not ( = ?auto_407787 ?auto_407789 ) ) ( not ( = ?auto_407787 ?auto_407790 ) ) ( not ( = ?auto_407787 ?auto_407791 ) ) ( not ( = ?auto_407788 ?auto_407789 ) ) ( not ( = ?auto_407788 ?auto_407790 ) ) ( not ( = ?auto_407788 ?auto_407791 ) ) ( not ( = ?auto_407789 ?auto_407790 ) ) ( not ( = ?auto_407789 ?auto_407791 ) ) ( not ( = ?auto_407790 ?auto_407791 ) ) ( ON ?auto_407789 ?auto_407790 ) ( ON ?auto_407788 ?auto_407789 ) ( CLEAR ?auto_407786 ) ( ON ?auto_407787 ?auto_407788 ) ( CLEAR ?auto_407787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407786 ?auto_407787 )
      ( MAKE-5PILE ?auto_407786 ?auto_407787 ?auto_407788 ?auto_407789 ?auto_407790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407797 - BLOCK
      ?auto_407798 - BLOCK
      ?auto_407799 - BLOCK
      ?auto_407800 - BLOCK
      ?auto_407801 - BLOCK
    )
    :vars
    (
      ?auto_407802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407801 ?auto_407802 ) ( not ( = ?auto_407797 ?auto_407798 ) ) ( not ( = ?auto_407797 ?auto_407799 ) ) ( not ( = ?auto_407797 ?auto_407800 ) ) ( not ( = ?auto_407797 ?auto_407801 ) ) ( not ( = ?auto_407797 ?auto_407802 ) ) ( not ( = ?auto_407798 ?auto_407799 ) ) ( not ( = ?auto_407798 ?auto_407800 ) ) ( not ( = ?auto_407798 ?auto_407801 ) ) ( not ( = ?auto_407798 ?auto_407802 ) ) ( not ( = ?auto_407799 ?auto_407800 ) ) ( not ( = ?auto_407799 ?auto_407801 ) ) ( not ( = ?auto_407799 ?auto_407802 ) ) ( not ( = ?auto_407800 ?auto_407801 ) ) ( not ( = ?auto_407800 ?auto_407802 ) ) ( not ( = ?auto_407801 ?auto_407802 ) ) ( ON ?auto_407800 ?auto_407801 ) ( ON ?auto_407799 ?auto_407800 ) ( ON ?auto_407798 ?auto_407799 ) ( ON ?auto_407797 ?auto_407798 ) ( CLEAR ?auto_407797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407797 )
      ( MAKE-5PILE ?auto_407797 ?auto_407798 ?auto_407799 ?auto_407800 ?auto_407801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_407808 - BLOCK
      ?auto_407809 - BLOCK
      ?auto_407810 - BLOCK
      ?auto_407811 - BLOCK
      ?auto_407812 - BLOCK
    )
    :vars
    (
      ?auto_407813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407812 ?auto_407813 ) ( not ( = ?auto_407808 ?auto_407809 ) ) ( not ( = ?auto_407808 ?auto_407810 ) ) ( not ( = ?auto_407808 ?auto_407811 ) ) ( not ( = ?auto_407808 ?auto_407812 ) ) ( not ( = ?auto_407808 ?auto_407813 ) ) ( not ( = ?auto_407809 ?auto_407810 ) ) ( not ( = ?auto_407809 ?auto_407811 ) ) ( not ( = ?auto_407809 ?auto_407812 ) ) ( not ( = ?auto_407809 ?auto_407813 ) ) ( not ( = ?auto_407810 ?auto_407811 ) ) ( not ( = ?auto_407810 ?auto_407812 ) ) ( not ( = ?auto_407810 ?auto_407813 ) ) ( not ( = ?auto_407811 ?auto_407812 ) ) ( not ( = ?auto_407811 ?auto_407813 ) ) ( not ( = ?auto_407812 ?auto_407813 ) ) ( ON ?auto_407811 ?auto_407812 ) ( ON ?auto_407810 ?auto_407811 ) ( ON ?auto_407809 ?auto_407810 ) ( ON ?auto_407808 ?auto_407809 ) ( CLEAR ?auto_407808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407808 )
      ( MAKE-5PILE ?auto_407808 ?auto_407809 ?auto_407810 ?auto_407811 ?auto_407812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407820 - BLOCK
      ?auto_407821 - BLOCK
      ?auto_407822 - BLOCK
      ?auto_407823 - BLOCK
      ?auto_407824 - BLOCK
      ?auto_407825 - BLOCK
    )
    :vars
    (
      ?auto_407826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407824 ) ( ON ?auto_407825 ?auto_407826 ) ( CLEAR ?auto_407825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407820 ) ( ON ?auto_407821 ?auto_407820 ) ( ON ?auto_407822 ?auto_407821 ) ( ON ?auto_407823 ?auto_407822 ) ( ON ?auto_407824 ?auto_407823 ) ( not ( = ?auto_407820 ?auto_407821 ) ) ( not ( = ?auto_407820 ?auto_407822 ) ) ( not ( = ?auto_407820 ?auto_407823 ) ) ( not ( = ?auto_407820 ?auto_407824 ) ) ( not ( = ?auto_407820 ?auto_407825 ) ) ( not ( = ?auto_407820 ?auto_407826 ) ) ( not ( = ?auto_407821 ?auto_407822 ) ) ( not ( = ?auto_407821 ?auto_407823 ) ) ( not ( = ?auto_407821 ?auto_407824 ) ) ( not ( = ?auto_407821 ?auto_407825 ) ) ( not ( = ?auto_407821 ?auto_407826 ) ) ( not ( = ?auto_407822 ?auto_407823 ) ) ( not ( = ?auto_407822 ?auto_407824 ) ) ( not ( = ?auto_407822 ?auto_407825 ) ) ( not ( = ?auto_407822 ?auto_407826 ) ) ( not ( = ?auto_407823 ?auto_407824 ) ) ( not ( = ?auto_407823 ?auto_407825 ) ) ( not ( = ?auto_407823 ?auto_407826 ) ) ( not ( = ?auto_407824 ?auto_407825 ) ) ( not ( = ?auto_407824 ?auto_407826 ) ) ( not ( = ?auto_407825 ?auto_407826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407825 ?auto_407826 )
      ( !STACK ?auto_407825 ?auto_407824 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407833 - BLOCK
      ?auto_407834 - BLOCK
      ?auto_407835 - BLOCK
      ?auto_407836 - BLOCK
      ?auto_407837 - BLOCK
      ?auto_407838 - BLOCK
    )
    :vars
    (
      ?auto_407839 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407837 ) ( ON ?auto_407838 ?auto_407839 ) ( CLEAR ?auto_407838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407833 ) ( ON ?auto_407834 ?auto_407833 ) ( ON ?auto_407835 ?auto_407834 ) ( ON ?auto_407836 ?auto_407835 ) ( ON ?auto_407837 ?auto_407836 ) ( not ( = ?auto_407833 ?auto_407834 ) ) ( not ( = ?auto_407833 ?auto_407835 ) ) ( not ( = ?auto_407833 ?auto_407836 ) ) ( not ( = ?auto_407833 ?auto_407837 ) ) ( not ( = ?auto_407833 ?auto_407838 ) ) ( not ( = ?auto_407833 ?auto_407839 ) ) ( not ( = ?auto_407834 ?auto_407835 ) ) ( not ( = ?auto_407834 ?auto_407836 ) ) ( not ( = ?auto_407834 ?auto_407837 ) ) ( not ( = ?auto_407834 ?auto_407838 ) ) ( not ( = ?auto_407834 ?auto_407839 ) ) ( not ( = ?auto_407835 ?auto_407836 ) ) ( not ( = ?auto_407835 ?auto_407837 ) ) ( not ( = ?auto_407835 ?auto_407838 ) ) ( not ( = ?auto_407835 ?auto_407839 ) ) ( not ( = ?auto_407836 ?auto_407837 ) ) ( not ( = ?auto_407836 ?auto_407838 ) ) ( not ( = ?auto_407836 ?auto_407839 ) ) ( not ( = ?auto_407837 ?auto_407838 ) ) ( not ( = ?auto_407837 ?auto_407839 ) ) ( not ( = ?auto_407838 ?auto_407839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407838 ?auto_407839 )
      ( !STACK ?auto_407838 ?auto_407837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407846 - BLOCK
      ?auto_407847 - BLOCK
      ?auto_407848 - BLOCK
      ?auto_407849 - BLOCK
      ?auto_407850 - BLOCK
      ?auto_407851 - BLOCK
    )
    :vars
    (
      ?auto_407852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407851 ?auto_407852 ) ( ON-TABLE ?auto_407846 ) ( ON ?auto_407847 ?auto_407846 ) ( ON ?auto_407848 ?auto_407847 ) ( ON ?auto_407849 ?auto_407848 ) ( not ( = ?auto_407846 ?auto_407847 ) ) ( not ( = ?auto_407846 ?auto_407848 ) ) ( not ( = ?auto_407846 ?auto_407849 ) ) ( not ( = ?auto_407846 ?auto_407850 ) ) ( not ( = ?auto_407846 ?auto_407851 ) ) ( not ( = ?auto_407846 ?auto_407852 ) ) ( not ( = ?auto_407847 ?auto_407848 ) ) ( not ( = ?auto_407847 ?auto_407849 ) ) ( not ( = ?auto_407847 ?auto_407850 ) ) ( not ( = ?auto_407847 ?auto_407851 ) ) ( not ( = ?auto_407847 ?auto_407852 ) ) ( not ( = ?auto_407848 ?auto_407849 ) ) ( not ( = ?auto_407848 ?auto_407850 ) ) ( not ( = ?auto_407848 ?auto_407851 ) ) ( not ( = ?auto_407848 ?auto_407852 ) ) ( not ( = ?auto_407849 ?auto_407850 ) ) ( not ( = ?auto_407849 ?auto_407851 ) ) ( not ( = ?auto_407849 ?auto_407852 ) ) ( not ( = ?auto_407850 ?auto_407851 ) ) ( not ( = ?auto_407850 ?auto_407852 ) ) ( not ( = ?auto_407851 ?auto_407852 ) ) ( CLEAR ?auto_407849 ) ( ON ?auto_407850 ?auto_407851 ) ( CLEAR ?auto_407850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_407846 ?auto_407847 ?auto_407848 ?auto_407849 ?auto_407850 )
      ( MAKE-6PILE ?auto_407846 ?auto_407847 ?auto_407848 ?auto_407849 ?auto_407850 ?auto_407851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407859 - BLOCK
      ?auto_407860 - BLOCK
      ?auto_407861 - BLOCK
      ?auto_407862 - BLOCK
      ?auto_407863 - BLOCK
      ?auto_407864 - BLOCK
    )
    :vars
    (
      ?auto_407865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407864 ?auto_407865 ) ( ON-TABLE ?auto_407859 ) ( ON ?auto_407860 ?auto_407859 ) ( ON ?auto_407861 ?auto_407860 ) ( ON ?auto_407862 ?auto_407861 ) ( not ( = ?auto_407859 ?auto_407860 ) ) ( not ( = ?auto_407859 ?auto_407861 ) ) ( not ( = ?auto_407859 ?auto_407862 ) ) ( not ( = ?auto_407859 ?auto_407863 ) ) ( not ( = ?auto_407859 ?auto_407864 ) ) ( not ( = ?auto_407859 ?auto_407865 ) ) ( not ( = ?auto_407860 ?auto_407861 ) ) ( not ( = ?auto_407860 ?auto_407862 ) ) ( not ( = ?auto_407860 ?auto_407863 ) ) ( not ( = ?auto_407860 ?auto_407864 ) ) ( not ( = ?auto_407860 ?auto_407865 ) ) ( not ( = ?auto_407861 ?auto_407862 ) ) ( not ( = ?auto_407861 ?auto_407863 ) ) ( not ( = ?auto_407861 ?auto_407864 ) ) ( not ( = ?auto_407861 ?auto_407865 ) ) ( not ( = ?auto_407862 ?auto_407863 ) ) ( not ( = ?auto_407862 ?auto_407864 ) ) ( not ( = ?auto_407862 ?auto_407865 ) ) ( not ( = ?auto_407863 ?auto_407864 ) ) ( not ( = ?auto_407863 ?auto_407865 ) ) ( not ( = ?auto_407864 ?auto_407865 ) ) ( CLEAR ?auto_407862 ) ( ON ?auto_407863 ?auto_407864 ) ( CLEAR ?auto_407863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_407859 ?auto_407860 ?auto_407861 ?auto_407862 ?auto_407863 )
      ( MAKE-6PILE ?auto_407859 ?auto_407860 ?auto_407861 ?auto_407862 ?auto_407863 ?auto_407864 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407872 - BLOCK
      ?auto_407873 - BLOCK
      ?auto_407874 - BLOCK
      ?auto_407875 - BLOCK
      ?auto_407876 - BLOCK
      ?auto_407877 - BLOCK
    )
    :vars
    (
      ?auto_407878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407877 ?auto_407878 ) ( ON-TABLE ?auto_407872 ) ( ON ?auto_407873 ?auto_407872 ) ( ON ?auto_407874 ?auto_407873 ) ( not ( = ?auto_407872 ?auto_407873 ) ) ( not ( = ?auto_407872 ?auto_407874 ) ) ( not ( = ?auto_407872 ?auto_407875 ) ) ( not ( = ?auto_407872 ?auto_407876 ) ) ( not ( = ?auto_407872 ?auto_407877 ) ) ( not ( = ?auto_407872 ?auto_407878 ) ) ( not ( = ?auto_407873 ?auto_407874 ) ) ( not ( = ?auto_407873 ?auto_407875 ) ) ( not ( = ?auto_407873 ?auto_407876 ) ) ( not ( = ?auto_407873 ?auto_407877 ) ) ( not ( = ?auto_407873 ?auto_407878 ) ) ( not ( = ?auto_407874 ?auto_407875 ) ) ( not ( = ?auto_407874 ?auto_407876 ) ) ( not ( = ?auto_407874 ?auto_407877 ) ) ( not ( = ?auto_407874 ?auto_407878 ) ) ( not ( = ?auto_407875 ?auto_407876 ) ) ( not ( = ?auto_407875 ?auto_407877 ) ) ( not ( = ?auto_407875 ?auto_407878 ) ) ( not ( = ?auto_407876 ?auto_407877 ) ) ( not ( = ?auto_407876 ?auto_407878 ) ) ( not ( = ?auto_407877 ?auto_407878 ) ) ( ON ?auto_407876 ?auto_407877 ) ( CLEAR ?auto_407874 ) ( ON ?auto_407875 ?auto_407876 ) ( CLEAR ?auto_407875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_407872 ?auto_407873 ?auto_407874 ?auto_407875 )
      ( MAKE-6PILE ?auto_407872 ?auto_407873 ?auto_407874 ?auto_407875 ?auto_407876 ?auto_407877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407885 - BLOCK
      ?auto_407886 - BLOCK
      ?auto_407887 - BLOCK
      ?auto_407888 - BLOCK
      ?auto_407889 - BLOCK
      ?auto_407890 - BLOCK
    )
    :vars
    (
      ?auto_407891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407890 ?auto_407891 ) ( ON-TABLE ?auto_407885 ) ( ON ?auto_407886 ?auto_407885 ) ( ON ?auto_407887 ?auto_407886 ) ( not ( = ?auto_407885 ?auto_407886 ) ) ( not ( = ?auto_407885 ?auto_407887 ) ) ( not ( = ?auto_407885 ?auto_407888 ) ) ( not ( = ?auto_407885 ?auto_407889 ) ) ( not ( = ?auto_407885 ?auto_407890 ) ) ( not ( = ?auto_407885 ?auto_407891 ) ) ( not ( = ?auto_407886 ?auto_407887 ) ) ( not ( = ?auto_407886 ?auto_407888 ) ) ( not ( = ?auto_407886 ?auto_407889 ) ) ( not ( = ?auto_407886 ?auto_407890 ) ) ( not ( = ?auto_407886 ?auto_407891 ) ) ( not ( = ?auto_407887 ?auto_407888 ) ) ( not ( = ?auto_407887 ?auto_407889 ) ) ( not ( = ?auto_407887 ?auto_407890 ) ) ( not ( = ?auto_407887 ?auto_407891 ) ) ( not ( = ?auto_407888 ?auto_407889 ) ) ( not ( = ?auto_407888 ?auto_407890 ) ) ( not ( = ?auto_407888 ?auto_407891 ) ) ( not ( = ?auto_407889 ?auto_407890 ) ) ( not ( = ?auto_407889 ?auto_407891 ) ) ( not ( = ?auto_407890 ?auto_407891 ) ) ( ON ?auto_407889 ?auto_407890 ) ( CLEAR ?auto_407887 ) ( ON ?auto_407888 ?auto_407889 ) ( CLEAR ?auto_407888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_407885 ?auto_407886 ?auto_407887 ?auto_407888 )
      ( MAKE-6PILE ?auto_407885 ?auto_407886 ?auto_407887 ?auto_407888 ?auto_407889 ?auto_407890 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407898 - BLOCK
      ?auto_407899 - BLOCK
      ?auto_407900 - BLOCK
      ?auto_407901 - BLOCK
      ?auto_407902 - BLOCK
      ?auto_407903 - BLOCK
    )
    :vars
    (
      ?auto_407904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407903 ?auto_407904 ) ( ON-TABLE ?auto_407898 ) ( ON ?auto_407899 ?auto_407898 ) ( not ( = ?auto_407898 ?auto_407899 ) ) ( not ( = ?auto_407898 ?auto_407900 ) ) ( not ( = ?auto_407898 ?auto_407901 ) ) ( not ( = ?auto_407898 ?auto_407902 ) ) ( not ( = ?auto_407898 ?auto_407903 ) ) ( not ( = ?auto_407898 ?auto_407904 ) ) ( not ( = ?auto_407899 ?auto_407900 ) ) ( not ( = ?auto_407899 ?auto_407901 ) ) ( not ( = ?auto_407899 ?auto_407902 ) ) ( not ( = ?auto_407899 ?auto_407903 ) ) ( not ( = ?auto_407899 ?auto_407904 ) ) ( not ( = ?auto_407900 ?auto_407901 ) ) ( not ( = ?auto_407900 ?auto_407902 ) ) ( not ( = ?auto_407900 ?auto_407903 ) ) ( not ( = ?auto_407900 ?auto_407904 ) ) ( not ( = ?auto_407901 ?auto_407902 ) ) ( not ( = ?auto_407901 ?auto_407903 ) ) ( not ( = ?auto_407901 ?auto_407904 ) ) ( not ( = ?auto_407902 ?auto_407903 ) ) ( not ( = ?auto_407902 ?auto_407904 ) ) ( not ( = ?auto_407903 ?auto_407904 ) ) ( ON ?auto_407902 ?auto_407903 ) ( ON ?auto_407901 ?auto_407902 ) ( CLEAR ?auto_407899 ) ( ON ?auto_407900 ?auto_407901 ) ( CLEAR ?auto_407900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407898 ?auto_407899 ?auto_407900 )
      ( MAKE-6PILE ?auto_407898 ?auto_407899 ?auto_407900 ?auto_407901 ?auto_407902 ?auto_407903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407911 - BLOCK
      ?auto_407912 - BLOCK
      ?auto_407913 - BLOCK
      ?auto_407914 - BLOCK
      ?auto_407915 - BLOCK
      ?auto_407916 - BLOCK
    )
    :vars
    (
      ?auto_407917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407916 ?auto_407917 ) ( ON-TABLE ?auto_407911 ) ( ON ?auto_407912 ?auto_407911 ) ( not ( = ?auto_407911 ?auto_407912 ) ) ( not ( = ?auto_407911 ?auto_407913 ) ) ( not ( = ?auto_407911 ?auto_407914 ) ) ( not ( = ?auto_407911 ?auto_407915 ) ) ( not ( = ?auto_407911 ?auto_407916 ) ) ( not ( = ?auto_407911 ?auto_407917 ) ) ( not ( = ?auto_407912 ?auto_407913 ) ) ( not ( = ?auto_407912 ?auto_407914 ) ) ( not ( = ?auto_407912 ?auto_407915 ) ) ( not ( = ?auto_407912 ?auto_407916 ) ) ( not ( = ?auto_407912 ?auto_407917 ) ) ( not ( = ?auto_407913 ?auto_407914 ) ) ( not ( = ?auto_407913 ?auto_407915 ) ) ( not ( = ?auto_407913 ?auto_407916 ) ) ( not ( = ?auto_407913 ?auto_407917 ) ) ( not ( = ?auto_407914 ?auto_407915 ) ) ( not ( = ?auto_407914 ?auto_407916 ) ) ( not ( = ?auto_407914 ?auto_407917 ) ) ( not ( = ?auto_407915 ?auto_407916 ) ) ( not ( = ?auto_407915 ?auto_407917 ) ) ( not ( = ?auto_407916 ?auto_407917 ) ) ( ON ?auto_407915 ?auto_407916 ) ( ON ?auto_407914 ?auto_407915 ) ( CLEAR ?auto_407912 ) ( ON ?auto_407913 ?auto_407914 ) ( CLEAR ?auto_407913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_407911 ?auto_407912 ?auto_407913 )
      ( MAKE-6PILE ?auto_407911 ?auto_407912 ?auto_407913 ?auto_407914 ?auto_407915 ?auto_407916 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407924 - BLOCK
      ?auto_407925 - BLOCK
      ?auto_407926 - BLOCK
      ?auto_407927 - BLOCK
      ?auto_407928 - BLOCK
      ?auto_407929 - BLOCK
    )
    :vars
    (
      ?auto_407930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407929 ?auto_407930 ) ( ON-TABLE ?auto_407924 ) ( not ( = ?auto_407924 ?auto_407925 ) ) ( not ( = ?auto_407924 ?auto_407926 ) ) ( not ( = ?auto_407924 ?auto_407927 ) ) ( not ( = ?auto_407924 ?auto_407928 ) ) ( not ( = ?auto_407924 ?auto_407929 ) ) ( not ( = ?auto_407924 ?auto_407930 ) ) ( not ( = ?auto_407925 ?auto_407926 ) ) ( not ( = ?auto_407925 ?auto_407927 ) ) ( not ( = ?auto_407925 ?auto_407928 ) ) ( not ( = ?auto_407925 ?auto_407929 ) ) ( not ( = ?auto_407925 ?auto_407930 ) ) ( not ( = ?auto_407926 ?auto_407927 ) ) ( not ( = ?auto_407926 ?auto_407928 ) ) ( not ( = ?auto_407926 ?auto_407929 ) ) ( not ( = ?auto_407926 ?auto_407930 ) ) ( not ( = ?auto_407927 ?auto_407928 ) ) ( not ( = ?auto_407927 ?auto_407929 ) ) ( not ( = ?auto_407927 ?auto_407930 ) ) ( not ( = ?auto_407928 ?auto_407929 ) ) ( not ( = ?auto_407928 ?auto_407930 ) ) ( not ( = ?auto_407929 ?auto_407930 ) ) ( ON ?auto_407928 ?auto_407929 ) ( ON ?auto_407927 ?auto_407928 ) ( ON ?auto_407926 ?auto_407927 ) ( CLEAR ?auto_407924 ) ( ON ?auto_407925 ?auto_407926 ) ( CLEAR ?auto_407925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407924 ?auto_407925 )
      ( MAKE-6PILE ?auto_407924 ?auto_407925 ?auto_407926 ?auto_407927 ?auto_407928 ?auto_407929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407937 - BLOCK
      ?auto_407938 - BLOCK
      ?auto_407939 - BLOCK
      ?auto_407940 - BLOCK
      ?auto_407941 - BLOCK
      ?auto_407942 - BLOCK
    )
    :vars
    (
      ?auto_407943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407942 ?auto_407943 ) ( ON-TABLE ?auto_407937 ) ( not ( = ?auto_407937 ?auto_407938 ) ) ( not ( = ?auto_407937 ?auto_407939 ) ) ( not ( = ?auto_407937 ?auto_407940 ) ) ( not ( = ?auto_407937 ?auto_407941 ) ) ( not ( = ?auto_407937 ?auto_407942 ) ) ( not ( = ?auto_407937 ?auto_407943 ) ) ( not ( = ?auto_407938 ?auto_407939 ) ) ( not ( = ?auto_407938 ?auto_407940 ) ) ( not ( = ?auto_407938 ?auto_407941 ) ) ( not ( = ?auto_407938 ?auto_407942 ) ) ( not ( = ?auto_407938 ?auto_407943 ) ) ( not ( = ?auto_407939 ?auto_407940 ) ) ( not ( = ?auto_407939 ?auto_407941 ) ) ( not ( = ?auto_407939 ?auto_407942 ) ) ( not ( = ?auto_407939 ?auto_407943 ) ) ( not ( = ?auto_407940 ?auto_407941 ) ) ( not ( = ?auto_407940 ?auto_407942 ) ) ( not ( = ?auto_407940 ?auto_407943 ) ) ( not ( = ?auto_407941 ?auto_407942 ) ) ( not ( = ?auto_407941 ?auto_407943 ) ) ( not ( = ?auto_407942 ?auto_407943 ) ) ( ON ?auto_407941 ?auto_407942 ) ( ON ?auto_407940 ?auto_407941 ) ( ON ?auto_407939 ?auto_407940 ) ( CLEAR ?auto_407937 ) ( ON ?auto_407938 ?auto_407939 ) ( CLEAR ?auto_407938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_407937 ?auto_407938 )
      ( MAKE-6PILE ?auto_407937 ?auto_407938 ?auto_407939 ?auto_407940 ?auto_407941 ?auto_407942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407950 - BLOCK
      ?auto_407951 - BLOCK
      ?auto_407952 - BLOCK
      ?auto_407953 - BLOCK
      ?auto_407954 - BLOCK
      ?auto_407955 - BLOCK
    )
    :vars
    (
      ?auto_407956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407955 ?auto_407956 ) ( not ( = ?auto_407950 ?auto_407951 ) ) ( not ( = ?auto_407950 ?auto_407952 ) ) ( not ( = ?auto_407950 ?auto_407953 ) ) ( not ( = ?auto_407950 ?auto_407954 ) ) ( not ( = ?auto_407950 ?auto_407955 ) ) ( not ( = ?auto_407950 ?auto_407956 ) ) ( not ( = ?auto_407951 ?auto_407952 ) ) ( not ( = ?auto_407951 ?auto_407953 ) ) ( not ( = ?auto_407951 ?auto_407954 ) ) ( not ( = ?auto_407951 ?auto_407955 ) ) ( not ( = ?auto_407951 ?auto_407956 ) ) ( not ( = ?auto_407952 ?auto_407953 ) ) ( not ( = ?auto_407952 ?auto_407954 ) ) ( not ( = ?auto_407952 ?auto_407955 ) ) ( not ( = ?auto_407952 ?auto_407956 ) ) ( not ( = ?auto_407953 ?auto_407954 ) ) ( not ( = ?auto_407953 ?auto_407955 ) ) ( not ( = ?auto_407953 ?auto_407956 ) ) ( not ( = ?auto_407954 ?auto_407955 ) ) ( not ( = ?auto_407954 ?auto_407956 ) ) ( not ( = ?auto_407955 ?auto_407956 ) ) ( ON ?auto_407954 ?auto_407955 ) ( ON ?auto_407953 ?auto_407954 ) ( ON ?auto_407952 ?auto_407953 ) ( ON ?auto_407951 ?auto_407952 ) ( ON ?auto_407950 ?auto_407951 ) ( CLEAR ?auto_407950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407950 )
      ( MAKE-6PILE ?auto_407950 ?auto_407951 ?auto_407952 ?auto_407953 ?auto_407954 ?auto_407955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_407963 - BLOCK
      ?auto_407964 - BLOCK
      ?auto_407965 - BLOCK
      ?auto_407966 - BLOCK
      ?auto_407967 - BLOCK
      ?auto_407968 - BLOCK
    )
    :vars
    (
      ?auto_407969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_407968 ?auto_407969 ) ( not ( = ?auto_407963 ?auto_407964 ) ) ( not ( = ?auto_407963 ?auto_407965 ) ) ( not ( = ?auto_407963 ?auto_407966 ) ) ( not ( = ?auto_407963 ?auto_407967 ) ) ( not ( = ?auto_407963 ?auto_407968 ) ) ( not ( = ?auto_407963 ?auto_407969 ) ) ( not ( = ?auto_407964 ?auto_407965 ) ) ( not ( = ?auto_407964 ?auto_407966 ) ) ( not ( = ?auto_407964 ?auto_407967 ) ) ( not ( = ?auto_407964 ?auto_407968 ) ) ( not ( = ?auto_407964 ?auto_407969 ) ) ( not ( = ?auto_407965 ?auto_407966 ) ) ( not ( = ?auto_407965 ?auto_407967 ) ) ( not ( = ?auto_407965 ?auto_407968 ) ) ( not ( = ?auto_407965 ?auto_407969 ) ) ( not ( = ?auto_407966 ?auto_407967 ) ) ( not ( = ?auto_407966 ?auto_407968 ) ) ( not ( = ?auto_407966 ?auto_407969 ) ) ( not ( = ?auto_407967 ?auto_407968 ) ) ( not ( = ?auto_407967 ?auto_407969 ) ) ( not ( = ?auto_407968 ?auto_407969 ) ) ( ON ?auto_407967 ?auto_407968 ) ( ON ?auto_407966 ?auto_407967 ) ( ON ?auto_407965 ?auto_407966 ) ( ON ?auto_407964 ?auto_407965 ) ( ON ?auto_407963 ?auto_407964 ) ( CLEAR ?auto_407963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_407963 )
      ( MAKE-6PILE ?auto_407963 ?auto_407964 ?auto_407965 ?auto_407966 ?auto_407967 ?auto_407968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_407977 - BLOCK
      ?auto_407978 - BLOCK
      ?auto_407979 - BLOCK
      ?auto_407980 - BLOCK
      ?auto_407981 - BLOCK
      ?auto_407982 - BLOCK
      ?auto_407983 - BLOCK
    )
    :vars
    (
      ?auto_407984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407982 ) ( ON ?auto_407983 ?auto_407984 ) ( CLEAR ?auto_407983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407977 ) ( ON ?auto_407978 ?auto_407977 ) ( ON ?auto_407979 ?auto_407978 ) ( ON ?auto_407980 ?auto_407979 ) ( ON ?auto_407981 ?auto_407980 ) ( ON ?auto_407982 ?auto_407981 ) ( not ( = ?auto_407977 ?auto_407978 ) ) ( not ( = ?auto_407977 ?auto_407979 ) ) ( not ( = ?auto_407977 ?auto_407980 ) ) ( not ( = ?auto_407977 ?auto_407981 ) ) ( not ( = ?auto_407977 ?auto_407982 ) ) ( not ( = ?auto_407977 ?auto_407983 ) ) ( not ( = ?auto_407977 ?auto_407984 ) ) ( not ( = ?auto_407978 ?auto_407979 ) ) ( not ( = ?auto_407978 ?auto_407980 ) ) ( not ( = ?auto_407978 ?auto_407981 ) ) ( not ( = ?auto_407978 ?auto_407982 ) ) ( not ( = ?auto_407978 ?auto_407983 ) ) ( not ( = ?auto_407978 ?auto_407984 ) ) ( not ( = ?auto_407979 ?auto_407980 ) ) ( not ( = ?auto_407979 ?auto_407981 ) ) ( not ( = ?auto_407979 ?auto_407982 ) ) ( not ( = ?auto_407979 ?auto_407983 ) ) ( not ( = ?auto_407979 ?auto_407984 ) ) ( not ( = ?auto_407980 ?auto_407981 ) ) ( not ( = ?auto_407980 ?auto_407982 ) ) ( not ( = ?auto_407980 ?auto_407983 ) ) ( not ( = ?auto_407980 ?auto_407984 ) ) ( not ( = ?auto_407981 ?auto_407982 ) ) ( not ( = ?auto_407981 ?auto_407983 ) ) ( not ( = ?auto_407981 ?auto_407984 ) ) ( not ( = ?auto_407982 ?auto_407983 ) ) ( not ( = ?auto_407982 ?auto_407984 ) ) ( not ( = ?auto_407983 ?auto_407984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407983 ?auto_407984 )
      ( !STACK ?auto_407983 ?auto_407982 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_407992 - BLOCK
      ?auto_407993 - BLOCK
      ?auto_407994 - BLOCK
      ?auto_407995 - BLOCK
      ?auto_407996 - BLOCK
      ?auto_407997 - BLOCK
      ?auto_407998 - BLOCK
    )
    :vars
    (
      ?auto_407999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_407997 ) ( ON ?auto_407998 ?auto_407999 ) ( CLEAR ?auto_407998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_407992 ) ( ON ?auto_407993 ?auto_407992 ) ( ON ?auto_407994 ?auto_407993 ) ( ON ?auto_407995 ?auto_407994 ) ( ON ?auto_407996 ?auto_407995 ) ( ON ?auto_407997 ?auto_407996 ) ( not ( = ?auto_407992 ?auto_407993 ) ) ( not ( = ?auto_407992 ?auto_407994 ) ) ( not ( = ?auto_407992 ?auto_407995 ) ) ( not ( = ?auto_407992 ?auto_407996 ) ) ( not ( = ?auto_407992 ?auto_407997 ) ) ( not ( = ?auto_407992 ?auto_407998 ) ) ( not ( = ?auto_407992 ?auto_407999 ) ) ( not ( = ?auto_407993 ?auto_407994 ) ) ( not ( = ?auto_407993 ?auto_407995 ) ) ( not ( = ?auto_407993 ?auto_407996 ) ) ( not ( = ?auto_407993 ?auto_407997 ) ) ( not ( = ?auto_407993 ?auto_407998 ) ) ( not ( = ?auto_407993 ?auto_407999 ) ) ( not ( = ?auto_407994 ?auto_407995 ) ) ( not ( = ?auto_407994 ?auto_407996 ) ) ( not ( = ?auto_407994 ?auto_407997 ) ) ( not ( = ?auto_407994 ?auto_407998 ) ) ( not ( = ?auto_407994 ?auto_407999 ) ) ( not ( = ?auto_407995 ?auto_407996 ) ) ( not ( = ?auto_407995 ?auto_407997 ) ) ( not ( = ?auto_407995 ?auto_407998 ) ) ( not ( = ?auto_407995 ?auto_407999 ) ) ( not ( = ?auto_407996 ?auto_407997 ) ) ( not ( = ?auto_407996 ?auto_407998 ) ) ( not ( = ?auto_407996 ?auto_407999 ) ) ( not ( = ?auto_407997 ?auto_407998 ) ) ( not ( = ?auto_407997 ?auto_407999 ) ) ( not ( = ?auto_407998 ?auto_407999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_407998 ?auto_407999 )
      ( !STACK ?auto_407998 ?auto_407997 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408007 - BLOCK
      ?auto_408008 - BLOCK
      ?auto_408009 - BLOCK
      ?auto_408010 - BLOCK
      ?auto_408011 - BLOCK
      ?auto_408012 - BLOCK
      ?auto_408013 - BLOCK
    )
    :vars
    (
      ?auto_408014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408013 ?auto_408014 ) ( ON-TABLE ?auto_408007 ) ( ON ?auto_408008 ?auto_408007 ) ( ON ?auto_408009 ?auto_408008 ) ( ON ?auto_408010 ?auto_408009 ) ( ON ?auto_408011 ?auto_408010 ) ( not ( = ?auto_408007 ?auto_408008 ) ) ( not ( = ?auto_408007 ?auto_408009 ) ) ( not ( = ?auto_408007 ?auto_408010 ) ) ( not ( = ?auto_408007 ?auto_408011 ) ) ( not ( = ?auto_408007 ?auto_408012 ) ) ( not ( = ?auto_408007 ?auto_408013 ) ) ( not ( = ?auto_408007 ?auto_408014 ) ) ( not ( = ?auto_408008 ?auto_408009 ) ) ( not ( = ?auto_408008 ?auto_408010 ) ) ( not ( = ?auto_408008 ?auto_408011 ) ) ( not ( = ?auto_408008 ?auto_408012 ) ) ( not ( = ?auto_408008 ?auto_408013 ) ) ( not ( = ?auto_408008 ?auto_408014 ) ) ( not ( = ?auto_408009 ?auto_408010 ) ) ( not ( = ?auto_408009 ?auto_408011 ) ) ( not ( = ?auto_408009 ?auto_408012 ) ) ( not ( = ?auto_408009 ?auto_408013 ) ) ( not ( = ?auto_408009 ?auto_408014 ) ) ( not ( = ?auto_408010 ?auto_408011 ) ) ( not ( = ?auto_408010 ?auto_408012 ) ) ( not ( = ?auto_408010 ?auto_408013 ) ) ( not ( = ?auto_408010 ?auto_408014 ) ) ( not ( = ?auto_408011 ?auto_408012 ) ) ( not ( = ?auto_408011 ?auto_408013 ) ) ( not ( = ?auto_408011 ?auto_408014 ) ) ( not ( = ?auto_408012 ?auto_408013 ) ) ( not ( = ?auto_408012 ?auto_408014 ) ) ( not ( = ?auto_408013 ?auto_408014 ) ) ( CLEAR ?auto_408011 ) ( ON ?auto_408012 ?auto_408013 ) ( CLEAR ?auto_408012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408007 ?auto_408008 ?auto_408009 ?auto_408010 ?auto_408011 ?auto_408012 )
      ( MAKE-7PILE ?auto_408007 ?auto_408008 ?auto_408009 ?auto_408010 ?auto_408011 ?auto_408012 ?auto_408013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408022 - BLOCK
      ?auto_408023 - BLOCK
      ?auto_408024 - BLOCK
      ?auto_408025 - BLOCK
      ?auto_408026 - BLOCK
      ?auto_408027 - BLOCK
      ?auto_408028 - BLOCK
    )
    :vars
    (
      ?auto_408029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408028 ?auto_408029 ) ( ON-TABLE ?auto_408022 ) ( ON ?auto_408023 ?auto_408022 ) ( ON ?auto_408024 ?auto_408023 ) ( ON ?auto_408025 ?auto_408024 ) ( ON ?auto_408026 ?auto_408025 ) ( not ( = ?auto_408022 ?auto_408023 ) ) ( not ( = ?auto_408022 ?auto_408024 ) ) ( not ( = ?auto_408022 ?auto_408025 ) ) ( not ( = ?auto_408022 ?auto_408026 ) ) ( not ( = ?auto_408022 ?auto_408027 ) ) ( not ( = ?auto_408022 ?auto_408028 ) ) ( not ( = ?auto_408022 ?auto_408029 ) ) ( not ( = ?auto_408023 ?auto_408024 ) ) ( not ( = ?auto_408023 ?auto_408025 ) ) ( not ( = ?auto_408023 ?auto_408026 ) ) ( not ( = ?auto_408023 ?auto_408027 ) ) ( not ( = ?auto_408023 ?auto_408028 ) ) ( not ( = ?auto_408023 ?auto_408029 ) ) ( not ( = ?auto_408024 ?auto_408025 ) ) ( not ( = ?auto_408024 ?auto_408026 ) ) ( not ( = ?auto_408024 ?auto_408027 ) ) ( not ( = ?auto_408024 ?auto_408028 ) ) ( not ( = ?auto_408024 ?auto_408029 ) ) ( not ( = ?auto_408025 ?auto_408026 ) ) ( not ( = ?auto_408025 ?auto_408027 ) ) ( not ( = ?auto_408025 ?auto_408028 ) ) ( not ( = ?auto_408025 ?auto_408029 ) ) ( not ( = ?auto_408026 ?auto_408027 ) ) ( not ( = ?auto_408026 ?auto_408028 ) ) ( not ( = ?auto_408026 ?auto_408029 ) ) ( not ( = ?auto_408027 ?auto_408028 ) ) ( not ( = ?auto_408027 ?auto_408029 ) ) ( not ( = ?auto_408028 ?auto_408029 ) ) ( CLEAR ?auto_408026 ) ( ON ?auto_408027 ?auto_408028 ) ( CLEAR ?auto_408027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408022 ?auto_408023 ?auto_408024 ?auto_408025 ?auto_408026 ?auto_408027 )
      ( MAKE-7PILE ?auto_408022 ?auto_408023 ?auto_408024 ?auto_408025 ?auto_408026 ?auto_408027 ?auto_408028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408037 - BLOCK
      ?auto_408038 - BLOCK
      ?auto_408039 - BLOCK
      ?auto_408040 - BLOCK
      ?auto_408041 - BLOCK
      ?auto_408042 - BLOCK
      ?auto_408043 - BLOCK
    )
    :vars
    (
      ?auto_408044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408043 ?auto_408044 ) ( ON-TABLE ?auto_408037 ) ( ON ?auto_408038 ?auto_408037 ) ( ON ?auto_408039 ?auto_408038 ) ( ON ?auto_408040 ?auto_408039 ) ( not ( = ?auto_408037 ?auto_408038 ) ) ( not ( = ?auto_408037 ?auto_408039 ) ) ( not ( = ?auto_408037 ?auto_408040 ) ) ( not ( = ?auto_408037 ?auto_408041 ) ) ( not ( = ?auto_408037 ?auto_408042 ) ) ( not ( = ?auto_408037 ?auto_408043 ) ) ( not ( = ?auto_408037 ?auto_408044 ) ) ( not ( = ?auto_408038 ?auto_408039 ) ) ( not ( = ?auto_408038 ?auto_408040 ) ) ( not ( = ?auto_408038 ?auto_408041 ) ) ( not ( = ?auto_408038 ?auto_408042 ) ) ( not ( = ?auto_408038 ?auto_408043 ) ) ( not ( = ?auto_408038 ?auto_408044 ) ) ( not ( = ?auto_408039 ?auto_408040 ) ) ( not ( = ?auto_408039 ?auto_408041 ) ) ( not ( = ?auto_408039 ?auto_408042 ) ) ( not ( = ?auto_408039 ?auto_408043 ) ) ( not ( = ?auto_408039 ?auto_408044 ) ) ( not ( = ?auto_408040 ?auto_408041 ) ) ( not ( = ?auto_408040 ?auto_408042 ) ) ( not ( = ?auto_408040 ?auto_408043 ) ) ( not ( = ?auto_408040 ?auto_408044 ) ) ( not ( = ?auto_408041 ?auto_408042 ) ) ( not ( = ?auto_408041 ?auto_408043 ) ) ( not ( = ?auto_408041 ?auto_408044 ) ) ( not ( = ?auto_408042 ?auto_408043 ) ) ( not ( = ?auto_408042 ?auto_408044 ) ) ( not ( = ?auto_408043 ?auto_408044 ) ) ( ON ?auto_408042 ?auto_408043 ) ( CLEAR ?auto_408040 ) ( ON ?auto_408041 ?auto_408042 ) ( CLEAR ?auto_408041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_408037 ?auto_408038 ?auto_408039 ?auto_408040 ?auto_408041 )
      ( MAKE-7PILE ?auto_408037 ?auto_408038 ?auto_408039 ?auto_408040 ?auto_408041 ?auto_408042 ?auto_408043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408052 - BLOCK
      ?auto_408053 - BLOCK
      ?auto_408054 - BLOCK
      ?auto_408055 - BLOCK
      ?auto_408056 - BLOCK
      ?auto_408057 - BLOCK
      ?auto_408058 - BLOCK
    )
    :vars
    (
      ?auto_408059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408058 ?auto_408059 ) ( ON-TABLE ?auto_408052 ) ( ON ?auto_408053 ?auto_408052 ) ( ON ?auto_408054 ?auto_408053 ) ( ON ?auto_408055 ?auto_408054 ) ( not ( = ?auto_408052 ?auto_408053 ) ) ( not ( = ?auto_408052 ?auto_408054 ) ) ( not ( = ?auto_408052 ?auto_408055 ) ) ( not ( = ?auto_408052 ?auto_408056 ) ) ( not ( = ?auto_408052 ?auto_408057 ) ) ( not ( = ?auto_408052 ?auto_408058 ) ) ( not ( = ?auto_408052 ?auto_408059 ) ) ( not ( = ?auto_408053 ?auto_408054 ) ) ( not ( = ?auto_408053 ?auto_408055 ) ) ( not ( = ?auto_408053 ?auto_408056 ) ) ( not ( = ?auto_408053 ?auto_408057 ) ) ( not ( = ?auto_408053 ?auto_408058 ) ) ( not ( = ?auto_408053 ?auto_408059 ) ) ( not ( = ?auto_408054 ?auto_408055 ) ) ( not ( = ?auto_408054 ?auto_408056 ) ) ( not ( = ?auto_408054 ?auto_408057 ) ) ( not ( = ?auto_408054 ?auto_408058 ) ) ( not ( = ?auto_408054 ?auto_408059 ) ) ( not ( = ?auto_408055 ?auto_408056 ) ) ( not ( = ?auto_408055 ?auto_408057 ) ) ( not ( = ?auto_408055 ?auto_408058 ) ) ( not ( = ?auto_408055 ?auto_408059 ) ) ( not ( = ?auto_408056 ?auto_408057 ) ) ( not ( = ?auto_408056 ?auto_408058 ) ) ( not ( = ?auto_408056 ?auto_408059 ) ) ( not ( = ?auto_408057 ?auto_408058 ) ) ( not ( = ?auto_408057 ?auto_408059 ) ) ( not ( = ?auto_408058 ?auto_408059 ) ) ( ON ?auto_408057 ?auto_408058 ) ( CLEAR ?auto_408055 ) ( ON ?auto_408056 ?auto_408057 ) ( CLEAR ?auto_408056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_408052 ?auto_408053 ?auto_408054 ?auto_408055 ?auto_408056 )
      ( MAKE-7PILE ?auto_408052 ?auto_408053 ?auto_408054 ?auto_408055 ?auto_408056 ?auto_408057 ?auto_408058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408067 - BLOCK
      ?auto_408068 - BLOCK
      ?auto_408069 - BLOCK
      ?auto_408070 - BLOCK
      ?auto_408071 - BLOCK
      ?auto_408072 - BLOCK
      ?auto_408073 - BLOCK
    )
    :vars
    (
      ?auto_408074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408073 ?auto_408074 ) ( ON-TABLE ?auto_408067 ) ( ON ?auto_408068 ?auto_408067 ) ( ON ?auto_408069 ?auto_408068 ) ( not ( = ?auto_408067 ?auto_408068 ) ) ( not ( = ?auto_408067 ?auto_408069 ) ) ( not ( = ?auto_408067 ?auto_408070 ) ) ( not ( = ?auto_408067 ?auto_408071 ) ) ( not ( = ?auto_408067 ?auto_408072 ) ) ( not ( = ?auto_408067 ?auto_408073 ) ) ( not ( = ?auto_408067 ?auto_408074 ) ) ( not ( = ?auto_408068 ?auto_408069 ) ) ( not ( = ?auto_408068 ?auto_408070 ) ) ( not ( = ?auto_408068 ?auto_408071 ) ) ( not ( = ?auto_408068 ?auto_408072 ) ) ( not ( = ?auto_408068 ?auto_408073 ) ) ( not ( = ?auto_408068 ?auto_408074 ) ) ( not ( = ?auto_408069 ?auto_408070 ) ) ( not ( = ?auto_408069 ?auto_408071 ) ) ( not ( = ?auto_408069 ?auto_408072 ) ) ( not ( = ?auto_408069 ?auto_408073 ) ) ( not ( = ?auto_408069 ?auto_408074 ) ) ( not ( = ?auto_408070 ?auto_408071 ) ) ( not ( = ?auto_408070 ?auto_408072 ) ) ( not ( = ?auto_408070 ?auto_408073 ) ) ( not ( = ?auto_408070 ?auto_408074 ) ) ( not ( = ?auto_408071 ?auto_408072 ) ) ( not ( = ?auto_408071 ?auto_408073 ) ) ( not ( = ?auto_408071 ?auto_408074 ) ) ( not ( = ?auto_408072 ?auto_408073 ) ) ( not ( = ?auto_408072 ?auto_408074 ) ) ( not ( = ?auto_408073 ?auto_408074 ) ) ( ON ?auto_408072 ?auto_408073 ) ( ON ?auto_408071 ?auto_408072 ) ( CLEAR ?auto_408069 ) ( ON ?auto_408070 ?auto_408071 ) ( CLEAR ?auto_408070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_408067 ?auto_408068 ?auto_408069 ?auto_408070 )
      ( MAKE-7PILE ?auto_408067 ?auto_408068 ?auto_408069 ?auto_408070 ?auto_408071 ?auto_408072 ?auto_408073 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408082 - BLOCK
      ?auto_408083 - BLOCK
      ?auto_408084 - BLOCK
      ?auto_408085 - BLOCK
      ?auto_408086 - BLOCK
      ?auto_408087 - BLOCK
      ?auto_408088 - BLOCK
    )
    :vars
    (
      ?auto_408089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408088 ?auto_408089 ) ( ON-TABLE ?auto_408082 ) ( ON ?auto_408083 ?auto_408082 ) ( ON ?auto_408084 ?auto_408083 ) ( not ( = ?auto_408082 ?auto_408083 ) ) ( not ( = ?auto_408082 ?auto_408084 ) ) ( not ( = ?auto_408082 ?auto_408085 ) ) ( not ( = ?auto_408082 ?auto_408086 ) ) ( not ( = ?auto_408082 ?auto_408087 ) ) ( not ( = ?auto_408082 ?auto_408088 ) ) ( not ( = ?auto_408082 ?auto_408089 ) ) ( not ( = ?auto_408083 ?auto_408084 ) ) ( not ( = ?auto_408083 ?auto_408085 ) ) ( not ( = ?auto_408083 ?auto_408086 ) ) ( not ( = ?auto_408083 ?auto_408087 ) ) ( not ( = ?auto_408083 ?auto_408088 ) ) ( not ( = ?auto_408083 ?auto_408089 ) ) ( not ( = ?auto_408084 ?auto_408085 ) ) ( not ( = ?auto_408084 ?auto_408086 ) ) ( not ( = ?auto_408084 ?auto_408087 ) ) ( not ( = ?auto_408084 ?auto_408088 ) ) ( not ( = ?auto_408084 ?auto_408089 ) ) ( not ( = ?auto_408085 ?auto_408086 ) ) ( not ( = ?auto_408085 ?auto_408087 ) ) ( not ( = ?auto_408085 ?auto_408088 ) ) ( not ( = ?auto_408085 ?auto_408089 ) ) ( not ( = ?auto_408086 ?auto_408087 ) ) ( not ( = ?auto_408086 ?auto_408088 ) ) ( not ( = ?auto_408086 ?auto_408089 ) ) ( not ( = ?auto_408087 ?auto_408088 ) ) ( not ( = ?auto_408087 ?auto_408089 ) ) ( not ( = ?auto_408088 ?auto_408089 ) ) ( ON ?auto_408087 ?auto_408088 ) ( ON ?auto_408086 ?auto_408087 ) ( CLEAR ?auto_408084 ) ( ON ?auto_408085 ?auto_408086 ) ( CLEAR ?auto_408085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_408082 ?auto_408083 ?auto_408084 ?auto_408085 )
      ( MAKE-7PILE ?auto_408082 ?auto_408083 ?auto_408084 ?auto_408085 ?auto_408086 ?auto_408087 ?auto_408088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408097 - BLOCK
      ?auto_408098 - BLOCK
      ?auto_408099 - BLOCK
      ?auto_408100 - BLOCK
      ?auto_408101 - BLOCK
      ?auto_408102 - BLOCK
      ?auto_408103 - BLOCK
    )
    :vars
    (
      ?auto_408104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408103 ?auto_408104 ) ( ON-TABLE ?auto_408097 ) ( ON ?auto_408098 ?auto_408097 ) ( not ( = ?auto_408097 ?auto_408098 ) ) ( not ( = ?auto_408097 ?auto_408099 ) ) ( not ( = ?auto_408097 ?auto_408100 ) ) ( not ( = ?auto_408097 ?auto_408101 ) ) ( not ( = ?auto_408097 ?auto_408102 ) ) ( not ( = ?auto_408097 ?auto_408103 ) ) ( not ( = ?auto_408097 ?auto_408104 ) ) ( not ( = ?auto_408098 ?auto_408099 ) ) ( not ( = ?auto_408098 ?auto_408100 ) ) ( not ( = ?auto_408098 ?auto_408101 ) ) ( not ( = ?auto_408098 ?auto_408102 ) ) ( not ( = ?auto_408098 ?auto_408103 ) ) ( not ( = ?auto_408098 ?auto_408104 ) ) ( not ( = ?auto_408099 ?auto_408100 ) ) ( not ( = ?auto_408099 ?auto_408101 ) ) ( not ( = ?auto_408099 ?auto_408102 ) ) ( not ( = ?auto_408099 ?auto_408103 ) ) ( not ( = ?auto_408099 ?auto_408104 ) ) ( not ( = ?auto_408100 ?auto_408101 ) ) ( not ( = ?auto_408100 ?auto_408102 ) ) ( not ( = ?auto_408100 ?auto_408103 ) ) ( not ( = ?auto_408100 ?auto_408104 ) ) ( not ( = ?auto_408101 ?auto_408102 ) ) ( not ( = ?auto_408101 ?auto_408103 ) ) ( not ( = ?auto_408101 ?auto_408104 ) ) ( not ( = ?auto_408102 ?auto_408103 ) ) ( not ( = ?auto_408102 ?auto_408104 ) ) ( not ( = ?auto_408103 ?auto_408104 ) ) ( ON ?auto_408102 ?auto_408103 ) ( ON ?auto_408101 ?auto_408102 ) ( ON ?auto_408100 ?auto_408101 ) ( CLEAR ?auto_408098 ) ( ON ?auto_408099 ?auto_408100 ) ( CLEAR ?auto_408099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_408097 ?auto_408098 ?auto_408099 )
      ( MAKE-7PILE ?auto_408097 ?auto_408098 ?auto_408099 ?auto_408100 ?auto_408101 ?auto_408102 ?auto_408103 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408112 - BLOCK
      ?auto_408113 - BLOCK
      ?auto_408114 - BLOCK
      ?auto_408115 - BLOCK
      ?auto_408116 - BLOCK
      ?auto_408117 - BLOCK
      ?auto_408118 - BLOCK
    )
    :vars
    (
      ?auto_408119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408118 ?auto_408119 ) ( ON-TABLE ?auto_408112 ) ( ON ?auto_408113 ?auto_408112 ) ( not ( = ?auto_408112 ?auto_408113 ) ) ( not ( = ?auto_408112 ?auto_408114 ) ) ( not ( = ?auto_408112 ?auto_408115 ) ) ( not ( = ?auto_408112 ?auto_408116 ) ) ( not ( = ?auto_408112 ?auto_408117 ) ) ( not ( = ?auto_408112 ?auto_408118 ) ) ( not ( = ?auto_408112 ?auto_408119 ) ) ( not ( = ?auto_408113 ?auto_408114 ) ) ( not ( = ?auto_408113 ?auto_408115 ) ) ( not ( = ?auto_408113 ?auto_408116 ) ) ( not ( = ?auto_408113 ?auto_408117 ) ) ( not ( = ?auto_408113 ?auto_408118 ) ) ( not ( = ?auto_408113 ?auto_408119 ) ) ( not ( = ?auto_408114 ?auto_408115 ) ) ( not ( = ?auto_408114 ?auto_408116 ) ) ( not ( = ?auto_408114 ?auto_408117 ) ) ( not ( = ?auto_408114 ?auto_408118 ) ) ( not ( = ?auto_408114 ?auto_408119 ) ) ( not ( = ?auto_408115 ?auto_408116 ) ) ( not ( = ?auto_408115 ?auto_408117 ) ) ( not ( = ?auto_408115 ?auto_408118 ) ) ( not ( = ?auto_408115 ?auto_408119 ) ) ( not ( = ?auto_408116 ?auto_408117 ) ) ( not ( = ?auto_408116 ?auto_408118 ) ) ( not ( = ?auto_408116 ?auto_408119 ) ) ( not ( = ?auto_408117 ?auto_408118 ) ) ( not ( = ?auto_408117 ?auto_408119 ) ) ( not ( = ?auto_408118 ?auto_408119 ) ) ( ON ?auto_408117 ?auto_408118 ) ( ON ?auto_408116 ?auto_408117 ) ( ON ?auto_408115 ?auto_408116 ) ( CLEAR ?auto_408113 ) ( ON ?auto_408114 ?auto_408115 ) ( CLEAR ?auto_408114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_408112 ?auto_408113 ?auto_408114 )
      ( MAKE-7PILE ?auto_408112 ?auto_408113 ?auto_408114 ?auto_408115 ?auto_408116 ?auto_408117 ?auto_408118 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408127 - BLOCK
      ?auto_408128 - BLOCK
      ?auto_408129 - BLOCK
      ?auto_408130 - BLOCK
      ?auto_408131 - BLOCK
      ?auto_408132 - BLOCK
      ?auto_408133 - BLOCK
    )
    :vars
    (
      ?auto_408134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408133 ?auto_408134 ) ( ON-TABLE ?auto_408127 ) ( not ( = ?auto_408127 ?auto_408128 ) ) ( not ( = ?auto_408127 ?auto_408129 ) ) ( not ( = ?auto_408127 ?auto_408130 ) ) ( not ( = ?auto_408127 ?auto_408131 ) ) ( not ( = ?auto_408127 ?auto_408132 ) ) ( not ( = ?auto_408127 ?auto_408133 ) ) ( not ( = ?auto_408127 ?auto_408134 ) ) ( not ( = ?auto_408128 ?auto_408129 ) ) ( not ( = ?auto_408128 ?auto_408130 ) ) ( not ( = ?auto_408128 ?auto_408131 ) ) ( not ( = ?auto_408128 ?auto_408132 ) ) ( not ( = ?auto_408128 ?auto_408133 ) ) ( not ( = ?auto_408128 ?auto_408134 ) ) ( not ( = ?auto_408129 ?auto_408130 ) ) ( not ( = ?auto_408129 ?auto_408131 ) ) ( not ( = ?auto_408129 ?auto_408132 ) ) ( not ( = ?auto_408129 ?auto_408133 ) ) ( not ( = ?auto_408129 ?auto_408134 ) ) ( not ( = ?auto_408130 ?auto_408131 ) ) ( not ( = ?auto_408130 ?auto_408132 ) ) ( not ( = ?auto_408130 ?auto_408133 ) ) ( not ( = ?auto_408130 ?auto_408134 ) ) ( not ( = ?auto_408131 ?auto_408132 ) ) ( not ( = ?auto_408131 ?auto_408133 ) ) ( not ( = ?auto_408131 ?auto_408134 ) ) ( not ( = ?auto_408132 ?auto_408133 ) ) ( not ( = ?auto_408132 ?auto_408134 ) ) ( not ( = ?auto_408133 ?auto_408134 ) ) ( ON ?auto_408132 ?auto_408133 ) ( ON ?auto_408131 ?auto_408132 ) ( ON ?auto_408130 ?auto_408131 ) ( ON ?auto_408129 ?auto_408130 ) ( CLEAR ?auto_408127 ) ( ON ?auto_408128 ?auto_408129 ) ( CLEAR ?auto_408128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_408127 ?auto_408128 )
      ( MAKE-7PILE ?auto_408127 ?auto_408128 ?auto_408129 ?auto_408130 ?auto_408131 ?auto_408132 ?auto_408133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408142 - BLOCK
      ?auto_408143 - BLOCK
      ?auto_408144 - BLOCK
      ?auto_408145 - BLOCK
      ?auto_408146 - BLOCK
      ?auto_408147 - BLOCK
      ?auto_408148 - BLOCK
    )
    :vars
    (
      ?auto_408149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408148 ?auto_408149 ) ( ON-TABLE ?auto_408142 ) ( not ( = ?auto_408142 ?auto_408143 ) ) ( not ( = ?auto_408142 ?auto_408144 ) ) ( not ( = ?auto_408142 ?auto_408145 ) ) ( not ( = ?auto_408142 ?auto_408146 ) ) ( not ( = ?auto_408142 ?auto_408147 ) ) ( not ( = ?auto_408142 ?auto_408148 ) ) ( not ( = ?auto_408142 ?auto_408149 ) ) ( not ( = ?auto_408143 ?auto_408144 ) ) ( not ( = ?auto_408143 ?auto_408145 ) ) ( not ( = ?auto_408143 ?auto_408146 ) ) ( not ( = ?auto_408143 ?auto_408147 ) ) ( not ( = ?auto_408143 ?auto_408148 ) ) ( not ( = ?auto_408143 ?auto_408149 ) ) ( not ( = ?auto_408144 ?auto_408145 ) ) ( not ( = ?auto_408144 ?auto_408146 ) ) ( not ( = ?auto_408144 ?auto_408147 ) ) ( not ( = ?auto_408144 ?auto_408148 ) ) ( not ( = ?auto_408144 ?auto_408149 ) ) ( not ( = ?auto_408145 ?auto_408146 ) ) ( not ( = ?auto_408145 ?auto_408147 ) ) ( not ( = ?auto_408145 ?auto_408148 ) ) ( not ( = ?auto_408145 ?auto_408149 ) ) ( not ( = ?auto_408146 ?auto_408147 ) ) ( not ( = ?auto_408146 ?auto_408148 ) ) ( not ( = ?auto_408146 ?auto_408149 ) ) ( not ( = ?auto_408147 ?auto_408148 ) ) ( not ( = ?auto_408147 ?auto_408149 ) ) ( not ( = ?auto_408148 ?auto_408149 ) ) ( ON ?auto_408147 ?auto_408148 ) ( ON ?auto_408146 ?auto_408147 ) ( ON ?auto_408145 ?auto_408146 ) ( ON ?auto_408144 ?auto_408145 ) ( CLEAR ?auto_408142 ) ( ON ?auto_408143 ?auto_408144 ) ( CLEAR ?auto_408143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_408142 ?auto_408143 )
      ( MAKE-7PILE ?auto_408142 ?auto_408143 ?auto_408144 ?auto_408145 ?auto_408146 ?auto_408147 ?auto_408148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408157 - BLOCK
      ?auto_408158 - BLOCK
      ?auto_408159 - BLOCK
      ?auto_408160 - BLOCK
      ?auto_408161 - BLOCK
      ?auto_408162 - BLOCK
      ?auto_408163 - BLOCK
    )
    :vars
    (
      ?auto_408164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408163 ?auto_408164 ) ( not ( = ?auto_408157 ?auto_408158 ) ) ( not ( = ?auto_408157 ?auto_408159 ) ) ( not ( = ?auto_408157 ?auto_408160 ) ) ( not ( = ?auto_408157 ?auto_408161 ) ) ( not ( = ?auto_408157 ?auto_408162 ) ) ( not ( = ?auto_408157 ?auto_408163 ) ) ( not ( = ?auto_408157 ?auto_408164 ) ) ( not ( = ?auto_408158 ?auto_408159 ) ) ( not ( = ?auto_408158 ?auto_408160 ) ) ( not ( = ?auto_408158 ?auto_408161 ) ) ( not ( = ?auto_408158 ?auto_408162 ) ) ( not ( = ?auto_408158 ?auto_408163 ) ) ( not ( = ?auto_408158 ?auto_408164 ) ) ( not ( = ?auto_408159 ?auto_408160 ) ) ( not ( = ?auto_408159 ?auto_408161 ) ) ( not ( = ?auto_408159 ?auto_408162 ) ) ( not ( = ?auto_408159 ?auto_408163 ) ) ( not ( = ?auto_408159 ?auto_408164 ) ) ( not ( = ?auto_408160 ?auto_408161 ) ) ( not ( = ?auto_408160 ?auto_408162 ) ) ( not ( = ?auto_408160 ?auto_408163 ) ) ( not ( = ?auto_408160 ?auto_408164 ) ) ( not ( = ?auto_408161 ?auto_408162 ) ) ( not ( = ?auto_408161 ?auto_408163 ) ) ( not ( = ?auto_408161 ?auto_408164 ) ) ( not ( = ?auto_408162 ?auto_408163 ) ) ( not ( = ?auto_408162 ?auto_408164 ) ) ( not ( = ?auto_408163 ?auto_408164 ) ) ( ON ?auto_408162 ?auto_408163 ) ( ON ?auto_408161 ?auto_408162 ) ( ON ?auto_408160 ?auto_408161 ) ( ON ?auto_408159 ?auto_408160 ) ( ON ?auto_408158 ?auto_408159 ) ( ON ?auto_408157 ?auto_408158 ) ( CLEAR ?auto_408157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_408157 )
      ( MAKE-7PILE ?auto_408157 ?auto_408158 ?auto_408159 ?auto_408160 ?auto_408161 ?auto_408162 ?auto_408163 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_408172 - BLOCK
      ?auto_408173 - BLOCK
      ?auto_408174 - BLOCK
      ?auto_408175 - BLOCK
      ?auto_408176 - BLOCK
      ?auto_408177 - BLOCK
      ?auto_408178 - BLOCK
    )
    :vars
    (
      ?auto_408179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408178 ?auto_408179 ) ( not ( = ?auto_408172 ?auto_408173 ) ) ( not ( = ?auto_408172 ?auto_408174 ) ) ( not ( = ?auto_408172 ?auto_408175 ) ) ( not ( = ?auto_408172 ?auto_408176 ) ) ( not ( = ?auto_408172 ?auto_408177 ) ) ( not ( = ?auto_408172 ?auto_408178 ) ) ( not ( = ?auto_408172 ?auto_408179 ) ) ( not ( = ?auto_408173 ?auto_408174 ) ) ( not ( = ?auto_408173 ?auto_408175 ) ) ( not ( = ?auto_408173 ?auto_408176 ) ) ( not ( = ?auto_408173 ?auto_408177 ) ) ( not ( = ?auto_408173 ?auto_408178 ) ) ( not ( = ?auto_408173 ?auto_408179 ) ) ( not ( = ?auto_408174 ?auto_408175 ) ) ( not ( = ?auto_408174 ?auto_408176 ) ) ( not ( = ?auto_408174 ?auto_408177 ) ) ( not ( = ?auto_408174 ?auto_408178 ) ) ( not ( = ?auto_408174 ?auto_408179 ) ) ( not ( = ?auto_408175 ?auto_408176 ) ) ( not ( = ?auto_408175 ?auto_408177 ) ) ( not ( = ?auto_408175 ?auto_408178 ) ) ( not ( = ?auto_408175 ?auto_408179 ) ) ( not ( = ?auto_408176 ?auto_408177 ) ) ( not ( = ?auto_408176 ?auto_408178 ) ) ( not ( = ?auto_408176 ?auto_408179 ) ) ( not ( = ?auto_408177 ?auto_408178 ) ) ( not ( = ?auto_408177 ?auto_408179 ) ) ( not ( = ?auto_408178 ?auto_408179 ) ) ( ON ?auto_408177 ?auto_408178 ) ( ON ?auto_408176 ?auto_408177 ) ( ON ?auto_408175 ?auto_408176 ) ( ON ?auto_408174 ?auto_408175 ) ( ON ?auto_408173 ?auto_408174 ) ( ON ?auto_408172 ?auto_408173 ) ( CLEAR ?auto_408172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_408172 )
      ( MAKE-7PILE ?auto_408172 ?auto_408173 ?auto_408174 ?auto_408175 ?auto_408176 ?auto_408177 ?auto_408178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408188 - BLOCK
      ?auto_408189 - BLOCK
      ?auto_408190 - BLOCK
      ?auto_408191 - BLOCK
      ?auto_408192 - BLOCK
      ?auto_408193 - BLOCK
      ?auto_408194 - BLOCK
      ?auto_408195 - BLOCK
    )
    :vars
    (
      ?auto_408196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_408194 ) ( ON ?auto_408195 ?auto_408196 ) ( CLEAR ?auto_408195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_408188 ) ( ON ?auto_408189 ?auto_408188 ) ( ON ?auto_408190 ?auto_408189 ) ( ON ?auto_408191 ?auto_408190 ) ( ON ?auto_408192 ?auto_408191 ) ( ON ?auto_408193 ?auto_408192 ) ( ON ?auto_408194 ?auto_408193 ) ( not ( = ?auto_408188 ?auto_408189 ) ) ( not ( = ?auto_408188 ?auto_408190 ) ) ( not ( = ?auto_408188 ?auto_408191 ) ) ( not ( = ?auto_408188 ?auto_408192 ) ) ( not ( = ?auto_408188 ?auto_408193 ) ) ( not ( = ?auto_408188 ?auto_408194 ) ) ( not ( = ?auto_408188 ?auto_408195 ) ) ( not ( = ?auto_408188 ?auto_408196 ) ) ( not ( = ?auto_408189 ?auto_408190 ) ) ( not ( = ?auto_408189 ?auto_408191 ) ) ( not ( = ?auto_408189 ?auto_408192 ) ) ( not ( = ?auto_408189 ?auto_408193 ) ) ( not ( = ?auto_408189 ?auto_408194 ) ) ( not ( = ?auto_408189 ?auto_408195 ) ) ( not ( = ?auto_408189 ?auto_408196 ) ) ( not ( = ?auto_408190 ?auto_408191 ) ) ( not ( = ?auto_408190 ?auto_408192 ) ) ( not ( = ?auto_408190 ?auto_408193 ) ) ( not ( = ?auto_408190 ?auto_408194 ) ) ( not ( = ?auto_408190 ?auto_408195 ) ) ( not ( = ?auto_408190 ?auto_408196 ) ) ( not ( = ?auto_408191 ?auto_408192 ) ) ( not ( = ?auto_408191 ?auto_408193 ) ) ( not ( = ?auto_408191 ?auto_408194 ) ) ( not ( = ?auto_408191 ?auto_408195 ) ) ( not ( = ?auto_408191 ?auto_408196 ) ) ( not ( = ?auto_408192 ?auto_408193 ) ) ( not ( = ?auto_408192 ?auto_408194 ) ) ( not ( = ?auto_408192 ?auto_408195 ) ) ( not ( = ?auto_408192 ?auto_408196 ) ) ( not ( = ?auto_408193 ?auto_408194 ) ) ( not ( = ?auto_408193 ?auto_408195 ) ) ( not ( = ?auto_408193 ?auto_408196 ) ) ( not ( = ?auto_408194 ?auto_408195 ) ) ( not ( = ?auto_408194 ?auto_408196 ) ) ( not ( = ?auto_408195 ?auto_408196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_408195 ?auto_408196 )
      ( !STACK ?auto_408195 ?auto_408194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408205 - BLOCK
      ?auto_408206 - BLOCK
      ?auto_408207 - BLOCK
      ?auto_408208 - BLOCK
      ?auto_408209 - BLOCK
      ?auto_408210 - BLOCK
      ?auto_408211 - BLOCK
      ?auto_408212 - BLOCK
    )
    :vars
    (
      ?auto_408213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_408211 ) ( ON ?auto_408212 ?auto_408213 ) ( CLEAR ?auto_408212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_408205 ) ( ON ?auto_408206 ?auto_408205 ) ( ON ?auto_408207 ?auto_408206 ) ( ON ?auto_408208 ?auto_408207 ) ( ON ?auto_408209 ?auto_408208 ) ( ON ?auto_408210 ?auto_408209 ) ( ON ?auto_408211 ?auto_408210 ) ( not ( = ?auto_408205 ?auto_408206 ) ) ( not ( = ?auto_408205 ?auto_408207 ) ) ( not ( = ?auto_408205 ?auto_408208 ) ) ( not ( = ?auto_408205 ?auto_408209 ) ) ( not ( = ?auto_408205 ?auto_408210 ) ) ( not ( = ?auto_408205 ?auto_408211 ) ) ( not ( = ?auto_408205 ?auto_408212 ) ) ( not ( = ?auto_408205 ?auto_408213 ) ) ( not ( = ?auto_408206 ?auto_408207 ) ) ( not ( = ?auto_408206 ?auto_408208 ) ) ( not ( = ?auto_408206 ?auto_408209 ) ) ( not ( = ?auto_408206 ?auto_408210 ) ) ( not ( = ?auto_408206 ?auto_408211 ) ) ( not ( = ?auto_408206 ?auto_408212 ) ) ( not ( = ?auto_408206 ?auto_408213 ) ) ( not ( = ?auto_408207 ?auto_408208 ) ) ( not ( = ?auto_408207 ?auto_408209 ) ) ( not ( = ?auto_408207 ?auto_408210 ) ) ( not ( = ?auto_408207 ?auto_408211 ) ) ( not ( = ?auto_408207 ?auto_408212 ) ) ( not ( = ?auto_408207 ?auto_408213 ) ) ( not ( = ?auto_408208 ?auto_408209 ) ) ( not ( = ?auto_408208 ?auto_408210 ) ) ( not ( = ?auto_408208 ?auto_408211 ) ) ( not ( = ?auto_408208 ?auto_408212 ) ) ( not ( = ?auto_408208 ?auto_408213 ) ) ( not ( = ?auto_408209 ?auto_408210 ) ) ( not ( = ?auto_408209 ?auto_408211 ) ) ( not ( = ?auto_408209 ?auto_408212 ) ) ( not ( = ?auto_408209 ?auto_408213 ) ) ( not ( = ?auto_408210 ?auto_408211 ) ) ( not ( = ?auto_408210 ?auto_408212 ) ) ( not ( = ?auto_408210 ?auto_408213 ) ) ( not ( = ?auto_408211 ?auto_408212 ) ) ( not ( = ?auto_408211 ?auto_408213 ) ) ( not ( = ?auto_408212 ?auto_408213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_408212 ?auto_408213 )
      ( !STACK ?auto_408212 ?auto_408211 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408222 - BLOCK
      ?auto_408223 - BLOCK
      ?auto_408224 - BLOCK
      ?auto_408225 - BLOCK
      ?auto_408226 - BLOCK
      ?auto_408227 - BLOCK
      ?auto_408228 - BLOCK
      ?auto_408229 - BLOCK
    )
    :vars
    (
      ?auto_408230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408229 ?auto_408230 ) ( ON-TABLE ?auto_408222 ) ( ON ?auto_408223 ?auto_408222 ) ( ON ?auto_408224 ?auto_408223 ) ( ON ?auto_408225 ?auto_408224 ) ( ON ?auto_408226 ?auto_408225 ) ( ON ?auto_408227 ?auto_408226 ) ( not ( = ?auto_408222 ?auto_408223 ) ) ( not ( = ?auto_408222 ?auto_408224 ) ) ( not ( = ?auto_408222 ?auto_408225 ) ) ( not ( = ?auto_408222 ?auto_408226 ) ) ( not ( = ?auto_408222 ?auto_408227 ) ) ( not ( = ?auto_408222 ?auto_408228 ) ) ( not ( = ?auto_408222 ?auto_408229 ) ) ( not ( = ?auto_408222 ?auto_408230 ) ) ( not ( = ?auto_408223 ?auto_408224 ) ) ( not ( = ?auto_408223 ?auto_408225 ) ) ( not ( = ?auto_408223 ?auto_408226 ) ) ( not ( = ?auto_408223 ?auto_408227 ) ) ( not ( = ?auto_408223 ?auto_408228 ) ) ( not ( = ?auto_408223 ?auto_408229 ) ) ( not ( = ?auto_408223 ?auto_408230 ) ) ( not ( = ?auto_408224 ?auto_408225 ) ) ( not ( = ?auto_408224 ?auto_408226 ) ) ( not ( = ?auto_408224 ?auto_408227 ) ) ( not ( = ?auto_408224 ?auto_408228 ) ) ( not ( = ?auto_408224 ?auto_408229 ) ) ( not ( = ?auto_408224 ?auto_408230 ) ) ( not ( = ?auto_408225 ?auto_408226 ) ) ( not ( = ?auto_408225 ?auto_408227 ) ) ( not ( = ?auto_408225 ?auto_408228 ) ) ( not ( = ?auto_408225 ?auto_408229 ) ) ( not ( = ?auto_408225 ?auto_408230 ) ) ( not ( = ?auto_408226 ?auto_408227 ) ) ( not ( = ?auto_408226 ?auto_408228 ) ) ( not ( = ?auto_408226 ?auto_408229 ) ) ( not ( = ?auto_408226 ?auto_408230 ) ) ( not ( = ?auto_408227 ?auto_408228 ) ) ( not ( = ?auto_408227 ?auto_408229 ) ) ( not ( = ?auto_408227 ?auto_408230 ) ) ( not ( = ?auto_408228 ?auto_408229 ) ) ( not ( = ?auto_408228 ?auto_408230 ) ) ( not ( = ?auto_408229 ?auto_408230 ) ) ( CLEAR ?auto_408227 ) ( ON ?auto_408228 ?auto_408229 ) ( CLEAR ?auto_408228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_408222 ?auto_408223 ?auto_408224 ?auto_408225 ?auto_408226 ?auto_408227 ?auto_408228 )
      ( MAKE-8PILE ?auto_408222 ?auto_408223 ?auto_408224 ?auto_408225 ?auto_408226 ?auto_408227 ?auto_408228 ?auto_408229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408239 - BLOCK
      ?auto_408240 - BLOCK
      ?auto_408241 - BLOCK
      ?auto_408242 - BLOCK
      ?auto_408243 - BLOCK
      ?auto_408244 - BLOCK
      ?auto_408245 - BLOCK
      ?auto_408246 - BLOCK
    )
    :vars
    (
      ?auto_408247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408246 ?auto_408247 ) ( ON-TABLE ?auto_408239 ) ( ON ?auto_408240 ?auto_408239 ) ( ON ?auto_408241 ?auto_408240 ) ( ON ?auto_408242 ?auto_408241 ) ( ON ?auto_408243 ?auto_408242 ) ( ON ?auto_408244 ?auto_408243 ) ( not ( = ?auto_408239 ?auto_408240 ) ) ( not ( = ?auto_408239 ?auto_408241 ) ) ( not ( = ?auto_408239 ?auto_408242 ) ) ( not ( = ?auto_408239 ?auto_408243 ) ) ( not ( = ?auto_408239 ?auto_408244 ) ) ( not ( = ?auto_408239 ?auto_408245 ) ) ( not ( = ?auto_408239 ?auto_408246 ) ) ( not ( = ?auto_408239 ?auto_408247 ) ) ( not ( = ?auto_408240 ?auto_408241 ) ) ( not ( = ?auto_408240 ?auto_408242 ) ) ( not ( = ?auto_408240 ?auto_408243 ) ) ( not ( = ?auto_408240 ?auto_408244 ) ) ( not ( = ?auto_408240 ?auto_408245 ) ) ( not ( = ?auto_408240 ?auto_408246 ) ) ( not ( = ?auto_408240 ?auto_408247 ) ) ( not ( = ?auto_408241 ?auto_408242 ) ) ( not ( = ?auto_408241 ?auto_408243 ) ) ( not ( = ?auto_408241 ?auto_408244 ) ) ( not ( = ?auto_408241 ?auto_408245 ) ) ( not ( = ?auto_408241 ?auto_408246 ) ) ( not ( = ?auto_408241 ?auto_408247 ) ) ( not ( = ?auto_408242 ?auto_408243 ) ) ( not ( = ?auto_408242 ?auto_408244 ) ) ( not ( = ?auto_408242 ?auto_408245 ) ) ( not ( = ?auto_408242 ?auto_408246 ) ) ( not ( = ?auto_408242 ?auto_408247 ) ) ( not ( = ?auto_408243 ?auto_408244 ) ) ( not ( = ?auto_408243 ?auto_408245 ) ) ( not ( = ?auto_408243 ?auto_408246 ) ) ( not ( = ?auto_408243 ?auto_408247 ) ) ( not ( = ?auto_408244 ?auto_408245 ) ) ( not ( = ?auto_408244 ?auto_408246 ) ) ( not ( = ?auto_408244 ?auto_408247 ) ) ( not ( = ?auto_408245 ?auto_408246 ) ) ( not ( = ?auto_408245 ?auto_408247 ) ) ( not ( = ?auto_408246 ?auto_408247 ) ) ( CLEAR ?auto_408244 ) ( ON ?auto_408245 ?auto_408246 ) ( CLEAR ?auto_408245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_408239 ?auto_408240 ?auto_408241 ?auto_408242 ?auto_408243 ?auto_408244 ?auto_408245 )
      ( MAKE-8PILE ?auto_408239 ?auto_408240 ?auto_408241 ?auto_408242 ?auto_408243 ?auto_408244 ?auto_408245 ?auto_408246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408256 - BLOCK
      ?auto_408257 - BLOCK
      ?auto_408258 - BLOCK
      ?auto_408259 - BLOCK
      ?auto_408260 - BLOCK
      ?auto_408261 - BLOCK
      ?auto_408262 - BLOCK
      ?auto_408263 - BLOCK
    )
    :vars
    (
      ?auto_408264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408263 ?auto_408264 ) ( ON-TABLE ?auto_408256 ) ( ON ?auto_408257 ?auto_408256 ) ( ON ?auto_408258 ?auto_408257 ) ( ON ?auto_408259 ?auto_408258 ) ( ON ?auto_408260 ?auto_408259 ) ( not ( = ?auto_408256 ?auto_408257 ) ) ( not ( = ?auto_408256 ?auto_408258 ) ) ( not ( = ?auto_408256 ?auto_408259 ) ) ( not ( = ?auto_408256 ?auto_408260 ) ) ( not ( = ?auto_408256 ?auto_408261 ) ) ( not ( = ?auto_408256 ?auto_408262 ) ) ( not ( = ?auto_408256 ?auto_408263 ) ) ( not ( = ?auto_408256 ?auto_408264 ) ) ( not ( = ?auto_408257 ?auto_408258 ) ) ( not ( = ?auto_408257 ?auto_408259 ) ) ( not ( = ?auto_408257 ?auto_408260 ) ) ( not ( = ?auto_408257 ?auto_408261 ) ) ( not ( = ?auto_408257 ?auto_408262 ) ) ( not ( = ?auto_408257 ?auto_408263 ) ) ( not ( = ?auto_408257 ?auto_408264 ) ) ( not ( = ?auto_408258 ?auto_408259 ) ) ( not ( = ?auto_408258 ?auto_408260 ) ) ( not ( = ?auto_408258 ?auto_408261 ) ) ( not ( = ?auto_408258 ?auto_408262 ) ) ( not ( = ?auto_408258 ?auto_408263 ) ) ( not ( = ?auto_408258 ?auto_408264 ) ) ( not ( = ?auto_408259 ?auto_408260 ) ) ( not ( = ?auto_408259 ?auto_408261 ) ) ( not ( = ?auto_408259 ?auto_408262 ) ) ( not ( = ?auto_408259 ?auto_408263 ) ) ( not ( = ?auto_408259 ?auto_408264 ) ) ( not ( = ?auto_408260 ?auto_408261 ) ) ( not ( = ?auto_408260 ?auto_408262 ) ) ( not ( = ?auto_408260 ?auto_408263 ) ) ( not ( = ?auto_408260 ?auto_408264 ) ) ( not ( = ?auto_408261 ?auto_408262 ) ) ( not ( = ?auto_408261 ?auto_408263 ) ) ( not ( = ?auto_408261 ?auto_408264 ) ) ( not ( = ?auto_408262 ?auto_408263 ) ) ( not ( = ?auto_408262 ?auto_408264 ) ) ( not ( = ?auto_408263 ?auto_408264 ) ) ( ON ?auto_408262 ?auto_408263 ) ( CLEAR ?auto_408260 ) ( ON ?auto_408261 ?auto_408262 ) ( CLEAR ?auto_408261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408256 ?auto_408257 ?auto_408258 ?auto_408259 ?auto_408260 ?auto_408261 )
      ( MAKE-8PILE ?auto_408256 ?auto_408257 ?auto_408258 ?auto_408259 ?auto_408260 ?auto_408261 ?auto_408262 ?auto_408263 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408273 - BLOCK
      ?auto_408274 - BLOCK
      ?auto_408275 - BLOCK
      ?auto_408276 - BLOCK
      ?auto_408277 - BLOCK
      ?auto_408278 - BLOCK
      ?auto_408279 - BLOCK
      ?auto_408280 - BLOCK
    )
    :vars
    (
      ?auto_408281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408280 ?auto_408281 ) ( ON-TABLE ?auto_408273 ) ( ON ?auto_408274 ?auto_408273 ) ( ON ?auto_408275 ?auto_408274 ) ( ON ?auto_408276 ?auto_408275 ) ( ON ?auto_408277 ?auto_408276 ) ( not ( = ?auto_408273 ?auto_408274 ) ) ( not ( = ?auto_408273 ?auto_408275 ) ) ( not ( = ?auto_408273 ?auto_408276 ) ) ( not ( = ?auto_408273 ?auto_408277 ) ) ( not ( = ?auto_408273 ?auto_408278 ) ) ( not ( = ?auto_408273 ?auto_408279 ) ) ( not ( = ?auto_408273 ?auto_408280 ) ) ( not ( = ?auto_408273 ?auto_408281 ) ) ( not ( = ?auto_408274 ?auto_408275 ) ) ( not ( = ?auto_408274 ?auto_408276 ) ) ( not ( = ?auto_408274 ?auto_408277 ) ) ( not ( = ?auto_408274 ?auto_408278 ) ) ( not ( = ?auto_408274 ?auto_408279 ) ) ( not ( = ?auto_408274 ?auto_408280 ) ) ( not ( = ?auto_408274 ?auto_408281 ) ) ( not ( = ?auto_408275 ?auto_408276 ) ) ( not ( = ?auto_408275 ?auto_408277 ) ) ( not ( = ?auto_408275 ?auto_408278 ) ) ( not ( = ?auto_408275 ?auto_408279 ) ) ( not ( = ?auto_408275 ?auto_408280 ) ) ( not ( = ?auto_408275 ?auto_408281 ) ) ( not ( = ?auto_408276 ?auto_408277 ) ) ( not ( = ?auto_408276 ?auto_408278 ) ) ( not ( = ?auto_408276 ?auto_408279 ) ) ( not ( = ?auto_408276 ?auto_408280 ) ) ( not ( = ?auto_408276 ?auto_408281 ) ) ( not ( = ?auto_408277 ?auto_408278 ) ) ( not ( = ?auto_408277 ?auto_408279 ) ) ( not ( = ?auto_408277 ?auto_408280 ) ) ( not ( = ?auto_408277 ?auto_408281 ) ) ( not ( = ?auto_408278 ?auto_408279 ) ) ( not ( = ?auto_408278 ?auto_408280 ) ) ( not ( = ?auto_408278 ?auto_408281 ) ) ( not ( = ?auto_408279 ?auto_408280 ) ) ( not ( = ?auto_408279 ?auto_408281 ) ) ( not ( = ?auto_408280 ?auto_408281 ) ) ( ON ?auto_408279 ?auto_408280 ) ( CLEAR ?auto_408277 ) ( ON ?auto_408278 ?auto_408279 ) ( CLEAR ?auto_408278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408273 ?auto_408274 ?auto_408275 ?auto_408276 ?auto_408277 ?auto_408278 )
      ( MAKE-8PILE ?auto_408273 ?auto_408274 ?auto_408275 ?auto_408276 ?auto_408277 ?auto_408278 ?auto_408279 ?auto_408280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408290 - BLOCK
      ?auto_408291 - BLOCK
      ?auto_408292 - BLOCK
      ?auto_408293 - BLOCK
      ?auto_408294 - BLOCK
      ?auto_408295 - BLOCK
      ?auto_408296 - BLOCK
      ?auto_408297 - BLOCK
    )
    :vars
    (
      ?auto_408298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408297 ?auto_408298 ) ( ON-TABLE ?auto_408290 ) ( ON ?auto_408291 ?auto_408290 ) ( ON ?auto_408292 ?auto_408291 ) ( ON ?auto_408293 ?auto_408292 ) ( not ( = ?auto_408290 ?auto_408291 ) ) ( not ( = ?auto_408290 ?auto_408292 ) ) ( not ( = ?auto_408290 ?auto_408293 ) ) ( not ( = ?auto_408290 ?auto_408294 ) ) ( not ( = ?auto_408290 ?auto_408295 ) ) ( not ( = ?auto_408290 ?auto_408296 ) ) ( not ( = ?auto_408290 ?auto_408297 ) ) ( not ( = ?auto_408290 ?auto_408298 ) ) ( not ( = ?auto_408291 ?auto_408292 ) ) ( not ( = ?auto_408291 ?auto_408293 ) ) ( not ( = ?auto_408291 ?auto_408294 ) ) ( not ( = ?auto_408291 ?auto_408295 ) ) ( not ( = ?auto_408291 ?auto_408296 ) ) ( not ( = ?auto_408291 ?auto_408297 ) ) ( not ( = ?auto_408291 ?auto_408298 ) ) ( not ( = ?auto_408292 ?auto_408293 ) ) ( not ( = ?auto_408292 ?auto_408294 ) ) ( not ( = ?auto_408292 ?auto_408295 ) ) ( not ( = ?auto_408292 ?auto_408296 ) ) ( not ( = ?auto_408292 ?auto_408297 ) ) ( not ( = ?auto_408292 ?auto_408298 ) ) ( not ( = ?auto_408293 ?auto_408294 ) ) ( not ( = ?auto_408293 ?auto_408295 ) ) ( not ( = ?auto_408293 ?auto_408296 ) ) ( not ( = ?auto_408293 ?auto_408297 ) ) ( not ( = ?auto_408293 ?auto_408298 ) ) ( not ( = ?auto_408294 ?auto_408295 ) ) ( not ( = ?auto_408294 ?auto_408296 ) ) ( not ( = ?auto_408294 ?auto_408297 ) ) ( not ( = ?auto_408294 ?auto_408298 ) ) ( not ( = ?auto_408295 ?auto_408296 ) ) ( not ( = ?auto_408295 ?auto_408297 ) ) ( not ( = ?auto_408295 ?auto_408298 ) ) ( not ( = ?auto_408296 ?auto_408297 ) ) ( not ( = ?auto_408296 ?auto_408298 ) ) ( not ( = ?auto_408297 ?auto_408298 ) ) ( ON ?auto_408296 ?auto_408297 ) ( ON ?auto_408295 ?auto_408296 ) ( CLEAR ?auto_408293 ) ( ON ?auto_408294 ?auto_408295 ) ( CLEAR ?auto_408294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_408290 ?auto_408291 ?auto_408292 ?auto_408293 ?auto_408294 )
      ( MAKE-8PILE ?auto_408290 ?auto_408291 ?auto_408292 ?auto_408293 ?auto_408294 ?auto_408295 ?auto_408296 ?auto_408297 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408307 - BLOCK
      ?auto_408308 - BLOCK
      ?auto_408309 - BLOCK
      ?auto_408310 - BLOCK
      ?auto_408311 - BLOCK
      ?auto_408312 - BLOCK
      ?auto_408313 - BLOCK
      ?auto_408314 - BLOCK
    )
    :vars
    (
      ?auto_408315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408314 ?auto_408315 ) ( ON-TABLE ?auto_408307 ) ( ON ?auto_408308 ?auto_408307 ) ( ON ?auto_408309 ?auto_408308 ) ( ON ?auto_408310 ?auto_408309 ) ( not ( = ?auto_408307 ?auto_408308 ) ) ( not ( = ?auto_408307 ?auto_408309 ) ) ( not ( = ?auto_408307 ?auto_408310 ) ) ( not ( = ?auto_408307 ?auto_408311 ) ) ( not ( = ?auto_408307 ?auto_408312 ) ) ( not ( = ?auto_408307 ?auto_408313 ) ) ( not ( = ?auto_408307 ?auto_408314 ) ) ( not ( = ?auto_408307 ?auto_408315 ) ) ( not ( = ?auto_408308 ?auto_408309 ) ) ( not ( = ?auto_408308 ?auto_408310 ) ) ( not ( = ?auto_408308 ?auto_408311 ) ) ( not ( = ?auto_408308 ?auto_408312 ) ) ( not ( = ?auto_408308 ?auto_408313 ) ) ( not ( = ?auto_408308 ?auto_408314 ) ) ( not ( = ?auto_408308 ?auto_408315 ) ) ( not ( = ?auto_408309 ?auto_408310 ) ) ( not ( = ?auto_408309 ?auto_408311 ) ) ( not ( = ?auto_408309 ?auto_408312 ) ) ( not ( = ?auto_408309 ?auto_408313 ) ) ( not ( = ?auto_408309 ?auto_408314 ) ) ( not ( = ?auto_408309 ?auto_408315 ) ) ( not ( = ?auto_408310 ?auto_408311 ) ) ( not ( = ?auto_408310 ?auto_408312 ) ) ( not ( = ?auto_408310 ?auto_408313 ) ) ( not ( = ?auto_408310 ?auto_408314 ) ) ( not ( = ?auto_408310 ?auto_408315 ) ) ( not ( = ?auto_408311 ?auto_408312 ) ) ( not ( = ?auto_408311 ?auto_408313 ) ) ( not ( = ?auto_408311 ?auto_408314 ) ) ( not ( = ?auto_408311 ?auto_408315 ) ) ( not ( = ?auto_408312 ?auto_408313 ) ) ( not ( = ?auto_408312 ?auto_408314 ) ) ( not ( = ?auto_408312 ?auto_408315 ) ) ( not ( = ?auto_408313 ?auto_408314 ) ) ( not ( = ?auto_408313 ?auto_408315 ) ) ( not ( = ?auto_408314 ?auto_408315 ) ) ( ON ?auto_408313 ?auto_408314 ) ( ON ?auto_408312 ?auto_408313 ) ( CLEAR ?auto_408310 ) ( ON ?auto_408311 ?auto_408312 ) ( CLEAR ?auto_408311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_408307 ?auto_408308 ?auto_408309 ?auto_408310 ?auto_408311 )
      ( MAKE-8PILE ?auto_408307 ?auto_408308 ?auto_408309 ?auto_408310 ?auto_408311 ?auto_408312 ?auto_408313 ?auto_408314 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408324 - BLOCK
      ?auto_408325 - BLOCK
      ?auto_408326 - BLOCK
      ?auto_408327 - BLOCK
      ?auto_408328 - BLOCK
      ?auto_408329 - BLOCK
      ?auto_408330 - BLOCK
      ?auto_408331 - BLOCK
    )
    :vars
    (
      ?auto_408332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408331 ?auto_408332 ) ( ON-TABLE ?auto_408324 ) ( ON ?auto_408325 ?auto_408324 ) ( ON ?auto_408326 ?auto_408325 ) ( not ( = ?auto_408324 ?auto_408325 ) ) ( not ( = ?auto_408324 ?auto_408326 ) ) ( not ( = ?auto_408324 ?auto_408327 ) ) ( not ( = ?auto_408324 ?auto_408328 ) ) ( not ( = ?auto_408324 ?auto_408329 ) ) ( not ( = ?auto_408324 ?auto_408330 ) ) ( not ( = ?auto_408324 ?auto_408331 ) ) ( not ( = ?auto_408324 ?auto_408332 ) ) ( not ( = ?auto_408325 ?auto_408326 ) ) ( not ( = ?auto_408325 ?auto_408327 ) ) ( not ( = ?auto_408325 ?auto_408328 ) ) ( not ( = ?auto_408325 ?auto_408329 ) ) ( not ( = ?auto_408325 ?auto_408330 ) ) ( not ( = ?auto_408325 ?auto_408331 ) ) ( not ( = ?auto_408325 ?auto_408332 ) ) ( not ( = ?auto_408326 ?auto_408327 ) ) ( not ( = ?auto_408326 ?auto_408328 ) ) ( not ( = ?auto_408326 ?auto_408329 ) ) ( not ( = ?auto_408326 ?auto_408330 ) ) ( not ( = ?auto_408326 ?auto_408331 ) ) ( not ( = ?auto_408326 ?auto_408332 ) ) ( not ( = ?auto_408327 ?auto_408328 ) ) ( not ( = ?auto_408327 ?auto_408329 ) ) ( not ( = ?auto_408327 ?auto_408330 ) ) ( not ( = ?auto_408327 ?auto_408331 ) ) ( not ( = ?auto_408327 ?auto_408332 ) ) ( not ( = ?auto_408328 ?auto_408329 ) ) ( not ( = ?auto_408328 ?auto_408330 ) ) ( not ( = ?auto_408328 ?auto_408331 ) ) ( not ( = ?auto_408328 ?auto_408332 ) ) ( not ( = ?auto_408329 ?auto_408330 ) ) ( not ( = ?auto_408329 ?auto_408331 ) ) ( not ( = ?auto_408329 ?auto_408332 ) ) ( not ( = ?auto_408330 ?auto_408331 ) ) ( not ( = ?auto_408330 ?auto_408332 ) ) ( not ( = ?auto_408331 ?auto_408332 ) ) ( ON ?auto_408330 ?auto_408331 ) ( ON ?auto_408329 ?auto_408330 ) ( ON ?auto_408328 ?auto_408329 ) ( CLEAR ?auto_408326 ) ( ON ?auto_408327 ?auto_408328 ) ( CLEAR ?auto_408327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_408324 ?auto_408325 ?auto_408326 ?auto_408327 )
      ( MAKE-8PILE ?auto_408324 ?auto_408325 ?auto_408326 ?auto_408327 ?auto_408328 ?auto_408329 ?auto_408330 ?auto_408331 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408341 - BLOCK
      ?auto_408342 - BLOCK
      ?auto_408343 - BLOCK
      ?auto_408344 - BLOCK
      ?auto_408345 - BLOCK
      ?auto_408346 - BLOCK
      ?auto_408347 - BLOCK
      ?auto_408348 - BLOCK
    )
    :vars
    (
      ?auto_408349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408348 ?auto_408349 ) ( ON-TABLE ?auto_408341 ) ( ON ?auto_408342 ?auto_408341 ) ( ON ?auto_408343 ?auto_408342 ) ( not ( = ?auto_408341 ?auto_408342 ) ) ( not ( = ?auto_408341 ?auto_408343 ) ) ( not ( = ?auto_408341 ?auto_408344 ) ) ( not ( = ?auto_408341 ?auto_408345 ) ) ( not ( = ?auto_408341 ?auto_408346 ) ) ( not ( = ?auto_408341 ?auto_408347 ) ) ( not ( = ?auto_408341 ?auto_408348 ) ) ( not ( = ?auto_408341 ?auto_408349 ) ) ( not ( = ?auto_408342 ?auto_408343 ) ) ( not ( = ?auto_408342 ?auto_408344 ) ) ( not ( = ?auto_408342 ?auto_408345 ) ) ( not ( = ?auto_408342 ?auto_408346 ) ) ( not ( = ?auto_408342 ?auto_408347 ) ) ( not ( = ?auto_408342 ?auto_408348 ) ) ( not ( = ?auto_408342 ?auto_408349 ) ) ( not ( = ?auto_408343 ?auto_408344 ) ) ( not ( = ?auto_408343 ?auto_408345 ) ) ( not ( = ?auto_408343 ?auto_408346 ) ) ( not ( = ?auto_408343 ?auto_408347 ) ) ( not ( = ?auto_408343 ?auto_408348 ) ) ( not ( = ?auto_408343 ?auto_408349 ) ) ( not ( = ?auto_408344 ?auto_408345 ) ) ( not ( = ?auto_408344 ?auto_408346 ) ) ( not ( = ?auto_408344 ?auto_408347 ) ) ( not ( = ?auto_408344 ?auto_408348 ) ) ( not ( = ?auto_408344 ?auto_408349 ) ) ( not ( = ?auto_408345 ?auto_408346 ) ) ( not ( = ?auto_408345 ?auto_408347 ) ) ( not ( = ?auto_408345 ?auto_408348 ) ) ( not ( = ?auto_408345 ?auto_408349 ) ) ( not ( = ?auto_408346 ?auto_408347 ) ) ( not ( = ?auto_408346 ?auto_408348 ) ) ( not ( = ?auto_408346 ?auto_408349 ) ) ( not ( = ?auto_408347 ?auto_408348 ) ) ( not ( = ?auto_408347 ?auto_408349 ) ) ( not ( = ?auto_408348 ?auto_408349 ) ) ( ON ?auto_408347 ?auto_408348 ) ( ON ?auto_408346 ?auto_408347 ) ( ON ?auto_408345 ?auto_408346 ) ( CLEAR ?auto_408343 ) ( ON ?auto_408344 ?auto_408345 ) ( CLEAR ?auto_408344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_408341 ?auto_408342 ?auto_408343 ?auto_408344 )
      ( MAKE-8PILE ?auto_408341 ?auto_408342 ?auto_408343 ?auto_408344 ?auto_408345 ?auto_408346 ?auto_408347 ?auto_408348 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408358 - BLOCK
      ?auto_408359 - BLOCK
      ?auto_408360 - BLOCK
      ?auto_408361 - BLOCK
      ?auto_408362 - BLOCK
      ?auto_408363 - BLOCK
      ?auto_408364 - BLOCK
      ?auto_408365 - BLOCK
    )
    :vars
    (
      ?auto_408366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408365 ?auto_408366 ) ( ON-TABLE ?auto_408358 ) ( ON ?auto_408359 ?auto_408358 ) ( not ( = ?auto_408358 ?auto_408359 ) ) ( not ( = ?auto_408358 ?auto_408360 ) ) ( not ( = ?auto_408358 ?auto_408361 ) ) ( not ( = ?auto_408358 ?auto_408362 ) ) ( not ( = ?auto_408358 ?auto_408363 ) ) ( not ( = ?auto_408358 ?auto_408364 ) ) ( not ( = ?auto_408358 ?auto_408365 ) ) ( not ( = ?auto_408358 ?auto_408366 ) ) ( not ( = ?auto_408359 ?auto_408360 ) ) ( not ( = ?auto_408359 ?auto_408361 ) ) ( not ( = ?auto_408359 ?auto_408362 ) ) ( not ( = ?auto_408359 ?auto_408363 ) ) ( not ( = ?auto_408359 ?auto_408364 ) ) ( not ( = ?auto_408359 ?auto_408365 ) ) ( not ( = ?auto_408359 ?auto_408366 ) ) ( not ( = ?auto_408360 ?auto_408361 ) ) ( not ( = ?auto_408360 ?auto_408362 ) ) ( not ( = ?auto_408360 ?auto_408363 ) ) ( not ( = ?auto_408360 ?auto_408364 ) ) ( not ( = ?auto_408360 ?auto_408365 ) ) ( not ( = ?auto_408360 ?auto_408366 ) ) ( not ( = ?auto_408361 ?auto_408362 ) ) ( not ( = ?auto_408361 ?auto_408363 ) ) ( not ( = ?auto_408361 ?auto_408364 ) ) ( not ( = ?auto_408361 ?auto_408365 ) ) ( not ( = ?auto_408361 ?auto_408366 ) ) ( not ( = ?auto_408362 ?auto_408363 ) ) ( not ( = ?auto_408362 ?auto_408364 ) ) ( not ( = ?auto_408362 ?auto_408365 ) ) ( not ( = ?auto_408362 ?auto_408366 ) ) ( not ( = ?auto_408363 ?auto_408364 ) ) ( not ( = ?auto_408363 ?auto_408365 ) ) ( not ( = ?auto_408363 ?auto_408366 ) ) ( not ( = ?auto_408364 ?auto_408365 ) ) ( not ( = ?auto_408364 ?auto_408366 ) ) ( not ( = ?auto_408365 ?auto_408366 ) ) ( ON ?auto_408364 ?auto_408365 ) ( ON ?auto_408363 ?auto_408364 ) ( ON ?auto_408362 ?auto_408363 ) ( ON ?auto_408361 ?auto_408362 ) ( CLEAR ?auto_408359 ) ( ON ?auto_408360 ?auto_408361 ) ( CLEAR ?auto_408360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_408358 ?auto_408359 ?auto_408360 )
      ( MAKE-8PILE ?auto_408358 ?auto_408359 ?auto_408360 ?auto_408361 ?auto_408362 ?auto_408363 ?auto_408364 ?auto_408365 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408375 - BLOCK
      ?auto_408376 - BLOCK
      ?auto_408377 - BLOCK
      ?auto_408378 - BLOCK
      ?auto_408379 - BLOCK
      ?auto_408380 - BLOCK
      ?auto_408381 - BLOCK
      ?auto_408382 - BLOCK
    )
    :vars
    (
      ?auto_408383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408382 ?auto_408383 ) ( ON-TABLE ?auto_408375 ) ( ON ?auto_408376 ?auto_408375 ) ( not ( = ?auto_408375 ?auto_408376 ) ) ( not ( = ?auto_408375 ?auto_408377 ) ) ( not ( = ?auto_408375 ?auto_408378 ) ) ( not ( = ?auto_408375 ?auto_408379 ) ) ( not ( = ?auto_408375 ?auto_408380 ) ) ( not ( = ?auto_408375 ?auto_408381 ) ) ( not ( = ?auto_408375 ?auto_408382 ) ) ( not ( = ?auto_408375 ?auto_408383 ) ) ( not ( = ?auto_408376 ?auto_408377 ) ) ( not ( = ?auto_408376 ?auto_408378 ) ) ( not ( = ?auto_408376 ?auto_408379 ) ) ( not ( = ?auto_408376 ?auto_408380 ) ) ( not ( = ?auto_408376 ?auto_408381 ) ) ( not ( = ?auto_408376 ?auto_408382 ) ) ( not ( = ?auto_408376 ?auto_408383 ) ) ( not ( = ?auto_408377 ?auto_408378 ) ) ( not ( = ?auto_408377 ?auto_408379 ) ) ( not ( = ?auto_408377 ?auto_408380 ) ) ( not ( = ?auto_408377 ?auto_408381 ) ) ( not ( = ?auto_408377 ?auto_408382 ) ) ( not ( = ?auto_408377 ?auto_408383 ) ) ( not ( = ?auto_408378 ?auto_408379 ) ) ( not ( = ?auto_408378 ?auto_408380 ) ) ( not ( = ?auto_408378 ?auto_408381 ) ) ( not ( = ?auto_408378 ?auto_408382 ) ) ( not ( = ?auto_408378 ?auto_408383 ) ) ( not ( = ?auto_408379 ?auto_408380 ) ) ( not ( = ?auto_408379 ?auto_408381 ) ) ( not ( = ?auto_408379 ?auto_408382 ) ) ( not ( = ?auto_408379 ?auto_408383 ) ) ( not ( = ?auto_408380 ?auto_408381 ) ) ( not ( = ?auto_408380 ?auto_408382 ) ) ( not ( = ?auto_408380 ?auto_408383 ) ) ( not ( = ?auto_408381 ?auto_408382 ) ) ( not ( = ?auto_408381 ?auto_408383 ) ) ( not ( = ?auto_408382 ?auto_408383 ) ) ( ON ?auto_408381 ?auto_408382 ) ( ON ?auto_408380 ?auto_408381 ) ( ON ?auto_408379 ?auto_408380 ) ( ON ?auto_408378 ?auto_408379 ) ( CLEAR ?auto_408376 ) ( ON ?auto_408377 ?auto_408378 ) ( CLEAR ?auto_408377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_408375 ?auto_408376 ?auto_408377 )
      ( MAKE-8PILE ?auto_408375 ?auto_408376 ?auto_408377 ?auto_408378 ?auto_408379 ?auto_408380 ?auto_408381 ?auto_408382 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408392 - BLOCK
      ?auto_408393 - BLOCK
      ?auto_408394 - BLOCK
      ?auto_408395 - BLOCK
      ?auto_408396 - BLOCK
      ?auto_408397 - BLOCK
      ?auto_408398 - BLOCK
      ?auto_408399 - BLOCK
    )
    :vars
    (
      ?auto_408400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408399 ?auto_408400 ) ( ON-TABLE ?auto_408392 ) ( not ( = ?auto_408392 ?auto_408393 ) ) ( not ( = ?auto_408392 ?auto_408394 ) ) ( not ( = ?auto_408392 ?auto_408395 ) ) ( not ( = ?auto_408392 ?auto_408396 ) ) ( not ( = ?auto_408392 ?auto_408397 ) ) ( not ( = ?auto_408392 ?auto_408398 ) ) ( not ( = ?auto_408392 ?auto_408399 ) ) ( not ( = ?auto_408392 ?auto_408400 ) ) ( not ( = ?auto_408393 ?auto_408394 ) ) ( not ( = ?auto_408393 ?auto_408395 ) ) ( not ( = ?auto_408393 ?auto_408396 ) ) ( not ( = ?auto_408393 ?auto_408397 ) ) ( not ( = ?auto_408393 ?auto_408398 ) ) ( not ( = ?auto_408393 ?auto_408399 ) ) ( not ( = ?auto_408393 ?auto_408400 ) ) ( not ( = ?auto_408394 ?auto_408395 ) ) ( not ( = ?auto_408394 ?auto_408396 ) ) ( not ( = ?auto_408394 ?auto_408397 ) ) ( not ( = ?auto_408394 ?auto_408398 ) ) ( not ( = ?auto_408394 ?auto_408399 ) ) ( not ( = ?auto_408394 ?auto_408400 ) ) ( not ( = ?auto_408395 ?auto_408396 ) ) ( not ( = ?auto_408395 ?auto_408397 ) ) ( not ( = ?auto_408395 ?auto_408398 ) ) ( not ( = ?auto_408395 ?auto_408399 ) ) ( not ( = ?auto_408395 ?auto_408400 ) ) ( not ( = ?auto_408396 ?auto_408397 ) ) ( not ( = ?auto_408396 ?auto_408398 ) ) ( not ( = ?auto_408396 ?auto_408399 ) ) ( not ( = ?auto_408396 ?auto_408400 ) ) ( not ( = ?auto_408397 ?auto_408398 ) ) ( not ( = ?auto_408397 ?auto_408399 ) ) ( not ( = ?auto_408397 ?auto_408400 ) ) ( not ( = ?auto_408398 ?auto_408399 ) ) ( not ( = ?auto_408398 ?auto_408400 ) ) ( not ( = ?auto_408399 ?auto_408400 ) ) ( ON ?auto_408398 ?auto_408399 ) ( ON ?auto_408397 ?auto_408398 ) ( ON ?auto_408396 ?auto_408397 ) ( ON ?auto_408395 ?auto_408396 ) ( ON ?auto_408394 ?auto_408395 ) ( CLEAR ?auto_408392 ) ( ON ?auto_408393 ?auto_408394 ) ( CLEAR ?auto_408393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_408392 ?auto_408393 )
      ( MAKE-8PILE ?auto_408392 ?auto_408393 ?auto_408394 ?auto_408395 ?auto_408396 ?auto_408397 ?auto_408398 ?auto_408399 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408409 - BLOCK
      ?auto_408410 - BLOCK
      ?auto_408411 - BLOCK
      ?auto_408412 - BLOCK
      ?auto_408413 - BLOCK
      ?auto_408414 - BLOCK
      ?auto_408415 - BLOCK
      ?auto_408416 - BLOCK
    )
    :vars
    (
      ?auto_408417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408416 ?auto_408417 ) ( ON-TABLE ?auto_408409 ) ( not ( = ?auto_408409 ?auto_408410 ) ) ( not ( = ?auto_408409 ?auto_408411 ) ) ( not ( = ?auto_408409 ?auto_408412 ) ) ( not ( = ?auto_408409 ?auto_408413 ) ) ( not ( = ?auto_408409 ?auto_408414 ) ) ( not ( = ?auto_408409 ?auto_408415 ) ) ( not ( = ?auto_408409 ?auto_408416 ) ) ( not ( = ?auto_408409 ?auto_408417 ) ) ( not ( = ?auto_408410 ?auto_408411 ) ) ( not ( = ?auto_408410 ?auto_408412 ) ) ( not ( = ?auto_408410 ?auto_408413 ) ) ( not ( = ?auto_408410 ?auto_408414 ) ) ( not ( = ?auto_408410 ?auto_408415 ) ) ( not ( = ?auto_408410 ?auto_408416 ) ) ( not ( = ?auto_408410 ?auto_408417 ) ) ( not ( = ?auto_408411 ?auto_408412 ) ) ( not ( = ?auto_408411 ?auto_408413 ) ) ( not ( = ?auto_408411 ?auto_408414 ) ) ( not ( = ?auto_408411 ?auto_408415 ) ) ( not ( = ?auto_408411 ?auto_408416 ) ) ( not ( = ?auto_408411 ?auto_408417 ) ) ( not ( = ?auto_408412 ?auto_408413 ) ) ( not ( = ?auto_408412 ?auto_408414 ) ) ( not ( = ?auto_408412 ?auto_408415 ) ) ( not ( = ?auto_408412 ?auto_408416 ) ) ( not ( = ?auto_408412 ?auto_408417 ) ) ( not ( = ?auto_408413 ?auto_408414 ) ) ( not ( = ?auto_408413 ?auto_408415 ) ) ( not ( = ?auto_408413 ?auto_408416 ) ) ( not ( = ?auto_408413 ?auto_408417 ) ) ( not ( = ?auto_408414 ?auto_408415 ) ) ( not ( = ?auto_408414 ?auto_408416 ) ) ( not ( = ?auto_408414 ?auto_408417 ) ) ( not ( = ?auto_408415 ?auto_408416 ) ) ( not ( = ?auto_408415 ?auto_408417 ) ) ( not ( = ?auto_408416 ?auto_408417 ) ) ( ON ?auto_408415 ?auto_408416 ) ( ON ?auto_408414 ?auto_408415 ) ( ON ?auto_408413 ?auto_408414 ) ( ON ?auto_408412 ?auto_408413 ) ( ON ?auto_408411 ?auto_408412 ) ( CLEAR ?auto_408409 ) ( ON ?auto_408410 ?auto_408411 ) ( CLEAR ?auto_408410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_408409 ?auto_408410 )
      ( MAKE-8PILE ?auto_408409 ?auto_408410 ?auto_408411 ?auto_408412 ?auto_408413 ?auto_408414 ?auto_408415 ?auto_408416 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408426 - BLOCK
      ?auto_408427 - BLOCK
      ?auto_408428 - BLOCK
      ?auto_408429 - BLOCK
      ?auto_408430 - BLOCK
      ?auto_408431 - BLOCK
      ?auto_408432 - BLOCK
      ?auto_408433 - BLOCK
    )
    :vars
    (
      ?auto_408434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408433 ?auto_408434 ) ( not ( = ?auto_408426 ?auto_408427 ) ) ( not ( = ?auto_408426 ?auto_408428 ) ) ( not ( = ?auto_408426 ?auto_408429 ) ) ( not ( = ?auto_408426 ?auto_408430 ) ) ( not ( = ?auto_408426 ?auto_408431 ) ) ( not ( = ?auto_408426 ?auto_408432 ) ) ( not ( = ?auto_408426 ?auto_408433 ) ) ( not ( = ?auto_408426 ?auto_408434 ) ) ( not ( = ?auto_408427 ?auto_408428 ) ) ( not ( = ?auto_408427 ?auto_408429 ) ) ( not ( = ?auto_408427 ?auto_408430 ) ) ( not ( = ?auto_408427 ?auto_408431 ) ) ( not ( = ?auto_408427 ?auto_408432 ) ) ( not ( = ?auto_408427 ?auto_408433 ) ) ( not ( = ?auto_408427 ?auto_408434 ) ) ( not ( = ?auto_408428 ?auto_408429 ) ) ( not ( = ?auto_408428 ?auto_408430 ) ) ( not ( = ?auto_408428 ?auto_408431 ) ) ( not ( = ?auto_408428 ?auto_408432 ) ) ( not ( = ?auto_408428 ?auto_408433 ) ) ( not ( = ?auto_408428 ?auto_408434 ) ) ( not ( = ?auto_408429 ?auto_408430 ) ) ( not ( = ?auto_408429 ?auto_408431 ) ) ( not ( = ?auto_408429 ?auto_408432 ) ) ( not ( = ?auto_408429 ?auto_408433 ) ) ( not ( = ?auto_408429 ?auto_408434 ) ) ( not ( = ?auto_408430 ?auto_408431 ) ) ( not ( = ?auto_408430 ?auto_408432 ) ) ( not ( = ?auto_408430 ?auto_408433 ) ) ( not ( = ?auto_408430 ?auto_408434 ) ) ( not ( = ?auto_408431 ?auto_408432 ) ) ( not ( = ?auto_408431 ?auto_408433 ) ) ( not ( = ?auto_408431 ?auto_408434 ) ) ( not ( = ?auto_408432 ?auto_408433 ) ) ( not ( = ?auto_408432 ?auto_408434 ) ) ( not ( = ?auto_408433 ?auto_408434 ) ) ( ON ?auto_408432 ?auto_408433 ) ( ON ?auto_408431 ?auto_408432 ) ( ON ?auto_408430 ?auto_408431 ) ( ON ?auto_408429 ?auto_408430 ) ( ON ?auto_408428 ?auto_408429 ) ( ON ?auto_408427 ?auto_408428 ) ( ON ?auto_408426 ?auto_408427 ) ( CLEAR ?auto_408426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_408426 )
      ( MAKE-8PILE ?auto_408426 ?auto_408427 ?auto_408428 ?auto_408429 ?auto_408430 ?auto_408431 ?auto_408432 ?auto_408433 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_408443 - BLOCK
      ?auto_408444 - BLOCK
      ?auto_408445 - BLOCK
      ?auto_408446 - BLOCK
      ?auto_408447 - BLOCK
      ?auto_408448 - BLOCK
      ?auto_408449 - BLOCK
      ?auto_408450 - BLOCK
    )
    :vars
    (
      ?auto_408451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408450 ?auto_408451 ) ( not ( = ?auto_408443 ?auto_408444 ) ) ( not ( = ?auto_408443 ?auto_408445 ) ) ( not ( = ?auto_408443 ?auto_408446 ) ) ( not ( = ?auto_408443 ?auto_408447 ) ) ( not ( = ?auto_408443 ?auto_408448 ) ) ( not ( = ?auto_408443 ?auto_408449 ) ) ( not ( = ?auto_408443 ?auto_408450 ) ) ( not ( = ?auto_408443 ?auto_408451 ) ) ( not ( = ?auto_408444 ?auto_408445 ) ) ( not ( = ?auto_408444 ?auto_408446 ) ) ( not ( = ?auto_408444 ?auto_408447 ) ) ( not ( = ?auto_408444 ?auto_408448 ) ) ( not ( = ?auto_408444 ?auto_408449 ) ) ( not ( = ?auto_408444 ?auto_408450 ) ) ( not ( = ?auto_408444 ?auto_408451 ) ) ( not ( = ?auto_408445 ?auto_408446 ) ) ( not ( = ?auto_408445 ?auto_408447 ) ) ( not ( = ?auto_408445 ?auto_408448 ) ) ( not ( = ?auto_408445 ?auto_408449 ) ) ( not ( = ?auto_408445 ?auto_408450 ) ) ( not ( = ?auto_408445 ?auto_408451 ) ) ( not ( = ?auto_408446 ?auto_408447 ) ) ( not ( = ?auto_408446 ?auto_408448 ) ) ( not ( = ?auto_408446 ?auto_408449 ) ) ( not ( = ?auto_408446 ?auto_408450 ) ) ( not ( = ?auto_408446 ?auto_408451 ) ) ( not ( = ?auto_408447 ?auto_408448 ) ) ( not ( = ?auto_408447 ?auto_408449 ) ) ( not ( = ?auto_408447 ?auto_408450 ) ) ( not ( = ?auto_408447 ?auto_408451 ) ) ( not ( = ?auto_408448 ?auto_408449 ) ) ( not ( = ?auto_408448 ?auto_408450 ) ) ( not ( = ?auto_408448 ?auto_408451 ) ) ( not ( = ?auto_408449 ?auto_408450 ) ) ( not ( = ?auto_408449 ?auto_408451 ) ) ( not ( = ?auto_408450 ?auto_408451 ) ) ( ON ?auto_408449 ?auto_408450 ) ( ON ?auto_408448 ?auto_408449 ) ( ON ?auto_408447 ?auto_408448 ) ( ON ?auto_408446 ?auto_408447 ) ( ON ?auto_408445 ?auto_408446 ) ( ON ?auto_408444 ?auto_408445 ) ( ON ?auto_408443 ?auto_408444 ) ( CLEAR ?auto_408443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_408443 )
      ( MAKE-8PILE ?auto_408443 ?auto_408444 ?auto_408445 ?auto_408446 ?auto_408447 ?auto_408448 ?auto_408449 ?auto_408450 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408461 - BLOCK
      ?auto_408462 - BLOCK
      ?auto_408463 - BLOCK
      ?auto_408464 - BLOCK
      ?auto_408465 - BLOCK
      ?auto_408466 - BLOCK
      ?auto_408467 - BLOCK
      ?auto_408468 - BLOCK
      ?auto_408469 - BLOCK
    )
    :vars
    (
      ?auto_408470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_408468 ) ( ON ?auto_408469 ?auto_408470 ) ( CLEAR ?auto_408469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_408461 ) ( ON ?auto_408462 ?auto_408461 ) ( ON ?auto_408463 ?auto_408462 ) ( ON ?auto_408464 ?auto_408463 ) ( ON ?auto_408465 ?auto_408464 ) ( ON ?auto_408466 ?auto_408465 ) ( ON ?auto_408467 ?auto_408466 ) ( ON ?auto_408468 ?auto_408467 ) ( not ( = ?auto_408461 ?auto_408462 ) ) ( not ( = ?auto_408461 ?auto_408463 ) ) ( not ( = ?auto_408461 ?auto_408464 ) ) ( not ( = ?auto_408461 ?auto_408465 ) ) ( not ( = ?auto_408461 ?auto_408466 ) ) ( not ( = ?auto_408461 ?auto_408467 ) ) ( not ( = ?auto_408461 ?auto_408468 ) ) ( not ( = ?auto_408461 ?auto_408469 ) ) ( not ( = ?auto_408461 ?auto_408470 ) ) ( not ( = ?auto_408462 ?auto_408463 ) ) ( not ( = ?auto_408462 ?auto_408464 ) ) ( not ( = ?auto_408462 ?auto_408465 ) ) ( not ( = ?auto_408462 ?auto_408466 ) ) ( not ( = ?auto_408462 ?auto_408467 ) ) ( not ( = ?auto_408462 ?auto_408468 ) ) ( not ( = ?auto_408462 ?auto_408469 ) ) ( not ( = ?auto_408462 ?auto_408470 ) ) ( not ( = ?auto_408463 ?auto_408464 ) ) ( not ( = ?auto_408463 ?auto_408465 ) ) ( not ( = ?auto_408463 ?auto_408466 ) ) ( not ( = ?auto_408463 ?auto_408467 ) ) ( not ( = ?auto_408463 ?auto_408468 ) ) ( not ( = ?auto_408463 ?auto_408469 ) ) ( not ( = ?auto_408463 ?auto_408470 ) ) ( not ( = ?auto_408464 ?auto_408465 ) ) ( not ( = ?auto_408464 ?auto_408466 ) ) ( not ( = ?auto_408464 ?auto_408467 ) ) ( not ( = ?auto_408464 ?auto_408468 ) ) ( not ( = ?auto_408464 ?auto_408469 ) ) ( not ( = ?auto_408464 ?auto_408470 ) ) ( not ( = ?auto_408465 ?auto_408466 ) ) ( not ( = ?auto_408465 ?auto_408467 ) ) ( not ( = ?auto_408465 ?auto_408468 ) ) ( not ( = ?auto_408465 ?auto_408469 ) ) ( not ( = ?auto_408465 ?auto_408470 ) ) ( not ( = ?auto_408466 ?auto_408467 ) ) ( not ( = ?auto_408466 ?auto_408468 ) ) ( not ( = ?auto_408466 ?auto_408469 ) ) ( not ( = ?auto_408466 ?auto_408470 ) ) ( not ( = ?auto_408467 ?auto_408468 ) ) ( not ( = ?auto_408467 ?auto_408469 ) ) ( not ( = ?auto_408467 ?auto_408470 ) ) ( not ( = ?auto_408468 ?auto_408469 ) ) ( not ( = ?auto_408468 ?auto_408470 ) ) ( not ( = ?auto_408469 ?auto_408470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_408469 ?auto_408470 )
      ( !STACK ?auto_408469 ?auto_408468 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408480 - BLOCK
      ?auto_408481 - BLOCK
      ?auto_408482 - BLOCK
      ?auto_408483 - BLOCK
      ?auto_408484 - BLOCK
      ?auto_408485 - BLOCK
      ?auto_408486 - BLOCK
      ?auto_408487 - BLOCK
      ?auto_408488 - BLOCK
    )
    :vars
    (
      ?auto_408489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_408487 ) ( ON ?auto_408488 ?auto_408489 ) ( CLEAR ?auto_408488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_408480 ) ( ON ?auto_408481 ?auto_408480 ) ( ON ?auto_408482 ?auto_408481 ) ( ON ?auto_408483 ?auto_408482 ) ( ON ?auto_408484 ?auto_408483 ) ( ON ?auto_408485 ?auto_408484 ) ( ON ?auto_408486 ?auto_408485 ) ( ON ?auto_408487 ?auto_408486 ) ( not ( = ?auto_408480 ?auto_408481 ) ) ( not ( = ?auto_408480 ?auto_408482 ) ) ( not ( = ?auto_408480 ?auto_408483 ) ) ( not ( = ?auto_408480 ?auto_408484 ) ) ( not ( = ?auto_408480 ?auto_408485 ) ) ( not ( = ?auto_408480 ?auto_408486 ) ) ( not ( = ?auto_408480 ?auto_408487 ) ) ( not ( = ?auto_408480 ?auto_408488 ) ) ( not ( = ?auto_408480 ?auto_408489 ) ) ( not ( = ?auto_408481 ?auto_408482 ) ) ( not ( = ?auto_408481 ?auto_408483 ) ) ( not ( = ?auto_408481 ?auto_408484 ) ) ( not ( = ?auto_408481 ?auto_408485 ) ) ( not ( = ?auto_408481 ?auto_408486 ) ) ( not ( = ?auto_408481 ?auto_408487 ) ) ( not ( = ?auto_408481 ?auto_408488 ) ) ( not ( = ?auto_408481 ?auto_408489 ) ) ( not ( = ?auto_408482 ?auto_408483 ) ) ( not ( = ?auto_408482 ?auto_408484 ) ) ( not ( = ?auto_408482 ?auto_408485 ) ) ( not ( = ?auto_408482 ?auto_408486 ) ) ( not ( = ?auto_408482 ?auto_408487 ) ) ( not ( = ?auto_408482 ?auto_408488 ) ) ( not ( = ?auto_408482 ?auto_408489 ) ) ( not ( = ?auto_408483 ?auto_408484 ) ) ( not ( = ?auto_408483 ?auto_408485 ) ) ( not ( = ?auto_408483 ?auto_408486 ) ) ( not ( = ?auto_408483 ?auto_408487 ) ) ( not ( = ?auto_408483 ?auto_408488 ) ) ( not ( = ?auto_408483 ?auto_408489 ) ) ( not ( = ?auto_408484 ?auto_408485 ) ) ( not ( = ?auto_408484 ?auto_408486 ) ) ( not ( = ?auto_408484 ?auto_408487 ) ) ( not ( = ?auto_408484 ?auto_408488 ) ) ( not ( = ?auto_408484 ?auto_408489 ) ) ( not ( = ?auto_408485 ?auto_408486 ) ) ( not ( = ?auto_408485 ?auto_408487 ) ) ( not ( = ?auto_408485 ?auto_408488 ) ) ( not ( = ?auto_408485 ?auto_408489 ) ) ( not ( = ?auto_408486 ?auto_408487 ) ) ( not ( = ?auto_408486 ?auto_408488 ) ) ( not ( = ?auto_408486 ?auto_408489 ) ) ( not ( = ?auto_408487 ?auto_408488 ) ) ( not ( = ?auto_408487 ?auto_408489 ) ) ( not ( = ?auto_408488 ?auto_408489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_408488 ?auto_408489 )
      ( !STACK ?auto_408488 ?auto_408487 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408499 - BLOCK
      ?auto_408500 - BLOCK
      ?auto_408501 - BLOCK
      ?auto_408502 - BLOCK
      ?auto_408503 - BLOCK
      ?auto_408504 - BLOCK
      ?auto_408505 - BLOCK
      ?auto_408506 - BLOCK
      ?auto_408507 - BLOCK
    )
    :vars
    (
      ?auto_408508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408507 ?auto_408508 ) ( ON-TABLE ?auto_408499 ) ( ON ?auto_408500 ?auto_408499 ) ( ON ?auto_408501 ?auto_408500 ) ( ON ?auto_408502 ?auto_408501 ) ( ON ?auto_408503 ?auto_408502 ) ( ON ?auto_408504 ?auto_408503 ) ( ON ?auto_408505 ?auto_408504 ) ( not ( = ?auto_408499 ?auto_408500 ) ) ( not ( = ?auto_408499 ?auto_408501 ) ) ( not ( = ?auto_408499 ?auto_408502 ) ) ( not ( = ?auto_408499 ?auto_408503 ) ) ( not ( = ?auto_408499 ?auto_408504 ) ) ( not ( = ?auto_408499 ?auto_408505 ) ) ( not ( = ?auto_408499 ?auto_408506 ) ) ( not ( = ?auto_408499 ?auto_408507 ) ) ( not ( = ?auto_408499 ?auto_408508 ) ) ( not ( = ?auto_408500 ?auto_408501 ) ) ( not ( = ?auto_408500 ?auto_408502 ) ) ( not ( = ?auto_408500 ?auto_408503 ) ) ( not ( = ?auto_408500 ?auto_408504 ) ) ( not ( = ?auto_408500 ?auto_408505 ) ) ( not ( = ?auto_408500 ?auto_408506 ) ) ( not ( = ?auto_408500 ?auto_408507 ) ) ( not ( = ?auto_408500 ?auto_408508 ) ) ( not ( = ?auto_408501 ?auto_408502 ) ) ( not ( = ?auto_408501 ?auto_408503 ) ) ( not ( = ?auto_408501 ?auto_408504 ) ) ( not ( = ?auto_408501 ?auto_408505 ) ) ( not ( = ?auto_408501 ?auto_408506 ) ) ( not ( = ?auto_408501 ?auto_408507 ) ) ( not ( = ?auto_408501 ?auto_408508 ) ) ( not ( = ?auto_408502 ?auto_408503 ) ) ( not ( = ?auto_408502 ?auto_408504 ) ) ( not ( = ?auto_408502 ?auto_408505 ) ) ( not ( = ?auto_408502 ?auto_408506 ) ) ( not ( = ?auto_408502 ?auto_408507 ) ) ( not ( = ?auto_408502 ?auto_408508 ) ) ( not ( = ?auto_408503 ?auto_408504 ) ) ( not ( = ?auto_408503 ?auto_408505 ) ) ( not ( = ?auto_408503 ?auto_408506 ) ) ( not ( = ?auto_408503 ?auto_408507 ) ) ( not ( = ?auto_408503 ?auto_408508 ) ) ( not ( = ?auto_408504 ?auto_408505 ) ) ( not ( = ?auto_408504 ?auto_408506 ) ) ( not ( = ?auto_408504 ?auto_408507 ) ) ( not ( = ?auto_408504 ?auto_408508 ) ) ( not ( = ?auto_408505 ?auto_408506 ) ) ( not ( = ?auto_408505 ?auto_408507 ) ) ( not ( = ?auto_408505 ?auto_408508 ) ) ( not ( = ?auto_408506 ?auto_408507 ) ) ( not ( = ?auto_408506 ?auto_408508 ) ) ( not ( = ?auto_408507 ?auto_408508 ) ) ( CLEAR ?auto_408505 ) ( ON ?auto_408506 ?auto_408507 ) ( CLEAR ?auto_408506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_408499 ?auto_408500 ?auto_408501 ?auto_408502 ?auto_408503 ?auto_408504 ?auto_408505 ?auto_408506 )
      ( MAKE-9PILE ?auto_408499 ?auto_408500 ?auto_408501 ?auto_408502 ?auto_408503 ?auto_408504 ?auto_408505 ?auto_408506 ?auto_408507 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408518 - BLOCK
      ?auto_408519 - BLOCK
      ?auto_408520 - BLOCK
      ?auto_408521 - BLOCK
      ?auto_408522 - BLOCK
      ?auto_408523 - BLOCK
      ?auto_408524 - BLOCK
      ?auto_408525 - BLOCK
      ?auto_408526 - BLOCK
    )
    :vars
    (
      ?auto_408527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408526 ?auto_408527 ) ( ON-TABLE ?auto_408518 ) ( ON ?auto_408519 ?auto_408518 ) ( ON ?auto_408520 ?auto_408519 ) ( ON ?auto_408521 ?auto_408520 ) ( ON ?auto_408522 ?auto_408521 ) ( ON ?auto_408523 ?auto_408522 ) ( ON ?auto_408524 ?auto_408523 ) ( not ( = ?auto_408518 ?auto_408519 ) ) ( not ( = ?auto_408518 ?auto_408520 ) ) ( not ( = ?auto_408518 ?auto_408521 ) ) ( not ( = ?auto_408518 ?auto_408522 ) ) ( not ( = ?auto_408518 ?auto_408523 ) ) ( not ( = ?auto_408518 ?auto_408524 ) ) ( not ( = ?auto_408518 ?auto_408525 ) ) ( not ( = ?auto_408518 ?auto_408526 ) ) ( not ( = ?auto_408518 ?auto_408527 ) ) ( not ( = ?auto_408519 ?auto_408520 ) ) ( not ( = ?auto_408519 ?auto_408521 ) ) ( not ( = ?auto_408519 ?auto_408522 ) ) ( not ( = ?auto_408519 ?auto_408523 ) ) ( not ( = ?auto_408519 ?auto_408524 ) ) ( not ( = ?auto_408519 ?auto_408525 ) ) ( not ( = ?auto_408519 ?auto_408526 ) ) ( not ( = ?auto_408519 ?auto_408527 ) ) ( not ( = ?auto_408520 ?auto_408521 ) ) ( not ( = ?auto_408520 ?auto_408522 ) ) ( not ( = ?auto_408520 ?auto_408523 ) ) ( not ( = ?auto_408520 ?auto_408524 ) ) ( not ( = ?auto_408520 ?auto_408525 ) ) ( not ( = ?auto_408520 ?auto_408526 ) ) ( not ( = ?auto_408520 ?auto_408527 ) ) ( not ( = ?auto_408521 ?auto_408522 ) ) ( not ( = ?auto_408521 ?auto_408523 ) ) ( not ( = ?auto_408521 ?auto_408524 ) ) ( not ( = ?auto_408521 ?auto_408525 ) ) ( not ( = ?auto_408521 ?auto_408526 ) ) ( not ( = ?auto_408521 ?auto_408527 ) ) ( not ( = ?auto_408522 ?auto_408523 ) ) ( not ( = ?auto_408522 ?auto_408524 ) ) ( not ( = ?auto_408522 ?auto_408525 ) ) ( not ( = ?auto_408522 ?auto_408526 ) ) ( not ( = ?auto_408522 ?auto_408527 ) ) ( not ( = ?auto_408523 ?auto_408524 ) ) ( not ( = ?auto_408523 ?auto_408525 ) ) ( not ( = ?auto_408523 ?auto_408526 ) ) ( not ( = ?auto_408523 ?auto_408527 ) ) ( not ( = ?auto_408524 ?auto_408525 ) ) ( not ( = ?auto_408524 ?auto_408526 ) ) ( not ( = ?auto_408524 ?auto_408527 ) ) ( not ( = ?auto_408525 ?auto_408526 ) ) ( not ( = ?auto_408525 ?auto_408527 ) ) ( not ( = ?auto_408526 ?auto_408527 ) ) ( CLEAR ?auto_408524 ) ( ON ?auto_408525 ?auto_408526 ) ( CLEAR ?auto_408525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_408518 ?auto_408519 ?auto_408520 ?auto_408521 ?auto_408522 ?auto_408523 ?auto_408524 ?auto_408525 )
      ( MAKE-9PILE ?auto_408518 ?auto_408519 ?auto_408520 ?auto_408521 ?auto_408522 ?auto_408523 ?auto_408524 ?auto_408525 ?auto_408526 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408537 - BLOCK
      ?auto_408538 - BLOCK
      ?auto_408539 - BLOCK
      ?auto_408540 - BLOCK
      ?auto_408541 - BLOCK
      ?auto_408542 - BLOCK
      ?auto_408543 - BLOCK
      ?auto_408544 - BLOCK
      ?auto_408545 - BLOCK
    )
    :vars
    (
      ?auto_408546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408545 ?auto_408546 ) ( ON-TABLE ?auto_408537 ) ( ON ?auto_408538 ?auto_408537 ) ( ON ?auto_408539 ?auto_408538 ) ( ON ?auto_408540 ?auto_408539 ) ( ON ?auto_408541 ?auto_408540 ) ( ON ?auto_408542 ?auto_408541 ) ( not ( = ?auto_408537 ?auto_408538 ) ) ( not ( = ?auto_408537 ?auto_408539 ) ) ( not ( = ?auto_408537 ?auto_408540 ) ) ( not ( = ?auto_408537 ?auto_408541 ) ) ( not ( = ?auto_408537 ?auto_408542 ) ) ( not ( = ?auto_408537 ?auto_408543 ) ) ( not ( = ?auto_408537 ?auto_408544 ) ) ( not ( = ?auto_408537 ?auto_408545 ) ) ( not ( = ?auto_408537 ?auto_408546 ) ) ( not ( = ?auto_408538 ?auto_408539 ) ) ( not ( = ?auto_408538 ?auto_408540 ) ) ( not ( = ?auto_408538 ?auto_408541 ) ) ( not ( = ?auto_408538 ?auto_408542 ) ) ( not ( = ?auto_408538 ?auto_408543 ) ) ( not ( = ?auto_408538 ?auto_408544 ) ) ( not ( = ?auto_408538 ?auto_408545 ) ) ( not ( = ?auto_408538 ?auto_408546 ) ) ( not ( = ?auto_408539 ?auto_408540 ) ) ( not ( = ?auto_408539 ?auto_408541 ) ) ( not ( = ?auto_408539 ?auto_408542 ) ) ( not ( = ?auto_408539 ?auto_408543 ) ) ( not ( = ?auto_408539 ?auto_408544 ) ) ( not ( = ?auto_408539 ?auto_408545 ) ) ( not ( = ?auto_408539 ?auto_408546 ) ) ( not ( = ?auto_408540 ?auto_408541 ) ) ( not ( = ?auto_408540 ?auto_408542 ) ) ( not ( = ?auto_408540 ?auto_408543 ) ) ( not ( = ?auto_408540 ?auto_408544 ) ) ( not ( = ?auto_408540 ?auto_408545 ) ) ( not ( = ?auto_408540 ?auto_408546 ) ) ( not ( = ?auto_408541 ?auto_408542 ) ) ( not ( = ?auto_408541 ?auto_408543 ) ) ( not ( = ?auto_408541 ?auto_408544 ) ) ( not ( = ?auto_408541 ?auto_408545 ) ) ( not ( = ?auto_408541 ?auto_408546 ) ) ( not ( = ?auto_408542 ?auto_408543 ) ) ( not ( = ?auto_408542 ?auto_408544 ) ) ( not ( = ?auto_408542 ?auto_408545 ) ) ( not ( = ?auto_408542 ?auto_408546 ) ) ( not ( = ?auto_408543 ?auto_408544 ) ) ( not ( = ?auto_408543 ?auto_408545 ) ) ( not ( = ?auto_408543 ?auto_408546 ) ) ( not ( = ?auto_408544 ?auto_408545 ) ) ( not ( = ?auto_408544 ?auto_408546 ) ) ( not ( = ?auto_408545 ?auto_408546 ) ) ( ON ?auto_408544 ?auto_408545 ) ( CLEAR ?auto_408542 ) ( ON ?auto_408543 ?auto_408544 ) ( CLEAR ?auto_408543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_408537 ?auto_408538 ?auto_408539 ?auto_408540 ?auto_408541 ?auto_408542 ?auto_408543 )
      ( MAKE-9PILE ?auto_408537 ?auto_408538 ?auto_408539 ?auto_408540 ?auto_408541 ?auto_408542 ?auto_408543 ?auto_408544 ?auto_408545 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408556 - BLOCK
      ?auto_408557 - BLOCK
      ?auto_408558 - BLOCK
      ?auto_408559 - BLOCK
      ?auto_408560 - BLOCK
      ?auto_408561 - BLOCK
      ?auto_408562 - BLOCK
      ?auto_408563 - BLOCK
      ?auto_408564 - BLOCK
    )
    :vars
    (
      ?auto_408565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408564 ?auto_408565 ) ( ON-TABLE ?auto_408556 ) ( ON ?auto_408557 ?auto_408556 ) ( ON ?auto_408558 ?auto_408557 ) ( ON ?auto_408559 ?auto_408558 ) ( ON ?auto_408560 ?auto_408559 ) ( ON ?auto_408561 ?auto_408560 ) ( not ( = ?auto_408556 ?auto_408557 ) ) ( not ( = ?auto_408556 ?auto_408558 ) ) ( not ( = ?auto_408556 ?auto_408559 ) ) ( not ( = ?auto_408556 ?auto_408560 ) ) ( not ( = ?auto_408556 ?auto_408561 ) ) ( not ( = ?auto_408556 ?auto_408562 ) ) ( not ( = ?auto_408556 ?auto_408563 ) ) ( not ( = ?auto_408556 ?auto_408564 ) ) ( not ( = ?auto_408556 ?auto_408565 ) ) ( not ( = ?auto_408557 ?auto_408558 ) ) ( not ( = ?auto_408557 ?auto_408559 ) ) ( not ( = ?auto_408557 ?auto_408560 ) ) ( not ( = ?auto_408557 ?auto_408561 ) ) ( not ( = ?auto_408557 ?auto_408562 ) ) ( not ( = ?auto_408557 ?auto_408563 ) ) ( not ( = ?auto_408557 ?auto_408564 ) ) ( not ( = ?auto_408557 ?auto_408565 ) ) ( not ( = ?auto_408558 ?auto_408559 ) ) ( not ( = ?auto_408558 ?auto_408560 ) ) ( not ( = ?auto_408558 ?auto_408561 ) ) ( not ( = ?auto_408558 ?auto_408562 ) ) ( not ( = ?auto_408558 ?auto_408563 ) ) ( not ( = ?auto_408558 ?auto_408564 ) ) ( not ( = ?auto_408558 ?auto_408565 ) ) ( not ( = ?auto_408559 ?auto_408560 ) ) ( not ( = ?auto_408559 ?auto_408561 ) ) ( not ( = ?auto_408559 ?auto_408562 ) ) ( not ( = ?auto_408559 ?auto_408563 ) ) ( not ( = ?auto_408559 ?auto_408564 ) ) ( not ( = ?auto_408559 ?auto_408565 ) ) ( not ( = ?auto_408560 ?auto_408561 ) ) ( not ( = ?auto_408560 ?auto_408562 ) ) ( not ( = ?auto_408560 ?auto_408563 ) ) ( not ( = ?auto_408560 ?auto_408564 ) ) ( not ( = ?auto_408560 ?auto_408565 ) ) ( not ( = ?auto_408561 ?auto_408562 ) ) ( not ( = ?auto_408561 ?auto_408563 ) ) ( not ( = ?auto_408561 ?auto_408564 ) ) ( not ( = ?auto_408561 ?auto_408565 ) ) ( not ( = ?auto_408562 ?auto_408563 ) ) ( not ( = ?auto_408562 ?auto_408564 ) ) ( not ( = ?auto_408562 ?auto_408565 ) ) ( not ( = ?auto_408563 ?auto_408564 ) ) ( not ( = ?auto_408563 ?auto_408565 ) ) ( not ( = ?auto_408564 ?auto_408565 ) ) ( ON ?auto_408563 ?auto_408564 ) ( CLEAR ?auto_408561 ) ( ON ?auto_408562 ?auto_408563 ) ( CLEAR ?auto_408562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_408556 ?auto_408557 ?auto_408558 ?auto_408559 ?auto_408560 ?auto_408561 ?auto_408562 )
      ( MAKE-9PILE ?auto_408556 ?auto_408557 ?auto_408558 ?auto_408559 ?auto_408560 ?auto_408561 ?auto_408562 ?auto_408563 ?auto_408564 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408575 - BLOCK
      ?auto_408576 - BLOCK
      ?auto_408577 - BLOCK
      ?auto_408578 - BLOCK
      ?auto_408579 - BLOCK
      ?auto_408580 - BLOCK
      ?auto_408581 - BLOCK
      ?auto_408582 - BLOCK
      ?auto_408583 - BLOCK
    )
    :vars
    (
      ?auto_408584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408583 ?auto_408584 ) ( ON-TABLE ?auto_408575 ) ( ON ?auto_408576 ?auto_408575 ) ( ON ?auto_408577 ?auto_408576 ) ( ON ?auto_408578 ?auto_408577 ) ( ON ?auto_408579 ?auto_408578 ) ( not ( = ?auto_408575 ?auto_408576 ) ) ( not ( = ?auto_408575 ?auto_408577 ) ) ( not ( = ?auto_408575 ?auto_408578 ) ) ( not ( = ?auto_408575 ?auto_408579 ) ) ( not ( = ?auto_408575 ?auto_408580 ) ) ( not ( = ?auto_408575 ?auto_408581 ) ) ( not ( = ?auto_408575 ?auto_408582 ) ) ( not ( = ?auto_408575 ?auto_408583 ) ) ( not ( = ?auto_408575 ?auto_408584 ) ) ( not ( = ?auto_408576 ?auto_408577 ) ) ( not ( = ?auto_408576 ?auto_408578 ) ) ( not ( = ?auto_408576 ?auto_408579 ) ) ( not ( = ?auto_408576 ?auto_408580 ) ) ( not ( = ?auto_408576 ?auto_408581 ) ) ( not ( = ?auto_408576 ?auto_408582 ) ) ( not ( = ?auto_408576 ?auto_408583 ) ) ( not ( = ?auto_408576 ?auto_408584 ) ) ( not ( = ?auto_408577 ?auto_408578 ) ) ( not ( = ?auto_408577 ?auto_408579 ) ) ( not ( = ?auto_408577 ?auto_408580 ) ) ( not ( = ?auto_408577 ?auto_408581 ) ) ( not ( = ?auto_408577 ?auto_408582 ) ) ( not ( = ?auto_408577 ?auto_408583 ) ) ( not ( = ?auto_408577 ?auto_408584 ) ) ( not ( = ?auto_408578 ?auto_408579 ) ) ( not ( = ?auto_408578 ?auto_408580 ) ) ( not ( = ?auto_408578 ?auto_408581 ) ) ( not ( = ?auto_408578 ?auto_408582 ) ) ( not ( = ?auto_408578 ?auto_408583 ) ) ( not ( = ?auto_408578 ?auto_408584 ) ) ( not ( = ?auto_408579 ?auto_408580 ) ) ( not ( = ?auto_408579 ?auto_408581 ) ) ( not ( = ?auto_408579 ?auto_408582 ) ) ( not ( = ?auto_408579 ?auto_408583 ) ) ( not ( = ?auto_408579 ?auto_408584 ) ) ( not ( = ?auto_408580 ?auto_408581 ) ) ( not ( = ?auto_408580 ?auto_408582 ) ) ( not ( = ?auto_408580 ?auto_408583 ) ) ( not ( = ?auto_408580 ?auto_408584 ) ) ( not ( = ?auto_408581 ?auto_408582 ) ) ( not ( = ?auto_408581 ?auto_408583 ) ) ( not ( = ?auto_408581 ?auto_408584 ) ) ( not ( = ?auto_408582 ?auto_408583 ) ) ( not ( = ?auto_408582 ?auto_408584 ) ) ( not ( = ?auto_408583 ?auto_408584 ) ) ( ON ?auto_408582 ?auto_408583 ) ( ON ?auto_408581 ?auto_408582 ) ( CLEAR ?auto_408579 ) ( ON ?auto_408580 ?auto_408581 ) ( CLEAR ?auto_408580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408575 ?auto_408576 ?auto_408577 ?auto_408578 ?auto_408579 ?auto_408580 )
      ( MAKE-9PILE ?auto_408575 ?auto_408576 ?auto_408577 ?auto_408578 ?auto_408579 ?auto_408580 ?auto_408581 ?auto_408582 ?auto_408583 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408594 - BLOCK
      ?auto_408595 - BLOCK
      ?auto_408596 - BLOCK
      ?auto_408597 - BLOCK
      ?auto_408598 - BLOCK
      ?auto_408599 - BLOCK
      ?auto_408600 - BLOCK
      ?auto_408601 - BLOCK
      ?auto_408602 - BLOCK
    )
    :vars
    (
      ?auto_408603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408602 ?auto_408603 ) ( ON-TABLE ?auto_408594 ) ( ON ?auto_408595 ?auto_408594 ) ( ON ?auto_408596 ?auto_408595 ) ( ON ?auto_408597 ?auto_408596 ) ( ON ?auto_408598 ?auto_408597 ) ( not ( = ?auto_408594 ?auto_408595 ) ) ( not ( = ?auto_408594 ?auto_408596 ) ) ( not ( = ?auto_408594 ?auto_408597 ) ) ( not ( = ?auto_408594 ?auto_408598 ) ) ( not ( = ?auto_408594 ?auto_408599 ) ) ( not ( = ?auto_408594 ?auto_408600 ) ) ( not ( = ?auto_408594 ?auto_408601 ) ) ( not ( = ?auto_408594 ?auto_408602 ) ) ( not ( = ?auto_408594 ?auto_408603 ) ) ( not ( = ?auto_408595 ?auto_408596 ) ) ( not ( = ?auto_408595 ?auto_408597 ) ) ( not ( = ?auto_408595 ?auto_408598 ) ) ( not ( = ?auto_408595 ?auto_408599 ) ) ( not ( = ?auto_408595 ?auto_408600 ) ) ( not ( = ?auto_408595 ?auto_408601 ) ) ( not ( = ?auto_408595 ?auto_408602 ) ) ( not ( = ?auto_408595 ?auto_408603 ) ) ( not ( = ?auto_408596 ?auto_408597 ) ) ( not ( = ?auto_408596 ?auto_408598 ) ) ( not ( = ?auto_408596 ?auto_408599 ) ) ( not ( = ?auto_408596 ?auto_408600 ) ) ( not ( = ?auto_408596 ?auto_408601 ) ) ( not ( = ?auto_408596 ?auto_408602 ) ) ( not ( = ?auto_408596 ?auto_408603 ) ) ( not ( = ?auto_408597 ?auto_408598 ) ) ( not ( = ?auto_408597 ?auto_408599 ) ) ( not ( = ?auto_408597 ?auto_408600 ) ) ( not ( = ?auto_408597 ?auto_408601 ) ) ( not ( = ?auto_408597 ?auto_408602 ) ) ( not ( = ?auto_408597 ?auto_408603 ) ) ( not ( = ?auto_408598 ?auto_408599 ) ) ( not ( = ?auto_408598 ?auto_408600 ) ) ( not ( = ?auto_408598 ?auto_408601 ) ) ( not ( = ?auto_408598 ?auto_408602 ) ) ( not ( = ?auto_408598 ?auto_408603 ) ) ( not ( = ?auto_408599 ?auto_408600 ) ) ( not ( = ?auto_408599 ?auto_408601 ) ) ( not ( = ?auto_408599 ?auto_408602 ) ) ( not ( = ?auto_408599 ?auto_408603 ) ) ( not ( = ?auto_408600 ?auto_408601 ) ) ( not ( = ?auto_408600 ?auto_408602 ) ) ( not ( = ?auto_408600 ?auto_408603 ) ) ( not ( = ?auto_408601 ?auto_408602 ) ) ( not ( = ?auto_408601 ?auto_408603 ) ) ( not ( = ?auto_408602 ?auto_408603 ) ) ( ON ?auto_408601 ?auto_408602 ) ( ON ?auto_408600 ?auto_408601 ) ( CLEAR ?auto_408598 ) ( ON ?auto_408599 ?auto_408600 ) ( CLEAR ?auto_408599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408594 ?auto_408595 ?auto_408596 ?auto_408597 ?auto_408598 ?auto_408599 )
      ( MAKE-9PILE ?auto_408594 ?auto_408595 ?auto_408596 ?auto_408597 ?auto_408598 ?auto_408599 ?auto_408600 ?auto_408601 ?auto_408602 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408613 - BLOCK
      ?auto_408614 - BLOCK
      ?auto_408615 - BLOCK
      ?auto_408616 - BLOCK
      ?auto_408617 - BLOCK
      ?auto_408618 - BLOCK
      ?auto_408619 - BLOCK
      ?auto_408620 - BLOCK
      ?auto_408621 - BLOCK
    )
    :vars
    (
      ?auto_408622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408621 ?auto_408622 ) ( ON-TABLE ?auto_408613 ) ( ON ?auto_408614 ?auto_408613 ) ( ON ?auto_408615 ?auto_408614 ) ( ON ?auto_408616 ?auto_408615 ) ( not ( = ?auto_408613 ?auto_408614 ) ) ( not ( = ?auto_408613 ?auto_408615 ) ) ( not ( = ?auto_408613 ?auto_408616 ) ) ( not ( = ?auto_408613 ?auto_408617 ) ) ( not ( = ?auto_408613 ?auto_408618 ) ) ( not ( = ?auto_408613 ?auto_408619 ) ) ( not ( = ?auto_408613 ?auto_408620 ) ) ( not ( = ?auto_408613 ?auto_408621 ) ) ( not ( = ?auto_408613 ?auto_408622 ) ) ( not ( = ?auto_408614 ?auto_408615 ) ) ( not ( = ?auto_408614 ?auto_408616 ) ) ( not ( = ?auto_408614 ?auto_408617 ) ) ( not ( = ?auto_408614 ?auto_408618 ) ) ( not ( = ?auto_408614 ?auto_408619 ) ) ( not ( = ?auto_408614 ?auto_408620 ) ) ( not ( = ?auto_408614 ?auto_408621 ) ) ( not ( = ?auto_408614 ?auto_408622 ) ) ( not ( = ?auto_408615 ?auto_408616 ) ) ( not ( = ?auto_408615 ?auto_408617 ) ) ( not ( = ?auto_408615 ?auto_408618 ) ) ( not ( = ?auto_408615 ?auto_408619 ) ) ( not ( = ?auto_408615 ?auto_408620 ) ) ( not ( = ?auto_408615 ?auto_408621 ) ) ( not ( = ?auto_408615 ?auto_408622 ) ) ( not ( = ?auto_408616 ?auto_408617 ) ) ( not ( = ?auto_408616 ?auto_408618 ) ) ( not ( = ?auto_408616 ?auto_408619 ) ) ( not ( = ?auto_408616 ?auto_408620 ) ) ( not ( = ?auto_408616 ?auto_408621 ) ) ( not ( = ?auto_408616 ?auto_408622 ) ) ( not ( = ?auto_408617 ?auto_408618 ) ) ( not ( = ?auto_408617 ?auto_408619 ) ) ( not ( = ?auto_408617 ?auto_408620 ) ) ( not ( = ?auto_408617 ?auto_408621 ) ) ( not ( = ?auto_408617 ?auto_408622 ) ) ( not ( = ?auto_408618 ?auto_408619 ) ) ( not ( = ?auto_408618 ?auto_408620 ) ) ( not ( = ?auto_408618 ?auto_408621 ) ) ( not ( = ?auto_408618 ?auto_408622 ) ) ( not ( = ?auto_408619 ?auto_408620 ) ) ( not ( = ?auto_408619 ?auto_408621 ) ) ( not ( = ?auto_408619 ?auto_408622 ) ) ( not ( = ?auto_408620 ?auto_408621 ) ) ( not ( = ?auto_408620 ?auto_408622 ) ) ( not ( = ?auto_408621 ?auto_408622 ) ) ( ON ?auto_408620 ?auto_408621 ) ( ON ?auto_408619 ?auto_408620 ) ( ON ?auto_408618 ?auto_408619 ) ( CLEAR ?auto_408616 ) ( ON ?auto_408617 ?auto_408618 ) ( CLEAR ?auto_408617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_408613 ?auto_408614 ?auto_408615 ?auto_408616 ?auto_408617 )
      ( MAKE-9PILE ?auto_408613 ?auto_408614 ?auto_408615 ?auto_408616 ?auto_408617 ?auto_408618 ?auto_408619 ?auto_408620 ?auto_408621 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408632 - BLOCK
      ?auto_408633 - BLOCK
      ?auto_408634 - BLOCK
      ?auto_408635 - BLOCK
      ?auto_408636 - BLOCK
      ?auto_408637 - BLOCK
      ?auto_408638 - BLOCK
      ?auto_408639 - BLOCK
      ?auto_408640 - BLOCK
    )
    :vars
    (
      ?auto_408641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408640 ?auto_408641 ) ( ON-TABLE ?auto_408632 ) ( ON ?auto_408633 ?auto_408632 ) ( ON ?auto_408634 ?auto_408633 ) ( ON ?auto_408635 ?auto_408634 ) ( not ( = ?auto_408632 ?auto_408633 ) ) ( not ( = ?auto_408632 ?auto_408634 ) ) ( not ( = ?auto_408632 ?auto_408635 ) ) ( not ( = ?auto_408632 ?auto_408636 ) ) ( not ( = ?auto_408632 ?auto_408637 ) ) ( not ( = ?auto_408632 ?auto_408638 ) ) ( not ( = ?auto_408632 ?auto_408639 ) ) ( not ( = ?auto_408632 ?auto_408640 ) ) ( not ( = ?auto_408632 ?auto_408641 ) ) ( not ( = ?auto_408633 ?auto_408634 ) ) ( not ( = ?auto_408633 ?auto_408635 ) ) ( not ( = ?auto_408633 ?auto_408636 ) ) ( not ( = ?auto_408633 ?auto_408637 ) ) ( not ( = ?auto_408633 ?auto_408638 ) ) ( not ( = ?auto_408633 ?auto_408639 ) ) ( not ( = ?auto_408633 ?auto_408640 ) ) ( not ( = ?auto_408633 ?auto_408641 ) ) ( not ( = ?auto_408634 ?auto_408635 ) ) ( not ( = ?auto_408634 ?auto_408636 ) ) ( not ( = ?auto_408634 ?auto_408637 ) ) ( not ( = ?auto_408634 ?auto_408638 ) ) ( not ( = ?auto_408634 ?auto_408639 ) ) ( not ( = ?auto_408634 ?auto_408640 ) ) ( not ( = ?auto_408634 ?auto_408641 ) ) ( not ( = ?auto_408635 ?auto_408636 ) ) ( not ( = ?auto_408635 ?auto_408637 ) ) ( not ( = ?auto_408635 ?auto_408638 ) ) ( not ( = ?auto_408635 ?auto_408639 ) ) ( not ( = ?auto_408635 ?auto_408640 ) ) ( not ( = ?auto_408635 ?auto_408641 ) ) ( not ( = ?auto_408636 ?auto_408637 ) ) ( not ( = ?auto_408636 ?auto_408638 ) ) ( not ( = ?auto_408636 ?auto_408639 ) ) ( not ( = ?auto_408636 ?auto_408640 ) ) ( not ( = ?auto_408636 ?auto_408641 ) ) ( not ( = ?auto_408637 ?auto_408638 ) ) ( not ( = ?auto_408637 ?auto_408639 ) ) ( not ( = ?auto_408637 ?auto_408640 ) ) ( not ( = ?auto_408637 ?auto_408641 ) ) ( not ( = ?auto_408638 ?auto_408639 ) ) ( not ( = ?auto_408638 ?auto_408640 ) ) ( not ( = ?auto_408638 ?auto_408641 ) ) ( not ( = ?auto_408639 ?auto_408640 ) ) ( not ( = ?auto_408639 ?auto_408641 ) ) ( not ( = ?auto_408640 ?auto_408641 ) ) ( ON ?auto_408639 ?auto_408640 ) ( ON ?auto_408638 ?auto_408639 ) ( ON ?auto_408637 ?auto_408638 ) ( CLEAR ?auto_408635 ) ( ON ?auto_408636 ?auto_408637 ) ( CLEAR ?auto_408636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_408632 ?auto_408633 ?auto_408634 ?auto_408635 ?auto_408636 )
      ( MAKE-9PILE ?auto_408632 ?auto_408633 ?auto_408634 ?auto_408635 ?auto_408636 ?auto_408637 ?auto_408638 ?auto_408639 ?auto_408640 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408651 - BLOCK
      ?auto_408652 - BLOCK
      ?auto_408653 - BLOCK
      ?auto_408654 - BLOCK
      ?auto_408655 - BLOCK
      ?auto_408656 - BLOCK
      ?auto_408657 - BLOCK
      ?auto_408658 - BLOCK
      ?auto_408659 - BLOCK
    )
    :vars
    (
      ?auto_408660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408659 ?auto_408660 ) ( ON-TABLE ?auto_408651 ) ( ON ?auto_408652 ?auto_408651 ) ( ON ?auto_408653 ?auto_408652 ) ( not ( = ?auto_408651 ?auto_408652 ) ) ( not ( = ?auto_408651 ?auto_408653 ) ) ( not ( = ?auto_408651 ?auto_408654 ) ) ( not ( = ?auto_408651 ?auto_408655 ) ) ( not ( = ?auto_408651 ?auto_408656 ) ) ( not ( = ?auto_408651 ?auto_408657 ) ) ( not ( = ?auto_408651 ?auto_408658 ) ) ( not ( = ?auto_408651 ?auto_408659 ) ) ( not ( = ?auto_408651 ?auto_408660 ) ) ( not ( = ?auto_408652 ?auto_408653 ) ) ( not ( = ?auto_408652 ?auto_408654 ) ) ( not ( = ?auto_408652 ?auto_408655 ) ) ( not ( = ?auto_408652 ?auto_408656 ) ) ( not ( = ?auto_408652 ?auto_408657 ) ) ( not ( = ?auto_408652 ?auto_408658 ) ) ( not ( = ?auto_408652 ?auto_408659 ) ) ( not ( = ?auto_408652 ?auto_408660 ) ) ( not ( = ?auto_408653 ?auto_408654 ) ) ( not ( = ?auto_408653 ?auto_408655 ) ) ( not ( = ?auto_408653 ?auto_408656 ) ) ( not ( = ?auto_408653 ?auto_408657 ) ) ( not ( = ?auto_408653 ?auto_408658 ) ) ( not ( = ?auto_408653 ?auto_408659 ) ) ( not ( = ?auto_408653 ?auto_408660 ) ) ( not ( = ?auto_408654 ?auto_408655 ) ) ( not ( = ?auto_408654 ?auto_408656 ) ) ( not ( = ?auto_408654 ?auto_408657 ) ) ( not ( = ?auto_408654 ?auto_408658 ) ) ( not ( = ?auto_408654 ?auto_408659 ) ) ( not ( = ?auto_408654 ?auto_408660 ) ) ( not ( = ?auto_408655 ?auto_408656 ) ) ( not ( = ?auto_408655 ?auto_408657 ) ) ( not ( = ?auto_408655 ?auto_408658 ) ) ( not ( = ?auto_408655 ?auto_408659 ) ) ( not ( = ?auto_408655 ?auto_408660 ) ) ( not ( = ?auto_408656 ?auto_408657 ) ) ( not ( = ?auto_408656 ?auto_408658 ) ) ( not ( = ?auto_408656 ?auto_408659 ) ) ( not ( = ?auto_408656 ?auto_408660 ) ) ( not ( = ?auto_408657 ?auto_408658 ) ) ( not ( = ?auto_408657 ?auto_408659 ) ) ( not ( = ?auto_408657 ?auto_408660 ) ) ( not ( = ?auto_408658 ?auto_408659 ) ) ( not ( = ?auto_408658 ?auto_408660 ) ) ( not ( = ?auto_408659 ?auto_408660 ) ) ( ON ?auto_408658 ?auto_408659 ) ( ON ?auto_408657 ?auto_408658 ) ( ON ?auto_408656 ?auto_408657 ) ( ON ?auto_408655 ?auto_408656 ) ( CLEAR ?auto_408653 ) ( ON ?auto_408654 ?auto_408655 ) ( CLEAR ?auto_408654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_408651 ?auto_408652 ?auto_408653 ?auto_408654 )
      ( MAKE-9PILE ?auto_408651 ?auto_408652 ?auto_408653 ?auto_408654 ?auto_408655 ?auto_408656 ?auto_408657 ?auto_408658 ?auto_408659 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408670 - BLOCK
      ?auto_408671 - BLOCK
      ?auto_408672 - BLOCK
      ?auto_408673 - BLOCK
      ?auto_408674 - BLOCK
      ?auto_408675 - BLOCK
      ?auto_408676 - BLOCK
      ?auto_408677 - BLOCK
      ?auto_408678 - BLOCK
    )
    :vars
    (
      ?auto_408679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408678 ?auto_408679 ) ( ON-TABLE ?auto_408670 ) ( ON ?auto_408671 ?auto_408670 ) ( ON ?auto_408672 ?auto_408671 ) ( not ( = ?auto_408670 ?auto_408671 ) ) ( not ( = ?auto_408670 ?auto_408672 ) ) ( not ( = ?auto_408670 ?auto_408673 ) ) ( not ( = ?auto_408670 ?auto_408674 ) ) ( not ( = ?auto_408670 ?auto_408675 ) ) ( not ( = ?auto_408670 ?auto_408676 ) ) ( not ( = ?auto_408670 ?auto_408677 ) ) ( not ( = ?auto_408670 ?auto_408678 ) ) ( not ( = ?auto_408670 ?auto_408679 ) ) ( not ( = ?auto_408671 ?auto_408672 ) ) ( not ( = ?auto_408671 ?auto_408673 ) ) ( not ( = ?auto_408671 ?auto_408674 ) ) ( not ( = ?auto_408671 ?auto_408675 ) ) ( not ( = ?auto_408671 ?auto_408676 ) ) ( not ( = ?auto_408671 ?auto_408677 ) ) ( not ( = ?auto_408671 ?auto_408678 ) ) ( not ( = ?auto_408671 ?auto_408679 ) ) ( not ( = ?auto_408672 ?auto_408673 ) ) ( not ( = ?auto_408672 ?auto_408674 ) ) ( not ( = ?auto_408672 ?auto_408675 ) ) ( not ( = ?auto_408672 ?auto_408676 ) ) ( not ( = ?auto_408672 ?auto_408677 ) ) ( not ( = ?auto_408672 ?auto_408678 ) ) ( not ( = ?auto_408672 ?auto_408679 ) ) ( not ( = ?auto_408673 ?auto_408674 ) ) ( not ( = ?auto_408673 ?auto_408675 ) ) ( not ( = ?auto_408673 ?auto_408676 ) ) ( not ( = ?auto_408673 ?auto_408677 ) ) ( not ( = ?auto_408673 ?auto_408678 ) ) ( not ( = ?auto_408673 ?auto_408679 ) ) ( not ( = ?auto_408674 ?auto_408675 ) ) ( not ( = ?auto_408674 ?auto_408676 ) ) ( not ( = ?auto_408674 ?auto_408677 ) ) ( not ( = ?auto_408674 ?auto_408678 ) ) ( not ( = ?auto_408674 ?auto_408679 ) ) ( not ( = ?auto_408675 ?auto_408676 ) ) ( not ( = ?auto_408675 ?auto_408677 ) ) ( not ( = ?auto_408675 ?auto_408678 ) ) ( not ( = ?auto_408675 ?auto_408679 ) ) ( not ( = ?auto_408676 ?auto_408677 ) ) ( not ( = ?auto_408676 ?auto_408678 ) ) ( not ( = ?auto_408676 ?auto_408679 ) ) ( not ( = ?auto_408677 ?auto_408678 ) ) ( not ( = ?auto_408677 ?auto_408679 ) ) ( not ( = ?auto_408678 ?auto_408679 ) ) ( ON ?auto_408677 ?auto_408678 ) ( ON ?auto_408676 ?auto_408677 ) ( ON ?auto_408675 ?auto_408676 ) ( ON ?auto_408674 ?auto_408675 ) ( CLEAR ?auto_408672 ) ( ON ?auto_408673 ?auto_408674 ) ( CLEAR ?auto_408673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_408670 ?auto_408671 ?auto_408672 ?auto_408673 )
      ( MAKE-9PILE ?auto_408670 ?auto_408671 ?auto_408672 ?auto_408673 ?auto_408674 ?auto_408675 ?auto_408676 ?auto_408677 ?auto_408678 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408689 - BLOCK
      ?auto_408690 - BLOCK
      ?auto_408691 - BLOCK
      ?auto_408692 - BLOCK
      ?auto_408693 - BLOCK
      ?auto_408694 - BLOCK
      ?auto_408695 - BLOCK
      ?auto_408696 - BLOCK
      ?auto_408697 - BLOCK
    )
    :vars
    (
      ?auto_408698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408697 ?auto_408698 ) ( ON-TABLE ?auto_408689 ) ( ON ?auto_408690 ?auto_408689 ) ( not ( = ?auto_408689 ?auto_408690 ) ) ( not ( = ?auto_408689 ?auto_408691 ) ) ( not ( = ?auto_408689 ?auto_408692 ) ) ( not ( = ?auto_408689 ?auto_408693 ) ) ( not ( = ?auto_408689 ?auto_408694 ) ) ( not ( = ?auto_408689 ?auto_408695 ) ) ( not ( = ?auto_408689 ?auto_408696 ) ) ( not ( = ?auto_408689 ?auto_408697 ) ) ( not ( = ?auto_408689 ?auto_408698 ) ) ( not ( = ?auto_408690 ?auto_408691 ) ) ( not ( = ?auto_408690 ?auto_408692 ) ) ( not ( = ?auto_408690 ?auto_408693 ) ) ( not ( = ?auto_408690 ?auto_408694 ) ) ( not ( = ?auto_408690 ?auto_408695 ) ) ( not ( = ?auto_408690 ?auto_408696 ) ) ( not ( = ?auto_408690 ?auto_408697 ) ) ( not ( = ?auto_408690 ?auto_408698 ) ) ( not ( = ?auto_408691 ?auto_408692 ) ) ( not ( = ?auto_408691 ?auto_408693 ) ) ( not ( = ?auto_408691 ?auto_408694 ) ) ( not ( = ?auto_408691 ?auto_408695 ) ) ( not ( = ?auto_408691 ?auto_408696 ) ) ( not ( = ?auto_408691 ?auto_408697 ) ) ( not ( = ?auto_408691 ?auto_408698 ) ) ( not ( = ?auto_408692 ?auto_408693 ) ) ( not ( = ?auto_408692 ?auto_408694 ) ) ( not ( = ?auto_408692 ?auto_408695 ) ) ( not ( = ?auto_408692 ?auto_408696 ) ) ( not ( = ?auto_408692 ?auto_408697 ) ) ( not ( = ?auto_408692 ?auto_408698 ) ) ( not ( = ?auto_408693 ?auto_408694 ) ) ( not ( = ?auto_408693 ?auto_408695 ) ) ( not ( = ?auto_408693 ?auto_408696 ) ) ( not ( = ?auto_408693 ?auto_408697 ) ) ( not ( = ?auto_408693 ?auto_408698 ) ) ( not ( = ?auto_408694 ?auto_408695 ) ) ( not ( = ?auto_408694 ?auto_408696 ) ) ( not ( = ?auto_408694 ?auto_408697 ) ) ( not ( = ?auto_408694 ?auto_408698 ) ) ( not ( = ?auto_408695 ?auto_408696 ) ) ( not ( = ?auto_408695 ?auto_408697 ) ) ( not ( = ?auto_408695 ?auto_408698 ) ) ( not ( = ?auto_408696 ?auto_408697 ) ) ( not ( = ?auto_408696 ?auto_408698 ) ) ( not ( = ?auto_408697 ?auto_408698 ) ) ( ON ?auto_408696 ?auto_408697 ) ( ON ?auto_408695 ?auto_408696 ) ( ON ?auto_408694 ?auto_408695 ) ( ON ?auto_408693 ?auto_408694 ) ( ON ?auto_408692 ?auto_408693 ) ( CLEAR ?auto_408690 ) ( ON ?auto_408691 ?auto_408692 ) ( CLEAR ?auto_408691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_408689 ?auto_408690 ?auto_408691 )
      ( MAKE-9PILE ?auto_408689 ?auto_408690 ?auto_408691 ?auto_408692 ?auto_408693 ?auto_408694 ?auto_408695 ?auto_408696 ?auto_408697 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408708 - BLOCK
      ?auto_408709 - BLOCK
      ?auto_408710 - BLOCK
      ?auto_408711 - BLOCK
      ?auto_408712 - BLOCK
      ?auto_408713 - BLOCK
      ?auto_408714 - BLOCK
      ?auto_408715 - BLOCK
      ?auto_408716 - BLOCK
    )
    :vars
    (
      ?auto_408717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408716 ?auto_408717 ) ( ON-TABLE ?auto_408708 ) ( ON ?auto_408709 ?auto_408708 ) ( not ( = ?auto_408708 ?auto_408709 ) ) ( not ( = ?auto_408708 ?auto_408710 ) ) ( not ( = ?auto_408708 ?auto_408711 ) ) ( not ( = ?auto_408708 ?auto_408712 ) ) ( not ( = ?auto_408708 ?auto_408713 ) ) ( not ( = ?auto_408708 ?auto_408714 ) ) ( not ( = ?auto_408708 ?auto_408715 ) ) ( not ( = ?auto_408708 ?auto_408716 ) ) ( not ( = ?auto_408708 ?auto_408717 ) ) ( not ( = ?auto_408709 ?auto_408710 ) ) ( not ( = ?auto_408709 ?auto_408711 ) ) ( not ( = ?auto_408709 ?auto_408712 ) ) ( not ( = ?auto_408709 ?auto_408713 ) ) ( not ( = ?auto_408709 ?auto_408714 ) ) ( not ( = ?auto_408709 ?auto_408715 ) ) ( not ( = ?auto_408709 ?auto_408716 ) ) ( not ( = ?auto_408709 ?auto_408717 ) ) ( not ( = ?auto_408710 ?auto_408711 ) ) ( not ( = ?auto_408710 ?auto_408712 ) ) ( not ( = ?auto_408710 ?auto_408713 ) ) ( not ( = ?auto_408710 ?auto_408714 ) ) ( not ( = ?auto_408710 ?auto_408715 ) ) ( not ( = ?auto_408710 ?auto_408716 ) ) ( not ( = ?auto_408710 ?auto_408717 ) ) ( not ( = ?auto_408711 ?auto_408712 ) ) ( not ( = ?auto_408711 ?auto_408713 ) ) ( not ( = ?auto_408711 ?auto_408714 ) ) ( not ( = ?auto_408711 ?auto_408715 ) ) ( not ( = ?auto_408711 ?auto_408716 ) ) ( not ( = ?auto_408711 ?auto_408717 ) ) ( not ( = ?auto_408712 ?auto_408713 ) ) ( not ( = ?auto_408712 ?auto_408714 ) ) ( not ( = ?auto_408712 ?auto_408715 ) ) ( not ( = ?auto_408712 ?auto_408716 ) ) ( not ( = ?auto_408712 ?auto_408717 ) ) ( not ( = ?auto_408713 ?auto_408714 ) ) ( not ( = ?auto_408713 ?auto_408715 ) ) ( not ( = ?auto_408713 ?auto_408716 ) ) ( not ( = ?auto_408713 ?auto_408717 ) ) ( not ( = ?auto_408714 ?auto_408715 ) ) ( not ( = ?auto_408714 ?auto_408716 ) ) ( not ( = ?auto_408714 ?auto_408717 ) ) ( not ( = ?auto_408715 ?auto_408716 ) ) ( not ( = ?auto_408715 ?auto_408717 ) ) ( not ( = ?auto_408716 ?auto_408717 ) ) ( ON ?auto_408715 ?auto_408716 ) ( ON ?auto_408714 ?auto_408715 ) ( ON ?auto_408713 ?auto_408714 ) ( ON ?auto_408712 ?auto_408713 ) ( ON ?auto_408711 ?auto_408712 ) ( CLEAR ?auto_408709 ) ( ON ?auto_408710 ?auto_408711 ) ( CLEAR ?auto_408710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_408708 ?auto_408709 ?auto_408710 )
      ( MAKE-9PILE ?auto_408708 ?auto_408709 ?auto_408710 ?auto_408711 ?auto_408712 ?auto_408713 ?auto_408714 ?auto_408715 ?auto_408716 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408727 - BLOCK
      ?auto_408728 - BLOCK
      ?auto_408729 - BLOCK
      ?auto_408730 - BLOCK
      ?auto_408731 - BLOCK
      ?auto_408732 - BLOCK
      ?auto_408733 - BLOCK
      ?auto_408734 - BLOCK
      ?auto_408735 - BLOCK
    )
    :vars
    (
      ?auto_408736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408735 ?auto_408736 ) ( ON-TABLE ?auto_408727 ) ( not ( = ?auto_408727 ?auto_408728 ) ) ( not ( = ?auto_408727 ?auto_408729 ) ) ( not ( = ?auto_408727 ?auto_408730 ) ) ( not ( = ?auto_408727 ?auto_408731 ) ) ( not ( = ?auto_408727 ?auto_408732 ) ) ( not ( = ?auto_408727 ?auto_408733 ) ) ( not ( = ?auto_408727 ?auto_408734 ) ) ( not ( = ?auto_408727 ?auto_408735 ) ) ( not ( = ?auto_408727 ?auto_408736 ) ) ( not ( = ?auto_408728 ?auto_408729 ) ) ( not ( = ?auto_408728 ?auto_408730 ) ) ( not ( = ?auto_408728 ?auto_408731 ) ) ( not ( = ?auto_408728 ?auto_408732 ) ) ( not ( = ?auto_408728 ?auto_408733 ) ) ( not ( = ?auto_408728 ?auto_408734 ) ) ( not ( = ?auto_408728 ?auto_408735 ) ) ( not ( = ?auto_408728 ?auto_408736 ) ) ( not ( = ?auto_408729 ?auto_408730 ) ) ( not ( = ?auto_408729 ?auto_408731 ) ) ( not ( = ?auto_408729 ?auto_408732 ) ) ( not ( = ?auto_408729 ?auto_408733 ) ) ( not ( = ?auto_408729 ?auto_408734 ) ) ( not ( = ?auto_408729 ?auto_408735 ) ) ( not ( = ?auto_408729 ?auto_408736 ) ) ( not ( = ?auto_408730 ?auto_408731 ) ) ( not ( = ?auto_408730 ?auto_408732 ) ) ( not ( = ?auto_408730 ?auto_408733 ) ) ( not ( = ?auto_408730 ?auto_408734 ) ) ( not ( = ?auto_408730 ?auto_408735 ) ) ( not ( = ?auto_408730 ?auto_408736 ) ) ( not ( = ?auto_408731 ?auto_408732 ) ) ( not ( = ?auto_408731 ?auto_408733 ) ) ( not ( = ?auto_408731 ?auto_408734 ) ) ( not ( = ?auto_408731 ?auto_408735 ) ) ( not ( = ?auto_408731 ?auto_408736 ) ) ( not ( = ?auto_408732 ?auto_408733 ) ) ( not ( = ?auto_408732 ?auto_408734 ) ) ( not ( = ?auto_408732 ?auto_408735 ) ) ( not ( = ?auto_408732 ?auto_408736 ) ) ( not ( = ?auto_408733 ?auto_408734 ) ) ( not ( = ?auto_408733 ?auto_408735 ) ) ( not ( = ?auto_408733 ?auto_408736 ) ) ( not ( = ?auto_408734 ?auto_408735 ) ) ( not ( = ?auto_408734 ?auto_408736 ) ) ( not ( = ?auto_408735 ?auto_408736 ) ) ( ON ?auto_408734 ?auto_408735 ) ( ON ?auto_408733 ?auto_408734 ) ( ON ?auto_408732 ?auto_408733 ) ( ON ?auto_408731 ?auto_408732 ) ( ON ?auto_408730 ?auto_408731 ) ( ON ?auto_408729 ?auto_408730 ) ( CLEAR ?auto_408727 ) ( ON ?auto_408728 ?auto_408729 ) ( CLEAR ?auto_408728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_408727 ?auto_408728 )
      ( MAKE-9PILE ?auto_408727 ?auto_408728 ?auto_408729 ?auto_408730 ?auto_408731 ?auto_408732 ?auto_408733 ?auto_408734 ?auto_408735 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408746 - BLOCK
      ?auto_408747 - BLOCK
      ?auto_408748 - BLOCK
      ?auto_408749 - BLOCK
      ?auto_408750 - BLOCK
      ?auto_408751 - BLOCK
      ?auto_408752 - BLOCK
      ?auto_408753 - BLOCK
      ?auto_408754 - BLOCK
    )
    :vars
    (
      ?auto_408755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408754 ?auto_408755 ) ( ON-TABLE ?auto_408746 ) ( not ( = ?auto_408746 ?auto_408747 ) ) ( not ( = ?auto_408746 ?auto_408748 ) ) ( not ( = ?auto_408746 ?auto_408749 ) ) ( not ( = ?auto_408746 ?auto_408750 ) ) ( not ( = ?auto_408746 ?auto_408751 ) ) ( not ( = ?auto_408746 ?auto_408752 ) ) ( not ( = ?auto_408746 ?auto_408753 ) ) ( not ( = ?auto_408746 ?auto_408754 ) ) ( not ( = ?auto_408746 ?auto_408755 ) ) ( not ( = ?auto_408747 ?auto_408748 ) ) ( not ( = ?auto_408747 ?auto_408749 ) ) ( not ( = ?auto_408747 ?auto_408750 ) ) ( not ( = ?auto_408747 ?auto_408751 ) ) ( not ( = ?auto_408747 ?auto_408752 ) ) ( not ( = ?auto_408747 ?auto_408753 ) ) ( not ( = ?auto_408747 ?auto_408754 ) ) ( not ( = ?auto_408747 ?auto_408755 ) ) ( not ( = ?auto_408748 ?auto_408749 ) ) ( not ( = ?auto_408748 ?auto_408750 ) ) ( not ( = ?auto_408748 ?auto_408751 ) ) ( not ( = ?auto_408748 ?auto_408752 ) ) ( not ( = ?auto_408748 ?auto_408753 ) ) ( not ( = ?auto_408748 ?auto_408754 ) ) ( not ( = ?auto_408748 ?auto_408755 ) ) ( not ( = ?auto_408749 ?auto_408750 ) ) ( not ( = ?auto_408749 ?auto_408751 ) ) ( not ( = ?auto_408749 ?auto_408752 ) ) ( not ( = ?auto_408749 ?auto_408753 ) ) ( not ( = ?auto_408749 ?auto_408754 ) ) ( not ( = ?auto_408749 ?auto_408755 ) ) ( not ( = ?auto_408750 ?auto_408751 ) ) ( not ( = ?auto_408750 ?auto_408752 ) ) ( not ( = ?auto_408750 ?auto_408753 ) ) ( not ( = ?auto_408750 ?auto_408754 ) ) ( not ( = ?auto_408750 ?auto_408755 ) ) ( not ( = ?auto_408751 ?auto_408752 ) ) ( not ( = ?auto_408751 ?auto_408753 ) ) ( not ( = ?auto_408751 ?auto_408754 ) ) ( not ( = ?auto_408751 ?auto_408755 ) ) ( not ( = ?auto_408752 ?auto_408753 ) ) ( not ( = ?auto_408752 ?auto_408754 ) ) ( not ( = ?auto_408752 ?auto_408755 ) ) ( not ( = ?auto_408753 ?auto_408754 ) ) ( not ( = ?auto_408753 ?auto_408755 ) ) ( not ( = ?auto_408754 ?auto_408755 ) ) ( ON ?auto_408753 ?auto_408754 ) ( ON ?auto_408752 ?auto_408753 ) ( ON ?auto_408751 ?auto_408752 ) ( ON ?auto_408750 ?auto_408751 ) ( ON ?auto_408749 ?auto_408750 ) ( ON ?auto_408748 ?auto_408749 ) ( CLEAR ?auto_408746 ) ( ON ?auto_408747 ?auto_408748 ) ( CLEAR ?auto_408747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_408746 ?auto_408747 )
      ( MAKE-9PILE ?auto_408746 ?auto_408747 ?auto_408748 ?auto_408749 ?auto_408750 ?auto_408751 ?auto_408752 ?auto_408753 ?auto_408754 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408765 - BLOCK
      ?auto_408766 - BLOCK
      ?auto_408767 - BLOCK
      ?auto_408768 - BLOCK
      ?auto_408769 - BLOCK
      ?auto_408770 - BLOCK
      ?auto_408771 - BLOCK
      ?auto_408772 - BLOCK
      ?auto_408773 - BLOCK
    )
    :vars
    (
      ?auto_408774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408773 ?auto_408774 ) ( not ( = ?auto_408765 ?auto_408766 ) ) ( not ( = ?auto_408765 ?auto_408767 ) ) ( not ( = ?auto_408765 ?auto_408768 ) ) ( not ( = ?auto_408765 ?auto_408769 ) ) ( not ( = ?auto_408765 ?auto_408770 ) ) ( not ( = ?auto_408765 ?auto_408771 ) ) ( not ( = ?auto_408765 ?auto_408772 ) ) ( not ( = ?auto_408765 ?auto_408773 ) ) ( not ( = ?auto_408765 ?auto_408774 ) ) ( not ( = ?auto_408766 ?auto_408767 ) ) ( not ( = ?auto_408766 ?auto_408768 ) ) ( not ( = ?auto_408766 ?auto_408769 ) ) ( not ( = ?auto_408766 ?auto_408770 ) ) ( not ( = ?auto_408766 ?auto_408771 ) ) ( not ( = ?auto_408766 ?auto_408772 ) ) ( not ( = ?auto_408766 ?auto_408773 ) ) ( not ( = ?auto_408766 ?auto_408774 ) ) ( not ( = ?auto_408767 ?auto_408768 ) ) ( not ( = ?auto_408767 ?auto_408769 ) ) ( not ( = ?auto_408767 ?auto_408770 ) ) ( not ( = ?auto_408767 ?auto_408771 ) ) ( not ( = ?auto_408767 ?auto_408772 ) ) ( not ( = ?auto_408767 ?auto_408773 ) ) ( not ( = ?auto_408767 ?auto_408774 ) ) ( not ( = ?auto_408768 ?auto_408769 ) ) ( not ( = ?auto_408768 ?auto_408770 ) ) ( not ( = ?auto_408768 ?auto_408771 ) ) ( not ( = ?auto_408768 ?auto_408772 ) ) ( not ( = ?auto_408768 ?auto_408773 ) ) ( not ( = ?auto_408768 ?auto_408774 ) ) ( not ( = ?auto_408769 ?auto_408770 ) ) ( not ( = ?auto_408769 ?auto_408771 ) ) ( not ( = ?auto_408769 ?auto_408772 ) ) ( not ( = ?auto_408769 ?auto_408773 ) ) ( not ( = ?auto_408769 ?auto_408774 ) ) ( not ( = ?auto_408770 ?auto_408771 ) ) ( not ( = ?auto_408770 ?auto_408772 ) ) ( not ( = ?auto_408770 ?auto_408773 ) ) ( not ( = ?auto_408770 ?auto_408774 ) ) ( not ( = ?auto_408771 ?auto_408772 ) ) ( not ( = ?auto_408771 ?auto_408773 ) ) ( not ( = ?auto_408771 ?auto_408774 ) ) ( not ( = ?auto_408772 ?auto_408773 ) ) ( not ( = ?auto_408772 ?auto_408774 ) ) ( not ( = ?auto_408773 ?auto_408774 ) ) ( ON ?auto_408772 ?auto_408773 ) ( ON ?auto_408771 ?auto_408772 ) ( ON ?auto_408770 ?auto_408771 ) ( ON ?auto_408769 ?auto_408770 ) ( ON ?auto_408768 ?auto_408769 ) ( ON ?auto_408767 ?auto_408768 ) ( ON ?auto_408766 ?auto_408767 ) ( ON ?auto_408765 ?auto_408766 ) ( CLEAR ?auto_408765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_408765 )
      ( MAKE-9PILE ?auto_408765 ?auto_408766 ?auto_408767 ?auto_408768 ?auto_408769 ?auto_408770 ?auto_408771 ?auto_408772 ?auto_408773 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_408784 - BLOCK
      ?auto_408785 - BLOCK
      ?auto_408786 - BLOCK
      ?auto_408787 - BLOCK
      ?auto_408788 - BLOCK
      ?auto_408789 - BLOCK
      ?auto_408790 - BLOCK
      ?auto_408791 - BLOCK
      ?auto_408792 - BLOCK
    )
    :vars
    (
      ?auto_408793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408792 ?auto_408793 ) ( not ( = ?auto_408784 ?auto_408785 ) ) ( not ( = ?auto_408784 ?auto_408786 ) ) ( not ( = ?auto_408784 ?auto_408787 ) ) ( not ( = ?auto_408784 ?auto_408788 ) ) ( not ( = ?auto_408784 ?auto_408789 ) ) ( not ( = ?auto_408784 ?auto_408790 ) ) ( not ( = ?auto_408784 ?auto_408791 ) ) ( not ( = ?auto_408784 ?auto_408792 ) ) ( not ( = ?auto_408784 ?auto_408793 ) ) ( not ( = ?auto_408785 ?auto_408786 ) ) ( not ( = ?auto_408785 ?auto_408787 ) ) ( not ( = ?auto_408785 ?auto_408788 ) ) ( not ( = ?auto_408785 ?auto_408789 ) ) ( not ( = ?auto_408785 ?auto_408790 ) ) ( not ( = ?auto_408785 ?auto_408791 ) ) ( not ( = ?auto_408785 ?auto_408792 ) ) ( not ( = ?auto_408785 ?auto_408793 ) ) ( not ( = ?auto_408786 ?auto_408787 ) ) ( not ( = ?auto_408786 ?auto_408788 ) ) ( not ( = ?auto_408786 ?auto_408789 ) ) ( not ( = ?auto_408786 ?auto_408790 ) ) ( not ( = ?auto_408786 ?auto_408791 ) ) ( not ( = ?auto_408786 ?auto_408792 ) ) ( not ( = ?auto_408786 ?auto_408793 ) ) ( not ( = ?auto_408787 ?auto_408788 ) ) ( not ( = ?auto_408787 ?auto_408789 ) ) ( not ( = ?auto_408787 ?auto_408790 ) ) ( not ( = ?auto_408787 ?auto_408791 ) ) ( not ( = ?auto_408787 ?auto_408792 ) ) ( not ( = ?auto_408787 ?auto_408793 ) ) ( not ( = ?auto_408788 ?auto_408789 ) ) ( not ( = ?auto_408788 ?auto_408790 ) ) ( not ( = ?auto_408788 ?auto_408791 ) ) ( not ( = ?auto_408788 ?auto_408792 ) ) ( not ( = ?auto_408788 ?auto_408793 ) ) ( not ( = ?auto_408789 ?auto_408790 ) ) ( not ( = ?auto_408789 ?auto_408791 ) ) ( not ( = ?auto_408789 ?auto_408792 ) ) ( not ( = ?auto_408789 ?auto_408793 ) ) ( not ( = ?auto_408790 ?auto_408791 ) ) ( not ( = ?auto_408790 ?auto_408792 ) ) ( not ( = ?auto_408790 ?auto_408793 ) ) ( not ( = ?auto_408791 ?auto_408792 ) ) ( not ( = ?auto_408791 ?auto_408793 ) ) ( not ( = ?auto_408792 ?auto_408793 ) ) ( ON ?auto_408791 ?auto_408792 ) ( ON ?auto_408790 ?auto_408791 ) ( ON ?auto_408789 ?auto_408790 ) ( ON ?auto_408788 ?auto_408789 ) ( ON ?auto_408787 ?auto_408788 ) ( ON ?auto_408786 ?auto_408787 ) ( ON ?auto_408785 ?auto_408786 ) ( ON ?auto_408784 ?auto_408785 ) ( CLEAR ?auto_408784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_408784 )
      ( MAKE-9PILE ?auto_408784 ?auto_408785 ?auto_408786 ?auto_408787 ?auto_408788 ?auto_408789 ?auto_408790 ?auto_408791 ?auto_408792 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408804 - BLOCK
      ?auto_408805 - BLOCK
      ?auto_408806 - BLOCK
      ?auto_408807 - BLOCK
      ?auto_408808 - BLOCK
      ?auto_408809 - BLOCK
      ?auto_408810 - BLOCK
      ?auto_408811 - BLOCK
      ?auto_408812 - BLOCK
      ?auto_408813 - BLOCK
    )
    :vars
    (
      ?auto_408814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_408812 ) ( ON ?auto_408813 ?auto_408814 ) ( CLEAR ?auto_408813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_408804 ) ( ON ?auto_408805 ?auto_408804 ) ( ON ?auto_408806 ?auto_408805 ) ( ON ?auto_408807 ?auto_408806 ) ( ON ?auto_408808 ?auto_408807 ) ( ON ?auto_408809 ?auto_408808 ) ( ON ?auto_408810 ?auto_408809 ) ( ON ?auto_408811 ?auto_408810 ) ( ON ?auto_408812 ?auto_408811 ) ( not ( = ?auto_408804 ?auto_408805 ) ) ( not ( = ?auto_408804 ?auto_408806 ) ) ( not ( = ?auto_408804 ?auto_408807 ) ) ( not ( = ?auto_408804 ?auto_408808 ) ) ( not ( = ?auto_408804 ?auto_408809 ) ) ( not ( = ?auto_408804 ?auto_408810 ) ) ( not ( = ?auto_408804 ?auto_408811 ) ) ( not ( = ?auto_408804 ?auto_408812 ) ) ( not ( = ?auto_408804 ?auto_408813 ) ) ( not ( = ?auto_408804 ?auto_408814 ) ) ( not ( = ?auto_408805 ?auto_408806 ) ) ( not ( = ?auto_408805 ?auto_408807 ) ) ( not ( = ?auto_408805 ?auto_408808 ) ) ( not ( = ?auto_408805 ?auto_408809 ) ) ( not ( = ?auto_408805 ?auto_408810 ) ) ( not ( = ?auto_408805 ?auto_408811 ) ) ( not ( = ?auto_408805 ?auto_408812 ) ) ( not ( = ?auto_408805 ?auto_408813 ) ) ( not ( = ?auto_408805 ?auto_408814 ) ) ( not ( = ?auto_408806 ?auto_408807 ) ) ( not ( = ?auto_408806 ?auto_408808 ) ) ( not ( = ?auto_408806 ?auto_408809 ) ) ( not ( = ?auto_408806 ?auto_408810 ) ) ( not ( = ?auto_408806 ?auto_408811 ) ) ( not ( = ?auto_408806 ?auto_408812 ) ) ( not ( = ?auto_408806 ?auto_408813 ) ) ( not ( = ?auto_408806 ?auto_408814 ) ) ( not ( = ?auto_408807 ?auto_408808 ) ) ( not ( = ?auto_408807 ?auto_408809 ) ) ( not ( = ?auto_408807 ?auto_408810 ) ) ( not ( = ?auto_408807 ?auto_408811 ) ) ( not ( = ?auto_408807 ?auto_408812 ) ) ( not ( = ?auto_408807 ?auto_408813 ) ) ( not ( = ?auto_408807 ?auto_408814 ) ) ( not ( = ?auto_408808 ?auto_408809 ) ) ( not ( = ?auto_408808 ?auto_408810 ) ) ( not ( = ?auto_408808 ?auto_408811 ) ) ( not ( = ?auto_408808 ?auto_408812 ) ) ( not ( = ?auto_408808 ?auto_408813 ) ) ( not ( = ?auto_408808 ?auto_408814 ) ) ( not ( = ?auto_408809 ?auto_408810 ) ) ( not ( = ?auto_408809 ?auto_408811 ) ) ( not ( = ?auto_408809 ?auto_408812 ) ) ( not ( = ?auto_408809 ?auto_408813 ) ) ( not ( = ?auto_408809 ?auto_408814 ) ) ( not ( = ?auto_408810 ?auto_408811 ) ) ( not ( = ?auto_408810 ?auto_408812 ) ) ( not ( = ?auto_408810 ?auto_408813 ) ) ( not ( = ?auto_408810 ?auto_408814 ) ) ( not ( = ?auto_408811 ?auto_408812 ) ) ( not ( = ?auto_408811 ?auto_408813 ) ) ( not ( = ?auto_408811 ?auto_408814 ) ) ( not ( = ?auto_408812 ?auto_408813 ) ) ( not ( = ?auto_408812 ?auto_408814 ) ) ( not ( = ?auto_408813 ?auto_408814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_408813 ?auto_408814 )
      ( !STACK ?auto_408813 ?auto_408812 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408825 - BLOCK
      ?auto_408826 - BLOCK
      ?auto_408827 - BLOCK
      ?auto_408828 - BLOCK
      ?auto_408829 - BLOCK
      ?auto_408830 - BLOCK
      ?auto_408831 - BLOCK
      ?auto_408832 - BLOCK
      ?auto_408833 - BLOCK
      ?auto_408834 - BLOCK
    )
    :vars
    (
      ?auto_408835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_408833 ) ( ON ?auto_408834 ?auto_408835 ) ( CLEAR ?auto_408834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_408825 ) ( ON ?auto_408826 ?auto_408825 ) ( ON ?auto_408827 ?auto_408826 ) ( ON ?auto_408828 ?auto_408827 ) ( ON ?auto_408829 ?auto_408828 ) ( ON ?auto_408830 ?auto_408829 ) ( ON ?auto_408831 ?auto_408830 ) ( ON ?auto_408832 ?auto_408831 ) ( ON ?auto_408833 ?auto_408832 ) ( not ( = ?auto_408825 ?auto_408826 ) ) ( not ( = ?auto_408825 ?auto_408827 ) ) ( not ( = ?auto_408825 ?auto_408828 ) ) ( not ( = ?auto_408825 ?auto_408829 ) ) ( not ( = ?auto_408825 ?auto_408830 ) ) ( not ( = ?auto_408825 ?auto_408831 ) ) ( not ( = ?auto_408825 ?auto_408832 ) ) ( not ( = ?auto_408825 ?auto_408833 ) ) ( not ( = ?auto_408825 ?auto_408834 ) ) ( not ( = ?auto_408825 ?auto_408835 ) ) ( not ( = ?auto_408826 ?auto_408827 ) ) ( not ( = ?auto_408826 ?auto_408828 ) ) ( not ( = ?auto_408826 ?auto_408829 ) ) ( not ( = ?auto_408826 ?auto_408830 ) ) ( not ( = ?auto_408826 ?auto_408831 ) ) ( not ( = ?auto_408826 ?auto_408832 ) ) ( not ( = ?auto_408826 ?auto_408833 ) ) ( not ( = ?auto_408826 ?auto_408834 ) ) ( not ( = ?auto_408826 ?auto_408835 ) ) ( not ( = ?auto_408827 ?auto_408828 ) ) ( not ( = ?auto_408827 ?auto_408829 ) ) ( not ( = ?auto_408827 ?auto_408830 ) ) ( not ( = ?auto_408827 ?auto_408831 ) ) ( not ( = ?auto_408827 ?auto_408832 ) ) ( not ( = ?auto_408827 ?auto_408833 ) ) ( not ( = ?auto_408827 ?auto_408834 ) ) ( not ( = ?auto_408827 ?auto_408835 ) ) ( not ( = ?auto_408828 ?auto_408829 ) ) ( not ( = ?auto_408828 ?auto_408830 ) ) ( not ( = ?auto_408828 ?auto_408831 ) ) ( not ( = ?auto_408828 ?auto_408832 ) ) ( not ( = ?auto_408828 ?auto_408833 ) ) ( not ( = ?auto_408828 ?auto_408834 ) ) ( not ( = ?auto_408828 ?auto_408835 ) ) ( not ( = ?auto_408829 ?auto_408830 ) ) ( not ( = ?auto_408829 ?auto_408831 ) ) ( not ( = ?auto_408829 ?auto_408832 ) ) ( not ( = ?auto_408829 ?auto_408833 ) ) ( not ( = ?auto_408829 ?auto_408834 ) ) ( not ( = ?auto_408829 ?auto_408835 ) ) ( not ( = ?auto_408830 ?auto_408831 ) ) ( not ( = ?auto_408830 ?auto_408832 ) ) ( not ( = ?auto_408830 ?auto_408833 ) ) ( not ( = ?auto_408830 ?auto_408834 ) ) ( not ( = ?auto_408830 ?auto_408835 ) ) ( not ( = ?auto_408831 ?auto_408832 ) ) ( not ( = ?auto_408831 ?auto_408833 ) ) ( not ( = ?auto_408831 ?auto_408834 ) ) ( not ( = ?auto_408831 ?auto_408835 ) ) ( not ( = ?auto_408832 ?auto_408833 ) ) ( not ( = ?auto_408832 ?auto_408834 ) ) ( not ( = ?auto_408832 ?auto_408835 ) ) ( not ( = ?auto_408833 ?auto_408834 ) ) ( not ( = ?auto_408833 ?auto_408835 ) ) ( not ( = ?auto_408834 ?auto_408835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_408834 ?auto_408835 )
      ( !STACK ?auto_408834 ?auto_408833 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408846 - BLOCK
      ?auto_408847 - BLOCK
      ?auto_408848 - BLOCK
      ?auto_408849 - BLOCK
      ?auto_408850 - BLOCK
      ?auto_408851 - BLOCK
      ?auto_408852 - BLOCK
      ?auto_408853 - BLOCK
      ?auto_408854 - BLOCK
      ?auto_408855 - BLOCK
    )
    :vars
    (
      ?auto_408856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408855 ?auto_408856 ) ( ON-TABLE ?auto_408846 ) ( ON ?auto_408847 ?auto_408846 ) ( ON ?auto_408848 ?auto_408847 ) ( ON ?auto_408849 ?auto_408848 ) ( ON ?auto_408850 ?auto_408849 ) ( ON ?auto_408851 ?auto_408850 ) ( ON ?auto_408852 ?auto_408851 ) ( ON ?auto_408853 ?auto_408852 ) ( not ( = ?auto_408846 ?auto_408847 ) ) ( not ( = ?auto_408846 ?auto_408848 ) ) ( not ( = ?auto_408846 ?auto_408849 ) ) ( not ( = ?auto_408846 ?auto_408850 ) ) ( not ( = ?auto_408846 ?auto_408851 ) ) ( not ( = ?auto_408846 ?auto_408852 ) ) ( not ( = ?auto_408846 ?auto_408853 ) ) ( not ( = ?auto_408846 ?auto_408854 ) ) ( not ( = ?auto_408846 ?auto_408855 ) ) ( not ( = ?auto_408846 ?auto_408856 ) ) ( not ( = ?auto_408847 ?auto_408848 ) ) ( not ( = ?auto_408847 ?auto_408849 ) ) ( not ( = ?auto_408847 ?auto_408850 ) ) ( not ( = ?auto_408847 ?auto_408851 ) ) ( not ( = ?auto_408847 ?auto_408852 ) ) ( not ( = ?auto_408847 ?auto_408853 ) ) ( not ( = ?auto_408847 ?auto_408854 ) ) ( not ( = ?auto_408847 ?auto_408855 ) ) ( not ( = ?auto_408847 ?auto_408856 ) ) ( not ( = ?auto_408848 ?auto_408849 ) ) ( not ( = ?auto_408848 ?auto_408850 ) ) ( not ( = ?auto_408848 ?auto_408851 ) ) ( not ( = ?auto_408848 ?auto_408852 ) ) ( not ( = ?auto_408848 ?auto_408853 ) ) ( not ( = ?auto_408848 ?auto_408854 ) ) ( not ( = ?auto_408848 ?auto_408855 ) ) ( not ( = ?auto_408848 ?auto_408856 ) ) ( not ( = ?auto_408849 ?auto_408850 ) ) ( not ( = ?auto_408849 ?auto_408851 ) ) ( not ( = ?auto_408849 ?auto_408852 ) ) ( not ( = ?auto_408849 ?auto_408853 ) ) ( not ( = ?auto_408849 ?auto_408854 ) ) ( not ( = ?auto_408849 ?auto_408855 ) ) ( not ( = ?auto_408849 ?auto_408856 ) ) ( not ( = ?auto_408850 ?auto_408851 ) ) ( not ( = ?auto_408850 ?auto_408852 ) ) ( not ( = ?auto_408850 ?auto_408853 ) ) ( not ( = ?auto_408850 ?auto_408854 ) ) ( not ( = ?auto_408850 ?auto_408855 ) ) ( not ( = ?auto_408850 ?auto_408856 ) ) ( not ( = ?auto_408851 ?auto_408852 ) ) ( not ( = ?auto_408851 ?auto_408853 ) ) ( not ( = ?auto_408851 ?auto_408854 ) ) ( not ( = ?auto_408851 ?auto_408855 ) ) ( not ( = ?auto_408851 ?auto_408856 ) ) ( not ( = ?auto_408852 ?auto_408853 ) ) ( not ( = ?auto_408852 ?auto_408854 ) ) ( not ( = ?auto_408852 ?auto_408855 ) ) ( not ( = ?auto_408852 ?auto_408856 ) ) ( not ( = ?auto_408853 ?auto_408854 ) ) ( not ( = ?auto_408853 ?auto_408855 ) ) ( not ( = ?auto_408853 ?auto_408856 ) ) ( not ( = ?auto_408854 ?auto_408855 ) ) ( not ( = ?auto_408854 ?auto_408856 ) ) ( not ( = ?auto_408855 ?auto_408856 ) ) ( CLEAR ?auto_408853 ) ( ON ?auto_408854 ?auto_408855 ) ( CLEAR ?auto_408854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_408846 ?auto_408847 ?auto_408848 ?auto_408849 ?auto_408850 ?auto_408851 ?auto_408852 ?auto_408853 ?auto_408854 )
      ( MAKE-10PILE ?auto_408846 ?auto_408847 ?auto_408848 ?auto_408849 ?auto_408850 ?auto_408851 ?auto_408852 ?auto_408853 ?auto_408854 ?auto_408855 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408867 - BLOCK
      ?auto_408868 - BLOCK
      ?auto_408869 - BLOCK
      ?auto_408870 - BLOCK
      ?auto_408871 - BLOCK
      ?auto_408872 - BLOCK
      ?auto_408873 - BLOCK
      ?auto_408874 - BLOCK
      ?auto_408875 - BLOCK
      ?auto_408876 - BLOCK
    )
    :vars
    (
      ?auto_408877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408876 ?auto_408877 ) ( ON-TABLE ?auto_408867 ) ( ON ?auto_408868 ?auto_408867 ) ( ON ?auto_408869 ?auto_408868 ) ( ON ?auto_408870 ?auto_408869 ) ( ON ?auto_408871 ?auto_408870 ) ( ON ?auto_408872 ?auto_408871 ) ( ON ?auto_408873 ?auto_408872 ) ( ON ?auto_408874 ?auto_408873 ) ( not ( = ?auto_408867 ?auto_408868 ) ) ( not ( = ?auto_408867 ?auto_408869 ) ) ( not ( = ?auto_408867 ?auto_408870 ) ) ( not ( = ?auto_408867 ?auto_408871 ) ) ( not ( = ?auto_408867 ?auto_408872 ) ) ( not ( = ?auto_408867 ?auto_408873 ) ) ( not ( = ?auto_408867 ?auto_408874 ) ) ( not ( = ?auto_408867 ?auto_408875 ) ) ( not ( = ?auto_408867 ?auto_408876 ) ) ( not ( = ?auto_408867 ?auto_408877 ) ) ( not ( = ?auto_408868 ?auto_408869 ) ) ( not ( = ?auto_408868 ?auto_408870 ) ) ( not ( = ?auto_408868 ?auto_408871 ) ) ( not ( = ?auto_408868 ?auto_408872 ) ) ( not ( = ?auto_408868 ?auto_408873 ) ) ( not ( = ?auto_408868 ?auto_408874 ) ) ( not ( = ?auto_408868 ?auto_408875 ) ) ( not ( = ?auto_408868 ?auto_408876 ) ) ( not ( = ?auto_408868 ?auto_408877 ) ) ( not ( = ?auto_408869 ?auto_408870 ) ) ( not ( = ?auto_408869 ?auto_408871 ) ) ( not ( = ?auto_408869 ?auto_408872 ) ) ( not ( = ?auto_408869 ?auto_408873 ) ) ( not ( = ?auto_408869 ?auto_408874 ) ) ( not ( = ?auto_408869 ?auto_408875 ) ) ( not ( = ?auto_408869 ?auto_408876 ) ) ( not ( = ?auto_408869 ?auto_408877 ) ) ( not ( = ?auto_408870 ?auto_408871 ) ) ( not ( = ?auto_408870 ?auto_408872 ) ) ( not ( = ?auto_408870 ?auto_408873 ) ) ( not ( = ?auto_408870 ?auto_408874 ) ) ( not ( = ?auto_408870 ?auto_408875 ) ) ( not ( = ?auto_408870 ?auto_408876 ) ) ( not ( = ?auto_408870 ?auto_408877 ) ) ( not ( = ?auto_408871 ?auto_408872 ) ) ( not ( = ?auto_408871 ?auto_408873 ) ) ( not ( = ?auto_408871 ?auto_408874 ) ) ( not ( = ?auto_408871 ?auto_408875 ) ) ( not ( = ?auto_408871 ?auto_408876 ) ) ( not ( = ?auto_408871 ?auto_408877 ) ) ( not ( = ?auto_408872 ?auto_408873 ) ) ( not ( = ?auto_408872 ?auto_408874 ) ) ( not ( = ?auto_408872 ?auto_408875 ) ) ( not ( = ?auto_408872 ?auto_408876 ) ) ( not ( = ?auto_408872 ?auto_408877 ) ) ( not ( = ?auto_408873 ?auto_408874 ) ) ( not ( = ?auto_408873 ?auto_408875 ) ) ( not ( = ?auto_408873 ?auto_408876 ) ) ( not ( = ?auto_408873 ?auto_408877 ) ) ( not ( = ?auto_408874 ?auto_408875 ) ) ( not ( = ?auto_408874 ?auto_408876 ) ) ( not ( = ?auto_408874 ?auto_408877 ) ) ( not ( = ?auto_408875 ?auto_408876 ) ) ( not ( = ?auto_408875 ?auto_408877 ) ) ( not ( = ?auto_408876 ?auto_408877 ) ) ( CLEAR ?auto_408874 ) ( ON ?auto_408875 ?auto_408876 ) ( CLEAR ?auto_408875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_408867 ?auto_408868 ?auto_408869 ?auto_408870 ?auto_408871 ?auto_408872 ?auto_408873 ?auto_408874 ?auto_408875 )
      ( MAKE-10PILE ?auto_408867 ?auto_408868 ?auto_408869 ?auto_408870 ?auto_408871 ?auto_408872 ?auto_408873 ?auto_408874 ?auto_408875 ?auto_408876 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408888 - BLOCK
      ?auto_408889 - BLOCK
      ?auto_408890 - BLOCK
      ?auto_408891 - BLOCK
      ?auto_408892 - BLOCK
      ?auto_408893 - BLOCK
      ?auto_408894 - BLOCK
      ?auto_408895 - BLOCK
      ?auto_408896 - BLOCK
      ?auto_408897 - BLOCK
    )
    :vars
    (
      ?auto_408898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408897 ?auto_408898 ) ( ON-TABLE ?auto_408888 ) ( ON ?auto_408889 ?auto_408888 ) ( ON ?auto_408890 ?auto_408889 ) ( ON ?auto_408891 ?auto_408890 ) ( ON ?auto_408892 ?auto_408891 ) ( ON ?auto_408893 ?auto_408892 ) ( ON ?auto_408894 ?auto_408893 ) ( not ( = ?auto_408888 ?auto_408889 ) ) ( not ( = ?auto_408888 ?auto_408890 ) ) ( not ( = ?auto_408888 ?auto_408891 ) ) ( not ( = ?auto_408888 ?auto_408892 ) ) ( not ( = ?auto_408888 ?auto_408893 ) ) ( not ( = ?auto_408888 ?auto_408894 ) ) ( not ( = ?auto_408888 ?auto_408895 ) ) ( not ( = ?auto_408888 ?auto_408896 ) ) ( not ( = ?auto_408888 ?auto_408897 ) ) ( not ( = ?auto_408888 ?auto_408898 ) ) ( not ( = ?auto_408889 ?auto_408890 ) ) ( not ( = ?auto_408889 ?auto_408891 ) ) ( not ( = ?auto_408889 ?auto_408892 ) ) ( not ( = ?auto_408889 ?auto_408893 ) ) ( not ( = ?auto_408889 ?auto_408894 ) ) ( not ( = ?auto_408889 ?auto_408895 ) ) ( not ( = ?auto_408889 ?auto_408896 ) ) ( not ( = ?auto_408889 ?auto_408897 ) ) ( not ( = ?auto_408889 ?auto_408898 ) ) ( not ( = ?auto_408890 ?auto_408891 ) ) ( not ( = ?auto_408890 ?auto_408892 ) ) ( not ( = ?auto_408890 ?auto_408893 ) ) ( not ( = ?auto_408890 ?auto_408894 ) ) ( not ( = ?auto_408890 ?auto_408895 ) ) ( not ( = ?auto_408890 ?auto_408896 ) ) ( not ( = ?auto_408890 ?auto_408897 ) ) ( not ( = ?auto_408890 ?auto_408898 ) ) ( not ( = ?auto_408891 ?auto_408892 ) ) ( not ( = ?auto_408891 ?auto_408893 ) ) ( not ( = ?auto_408891 ?auto_408894 ) ) ( not ( = ?auto_408891 ?auto_408895 ) ) ( not ( = ?auto_408891 ?auto_408896 ) ) ( not ( = ?auto_408891 ?auto_408897 ) ) ( not ( = ?auto_408891 ?auto_408898 ) ) ( not ( = ?auto_408892 ?auto_408893 ) ) ( not ( = ?auto_408892 ?auto_408894 ) ) ( not ( = ?auto_408892 ?auto_408895 ) ) ( not ( = ?auto_408892 ?auto_408896 ) ) ( not ( = ?auto_408892 ?auto_408897 ) ) ( not ( = ?auto_408892 ?auto_408898 ) ) ( not ( = ?auto_408893 ?auto_408894 ) ) ( not ( = ?auto_408893 ?auto_408895 ) ) ( not ( = ?auto_408893 ?auto_408896 ) ) ( not ( = ?auto_408893 ?auto_408897 ) ) ( not ( = ?auto_408893 ?auto_408898 ) ) ( not ( = ?auto_408894 ?auto_408895 ) ) ( not ( = ?auto_408894 ?auto_408896 ) ) ( not ( = ?auto_408894 ?auto_408897 ) ) ( not ( = ?auto_408894 ?auto_408898 ) ) ( not ( = ?auto_408895 ?auto_408896 ) ) ( not ( = ?auto_408895 ?auto_408897 ) ) ( not ( = ?auto_408895 ?auto_408898 ) ) ( not ( = ?auto_408896 ?auto_408897 ) ) ( not ( = ?auto_408896 ?auto_408898 ) ) ( not ( = ?auto_408897 ?auto_408898 ) ) ( ON ?auto_408896 ?auto_408897 ) ( CLEAR ?auto_408894 ) ( ON ?auto_408895 ?auto_408896 ) ( CLEAR ?auto_408895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_408888 ?auto_408889 ?auto_408890 ?auto_408891 ?auto_408892 ?auto_408893 ?auto_408894 ?auto_408895 )
      ( MAKE-10PILE ?auto_408888 ?auto_408889 ?auto_408890 ?auto_408891 ?auto_408892 ?auto_408893 ?auto_408894 ?auto_408895 ?auto_408896 ?auto_408897 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408909 - BLOCK
      ?auto_408910 - BLOCK
      ?auto_408911 - BLOCK
      ?auto_408912 - BLOCK
      ?auto_408913 - BLOCK
      ?auto_408914 - BLOCK
      ?auto_408915 - BLOCK
      ?auto_408916 - BLOCK
      ?auto_408917 - BLOCK
      ?auto_408918 - BLOCK
    )
    :vars
    (
      ?auto_408919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408918 ?auto_408919 ) ( ON-TABLE ?auto_408909 ) ( ON ?auto_408910 ?auto_408909 ) ( ON ?auto_408911 ?auto_408910 ) ( ON ?auto_408912 ?auto_408911 ) ( ON ?auto_408913 ?auto_408912 ) ( ON ?auto_408914 ?auto_408913 ) ( ON ?auto_408915 ?auto_408914 ) ( not ( = ?auto_408909 ?auto_408910 ) ) ( not ( = ?auto_408909 ?auto_408911 ) ) ( not ( = ?auto_408909 ?auto_408912 ) ) ( not ( = ?auto_408909 ?auto_408913 ) ) ( not ( = ?auto_408909 ?auto_408914 ) ) ( not ( = ?auto_408909 ?auto_408915 ) ) ( not ( = ?auto_408909 ?auto_408916 ) ) ( not ( = ?auto_408909 ?auto_408917 ) ) ( not ( = ?auto_408909 ?auto_408918 ) ) ( not ( = ?auto_408909 ?auto_408919 ) ) ( not ( = ?auto_408910 ?auto_408911 ) ) ( not ( = ?auto_408910 ?auto_408912 ) ) ( not ( = ?auto_408910 ?auto_408913 ) ) ( not ( = ?auto_408910 ?auto_408914 ) ) ( not ( = ?auto_408910 ?auto_408915 ) ) ( not ( = ?auto_408910 ?auto_408916 ) ) ( not ( = ?auto_408910 ?auto_408917 ) ) ( not ( = ?auto_408910 ?auto_408918 ) ) ( not ( = ?auto_408910 ?auto_408919 ) ) ( not ( = ?auto_408911 ?auto_408912 ) ) ( not ( = ?auto_408911 ?auto_408913 ) ) ( not ( = ?auto_408911 ?auto_408914 ) ) ( not ( = ?auto_408911 ?auto_408915 ) ) ( not ( = ?auto_408911 ?auto_408916 ) ) ( not ( = ?auto_408911 ?auto_408917 ) ) ( not ( = ?auto_408911 ?auto_408918 ) ) ( not ( = ?auto_408911 ?auto_408919 ) ) ( not ( = ?auto_408912 ?auto_408913 ) ) ( not ( = ?auto_408912 ?auto_408914 ) ) ( not ( = ?auto_408912 ?auto_408915 ) ) ( not ( = ?auto_408912 ?auto_408916 ) ) ( not ( = ?auto_408912 ?auto_408917 ) ) ( not ( = ?auto_408912 ?auto_408918 ) ) ( not ( = ?auto_408912 ?auto_408919 ) ) ( not ( = ?auto_408913 ?auto_408914 ) ) ( not ( = ?auto_408913 ?auto_408915 ) ) ( not ( = ?auto_408913 ?auto_408916 ) ) ( not ( = ?auto_408913 ?auto_408917 ) ) ( not ( = ?auto_408913 ?auto_408918 ) ) ( not ( = ?auto_408913 ?auto_408919 ) ) ( not ( = ?auto_408914 ?auto_408915 ) ) ( not ( = ?auto_408914 ?auto_408916 ) ) ( not ( = ?auto_408914 ?auto_408917 ) ) ( not ( = ?auto_408914 ?auto_408918 ) ) ( not ( = ?auto_408914 ?auto_408919 ) ) ( not ( = ?auto_408915 ?auto_408916 ) ) ( not ( = ?auto_408915 ?auto_408917 ) ) ( not ( = ?auto_408915 ?auto_408918 ) ) ( not ( = ?auto_408915 ?auto_408919 ) ) ( not ( = ?auto_408916 ?auto_408917 ) ) ( not ( = ?auto_408916 ?auto_408918 ) ) ( not ( = ?auto_408916 ?auto_408919 ) ) ( not ( = ?auto_408917 ?auto_408918 ) ) ( not ( = ?auto_408917 ?auto_408919 ) ) ( not ( = ?auto_408918 ?auto_408919 ) ) ( ON ?auto_408917 ?auto_408918 ) ( CLEAR ?auto_408915 ) ( ON ?auto_408916 ?auto_408917 ) ( CLEAR ?auto_408916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_408909 ?auto_408910 ?auto_408911 ?auto_408912 ?auto_408913 ?auto_408914 ?auto_408915 ?auto_408916 )
      ( MAKE-10PILE ?auto_408909 ?auto_408910 ?auto_408911 ?auto_408912 ?auto_408913 ?auto_408914 ?auto_408915 ?auto_408916 ?auto_408917 ?auto_408918 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408930 - BLOCK
      ?auto_408931 - BLOCK
      ?auto_408932 - BLOCK
      ?auto_408933 - BLOCK
      ?auto_408934 - BLOCK
      ?auto_408935 - BLOCK
      ?auto_408936 - BLOCK
      ?auto_408937 - BLOCK
      ?auto_408938 - BLOCK
      ?auto_408939 - BLOCK
    )
    :vars
    (
      ?auto_408940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408939 ?auto_408940 ) ( ON-TABLE ?auto_408930 ) ( ON ?auto_408931 ?auto_408930 ) ( ON ?auto_408932 ?auto_408931 ) ( ON ?auto_408933 ?auto_408932 ) ( ON ?auto_408934 ?auto_408933 ) ( ON ?auto_408935 ?auto_408934 ) ( not ( = ?auto_408930 ?auto_408931 ) ) ( not ( = ?auto_408930 ?auto_408932 ) ) ( not ( = ?auto_408930 ?auto_408933 ) ) ( not ( = ?auto_408930 ?auto_408934 ) ) ( not ( = ?auto_408930 ?auto_408935 ) ) ( not ( = ?auto_408930 ?auto_408936 ) ) ( not ( = ?auto_408930 ?auto_408937 ) ) ( not ( = ?auto_408930 ?auto_408938 ) ) ( not ( = ?auto_408930 ?auto_408939 ) ) ( not ( = ?auto_408930 ?auto_408940 ) ) ( not ( = ?auto_408931 ?auto_408932 ) ) ( not ( = ?auto_408931 ?auto_408933 ) ) ( not ( = ?auto_408931 ?auto_408934 ) ) ( not ( = ?auto_408931 ?auto_408935 ) ) ( not ( = ?auto_408931 ?auto_408936 ) ) ( not ( = ?auto_408931 ?auto_408937 ) ) ( not ( = ?auto_408931 ?auto_408938 ) ) ( not ( = ?auto_408931 ?auto_408939 ) ) ( not ( = ?auto_408931 ?auto_408940 ) ) ( not ( = ?auto_408932 ?auto_408933 ) ) ( not ( = ?auto_408932 ?auto_408934 ) ) ( not ( = ?auto_408932 ?auto_408935 ) ) ( not ( = ?auto_408932 ?auto_408936 ) ) ( not ( = ?auto_408932 ?auto_408937 ) ) ( not ( = ?auto_408932 ?auto_408938 ) ) ( not ( = ?auto_408932 ?auto_408939 ) ) ( not ( = ?auto_408932 ?auto_408940 ) ) ( not ( = ?auto_408933 ?auto_408934 ) ) ( not ( = ?auto_408933 ?auto_408935 ) ) ( not ( = ?auto_408933 ?auto_408936 ) ) ( not ( = ?auto_408933 ?auto_408937 ) ) ( not ( = ?auto_408933 ?auto_408938 ) ) ( not ( = ?auto_408933 ?auto_408939 ) ) ( not ( = ?auto_408933 ?auto_408940 ) ) ( not ( = ?auto_408934 ?auto_408935 ) ) ( not ( = ?auto_408934 ?auto_408936 ) ) ( not ( = ?auto_408934 ?auto_408937 ) ) ( not ( = ?auto_408934 ?auto_408938 ) ) ( not ( = ?auto_408934 ?auto_408939 ) ) ( not ( = ?auto_408934 ?auto_408940 ) ) ( not ( = ?auto_408935 ?auto_408936 ) ) ( not ( = ?auto_408935 ?auto_408937 ) ) ( not ( = ?auto_408935 ?auto_408938 ) ) ( not ( = ?auto_408935 ?auto_408939 ) ) ( not ( = ?auto_408935 ?auto_408940 ) ) ( not ( = ?auto_408936 ?auto_408937 ) ) ( not ( = ?auto_408936 ?auto_408938 ) ) ( not ( = ?auto_408936 ?auto_408939 ) ) ( not ( = ?auto_408936 ?auto_408940 ) ) ( not ( = ?auto_408937 ?auto_408938 ) ) ( not ( = ?auto_408937 ?auto_408939 ) ) ( not ( = ?auto_408937 ?auto_408940 ) ) ( not ( = ?auto_408938 ?auto_408939 ) ) ( not ( = ?auto_408938 ?auto_408940 ) ) ( not ( = ?auto_408939 ?auto_408940 ) ) ( ON ?auto_408938 ?auto_408939 ) ( ON ?auto_408937 ?auto_408938 ) ( CLEAR ?auto_408935 ) ( ON ?auto_408936 ?auto_408937 ) ( CLEAR ?auto_408936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_408930 ?auto_408931 ?auto_408932 ?auto_408933 ?auto_408934 ?auto_408935 ?auto_408936 )
      ( MAKE-10PILE ?auto_408930 ?auto_408931 ?auto_408932 ?auto_408933 ?auto_408934 ?auto_408935 ?auto_408936 ?auto_408937 ?auto_408938 ?auto_408939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408951 - BLOCK
      ?auto_408952 - BLOCK
      ?auto_408953 - BLOCK
      ?auto_408954 - BLOCK
      ?auto_408955 - BLOCK
      ?auto_408956 - BLOCK
      ?auto_408957 - BLOCK
      ?auto_408958 - BLOCK
      ?auto_408959 - BLOCK
      ?auto_408960 - BLOCK
    )
    :vars
    (
      ?auto_408961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408960 ?auto_408961 ) ( ON-TABLE ?auto_408951 ) ( ON ?auto_408952 ?auto_408951 ) ( ON ?auto_408953 ?auto_408952 ) ( ON ?auto_408954 ?auto_408953 ) ( ON ?auto_408955 ?auto_408954 ) ( ON ?auto_408956 ?auto_408955 ) ( not ( = ?auto_408951 ?auto_408952 ) ) ( not ( = ?auto_408951 ?auto_408953 ) ) ( not ( = ?auto_408951 ?auto_408954 ) ) ( not ( = ?auto_408951 ?auto_408955 ) ) ( not ( = ?auto_408951 ?auto_408956 ) ) ( not ( = ?auto_408951 ?auto_408957 ) ) ( not ( = ?auto_408951 ?auto_408958 ) ) ( not ( = ?auto_408951 ?auto_408959 ) ) ( not ( = ?auto_408951 ?auto_408960 ) ) ( not ( = ?auto_408951 ?auto_408961 ) ) ( not ( = ?auto_408952 ?auto_408953 ) ) ( not ( = ?auto_408952 ?auto_408954 ) ) ( not ( = ?auto_408952 ?auto_408955 ) ) ( not ( = ?auto_408952 ?auto_408956 ) ) ( not ( = ?auto_408952 ?auto_408957 ) ) ( not ( = ?auto_408952 ?auto_408958 ) ) ( not ( = ?auto_408952 ?auto_408959 ) ) ( not ( = ?auto_408952 ?auto_408960 ) ) ( not ( = ?auto_408952 ?auto_408961 ) ) ( not ( = ?auto_408953 ?auto_408954 ) ) ( not ( = ?auto_408953 ?auto_408955 ) ) ( not ( = ?auto_408953 ?auto_408956 ) ) ( not ( = ?auto_408953 ?auto_408957 ) ) ( not ( = ?auto_408953 ?auto_408958 ) ) ( not ( = ?auto_408953 ?auto_408959 ) ) ( not ( = ?auto_408953 ?auto_408960 ) ) ( not ( = ?auto_408953 ?auto_408961 ) ) ( not ( = ?auto_408954 ?auto_408955 ) ) ( not ( = ?auto_408954 ?auto_408956 ) ) ( not ( = ?auto_408954 ?auto_408957 ) ) ( not ( = ?auto_408954 ?auto_408958 ) ) ( not ( = ?auto_408954 ?auto_408959 ) ) ( not ( = ?auto_408954 ?auto_408960 ) ) ( not ( = ?auto_408954 ?auto_408961 ) ) ( not ( = ?auto_408955 ?auto_408956 ) ) ( not ( = ?auto_408955 ?auto_408957 ) ) ( not ( = ?auto_408955 ?auto_408958 ) ) ( not ( = ?auto_408955 ?auto_408959 ) ) ( not ( = ?auto_408955 ?auto_408960 ) ) ( not ( = ?auto_408955 ?auto_408961 ) ) ( not ( = ?auto_408956 ?auto_408957 ) ) ( not ( = ?auto_408956 ?auto_408958 ) ) ( not ( = ?auto_408956 ?auto_408959 ) ) ( not ( = ?auto_408956 ?auto_408960 ) ) ( not ( = ?auto_408956 ?auto_408961 ) ) ( not ( = ?auto_408957 ?auto_408958 ) ) ( not ( = ?auto_408957 ?auto_408959 ) ) ( not ( = ?auto_408957 ?auto_408960 ) ) ( not ( = ?auto_408957 ?auto_408961 ) ) ( not ( = ?auto_408958 ?auto_408959 ) ) ( not ( = ?auto_408958 ?auto_408960 ) ) ( not ( = ?auto_408958 ?auto_408961 ) ) ( not ( = ?auto_408959 ?auto_408960 ) ) ( not ( = ?auto_408959 ?auto_408961 ) ) ( not ( = ?auto_408960 ?auto_408961 ) ) ( ON ?auto_408959 ?auto_408960 ) ( ON ?auto_408958 ?auto_408959 ) ( CLEAR ?auto_408956 ) ( ON ?auto_408957 ?auto_408958 ) ( CLEAR ?auto_408957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_408951 ?auto_408952 ?auto_408953 ?auto_408954 ?auto_408955 ?auto_408956 ?auto_408957 )
      ( MAKE-10PILE ?auto_408951 ?auto_408952 ?auto_408953 ?auto_408954 ?auto_408955 ?auto_408956 ?auto_408957 ?auto_408958 ?auto_408959 ?auto_408960 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408972 - BLOCK
      ?auto_408973 - BLOCK
      ?auto_408974 - BLOCK
      ?auto_408975 - BLOCK
      ?auto_408976 - BLOCK
      ?auto_408977 - BLOCK
      ?auto_408978 - BLOCK
      ?auto_408979 - BLOCK
      ?auto_408980 - BLOCK
      ?auto_408981 - BLOCK
    )
    :vars
    (
      ?auto_408982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_408981 ?auto_408982 ) ( ON-TABLE ?auto_408972 ) ( ON ?auto_408973 ?auto_408972 ) ( ON ?auto_408974 ?auto_408973 ) ( ON ?auto_408975 ?auto_408974 ) ( ON ?auto_408976 ?auto_408975 ) ( not ( = ?auto_408972 ?auto_408973 ) ) ( not ( = ?auto_408972 ?auto_408974 ) ) ( not ( = ?auto_408972 ?auto_408975 ) ) ( not ( = ?auto_408972 ?auto_408976 ) ) ( not ( = ?auto_408972 ?auto_408977 ) ) ( not ( = ?auto_408972 ?auto_408978 ) ) ( not ( = ?auto_408972 ?auto_408979 ) ) ( not ( = ?auto_408972 ?auto_408980 ) ) ( not ( = ?auto_408972 ?auto_408981 ) ) ( not ( = ?auto_408972 ?auto_408982 ) ) ( not ( = ?auto_408973 ?auto_408974 ) ) ( not ( = ?auto_408973 ?auto_408975 ) ) ( not ( = ?auto_408973 ?auto_408976 ) ) ( not ( = ?auto_408973 ?auto_408977 ) ) ( not ( = ?auto_408973 ?auto_408978 ) ) ( not ( = ?auto_408973 ?auto_408979 ) ) ( not ( = ?auto_408973 ?auto_408980 ) ) ( not ( = ?auto_408973 ?auto_408981 ) ) ( not ( = ?auto_408973 ?auto_408982 ) ) ( not ( = ?auto_408974 ?auto_408975 ) ) ( not ( = ?auto_408974 ?auto_408976 ) ) ( not ( = ?auto_408974 ?auto_408977 ) ) ( not ( = ?auto_408974 ?auto_408978 ) ) ( not ( = ?auto_408974 ?auto_408979 ) ) ( not ( = ?auto_408974 ?auto_408980 ) ) ( not ( = ?auto_408974 ?auto_408981 ) ) ( not ( = ?auto_408974 ?auto_408982 ) ) ( not ( = ?auto_408975 ?auto_408976 ) ) ( not ( = ?auto_408975 ?auto_408977 ) ) ( not ( = ?auto_408975 ?auto_408978 ) ) ( not ( = ?auto_408975 ?auto_408979 ) ) ( not ( = ?auto_408975 ?auto_408980 ) ) ( not ( = ?auto_408975 ?auto_408981 ) ) ( not ( = ?auto_408975 ?auto_408982 ) ) ( not ( = ?auto_408976 ?auto_408977 ) ) ( not ( = ?auto_408976 ?auto_408978 ) ) ( not ( = ?auto_408976 ?auto_408979 ) ) ( not ( = ?auto_408976 ?auto_408980 ) ) ( not ( = ?auto_408976 ?auto_408981 ) ) ( not ( = ?auto_408976 ?auto_408982 ) ) ( not ( = ?auto_408977 ?auto_408978 ) ) ( not ( = ?auto_408977 ?auto_408979 ) ) ( not ( = ?auto_408977 ?auto_408980 ) ) ( not ( = ?auto_408977 ?auto_408981 ) ) ( not ( = ?auto_408977 ?auto_408982 ) ) ( not ( = ?auto_408978 ?auto_408979 ) ) ( not ( = ?auto_408978 ?auto_408980 ) ) ( not ( = ?auto_408978 ?auto_408981 ) ) ( not ( = ?auto_408978 ?auto_408982 ) ) ( not ( = ?auto_408979 ?auto_408980 ) ) ( not ( = ?auto_408979 ?auto_408981 ) ) ( not ( = ?auto_408979 ?auto_408982 ) ) ( not ( = ?auto_408980 ?auto_408981 ) ) ( not ( = ?auto_408980 ?auto_408982 ) ) ( not ( = ?auto_408981 ?auto_408982 ) ) ( ON ?auto_408980 ?auto_408981 ) ( ON ?auto_408979 ?auto_408980 ) ( ON ?auto_408978 ?auto_408979 ) ( CLEAR ?auto_408976 ) ( ON ?auto_408977 ?auto_408978 ) ( CLEAR ?auto_408977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408972 ?auto_408973 ?auto_408974 ?auto_408975 ?auto_408976 ?auto_408977 )
      ( MAKE-10PILE ?auto_408972 ?auto_408973 ?auto_408974 ?auto_408975 ?auto_408976 ?auto_408977 ?auto_408978 ?auto_408979 ?auto_408980 ?auto_408981 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_408993 - BLOCK
      ?auto_408994 - BLOCK
      ?auto_408995 - BLOCK
      ?auto_408996 - BLOCK
      ?auto_408997 - BLOCK
      ?auto_408998 - BLOCK
      ?auto_408999 - BLOCK
      ?auto_409000 - BLOCK
      ?auto_409001 - BLOCK
      ?auto_409002 - BLOCK
    )
    :vars
    (
      ?auto_409003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409002 ?auto_409003 ) ( ON-TABLE ?auto_408993 ) ( ON ?auto_408994 ?auto_408993 ) ( ON ?auto_408995 ?auto_408994 ) ( ON ?auto_408996 ?auto_408995 ) ( ON ?auto_408997 ?auto_408996 ) ( not ( = ?auto_408993 ?auto_408994 ) ) ( not ( = ?auto_408993 ?auto_408995 ) ) ( not ( = ?auto_408993 ?auto_408996 ) ) ( not ( = ?auto_408993 ?auto_408997 ) ) ( not ( = ?auto_408993 ?auto_408998 ) ) ( not ( = ?auto_408993 ?auto_408999 ) ) ( not ( = ?auto_408993 ?auto_409000 ) ) ( not ( = ?auto_408993 ?auto_409001 ) ) ( not ( = ?auto_408993 ?auto_409002 ) ) ( not ( = ?auto_408993 ?auto_409003 ) ) ( not ( = ?auto_408994 ?auto_408995 ) ) ( not ( = ?auto_408994 ?auto_408996 ) ) ( not ( = ?auto_408994 ?auto_408997 ) ) ( not ( = ?auto_408994 ?auto_408998 ) ) ( not ( = ?auto_408994 ?auto_408999 ) ) ( not ( = ?auto_408994 ?auto_409000 ) ) ( not ( = ?auto_408994 ?auto_409001 ) ) ( not ( = ?auto_408994 ?auto_409002 ) ) ( not ( = ?auto_408994 ?auto_409003 ) ) ( not ( = ?auto_408995 ?auto_408996 ) ) ( not ( = ?auto_408995 ?auto_408997 ) ) ( not ( = ?auto_408995 ?auto_408998 ) ) ( not ( = ?auto_408995 ?auto_408999 ) ) ( not ( = ?auto_408995 ?auto_409000 ) ) ( not ( = ?auto_408995 ?auto_409001 ) ) ( not ( = ?auto_408995 ?auto_409002 ) ) ( not ( = ?auto_408995 ?auto_409003 ) ) ( not ( = ?auto_408996 ?auto_408997 ) ) ( not ( = ?auto_408996 ?auto_408998 ) ) ( not ( = ?auto_408996 ?auto_408999 ) ) ( not ( = ?auto_408996 ?auto_409000 ) ) ( not ( = ?auto_408996 ?auto_409001 ) ) ( not ( = ?auto_408996 ?auto_409002 ) ) ( not ( = ?auto_408996 ?auto_409003 ) ) ( not ( = ?auto_408997 ?auto_408998 ) ) ( not ( = ?auto_408997 ?auto_408999 ) ) ( not ( = ?auto_408997 ?auto_409000 ) ) ( not ( = ?auto_408997 ?auto_409001 ) ) ( not ( = ?auto_408997 ?auto_409002 ) ) ( not ( = ?auto_408997 ?auto_409003 ) ) ( not ( = ?auto_408998 ?auto_408999 ) ) ( not ( = ?auto_408998 ?auto_409000 ) ) ( not ( = ?auto_408998 ?auto_409001 ) ) ( not ( = ?auto_408998 ?auto_409002 ) ) ( not ( = ?auto_408998 ?auto_409003 ) ) ( not ( = ?auto_408999 ?auto_409000 ) ) ( not ( = ?auto_408999 ?auto_409001 ) ) ( not ( = ?auto_408999 ?auto_409002 ) ) ( not ( = ?auto_408999 ?auto_409003 ) ) ( not ( = ?auto_409000 ?auto_409001 ) ) ( not ( = ?auto_409000 ?auto_409002 ) ) ( not ( = ?auto_409000 ?auto_409003 ) ) ( not ( = ?auto_409001 ?auto_409002 ) ) ( not ( = ?auto_409001 ?auto_409003 ) ) ( not ( = ?auto_409002 ?auto_409003 ) ) ( ON ?auto_409001 ?auto_409002 ) ( ON ?auto_409000 ?auto_409001 ) ( ON ?auto_408999 ?auto_409000 ) ( CLEAR ?auto_408997 ) ( ON ?auto_408998 ?auto_408999 ) ( CLEAR ?auto_408998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_408993 ?auto_408994 ?auto_408995 ?auto_408996 ?auto_408997 ?auto_408998 )
      ( MAKE-10PILE ?auto_408993 ?auto_408994 ?auto_408995 ?auto_408996 ?auto_408997 ?auto_408998 ?auto_408999 ?auto_409000 ?auto_409001 ?auto_409002 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409014 - BLOCK
      ?auto_409015 - BLOCK
      ?auto_409016 - BLOCK
      ?auto_409017 - BLOCK
      ?auto_409018 - BLOCK
      ?auto_409019 - BLOCK
      ?auto_409020 - BLOCK
      ?auto_409021 - BLOCK
      ?auto_409022 - BLOCK
      ?auto_409023 - BLOCK
    )
    :vars
    (
      ?auto_409024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409023 ?auto_409024 ) ( ON-TABLE ?auto_409014 ) ( ON ?auto_409015 ?auto_409014 ) ( ON ?auto_409016 ?auto_409015 ) ( ON ?auto_409017 ?auto_409016 ) ( not ( = ?auto_409014 ?auto_409015 ) ) ( not ( = ?auto_409014 ?auto_409016 ) ) ( not ( = ?auto_409014 ?auto_409017 ) ) ( not ( = ?auto_409014 ?auto_409018 ) ) ( not ( = ?auto_409014 ?auto_409019 ) ) ( not ( = ?auto_409014 ?auto_409020 ) ) ( not ( = ?auto_409014 ?auto_409021 ) ) ( not ( = ?auto_409014 ?auto_409022 ) ) ( not ( = ?auto_409014 ?auto_409023 ) ) ( not ( = ?auto_409014 ?auto_409024 ) ) ( not ( = ?auto_409015 ?auto_409016 ) ) ( not ( = ?auto_409015 ?auto_409017 ) ) ( not ( = ?auto_409015 ?auto_409018 ) ) ( not ( = ?auto_409015 ?auto_409019 ) ) ( not ( = ?auto_409015 ?auto_409020 ) ) ( not ( = ?auto_409015 ?auto_409021 ) ) ( not ( = ?auto_409015 ?auto_409022 ) ) ( not ( = ?auto_409015 ?auto_409023 ) ) ( not ( = ?auto_409015 ?auto_409024 ) ) ( not ( = ?auto_409016 ?auto_409017 ) ) ( not ( = ?auto_409016 ?auto_409018 ) ) ( not ( = ?auto_409016 ?auto_409019 ) ) ( not ( = ?auto_409016 ?auto_409020 ) ) ( not ( = ?auto_409016 ?auto_409021 ) ) ( not ( = ?auto_409016 ?auto_409022 ) ) ( not ( = ?auto_409016 ?auto_409023 ) ) ( not ( = ?auto_409016 ?auto_409024 ) ) ( not ( = ?auto_409017 ?auto_409018 ) ) ( not ( = ?auto_409017 ?auto_409019 ) ) ( not ( = ?auto_409017 ?auto_409020 ) ) ( not ( = ?auto_409017 ?auto_409021 ) ) ( not ( = ?auto_409017 ?auto_409022 ) ) ( not ( = ?auto_409017 ?auto_409023 ) ) ( not ( = ?auto_409017 ?auto_409024 ) ) ( not ( = ?auto_409018 ?auto_409019 ) ) ( not ( = ?auto_409018 ?auto_409020 ) ) ( not ( = ?auto_409018 ?auto_409021 ) ) ( not ( = ?auto_409018 ?auto_409022 ) ) ( not ( = ?auto_409018 ?auto_409023 ) ) ( not ( = ?auto_409018 ?auto_409024 ) ) ( not ( = ?auto_409019 ?auto_409020 ) ) ( not ( = ?auto_409019 ?auto_409021 ) ) ( not ( = ?auto_409019 ?auto_409022 ) ) ( not ( = ?auto_409019 ?auto_409023 ) ) ( not ( = ?auto_409019 ?auto_409024 ) ) ( not ( = ?auto_409020 ?auto_409021 ) ) ( not ( = ?auto_409020 ?auto_409022 ) ) ( not ( = ?auto_409020 ?auto_409023 ) ) ( not ( = ?auto_409020 ?auto_409024 ) ) ( not ( = ?auto_409021 ?auto_409022 ) ) ( not ( = ?auto_409021 ?auto_409023 ) ) ( not ( = ?auto_409021 ?auto_409024 ) ) ( not ( = ?auto_409022 ?auto_409023 ) ) ( not ( = ?auto_409022 ?auto_409024 ) ) ( not ( = ?auto_409023 ?auto_409024 ) ) ( ON ?auto_409022 ?auto_409023 ) ( ON ?auto_409021 ?auto_409022 ) ( ON ?auto_409020 ?auto_409021 ) ( ON ?auto_409019 ?auto_409020 ) ( CLEAR ?auto_409017 ) ( ON ?auto_409018 ?auto_409019 ) ( CLEAR ?auto_409018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_409014 ?auto_409015 ?auto_409016 ?auto_409017 ?auto_409018 )
      ( MAKE-10PILE ?auto_409014 ?auto_409015 ?auto_409016 ?auto_409017 ?auto_409018 ?auto_409019 ?auto_409020 ?auto_409021 ?auto_409022 ?auto_409023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409035 - BLOCK
      ?auto_409036 - BLOCK
      ?auto_409037 - BLOCK
      ?auto_409038 - BLOCK
      ?auto_409039 - BLOCK
      ?auto_409040 - BLOCK
      ?auto_409041 - BLOCK
      ?auto_409042 - BLOCK
      ?auto_409043 - BLOCK
      ?auto_409044 - BLOCK
    )
    :vars
    (
      ?auto_409045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409044 ?auto_409045 ) ( ON-TABLE ?auto_409035 ) ( ON ?auto_409036 ?auto_409035 ) ( ON ?auto_409037 ?auto_409036 ) ( ON ?auto_409038 ?auto_409037 ) ( not ( = ?auto_409035 ?auto_409036 ) ) ( not ( = ?auto_409035 ?auto_409037 ) ) ( not ( = ?auto_409035 ?auto_409038 ) ) ( not ( = ?auto_409035 ?auto_409039 ) ) ( not ( = ?auto_409035 ?auto_409040 ) ) ( not ( = ?auto_409035 ?auto_409041 ) ) ( not ( = ?auto_409035 ?auto_409042 ) ) ( not ( = ?auto_409035 ?auto_409043 ) ) ( not ( = ?auto_409035 ?auto_409044 ) ) ( not ( = ?auto_409035 ?auto_409045 ) ) ( not ( = ?auto_409036 ?auto_409037 ) ) ( not ( = ?auto_409036 ?auto_409038 ) ) ( not ( = ?auto_409036 ?auto_409039 ) ) ( not ( = ?auto_409036 ?auto_409040 ) ) ( not ( = ?auto_409036 ?auto_409041 ) ) ( not ( = ?auto_409036 ?auto_409042 ) ) ( not ( = ?auto_409036 ?auto_409043 ) ) ( not ( = ?auto_409036 ?auto_409044 ) ) ( not ( = ?auto_409036 ?auto_409045 ) ) ( not ( = ?auto_409037 ?auto_409038 ) ) ( not ( = ?auto_409037 ?auto_409039 ) ) ( not ( = ?auto_409037 ?auto_409040 ) ) ( not ( = ?auto_409037 ?auto_409041 ) ) ( not ( = ?auto_409037 ?auto_409042 ) ) ( not ( = ?auto_409037 ?auto_409043 ) ) ( not ( = ?auto_409037 ?auto_409044 ) ) ( not ( = ?auto_409037 ?auto_409045 ) ) ( not ( = ?auto_409038 ?auto_409039 ) ) ( not ( = ?auto_409038 ?auto_409040 ) ) ( not ( = ?auto_409038 ?auto_409041 ) ) ( not ( = ?auto_409038 ?auto_409042 ) ) ( not ( = ?auto_409038 ?auto_409043 ) ) ( not ( = ?auto_409038 ?auto_409044 ) ) ( not ( = ?auto_409038 ?auto_409045 ) ) ( not ( = ?auto_409039 ?auto_409040 ) ) ( not ( = ?auto_409039 ?auto_409041 ) ) ( not ( = ?auto_409039 ?auto_409042 ) ) ( not ( = ?auto_409039 ?auto_409043 ) ) ( not ( = ?auto_409039 ?auto_409044 ) ) ( not ( = ?auto_409039 ?auto_409045 ) ) ( not ( = ?auto_409040 ?auto_409041 ) ) ( not ( = ?auto_409040 ?auto_409042 ) ) ( not ( = ?auto_409040 ?auto_409043 ) ) ( not ( = ?auto_409040 ?auto_409044 ) ) ( not ( = ?auto_409040 ?auto_409045 ) ) ( not ( = ?auto_409041 ?auto_409042 ) ) ( not ( = ?auto_409041 ?auto_409043 ) ) ( not ( = ?auto_409041 ?auto_409044 ) ) ( not ( = ?auto_409041 ?auto_409045 ) ) ( not ( = ?auto_409042 ?auto_409043 ) ) ( not ( = ?auto_409042 ?auto_409044 ) ) ( not ( = ?auto_409042 ?auto_409045 ) ) ( not ( = ?auto_409043 ?auto_409044 ) ) ( not ( = ?auto_409043 ?auto_409045 ) ) ( not ( = ?auto_409044 ?auto_409045 ) ) ( ON ?auto_409043 ?auto_409044 ) ( ON ?auto_409042 ?auto_409043 ) ( ON ?auto_409041 ?auto_409042 ) ( ON ?auto_409040 ?auto_409041 ) ( CLEAR ?auto_409038 ) ( ON ?auto_409039 ?auto_409040 ) ( CLEAR ?auto_409039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_409035 ?auto_409036 ?auto_409037 ?auto_409038 ?auto_409039 )
      ( MAKE-10PILE ?auto_409035 ?auto_409036 ?auto_409037 ?auto_409038 ?auto_409039 ?auto_409040 ?auto_409041 ?auto_409042 ?auto_409043 ?auto_409044 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409056 - BLOCK
      ?auto_409057 - BLOCK
      ?auto_409058 - BLOCK
      ?auto_409059 - BLOCK
      ?auto_409060 - BLOCK
      ?auto_409061 - BLOCK
      ?auto_409062 - BLOCK
      ?auto_409063 - BLOCK
      ?auto_409064 - BLOCK
      ?auto_409065 - BLOCK
    )
    :vars
    (
      ?auto_409066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409065 ?auto_409066 ) ( ON-TABLE ?auto_409056 ) ( ON ?auto_409057 ?auto_409056 ) ( ON ?auto_409058 ?auto_409057 ) ( not ( = ?auto_409056 ?auto_409057 ) ) ( not ( = ?auto_409056 ?auto_409058 ) ) ( not ( = ?auto_409056 ?auto_409059 ) ) ( not ( = ?auto_409056 ?auto_409060 ) ) ( not ( = ?auto_409056 ?auto_409061 ) ) ( not ( = ?auto_409056 ?auto_409062 ) ) ( not ( = ?auto_409056 ?auto_409063 ) ) ( not ( = ?auto_409056 ?auto_409064 ) ) ( not ( = ?auto_409056 ?auto_409065 ) ) ( not ( = ?auto_409056 ?auto_409066 ) ) ( not ( = ?auto_409057 ?auto_409058 ) ) ( not ( = ?auto_409057 ?auto_409059 ) ) ( not ( = ?auto_409057 ?auto_409060 ) ) ( not ( = ?auto_409057 ?auto_409061 ) ) ( not ( = ?auto_409057 ?auto_409062 ) ) ( not ( = ?auto_409057 ?auto_409063 ) ) ( not ( = ?auto_409057 ?auto_409064 ) ) ( not ( = ?auto_409057 ?auto_409065 ) ) ( not ( = ?auto_409057 ?auto_409066 ) ) ( not ( = ?auto_409058 ?auto_409059 ) ) ( not ( = ?auto_409058 ?auto_409060 ) ) ( not ( = ?auto_409058 ?auto_409061 ) ) ( not ( = ?auto_409058 ?auto_409062 ) ) ( not ( = ?auto_409058 ?auto_409063 ) ) ( not ( = ?auto_409058 ?auto_409064 ) ) ( not ( = ?auto_409058 ?auto_409065 ) ) ( not ( = ?auto_409058 ?auto_409066 ) ) ( not ( = ?auto_409059 ?auto_409060 ) ) ( not ( = ?auto_409059 ?auto_409061 ) ) ( not ( = ?auto_409059 ?auto_409062 ) ) ( not ( = ?auto_409059 ?auto_409063 ) ) ( not ( = ?auto_409059 ?auto_409064 ) ) ( not ( = ?auto_409059 ?auto_409065 ) ) ( not ( = ?auto_409059 ?auto_409066 ) ) ( not ( = ?auto_409060 ?auto_409061 ) ) ( not ( = ?auto_409060 ?auto_409062 ) ) ( not ( = ?auto_409060 ?auto_409063 ) ) ( not ( = ?auto_409060 ?auto_409064 ) ) ( not ( = ?auto_409060 ?auto_409065 ) ) ( not ( = ?auto_409060 ?auto_409066 ) ) ( not ( = ?auto_409061 ?auto_409062 ) ) ( not ( = ?auto_409061 ?auto_409063 ) ) ( not ( = ?auto_409061 ?auto_409064 ) ) ( not ( = ?auto_409061 ?auto_409065 ) ) ( not ( = ?auto_409061 ?auto_409066 ) ) ( not ( = ?auto_409062 ?auto_409063 ) ) ( not ( = ?auto_409062 ?auto_409064 ) ) ( not ( = ?auto_409062 ?auto_409065 ) ) ( not ( = ?auto_409062 ?auto_409066 ) ) ( not ( = ?auto_409063 ?auto_409064 ) ) ( not ( = ?auto_409063 ?auto_409065 ) ) ( not ( = ?auto_409063 ?auto_409066 ) ) ( not ( = ?auto_409064 ?auto_409065 ) ) ( not ( = ?auto_409064 ?auto_409066 ) ) ( not ( = ?auto_409065 ?auto_409066 ) ) ( ON ?auto_409064 ?auto_409065 ) ( ON ?auto_409063 ?auto_409064 ) ( ON ?auto_409062 ?auto_409063 ) ( ON ?auto_409061 ?auto_409062 ) ( ON ?auto_409060 ?auto_409061 ) ( CLEAR ?auto_409058 ) ( ON ?auto_409059 ?auto_409060 ) ( CLEAR ?auto_409059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_409056 ?auto_409057 ?auto_409058 ?auto_409059 )
      ( MAKE-10PILE ?auto_409056 ?auto_409057 ?auto_409058 ?auto_409059 ?auto_409060 ?auto_409061 ?auto_409062 ?auto_409063 ?auto_409064 ?auto_409065 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409077 - BLOCK
      ?auto_409078 - BLOCK
      ?auto_409079 - BLOCK
      ?auto_409080 - BLOCK
      ?auto_409081 - BLOCK
      ?auto_409082 - BLOCK
      ?auto_409083 - BLOCK
      ?auto_409084 - BLOCK
      ?auto_409085 - BLOCK
      ?auto_409086 - BLOCK
    )
    :vars
    (
      ?auto_409087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409086 ?auto_409087 ) ( ON-TABLE ?auto_409077 ) ( ON ?auto_409078 ?auto_409077 ) ( ON ?auto_409079 ?auto_409078 ) ( not ( = ?auto_409077 ?auto_409078 ) ) ( not ( = ?auto_409077 ?auto_409079 ) ) ( not ( = ?auto_409077 ?auto_409080 ) ) ( not ( = ?auto_409077 ?auto_409081 ) ) ( not ( = ?auto_409077 ?auto_409082 ) ) ( not ( = ?auto_409077 ?auto_409083 ) ) ( not ( = ?auto_409077 ?auto_409084 ) ) ( not ( = ?auto_409077 ?auto_409085 ) ) ( not ( = ?auto_409077 ?auto_409086 ) ) ( not ( = ?auto_409077 ?auto_409087 ) ) ( not ( = ?auto_409078 ?auto_409079 ) ) ( not ( = ?auto_409078 ?auto_409080 ) ) ( not ( = ?auto_409078 ?auto_409081 ) ) ( not ( = ?auto_409078 ?auto_409082 ) ) ( not ( = ?auto_409078 ?auto_409083 ) ) ( not ( = ?auto_409078 ?auto_409084 ) ) ( not ( = ?auto_409078 ?auto_409085 ) ) ( not ( = ?auto_409078 ?auto_409086 ) ) ( not ( = ?auto_409078 ?auto_409087 ) ) ( not ( = ?auto_409079 ?auto_409080 ) ) ( not ( = ?auto_409079 ?auto_409081 ) ) ( not ( = ?auto_409079 ?auto_409082 ) ) ( not ( = ?auto_409079 ?auto_409083 ) ) ( not ( = ?auto_409079 ?auto_409084 ) ) ( not ( = ?auto_409079 ?auto_409085 ) ) ( not ( = ?auto_409079 ?auto_409086 ) ) ( not ( = ?auto_409079 ?auto_409087 ) ) ( not ( = ?auto_409080 ?auto_409081 ) ) ( not ( = ?auto_409080 ?auto_409082 ) ) ( not ( = ?auto_409080 ?auto_409083 ) ) ( not ( = ?auto_409080 ?auto_409084 ) ) ( not ( = ?auto_409080 ?auto_409085 ) ) ( not ( = ?auto_409080 ?auto_409086 ) ) ( not ( = ?auto_409080 ?auto_409087 ) ) ( not ( = ?auto_409081 ?auto_409082 ) ) ( not ( = ?auto_409081 ?auto_409083 ) ) ( not ( = ?auto_409081 ?auto_409084 ) ) ( not ( = ?auto_409081 ?auto_409085 ) ) ( not ( = ?auto_409081 ?auto_409086 ) ) ( not ( = ?auto_409081 ?auto_409087 ) ) ( not ( = ?auto_409082 ?auto_409083 ) ) ( not ( = ?auto_409082 ?auto_409084 ) ) ( not ( = ?auto_409082 ?auto_409085 ) ) ( not ( = ?auto_409082 ?auto_409086 ) ) ( not ( = ?auto_409082 ?auto_409087 ) ) ( not ( = ?auto_409083 ?auto_409084 ) ) ( not ( = ?auto_409083 ?auto_409085 ) ) ( not ( = ?auto_409083 ?auto_409086 ) ) ( not ( = ?auto_409083 ?auto_409087 ) ) ( not ( = ?auto_409084 ?auto_409085 ) ) ( not ( = ?auto_409084 ?auto_409086 ) ) ( not ( = ?auto_409084 ?auto_409087 ) ) ( not ( = ?auto_409085 ?auto_409086 ) ) ( not ( = ?auto_409085 ?auto_409087 ) ) ( not ( = ?auto_409086 ?auto_409087 ) ) ( ON ?auto_409085 ?auto_409086 ) ( ON ?auto_409084 ?auto_409085 ) ( ON ?auto_409083 ?auto_409084 ) ( ON ?auto_409082 ?auto_409083 ) ( ON ?auto_409081 ?auto_409082 ) ( CLEAR ?auto_409079 ) ( ON ?auto_409080 ?auto_409081 ) ( CLEAR ?auto_409080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_409077 ?auto_409078 ?auto_409079 ?auto_409080 )
      ( MAKE-10PILE ?auto_409077 ?auto_409078 ?auto_409079 ?auto_409080 ?auto_409081 ?auto_409082 ?auto_409083 ?auto_409084 ?auto_409085 ?auto_409086 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409098 - BLOCK
      ?auto_409099 - BLOCK
      ?auto_409100 - BLOCK
      ?auto_409101 - BLOCK
      ?auto_409102 - BLOCK
      ?auto_409103 - BLOCK
      ?auto_409104 - BLOCK
      ?auto_409105 - BLOCK
      ?auto_409106 - BLOCK
      ?auto_409107 - BLOCK
    )
    :vars
    (
      ?auto_409108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409107 ?auto_409108 ) ( ON-TABLE ?auto_409098 ) ( ON ?auto_409099 ?auto_409098 ) ( not ( = ?auto_409098 ?auto_409099 ) ) ( not ( = ?auto_409098 ?auto_409100 ) ) ( not ( = ?auto_409098 ?auto_409101 ) ) ( not ( = ?auto_409098 ?auto_409102 ) ) ( not ( = ?auto_409098 ?auto_409103 ) ) ( not ( = ?auto_409098 ?auto_409104 ) ) ( not ( = ?auto_409098 ?auto_409105 ) ) ( not ( = ?auto_409098 ?auto_409106 ) ) ( not ( = ?auto_409098 ?auto_409107 ) ) ( not ( = ?auto_409098 ?auto_409108 ) ) ( not ( = ?auto_409099 ?auto_409100 ) ) ( not ( = ?auto_409099 ?auto_409101 ) ) ( not ( = ?auto_409099 ?auto_409102 ) ) ( not ( = ?auto_409099 ?auto_409103 ) ) ( not ( = ?auto_409099 ?auto_409104 ) ) ( not ( = ?auto_409099 ?auto_409105 ) ) ( not ( = ?auto_409099 ?auto_409106 ) ) ( not ( = ?auto_409099 ?auto_409107 ) ) ( not ( = ?auto_409099 ?auto_409108 ) ) ( not ( = ?auto_409100 ?auto_409101 ) ) ( not ( = ?auto_409100 ?auto_409102 ) ) ( not ( = ?auto_409100 ?auto_409103 ) ) ( not ( = ?auto_409100 ?auto_409104 ) ) ( not ( = ?auto_409100 ?auto_409105 ) ) ( not ( = ?auto_409100 ?auto_409106 ) ) ( not ( = ?auto_409100 ?auto_409107 ) ) ( not ( = ?auto_409100 ?auto_409108 ) ) ( not ( = ?auto_409101 ?auto_409102 ) ) ( not ( = ?auto_409101 ?auto_409103 ) ) ( not ( = ?auto_409101 ?auto_409104 ) ) ( not ( = ?auto_409101 ?auto_409105 ) ) ( not ( = ?auto_409101 ?auto_409106 ) ) ( not ( = ?auto_409101 ?auto_409107 ) ) ( not ( = ?auto_409101 ?auto_409108 ) ) ( not ( = ?auto_409102 ?auto_409103 ) ) ( not ( = ?auto_409102 ?auto_409104 ) ) ( not ( = ?auto_409102 ?auto_409105 ) ) ( not ( = ?auto_409102 ?auto_409106 ) ) ( not ( = ?auto_409102 ?auto_409107 ) ) ( not ( = ?auto_409102 ?auto_409108 ) ) ( not ( = ?auto_409103 ?auto_409104 ) ) ( not ( = ?auto_409103 ?auto_409105 ) ) ( not ( = ?auto_409103 ?auto_409106 ) ) ( not ( = ?auto_409103 ?auto_409107 ) ) ( not ( = ?auto_409103 ?auto_409108 ) ) ( not ( = ?auto_409104 ?auto_409105 ) ) ( not ( = ?auto_409104 ?auto_409106 ) ) ( not ( = ?auto_409104 ?auto_409107 ) ) ( not ( = ?auto_409104 ?auto_409108 ) ) ( not ( = ?auto_409105 ?auto_409106 ) ) ( not ( = ?auto_409105 ?auto_409107 ) ) ( not ( = ?auto_409105 ?auto_409108 ) ) ( not ( = ?auto_409106 ?auto_409107 ) ) ( not ( = ?auto_409106 ?auto_409108 ) ) ( not ( = ?auto_409107 ?auto_409108 ) ) ( ON ?auto_409106 ?auto_409107 ) ( ON ?auto_409105 ?auto_409106 ) ( ON ?auto_409104 ?auto_409105 ) ( ON ?auto_409103 ?auto_409104 ) ( ON ?auto_409102 ?auto_409103 ) ( ON ?auto_409101 ?auto_409102 ) ( CLEAR ?auto_409099 ) ( ON ?auto_409100 ?auto_409101 ) ( CLEAR ?auto_409100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_409098 ?auto_409099 ?auto_409100 )
      ( MAKE-10PILE ?auto_409098 ?auto_409099 ?auto_409100 ?auto_409101 ?auto_409102 ?auto_409103 ?auto_409104 ?auto_409105 ?auto_409106 ?auto_409107 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409119 - BLOCK
      ?auto_409120 - BLOCK
      ?auto_409121 - BLOCK
      ?auto_409122 - BLOCK
      ?auto_409123 - BLOCK
      ?auto_409124 - BLOCK
      ?auto_409125 - BLOCK
      ?auto_409126 - BLOCK
      ?auto_409127 - BLOCK
      ?auto_409128 - BLOCK
    )
    :vars
    (
      ?auto_409129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409128 ?auto_409129 ) ( ON-TABLE ?auto_409119 ) ( ON ?auto_409120 ?auto_409119 ) ( not ( = ?auto_409119 ?auto_409120 ) ) ( not ( = ?auto_409119 ?auto_409121 ) ) ( not ( = ?auto_409119 ?auto_409122 ) ) ( not ( = ?auto_409119 ?auto_409123 ) ) ( not ( = ?auto_409119 ?auto_409124 ) ) ( not ( = ?auto_409119 ?auto_409125 ) ) ( not ( = ?auto_409119 ?auto_409126 ) ) ( not ( = ?auto_409119 ?auto_409127 ) ) ( not ( = ?auto_409119 ?auto_409128 ) ) ( not ( = ?auto_409119 ?auto_409129 ) ) ( not ( = ?auto_409120 ?auto_409121 ) ) ( not ( = ?auto_409120 ?auto_409122 ) ) ( not ( = ?auto_409120 ?auto_409123 ) ) ( not ( = ?auto_409120 ?auto_409124 ) ) ( not ( = ?auto_409120 ?auto_409125 ) ) ( not ( = ?auto_409120 ?auto_409126 ) ) ( not ( = ?auto_409120 ?auto_409127 ) ) ( not ( = ?auto_409120 ?auto_409128 ) ) ( not ( = ?auto_409120 ?auto_409129 ) ) ( not ( = ?auto_409121 ?auto_409122 ) ) ( not ( = ?auto_409121 ?auto_409123 ) ) ( not ( = ?auto_409121 ?auto_409124 ) ) ( not ( = ?auto_409121 ?auto_409125 ) ) ( not ( = ?auto_409121 ?auto_409126 ) ) ( not ( = ?auto_409121 ?auto_409127 ) ) ( not ( = ?auto_409121 ?auto_409128 ) ) ( not ( = ?auto_409121 ?auto_409129 ) ) ( not ( = ?auto_409122 ?auto_409123 ) ) ( not ( = ?auto_409122 ?auto_409124 ) ) ( not ( = ?auto_409122 ?auto_409125 ) ) ( not ( = ?auto_409122 ?auto_409126 ) ) ( not ( = ?auto_409122 ?auto_409127 ) ) ( not ( = ?auto_409122 ?auto_409128 ) ) ( not ( = ?auto_409122 ?auto_409129 ) ) ( not ( = ?auto_409123 ?auto_409124 ) ) ( not ( = ?auto_409123 ?auto_409125 ) ) ( not ( = ?auto_409123 ?auto_409126 ) ) ( not ( = ?auto_409123 ?auto_409127 ) ) ( not ( = ?auto_409123 ?auto_409128 ) ) ( not ( = ?auto_409123 ?auto_409129 ) ) ( not ( = ?auto_409124 ?auto_409125 ) ) ( not ( = ?auto_409124 ?auto_409126 ) ) ( not ( = ?auto_409124 ?auto_409127 ) ) ( not ( = ?auto_409124 ?auto_409128 ) ) ( not ( = ?auto_409124 ?auto_409129 ) ) ( not ( = ?auto_409125 ?auto_409126 ) ) ( not ( = ?auto_409125 ?auto_409127 ) ) ( not ( = ?auto_409125 ?auto_409128 ) ) ( not ( = ?auto_409125 ?auto_409129 ) ) ( not ( = ?auto_409126 ?auto_409127 ) ) ( not ( = ?auto_409126 ?auto_409128 ) ) ( not ( = ?auto_409126 ?auto_409129 ) ) ( not ( = ?auto_409127 ?auto_409128 ) ) ( not ( = ?auto_409127 ?auto_409129 ) ) ( not ( = ?auto_409128 ?auto_409129 ) ) ( ON ?auto_409127 ?auto_409128 ) ( ON ?auto_409126 ?auto_409127 ) ( ON ?auto_409125 ?auto_409126 ) ( ON ?auto_409124 ?auto_409125 ) ( ON ?auto_409123 ?auto_409124 ) ( ON ?auto_409122 ?auto_409123 ) ( CLEAR ?auto_409120 ) ( ON ?auto_409121 ?auto_409122 ) ( CLEAR ?auto_409121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_409119 ?auto_409120 ?auto_409121 )
      ( MAKE-10PILE ?auto_409119 ?auto_409120 ?auto_409121 ?auto_409122 ?auto_409123 ?auto_409124 ?auto_409125 ?auto_409126 ?auto_409127 ?auto_409128 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409140 - BLOCK
      ?auto_409141 - BLOCK
      ?auto_409142 - BLOCK
      ?auto_409143 - BLOCK
      ?auto_409144 - BLOCK
      ?auto_409145 - BLOCK
      ?auto_409146 - BLOCK
      ?auto_409147 - BLOCK
      ?auto_409148 - BLOCK
      ?auto_409149 - BLOCK
    )
    :vars
    (
      ?auto_409150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409149 ?auto_409150 ) ( ON-TABLE ?auto_409140 ) ( not ( = ?auto_409140 ?auto_409141 ) ) ( not ( = ?auto_409140 ?auto_409142 ) ) ( not ( = ?auto_409140 ?auto_409143 ) ) ( not ( = ?auto_409140 ?auto_409144 ) ) ( not ( = ?auto_409140 ?auto_409145 ) ) ( not ( = ?auto_409140 ?auto_409146 ) ) ( not ( = ?auto_409140 ?auto_409147 ) ) ( not ( = ?auto_409140 ?auto_409148 ) ) ( not ( = ?auto_409140 ?auto_409149 ) ) ( not ( = ?auto_409140 ?auto_409150 ) ) ( not ( = ?auto_409141 ?auto_409142 ) ) ( not ( = ?auto_409141 ?auto_409143 ) ) ( not ( = ?auto_409141 ?auto_409144 ) ) ( not ( = ?auto_409141 ?auto_409145 ) ) ( not ( = ?auto_409141 ?auto_409146 ) ) ( not ( = ?auto_409141 ?auto_409147 ) ) ( not ( = ?auto_409141 ?auto_409148 ) ) ( not ( = ?auto_409141 ?auto_409149 ) ) ( not ( = ?auto_409141 ?auto_409150 ) ) ( not ( = ?auto_409142 ?auto_409143 ) ) ( not ( = ?auto_409142 ?auto_409144 ) ) ( not ( = ?auto_409142 ?auto_409145 ) ) ( not ( = ?auto_409142 ?auto_409146 ) ) ( not ( = ?auto_409142 ?auto_409147 ) ) ( not ( = ?auto_409142 ?auto_409148 ) ) ( not ( = ?auto_409142 ?auto_409149 ) ) ( not ( = ?auto_409142 ?auto_409150 ) ) ( not ( = ?auto_409143 ?auto_409144 ) ) ( not ( = ?auto_409143 ?auto_409145 ) ) ( not ( = ?auto_409143 ?auto_409146 ) ) ( not ( = ?auto_409143 ?auto_409147 ) ) ( not ( = ?auto_409143 ?auto_409148 ) ) ( not ( = ?auto_409143 ?auto_409149 ) ) ( not ( = ?auto_409143 ?auto_409150 ) ) ( not ( = ?auto_409144 ?auto_409145 ) ) ( not ( = ?auto_409144 ?auto_409146 ) ) ( not ( = ?auto_409144 ?auto_409147 ) ) ( not ( = ?auto_409144 ?auto_409148 ) ) ( not ( = ?auto_409144 ?auto_409149 ) ) ( not ( = ?auto_409144 ?auto_409150 ) ) ( not ( = ?auto_409145 ?auto_409146 ) ) ( not ( = ?auto_409145 ?auto_409147 ) ) ( not ( = ?auto_409145 ?auto_409148 ) ) ( not ( = ?auto_409145 ?auto_409149 ) ) ( not ( = ?auto_409145 ?auto_409150 ) ) ( not ( = ?auto_409146 ?auto_409147 ) ) ( not ( = ?auto_409146 ?auto_409148 ) ) ( not ( = ?auto_409146 ?auto_409149 ) ) ( not ( = ?auto_409146 ?auto_409150 ) ) ( not ( = ?auto_409147 ?auto_409148 ) ) ( not ( = ?auto_409147 ?auto_409149 ) ) ( not ( = ?auto_409147 ?auto_409150 ) ) ( not ( = ?auto_409148 ?auto_409149 ) ) ( not ( = ?auto_409148 ?auto_409150 ) ) ( not ( = ?auto_409149 ?auto_409150 ) ) ( ON ?auto_409148 ?auto_409149 ) ( ON ?auto_409147 ?auto_409148 ) ( ON ?auto_409146 ?auto_409147 ) ( ON ?auto_409145 ?auto_409146 ) ( ON ?auto_409144 ?auto_409145 ) ( ON ?auto_409143 ?auto_409144 ) ( ON ?auto_409142 ?auto_409143 ) ( CLEAR ?auto_409140 ) ( ON ?auto_409141 ?auto_409142 ) ( CLEAR ?auto_409141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_409140 ?auto_409141 )
      ( MAKE-10PILE ?auto_409140 ?auto_409141 ?auto_409142 ?auto_409143 ?auto_409144 ?auto_409145 ?auto_409146 ?auto_409147 ?auto_409148 ?auto_409149 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409161 - BLOCK
      ?auto_409162 - BLOCK
      ?auto_409163 - BLOCK
      ?auto_409164 - BLOCK
      ?auto_409165 - BLOCK
      ?auto_409166 - BLOCK
      ?auto_409167 - BLOCK
      ?auto_409168 - BLOCK
      ?auto_409169 - BLOCK
      ?auto_409170 - BLOCK
    )
    :vars
    (
      ?auto_409171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409170 ?auto_409171 ) ( ON-TABLE ?auto_409161 ) ( not ( = ?auto_409161 ?auto_409162 ) ) ( not ( = ?auto_409161 ?auto_409163 ) ) ( not ( = ?auto_409161 ?auto_409164 ) ) ( not ( = ?auto_409161 ?auto_409165 ) ) ( not ( = ?auto_409161 ?auto_409166 ) ) ( not ( = ?auto_409161 ?auto_409167 ) ) ( not ( = ?auto_409161 ?auto_409168 ) ) ( not ( = ?auto_409161 ?auto_409169 ) ) ( not ( = ?auto_409161 ?auto_409170 ) ) ( not ( = ?auto_409161 ?auto_409171 ) ) ( not ( = ?auto_409162 ?auto_409163 ) ) ( not ( = ?auto_409162 ?auto_409164 ) ) ( not ( = ?auto_409162 ?auto_409165 ) ) ( not ( = ?auto_409162 ?auto_409166 ) ) ( not ( = ?auto_409162 ?auto_409167 ) ) ( not ( = ?auto_409162 ?auto_409168 ) ) ( not ( = ?auto_409162 ?auto_409169 ) ) ( not ( = ?auto_409162 ?auto_409170 ) ) ( not ( = ?auto_409162 ?auto_409171 ) ) ( not ( = ?auto_409163 ?auto_409164 ) ) ( not ( = ?auto_409163 ?auto_409165 ) ) ( not ( = ?auto_409163 ?auto_409166 ) ) ( not ( = ?auto_409163 ?auto_409167 ) ) ( not ( = ?auto_409163 ?auto_409168 ) ) ( not ( = ?auto_409163 ?auto_409169 ) ) ( not ( = ?auto_409163 ?auto_409170 ) ) ( not ( = ?auto_409163 ?auto_409171 ) ) ( not ( = ?auto_409164 ?auto_409165 ) ) ( not ( = ?auto_409164 ?auto_409166 ) ) ( not ( = ?auto_409164 ?auto_409167 ) ) ( not ( = ?auto_409164 ?auto_409168 ) ) ( not ( = ?auto_409164 ?auto_409169 ) ) ( not ( = ?auto_409164 ?auto_409170 ) ) ( not ( = ?auto_409164 ?auto_409171 ) ) ( not ( = ?auto_409165 ?auto_409166 ) ) ( not ( = ?auto_409165 ?auto_409167 ) ) ( not ( = ?auto_409165 ?auto_409168 ) ) ( not ( = ?auto_409165 ?auto_409169 ) ) ( not ( = ?auto_409165 ?auto_409170 ) ) ( not ( = ?auto_409165 ?auto_409171 ) ) ( not ( = ?auto_409166 ?auto_409167 ) ) ( not ( = ?auto_409166 ?auto_409168 ) ) ( not ( = ?auto_409166 ?auto_409169 ) ) ( not ( = ?auto_409166 ?auto_409170 ) ) ( not ( = ?auto_409166 ?auto_409171 ) ) ( not ( = ?auto_409167 ?auto_409168 ) ) ( not ( = ?auto_409167 ?auto_409169 ) ) ( not ( = ?auto_409167 ?auto_409170 ) ) ( not ( = ?auto_409167 ?auto_409171 ) ) ( not ( = ?auto_409168 ?auto_409169 ) ) ( not ( = ?auto_409168 ?auto_409170 ) ) ( not ( = ?auto_409168 ?auto_409171 ) ) ( not ( = ?auto_409169 ?auto_409170 ) ) ( not ( = ?auto_409169 ?auto_409171 ) ) ( not ( = ?auto_409170 ?auto_409171 ) ) ( ON ?auto_409169 ?auto_409170 ) ( ON ?auto_409168 ?auto_409169 ) ( ON ?auto_409167 ?auto_409168 ) ( ON ?auto_409166 ?auto_409167 ) ( ON ?auto_409165 ?auto_409166 ) ( ON ?auto_409164 ?auto_409165 ) ( ON ?auto_409163 ?auto_409164 ) ( CLEAR ?auto_409161 ) ( ON ?auto_409162 ?auto_409163 ) ( CLEAR ?auto_409162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_409161 ?auto_409162 )
      ( MAKE-10PILE ?auto_409161 ?auto_409162 ?auto_409163 ?auto_409164 ?auto_409165 ?auto_409166 ?auto_409167 ?auto_409168 ?auto_409169 ?auto_409170 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409182 - BLOCK
      ?auto_409183 - BLOCK
      ?auto_409184 - BLOCK
      ?auto_409185 - BLOCK
      ?auto_409186 - BLOCK
      ?auto_409187 - BLOCK
      ?auto_409188 - BLOCK
      ?auto_409189 - BLOCK
      ?auto_409190 - BLOCK
      ?auto_409191 - BLOCK
    )
    :vars
    (
      ?auto_409192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409191 ?auto_409192 ) ( not ( = ?auto_409182 ?auto_409183 ) ) ( not ( = ?auto_409182 ?auto_409184 ) ) ( not ( = ?auto_409182 ?auto_409185 ) ) ( not ( = ?auto_409182 ?auto_409186 ) ) ( not ( = ?auto_409182 ?auto_409187 ) ) ( not ( = ?auto_409182 ?auto_409188 ) ) ( not ( = ?auto_409182 ?auto_409189 ) ) ( not ( = ?auto_409182 ?auto_409190 ) ) ( not ( = ?auto_409182 ?auto_409191 ) ) ( not ( = ?auto_409182 ?auto_409192 ) ) ( not ( = ?auto_409183 ?auto_409184 ) ) ( not ( = ?auto_409183 ?auto_409185 ) ) ( not ( = ?auto_409183 ?auto_409186 ) ) ( not ( = ?auto_409183 ?auto_409187 ) ) ( not ( = ?auto_409183 ?auto_409188 ) ) ( not ( = ?auto_409183 ?auto_409189 ) ) ( not ( = ?auto_409183 ?auto_409190 ) ) ( not ( = ?auto_409183 ?auto_409191 ) ) ( not ( = ?auto_409183 ?auto_409192 ) ) ( not ( = ?auto_409184 ?auto_409185 ) ) ( not ( = ?auto_409184 ?auto_409186 ) ) ( not ( = ?auto_409184 ?auto_409187 ) ) ( not ( = ?auto_409184 ?auto_409188 ) ) ( not ( = ?auto_409184 ?auto_409189 ) ) ( not ( = ?auto_409184 ?auto_409190 ) ) ( not ( = ?auto_409184 ?auto_409191 ) ) ( not ( = ?auto_409184 ?auto_409192 ) ) ( not ( = ?auto_409185 ?auto_409186 ) ) ( not ( = ?auto_409185 ?auto_409187 ) ) ( not ( = ?auto_409185 ?auto_409188 ) ) ( not ( = ?auto_409185 ?auto_409189 ) ) ( not ( = ?auto_409185 ?auto_409190 ) ) ( not ( = ?auto_409185 ?auto_409191 ) ) ( not ( = ?auto_409185 ?auto_409192 ) ) ( not ( = ?auto_409186 ?auto_409187 ) ) ( not ( = ?auto_409186 ?auto_409188 ) ) ( not ( = ?auto_409186 ?auto_409189 ) ) ( not ( = ?auto_409186 ?auto_409190 ) ) ( not ( = ?auto_409186 ?auto_409191 ) ) ( not ( = ?auto_409186 ?auto_409192 ) ) ( not ( = ?auto_409187 ?auto_409188 ) ) ( not ( = ?auto_409187 ?auto_409189 ) ) ( not ( = ?auto_409187 ?auto_409190 ) ) ( not ( = ?auto_409187 ?auto_409191 ) ) ( not ( = ?auto_409187 ?auto_409192 ) ) ( not ( = ?auto_409188 ?auto_409189 ) ) ( not ( = ?auto_409188 ?auto_409190 ) ) ( not ( = ?auto_409188 ?auto_409191 ) ) ( not ( = ?auto_409188 ?auto_409192 ) ) ( not ( = ?auto_409189 ?auto_409190 ) ) ( not ( = ?auto_409189 ?auto_409191 ) ) ( not ( = ?auto_409189 ?auto_409192 ) ) ( not ( = ?auto_409190 ?auto_409191 ) ) ( not ( = ?auto_409190 ?auto_409192 ) ) ( not ( = ?auto_409191 ?auto_409192 ) ) ( ON ?auto_409190 ?auto_409191 ) ( ON ?auto_409189 ?auto_409190 ) ( ON ?auto_409188 ?auto_409189 ) ( ON ?auto_409187 ?auto_409188 ) ( ON ?auto_409186 ?auto_409187 ) ( ON ?auto_409185 ?auto_409186 ) ( ON ?auto_409184 ?auto_409185 ) ( ON ?auto_409183 ?auto_409184 ) ( ON ?auto_409182 ?auto_409183 ) ( CLEAR ?auto_409182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_409182 )
      ( MAKE-10PILE ?auto_409182 ?auto_409183 ?auto_409184 ?auto_409185 ?auto_409186 ?auto_409187 ?auto_409188 ?auto_409189 ?auto_409190 ?auto_409191 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_409203 - BLOCK
      ?auto_409204 - BLOCK
      ?auto_409205 - BLOCK
      ?auto_409206 - BLOCK
      ?auto_409207 - BLOCK
      ?auto_409208 - BLOCK
      ?auto_409209 - BLOCK
      ?auto_409210 - BLOCK
      ?auto_409211 - BLOCK
      ?auto_409212 - BLOCK
    )
    :vars
    (
      ?auto_409213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409212 ?auto_409213 ) ( not ( = ?auto_409203 ?auto_409204 ) ) ( not ( = ?auto_409203 ?auto_409205 ) ) ( not ( = ?auto_409203 ?auto_409206 ) ) ( not ( = ?auto_409203 ?auto_409207 ) ) ( not ( = ?auto_409203 ?auto_409208 ) ) ( not ( = ?auto_409203 ?auto_409209 ) ) ( not ( = ?auto_409203 ?auto_409210 ) ) ( not ( = ?auto_409203 ?auto_409211 ) ) ( not ( = ?auto_409203 ?auto_409212 ) ) ( not ( = ?auto_409203 ?auto_409213 ) ) ( not ( = ?auto_409204 ?auto_409205 ) ) ( not ( = ?auto_409204 ?auto_409206 ) ) ( not ( = ?auto_409204 ?auto_409207 ) ) ( not ( = ?auto_409204 ?auto_409208 ) ) ( not ( = ?auto_409204 ?auto_409209 ) ) ( not ( = ?auto_409204 ?auto_409210 ) ) ( not ( = ?auto_409204 ?auto_409211 ) ) ( not ( = ?auto_409204 ?auto_409212 ) ) ( not ( = ?auto_409204 ?auto_409213 ) ) ( not ( = ?auto_409205 ?auto_409206 ) ) ( not ( = ?auto_409205 ?auto_409207 ) ) ( not ( = ?auto_409205 ?auto_409208 ) ) ( not ( = ?auto_409205 ?auto_409209 ) ) ( not ( = ?auto_409205 ?auto_409210 ) ) ( not ( = ?auto_409205 ?auto_409211 ) ) ( not ( = ?auto_409205 ?auto_409212 ) ) ( not ( = ?auto_409205 ?auto_409213 ) ) ( not ( = ?auto_409206 ?auto_409207 ) ) ( not ( = ?auto_409206 ?auto_409208 ) ) ( not ( = ?auto_409206 ?auto_409209 ) ) ( not ( = ?auto_409206 ?auto_409210 ) ) ( not ( = ?auto_409206 ?auto_409211 ) ) ( not ( = ?auto_409206 ?auto_409212 ) ) ( not ( = ?auto_409206 ?auto_409213 ) ) ( not ( = ?auto_409207 ?auto_409208 ) ) ( not ( = ?auto_409207 ?auto_409209 ) ) ( not ( = ?auto_409207 ?auto_409210 ) ) ( not ( = ?auto_409207 ?auto_409211 ) ) ( not ( = ?auto_409207 ?auto_409212 ) ) ( not ( = ?auto_409207 ?auto_409213 ) ) ( not ( = ?auto_409208 ?auto_409209 ) ) ( not ( = ?auto_409208 ?auto_409210 ) ) ( not ( = ?auto_409208 ?auto_409211 ) ) ( not ( = ?auto_409208 ?auto_409212 ) ) ( not ( = ?auto_409208 ?auto_409213 ) ) ( not ( = ?auto_409209 ?auto_409210 ) ) ( not ( = ?auto_409209 ?auto_409211 ) ) ( not ( = ?auto_409209 ?auto_409212 ) ) ( not ( = ?auto_409209 ?auto_409213 ) ) ( not ( = ?auto_409210 ?auto_409211 ) ) ( not ( = ?auto_409210 ?auto_409212 ) ) ( not ( = ?auto_409210 ?auto_409213 ) ) ( not ( = ?auto_409211 ?auto_409212 ) ) ( not ( = ?auto_409211 ?auto_409213 ) ) ( not ( = ?auto_409212 ?auto_409213 ) ) ( ON ?auto_409211 ?auto_409212 ) ( ON ?auto_409210 ?auto_409211 ) ( ON ?auto_409209 ?auto_409210 ) ( ON ?auto_409208 ?auto_409209 ) ( ON ?auto_409207 ?auto_409208 ) ( ON ?auto_409206 ?auto_409207 ) ( ON ?auto_409205 ?auto_409206 ) ( ON ?auto_409204 ?auto_409205 ) ( ON ?auto_409203 ?auto_409204 ) ( CLEAR ?auto_409203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_409203 )
      ( MAKE-10PILE ?auto_409203 ?auto_409204 ?auto_409205 ?auto_409206 ?auto_409207 ?auto_409208 ?auto_409209 ?auto_409210 ?auto_409211 ?auto_409212 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409225 - BLOCK
      ?auto_409226 - BLOCK
      ?auto_409227 - BLOCK
      ?auto_409228 - BLOCK
      ?auto_409229 - BLOCK
      ?auto_409230 - BLOCK
      ?auto_409231 - BLOCK
      ?auto_409232 - BLOCK
      ?auto_409233 - BLOCK
      ?auto_409234 - BLOCK
      ?auto_409235 - BLOCK
    )
    :vars
    (
      ?auto_409236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_409234 ) ( ON ?auto_409235 ?auto_409236 ) ( CLEAR ?auto_409235 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_409225 ) ( ON ?auto_409226 ?auto_409225 ) ( ON ?auto_409227 ?auto_409226 ) ( ON ?auto_409228 ?auto_409227 ) ( ON ?auto_409229 ?auto_409228 ) ( ON ?auto_409230 ?auto_409229 ) ( ON ?auto_409231 ?auto_409230 ) ( ON ?auto_409232 ?auto_409231 ) ( ON ?auto_409233 ?auto_409232 ) ( ON ?auto_409234 ?auto_409233 ) ( not ( = ?auto_409225 ?auto_409226 ) ) ( not ( = ?auto_409225 ?auto_409227 ) ) ( not ( = ?auto_409225 ?auto_409228 ) ) ( not ( = ?auto_409225 ?auto_409229 ) ) ( not ( = ?auto_409225 ?auto_409230 ) ) ( not ( = ?auto_409225 ?auto_409231 ) ) ( not ( = ?auto_409225 ?auto_409232 ) ) ( not ( = ?auto_409225 ?auto_409233 ) ) ( not ( = ?auto_409225 ?auto_409234 ) ) ( not ( = ?auto_409225 ?auto_409235 ) ) ( not ( = ?auto_409225 ?auto_409236 ) ) ( not ( = ?auto_409226 ?auto_409227 ) ) ( not ( = ?auto_409226 ?auto_409228 ) ) ( not ( = ?auto_409226 ?auto_409229 ) ) ( not ( = ?auto_409226 ?auto_409230 ) ) ( not ( = ?auto_409226 ?auto_409231 ) ) ( not ( = ?auto_409226 ?auto_409232 ) ) ( not ( = ?auto_409226 ?auto_409233 ) ) ( not ( = ?auto_409226 ?auto_409234 ) ) ( not ( = ?auto_409226 ?auto_409235 ) ) ( not ( = ?auto_409226 ?auto_409236 ) ) ( not ( = ?auto_409227 ?auto_409228 ) ) ( not ( = ?auto_409227 ?auto_409229 ) ) ( not ( = ?auto_409227 ?auto_409230 ) ) ( not ( = ?auto_409227 ?auto_409231 ) ) ( not ( = ?auto_409227 ?auto_409232 ) ) ( not ( = ?auto_409227 ?auto_409233 ) ) ( not ( = ?auto_409227 ?auto_409234 ) ) ( not ( = ?auto_409227 ?auto_409235 ) ) ( not ( = ?auto_409227 ?auto_409236 ) ) ( not ( = ?auto_409228 ?auto_409229 ) ) ( not ( = ?auto_409228 ?auto_409230 ) ) ( not ( = ?auto_409228 ?auto_409231 ) ) ( not ( = ?auto_409228 ?auto_409232 ) ) ( not ( = ?auto_409228 ?auto_409233 ) ) ( not ( = ?auto_409228 ?auto_409234 ) ) ( not ( = ?auto_409228 ?auto_409235 ) ) ( not ( = ?auto_409228 ?auto_409236 ) ) ( not ( = ?auto_409229 ?auto_409230 ) ) ( not ( = ?auto_409229 ?auto_409231 ) ) ( not ( = ?auto_409229 ?auto_409232 ) ) ( not ( = ?auto_409229 ?auto_409233 ) ) ( not ( = ?auto_409229 ?auto_409234 ) ) ( not ( = ?auto_409229 ?auto_409235 ) ) ( not ( = ?auto_409229 ?auto_409236 ) ) ( not ( = ?auto_409230 ?auto_409231 ) ) ( not ( = ?auto_409230 ?auto_409232 ) ) ( not ( = ?auto_409230 ?auto_409233 ) ) ( not ( = ?auto_409230 ?auto_409234 ) ) ( not ( = ?auto_409230 ?auto_409235 ) ) ( not ( = ?auto_409230 ?auto_409236 ) ) ( not ( = ?auto_409231 ?auto_409232 ) ) ( not ( = ?auto_409231 ?auto_409233 ) ) ( not ( = ?auto_409231 ?auto_409234 ) ) ( not ( = ?auto_409231 ?auto_409235 ) ) ( not ( = ?auto_409231 ?auto_409236 ) ) ( not ( = ?auto_409232 ?auto_409233 ) ) ( not ( = ?auto_409232 ?auto_409234 ) ) ( not ( = ?auto_409232 ?auto_409235 ) ) ( not ( = ?auto_409232 ?auto_409236 ) ) ( not ( = ?auto_409233 ?auto_409234 ) ) ( not ( = ?auto_409233 ?auto_409235 ) ) ( not ( = ?auto_409233 ?auto_409236 ) ) ( not ( = ?auto_409234 ?auto_409235 ) ) ( not ( = ?auto_409234 ?auto_409236 ) ) ( not ( = ?auto_409235 ?auto_409236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_409235 ?auto_409236 )
      ( !STACK ?auto_409235 ?auto_409234 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409248 - BLOCK
      ?auto_409249 - BLOCK
      ?auto_409250 - BLOCK
      ?auto_409251 - BLOCK
      ?auto_409252 - BLOCK
      ?auto_409253 - BLOCK
      ?auto_409254 - BLOCK
      ?auto_409255 - BLOCK
      ?auto_409256 - BLOCK
      ?auto_409257 - BLOCK
      ?auto_409258 - BLOCK
    )
    :vars
    (
      ?auto_409259 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_409257 ) ( ON ?auto_409258 ?auto_409259 ) ( CLEAR ?auto_409258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_409248 ) ( ON ?auto_409249 ?auto_409248 ) ( ON ?auto_409250 ?auto_409249 ) ( ON ?auto_409251 ?auto_409250 ) ( ON ?auto_409252 ?auto_409251 ) ( ON ?auto_409253 ?auto_409252 ) ( ON ?auto_409254 ?auto_409253 ) ( ON ?auto_409255 ?auto_409254 ) ( ON ?auto_409256 ?auto_409255 ) ( ON ?auto_409257 ?auto_409256 ) ( not ( = ?auto_409248 ?auto_409249 ) ) ( not ( = ?auto_409248 ?auto_409250 ) ) ( not ( = ?auto_409248 ?auto_409251 ) ) ( not ( = ?auto_409248 ?auto_409252 ) ) ( not ( = ?auto_409248 ?auto_409253 ) ) ( not ( = ?auto_409248 ?auto_409254 ) ) ( not ( = ?auto_409248 ?auto_409255 ) ) ( not ( = ?auto_409248 ?auto_409256 ) ) ( not ( = ?auto_409248 ?auto_409257 ) ) ( not ( = ?auto_409248 ?auto_409258 ) ) ( not ( = ?auto_409248 ?auto_409259 ) ) ( not ( = ?auto_409249 ?auto_409250 ) ) ( not ( = ?auto_409249 ?auto_409251 ) ) ( not ( = ?auto_409249 ?auto_409252 ) ) ( not ( = ?auto_409249 ?auto_409253 ) ) ( not ( = ?auto_409249 ?auto_409254 ) ) ( not ( = ?auto_409249 ?auto_409255 ) ) ( not ( = ?auto_409249 ?auto_409256 ) ) ( not ( = ?auto_409249 ?auto_409257 ) ) ( not ( = ?auto_409249 ?auto_409258 ) ) ( not ( = ?auto_409249 ?auto_409259 ) ) ( not ( = ?auto_409250 ?auto_409251 ) ) ( not ( = ?auto_409250 ?auto_409252 ) ) ( not ( = ?auto_409250 ?auto_409253 ) ) ( not ( = ?auto_409250 ?auto_409254 ) ) ( not ( = ?auto_409250 ?auto_409255 ) ) ( not ( = ?auto_409250 ?auto_409256 ) ) ( not ( = ?auto_409250 ?auto_409257 ) ) ( not ( = ?auto_409250 ?auto_409258 ) ) ( not ( = ?auto_409250 ?auto_409259 ) ) ( not ( = ?auto_409251 ?auto_409252 ) ) ( not ( = ?auto_409251 ?auto_409253 ) ) ( not ( = ?auto_409251 ?auto_409254 ) ) ( not ( = ?auto_409251 ?auto_409255 ) ) ( not ( = ?auto_409251 ?auto_409256 ) ) ( not ( = ?auto_409251 ?auto_409257 ) ) ( not ( = ?auto_409251 ?auto_409258 ) ) ( not ( = ?auto_409251 ?auto_409259 ) ) ( not ( = ?auto_409252 ?auto_409253 ) ) ( not ( = ?auto_409252 ?auto_409254 ) ) ( not ( = ?auto_409252 ?auto_409255 ) ) ( not ( = ?auto_409252 ?auto_409256 ) ) ( not ( = ?auto_409252 ?auto_409257 ) ) ( not ( = ?auto_409252 ?auto_409258 ) ) ( not ( = ?auto_409252 ?auto_409259 ) ) ( not ( = ?auto_409253 ?auto_409254 ) ) ( not ( = ?auto_409253 ?auto_409255 ) ) ( not ( = ?auto_409253 ?auto_409256 ) ) ( not ( = ?auto_409253 ?auto_409257 ) ) ( not ( = ?auto_409253 ?auto_409258 ) ) ( not ( = ?auto_409253 ?auto_409259 ) ) ( not ( = ?auto_409254 ?auto_409255 ) ) ( not ( = ?auto_409254 ?auto_409256 ) ) ( not ( = ?auto_409254 ?auto_409257 ) ) ( not ( = ?auto_409254 ?auto_409258 ) ) ( not ( = ?auto_409254 ?auto_409259 ) ) ( not ( = ?auto_409255 ?auto_409256 ) ) ( not ( = ?auto_409255 ?auto_409257 ) ) ( not ( = ?auto_409255 ?auto_409258 ) ) ( not ( = ?auto_409255 ?auto_409259 ) ) ( not ( = ?auto_409256 ?auto_409257 ) ) ( not ( = ?auto_409256 ?auto_409258 ) ) ( not ( = ?auto_409256 ?auto_409259 ) ) ( not ( = ?auto_409257 ?auto_409258 ) ) ( not ( = ?auto_409257 ?auto_409259 ) ) ( not ( = ?auto_409258 ?auto_409259 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_409258 ?auto_409259 )
      ( !STACK ?auto_409258 ?auto_409257 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409271 - BLOCK
      ?auto_409272 - BLOCK
      ?auto_409273 - BLOCK
      ?auto_409274 - BLOCK
      ?auto_409275 - BLOCK
      ?auto_409276 - BLOCK
      ?auto_409277 - BLOCK
      ?auto_409278 - BLOCK
      ?auto_409279 - BLOCK
      ?auto_409280 - BLOCK
      ?auto_409281 - BLOCK
    )
    :vars
    (
      ?auto_409282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409281 ?auto_409282 ) ( ON-TABLE ?auto_409271 ) ( ON ?auto_409272 ?auto_409271 ) ( ON ?auto_409273 ?auto_409272 ) ( ON ?auto_409274 ?auto_409273 ) ( ON ?auto_409275 ?auto_409274 ) ( ON ?auto_409276 ?auto_409275 ) ( ON ?auto_409277 ?auto_409276 ) ( ON ?auto_409278 ?auto_409277 ) ( ON ?auto_409279 ?auto_409278 ) ( not ( = ?auto_409271 ?auto_409272 ) ) ( not ( = ?auto_409271 ?auto_409273 ) ) ( not ( = ?auto_409271 ?auto_409274 ) ) ( not ( = ?auto_409271 ?auto_409275 ) ) ( not ( = ?auto_409271 ?auto_409276 ) ) ( not ( = ?auto_409271 ?auto_409277 ) ) ( not ( = ?auto_409271 ?auto_409278 ) ) ( not ( = ?auto_409271 ?auto_409279 ) ) ( not ( = ?auto_409271 ?auto_409280 ) ) ( not ( = ?auto_409271 ?auto_409281 ) ) ( not ( = ?auto_409271 ?auto_409282 ) ) ( not ( = ?auto_409272 ?auto_409273 ) ) ( not ( = ?auto_409272 ?auto_409274 ) ) ( not ( = ?auto_409272 ?auto_409275 ) ) ( not ( = ?auto_409272 ?auto_409276 ) ) ( not ( = ?auto_409272 ?auto_409277 ) ) ( not ( = ?auto_409272 ?auto_409278 ) ) ( not ( = ?auto_409272 ?auto_409279 ) ) ( not ( = ?auto_409272 ?auto_409280 ) ) ( not ( = ?auto_409272 ?auto_409281 ) ) ( not ( = ?auto_409272 ?auto_409282 ) ) ( not ( = ?auto_409273 ?auto_409274 ) ) ( not ( = ?auto_409273 ?auto_409275 ) ) ( not ( = ?auto_409273 ?auto_409276 ) ) ( not ( = ?auto_409273 ?auto_409277 ) ) ( not ( = ?auto_409273 ?auto_409278 ) ) ( not ( = ?auto_409273 ?auto_409279 ) ) ( not ( = ?auto_409273 ?auto_409280 ) ) ( not ( = ?auto_409273 ?auto_409281 ) ) ( not ( = ?auto_409273 ?auto_409282 ) ) ( not ( = ?auto_409274 ?auto_409275 ) ) ( not ( = ?auto_409274 ?auto_409276 ) ) ( not ( = ?auto_409274 ?auto_409277 ) ) ( not ( = ?auto_409274 ?auto_409278 ) ) ( not ( = ?auto_409274 ?auto_409279 ) ) ( not ( = ?auto_409274 ?auto_409280 ) ) ( not ( = ?auto_409274 ?auto_409281 ) ) ( not ( = ?auto_409274 ?auto_409282 ) ) ( not ( = ?auto_409275 ?auto_409276 ) ) ( not ( = ?auto_409275 ?auto_409277 ) ) ( not ( = ?auto_409275 ?auto_409278 ) ) ( not ( = ?auto_409275 ?auto_409279 ) ) ( not ( = ?auto_409275 ?auto_409280 ) ) ( not ( = ?auto_409275 ?auto_409281 ) ) ( not ( = ?auto_409275 ?auto_409282 ) ) ( not ( = ?auto_409276 ?auto_409277 ) ) ( not ( = ?auto_409276 ?auto_409278 ) ) ( not ( = ?auto_409276 ?auto_409279 ) ) ( not ( = ?auto_409276 ?auto_409280 ) ) ( not ( = ?auto_409276 ?auto_409281 ) ) ( not ( = ?auto_409276 ?auto_409282 ) ) ( not ( = ?auto_409277 ?auto_409278 ) ) ( not ( = ?auto_409277 ?auto_409279 ) ) ( not ( = ?auto_409277 ?auto_409280 ) ) ( not ( = ?auto_409277 ?auto_409281 ) ) ( not ( = ?auto_409277 ?auto_409282 ) ) ( not ( = ?auto_409278 ?auto_409279 ) ) ( not ( = ?auto_409278 ?auto_409280 ) ) ( not ( = ?auto_409278 ?auto_409281 ) ) ( not ( = ?auto_409278 ?auto_409282 ) ) ( not ( = ?auto_409279 ?auto_409280 ) ) ( not ( = ?auto_409279 ?auto_409281 ) ) ( not ( = ?auto_409279 ?auto_409282 ) ) ( not ( = ?auto_409280 ?auto_409281 ) ) ( not ( = ?auto_409280 ?auto_409282 ) ) ( not ( = ?auto_409281 ?auto_409282 ) ) ( CLEAR ?auto_409279 ) ( ON ?auto_409280 ?auto_409281 ) ( CLEAR ?auto_409280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_409271 ?auto_409272 ?auto_409273 ?auto_409274 ?auto_409275 ?auto_409276 ?auto_409277 ?auto_409278 ?auto_409279 ?auto_409280 )
      ( MAKE-11PILE ?auto_409271 ?auto_409272 ?auto_409273 ?auto_409274 ?auto_409275 ?auto_409276 ?auto_409277 ?auto_409278 ?auto_409279 ?auto_409280 ?auto_409281 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409294 - BLOCK
      ?auto_409295 - BLOCK
      ?auto_409296 - BLOCK
      ?auto_409297 - BLOCK
      ?auto_409298 - BLOCK
      ?auto_409299 - BLOCK
      ?auto_409300 - BLOCK
      ?auto_409301 - BLOCK
      ?auto_409302 - BLOCK
      ?auto_409303 - BLOCK
      ?auto_409304 - BLOCK
    )
    :vars
    (
      ?auto_409305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409304 ?auto_409305 ) ( ON-TABLE ?auto_409294 ) ( ON ?auto_409295 ?auto_409294 ) ( ON ?auto_409296 ?auto_409295 ) ( ON ?auto_409297 ?auto_409296 ) ( ON ?auto_409298 ?auto_409297 ) ( ON ?auto_409299 ?auto_409298 ) ( ON ?auto_409300 ?auto_409299 ) ( ON ?auto_409301 ?auto_409300 ) ( ON ?auto_409302 ?auto_409301 ) ( not ( = ?auto_409294 ?auto_409295 ) ) ( not ( = ?auto_409294 ?auto_409296 ) ) ( not ( = ?auto_409294 ?auto_409297 ) ) ( not ( = ?auto_409294 ?auto_409298 ) ) ( not ( = ?auto_409294 ?auto_409299 ) ) ( not ( = ?auto_409294 ?auto_409300 ) ) ( not ( = ?auto_409294 ?auto_409301 ) ) ( not ( = ?auto_409294 ?auto_409302 ) ) ( not ( = ?auto_409294 ?auto_409303 ) ) ( not ( = ?auto_409294 ?auto_409304 ) ) ( not ( = ?auto_409294 ?auto_409305 ) ) ( not ( = ?auto_409295 ?auto_409296 ) ) ( not ( = ?auto_409295 ?auto_409297 ) ) ( not ( = ?auto_409295 ?auto_409298 ) ) ( not ( = ?auto_409295 ?auto_409299 ) ) ( not ( = ?auto_409295 ?auto_409300 ) ) ( not ( = ?auto_409295 ?auto_409301 ) ) ( not ( = ?auto_409295 ?auto_409302 ) ) ( not ( = ?auto_409295 ?auto_409303 ) ) ( not ( = ?auto_409295 ?auto_409304 ) ) ( not ( = ?auto_409295 ?auto_409305 ) ) ( not ( = ?auto_409296 ?auto_409297 ) ) ( not ( = ?auto_409296 ?auto_409298 ) ) ( not ( = ?auto_409296 ?auto_409299 ) ) ( not ( = ?auto_409296 ?auto_409300 ) ) ( not ( = ?auto_409296 ?auto_409301 ) ) ( not ( = ?auto_409296 ?auto_409302 ) ) ( not ( = ?auto_409296 ?auto_409303 ) ) ( not ( = ?auto_409296 ?auto_409304 ) ) ( not ( = ?auto_409296 ?auto_409305 ) ) ( not ( = ?auto_409297 ?auto_409298 ) ) ( not ( = ?auto_409297 ?auto_409299 ) ) ( not ( = ?auto_409297 ?auto_409300 ) ) ( not ( = ?auto_409297 ?auto_409301 ) ) ( not ( = ?auto_409297 ?auto_409302 ) ) ( not ( = ?auto_409297 ?auto_409303 ) ) ( not ( = ?auto_409297 ?auto_409304 ) ) ( not ( = ?auto_409297 ?auto_409305 ) ) ( not ( = ?auto_409298 ?auto_409299 ) ) ( not ( = ?auto_409298 ?auto_409300 ) ) ( not ( = ?auto_409298 ?auto_409301 ) ) ( not ( = ?auto_409298 ?auto_409302 ) ) ( not ( = ?auto_409298 ?auto_409303 ) ) ( not ( = ?auto_409298 ?auto_409304 ) ) ( not ( = ?auto_409298 ?auto_409305 ) ) ( not ( = ?auto_409299 ?auto_409300 ) ) ( not ( = ?auto_409299 ?auto_409301 ) ) ( not ( = ?auto_409299 ?auto_409302 ) ) ( not ( = ?auto_409299 ?auto_409303 ) ) ( not ( = ?auto_409299 ?auto_409304 ) ) ( not ( = ?auto_409299 ?auto_409305 ) ) ( not ( = ?auto_409300 ?auto_409301 ) ) ( not ( = ?auto_409300 ?auto_409302 ) ) ( not ( = ?auto_409300 ?auto_409303 ) ) ( not ( = ?auto_409300 ?auto_409304 ) ) ( not ( = ?auto_409300 ?auto_409305 ) ) ( not ( = ?auto_409301 ?auto_409302 ) ) ( not ( = ?auto_409301 ?auto_409303 ) ) ( not ( = ?auto_409301 ?auto_409304 ) ) ( not ( = ?auto_409301 ?auto_409305 ) ) ( not ( = ?auto_409302 ?auto_409303 ) ) ( not ( = ?auto_409302 ?auto_409304 ) ) ( not ( = ?auto_409302 ?auto_409305 ) ) ( not ( = ?auto_409303 ?auto_409304 ) ) ( not ( = ?auto_409303 ?auto_409305 ) ) ( not ( = ?auto_409304 ?auto_409305 ) ) ( CLEAR ?auto_409302 ) ( ON ?auto_409303 ?auto_409304 ) ( CLEAR ?auto_409303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_409294 ?auto_409295 ?auto_409296 ?auto_409297 ?auto_409298 ?auto_409299 ?auto_409300 ?auto_409301 ?auto_409302 ?auto_409303 )
      ( MAKE-11PILE ?auto_409294 ?auto_409295 ?auto_409296 ?auto_409297 ?auto_409298 ?auto_409299 ?auto_409300 ?auto_409301 ?auto_409302 ?auto_409303 ?auto_409304 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409317 - BLOCK
      ?auto_409318 - BLOCK
      ?auto_409319 - BLOCK
      ?auto_409320 - BLOCK
      ?auto_409321 - BLOCK
      ?auto_409322 - BLOCK
      ?auto_409323 - BLOCK
      ?auto_409324 - BLOCK
      ?auto_409325 - BLOCK
      ?auto_409326 - BLOCK
      ?auto_409327 - BLOCK
    )
    :vars
    (
      ?auto_409328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409327 ?auto_409328 ) ( ON-TABLE ?auto_409317 ) ( ON ?auto_409318 ?auto_409317 ) ( ON ?auto_409319 ?auto_409318 ) ( ON ?auto_409320 ?auto_409319 ) ( ON ?auto_409321 ?auto_409320 ) ( ON ?auto_409322 ?auto_409321 ) ( ON ?auto_409323 ?auto_409322 ) ( ON ?auto_409324 ?auto_409323 ) ( not ( = ?auto_409317 ?auto_409318 ) ) ( not ( = ?auto_409317 ?auto_409319 ) ) ( not ( = ?auto_409317 ?auto_409320 ) ) ( not ( = ?auto_409317 ?auto_409321 ) ) ( not ( = ?auto_409317 ?auto_409322 ) ) ( not ( = ?auto_409317 ?auto_409323 ) ) ( not ( = ?auto_409317 ?auto_409324 ) ) ( not ( = ?auto_409317 ?auto_409325 ) ) ( not ( = ?auto_409317 ?auto_409326 ) ) ( not ( = ?auto_409317 ?auto_409327 ) ) ( not ( = ?auto_409317 ?auto_409328 ) ) ( not ( = ?auto_409318 ?auto_409319 ) ) ( not ( = ?auto_409318 ?auto_409320 ) ) ( not ( = ?auto_409318 ?auto_409321 ) ) ( not ( = ?auto_409318 ?auto_409322 ) ) ( not ( = ?auto_409318 ?auto_409323 ) ) ( not ( = ?auto_409318 ?auto_409324 ) ) ( not ( = ?auto_409318 ?auto_409325 ) ) ( not ( = ?auto_409318 ?auto_409326 ) ) ( not ( = ?auto_409318 ?auto_409327 ) ) ( not ( = ?auto_409318 ?auto_409328 ) ) ( not ( = ?auto_409319 ?auto_409320 ) ) ( not ( = ?auto_409319 ?auto_409321 ) ) ( not ( = ?auto_409319 ?auto_409322 ) ) ( not ( = ?auto_409319 ?auto_409323 ) ) ( not ( = ?auto_409319 ?auto_409324 ) ) ( not ( = ?auto_409319 ?auto_409325 ) ) ( not ( = ?auto_409319 ?auto_409326 ) ) ( not ( = ?auto_409319 ?auto_409327 ) ) ( not ( = ?auto_409319 ?auto_409328 ) ) ( not ( = ?auto_409320 ?auto_409321 ) ) ( not ( = ?auto_409320 ?auto_409322 ) ) ( not ( = ?auto_409320 ?auto_409323 ) ) ( not ( = ?auto_409320 ?auto_409324 ) ) ( not ( = ?auto_409320 ?auto_409325 ) ) ( not ( = ?auto_409320 ?auto_409326 ) ) ( not ( = ?auto_409320 ?auto_409327 ) ) ( not ( = ?auto_409320 ?auto_409328 ) ) ( not ( = ?auto_409321 ?auto_409322 ) ) ( not ( = ?auto_409321 ?auto_409323 ) ) ( not ( = ?auto_409321 ?auto_409324 ) ) ( not ( = ?auto_409321 ?auto_409325 ) ) ( not ( = ?auto_409321 ?auto_409326 ) ) ( not ( = ?auto_409321 ?auto_409327 ) ) ( not ( = ?auto_409321 ?auto_409328 ) ) ( not ( = ?auto_409322 ?auto_409323 ) ) ( not ( = ?auto_409322 ?auto_409324 ) ) ( not ( = ?auto_409322 ?auto_409325 ) ) ( not ( = ?auto_409322 ?auto_409326 ) ) ( not ( = ?auto_409322 ?auto_409327 ) ) ( not ( = ?auto_409322 ?auto_409328 ) ) ( not ( = ?auto_409323 ?auto_409324 ) ) ( not ( = ?auto_409323 ?auto_409325 ) ) ( not ( = ?auto_409323 ?auto_409326 ) ) ( not ( = ?auto_409323 ?auto_409327 ) ) ( not ( = ?auto_409323 ?auto_409328 ) ) ( not ( = ?auto_409324 ?auto_409325 ) ) ( not ( = ?auto_409324 ?auto_409326 ) ) ( not ( = ?auto_409324 ?auto_409327 ) ) ( not ( = ?auto_409324 ?auto_409328 ) ) ( not ( = ?auto_409325 ?auto_409326 ) ) ( not ( = ?auto_409325 ?auto_409327 ) ) ( not ( = ?auto_409325 ?auto_409328 ) ) ( not ( = ?auto_409326 ?auto_409327 ) ) ( not ( = ?auto_409326 ?auto_409328 ) ) ( not ( = ?auto_409327 ?auto_409328 ) ) ( ON ?auto_409326 ?auto_409327 ) ( CLEAR ?auto_409324 ) ( ON ?auto_409325 ?auto_409326 ) ( CLEAR ?auto_409325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_409317 ?auto_409318 ?auto_409319 ?auto_409320 ?auto_409321 ?auto_409322 ?auto_409323 ?auto_409324 ?auto_409325 )
      ( MAKE-11PILE ?auto_409317 ?auto_409318 ?auto_409319 ?auto_409320 ?auto_409321 ?auto_409322 ?auto_409323 ?auto_409324 ?auto_409325 ?auto_409326 ?auto_409327 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409340 - BLOCK
      ?auto_409341 - BLOCK
      ?auto_409342 - BLOCK
      ?auto_409343 - BLOCK
      ?auto_409344 - BLOCK
      ?auto_409345 - BLOCK
      ?auto_409346 - BLOCK
      ?auto_409347 - BLOCK
      ?auto_409348 - BLOCK
      ?auto_409349 - BLOCK
      ?auto_409350 - BLOCK
    )
    :vars
    (
      ?auto_409351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409350 ?auto_409351 ) ( ON-TABLE ?auto_409340 ) ( ON ?auto_409341 ?auto_409340 ) ( ON ?auto_409342 ?auto_409341 ) ( ON ?auto_409343 ?auto_409342 ) ( ON ?auto_409344 ?auto_409343 ) ( ON ?auto_409345 ?auto_409344 ) ( ON ?auto_409346 ?auto_409345 ) ( ON ?auto_409347 ?auto_409346 ) ( not ( = ?auto_409340 ?auto_409341 ) ) ( not ( = ?auto_409340 ?auto_409342 ) ) ( not ( = ?auto_409340 ?auto_409343 ) ) ( not ( = ?auto_409340 ?auto_409344 ) ) ( not ( = ?auto_409340 ?auto_409345 ) ) ( not ( = ?auto_409340 ?auto_409346 ) ) ( not ( = ?auto_409340 ?auto_409347 ) ) ( not ( = ?auto_409340 ?auto_409348 ) ) ( not ( = ?auto_409340 ?auto_409349 ) ) ( not ( = ?auto_409340 ?auto_409350 ) ) ( not ( = ?auto_409340 ?auto_409351 ) ) ( not ( = ?auto_409341 ?auto_409342 ) ) ( not ( = ?auto_409341 ?auto_409343 ) ) ( not ( = ?auto_409341 ?auto_409344 ) ) ( not ( = ?auto_409341 ?auto_409345 ) ) ( not ( = ?auto_409341 ?auto_409346 ) ) ( not ( = ?auto_409341 ?auto_409347 ) ) ( not ( = ?auto_409341 ?auto_409348 ) ) ( not ( = ?auto_409341 ?auto_409349 ) ) ( not ( = ?auto_409341 ?auto_409350 ) ) ( not ( = ?auto_409341 ?auto_409351 ) ) ( not ( = ?auto_409342 ?auto_409343 ) ) ( not ( = ?auto_409342 ?auto_409344 ) ) ( not ( = ?auto_409342 ?auto_409345 ) ) ( not ( = ?auto_409342 ?auto_409346 ) ) ( not ( = ?auto_409342 ?auto_409347 ) ) ( not ( = ?auto_409342 ?auto_409348 ) ) ( not ( = ?auto_409342 ?auto_409349 ) ) ( not ( = ?auto_409342 ?auto_409350 ) ) ( not ( = ?auto_409342 ?auto_409351 ) ) ( not ( = ?auto_409343 ?auto_409344 ) ) ( not ( = ?auto_409343 ?auto_409345 ) ) ( not ( = ?auto_409343 ?auto_409346 ) ) ( not ( = ?auto_409343 ?auto_409347 ) ) ( not ( = ?auto_409343 ?auto_409348 ) ) ( not ( = ?auto_409343 ?auto_409349 ) ) ( not ( = ?auto_409343 ?auto_409350 ) ) ( not ( = ?auto_409343 ?auto_409351 ) ) ( not ( = ?auto_409344 ?auto_409345 ) ) ( not ( = ?auto_409344 ?auto_409346 ) ) ( not ( = ?auto_409344 ?auto_409347 ) ) ( not ( = ?auto_409344 ?auto_409348 ) ) ( not ( = ?auto_409344 ?auto_409349 ) ) ( not ( = ?auto_409344 ?auto_409350 ) ) ( not ( = ?auto_409344 ?auto_409351 ) ) ( not ( = ?auto_409345 ?auto_409346 ) ) ( not ( = ?auto_409345 ?auto_409347 ) ) ( not ( = ?auto_409345 ?auto_409348 ) ) ( not ( = ?auto_409345 ?auto_409349 ) ) ( not ( = ?auto_409345 ?auto_409350 ) ) ( not ( = ?auto_409345 ?auto_409351 ) ) ( not ( = ?auto_409346 ?auto_409347 ) ) ( not ( = ?auto_409346 ?auto_409348 ) ) ( not ( = ?auto_409346 ?auto_409349 ) ) ( not ( = ?auto_409346 ?auto_409350 ) ) ( not ( = ?auto_409346 ?auto_409351 ) ) ( not ( = ?auto_409347 ?auto_409348 ) ) ( not ( = ?auto_409347 ?auto_409349 ) ) ( not ( = ?auto_409347 ?auto_409350 ) ) ( not ( = ?auto_409347 ?auto_409351 ) ) ( not ( = ?auto_409348 ?auto_409349 ) ) ( not ( = ?auto_409348 ?auto_409350 ) ) ( not ( = ?auto_409348 ?auto_409351 ) ) ( not ( = ?auto_409349 ?auto_409350 ) ) ( not ( = ?auto_409349 ?auto_409351 ) ) ( not ( = ?auto_409350 ?auto_409351 ) ) ( ON ?auto_409349 ?auto_409350 ) ( CLEAR ?auto_409347 ) ( ON ?auto_409348 ?auto_409349 ) ( CLEAR ?auto_409348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_409340 ?auto_409341 ?auto_409342 ?auto_409343 ?auto_409344 ?auto_409345 ?auto_409346 ?auto_409347 ?auto_409348 )
      ( MAKE-11PILE ?auto_409340 ?auto_409341 ?auto_409342 ?auto_409343 ?auto_409344 ?auto_409345 ?auto_409346 ?auto_409347 ?auto_409348 ?auto_409349 ?auto_409350 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409363 - BLOCK
      ?auto_409364 - BLOCK
      ?auto_409365 - BLOCK
      ?auto_409366 - BLOCK
      ?auto_409367 - BLOCK
      ?auto_409368 - BLOCK
      ?auto_409369 - BLOCK
      ?auto_409370 - BLOCK
      ?auto_409371 - BLOCK
      ?auto_409372 - BLOCK
      ?auto_409373 - BLOCK
    )
    :vars
    (
      ?auto_409374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409373 ?auto_409374 ) ( ON-TABLE ?auto_409363 ) ( ON ?auto_409364 ?auto_409363 ) ( ON ?auto_409365 ?auto_409364 ) ( ON ?auto_409366 ?auto_409365 ) ( ON ?auto_409367 ?auto_409366 ) ( ON ?auto_409368 ?auto_409367 ) ( ON ?auto_409369 ?auto_409368 ) ( not ( = ?auto_409363 ?auto_409364 ) ) ( not ( = ?auto_409363 ?auto_409365 ) ) ( not ( = ?auto_409363 ?auto_409366 ) ) ( not ( = ?auto_409363 ?auto_409367 ) ) ( not ( = ?auto_409363 ?auto_409368 ) ) ( not ( = ?auto_409363 ?auto_409369 ) ) ( not ( = ?auto_409363 ?auto_409370 ) ) ( not ( = ?auto_409363 ?auto_409371 ) ) ( not ( = ?auto_409363 ?auto_409372 ) ) ( not ( = ?auto_409363 ?auto_409373 ) ) ( not ( = ?auto_409363 ?auto_409374 ) ) ( not ( = ?auto_409364 ?auto_409365 ) ) ( not ( = ?auto_409364 ?auto_409366 ) ) ( not ( = ?auto_409364 ?auto_409367 ) ) ( not ( = ?auto_409364 ?auto_409368 ) ) ( not ( = ?auto_409364 ?auto_409369 ) ) ( not ( = ?auto_409364 ?auto_409370 ) ) ( not ( = ?auto_409364 ?auto_409371 ) ) ( not ( = ?auto_409364 ?auto_409372 ) ) ( not ( = ?auto_409364 ?auto_409373 ) ) ( not ( = ?auto_409364 ?auto_409374 ) ) ( not ( = ?auto_409365 ?auto_409366 ) ) ( not ( = ?auto_409365 ?auto_409367 ) ) ( not ( = ?auto_409365 ?auto_409368 ) ) ( not ( = ?auto_409365 ?auto_409369 ) ) ( not ( = ?auto_409365 ?auto_409370 ) ) ( not ( = ?auto_409365 ?auto_409371 ) ) ( not ( = ?auto_409365 ?auto_409372 ) ) ( not ( = ?auto_409365 ?auto_409373 ) ) ( not ( = ?auto_409365 ?auto_409374 ) ) ( not ( = ?auto_409366 ?auto_409367 ) ) ( not ( = ?auto_409366 ?auto_409368 ) ) ( not ( = ?auto_409366 ?auto_409369 ) ) ( not ( = ?auto_409366 ?auto_409370 ) ) ( not ( = ?auto_409366 ?auto_409371 ) ) ( not ( = ?auto_409366 ?auto_409372 ) ) ( not ( = ?auto_409366 ?auto_409373 ) ) ( not ( = ?auto_409366 ?auto_409374 ) ) ( not ( = ?auto_409367 ?auto_409368 ) ) ( not ( = ?auto_409367 ?auto_409369 ) ) ( not ( = ?auto_409367 ?auto_409370 ) ) ( not ( = ?auto_409367 ?auto_409371 ) ) ( not ( = ?auto_409367 ?auto_409372 ) ) ( not ( = ?auto_409367 ?auto_409373 ) ) ( not ( = ?auto_409367 ?auto_409374 ) ) ( not ( = ?auto_409368 ?auto_409369 ) ) ( not ( = ?auto_409368 ?auto_409370 ) ) ( not ( = ?auto_409368 ?auto_409371 ) ) ( not ( = ?auto_409368 ?auto_409372 ) ) ( not ( = ?auto_409368 ?auto_409373 ) ) ( not ( = ?auto_409368 ?auto_409374 ) ) ( not ( = ?auto_409369 ?auto_409370 ) ) ( not ( = ?auto_409369 ?auto_409371 ) ) ( not ( = ?auto_409369 ?auto_409372 ) ) ( not ( = ?auto_409369 ?auto_409373 ) ) ( not ( = ?auto_409369 ?auto_409374 ) ) ( not ( = ?auto_409370 ?auto_409371 ) ) ( not ( = ?auto_409370 ?auto_409372 ) ) ( not ( = ?auto_409370 ?auto_409373 ) ) ( not ( = ?auto_409370 ?auto_409374 ) ) ( not ( = ?auto_409371 ?auto_409372 ) ) ( not ( = ?auto_409371 ?auto_409373 ) ) ( not ( = ?auto_409371 ?auto_409374 ) ) ( not ( = ?auto_409372 ?auto_409373 ) ) ( not ( = ?auto_409372 ?auto_409374 ) ) ( not ( = ?auto_409373 ?auto_409374 ) ) ( ON ?auto_409372 ?auto_409373 ) ( ON ?auto_409371 ?auto_409372 ) ( CLEAR ?auto_409369 ) ( ON ?auto_409370 ?auto_409371 ) ( CLEAR ?auto_409370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_409363 ?auto_409364 ?auto_409365 ?auto_409366 ?auto_409367 ?auto_409368 ?auto_409369 ?auto_409370 )
      ( MAKE-11PILE ?auto_409363 ?auto_409364 ?auto_409365 ?auto_409366 ?auto_409367 ?auto_409368 ?auto_409369 ?auto_409370 ?auto_409371 ?auto_409372 ?auto_409373 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409386 - BLOCK
      ?auto_409387 - BLOCK
      ?auto_409388 - BLOCK
      ?auto_409389 - BLOCK
      ?auto_409390 - BLOCK
      ?auto_409391 - BLOCK
      ?auto_409392 - BLOCK
      ?auto_409393 - BLOCK
      ?auto_409394 - BLOCK
      ?auto_409395 - BLOCK
      ?auto_409396 - BLOCK
    )
    :vars
    (
      ?auto_409397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409396 ?auto_409397 ) ( ON-TABLE ?auto_409386 ) ( ON ?auto_409387 ?auto_409386 ) ( ON ?auto_409388 ?auto_409387 ) ( ON ?auto_409389 ?auto_409388 ) ( ON ?auto_409390 ?auto_409389 ) ( ON ?auto_409391 ?auto_409390 ) ( ON ?auto_409392 ?auto_409391 ) ( not ( = ?auto_409386 ?auto_409387 ) ) ( not ( = ?auto_409386 ?auto_409388 ) ) ( not ( = ?auto_409386 ?auto_409389 ) ) ( not ( = ?auto_409386 ?auto_409390 ) ) ( not ( = ?auto_409386 ?auto_409391 ) ) ( not ( = ?auto_409386 ?auto_409392 ) ) ( not ( = ?auto_409386 ?auto_409393 ) ) ( not ( = ?auto_409386 ?auto_409394 ) ) ( not ( = ?auto_409386 ?auto_409395 ) ) ( not ( = ?auto_409386 ?auto_409396 ) ) ( not ( = ?auto_409386 ?auto_409397 ) ) ( not ( = ?auto_409387 ?auto_409388 ) ) ( not ( = ?auto_409387 ?auto_409389 ) ) ( not ( = ?auto_409387 ?auto_409390 ) ) ( not ( = ?auto_409387 ?auto_409391 ) ) ( not ( = ?auto_409387 ?auto_409392 ) ) ( not ( = ?auto_409387 ?auto_409393 ) ) ( not ( = ?auto_409387 ?auto_409394 ) ) ( not ( = ?auto_409387 ?auto_409395 ) ) ( not ( = ?auto_409387 ?auto_409396 ) ) ( not ( = ?auto_409387 ?auto_409397 ) ) ( not ( = ?auto_409388 ?auto_409389 ) ) ( not ( = ?auto_409388 ?auto_409390 ) ) ( not ( = ?auto_409388 ?auto_409391 ) ) ( not ( = ?auto_409388 ?auto_409392 ) ) ( not ( = ?auto_409388 ?auto_409393 ) ) ( not ( = ?auto_409388 ?auto_409394 ) ) ( not ( = ?auto_409388 ?auto_409395 ) ) ( not ( = ?auto_409388 ?auto_409396 ) ) ( not ( = ?auto_409388 ?auto_409397 ) ) ( not ( = ?auto_409389 ?auto_409390 ) ) ( not ( = ?auto_409389 ?auto_409391 ) ) ( not ( = ?auto_409389 ?auto_409392 ) ) ( not ( = ?auto_409389 ?auto_409393 ) ) ( not ( = ?auto_409389 ?auto_409394 ) ) ( not ( = ?auto_409389 ?auto_409395 ) ) ( not ( = ?auto_409389 ?auto_409396 ) ) ( not ( = ?auto_409389 ?auto_409397 ) ) ( not ( = ?auto_409390 ?auto_409391 ) ) ( not ( = ?auto_409390 ?auto_409392 ) ) ( not ( = ?auto_409390 ?auto_409393 ) ) ( not ( = ?auto_409390 ?auto_409394 ) ) ( not ( = ?auto_409390 ?auto_409395 ) ) ( not ( = ?auto_409390 ?auto_409396 ) ) ( not ( = ?auto_409390 ?auto_409397 ) ) ( not ( = ?auto_409391 ?auto_409392 ) ) ( not ( = ?auto_409391 ?auto_409393 ) ) ( not ( = ?auto_409391 ?auto_409394 ) ) ( not ( = ?auto_409391 ?auto_409395 ) ) ( not ( = ?auto_409391 ?auto_409396 ) ) ( not ( = ?auto_409391 ?auto_409397 ) ) ( not ( = ?auto_409392 ?auto_409393 ) ) ( not ( = ?auto_409392 ?auto_409394 ) ) ( not ( = ?auto_409392 ?auto_409395 ) ) ( not ( = ?auto_409392 ?auto_409396 ) ) ( not ( = ?auto_409392 ?auto_409397 ) ) ( not ( = ?auto_409393 ?auto_409394 ) ) ( not ( = ?auto_409393 ?auto_409395 ) ) ( not ( = ?auto_409393 ?auto_409396 ) ) ( not ( = ?auto_409393 ?auto_409397 ) ) ( not ( = ?auto_409394 ?auto_409395 ) ) ( not ( = ?auto_409394 ?auto_409396 ) ) ( not ( = ?auto_409394 ?auto_409397 ) ) ( not ( = ?auto_409395 ?auto_409396 ) ) ( not ( = ?auto_409395 ?auto_409397 ) ) ( not ( = ?auto_409396 ?auto_409397 ) ) ( ON ?auto_409395 ?auto_409396 ) ( ON ?auto_409394 ?auto_409395 ) ( CLEAR ?auto_409392 ) ( ON ?auto_409393 ?auto_409394 ) ( CLEAR ?auto_409393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_409386 ?auto_409387 ?auto_409388 ?auto_409389 ?auto_409390 ?auto_409391 ?auto_409392 ?auto_409393 )
      ( MAKE-11PILE ?auto_409386 ?auto_409387 ?auto_409388 ?auto_409389 ?auto_409390 ?auto_409391 ?auto_409392 ?auto_409393 ?auto_409394 ?auto_409395 ?auto_409396 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409409 - BLOCK
      ?auto_409410 - BLOCK
      ?auto_409411 - BLOCK
      ?auto_409412 - BLOCK
      ?auto_409413 - BLOCK
      ?auto_409414 - BLOCK
      ?auto_409415 - BLOCK
      ?auto_409416 - BLOCK
      ?auto_409417 - BLOCK
      ?auto_409418 - BLOCK
      ?auto_409419 - BLOCK
    )
    :vars
    (
      ?auto_409420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409419 ?auto_409420 ) ( ON-TABLE ?auto_409409 ) ( ON ?auto_409410 ?auto_409409 ) ( ON ?auto_409411 ?auto_409410 ) ( ON ?auto_409412 ?auto_409411 ) ( ON ?auto_409413 ?auto_409412 ) ( ON ?auto_409414 ?auto_409413 ) ( not ( = ?auto_409409 ?auto_409410 ) ) ( not ( = ?auto_409409 ?auto_409411 ) ) ( not ( = ?auto_409409 ?auto_409412 ) ) ( not ( = ?auto_409409 ?auto_409413 ) ) ( not ( = ?auto_409409 ?auto_409414 ) ) ( not ( = ?auto_409409 ?auto_409415 ) ) ( not ( = ?auto_409409 ?auto_409416 ) ) ( not ( = ?auto_409409 ?auto_409417 ) ) ( not ( = ?auto_409409 ?auto_409418 ) ) ( not ( = ?auto_409409 ?auto_409419 ) ) ( not ( = ?auto_409409 ?auto_409420 ) ) ( not ( = ?auto_409410 ?auto_409411 ) ) ( not ( = ?auto_409410 ?auto_409412 ) ) ( not ( = ?auto_409410 ?auto_409413 ) ) ( not ( = ?auto_409410 ?auto_409414 ) ) ( not ( = ?auto_409410 ?auto_409415 ) ) ( not ( = ?auto_409410 ?auto_409416 ) ) ( not ( = ?auto_409410 ?auto_409417 ) ) ( not ( = ?auto_409410 ?auto_409418 ) ) ( not ( = ?auto_409410 ?auto_409419 ) ) ( not ( = ?auto_409410 ?auto_409420 ) ) ( not ( = ?auto_409411 ?auto_409412 ) ) ( not ( = ?auto_409411 ?auto_409413 ) ) ( not ( = ?auto_409411 ?auto_409414 ) ) ( not ( = ?auto_409411 ?auto_409415 ) ) ( not ( = ?auto_409411 ?auto_409416 ) ) ( not ( = ?auto_409411 ?auto_409417 ) ) ( not ( = ?auto_409411 ?auto_409418 ) ) ( not ( = ?auto_409411 ?auto_409419 ) ) ( not ( = ?auto_409411 ?auto_409420 ) ) ( not ( = ?auto_409412 ?auto_409413 ) ) ( not ( = ?auto_409412 ?auto_409414 ) ) ( not ( = ?auto_409412 ?auto_409415 ) ) ( not ( = ?auto_409412 ?auto_409416 ) ) ( not ( = ?auto_409412 ?auto_409417 ) ) ( not ( = ?auto_409412 ?auto_409418 ) ) ( not ( = ?auto_409412 ?auto_409419 ) ) ( not ( = ?auto_409412 ?auto_409420 ) ) ( not ( = ?auto_409413 ?auto_409414 ) ) ( not ( = ?auto_409413 ?auto_409415 ) ) ( not ( = ?auto_409413 ?auto_409416 ) ) ( not ( = ?auto_409413 ?auto_409417 ) ) ( not ( = ?auto_409413 ?auto_409418 ) ) ( not ( = ?auto_409413 ?auto_409419 ) ) ( not ( = ?auto_409413 ?auto_409420 ) ) ( not ( = ?auto_409414 ?auto_409415 ) ) ( not ( = ?auto_409414 ?auto_409416 ) ) ( not ( = ?auto_409414 ?auto_409417 ) ) ( not ( = ?auto_409414 ?auto_409418 ) ) ( not ( = ?auto_409414 ?auto_409419 ) ) ( not ( = ?auto_409414 ?auto_409420 ) ) ( not ( = ?auto_409415 ?auto_409416 ) ) ( not ( = ?auto_409415 ?auto_409417 ) ) ( not ( = ?auto_409415 ?auto_409418 ) ) ( not ( = ?auto_409415 ?auto_409419 ) ) ( not ( = ?auto_409415 ?auto_409420 ) ) ( not ( = ?auto_409416 ?auto_409417 ) ) ( not ( = ?auto_409416 ?auto_409418 ) ) ( not ( = ?auto_409416 ?auto_409419 ) ) ( not ( = ?auto_409416 ?auto_409420 ) ) ( not ( = ?auto_409417 ?auto_409418 ) ) ( not ( = ?auto_409417 ?auto_409419 ) ) ( not ( = ?auto_409417 ?auto_409420 ) ) ( not ( = ?auto_409418 ?auto_409419 ) ) ( not ( = ?auto_409418 ?auto_409420 ) ) ( not ( = ?auto_409419 ?auto_409420 ) ) ( ON ?auto_409418 ?auto_409419 ) ( ON ?auto_409417 ?auto_409418 ) ( ON ?auto_409416 ?auto_409417 ) ( CLEAR ?auto_409414 ) ( ON ?auto_409415 ?auto_409416 ) ( CLEAR ?auto_409415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_409409 ?auto_409410 ?auto_409411 ?auto_409412 ?auto_409413 ?auto_409414 ?auto_409415 )
      ( MAKE-11PILE ?auto_409409 ?auto_409410 ?auto_409411 ?auto_409412 ?auto_409413 ?auto_409414 ?auto_409415 ?auto_409416 ?auto_409417 ?auto_409418 ?auto_409419 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409432 - BLOCK
      ?auto_409433 - BLOCK
      ?auto_409434 - BLOCK
      ?auto_409435 - BLOCK
      ?auto_409436 - BLOCK
      ?auto_409437 - BLOCK
      ?auto_409438 - BLOCK
      ?auto_409439 - BLOCK
      ?auto_409440 - BLOCK
      ?auto_409441 - BLOCK
      ?auto_409442 - BLOCK
    )
    :vars
    (
      ?auto_409443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409442 ?auto_409443 ) ( ON-TABLE ?auto_409432 ) ( ON ?auto_409433 ?auto_409432 ) ( ON ?auto_409434 ?auto_409433 ) ( ON ?auto_409435 ?auto_409434 ) ( ON ?auto_409436 ?auto_409435 ) ( ON ?auto_409437 ?auto_409436 ) ( not ( = ?auto_409432 ?auto_409433 ) ) ( not ( = ?auto_409432 ?auto_409434 ) ) ( not ( = ?auto_409432 ?auto_409435 ) ) ( not ( = ?auto_409432 ?auto_409436 ) ) ( not ( = ?auto_409432 ?auto_409437 ) ) ( not ( = ?auto_409432 ?auto_409438 ) ) ( not ( = ?auto_409432 ?auto_409439 ) ) ( not ( = ?auto_409432 ?auto_409440 ) ) ( not ( = ?auto_409432 ?auto_409441 ) ) ( not ( = ?auto_409432 ?auto_409442 ) ) ( not ( = ?auto_409432 ?auto_409443 ) ) ( not ( = ?auto_409433 ?auto_409434 ) ) ( not ( = ?auto_409433 ?auto_409435 ) ) ( not ( = ?auto_409433 ?auto_409436 ) ) ( not ( = ?auto_409433 ?auto_409437 ) ) ( not ( = ?auto_409433 ?auto_409438 ) ) ( not ( = ?auto_409433 ?auto_409439 ) ) ( not ( = ?auto_409433 ?auto_409440 ) ) ( not ( = ?auto_409433 ?auto_409441 ) ) ( not ( = ?auto_409433 ?auto_409442 ) ) ( not ( = ?auto_409433 ?auto_409443 ) ) ( not ( = ?auto_409434 ?auto_409435 ) ) ( not ( = ?auto_409434 ?auto_409436 ) ) ( not ( = ?auto_409434 ?auto_409437 ) ) ( not ( = ?auto_409434 ?auto_409438 ) ) ( not ( = ?auto_409434 ?auto_409439 ) ) ( not ( = ?auto_409434 ?auto_409440 ) ) ( not ( = ?auto_409434 ?auto_409441 ) ) ( not ( = ?auto_409434 ?auto_409442 ) ) ( not ( = ?auto_409434 ?auto_409443 ) ) ( not ( = ?auto_409435 ?auto_409436 ) ) ( not ( = ?auto_409435 ?auto_409437 ) ) ( not ( = ?auto_409435 ?auto_409438 ) ) ( not ( = ?auto_409435 ?auto_409439 ) ) ( not ( = ?auto_409435 ?auto_409440 ) ) ( not ( = ?auto_409435 ?auto_409441 ) ) ( not ( = ?auto_409435 ?auto_409442 ) ) ( not ( = ?auto_409435 ?auto_409443 ) ) ( not ( = ?auto_409436 ?auto_409437 ) ) ( not ( = ?auto_409436 ?auto_409438 ) ) ( not ( = ?auto_409436 ?auto_409439 ) ) ( not ( = ?auto_409436 ?auto_409440 ) ) ( not ( = ?auto_409436 ?auto_409441 ) ) ( not ( = ?auto_409436 ?auto_409442 ) ) ( not ( = ?auto_409436 ?auto_409443 ) ) ( not ( = ?auto_409437 ?auto_409438 ) ) ( not ( = ?auto_409437 ?auto_409439 ) ) ( not ( = ?auto_409437 ?auto_409440 ) ) ( not ( = ?auto_409437 ?auto_409441 ) ) ( not ( = ?auto_409437 ?auto_409442 ) ) ( not ( = ?auto_409437 ?auto_409443 ) ) ( not ( = ?auto_409438 ?auto_409439 ) ) ( not ( = ?auto_409438 ?auto_409440 ) ) ( not ( = ?auto_409438 ?auto_409441 ) ) ( not ( = ?auto_409438 ?auto_409442 ) ) ( not ( = ?auto_409438 ?auto_409443 ) ) ( not ( = ?auto_409439 ?auto_409440 ) ) ( not ( = ?auto_409439 ?auto_409441 ) ) ( not ( = ?auto_409439 ?auto_409442 ) ) ( not ( = ?auto_409439 ?auto_409443 ) ) ( not ( = ?auto_409440 ?auto_409441 ) ) ( not ( = ?auto_409440 ?auto_409442 ) ) ( not ( = ?auto_409440 ?auto_409443 ) ) ( not ( = ?auto_409441 ?auto_409442 ) ) ( not ( = ?auto_409441 ?auto_409443 ) ) ( not ( = ?auto_409442 ?auto_409443 ) ) ( ON ?auto_409441 ?auto_409442 ) ( ON ?auto_409440 ?auto_409441 ) ( ON ?auto_409439 ?auto_409440 ) ( CLEAR ?auto_409437 ) ( ON ?auto_409438 ?auto_409439 ) ( CLEAR ?auto_409438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_409432 ?auto_409433 ?auto_409434 ?auto_409435 ?auto_409436 ?auto_409437 ?auto_409438 )
      ( MAKE-11PILE ?auto_409432 ?auto_409433 ?auto_409434 ?auto_409435 ?auto_409436 ?auto_409437 ?auto_409438 ?auto_409439 ?auto_409440 ?auto_409441 ?auto_409442 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409455 - BLOCK
      ?auto_409456 - BLOCK
      ?auto_409457 - BLOCK
      ?auto_409458 - BLOCK
      ?auto_409459 - BLOCK
      ?auto_409460 - BLOCK
      ?auto_409461 - BLOCK
      ?auto_409462 - BLOCK
      ?auto_409463 - BLOCK
      ?auto_409464 - BLOCK
      ?auto_409465 - BLOCK
    )
    :vars
    (
      ?auto_409466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409465 ?auto_409466 ) ( ON-TABLE ?auto_409455 ) ( ON ?auto_409456 ?auto_409455 ) ( ON ?auto_409457 ?auto_409456 ) ( ON ?auto_409458 ?auto_409457 ) ( ON ?auto_409459 ?auto_409458 ) ( not ( = ?auto_409455 ?auto_409456 ) ) ( not ( = ?auto_409455 ?auto_409457 ) ) ( not ( = ?auto_409455 ?auto_409458 ) ) ( not ( = ?auto_409455 ?auto_409459 ) ) ( not ( = ?auto_409455 ?auto_409460 ) ) ( not ( = ?auto_409455 ?auto_409461 ) ) ( not ( = ?auto_409455 ?auto_409462 ) ) ( not ( = ?auto_409455 ?auto_409463 ) ) ( not ( = ?auto_409455 ?auto_409464 ) ) ( not ( = ?auto_409455 ?auto_409465 ) ) ( not ( = ?auto_409455 ?auto_409466 ) ) ( not ( = ?auto_409456 ?auto_409457 ) ) ( not ( = ?auto_409456 ?auto_409458 ) ) ( not ( = ?auto_409456 ?auto_409459 ) ) ( not ( = ?auto_409456 ?auto_409460 ) ) ( not ( = ?auto_409456 ?auto_409461 ) ) ( not ( = ?auto_409456 ?auto_409462 ) ) ( not ( = ?auto_409456 ?auto_409463 ) ) ( not ( = ?auto_409456 ?auto_409464 ) ) ( not ( = ?auto_409456 ?auto_409465 ) ) ( not ( = ?auto_409456 ?auto_409466 ) ) ( not ( = ?auto_409457 ?auto_409458 ) ) ( not ( = ?auto_409457 ?auto_409459 ) ) ( not ( = ?auto_409457 ?auto_409460 ) ) ( not ( = ?auto_409457 ?auto_409461 ) ) ( not ( = ?auto_409457 ?auto_409462 ) ) ( not ( = ?auto_409457 ?auto_409463 ) ) ( not ( = ?auto_409457 ?auto_409464 ) ) ( not ( = ?auto_409457 ?auto_409465 ) ) ( not ( = ?auto_409457 ?auto_409466 ) ) ( not ( = ?auto_409458 ?auto_409459 ) ) ( not ( = ?auto_409458 ?auto_409460 ) ) ( not ( = ?auto_409458 ?auto_409461 ) ) ( not ( = ?auto_409458 ?auto_409462 ) ) ( not ( = ?auto_409458 ?auto_409463 ) ) ( not ( = ?auto_409458 ?auto_409464 ) ) ( not ( = ?auto_409458 ?auto_409465 ) ) ( not ( = ?auto_409458 ?auto_409466 ) ) ( not ( = ?auto_409459 ?auto_409460 ) ) ( not ( = ?auto_409459 ?auto_409461 ) ) ( not ( = ?auto_409459 ?auto_409462 ) ) ( not ( = ?auto_409459 ?auto_409463 ) ) ( not ( = ?auto_409459 ?auto_409464 ) ) ( not ( = ?auto_409459 ?auto_409465 ) ) ( not ( = ?auto_409459 ?auto_409466 ) ) ( not ( = ?auto_409460 ?auto_409461 ) ) ( not ( = ?auto_409460 ?auto_409462 ) ) ( not ( = ?auto_409460 ?auto_409463 ) ) ( not ( = ?auto_409460 ?auto_409464 ) ) ( not ( = ?auto_409460 ?auto_409465 ) ) ( not ( = ?auto_409460 ?auto_409466 ) ) ( not ( = ?auto_409461 ?auto_409462 ) ) ( not ( = ?auto_409461 ?auto_409463 ) ) ( not ( = ?auto_409461 ?auto_409464 ) ) ( not ( = ?auto_409461 ?auto_409465 ) ) ( not ( = ?auto_409461 ?auto_409466 ) ) ( not ( = ?auto_409462 ?auto_409463 ) ) ( not ( = ?auto_409462 ?auto_409464 ) ) ( not ( = ?auto_409462 ?auto_409465 ) ) ( not ( = ?auto_409462 ?auto_409466 ) ) ( not ( = ?auto_409463 ?auto_409464 ) ) ( not ( = ?auto_409463 ?auto_409465 ) ) ( not ( = ?auto_409463 ?auto_409466 ) ) ( not ( = ?auto_409464 ?auto_409465 ) ) ( not ( = ?auto_409464 ?auto_409466 ) ) ( not ( = ?auto_409465 ?auto_409466 ) ) ( ON ?auto_409464 ?auto_409465 ) ( ON ?auto_409463 ?auto_409464 ) ( ON ?auto_409462 ?auto_409463 ) ( ON ?auto_409461 ?auto_409462 ) ( CLEAR ?auto_409459 ) ( ON ?auto_409460 ?auto_409461 ) ( CLEAR ?auto_409460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_409455 ?auto_409456 ?auto_409457 ?auto_409458 ?auto_409459 ?auto_409460 )
      ( MAKE-11PILE ?auto_409455 ?auto_409456 ?auto_409457 ?auto_409458 ?auto_409459 ?auto_409460 ?auto_409461 ?auto_409462 ?auto_409463 ?auto_409464 ?auto_409465 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409478 - BLOCK
      ?auto_409479 - BLOCK
      ?auto_409480 - BLOCK
      ?auto_409481 - BLOCK
      ?auto_409482 - BLOCK
      ?auto_409483 - BLOCK
      ?auto_409484 - BLOCK
      ?auto_409485 - BLOCK
      ?auto_409486 - BLOCK
      ?auto_409487 - BLOCK
      ?auto_409488 - BLOCK
    )
    :vars
    (
      ?auto_409489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409488 ?auto_409489 ) ( ON-TABLE ?auto_409478 ) ( ON ?auto_409479 ?auto_409478 ) ( ON ?auto_409480 ?auto_409479 ) ( ON ?auto_409481 ?auto_409480 ) ( ON ?auto_409482 ?auto_409481 ) ( not ( = ?auto_409478 ?auto_409479 ) ) ( not ( = ?auto_409478 ?auto_409480 ) ) ( not ( = ?auto_409478 ?auto_409481 ) ) ( not ( = ?auto_409478 ?auto_409482 ) ) ( not ( = ?auto_409478 ?auto_409483 ) ) ( not ( = ?auto_409478 ?auto_409484 ) ) ( not ( = ?auto_409478 ?auto_409485 ) ) ( not ( = ?auto_409478 ?auto_409486 ) ) ( not ( = ?auto_409478 ?auto_409487 ) ) ( not ( = ?auto_409478 ?auto_409488 ) ) ( not ( = ?auto_409478 ?auto_409489 ) ) ( not ( = ?auto_409479 ?auto_409480 ) ) ( not ( = ?auto_409479 ?auto_409481 ) ) ( not ( = ?auto_409479 ?auto_409482 ) ) ( not ( = ?auto_409479 ?auto_409483 ) ) ( not ( = ?auto_409479 ?auto_409484 ) ) ( not ( = ?auto_409479 ?auto_409485 ) ) ( not ( = ?auto_409479 ?auto_409486 ) ) ( not ( = ?auto_409479 ?auto_409487 ) ) ( not ( = ?auto_409479 ?auto_409488 ) ) ( not ( = ?auto_409479 ?auto_409489 ) ) ( not ( = ?auto_409480 ?auto_409481 ) ) ( not ( = ?auto_409480 ?auto_409482 ) ) ( not ( = ?auto_409480 ?auto_409483 ) ) ( not ( = ?auto_409480 ?auto_409484 ) ) ( not ( = ?auto_409480 ?auto_409485 ) ) ( not ( = ?auto_409480 ?auto_409486 ) ) ( not ( = ?auto_409480 ?auto_409487 ) ) ( not ( = ?auto_409480 ?auto_409488 ) ) ( not ( = ?auto_409480 ?auto_409489 ) ) ( not ( = ?auto_409481 ?auto_409482 ) ) ( not ( = ?auto_409481 ?auto_409483 ) ) ( not ( = ?auto_409481 ?auto_409484 ) ) ( not ( = ?auto_409481 ?auto_409485 ) ) ( not ( = ?auto_409481 ?auto_409486 ) ) ( not ( = ?auto_409481 ?auto_409487 ) ) ( not ( = ?auto_409481 ?auto_409488 ) ) ( not ( = ?auto_409481 ?auto_409489 ) ) ( not ( = ?auto_409482 ?auto_409483 ) ) ( not ( = ?auto_409482 ?auto_409484 ) ) ( not ( = ?auto_409482 ?auto_409485 ) ) ( not ( = ?auto_409482 ?auto_409486 ) ) ( not ( = ?auto_409482 ?auto_409487 ) ) ( not ( = ?auto_409482 ?auto_409488 ) ) ( not ( = ?auto_409482 ?auto_409489 ) ) ( not ( = ?auto_409483 ?auto_409484 ) ) ( not ( = ?auto_409483 ?auto_409485 ) ) ( not ( = ?auto_409483 ?auto_409486 ) ) ( not ( = ?auto_409483 ?auto_409487 ) ) ( not ( = ?auto_409483 ?auto_409488 ) ) ( not ( = ?auto_409483 ?auto_409489 ) ) ( not ( = ?auto_409484 ?auto_409485 ) ) ( not ( = ?auto_409484 ?auto_409486 ) ) ( not ( = ?auto_409484 ?auto_409487 ) ) ( not ( = ?auto_409484 ?auto_409488 ) ) ( not ( = ?auto_409484 ?auto_409489 ) ) ( not ( = ?auto_409485 ?auto_409486 ) ) ( not ( = ?auto_409485 ?auto_409487 ) ) ( not ( = ?auto_409485 ?auto_409488 ) ) ( not ( = ?auto_409485 ?auto_409489 ) ) ( not ( = ?auto_409486 ?auto_409487 ) ) ( not ( = ?auto_409486 ?auto_409488 ) ) ( not ( = ?auto_409486 ?auto_409489 ) ) ( not ( = ?auto_409487 ?auto_409488 ) ) ( not ( = ?auto_409487 ?auto_409489 ) ) ( not ( = ?auto_409488 ?auto_409489 ) ) ( ON ?auto_409487 ?auto_409488 ) ( ON ?auto_409486 ?auto_409487 ) ( ON ?auto_409485 ?auto_409486 ) ( ON ?auto_409484 ?auto_409485 ) ( CLEAR ?auto_409482 ) ( ON ?auto_409483 ?auto_409484 ) ( CLEAR ?auto_409483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_409478 ?auto_409479 ?auto_409480 ?auto_409481 ?auto_409482 ?auto_409483 )
      ( MAKE-11PILE ?auto_409478 ?auto_409479 ?auto_409480 ?auto_409481 ?auto_409482 ?auto_409483 ?auto_409484 ?auto_409485 ?auto_409486 ?auto_409487 ?auto_409488 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409501 - BLOCK
      ?auto_409502 - BLOCK
      ?auto_409503 - BLOCK
      ?auto_409504 - BLOCK
      ?auto_409505 - BLOCK
      ?auto_409506 - BLOCK
      ?auto_409507 - BLOCK
      ?auto_409508 - BLOCK
      ?auto_409509 - BLOCK
      ?auto_409510 - BLOCK
      ?auto_409511 - BLOCK
    )
    :vars
    (
      ?auto_409512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409511 ?auto_409512 ) ( ON-TABLE ?auto_409501 ) ( ON ?auto_409502 ?auto_409501 ) ( ON ?auto_409503 ?auto_409502 ) ( ON ?auto_409504 ?auto_409503 ) ( not ( = ?auto_409501 ?auto_409502 ) ) ( not ( = ?auto_409501 ?auto_409503 ) ) ( not ( = ?auto_409501 ?auto_409504 ) ) ( not ( = ?auto_409501 ?auto_409505 ) ) ( not ( = ?auto_409501 ?auto_409506 ) ) ( not ( = ?auto_409501 ?auto_409507 ) ) ( not ( = ?auto_409501 ?auto_409508 ) ) ( not ( = ?auto_409501 ?auto_409509 ) ) ( not ( = ?auto_409501 ?auto_409510 ) ) ( not ( = ?auto_409501 ?auto_409511 ) ) ( not ( = ?auto_409501 ?auto_409512 ) ) ( not ( = ?auto_409502 ?auto_409503 ) ) ( not ( = ?auto_409502 ?auto_409504 ) ) ( not ( = ?auto_409502 ?auto_409505 ) ) ( not ( = ?auto_409502 ?auto_409506 ) ) ( not ( = ?auto_409502 ?auto_409507 ) ) ( not ( = ?auto_409502 ?auto_409508 ) ) ( not ( = ?auto_409502 ?auto_409509 ) ) ( not ( = ?auto_409502 ?auto_409510 ) ) ( not ( = ?auto_409502 ?auto_409511 ) ) ( not ( = ?auto_409502 ?auto_409512 ) ) ( not ( = ?auto_409503 ?auto_409504 ) ) ( not ( = ?auto_409503 ?auto_409505 ) ) ( not ( = ?auto_409503 ?auto_409506 ) ) ( not ( = ?auto_409503 ?auto_409507 ) ) ( not ( = ?auto_409503 ?auto_409508 ) ) ( not ( = ?auto_409503 ?auto_409509 ) ) ( not ( = ?auto_409503 ?auto_409510 ) ) ( not ( = ?auto_409503 ?auto_409511 ) ) ( not ( = ?auto_409503 ?auto_409512 ) ) ( not ( = ?auto_409504 ?auto_409505 ) ) ( not ( = ?auto_409504 ?auto_409506 ) ) ( not ( = ?auto_409504 ?auto_409507 ) ) ( not ( = ?auto_409504 ?auto_409508 ) ) ( not ( = ?auto_409504 ?auto_409509 ) ) ( not ( = ?auto_409504 ?auto_409510 ) ) ( not ( = ?auto_409504 ?auto_409511 ) ) ( not ( = ?auto_409504 ?auto_409512 ) ) ( not ( = ?auto_409505 ?auto_409506 ) ) ( not ( = ?auto_409505 ?auto_409507 ) ) ( not ( = ?auto_409505 ?auto_409508 ) ) ( not ( = ?auto_409505 ?auto_409509 ) ) ( not ( = ?auto_409505 ?auto_409510 ) ) ( not ( = ?auto_409505 ?auto_409511 ) ) ( not ( = ?auto_409505 ?auto_409512 ) ) ( not ( = ?auto_409506 ?auto_409507 ) ) ( not ( = ?auto_409506 ?auto_409508 ) ) ( not ( = ?auto_409506 ?auto_409509 ) ) ( not ( = ?auto_409506 ?auto_409510 ) ) ( not ( = ?auto_409506 ?auto_409511 ) ) ( not ( = ?auto_409506 ?auto_409512 ) ) ( not ( = ?auto_409507 ?auto_409508 ) ) ( not ( = ?auto_409507 ?auto_409509 ) ) ( not ( = ?auto_409507 ?auto_409510 ) ) ( not ( = ?auto_409507 ?auto_409511 ) ) ( not ( = ?auto_409507 ?auto_409512 ) ) ( not ( = ?auto_409508 ?auto_409509 ) ) ( not ( = ?auto_409508 ?auto_409510 ) ) ( not ( = ?auto_409508 ?auto_409511 ) ) ( not ( = ?auto_409508 ?auto_409512 ) ) ( not ( = ?auto_409509 ?auto_409510 ) ) ( not ( = ?auto_409509 ?auto_409511 ) ) ( not ( = ?auto_409509 ?auto_409512 ) ) ( not ( = ?auto_409510 ?auto_409511 ) ) ( not ( = ?auto_409510 ?auto_409512 ) ) ( not ( = ?auto_409511 ?auto_409512 ) ) ( ON ?auto_409510 ?auto_409511 ) ( ON ?auto_409509 ?auto_409510 ) ( ON ?auto_409508 ?auto_409509 ) ( ON ?auto_409507 ?auto_409508 ) ( ON ?auto_409506 ?auto_409507 ) ( CLEAR ?auto_409504 ) ( ON ?auto_409505 ?auto_409506 ) ( CLEAR ?auto_409505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_409501 ?auto_409502 ?auto_409503 ?auto_409504 ?auto_409505 )
      ( MAKE-11PILE ?auto_409501 ?auto_409502 ?auto_409503 ?auto_409504 ?auto_409505 ?auto_409506 ?auto_409507 ?auto_409508 ?auto_409509 ?auto_409510 ?auto_409511 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409524 - BLOCK
      ?auto_409525 - BLOCK
      ?auto_409526 - BLOCK
      ?auto_409527 - BLOCK
      ?auto_409528 - BLOCK
      ?auto_409529 - BLOCK
      ?auto_409530 - BLOCK
      ?auto_409531 - BLOCK
      ?auto_409532 - BLOCK
      ?auto_409533 - BLOCK
      ?auto_409534 - BLOCK
    )
    :vars
    (
      ?auto_409535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409534 ?auto_409535 ) ( ON-TABLE ?auto_409524 ) ( ON ?auto_409525 ?auto_409524 ) ( ON ?auto_409526 ?auto_409525 ) ( ON ?auto_409527 ?auto_409526 ) ( not ( = ?auto_409524 ?auto_409525 ) ) ( not ( = ?auto_409524 ?auto_409526 ) ) ( not ( = ?auto_409524 ?auto_409527 ) ) ( not ( = ?auto_409524 ?auto_409528 ) ) ( not ( = ?auto_409524 ?auto_409529 ) ) ( not ( = ?auto_409524 ?auto_409530 ) ) ( not ( = ?auto_409524 ?auto_409531 ) ) ( not ( = ?auto_409524 ?auto_409532 ) ) ( not ( = ?auto_409524 ?auto_409533 ) ) ( not ( = ?auto_409524 ?auto_409534 ) ) ( not ( = ?auto_409524 ?auto_409535 ) ) ( not ( = ?auto_409525 ?auto_409526 ) ) ( not ( = ?auto_409525 ?auto_409527 ) ) ( not ( = ?auto_409525 ?auto_409528 ) ) ( not ( = ?auto_409525 ?auto_409529 ) ) ( not ( = ?auto_409525 ?auto_409530 ) ) ( not ( = ?auto_409525 ?auto_409531 ) ) ( not ( = ?auto_409525 ?auto_409532 ) ) ( not ( = ?auto_409525 ?auto_409533 ) ) ( not ( = ?auto_409525 ?auto_409534 ) ) ( not ( = ?auto_409525 ?auto_409535 ) ) ( not ( = ?auto_409526 ?auto_409527 ) ) ( not ( = ?auto_409526 ?auto_409528 ) ) ( not ( = ?auto_409526 ?auto_409529 ) ) ( not ( = ?auto_409526 ?auto_409530 ) ) ( not ( = ?auto_409526 ?auto_409531 ) ) ( not ( = ?auto_409526 ?auto_409532 ) ) ( not ( = ?auto_409526 ?auto_409533 ) ) ( not ( = ?auto_409526 ?auto_409534 ) ) ( not ( = ?auto_409526 ?auto_409535 ) ) ( not ( = ?auto_409527 ?auto_409528 ) ) ( not ( = ?auto_409527 ?auto_409529 ) ) ( not ( = ?auto_409527 ?auto_409530 ) ) ( not ( = ?auto_409527 ?auto_409531 ) ) ( not ( = ?auto_409527 ?auto_409532 ) ) ( not ( = ?auto_409527 ?auto_409533 ) ) ( not ( = ?auto_409527 ?auto_409534 ) ) ( not ( = ?auto_409527 ?auto_409535 ) ) ( not ( = ?auto_409528 ?auto_409529 ) ) ( not ( = ?auto_409528 ?auto_409530 ) ) ( not ( = ?auto_409528 ?auto_409531 ) ) ( not ( = ?auto_409528 ?auto_409532 ) ) ( not ( = ?auto_409528 ?auto_409533 ) ) ( not ( = ?auto_409528 ?auto_409534 ) ) ( not ( = ?auto_409528 ?auto_409535 ) ) ( not ( = ?auto_409529 ?auto_409530 ) ) ( not ( = ?auto_409529 ?auto_409531 ) ) ( not ( = ?auto_409529 ?auto_409532 ) ) ( not ( = ?auto_409529 ?auto_409533 ) ) ( not ( = ?auto_409529 ?auto_409534 ) ) ( not ( = ?auto_409529 ?auto_409535 ) ) ( not ( = ?auto_409530 ?auto_409531 ) ) ( not ( = ?auto_409530 ?auto_409532 ) ) ( not ( = ?auto_409530 ?auto_409533 ) ) ( not ( = ?auto_409530 ?auto_409534 ) ) ( not ( = ?auto_409530 ?auto_409535 ) ) ( not ( = ?auto_409531 ?auto_409532 ) ) ( not ( = ?auto_409531 ?auto_409533 ) ) ( not ( = ?auto_409531 ?auto_409534 ) ) ( not ( = ?auto_409531 ?auto_409535 ) ) ( not ( = ?auto_409532 ?auto_409533 ) ) ( not ( = ?auto_409532 ?auto_409534 ) ) ( not ( = ?auto_409532 ?auto_409535 ) ) ( not ( = ?auto_409533 ?auto_409534 ) ) ( not ( = ?auto_409533 ?auto_409535 ) ) ( not ( = ?auto_409534 ?auto_409535 ) ) ( ON ?auto_409533 ?auto_409534 ) ( ON ?auto_409532 ?auto_409533 ) ( ON ?auto_409531 ?auto_409532 ) ( ON ?auto_409530 ?auto_409531 ) ( ON ?auto_409529 ?auto_409530 ) ( CLEAR ?auto_409527 ) ( ON ?auto_409528 ?auto_409529 ) ( CLEAR ?auto_409528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_409524 ?auto_409525 ?auto_409526 ?auto_409527 ?auto_409528 )
      ( MAKE-11PILE ?auto_409524 ?auto_409525 ?auto_409526 ?auto_409527 ?auto_409528 ?auto_409529 ?auto_409530 ?auto_409531 ?auto_409532 ?auto_409533 ?auto_409534 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409547 - BLOCK
      ?auto_409548 - BLOCK
      ?auto_409549 - BLOCK
      ?auto_409550 - BLOCK
      ?auto_409551 - BLOCK
      ?auto_409552 - BLOCK
      ?auto_409553 - BLOCK
      ?auto_409554 - BLOCK
      ?auto_409555 - BLOCK
      ?auto_409556 - BLOCK
      ?auto_409557 - BLOCK
    )
    :vars
    (
      ?auto_409558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409557 ?auto_409558 ) ( ON-TABLE ?auto_409547 ) ( ON ?auto_409548 ?auto_409547 ) ( ON ?auto_409549 ?auto_409548 ) ( not ( = ?auto_409547 ?auto_409548 ) ) ( not ( = ?auto_409547 ?auto_409549 ) ) ( not ( = ?auto_409547 ?auto_409550 ) ) ( not ( = ?auto_409547 ?auto_409551 ) ) ( not ( = ?auto_409547 ?auto_409552 ) ) ( not ( = ?auto_409547 ?auto_409553 ) ) ( not ( = ?auto_409547 ?auto_409554 ) ) ( not ( = ?auto_409547 ?auto_409555 ) ) ( not ( = ?auto_409547 ?auto_409556 ) ) ( not ( = ?auto_409547 ?auto_409557 ) ) ( not ( = ?auto_409547 ?auto_409558 ) ) ( not ( = ?auto_409548 ?auto_409549 ) ) ( not ( = ?auto_409548 ?auto_409550 ) ) ( not ( = ?auto_409548 ?auto_409551 ) ) ( not ( = ?auto_409548 ?auto_409552 ) ) ( not ( = ?auto_409548 ?auto_409553 ) ) ( not ( = ?auto_409548 ?auto_409554 ) ) ( not ( = ?auto_409548 ?auto_409555 ) ) ( not ( = ?auto_409548 ?auto_409556 ) ) ( not ( = ?auto_409548 ?auto_409557 ) ) ( not ( = ?auto_409548 ?auto_409558 ) ) ( not ( = ?auto_409549 ?auto_409550 ) ) ( not ( = ?auto_409549 ?auto_409551 ) ) ( not ( = ?auto_409549 ?auto_409552 ) ) ( not ( = ?auto_409549 ?auto_409553 ) ) ( not ( = ?auto_409549 ?auto_409554 ) ) ( not ( = ?auto_409549 ?auto_409555 ) ) ( not ( = ?auto_409549 ?auto_409556 ) ) ( not ( = ?auto_409549 ?auto_409557 ) ) ( not ( = ?auto_409549 ?auto_409558 ) ) ( not ( = ?auto_409550 ?auto_409551 ) ) ( not ( = ?auto_409550 ?auto_409552 ) ) ( not ( = ?auto_409550 ?auto_409553 ) ) ( not ( = ?auto_409550 ?auto_409554 ) ) ( not ( = ?auto_409550 ?auto_409555 ) ) ( not ( = ?auto_409550 ?auto_409556 ) ) ( not ( = ?auto_409550 ?auto_409557 ) ) ( not ( = ?auto_409550 ?auto_409558 ) ) ( not ( = ?auto_409551 ?auto_409552 ) ) ( not ( = ?auto_409551 ?auto_409553 ) ) ( not ( = ?auto_409551 ?auto_409554 ) ) ( not ( = ?auto_409551 ?auto_409555 ) ) ( not ( = ?auto_409551 ?auto_409556 ) ) ( not ( = ?auto_409551 ?auto_409557 ) ) ( not ( = ?auto_409551 ?auto_409558 ) ) ( not ( = ?auto_409552 ?auto_409553 ) ) ( not ( = ?auto_409552 ?auto_409554 ) ) ( not ( = ?auto_409552 ?auto_409555 ) ) ( not ( = ?auto_409552 ?auto_409556 ) ) ( not ( = ?auto_409552 ?auto_409557 ) ) ( not ( = ?auto_409552 ?auto_409558 ) ) ( not ( = ?auto_409553 ?auto_409554 ) ) ( not ( = ?auto_409553 ?auto_409555 ) ) ( not ( = ?auto_409553 ?auto_409556 ) ) ( not ( = ?auto_409553 ?auto_409557 ) ) ( not ( = ?auto_409553 ?auto_409558 ) ) ( not ( = ?auto_409554 ?auto_409555 ) ) ( not ( = ?auto_409554 ?auto_409556 ) ) ( not ( = ?auto_409554 ?auto_409557 ) ) ( not ( = ?auto_409554 ?auto_409558 ) ) ( not ( = ?auto_409555 ?auto_409556 ) ) ( not ( = ?auto_409555 ?auto_409557 ) ) ( not ( = ?auto_409555 ?auto_409558 ) ) ( not ( = ?auto_409556 ?auto_409557 ) ) ( not ( = ?auto_409556 ?auto_409558 ) ) ( not ( = ?auto_409557 ?auto_409558 ) ) ( ON ?auto_409556 ?auto_409557 ) ( ON ?auto_409555 ?auto_409556 ) ( ON ?auto_409554 ?auto_409555 ) ( ON ?auto_409553 ?auto_409554 ) ( ON ?auto_409552 ?auto_409553 ) ( ON ?auto_409551 ?auto_409552 ) ( CLEAR ?auto_409549 ) ( ON ?auto_409550 ?auto_409551 ) ( CLEAR ?auto_409550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_409547 ?auto_409548 ?auto_409549 ?auto_409550 )
      ( MAKE-11PILE ?auto_409547 ?auto_409548 ?auto_409549 ?auto_409550 ?auto_409551 ?auto_409552 ?auto_409553 ?auto_409554 ?auto_409555 ?auto_409556 ?auto_409557 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409570 - BLOCK
      ?auto_409571 - BLOCK
      ?auto_409572 - BLOCK
      ?auto_409573 - BLOCK
      ?auto_409574 - BLOCK
      ?auto_409575 - BLOCK
      ?auto_409576 - BLOCK
      ?auto_409577 - BLOCK
      ?auto_409578 - BLOCK
      ?auto_409579 - BLOCK
      ?auto_409580 - BLOCK
    )
    :vars
    (
      ?auto_409581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409580 ?auto_409581 ) ( ON-TABLE ?auto_409570 ) ( ON ?auto_409571 ?auto_409570 ) ( ON ?auto_409572 ?auto_409571 ) ( not ( = ?auto_409570 ?auto_409571 ) ) ( not ( = ?auto_409570 ?auto_409572 ) ) ( not ( = ?auto_409570 ?auto_409573 ) ) ( not ( = ?auto_409570 ?auto_409574 ) ) ( not ( = ?auto_409570 ?auto_409575 ) ) ( not ( = ?auto_409570 ?auto_409576 ) ) ( not ( = ?auto_409570 ?auto_409577 ) ) ( not ( = ?auto_409570 ?auto_409578 ) ) ( not ( = ?auto_409570 ?auto_409579 ) ) ( not ( = ?auto_409570 ?auto_409580 ) ) ( not ( = ?auto_409570 ?auto_409581 ) ) ( not ( = ?auto_409571 ?auto_409572 ) ) ( not ( = ?auto_409571 ?auto_409573 ) ) ( not ( = ?auto_409571 ?auto_409574 ) ) ( not ( = ?auto_409571 ?auto_409575 ) ) ( not ( = ?auto_409571 ?auto_409576 ) ) ( not ( = ?auto_409571 ?auto_409577 ) ) ( not ( = ?auto_409571 ?auto_409578 ) ) ( not ( = ?auto_409571 ?auto_409579 ) ) ( not ( = ?auto_409571 ?auto_409580 ) ) ( not ( = ?auto_409571 ?auto_409581 ) ) ( not ( = ?auto_409572 ?auto_409573 ) ) ( not ( = ?auto_409572 ?auto_409574 ) ) ( not ( = ?auto_409572 ?auto_409575 ) ) ( not ( = ?auto_409572 ?auto_409576 ) ) ( not ( = ?auto_409572 ?auto_409577 ) ) ( not ( = ?auto_409572 ?auto_409578 ) ) ( not ( = ?auto_409572 ?auto_409579 ) ) ( not ( = ?auto_409572 ?auto_409580 ) ) ( not ( = ?auto_409572 ?auto_409581 ) ) ( not ( = ?auto_409573 ?auto_409574 ) ) ( not ( = ?auto_409573 ?auto_409575 ) ) ( not ( = ?auto_409573 ?auto_409576 ) ) ( not ( = ?auto_409573 ?auto_409577 ) ) ( not ( = ?auto_409573 ?auto_409578 ) ) ( not ( = ?auto_409573 ?auto_409579 ) ) ( not ( = ?auto_409573 ?auto_409580 ) ) ( not ( = ?auto_409573 ?auto_409581 ) ) ( not ( = ?auto_409574 ?auto_409575 ) ) ( not ( = ?auto_409574 ?auto_409576 ) ) ( not ( = ?auto_409574 ?auto_409577 ) ) ( not ( = ?auto_409574 ?auto_409578 ) ) ( not ( = ?auto_409574 ?auto_409579 ) ) ( not ( = ?auto_409574 ?auto_409580 ) ) ( not ( = ?auto_409574 ?auto_409581 ) ) ( not ( = ?auto_409575 ?auto_409576 ) ) ( not ( = ?auto_409575 ?auto_409577 ) ) ( not ( = ?auto_409575 ?auto_409578 ) ) ( not ( = ?auto_409575 ?auto_409579 ) ) ( not ( = ?auto_409575 ?auto_409580 ) ) ( not ( = ?auto_409575 ?auto_409581 ) ) ( not ( = ?auto_409576 ?auto_409577 ) ) ( not ( = ?auto_409576 ?auto_409578 ) ) ( not ( = ?auto_409576 ?auto_409579 ) ) ( not ( = ?auto_409576 ?auto_409580 ) ) ( not ( = ?auto_409576 ?auto_409581 ) ) ( not ( = ?auto_409577 ?auto_409578 ) ) ( not ( = ?auto_409577 ?auto_409579 ) ) ( not ( = ?auto_409577 ?auto_409580 ) ) ( not ( = ?auto_409577 ?auto_409581 ) ) ( not ( = ?auto_409578 ?auto_409579 ) ) ( not ( = ?auto_409578 ?auto_409580 ) ) ( not ( = ?auto_409578 ?auto_409581 ) ) ( not ( = ?auto_409579 ?auto_409580 ) ) ( not ( = ?auto_409579 ?auto_409581 ) ) ( not ( = ?auto_409580 ?auto_409581 ) ) ( ON ?auto_409579 ?auto_409580 ) ( ON ?auto_409578 ?auto_409579 ) ( ON ?auto_409577 ?auto_409578 ) ( ON ?auto_409576 ?auto_409577 ) ( ON ?auto_409575 ?auto_409576 ) ( ON ?auto_409574 ?auto_409575 ) ( CLEAR ?auto_409572 ) ( ON ?auto_409573 ?auto_409574 ) ( CLEAR ?auto_409573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_409570 ?auto_409571 ?auto_409572 ?auto_409573 )
      ( MAKE-11PILE ?auto_409570 ?auto_409571 ?auto_409572 ?auto_409573 ?auto_409574 ?auto_409575 ?auto_409576 ?auto_409577 ?auto_409578 ?auto_409579 ?auto_409580 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409593 - BLOCK
      ?auto_409594 - BLOCK
      ?auto_409595 - BLOCK
      ?auto_409596 - BLOCK
      ?auto_409597 - BLOCK
      ?auto_409598 - BLOCK
      ?auto_409599 - BLOCK
      ?auto_409600 - BLOCK
      ?auto_409601 - BLOCK
      ?auto_409602 - BLOCK
      ?auto_409603 - BLOCK
    )
    :vars
    (
      ?auto_409604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409603 ?auto_409604 ) ( ON-TABLE ?auto_409593 ) ( ON ?auto_409594 ?auto_409593 ) ( not ( = ?auto_409593 ?auto_409594 ) ) ( not ( = ?auto_409593 ?auto_409595 ) ) ( not ( = ?auto_409593 ?auto_409596 ) ) ( not ( = ?auto_409593 ?auto_409597 ) ) ( not ( = ?auto_409593 ?auto_409598 ) ) ( not ( = ?auto_409593 ?auto_409599 ) ) ( not ( = ?auto_409593 ?auto_409600 ) ) ( not ( = ?auto_409593 ?auto_409601 ) ) ( not ( = ?auto_409593 ?auto_409602 ) ) ( not ( = ?auto_409593 ?auto_409603 ) ) ( not ( = ?auto_409593 ?auto_409604 ) ) ( not ( = ?auto_409594 ?auto_409595 ) ) ( not ( = ?auto_409594 ?auto_409596 ) ) ( not ( = ?auto_409594 ?auto_409597 ) ) ( not ( = ?auto_409594 ?auto_409598 ) ) ( not ( = ?auto_409594 ?auto_409599 ) ) ( not ( = ?auto_409594 ?auto_409600 ) ) ( not ( = ?auto_409594 ?auto_409601 ) ) ( not ( = ?auto_409594 ?auto_409602 ) ) ( not ( = ?auto_409594 ?auto_409603 ) ) ( not ( = ?auto_409594 ?auto_409604 ) ) ( not ( = ?auto_409595 ?auto_409596 ) ) ( not ( = ?auto_409595 ?auto_409597 ) ) ( not ( = ?auto_409595 ?auto_409598 ) ) ( not ( = ?auto_409595 ?auto_409599 ) ) ( not ( = ?auto_409595 ?auto_409600 ) ) ( not ( = ?auto_409595 ?auto_409601 ) ) ( not ( = ?auto_409595 ?auto_409602 ) ) ( not ( = ?auto_409595 ?auto_409603 ) ) ( not ( = ?auto_409595 ?auto_409604 ) ) ( not ( = ?auto_409596 ?auto_409597 ) ) ( not ( = ?auto_409596 ?auto_409598 ) ) ( not ( = ?auto_409596 ?auto_409599 ) ) ( not ( = ?auto_409596 ?auto_409600 ) ) ( not ( = ?auto_409596 ?auto_409601 ) ) ( not ( = ?auto_409596 ?auto_409602 ) ) ( not ( = ?auto_409596 ?auto_409603 ) ) ( not ( = ?auto_409596 ?auto_409604 ) ) ( not ( = ?auto_409597 ?auto_409598 ) ) ( not ( = ?auto_409597 ?auto_409599 ) ) ( not ( = ?auto_409597 ?auto_409600 ) ) ( not ( = ?auto_409597 ?auto_409601 ) ) ( not ( = ?auto_409597 ?auto_409602 ) ) ( not ( = ?auto_409597 ?auto_409603 ) ) ( not ( = ?auto_409597 ?auto_409604 ) ) ( not ( = ?auto_409598 ?auto_409599 ) ) ( not ( = ?auto_409598 ?auto_409600 ) ) ( not ( = ?auto_409598 ?auto_409601 ) ) ( not ( = ?auto_409598 ?auto_409602 ) ) ( not ( = ?auto_409598 ?auto_409603 ) ) ( not ( = ?auto_409598 ?auto_409604 ) ) ( not ( = ?auto_409599 ?auto_409600 ) ) ( not ( = ?auto_409599 ?auto_409601 ) ) ( not ( = ?auto_409599 ?auto_409602 ) ) ( not ( = ?auto_409599 ?auto_409603 ) ) ( not ( = ?auto_409599 ?auto_409604 ) ) ( not ( = ?auto_409600 ?auto_409601 ) ) ( not ( = ?auto_409600 ?auto_409602 ) ) ( not ( = ?auto_409600 ?auto_409603 ) ) ( not ( = ?auto_409600 ?auto_409604 ) ) ( not ( = ?auto_409601 ?auto_409602 ) ) ( not ( = ?auto_409601 ?auto_409603 ) ) ( not ( = ?auto_409601 ?auto_409604 ) ) ( not ( = ?auto_409602 ?auto_409603 ) ) ( not ( = ?auto_409602 ?auto_409604 ) ) ( not ( = ?auto_409603 ?auto_409604 ) ) ( ON ?auto_409602 ?auto_409603 ) ( ON ?auto_409601 ?auto_409602 ) ( ON ?auto_409600 ?auto_409601 ) ( ON ?auto_409599 ?auto_409600 ) ( ON ?auto_409598 ?auto_409599 ) ( ON ?auto_409597 ?auto_409598 ) ( ON ?auto_409596 ?auto_409597 ) ( CLEAR ?auto_409594 ) ( ON ?auto_409595 ?auto_409596 ) ( CLEAR ?auto_409595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_409593 ?auto_409594 ?auto_409595 )
      ( MAKE-11PILE ?auto_409593 ?auto_409594 ?auto_409595 ?auto_409596 ?auto_409597 ?auto_409598 ?auto_409599 ?auto_409600 ?auto_409601 ?auto_409602 ?auto_409603 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409616 - BLOCK
      ?auto_409617 - BLOCK
      ?auto_409618 - BLOCK
      ?auto_409619 - BLOCK
      ?auto_409620 - BLOCK
      ?auto_409621 - BLOCK
      ?auto_409622 - BLOCK
      ?auto_409623 - BLOCK
      ?auto_409624 - BLOCK
      ?auto_409625 - BLOCK
      ?auto_409626 - BLOCK
    )
    :vars
    (
      ?auto_409627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409626 ?auto_409627 ) ( ON-TABLE ?auto_409616 ) ( ON ?auto_409617 ?auto_409616 ) ( not ( = ?auto_409616 ?auto_409617 ) ) ( not ( = ?auto_409616 ?auto_409618 ) ) ( not ( = ?auto_409616 ?auto_409619 ) ) ( not ( = ?auto_409616 ?auto_409620 ) ) ( not ( = ?auto_409616 ?auto_409621 ) ) ( not ( = ?auto_409616 ?auto_409622 ) ) ( not ( = ?auto_409616 ?auto_409623 ) ) ( not ( = ?auto_409616 ?auto_409624 ) ) ( not ( = ?auto_409616 ?auto_409625 ) ) ( not ( = ?auto_409616 ?auto_409626 ) ) ( not ( = ?auto_409616 ?auto_409627 ) ) ( not ( = ?auto_409617 ?auto_409618 ) ) ( not ( = ?auto_409617 ?auto_409619 ) ) ( not ( = ?auto_409617 ?auto_409620 ) ) ( not ( = ?auto_409617 ?auto_409621 ) ) ( not ( = ?auto_409617 ?auto_409622 ) ) ( not ( = ?auto_409617 ?auto_409623 ) ) ( not ( = ?auto_409617 ?auto_409624 ) ) ( not ( = ?auto_409617 ?auto_409625 ) ) ( not ( = ?auto_409617 ?auto_409626 ) ) ( not ( = ?auto_409617 ?auto_409627 ) ) ( not ( = ?auto_409618 ?auto_409619 ) ) ( not ( = ?auto_409618 ?auto_409620 ) ) ( not ( = ?auto_409618 ?auto_409621 ) ) ( not ( = ?auto_409618 ?auto_409622 ) ) ( not ( = ?auto_409618 ?auto_409623 ) ) ( not ( = ?auto_409618 ?auto_409624 ) ) ( not ( = ?auto_409618 ?auto_409625 ) ) ( not ( = ?auto_409618 ?auto_409626 ) ) ( not ( = ?auto_409618 ?auto_409627 ) ) ( not ( = ?auto_409619 ?auto_409620 ) ) ( not ( = ?auto_409619 ?auto_409621 ) ) ( not ( = ?auto_409619 ?auto_409622 ) ) ( not ( = ?auto_409619 ?auto_409623 ) ) ( not ( = ?auto_409619 ?auto_409624 ) ) ( not ( = ?auto_409619 ?auto_409625 ) ) ( not ( = ?auto_409619 ?auto_409626 ) ) ( not ( = ?auto_409619 ?auto_409627 ) ) ( not ( = ?auto_409620 ?auto_409621 ) ) ( not ( = ?auto_409620 ?auto_409622 ) ) ( not ( = ?auto_409620 ?auto_409623 ) ) ( not ( = ?auto_409620 ?auto_409624 ) ) ( not ( = ?auto_409620 ?auto_409625 ) ) ( not ( = ?auto_409620 ?auto_409626 ) ) ( not ( = ?auto_409620 ?auto_409627 ) ) ( not ( = ?auto_409621 ?auto_409622 ) ) ( not ( = ?auto_409621 ?auto_409623 ) ) ( not ( = ?auto_409621 ?auto_409624 ) ) ( not ( = ?auto_409621 ?auto_409625 ) ) ( not ( = ?auto_409621 ?auto_409626 ) ) ( not ( = ?auto_409621 ?auto_409627 ) ) ( not ( = ?auto_409622 ?auto_409623 ) ) ( not ( = ?auto_409622 ?auto_409624 ) ) ( not ( = ?auto_409622 ?auto_409625 ) ) ( not ( = ?auto_409622 ?auto_409626 ) ) ( not ( = ?auto_409622 ?auto_409627 ) ) ( not ( = ?auto_409623 ?auto_409624 ) ) ( not ( = ?auto_409623 ?auto_409625 ) ) ( not ( = ?auto_409623 ?auto_409626 ) ) ( not ( = ?auto_409623 ?auto_409627 ) ) ( not ( = ?auto_409624 ?auto_409625 ) ) ( not ( = ?auto_409624 ?auto_409626 ) ) ( not ( = ?auto_409624 ?auto_409627 ) ) ( not ( = ?auto_409625 ?auto_409626 ) ) ( not ( = ?auto_409625 ?auto_409627 ) ) ( not ( = ?auto_409626 ?auto_409627 ) ) ( ON ?auto_409625 ?auto_409626 ) ( ON ?auto_409624 ?auto_409625 ) ( ON ?auto_409623 ?auto_409624 ) ( ON ?auto_409622 ?auto_409623 ) ( ON ?auto_409621 ?auto_409622 ) ( ON ?auto_409620 ?auto_409621 ) ( ON ?auto_409619 ?auto_409620 ) ( CLEAR ?auto_409617 ) ( ON ?auto_409618 ?auto_409619 ) ( CLEAR ?auto_409618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_409616 ?auto_409617 ?auto_409618 )
      ( MAKE-11PILE ?auto_409616 ?auto_409617 ?auto_409618 ?auto_409619 ?auto_409620 ?auto_409621 ?auto_409622 ?auto_409623 ?auto_409624 ?auto_409625 ?auto_409626 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409639 - BLOCK
      ?auto_409640 - BLOCK
      ?auto_409641 - BLOCK
      ?auto_409642 - BLOCK
      ?auto_409643 - BLOCK
      ?auto_409644 - BLOCK
      ?auto_409645 - BLOCK
      ?auto_409646 - BLOCK
      ?auto_409647 - BLOCK
      ?auto_409648 - BLOCK
      ?auto_409649 - BLOCK
    )
    :vars
    (
      ?auto_409650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409649 ?auto_409650 ) ( ON-TABLE ?auto_409639 ) ( not ( = ?auto_409639 ?auto_409640 ) ) ( not ( = ?auto_409639 ?auto_409641 ) ) ( not ( = ?auto_409639 ?auto_409642 ) ) ( not ( = ?auto_409639 ?auto_409643 ) ) ( not ( = ?auto_409639 ?auto_409644 ) ) ( not ( = ?auto_409639 ?auto_409645 ) ) ( not ( = ?auto_409639 ?auto_409646 ) ) ( not ( = ?auto_409639 ?auto_409647 ) ) ( not ( = ?auto_409639 ?auto_409648 ) ) ( not ( = ?auto_409639 ?auto_409649 ) ) ( not ( = ?auto_409639 ?auto_409650 ) ) ( not ( = ?auto_409640 ?auto_409641 ) ) ( not ( = ?auto_409640 ?auto_409642 ) ) ( not ( = ?auto_409640 ?auto_409643 ) ) ( not ( = ?auto_409640 ?auto_409644 ) ) ( not ( = ?auto_409640 ?auto_409645 ) ) ( not ( = ?auto_409640 ?auto_409646 ) ) ( not ( = ?auto_409640 ?auto_409647 ) ) ( not ( = ?auto_409640 ?auto_409648 ) ) ( not ( = ?auto_409640 ?auto_409649 ) ) ( not ( = ?auto_409640 ?auto_409650 ) ) ( not ( = ?auto_409641 ?auto_409642 ) ) ( not ( = ?auto_409641 ?auto_409643 ) ) ( not ( = ?auto_409641 ?auto_409644 ) ) ( not ( = ?auto_409641 ?auto_409645 ) ) ( not ( = ?auto_409641 ?auto_409646 ) ) ( not ( = ?auto_409641 ?auto_409647 ) ) ( not ( = ?auto_409641 ?auto_409648 ) ) ( not ( = ?auto_409641 ?auto_409649 ) ) ( not ( = ?auto_409641 ?auto_409650 ) ) ( not ( = ?auto_409642 ?auto_409643 ) ) ( not ( = ?auto_409642 ?auto_409644 ) ) ( not ( = ?auto_409642 ?auto_409645 ) ) ( not ( = ?auto_409642 ?auto_409646 ) ) ( not ( = ?auto_409642 ?auto_409647 ) ) ( not ( = ?auto_409642 ?auto_409648 ) ) ( not ( = ?auto_409642 ?auto_409649 ) ) ( not ( = ?auto_409642 ?auto_409650 ) ) ( not ( = ?auto_409643 ?auto_409644 ) ) ( not ( = ?auto_409643 ?auto_409645 ) ) ( not ( = ?auto_409643 ?auto_409646 ) ) ( not ( = ?auto_409643 ?auto_409647 ) ) ( not ( = ?auto_409643 ?auto_409648 ) ) ( not ( = ?auto_409643 ?auto_409649 ) ) ( not ( = ?auto_409643 ?auto_409650 ) ) ( not ( = ?auto_409644 ?auto_409645 ) ) ( not ( = ?auto_409644 ?auto_409646 ) ) ( not ( = ?auto_409644 ?auto_409647 ) ) ( not ( = ?auto_409644 ?auto_409648 ) ) ( not ( = ?auto_409644 ?auto_409649 ) ) ( not ( = ?auto_409644 ?auto_409650 ) ) ( not ( = ?auto_409645 ?auto_409646 ) ) ( not ( = ?auto_409645 ?auto_409647 ) ) ( not ( = ?auto_409645 ?auto_409648 ) ) ( not ( = ?auto_409645 ?auto_409649 ) ) ( not ( = ?auto_409645 ?auto_409650 ) ) ( not ( = ?auto_409646 ?auto_409647 ) ) ( not ( = ?auto_409646 ?auto_409648 ) ) ( not ( = ?auto_409646 ?auto_409649 ) ) ( not ( = ?auto_409646 ?auto_409650 ) ) ( not ( = ?auto_409647 ?auto_409648 ) ) ( not ( = ?auto_409647 ?auto_409649 ) ) ( not ( = ?auto_409647 ?auto_409650 ) ) ( not ( = ?auto_409648 ?auto_409649 ) ) ( not ( = ?auto_409648 ?auto_409650 ) ) ( not ( = ?auto_409649 ?auto_409650 ) ) ( ON ?auto_409648 ?auto_409649 ) ( ON ?auto_409647 ?auto_409648 ) ( ON ?auto_409646 ?auto_409647 ) ( ON ?auto_409645 ?auto_409646 ) ( ON ?auto_409644 ?auto_409645 ) ( ON ?auto_409643 ?auto_409644 ) ( ON ?auto_409642 ?auto_409643 ) ( ON ?auto_409641 ?auto_409642 ) ( CLEAR ?auto_409639 ) ( ON ?auto_409640 ?auto_409641 ) ( CLEAR ?auto_409640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_409639 ?auto_409640 )
      ( MAKE-11PILE ?auto_409639 ?auto_409640 ?auto_409641 ?auto_409642 ?auto_409643 ?auto_409644 ?auto_409645 ?auto_409646 ?auto_409647 ?auto_409648 ?auto_409649 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409662 - BLOCK
      ?auto_409663 - BLOCK
      ?auto_409664 - BLOCK
      ?auto_409665 - BLOCK
      ?auto_409666 - BLOCK
      ?auto_409667 - BLOCK
      ?auto_409668 - BLOCK
      ?auto_409669 - BLOCK
      ?auto_409670 - BLOCK
      ?auto_409671 - BLOCK
      ?auto_409672 - BLOCK
    )
    :vars
    (
      ?auto_409673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409672 ?auto_409673 ) ( ON-TABLE ?auto_409662 ) ( not ( = ?auto_409662 ?auto_409663 ) ) ( not ( = ?auto_409662 ?auto_409664 ) ) ( not ( = ?auto_409662 ?auto_409665 ) ) ( not ( = ?auto_409662 ?auto_409666 ) ) ( not ( = ?auto_409662 ?auto_409667 ) ) ( not ( = ?auto_409662 ?auto_409668 ) ) ( not ( = ?auto_409662 ?auto_409669 ) ) ( not ( = ?auto_409662 ?auto_409670 ) ) ( not ( = ?auto_409662 ?auto_409671 ) ) ( not ( = ?auto_409662 ?auto_409672 ) ) ( not ( = ?auto_409662 ?auto_409673 ) ) ( not ( = ?auto_409663 ?auto_409664 ) ) ( not ( = ?auto_409663 ?auto_409665 ) ) ( not ( = ?auto_409663 ?auto_409666 ) ) ( not ( = ?auto_409663 ?auto_409667 ) ) ( not ( = ?auto_409663 ?auto_409668 ) ) ( not ( = ?auto_409663 ?auto_409669 ) ) ( not ( = ?auto_409663 ?auto_409670 ) ) ( not ( = ?auto_409663 ?auto_409671 ) ) ( not ( = ?auto_409663 ?auto_409672 ) ) ( not ( = ?auto_409663 ?auto_409673 ) ) ( not ( = ?auto_409664 ?auto_409665 ) ) ( not ( = ?auto_409664 ?auto_409666 ) ) ( not ( = ?auto_409664 ?auto_409667 ) ) ( not ( = ?auto_409664 ?auto_409668 ) ) ( not ( = ?auto_409664 ?auto_409669 ) ) ( not ( = ?auto_409664 ?auto_409670 ) ) ( not ( = ?auto_409664 ?auto_409671 ) ) ( not ( = ?auto_409664 ?auto_409672 ) ) ( not ( = ?auto_409664 ?auto_409673 ) ) ( not ( = ?auto_409665 ?auto_409666 ) ) ( not ( = ?auto_409665 ?auto_409667 ) ) ( not ( = ?auto_409665 ?auto_409668 ) ) ( not ( = ?auto_409665 ?auto_409669 ) ) ( not ( = ?auto_409665 ?auto_409670 ) ) ( not ( = ?auto_409665 ?auto_409671 ) ) ( not ( = ?auto_409665 ?auto_409672 ) ) ( not ( = ?auto_409665 ?auto_409673 ) ) ( not ( = ?auto_409666 ?auto_409667 ) ) ( not ( = ?auto_409666 ?auto_409668 ) ) ( not ( = ?auto_409666 ?auto_409669 ) ) ( not ( = ?auto_409666 ?auto_409670 ) ) ( not ( = ?auto_409666 ?auto_409671 ) ) ( not ( = ?auto_409666 ?auto_409672 ) ) ( not ( = ?auto_409666 ?auto_409673 ) ) ( not ( = ?auto_409667 ?auto_409668 ) ) ( not ( = ?auto_409667 ?auto_409669 ) ) ( not ( = ?auto_409667 ?auto_409670 ) ) ( not ( = ?auto_409667 ?auto_409671 ) ) ( not ( = ?auto_409667 ?auto_409672 ) ) ( not ( = ?auto_409667 ?auto_409673 ) ) ( not ( = ?auto_409668 ?auto_409669 ) ) ( not ( = ?auto_409668 ?auto_409670 ) ) ( not ( = ?auto_409668 ?auto_409671 ) ) ( not ( = ?auto_409668 ?auto_409672 ) ) ( not ( = ?auto_409668 ?auto_409673 ) ) ( not ( = ?auto_409669 ?auto_409670 ) ) ( not ( = ?auto_409669 ?auto_409671 ) ) ( not ( = ?auto_409669 ?auto_409672 ) ) ( not ( = ?auto_409669 ?auto_409673 ) ) ( not ( = ?auto_409670 ?auto_409671 ) ) ( not ( = ?auto_409670 ?auto_409672 ) ) ( not ( = ?auto_409670 ?auto_409673 ) ) ( not ( = ?auto_409671 ?auto_409672 ) ) ( not ( = ?auto_409671 ?auto_409673 ) ) ( not ( = ?auto_409672 ?auto_409673 ) ) ( ON ?auto_409671 ?auto_409672 ) ( ON ?auto_409670 ?auto_409671 ) ( ON ?auto_409669 ?auto_409670 ) ( ON ?auto_409668 ?auto_409669 ) ( ON ?auto_409667 ?auto_409668 ) ( ON ?auto_409666 ?auto_409667 ) ( ON ?auto_409665 ?auto_409666 ) ( ON ?auto_409664 ?auto_409665 ) ( CLEAR ?auto_409662 ) ( ON ?auto_409663 ?auto_409664 ) ( CLEAR ?auto_409663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_409662 ?auto_409663 )
      ( MAKE-11PILE ?auto_409662 ?auto_409663 ?auto_409664 ?auto_409665 ?auto_409666 ?auto_409667 ?auto_409668 ?auto_409669 ?auto_409670 ?auto_409671 ?auto_409672 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409685 - BLOCK
      ?auto_409686 - BLOCK
      ?auto_409687 - BLOCK
      ?auto_409688 - BLOCK
      ?auto_409689 - BLOCK
      ?auto_409690 - BLOCK
      ?auto_409691 - BLOCK
      ?auto_409692 - BLOCK
      ?auto_409693 - BLOCK
      ?auto_409694 - BLOCK
      ?auto_409695 - BLOCK
    )
    :vars
    (
      ?auto_409696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409695 ?auto_409696 ) ( not ( = ?auto_409685 ?auto_409686 ) ) ( not ( = ?auto_409685 ?auto_409687 ) ) ( not ( = ?auto_409685 ?auto_409688 ) ) ( not ( = ?auto_409685 ?auto_409689 ) ) ( not ( = ?auto_409685 ?auto_409690 ) ) ( not ( = ?auto_409685 ?auto_409691 ) ) ( not ( = ?auto_409685 ?auto_409692 ) ) ( not ( = ?auto_409685 ?auto_409693 ) ) ( not ( = ?auto_409685 ?auto_409694 ) ) ( not ( = ?auto_409685 ?auto_409695 ) ) ( not ( = ?auto_409685 ?auto_409696 ) ) ( not ( = ?auto_409686 ?auto_409687 ) ) ( not ( = ?auto_409686 ?auto_409688 ) ) ( not ( = ?auto_409686 ?auto_409689 ) ) ( not ( = ?auto_409686 ?auto_409690 ) ) ( not ( = ?auto_409686 ?auto_409691 ) ) ( not ( = ?auto_409686 ?auto_409692 ) ) ( not ( = ?auto_409686 ?auto_409693 ) ) ( not ( = ?auto_409686 ?auto_409694 ) ) ( not ( = ?auto_409686 ?auto_409695 ) ) ( not ( = ?auto_409686 ?auto_409696 ) ) ( not ( = ?auto_409687 ?auto_409688 ) ) ( not ( = ?auto_409687 ?auto_409689 ) ) ( not ( = ?auto_409687 ?auto_409690 ) ) ( not ( = ?auto_409687 ?auto_409691 ) ) ( not ( = ?auto_409687 ?auto_409692 ) ) ( not ( = ?auto_409687 ?auto_409693 ) ) ( not ( = ?auto_409687 ?auto_409694 ) ) ( not ( = ?auto_409687 ?auto_409695 ) ) ( not ( = ?auto_409687 ?auto_409696 ) ) ( not ( = ?auto_409688 ?auto_409689 ) ) ( not ( = ?auto_409688 ?auto_409690 ) ) ( not ( = ?auto_409688 ?auto_409691 ) ) ( not ( = ?auto_409688 ?auto_409692 ) ) ( not ( = ?auto_409688 ?auto_409693 ) ) ( not ( = ?auto_409688 ?auto_409694 ) ) ( not ( = ?auto_409688 ?auto_409695 ) ) ( not ( = ?auto_409688 ?auto_409696 ) ) ( not ( = ?auto_409689 ?auto_409690 ) ) ( not ( = ?auto_409689 ?auto_409691 ) ) ( not ( = ?auto_409689 ?auto_409692 ) ) ( not ( = ?auto_409689 ?auto_409693 ) ) ( not ( = ?auto_409689 ?auto_409694 ) ) ( not ( = ?auto_409689 ?auto_409695 ) ) ( not ( = ?auto_409689 ?auto_409696 ) ) ( not ( = ?auto_409690 ?auto_409691 ) ) ( not ( = ?auto_409690 ?auto_409692 ) ) ( not ( = ?auto_409690 ?auto_409693 ) ) ( not ( = ?auto_409690 ?auto_409694 ) ) ( not ( = ?auto_409690 ?auto_409695 ) ) ( not ( = ?auto_409690 ?auto_409696 ) ) ( not ( = ?auto_409691 ?auto_409692 ) ) ( not ( = ?auto_409691 ?auto_409693 ) ) ( not ( = ?auto_409691 ?auto_409694 ) ) ( not ( = ?auto_409691 ?auto_409695 ) ) ( not ( = ?auto_409691 ?auto_409696 ) ) ( not ( = ?auto_409692 ?auto_409693 ) ) ( not ( = ?auto_409692 ?auto_409694 ) ) ( not ( = ?auto_409692 ?auto_409695 ) ) ( not ( = ?auto_409692 ?auto_409696 ) ) ( not ( = ?auto_409693 ?auto_409694 ) ) ( not ( = ?auto_409693 ?auto_409695 ) ) ( not ( = ?auto_409693 ?auto_409696 ) ) ( not ( = ?auto_409694 ?auto_409695 ) ) ( not ( = ?auto_409694 ?auto_409696 ) ) ( not ( = ?auto_409695 ?auto_409696 ) ) ( ON ?auto_409694 ?auto_409695 ) ( ON ?auto_409693 ?auto_409694 ) ( ON ?auto_409692 ?auto_409693 ) ( ON ?auto_409691 ?auto_409692 ) ( ON ?auto_409690 ?auto_409691 ) ( ON ?auto_409689 ?auto_409690 ) ( ON ?auto_409688 ?auto_409689 ) ( ON ?auto_409687 ?auto_409688 ) ( ON ?auto_409686 ?auto_409687 ) ( ON ?auto_409685 ?auto_409686 ) ( CLEAR ?auto_409685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_409685 )
      ( MAKE-11PILE ?auto_409685 ?auto_409686 ?auto_409687 ?auto_409688 ?auto_409689 ?auto_409690 ?auto_409691 ?auto_409692 ?auto_409693 ?auto_409694 ?auto_409695 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_409708 - BLOCK
      ?auto_409709 - BLOCK
      ?auto_409710 - BLOCK
      ?auto_409711 - BLOCK
      ?auto_409712 - BLOCK
      ?auto_409713 - BLOCK
      ?auto_409714 - BLOCK
      ?auto_409715 - BLOCK
      ?auto_409716 - BLOCK
      ?auto_409717 - BLOCK
      ?auto_409718 - BLOCK
    )
    :vars
    (
      ?auto_409719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409718 ?auto_409719 ) ( not ( = ?auto_409708 ?auto_409709 ) ) ( not ( = ?auto_409708 ?auto_409710 ) ) ( not ( = ?auto_409708 ?auto_409711 ) ) ( not ( = ?auto_409708 ?auto_409712 ) ) ( not ( = ?auto_409708 ?auto_409713 ) ) ( not ( = ?auto_409708 ?auto_409714 ) ) ( not ( = ?auto_409708 ?auto_409715 ) ) ( not ( = ?auto_409708 ?auto_409716 ) ) ( not ( = ?auto_409708 ?auto_409717 ) ) ( not ( = ?auto_409708 ?auto_409718 ) ) ( not ( = ?auto_409708 ?auto_409719 ) ) ( not ( = ?auto_409709 ?auto_409710 ) ) ( not ( = ?auto_409709 ?auto_409711 ) ) ( not ( = ?auto_409709 ?auto_409712 ) ) ( not ( = ?auto_409709 ?auto_409713 ) ) ( not ( = ?auto_409709 ?auto_409714 ) ) ( not ( = ?auto_409709 ?auto_409715 ) ) ( not ( = ?auto_409709 ?auto_409716 ) ) ( not ( = ?auto_409709 ?auto_409717 ) ) ( not ( = ?auto_409709 ?auto_409718 ) ) ( not ( = ?auto_409709 ?auto_409719 ) ) ( not ( = ?auto_409710 ?auto_409711 ) ) ( not ( = ?auto_409710 ?auto_409712 ) ) ( not ( = ?auto_409710 ?auto_409713 ) ) ( not ( = ?auto_409710 ?auto_409714 ) ) ( not ( = ?auto_409710 ?auto_409715 ) ) ( not ( = ?auto_409710 ?auto_409716 ) ) ( not ( = ?auto_409710 ?auto_409717 ) ) ( not ( = ?auto_409710 ?auto_409718 ) ) ( not ( = ?auto_409710 ?auto_409719 ) ) ( not ( = ?auto_409711 ?auto_409712 ) ) ( not ( = ?auto_409711 ?auto_409713 ) ) ( not ( = ?auto_409711 ?auto_409714 ) ) ( not ( = ?auto_409711 ?auto_409715 ) ) ( not ( = ?auto_409711 ?auto_409716 ) ) ( not ( = ?auto_409711 ?auto_409717 ) ) ( not ( = ?auto_409711 ?auto_409718 ) ) ( not ( = ?auto_409711 ?auto_409719 ) ) ( not ( = ?auto_409712 ?auto_409713 ) ) ( not ( = ?auto_409712 ?auto_409714 ) ) ( not ( = ?auto_409712 ?auto_409715 ) ) ( not ( = ?auto_409712 ?auto_409716 ) ) ( not ( = ?auto_409712 ?auto_409717 ) ) ( not ( = ?auto_409712 ?auto_409718 ) ) ( not ( = ?auto_409712 ?auto_409719 ) ) ( not ( = ?auto_409713 ?auto_409714 ) ) ( not ( = ?auto_409713 ?auto_409715 ) ) ( not ( = ?auto_409713 ?auto_409716 ) ) ( not ( = ?auto_409713 ?auto_409717 ) ) ( not ( = ?auto_409713 ?auto_409718 ) ) ( not ( = ?auto_409713 ?auto_409719 ) ) ( not ( = ?auto_409714 ?auto_409715 ) ) ( not ( = ?auto_409714 ?auto_409716 ) ) ( not ( = ?auto_409714 ?auto_409717 ) ) ( not ( = ?auto_409714 ?auto_409718 ) ) ( not ( = ?auto_409714 ?auto_409719 ) ) ( not ( = ?auto_409715 ?auto_409716 ) ) ( not ( = ?auto_409715 ?auto_409717 ) ) ( not ( = ?auto_409715 ?auto_409718 ) ) ( not ( = ?auto_409715 ?auto_409719 ) ) ( not ( = ?auto_409716 ?auto_409717 ) ) ( not ( = ?auto_409716 ?auto_409718 ) ) ( not ( = ?auto_409716 ?auto_409719 ) ) ( not ( = ?auto_409717 ?auto_409718 ) ) ( not ( = ?auto_409717 ?auto_409719 ) ) ( not ( = ?auto_409718 ?auto_409719 ) ) ( ON ?auto_409717 ?auto_409718 ) ( ON ?auto_409716 ?auto_409717 ) ( ON ?auto_409715 ?auto_409716 ) ( ON ?auto_409714 ?auto_409715 ) ( ON ?auto_409713 ?auto_409714 ) ( ON ?auto_409712 ?auto_409713 ) ( ON ?auto_409711 ?auto_409712 ) ( ON ?auto_409710 ?auto_409711 ) ( ON ?auto_409709 ?auto_409710 ) ( ON ?auto_409708 ?auto_409709 ) ( CLEAR ?auto_409708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_409708 )
      ( MAKE-11PILE ?auto_409708 ?auto_409709 ?auto_409710 ?auto_409711 ?auto_409712 ?auto_409713 ?auto_409714 ?auto_409715 ?auto_409716 ?auto_409717 ?auto_409718 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409732 - BLOCK
      ?auto_409733 - BLOCK
      ?auto_409734 - BLOCK
      ?auto_409735 - BLOCK
      ?auto_409736 - BLOCK
      ?auto_409737 - BLOCK
      ?auto_409738 - BLOCK
      ?auto_409739 - BLOCK
      ?auto_409740 - BLOCK
      ?auto_409741 - BLOCK
      ?auto_409742 - BLOCK
      ?auto_409743 - BLOCK
    )
    :vars
    (
      ?auto_409744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_409742 ) ( ON ?auto_409743 ?auto_409744 ) ( CLEAR ?auto_409743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_409732 ) ( ON ?auto_409733 ?auto_409732 ) ( ON ?auto_409734 ?auto_409733 ) ( ON ?auto_409735 ?auto_409734 ) ( ON ?auto_409736 ?auto_409735 ) ( ON ?auto_409737 ?auto_409736 ) ( ON ?auto_409738 ?auto_409737 ) ( ON ?auto_409739 ?auto_409738 ) ( ON ?auto_409740 ?auto_409739 ) ( ON ?auto_409741 ?auto_409740 ) ( ON ?auto_409742 ?auto_409741 ) ( not ( = ?auto_409732 ?auto_409733 ) ) ( not ( = ?auto_409732 ?auto_409734 ) ) ( not ( = ?auto_409732 ?auto_409735 ) ) ( not ( = ?auto_409732 ?auto_409736 ) ) ( not ( = ?auto_409732 ?auto_409737 ) ) ( not ( = ?auto_409732 ?auto_409738 ) ) ( not ( = ?auto_409732 ?auto_409739 ) ) ( not ( = ?auto_409732 ?auto_409740 ) ) ( not ( = ?auto_409732 ?auto_409741 ) ) ( not ( = ?auto_409732 ?auto_409742 ) ) ( not ( = ?auto_409732 ?auto_409743 ) ) ( not ( = ?auto_409732 ?auto_409744 ) ) ( not ( = ?auto_409733 ?auto_409734 ) ) ( not ( = ?auto_409733 ?auto_409735 ) ) ( not ( = ?auto_409733 ?auto_409736 ) ) ( not ( = ?auto_409733 ?auto_409737 ) ) ( not ( = ?auto_409733 ?auto_409738 ) ) ( not ( = ?auto_409733 ?auto_409739 ) ) ( not ( = ?auto_409733 ?auto_409740 ) ) ( not ( = ?auto_409733 ?auto_409741 ) ) ( not ( = ?auto_409733 ?auto_409742 ) ) ( not ( = ?auto_409733 ?auto_409743 ) ) ( not ( = ?auto_409733 ?auto_409744 ) ) ( not ( = ?auto_409734 ?auto_409735 ) ) ( not ( = ?auto_409734 ?auto_409736 ) ) ( not ( = ?auto_409734 ?auto_409737 ) ) ( not ( = ?auto_409734 ?auto_409738 ) ) ( not ( = ?auto_409734 ?auto_409739 ) ) ( not ( = ?auto_409734 ?auto_409740 ) ) ( not ( = ?auto_409734 ?auto_409741 ) ) ( not ( = ?auto_409734 ?auto_409742 ) ) ( not ( = ?auto_409734 ?auto_409743 ) ) ( not ( = ?auto_409734 ?auto_409744 ) ) ( not ( = ?auto_409735 ?auto_409736 ) ) ( not ( = ?auto_409735 ?auto_409737 ) ) ( not ( = ?auto_409735 ?auto_409738 ) ) ( not ( = ?auto_409735 ?auto_409739 ) ) ( not ( = ?auto_409735 ?auto_409740 ) ) ( not ( = ?auto_409735 ?auto_409741 ) ) ( not ( = ?auto_409735 ?auto_409742 ) ) ( not ( = ?auto_409735 ?auto_409743 ) ) ( not ( = ?auto_409735 ?auto_409744 ) ) ( not ( = ?auto_409736 ?auto_409737 ) ) ( not ( = ?auto_409736 ?auto_409738 ) ) ( not ( = ?auto_409736 ?auto_409739 ) ) ( not ( = ?auto_409736 ?auto_409740 ) ) ( not ( = ?auto_409736 ?auto_409741 ) ) ( not ( = ?auto_409736 ?auto_409742 ) ) ( not ( = ?auto_409736 ?auto_409743 ) ) ( not ( = ?auto_409736 ?auto_409744 ) ) ( not ( = ?auto_409737 ?auto_409738 ) ) ( not ( = ?auto_409737 ?auto_409739 ) ) ( not ( = ?auto_409737 ?auto_409740 ) ) ( not ( = ?auto_409737 ?auto_409741 ) ) ( not ( = ?auto_409737 ?auto_409742 ) ) ( not ( = ?auto_409737 ?auto_409743 ) ) ( not ( = ?auto_409737 ?auto_409744 ) ) ( not ( = ?auto_409738 ?auto_409739 ) ) ( not ( = ?auto_409738 ?auto_409740 ) ) ( not ( = ?auto_409738 ?auto_409741 ) ) ( not ( = ?auto_409738 ?auto_409742 ) ) ( not ( = ?auto_409738 ?auto_409743 ) ) ( not ( = ?auto_409738 ?auto_409744 ) ) ( not ( = ?auto_409739 ?auto_409740 ) ) ( not ( = ?auto_409739 ?auto_409741 ) ) ( not ( = ?auto_409739 ?auto_409742 ) ) ( not ( = ?auto_409739 ?auto_409743 ) ) ( not ( = ?auto_409739 ?auto_409744 ) ) ( not ( = ?auto_409740 ?auto_409741 ) ) ( not ( = ?auto_409740 ?auto_409742 ) ) ( not ( = ?auto_409740 ?auto_409743 ) ) ( not ( = ?auto_409740 ?auto_409744 ) ) ( not ( = ?auto_409741 ?auto_409742 ) ) ( not ( = ?auto_409741 ?auto_409743 ) ) ( not ( = ?auto_409741 ?auto_409744 ) ) ( not ( = ?auto_409742 ?auto_409743 ) ) ( not ( = ?auto_409742 ?auto_409744 ) ) ( not ( = ?auto_409743 ?auto_409744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_409743 ?auto_409744 )
      ( !STACK ?auto_409743 ?auto_409742 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409757 - BLOCK
      ?auto_409758 - BLOCK
      ?auto_409759 - BLOCK
      ?auto_409760 - BLOCK
      ?auto_409761 - BLOCK
      ?auto_409762 - BLOCK
      ?auto_409763 - BLOCK
      ?auto_409764 - BLOCK
      ?auto_409765 - BLOCK
      ?auto_409766 - BLOCK
      ?auto_409767 - BLOCK
      ?auto_409768 - BLOCK
    )
    :vars
    (
      ?auto_409769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_409767 ) ( ON ?auto_409768 ?auto_409769 ) ( CLEAR ?auto_409768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_409757 ) ( ON ?auto_409758 ?auto_409757 ) ( ON ?auto_409759 ?auto_409758 ) ( ON ?auto_409760 ?auto_409759 ) ( ON ?auto_409761 ?auto_409760 ) ( ON ?auto_409762 ?auto_409761 ) ( ON ?auto_409763 ?auto_409762 ) ( ON ?auto_409764 ?auto_409763 ) ( ON ?auto_409765 ?auto_409764 ) ( ON ?auto_409766 ?auto_409765 ) ( ON ?auto_409767 ?auto_409766 ) ( not ( = ?auto_409757 ?auto_409758 ) ) ( not ( = ?auto_409757 ?auto_409759 ) ) ( not ( = ?auto_409757 ?auto_409760 ) ) ( not ( = ?auto_409757 ?auto_409761 ) ) ( not ( = ?auto_409757 ?auto_409762 ) ) ( not ( = ?auto_409757 ?auto_409763 ) ) ( not ( = ?auto_409757 ?auto_409764 ) ) ( not ( = ?auto_409757 ?auto_409765 ) ) ( not ( = ?auto_409757 ?auto_409766 ) ) ( not ( = ?auto_409757 ?auto_409767 ) ) ( not ( = ?auto_409757 ?auto_409768 ) ) ( not ( = ?auto_409757 ?auto_409769 ) ) ( not ( = ?auto_409758 ?auto_409759 ) ) ( not ( = ?auto_409758 ?auto_409760 ) ) ( not ( = ?auto_409758 ?auto_409761 ) ) ( not ( = ?auto_409758 ?auto_409762 ) ) ( not ( = ?auto_409758 ?auto_409763 ) ) ( not ( = ?auto_409758 ?auto_409764 ) ) ( not ( = ?auto_409758 ?auto_409765 ) ) ( not ( = ?auto_409758 ?auto_409766 ) ) ( not ( = ?auto_409758 ?auto_409767 ) ) ( not ( = ?auto_409758 ?auto_409768 ) ) ( not ( = ?auto_409758 ?auto_409769 ) ) ( not ( = ?auto_409759 ?auto_409760 ) ) ( not ( = ?auto_409759 ?auto_409761 ) ) ( not ( = ?auto_409759 ?auto_409762 ) ) ( not ( = ?auto_409759 ?auto_409763 ) ) ( not ( = ?auto_409759 ?auto_409764 ) ) ( not ( = ?auto_409759 ?auto_409765 ) ) ( not ( = ?auto_409759 ?auto_409766 ) ) ( not ( = ?auto_409759 ?auto_409767 ) ) ( not ( = ?auto_409759 ?auto_409768 ) ) ( not ( = ?auto_409759 ?auto_409769 ) ) ( not ( = ?auto_409760 ?auto_409761 ) ) ( not ( = ?auto_409760 ?auto_409762 ) ) ( not ( = ?auto_409760 ?auto_409763 ) ) ( not ( = ?auto_409760 ?auto_409764 ) ) ( not ( = ?auto_409760 ?auto_409765 ) ) ( not ( = ?auto_409760 ?auto_409766 ) ) ( not ( = ?auto_409760 ?auto_409767 ) ) ( not ( = ?auto_409760 ?auto_409768 ) ) ( not ( = ?auto_409760 ?auto_409769 ) ) ( not ( = ?auto_409761 ?auto_409762 ) ) ( not ( = ?auto_409761 ?auto_409763 ) ) ( not ( = ?auto_409761 ?auto_409764 ) ) ( not ( = ?auto_409761 ?auto_409765 ) ) ( not ( = ?auto_409761 ?auto_409766 ) ) ( not ( = ?auto_409761 ?auto_409767 ) ) ( not ( = ?auto_409761 ?auto_409768 ) ) ( not ( = ?auto_409761 ?auto_409769 ) ) ( not ( = ?auto_409762 ?auto_409763 ) ) ( not ( = ?auto_409762 ?auto_409764 ) ) ( not ( = ?auto_409762 ?auto_409765 ) ) ( not ( = ?auto_409762 ?auto_409766 ) ) ( not ( = ?auto_409762 ?auto_409767 ) ) ( not ( = ?auto_409762 ?auto_409768 ) ) ( not ( = ?auto_409762 ?auto_409769 ) ) ( not ( = ?auto_409763 ?auto_409764 ) ) ( not ( = ?auto_409763 ?auto_409765 ) ) ( not ( = ?auto_409763 ?auto_409766 ) ) ( not ( = ?auto_409763 ?auto_409767 ) ) ( not ( = ?auto_409763 ?auto_409768 ) ) ( not ( = ?auto_409763 ?auto_409769 ) ) ( not ( = ?auto_409764 ?auto_409765 ) ) ( not ( = ?auto_409764 ?auto_409766 ) ) ( not ( = ?auto_409764 ?auto_409767 ) ) ( not ( = ?auto_409764 ?auto_409768 ) ) ( not ( = ?auto_409764 ?auto_409769 ) ) ( not ( = ?auto_409765 ?auto_409766 ) ) ( not ( = ?auto_409765 ?auto_409767 ) ) ( not ( = ?auto_409765 ?auto_409768 ) ) ( not ( = ?auto_409765 ?auto_409769 ) ) ( not ( = ?auto_409766 ?auto_409767 ) ) ( not ( = ?auto_409766 ?auto_409768 ) ) ( not ( = ?auto_409766 ?auto_409769 ) ) ( not ( = ?auto_409767 ?auto_409768 ) ) ( not ( = ?auto_409767 ?auto_409769 ) ) ( not ( = ?auto_409768 ?auto_409769 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_409768 ?auto_409769 )
      ( !STACK ?auto_409768 ?auto_409767 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409782 - BLOCK
      ?auto_409783 - BLOCK
      ?auto_409784 - BLOCK
      ?auto_409785 - BLOCK
      ?auto_409786 - BLOCK
      ?auto_409787 - BLOCK
      ?auto_409788 - BLOCK
      ?auto_409789 - BLOCK
      ?auto_409790 - BLOCK
      ?auto_409791 - BLOCK
      ?auto_409792 - BLOCK
      ?auto_409793 - BLOCK
    )
    :vars
    (
      ?auto_409794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409793 ?auto_409794 ) ( ON-TABLE ?auto_409782 ) ( ON ?auto_409783 ?auto_409782 ) ( ON ?auto_409784 ?auto_409783 ) ( ON ?auto_409785 ?auto_409784 ) ( ON ?auto_409786 ?auto_409785 ) ( ON ?auto_409787 ?auto_409786 ) ( ON ?auto_409788 ?auto_409787 ) ( ON ?auto_409789 ?auto_409788 ) ( ON ?auto_409790 ?auto_409789 ) ( ON ?auto_409791 ?auto_409790 ) ( not ( = ?auto_409782 ?auto_409783 ) ) ( not ( = ?auto_409782 ?auto_409784 ) ) ( not ( = ?auto_409782 ?auto_409785 ) ) ( not ( = ?auto_409782 ?auto_409786 ) ) ( not ( = ?auto_409782 ?auto_409787 ) ) ( not ( = ?auto_409782 ?auto_409788 ) ) ( not ( = ?auto_409782 ?auto_409789 ) ) ( not ( = ?auto_409782 ?auto_409790 ) ) ( not ( = ?auto_409782 ?auto_409791 ) ) ( not ( = ?auto_409782 ?auto_409792 ) ) ( not ( = ?auto_409782 ?auto_409793 ) ) ( not ( = ?auto_409782 ?auto_409794 ) ) ( not ( = ?auto_409783 ?auto_409784 ) ) ( not ( = ?auto_409783 ?auto_409785 ) ) ( not ( = ?auto_409783 ?auto_409786 ) ) ( not ( = ?auto_409783 ?auto_409787 ) ) ( not ( = ?auto_409783 ?auto_409788 ) ) ( not ( = ?auto_409783 ?auto_409789 ) ) ( not ( = ?auto_409783 ?auto_409790 ) ) ( not ( = ?auto_409783 ?auto_409791 ) ) ( not ( = ?auto_409783 ?auto_409792 ) ) ( not ( = ?auto_409783 ?auto_409793 ) ) ( not ( = ?auto_409783 ?auto_409794 ) ) ( not ( = ?auto_409784 ?auto_409785 ) ) ( not ( = ?auto_409784 ?auto_409786 ) ) ( not ( = ?auto_409784 ?auto_409787 ) ) ( not ( = ?auto_409784 ?auto_409788 ) ) ( not ( = ?auto_409784 ?auto_409789 ) ) ( not ( = ?auto_409784 ?auto_409790 ) ) ( not ( = ?auto_409784 ?auto_409791 ) ) ( not ( = ?auto_409784 ?auto_409792 ) ) ( not ( = ?auto_409784 ?auto_409793 ) ) ( not ( = ?auto_409784 ?auto_409794 ) ) ( not ( = ?auto_409785 ?auto_409786 ) ) ( not ( = ?auto_409785 ?auto_409787 ) ) ( not ( = ?auto_409785 ?auto_409788 ) ) ( not ( = ?auto_409785 ?auto_409789 ) ) ( not ( = ?auto_409785 ?auto_409790 ) ) ( not ( = ?auto_409785 ?auto_409791 ) ) ( not ( = ?auto_409785 ?auto_409792 ) ) ( not ( = ?auto_409785 ?auto_409793 ) ) ( not ( = ?auto_409785 ?auto_409794 ) ) ( not ( = ?auto_409786 ?auto_409787 ) ) ( not ( = ?auto_409786 ?auto_409788 ) ) ( not ( = ?auto_409786 ?auto_409789 ) ) ( not ( = ?auto_409786 ?auto_409790 ) ) ( not ( = ?auto_409786 ?auto_409791 ) ) ( not ( = ?auto_409786 ?auto_409792 ) ) ( not ( = ?auto_409786 ?auto_409793 ) ) ( not ( = ?auto_409786 ?auto_409794 ) ) ( not ( = ?auto_409787 ?auto_409788 ) ) ( not ( = ?auto_409787 ?auto_409789 ) ) ( not ( = ?auto_409787 ?auto_409790 ) ) ( not ( = ?auto_409787 ?auto_409791 ) ) ( not ( = ?auto_409787 ?auto_409792 ) ) ( not ( = ?auto_409787 ?auto_409793 ) ) ( not ( = ?auto_409787 ?auto_409794 ) ) ( not ( = ?auto_409788 ?auto_409789 ) ) ( not ( = ?auto_409788 ?auto_409790 ) ) ( not ( = ?auto_409788 ?auto_409791 ) ) ( not ( = ?auto_409788 ?auto_409792 ) ) ( not ( = ?auto_409788 ?auto_409793 ) ) ( not ( = ?auto_409788 ?auto_409794 ) ) ( not ( = ?auto_409789 ?auto_409790 ) ) ( not ( = ?auto_409789 ?auto_409791 ) ) ( not ( = ?auto_409789 ?auto_409792 ) ) ( not ( = ?auto_409789 ?auto_409793 ) ) ( not ( = ?auto_409789 ?auto_409794 ) ) ( not ( = ?auto_409790 ?auto_409791 ) ) ( not ( = ?auto_409790 ?auto_409792 ) ) ( not ( = ?auto_409790 ?auto_409793 ) ) ( not ( = ?auto_409790 ?auto_409794 ) ) ( not ( = ?auto_409791 ?auto_409792 ) ) ( not ( = ?auto_409791 ?auto_409793 ) ) ( not ( = ?auto_409791 ?auto_409794 ) ) ( not ( = ?auto_409792 ?auto_409793 ) ) ( not ( = ?auto_409792 ?auto_409794 ) ) ( not ( = ?auto_409793 ?auto_409794 ) ) ( CLEAR ?auto_409791 ) ( ON ?auto_409792 ?auto_409793 ) ( CLEAR ?auto_409792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_409782 ?auto_409783 ?auto_409784 ?auto_409785 ?auto_409786 ?auto_409787 ?auto_409788 ?auto_409789 ?auto_409790 ?auto_409791 ?auto_409792 )
      ( MAKE-12PILE ?auto_409782 ?auto_409783 ?auto_409784 ?auto_409785 ?auto_409786 ?auto_409787 ?auto_409788 ?auto_409789 ?auto_409790 ?auto_409791 ?auto_409792 ?auto_409793 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409807 - BLOCK
      ?auto_409808 - BLOCK
      ?auto_409809 - BLOCK
      ?auto_409810 - BLOCK
      ?auto_409811 - BLOCK
      ?auto_409812 - BLOCK
      ?auto_409813 - BLOCK
      ?auto_409814 - BLOCK
      ?auto_409815 - BLOCK
      ?auto_409816 - BLOCK
      ?auto_409817 - BLOCK
      ?auto_409818 - BLOCK
    )
    :vars
    (
      ?auto_409819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409818 ?auto_409819 ) ( ON-TABLE ?auto_409807 ) ( ON ?auto_409808 ?auto_409807 ) ( ON ?auto_409809 ?auto_409808 ) ( ON ?auto_409810 ?auto_409809 ) ( ON ?auto_409811 ?auto_409810 ) ( ON ?auto_409812 ?auto_409811 ) ( ON ?auto_409813 ?auto_409812 ) ( ON ?auto_409814 ?auto_409813 ) ( ON ?auto_409815 ?auto_409814 ) ( ON ?auto_409816 ?auto_409815 ) ( not ( = ?auto_409807 ?auto_409808 ) ) ( not ( = ?auto_409807 ?auto_409809 ) ) ( not ( = ?auto_409807 ?auto_409810 ) ) ( not ( = ?auto_409807 ?auto_409811 ) ) ( not ( = ?auto_409807 ?auto_409812 ) ) ( not ( = ?auto_409807 ?auto_409813 ) ) ( not ( = ?auto_409807 ?auto_409814 ) ) ( not ( = ?auto_409807 ?auto_409815 ) ) ( not ( = ?auto_409807 ?auto_409816 ) ) ( not ( = ?auto_409807 ?auto_409817 ) ) ( not ( = ?auto_409807 ?auto_409818 ) ) ( not ( = ?auto_409807 ?auto_409819 ) ) ( not ( = ?auto_409808 ?auto_409809 ) ) ( not ( = ?auto_409808 ?auto_409810 ) ) ( not ( = ?auto_409808 ?auto_409811 ) ) ( not ( = ?auto_409808 ?auto_409812 ) ) ( not ( = ?auto_409808 ?auto_409813 ) ) ( not ( = ?auto_409808 ?auto_409814 ) ) ( not ( = ?auto_409808 ?auto_409815 ) ) ( not ( = ?auto_409808 ?auto_409816 ) ) ( not ( = ?auto_409808 ?auto_409817 ) ) ( not ( = ?auto_409808 ?auto_409818 ) ) ( not ( = ?auto_409808 ?auto_409819 ) ) ( not ( = ?auto_409809 ?auto_409810 ) ) ( not ( = ?auto_409809 ?auto_409811 ) ) ( not ( = ?auto_409809 ?auto_409812 ) ) ( not ( = ?auto_409809 ?auto_409813 ) ) ( not ( = ?auto_409809 ?auto_409814 ) ) ( not ( = ?auto_409809 ?auto_409815 ) ) ( not ( = ?auto_409809 ?auto_409816 ) ) ( not ( = ?auto_409809 ?auto_409817 ) ) ( not ( = ?auto_409809 ?auto_409818 ) ) ( not ( = ?auto_409809 ?auto_409819 ) ) ( not ( = ?auto_409810 ?auto_409811 ) ) ( not ( = ?auto_409810 ?auto_409812 ) ) ( not ( = ?auto_409810 ?auto_409813 ) ) ( not ( = ?auto_409810 ?auto_409814 ) ) ( not ( = ?auto_409810 ?auto_409815 ) ) ( not ( = ?auto_409810 ?auto_409816 ) ) ( not ( = ?auto_409810 ?auto_409817 ) ) ( not ( = ?auto_409810 ?auto_409818 ) ) ( not ( = ?auto_409810 ?auto_409819 ) ) ( not ( = ?auto_409811 ?auto_409812 ) ) ( not ( = ?auto_409811 ?auto_409813 ) ) ( not ( = ?auto_409811 ?auto_409814 ) ) ( not ( = ?auto_409811 ?auto_409815 ) ) ( not ( = ?auto_409811 ?auto_409816 ) ) ( not ( = ?auto_409811 ?auto_409817 ) ) ( not ( = ?auto_409811 ?auto_409818 ) ) ( not ( = ?auto_409811 ?auto_409819 ) ) ( not ( = ?auto_409812 ?auto_409813 ) ) ( not ( = ?auto_409812 ?auto_409814 ) ) ( not ( = ?auto_409812 ?auto_409815 ) ) ( not ( = ?auto_409812 ?auto_409816 ) ) ( not ( = ?auto_409812 ?auto_409817 ) ) ( not ( = ?auto_409812 ?auto_409818 ) ) ( not ( = ?auto_409812 ?auto_409819 ) ) ( not ( = ?auto_409813 ?auto_409814 ) ) ( not ( = ?auto_409813 ?auto_409815 ) ) ( not ( = ?auto_409813 ?auto_409816 ) ) ( not ( = ?auto_409813 ?auto_409817 ) ) ( not ( = ?auto_409813 ?auto_409818 ) ) ( not ( = ?auto_409813 ?auto_409819 ) ) ( not ( = ?auto_409814 ?auto_409815 ) ) ( not ( = ?auto_409814 ?auto_409816 ) ) ( not ( = ?auto_409814 ?auto_409817 ) ) ( not ( = ?auto_409814 ?auto_409818 ) ) ( not ( = ?auto_409814 ?auto_409819 ) ) ( not ( = ?auto_409815 ?auto_409816 ) ) ( not ( = ?auto_409815 ?auto_409817 ) ) ( not ( = ?auto_409815 ?auto_409818 ) ) ( not ( = ?auto_409815 ?auto_409819 ) ) ( not ( = ?auto_409816 ?auto_409817 ) ) ( not ( = ?auto_409816 ?auto_409818 ) ) ( not ( = ?auto_409816 ?auto_409819 ) ) ( not ( = ?auto_409817 ?auto_409818 ) ) ( not ( = ?auto_409817 ?auto_409819 ) ) ( not ( = ?auto_409818 ?auto_409819 ) ) ( CLEAR ?auto_409816 ) ( ON ?auto_409817 ?auto_409818 ) ( CLEAR ?auto_409817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_409807 ?auto_409808 ?auto_409809 ?auto_409810 ?auto_409811 ?auto_409812 ?auto_409813 ?auto_409814 ?auto_409815 ?auto_409816 ?auto_409817 )
      ( MAKE-12PILE ?auto_409807 ?auto_409808 ?auto_409809 ?auto_409810 ?auto_409811 ?auto_409812 ?auto_409813 ?auto_409814 ?auto_409815 ?auto_409816 ?auto_409817 ?auto_409818 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409832 - BLOCK
      ?auto_409833 - BLOCK
      ?auto_409834 - BLOCK
      ?auto_409835 - BLOCK
      ?auto_409836 - BLOCK
      ?auto_409837 - BLOCK
      ?auto_409838 - BLOCK
      ?auto_409839 - BLOCK
      ?auto_409840 - BLOCK
      ?auto_409841 - BLOCK
      ?auto_409842 - BLOCK
      ?auto_409843 - BLOCK
    )
    :vars
    (
      ?auto_409844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409843 ?auto_409844 ) ( ON-TABLE ?auto_409832 ) ( ON ?auto_409833 ?auto_409832 ) ( ON ?auto_409834 ?auto_409833 ) ( ON ?auto_409835 ?auto_409834 ) ( ON ?auto_409836 ?auto_409835 ) ( ON ?auto_409837 ?auto_409836 ) ( ON ?auto_409838 ?auto_409837 ) ( ON ?auto_409839 ?auto_409838 ) ( ON ?auto_409840 ?auto_409839 ) ( not ( = ?auto_409832 ?auto_409833 ) ) ( not ( = ?auto_409832 ?auto_409834 ) ) ( not ( = ?auto_409832 ?auto_409835 ) ) ( not ( = ?auto_409832 ?auto_409836 ) ) ( not ( = ?auto_409832 ?auto_409837 ) ) ( not ( = ?auto_409832 ?auto_409838 ) ) ( not ( = ?auto_409832 ?auto_409839 ) ) ( not ( = ?auto_409832 ?auto_409840 ) ) ( not ( = ?auto_409832 ?auto_409841 ) ) ( not ( = ?auto_409832 ?auto_409842 ) ) ( not ( = ?auto_409832 ?auto_409843 ) ) ( not ( = ?auto_409832 ?auto_409844 ) ) ( not ( = ?auto_409833 ?auto_409834 ) ) ( not ( = ?auto_409833 ?auto_409835 ) ) ( not ( = ?auto_409833 ?auto_409836 ) ) ( not ( = ?auto_409833 ?auto_409837 ) ) ( not ( = ?auto_409833 ?auto_409838 ) ) ( not ( = ?auto_409833 ?auto_409839 ) ) ( not ( = ?auto_409833 ?auto_409840 ) ) ( not ( = ?auto_409833 ?auto_409841 ) ) ( not ( = ?auto_409833 ?auto_409842 ) ) ( not ( = ?auto_409833 ?auto_409843 ) ) ( not ( = ?auto_409833 ?auto_409844 ) ) ( not ( = ?auto_409834 ?auto_409835 ) ) ( not ( = ?auto_409834 ?auto_409836 ) ) ( not ( = ?auto_409834 ?auto_409837 ) ) ( not ( = ?auto_409834 ?auto_409838 ) ) ( not ( = ?auto_409834 ?auto_409839 ) ) ( not ( = ?auto_409834 ?auto_409840 ) ) ( not ( = ?auto_409834 ?auto_409841 ) ) ( not ( = ?auto_409834 ?auto_409842 ) ) ( not ( = ?auto_409834 ?auto_409843 ) ) ( not ( = ?auto_409834 ?auto_409844 ) ) ( not ( = ?auto_409835 ?auto_409836 ) ) ( not ( = ?auto_409835 ?auto_409837 ) ) ( not ( = ?auto_409835 ?auto_409838 ) ) ( not ( = ?auto_409835 ?auto_409839 ) ) ( not ( = ?auto_409835 ?auto_409840 ) ) ( not ( = ?auto_409835 ?auto_409841 ) ) ( not ( = ?auto_409835 ?auto_409842 ) ) ( not ( = ?auto_409835 ?auto_409843 ) ) ( not ( = ?auto_409835 ?auto_409844 ) ) ( not ( = ?auto_409836 ?auto_409837 ) ) ( not ( = ?auto_409836 ?auto_409838 ) ) ( not ( = ?auto_409836 ?auto_409839 ) ) ( not ( = ?auto_409836 ?auto_409840 ) ) ( not ( = ?auto_409836 ?auto_409841 ) ) ( not ( = ?auto_409836 ?auto_409842 ) ) ( not ( = ?auto_409836 ?auto_409843 ) ) ( not ( = ?auto_409836 ?auto_409844 ) ) ( not ( = ?auto_409837 ?auto_409838 ) ) ( not ( = ?auto_409837 ?auto_409839 ) ) ( not ( = ?auto_409837 ?auto_409840 ) ) ( not ( = ?auto_409837 ?auto_409841 ) ) ( not ( = ?auto_409837 ?auto_409842 ) ) ( not ( = ?auto_409837 ?auto_409843 ) ) ( not ( = ?auto_409837 ?auto_409844 ) ) ( not ( = ?auto_409838 ?auto_409839 ) ) ( not ( = ?auto_409838 ?auto_409840 ) ) ( not ( = ?auto_409838 ?auto_409841 ) ) ( not ( = ?auto_409838 ?auto_409842 ) ) ( not ( = ?auto_409838 ?auto_409843 ) ) ( not ( = ?auto_409838 ?auto_409844 ) ) ( not ( = ?auto_409839 ?auto_409840 ) ) ( not ( = ?auto_409839 ?auto_409841 ) ) ( not ( = ?auto_409839 ?auto_409842 ) ) ( not ( = ?auto_409839 ?auto_409843 ) ) ( not ( = ?auto_409839 ?auto_409844 ) ) ( not ( = ?auto_409840 ?auto_409841 ) ) ( not ( = ?auto_409840 ?auto_409842 ) ) ( not ( = ?auto_409840 ?auto_409843 ) ) ( not ( = ?auto_409840 ?auto_409844 ) ) ( not ( = ?auto_409841 ?auto_409842 ) ) ( not ( = ?auto_409841 ?auto_409843 ) ) ( not ( = ?auto_409841 ?auto_409844 ) ) ( not ( = ?auto_409842 ?auto_409843 ) ) ( not ( = ?auto_409842 ?auto_409844 ) ) ( not ( = ?auto_409843 ?auto_409844 ) ) ( ON ?auto_409842 ?auto_409843 ) ( CLEAR ?auto_409840 ) ( ON ?auto_409841 ?auto_409842 ) ( CLEAR ?auto_409841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_409832 ?auto_409833 ?auto_409834 ?auto_409835 ?auto_409836 ?auto_409837 ?auto_409838 ?auto_409839 ?auto_409840 ?auto_409841 )
      ( MAKE-12PILE ?auto_409832 ?auto_409833 ?auto_409834 ?auto_409835 ?auto_409836 ?auto_409837 ?auto_409838 ?auto_409839 ?auto_409840 ?auto_409841 ?auto_409842 ?auto_409843 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409857 - BLOCK
      ?auto_409858 - BLOCK
      ?auto_409859 - BLOCK
      ?auto_409860 - BLOCK
      ?auto_409861 - BLOCK
      ?auto_409862 - BLOCK
      ?auto_409863 - BLOCK
      ?auto_409864 - BLOCK
      ?auto_409865 - BLOCK
      ?auto_409866 - BLOCK
      ?auto_409867 - BLOCK
      ?auto_409868 - BLOCK
    )
    :vars
    (
      ?auto_409869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409868 ?auto_409869 ) ( ON-TABLE ?auto_409857 ) ( ON ?auto_409858 ?auto_409857 ) ( ON ?auto_409859 ?auto_409858 ) ( ON ?auto_409860 ?auto_409859 ) ( ON ?auto_409861 ?auto_409860 ) ( ON ?auto_409862 ?auto_409861 ) ( ON ?auto_409863 ?auto_409862 ) ( ON ?auto_409864 ?auto_409863 ) ( ON ?auto_409865 ?auto_409864 ) ( not ( = ?auto_409857 ?auto_409858 ) ) ( not ( = ?auto_409857 ?auto_409859 ) ) ( not ( = ?auto_409857 ?auto_409860 ) ) ( not ( = ?auto_409857 ?auto_409861 ) ) ( not ( = ?auto_409857 ?auto_409862 ) ) ( not ( = ?auto_409857 ?auto_409863 ) ) ( not ( = ?auto_409857 ?auto_409864 ) ) ( not ( = ?auto_409857 ?auto_409865 ) ) ( not ( = ?auto_409857 ?auto_409866 ) ) ( not ( = ?auto_409857 ?auto_409867 ) ) ( not ( = ?auto_409857 ?auto_409868 ) ) ( not ( = ?auto_409857 ?auto_409869 ) ) ( not ( = ?auto_409858 ?auto_409859 ) ) ( not ( = ?auto_409858 ?auto_409860 ) ) ( not ( = ?auto_409858 ?auto_409861 ) ) ( not ( = ?auto_409858 ?auto_409862 ) ) ( not ( = ?auto_409858 ?auto_409863 ) ) ( not ( = ?auto_409858 ?auto_409864 ) ) ( not ( = ?auto_409858 ?auto_409865 ) ) ( not ( = ?auto_409858 ?auto_409866 ) ) ( not ( = ?auto_409858 ?auto_409867 ) ) ( not ( = ?auto_409858 ?auto_409868 ) ) ( not ( = ?auto_409858 ?auto_409869 ) ) ( not ( = ?auto_409859 ?auto_409860 ) ) ( not ( = ?auto_409859 ?auto_409861 ) ) ( not ( = ?auto_409859 ?auto_409862 ) ) ( not ( = ?auto_409859 ?auto_409863 ) ) ( not ( = ?auto_409859 ?auto_409864 ) ) ( not ( = ?auto_409859 ?auto_409865 ) ) ( not ( = ?auto_409859 ?auto_409866 ) ) ( not ( = ?auto_409859 ?auto_409867 ) ) ( not ( = ?auto_409859 ?auto_409868 ) ) ( not ( = ?auto_409859 ?auto_409869 ) ) ( not ( = ?auto_409860 ?auto_409861 ) ) ( not ( = ?auto_409860 ?auto_409862 ) ) ( not ( = ?auto_409860 ?auto_409863 ) ) ( not ( = ?auto_409860 ?auto_409864 ) ) ( not ( = ?auto_409860 ?auto_409865 ) ) ( not ( = ?auto_409860 ?auto_409866 ) ) ( not ( = ?auto_409860 ?auto_409867 ) ) ( not ( = ?auto_409860 ?auto_409868 ) ) ( not ( = ?auto_409860 ?auto_409869 ) ) ( not ( = ?auto_409861 ?auto_409862 ) ) ( not ( = ?auto_409861 ?auto_409863 ) ) ( not ( = ?auto_409861 ?auto_409864 ) ) ( not ( = ?auto_409861 ?auto_409865 ) ) ( not ( = ?auto_409861 ?auto_409866 ) ) ( not ( = ?auto_409861 ?auto_409867 ) ) ( not ( = ?auto_409861 ?auto_409868 ) ) ( not ( = ?auto_409861 ?auto_409869 ) ) ( not ( = ?auto_409862 ?auto_409863 ) ) ( not ( = ?auto_409862 ?auto_409864 ) ) ( not ( = ?auto_409862 ?auto_409865 ) ) ( not ( = ?auto_409862 ?auto_409866 ) ) ( not ( = ?auto_409862 ?auto_409867 ) ) ( not ( = ?auto_409862 ?auto_409868 ) ) ( not ( = ?auto_409862 ?auto_409869 ) ) ( not ( = ?auto_409863 ?auto_409864 ) ) ( not ( = ?auto_409863 ?auto_409865 ) ) ( not ( = ?auto_409863 ?auto_409866 ) ) ( not ( = ?auto_409863 ?auto_409867 ) ) ( not ( = ?auto_409863 ?auto_409868 ) ) ( not ( = ?auto_409863 ?auto_409869 ) ) ( not ( = ?auto_409864 ?auto_409865 ) ) ( not ( = ?auto_409864 ?auto_409866 ) ) ( not ( = ?auto_409864 ?auto_409867 ) ) ( not ( = ?auto_409864 ?auto_409868 ) ) ( not ( = ?auto_409864 ?auto_409869 ) ) ( not ( = ?auto_409865 ?auto_409866 ) ) ( not ( = ?auto_409865 ?auto_409867 ) ) ( not ( = ?auto_409865 ?auto_409868 ) ) ( not ( = ?auto_409865 ?auto_409869 ) ) ( not ( = ?auto_409866 ?auto_409867 ) ) ( not ( = ?auto_409866 ?auto_409868 ) ) ( not ( = ?auto_409866 ?auto_409869 ) ) ( not ( = ?auto_409867 ?auto_409868 ) ) ( not ( = ?auto_409867 ?auto_409869 ) ) ( not ( = ?auto_409868 ?auto_409869 ) ) ( ON ?auto_409867 ?auto_409868 ) ( CLEAR ?auto_409865 ) ( ON ?auto_409866 ?auto_409867 ) ( CLEAR ?auto_409866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_409857 ?auto_409858 ?auto_409859 ?auto_409860 ?auto_409861 ?auto_409862 ?auto_409863 ?auto_409864 ?auto_409865 ?auto_409866 )
      ( MAKE-12PILE ?auto_409857 ?auto_409858 ?auto_409859 ?auto_409860 ?auto_409861 ?auto_409862 ?auto_409863 ?auto_409864 ?auto_409865 ?auto_409866 ?auto_409867 ?auto_409868 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409882 - BLOCK
      ?auto_409883 - BLOCK
      ?auto_409884 - BLOCK
      ?auto_409885 - BLOCK
      ?auto_409886 - BLOCK
      ?auto_409887 - BLOCK
      ?auto_409888 - BLOCK
      ?auto_409889 - BLOCK
      ?auto_409890 - BLOCK
      ?auto_409891 - BLOCK
      ?auto_409892 - BLOCK
      ?auto_409893 - BLOCK
    )
    :vars
    (
      ?auto_409894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409893 ?auto_409894 ) ( ON-TABLE ?auto_409882 ) ( ON ?auto_409883 ?auto_409882 ) ( ON ?auto_409884 ?auto_409883 ) ( ON ?auto_409885 ?auto_409884 ) ( ON ?auto_409886 ?auto_409885 ) ( ON ?auto_409887 ?auto_409886 ) ( ON ?auto_409888 ?auto_409887 ) ( ON ?auto_409889 ?auto_409888 ) ( not ( = ?auto_409882 ?auto_409883 ) ) ( not ( = ?auto_409882 ?auto_409884 ) ) ( not ( = ?auto_409882 ?auto_409885 ) ) ( not ( = ?auto_409882 ?auto_409886 ) ) ( not ( = ?auto_409882 ?auto_409887 ) ) ( not ( = ?auto_409882 ?auto_409888 ) ) ( not ( = ?auto_409882 ?auto_409889 ) ) ( not ( = ?auto_409882 ?auto_409890 ) ) ( not ( = ?auto_409882 ?auto_409891 ) ) ( not ( = ?auto_409882 ?auto_409892 ) ) ( not ( = ?auto_409882 ?auto_409893 ) ) ( not ( = ?auto_409882 ?auto_409894 ) ) ( not ( = ?auto_409883 ?auto_409884 ) ) ( not ( = ?auto_409883 ?auto_409885 ) ) ( not ( = ?auto_409883 ?auto_409886 ) ) ( not ( = ?auto_409883 ?auto_409887 ) ) ( not ( = ?auto_409883 ?auto_409888 ) ) ( not ( = ?auto_409883 ?auto_409889 ) ) ( not ( = ?auto_409883 ?auto_409890 ) ) ( not ( = ?auto_409883 ?auto_409891 ) ) ( not ( = ?auto_409883 ?auto_409892 ) ) ( not ( = ?auto_409883 ?auto_409893 ) ) ( not ( = ?auto_409883 ?auto_409894 ) ) ( not ( = ?auto_409884 ?auto_409885 ) ) ( not ( = ?auto_409884 ?auto_409886 ) ) ( not ( = ?auto_409884 ?auto_409887 ) ) ( not ( = ?auto_409884 ?auto_409888 ) ) ( not ( = ?auto_409884 ?auto_409889 ) ) ( not ( = ?auto_409884 ?auto_409890 ) ) ( not ( = ?auto_409884 ?auto_409891 ) ) ( not ( = ?auto_409884 ?auto_409892 ) ) ( not ( = ?auto_409884 ?auto_409893 ) ) ( not ( = ?auto_409884 ?auto_409894 ) ) ( not ( = ?auto_409885 ?auto_409886 ) ) ( not ( = ?auto_409885 ?auto_409887 ) ) ( not ( = ?auto_409885 ?auto_409888 ) ) ( not ( = ?auto_409885 ?auto_409889 ) ) ( not ( = ?auto_409885 ?auto_409890 ) ) ( not ( = ?auto_409885 ?auto_409891 ) ) ( not ( = ?auto_409885 ?auto_409892 ) ) ( not ( = ?auto_409885 ?auto_409893 ) ) ( not ( = ?auto_409885 ?auto_409894 ) ) ( not ( = ?auto_409886 ?auto_409887 ) ) ( not ( = ?auto_409886 ?auto_409888 ) ) ( not ( = ?auto_409886 ?auto_409889 ) ) ( not ( = ?auto_409886 ?auto_409890 ) ) ( not ( = ?auto_409886 ?auto_409891 ) ) ( not ( = ?auto_409886 ?auto_409892 ) ) ( not ( = ?auto_409886 ?auto_409893 ) ) ( not ( = ?auto_409886 ?auto_409894 ) ) ( not ( = ?auto_409887 ?auto_409888 ) ) ( not ( = ?auto_409887 ?auto_409889 ) ) ( not ( = ?auto_409887 ?auto_409890 ) ) ( not ( = ?auto_409887 ?auto_409891 ) ) ( not ( = ?auto_409887 ?auto_409892 ) ) ( not ( = ?auto_409887 ?auto_409893 ) ) ( not ( = ?auto_409887 ?auto_409894 ) ) ( not ( = ?auto_409888 ?auto_409889 ) ) ( not ( = ?auto_409888 ?auto_409890 ) ) ( not ( = ?auto_409888 ?auto_409891 ) ) ( not ( = ?auto_409888 ?auto_409892 ) ) ( not ( = ?auto_409888 ?auto_409893 ) ) ( not ( = ?auto_409888 ?auto_409894 ) ) ( not ( = ?auto_409889 ?auto_409890 ) ) ( not ( = ?auto_409889 ?auto_409891 ) ) ( not ( = ?auto_409889 ?auto_409892 ) ) ( not ( = ?auto_409889 ?auto_409893 ) ) ( not ( = ?auto_409889 ?auto_409894 ) ) ( not ( = ?auto_409890 ?auto_409891 ) ) ( not ( = ?auto_409890 ?auto_409892 ) ) ( not ( = ?auto_409890 ?auto_409893 ) ) ( not ( = ?auto_409890 ?auto_409894 ) ) ( not ( = ?auto_409891 ?auto_409892 ) ) ( not ( = ?auto_409891 ?auto_409893 ) ) ( not ( = ?auto_409891 ?auto_409894 ) ) ( not ( = ?auto_409892 ?auto_409893 ) ) ( not ( = ?auto_409892 ?auto_409894 ) ) ( not ( = ?auto_409893 ?auto_409894 ) ) ( ON ?auto_409892 ?auto_409893 ) ( ON ?auto_409891 ?auto_409892 ) ( CLEAR ?auto_409889 ) ( ON ?auto_409890 ?auto_409891 ) ( CLEAR ?auto_409890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_409882 ?auto_409883 ?auto_409884 ?auto_409885 ?auto_409886 ?auto_409887 ?auto_409888 ?auto_409889 ?auto_409890 )
      ( MAKE-12PILE ?auto_409882 ?auto_409883 ?auto_409884 ?auto_409885 ?auto_409886 ?auto_409887 ?auto_409888 ?auto_409889 ?auto_409890 ?auto_409891 ?auto_409892 ?auto_409893 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409907 - BLOCK
      ?auto_409908 - BLOCK
      ?auto_409909 - BLOCK
      ?auto_409910 - BLOCK
      ?auto_409911 - BLOCK
      ?auto_409912 - BLOCK
      ?auto_409913 - BLOCK
      ?auto_409914 - BLOCK
      ?auto_409915 - BLOCK
      ?auto_409916 - BLOCK
      ?auto_409917 - BLOCK
      ?auto_409918 - BLOCK
    )
    :vars
    (
      ?auto_409919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409918 ?auto_409919 ) ( ON-TABLE ?auto_409907 ) ( ON ?auto_409908 ?auto_409907 ) ( ON ?auto_409909 ?auto_409908 ) ( ON ?auto_409910 ?auto_409909 ) ( ON ?auto_409911 ?auto_409910 ) ( ON ?auto_409912 ?auto_409911 ) ( ON ?auto_409913 ?auto_409912 ) ( ON ?auto_409914 ?auto_409913 ) ( not ( = ?auto_409907 ?auto_409908 ) ) ( not ( = ?auto_409907 ?auto_409909 ) ) ( not ( = ?auto_409907 ?auto_409910 ) ) ( not ( = ?auto_409907 ?auto_409911 ) ) ( not ( = ?auto_409907 ?auto_409912 ) ) ( not ( = ?auto_409907 ?auto_409913 ) ) ( not ( = ?auto_409907 ?auto_409914 ) ) ( not ( = ?auto_409907 ?auto_409915 ) ) ( not ( = ?auto_409907 ?auto_409916 ) ) ( not ( = ?auto_409907 ?auto_409917 ) ) ( not ( = ?auto_409907 ?auto_409918 ) ) ( not ( = ?auto_409907 ?auto_409919 ) ) ( not ( = ?auto_409908 ?auto_409909 ) ) ( not ( = ?auto_409908 ?auto_409910 ) ) ( not ( = ?auto_409908 ?auto_409911 ) ) ( not ( = ?auto_409908 ?auto_409912 ) ) ( not ( = ?auto_409908 ?auto_409913 ) ) ( not ( = ?auto_409908 ?auto_409914 ) ) ( not ( = ?auto_409908 ?auto_409915 ) ) ( not ( = ?auto_409908 ?auto_409916 ) ) ( not ( = ?auto_409908 ?auto_409917 ) ) ( not ( = ?auto_409908 ?auto_409918 ) ) ( not ( = ?auto_409908 ?auto_409919 ) ) ( not ( = ?auto_409909 ?auto_409910 ) ) ( not ( = ?auto_409909 ?auto_409911 ) ) ( not ( = ?auto_409909 ?auto_409912 ) ) ( not ( = ?auto_409909 ?auto_409913 ) ) ( not ( = ?auto_409909 ?auto_409914 ) ) ( not ( = ?auto_409909 ?auto_409915 ) ) ( not ( = ?auto_409909 ?auto_409916 ) ) ( not ( = ?auto_409909 ?auto_409917 ) ) ( not ( = ?auto_409909 ?auto_409918 ) ) ( not ( = ?auto_409909 ?auto_409919 ) ) ( not ( = ?auto_409910 ?auto_409911 ) ) ( not ( = ?auto_409910 ?auto_409912 ) ) ( not ( = ?auto_409910 ?auto_409913 ) ) ( not ( = ?auto_409910 ?auto_409914 ) ) ( not ( = ?auto_409910 ?auto_409915 ) ) ( not ( = ?auto_409910 ?auto_409916 ) ) ( not ( = ?auto_409910 ?auto_409917 ) ) ( not ( = ?auto_409910 ?auto_409918 ) ) ( not ( = ?auto_409910 ?auto_409919 ) ) ( not ( = ?auto_409911 ?auto_409912 ) ) ( not ( = ?auto_409911 ?auto_409913 ) ) ( not ( = ?auto_409911 ?auto_409914 ) ) ( not ( = ?auto_409911 ?auto_409915 ) ) ( not ( = ?auto_409911 ?auto_409916 ) ) ( not ( = ?auto_409911 ?auto_409917 ) ) ( not ( = ?auto_409911 ?auto_409918 ) ) ( not ( = ?auto_409911 ?auto_409919 ) ) ( not ( = ?auto_409912 ?auto_409913 ) ) ( not ( = ?auto_409912 ?auto_409914 ) ) ( not ( = ?auto_409912 ?auto_409915 ) ) ( not ( = ?auto_409912 ?auto_409916 ) ) ( not ( = ?auto_409912 ?auto_409917 ) ) ( not ( = ?auto_409912 ?auto_409918 ) ) ( not ( = ?auto_409912 ?auto_409919 ) ) ( not ( = ?auto_409913 ?auto_409914 ) ) ( not ( = ?auto_409913 ?auto_409915 ) ) ( not ( = ?auto_409913 ?auto_409916 ) ) ( not ( = ?auto_409913 ?auto_409917 ) ) ( not ( = ?auto_409913 ?auto_409918 ) ) ( not ( = ?auto_409913 ?auto_409919 ) ) ( not ( = ?auto_409914 ?auto_409915 ) ) ( not ( = ?auto_409914 ?auto_409916 ) ) ( not ( = ?auto_409914 ?auto_409917 ) ) ( not ( = ?auto_409914 ?auto_409918 ) ) ( not ( = ?auto_409914 ?auto_409919 ) ) ( not ( = ?auto_409915 ?auto_409916 ) ) ( not ( = ?auto_409915 ?auto_409917 ) ) ( not ( = ?auto_409915 ?auto_409918 ) ) ( not ( = ?auto_409915 ?auto_409919 ) ) ( not ( = ?auto_409916 ?auto_409917 ) ) ( not ( = ?auto_409916 ?auto_409918 ) ) ( not ( = ?auto_409916 ?auto_409919 ) ) ( not ( = ?auto_409917 ?auto_409918 ) ) ( not ( = ?auto_409917 ?auto_409919 ) ) ( not ( = ?auto_409918 ?auto_409919 ) ) ( ON ?auto_409917 ?auto_409918 ) ( ON ?auto_409916 ?auto_409917 ) ( CLEAR ?auto_409914 ) ( ON ?auto_409915 ?auto_409916 ) ( CLEAR ?auto_409915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_409907 ?auto_409908 ?auto_409909 ?auto_409910 ?auto_409911 ?auto_409912 ?auto_409913 ?auto_409914 ?auto_409915 )
      ( MAKE-12PILE ?auto_409907 ?auto_409908 ?auto_409909 ?auto_409910 ?auto_409911 ?auto_409912 ?auto_409913 ?auto_409914 ?auto_409915 ?auto_409916 ?auto_409917 ?auto_409918 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409932 - BLOCK
      ?auto_409933 - BLOCK
      ?auto_409934 - BLOCK
      ?auto_409935 - BLOCK
      ?auto_409936 - BLOCK
      ?auto_409937 - BLOCK
      ?auto_409938 - BLOCK
      ?auto_409939 - BLOCK
      ?auto_409940 - BLOCK
      ?auto_409941 - BLOCK
      ?auto_409942 - BLOCK
      ?auto_409943 - BLOCK
    )
    :vars
    (
      ?auto_409944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409943 ?auto_409944 ) ( ON-TABLE ?auto_409932 ) ( ON ?auto_409933 ?auto_409932 ) ( ON ?auto_409934 ?auto_409933 ) ( ON ?auto_409935 ?auto_409934 ) ( ON ?auto_409936 ?auto_409935 ) ( ON ?auto_409937 ?auto_409936 ) ( ON ?auto_409938 ?auto_409937 ) ( not ( = ?auto_409932 ?auto_409933 ) ) ( not ( = ?auto_409932 ?auto_409934 ) ) ( not ( = ?auto_409932 ?auto_409935 ) ) ( not ( = ?auto_409932 ?auto_409936 ) ) ( not ( = ?auto_409932 ?auto_409937 ) ) ( not ( = ?auto_409932 ?auto_409938 ) ) ( not ( = ?auto_409932 ?auto_409939 ) ) ( not ( = ?auto_409932 ?auto_409940 ) ) ( not ( = ?auto_409932 ?auto_409941 ) ) ( not ( = ?auto_409932 ?auto_409942 ) ) ( not ( = ?auto_409932 ?auto_409943 ) ) ( not ( = ?auto_409932 ?auto_409944 ) ) ( not ( = ?auto_409933 ?auto_409934 ) ) ( not ( = ?auto_409933 ?auto_409935 ) ) ( not ( = ?auto_409933 ?auto_409936 ) ) ( not ( = ?auto_409933 ?auto_409937 ) ) ( not ( = ?auto_409933 ?auto_409938 ) ) ( not ( = ?auto_409933 ?auto_409939 ) ) ( not ( = ?auto_409933 ?auto_409940 ) ) ( not ( = ?auto_409933 ?auto_409941 ) ) ( not ( = ?auto_409933 ?auto_409942 ) ) ( not ( = ?auto_409933 ?auto_409943 ) ) ( not ( = ?auto_409933 ?auto_409944 ) ) ( not ( = ?auto_409934 ?auto_409935 ) ) ( not ( = ?auto_409934 ?auto_409936 ) ) ( not ( = ?auto_409934 ?auto_409937 ) ) ( not ( = ?auto_409934 ?auto_409938 ) ) ( not ( = ?auto_409934 ?auto_409939 ) ) ( not ( = ?auto_409934 ?auto_409940 ) ) ( not ( = ?auto_409934 ?auto_409941 ) ) ( not ( = ?auto_409934 ?auto_409942 ) ) ( not ( = ?auto_409934 ?auto_409943 ) ) ( not ( = ?auto_409934 ?auto_409944 ) ) ( not ( = ?auto_409935 ?auto_409936 ) ) ( not ( = ?auto_409935 ?auto_409937 ) ) ( not ( = ?auto_409935 ?auto_409938 ) ) ( not ( = ?auto_409935 ?auto_409939 ) ) ( not ( = ?auto_409935 ?auto_409940 ) ) ( not ( = ?auto_409935 ?auto_409941 ) ) ( not ( = ?auto_409935 ?auto_409942 ) ) ( not ( = ?auto_409935 ?auto_409943 ) ) ( not ( = ?auto_409935 ?auto_409944 ) ) ( not ( = ?auto_409936 ?auto_409937 ) ) ( not ( = ?auto_409936 ?auto_409938 ) ) ( not ( = ?auto_409936 ?auto_409939 ) ) ( not ( = ?auto_409936 ?auto_409940 ) ) ( not ( = ?auto_409936 ?auto_409941 ) ) ( not ( = ?auto_409936 ?auto_409942 ) ) ( not ( = ?auto_409936 ?auto_409943 ) ) ( not ( = ?auto_409936 ?auto_409944 ) ) ( not ( = ?auto_409937 ?auto_409938 ) ) ( not ( = ?auto_409937 ?auto_409939 ) ) ( not ( = ?auto_409937 ?auto_409940 ) ) ( not ( = ?auto_409937 ?auto_409941 ) ) ( not ( = ?auto_409937 ?auto_409942 ) ) ( not ( = ?auto_409937 ?auto_409943 ) ) ( not ( = ?auto_409937 ?auto_409944 ) ) ( not ( = ?auto_409938 ?auto_409939 ) ) ( not ( = ?auto_409938 ?auto_409940 ) ) ( not ( = ?auto_409938 ?auto_409941 ) ) ( not ( = ?auto_409938 ?auto_409942 ) ) ( not ( = ?auto_409938 ?auto_409943 ) ) ( not ( = ?auto_409938 ?auto_409944 ) ) ( not ( = ?auto_409939 ?auto_409940 ) ) ( not ( = ?auto_409939 ?auto_409941 ) ) ( not ( = ?auto_409939 ?auto_409942 ) ) ( not ( = ?auto_409939 ?auto_409943 ) ) ( not ( = ?auto_409939 ?auto_409944 ) ) ( not ( = ?auto_409940 ?auto_409941 ) ) ( not ( = ?auto_409940 ?auto_409942 ) ) ( not ( = ?auto_409940 ?auto_409943 ) ) ( not ( = ?auto_409940 ?auto_409944 ) ) ( not ( = ?auto_409941 ?auto_409942 ) ) ( not ( = ?auto_409941 ?auto_409943 ) ) ( not ( = ?auto_409941 ?auto_409944 ) ) ( not ( = ?auto_409942 ?auto_409943 ) ) ( not ( = ?auto_409942 ?auto_409944 ) ) ( not ( = ?auto_409943 ?auto_409944 ) ) ( ON ?auto_409942 ?auto_409943 ) ( ON ?auto_409941 ?auto_409942 ) ( ON ?auto_409940 ?auto_409941 ) ( CLEAR ?auto_409938 ) ( ON ?auto_409939 ?auto_409940 ) ( CLEAR ?auto_409939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_409932 ?auto_409933 ?auto_409934 ?auto_409935 ?auto_409936 ?auto_409937 ?auto_409938 ?auto_409939 )
      ( MAKE-12PILE ?auto_409932 ?auto_409933 ?auto_409934 ?auto_409935 ?auto_409936 ?auto_409937 ?auto_409938 ?auto_409939 ?auto_409940 ?auto_409941 ?auto_409942 ?auto_409943 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409957 - BLOCK
      ?auto_409958 - BLOCK
      ?auto_409959 - BLOCK
      ?auto_409960 - BLOCK
      ?auto_409961 - BLOCK
      ?auto_409962 - BLOCK
      ?auto_409963 - BLOCK
      ?auto_409964 - BLOCK
      ?auto_409965 - BLOCK
      ?auto_409966 - BLOCK
      ?auto_409967 - BLOCK
      ?auto_409968 - BLOCK
    )
    :vars
    (
      ?auto_409969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409968 ?auto_409969 ) ( ON-TABLE ?auto_409957 ) ( ON ?auto_409958 ?auto_409957 ) ( ON ?auto_409959 ?auto_409958 ) ( ON ?auto_409960 ?auto_409959 ) ( ON ?auto_409961 ?auto_409960 ) ( ON ?auto_409962 ?auto_409961 ) ( ON ?auto_409963 ?auto_409962 ) ( not ( = ?auto_409957 ?auto_409958 ) ) ( not ( = ?auto_409957 ?auto_409959 ) ) ( not ( = ?auto_409957 ?auto_409960 ) ) ( not ( = ?auto_409957 ?auto_409961 ) ) ( not ( = ?auto_409957 ?auto_409962 ) ) ( not ( = ?auto_409957 ?auto_409963 ) ) ( not ( = ?auto_409957 ?auto_409964 ) ) ( not ( = ?auto_409957 ?auto_409965 ) ) ( not ( = ?auto_409957 ?auto_409966 ) ) ( not ( = ?auto_409957 ?auto_409967 ) ) ( not ( = ?auto_409957 ?auto_409968 ) ) ( not ( = ?auto_409957 ?auto_409969 ) ) ( not ( = ?auto_409958 ?auto_409959 ) ) ( not ( = ?auto_409958 ?auto_409960 ) ) ( not ( = ?auto_409958 ?auto_409961 ) ) ( not ( = ?auto_409958 ?auto_409962 ) ) ( not ( = ?auto_409958 ?auto_409963 ) ) ( not ( = ?auto_409958 ?auto_409964 ) ) ( not ( = ?auto_409958 ?auto_409965 ) ) ( not ( = ?auto_409958 ?auto_409966 ) ) ( not ( = ?auto_409958 ?auto_409967 ) ) ( not ( = ?auto_409958 ?auto_409968 ) ) ( not ( = ?auto_409958 ?auto_409969 ) ) ( not ( = ?auto_409959 ?auto_409960 ) ) ( not ( = ?auto_409959 ?auto_409961 ) ) ( not ( = ?auto_409959 ?auto_409962 ) ) ( not ( = ?auto_409959 ?auto_409963 ) ) ( not ( = ?auto_409959 ?auto_409964 ) ) ( not ( = ?auto_409959 ?auto_409965 ) ) ( not ( = ?auto_409959 ?auto_409966 ) ) ( not ( = ?auto_409959 ?auto_409967 ) ) ( not ( = ?auto_409959 ?auto_409968 ) ) ( not ( = ?auto_409959 ?auto_409969 ) ) ( not ( = ?auto_409960 ?auto_409961 ) ) ( not ( = ?auto_409960 ?auto_409962 ) ) ( not ( = ?auto_409960 ?auto_409963 ) ) ( not ( = ?auto_409960 ?auto_409964 ) ) ( not ( = ?auto_409960 ?auto_409965 ) ) ( not ( = ?auto_409960 ?auto_409966 ) ) ( not ( = ?auto_409960 ?auto_409967 ) ) ( not ( = ?auto_409960 ?auto_409968 ) ) ( not ( = ?auto_409960 ?auto_409969 ) ) ( not ( = ?auto_409961 ?auto_409962 ) ) ( not ( = ?auto_409961 ?auto_409963 ) ) ( not ( = ?auto_409961 ?auto_409964 ) ) ( not ( = ?auto_409961 ?auto_409965 ) ) ( not ( = ?auto_409961 ?auto_409966 ) ) ( not ( = ?auto_409961 ?auto_409967 ) ) ( not ( = ?auto_409961 ?auto_409968 ) ) ( not ( = ?auto_409961 ?auto_409969 ) ) ( not ( = ?auto_409962 ?auto_409963 ) ) ( not ( = ?auto_409962 ?auto_409964 ) ) ( not ( = ?auto_409962 ?auto_409965 ) ) ( not ( = ?auto_409962 ?auto_409966 ) ) ( not ( = ?auto_409962 ?auto_409967 ) ) ( not ( = ?auto_409962 ?auto_409968 ) ) ( not ( = ?auto_409962 ?auto_409969 ) ) ( not ( = ?auto_409963 ?auto_409964 ) ) ( not ( = ?auto_409963 ?auto_409965 ) ) ( not ( = ?auto_409963 ?auto_409966 ) ) ( not ( = ?auto_409963 ?auto_409967 ) ) ( not ( = ?auto_409963 ?auto_409968 ) ) ( not ( = ?auto_409963 ?auto_409969 ) ) ( not ( = ?auto_409964 ?auto_409965 ) ) ( not ( = ?auto_409964 ?auto_409966 ) ) ( not ( = ?auto_409964 ?auto_409967 ) ) ( not ( = ?auto_409964 ?auto_409968 ) ) ( not ( = ?auto_409964 ?auto_409969 ) ) ( not ( = ?auto_409965 ?auto_409966 ) ) ( not ( = ?auto_409965 ?auto_409967 ) ) ( not ( = ?auto_409965 ?auto_409968 ) ) ( not ( = ?auto_409965 ?auto_409969 ) ) ( not ( = ?auto_409966 ?auto_409967 ) ) ( not ( = ?auto_409966 ?auto_409968 ) ) ( not ( = ?auto_409966 ?auto_409969 ) ) ( not ( = ?auto_409967 ?auto_409968 ) ) ( not ( = ?auto_409967 ?auto_409969 ) ) ( not ( = ?auto_409968 ?auto_409969 ) ) ( ON ?auto_409967 ?auto_409968 ) ( ON ?auto_409966 ?auto_409967 ) ( ON ?auto_409965 ?auto_409966 ) ( CLEAR ?auto_409963 ) ( ON ?auto_409964 ?auto_409965 ) ( CLEAR ?auto_409964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_409957 ?auto_409958 ?auto_409959 ?auto_409960 ?auto_409961 ?auto_409962 ?auto_409963 ?auto_409964 )
      ( MAKE-12PILE ?auto_409957 ?auto_409958 ?auto_409959 ?auto_409960 ?auto_409961 ?auto_409962 ?auto_409963 ?auto_409964 ?auto_409965 ?auto_409966 ?auto_409967 ?auto_409968 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_409982 - BLOCK
      ?auto_409983 - BLOCK
      ?auto_409984 - BLOCK
      ?auto_409985 - BLOCK
      ?auto_409986 - BLOCK
      ?auto_409987 - BLOCK
      ?auto_409988 - BLOCK
      ?auto_409989 - BLOCK
      ?auto_409990 - BLOCK
      ?auto_409991 - BLOCK
      ?auto_409992 - BLOCK
      ?auto_409993 - BLOCK
    )
    :vars
    (
      ?auto_409994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_409993 ?auto_409994 ) ( ON-TABLE ?auto_409982 ) ( ON ?auto_409983 ?auto_409982 ) ( ON ?auto_409984 ?auto_409983 ) ( ON ?auto_409985 ?auto_409984 ) ( ON ?auto_409986 ?auto_409985 ) ( ON ?auto_409987 ?auto_409986 ) ( not ( = ?auto_409982 ?auto_409983 ) ) ( not ( = ?auto_409982 ?auto_409984 ) ) ( not ( = ?auto_409982 ?auto_409985 ) ) ( not ( = ?auto_409982 ?auto_409986 ) ) ( not ( = ?auto_409982 ?auto_409987 ) ) ( not ( = ?auto_409982 ?auto_409988 ) ) ( not ( = ?auto_409982 ?auto_409989 ) ) ( not ( = ?auto_409982 ?auto_409990 ) ) ( not ( = ?auto_409982 ?auto_409991 ) ) ( not ( = ?auto_409982 ?auto_409992 ) ) ( not ( = ?auto_409982 ?auto_409993 ) ) ( not ( = ?auto_409982 ?auto_409994 ) ) ( not ( = ?auto_409983 ?auto_409984 ) ) ( not ( = ?auto_409983 ?auto_409985 ) ) ( not ( = ?auto_409983 ?auto_409986 ) ) ( not ( = ?auto_409983 ?auto_409987 ) ) ( not ( = ?auto_409983 ?auto_409988 ) ) ( not ( = ?auto_409983 ?auto_409989 ) ) ( not ( = ?auto_409983 ?auto_409990 ) ) ( not ( = ?auto_409983 ?auto_409991 ) ) ( not ( = ?auto_409983 ?auto_409992 ) ) ( not ( = ?auto_409983 ?auto_409993 ) ) ( not ( = ?auto_409983 ?auto_409994 ) ) ( not ( = ?auto_409984 ?auto_409985 ) ) ( not ( = ?auto_409984 ?auto_409986 ) ) ( not ( = ?auto_409984 ?auto_409987 ) ) ( not ( = ?auto_409984 ?auto_409988 ) ) ( not ( = ?auto_409984 ?auto_409989 ) ) ( not ( = ?auto_409984 ?auto_409990 ) ) ( not ( = ?auto_409984 ?auto_409991 ) ) ( not ( = ?auto_409984 ?auto_409992 ) ) ( not ( = ?auto_409984 ?auto_409993 ) ) ( not ( = ?auto_409984 ?auto_409994 ) ) ( not ( = ?auto_409985 ?auto_409986 ) ) ( not ( = ?auto_409985 ?auto_409987 ) ) ( not ( = ?auto_409985 ?auto_409988 ) ) ( not ( = ?auto_409985 ?auto_409989 ) ) ( not ( = ?auto_409985 ?auto_409990 ) ) ( not ( = ?auto_409985 ?auto_409991 ) ) ( not ( = ?auto_409985 ?auto_409992 ) ) ( not ( = ?auto_409985 ?auto_409993 ) ) ( not ( = ?auto_409985 ?auto_409994 ) ) ( not ( = ?auto_409986 ?auto_409987 ) ) ( not ( = ?auto_409986 ?auto_409988 ) ) ( not ( = ?auto_409986 ?auto_409989 ) ) ( not ( = ?auto_409986 ?auto_409990 ) ) ( not ( = ?auto_409986 ?auto_409991 ) ) ( not ( = ?auto_409986 ?auto_409992 ) ) ( not ( = ?auto_409986 ?auto_409993 ) ) ( not ( = ?auto_409986 ?auto_409994 ) ) ( not ( = ?auto_409987 ?auto_409988 ) ) ( not ( = ?auto_409987 ?auto_409989 ) ) ( not ( = ?auto_409987 ?auto_409990 ) ) ( not ( = ?auto_409987 ?auto_409991 ) ) ( not ( = ?auto_409987 ?auto_409992 ) ) ( not ( = ?auto_409987 ?auto_409993 ) ) ( not ( = ?auto_409987 ?auto_409994 ) ) ( not ( = ?auto_409988 ?auto_409989 ) ) ( not ( = ?auto_409988 ?auto_409990 ) ) ( not ( = ?auto_409988 ?auto_409991 ) ) ( not ( = ?auto_409988 ?auto_409992 ) ) ( not ( = ?auto_409988 ?auto_409993 ) ) ( not ( = ?auto_409988 ?auto_409994 ) ) ( not ( = ?auto_409989 ?auto_409990 ) ) ( not ( = ?auto_409989 ?auto_409991 ) ) ( not ( = ?auto_409989 ?auto_409992 ) ) ( not ( = ?auto_409989 ?auto_409993 ) ) ( not ( = ?auto_409989 ?auto_409994 ) ) ( not ( = ?auto_409990 ?auto_409991 ) ) ( not ( = ?auto_409990 ?auto_409992 ) ) ( not ( = ?auto_409990 ?auto_409993 ) ) ( not ( = ?auto_409990 ?auto_409994 ) ) ( not ( = ?auto_409991 ?auto_409992 ) ) ( not ( = ?auto_409991 ?auto_409993 ) ) ( not ( = ?auto_409991 ?auto_409994 ) ) ( not ( = ?auto_409992 ?auto_409993 ) ) ( not ( = ?auto_409992 ?auto_409994 ) ) ( not ( = ?auto_409993 ?auto_409994 ) ) ( ON ?auto_409992 ?auto_409993 ) ( ON ?auto_409991 ?auto_409992 ) ( ON ?auto_409990 ?auto_409991 ) ( ON ?auto_409989 ?auto_409990 ) ( CLEAR ?auto_409987 ) ( ON ?auto_409988 ?auto_409989 ) ( CLEAR ?auto_409988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_409982 ?auto_409983 ?auto_409984 ?auto_409985 ?auto_409986 ?auto_409987 ?auto_409988 )
      ( MAKE-12PILE ?auto_409982 ?auto_409983 ?auto_409984 ?auto_409985 ?auto_409986 ?auto_409987 ?auto_409988 ?auto_409989 ?auto_409990 ?auto_409991 ?auto_409992 ?auto_409993 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410007 - BLOCK
      ?auto_410008 - BLOCK
      ?auto_410009 - BLOCK
      ?auto_410010 - BLOCK
      ?auto_410011 - BLOCK
      ?auto_410012 - BLOCK
      ?auto_410013 - BLOCK
      ?auto_410014 - BLOCK
      ?auto_410015 - BLOCK
      ?auto_410016 - BLOCK
      ?auto_410017 - BLOCK
      ?auto_410018 - BLOCK
    )
    :vars
    (
      ?auto_410019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410018 ?auto_410019 ) ( ON-TABLE ?auto_410007 ) ( ON ?auto_410008 ?auto_410007 ) ( ON ?auto_410009 ?auto_410008 ) ( ON ?auto_410010 ?auto_410009 ) ( ON ?auto_410011 ?auto_410010 ) ( ON ?auto_410012 ?auto_410011 ) ( not ( = ?auto_410007 ?auto_410008 ) ) ( not ( = ?auto_410007 ?auto_410009 ) ) ( not ( = ?auto_410007 ?auto_410010 ) ) ( not ( = ?auto_410007 ?auto_410011 ) ) ( not ( = ?auto_410007 ?auto_410012 ) ) ( not ( = ?auto_410007 ?auto_410013 ) ) ( not ( = ?auto_410007 ?auto_410014 ) ) ( not ( = ?auto_410007 ?auto_410015 ) ) ( not ( = ?auto_410007 ?auto_410016 ) ) ( not ( = ?auto_410007 ?auto_410017 ) ) ( not ( = ?auto_410007 ?auto_410018 ) ) ( not ( = ?auto_410007 ?auto_410019 ) ) ( not ( = ?auto_410008 ?auto_410009 ) ) ( not ( = ?auto_410008 ?auto_410010 ) ) ( not ( = ?auto_410008 ?auto_410011 ) ) ( not ( = ?auto_410008 ?auto_410012 ) ) ( not ( = ?auto_410008 ?auto_410013 ) ) ( not ( = ?auto_410008 ?auto_410014 ) ) ( not ( = ?auto_410008 ?auto_410015 ) ) ( not ( = ?auto_410008 ?auto_410016 ) ) ( not ( = ?auto_410008 ?auto_410017 ) ) ( not ( = ?auto_410008 ?auto_410018 ) ) ( not ( = ?auto_410008 ?auto_410019 ) ) ( not ( = ?auto_410009 ?auto_410010 ) ) ( not ( = ?auto_410009 ?auto_410011 ) ) ( not ( = ?auto_410009 ?auto_410012 ) ) ( not ( = ?auto_410009 ?auto_410013 ) ) ( not ( = ?auto_410009 ?auto_410014 ) ) ( not ( = ?auto_410009 ?auto_410015 ) ) ( not ( = ?auto_410009 ?auto_410016 ) ) ( not ( = ?auto_410009 ?auto_410017 ) ) ( not ( = ?auto_410009 ?auto_410018 ) ) ( not ( = ?auto_410009 ?auto_410019 ) ) ( not ( = ?auto_410010 ?auto_410011 ) ) ( not ( = ?auto_410010 ?auto_410012 ) ) ( not ( = ?auto_410010 ?auto_410013 ) ) ( not ( = ?auto_410010 ?auto_410014 ) ) ( not ( = ?auto_410010 ?auto_410015 ) ) ( not ( = ?auto_410010 ?auto_410016 ) ) ( not ( = ?auto_410010 ?auto_410017 ) ) ( not ( = ?auto_410010 ?auto_410018 ) ) ( not ( = ?auto_410010 ?auto_410019 ) ) ( not ( = ?auto_410011 ?auto_410012 ) ) ( not ( = ?auto_410011 ?auto_410013 ) ) ( not ( = ?auto_410011 ?auto_410014 ) ) ( not ( = ?auto_410011 ?auto_410015 ) ) ( not ( = ?auto_410011 ?auto_410016 ) ) ( not ( = ?auto_410011 ?auto_410017 ) ) ( not ( = ?auto_410011 ?auto_410018 ) ) ( not ( = ?auto_410011 ?auto_410019 ) ) ( not ( = ?auto_410012 ?auto_410013 ) ) ( not ( = ?auto_410012 ?auto_410014 ) ) ( not ( = ?auto_410012 ?auto_410015 ) ) ( not ( = ?auto_410012 ?auto_410016 ) ) ( not ( = ?auto_410012 ?auto_410017 ) ) ( not ( = ?auto_410012 ?auto_410018 ) ) ( not ( = ?auto_410012 ?auto_410019 ) ) ( not ( = ?auto_410013 ?auto_410014 ) ) ( not ( = ?auto_410013 ?auto_410015 ) ) ( not ( = ?auto_410013 ?auto_410016 ) ) ( not ( = ?auto_410013 ?auto_410017 ) ) ( not ( = ?auto_410013 ?auto_410018 ) ) ( not ( = ?auto_410013 ?auto_410019 ) ) ( not ( = ?auto_410014 ?auto_410015 ) ) ( not ( = ?auto_410014 ?auto_410016 ) ) ( not ( = ?auto_410014 ?auto_410017 ) ) ( not ( = ?auto_410014 ?auto_410018 ) ) ( not ( = ?auto_410014 ?auto_410019 ) ) ( not ( = ?auto_410015 ?auto_410016 ) ) ( not ( = ?auto_410015 ?auto_410017 ) ) ( not ( = ?auto_410015 ?auto_410018 ) ) ( not ( = ?auto_410015 ?auto_410019 ) ) ( not ( = ?auto_410016 ?auto_410017 ) ) ( not ( = ?auto_410016 ?auto_410018 ) ) ( not ( = ?auto_410016 ?auto_410019 ) ) ( not ( = ?auto_410017 ?auto_410018 ) ) ( not ( = ?auto_410017 ?auto_410019 ) ) ( not ( = ?auto_410018 ?auto_410019 ) ) ( ON ?auto_410017 ?auto_410018 ) ( ON ?auto_410016 ?auto_410017 ) ( ON ?auto_410015 ?auto_410016 ) ( ON ?auto_410014 ?auto_410015 ) ( CLEAR ?auto_410012 ) ( ON ?auto_410013 ?auto_410014 ) ( CLEAR ?auto_410013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_410007 ?auto_410008 ?auto_410009 ?auto_410010 ?auto_410011 ?auto_410012 ?auto_410013 )
      ( MAKE-12PILE ?auto_410007 ?auto_410008 ?auto_410009 ?auto_410010 ?auto_410011 ?auto_410012 ?auto_410013 ?auto_410014 ?auto_410015 ?auto_410016 ?auto_410017 ?auto_410018 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410032 - BLOCK
      ?auto_410033 - BLOCK
      ?auto_410034 - BLOCK
      ?auto_410035 - BLOCK
      ?auto_410036 - BLOCK
      ?auto_410037 - BLOCK
      ?auto_410038 - BLOCK
      ?auto_410039 - BLOCK
      ?auto_410040 - BLOCK
      ?auto_410041 - BLOCK
      ?auto_410042 - BLOCK
      ?auto_410043 - BLOCK
    )
    :vars
    (
      ?auto_410044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410043 ?auto_410044 ) ( ON-TABLE ?auto_410032 ) ( ON ?auto_410033 ?auto_410032 ) ( ON ?auto_410034 ?auto_410033 ) ( ON ?auto_410035 ?auto_410034 ) ( ON ?auto_410036 ?auto_410035 ) ( not ( = ?auto_410032 ?auto_410033 ) ) ( not ( = ?auto_410032 ?auto_410034 ) ) ( not ( = ?auto_410032 ?auto_410035 ) ) ( not ( = ?auto_410032 ?auto_410036 ) ) ( not ( = ?auto_410032 ?auto_410037 ) ) ( not ( = ?auto_410032 ?auto_410038 ) ) ( not ( = ?auto_410032 ?auto_410039 ) ) ( not ( = ?auto_410032 ?auto_410040 ) ) ( not ( = ?auto_410032 ?auto_410041 ) ) ( not ( = ?auto_410032 ?auto_410042 ) ) ( not ( = ?auto_410032 ?auto_410043 ) ) ( not ( = ?auto_410032 ?auto_410044 ) ) ( not ( = ?auto_410033 ?auto_410034 ) ) ( not ( = ?auto_410033 ?auto_410035 ) ) ( not ( = ?auto_410033 ?auto_410036 ) ) ( not ( = ?auto_410033 ?auto_410037 ) ) ( not ( = ?auto_410033 ?auto_410038 ) ) ( not ( = ?auto_410033 ?auto_410039 ) ) ( not ( = ?auto_410033 ?auto_410040 ) ) ( not ( = ?auto_410033 ?auto_410041 ) ) ( not ( = ?auto_410033 ?auto_410042 ) ) ( not ( = ?auto_410033 ?auto_410043 ) ) ( not ( = ?auto_410033 ?auto_410044 ) ) ( not ( = ?auto_410034 ?auto_410035 ) ) ( not ( = ?auto_410034 ?auto_410036 ) ) ( not ( = ?auto_410034 ?auto_410037 ) ) ( not ( = ?auto_410034 ?auto_410038 ) ) ( not ( = ?auto_410034 ?auto_410039 ) ) ( not ( = ?auto_410034 ?auto_410040 ) ) ( not ( = ?auto_410034 ?auto_410041 ) ) ( not ( = ?auto_410034 ?auto_410042 ) ) ( not ( = ?auto_410034 ?auto_410043 ) ) ( not ( = ?auto_410034 ?auto_410044 ) ) ( not ( = ?auto_410035 ?auto_410036 ) ) ( not ( = ?auto_410035 ?auto_410037 ) ) ( not ( = ?auto_410035 ?auto_410038 ) ) ( not ( = ?auto_410035 ?auto_410039 ) ) ( not ( = ?auto_410035 ?auto_410040 ) ) ( not ( = ?auto_410035 ?auto_410041 ) ) ( not ( = ?auto_410035 ?auto_410042 ) ) ( not ( = ?auto_410035 ?auto_410043 ) ) ( not ( = ?auto_410035 ?auto_410044 ) ) ( not ( = ?auto_410036 ?auto_410037 ) ) ( not ( = ?auto_410036 ?auto_410038 ) ) ( not ( = ?auto_410036 ?auto_410039 ) ) ( not ( = ?auto_410036 ?auto_410040 ) ) ( not ( = ?auto_410036 ?auto_410041 ) ) ( not ( = ?auto_410036 ?auto_410042 ) ) ( not ( = ?auto_410036 ?auto_410043 ) ) ( not ( = ?auto_410036 ?auto_410044 ) ) ( not ( = ?auto_410037 ?auto_410038 ) ) ( not ( = ?auto_410037 ?auto_410039 ) ) ( not ( = ?auto_410037 ?auto_410040 ) ) ( not ( = ?auto_410037 ?auto_410041 ) ) ( not ( = ?auto_410037 ?auto_410042 ) ) ( not ( = ?auto_410037 ?auto_410043 ) ) ( not ( = ?auto_410037 ?auto_410044 ) ) ( not ( = ?auto_410038 ?auto_410039 ) ) ( not ( = ?auto_410038 ?auto_410040 ) ) ( not ( = ?auto_410038 ?auto_410041 ) ) ( not ( = ?auto_410038 ?auto_410042 ) ) ( not ( = ?auto_410038 ?auto_410043 ) ) ( not ( = ?auto_410038 ?auto_410044 ) ) ( not ( = ?auto_410039 ?auto_410040 ) ) ( not ( = ?auto_410039 ?auto_410041 ) ) ( not ( = ?auto_410039 ?auto_410042 ) ) ( not ( = ?auto_410039 ?auto_410043 ) ) ( not ( = ?auto_410039 ?auto_410044 ) ) ( not ( = ?auto_410040 ?auto_410041 ) ) ( not ( = ?auto_410040 ?auto_410042 ) ) ( not ( = ?auto_410040 ?auto_410043 ) ) ( not ( = ?auto_410040 ?auto_410044 ) ) ( not ( = ?auto_410041 ?auto_410042 ) ) ( not ( = ?auto_410041 ?auto_410043 ) ) ( not ( = ?auto_410041 ?auto_410044 ) ) ( not ( = ?auto_410042 ?auto_410043 ) ) ( not ( = ?auto_410042 ?auto_410044 ) ) ( not ( = ?auto_410043 ?auto_410044 ) ) ( ON ?auto_410042 ?auto_410043 ) ( ON ?auto_410041 ?auto_410042 ) ( ON ?auto_410040 ?auto_410041 ) ( ON ?auto_410039 ?auto_410040 ) ( ON ?auto_410038 ?auto_410039 ) ( CLEAR ?auto_410036 ) ( ON ?auto_410037 ?auto_410038 ) ( CLEAR ?auto_410037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_410032 ?auto_410033 ?auto_410034 ?auto_410035 ?auto_410036 ?auto_410037 )
      ( MAKE-12PILE ?auto_410032 ?auto_410033 ?auto_410034 ?auto_410035 ?auto_410036 ?auto_410037 ?auto_410038 ?auto_410039 ?auto_410040 ?auto_410041 ?auto_410042 ?auto_410043 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410057 - BLOCK
      ?auto_410058 - BLOCK
      ?auto_410059 - BLOCK
      ?auto_410060 - BLOCK
      ?auto_410061 - BLOCK
      ?auto_410062 - BLOCK
      ?auto_410063 - BLOCK
      ?auto_410064 - BLOCK
      ?auto_410065 - BLOCK
      ?auto_410066 - BLOCK
      ?auto_410067 - BLOCK
      ?auto_410068 - BLOCK
    )
    :vars
    (
      ?auto_410069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410068 ?auto_410069 ) ( ON-TABLE ?auto_410057 ) ( ON ?auto_410058 ?auto_410057 ) ( ON ?auto_410059 ?auto_410058 ) ( ON ?auto_410060 ?auto_410059 ) ( ON ?auto_410061 ?auto_410060 ) ( not ( = ?auto_410057 ?auto_410058 ) ) ( not ( = ?auto_410057 ?auto_410059 ) ) ( not ( = ?auto_410057 ?auto_410060 ) ) ( not ( = ?auto_410057 ?auto_410061 ) ) ( not ( = ?auto_410057 ?auto_410062 ) ) ( not ( = ?auto_410057 ?auto_410063 ) ) ( not ( = ?auto_410057 ?auto_410064 ) ) ( not ( = ?auto_410057 ?auto_410065 ) ) ( not ( = ?auto_410057 ?auto_410066 ) ) ( not ( = ?auto_410057 ?auto_410067 ) ) ( not ( = ?auto_410057 ?auto_410068 ) ) ( not ( = ?auto_410057 ?auto_410069 ) ) ( not ( = ?auto_410058 ?auto_410059 ) ) ( not ( = ?auto_410058 ?auto_410060 ) ) ( not ( = ?auto_410058 ?auto_410061 ) ) ( not ( = ?auto_410058 ?auto_410062 ) ) ( not ( = ?auto_410058 ?auto_410063 ) ) ( not ( = ?auto_410058 ?auto_410064 ) ) ( not ( = ?auto_410058 ?auto_410065 ) ) ( not ( = ?auto_410058 ?auto_410066 ) ) ( not ( = ?auto_410058 ?auto_410067 ) ) ( not ( = ?auto_410058 ?auto_410068 ) ) ( not ( = ?auto_410058 ?auto_410069 ) ) ( not ( = ?auto_410059 ?auto_410060 ) ) ( not ( = ?auto_410059 ?auto_410061 ) ) ( not ( = ?auto_410059 ?auto_410062 ) ) ( not ( = ?auto_410059 ?auto_410063 ) ) ( not ( = ?auto_410059 ?auto_410064 ) ) ( not ( = ?auto_410059 ?auto_410065 ) ) ( not ( = ?auto_410059 ?auto_410066 ) ) ( not ( = ?auto_410059 ?auto_410067 ) ) ( not ( = ?auto_410059 ?auto_410068 ) ) ( not ( = ?auto_410059 ?auto_410069 ) ) ( not ( = ?auto_410060 ?auto_410061 ) ) ( not ( = ?auto_410060 ?auto_410062 ) ) ( not ( = ?auto_410060 ?auto_410063 ) ) ( not ( = ?auto_410060 ?auto_410064 ) ) ( not ( = ?auto_410060 ?auto_410065 ) ) ( not ( = ?auto_410060 ?auto_410066 ) ) ( not ( = ?auto_410060 ?auto_410067 ) ) ( not ( = ?auto_410060 ?auto_410068 ) ) ( not ( = ?auto_410060 ?auto_410069 ) ) ( not ( = ?auto_410061 ?auto_410062 ) ) ( not ( = ?auto_410061 ?auto_410063 ) ) ( not ( = ?auto_410061 ?auto_410064 ) ) ( not ( = ?auto_410061 ?auto_410065 ) ) ( not ( = ?auto_410061 ?auto_410066 ) ) ( not ( = ?auto_410061 ?auto_410067 ) ) ( not ( = ?auto_410061 ?auto_410068 ) ) ( not ( = ?auto_410061 ?auto_410069 ) ) ( not ( = ?auto_410062 ?auto_410063 ) ) ( not ( = ?auto_410062 ?auto_410064 ) ) ( not ( = ?auto_410062 ?auto_410065 ) ) ( not ( = ?auto_410062 ?auto_410066 ) ) ( not ( = ?auto_410062 ?auto_410067 ) ) ( not ( = ?auto_410062 ?auto_410068 ) ) ( not ( = ?auto_410062 ?auto_410069 ) ) ( not ( = ?auto_410063 ?auto_410064 ) ) ( not ( = ?auto_410063 ?auto_410065 ) ) ( not ( = ?auto_410063 ?auto_410066 ) ) ( not ( = ?auto_410063 ?auto_410067 ) ) ( not ( = ?auto_410063 ?auto_410068 ) ) ( not ( = ?auto_410063 ?auto_410069 ) ) ( not ( = ?auto_410064 ?auto_410065 ) ) ( not ( = ?auto_410064 ?auto_410066 ) ) ( not ( = ?auto_410064 ?auto_410067 ) ) ( not ( = ?auto_410064 ?auto_410068 ) ) ( not ( = ?auto_410064 ?auto_410069 ) ) ( not ( = ?auto_410065 ?auto_410066 ) ) ( not ( = ?auto_410065 ?auto_410067 ) ) ( not ( = ?auto_410065 ?auto_410068 ) ) ( not ( = ?auto_410065 ?auto_410069 ) ) ( not ( = ?auto_410066 ?auto_410067 ) ) ( not ( = ?auto_410066 ?auto_410068 ) ) ( not ( = ?auto_410066 ?auto_410069 ) ) ( not ( = ?auto_410067 ?auto_410068 ) ) ( not ( = ?auto_410067 ?auto_410069 ) ) ( not ( = ?auto_410068 ?auto_410069 ) ) ( ON ?auto_410067 ?auto_410068 ) ( ON ?auto_410066 ?auto_410067 ) ( ON ?auto_410065 ?auto_410066 ) ( ON ?auto_410064 ?auto_410065 ) ( ON ?auto_410063 ?auto_410064 ) ( CLEAR ?auto_410061 ) ( ON ?auto_410062 ?auto_410063 ) ( CLEAR ?auto_410062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_410057 ?auto_410058 ?auto_410059 ?auto_410060 ?auto_410061 ?auto_410062 )
      ( MAKE-12PILE ?auto_410057 ?auto_410058 ?auto_410059 ?auto_410060 ?auto_410061 ?auto_410062 ?auto_410063 ?auto_410064 ?auto_410065 ?auto_410066 ?auto_410067 ?auto_410068 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410082 - BLOCK
      ?auto_410083 - BLOCK
      ?auto_410084 - BLOCK
      ?auto_410085 - BLOCK
      ?auto_410086 - BLOCK
      ?auto_410087 - BLOCK
      ?auto_410088 - BLOCK
      ?auto_410089 - BLOCK
      ?auto_410090 - BLOCK
      ?auto_410091 - BLOCK
      ?auto_410092 - BLOCK
      ?auto_410093 - BLOCK
    )
    :vars
    (
      ?auto_410094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410093 ?auto_410094 ) ( ON-TABLE ?auto_410082 ) ( ON ?auto_410083 ?auto_410082 ) ( ON ?auto_410084 ?auto_410083 ) ( ON ?auto_410085 ?auto_410084 ) ( not ( = ?auto_410082 ?auto_410083 ) ) ( not ( = ?auto_410082 ?auto_410084 ) ) ( not ( = ?auto_410082 ?auto_410085 ) ) ( not ( = ?auto_410082 ?auto_410086 ) ) ( not ( = ?auto_410082 ?auto_410087 ) ) ( not ( = ?auto_410082 ?auto_410088 ) ) ( not ( = ?auto_410082 ?auto_410089 ) ) ( not ( = ?auto_410082 ?auto_410090 ) ) ( not ( = ?auto_410082 ?auto_410091 ) ) ( not ( = ?auto_410082 ?auto_410092 ) ) ( not ( = ?auto_410082 ?auto_410093 ) ) ( not ( = ?auto_410082 ?auto_410094 ) ) ( not ( = ?auto_410083 ?auto_410084 ) ) ( not ( = ?auto_410083 ?auto_410085 ) ) ( not ( = ?auto_410083 ?auto_410086 ) ) ( not ( = ?auto_410083 ?auto_410087 ) ) ( not ( = ?auto_410083 ?auto_410088 ) ) ( not ( = ?auto_410083 ?auto_410089 ) ) ( not ( = ?auto_410083 ?auto_410090 ) ) ( not ( = ?auto_410083 ?auto_410091 ) ) ( not ( = ?auto_410083 ?auto_410092 ) ) ( not ( = ?auto_410083 ?auto_410093 ) ) ( not ( = ?auto_410083 ?auto_410094 ) ) ( not ( = ?auto_410084 ?auto_410085 ) ) ( not ( = ?auto_410084 ?auto_410086 ) ) ( not ( = ?auto_410084 ?auto_410087 ) ) ( not ( = ?auto_410084 ?auto_410088 ) ) ( not ( = ?auto_410084 ?auto_410089 ) ) ( not ( = ?auto_410084 ?auto_410090 ) ) ( not ( = ?auto_410084 ?auto_410091 ) ) ( not ( = ?auto_410084 ?auto_410092 ) ) ( not ( = ?auto_410084 ?auto_410093 ) ) ( not ( = ?auto_410084 ?auto_410094 ) ) ( not ( = ?auto_410085 ?auto_410086 ) ) ( not ( = ?auto_410085 ?auto_410087 ) ) ( not ( = ?auto_410085 ?auto_410088 ) ) ( not ( = ?auto_410085 ?auto_410089 ) ) ( not ( = ?auto_410085 ?auto_410090 ) ) ( not ( = ?auto_410085 ?auto_410091 ) ) ( not ( = ?auto_410085 ?auto_410092 ) ) ( not ( = ?auto_410085 ?auto_410093 ) ) ( not ( = ?auto_410085 ?auto_410094 ) ) ( not ( = ?auto_410086 ?auto_410087 ) ) ( not ( = ?auto_410086 ?auto_410088 ) ) ( not ( = ?auto_410086 ?auto_410089 ) ) ( not ( = ?auto_410086 ?auto_410090 ) ) ( not ( = ?auto_410086 ?auto_410091 ) ) ( not ( = ?auto_410086 ?auto_410092 ) ) ( not ( = ?auto_410086 ?auto_410093 ) ) ( not ( = ?auto_410086 ?auto_410094 ) ) ( not ( = ?auto_410087 ?auto_410088 ) ) ( not ( = ?auto_410087 ?auto_410089 ) ) ( not ( = ?auto_410087 ?auto_410090 ) ) ( not ( = ?auto_410087 ?auto_410091 ) ) ( not ( = ?auto_410087 ?auto_410092 ) ) ( not ( = ?auto_410087 ?auto_410093 ) ) ( not ( = ?auto_410087 ?auto_410094 ) ) ( not ( = ?auto_410088 ?auto_410089 ) ) ( not ( = ?auto_410088 ?auto_410090 ) ) ( not ( = ?auto_410088 ?auto_410091 ) ) ( not ( = ?auto_410088 ?auto_410092 ) ) ( not ( = ?auto_410088 ?auto_410093 ) ) ( not ( = ?auto_410088 ?auto_410094 ) ) ( not ( = ?auto_410089 ?auto_410090 ) ) ( not ( = ?auto_410089 ?auto_410091 ) ) ( not ( = ?auto_410089 ?auto_410092 ) ) ( not ( = ?auto_410089 ?auto_410093 ) ) ( not ( = ?auto_410089 ?auto_410094 ) ) ( not ( = ?auto_410090 ?auto_410091 ) ) ( not ( = ?auto_410090 ?auto_410092 ) ) ( not ( = ?auto_410090 ?auto_410093 ) ) ( not ( = ?auto_410090 ?auto_410094 ) ) ( not ( = ?auto_410091 ?auto_410092 ) ) ( not ( = ?auto_410091 ?auto_410093 ) ) ( not ( = ?auto_410091 ?auto_410094 ) ) ( not ( = ?auto_410092 ?auto_410093 ) ) ( not ( = ?auto_410092 ?auto_410094 ) ) ( not ( = ?auto_410093 ?auto_410094 ) ) ( ON ?auto_410092 ?auto_410093 ) ( ON ?auto_410091 ?auto_410092 ) ( ON ?auto_410090 ?auto_410091 ) ( ON ?auto_410089 ?auto_410090 ) ( ON ?auto_410088 ?auto_410089 ) ( ON ?auto_410087 ?auto_410088 ) ( CLEAR ?auto_410085 ) ( ON ?auto_410086 ?auto_410087 ) ( CLEAR ?auto_410086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_410082 ?auto_410083 ?auto_410084 ?auto_410085 ?auto_410086 )
      ( MAKE-12PILE ?auto_410082 ?auto_410083 ?auto_410084 ?auto_410085 ?auto_410086 ?auto_410087 ?auto_410088 ?auto_410089 ?auto_410090 ?auto_410091 ?auto_410092 ?auto_410093 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410107 - BLOCK
      ?auto_410108 - BLOCK
      ?auto_410109 - BLOCK
      ?auto_410110 - BLOCK
      ?auto_410111 - BLOCK
      ?auto_410112 - BLOCK
      ?auto_410113 - BLOCK
      ?auto_410114 - BLOCK
      ?auto_410115 - BLOCK
      ?auto_410116 - BLOCK
      ?auto_410117 - BLOCK
      ?auto_410118 - BLOCK
    )
    :vars
    (
      ?auto_410119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410118 ?auto_410119 ) ( ON-TABLE ?auto_410107 ) ( ON ?auto_410108 ?auto_410107 ) ( ON ?auto_410109 ?auto_410108 ) ( ON ?auto_410110 ?auto_410109 ) ( not ( = ?auto_410107 ?auto_410108 ) ) ( not ( = ?auto_410107 ?auto_410109 ) ) ( not ( = ?auto_410107 ?auto_410110 ) ) ( not ( = ?auto_410107 ?auto_410111 ) ) ( not ( = ?auto_410107 ?auto_410112 ) ) ( not ( = ?auto_410107 ?auto_410113 ) ) ( not ( = ?auto_410107 ?auto_410114 ) ) ( not ( = ?auto_410107 ?auto_410115 ) ) ( not ( = ?auto_410107 ?auto_410116 ) ) ( not ( = ?auto_410107 ?auto_410117 ) ) ( not ( = ?auto_410107 ?auto_410118 ) ) ( not ( = ?auto_410107 ?auto_410119 ) ) ( not ( = ?auto_410108 ?auto_410109 ) ) ( not ( = ?auto_410108 ?auto_410110 ) ) ( not ( = ?auto_410108 ?auto_410111 ) ) ( not ( = ?auto_410108 ?auto_410112 ) ) ( not ( = ?auto_410108 ?auto_410113 ) ) ( not ( = ?auto_410108 ?auto_410114 ) ) ( not ( = ?auto_410108 ?auto_410115 ) ) ( not ( = ?auto_410108 ?auto_410116 ) ) ( not ( = ?auto_410108 ?auto_410117 ) ) ( not ( = ?auto_410108 ?auto_410118 ) ) ( not ( = ?auto_410108 ?auto_410119 ) ) ( not ( = ?auto_410109 ?auto_410110 ) ) ( not ( = ?auto_410109 ?auto_410111 ) ) ( not ( = ?auto_410109 ?auto_410112 ) ) ( not ( = ?auto_410109 ?auto_410113 ) ) ( not ( = ?auto_410109 ?auto_410114 ) ) ( not ( = ?auto_410109 ?auto_410115 ) ) ( not ( = ?auto_410109 ?auto_410116 ) ) ( not ( = ?auto_410109 ?auto_410117 ) ) ( not ( = ?auto_410109 ?auto_410118 ) ) ( not ( = ?auto_410109 ?auto_410119 ) ) ( not ( = ?auto_410110 ?auto_410111 ) ) ( not ( = ?auto_410110 ?auto_410112 ) ) ( not ( = ?auto_410110 ?auto_410113 ) ) ( not ( = ?auto_410110 ?auto_410114 ) ) ( not ( = ?auto_410110 ?auto_410115 ) ) ( not ( = ?auto_410110 ?auto_410116 ) ) ( not ( = ?auto_410110 ?auto_410117 ) ) ( not ( = ?auto_410110 ?auto_410118 ) ) ( not ( = ?auto_410110 ?auto_410119 ) ) ( not ( = ?auto_410111 ?auto_410112 ) ) ( not ( = ?auto_410111 ?auto_410113 ) ) ( not ( = ?auto_410111 ?auto_410114 ) ) ( not ( = ?auto_410111 ?auto_410115 ) ) ( not ( = ?auto_410111 ?auto_410116 ) ) ( not ( = ?auto_410111 ?auto_410117 ) ) ( not ( = ?auto_410111 ?auto_410118 ) ) ( not ( = ?auto_410111 ?auto_410119 ) ) ( not ( = ?auto_410112 ?auto_410113 ) ) ( not ( = ?auto_410112 ?auto_410114 ) ) ( not ( = ?auto_410112 ?auto_410115 ) ) ( not ( = ?auto_410112 ?auto_410116 ) ) ( not ( = ?auto_410112 ?auto_410117 ) ) ( not ( = ?auto_410112 ?auto_410118 ) ) ( not ( = ?auto_410112 ?auto_410119 ) ) ( not ( = ?auto_410113 ?auto_410114 ) ) ( not ( = ?auto_410113 ?auto_410115 ) ) ( not ( = ?auto_410113 ?auto_410116 ) ) ( not ( = ?auto_410113 ?auto_410117 ) ) ( not ( = ?auto_410113 ?auto_410118 ) ) ( not ( = ?auto_410113 ?auto_410119 ) ) ( not ( = ?auto_410114 ?auto_410115 ) ) ( not ( = ?auto_410114 ?auto_410116 ) ) ( not ( = ?auto_410114 ?auto_410117 ) ) ( not ( = ?auto_410114 ?auto_410118 ) ) ( not ( = ?auto_410114 ?auto_410119 ) ) ( not ( = ?auto_410115 ?auto_410116 ) ) ( not ( = ?auto_410115 ?auto_410117 ) ) ( not ( = ?auto_410115 ?auto_410118 ) ) ( not ( = ?auto_410115 ?auto_410119 ) ) ( not ( = ?auto_410116 ?auto_410117 ) ) ( not ( = ?auto_410116 ?auto_410118 ) ) ( not ( = ?auto_410116 ?auto_410119 ) ) ( not ( = ?auto_410117 ?auto_410118 ) ) ( not ( = ?auto_410117 ?auto_410119 ) ) ( not ( = ?auto_410118 ?auto_410119 ) ) ( ON ?auto_410117 ?auto_410118 ) ( ON ?auto_410116 ?auto_410117 ) ( ON ?auto_410115 ?auto_410116 ) ( ON ?auto_410114 ?auto_410115 ) ( ON ?auto_410113 ?auto_410114 ) ( ON ?auto_410112 ?auto_410113 ) ( CLEAR ?auto_410110 ) ( ON ?auto_410111 ?auto_410112 ) ( CLEAR ?auto_410111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_410107 ?auto_410108 ?auto_410109 ?auto_410110 ?auto_410111 )
      ( MAKE-12PILE ?auto_410107 ?auto_410108 ?auto_410109 ?auto_410110 ?auto_410111 ?auto_410112 ?auto_410113 ?auto_410114 ?auto_410115 ?auto_410116 ?auto_410117 ?auto_410118 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410132 - BLOCK
      ?auto_410133 - BLOCK
      ?auto_410134 - BLOCK
      ?auto_410135 - BLOCK
      ?auto_410136 - BLOCK
      ?auto_410137 - BLOCK
      ?auto_410138 - BLOCK
      ?auto_410139 - BLOCK
      ?auto_410140 - BLOCK
      ?auto_410141 - BLOCK
      ?auto_410142 - BLOCK
      ?auto_410143 - BLOCK
    )
    :vars
    (
      ?auto_410144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410143 ?auto_410144 ) ( ON-TABLE ?auto_410132 ) ( ON ?auto_410133 ?auto_410132 ) ( ON ?auto_410134 ?auto_410133 ) ( not ( = ?auto_410132 ?auto_410133 ) ) ( not ( = ?auto_410132 ?auto_410134 ) ) ( not ( = ?auto_410132 ?auto_410135 ) ) ( not ( = ?auto_410132 ?auto_410136 ) ) ( not ( = ?auto_410132 ?auto_410137 ) ) ( not ( = ?auto_410132 ?auto_410138 ) ) ( not ( = ?auto_410132 ?auto_410139 ) ) ( not ( = ?auto_410132 ?auto_410140 ) ) ( not ( = ?auto_410132 ?auto_410141 ) ) ( not ( = ?auto_410132 ?auto_410142 ) ) ( not ( = ?auto_410132 ?auto_410143 ) ) ( not ( = ?auto_410132 ?auto_410144 ) ) ( not ( = ?auto_410133 ?auto_410134 ) ) ( not ( = ?auto_410133 ?auto_410135 ) ) ( not ( = ?auto_410133 ?auto_410136 ) ) ( not ( = ?auto_410133 ?auto_410137 ) ) ( not ( = ?auto_410133 ?auto_410138 ) ) ( not ( = ?auto_410133 ?auto_410139 ) ) ( not ( = ?auto_410133 ?auto_410140 ) ) ( not ( = ?auto_410133 ?auto_410141 ) ) ( not ( = ?auto_410133 ?auto_410142 ) ) ( not ( = ?auto_410133 ?auto_410143 ) ) ( not ( = ?auto_410133 ?auto_410144 ) ) ( not ( = ?auto_410134 ?auto_410135 ) ) ( not ( = ?auto_410134 ?auto_410136 ) ) ( not ( = ?auto_410134 ?auto_410137 ) ) ( not ( = ?auto_410134 ?auto_410138 ) ) ( not ( = ?auto_410134 ?auto_410139 ) ) ( not ( = ?auto_410134 ?auto_410140 ) ) ( not ( = ?auto_410134 ?auto_410141 ) ) ( not ( = ?auto_410134 ?auto_410142 ) ) ( not ( = ?auto_410134 ?auto_410143 ) ) ( not ( = ?auto_410134 ?auto_410144 ) ) ( not ( = ?auto_410135 ?auto_410136 ) ) ( not ( = ?auto_410135 ?auto_410137 ) ) ( not ( = ?auto_410135 ?auto_410138 ) ) ( not ( = ?auto_410135 ?auto_410139 ) ) ( not ( = ?auto_410135 ?auto_410140 ) ) ( not ( = ?auto_410135 ?auto_410141 ) ) ( not ( = ?auto_410135 ?auto_410142 ) ) ( not ( = ?auto_410135 ?auto_410143 ) ) ( not ( = ?auto_410135 ?auto_410144 ) ) ( not ( = ?auto_410136 ?auto_410137 ) ) ( not ( = ?auto_410136 ?auto_410138 ) ) ( not ( = ?auto_410136 ?auto_410139 ) ) ( not ( = ?auto_410136 ?auto_410140 ) ) ( not ( = ?auto_410136 ?auto_410141 ) ) ( not ( = ?auto_410136 ?auto_410142 ) ) ( not ( = ?auto_410136 ?auto_410143 ) ) ( not ( = ?auto_410136 ?auto_410144 ) ) ( not ( = ?auto_410137 ?auto_410138 ) ) ( not ( = ?auto_410137 ?auto_410139 ) ) ( not ( = ?auto_410137 ?auto_410140 ) ) ( not ( = ?auto_410137 ?auto_410141 ) ) ( not ( = ?auto_410137 ?auto_410142 ) ) ( not ( = ?auto_410137 ?auto_410143 ) ) ( not ( = ?auto_410137 ?auto_410144 ) ) ( not ( = ?auto_410138 ?auto_410139 ) ) ( not ( = ?auto_410138 ?auto_410140 ) ) ( not ( = ?auto_410138 ?auto_410141 ) ) ( not ( = ?auto_410138 ?auto_410142 ) ) ( not ( = ?auto_410138 ?auto_410143 ) ) ( not ( = ?auto_410138 ?auto_410144 ) ) ( not ( = ?auto_410139 ?auto_410140 ) ) ( not ( = ?auto_410139 ?auto_410141 ) ) ( not ( = ?auto_410139 ?auto_410142 ) ) ( not ( = ?auto_410139 ?auto_410143 ) ) ( not ( = ?auto_410139 ?auto_410144 ) ) ( not ( = ?auto_410140 ?auto_410141 ) ) ( not ( = ?auto_410140 ?auto_410142 ) ) ( not ( = ?auto_410140 ?auto_410143 ) ) ( not ( = ?auto_410140 ?auto_410144 ) ) ( not ( = ?auto_410141 ?auto_410142 ) ) ( not ( = ?auto_410141 ?auto_410143 ) ) ( not ( = ?auto_410141 ?auto_410144 ) ) ( not ( = ?auto_410142 ?auto_410143 ) ) ( not ( = ?auto_410142 ?auto_410144 ) ) ( not ( = ?auto_410143 ?auto_410144 ) ) ( ON ?auto_410142 ?auto_410143 ) ( ON ?auto_410141 ?auto_410142 ) ( ON ?auto_410140 ?auto_410141 ) ( ON ?auto_410139 ?auto_410140 ) ( ON ?auto_410138 ?auto_410139 ) ( ON ?auto_410137 ?auto_410138 ) ( ON ?auto_410136 ?auto_410137 ) ( CLEAR ?auto_410134 ) ( ON ?auto_410135 ?auto_410136 ) ( CLEAR ?auto_410135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_410132 ?auto_410133 ?auto_410134 ?auto_410135 )
      ( MAKE-12PILE ?auto_410132 ?auto_410133 ?auto_410134 ?auto_410135 ?auto_410136 ?auto_410137 ?auto_410138 ?auto_410139 ?auto_410140 ?auto_410141 ?auto_410142 ?auto_410143 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410157 - BLOCK
      ?auto_410158 - BLOCK
      ?auto_410159 - BLOCK
      ?auto_410160 - BLOCK
      ?auto_410161 - BLOCK
      ?auto_410162 - BLOCK
      ?auto_410163 - BLOCK
      ?auto_410164 - BLOCK
      ?auto_410165 - BLOCK
      ?auto_410166 - BLOCK
      ?auto_410167 - BLOCK
      ?auto_410168 - BLOCK
    )
    :vars
    (
      ?auto_410169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410168 ?auto_410169 ) ( ON-TABLE ?auto_410157 ) ( ON ?auto_410158 ?auto_410157 ) ( ON ?auto_410159 ?auto_410158 ) ( not ( = ?auto_410157 ?auto_410158 ) ) ( not ( = ?auto_410157 ?auto_410159 ) ) ( not ( = ?auto_410157 ?auto_410160 ) ) ( not ( = ?auto_410157 ?auto_410161 ) ) ( not ( = ?auto_410157 ?auto_410162 ) ) ( not ( = ?auto_410157 ?auto_410163 ) ) ( not ( = ?auto_410157 ?auto_410164 ) ) ( not ( = ?auto_410157 ?auto_410165 ) ) ( not ( = ?auto_410157 ?auto_410166 ) ) ( not ( = ?auto_410157 ?auto_410167 ) ) ( not ( = ?auto_410157 ?auto_410168 ) ) ( not ( = ?auto_410157 ?auto_410169 ) ) ( not ( = ?auto_410158 ?auto_410159 ) ) ( not ( = ?auto_410158 ?auto_410160 ) ) ( not ( = ?auto_410158 ?auto_410161 ) ) ( not ( = ?auto_410158 ?auto_410162 ) ) ( not ( = ?auto_410158 ?auto_410163 ) ) ( not ( = ?auto_410158 ?auto_410164 ) ) ( not ( = ?auto_410158 ?auto_410165 ) ) ( not ( = ?auto_410158 ?auto_410166 ) ) ( not ( = ?auto_410158 ?auto_410167 ) ) ( not ( = ?auto_410158 ?auto_410168 ) ) ( not ( = ?auto_410158 ?auto_410169 ) ) ( not ( = ?auto_410159 ?auto_410160 ) ) ( not ( = ?auto_410159 ?auto_410161 ) ) ( not ( = ?auto_410159 ?auto_410162 ) ) ( not ( = ?auto_410159 ?auto_410163 ) ) ( not ( = ?auto_410159 ?auto_410164 ) ) ( not ( = ?auto_410159 ?auto_410165 ) ) ( not ( = ?auto_410159 ?auto_410166 ) ) ( not ( = ?auto_410159 ?auto_410167 ) ) ( not ( = ?auto_410159 ?auto_410168 ) ) ( not ( = ?auto_410159 ?auto_410169 ) ) ( not ( = ?auto_410160 ?auto_410161 ) ) ( not ( = ?auto_410160 ?auto_410162 ) ) ( not ( = ?auto_410160 ?auto_410163 ) ) ( not ( = ?auto_410160 ?auto_410164 ) ) ( not ( = ?auto_410160 ?auto_410165 ) ) ( not ( = ?auto_410160 ?auto_410166 ) ) ( not ( = ?auto_410160 ?auto_410167 ) ) ( not ( = ?auto_410160 ?auto_410168 ) ) ( not ( = ?auto_410160 ?auto_410169 ) ) ( not ( = ?auto_410161 ?auto_410162 ) ) ( not ( = ?auto_410161 ?auto_410163 ) ) ( not ( = ?auto_410161 ?auto_410164 ) ) ( not ( = ?auto_410161 ?auto_410165 ) ) ( not ( = ?auto_410161 ?auto_410166 ) ) ( not ( = ?auto_410161 ?auto_410167 ) ) ( not ( = ?auto_410161 ?auto_410168 ) ) ( not ( = ?auto_410161 ?auto_410169 ) ) ( not ( = ?auto_410162 ?auto_410163 ) ) ( not ( = ?auto_410162 ?auto_410164 ) ) ( not ( = ?auto_410162 ?auto_410165 ) ) ( not ( = ?auto_410162 ?auto_410166 ) ) ( not ( = ?auto_410162 ?auto_410167 ) ) ( not ( = ?auto_410162 ?auto_410168 ) ) ( not ( = ?auto_410162 ?auto_410169 ) ) ( not ( = ?auto_410163 ?auto_410164 ) ) ( not ( = ?auto_410163 ?auto_410165 ) ) ( not ( = ?auto_410163 ?auto_410166 ) ) ( not ( = ?auto_410163 ?auto_410167 ) ) ( not ( = ?auto_410163 ?auto_410168 ) ) ( not ( = ?auto_410163 ?auto_410169 ) ) ( not ( = ?auto_410164 ?auto_410165 ) ) ( not ( = ?auto_410164 ?auto_410166 ) ) ( not ( = ?auto_410164 ?auto_410167 ) ) ( not ( = ?auto_410164 ?auto_410168 ) ) ( not ( = ?auto_410164 ?auto_410169 ) ) ( not ( = ?auto_410165 ?auto_410166 ) ) ( not ( = ?auto_410165 ?auto_410167 ) ) ( not ( = ?auto_410165 ?auto_410168 ) ) ( not ( = ?auto_410165 ?auto_410169 ) ) ( not ( = ?auto_410166 ?auto_410167 ) ) ( not ( = ?auto_410166 ?auto_410168 ) ) ( not ( = ?auto_410166 ?auto_410169 ) ) ( not ( = ?auto_410167 ?auto_410168 ) ) ( not ( = ?auto_410167 ?auto_410169 ) ) ( not ( = ?auto_410168 ?auto_410169 ) ) ( ON ?auto_410167 ?auto_410168 ) ( ON ?auto_410166 ?auto_410167 ) ( ON ?auto_410165 ?auto_410166 ) ( ON ?auto_410164 ?auto_410165 ) ( ON ?auto_410163 ?auto_410164 ) ( ON ?auto_410162 ?auto_410163 ) ( ON ?auto_410161 ?auto_410162 ) ( CLEAR ?auto_410159 ) ( ON ?auto_410160 ?auto_410161 ) ( CLEAR ?auto_410160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_410157 ?auto_410158 ?auto_410159 ?auto_410160 )
      ( MAKE-12PILE ?auto_410157 ?auto_410158 ?auto_410159 ?auto_410160 ?auto_410161 ?auto_410162 ?auto_410163 ?auto_410164 ?auto_410165 ?auto_410166 ?auto_410167 ?auto_410168 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410182 - BLOCK
      ?auto_410183 - BLOCK
      ?auto_410184 - BLOCK
      ?auto_410185 - BLOCK
      ?auto_410186 - BLOCK
      ?auto_410187 - BLOCK
      ?auto_410188 - BLOCK
      ?auto_410189 - BLOCK
      ?auto_410190 - BLOCK
      ?auto_410191 - BLOCK
      ?auto_410192 - BLOCK
      ?auto_410193 - BLOCK
    )
    :vars
    (
      ?auto_410194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410193 ?auto_410194 ) ( ON-TABLE ?auto_410182 ) ( ON ?auto_410183 ?auto_410182 ) ( not ( = ?auto_410182 ?auto_410183 ) ) ( not ( = ?auto_410182 ?auto_410184 ) ) ( not ( = ?auto_410182 ?auto_410185 ) ) ( not ( = ?auto_410182 ?auto_410186 ) ) ( not ( = ?auto_410182 ?auto_410187 ) ) ( not ( = ?auto_410182 ?auto_410188 ) ) ( not ( = ?auto_410182 ?auto_410189 ) ) ( not ( = ?auto_410182 ?auto_410190 ) ) ( not ( = ?auto_410182 ?auto_410191 ) ) ( not ( = ?auto_410182 ?auto_410192 ) ) ( not ( = ?auto_410182 ?auto_410193 ) ) ( not ( = ?auto_410182 ?auto_410194 ) ) ( not ( = ?auto_410183 ?auto_410184 ) ) ( not ( = ?auto_410183 ?auto_410185 ) ) ( not ( = ?auto_410183 ?auto_410186 ) ) ( not ( = ?auto_410183 ?auto_410187 ) ) ( not ( = ?auto_410183 ?auto_410188 ) ) ( not ( = ?auto_410183 ?auto_410189 ) ) ( not ( = ?auto_410183 ?auto_410190 ) ) ( not ( = ?auto_410183 ?auto_410191 ) ) ( not ( = ?auto_410183 ?auto_410192 ) ) ( not ( = ?auto_410183 ?auto_410193 ) ) ( not ( = ?auto_410183 ?auto_410194 ) ) ( not ( = ?auto_410184 ?auto_410185 ) ) ( not ( = ?auto_410184 ?auto_410186 ) ) ( not ( = ?auto_410184 ?auto_410187 ) ) ( not ( = ?auto_410184 ?auto_410188 ) ) ( not ( = ?auto_410184 ?auto_410189 ) ) ( not ( = ?auto_410184 ?auto_410190 ) ) ( not ( = ?auto_410184 ?auto_410191 ) ) ( not ( = ?auto_410184 ?auto_410192 ) ) ( not ( = ?auto_410184 ?auto_410193 ) ) ( not ( = ?auto_410184 ?auto_410194 ) ) ( not ( = ?auto_410185 ?auto_410186 ) ) ( not ( = ?auto_410185 ?auto_410187 ) ) ( not ( = ?auto_410185 ?auto_410188 ) ) ( not ( = ?auto_410185 ?auto_410189 ) ) ( not ( = ?auto_410185 ?auto_410190 ) ) ( not ( = ?auto_410185 ?auto_410191 ) ) ( not ( = ?auto_410185 ?auto_410192 ) ) ( not ( = ?auto_410185 ?auto_410193 ) ) ( not ( = ?auto_410185 ?auto_410194 ) ) ( not ( = ?auto_410186 ?auto_410187 ) ) ( not ( = ?auto_410186 ?auto_410188 ) ) ( not ( = ?auto_410186 ?auto_410189 ) ) ( not ( = ?auto_410186 ?auto_410190 ) ) ( not ( = ?auto_410186 ?auto_410191 ) ) ( not ( = ?auto_410186 ?auto_410192 ) ) ( not ( = ?auto_410186 ?auto_410193 ) ) ( not ( = ?auto_410186 ?auto_410194 ) ) ( not ( = ?auto_410187 ?auto_410188 ) ) ( not ( = ?auto_410187 ?auto_410189 ) ) ( not ( = ?auto_410187 ?auto_410190 ) ) ( not ( = ?auto_410187 ?auto_410191 ) ) ( not ( = ?auto_410187 ?auto_410192 ) ) ( not ( = ?auto_410187 ?auto_410193 ) ) ( not ( = ?auto_410187 ?auto_410194 ) ) ( not ( = ?auto_410188 ?auto_410189 ) ) ( not ( = ?auto_410188 ?auto_410190 ) ) ( not ( = ?auto_410188 ?auto_410191 ) ) ( not ( = ?auto_410188 ?auto_410192 ) ) ( not ( = ?auto_410188 ?auto_410193 ) ) ( not ( = ?auto_410188 ?auto_410194 ) ) ( not ( = ?auto_410189 ?auto_410190 ) ) ( not ( = ?auto_410189 ?auto_410191 ) ) ( not ( = ?auto_410189 ?auto_410192 ) ) ( not ( = ?auto_410189 ?auto_410193 ) ) ( not ( = ?auto_410189 ?auto_410194 ) ) ( not ( = ?auto_410190 ?auto_410191 ) ) ( not ( = ?auto_410190 ?auto_410192 ) ) ( not ( = ?auto_410190 ?auto_410193 ) ) ( not ( = ?auto_410190 ?auto_410194 ) ) ( not ( = ?auto_410191 ?auto_410192 ) ) ( not ( = ?auto_410191 ?auto_410193 ) ) ( not ( = ?auto_410191 ?auto_410194 ) ) ( not ( = ?auto_410192 ?auto_410193 ) ) ( not ( = ?auto_410192 ?auto_410194 ) ) ( not ( = ?auto_410193 ?auto_410194 ) ) ( ON ?auto_410192 ?auto_410193 ) ( ON ?auto_410191 ?auto_410192 ) ( ON ?auto_410190 ?auto_410191 ) ( ON ?auto_410189 ?auto_410190 ) ( ON ?auto_410188 ?auto_410189 ) ( ON ?auto_410187 ?auto_410188 ) ( ON ?auto_410186 ?auto_410187 ) ( ON ?auto_410185 ?auto_410186 ) ( CLEAR ?auto_410183 ) ( ON ?auto_410184 ?auto_410185 ) ( CLEAR ?auto_410184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_410182 ?auto_410183 ?auto_410184 )
      ( MAKE-12PILE ?auto_410182 ?auto_410183 ?auto_410184 ?auto_410185 ?auto_410186 ?auto_410187 ?auto_410188 ?auto_410189 ?auto_410190 ?auto_410191 ?auto_410192 ?auto_410193 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410207 - BLOCK
      ?auto_410208 - BLOCK
      ?auto_410209 - BLOCK
      ?auto_410210 - BLOCK
      ?auto_410211 - BLOCK
      ?auto_410212 - BLOCK
      ?auto_410213 - BLOCK
      ?auto_410214 - BLOCK
      ?auto_410215 - BLOCK
      ?auto_410216 - BLOCK
      ?auto_410217 - BLOCK
      ?auto_410218 - BLOCK
    )
    :vars
    (
      ?auto_410219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410218 ?auto_410219 ) ( ON-TABLE ?auto_410207 ) ( ON ?auto_410208 ?auto_410207 ) ( not ( = ?auto_410207 ?auto_410208 ) ) ( not ( = ?auto_410207 ?auto_410209 ) ) ( not ( = ?auto_410207 ?auto_410210 ) ) ( not ( = ?auto_410207 ?auto_410211 ) ) ( not ( = ?auto_410207 ?auto_410212 ) ) ( not ( = ?auto_410207 ?auto_410213 ) ) ( not ( = ?auto_410207 ?auto_410214 ) ) ( not ( = ?auto_410207 ?auto_410215 ) ) ( not ( = ?auto_410207 ?auto_410216 ) ) ( not ( = ?auto_410207 ?auto_410217 ) ) ( not ( = ?auto_410207 ?auto_410218 ) ) ( not ( = ?auto_410207 ?auto_410219 ) ) ( not ( = ?auto_410208 ?auto_410209 ) ) ( not ( = ?auto_410208 ?auto_410210 ) ) ( not ( = ?auto_410208 ?auto_410211 ) ) ( not ( = ?auto_410208 ?auto_410212 ) ) ( not ( = ?auto_410208 ?auto_410213 ) ) ( not ( = ?auto_410208 ?auto_410214 ) ) ( not ( = ?auto_410208 ?auto_410215 ) ) ( not ( = ?auto_410208 ?auto_410216 ) ) ( not ( = ?auto_410208 ?auto_410217 ) ) ( not ( = ?auto_410208 ?auto_410218 ) ) ( not ( = ?auto_410208 ?auto_410219 ) ) ( not ( = ?auto_410209 ?auto_410210 ) ) ( not ( = ?auto_410209 ?auto_410211 ) ) ( not ( = ?auto_410209 ?auto_410212 ) ) ( not ( = ?auto_410209 ?auto_410213 ) ) ( not ( = ?auto_410209 ?auto_410214 ) ) ( not ( = ?auto_410209 ?auto_410215 ) ) ( not ( = ?auto_410209 ?auto_410216 ) ) ( not ( = ?auto_410209 ?auto_410217 ) ) ( not ( = ?auto_410209 ?auto_410218 ) ) ( not ( = ?auto_410209 ?auto_410219 ) ) ( not ( = ?auto_410210 ?auto_410211 ) ) ( not ( = ?auto_410210 ?auto_410212 ) ) ( not ( = ?auto_410210 ?auto_410213 ) ) ( not ( = ?auto_410210 ?auto_410214 ) ) ( not ( = ?auto_410210 ?auto_410215 ) ) ( not ( = ?auto_410210 ?auto_410216 ) ) ( not ( = ?auto_410210 ?auto_410217 ) ) ( not ( = ?auto_410210 ?auto_410218 ) ) ( not ( = ?auto_410210 ?auto_410219 ) ) ( not ( = ?auto_410211 ?auto_410212 ) ) ( not ( = ?auto_410211 ?auto_410213 ) ) ( not ( = ?auto_410211 ?auto_410214 ) ) ( not ( = ?auto_410211 ?auto_410215 ) ) ( not ( = ?auto_410211 ?auto_410216 ) ) ( not ( = ?auto_410211 ?auto_410217 ) ) ( not ( = ?auto_410211 ?auto_410218 ) ) ( not ( = ?auto_410211 ?auto_410219 ) ) ( not ( = ?auto_410212 ?auto_410213 ) ) ( not ( = ?auto_410212 ?auto_410214 ) ) ( not ( = ?auto_410212 ?auto_410215 ) ) ( not ( = ?auto_410212 ?auto_410216 ) ) ( not ( = ?auto_410212 ?auto_410217 ) ) ( not ( = ?auto_410212 ?auto_410218 ) ) ( not ( = ?auto_410212 ?auto_410219 ) ) ( not ( = ?auto_410213 ?auto_410214 ) ) ( not ( = ?auto_410213 ?auto_410215 ) ) ( not ( = ?auto_410213 ?auto_410216 ) ) ( not ( = ?auto_410213 ?auto_410217 ) ) ( not ( = ?auto_410213 ?auto_410218 ) ) ( not ( = ?auto_410213 ?auto_410219 ) ) ( not ( = ?auto_410214 ?auto_410215 ) ) ( not ( = ?auto_410214 ?auto_410216 ) ) ( not ( = ?auto_410214 ?auto_410217 ) ) ( not ( = ?auto_410214 ?auto_410218 ) ) ( not ( = ?auto_410214 ?auto_410219 ) ) ( not ( = ?auto_410215 ?auto_410216 ) ) ( not ( = ?auto_410215 ?auto_410217 ) ) ( not ( = ?auto_410215 ?auto_410218 ) ) ( not ( = ?auto_410215 ?auto_410219 ) ) ( not ( = ?auto_410216 ?auto_410217 ) ) ( not ( = ?auto_410216 ?auto_410218 ) ) ( not ( = ?auto_410216 ?auto_410219 ) ) ( not ( = ?auto_410217 ?auto_410218 ) ) ( not ( = ?auto_410217 ?auto_410219 ) ) ( not ( = ?auto_410218 ?auto_410219 ) ) ( ON ?auto_410217 ?auto_410218 ) ( ON ?auto_410216 ?auto_410217 ) ( ON ?auto_410215 ?auto_410216 ) ( ON ?auto_410214 ?auto_410215 ) ( ON ?auto_410213 ?auto_410214 ) ( ON ?auto_410212 ?auto_410213 ) ( ON ?auto_410211 ?auto_410212 ) ( ON ?auto_410210 ?auto_410211 ) ( CLEAR ?auto_410208 ) ( ON ?auto_410209 ?auto_410210 ) ( CLEAR ?auto_410209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_410207 ?auto_410208 ?auto_410209 )
      ( MAKE-12PILE ?auto_410207 ?auto_410208 ?auto_410209 ?auto_410210 ?auto_410211 ?auto_410212 ?auto_410213 ?auto_410214 ?auto_410215 ?auto_410216 ?auto_410217 ?auto_410218 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410232 - BLOCK
      ?auto_410233 - BLOCK
      ?auto_410234 - BLOCK
      ?auto_410235 - BLOCK
      ?auto_410236 - BLOCK
      ?auto_410237 - BLOCK
      ?auto_410238 - BLOCK
      ?auto_410239 - BLOCK
      ?auto_410240 - BLOCK
      ?auto_410241 - BLOCK
      ?auto_410242 - BLOCK
      ?auto_410243 - BLOCK
    )
    :vars
    (
      ?auto_410244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410243 ?auto_410244 ) ( ON-TABLE ?auto_410232 ) ( not ( = ?auto_410232 ?auto_410233 ) ) ( not ( = ?auto_410232 ?auto_410234 ) ) ( not ( = ?auto_410232 ?auto_410235 ) ) ( not ( = ?auto_410232 ?auto_410236 ) ) ( not ( = ?auto_410232 ?auto_410237 ) ) ( not ( = ?auto_410232 ?auto_410238 ) ) ( not ( = ?auto_410232 ?auto_410239 ) ) ( not ( = ?auto_410232 ?auto_410240 ) ) ( not ( = ?auto_410232 ?auto_410241 ) ) ( not ( = ?auto_410232 ?auto_410242 ) ) ( not ( = ?auto_410232 ?auto_410243 ) ) ( not ( = ?auto_410232 ?auto_410244 ) ) ( not ( = ?auto_410233 ?auto_410234 ) ) ( not ( = ?auto_410233 ?auto_410235 ) ) ( not ( = ?auto_410233 ?auto_410236 ) ) ( not ( = ?auto_410233 ?auto_410237 ) ) ( not ( = ?auto_410233 ?auto_410238 ) ) ( not ( = ?auto_410233 ?auto_410239 ) ) ( not ( = ?auto_410233 ?auto_410240 ) ) ( not ( = ?auto_410233 ?auto_410241 ) ) ( not ( = ?auto_410233 ?auto_410242 ) ) ( not ( = ?auto_410233 ?auto_410243 ) ) ( not ( = ?auto_410233 ?auto_410244 ) ) ( not ( = ?auto_410234 ?auto_410235 ) ) ( not ( = ?auto_410234 ?auto_410236 ) ) ( not ( = ?auto_410234 ?auto_410237 ) ) ( not ( = ?auto_410234 ?auto_410238 ) ) ( not ( = ?auto_410234 ?auto_410239 ) ) ( not ( = ?auto_410234 ?auto_410240 ) ) ( not ( = ?auto_410234 ?auto_410241 ) ) ( not ( = ?auto_410234 ?auto_410242 ) ) ( not ( = ?auto_410234 ?auto_410243 ) ) ( not ( = ?auto_410234 ?auto_410244 ) ) ( not ( = ?auto_410235 ?auto_410236 ) ) ( not ( = ?auto_410235 ?auto_410237 ) ) ( not ( = ?auto_410235 ?auto_410238 ) ) ( not ( = ?auto_410235 ?auto_410239 ) ) ( not ( = ?auto_410235 ?auto_410240 ) ) ( not ( = ?auto_410235 ?auto_410241 ) ) ( not ( = ?auto_410235 ?auto_410242 ) ) ( not ( = ?auto_410235 ?auto_410243 ) ) ( not ( = ?auto_410235 ?auto_410244 ) ) ( not ( = ?auto_410236 ?auto_410237 ) ) ( not ( = ?auto_410236 ?auto_410238 ) ) ( not ( = ?auto_410236 ?auto_410239 ) ) ( not ( = ?auto_410236 ?auto_410240 ) ) ( not ( = ?auto_410236 ?auto_410241 ) ) ( not ( = ?auto_410236 ?auto_410242 ) ) ( not ( = ?auto_410236 ?auto_410243 ) ) ( not ( = ?auto_410236 ?auto_410244 ) ) ( not ( = ?auto_410237 ?auto_410238 ) ) ( not ( = ?auto_410237 ?auto_410239 ) ) ( not ( = ?auto_410237 ?auto_410240 ) ) ( not ( = ?auto_410237 ?auto_410241 ) ) ( not ( = ?auto_410237 ?auto_410242 ) ) ( not ( = ?auto_410237 ?auto_410243 ) ) ( not ( = ?auto_410237 ?auto_410244 ) ) ( not ( = ?auto_410238 ?auto_410239 ) ) ( not ( = ?auto_410238 ?auto_410240 ) ) ( not ( = ?auto_410238 ?auto_410241 ) ) ( not ( = ?auto_410238 ?auto_410242 ) ) ( not ( = ?auto_410238 ?auto_410243 ) ) ( not ( = ?auto_410238 ?auto_410244 ) ) ( not ( = ?auto_410239 ?auto_410240 ) ) ( not ( = ?auto_410239 ?auto_410241 ) ) ( not ( = ?auto_410239 ?auto_410242 ) ) ( not ( = ?auto_410239 ?auto_410243 ) ) ( not ( = ?auto_410239 ?auto_410244 ) ) ( not ( = ?auto_410240 ?auto_410241 ) ) ( not ( = ?auto_410240 ?auto_410242 ) ) ( not ( = ?auto_410240 ?auto_410243 ) ) ( not ( = ?auto_410240 ?auto_410244 ) ) ( not ( = ?auto_410241 ?auto_410242 ) ) ( not ( = ?auto_410241 ?auto_410243 ) ) ( not ( = ?auto_410241 ?auto_410244 ) ) ( not ( = ?auto_410242 ?auto_410243 ) ) ( not ( = ?auto_410242 ?auto_410244 ) ) ( not ( = ?auto_410243 ?auto_410244 ) ) ( ON ?auto_410242 ?auto_410243 ) ( ON ?auto_410241 ?auto_410242 ) ( ON ?auto_410240 ?auto_410241 ) ( ON ?auto_410239 ?auto_410240 ) ( ON ?auto_410238 ?auto_410239 ) ( ON ?auto_410237 ?auto_410238 ) ( ON ?auto_410236 ?auto_410237 ) ( ON ?auto_410235 ?auto_410236 ) ( ON ?auto_410234 ?auto_410235 ) ( CLEAR ?auto_410232 ) ( ON ?auto_410233 ?auto_410234 ) ( CLEAR ?auto_410233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_410232 ?auto_410233 )
      ( MAKE-12PILE ?auto_410232 ?auto_410233 ?auto_410234 ?auto_410235 ?auto_410236 ?auto_410237 ?auto_410238 ?auto_410239 ?auto_410240 ?auto_410241 ?auto_410242 ?auto_410243 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410257 - BLOCK
      ?auto_410258 - BLOCK
      ?auto_410259 - BLOCK
      ?auto_410260 - BLOCK
      ?auto_410261 - BLOCK
      ?auto_410262 - BLOCK
      ?auto_410263 - BLOCK
      ?auto_410264 - BLOCK
      ?auto_410265 - BLOCK
      ?auto_410266 - BLOCK
      ?auto_410267 - BLOCK
      ?auto_410268 - BLOCK
    )
    :vars
    (
      ?auto_410269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410268 ?auto_410269 ) ( ON-TABLE ?auto_410257 ) ( not ( = ?auto_410257 ?auto_410258 ) ) ( not ( = ?auto_410257 ?auto_410259 ) ) ( not ( = ?auto_410257 ?auto_410260 ) ) ( not ( = ?auto_410257 ?auto_410261 ) ) ( not ( = ?auto_410257 ?auto_410262 ) ) ( not ( = ?auto_410257 ?auto_410263 ) ) ( not ( = ?auto_410257 ?auto_410264 ) ) ( not ( = ?auto_410257 ?auto_410265 ) ) ( not ( = ?auto_410257 ?auto_410266 ) ) ( not ( = ?auto_410257 ?auto_410267 ) ) ( not ( = ?auto_410257 ?auto_410268 ) ) ( not ( = ?auto_410257 ?auto_410269 ) ) ( not ( = ?auto_410258 ?auto_410259 ) ) ( not ( = ?auto_410258 ?auto_410260 ) ) ( not ( = ?auto_410258 ?auto_410261 ) ) ( not ( = ?auto_410258 ?auto_410262 ) ) ( not ( = ?auto_410258 ?auto_410263 ) ) ( not ( = ?auto_410258 ?auto_410264 ) ) ( not ( = ?auto_410258 ?auto_410265 ) ) ( not ( = ?auto_410258 ?auto_410266 ) ) ( not ( = ?auto_410258 ?auto_410267 ) ) ( not ( = ?auto_410258 ?auto_410268 ) ) ( not ( = ?auto_410258 ?auto_410269 ) ) ( not ( = ?auto_410259 ?auto_410260 ) ) ( not ( = ?auto_410259 ?auto_410261 ) ) ( not ( = ?auto_410259 ?auto_410262 ) ) ( not ( = ?auto_410259 ?auto_410263 ) ) ( not ( = ?auto_410259 ?auto_410264 ) ) ( not ( = ?auto_410259 ?auto_410265 ) ) ( not ( = ?auto_410259 ?auto_410266 ) ) ( not ( = ?auto_410259 ?auto_410267 ) ) ( not ( = ?auto_410259 ?auto_410268 ) ) ( not ( = ?auto_410259 ?auto_410269 ) ) ( not ( = ?auto_410260 ?auto_410261 ) ) ( not ( = ?auto_410260 ?auto_410262 ) ) ( not ( = ?auto_410260 ?auto_410263 ) ) ( not ( = ?auto_410260 ?auto_410264 ) ) ( not ( = ?auto_410260 ?auto_410265 ) ) ( not ( = ?auto_410260 ?auto_410266 ) ) ( not ( = ?auto_410260 ?auto_410267 ) ) ( not ( = ?auto_410260 ?auto_410268 ) ) ( not ( = ?auto_410260 ?auto_410269 ) ) ( not ( = ?auto_410261 ?auto_410262 ) ) ( not ( = ?auto_410261 ?auto_410263 ) ) ( not ( = ?auto_410261 ?auto_410264 ) ) ( not ( = ?auto_410261 ?auto_410265 ) ) ( not ( = ?auto_410261 ?auto_410266 ) ) ( not ( = ?auto_410261 ?auto_410267 ) ) ( not ( = ?auto_410261 ?auto_410268 ) ) ( not ( = ?auto_410261 ?auto_410269 ) ) ( not ( = ?auto_410262 ?auto_410263 ) ) ( not ( = ?auto_410262 ?auto_410264 ) ) ( not ( = ?auto_410262 ?auto_410265 ) ) ( not ( = ?auto_410262 ?auto_410266 ) ) ( not ( = ?auto_410262 ?auto_410267 ) ) ( not ( = ?auto_410262 ?auto_410268 ) ) ( not ( = ?auto_410262 ?auto_410269 ) ) ( not ( = ?auto_410263 ?auto_410264 ) ) ( not ( = ?auto_410263 ?auto_410265 ) ) ( not ( = ?auto_410263 ?auto_410266 ) ) ( not ( = ?auto_410263 ?auto_410267 ) ) ( not ( = ?auto_410263 ?auto_410268 ) ) ( not ( = ?auto_410263 ?auto_410269 ) ) ( not ( = ?auto_410264 ?auto_410265 ) ) ( not ( = ?auto_410264 ?auto_410266 ) ) ( not ( = ?auto_410264 ?auto_410267 ) ) ( not ( = ?auto_410264 ?auto_410268 ) ) ( not ( = ?auto_410264 ?auto_410269 ) ) ( not ( = ?auto_410265 ?auto_410266 ) ) ( not ( = ?auto_410265 ?auto_410267 ) ) ( not ( = ?auto_410265 ?auto_410268 ) ) ( not ( = ?auto_410265 ?auto_410269 ) ) ( not ( = ?auto_410266 ?auto_410267 ) ) ( not ( = ?auto_410266 ?auto_410268 ) ) ( not ( = ?auto_410266 ?auto_410269 ) ) ( not ( = ?auto_410267 ?auto_410268 ) ) ( not ( = ?auto_410267 ?auto_410269 ) ) ( not ( = ?auto_410268 ?auto_410269 ) ) ( ON ?auto_410267 ?auto_410268 ) ( ON ?auto_410266 ?auto_410267 ) ( ON ?auto_410265 ?auto_410266 ) ( ON ?auto_410264 ?auto_410265 ) ( ON ?auto_410263 ?auto_410264 ) ( ON ?auto_410262 ?auto_410263 ) ( ON ?auto_410261 ?auto_410262 ) ( ON ?auto_410260 ?auto_410261 ) ( ON ?auto_410259 ?auto_410260 ) ( CLEAR ?auto_410257 ) ( ON ?auto_410258 ?auto_410259 ) ( CLEAR ?auto_410258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_410257 ?auto_410258 )
      ( MAKE-12PILE ?auto_410257 ?auto_410258 ?auto_410259 ?auto_410260 ?auto_410261 ?auto_410262 ?auto_410263 ?auto_410264 ?auto_410265 ?auto_410266 ?auto_410267 ?auto_410268 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410282 - BLOCK
      ?auto_410283 - BLOCK
      ?auto_410284 - BLOCK
      ?auto_410285 - BLOCK
      ?auto_410286 - BLOCK
      ?auto_410287 - BLOCK
      ?auto_410288 - BLOCK
      ?auto_410289 - BLOCK
      ?auto_410290 - BLOCK
      ?auto_410291 - BLOCK
      ?auto_410292 - BLOCK
      ?auto_410293 - BLOCK
    )
    :vars
    (
      ?auto_410294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410293 ?auto_410294 ) ( not ( = ?auto_410282 ?auto_410283 ) ) ( not ( = ?auto_410282 ?auto_410284 ) ) ( not ( = ?auto_410282 ?auto_410285 ) ) ( not ( = ?auto_410282 ?auto_410286 ) ) ( not ( = ?auto_410282 ?auto_410287 ) ) ( not ( = ?auto_410282 ?auto_410288 ) ) ( not ( = ?auto_410282 ?auto_410289 ) ) ( not ( = ?auto_410282 ?auto_410290 ) ) ( not ( = ?auto_410282 ?auto_410291 ) ) ( not ( = ?auto_410282 ?auto_410292 ) ) ( not ( = ?auto_410282 ?auto_410293 ) ) ( not ( = ?auto_410282 ?auto_410294 ) ) ( not ( = ?auto_410283 ?auto_410284 ) ) ( not ( = ?auto_410283 ?auto_410285 ) ) ( not ( = ?auto_410283 ?auto_410286 ) ) ( not ( = ?auto_410283 ?auto_410287 ) ) ( not ( = ?auto_410283 ?auto_410288 ) ) ( not ( = ?auto_410283 ?auto_410289 ) ) ( not ( = ?auto_410283 ?auto_410290 ) ) ( not ( = ?auto_410283 ?auto_410291 ) ) ( not ( = ?auto_410283 ?auto_410292 ) ) ( not ( = ?auto_410283 ?auto_410293 ) ) ( not ( = ?auto_410283 ?auto_410294 ) ) ( not ( = ?auto_410284 ?auto_410285 ) ) ( not ( = ?auto_410284 ?auto_410286 ) ) ( not ( = ?auto_410284 ?auto_410287 ) ) ( not ( = ?auto_410284 ?auto_410288 ) ) ( not ( = ?auto_410284 ?auto_410289 ) ) ( not ( = ?auto_410284 ?auto_410290 ) ) ( not ( = ?auto_410284 ?auto_410291 ) ) ( not ( = ?auto_410284 ?auto_410292 ) ) ( not ( = ?auto_410284 ?auto_410293 ) ) ( not ( = ?auto_410284 ?auto_410294 ) ) ( not ( = ?auto_410285 ?auto_410286 ) ) ( not ( = ?auto_410285 ?auto_410287 ) ) ( not ( = ?auto_410285 ?auto_410288 ) ) ( not ( = ?auto_410285 ?auto_410289 ) ) ( not ( = ?auto_410285 ?auto_410290 ) ) ( not ( = ?auto_410285 ?auto_410291 ) ) ( not ( = ?auto_410285 ?auto_410292 ) ) ( not ( = ?auto_410285 ?auto_410293 ) ) ( not ( = ?auto_410285 ?auto_410294 ) ) ( not ( = ?auto_410286 ?auto_410287 ) ) ( not ( = ?auto_410286 ?auto_410288 ) ) ( not ( = ?auto_410286 ?auto_410289 ) ) ( not ( = ?auto_410286 ?auto_410290 ) ) ( not ( = ?auto_410286 ?auto_410291 ) ) ( not ( = ?auto_410286 ?auto_410292 ) ) ( not ( = ?auto_410286 ?auto_410293 ) ) ( not ( = ?auto_410286 ?auto_410294 ) ) ( not ( = ?auto_410287 ?auto_410288 ) ) ( not ( = ?auto_410287 ?auto_410289 ) ) ( not ( = ?auto_410287 ?auto_410290 ) ) ( not ( = ?auto_410287 ?auto_410291 ) ) ( not ( = ?auto_410287 ?auto_410292 ) ) ( not ( = ?auto_410287 ?auto_410293 ) ) ( not ( = ?auto_410287 ?auto_410294 ) ) ( not ( = ?auto_410288 ?auto_410289 ) ) ( not ( = ?auto_410288 ?auto_410290 ) ) ( not ( = ?auto_410288 ?auto_410291 ) ) ( not ( = ?auto_410288 ?auto_410292 ) ) ( not ( = ?auto_410288 ?auto_410293 ) ) ( not ( = ?auto_410288 ?auto_410294 ) ) ( not ( = ?auto_410289 ?auto_410290 ) ) ( not ( = ?auto_410289 ?auto_410291 ) ) ( not ( = ?auto_410289 ?auto_410292 ) ) ( not ( = ?auto_410289 ?auto_410293 ) ) ( not ( = ?auto_410289 ?auto_410294 ) ) ( not ( = ?auto_410290 ?auto_410291 ) ) ( not ( = ?auto_410290 ?auto_410292 ) ) ( not ( = ?auto_410290 ?auto_410293 ) ) ( not ( = ?auto_410290 ?auto_410294 ) ) ( not ( = ?auto_410291 ?auto_410292 ) ) ( not ( = ?auto_410291 ?auto_410293 ) ) ( not ( = ?auto_410291 ?auto_410294 ) ) ( not ( = ?auto_410292 ?auto_410293 ) ) ( not ( = ?auto_410292 ?auto_410294 ) ) ( not ( = ?auto_410293 ?auto_410294 ) ) ( ON ?auto_410292 ?auto_410293 ) ( ON ?auto_410291 ?auto_410292 ) ( ON ?auto_410290 ?auto_410291 ) ( ON ?auto_410289 ?auto_410290 ) ( ON ?auto_410288 ?auto_410289 ) ( ON ?auto_410287 ?auto_410288 ) ( ON ?auto_410286 ?auto_410287 ) ( ON ?auto_410285 ?auto_410286 ) ( ON ?auto_410284 ?auto_410285 ) ( ON ?auto_410283 ?auto_410284 ) ( ON ?auto_410282 ?auto_410283 ) ( CLEAR ?auto_410282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_410282 )
      ( MAKE-12PILE ?auto_410282 ?auto_410283 ?auto_410284 ?auto_410285 ?auto_410286 ?auto_410287 ?auto_410288 ?auto_410289 ?auto_410290 ?auto_410291 ?auto_410292 ?auto_410293 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_410307 - BLOCK
      ?auto_410308 - BLOCK
      ?auto_410309 - BLOCK
      ?auto_410310 - BLOCK
      ?auto_410311 - BLOCK
      ?auto_410312 - BLOCK
      ?auto_410313 - BLOCK
      ?auto_410314 - BLOCK
      ?auto_410315 - BLOCK
      ?auto_410316 - BLOCK
      ?auto_410317 - BLOCK
      ?auto_410318 - BLOCK
    )
    :vars
    (
      ?auto_410319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410318 ?auto_410319 ) ( not ( = ?auto_410307 ?auto_410308 ) ) ( not ( = ?auto_410307 ?auto_410309 ) ) ( not ( = ?auto_410307 ?auto_410310 ) ) ( not ( = ?auto_410307 ?auto_410311 ) ) ( not ( = ?auto_410307 ?auto_410312 ) ) ( not ( = ?auto_410307 ?auto_410313 ) ) ( not ( = ?auto_410307 ?auto_410314 ) ) ( not ( = ?auto_410307 ?auto_410315 ) ) ( not ( = ?auto_410307 ?auto_410316 ) ) ( not ( = ?auto_410307 ?auto_410317 ) ) ( not ( = ?auto_410307 ?auto_410318 ) ) ( not ( = ?auto_410307 ?auto_410319 ) ) ( not ( = ?auto_410308 ?auto_410309 ) ) ( not ( = ?auto_410308 ?auto_410310 ) ) ( not ( = ?auto_410308 ?auto_410311 ) ) ( not ( = ?auto_410308 ?auto_410312 ) ) ( not ( = ?auto_410308 ?auto_410313 ) ) ( not ( = ?auto_410308 ?auto_410314 ) ) ( not ( = ?auto_410308 ?auto_410315 ) ) ( not ( = ?auto_410308 ?auto_410316 ) ) ( not ( = ?auto_410308 ?auto_410317 ) ) ( not ( = ?auto_410308 ?auto_410318 ) ) ( not ( = ?auto_410308 ?auto_410319 ) ) ( not ( = ?auto_410309 ?auto_410310 ) ) ( not ( = ?auto_410309 ?auto_410311 ) ) ( not ( = ?auto_410309 ?auto_410312 ) ) ( not ( = ?auto_410309 ?auto_410313 ) ) ( not ( = ?auto_410309 ?auto_410314 ) ) ( not ( = ?auto_410309 ?auto_410315 ) ) ( not ( = ?auto_410309 ?auto_410316 ) ) ( not ( = ?auto_410309 ?auto_410317 ) ) ( not ( = ?auto_410309 ?auto_410318 ) ) ( not ( = ?auto_410309 ?auto_410319 ) ) ( not ( = ?auto_410310 ?auto_410311 ) ) ( not ( = ?auto_410310 ?auto_410312 ) ) ( not ( = ?auto_410310 ?auto_410313 ) ) ( not ( = ?auto_410310 ?auto_410314 ) ) ( not ( = ?auto_410310 ?auto_410315 ) ) ( not ( = ?auto_410310 ?auto_410316 ) ) ( not ( = ?auto_410310 ?auto_410317 ) ) ( not ( = ?auto_410310 ?auto_410318 ) ) ( not ( = ?auto_410310 ?auto_410319 ) ) ( not ( = ?auto_410311 ?auto_410312 ) ) ( not ( = ?auto_410311 ?auto_410313 ) ) ( not ( = ?auto_410311 ?auto_410314 ) ) ( not ( = ?auto_410311 ?auto_410315 ) ) ( not ( = ?auto_410311 ?auto_410316 ) ) ( not ( = ?auto_410311 ?auto_410317 ) ) ( not ( = ?auto_410311 ?auto_410318 ) ) ( not ( = ?auto_410311 ?auto_410319 ) ) ( not ( = ?auto_410312 ?auto_410313 ) ) ( not ( = ?auto_410312 ?auto_410314 ) ) ( not ( = ?auto_410312 ?auto_410315 ) ) ( not ( = ?auto_410312 ?auto_410316 ) ) ( not ( = ?auto_410312 ?auto_410317 ) ) ( not ( = ?auto_410312 ?auto_410318 ) ) ( not ( = ?auto_410312 ?auto_410319 ) ) ( not ( = ?auto_410313 ?auto_410314 ) ) ( not ( = ?auto_410313 ?auto_410315 ) ) ( not ( = ?auto_410313 ?auto_410316 ) ) ( not ( = ?auto_410313 ?auto_410317 ) ) ( not ( = ?auto_410313 ?auto_410318 ) ) ( not ( = ?auto_410313 ?auto_410319 ) ) ( not ( = ?auto_410314 ?auto_410315 ) ) ( not ( = ?auto_410314 ?auto_410316 ) ) ( not ( = ?auto_410314 ?auto_410317 ) ) ( not ( = ?auto_410314 ?auto_410318 ) ) ( not ( = ?auto_410314 ?auto_410319 ) ) ( not ( = ?auto_410315 ?auto_410316 ) ) ( not ( = ?auto_410315 ?auto_410317 ) ) ( not ( = ?auto_410315 ?auto_410318 ) ) ( not ( = ?auto_410315 ?auto_410319 ) ) ( not ( = ?auto_410316 ?auto_410317 ) ) ( not ( = ?auto_410316 ?auto_410318 ) ) ( not ( = ?auto_410316 ?auto_410319 ) ) ( not ( = ?auto_410317 ?auto_410318 ) ) ( not ( = ?auto_410317 ?auto_410319 ) ) ( not ( = ?auto_410318 ?auto_410319 ) ) ( ON ?auto_410317 ?auto_410318 ) ( ON ?auto_410316 ?auto_410317 ) ( ON ?auto_410315 ?auto_410316 ) ( ON ?auto_410314 ?auto_410315 ) ( ON ?auto_410313 ?auto_410314 ) ( ON ?auto_410312 ?auto_410313 ) ( ON ?auto_410311 ?auto_410312 ) ( ON ?auto_410310 ?auto_410311 ) ( ON ?auto_410309 ?auto_410310 ) ( ON ?auto_410308 ?auto_410309 ) ( ON ?auto_410307 ?auto_410308 ) ( CLEAR ?auto_410307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_410307 )
      ( MAKE-12PILE ?auto_410307 ?auto_410308 ?auto_410309 ?auto_410310 ?auto_410311 ?auto_410312 ?auto_410313 ?auto_410314 ?auto_410315 ?auto_410316 ?auto_410317 ?auto_410318 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410333 - BLOCK
      ?auto_410334 - BLOCK
      ?auto_410335 - BLOCK
      ?auto_410336 - BLOCK
      ?auto_410337 - BLOCK
      ?auto_410338 - BLOCK
      ?auto_410339 - BLOCK
      ?auto_410340 - BLOCK
      ?auto_410341 - BLOCK
      ?auto_410342 - BLOCK
      ?auto_410343 - BLOCK
      ?auto_410344 - BLOCK
      ?auto_410345 - BLOCK
    )
    :vars
    (
      ?auto_410346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_410344 ) ( ON ?auto_410345 ?auto_410346 ) ( CLEAR ?auto_410345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_410333 ) ( ON ?auto_410334 ?auto_410333 ) ( ON ?auto_410335 ?auto_410334 ) ( ON ?auto_410336 ?auto_410335 ) ( ON ?auto_410337 ?auto_410336 ) ( ON ?auto_410338 ?auto_410337 ) ( ON ?auto_410339 ?auto_410338 ) ( ON ?auto_410340 ?auto_410339 ) ( ON ?auto_410341 ?auto_410340 ) ( ON ?auto_410342 ?auto_410341 ) ( ON ?auto_410343 ?auto_410342 ) ( ON ?auto_410344 ?auto_410343 ) ( not ( = ?auto_410333 ?auto_410334 ) ) ( not ( = ?auto_410333 ?auto_410335 ) ) ( not ( = ?auto_410333 ?auto_410336 ) ) ( not ( = ?auto_410333 ?auto_410337 ) ) ( not ( = ?auto_410333 ?auto_410338 ) ) ( not ( = ?auto_410333 ?auto_410339 ) ) ( not ( = ?auto_410333 ?auto_410340 ) ) ( not ( = ?auto_410333 ?auto_410341 ) ) ( not ( = ?auto_410333 ?auto_410342 ) ) ( not ( = ?auto_410333 ?auto_410343 ) ) ( not ( = ?auto_410333 ?auto_410344 ) ) ( not ( = ?auto_410333 ?auto_410345 ) ) ( not ( = ?auto_410333 ?auto_410346 ) ) ( not ( = ?auto_410334 ?auto_410335 ) ) ( not ( = ?auto_410334 ?auto_410336 ) ) ( not ( = ?auto_410334 ?auto_410337 ) ) ( not ( = ?auto_410334 ?auto_410338 ) ) ( not ( = ?auto_410334 ?auto_410339 ) ) ( not ( = ?auto_410334 ?auto_410340 ) ) ( not ( = ?auto_410334 ?auto_410341 ) ) ( not ( = ?auto_410334 ?auto_410342 ) ) ( not ( = ?auto_410334 ?auto_410343 ) ) ( not ( = ?auto_410334 ?auto_410344 ) ) ( not ( = ?auto_410334 ?auto_410345 ) ) ( not ( = ?auto_410334 ?auto_410346 ) ) ( not ( = ?auto_410335 ?auto_410336 ) ) ( not ( = ?auto_410335 ?auto_410337 ) ) ( not ( = ?auto_410335 ?auto_410338 ) ) ( not ( = ?auto_410335 ?auto_410339 ) ) ( not ( = ?auto_410335 ?auto_410340 ) ) ( not ( = ?auto_410335 ?auto_410341 ) ) ( not ( = ?auto_410335 ?auto_410342 ) ) ( not ( = ?auto_410335 ?auto_410343 ) ) ( not ( = ?auto_410335 ?auto_410344 ) ) ( not ( = ?auto_410335 ?auto_410345 ) ) ( not ( = ?auto_410335 ?auto_410346 ) ) ( not ( = ?auto_410336 ?auto_410337 ) ) ( not ( = ?auto_410336 ?auto_410338 ) ) ( not ( = ?auto_410336 ?auto_410339 ) ) ( not ( = ?auto_410336 ?auto_410340 ) ) ( not ( = ?auto_410336 ?auto_410341 ) ) ( not ( = ?auto_410336 ?auto_410342 ) ) ( not ( = ?auto_410336 ?auto_410343 ) ) ( not ( = ?auto_410336 ?auto_410344 ) ) ( not ( = ?auto_410336 ?auto_410345 ) ) ( not ( = ?auto_410336 ?auto_410346 ) ) ( not ( = ?auto_410337 ?auto_410338 ) ) ( not ( = ?auto_410337 ?auto_410339 ) ) ( not ( = ?auto_410337 ?auto_410340 ) ) ( not ( = ?auto_410337 ?auto_410341 ) ) ( not ( = ?auto_410337 ?auto_410342 ) ) ( not ( = ?auto_410337 ?auto_410343 ) ) ( not ( = ?auto_410337 ?auto_410344 ) ) ( not ( = ?auto_410337 ?auto_410345 ) ) ( not ( = ?auto_410337 ?auto_410346 ) ) ( not ( = ?auto_410338 ?auto_410339 ) ) ( not ( = ?auto_410338 ?auto_410340 ) ) ( not ( = ?auto_410338 ?auto_410341 ) ) ( not ( = ?auto_410338 ?auto_410342 ) ) ( not ( = ?auto_410338 ?auto_410343 ) ) ( not ( = ?auto_410338 ?auto_410344 ) ) ( not ( = ?auto_410338 ?auto_410345 ) ) ( not ( = ?auto_410338 ?auto_410346 ) ) ( not ( = ?auto_410339 ?auto_410340 ) ) ( not ( = ?auto_410339 ?auto_410341 ) ) ( not ( = ?auto_410339 ?auto_410342 ) ) ( not ( = ?auto_410339 ?auto_410343 ) ) ( not ( = ?auto_410339 ?auto_410344 ) ) ( not ( = ?auto_410339 ?auto_410345 ) ) ( not ( = ?auto_410339 ?auto_410346 ) ) ( not ( = ?auto_410340 ?auto_410341 ) ) ( not ( = ?auto_410340 ?auto_410342 ) ) ( not ( = ?auto_410340 ?auto_410343 ) ) ( not ( = ?auto_410340 ?auto_410344 ) ) ( not ( = ?auto_410340 ?auto_410345 ) ) ( not ( = ?auto_410340 ?auto_410346 ) ) ( not ( = ?auto_410341 ?auto_410342 ) ) ( not ( = ?auto_410341 ?auto_410343 ) ) ( not ( = ?auto_410341 ?auto_410344 ) ) ( not ( = ?auto_410341 ?auto_410345 ) ) ( not ( = ?auto_410341 ?auto_410346 ) ) ( not ( = ?auto_410342 ?auto_410343 ) ) ( not ( = ?auto_410342 ?auto_410344 ) ) ( not ( = ?auto_410342 ?auto_410345 ) ) ( not ( = ?auto_410342 ?auto_410346 ) ) ( not ( = ?auto_410343 ?auto_410344 ) ) ( not ( = ?auto_410343 ?auto_410345 ) ) ( not ( = ?auto_410343 ?auto_410346 ) ) ( not ( = ?auto_410344 ?auto_410345 ) ) ( not ( = ?auto_410344 ?auto_410346 ) ) ( not ( = ?auto_410345 ?auto_410346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_410345 ?auto_410346 )
      ( !STACK ?auto_410345 ?auto_410344 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410360 - BLOCK
      ?auto_410361 - BLOCK
      ?auto_410362 - BLOCK
      ?auto_410363 - BLOCK
      ?auto_410364 - BLOCK
      ?auto_410365 - BLOCK
      ?auto_410366 - BLOCK
      ?auto_410367 - BLOCK
      ?auto_410368 - BLOCK
      ?auto_410369 - BLOCK
      ?auto_410370 - BLOCK
      ?auto_410371 - BLOCK
      ?auto_410372 - BLOCK
    )
    :vars
    (
      ?auto_410373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_410371 ) ( ON ?auto_410372 ?auto_410373 ) ( CLEAR ?auto_410372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_410360 ) ( ON ?auto_410361 ?auto_410360 ) ( ON ?auto_410362 ?auto_410361 ) ( ON ?auto_410363 ?auto_410362 ) ( ON ?auto_410364 ?auto_410363 ) ( ON ?auto_410365 ?auto_410364 ) ( ON ?auto_410366 ?auto_410365 ) ( ON ?auto_410367 ?auto_410366 ) ( ON ?auto_410368 ?auto_410367 ) ( ON ?auto_410369 ?auto_410368 ) ( ON ?auto_410370 ?auto_410369 ) ( ON ?auto_410371 ?auto_410370 ) ( not ( = ?auto_410360 ?auto_410361 ) ) ( not ( = ?auto_410360 ?auto_410362 ) ) ( not ( = ?auto_410360 ?auto_410363 ) ) ( not ( = ?auto_410360 ?auto_410364 ) ) ( not ( = ?auto_410360 ?auto_410365 ) ) ( not ( = ?auto_410360 ?auto_410366 ) ) ( not ( = ?auto_410360 ?auto_410367 ) ) ( not ( = ?auto_410360 ?auto_410368 ) ) ( not ( = ?auto_410360 ?auto_410369 ) ) ( not ( = ?auto_410360 ?auto_410370 ) ) ( not ( = ?auto_410360 ?auto_410371 ) ) ( not ( = ?auto_410360 ?auto_410372 ) ) ( not ( = ?auto_410360 ?auto_410373 ) ) ( not ( = ?auto_410361 ?auto_410362 ) ) ( not ( = ?auto_410361 ?auto_410363 ) ) ( not ( = ?auto_410361 ?auto_410364 ) ) ( not ( = ?auto_410361 ?auto_410365 ) ) ( not ( = ?auto_410361 ?auto_410366 ) ) ( not ( = ?auto_410361 ?auto_410367 ) ) ( not ( = ?auto_410361 ?auto_410368 ) ) ( not ( = ?auto_410361 ?auto_410369 ) ) ( not ( = ?auto_410361 ?auto_410370 ) ) ( not ( = ?auto_410361 ?auto_410371 ) ) ( not ( = ?auto_410361 ?auto_410372 ) ) ( not ( = ?auto_410361 ?auto_410373 ) ) ( not ( = ?auto_410362 ?auto_410363 ) ) ( not ( = ?auto_410362 ?auto_410364 ) ) ( not ( = ?auto_410362 ?auto_410365 ) ) ( not ( = ?auto_410362 ?auto_410366 ) ) ( not ( = ?auto_410362 ?auto_410367 ) ) ( not ( = ?auto_410362 ?auto_410368 ) ) ( not ( = ?auto_410362 ?auto_410369 ) ) ( not ( = ?auto_410362 ?auto_410370 ) ) ( not ( = ?auto_410362 ?auto_410371 ) ) ( not ( = ?auto_410362 ?auto_410372 ) ) ( not ( = ?auto_410362 ?auto_410373 ) ) ( not ( = ?auto_410363 ?auto_410364 ) ) ( not ( = ?auto_410363 ?auto_410365 ) ) ( not ( = ?auto_410363 ?auto_410366 ) ) ( not ( = ?auto_410363 ?auto_410367 ) ) ( not ( = ?auto_410363 ?auto_410368 ) ) ( not ( = ?auto_410363 ?auto_410369 ) ) ( not ( = ?auto_410363 ?auto_410370 ) ) ( not ( = ?auto_410363 ?auto_410371 ) ) ( not ( = ?auto_410363 ?auto_410372 ) ) ( not ( = ?auto_410363 ?auto_410373 ) ) ( not ( = ?auto_410364 ?auto_410365 ) ) ( not ( = ?auto_410364 ?auto_410366 ) ) ( not ( = ?auto_410364 ?auto_410367 ) ) ( not ( = ?auto_410364 ?auto_410368 ) ) ( not ( = ?auto_410364 ?auto_410369 ) ) ( not ( = ?auto_410364 ?auto_410370 ) ) ( not ( = ?auto_410364 ?auto_410371 ) ) ( not ( = ?auto_410364 ?auto_410372 ) ) ( not ( = ?auto_410364 ?auto_410373 ) ) ( not ( = ?auto_410365 ?auto_410366 ) ) ( not ( = ?auto_410365 ?auto_410367 ) ) ( not ( = ?auto_410365 ?auto_410368 ) ) ( not ( = ?auto_410365 ?auto_410369 ) ) ( not ( = ?auto_410365 ?auto_410370 ) ) ( not ( = ?auto_410365 ?auto_410371 ) ) ( not ( = ?auto_410365 ?auto_410372 ) ) ( not ( = ?auto_410365 ?auto_410373 ) ) ( not ( = ?auto_410366 ?auto_410367 ) ) ( not ( = ?auto_410366 ?auto_410368 ) ) ( not ( = ?auto_410366 ?auto_410369 ) ) ( not ( = ?auto_410366 ?auto_410370 ) ) ( not ( = ?auto_410366 ?auto_410371 ) ) ( not ( = ?auto_410366 ?auto_410372 ) ) ( not ( = ?auto_410366 ?auto_410373 ) ) ( not ( = ?auto_410367 ?auto_410368 ) ) ( not ( = ?auto_410367 ?auto_410369 ) ) ( not ( = ?auto_410367 ?auto_410370 ) ) ( not ( = ?auto_410367 ?auto_410371 ) ) ( not ( = ?auto_410367 ?auto_410372 ) ) ( not ( = ?auto_410367 ?auto_410373 ) ) ( not ( = ?auto_410368 ?auto_410369 ) ) ( not ( = ?auto_410368 ?auto_410370 ) ) ( not ( = ?auto_410368 ?auto_410371 ) ) ( not ( = ?auto_410368 ?auto_410372 ) ) ( not ( = ?auto_410368 ?auto_410373 ) ) ( not ( = ?auto_410369 ?auto_410370 ) ) ( not ( = ?auto_410369 ?auto_410371 ) ) ( not ( = ?auto_410369 ?auto_410372 ) ) ( not ( = ?auto_410369 ?auto_410373 ) ) ( not ( = ?auto_410370 ?auto_410371 ) ) ( not ( = ?auto_410370 ?auto_410372 ) ) ( not ( = ?auto_410370 ?auto_410373 ) ) ( not ( = ?auto_410371 ?auto_410372 ) ) ( not ( = ?auto_410371 ?auto_410373 ) ) ( not ( = ?auto_410372 ?auto_410373 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_410372 ?auto_410373 )
      ( !STACK ?auto_410372 ?auto_410371 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410387 - BLOCK
      ?auto_410388 - BLOCK
      ?auto_410389 - BLOCK
      ?auto_410390 - BLOCK
      ?auto_410391 - BLOCK
      ?auto_410392 - BLOCK
      ?auto_410393 - BLOCK
      ?auto_410394 - BLOCK
      ?auto_410395 - BLOCK
      ?auto_410396 - BLOCK
      ?auto_410397 - BLOCK
      ?auto_410398 - BLOCK
      ?auto_410399 - BLOCK
    )
    :vars
    (
      ?auto_410400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410399 ?auto_410400 ) ( ON-TABLE ?auto_410387 ) ( ON ?auto_410388 ?auto_410387 ) ( ON ?auto_410389 ?auto_410388 ) ( ON ?auto_410390 ?auto_410389 ) ( ON ?auto_410391 ?auto_410390 ) ( ON ?auto_410392 ?auto_410391 ) ( ON ?auto_410393 ?auto_410392 ) ( ON ?auto_410394 ?auto_410393 ) ( ON ?auto_410395 ?auto_410394 ) ( ON ?auto_410396 ?auto_410395 ) ( ON ?auto_410397 ?auto_410396 ) ( not ( = ?auto_410387 ?auto_410388 ) ) ( not ( = ?auto_410387 ?auto_410389 ) ) ( not ( = ?auto_410387 ?auto_410390 ) ) ( not ( = ?auto_410387 ?auto_410391 ) ) ( not ( = ?auto_410387 ?auto_410392 ) ) ( not ( = ?auto_410387 ?auto_410393 ) ) ( not ( = ?auto_410387 ?auto_410394 ) ) ( not ( = ?auto_410387 ?auto_410395 ) ) ( not ( = ?auto_410387 ?auto_410396 ) ) ( not ( = ?auto_410387 ?auto_410397 ) ) ( not ( = ?auto_410387 ?auto_410398 ) ) ( not ( = ?auto_410387 ?auto_410399 ) ) ( not ( = ?auto_410387 ?auto_410400 ) ) ( not ( = ?auto_410388 ?auto_410389 ) ) ( not ( = ?auto_410388 ?auto_410390 ) ) ( not ( = ?auto_410388 ?auto_410391 ) ) ( not ( = ?auto_410388 ?auto_410392 ) ) ( not ( = ?auto_410388 ?auto_410393 ) ) ( not ( = ?auto_410388 ?auto_410394 ) ) ( not ( = ?auto_410388 ?auto_410395 ) ) ( not ( = ?auto_410388 ?auto_410396 ) ) ( not ( = ?auto_410388 ?auto_410397 ) ) ( not ( = ?auto_410388 ?auto_410398 ) ) ( not ( = ?auto_410388 ?auto_410399 ) ) ( not ( = ?auto_410388 ?auto_410400 ) ) ( not ( = ?auto_410389 ?auto_410390 ) ) ( not ( = ?auto_410389 ?auto_410391 ) ) ( not ( = ?auto_410389 ?auto_410392 ) ) ( not ( = ?auto_410389 ?auto_410393 ) ) ( not ( = ?auto_410389 ?auto_410394 ) ) ( not ( = ?auto_410389 ?auto_410395 ) ) ( not ( = ?auto_410389 ?auto_410396 ) ) ( not ( = ?auto_410389 ?auto_410397 ) ) ( not ( = ?auto_410389 ?auto_410398 ) ) ( not ( = ?auto_410389 ?auto_410399 ) ) ( not ( = ?auto_410389 ?auto_410400 ) ) ( not ( = ?auto_410390 ?auto_410391 ) ) ( not ( = ?auto_410390 ?auto_410392 ) ) ( not ( = ?auto_410390 ?auto_410393 ) ) ( not ( = ?auto_410390 ?auto_410394 ) ) ( not ( = ?auto_410390 ?auto_410395 ) ) ( not ( = ?auto_410390 ?auto_410396 ) ) ( not ( = ?auto_410390 ?auto_410397 ) ) ( not ( = ?auto_410390 ?auto_410398 ) ) ( not ( = ?auto_410390 ?auto_410399 ) ) ( not ( = ?auto_410390 ?auto_410400 ) ) ( not ( = ?auto_410391 ?auto_410392 ) ) ( not ( = ?auto_410391 ?auto_410393 ) ) ( not ( = ?auto_410391 ?auto_410394 ) ) ( not ( = ?auto_410391 ?auto_410395 ) ) ( not ( = ?auto_410391 ?auto_410396 ) ) ( not ( = ?auto_410391 ?auto_410397 ) ) ( not ( = ?auto_410391 ?auto_410398 ) ) ( not ( = ?auto_410391 ?auto_410399 ) ) ( not ( = ?auto_410391 ?auto_410400 ) ) ( not ( = ?auto_410392 ?auto_410393 ) ) ( not ( = ?auto_410392 ?auto_410394 ) ) ( not ( = ?auto_410392 ?auto_410395 ) ) ( not ( = ?auto_410392 ?auto_410396 ) ) ( not ( = ?auto_410392 ?auto_410397 ) ) ( not ( = ?auto_410392 ?auto_410398 ) ) ( not ( = ?auto_410392 ?auto_410399 ) ) ( not ( = ?auto_410392 ?auto_410400 ) ) ( not ( = ?auto_410393 ?auto_410394 ) ) ( not ( = ?auto_410393 ?auto_410395 ) ) ( not ( = ?auto_410393 ?auto_410396 ) ) ( not ( = ?auto_410393 ?auto_410397 ) ) ( not ( = ?auto_410393 ?auto_410398 ) ) ( not ( = ?auto_410393 ?auto_410399 ) ) ( not ( = ?auto_410393 ?auto_410400 ) ) ( not ( = ?auto_410394 ?auto_410395 ) ) ( not ( = ?auto_410394 ?auto_410396 ) ) ( not ( = ?auto_410394 ?auto_410397 ) ) ( not ( = ?auto_410394 ?auto_410398 ) ) ( not ( = ?auto_410394 ?auto_410399 ) ) ( not ( = ?auto_410394 ?auto_410400 ) ) ( not ( = ?auto_410395 ?auto_410396 ) ) ( not ( = ?auto_410395 ?auto_410397 ) ) ( not ( = ?auto_410395 ?auto_410398 ) ) ( not ( = ?auto_410395 ?auto_410399 ) ) ( not ( = ?auto_410395 ?auto_410400 ) ) ( not ( = ?auto_410396 ?auto_410397 ) ) ( not ( = ?auto_410396 ?auto_410398 ) ) ( not ( = ?auto_410396 ?auto_410399 ) ) ( not ( = ?auto_410396 ?auto_410400 ) ) ( not ( = ?auto_410397 ?auto_410398 ) ) ( not ( = ?auto_410397 ?auto_410399 ) ) ( not ( = ?auto_410397 ?auto_410400 ) ) ( not ( = ?auto_410398 ?auto_410399 ) ) ( not ( = ?auto_410398 ?auto_410400 ) ) ( not ( = ?auto_410399 ?auto_410400 ) ) ( CLEAR ?auto_410397 ) ( ON ?auto_410398 ?auto_410399 ) ( CLEAR ?auto_410398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_410387 ?auto_410388 ?auto_410389 ?auto_410390 ?auto_410391 ?auto_410392 ?auto_410393 ?auto_410394 ?auto_410395 ?auto_410396 ?auto_410397 ?auto_410398 )
      ( MAKE-13PILE ?auto_410387 ?auto_410388 ?auto_410389 ?auto_410390 ?auto_410391 ?auto_410392 ?auto_410393 ?auto_410394 ?auto_410395 ?auto_410396 ?auto_410397 ?auto_410398 ?auto_410399 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410414 - BLOCK
      ?auto_410415 - BLOCK
      ?auto_410416 - BLOCK
      ?auto_410417 - BLOCK
      ?auto_410418 - BLOCK
      ?auto_410419 - BLOCK
      ?auto_410420 - BLOCK
      ?auto_410421 - BLOCK
      ?auto_410422 - BLOCK
      ?auto_410423 - BLOCK
      ?auto_410424 - BLOCK
      ?auto_410425 - BLOCK
      ?auto_410426 - BLOCK
    )
    :vars
    (
      ?auto_410427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410426 ?auto_410427 ) ( ON-TABLE ?auto_410414 ) ( ON ?auto_410415 ?auto_410414 ) ( ON ?auto_410416 ?auto_410415 ) ( ON ?auto_410417 ?auto_410416 ) ( ON ?auto_410418 ?auto_410417 ) ( ON ?auto_410419 ?auto_410418 ) ( ON ?auto_410420 ?auto_410419 ) ( ON ?auto_410421 ?auto_410420 ) ( ON ?auto_410422 ?auto_410421 ) ( ON ?auto_410423 ?auto_410422 ) ( ON ?auto_410424 ?auto_410423 ) ( not ( = ?auto_410414 ?auto_410415 ) ) ( not ( = ?auto_410414 ?auto_410416 ) ) ( not ( = ?auto_410414 ?auto_410417 ) ) ( not ( = ?auto_410414 ?auto_410418 ) ) ( not ( = ?auto_410414 ?auto_410419 ) ) ( not ( = ?auto_410414 ?auto_410420 ) ) ( not ( = ?auto_410414 ?auto_410421 ) ) ( not ( = ?auto_410414 ?auto_410422 ) ) ( not ( = ?auto_410414 ?auto_410423 ) ) ( not ( = ?auto_410414 ?auto_410424 ) ) ( not ( = ?auto_410414 ?auto_410425 ) ) ( not ( = ?auto_410414 ?auto_410426 ) ) ( not ( = ?auto_410414 ?auto_410427 ) ) ( not ( = ?auto_410415 ?auto_410416 ) ) ( not ( = ?auto_410415 ?auto_410417 ) ) ( not ( = ?auto_410415 ?auto_410418 ) ) ( not ( = ?auto_410415 ?auto_410419 ) ) ( not ( = ?auto_410415 ?auto_410420 ) ) ( not ( = ?auto_410415 ?auto_410421 ) ) ( not ( = ?auto_410415 ?auto_410422 ) ) ( not ( = ?auto_410415 ?auto_410423 ) ) ( not ( = ?auto_410415 ?auto_410424 ) ) ( not ( = ?auto_410415 ?auto_410425 ) ) ( not ( = ?auto_410415 ?auto_410426 ) ) ( not ( = ?auto_410415 ?auto_410427 ) ) ( not ( = ?auto_410416 ?auto_410417 ) ) ( not ( = ?auto_410416 ?auto_410418 ) ) ( not ( = ?auto_410416 ?auto_410419 ) ) ( not ( = ?auto_410416 ?auto_410420 ) ) ( not ( = ?auto_410416 ?auto_410421 ) ) ( not ( = ?auto_410416 ?auto_410422 ) ) ( not ( = ?auto_410416 ?auto_410423 ) ) ( not ( = ?auto_410416 ?auto_410424 ) ) ( not ( = ?auto_410416 ?auto_410425 ) ) ( not ( = ?auto_410416 ?auto_410426 ) ) ( not ( = ?auto_410416 ?auto_410427 ) ) ( not ( = ?auto_410417 ?auto_410418 ) ) ( not ( = ?auto_410417 ?auto_410419 ) ) ( not ( = ?auto_410417 ?auto_410420 ) ) ( not ( = ?auto_410417 ?auto_410421 ) ) ( not ( = ?auto_410417 ?auto_410422 ) ) ( not ( = ?auto_410417 ?auto_410423 ) ) ( not ( = ?auto_410417 ?auto_410424 ) ) ( not ( = ?auto_410417 ?auto_410425 ) ) ( not ( = ?auto_410417 ?auto_410426 ) ) ( not ( = ?auto_410417 ?auto_410427 ) ) ( not ( = ?auto_410418 ?auto_410419 ) ) ( not ( = ?auto_410418 ?auto_410420 ) ) ( not ( = ?auto_410418 ?auto_410421 ) ) ( not ( = ?auto_410418 ?auto_410422 ) ) ( not ( = ?auto_410418 ?auto_410423 ) ) ( not ( = ?auto_410418 ?auto_410424 ) ) ( not ( = ?auto_410418 ?auto_410425 ) ) ( not ( = ?auto_410418 ?auto_410426 ) ) ( not ( = ?auto_410418 ?auto_410427 ) ) ( not ( = ?auto_410419 ?auto_410420 ) ) ( not ( = ?auto_410419 ?auto_410421 ) ) ( not ( = ?auto_410419 ?auto_410422 ) ) ( not ( = ?auto_410419 ?auto_410423 ) ) ( not ( = ?auto_410419 ?auto_410424 ) ) ( not ( = ?auto_410419 ?auto_410425 ) ) ( not ( = ?auto_410419 ?auto_410426 ) ) ( not ( = ?auto_410419 ?auto_410427 ) ) ( not ( = ?auto_410420 ?auto_410421 ) ) ( not ( = ?auto_410420 ?auto_410422 ) ) ( not ( = ?auto_410420 ?auto_410423 ) ) ( not ( = ?auto_410420 ?auto_410424 ) ) ( not ( = ?auto_410420 ?auto_410425 ) ) ( not ( = ?auto_410420 ?auto_410426 ) ) ( not ( = ?auto_410420 ?auto_410427 ) ) ( not ( = ?auto_410421 ?auto_410422 ) ) ( not ( = ?auto_410421 ?auto_410423 ) ) ( not ( = ?auto_410421 ?auto_410424 ) ) ( not ( = ?auto_410421 ?auto_410425 ) ) ( not ( = ?auto_410421 ?auto_410426 ) ) ( not ( = ?auto_410421 ?auto_410427 ) ) ( not ( = ?auto_410422 ?auto_410423 ) ) ( not ( = ?auto_410422 ?auto_410424 ) ) ( not ( = ?auto_410422 ?auto_410425 ) ) ( not ( = ?auto_410422 ?auto_410426 ) ) ( not ( = ?auto_410422 ?auto_410427 ) ) ( not ( = ?auto_410423 ?auto_410424 ) ) ( not ( = ?auto_410423 ?auto_410425 ) ) ( not ( = ?auto_410423 ?auto_410426 ) ) ( not ( = ?auto_410423 ?auto_410427 ) ) ( not ( = ?auto_410424 ?auto_410425 ) ) ( not ( = ?auto_410424 ?auto_410426 ) ) ( not ( = ?auto_410424 ?auto_410427 ) ) ( not ( = ?auto_410425 ?auto_410426 ) ) ( not ( = ?auto_410425 ?auto_410427 ) ) ( not ( = ?auto_410426 ?auto_410427 ) ) ( CLEAR ?auto_410424 ) ( ON ?auto_410425 ?auto_410426 ) ( CLEAR ?auto_410425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_410414 ?auto_410415 ?auto_410416 ?auto_410417 ?auto_410418 ?auto_410419 ?auto_410420 ?auto_410421 ?auto_410422 ?auto_410423 ?auto_410424 ?auto_410425 )
      ( MAKE-13PILE ?auto_410414 ?auto_410415 ?auto_410416 ?auto_410417 ?auto_410418 ?auto_410419 ?auto_410420 ?auto_410421 ?auto_410422 ?auto_410423 ?auto_410424 ?auto_410425 ?auto_410426 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410441 - BLOCK
      ?auto_410442 - BLOCK
      ?auto_410443 - BLOCK
      ?auto_410444 - BLOCK
      ?auto_410445 - BLOCK
      ?auto_410446 - BLOCK
      ?auto_410447 - BLOCK
      ?auto_410448 - BLOCK
      ?auto_410449 - BLOCK
      ?auto_410450 - BLOCK
      ?auto_410451 - BLOCK
      ?auto_410452 - BLOCK
      ?auto_410453 - BLOCK
    )
    :vars
    (
      ?auto_410454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410453 ?auto_410454 ) ( ON-TABLE ?auto_410441 ) ( ON ?auto_410442 ?auto_410441 ) ( ON ?auto_410443 ?auto_410442 ) ( ON ?auto_410444 ?auto_410443 ) ( ON ?auto_410445 ?auto_410444 ) ( ON ?auto_410446 ?auto_410445 ) ( ON ?auto_410447 ?auto_410446 ) ( ON ?auto_410448 ?auto_410447 ) ( ON ?auto_410449 ?auto_410448 ) ( ON ?auto_410450 ?auto_410449 ) ( not ( = ?auto_410441 ?auto_410442 ) ) ( not ( = ?auto_410441 ?auto_410443 ) ) ( not ( = ?auto_410441 ?auto_410444 ) ) ( not ( = ?auto_410441 ?auto_410445 ) ) ( not ( = ?auto_410441 ?auto_410446 ) ) ( not ( = ?auto_410441 ?auto_410447 ) ) ( not ( = ?auto_410441 ?auto_410448 ) ) ( not ( = ?auto_410441 ?auto_410449 ) ) ( not ( = ?auto_410441 ?auto_410450 ) ) ( not ( = ?auto_410441 ?auto_410451 ) ) ( not ( = ?auto_410441 ?auto_410452 ) ) ( not ( = ?auto_410441 ?auto_410453 ) ) ( not ( = ?auto_410441 ?auto_410454 ) ) ( not ( = ?auto_410442 ?auto_410443 ) ) ( not ( = ?auto_410442 ?auto_410444 ) ) ( not ( = ?auto_410442 ?auto_410445 ) ) ( not ( = ?auto_410442 ?auto_410446 ) ) ( not ( = ?auto_410442 ?auto_410447 ) ) ( not ( = ?auto_410442 ?auto_410448 ) ) ( not ( = ?auto_410442 ?auto_410449 ) ) ( not ( = ?auto_410442 ?auto_410450 ) ) ( not ( = ?auto_410442 ?auto_410451 ) ) ( not ( = ?auto_410442 ?auto_410452 ) ) ( not ( = ?auto_410442 ?auto_410453 ) ) ( not ( = ?auto_410442 ?auto_410454 ) ) ( not ( = ?auto_410443 ?auto_410444 ) ) ( not ( = ?auto_410443 ?auto_410445 ) ) ( not ( = ?auto_410443 ?auto_410446 ) ) ( not ( = ?auto_410443 ?auto_410447 ) ) ( not ( = ?auto_410443 ?auto_410448 ) ) ( not ( = ?auto_410443 ?auto_410449 ) ) ( not ( = ?auto_410443 ?auto_410450 ) ) ( not ( = ?auto_410443 ?auto_410451 ) ) ( not ( = ?auto_410443 ?auto_410452 ) ) ( not ( = ?auto_410443 ?auto_410453 ) ) ( not ( = ?auto_410443 ?auto_410454 ) ) ( not ( = ?auto_410444 ?auto_410445 ) ) ( not ( = ?auto_410444 ?auto_410446 ) ) ( not ( = ?auto_410444 ?auto_410447 ) ) ( not ( = ?auto_410444 ?auto_410448 ) ) ( not ( = ?auto_410444 ?auto_410449 ) ) ( not ( = ?auto_410444 ?auto_410450 ) ) ( not ( = ?auto_410444 ?auto_410451 ) ) ( not ( = ?auto_410444 ?auto_410452 ) ) ( not ( = ?auto_410444 ?auto_410453 ) ) ( not ( = ?auto_410444 ?auto_410454 ) ) ( not ( = ?auto_410445 ?auto_410446 ) ) ( not ( = ?auto_410445 ?auto_410447 ) ) ( not ( = ?auto_410445 ?auto_410448 ) ) ( not ( = ?auto_410445 ?auto_410449 ) ) ( not ( = ?auto_410445 ?auto_410450 ) ) ( not ( = ?auto_410445 ?auto_410451 ) ) ( not ( = ?auto_410445 ?auto_410452 ) ) ( not ( = ?auto_410445 ?auto_410453 ) ) ( not ( = ?auto_410445 ?auto_410454 ) ) ( not ( = ?auto_410446 ?auto_410447 ) ) ( not ( = ?auto_410446 ?auto_410448 ) ) ( not ( = ?auto_410446 ?auto_410449 ) ) ( not ( = ?auto_410446 ?auto_410450 ) ) ( not ( = ?auto_410446 ?auto_410451 ) ) ( not ( = ?auto_410446 ?auto_410452 ) ) ( not ( = ?auto_410446 ?auto_410453 ) ) ( not ( = ?auto_410446 ?auto_410454 ) ) ( not ( = ?auto_410447 ?auto_410448 ) ) ( not ( = ?auto_410447 ?auto_410449 ) ) ( not ( = ?auto_410447 ?auto_410450 ) ) ( not ( = ?auto_410447 ?auto_410451 ) ) ( not ( = ?auto_410447 ?auto_410452 ) ) ( not ( = ?auto_410447 ?auto_410453 ) ) ( not ( = ?auto_410447 ?auto_410454 ) ) ( not ( = ?auto_410448 ?auto_410449 ) ) ( not ( = ?auto_410448 ?auto_410450 ) ) ( not ( = ?auto_410448 ?auto_410451 ) ) ( not ( = ?auto_410448 ?auto_410452 ) ) ( not ( = ?auto_410448 ?auto_410453 ) ) ( not ( = ?auto_410448 ?auto_410454 ) ) ( not ( = ?auto_410449 ?auto_410450 ) ) ( not ( = ?auto_410449 ?auto_410451 ) ) ( not ( = ?auto_410449 ?auto_410452 ) ) ( not ( = ?auto_410449 ?auto_410453 ) ) ( not ( = ?auto_410449 ?auto_410454 ) ) ( not ( = ?auto_410450 ?auto_410451 ) ) ( not ( = ?auto_410450 ?auto_410452 ) ) ( not ( = ?auto_410450 ?auto_410453 ) ) ( not ( = ?auto_410450 ?auto_410454 ) ) ( not ( = ?auto_410451 ?auto_410452 ) ) ( not ( = ?auto_410451 ?auto_410453 ) ) ( not ( = ?auto_410451 ?auto_410454 ) ) ( not ( = ?auto_410452 ?auto_410453 ) ) ( not ( = ?auto_410452 ?auto_410454 ) ) ( not ( = ?auto_410453 ?auto_410454 ) ) ( ON ?auto_410452 ?auto_410453 ) ( CLEAR ?auto_410450 ) ( ON ?auto_410451 ?auto_410452 ) ( CLEAR ?auto_410451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_410441 ?auto_410442 ?auto_410443 ?auto_410444 ?auto_410445 ?auto_410446 ?auto_410447 ?auto_410448 ?auto_410449 ?auto_410450 ?auto_410451 )
      ( MAKE-13PILE ?auto_410441 ?auto_410442 ?auto_410443 ?auto_410444 ?auto_410445 ?auto_410446 ?auto_410447 ?auto_410448 ?auto_410449 ?auto_410450 ?auto_410451 ?auto_410452 ?auto_410453 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410468 - BLOCK
      ?auto_410469 - BLOCK
      ?auto_410470 - BLOCK
      ?auto_410471 - BLOCK
      ?auto_410472 - BLOCK
      ?auto_410473 - BLOCK
      ?auto_410474 - BLOCK
      ?auto_410475 - BLOCK
      ?auto_410476 - BLOCK
      ?auto_410477 - BLOCK
      ?auto_410478 - BLOCK
      ?auto_410479 - BLOCK
      ?auto_410480 - BLOCK
    )
    :vars
    (
      ?auto_410481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410480 ?auto_410481 ) ( ON-TABLE ?auto_410468 ) ( ON ?auto_410469 ?auto_410468 ) ( ON ?auto_410470 ?auto_410469 ) ( ON ?auto_410471 ?auto_410470 ) ( ON ?auto_410472 ?auto_410471 ) ( ON ?auto_410473 ?auto_410472 ) ( ON ?auto_410474 ?auto_410473 ) ( ON ?auto_410475 ?auto_410474 ) ( ON ?auto_410476 ?auto_410475 ) ( ON ?auto_410477 ?auto_410476 ) ( not ( = ?auto_410468 ?auto_410469 ) ) ( not ( = ?auto_410468 ?auto_410470 ) ) ( not ( = ?auto_410468 ?auto_410471 ) ) ( not ( = ?auto_410468 ?auto_410472 ) ) ( not ( = ?auto_410468 ?auto_410473 ) ) ( not ( = ?auto_410468 ?auto_410474 ) ) ( not ( = ?auto_410468 ?auto_410475 ) ) ( not ( = ?auto_410468 ?auto_410476 ) ) ( not ( = ?auto_410468 ?auto_410477 ) ) ( not ( = ?auto_410468 ?auto_410478 ) ) ( not ( = ?auto_410468 ?auto_410479 ) ) ( not ( = ?auto_410468 ?auto_410480 ) ) ( not ( = ?auto_410468 ?auto_410481 ) ) ( not ( = ?auto_410469 ?auto_410470 ) ) ( not ( = ?auto_410469 ?auto_410471 ) ) ( not ( = ?auto_410469 ?auto_410472 ) ) ( not ( = ?auto_410469 ?auto_410473 ) ) ( not ( = ?auto_410469 ?auto_410474 ) ) ( not ( = ?auto_410469 ?auto_410475 ) ) ( not ( = ?auto_410469 ?auto_410476 ) ) ( not ( = ?auto_410469 ?auto_410477 ) ) ( not ( = ?auto_410469 ?auto_410478 ) ) ( not ( = ?auto_410469 ?auto_410479 ) ) ( not ( = ?auto_410469 ?auto_410480 ) ) ( not ( = ?auto_410469 ?auto_410481 ) ) ( not ( = ?auto_410470 ?auto_410471 ) ) ( not ( = ?auto_410470 ?auto_410472 ) ) ( not ( = ?auto_410470 ?auto_410473 ) ) ( not ( = ?auto_410470 ?auto_410474 ) ) ( not ( = ?auto_410470 ?auto_410475 ) ) ( not ( = ?auto_410470 ?auto_410476 ) ) ( not ( = ?auto_410470 ?auto_410477 ) ) ( not ( = ?auto_410470 ?auto_410478 ) ) ( not ( = ?auto_410470 ?auto_410479 ) ) ( not ( = ?auto_410470 ?auto_410480 ) ) ( not ( = ?auto_410470 ?auto_410481 ) ) ( not ( = ?auto_410471 ?auto_410472 ) ) ( not ( = ?auto_410471 ?auto_410473 ) ) ( not ( = ?auto_410471 ?auto_410474 ) ) ( not ( = ?auto_410471 ?auto_410475 ) ) ( not ( = ?auto_410471 ?auto_410476 ) ) ( not ( = ?auto_410471 ?auto_410477 ) ) ( not ( = ?auto_410471 ?auto_410478 ) ) ( not ( = ?auto_410471 ?auto_410479 ) ) ( not ( = ?auto_410471 ?auto_410480 ) ) ( not ( = ?auto_410471 ?auto_410481 ) ) ( not ( = ?auto_410472 ?auto_410473 ) ) ( not ( = ?auto_410472 ?auto_410474 ) ) ( not ( = ?auto_410472 ?auto_410475 ) ) ( not ( = ?auto_410472 ?auto_410476 ) ) ( not ( = ?auto_410472 ?auto_410477 ) ) ( not ( = ?auto_410472 ?auto_410478 ) ) ( not ( = ?auto_410472 ?auto_410479 ) ) ( not ( = ?auto_410472 ?auto_410480 ) ) ( not ( = ?auto_410472 ?auto_410481 ) ) ( not ( = ?auto_410473 ?auto_410474 ) ) ( not ( = ?auto_410473 ?auto_410475 ) ) ( not ( = ?auto_410473 ?auto_410476 ) ) ( not ( = ?auto_410473 ?auto_410477 ) ) ( not ( = ?auto_410473 ?auto_410478 ) ) ( not ( = ?auto_410473 ?auto_410479 ) ) ( not ( = ?auto_410473 ?auto_410480 ) ) ( not ( = ?auto_410473 ?auto_410481 ) ) ( not ( = ?auto_410474 ?auto_410475 ) ) ( not ( = ?auto_410474 ?auto_410476 ) ) ( not ( = ?auto_410474 ?auto_410477 ) ) ( not ( = ?auto_410474 ?auto_410478 ) ) ( not ( = ?auto_410474 ?auto_410479 ) ) ( not ( = ?auto_410474 ?auto_410480 ) ) ( not ( = ?auto_410474 ?auto_410481 ) ) ( not ( = ?auto_410475 ?auto_410476 ) ) ( not ( = ?auto_410475 ?auto_410477 ) ) ( not ( = ?auto_410475 ?auto_410478 ) ) ( not ( = ?auto_410475 ?auto_410479 ) ) ( not ( = ?auto_410475 ?auto_410480 ) ) ( not ( = ?auto_410475 ?auto_410481 ) ) ( not ( = ?auto_410476 ?auto_410477 ) ) ( not ( = ?auto_410476 ?auto_410478 ) ) ( not ( = ?auto_410476 ?auto_410479 ) ) ( not ( = ?auto_410476 ?auto_410480 ) ) ( not ( = ?auto_410476 ?auto_410481 ) ) ( not ( = ?auto_410477 ?auto_410478 ) ) ( not ( = ?auto_410477 ?auto_410479 ) ) ( not ( = ?auto_410477 ?auto_410480 ) ) ( not ( = ?auto_410477 ?auto_410481 ) ) ( not ( = ?auto_410478 ?auto_410479 ) ) ( not ( = ?auto_410478 ?auto_410480 ) ) ( not ( = ?auto_410478 ?auto_410481 ) ) ( not ( = ?auto_410479 ?auto_410480 ) ) ( not ( = ?auto_410479 ?auto_410481 ) ) ( not ( = ?auto_410480 ?auto_410481 ) ) ( ON ?auto_410479 ?auto_410480 ) ( CLEAR ?auto_410477 ) ( ON ?auto_410478 ?auto_410479 ) ( CLEAR ?auto_410478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_410468 ?auto_410469 ?auto_410470 ?auto_410471 ?auto_410472 ?auto_410473 ?auto_410474 ?auto_410475 ?auto_410476 ?auto_410477 ?auto_410478 )
      ( MAKE-13PILE ?auto_410468 ?auto_410469 ?auto_410470 ?auto_410471 ?auto_410472 ?auto_410473 ?auto_410474 ?auto_410475 ?auto_410476 ?auto_410477 ?auto_410478 ?auto_410479 ?auto_410480 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410495 - BLOCK
      ?auto_410496 - BLOCK
      ?auto_410497 - BLOCK
      ?auto_410498 - BLOCK
      ?auto_410499 - BLOCK
      ?auto_410500 - BLOCK
      ?auto_410501 - BLOCK
      ?auto_410502 - BLOCK
      ?auto_410503 - BLOCK
      ?auto_410504 - BLOCK
      ?auto_410505 - BLOCK
      ?auto_410506 - BLOCK
      ?auto_410507 - BLOCK
    )
    :vars
    (
      ?auto_410508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410507 ?auto_410508 ) ( ON-TABLE ?auto_410495 ) ( ON ?auto_410496 ?auto_410495 ) ( ON ?auto_410497 ?auto_410496 ) ( ON ?auto_410498 ?auto_410497 ) ( ON ?auto_410499 ?auto_410498 ) ( ON ?auto_410500 ?auto_410499 ) ( ON ?auto_410501 ?auto_410500 ) ( ON ?auto_410502 ?auto_410501 ) ( ON ?auto_410503 ?auto_410502 ) ( not ( = ?auto_410495 ?auto_410496 ) ) ( not ( = ?auto_410495 ?auto_410497 ) ) ( not ( = ?auto_410495 ?auto_410498 ) ) ( not ( = ?auto_410495 ?auto_410499 ) ) ( not ( = ?auto_410495 ?auto_410500 ) ) ( not ( = ?auto_410495 ?auto_410501 ) ) ( not ( = ?auto_410495 ?auto_410502 ) ) ( not ( = ?auto_410495 ?auto_410503 ) ) ( not ( = ?auto_410495 ?auto_410504 ) ) ( not ( = ?auto_410495 ?auto_410505 ) ) ( not ( = ?auto_410495 ?auto_410506 ) ) ( not ( = ?auto_410495 ?auto_410507 ) ) ( not ( = ?auto_410495 ?auto_410508 ) ) ( not ( = ?auto_410496 ?auto_410497 ) ) ( not ( = ?auto_410496 ?auto_410498 ) ) ( not ( = ?auto_410496 ?auto_410499 ) ) ( not ( = ?auto_410496 ?auto_410500 ) ) ( not ( = ?auto_410496 ?auto_410501 ) ) ( not ( = ?auto_410496 ?auto_410502 ) ) ( not ( = ?auto_410496 ?auto_410503 ) ) ( not ( = ?auto_410496 ?auto_410504 ) ) ( not ( = ?auto_410496 ?auto_410505 ) ) ( not ( = ?auto_410496 ?auto_410506 ) ) ( not ( = ?auto_410496 ?auto_410507 ) ) ( not ( = ?auto_410496 ?auto_410508 ) ) ( not ( = ?auto_410497 ?auto_410498 ) ) ( not ( = ?auto_410497 ?auto_410499 ) ) ( not ( = ?auto_410497 ?auto_410500 ) ) ( not ( = ?auto_410497 ?auto_410501 ) ) ( not ( = ?auto_410497 ?auto_410502 ) ) ( not ( = ?auto_410497 ?auto_410503 ) ) ( not ( = ?auto_410497 ?auto_410504 ) ) ( not ( = ?auto_410497 ?auto_410505 ) ) ( not ( = ?auto_410497 ?auto_410506 ) ) ( not ( = ?auto_410497 ?auto_410507 ) ) ( not ( = ?auto_410497 ?auto_410508 ) ) ( not ( = ?auto_410498 ?auto_410499 ) ) ( not ( = ?auto_410498 ?auto_410500 ) ) ( not ( = ?auto_410498 ?auto_410501 ) ) ( not ( = ?auto_410498 ?auto_410502 ) ) ( not ( = ?auto_410498 ?auto_410503 ) ) ( not ( = ?auto_410498 ?auto_410504 ) ) ( not ( = ?auto_410498 ?auto_410505 ) ) ( not ( = ?auto_410498 ?auto_410506 ) ) ( not ( = ?auto_410498 ?auto_410507 ) ) ( not ( = ?auto_410498 ?auto_410508 ) ) ( not ( = ?auto_410499 ?auto_410500 ) ) ( not ( = ?auto_410499 ?auto_410501 ) ) ( not ( = ?auto_410499 ?auto_410502 ) ) ( not ( = ?auto_410499 ?auto_410503 ) ) ( not ( = ?auto_410499 ?auto_410504 ) ) ( not ( = ?auto_410499 ?auto_410505 ) ) ( not ( = ?auto_410499 ?auto_410506 ) ) ( not ( = ?auto_410499 ?auto_410507 ) ) ( not ( = ?auto_410499 ?auto_410508 ) ) ( not ( = ?auto_410500 ?auto_410501 ) ) ( not ( = ?auto_410500 ?auto_410502 ) ) ( not ( = ?auto_410500 ?auto_410503 ) ) ( not ( = ?auto_410500 ?auto_410504 ) ) ( not ( = ?auto_410500 ?auto_410505 ) ) ( not ( = ?auto_410500 ?auto_410506 ) ) ( not ( = ?auto_410500 ?auto_410507 ) ) ( not ( = ?auto_410500 ?auto_410508 ) ) ( not ( = ?auto_410501 ?auto_410502 ) ) ( not ( = ?auto_410501 ?auto_410503 ) ) ( not ( = ?auto_410501 ?auto_410504 ) ) ( not ( = ?auto_410501 ?auto_410505 ) ) ( not ( = ?auto_410501 ?auto_410506 ) ) ( not ( = ?auto_410501 ?auto_410507 ) ) ( not ( = ?auto_410501 ?auto_410508 ) ) ( not ( = ?auto_410502 ?auto_410503 ) ) ( not ( = ?auto_410502 ?auto_410504 ) ) ( not ( = ?auto_410502 ?auto_410505 ) ) ( not ( = ?auto_410502 ?auto_410506 ) ) ( not ( = ?auto_410502 ?auto_410507 ) ) ( not ( = ?auto_410502 ?auto_410508 ) ) ( not ( = ?auto_410503 ?auto_410504 ) ) ( not ( = ?auto_410503 ?auto_410505 ) ) ( not ( = ?auto_410503 ?auto_410506 ) ) ( not ( = ?auto_410503 ?auto_410507 ) ) ( not ( = ?auto_410503 ?auto_410508 ) ) ( not ( = ?auto_410504 ?auto_410505 ) ) ( not ( = ?auto_410504 ?auto_410506 ) ) ( not ( = ?auto_410504 ?auto_410507 ) ) ( not ( = ?auto_410504 ?auto_410508 ) ) ( not ( = ?auto_410505 ?auto_410506 ) ) ( not ( = ?auto_410505 ?auto_410507 ) ) ( not ( = ?auto_410505 ?auto_410508 ) ) ( not ( = ?auto_410506 ?auto_410507 ) ) ( not ( = ?auto_410506 ?auto_410508 ) ) ( not ( = ?auto_410507 ?auto_410508 ) ) ( ON ?auto_410506 ?auto_410507 ) ( ON ?auto_410505 ?auto_410506 ) ( CLEAR ?auto_410503 ) ( ON ?auto_410504 ?auto_410505 ) ( CLEAR ?auto_410504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_410495 ?auto_410496 ?auto_410497 ?auto_410498 ?auto_410499 ?auto_410500 ?auto_410501 ?auto_410502 ?auto_410503 ?auto_410504 )
      ( MAKE-13PILE ?auto_410495 ?auto_410496 ?auto_410497 ?auto_410498 ?auto_410499 ?auto_410500 ?auto_410501 ?auto_410502 ?auto_410503 ?auto_410504 ?auto_410505 ?auto_410506 ?auto_410507 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410522 - BLOCK
      ?auto_410523 - BLOCK
      ?auto_410524 - BLOCK
      ?auto_410525 - BLOCK
      ?auto_410526 - BLOCK
      ?auto_410527 - BLOCK
      ?auto_410528 - BLOCK
      ?auto_410529 - BLOCK
      ?auto_410530 - BLOCK
      ?auto_410531 - BLOCK
      ?auto_410532 - BLOCK
      ?auto_410533 - BLOCK
      ?auto_410534 - BLOCK
    )
    :vars
    (
      ?auto_410535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410534 ?auto_410535 ) ( ON-TABLE ?auto_410522 ) ( ON ?auto_410523 ?auto_410522 ) ( ON ?auto_410524 ?auto_410523 ) ( ON ?auto_410525 ?auto_410524 ) ( ON ?auto_410526 ?auto_410525 ) ( ON ?auto_410527 ?auto_410526 ) ( ON ?auto_410528 ?auto_410527 ) ( ON ?auto_410529 ?auto_410528 ) ( ON ?auto_410530 ?auto_410529 ) ( not ( = ?auto_410522 ?auto_410523 ) ) ( not ( = ?auto_410522 ?auto_410524 ) ) ( not ( = ?auto_410522 ?auto_410525 ) ) ( not ( = ?auto_410522 ?auto_410526 ) ) ( not ( = ?auto_410522 ?auto_410527 ) ) ( not ( = ?auto_410522 ?auto_410528 ) ) ( not ( = ?auto_410522 ?auto_410529 ) ) ( not ( = ?auto_410522 ?auto_410530 ) ) ( not ( = ?auto_410522 ?auto_410531 ) ) ( not ( = ?auto_410522 ?auto_410532 ) ) ( not ( = ?auto_410522 ?auto_410533 ) ) ( not ( = ?auto_410522 ?auto_410534 ) ) ( not ( = ?auto_410522 ?auto_410535 ) ) ( not ( = ?auto_410523 ?auto_410524 ) ) ( not ( = ?auto_410523 ?auto_410525 ) ) ( not ( = ?auto_410523 ?auto_410526 ) ) ( not ( = ?auto_410523 ?auto_410527 ) ) ( not ( = ?auto_410523 ?auto_410528 ) ) ( not ( = ?auto_410523 ?auto_410529 ) ) ( not ( = ?auto_410523 ?auto_410530 ) ) ( not ( = ?auto_410523 ?auto_410531 ) ) ( not ( = ?auto_410523 ?auto_410532 ) ) ( not ( = ?auto_410523 ?auto_410533 ) ) ( not ( = ?auto_410523 ?auto_410534 ) ) ( not ( = ?auto_410523 ?auto_410535 ) ) ( not ( = ?auto_410524 ?auto_410525 ) ) ( not ( = ?auto_410524 ?auto_410526 ) ) ( not ( = ?auto_410524 ?auto_410527 ) ) ( not ( = ?auto_410524 ?auto_410528 ) ) ( not ( = ?auto_410524 ?auto_410529 ) ) ( not ( = ?auto_410524 ?auto_410530 ) ) ( not ( = ?auto_410524 ?auto_410531 ) ) ( not ( = ?auto_410524 ?auto_410532 ) ) ( not ( = ?auto_410524 ?auto_410533 ) ) ( not ( = ?auto_410524 ?auto_410534 ) ) ( not ( = ?auto_410524 ?auto_410535 ) ) ( not ( = ?auto_410525 ?auto_410526 ) ) ( not ( = ?auto_410525 ?auto_410527 ) ) ( not ( = ?auto_410525 ?auto_410528 ) ) ( not ( = ?auto_410525 ?auto_410529 ) ) ( not ( = ?auto_410525 ?auto_410530 ) ) ( not ( = ?auto_410525 ?auto_410531 ) ) ( not ( = ?auto_410525 ?auto_410532 ) ) ( not ( = ?auto_410525 ?auto_410533 ) ) ( not ( = ?auto_410525 ?auto_410534 ) ) ( not ( = ?auto_410525 ?auto_410535 ) ) ( not ( = ?auto_410526 ?auto_410527 ) ) ( not ( = ?auto_410526 ?auto_410528 ) ) ( not ( = ?auto_410526 ?auto_410529 ) ) ( not ( = ?auto_410526 ?auto_410530 ) ) ( not ( = ?auto_410526 ?auto_410531 ) ) ( not ( = ?auto_410526 ?auto_410532 ) ) ( not ( = ?auto_410526 ?auto_410533 ) ) ( not ( = ?auto_410526 ?auto_410534 ) ) ( not ( = ?auto_410526 ?auto_410535 ) ) ( not ( = ?auto_410527 ?auto_410528 ) ) ( not ( = ?auto_410527 ?auto_410529 ) ) ( not ( = ?auto_410527 ?auto_410530 ) ) ( not ( = ?auto_410527 ?auto_410531 ) ) ( not ( = ?auto_410527 ?auto_410532 ) ) ( not ( = ?auto_410527 ?auto_410533 ) ) ( not ( = ?auto_410527 ?auto_410534 ) ) ( not ( = ?auto_410527 ?auto_410535 ) ) ( not ( = ?auto_410528 ?auto_410529 ) ) ( not ( = ?auto_410528 ?auto_410530 ) ) ( not ( = ?auto_410528 ?auto_410531 ) ) ( not ( = ?auto_410528 ?auto_410532 ) ) ( not ( = ?auto_410528 ?auto_410533 ) ) ( not ( = ?auto_410528 ?auto_410534 ) ) ( not ( = ?auto_410528 ?auto_410535 ) ) ( not ( = ?auto_410529 ?auto_410530 ) ) ( not ( = ?auto_410529 ?auto_410531 ) ) ( not ( = ?auto_410529 ?auto_410532 ) ) ( not ( = ?auto_410529 ?auto_410533 ) ) ( not ( = ?auto_410529 ?auto_410534 ) ) ( not ( = ?auto_410529 ?auto_410535 ) ) ( not ( = ?auto_410530 ?auto_410531 ) ) ( not ( = ?auto_410530 ?auto_410532 ) ) ( not ( = ?auto_410530 ?auto_410533 ) ) ( not ( = ?auto_410530 ?auto_410534 ) ) ( not ( = ?auto_410530 ?auto_410535 ) ) ( not ( = ?auto_410531 ?auto_410532 ) ) ( not ( = ?auto_410531 ?auto_410533 ) ) ( not ( = ?auto_410531 ?auto_410534 ) ) ( not ( = ?auto_410531 ?auto_410535 ) ) ( not ( = ?auto_410532 ?auto_410533 ) ) ( not ( = ?auto_410532 ?auto_410534 ) ) ( not ( = ?auto_410532 ?auto_410535 ) ) ( not ( = ?auto_410533 ?auto_410534 ) ) ( not ( = ?auto_410533 ?auto_410535 ) ) ( not ( = ?auto_410534 ?auto_410535 ) ) ( ON ?auto_410533 ?auto_410534 ) ( ON ?auto_410532 ?auto_410533 ) ( CLEAR ?auto_410530 ) ( ON ?auto_410531 ?auto_410532 ) ( CLEAR ?auto_410531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_410522 ?auto_410523 ?auto_410524 ?auto_410525 ?auto_410526 ?auto_410527 ?auto_410528 ?auto_410529 ?auto_410530 ?auto_410531 )
      ( MAKE-13PILE ?auto_410522 ?auto_410523 ?auto_410524 ?auto_410525 ?auto_410526 ?auto_410527 ?auto_410528 ?auto_410529 ?auto_410530 ?auto_410531 ?auto_410532 ?auto_410533 ?auto_410534 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410549 - BLOCK
      ?auto_410550 - BLOCK
      ?auto_410551 - BLOCK
      ?auto_410552 - BLOCK
      ?auto_410553 - BLOCK
      ?auto_410554 - BLOCK
      ?auto_410555 - BLOCK
      ?auto_410556 - BLOCK
      ?auto_410557 - BLOCK
      ?auto_410558 - BLOCK
      ?auto_410559 - BLOCK
      ?auto_410560 - BLOCK
      ?auto_410561 - BLOCK
    )
    :vars
    (
      ?auto_410562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410561 ?auto_410562 ) ( ON-TABLE ?auto_410549 ) ( ON ?auto_410550 ?auto_410549 ) ( ON ?auto_410551 ?auto_410550 ) ( ON ?auto_410552 ?auto_410551 ) ( ON ?auto_410553 ?auto_410552 ) ( ON ?auto_410554 ?auto_410553 ) ( ON ?auto_410555 ?auto_410554 ) ( ON ?auto_410556 ?auto_410555 ) ( not ( = ?auto_410549 ?auto_410550 ) ) ( not ( = ?auto_410549 ?auto_410551 ) ) ( not ( = ?auto_410549 ?auto_410552 ) ) ( not ( = ?auto_410549 ?auto_410553 ) ) ( not ( = ?auto_410549 ?auto_410554 ) ) ( not ( = ?auto_410549 ?auto_410555 ) ) ( not ( = ?auto_410549 ?auto_410556 ) ) ( not ( = ?auto_410549 ?auto_410557 ) ) ( not ( = ?auto_410549 ?auto_410558 ) ) ( not ( = ?auto_410549 ?auto_410559 ) ) ( not ( = ?auto_410549 ?auto_410560 ) ) ( not ( = ?auto_410549 ?auto_410561 ) ) ( not ( = ?auto_410549 ?auto_410562 ) ) ( not ( = ?auto_410550 ?auto_410551 ) ) ( not ( = ?auto_410550 ?auto_410552 ) ) ( not ( = ?auto_410550 ?auto_410553 ) ) ( not ( = ?auto_410550 ?auto_410554 ) ) ( not ( = ?auto_410550 ?auto_410555 ) ) ( not ( = ?auto_410550 ?auto_410556 ) ) ( not ( = ?auto_410550 ?auto_410557 ) ) ( not ( = ?auto_410550 ?auto_410558 ) ) ( not ( = ?auto_410550 ?auto_410559 ) ) ( not ( = ?auto_410550 ?auto_410560 ) ) ( not ( = ?auto_410550 ?auto_410561 ) ) ( not ( = ?auto_410550 ?auto_410562 ) ) ( not ( = ?auto_410551 ?auto_410552 ) ) ( not ( = ?auto_410551 ?auto_410553 ) ) ( not ( = ?auto_410551 ?auto_410554 ) ) ( not ( = ?auto_410551 ?auto_410555 ) ) ( not ( = ?auto_410551 ?auto_410556 ) ) ( not ( = ?auto_410551 ?auto_410557 ) ) ( not ( = ?auto_410551 ?auto_410558 ) ) ( not ( = ?auto_410551 ?auto_410559 ) ) ( not ( = ?auto_410551 ?auto_410560 ) ) ( not ( = ?auto_410551 ?auto_410561 ) ) ( not ( = ?auto_410551 ?auto_410562 ) ) ( not ( = ?auto_410552 ?auto_410553 ) ) ( not ( = ?auto_410552 ?auto_410554 ) ) ( not ( = ?auto_410552 ?auto_410555 ) ) ( not ( = ?auto_410552 ?auto_410556 ) ) ( not ( = ?auto_410552 ?auto_410557 ) ) ( not ( = ?auto_410552 ?auto_410558 ) ) ( not ( = ?auto_410552 ?auto_410559 ) ) ( not ( = ?auto_410552 ?auto_410560 ) ) ( not ( = ?auto_410552 ?auto_410561 ) ) ( not ( = ?auto_410552 ?auto_410562 ) ) ( not ( = ?auto_410553 ?auto_410554 ) ) ( not ( = ?auto_410553 ?auto_410555 ) ) ( not ( = ?auto_410553 ?auto_410556 ) ) ( not ( = ?auto_410553 ?auto_410557 ) ) ( not ( = ?auto_410553 ?auto_410558 ) ) ( not ( = ?auto_410553 ?auto_410559 ) ) ( not ( = ?auto_410553 ?auto_410560 ) ) ( not ( = ?auto_410553 ?auto_410561 ) ) ( not ( = ?auto_410553 ?auto_410562 ) ) ( not ( = ?auto_410554 ?auto_410555 ) ) ( not ( = ?auto_410554 ?auto_410556 ) ) ( not ( = ?auto_410554 ?auto_410557 ) ) ( not ( = ?auto_410554 ?auto_410558 ) ) ( not ( = ?auto_410554 ?auto_410559 ) ) ( not ( = ?auto_410554 ?auto_410560 ) ) ( not ( = ?auto_410554 ?auto_410561 ) ) ( not ( = ?auto_410554 ?auto_410562 ) ) ( not ( = ?auto_410555 ?auto_410556 ) ) ( not ( = ?auto_410555 ?auto_410557 ) ) ( not ( = ?auto_410555 ?auto_410558 ) ) ( not ( = ?auto_410555 ?auto_410559 ) ) ( not ( = ?auto_410555 ?auto_410560 ) ) ( not ( = ?auto_410555 ?auto_410561 ) ) ( not ( = ?auto_410555 ?auto_410562 ) ) ( not ( = ?auto_410556 ?auto_410557 ) ) ( not ( = ?auto_410556 ?auto_410558 ) ) ( not ( = ?auto_410556 ?auto_410559 ) ) ( not ( = ?auto_410556 ?auto_410560 ) ) ( not ( = ?auto_410556 ?auto_410561 ) ) ( not ( = ?auto_410556 ?auto_410562 ) ) ( not ( = ?auto_410557 ?auto_410558 ) ) ( not ( = ?auto_410557 ?auto_410559 ) ) ( not ( = ?auto_410557 ?auto_410560 ) ) ( not ( = ?auto_410557 ?auto_410561 ) ) ( not ( = ?auto_410557 ?auto_410562 ) ) ( not ( = ?auto_410558 ?auto_410559 ) ) ( not ( = ?auto_410558 ?auto_410560 ) ) ( not ( = ?auto_410558 ?auto_410561 ) ) ( not ( = ?auto_410558 ?auto_410562 ) ) ( not ( = ?auto_410559 ?auto_410560 ) ) ( not ( = ?auto_410559 ?auto_410561 ) ) ( not ( = ?auto_410559 ?auto_410562 ) ) ( not ( = ?auto_410560 ?auto_410561 ) ) ( not ( = ?auto_410560 ?auto_410562 ) ) ( not ( = ?auto_410561 ?auto_410562 ) ) ( ON ?auto_410560 ?auto_410561 ) ( ON ?auto_410559 ?auto_410560 ) ( ON ?auto_410558 ?auto_410559 ) ( CLEAR ?auto_410556 ) ( ON ?auto_410557 ?auto_410558 ) ( CLEAR ?auto_410557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_410549 ?auto_410550 ?auto_410551 ?auto_410552 ?auto_410553 ?auto_410554 ?auto_410555 ?auto_410556 ?auto_410557 )
      ( MAKE-13PILE ?auto_410549 ?auto_410550 ?auto_410551 ?auto_410552 ?auto_410553 ?auto_410554 ?auto_410555 ?auto_410556 ?auto_410557 ?auto_410558 ?auto_410559 ?auto_410560 ?auto_410561 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410576 - BLOCK
      ?auto_410577 - BLOCK
      ?auto_410578 - BLOCK
      ?auto_410579 - BLOCK
      ?auto_410580 - BLOCK
      ?auto_410581 - BLOCK
      ?auto_410582 - BLOCK
      ?auto_410583 - BLOCK
      ?auto_410584 - BLOCK
      ?auto_410585 - BLOCK
      ?auto_410586 - BLOCK
      ?auto_410587 - BLOCK
      ?auto_410588 - BLOCK
    )
    :vars
    (
      ?auto_410589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410588 ?auto_410589 ) ( ON-TABLE ?auto_410576 ) ( ON ?auto_410577 ?auto_410576 ) ( ON ?auto_410578 ?auto_410577 ) ( ON ?auto_410579 ?auto_410578 ) ( ON ?auto_410580 ?auto_410579 ) ( ON ?auto_410581 ?auto_410580 ) ( ON ?auto_410582 ?auto_410581 ) ( ON ?auto_410583 ?auto_410582 ) ( not ( = ?auto_410576 ?auto_410577 ) ) ( not ( = ?auto_410576 ?auto_410578 ) ) ( not ( = ?auto_410576 ?auto_410579 ) ) ( not ( = ?auto_410576 ?auto_410580 ) ) ( not ( = ?auto_410576 ?auto_410581 ) ) ( not ( = ?auto_410576 ?auto_410582 ) ) ( not ( = ?auto_410576 ?auto_410583 ) ) ( not ( = ?auto_410576 ?auto_410584 ) ) ( not ( = ?auto_410576 ?auto_410585 ) ) ( not ( = ?auto_410576 ?auto_410586 ) ) ( not ( = ?auto_410576 ?auto_410587 ) ) ( not ( = ?auto_410576 ?auto_410588 ) ) ( not ( = ?auto_410576 ?auto_410589 ) ) ( not ( = ?auto_410577 ?auto_410578 ) ) ( not ( = ?auto_410577 ?auto_410579 ) ) ( not ( = ?auto_410577 ?auto_410580 ) ) ( not ( = ?auto_410577 ?auto_410581 ) ) ( not ( = ?auto_410577 ?auto_410582 ) ) ( not ( = ?auto_410577 ?auto_410583 ) ) ( not ( = ?auto_410577 ?auto_410584 ) ) ( not ( = ?auto_410577 ?auto_410585 ) ) ( not ( = ?auto_410577 ?auto_410586 ) ) ( not ( = ?auto_410577 ?auto_410587 ) ) ( not ( = ?auto_410577 ?auto_410588 ) ) ( not ( = ?auto_410577 ?auto_410589 ) ) ( not ( = ?auto_410578 ?auto_410579 ) ) ( not ( = ?auto_410578 ?auto_410580 ) ) ( not ( = ?auto_410578 ?auto_410581 ) ) ( not ( = ?auto_410578 ?auto_410582 ) ) ( not ( = ?auto_410578 ?auto_410583 ) ) ( not ( = ?auto_410578 ?auto_410584 ) ) ( not ( = ?auto_410578 ?auto_410585 ) ) ( not ( = ?auto_410578 ?auto_410586 ) ) ( not ( = ?auto_410578 ?auto_410587 ) ) ( not ( = ?auto_410578 ?auto_410588 ) ) ( not ( = ?auto_410578 ?auto_410589 ) ) ( not ( = ?auto_410579 ?auto_410580 ) ) ( not ( = ?auto_410579 ?auto_410581 ) ) ( not ( = ?auto_410579 ?auto_410582 ) ) ( not ( = ?auto_410579 ?auto_410583 ) ) ( not ( = ?auto_410579 ?auto_410584 ) ) ( not ( = ?auto_410579 ?auto_410585 ) ) ( not ( = ?auto_410579 ?auto_410586 ) ) ( not ( = ?auto_410579 ?auto_410587 ) ) ( not ( = ?auto_410579 ?auto_410588 ) ) ( not ( = ?auto_410579 ?auto_410589 ) ) ( not ( = ?auto_410580 ?auto_410581 ) ) ( not ( = ?auto_410580 ?auto_410582 ) ) ( not ( = ?auto_410580 ?auto_410583 ) ) ( not ( = ?auto_410580 ?auto_410584 ) ) ( not ( = ?auto_410580 ?auto_410585 ) ) ( not ( = ?auto_410580 ?auto_410586 ) ) ( not ( = ?auto_410580 ?auto_410587 ) ) ( not ( = ?auto_410580 ?auto_410588 ) ) ( not ( = ?auto_410580 ?auto_410589 ) ) ( not ( = ?auto_410581 ?auto_410582 ) ) ( not ( = ?auto_410581 ?auto_410583 ) ) ( not ( = ?auto_410581 ?auto_410584 ) ) ( not ( = ?auto_410581 ?auto_410585 ) ) ( not ( = ?auto_410581 ?auto_410586 ) ) ( not ( = ?auto_410581 ?auto_410587 ) ) ( not ( = ?auto_410581 ?auto_410588 ) ) ( not ( = ?auto_410581 ?auto_410589 ) ) ( not ( = ?auto_410582 ?auto_410583 ) ) ( not ( = ?auto_410582 ?auto_410584 ) ) ( not ( = ?auto_410582 ?auto_410585 ) ) ( not ( = ?auto_410582 ?auto_410586 ) ) ( not ( = ?auto_410582 ?auto_410587 ) ) ( not ( = ?auto_410582 ?auto_410588 ) ) ( not ( = ?auto_410582 ?auto_410589 ) ) ( not ( = ?auto_410583 ?auto_410584 ) ) ( not ( = ?auto_410583 ?auto_410585 ) ) ( not ( = ?auto_410583 ?auto_410586 ) ) ( not ( = ?auto_410583 ?auto_410587 ) ) ( not ( = ?auto_410583 ?auto_410588 ) ) ( not ( = ?auto_410583 ?auto_410589 ) ) ( not ( = ?auto_410584 ?auto_410585 ) ) ( not ( = ?auto_410584 ?auto_410586 ) ) ( not ( = ?auto_410584 ?auto_410587 ) ) ( not ( = ?auto_410584 ?auto_410588 ) ) ( not ( = ?auto_410584 ?auto_410589 ) ) ( not ( = ?auto_410585 ?auto_410586 ) ) ( not ( = ?auto_410585 ?auto_410587 ) ) ( not ( = ?auto_410585 ?auto_410588 ) ) ( not ( = ?auto_410585 ?auto_410589 ) ) ( not ( = ?auto_410586 ?auto_410587 ) ) ( not ( = ?auto_410586 ?auto_410588 ) ) ( not ( = ?auto_410586 ?auto_410589 ) ) ( not ( = ?auto_410587 ?auto_410588 ) ) ( not ( = ?auto_410587 ?auto_410589 ) ) ( not ( = ?auto_410588 ?auto_410589 ) ) ( ON ?auto_410587 ?auto_410588 ) ( ON ?auto_410586 ?auto_410587 ) ( ON ?auto_410585 ?auto_410586 ) ( CLEAR ?auto_410583 ) ( ON ?auto_410584 ?auto_410585 ) ( CLEAR ?auto_410584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_410576 ?auto_410577 ?auto_410578 ?auto_410579 ?auto_410580 ?auto_410581 ?auto_410582 ?auto_410583 ?auto_410584 )
      ( MAKE-13PILE ?auto_410576 ?auto_410577 ?auto_410578 ?auto_410579 ?auto_410580 ?auto_410581 ?auto_410582 ?auto_410583 ?auto_410584 ?auto_410585 ?auto_410586 ?auto_410587 ?auto_410588 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410603 - BLOCK
      ?auto_410604 - BLOCK
      ?auto_410605 - BLOCK
      ?auto_410606 - BLOCK
      ?auto_410607 - BLOCK
      ?auto_410608 - BLOCK
      ?auto_410609 - BLOCK
      ?auto_410610 - BLOCK
      ?auto_410611 - BLOCK
      ?auto_410612 - BLOCK
      ?auto_410613 - BLOCK
      ?auto_410614 - BLOCK
      ?auto_410615 - BLOCK
    )
    :vars
    (
      ?auto_410616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410615 ?auto_410616 ) ( ON-TABLE ?auto_410603 ) ( ON ?auto_410604 ?auto_410603 ) ( ON ?auto_410605 ?auto_410604 ) ( ON ?auto_410606 ?auto_410605 ) ( ON ?auto_410607 ?auto_410606 ) ( ON ?auto_410608 ?auto_410607 ) ( ON ?auto_410609 ?auto_410608 ) ( not ( = ?auto_410603 ?auto_410604 ) ) ( not ( = ?auto_410603 ?auto_410605 ) ) ( not ( = ?auto_410603 ?auto_410606 ) ) ( not ( = ?auto_410603 ?auto_410607 ) ) ( not ( = ?auto_410603 ?auto_410608 ) ) ( not ( = ?auto_410603 ?auto_410609 ) ) ( not ( = ?auto_410603 ?auto_410610 ) ) ( not ( = ?auto_410603 ?auto_410611 ) ) ( not ( = ?auto_410603 ?auto_410612 ) ) ( not ( = ?auto_410603 ?auto_410613 ) ) ( not ( = ?auto_410603 ?auto_410614 ) ) ( not ( = ?auto_410603 ?auto_410615 ) ) ( not ( = ?auto_410603 ?auto_410616 ) ) ( not ( = ?auto_410604 ?auto_410605 ) ) ( not ( = ?auto_410604 ?auto_410606 ) ) ( not ( = ?auto_410604 ?auto_410607 ) ) ( not ( = ?auto_410604 ?auto_410608 ) ) ( not ( = ?auto_410604 ?auto_410609 ) ) ( not ( = ?auto_410604 ?auto_410610 ) ) ( not ( = ?auto_410604 ?auto_410611 ) ) ( not ( = ?auto_410604 ?auto_410612 ) ) ( not ( = ?auto_410604 ?auto_410613 ) ) ( not ( = ?auto_410604 ?auto_410614 ) ) ( not ( = ?auto_410604 ?auto_410615 ) ) ( not ( = ?auto_410604 ?auto_410616 ) ) ( not ( = ?auto_410605 ?auto_410606 ) ) ( not ( = ?auto_410605 ?auto_410607 ) ) ( not ( = ?auto_410605 ?auto_410608 ) ) ( not ( = ?auto_410605 ?auto_410609 ) ) ( not ( = ?auto_410605 ?auto_410610 ) ) ( not ( = ?auto_410605 ?auto_410611 ) ) ( not ( = ?auto_410605 ?auto_410612 ) ) ( not ( = ?auto_410605 ?auto_410613 ) ) ( not ( = ?auto_410605 ?auto_410614 ) ) ( not ( = ?auto_410605 ?auto_410615 ) ) ( not ( = ?auto_410605 ?auto_410616 ) ) ( not ( = ?auto_410606 ?auto_410607 ) ) ( not ( = ?auto_410606 ?auto_410608 ) ) ( not ( = ?auto_410606 ?auto_410609 ) ) ( not ( = ?auto_410606 ?auto_410610 ) ) ( not ( = ?auto_410606 ?auto_410611 ) ) ( not ( = ?auto_410606 ?auto_410612 ) ) ( not ( = ?auto_410606 ?auto_410613 ) ) ( not ( = ?auto_410606 ?auto_410614 ) ) ( not ( = ?auto_410606 ?auto_410615 ) ) ( not ( = ?auto_410606 ?auto_410616 ) ) ( not ( = ?auto_410607 ?auto_410608 ) ) ( not ( = ?auto_410607 ?auto_410609 ) ) ( not ( = ?auto_410607 ?auto_410610 ) ) ( not ( = ?auto_410607 ?auto_410611 ) ) ( not ( = ?auto_410607 ?auto_410612 ) ) ( not ( = ?auto_410607 ?auto_410613 ) ) ( not ( = ?auto_410607 ?auto_410614 ) ) ( not ( = ?auto_410607 ?auto_410615 ) ) ( not ( = ?auto_410607 ?auto_410616 ) ) ( not ( = ?auto_410608 ?auto_410609 ) ) ( not ( = ?auto_410608 ?auto_410610 ) ) ( not ( = ?auto_410608 ?auto_410611 ) ) ( not ( = ?auto_410608 ?auto_410612 ) ) ( not ( = ?auto_410608 ?auto_410613 ) ) ( not ( = ?auto_410608 ?auto_410614 ) ) ( not ( = ?auto_410608 ?auto_410615 ) ) ( not ( = ?auto_410608 ?auto_410616 ) ) ( not ( = ?auto_410609 ?auto_410610 ) ) ( not ( = ?auto_410609 ?auto_410611 ) ) ( not ( = ?auto_410609 ?auto_410612 ) ) ( not ( = ?auto_410609 ?auto_410613 ) ) ( not ( = ?auto_410609 ?auto_410614 ) ) ( not ( = ?auto_410609 ?auto_410615 ) ) ( not ( = ?auto_410609 ?auto_410616 ) ) ( not ( = ?auto_410610 ?auto_410611 ) ) ( not ( = ?auto_410610 ?auto_410612 ) ) ( not ( = ?auto_410610 ?auto_410613 ) ) ( not ( = ?auto_410610 ?auto_410614 ) ) ( not ( = ?auto_410610 ?auto_410615 ) ) ( not ( = ?auto_410610 ?auto_410616 ) ) ( not ( = ?auto_410611 ?auto_410612 ) ) ( not ( = ?auto_410611 ?auto_410613 ) ) ( not ( = ?auto_410611 ?auto_410614 ) ) ( not ( = ?auto_410611 ?auto_410615 ) ) ( not ( = ?auto_410611 ?auto_410616 ) ) ( not ( = ?auto_410612 ?auto_410613 ) ) ( not ( = ?auto_410612 ?auto_410614 ) ) ( not ( = ?auto_410612 ?auto_410615 ) ) ( not ( = ?auto_410612 ?auto_410616 ) ) ( not ( = ?auto_410613 ?auto_410614 ) ) ( not ( = ?auto_410613 ?auto_410615 ) ) ( not ( = ?auto_410613 ?auto_410616 ) ) ( not ( = ?auto_410614 ?auto_410615 ) ) ( not ( = ?auto_410614 ?auto_410616 ) ) ( not ( = ?auto_410615 ?auto_410616 ) ) ( ON ?auto_410614 ?auto_410615 ) ( ON ?auto_410613 ?auto_410614 ) ( ON ?auto_410612 ?auto_410613 ) ( ON ?auto_410611 ?auto_410612 ) ( CLEAR ?auto_410609 ) ( ON ?auto_410610 ?auto_410611 ) ( CLEAR ?auto_410610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_410603 ?auto_410604 ?auto_410605 ?auto_410606 ?auto_410607 ?auto_410608 ?auto_410609 ?auto_410610 )
      ( MAKE-13PILE ?auto_410603 ?auto_410604 ?auto_410605 ?auto_410606 ?auto_410607 ?auto_410608 ?auto_410609 ?auto_410610 ?auto_410611 ?auto_410612 ?auto_410613 ?auto_410614 ?auto_410615 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410630 - BLOCK
      ?auto_410631 - BLOCK
      ?auto_410632 - BLOCK
      ?auto_410633 - BLOCK
      ?auto_410634 - BLOCK
      ?auto_410635 - BLOCK
      ?auto_410636 - BLOCK
      ?auto_410637 - BLOCK
      ?auto_410638 - BLOCK
      ?auto_410639 - BLOCK
      ?auto_410640 - BLOCK
      ?auto_410641 - BLOCK
      ?auto_410642 - BLOCK
    )
    :vars
    (
      ?auto_410643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410642 ?auto_410643 ) ( ON-TABLE ?auto_410630 ) ( ON ?auto_410631 ?auto_410630 ) ( ON ?auto_410632 ?auto_410631 ) ( ON ?auto_410633 ?auto_410632 ) ( ON ?auto_410634 ?auto_410633 ) ( ON ?auto_410635 ?auto_410634 ) ( ON ?auto_410636 ?auto_410635 ) ( not ( = ?auto_410630 ?auto_410631 ) ) ( not ( = ?auto_410630 ?auto_410632 ) ) ( not ( = ?auto_410630 ?auto_410633 ) ) ( not ( = ?auto_410630 ?auto_410634 ) ) ( not ( = ?auto_410630 ?auto_410635 ) ) ( not ( = ?auto_410630 ?auto_410636 ) ) ( not ( = ?auto_410630 ?auto_410637 ) ) ( not ( = ?auto_410630 ?auto_410638 ) ) ( not ( = ?auto_410630 ?auto_410639 ) ) ( not ( = ?auto_410630 ?auto_410640 ) ) ( not ( = ?auto_410630 ?auto_410641 ) ) ( not ( = ?auto_410630 ?auto_410642 ) ) ( not ( = ?auto_410630 ?auto_410643 ) ) ( not ( = ?auto_410631 ?auto_410632 ) ) ( not ( = ?auto_410631 ?auto_410633 ) ) ( not ( = ?auto_410631 ?auto_410634 ) ) ( not ( = ?auto_410631 ?auto_410635 ) ) ( not ( = ?auto_410631 ?auto_410636 ) ) ( not ( = ?auto_410631 ?auto_410637 ) ) ( not ( = ?auto_410631 ?auto_410638 ) ) ( not ( = ?auto_410631 ?auto_410639 ) ) ( not ( = ?auto_410631 ?auto_410640 ) ) ( not ( = ?auto_410631 ?auto_410641 ) ) ( not ( = ?auto_410631 ?auto_410642 ) ) ( not ( = ?auto_410631 ?auto_410643 ) ) ( not ( = ?auto_410632 ?auto_410633 ) ) ( not ( = ?auto_410632 ?auto_410634 ) ) ( not ( = ?auto_410632 ?auto_410635 ) ) ( not ( = ?auto_410632 ?auto_410636 ) ) ( not ( = ?auto_410632 ?auto_410637 ) ) ( not ( = ?auto_410632 ?auto_410638 ) ) ( not ( = ?auto_410632 ?auto_410639 ) ) ( not ( = ?auto_410632 ?auto_410640 ) ) ( not ( = ?auto_410632 ?auto_410641 ) ) ( not ( = ?auto_410632 ?auto_410642 ) ) ( not ( = ?auto_410632 ?auto_410643 ) ) ( not ( = ?auto_410633 ?auto_410634 ) ) ( not ( = ?auto_410633 ?auto_410635 ) ) ( not ( = ?auto_410633 ?auto_410636 ) ) ( not ( = ?auto_410633 ?auto_410637 ) ) ( not ( = ?auto_410633 ?auto_410638 ) ) ( not ( = ?auto_410633 ?auto_410639 ) ) ( not ( = ?auto_410633 ?auto_410640 ) ) ( not ( = ?auto_410633 ?auto_410641 ) ) ( not ( = ?auto_410633 ?auto_410642 ) ) ( not ( = ?auto_410633 ?auto_410643 ) ) ( not ( = ?auto_410634 ?auto_410635 ) ) ( not ( = ?auto_410634 ?auto_410636 ) ) ( not ( = ?auto_410634 ?auto_410637 ) ) ( not ( = ?auto_410634 ?auto_410638 ) ) ( not ( = ?auto_410634 ?auto_410639 ) ) ( not ( = ?auto_410634 ?auto_410640 ) ) ( not ( = ?auto_410634 ?auto_410641 ) ) ( not ( = ?auto_410634 ?auto_410642 ) ) ( not ( = ?auto_410634 ?auto_410643 ) ) ( not ( = ?auto_410635 ?auto_410636 ) ) ( not ( = ?auto_410635 ?auto_410637 ) ) ( not ( = ?auto_410635 ?auto_410638 ) ) ( not ( = ?auto_410635 ?auto_410639 ) ) ( not ( = ?auto_410635 ?auto_410640 ) ) ( not ( = ?auto_410635 ?auto_410641 ) ) ( not ( = ?auto_410635 ?auto_410642 ) ) ( not ( = ?auto_410635 ?auto_410643 ) ) ( not ( = ?auto_410636 ?auto_410637 ) ) ( not ( = ?auto_410636 ?auto_410638 ) ) ( not ( = ?auto_410636 ?auto_410639 ) ) ( not ( = ?auto_410636 ?auto_410640 ) ) ( not ( = ?auto_410636 ?auto_410641 ) ) ( not ( = ?auto_410636 ?auto_410642 ) ) ( not ( = ?auto_410636 ?auto_410643 ) ) ( not ( = ?auto_410637 ?auto_410638 ) ) ( not ( = ?auto_410637 ?auto_410639 ) ) ( not ( = ?auto_410637 ?auto_410640 ) ) ( not ( = ?auto_410637 ?auto_410641 ) ) ( not ( = ?auto_410637 ?auto_410642 ) ) ( not ( = ?auto_410637 ?auto_410643 ) ) ( not ( = ?auto_410638 ?auto_410639 ) ) ( not ( = ?auto_410638 ?auto_410640 ) ) ( not ( = ?auto_410638 ?auto_410641 ) ) ( not ( = ?auto_410638 ?auto_410642 ) ) ( not ( = ?auto_410638 ?auto_410643 ) ) ( not ( = ?auto_410639 ?auto_410640 ) ) ( not ( = ?auto_410639 ?auto_410641 ) ) ( not ( = ?auto_410639 ?auto_410642 ) ) ( not ( = ?auto_410639 ?auto_410643 ) ) ( not ( = ?auto_410640 ?auto_410641 ) ) ( not ( = ?auto_410640 ?auto_410642 ) ) ( not ( = ?auto_410640 ?auto_410643 ) ) ( not ( = ?auto_410641 ?auto_410642 ) ) ( not ( = ?auto_410641 ?auto_410643 ) ) ( not ( = ?auto_410642 ?auto_410643 ) ) ( ON ?auto_410641 ?auto_410642 ) ( ON ?auto_410640 ?auto_410641 ) ( ON ?auto_410639 ?auto_410640 ) ( ON ?auto_410638 ?auto_410639 ) ( CLEAR ?auto_410636 ) ( ON ?auto_410637 ?auto_410638 ) ( CLEAR ?auto_410637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_410630 ?auto_410631 ?auto_410632 ?auto_410633 ?auto_410634 ?auto_410635 ?auto_410636 ?auto_410637 )
      ( MAKE-13PILE ?auto_410630 ?auto_410631 ?auto_410632 ?auto_410633 ?auto_410634 ?auto_410635 ?auto_410636 ?auto_410637 ?auto_410638 ?auto_410639 ?auto_410640 ?auto_410641 ?auto_410642 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410657 - BLOCK
      ?auto_410658 - BLOCK
      ?auto_410659 - BLOCK
      ?auto_410660 - BLOCK
      ?auto_410661 - BLOCK
      ?auto_410662 - BLOCK
      ?auto_410663 - BLOCK
      ?auto_410664 - BLOCK
      ?auto_410665 - BLOCK
      ?auto_410666 - BLOCK
      ?auto_410667 - BLOCK
      ?auto_410668 - BLOCK
      ?auto_410669 - BLOCK
    )
    :vars
    (
      ?auto_410670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410669 ?auto_410670 ) ( ON-TABLE ?auto_410657 ) ( ON ?auto_410658 ?auto_410657 ) ( ON ?auto_410659 ?auto_410658 ) ( ON ?auto_410660 ?auto_410659 ) ( ON ?auto_410661 ?auto_410660 ) ( ON ?auto_410662 ?auto_410661 ) ( not ( = ?auto_410657 ?auto_410658 ) ) ( not ( = ?auto_410657 ?auto_410659 ) ) ( not ( = ?auto_410657 ?auto_410660 ) ) ( not ( = ?auto_410657 ?auto_410661 ) ) ( not ( = ?auto_410657 ?auto_410662 ) ) ( not ( = ?auto_410657 ?auto_410663 ) ) ( not ( = ?auto_410657 ?auto_410664 ) ) ( not ( = ?auto_410657 ?auto_410665 ) ) ( not ( = ?auto_410657 ?auto_410666 ) ) ( not ( = ?auto_410657 ?auto_410667 ) ) ( not ( = ?auto_410657 ?auto_410668 ) ) ( not ( = ?auto_410657 ?auto_410669 ) ) ( not ( = ?auto_410657 ?auto_410670 ) ) ( not ( = ?auto_410658 ?auto_410659 ) ) ( not ( = ?auto_410658 ?auto_410660 ) ) ( not ( = ?auto_410658 ?auto_410661 ) ) ( not ( = ?auto_410658 ?auto_410662 ) ) ( not ( = ?auto_410658 ?auto_410663 ) ) ( not ( = ?auto_410658 ?auto_410664 ) ) ( not ( = ?auto_410658 ?auto_410665 ) ) ( not ( = ?auto_410658 ?auto_410666 ) ) ( not ( = ?auto_410658 ?auto_410667 ) ) ( not ( = ?auto_410658 ?auto_410668 ) ) ( not ( = ?auto_410658 ?auto_410669 ) ) ( not ( = ?auto_410658 ?auto_410670 ) ) ( not ( = ?auto_410659 ?auto_410660 ) ) ( not ( = ?auto_410659 ?auto_410661 ) ) ( not ( = ?auto_410659 ?auto_410662 ) ) ( not ( = ?auto_410659 ?auto_410663 ) ) ( not ( = ?auto_410659 ?auto_410664 ) ) ( not ( = ?auto_410659 ?auto_410665 ) ) ( not ( = ?auto_410659 ?auto_410666 ) ) ( not ( = ?auto_410659 ?auto_410667 ) ) ( not ( = ?auto_410659 ?auto_410668 ) ) ( not ( = ?auto_410659 ?auto_410669 ) ) ( not ( = ?auto_410659 ?auto_410670 ) ) ( not ( = ?auto_410660 ?auto_410661 ) ) ( not ( = ?auto_410660 ?auto_410662 ) ) ( not ( = ?auto_410660 ?auto_410663 ) ) ( not ( = ?auto_410660 ?auto_410664 ) ) ( not ( = ?auto_410660 ?auto_410665 ) ) ( not ( = ?auto_410660 ?auto_410666 ) ) ( not ( = ?auto_410660 ?auto_410667 ) ) ( not ( = ?auto_410660 ?auto_410668 ) ) ( not ( = ?auto_410660 ?auto_410669 ) ) ( not ( = ?auto_410660 ?auto_410670 ) ) ( not ( = ?auto_410661 ?auto_410662 ) ) ( not ( = ?auto_410661 ?auto_410663 ) ) ( not ( = ?auto_410661 ?auto_410664 ) ) ( not ( = ?auto_410661 ?auto_410665 ) ) ( not ( = ?auto_410661 ?auto_410666 ) ) ( not ( = ?auto_410661 ?auto_410667 ) ) ( not ( = ?auto_410661 ?auto_410668 ) ) ( not ( = ?auto_410661 ?auto_410669 ) ) ( not ( = ?auto_410661 ?auto_410670 ) ) ( not ( = ?auto_410662 ?auto_410663 ) ) ( not ( = ?auto_410662 ?auto_410664 ) ) ( not ( = ?auto_410662 ?auto_410665 ) ) ( not ( = ?auto_410662 ?auto_410666 ) ) ( not ( = ?auto_410662 ?auto_410667 ) ) ( not ( = ?auto_410662 ?auto_410668 ) ) ( not ( = ?auto_410662 ?auto_410669 ) ) ( not ( = ?auto_410662 ?auto_410670 ) ) ( not ( = ?auto_410663 ?auto_410664 ) ) ( not ( = ?auto_410663 ?auto_410665 ) ) ( not ( = ?auto_410663 ?auto_410666 ) ) ( not ( = ?auto_410663 ?auto_410667 ) ) ( not ( = ?auto_410663 ?auto_410668 ) ) ( not ( = ?auto_410663 ?auto_410669 ) ) ( not ( = ?auto_410663 ?auto_410670 ) ) ( not ( = ?auto_410664 ?auto_410665 ) ) ( not ( = ?auto_410664 ?auto_410666 ) ) ( not ( = ?auto_410664 ?auto_410667 ) ) ( not ( = ?auto_410664 ?auto_410668 ) ) ( not ( = ?auto_410664 ?auto_410669 ) ) ( not ( = ?auto_410664 ?auto_410670 ) ) ( not ( = ?auto_410665 ?auto_410666 ) ) ( not ( = ?auto_410665 ?auto_410667 ) ) ( not ( = ?auto_410665 ?auto_410668 ) ) ( not ( = ?auto_410665 ?auto_410669 ) ) ( not ( = ?auto_410665 ?auto_410670 ) ) ( not ( = ?auto_410666 ?auto_410667 ) ) ( not ( = ?auto_410666 ?auto_410668 ) ) ( not ( = ?auto_410666 ?auto_410669 ) ) ( not ( = ?auto_410666 ?auto_410670 ) ) ( not ( = ?auto_410667 ?auto_410668 ) ) ( not ( = ?auto_410667 ?auto_410669 ) ) ( not ( = ?auto_410667 ?auto_410670 ) ) ( not ( = ?auto_410668 ?auto_410669 ) ) ( not ( = ?auto_410668 ?auto_410670 ) ) ( not ( = ?auto_410669 ?auto_410670 ) ) ( ON ?auto_410668 ?auto_410669 ) ( ON ?auto_410667 ?auto_410668 ) ( ON ?auto_410666 ?auto_410667 ) ( ON ?auto_410665 ?auto_410666 ) ( ON ?auto_410664 ?auto_410665 ) ( CLEAR ?auto_410662 ) ( ON ?auto_410663 ?auto_410664 ) ( CLEAR ?auto_410663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_410657 ?auto_410658 ?auto_410659 ?auto_410660 ?auto_410661 ?auto_410662 ?auto_410663 )
      ( MAKE-13PILE ?auto_410657 ?auto_410658 ?auto_410659 ?auto_410660 ?auto_410661 ?auto_410662 ?auto_410663 ?auto_410664 ?auto_410665 ?auto_410666 ?auto_410667 ?auto_410668 ?auto_410669 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410684 - BLOCK
      ?auto_410685 - BLOCK
      ?auto_410686 - BLOCK
      ?auto_410687 - BLOCK
      ?auto_410688 - BLOCK
      ?auto_410689 - BLOCK
      ?auto_410690 - BLOCK
      ?auto_410691 - BLOCK
      ?auto_410692 - BLOCK
      ?auto_410693 - BLOCK
      ?auto_410694 - BLOCK
      ?auto_410695 - BLOCK
      ?auto_410696 - BLOCK
    )
    :vars
    (
      ?auto_410697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410696 ?auto_410697 ) ( ON-TABLE ?auto_410684 ) ( ON ?auto_410685 ?auto_410684 ) ( ON ?auto_410686 ?auto_410685 ) ( ON ?auto_410687 ?auto_410686 ) ( ON ?auto_410688 ?auto_410687 ) ( ON ?auto_410689 ?auto_410688 ) ( not ( = ?auto_410684 ?auto_410685 ) ) ( not ( = ?auto_410684 ?auto_410686 ) ) ( not ( = ?auto_410684 ?auto_410687 ) ) ( not ( = ?auto_410684 ?auto_410688 ) ) ( not ( = ?auto_410684 ?auto_410689 ) ) ( not ( = ?auto_410684 ?auto_410690 ) ) ( not ( = ?auto_410684 ?auto_410691 ) ) ( not ( = ?auto_410684 ?auto_410692 ) ) ( not ( = ?auto_410684 ?auto_410693 ) ) ( not ( = ?auto_410684 ?auto_410694 ) ) ( not ( = ?auto_410684 ?auto_410695 ) ) ( not ( = ?auto_410684 ?auto_410696 ) ) ( not ( = ?auto_410684 ?auto_410697 ) ) ( not ( = ?auto_410685 ?auto_410686 ) ) ( not ( = ?auto_410685 ?auto_410687 ) ) ( not ( = ?auto_410685 ?auto_410688 ) ) ( not ( = ?auto_410685 ?auto_410689 ) ) ( not ( = ?auto_410685 ?auto_410690 ) ) ( not ( = ?auto_410685 ?auto_410691 ) ) ( not ( = ?auto_410685 ?auto_410692 ) ) ( not ( = ?auto_410685 ?auto_410693 ) ) ( not ( = ?auto_410685 ?auto_410694 ) ) ( not ( = ?auto_410685 ?auto_410695 ) ) ( not ( = ?auto_410685 ?auto_410696 ) ) ( not ( = ?auto_410685 ?auto_410697 ) ) ( not ( = ?auto_410686 ?auto_410687 ) ) ( not ( = ?auto_410686 ?auto_410688 ) ) ( not ( = ?auto_410686 ?auto_410689 ) ) ( not ( = ?auto_410686 ?auto_410690 ) ) ( not ( = ?auto_410686 ?auto_410691 ) ) ( not ( = ?auto_410686 ?auto_410692 ) ) ( not ( = ?auto_410686 ?auto_410693 ) ) ( not ( = ?auto_410686 ?auto_410694 ) ) ( not ( = ?auto_410686 ?auto_410695 ) ) ( not ( = ?auto_410686 ?auto_410696 ) ) ( not ( = ?auto_410686 ?auto_410697 ) ) ( not ( = ?auto_410687 ?auto_410688 ) ) ( not ( = ?auto_410687 ?auto_410689 ) ) ( not ( = ?auto_410687 ?auto_410690 ) ) ( not ( = ?auto_410687 ?auto_410691 ) ) ( not ( = ?auto_410687 ?auto_410692 ) ) ( not ( = ?auto_410687 ?auto_410693 ) ) ( not ( = ?auto_410687 ?auto_410694 ) ) ( not ( = ?auto_410687 ?auto_410695 ) ) ( not ( = ?auto_410687 ?auto_410696 ) ) ( not ( = ?auto_410687 ?auto_410697 ) ) ( not ( = ?auto_410688 ?auto_410689 ) ) ( not ( = ?auto_410688 ?auto_410690 ) ) ( not ( = ?auto_410688 ?auto_410691 ) ) ( not ( = ?auto_410688 ?auto_410692 ) ) ( not ( = ?auto_410688 ?auto_410693 ) ) ( not ( = ?auto_410688 ?auto_410694 ) ) ( not ( = ?auto_410688 ?auto_410695 ) ) ( not ( = ?auto_410688 ?auto_410696 ) ) ( not ( = ?auto_410688 ?auto_410697 ) ) ( not ( = ?auto_410689 ?auto_410690 ) ) ( not ( = ?auto_410689 ?auto_410691 ) ) ( not ( = ?auto_410689 ?auto_410692 ) ) ( not ( = ?auto_410689 ?auto_410693 ) ) ( not ( = ?auto_410689 ?auto_410694 ) ) ( not ( = ?auto_410689 ?auto_410695 ) ) ( not ( = ?auto_410689 ?auto_410696 ) ) ( not ( = ?auto_410689 ?auto_410697 ) ) ( not ( = ?auto_410690 ?auto_410691 ) ) ( not ( = ?auto_410690 ?auto_410692 ) ) ( not ( = ?auto_410690 ?auto_410693 ) ) ( not ( = ?auto_410690 ?auto_410694 ) ) ( not ( = ?auto_410690 ?auto_410695 ) ) ( not ( = ?auto_410690 ?auto_410696 ) ) ( not ( = ?auto_410690 ?auto_410697 ) ) ( not ( = ?auto_410691 ?auto_410692 ) ) ( not ( = ?auto_410691 ?auto_410693 ) ) ( not ( = ?auto_410691 ?auto_410694 ) ) ( not ( = ?auto_410691 ?auto_410695 ) ) ( not ( = ?auto_410691 ?auto_410696 ) ) ( not ( = ?auto_410691 ?auto_410697 ) ) ( not ( = ?auto_410692 ?auto_410693 ) ) ( not ( = ?auto_410692 ?auto_410694 ) ) ( not ( = ?auto_410692 ?auto_410695 ) ) ( not ( = ?auto_410692 ?auto_410696 ) ) ( not ( = ?auto_410692 ?auto_410697 ) ) ( not ( = ?auto_410693 ?auto_410694 ) ) ( not ( = ?auto_410693 ?auto_410695 ) ) ( not ( = ?auto_410693 ?auto_410696 ) ) ( not ( = ?auto_410693 ?auto_410697 ) ) ( not ( = ?auto_410694 ?auto_410695 ) ) ( not ( = ?auto_410694 ?auto_410696 ) ) ( not ( = ?auto_410694 ?auto_410697 ) ) ( not ( = ?auto_410695 ?auto_410696 ) ) ( not ( = ?auto_410695 ?auto_410697 ) ) ( not ( = ?auto_410696 ?auto_410697 ) ) ( ON ?auto_410695 ?auto_410696 ) ( ON ?auto_410694 ?auto_410695 ) ( ON ?auto_410693 ?auto_410694 ) ( ON ?auto_410692 ?auto_410693 ) ( ON ?auto_410691 ?auto_410692 ) ( CLEAR ?auto_410689 ) ( ON ?auto_410690 ?auto_410691 ) ( CLEAR ?auto_410690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_410684 ?auto_410685 ?auto_410686 ?auto_410687 ?auto_410688 ?auto_410689 ?auto_410690 )
      ( MAKE-13PILE ?auto_410684 ?auto_410685 ?auto_410686 ?auto_410687 ?auto_410688 ?auto_410689 ?auto_410690 ?auto_410691 ?auto_410692 ?auto_410693 ?auto_410694 ?auto_410695 ?auto_410696 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410711 - BLOCK
      ?auto_410712 - BLOCK
      ?auto_410713 - BLOCK
      ?auto_410714 - BLOCK
      ?auto_410715 - BLOCK
      ?auto_410716 - BLOCK
      ?auto_410717 - BLOCK
      ?auto_410718 - BLOCK
      ?auto_410719 - BLOCK
      ?auto_410720 - BLOCK
      ?auto_410721 - BLOCK
      ?auto_410722 - BLOCK
      ?auto_410723 - BLOCK
    )
    :vars
    (
      ?auto_410724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410723 ?auto_410724 ) ( ON-TABLE ?auto_410711 ) ( ON ?auto_410712 ?auto_410711 ) ( ON ?auto_410713 ?auto_410712 ) ( ON ?auto_410714 ?auto_410713 ) ( ON ?auto_410715 ?auto_410714 ) ( not ( = ?auto_410711 ?auto_410712 ) ) ( not ( = ?auto_410711 ?auto_410713 ) ) ( not ( = ?auto_410711 ?auto_410714 ) ) ( not ( = ?auto_410711 ?auto_410715 ) ) ( not ( = ?auto_410711 ?auto_410716 ) ) ( not ( = ?auto_410711 ?auto_410717 ) ) ( not ( = ?auto_410711 ?auto_410718 ) ) ( not ( = ?auto_410711 ?auto_410719 ) ) ( not ( = ?auto_410711 ?auto_410720 ) ) ( not ( = ?auto_410711 ?auto_410721 ) ) ( not ( = ?auto_410711 ?auto_410722 ) ) ( not ( = ?auto_410711 ?auto_410723 ) ) ( not ( = ?auto_410711 ?auto_410724 ) ) ( not ( = ?auto_410712 ?auto_410713 ) ) ( not ( = ?auto_410712 ?auto_410714 ) ) ( not ( = ?auto_410712 ?auto_410715 ) ) ( not ( = ?auto_410712 ?auto_410716 ) ) ( not ( = ?auto_410712 ?auto_410717 ) ) ( not ( = ?auto_410712 ?auto_410718 ) ) ( not ( = ?auto_410712 ?auto_410719 ) ) ( not ( = ?auto_410712 ?auto_410720 ) ) ( not ( = ?auto_410712 ?auto_410721 ) ) ( not ( = ?auto_410712 ?auto_410722 ) ) ( not ( = ?auto_410712 ?auto_410723 ) ) ( not ( = ?auto_410712 ?auto_410724 ) ) ( not ( = ?auto_410713 ?auto_410714 ) ) ( not ( = ?auto_410713 ?auto_410715 ) ) ( not ( = ?auto_410713 ?auto_410716 ) ) ( not ( = ?auto_410713 ?auto_410717 ) ) ( not ( = ?auto_410713 ?auto_410718 ) ) ( not ( = ?auto_410713 ?auto_410719 ) ) ( not ( = ?auto_410713 ?auto_410720 ) ) ( not ( = ?auto_410713 ?auto_410721 ) ) ( not ( = ?auto_410713 ?auto_410722 ) ) ( not ( = ?auto_410713 ?auto_410723 ) ) ( not ( = ?auto_410713 ?auto_410724 ) ) ( not ( = ?auto_410714 ?auto_410715 ) ) ( not ( = ?auto_410714 ?auto_410716 ) ) ( not ( = ?auto_410714 ?auto_410717 ) ) ( not ( = ?auto_410714 ?auto_410718 ) ) ( not ( = ?auto_410714 ?auto_410719 ) ) ( not ( = ?auto_410714 ?auto_410720 ) ) ( not ( = ?auto_410714 ?auto_410721 ) ) ( not ( = ?auto_410714 ?auto_410722 ) ) ( not ( = ?auto_410714 ?auto_410723 ) ) ( not ( = ?auto_410714 ?auto_410724 ) ) ( not ( = ?auto_410715 ?auto_410716 ) ) ( not ( = ?auto_410715 ?auto_410717 ) ) ( not ( = ?auto_410715 ?auto_410718 ) ) ( not ( = ?auto_410715 ?auto_410719 ) ) ( not ( = ?auto_410715 ?auto_410720 ) ) ( not ( = ?auto_410715 ?auto_410721 ) ) ( not ( = ?auto_410715 ?auto_410722 ) ) ( not ( = ?auto_410715 ?auto_410723 ) ) ( not ( = ?auto_410715 ?auto_410724 ) ) ( not ( = ?auto_410716 ?auto_410717 ) ) ( not ( = ?auto_410716 ?auto_410718 ) ) ( not ( = ?auto_410716 ?auto_410719 ) ) ( not ( = ?auto_410716 ?auto_410720 ) ) ( not ( = ?auto_410716 ?auto_410721 ) ) ( not ( = ?auto_410716 ?auto_410722 ) ) ( not ( = ?auto_410716 ?auto_410723 ) ) ( not ( = ?auto_410716 ?auto_410724 ) ) ( not ( = ?auto_410717 ?auto_410718 ) ) ( not ( = ?auto_410717 ?auto_410719 ) ) ( not ( = ?auto_410717 ?auto_410720 ) ) ( not ( = ?auto_410717 ?auto_410721 ) ) ( not ( = ?auto_410717 ?auto_410722 ) ) ( not ( = ?auto_410717 ?auto_410723 ) ) ( not ( = ?auto_410717 ?auto_410724 ) ) ( not ( = ?auto_410718 ?auto_410719 ) ) ( not ( = ?auto_410718 ?auto_410720 ) ) ( not ( = ?auto_410718 ?auto_410721 ) ) ( not ( = ?auto_410718 ?auto_410722 ) ) ( not ( = ?auto_410718 ?auto_410723 ) ) ( not ( = ?auto_410718 ?auto_410724 ) ) ( not ( = ?auto_410719 ?auto_410720 ) ) ( not ( = ?auto_410719 ?auto_410721 ) ) ( not ( = ?auto_410719 ?auto_410722 ) ) ( not ( = ?auto_410719 ?auto_410723 ) ) ( not ( = ?auto_410719 ?auto_410724 ) ) ( not ( = ?auto_410720 ?auto_410721 ) ) ( not ( = ?auto_410720 ?auto_410722 ) ) ( not ( = ?auto_410720 ?auto_410723 ) ) ( not ( = ?auto_410720 ?auto_410724 ) ) ( not ( = ?auto_410721 ?auto_410722 ) ) ( not ( = ?auto_410721 ?auto_410723 ) ) ( not ( = ?auto_410721 ?auto_410724 ) ) ( not ( = ?auto_410722 ?auto_410723 ) ) ( not ( = ?auto_410722 ?auto_410724 ) ) ( not ( = ?auto_410723 ?auto_410724 ) ) ( ON ?auto_410722 ?auto_410723 ) ( ON ?auto_410721 ?auto_410722 ) ( ON ?auto_410720 ?auto_410721 ) ( ON ?auto_410719 ?auto_410720 ) ( ON ?auto_410718 ?auto_410719 ) ( ON ?auto_410717 ?auto_410718 ) ( CLEAR ?auto_410715 ) ( ON ?auto_410716 ?auto_410717 ) ( CLEAR ?auto_410716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_410711 ?auto_410712 ?auto_410713 ?auto_410714 ?auto_410715 ?auto_410716 )
      ( MAKE-13PILE ?auto_410711 ?auto_410712 ?auto_410713 ?auto_410714 ?auto_410715 ?auto_410716 ?auto_410717 ?auto_410718 ?auto_410719 ?auto_410720 ?auto_410721 ?auto_410722 ?auto_410723 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410738 - BLOCK
      ?auto_410739 - BLOCK
      ?auto_410740 - BLOCK
      ?auto_410741 - BLOCK
      ?auto_410742 - BLOCK
      ?auto_410743 - BLOCK
      ?auto_410744 - BLOCK
      ?auto_410745 - BLOCK
      ?auto_410746 - BLOCK
      ?auto_410747 - BLOCK
      ?auto_410748 - BLOCK
      ?auto_410749 - BLOCK
      ?auto_410750 - BLOCK
    )
    :vars
    (
      ?auto_410751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410750 ?auto_410751 ) ( ON-TABLE ?auto_410738 ) ( ON ?auto_410739 ?auto_410738 ) ( ON ?auto_410740 ?auto_410739 ) ( ON ?auto_410741 ?auto_410740 ) ( ON ?auto_410742 ?auto_410741 ) ( not ( = ?auto_410738 ?auto_410739 ) ) ( not ( = ?auto_410738 ?auto_410740 ) ) ( not ( = ?auto_410738 ?auto_410741 ) ) ( not ( = ?auto_410738 ?auto_410742 ) ) ( not ( = ?auto_410738 ?auto_410743 ) ) ( not ( = ?auto_410738 ?auto_410744 ) ) ( not ( = ?auto_410738 ?auto_410745 ) ) ( not ( = ?auto_410738 ?auto_410746 ) ) ( not ( = ?auto_410738 ?auto_410747 ) ) ( not ( = ?auto_410738 ?auto_410748 ) ) ( not ( = ?auto_410738 ?auto_410749 ) ) ( not ( = ?auto_410738 ?auto_410750 ) ) ( not ( = ?auto_410738 ?auto_410751 ) ) ( not ( = ?auto_410739 ?auto_410740 ) ) ( not ( = ?auto_410739 ?auto_410741 ) ) ( not ( = ?auto_410739 ?auto_410742 ) ) ( not ( = ?auto_410739 ?auto_410743 ) ) ( not ( = ?auto_410739 ?auto_410744 ) ) ( not ( = ?auto_410739 ?auto_410745 ) ) ( not ( = ?auto_410739 ?auto_410746 ) ) ( not ( = ?auto_410739 ?auto_410747 ) ) ( not ( = ?auto_410739 ?auto_410748 ) ) ( not ( = ?auto_410739 ?auto_410749 ) ) ( not ( = ?auto_410739 ?auto_410750 ) ) ( not ( = ?auto_410739 ?auto_410751 ) ) ( not ( = ?auto_410740 ?auto_410741 ) ) ( not ( = ?auto_410740 ?auto_410742 ) ) ( not ( = ?auto_410740 ?auto_410743 ) ) ( not ( = ?auto_410740 ?auto_410744 ) ) ( not ( = ?auto_410740 ?auto_410745 ) ) ( not ( = ?auto_410740 ?auto_410746 ) ) ( not ( = ?auto_410740 ?auto_410747 ) ) ( not ( = ?auto_410740 ?auto_410748 ) ) ( not ( = ?auto_410740 ?auto_410749 ) ) ( not ( = ?auto_410740 ?auto_410750 ) ) ( not ( = ?auto_410740 ?auto_410751 ) ) ( not ( = ?auto_410741 ?auto_410742 ) ) ( not ( = ?auto_410741 ?auto_410743 ) ) ( not ( = ?auto_410741 ?auto_410744 ) ) ( not ( = ?auto_410741 ?auto_410745 ) ) ( not ( = ?auto_410741 ?auto_410746 ) ) ( not ( = ?auto_410741 ?auto_410747 ) ) ( not ( = ?auto_410741 ?auto_410748 ) ) ( not ( = ?auto_410741 ?auto_410749 ) ) ( not ( = ?auto_410741 ?auto_410750 ) ) ( not ( = ?auto_410741 ?auto_410751 ) ) ( not ( = ?auto_410742 ?auto_410743 ) ) ( not ( = ?auto_410742 ?auto_410744 ) ) ( not ( = ?auto_410742 ?auto_410745 ) ) ( not ( = ?auto_410742 ?auto_410746 ) ) ( not ( = ?auto_410742 ?auto_410747 ) ) ( not ( = ?auto_410742 ?auto_410748 ) ) ( not ( = ?auto_410742 ?auto_410749 ) ) ( not ( = ?auto_410742 ?auto_410750 ) ) ( not ( = ?auto_410742 ?auto_410751 ) ) ( not ( = ?auto_410743 ?auto_410744 ) ) ( not ( = ?auto_410743 ?auto_410745 ) ) ( not ( = ?auto_410743 ?auto_410746 ) ) ( not ( = ?auto_410743 ?auto_410747 ) ) ( not ( = ?auto_410743 ?auto_410748 ) ) ( not ( = ?auto_410743 ?auto_410749 ) ) ( not ( = ?auto_410743 ?auto_410750 ) ) ( not ( = ?auto_410743 ?auto_410751 ) ) ( not ( = ?auto_410744 ?auto_410745 ) ) ( not ( = ?auto_410744 ?auto_410746 ) ) ( not ( = ?auto_410744 ?auto_410747 ) ) ( not ( = ?auto_410744 ?auto_410748 ) ) ( not ( = ?auto_410744 ?auto_410749 ) ) ( not ( = ?auto_410744 ?auto_410750 ) ) ( not ( = ?auto_410744 ?auto_410751 ) ) ( not ( = ?auto_410745 ?auto_410746 ) ) ( not ( = ?auto_410745 ?auto_410747 ) ) ( not ( = ?auto_410745 ?auto_410748 ) ) ( not ( = ?auto_410745 ?auto_410749 ) ) ( not ( = ?auto_410745 ?auto_410750 ) ) ( not ( = ?auto_410745 ?auto_410751 ) ) ( not ( = ?auto_410746 ?auto_410747 ) ) ( not ( = ?auto_410746 ?auto_410748 ) ) ( not ( = ?auto_410746 ?auto_410749 ) ) ( not ( = ?auto_410746 ?auto_410750 ) ) ( not ( = ?auto_410746 ?auto_410751 ) ) ( not ( = ?auto_410747 ?auto_410748 ) ) ( not ( = ?auto_410747 ?auto_410749 ) ) ( not ( = ?auto_410747 ?auto_410750 ) ) ( not ( = ?auto_410747 ?auto_410751 ) ) ( not ( = ?auto_410748 ?auto_410749 ) ) ( not ( = ?auto_410748 ?auto_410750 ) ) ( not ( = ?auto_410748 ?auto_410751 ) ) ( not ( = ?auto_410749 ?auto_410750 ) ) ( not ( = ?auto_410749 ?auto_410751 ) ) ( not ( = ?auto_410750 ?auto_410751 ) ) ( ON ?auto_410749 ?auto_410750 ) ( ON ?auto_410748 ?auto_410749 ) ( ON ?auto_410747 ?auto_410748 ) ( ON ?auto_410746 ?auto_410747 ) ( ON ?auto_410745 ?auto_410746 ) ( ON ?auto_410744 ?auto_410745 ) ( CLEAR ?auto_410742 ) ( ON ?auto_410743 ?auto_410744 ) ( CLEAR ?auto_410743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_410738 ?auto_410739 ?auto_410740 ?auto_410741 ?auto_410742 ?auto_410743 )
      ( MAKE-13PILE ?auto_410738 ?auto_410739 ?auto_410740 ?auto_410741 ?auto_410742 ?auto_410743 ?auto_410744 ?auto_410745 ?auto_410746 ?auto_410747 ?auto_410748 ?auto_410749 ?auto_410750 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410765 - BLOCK
      ?auto_410766 - BLOCK
      ?auto_410767 - BLOCK
      ?auto_410768 - BLOCK
      ?auto_410769 - BLOCK
      ?auto_410770 - BLOCK
      ?auto_410771 - BLOCK
      ?auto_410772 - BLOCK
      ?auto_410773 - BLOCK
      ?auto_410774 - BLOCK
      ?auto_410775 - BLOCK
      ?auto_410776 - BLOCK
      ?auto_410777 - BLOCK
    )
    :vars
    (
      ?auto_410778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410777 ?auto_410778 ) ( ON-TABLE ?auto_410765 ) ( ON ?auto_410766 ?auto_410765 ) ( ON ?auto_410767 ?auto_410766 ) ( ON ?auto_410768 ?auto_410767 ) ( not ( = ?auto_410765 ?auto_410766 ) ) ( not ( = ?auto_410765 ?auto_410767 ) ) ( not ( = ?auto_410765 ?auto_410768 ) ) ( not ( = ?auto_410765 ?auto_410769 ) ) ( not ( = ?auto_410765 ?auto_410770 ) ) ( not ( = ?auto_410765 ?auto_410771 ) ) ( not ( = ?auto_410765 ?auto_410772 ) ) ( not ( = ?auto_410765 ?auto_410773 ) ) ( not ( = ?auto_410765 ?auto_410774 ) ) ( not ( = ?auto_410765 ?auto_410775 ) ) ( not ( = ?auto_410765 ?auto_410776 ) ) ( not ( = ?auto_410765 ?auto_410777 ) ) ( not ( = ?auto_410765 ?auto_410778 ) ) ( not ( = ?auto_410766 ?auto_410767 ) ) ( not ( = ?auto_410766 ?auto_410768 ) ) ( not ( = ?auto_410766 ?auto_410769 ) ) ( not ( = ?auto_410766 ?auto_410770 ) ) ( not ( = ?auto_410766 ?auto_410771 ) ) ( not ( = ?auto_410766 ?auto_410772 ) ) ( not ( = ?auto_410766 ?auto_410773 ) ) ( not ( = ?auto_410766 ?auto_410774 ) ) ( not ( = ?auto_410766 ?auto_410775 ) ) ( not ( = ?auto_410766 ?auto_410776 ) ) ( not ( = ?auto_410766 ?auto_410777 ) ) ( not ( = ?auto_410766 ?auto_410778 ) ) ( not ( = ?auto_410767 ?auto_410768 ) ) ( not ( = ?auto_410767 ?auto_410769 ) ) ( not ( = ?auto_410767 ?auto_410770 ) ) ( not ( = ?auto_410767 ?auto_410771 ) ) ( not ( = ?auto_410767 ?auto_410772 ) ) ( not ( = ?auto_410767 ?auto_410773 ) ) ( not ( = ?auto_410767 ?auto_410774 ) ) ( not ( = ?auto_410767 ?auto_410775 ) ) ( not ( = ?auto_410767 ?auto_410776 ) ) ( not ( = ?auto_410767 ?auto_410777 ) ) ( not ( = ?auto_410767 ?auto_410778 ) ) ( not ( = ?auto_410768 ?auto_410769 ) ) ( not ( = ?auto_410768 ?auto_410770 ) ) ( not ( = ?auto_410768 ?auto_410771 ) ) ( not ( = ?auto_410768 ?auto_410772 ) ) ( not ( = ?auto_410768 ?auto_410773 ) ) ( not ( = ?auto_410768 ?auto_410774 ) ) ( not ( = ?auto_410768 ?auto_410775 ) ) ( not ( = ?auto_410768 ?auto_410776 ) ) ( not ( = ?auto_410768 ?auto_410777 ) ) ( not ( = ?auto_410768 ?auto_410778 ) ) ( not ( = ?auto_410769 ?auto_410770 ) ) ( not ( = ?auto_410769 ?auto_410771 ) ) ( not ( = ?auto_410769 ?auto_410772 ) ) ( not ( = ?auto_410769 ?auto_410773 ) ) ( not ( = ?auto_410769 ?auto_410774 ) ) ( not ( = ?auto_410769 ?auto_410775 ) ) ( not ( = ?auto_410769 ?auto_410776 ) ) ( not ( = ?auto_410769 ?auto_410777 ) ) ( not ( = ?auto_410769 ?auto_410778 ) ) ( not ( = ?auto_410770 ?auto_410771 ) ) ( not ( = ?auto_410770 ?auto_410772 ) ) ( not ( = ?auto_410770 ?auto_410773 ) ) ( not ( = ?auto_410770 ?auto_410774 ) ) ( not ( = ?auto_410770 ?auto_410775 ) ) ( not ( = ?auto_410770 ?auto_410776 ) ) ( not ( = ?auto_410770 ?auto_410777 ) ) ( not ( = ?auto_410770 ?auto_410778 ) ) ( not ( = ?auto_410771 ?auto_410772 ) ) ( not ( = ?auto_410771 ?auto_410773 ) ) ( not ( = ?auto_410771 ?auto_410774 ) ) ( not ( = ?auto_410771 ?auto_410775 ) ) ( not ( = ?auto_410771 ?auto_410776 ) ) ( not ( = ?auto_410771 ?auto_410777 ) ) ( not ( = ?auto_410771 ?auto_410778 ) ) ( not ( = ?auto_410772 ?auto_410773 ) ) ( not ( = ?auto_410772 ?auto_410774 ) ) ( not ( = ?auto_410772 ?auto_410775 ) ) ( not ( = ?auto_410772 ?auto_410776 ) ) ( not ( = ?auto_410772 ?auto_410777 ) ) ( not ( = ?auto_410772 ?auto_410778 ) ) ( not ( = ?auto_410773 ?auto_410774 ) ) ( not ( = ?auto_410773 ?auto_410775 ) ) ( not ( = ?auto_410773 ?auto_410776 ) ) ( not ( = ?auto_410773 ?auto_410777 ) ) ( not ( = ?auto_410773 ?auto_410778 ) ) ( not ( = ?auto_410774 ?auto_410775 ) ) ( not ( = ?auto_410774 ?auto_410776 ) ) ( not ( = ?auto_410774 ?auto_410777 ) ) ( not ( = ?auto_410774 ?auto_410778 ) ) ( not ( = ?auto_410775 ?auto_410776 ) ) ( not ( = ?auto_410775 ?auto_410777 ) ) ( not ( = ?auto_410775 ?auto_410778 ) ) ( not ( = ?auto_410776 ?auto_410777 ) ) ( not ( = ?auto_410776 ?auto_410778 ) ) ( not ( = ?auto_410777 ?auto_410778 ) ) ( ON ?auto_410776 ?auto_410777 ) ( ON ?auto_410775 ?auto_410776 ) ( ON ?auto_410774 ?auto_410775 ) ( ON ?auto_410773 ?auto_410774 ) ( ON ?auto_410772 ?auto_410773 ) ( ON ?auto_410771 ?auto_410772 ) ( ON ?auto_410770 ?auto_410771 ) ( CLEAR ?auto_410768 ) ( ON ?auto_410769 ?auto_410770 ) ( CLEAR ?auto_410769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_410765 ?auto_410766 ?auto_410767 ?auto_410768 ?auto_410769 )
      ( MAKE-13PILE ?auto_410765 ?auto_410766 ?auto_410767 ?auto_410768 ?auto_410769 ?auto_410770 ?auto_410771 ?auto_410772 ?auto_410773 ?auto_410774 ?auto_410775 ?auto_410776 ?auto_410777 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410792 - BLOCK
      ?auto_410793 - BLOCK
      ?auto_410794 - BLOCK
      ?auto_410795 - BLOCK
      ?auto_410796 - BLOCK
      ?auto_410797 - BLOCK
      ?auto_410798 - BLOCK
      ?auto_410799 - BLOCK
      ?auto_410800 - BLOCK
      ?auto_410801 - BLOCK
      ?auto_410802 - BLOCK
      ?auto_410803 - BLOCK
      ?auto_410804 - BLOCK
    )
    :vars
    (
      ?auto_410805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410804 ?auto_410805 ) ( ON-TABLE ?auto_410792 ) ( ON ?auto_410793 ?auto_410792 ) ( ON ?auto_410794 ?auto_410793 ) ( ON ?auto_410795 ?auto_410794 ) ( not ( = ?auto_410792 ?auto_410793 ) ) ( not ( = ?auto_410792 ?auto_410794 ) ) ( not ( = ?auto_410792 ?auto_410795 ) ) ( not ( = ?auto_410792 ?auto_410796 ) ) ( not ( = ?auto_410792 ?auto_410797 ) ) ( not ( = ?auto_410792 ?auto_410798 ) ) ( not ( = ?auto_410792 ?auto_410799 ) ) ( not ( = ?auto_410792 ?auto_410800 ) ) ( not ( = ?auto_410792 ?auto_410801 ) ) ( not ( = ?auto_410792 ?auto_410802 ) ) ( not ( = ?auto_410792 ?auto_410803 ) ) ( not ( = ?auto_410792 ?auto_410804 ) ) ( not ( = ?auto_410792 ?auto_410805 ) ) ( not ( = ?auto_410793 ?auto_410794 ) ) ( not ( = ?auto_410793 ?auto_410795 ) ) ( not ( = ?auto_410793 ?auto_410796 ) ) ( not ( = ?auto_410793 ?auto_410797 ) ) ( not ( = ?auto_410793 ?auto_410798 ) ) ( not ( = ?auto_410793 ?auto_410799 ) ) ( not ( = ?auto_410793 ?auto_410800 ) ) ( not ( = ?auto_410793 ?auto_410801 ) ) ( not ( = ?auto_410793 ?auto_410802 ) ) ( not ( = ?auto_410793 ?auto_410803 ) ) ( not ( = ?auto_410793 ?auto_410804 ) ) ( not ( = ?auto_410793 ?auto_410805 ) ) ( not ( = ?auto_410794 ?auto_410795 ) ) ( not ( = ?auto_410794 ?auto_410796 ) ) ( not ( = ?auto_410794 ?auto_410797 ) ) ( not ( = ?auto_410794 ?auto_410798 ) ) ( not ( = ?auto_410794 ?auto_410799 ) ) ( not ( = ?auto_410794 ?auto_410800 ) ) ( not ( = ?auto_410794 ?auto_410801 ) ) ( not ( = ?auto_410794 ?auto_410802 ) ) ( not ( = ?auto_410794 ?auto_410803 ) ) ( not ( = ?auto_410794 ?auto_410804 ) ) ( not ( = ?auto_410794 ?auto_410805 ) ) ( not ( = ?auto_410795 ?auto_410796 ) ) ( not ( = ?auto_410795 ?auto_410797 ) ) ( not ( = ?auto_410795 ?auto_410798 ) ) ( not ( = ?auto_410795 ?auto_410799 ) ) ( not ( = ?auto_410795 ?auto_410800 ) ) ( not ( = ?auto_410795 ?auto_410801 ) ) ( not ( = ?auto_410795 ?auto_410802 ) ) ( not ( = ?auto_410795 ?auto_410803 ) ) ( not ( = ?auto_410795 ?auto_410804 ) ) ( not ( = ?auto_410795 ?auto_410805 ) ) ( not ( = ?auto_410796 ?auto_410797 ) ) ( not ( = ?auto_410796 ?auto_410798 ) ) ( not ( = ?auto_410796 ?auto_410799 ) ) ( not ( = ?auto_410796 ?auto_410800 ) ) ( not ( = ?auto_410796 ?auto_410801 ) ) ( not ( = ?auto_410796 ?auto_410802 ) ) ( not ( = ?auto_410796 ?auto_410803 ) ) ( not ( = ?auto_410796 ?auto_410804 ) ) ( not ( = ?auto_410796 ?auto_410805 ) ) ( not ( = ?auto_410797 ?auto_410798 ) ) ( not ( = ?auto_410797 ?auto_410799 ) ) ( not ( = ?auto_410797 ?auto_410800 ) ) ( not ( = ?auto_410797 ?auto_410801 ) ) ( not ( = ?auto_410797 ?auto_410802 ) ) ( not ( = ?auto_410797 ?auto_410803 ) ) ( not ( = ?auto_410797 ?auto_410804 ) ) ( not ( = ?auto_410797 ?auto_410805 ) ) ( not ( = ?auto_410798 ?auto_410799 ) ) ( not ( = ?auto_410798 ?auto_410800 ) ) ( not ( = ?auto_410798 ?auto_410801 ) ) ( not ( = ?auto_410798 ?auto_410802 ) ) ( not ( = ?auto_410798 ?auto_410803 ) ) ( not ( = ?auto_410798 ?auto_410804 ) ) ( not ( = ?auto_410798 ?auto_410805 ) ) ( not ( = ?auto_410799 ?auto_410800 ) ) ( not ( = ?auto_410799 ?auto_410801 ) ) ( not ( = ?auto_410799 ?auto_410802 ) ) ( not ( = ?auto_410799 ?auto_410803 ) ) ( not ( = ?auto_410799 ?auto_410804 ) ) ( not ( = ?auto_410799 ?auto_410805 ) ) ( not ( = ?auto_410800 ?auto_410801 ) ) ( not ( = ?auto_410800 ?auto_410802 ) ) ( not ( = ?auto_410800 ?auto_410803 ) ) ( not ( = ?auto_410800 ?auto_410804 ) ) ( not ( = ?auto_410800 ?auto_410805 ) ) ( not ( = ?auto_410801 ?auto_410802 ) ) ( not ( = ?auto_410801 ?auto_410803 ) ) ( not ( = ?auto_410801 ?auto_410804 ) ) ( not ( = ?auto_410801 ?auto_410805 ) ) ( not ( = ?auto_410802 ?auto_410803 ) ) ( not ( = ?auto_410802 ?auto_410804 ) ) ( not ( = ?auto_410802 ?auto_410805 ) ) ( not ( = ?auto_410803 ?auto_410804 ) ) ( not ( = ?auto_410803 ?auto_410805 ) ) ( not ( = ?auto_410804 ?auto_410805 ) ) ( ON ?auto_410803 ?auto_410804 ) ( ON ?auto_410802 ?auto_410803 ) ( ON ?auto_410801 ?auto_410802 ) ( ON ?auto_410800 ?auto_410801 ) ( ON ?auto_410799 ?auto_410800 ) ( ON ?auto_410798 ?auto_410799 ) ( ON ?auto_410797 ?auto_410798 ) ( CLEAR ?auto_410795 ) ( ON ?auto_410796 ?auto_410797 ) ( CLEAR ?auto_410796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_410792 ?auto_410793 ?auto_410794 ?auto_410795 ?auto_410796 )
      ( MAKE-13PILE ?auto_410792 ?auto_410793 ?auto_410794 ?auto_410795 ?auto_410796 ?auto_410797 ?auto_410798 ?auto_410799 ?auto_410800 ?auto_410801 ?auto_410802 ?auto_410803 ?auto_410804 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410819 - BLOCK
      ?auto_410820 - BLOCK
      ?auto_410821 - BLOCK
      ?auto_410822 - BLOCK
      ?auto_410823 - BLOCK
      ?auto_410824 - BLOCK
      ?auto_410825 - BLOCK
      ?auto_410826 - BLOCK
      ?auto_410827 - BLOCK
      ?auto_410828 - BLOCK
      ?auto_410829 - BLOCK
      ?auto_410830 - BLOCK
      ?auto_410831 - BLOCK
    )
    :vars
    (
      ?auto_410832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410831 ?auto_410832 ) ( ON-TABLE ?auto_410819 ) ( ON ?auto_410820 ?auto_410819 ) ( ON ?auto_410821 ?auto_410820 ) ( not ( = ?auto_410819 ?auto_410820 ) ) ( not ( = ?auto_410819 ?auto_410821 ) ) ( not ( = ?auto_410819 ?auto_410822 ) ) ( not ( = ?auto_410819 ?auto_410823 ) ) ( not ( = ?auto_410819 ?auto_410824 ) ) ( not ( = ?auto_410819 ?auto_410825 ) ) ( not ( = ?auto_410819 ?auto_410826 ) ) ( not ( = ?auto_410819 ?auto_410827 ) ) ( not ( = ?auto_410819 ?auto_410828 ) ) ( not ( = ?auto_410819 ?auto_410829 ) ) ( not ( = ?auto_410819 ?auto_410830 ) ) ( not ( = ?auto_410819 ?auto_410831 ) ) ( not ( = ?auto_410819 ?auto_410832 ) ) ( not ( = ?auto_410820 ?auto_410821 ) ) ( not ( = ?auto_410820 ?auto_410822 ) ) ( not ( = ?auto_410820 ?auto_410823 ) ) ( not ( = ?auto_410820 ?auto_410824 ) ) ( not ( = ?auto_410820 ?auto_410825 ) ) ( not ( = ?auto_410820 ?auto_410826 ) ) ( not ( = ?auto_410820 ?auto_410827 ) ) ( not ( = ?auto_410820 ?auto_410828 ) ) ( not ( = ?auto_410820 ?auto_410829 ) ) ( not ( = ?auto_410820 ?auto_410830 ) ) ( not ( = ?auto_410820 ?auto_410831 ) ) ( not ( = ?auto_410820 ?auto_410832 ) ) ( not ( = ?auto_410821 ?auto_410822 ) ) ( not ( = ?auto_410821 ?auto_410823 ) ) ( not ( = ?auto_410821 ?auto_410824 ) ) ( not ( = ?auto_410821 ?auto_410825 ) ) ( not ( = ?auto_410821 ?auto_410826 ) ) ( not ( = ?auto_410821 ?auto_410827 ) ) ( not ( = ?auto_410821 ?auto_410828 ) ) ( not ( = ?auto_410821 ?auto_410829 ) ) ( not ( = ?auto_410821 ?auto_410830 ) ) ( not ( = ?auto_410821 ?auto_410831 ) ) ( not ( = ?auto_410821 ?auto_410832 ) ) ( not ( = ?auto_410822 ?auto_410823 ) ) ( not ( = ?auto_410822 ?auto_410824 ) ) ( not ( = ?auto_410822 ?auto_410825 ) ) ( not ( = ?auto_410822 ?auto_410826 ) ) ( not ( = ?auto_410822 ?auto_410827 ) ) ( not ( = ?auto_410822 ?auto_410828 ) ) ( not ( = ?auto_410822 ?auto_410829 ) ) ( not ( = ?auto_410822 ?auto_410830 ) ) ( not ( = ?auto_410822 ?auto_410831 ) ) ( not ( = ?auto_410822 ?auto_410832 ) ) ( not ( = ?auto_410823 ?auto_410824 ) ) ( not ( = ?auto_410823 ?auto_410825 ) ) ( not ( = ?auto_410823 ?auto_410826 ) ) ( not ( = ?auto_410823 ?auto_410827 ) ) ( not ( = ?auto_410823 ?auto_410828 ) ) ( not ( = ?auto_410823 ?auto_410829 ) ) ( not ( = ?auto_410823 ?auto_410830 ) ) ( not ( = ?auto_410823 ?auto_410831 ) ) ( not ( = ?auto_410823 ?auto_410832 ) ) ( not ( = ?auto_410824 ?auto_410825 ) ) ( not ( = ?auto_410824 ?auto_410826 ) ) ( not ( = ?auto_410824 ?auto_410827 ) ) ( not ( = ?auto_410824 ?auto_410828 ) ) ( not ( = ?auto_410824 ?auto_410829 ) ) ( not ( = ?auto_410824 ?auto_410830 ) ) ( not ( = ?auto_410824 ?auto_410831 ) ) ( not ( = ?auto_410824 ?auto_410832 ) ) ( not ( = ?auto_410825 ?auto_410826 ) ) ( not ( = ?auto_410825 ?auto_410827 ) ) ( not ( = ?auto_410825 ?auto_410828 ) ) ( not ( = ?auto_410825 ?auto_410829 ) ) ( not ( = ?auto_410825 ?auto_410830 ) ) ( not ( = ?auto_410825 ?auto_410831 ) ) ( not ( = ?auto_410825 ?auto_410832 ) ) ( not ( = ?auto_410826 ?auto_410827 ) ) ( not ( = ?auto_410826 ?auto_410828 ) ) ( not ( = ?auto_410826 ?auto_410829 ) ) ( not ( = ?auto_410826 ?auto_410830 ) ) ( not ( = ?auto_410826 ?auto_410831 ) ) ( not ( = ?auto_410826 ?auto_410832 ) ) ( not ( = ?auto_410827 ?auto_410828 ) ) ( not ( = ?auto_410827 ?auto_410829 ) ) ( not ( = ?auto_410827 ?auto_410830 ) ) ( not ( = ?auto_410827 ?auto_410831 ) ) ( not ( = ?auto_410827 ?auto_410832 ) ) ( not ( = ?auto_410828 ?auto_410829 ) ) ( not ( = ?auto_410828 ?auto_410830 ) ) ( not ( = ?auto_410828 ?auto_410831 ) ) ( not ( = ?auto_410828 ?auto_410832 ) ) ( not ( = ?auto_410829 ?auto_410830 ) ) ( not ( = ?auto_410829 ?auto_410831 ) ) ( not ( = ?auto_410829 ?auto_410832 ) ) ( not ( = ?auto_410830 ?auto_410831 ) ) ( not ( = ?auto_410830 ?auto_410832 ) ) ( not ( = ?auto_410831 ?auto_410832 ) ) ( ON ?auto_410830 ?auto_410831 ) ( ON ?auto_410829 ?auto_410830 ) ( ON ?auto_410828 ?auto_410829 ) ( ON ?auto_410827 ?auto_410828 ) ( ON ?auto_410826 ?auto_410827 ) ( ON ?auto_410825 ?auto_410826 ) ( ON ?auto_410824 ?auto_410825 ) ( ON ?auto_410823 ?auto_410824 ) ( CLEAR ?auto_410821 ) ( ON ?auto_410822 ?auto_410823 ) ( CLEAR ?auto_410822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_410819 ?auto_410820 ?auto_410821 ?auto_410822 )
      ( MAKE-13PILE ?auto_410819 ?auto_410820 ?auto_410821 ?auto_410822 ?auto_410823 ?auto_410824 ?auto_410825 ?auto_410826 ?auto_410827 ?auto_410828 ?auto_410829 ?auto_410830 ?auto_410831 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410846 - BLOCK
      ?auto_410847 - BLOCK
      ?auto_410848 - BLOCK
      ?auto_410849 - BLOCK
      ?auto_410850 - BLOCK
      ?auto_410851 - BLOCK
      ?auto_410852 - BLOCK
      ?auto_410853 - BLOCK
      ?auto_410854 - BLOCK
      ?auto_410855 - BLOCK
      ?auto_410856 - BLOCK
      ?auto_410857 - BLOCK
      ?auto_410858 - BLOCK
    )
    :vars
    (
      ?auto_410859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410858 ?auto_410859 ) ( ON-TABLE ?auto_410846 ) ( ON ?auto_410847 ?auto_410846 ) ( ON ?auto_410848 ?auto_410847 ) ( not ( = ?auto_410846 ?auto_410847 ) ) ( not ( = ?auto_410846 ?auto_410848 ) ) ( not ( = ?auto_410846 ?auto_410849 ) ) ( not ( = ?auto_410846 ?auto_410850 ) ) ( not ( = ?auto_410846 ?auto_410851 ) ) ( not ( = ?auto_410846 ?auto_410852 ) ) ( not ( = ?auto_410846 ?auto_410853 ) ) ( not ( = ?auto_410846 ?auto_410854 ) ) ( not ( = ?auto_410846 ?auto_410855 ) ) ( not ( = ?auto_410846 ?auto_410856 ) ) ( not ( = ?auto_410846 ?auto_410857 ) ) ( not ( = ?auto_410846 ?auto_410858 ) ) ( not ( = ?auto_410846 ?auto_410859 ) ) ( not ( = ?auto_410847 ?auto_410848 ) ) ( not ( = ?auto_410847 ?auto_410849 ) ) ( not ( = ?auto_410847 ?auto_410850 ) ) ( not ( = ?auto_410847 ?auto_410851 ) ) ( not ( = ?auto_410847 ?auto_410852 ) ) ( not ( = ?auto_410847 ?auto_410853 ) ) ( not ( = ?auto_410847 ?auto_410854 ) ) ( not ( = ?auto_410847 ?auto_410855 ) ) ( not ( = ?auto_410847 ?auto_410856 ) ) ( not ( = ?auto_410847 ?auto_410857 ) ) ( not ( = ?auto_410847 ?auto_410858 ) ) ( not ( = ?auto_410847 ?auto_410859 ) ) ( not ( = ?auto_410848 ?auto_410849 ) ) ( not ( = ?auto_410848 ?auto_410850 ) ) ( not ( = ?auto_410848 ?auto_410851 ) ) ( not ( = ?auto_410848 ?auto_410852 ) ) ( not ( = ?auto_410848 ?auto_410853 ) ) ( not ( = ?auto_410848 ?auto_410854 ) ) ( not ( = ?auto_410848 ?auto_410855 ) ) ( not ( = ?auto_410848 ?auto_410856 ) ) ( not ( = ?auto_410848 ?auto_410857 ) ) ( not ( = ?auto_410848 ?auto_410858 ) ) ( not ( = ?auto_410848 ?auto_410859 ) ) ( not ( = ?auto_410849 ?auto_410850 ) ) ( not ( = ?auto_410849 ?auto_410851 ) ) ( not ( = ?auto_410849 ?auto_410852 ) ) ( not ( = ?auto_410849 ?auto_410853 ) ) ( not ( = ?auto_410849 ?auto_410854 ) ) ( not ( = ?auto_410849 ?auto_410855 ) ) ( not ( = ?auto_410849 ?auto_410856 ) ) ( not ( = ?auto_410849 ?auto_410857 ) ) ( not ( = ?auto_410849 ?auto_410858 ) ) ( not ( = ?auto_410849 ?auto_410859 ) ) ( not ( = ?auto_410850 ?auto_410851 ) ) ( not ( = ?auto_410850 ?auto_410852 ) ) ( not ( = ?auto_410850 ?auto_410853 ) ) ( not ( = ?auto_410850 ?auto_410854 ) ) ( not ( = ?auto_410850 ?auto_410855 ) ) ( not ( = ?auto_410850 ?auto_410856 ) ) ( not ( = ?auto_410850 ?auto_410857 ) ) ( not ( = ?auto_410850 ?auto_410858 ) ) ( not ( = ?auto_410850 ?auto_410859 ) ) ( not ( = ?auto_410851 ?auto_410852 ) ) ( not ( = ?auto_410851 ?auto_410853 ) ) ( not ( = ?auto_410851 ?auto_410854 ) ) ( not ( = ?auto_410851 ?auto_410855 ) ) ( not ( = ?auto_410851 ?auto_410856 ) ) ( not ( = ?auto_410851 ?auto_410857 ) ) ( not ( = ?auto_410851 ?auto_410858 ) ) ( not ( = ?auto_410851 ?auto_410859 ) ) ( not ( = ?auto_410852 ?auto_410853 ) ) ( not ( = ?auto_410852 ?auto_410854 ) ) ( not ( = ?auto_410852 ?auto_410855 ) ) ( not ( = ?auto_410852 ?auto_410856 ) ) ( not ( = ?auto_410852 ?auto_410857 ) ) ( not ( = ?auto_410852 ?auto_410858 ) ) ( not ( = ?auto_410852 ?auto_410859 ) ) ( not ( = ?auto_410853 ?auto_410854 ) ) ( not ( = ?auto_410853 ?auto_410855 ) ) ( not ( = ?auto_410853 ?auto_410856 ) ) ( not ( = ?auto_410853 ?auto_410857 ) ) ( not ( = ?auto_410853 ?auto_410858 ) ) ( not ( = ?auto_410853 ?auto_410859 ) ) ( not ( = ?auto_410854 ?auto_410855 ) ) ( not ( = ?auto_410854 ?auto_410856 ) ) ( not ( = ?auto_410854 ?auto_410857 ) ) ( not ( = ?auto_410854 ?auto_410858 ) ) ( not ( = ?auto_410854 ?auto_410859 ) ) ( not ( = ?auto_410855 ?auto_410856 ) ) ( not ( = ?auto_410855 ?auto_410857 ) ) ( not ( = ?auto_410855 ?auto_410858 ) ) ( not ( = ?auto_410855 ?auto_410859 ) ) ( not ( = ?auto_410856 ?auto_410857 ) ) ( not ( = ?auto_410856 ?auto_410858 ) ) ( not ( = ?auto_410856 ?auto_410859 ) ) ( not ( = ?auto_410857 ?auto_410858 ) ) ( not ( = ?auto_410857 ?auto_410859 ) ) ( not ( = ?auto_410858 ?auto_410859 ) ) ( ON ?auto_410857 ?auto_410858 ) ( ON ?auto_410856 ?auto_410857 ) ( ON ?auto_410855 ?auto_410856 ) ( ON ?auto_410854 ?auto_410855 ) ( ON ?auto_410853 ?auto_410854 ) ( ON ?auto_410852 ?auto_410853 ) ( ON ?auto_410851 ?auto_410852 ) ( ON ?auto_410850 ?auto_410851 ) ( CLEAR ?auto_410848 ) ( ON ?auto_410849 ?auto_410850 ) ( CLEAR ?auto_410849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_410846 ?auto_410847 ?auto_410848 ?auto_410849 )
      ( MAKE-13PILE ?auto_410846 ?auto_410847 ?auto_410848 ?auto_410849 ?auto_410850 ?auto_410851 ?auto_410852 ?auto_410853 ?auto_410854 ?auto_410855 ?auto_410856 ?auto_410857 ?auto_410858 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410873 - BLOCK
      ?auto_410874 - BLOCK
      ?auto_410875 - BLOCK
      ?auto_410876 - BLOCK
      ?auto_410877 - BLOCK
      ?auto_410878 - BLOCK
      ?auto_410879 - BLOCK
      ?auto_410880 - BLOCK
      ?auto_410881 - BLOCK
      ?auto_410882 - BLOCK
      ?auto_410883 - BLOCK
      ?auto_410884 - BLOCK
      ?auto_410885 - BLOCK
    )
    :vars
    (
      ?auto_410886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410885 ?auto_410886 ) ( ON-TABLE ?auto_410873 ) ( ON ?auto_410874 ?auto_410873 ) ( not ( = ?auto_410873 ?auto_410874 ) ) ( not ( = ?auto_410873 ?auto_410875 ) ) ( not ( = ?auto_410873 ?auto_410876 ) ) ( not ( = ?auto_410873 ?auto_410877 ) ) ( not ( = ?auto_410873 ?auto_410878 ) ) ( not ( = ?auto_410873 ?auto_410879 ) ) ( not ( = ?auto_410873 ?auto_410880 ) ) ( not ( = ?auto_410873 ?auto_410881 ) ) ( not ( = ?auto_410873 ?auto_410882 ) ) ( not ( = ?auto_410873 ?auto_410883 ) ) ( not ( = ?auto_410873 ?auto_410884 ) ) ( not ( = ?auto_410873 ?auto_410885 ) ) ( not ( = ?auto_410873 ?auto_410886 ) ) ( not ( = ?auto_410874 ?auto_410875 ) ) ( not ( = ?auto_410874 ?auto_410876 ) ) ( not ( = ?auto_410874 ?auto_410877 ) ) ( not ( = ?auto_410874 ?auto_410878 ) ) ( not ( = ?auto_410874 ?auto_410879 ) ) ( not ( = ?auto_410874 ?auto_410880 ) ) ( not ( = ?auto_410874 ?auto_410881 ) ) ( not ( = ?auto_410874 ?auto_410882 ) ) ( not ( = ?auto_410874 ?auto_410883 ) ) ( not ( = ?auto_410874 ?auto_410884 ) ) ( not ( = ?auto_410874 ?auto_410885 ) ) ( not ( = ?auto_410874 ?auto_410886 ) ) ( not ( = ?auto_410875 ?auto_410876 ) ) ( not ( = ?auto_410875 ?auto_410877 ) ) ( not ( = ?auto_410875 ?auto_410878 ) ) ( not ( = ?auto_410875 ?auto_410879 ) ) ( not ( = ?auto_410875 ?auto_410880 ) ) ( not ( = ?auto_410875 ?auto_410881 ) ) ( not ( = ?auto_410875 ?auto_410882 ) ) ( not ( = ?auto_410875 ?auto_410883 ) ) ( not ( = ?auto_410875 ?auto_410884 ) ) ( not ( = ?auto_410875 ?auto_410885 ) ) ( not ( = ?auto_410875 ?auto_410886 ) ) ( not ( = ?auto_410876 ?auto_410877 ) ) ( not ( = ?auto_410876 ?auto_410878 ) ) ( not ( = ?auto_410876 ?auto_410879 ) ) ( not ( = ?auto_410876 ?auto_410880 ) ) ( not ( = ?auto_410876 ?auto_410881 ) ) ( not ( = ?auto_410876 ?auto_410882 ) ) ( not ( = ?auto_410876 ?auto_410883 ) ) ( not ( = ?auto_410876 ?auto_410884 ) ) ( not ( = ?auto_410876 ?auto_410885 ) ) ( not ( = ?auto_410876 ?auto_410886 ) ) ( not ( = ?auto_410877 ?auto_410878 ) ) ( not ( = ?auto_410877 ?auto_410879 ) ) ( not ( = ?auto_410877 ?auto_410880 ) ) ( not ( = ?auto_410877 ?auto_410881 ) ) ( not ( = ?auto_410877 ?auto_410882 ) ) ( not ( = ?auto_410877 ?auto_410883 ) ) ( not ( = ?auto_410877 ?auto_410884 ) ) ( not ( = ?auto_410877 ?auto_410885 ) ) ( not ( = ?auto_410877 ?auto_410886 ) ) ( not ( = ?auto_410878 ?auto_410879 ) ) ( not ( = ?auto_410878 ?auto_410880 ) ) ( not ( = ?auto_410878 ?auto_410881 ) ) ( not ( = ?auto_410878 ?auto_410882 ) ) ( not ( = ?auto_410878 ?auto_410883 ) ) ( not ( = ?auto_410878 ?auto_410884 ) ) ( not ( = ?auto_410878 ?auto_410885 ) ) ( not ( = ?auto_410878 ?auto_410886 ) ) ( not ( = ?auto_410879 ?auto_410880 ) ) ( not ( = ?auto_410879 ?auto_410881 ) ) ( not ( = ?auto_410879 ?auto_410882 ) ) ( not ( = ?auto_410879 ?auto_410883 ) ) ( not ( = ?auto_410879 ?auto_410884 ) ) ( not ( = ?auto_410879 ?auto_410885 ) ) ( not ( = ?auto_410879 ?auto_410886 ) ) ( not ( = ?auto_410880 ?auto_410881 ) ) ( not ( = ?auto_410880 ?auto_410882 ) ) ( not ( = ?auto_410880 ?auto_410883 ) ) ( not ( = ?auto_410880 ?auto_410884 ) ) ( not ( = ?auto_410880 ?auto_410885 ) ) ( not ( = ?auto_410880 ?auto_410886 ) ) ( not ( = ?auto_410881 ?auto_410882 ) ) ( not ( = ?auto_410881 ?auto_410883 ) ) ( not ( = ?auto_410881 ?auto_410884 ) ) ( not ( = ?auto_410881 ?auto_410885 ) ) ( not ( = ?auto_410881 ?auto_410886 ) ) ( not ( = ?auto_410882 ?auto_410883 ) ) ( not ( = ?auto_410882 ?auto_410884 ) ) ( not ( = ?auto_410882 ?auto_410885 ) ) ( not ( = ?auto_410882 ?auto_410886 ) ) ( not ( = ?auto_410883 ?auto_410884 ) ) ( not ( = ?auto_410883 ?auto_410885 ) ) ( not ( = ?auto_410883 ?auto_410886 ) ) ( not ( = ?auto_410884 ?auto_410885 ) ) ( not ( = ?auto_410884 ?auto_410886 ) ) ( not ( = ?auto_410885 ?auto_410886 ) ) ( ON ?auto_410884 ?auto_410885 ) ( ON ?auto_410883 ?auto_410884 ) ( ON ?auto_410882 ?auto_410883 ) ( ON ?auto_410881 ?auto_410882 ) ( ON ?auto_410880 ?auto_410881 ) ( ON ?auto_410879 ?auto_410880 ) ( ON ?auto_410878 ?auto_410879 ) ( ON ?auto_410877 ?auto_410878 ) ( ON ?auto_410876 ?auto_410877 ) ( CLEAR ?auto_410874 ) ( ON ?auto_410875 ?auto_410876 ) ( CLEAR ?auto_410875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_410873 ?auto_410874 ?auto_410875 )
      ( MAKE-13PILE ?auto_410873 ?auto_410874 ?auto_410875 ?auto_410876 ?auto_410877 ?auto_410878 ?auto_410879 ?auto_410880 ?auto_410881 ?auto_410882 ?auto_410883 ?auto_410884 ?auto_410885 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410900 - BLOCK
      ?auto_410901 - BLOCK
      ?auto_410902 - BLOCK
      ?auto_410903 - BLOCK
      ?auto_410904 - BLOCK
      ?auto_410905 - BLOCK
      ?auto_410906 - BLOCK
      ?auto_410907 - BLOCK
      ?auto_410908 - BLOCK
      ?auto_410909 - BLOCK
      ?auto_410910 - BLOCK
      ?auto_410911 - BLOCK
      ?auto_410912 - BLOCK
    )
    :vars
    (
      ?auto_410913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410912 ?auto_410913 ) ( ON-TABLE ?auto_410900 ) ( ON ?auto_410901 ?auto_410900 ) ( not ( = ?auto_410900 ?auto_410901 ) ) ( not ( = ?auto_410900 ?auto_410902 ) ) ( not ( = ?auto_410900 ?auto_410903 ) ) ( not ( = ?auto_410900 ?auto_410904 ) ) ( not ( = ?auto_410900 ?auto_410905 ) ) ( not ( = ?auto_410900 ?auto_410906 ) ) ( not ( = ?auto_410900 ?auto_410907 ) ) ( not ( = ?auto_410900 ?auto_410908 ) ) ( not ( = ?auto_410900 ?auto_410909 ) ) ( not ( = ?auto_410900 ?auto_410910 ) ) ( not ( = ?auto_410900 ?auto_410911 ) ) ( not ( = ?auto_410900 ?auto_410912 ) ) ( not ( = ?auto_410900 ?auto_410913 ) ) ( not ( = ?auto_410901 ?auto_410902 ) ) ( not ( = ?auto_410901 ?auto_410903 ) ) ( not ( = ?auto_410901 ?auto_410904 ) ) ( not ( = ?auto_410901 ?auto_410905 ) ) ( not ( = ?auto_410901 ?auto_410906 ) ) ( not ( = ?auto_410901 ?auto_410907 ) ) ( not ( = ?auto_410901 ?auto_410908 ) ) ( not ( = ?auto_410901 ?auto_410909 ) ) ( not ( = ?auto_410901 ?auto_410910 ) ) ( not ( = ?auto_410901 ?auto_410911 ) ) ( not ( = ?auto_410901 ?auto_410912 ) ) ( not ( = ?auto_410901 ?auto_410913 ) ) ( not ( = ?auto_410902 ?auto_410903 ) ) ( not ( = ?auto_410902 ?auto_410904 ) ) ( not ( = ?auto_410902 ?auto_410905 ) ) ( not ( = ?auto_410902 ?auto_410906 ) ) ( not ( = ?auto_410902 ?auto_410907 ) ) ( not ( = ?auto_410902 ?auto_410908 ) ) ( not ( = ?auto_410902 ?auto_410909 ) ) ( not ( = ?auto_410902 ?auto_410910 ) ) ( not ( = ?auto_410902 ?auto_410911 ) ) ( not ( = ?auto_410902 ?auto_410912 ) ) ( not ( = ?auto_410902 ?auto_410913 ) ) ( not ( = ?auto_410903 ?auto_410904 ) ) ( not ( = ?auto_410903 ?auto_410905 ) ) ( not ( = ?auto_410903 ?auto_410906 ) ) ( not ( = ?auto_410903 ?auto_410907 ) ) ( not ( = ?auto_410903 ?auto_410908 ) ) ( not ( = ?auto_410903 ?auto_410909 ) ) ( not ( = ?auto_410903 ?auto_410910 ) ) ( not ( = ?auto_410903 ?auto_410911 ) ) ( not ( = ?auto_410903 ?auto_410912 ) ) ( not ( = ?auto_410903 ?auto_410913 ) ) ( not ( = ?auto_410904 ?auto_410905 ) ) ( not ( = ?auto_410904 ?auto_410906 ) ) ( not ( = ?auto_410904 ?auto_410907 ) ) ( not ( = ?auto_410904 ?auto_410908 ) ) ( not ( = ?auto_410904 ?auto_410909 ) ) ( not ( = ?auto_410904 ?auto_410910 ) ) ( not ( = ?auto_410904 ?auto_410911 ) ) ( not ( = ?auto_410904 ?auto_410912 ) ) ( not ( = ?auto_410904 ?auto_410913 ) ) ( not ( = ?auto_410905 ?auto_410906 ) ) ( not ( = ?auto_410905 ?auto_410907 ) ) ( not ( = ?auto_410905 ?auto_410908 ) ) ( not ( = ?auto_410905 ?auto_410909 ) ) ( not ( = ?auto_410905 ?auto_410910 ) ) ( not ( = ?auto_410905 ?auto_410911 ) ) ( not ( = ?auto_410905 ?auto_410912 ) ) ( not ( = ?auto_410905 ?auto_410913 ) ) ( not ( = ?auto_410906 ?auto_410907 ) ) ( not ( = ?auto_410906 ?auto_410908 ) ) ( not ( = ?auto_410906 ?auto_410909 ) ) ( not ( = ?auto_410906 ?auto_410910 ) ) ( not ( = ?auto_410906 ?auto_410911 ) ) ( not ( = ?auto_410906 ?auto_410912 ) ) ( not ( = ?auto_410906 ?auto_410913 ) ) ( not ( = ?auto_410907 ?auto_410908 ) ) ( not ( = ?auto_410907 ?auto_410909 ) ) ( not ( = ?auto_410907 ?auto_410910 ) ) ( not ( = ?auto_410907 ?auto_410911 ) ) ( not ( = ?auto_410907 ?auto_410912 ) ) ( not ( = ?auto_410907 ?auto_410913 ) ) ( not ( = ?auto_410908 ?auto_410909 ) ) ( not ( = ?auto_410908 ?auto_410910 ) ) ( not ( = ?auto_410908 ?auto_410911 ) ) ( not ( = ?auto_410908 ?auto_410912 ) ) ( not ( = ?auto_410908 ?auto_410913 ) ) ( not ( = ?auto_410909 ?auto_410910 ) ) ( not ( = ?auto_410909 ?auto_410911 ) ) ( not ( = ?auto_410909 ?auto_410912 ) ) ( not ( = ?auto_410909 ?auto_410913 ) ) ( not ( = ?auto_410910 ?auto_410911 ) ) ( not ( = ?auto_410910 ?auto_410912 ) ) ( not ( = ?auto_410910 ?auto_410913 ) ) ( not ( = ?auto_410911 ?auto_410912 ) ) ( not ( = ?auto_410911 ?auto_410913 ) ) ( not ( = ?auto_410912 ?auto_410913 ) ) ( ON ?auto_410911 ?auto_410912 ) ( ON ?auto_410910 ?auto_410911 ) ( ON ?auto_410909 ?auto_410910 ) ( ON ?auto_410908 ?auto_410909 ) ( ON ?auto_410907 ?auto_410908 ) ( ON ?auto_410906 ?auto_410907 ) ( ON ?auto_410905 ?auto_410906 ) ( ON ?auto_410904 ?auto_410905 ) ( ON ?auto_410903 ?auto_410904 ) ( CLEAR ?auto_410901 ) ( ON ?auto_410902 ?auto_410903 ) ( CLEAR ?auto_410902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_410900 ?auto_410901 ?auto_410902 )
      ( MAKE-13PILE ?auto_410900 ?auto_410901 ?auto_410902 ?auto_410903 ?auto_410904 ?auto_410905 ?auto_410906 ?auto_410907 ?auto_410908 ?auto_410909 ?auto_410910 ?auto_410911 ?auto_410912 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410927 - BLOCK
      ?auto_410928 - BLOCK
      ?auto_410929 - BLOCK
      ?auto_410930 - BLOCK
      ?auto_410931 - BLOCK
      ?auto_410932 - BLOCK
      ?auto_410933 - BLOCK
      ?auto_410934 - BLOCK
      ?auto_410935 - BLOCK
      ?auto_410936 - BLOCK
      ?auto_410937 - BLOCK
      ?auto_410938 - BLOCK
      ?auto_410939 - BLOCK
    )
    :vars
    (
      ?auto_410940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410939 ?auto_410940 ) ( ON-TABLE ?auto_410927 ) ( not ( = ?auto_410927 ?auto_410928 ) ) ( not ( = ?auto_410927 ?auto_410929 ) ) ( not ( = ?auto_410927 ?auto_410930 ) ) ( not ( = ?auto_410927 ?auto_410931 ) ) ( not ( = ?auto_410927 ?auto_410932 ) ) ( not ( = ?auto_410927 ?auto_410933 ) ) ( not ( = ?auto_410927 ?auto_410934 ) ) ( not ( = ?auto_410927 ?auto_410935 ) ) ( not ( = ?auto_410927 ?auto_410936 ) ) ( not ( = ?auto_410927 ?auto_410937 ) ) ( not ( = ?auto_410927 ?auto_410938 ) ) ( not ( = ?auto_410927 ?auto_410939 ) ) ( not ( = ?auto_410927 ?auto_410940 ) ) ( not ( = ?auto_410928 ?auto_410929 ) ) ( not ( = ?auto_410928 ?auto_410930 ) ) ( not ( = ?auto_410928 ?auto_410931 ) ) ( not ( = ?auto_410928 ?auto_410932 ) ) ( not ( = ?auto_410928 ?auto_410933 ) ) ( not ( = ?auto_410928 ?auto_410934 ) ) ( not ( = ?auto_410928 ?auto_410935 ) ) ( not ( = ?auto_410928 ?auto_410936 ) ) ( not ( = ?auto_410928 ?auto_410937 ) ) ( not ( = ?auto_410928 ?auto_410938 ) ) ( not ( = ?auto_410928 ?auto_410939 ) ) ( not ( = ?auto_410928 ?auto_410940 ) ) ( not ( = ?auto_410929 ?auto_410930 ) ) ( not ( = ?auto_410929 ?auto_410931 ) ) ( not ( = ?auto_410929 ?auto_410932 ) ) ( not ( = ?auto_410929 ?auto_410933 ) ) ( not ( = ?auto_410929 ?auto_410934 ) ) ( not ( = ?auto_410929 ?auto_410935 ) ) ( not ( = ?auto_410929 ?auto_410936 ) ) ( not ( = ?auto_410929 ?auto_410937 ) ) ( not ( = ?auto_410929 ?auto_410938 ) ) ( not ( = ?auto_410929 ?auto_410939 ) ) ( not ( = ?auto_410929 ?auto_410940 ) ) ( not ( = ?auto_410930 ?auto_410931 ) ) ( not ( = ?auto_410930 ?auto_410932 ) ) ( not ( = ?auto_410930 ?auto_410933 ) ) ( not ( = ?auto_410930 ?auto_410934 ) ) ( not ( = ?auto_410930 ?auto_410935 ) ) ( not ( = ?auto_410930 ?auto_410936 ) ) ( not ( = ?auto_410930 ?auto_410937 ) ) ( not ( = ?auto_410930 ?auto_410938 ) ) ( not ( = ?auto_410930 ?auto_410939 ) ) ( not ( = ?auto_410930 ?auto_410940 ) ) ( not ( = ?auto_410931 ?auto_410932 ) ) ( not ( = ?auto_410931 ?auto_410933 ) ) ( not ( = ?auto_410931 ?auto_410934 ) ) ( not ( = ?auto_410931 ?auto_410935 ) ) ( not ( = ?auto_410931 ?auto_410936 ) ) ( not ( = ?auto_410931 ?auto_410937 ) ) ( not ( = ?auto_410931 ?auto_410938 ) ) ( not ( = ?auto_410931 ?auto_410939 ) ) ( not ( = ?auto_410931 ?auto_410940 ) ) ( not ( = ?auto_410932 ?auto_410933 ) ) ( not ( = ?auto_410932 ?auto_410934 ) ) ( not ( = ?auto_410932 ?auto_410935 ) ) ( not ( = ?auto_410932 ?auto_410936 ) ) ( not ( = ?auto_410932 ?auto_410937 ) ) ( not ( = ?auto_410932 ?auto_410938 ) ) ( not ( = ?auto_410932 ?auto_410939 ) ) ( not ( = ?auto_410932 ?auto_410940 ) ) ( not ( = ?auto_410933 ?auto_410934 ) ) ( not ( = ?auto_410933 ?auto_410935 ) ) ( not ( = ?auto_410933 ?auto_410936 ) ) ( not ( = ?auto_410933 ?auto_410937 ) ) ( not ( = ?auto_410933 ?auto_410938 ) ) ( not ( = ?auto_410933 ?auto_410939 ) ) ( not ( = ?auto_410933 ?auto_410940 ) ) ( not ( = ?auto_410934 ?auto_410935 ) ) ( not ( = ?auto_410934 ?auto_410936 ) ) ( not ( = ?auto_410934 ?auto_410937 ) ) ( not ( = ?auto_410934 ?auto_410938 ) ) ( not ( = ?auto_410934 ?auto_410939 ) ) ( not ( = ?auto_410934 ?auto_410940 ) ) ( not ( = ?auto_410935 ?auto_410936 ) ) ( not ( = ?auto_410935 ?auto_410937 ) ) ( not ( = ?auto_410935 ?auto_410938 ) ) ( not ( = ?auto_410935 ?auto_410939 ) ) ( not ( = ?auto_410935 ?auto_410940 ) ) ( not ( = ?auto_410936 ?auto_410937 ) ) ( not ( = ?auto_410936 ?auto_410938 ) ) ( not ( = ?auto_410936 ?auto_410939 ) ) ( not ( = ?auto_410936 ?auto_410940 ) ) ( not ( = ?auto_410937 ?auto_410938 ) ) ( not ( = ?auto_410937 ?auto_410939 ) ) ( not ( = ?auto_410937 ?auto_410940 ) ) ( not ( = ?auto_410938 ?auto_410939 ) ) ( not ( = ?auto_410938 ?auto_410940 ) ) ( not ( = ?auto_410939 ?auto_410940 ) ) ( ON ?auto_410938 ?auto_410939 ) ( ON ?auto_410937 ?auto_410938 ) ( ON ?auto_410936 ?auto_410937 ) ( ON ?auto_410935 ?auto_410936 ) ( ON ?auto_410934 ?auto_410935 ) ( ON ?auto_410933 ?auto_410934 ) ( ON ?auto_410932 ?auto_410933 ) ( ON ?auto_410931 ?auto_410932 ) ( ON ?auto_410930 ?auto_410931 ) ( ON ?auto_410929 ?auto_410930 ) ( CLEAR ?auto_410927 ) ( ON ?auto_410928 ?auto_410929 ) ( CLEAR ?auto_410928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_410927 ?auto_410928 )
      ( MAKE-13PILE ?auto_410927 ?auto_410928 ?auto_410929 ?auto_410930 ?auto_410931 ?auto_410932 ?auto_410933 ?auto_410934 ?auto_410935 ?auto_410936 ?auto_410937 ?auto_410938 ?auto_410939 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410954 - BLOCK
      ?auto_410955 - BLOCK
      ?auto_410956 - BLOCK
      ?auto_410957 - BLOCK
      ?auto_410958 - BLOCK
      ?auto_410959 - BLOCK
      ?auto_410960 - BLOCK
      ?auto_410961 - BLOCK
      ?auto_410962 - BLOCK
      ?auto_410963 - BLOCK
      ?auto_410964 - BLOCK
      ?auto_410965 - BLOCK
      ?auto_410966 - BLOCK
    )
    :vars
    (
      ?auto_410967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410966 ?auto_410967 ) ( ON-TABLE ?auto_410954 ) ( not ( = ?auto_410954 ?auto_410955 ) ) ( not ( = ?auto_410954 ?auto_410956 ) ) ( not ( = ?auto_410954 ?auto_410957 ) ) ( not ( = ?auto_410954 ?auto_410958 ) ) ( not ( = ?auto_410954 ?auto_410959 ) ) ( not ( = ?auto_410954 ?auto_410960 ) ) ( not ( = ?auto_410954 ?auto_410961 ) ) ( not ( = ?auto_410954 ?auto_410962 ) ) ( not ( = ?auto_410954 ?auto_410963 ) ) ( not ( = ?auto_410954 ?auto_410964 ) ) ( not ( = ?auto_410954 ?auto_410965 ) ) ( not ( = ?auto_410954 ?auto_410966 ) ) ( not ( = ?auto_410954 ?auto_410967 ) ) ( not ( = ?auto_410955 ?auto_410956 ) ) ( not ( = ?auto_410955 ?auto_410957 ) ) ( not ( = ?auto_410955 ?auto_410958 ) ) ( not ( = ?auto_410955 ?auto_410959 ) ) ( not ( = ?auto_410955 ?auto_410960 ) ) ( not ( = ?auto_410955 ?auto_410961 ) ) ( not ( = ?auto_410955 ?auto_410962 ) ) ( not ( = ?auto_410955 ?auto_410963 ) ) ( not ( = ?auto_410955 ?auto_410964 ) ) ( not ( = ?auto_410955 ?auto_410965 ) ) ( not ( = ?auto_410955 ?auto_410966 ) ) ( not ( = ?auto_410955 ?auto_410967 ) ) ( not ( = ?auto_410956 ?auto_410957 ) ) ( not ( = ?auto_410956 ?auto_410958 ) ) ( not ( = ?auto_410956 ?auto_410959 ) ) ( not ( = ?auto_410956 ?auto_410960 ) ) ( not ( = ?auto_410956 ?auto_410961 ) ) ( not ( = ?auto_410956 ?auto_410962 ) ) ( not ( = ?auto_410956 ?auto_410963 ) ) ( not ( = ?auto_410956 ?auto_410964 ) ) ( not ( = ?auto_410956 ?auto_410965 ) ) ( not ( = ?auto_410956 ?auto_410966 ) ) ( not ( = ?auto_410956 ?auto_410967 ) ) ( not ( = ?auto_410957 ?auto_410958 ) ) ( not ( = ?auto_410957 ?auto_410959 ) ) ( not ( = ?auto_410957 ?auto_410960 ) ) ( not ( = ?auto_410957 ?auto_410961 ) ) ( not ( = ?auto_410957 ?auto_410962 ) ) ( not ( = ?auto_410957 ?auto_410963 ) ) ( not ( = ?auto_410957 ?auto_410964 ) ) ( not ( = ?auto_410957 ?auto_410965 ) ) ( not ( = ?auto_410957 ?auto_410966 ) ) ( not ( = ?auto_410957 ?auto_410967 ) ) ( not ( = ?auto_410958 ?auto_410959 ) ) ( not ( = ?auto_410958 ?auto_410960 ) ) ( not ( = ?auto_410958 ?auto_410961 ) ) ( not ( = ?auto_410958 ?auto_410962 ) ) ( not ( = ?auto_410958 ?auto_410963 ) ) ( not ( = ?auto_410958 ?auto_410964 ) ) ( not ( = ?auto_410958 ?auto_410965 ) ) ( not ( = ?auto_410958 ?auto_410966 ) ) ( not ( = ?auto_410958 ?auto_410967 ) ) ( not ( = ?auto_410959 ?auto_410960 ) ) ( not ( = ?auto_410959 ?auto_410961 ) ) ( not ( = ?auto_410959 ?auto_410962 ) ) ( not ( = ?auto_410959 ?auto_410963 ) ) ( not ( = ?auto_410959 ?auto_410964 ) ) ( not ( = ?auto_410959 ?auto_410965 ) ) ( not ( = ?auto_410959 ?auto_410966 ) ) ( not ( = ?auto_410959 ?auto_410967 ) ) ( not ( = ?auto_410960 ?auto_410961 ) ) ( not ( = ?auto_410960 ?auto_410962 ) ) ( not ( = ?auto_410960 ?auto_410963 ) ) ( not ( = ?auto_410960 ?auto_410964 ) ) ( not ( = ?auto_410960 ?auto_410965 ) ) ( not ( = ?auto_410960 ?auto_410966 ) ) ( not ( = ?auto_410960 ?auto_410967 ) ) ( not ( = ?auto_410961 ?auto_410962 ) ) ( not ( = ?auto_410961 ?auto_410963 ) ) ( not ( = ?auto_410961 ?auto_410964 ) ) ( not ( = ?auto_410961 ?auto_410965 ) ) ( not ( = ?auto_410961 ?auto_410966 ) ) ( not ( = ?auto_410961 ?auto_410967 ) ) ( not ( = ?auto_410962 ?auto_410963 ) ) ( not ( = ?auto_410962 ?auto_410964 ) ) ( not ( = ?auto_410962 ?auto_410965 ) ) ( not ( = ?auto_410962 ?auto_410966 ) ) ( not ( = ?auto_410962 ?auto_410967 ) ) ( not ( = ?auto_410963 ?auto_410964 ) ) ( not ( = ?auto_410963 ?auto_410965 ) ) ( not ( = ?auto_410963 ?auto_410966 ) ) ( not ( = ?auto_410963 ?auto_410967 ) ) ( not ( = ?auto_410964 ?auto_410965 ) ) ( not ( = ?auto_410964 ?auto_410966 ) ) ( not ( = ?auto_410964 ?auto_410967 ) ) ( not ( = ?auto_410965 ?auto_410966 ) ) ( not ( = ?auto_410965 ?auto_410967 ) ) ( not ( = ?auto_410966 ?auto_410967 ) ) ( ON ?auto_410965 ?auto_410966 ) ( ON ?auto_410964 ?auto_410965 ) ( ON ?auto_410963 ?auto_410964 ) ( ON ?auto_410962 ?auto_410963 ) ( ON ?auto_410961 ?auto_410962 ) ( ON ?auto_410960 ?auto_410961 ) ( ON ?auto_410959 ?auto_410960 ) ( ON ?auto_410958 ?auto_410959 ) ( ON ?auto_410957 ?auto_410958 ) ( ON ?auto_410956 ?auto_410957 ) ( CLEAR ?auto_410954 ) ( ON ?auto_410955 ?auto_410956 ) ( CLEAR ?auto_410955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_410954 ?auto_410955 )
      ( MAKE-13PILE ?auto_410954 ?auto_410955 ?auto_410956 ?auto_410957 ?auto_410958 ?auto_410959 ?auto_410960 ?auto_410961 ?auto_410962 ?auto_410963 ?auto_410964 ?auto_410965 ?auto_410966 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_410981 - BLOCK
      ?auto_410982 - BLOCK
      ?auto_410983 - BLOCK
      ?auto_410984 - BLOCK
      ?auto_410985 - BLOCK
      ?auto_410986 - BLOCK
      ?auto_410987 - BLOCK
      ?auto_410988 - BLOCK
      ?auto_410989 - BLOCK
      ?auto_410990 - BLOCK
      ?auto_410991 - BLOCK
      ?auto_410992 - BLOCK
      ?auto_410993 - BLOCK
    )
    :vars
    (
      ?auto_410994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_410993 ?auto_410994 ) ( not ( = ?auto_410981 ?auto_410982 ) ) ( not ( = ?auto_410981 ?auto_410983 ) ) ( not ( = ?auto_410981 ?auto_410984 ) ) ( not ( = ?auto_410981 ?auto_410985 ) ) ( not ( = ?auto_410981 ?auto_410986 ) ) ( not ( = ?auto_410981 ?auto_410987 ) ) ( not ( = ?auto_410981 ?auto_410988 ) ) ( not ( = ?auto_410981 ?auto_410989 ) ) ( not ( = ?auto_410981 ?auto_410990 ) ) ( not ( = ?auto_410981 ?auto_410991 ) ) ( not ( = ?auto_410981 ?auto_410992 ) ) ( not ( = ?auto_410981 ?auto_410993 ) ) ( not ( = ?auto_410981 ?auto_410994 ) ) ( not ( = ?auto_410982 ?auto_410983 ) ) ( not ( = ?auto_410982 ?auto_410984 ) ) ( not ( = ?auto_410982 ?auto_410985 ) ) ( not ( = ?auto_410982 ?auto_410986 ) ) ( not ( = ?auto_410982 ?auto_410987 ) ) ( not ( = ?auto_410982 ?auto_410988 ) ) ( not ( = ?auto_410982 ?auto_410989 ) ) ( not ( = ?auto_410982 ?auto_410990 ) ) ( not ( = ?auto_410982 ?auto_410991 ) ) ( not ( = ?auto_410982 ?auto_410992 ) ) ( not ( = ?auto_410982 ?auto_410993 ) ) ( not ( = ?auto_410982 ?auto_410994 ) ) ( not ( = ?auto_410983 ?auto_410984 ) ) ( not ( = ?auto_410983 ?auto_410985 ) ) ( not ( = ?auto_410983 ?auto_410986 ) ) ( not ( = ?auto_410983 ?auto_410987 ) ) ( not ( = ?auto_410983 ?auto_410988 ) ) ( not ( = ?auto_410983 ?auto_410989 ) ) ( not ( = ?auto_410983 ?auto_410990 ) ) ( not ( = ?auto_410983 ?auto_410991 ) ) ( not ( = ?auto_410983 ?auto_410992 ) ) ( not ( = ?auto_410983 ?auto_410993 ) ) ( not ( = ?auto_410983 ?auto_410994 ) ) ( not ( = ?auto_410984 ?auto_410985 ) ) ( not ( = ?auto_410984 ?auto_410986 ) ) ( not ( = ?auto_410984 ?auto_410987 ) ) ( not ( = ?auto_410984 ?auto_410988 ) ) ( not ( = ?auto_410984 ?auto_410989 ) ) ( not ( = ?auto_410984 ?auto_410990 ) ) ( not ( = ?auto_410984 ?auto_410991 ) ) ( not ( = ?auto_410984 ?auto_410992 ) ) ( not ( = ?auto_410984 ?auto_410993 ) ) ( not ( = ?auto_410984 ?auto_410994 ) ) ( not ( = ?auto_410985 ?auto_410986 ) ) ( not ( = ?auto_410985 ?auto_410987 ) ) ( not ( = ?auto_410985 ?auto_410988 ) ) ( not ( = ?auto_410985 ?auto_410989 ) ) ( not ( = ?auto_410985 ?auto_410990 ) ) ( not ( = ?auto_410985 ?auto_410991 ) ) ( not ( = ?auto_410985 ?auto_410992 ) ) ( not ( = ?auto_410985 ?auto_410993 ) ) ( not ( = ?auto_410985 ?auto_410994 ) ) ( not ( = ?auto_410986 ?auto_410987 ) ) ( not ( = ?auto_410986 ?auto_410988 ) ) ( not ( = ?auto_410986 ?auto_410989 ) ) ( not ( = ?auto_410986 ?auto_410990 ) ) ( not ( = ?auto_410986 ?auto_410991 ) ) ( not ( = ?auto_410986 ?auto_410992 ) ) ( not ( = ?auto_410986 ?auto_410993 ) ) ( not ( = ?auto_410986 ?auto_410994 ) ) ( not ( = ?auto_410987 ?auto_410988 ) ) ( not ( = ?auto_410987 ?auto_410989 ) ) ( not ( = ?auto_410987 ?auto_410990 ) ) ( not ( = ?auto_410987 ?auto_410991 ) ) ( not ( = ?auto_410987 ?auto_410992 ) ) ( not ( = ?auto_410987 ?auto_410993 ) ) ( not ( = ?auto_410987 ?auto_410994 ) ) ( not ( = ?auto_410988 ?auto_410989 ) ) ( not ( = ?auto_410988 ?auto_410990 ) ) ( not ( = ?auto_410988 ?auto_410991 ) ) ( not ( = ?auto_410988 ?auto_410992 ) ) ( not ( = ?auto_410988 ?auto_410993 ) ) ( not ( = ?auto_410988 ?auto_410994 ) ) ( not ( = ?auto_410989 ?auto_410990 ) ) ( not ( = ?auto_410989 ?auto_410991 ) ) ( not ( = ?auto_410989 ?auto_410992 ) ) ( not ( = ?auto_410989 ?auto_410993 ) ) ( not ( = ?auto_410989 ?auto_410994 ) ) ( not ( = ?auto_410990 ?auto_410991 ) ) ( not ( = ?auto_410990 ?auto_410992 ) ) ( not ( = ?auto_410990 ?auto_410993 ) ) ( not ( = ?auto_410990 ?auto_410994 ) ) ( not ( = ?auto_410991 ?auto_410992 ) ) ( not ( = ?auto_410991 ?auto_410993 ) ) ( not ( = ?auto_410991 ?auto_410994 ) ) ( not ( = ?auto_410992 ?auto_410993 ) ) ( not ( = ?auto_410992 ?auto_410994 ) ) ( not ( = ?auto_410993 ?auto_410994 ) ) ( ON ?auto_410992 ?auto_410993 ) ( ON ?auto_410991 ?auto_410992 ) ( ON ?auto_410990 ?auto_410991 ) ( ON ?auto_410989 ?auto_410990 ) ( ON ?auto_410988 ?auto_410989 ) ( ON ?auto_410987 ?auto_410988 ) ( ON ?auto_410986 ?auto_410987 ) ( ON ?auto_410985 ?auto_410986 ) ( ON ?auto_410984 ?auto_410985 ) ( ON ?auto_410983 ?auto_410984 ) ( ON ?auto_410982 ?auto_410983 ) ( ON ?auto_410981 ?auto_410982 ) ( CLEAR ?auto_410981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_410981 )
      ( MAKE-13PILE ?auto_410981 ?auto_410982 ?auto_410983 ?auto_410984 ?auto_410985 ?auto_410986 ?auto_410987 ?auto_410988 ?auto_410989 ?auto_410990 ?auto_410991 ?auto_410992 ?auto_410993 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_411008 - BLOCK
      ?auto_411009 - BLOCK
      ?auto_411010 - BLOCK
      ?auto_411011 - BLOCK
      ?auto_411012 - BLOCK
      ?auto_411013 - BLOCK
      ?auto_411014 - BLOCK
      ?auto_411015 - BLOCK
      ?auto_411016 - BLOCK
      ?auto_411017 - BLOCK
      ?auto_411018 - BLOCK
      ?auto_411019 - BLOCK
      ?auto_411020 - BLOCK
    )
    :vars
    (
      ?auto_411021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411020 ?auto_411021 ) ( not ( = ?auto_411008 ?auto_411009 ) ) ( not ( = ?auto_411008 ?auto_411010 ) ) ( not ( = ?auto_411008 ?auto_411011 ) ) ( not ( = ?auto_411008 ?auto_411012 ) ) ( not ( = ?auto_411008 ?auto_411013 ) ) ( not ( = ?auto_411008 ?auto_411014 ) ) ( not ( = ?auto_411008 ?auto_411015 ) ) ( not ( = ?auto_411008 ?auto_411016 ) ) ( not ( = ?auto_411008 ?auto_411017 ) ) ( not ( = ?auto_411008 ?auto_411018 ) ) ( not ( = ?auto_411008 ?auto_411019 ) ) ( not ( = ?auto_411008 ?auto_411020 ) ) ( not ( = ?auto_411008 ?auto_411021 ) ) ( not ( = ?auto_411009 ?auto_411010 ) ) ( not ( = ?auto_411009 ?auto_411011 ) ) ( not ( = ?auto_411009 ?auto_411012 ) ) ( not ( = ?auto_411009 ?auto_411013 ) ) ( not ( = ?auto_411009 ?auto_411014 ) ) ( not ( = ?auto_411009 ?auto_411015 ) ) ( not ( = ?auto_411009 ?auto_411016 ) ) ( not ( = ?auto_411009 ?auto_411017 ) ) ( not ( = ?auto_411009 ?auto_411018 ) ) ( not ( = ?auto_411009 ?auto_411019 ) ) ( not ( = ?auto_411009 ?auto_411020 ) ) ( not ( = ?auto_411009 ?auto_411021 ) ) ( not ( = ?auto_411010 ?auto_411011 ) ) ( not ( = ?auto_411010 ?auto_411012 ) ) ( not ( = ?auto_411010 ?auto_411013 ) ) ( not ( = ?auto_411010 ?auto_411014 ) ) ( not ( = ?auto_411010 ?auto_411015 ) ) ( not ( = ?auto_411010 ?auto_411016 ) ) ( not ( = ?auto_411010 ?auto_411017 ) ) ( not ( = ?auto_411010 ?auto_411018 ) ) ( not ( = ?auto_411010 ?auto_411019 ) ) ( not ( = ?auto_411010 ?auto_411020 ) ) ( not ( = ?auto_411010 ?auto_411021 ) ) ( not ( = ?auto_411011 ?auto_411012 ) ) ( not ( = ?auto_411011 ?auto_411013 ) ) ( not ( = ?auto_411011 ?auto_411014 ) ) ( not ( = ?auto_411011 ?auto_411015 ) ) ( not ( = ?auto_411011 ?auto_411016 ) ) ( not ( = ?auto_411011 ?auto_411017 ) ) ( not ( = ?auto_411011 ?auto_411018 ) ) ( not ( = ?auto_411011 ?auto_411019 ) ) ( not ( = ?auto_411011 ?auto_411020 ) ) ( not ( = ?auto_411011 ?auto_411021 ) ) ( not ( = ?auto_411012 ?auto_411013 ) ) ( not ( = ?auto_411012 ?auto_411014 ) ) ( not ( = ?auto_411012 ?auto_411015 ) ) ( not ( = ?auto_411012 ?auto_411016 ) ) ( not ( = ?auto_411012 ?auto_411017 ) ) ( not ( = ?auto_411012 ?auto_411018 ) ) ( not ( = ?auto_411012 ?auto_411019 ) ) ( not ( = ?auto_411012 ?auto_411020 ) ) ( not ( = ?auto_411012 ?auto_411021 ) ) ( not ( = ?auto_411013 ?auto_411014 ) ) ( not ( = ?auto_411013 ?auto_411015 ) ) ( not ( = ?auto_411013 ?auto_411016 ) ) ( not ( = ?auto_411013 ?auto_411017 ) ) ( not ( = ?auto_411013 ?auto_411018 ) ) ( not ( = ?auto_411013 ?auto_411019 ) ) ( not ( = ?auto_411013 ?auto_411020 ) ) ( not ( = ?auto_411013 ?auto_411021 ) ) ( not ( = ?auto_411014 ?auto_411015 ) ) ( not ( = ?auto_411014 ?auto_411016 ) ) ( not ( = ?auto_411014 ?auto_411017 ) ) ( not ( = ?auto_411014 ?auto_411018 ) ) ( not ( = ?auto_411014 ?auto_411019 ) ) ( not ( = ?auto_411014 ?auto_411020 ) ) ( not ( = ?auto_411014 ?auto_411021 ) ) ( not ( = ?auto_411015 ?auto_411016 ) ) ( not ( = ?auto_411015 ?auto_411017 ) ) ( not ( = ?auto_411015 ?auto_411018 ) ) ( not ( = ?auto_411015 ?auto_411019 ) ) ( not ( = ?auto_411015 ?auto_411020 ) ) ( not ( = ?auto_411015 ?auto_411021 ) ) ( not ( = ?auto_411016 ?auto_411017 ) ) ( not ( = ?auto_411016 ?auto_411018 ) ) ( not ( = ?auto_411016 ?auto_411019 ) ) ( not ( = ?auto_411016 ?auto_411020 ) ) ( not ( = ?auto_411016 ?auto_411021 ) ) ( not ( = ?auto_411017 ?auto_411018 ) ) ( not ( = ?auto_411017 ?auto_411019 ) ) ( not ( = ?auto_411017 ?auto_411020 ) ) ( not ( = ?auto_411017 ?auto_411021 ) ) ( not ( = ?auto_411018 ?auto_411019 ) ) ( not ( = ?auto_411018 ?auto_411020 ) ) ( not ( = ?auto_411018 ?auto_411021 ) ) ( not ( = ?auto_411019 ?auto_411020 ) ) ( not ( = ?auto_411019 ?auto_411021 ) ) ( not ( = ?auto_411020 ?auto_411021 ) ) ( ON ?auto_411019 ?auto_411020 ) ( ON ?auto_411018 ?auto_411019 ) ( ON ?auto_411017 ?auto_411018 ) ( ON ?auto_411016 ?auto_411017 ) ( ON ?auto_411015 ?auto_411016 ) ( ON ?auto_411014 ?auto_411015 ) ( ON ?auto_411013 ?auto_411014 ) ( ON ?auto_411012 ?auto_411013 ) ( ON ?auto_411011 ?auto_411012 ) ( ON ?auto_411010 ?auto_411011 ) ( ON ?auto_411009 ?auto_411010 ) ( ON ?auto_411008 ?auto_411009 ) ( CLEAR ?auto_411008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_411008 )
      ( MAKE-13PILE ?auto_411008 ?auto_411009 ?auto_411010 ?auto_411011 ?auto_411012 ?auto_411013 ?auto_411014 ?auto_411015 ?auto_411016 ?auto_411017 ?auto_411018 ?auto_411019 ?auto_411020 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411036 - BLOCK
      ?auto_411037 - BLOCK
      ?auto_411038 - BLOCK
      ?auto_411039 - BLOCK
      ?auto_411040 - BLOCK
      ?auto_411041 - BLOCK
      ?auto_411042 - BLOCK
      ?auto_411043 - BLOCK
      ?auto_411044 - BLOCK
      ?auto_411045 - BLOCK
      ?auto_411046 - BLOCK
      ?auto_411047 - BLOCK
      ?auto_411048 - BLOCK
      ?auto_411049 - BLOCK
    )
    :vars
    (
      ?auto_411050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_411048 ) ( ON ?auto_411049 ?auto_411050 ) ( CLEAR ?auto_411049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_411036 ) ( ON ?auto_411037 ?auto_411036 ) ( ON ?auto_411038 ?auto_411037 ) ( ON ?auto_411039 ?auto_411038 ) ( ON ?auto_411040 ?auto_411039 ) ( ON ?auto_411041 ?auto_411040 ) ( ON ?auto_411042 ?auto_411041 ) ( ON ?auto_411043 ?auto_411042 ) ( ON ?auto_411044 ?auto_411043 ) ( ON ?auto_411045 ?auto_411044 ) ( ON ?auto_411046 ?auto_411045 ) ( ON ?auto_411047 ?auto_411046 ) ( ON ?auto_411048 ?auto_411047 ) ( not ( = ?auto_411036 ?auto_411037 ) ) ( not ( = ?auto_411036 ?auto_411038 ) ) ( not ( = ?auto_411036 ?auto_411039 ) ) ( not ( = ?auto_411036 ?auto_411040 ) ) ( not ( = ?auto_411036 ?auto_411041 ) ) ( not ( = ?auto_411036 ?auto_411042 ) ) ( not ( = ?auto_411036 ?auto_411043 ) ) ( not ( = ?auto_411036 ?auto_411044 ) ) ( not ( = ?auto_411036 ?auto_411045 ) ) ( not ( = ?auto_411036 ?auto_411046 ) ) ( not ( = ?auto_411036 ?auto_411047 ) ) ( not ( = ?auto_411036 ?auto_411048 ) ) ( not ( = ?auto_411036 ?auto_411049 ) ) ( not ( = ?auto_411036 ?auto_411050 ) ) ( not ( = ?auto_411037 ?auto_411038 ) ) ( not ( = ?auto_411037 ?auto_411039 ) ) ( not ( = ?auto_411037 ?auto_411040 ) ) ( not ( = ?auto_411037 ?auto_411041 ) ) ( not ( = ?auto_411037 ?auto_411042 ) ) ( not ( = ?auto_411037 ?auto_411043 ) ) ( not ( = ?auto_411037 ?auto_411044 ) ) ( not ( = ?auto_411037 ?auto_411045 ) ) ( not ( = ?auto_411037 ?auto_411046 ) ) ( not ( = ?auto_411037 ?auto_411047 ) ) ( not ( = ?auto_411037 ?auto_411048 ) ) ( not ( = ?auto_411037 ?auto_411049 ) ) ( not ( = ?auto_411037 ?auto_411050 ) ) ( not ( = ?auto_411038 ?auto_411039 ) ) ( not ( = ?auto_411038 ?auto_411040 ) ) ( not ( = ?auto_411038 ?auto_411041 ) ) ( not ( = ?auto_411038 ?auto_411042 ) ) ( not ( = ?auto_411038 ?auto_411043 ) ) ( not ( = ?auto_411038 ?auto_411044 ) ) ( not ( = ?auto_411038 ?auto_411045 ) ) ( not ( = ?auto_411038 ?auto_411046 ) ) ( not ( = ?auto_411038 ?auto_411047 ) ) ( not ( = ?auto_411038 ?auto_411048 ) ) ( not ( = ?auto_411038 ?auto_411049 ) ) ( not ( = ?auto_411038 ?auto_411050 ) ) ( not ( = ?auto_411039 ?auto_411040 ) ) ( not ( = ?auto_411039 ?auto_411041 ) ) ( not ( = ?auto_411039 ?auto_411042 ) ) ( not ( = ?auto_411039 ?auto_411043 ) ) ( not ( = ?auto_411039 ?auto_411044 ) ) ( not ( = ?auto_411039 ?auto_411045 ) ) ( not ( = ?auto_411039 ?auto_411046 ) ) ( not ( = ?auto_411039 ?auto_411047 ) ) ( not ( = ?auto_411039 ?auto_411048 ) ) ( not ( = ?auto_411039 ?auto_411049 ) ) ( not ( = ?auto_411039 ?auto_411050 ) ) ( not ( = ?auto_411040 ?auto_411041 ) ) ( not ( = ?auto_411040 ?auto_411042 ) ) ( not ( = ?auto_411040 ?auto_411043 ) ) ( not ( = ?auto_411040 ?auto_411044 ) ) ( not ( = ?auto_411040 ?auto_411045 ) ) ( not ( = ?auto_411040 ?auto_411046 ) ) ( not ( = ?auto_411040 ?auto_411047 ) ) ( not ( = ?auto_411040 ?auto_411048 ) ) ( not ( = ?auto_411040 ?auto_411049 ) ) ( not ( = ?auto_411040 ?auto_411050 ) ) ( not ( = ?auto_411041 ?auto_411042 ) ) ( not ( = ?auto_411041 ?auto_411043 ) ) ( not ( = ?auto_411041 ?auto_411044 ) ) ( not ( = ?auto_411041 ?auto_411045 ) ) ( not ( = ?auto_411041 ?auto_411046 ) ) ( not ( = ?auto_411041 ?auto_411047 ) ) ( not ( = ?auto_411041 ?auto_411048 ) ) ( not ( = ?auto_411041 ?auto_411049 ) ) ( not ( = ?auto_411041 ?auto_411050 ) ) ( not ( = ?auto_411042 ?auto_411043 ) ) ( not ( = ?auto_411042 ?auto_411044 ) ) ( not ( = ?auto_411042 ?auto_411045 ) ) ( not ( = ?auto_411042 ?auto_411046 ) ) ( not ( = ?auto_411042 ?auto_411047 ) ) ( not ( = ?auto_411042 ?auto_411048 ) ) ( not ( = ?auto_411042 ?auto_411049 ) ) ( not ( = ?auto_411042 ?auto_411050 ) ) ( not ( = ?auto_411043 ?auto_411044 ) ) ( not ( = ?auto_411043 ?auto_411045 ) ) ( not ( = ?auto_411043 ?auto_411046 ) ) ( not ( = ?auto_411043 ?auto_411047 ) ) ( not ( = ?auto_411043 ?auto_411048 ) ) ( not ( = ?auto_411043 ?auto_411049 ) ) ( not ( = ?auto_411043 ?auto_411050 ) ) ( not ( = ?auto_411044 ?auto_411045 ) ) ( not ( = ?auto_411044 ?auto_411046 ) ) ( not ( = ?auto_411044 ?auto_411047 ) ) ( not ( = ?auto_411044 ?auto_411048 ) ) ( not ( = ?auto_411044 ?auto_411049 ) ) ( not ( = ?auto_411044 ?auto_411050 ) ) ( not ( = ?auto_411045 ?auto_411046 ) ) ( not ( = ?auto_411045 ?auto_411047 ) ) ( not ( = ?auto_411045 ?auto_411048 ) ) ( not ( = ?auto_411045 ?auto_411049 ) ) ( not ( = ?auto_411045 ?auto_411050 ) ) ( not ( = ?auto_411046 ?auto_411047 ) ) ( not ( = ?auto_411046 ?auto_411048 ) ) ( not ( = ?auto_411046 ?auto_411049 ) ) ( not ( = ?auto_411046 ?auto_411050 ) ) ( not ( = ?auto_411047 ?auto_411048 ) ) ( not ( = ?auto_411047 ?auto_411049 ) ) ( not ( = ?auto_411047 ?auto_411050 ) ) ( not ( = ?auto_411048 ?auto_411049 ) ) ( not ( = ?auto_411048 ?auto_411050 ) ) ( not ( = ?auto_411049 ?auto_411050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_411049 ?auto_411050 )
      ( !STACK ?auto_411049 ?auto_411048 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411065 - BLOCK
      ?auto_411066 - BLOCK
      ?auto_411067 - BLOCK
      ?auto_411068 - BLOCK
      ?auto_411069 - BLOCK
      ?auto_411070 - BLOCK
      ?auto_411071 - BLOCK
      ?auto_411072 - BLOCK
      ?auto_411073 - BLOCK
      ?auto_411074 - BLOCK
      ?auto_411075 - BLOCK
      ?auto_411076 - BLOCK
      ?auto_411077 - BLOCK
      ?auto_411078 - BLOCK
    )
    :vars
    (
      ?auto_411079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_411077 ) ( ON ?auto_411078 ?auto_411079 ) ( CLEAR ?auto_411078 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_411065 ) ( ON ?auto_411066 ?auto_411065 ) ( ON ?auto_411067 ?auto_411066 ) ( ON ?auto_411068 ?auto_411067 ) ( ON ?auto_411069 ?auto_411068 ) ( ON ?auto_411070 ?auto_411069 ) ( ON ?auto_411071 ?auto_411070 ) ( ON ?auto_411072 ?auto_411071 ) ( ON ?auto_411073 ?auto_411072 ) ( ON ?auto_411074 ?auto_411073 ) ( ON ?auto_411075 ?auto_411074 ) ( ON ?auto_411076 ?auto_411075 ) ( ON ?auto_411077 ?auto_411076 ) ( not ( = ?auto_411065 ?auto_411066 ) ) ( not ( = ?auto_411065 ?auto_411067 ) ) ( not ( = ?auto_411065 ?auto_411068 ) ) ( not ( = ?auto_411065 ?auto_411069 ) ) ( not ( = ?auto_411065 ?auto_411070 ) ) ( not ( = ?auto_411065 ?auto_411071 ) ) ( not ( = ?auto_411065 ?auto_411072 ) ) ( not ( = ?auto_411065 ?auto_411073 ) ) ( not ( = ?auto_411065 ?auto_411074 ) ) ( not ( = ?auto_411065 ?auto_411075 ) ) ( not ( = ?auto_411065 ?auto_411076 ) ) ( not ( = ?auto_411065 ?auto_411077 ) ) ( not ( = ?auto_411065 ?auto_411078 ) ) ( not ( = ?auto_411065 ?auto_411079 ) ) ( not ( = ?auto_411066 ?auto_411067 ) ) ( not ( = ?auto_411066 ?auto_411068 ) ) ( not ( = ?auto_411066 ?auto_411069 ) ) ( not ( = ?auto_411066 ?auto_411070 ) ) ( not ( = ?auto_411066 ?auto_411071 ) ) ( not ( = ?auto_411066 ?auto_411072 ) ) ( not ( = ?auto_411066 ?auto_411073 ) ) ( not ( = ?auto_411066 ?auto_411074 ) ) ( not ( = ?auto_411066 ?auto_411075 ) ) ( not ( = ?auto_411066 ?auto_411076 ) ) ( not ( = ?auto_411066 ?auto_411077 ) ) ( not ( = ?auto_411066 ?auto_411078 ) ) ( not ( = ?auto_411066 ?auto_411079 ) ) ( not ( = ?auto_411067 ?auto_411068 ) ) ( not ( = ?auto_411067 ?auto_411069 ) ) ( not ( = ?auto_411067 ?auto_411070 ) ) ( not ( = ?auto_411067 ?auto_411071 ) ) ( not ( = ?auto_411067 ?auto_411072 ) ) ( not ( = ?auto_411067 ?auto_411073 ) ) ( not ( = ?auto_411067 ?auto_411074 ) ) ( not ( = ?auto_411067 ?auto_411075 ) ) ( not ( = ?auto_411067 ?auto_411076 ) ) ( not ( = ?auto_411067 ?auto_411077 ) ) ( not ( = ?auto_411067 ?auto_411078 ) ) ( not ( = ?auto_411067 ?auto_411079 ) ) ( not ( = ?auto_411068 ?auto_411069 ) ) ( not ( = ?auto_411068 ?auto_411070 ) ) ( not ( = ?auto_411068 ?auto_411071 ) ) ( not ( = ?auto_411068 ?auto_411072 ) ) ( not ( = ?auto_411068 ?auto_411073 ) ) ( not ( = ?auto_411068 ?auto_411074 ) ) ( not ( = ?auto_411068 ?auto_411075 ) ) ( not ( = ?auto_411068 ?auto_411076 ) ) ( not ( = ?auto_411068 ?auto_411077 ) ) ( not ( = ?auto_411068 ?auto_411078 ) ) ( not ( = ?auto_411068 ?auto_411079 ) ) ( not ( = ?auto_411069 ?auto_411070 ) ) ( not ( = ?auto_411069 ?auto_411071 ) ) ( not ( = ?auto_411069 ?auto_411072 ) ) ( not ( = ?auto_411069 ?auto_411073 ) ) ( not ( = ?auto_411069 ?auto_411074 ) ) ( not ( = ?auto_411069 ?auto_411075 ) ) ( not ( = ?auto_411069 ?auto_411076 ) ) ( not ( = ?auto_411069 ?auto_411077 ) ) ( not ( = ?auto_411069 ?auto_411078 ) ) ( not ( = ?auto_411069 ?auto_411079 ) ) ( not ( = ?auto_411070 ?auto_411071 ) ) ( not ( = ?auto_411070 ?auto_411072 ) ) ( not ( = ?auto_411070 ?auto_411073 ) ) ( not ( = ?auto_411070 ?auto_411074 ) ) ( not ( = ?auto_411070 ?auto_411075 ) ) ( not ( = ?auto_411070 ?auto_411076 ) ) ( not ( = ?auto_411070 ?auto_411077 ) ) ( not ( = ?auto_411070 ?auto_411078 ) ) ( not ( = ?auto_411070 ?auto_411079 ) ) ( not ( = ?auto_411071 ?auto_411072 ) ) ( not ( = ?auto_411071 ?auto_411073 ) ) ( not ( = ?auto_411071 ?auto_411074 ) ) ( not ( = ?auto_411071 ?auto_411075 ) ) ( not ( = ?auto_411071 ?auto_411076 ) ) ( not ( = ?auto_411071 ?auto_411077 ) ) ( not ( = ?auto_411071 ?auto_411078 ) ) ( not ( = ?auto_411071 ?auto_411079 ) ) ( not ( = ?auto_411072 ?auto_411073 ) ) ( not ( = ?auto_411072 ?auto_411074 ) ) ( not ( = ?auto_411072 ?auto_411075 ) ) ( not ( = ?auto_411072 ?auto_411076 ) ) ( not ( = ?auto_411072 ?auto_411077 ) ) ( not ( = ?auto_411072 ?auto_411078 ) ) ( not ( = ?auto_411072 ?auto_411079 ) ) ( not ( = ?auto_411073 ?auto_411074 ) ) ( not ( = ?auto_411073 ?auto_411075 ) ) ( not ( = ?auto_411073 ?auto_411076 ) ) ( not ( = ?auto_411073 ?auto_411077 ) ) ( not ( = ?auto_411073 ?auto_411078 ) ) ( not ( = ?auto_411073 ?auto_411079 ) ) ( not ( = ?auto_411074 ?auto_411075 ) ) ( not ( = ?auto_411074 ?auto_411076 ) ) ( not ( = ?auto_411074 ?auto_411077 ) ) ( not ( = ?auto_411074 ?auto_411078 ) ) ( not ( = ?auto_411074 ?auto_411079 ) ) ( not ( = ?auto_411075 ?auto_411076 ) ) ( not ( = ?auto_411075 ?auto_411077 ) ) ( not ( = ?auto_411075 ?auto_411078 ) ) ( not ( = ?auto_411075 ?auto_411079 ) ) ( not ( = ?auto_411076 ?auto_411077 ) ) ( not ( = ?auto_411076 ?auto_411078 ) ) ( not ( = ?auto_411076 ?auto_411079 ) ) ( not ( = ?auto_411077 ?auto_411078 ) ) ( not ( = ?auto_411077 ?auto_411079 ) ) ( not ( = ?auto_411078 ?auto_411079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_411078 ?auto_411079 )
      ( !STACK ?auto_411078 ?auto_411077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411094 - BLOCK
      ?auto_411095 - BLOCK
      ?auto_411096 - BLOCK
      ?auto_411097 - BLOCK
      ?auto_411098 - BLOCK
      ?auto_411099 - BLOCK
      ?auto_411100 - BLOCK
      ?auto_411101 - BLOCK
      ?auto_411102 - BLOCK
      ?auto_411103 - BLOCK
      ?auto_411104 - BLOCK
      ?auto_411105 - BLOCK
      ?auto_411106 - BLOCK
      ?auto_411107 - BLOCK
    )
    :vars
    (
      ?auto_411108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411107 ?auto_411108 ) ( ON-TABLE ?auto_411094 ) ( ON ?auto_411095 ?auto_411094 ) ( ON ?auto_411096 ?auto_411095 ) ( ON ?auto_411097 ?auto_411096 ) ( ON ?auto_411098 ?auto_411097 ) ( ON ?auto_411099 ?auto_411098 ) ( ON ?auto_411100 ?auto_411099 ) ( ON ?auto_411101 ?auto_411100 ) ( ON ?auto_411102 ?auto_411101 ) ( ON ?auto_411103 ?auto_411102 ) ( ON ?auto_411104 ?auto_411103 ) ( ON ?auto_411105 ?auto_411104 ) ( not ( = ?auto_411094 ?auto_411095 ) ) ( not ( = ?auto_411094 ?auto_411096 ) ) ( not ( = ?auto_411094 ?auto_411097 ) ) ( not ( = ?auto_411094 ?auto_411098 ) ) ( not ( = ?auto_411094 ?auto_411099 ) ) ( not ( = ?auto_411094 ?auto_411100 ) ) ( not ( = ?auto_411094 ?auto_411101 ) ) ( not ( = ?auto_411094 ?auto_411102 ) ) ( not ( = ?auto_411094 ?auto_411103 ) ) ( not ( = ?auto_411094 ?auto_411104 ) ) ( not ( = ?auto_411094 ?auto_411105 ) ) ( not ( = ?auto_411094 ?auto_411106 ) ) ( not ( = ?auto_411094 ?auto_411107 ) ) ( not ( = ?auto_411094 ?auto_411108 ) ) ( not ( = ?auto_411095 ?auto_411096 ) ) ( not ( = ?auto_411095 ?auto_411097 ) ) ( not ( = ?auto_411095 ?auto_411098 ) ) ( not ( = ?auto_411095 ?auto_411099 ) ) ( not ( = ?auto_411095 ?auto_411100 ) ) ( not ( = ?auto_411095 ?auto_411101 ) ) ( not ( = ?auto_411095 ?auto_411102 ) ) ( not ( = ?auto_411095 ?auto_411103 ) ) ( not ( = ?auto_411095 ?auto_411104 ) ) ( not ( = ?auto_411095 ?auto_411105 ) ) ( not ( = ?auto_411095 ?auto_411106 ) ) ( not ( = ?auto_411095 ?auto_411107 ) ) ( not ( = ?auto_411095 ?auto_411108 ) ) ( not ( = ?auto_411096 ?auto_411097 ) ) ( not ( = ?auto_411096 ?auto_411098 ) ) ( not ( = ?auto_411096 ?auto_411099 ) ) ( not ( = ?auto_411096 ?auto_411100 ) ) ( not ( = ?auto_411096 ?auto_411101 ) ) ( not ( = ?auto_411096 ?auto_411102 ) ) ( not ( = ?auto_411096 ?auto_411103 ) ) ( not ( = ?auto_411096 ?auto_411104 ) ) ( not ( = ?auto_411096 ?auto_411105 ) ) ( not ( = ?auto_411096 ?auto_411106 ) ) ( not ( = ?auto_411096 ?auto_411107 ) ) ( not ( = ?auto_411096 ?auto_411108 ) ) ( not ( = ?auto_411097 ?auto_411098 ) ) ( not ( = ?auto_411097 ?auto_411099 ) ) ( not ( = ?auto_411097 ?auto_411100 ) ) ( not ( = ?auto_411097 ?auto_411101 ) ) ( not ( = ?auto_411097 ?auto_411102 ) ) ( not ( = ?auto_411097 ?auto_411103 ) ) ( not ( = ?auto_411097 ?auto_411104 ) ) ( not ( = ?auto_411097 ?auto_411105 ) ) ( not ( = ?auto_411097 ?auto_411106 ) ) ( not ( = ?auto_411097 ?auto_411107 ) ) ( not ( = ?auto_411097 ?auto_411108 ) ) ( not ( = ?auto_411098 ?auto_411099 ) ) ( not ( = ?auto_411098 ?auto_411100 ) ) ( not ( = ?auto_411098 ?auto_411101 ) ) ( not ( = ?auto_411098 ?auto_411102 ) ) ( not ( = ?auto_411098 ?auto_411103 ) ) ( not ( = ?auto_411098 ?auto_411104 ) ) ( not ( = ?auto_411098 ?auto_411105 ) ) ( not ( = ?auto_411098 ?auto_411106 ) ) ( not ( = ?auto_411098 ?auto_411107 ) ) ( not ( = ?auto_411098 ?auto_411108 ) ) ( not ( = ?auto_411099 ?auto_411100 ) ) ( not ( = ?auto_411099 ?auto_411101 ) ) ( not ( = ?auto_411099 ?auto_411102 ) ) ( not ( = ?auto_411099 ?auto_411103 ) ) ( not ( = ?auto_411099 ?auto_411104 ) ) ( not ( = ?auto_411099 ?auto_411105 ) ) ( not ( = ?auto_411099 ?auto_411106 ) ) ( not ( = ?auto_411099 ?auto_411107 ) ) ( not ( = ?auto_411099 ?auto_411108 ) ) ( not ( = ?auto_411100 ?auto_411101 ) ) ( not ( = ?auto_411100 ?auto_411102 ) ) ( not ( = ?auto_411100 ?auto_411103 ) ) ( not ( = ?auto_411100 ?auto_411104 ) ) ( not ( = ?auto_411100 ?auto_411105 ) ) ( not ( = ?auto_411100 ?auto_411106 ) ) ( not ( = ?auto_411100 ?auto_411107 ) ) ( not ( = ?auto_411100 ?auto_411108 ) ) ( not ( = ?auto_411101 ?auto_411102 ) ) ( not ( = ?auto_411101 ?auto_411103 ) ) ( not ( = ?auto_411101 ?auto_411104 ) ) ( not ( = ?auto_411101 ?auto_411105 ) ) ( not ( = ?auto_411101 ?auto_411106 ) ) ( not ( = ?auto_411101 ?auto_411107 ) ) ( not ( = ?auto_411101 ?auto_411108 ) ) ( not ( = ?auto_411102 ?auto_411103 ) ) ( not ( = ?auto_411102 ?auto_411104 ) ) ( not ( = ?auto_411102 ?auto_411105 ) ) ( not ( = ?auto_411102 ?auto_411106 ) ) ( not ( = ?auto_411102 ?auto_411107 ) ) ( not ( = ?auto_411102 ?auto_411108 ) ) ( not ( = ?auto_411103 ?auto_411104 ) ) ( not ( = ?auto_411103 ?auto_411105 ) ) ( not ( = ?auto_411103 ?auto_411106 ) ) ( not ( = ?auto_411103 ?auto_411107 ) ) ( not ( = ?auto_411103 ?auto_411108 ) ) ( not ( = ?auto_411104 ?auto_411105 ) ) ( not ( = ?auto_411104 ?auto_411106 ) ) ( not ( = ?auto_411104 ?auto_411107 ) ) ( not ( = ?auto_411104 ?auto_411108 ) ) ( not ( = ?auto_411105 ?auto_411106 ) ) ( not ( = ?auto_411105 ?auto_411107 ) ) ( not ( = ?auto_411105 ?auto_411108 ) ) ( not ( = ?auto_411106 ?auto_411107 ) ) ( not ( = ?auto_411106 ?auto_411108 ) ) ( not ( = ?auto_411107 ?auto_411108 ) ) ( CLEAR ?auto_411105 ) ( ON ?auto_411106 ?auto_411107 ) ( CLEAR ?auto_411106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_411094 ?auto_411095 ?auto_411096 ?auto_411097 ?auto_411098 ?auto_411099 ?auto_411100 ?auto_411101 ?auto_411102 ?auto_411103 ?auto_411104 ?auto_411105 ?auto_411106 )
      ( MAKE-14PILE ?auto_411094 ?auto_411095 ?auto_411096 ?auto_411097 ?auto_411098 ?auto_411099 ?auto_411100 ?auto_411101 ?auto_411102 ?auto_411103 ?auto_411104 ?auto_411105 ?auto_411106 ?auto_411107 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411123 - BLOCK
      ?auto_411124 - BLOCK
      ?auto_411125 - BLOCK
      ?auto_411126 - BLOCK
      ?auto_411127 - BLOCK
      ?auto_411128 - BLOCK
      ?auto_411129 - BLOCK
      ?auto_411130 - BLOCK
      ?auto_411131 - BLOCK
      ?auto_411132 - BLOCK
      ?auto_411133 - BLOCK
      ?auto_411134 - BLOCK
      ?auto_411135 - BLOCK
      ?auto_411136 - BLOCK
    )
    :vars
    (
      ?auto_411137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411136 ?auto_411137 ) ( ON-TABLE ?auto_411123 ) ( ON ?auto_411124 ?auto_411123 ) ( ON ?auto_411125 ?auto_411124 ) ( ON ?auto_411126 ?auto_411125 ) ( ON ?auto_411127 ?auto_411126 ) ( ON ?auto_411128 ?auto_411127 ) ( ON ?auto_411129 ?auto_411128 ) ( ON ?auto_411130 ?auto_411129 ) ( ON ?auto_411131 ?auto_411130 ) ( ON ?auto_411132 ?auto_411131 ) ( ON ?auto_411133 ?auto_411132 ) ( ON ?auto_411134 ?auto_411133 ) ( not ( = ?auto_411123 ?auto_411124 ) ) ( not ( = ?auto_411123 ?auto_411125 ) ) ( not ( = ?auto_411123 ?auto_411126 ) ) ( not ( = ?auto_411123 ?auto_411127 ) ) ( not ( = ?auto_411123 ?auto_411128 ) ) ( not ( = ?auto_411123 ?auto_411129 ) ) ( not ( = ?auto_411123 ?auto_411130 ) ) ( not ( = ?auto_411123 ?auto_411131 ) ) ( not ( = ?auto_411123 ?auto_411132 ) ) ( not ( = ?auto_411123 ?auto_411133 ) ) ( not ( = ?auto_411123 ?auto_411134 ) ) ( not ( = ?auto_411123 ?auto_411135 ) ) ( not ( = ?auto_411123 ?auto_411136 ) ) ( not ( = ?auto_411123 ?auto_411137 ) ) ( not ( = ?auto_411124 ?auto_411125 ) ) ( not ( = ?auto_411124 ?auto_411126 ) ) ( not ( = ?auto_411124 ?auto_411127 ) ) ( not ( = ?auto_411124 ?auto_411128 ) ) ( not ( = ?auto_411124 ?auto_411129 ) ) ( not ( = ?auto_411124 ?auto_411130 ) ) ( not ( = ?auto_411124 ?auto_411131 ) ) ( not ( = ?auto_411124 ?auto_411132 ) ) ( not ( = ?auto_411124 ?auto_411133 ) ) ( not ( = ?auto_411124 ?auto_411134 ) ) ( not ( = ?auto_411124 ?auto_411135 ) ) ( not ( = ?auto_411124 ?auto_411136 ) ) ( not ( = ?auto_411124 ?auto_411137 ) ) ( not ( = ?auto_411125 ?auto_411126 ) ) ( not ( = ?auto_411125 ?auto_411127 ) ) ( not ( = ?auto_411125 ?auto_411128 ) ) ( not ( = ?auto_411125 ?auto_411129 ) ) ( not ( = ?auto_411125 ?auto_411130 ) ) ( not ( = ?auto_411125 ?auto_411131 ) ) ( not ( = ?auto_411125 ?auto_411132 ) ) ( not ( = ?auto_411125 ?auto_411133 ) ) ( not ( = ?auto_411125 ?auto_411134 ) ) ( not ( = ?auto_411125 ?auto_411135 ) ) ( not ( = ?auto_411125 ?auto_411136 ) ) ( not ( = ?auto_411125 ?auto_411137 ) ) ( not ( = ?auto_411126 ?auto_411127 ) ) ( not ( = ?auto_411126 ?auto_411128 ) ) ( not ( = ?auto_411126 ?auto_411129 ) ) ( not ( = ?auto_411126 ?auto_411130 ) ) ( not ( = ?auto_411126 ?auto_411131 ) ) ( not ( = ?auto_411126 ?auto_411132 ) ) ( not ( = ?auto_411126 ?auto_411133 ) ) ( not ( = ?auto_411126 ?auto_411134 ) ) ( not ( = ?auto_411126 ?auto_411135 ) ) ( not ( = ?auto_411126 ?auto_411136 ) ) ( not ( = ?auto_411126 ?auto_411137 ) ) ( not ( = ?auto_411127 ?auto_411128 ) ) ( not ( = ?auto_411127 ?auto_411129 ) ) ( not ( = ?auto_411127 ?auto_411130 ) ) ( not ( = ?auto_411127 ?auto_411131 ) ) ( not ( = ?auto_411127 ?auto_411132 ) ) ( not ( = ?auto_411127 ?auto_411133 ) ) ( not ( = ?auto_411127 ?auto_411134 ) ) ( not ( = ?auto_411127 ?auto_411135 ) ) ( not ( = ?auto_411127 ?auto_411136 ) ) ( not ( = ?auto_411127 ?auto_411137 ) ) ( not ( = ?auto_411128 ?auto_411129 ) ) ( not ( = ?auto_411128 ?auto_411130 ) ) ( not ( = ?auto_411128 ?auto_411131 ) ) ( not ( = ?auto_411128 ?auto_411132 ) ) ( not ( = ?auto_411128 ?auto_411133 ) ) ( not ( = ?auto_411128 ?auto_411134 ) ) ( not ( = ?auto_411128 ?auto_411135 ) ) ( not ( = ?auto_411128 ?auto_411136 ) ) ( not ( = ?auto_411128 ?auto_411137 ) ) ( not ( = ?auto_411129 ?auto_411130 ) ) ( not ( = ?auto_411129 ?auto_411131 ) ) ( not ( = ?auto_411129 ?auto_411132 ) ) ( not ( = ?auto_411129 ?auto_411133 ) ) ( not ( = ?auto_411129 ?auto_411134 ) ) ( not ( = ?auto_411129 ?auto_411135 ) ) ( not ( = ?auto_411129 ?auto_411136 ) ) ( not ( = ?auto_411129 ?auto_411137 ) ) ( not ( = ?auto_411130 ?auto_411131 ) ) ( not ( = ?auto_411130 ?auto_411132 ) ) ( not ( = ?auto_411130 ?auto_411133 ) ) ( not ( = ?auto_411130 ?auto_411134 ) ) ( not ( = ?auto_411130 ?auto_411135 ) ) ( not ( = ?auto_411130 ?auto_411136 ) ) ( not ( = ?auto_411130 ?auto_411137 ) ) ( not ( = ?auto_411131 ?auto_411132 ) ) ( not ( = ?auto_411131 ?auto_411133 ) ) ( not ( = ?auto_411131 ?auto_411134 ) ) ( not ( = ?auto_411131 ?auto_411135 ) ) ( not ( = ?auto_411131 ?auto_411136 ) ) ( not ( = ?auto_411131 ?auto_411137 ) ) ( not ( = ?auto_411132 ?auto_411133 ) ) ( not ( = ?auto_411132 ?auto_411134 ) ) ( not ( = ?auto_411132 ?auto_411135 ) ) ( not ( = ?auto_411132 ?auto_411136 ) ) ( not ( = ?auto_411132 ?auto_411137 ) ) ( not ( = ?auto_411133 ?auto_411134 ) ) ( not ( = ?auto_411133 ?auto_411135 ) ) ( not ( = ?auto_411133 ?auto_411136 ) ) ( not ( = ?auto_411133 ?auto_411137 ) ) ( not ( = ?auto_411134 ?auto_411135 ) ) ( not ( = ?auto_411134 ?auto_411136 ) ) ( not ( = ?auto_411134 ?auto_411137 ) ) ( not ( = ?auto_411135 ?auto_411136 ) ) ( not ( = ?auto_411135 ?auto_411137 ) ) ( not ( = ?auto_411136 ?auto_411137 ) ) ( CLEAR ?auto_411134 ) ( ON ?auto_411135 ?auto_411136 ) ( CLEAR ?auto_411135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_411123 ?auto_411124 ?auto_411125 ?auto_411126 ?auto_411127 ?auto_411128 ?auto_411129 ?auto_411130 ?auto_411131 ?auto_411132 ?auto_411133 ?auto_411134 ?auto_411135 )
      ( MAKE-14PILE ?auto_411123 ?auto_411124 ?auto_411125 ?auto_411126 ?auto_411127 ?auto_411128 ?auto_411129 ?auto_411130 ?auto_411131 ?auto_411132 ?auto_411133 ?auto_411134 ?auto_411135 ?auto_411136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411152 - BLOCK
      ?auto_411153 - BLOCK
      ?auto_411154 - BLOCK
      ?auto_411155 - BLOCK
      ?auto_411156 - BLOCK
      ?auto_411157 - BLOCK
      ?auto_411158 - BLOCK
      ?auto_411159 - BLOCK
      ?auto_411160 - BLOCK
      ?auto_411161 - BLOCK
      ?auto_411162 - BLOCK
      ?auto_411163 - BLOCK
      ?auto_411164 - BLOCK
      ?auto_411165 - BLOCK
    )
    :vars
    (
      ?auto_411166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411165 ?auto_411166 ) ( ON-TABLE ?auto_411152 ) ( ON ?auto_411153 ?auto_411152 ) ( ON ?auto_411154 ?auto_411153 ) ( ON ?auto_411155 ?auto_411154 ) ( ON ?auto_411156 ?auto_411155 ) ( ON ?auto_411157 ?auto_411156 ) ( ON ?auto_411158 ?auto_411157 ) ( ON ?auto_411159 ?auto_411158 ) ( ON ?auto_411160 ?auto_411159 ) ( ON ?auto_411161 ?auto_411160 ) ( ON ?auto_411162 ?auto_411161 ) ( not ( = ?auto_411152 ?auto_411153 ) ) ( not ( = ?auto_411152 ?auto_411154 ) ) ( not ( = ?auto_411152 ?auto_411155 ) ) ( not ( = ?auto_411152 ?auto_411156 ) ) ( not ( = ?auto_411152 ?auto_411157 ) ) ( not ( = ?auto_411152 ?auto_411158 ) ) ( not ( = ?auto_411152 ?auto_411159 ) ) ( not ( = ?auto_411152 ?auto_411160 ) ) ( not ( = ?auto_411152 ?auto_411161 ) ) ( not ( = ?auto_411152 ?auto_411162 ) ) ( not ( = ?auto_411152 ?auto_411163 ) ) ( not ( = ?auto_411152 ?auto_411164 ) ) ( not ( = ?auto_411152 ?auto_411165 ) ) ( not ( = ?auto_411152 ?auto_411166 ) ) ( not ( = ?auto_411153 ?auto_411154 ) ) ( not ( = ?auto_411153 ?auto_411155 ) ) ( not ( = ?auto_411153 ?auto_411156 ) ) ( not ( = ?auto_411153 ?auto_411157 ) ) ( not ( = ?auto_411153 ?auto_411158 ) ) ( not ( = ?auto_411153 ?auto_411159 ) ) ( not ( = ?auto_411153 ?auto_411160 ) ) ( not ( = ?auto_411153 ?auto_411161 ) ) ( not ( = ?auto_411153 ?auto_411162 ) ) ( not ( = ?auto_411153 ?auto_411163 ) ) ( not ( = ?auto_411153 ?auto_411164 ) ) ( not ( = ?auto_411153 ?auto_411165 ) ) ( not ( = ?auto_411153 ?auto_411166 ) ) ( not ( = ?auto_411154 ?auto_411155 ) ) ( not ( = ?auto_411154 ?auto_411156 ) ) ( not ( = ?auto_411154 ?auto_411157 ) ) ( not ( = ?auto_411154 ?auto_411158 ) ) ( not ( = ?auto_411154 ?auto_411159 ) ) ( not ( = ?auto_411154 ?auto_411160 ) ) ( not ( = ?auto_411154 ?auto_411161 ) ) ( not ( = ?auto_411154 ?auto_411162 ) ) ( not ( = ?auto_411154 ?auto_411163 ) ) ( not ( = ?auto_411154 ?auto_411164 ) ) ( not ( = ?auto_411154 ?auto_411165 ) ) ( not ( = ?auto_411154 ?auto_411166 ) ) ( not ( = ?auto_411155 ?auto_411156 ) ) ( not ( = ?auto_411155 ?auto_411157 ) ) ( not ( = ?auto_411155 ?auto_411158 ) ) ( not ( = ?auto_411155 ?auto_411159 ) ) ( not ( = ?auto_411155 ?auto_411160 ) ) ( not ( = ?auto_411155 ?auto_411161 ) ) ( not ( = ?auto_411155 ?auto_411162 ) ) ( not ( = ?auto_411155 ?auto_411163 ) ) ( not ( = ?auto_411155 ?auto_411164 ) ) ( not ( = ?auto_411155 ?auto_411165 ) ) ( not ( = ?auto_411155 ?auto_411166 ) ) ( not ( = ?auto_411156 ?auto_411157 ) ) ( not ( = ?auto_411156 ?auto_411158 ) ) ( not ( = ?auto_411156 ?auto_411159 ) ) ( not ( = ?auto_411156 ?auto_411160 ) ) ( not ( = ?auto_411156 ?auto_411161 ) ) ( not ( = ?auto_411156 ?auto_411162 ) ) ( not ( = ?auto_411156 ?auto_411163 ) ) ( not ( = ?auto_411156 ?auto_411164 ) ) ( not ( = ?auto_411156 ?auto_411165 ) ) ( not ( = ?auto_411156 ?auto_411166 ) ) ( not ( = ?auto_411157 ?auto_411158 ) ) ( not ( = ?auto_411157 ?auto_411159 ) ) ( not ( = ?auto_411157 ?auto_411160 ) ) ( not ( = ?auto_411157 ?auto_411161 ) ) ( not ( = ?auto_411157 ?auto_411162 ) ) ( not ( = ?auto_411157 ?auto_411163 ) ) ( not ( = ?auto_411157 ?auto_411164 ) ) ( not ( = ?auto_411157 ?auto_411165 ) ) ( not ( = ?auto_411157 ?auto_411166 ) ) ( not ( = ?auto_411158 ?auto_411159 ) ) ( not ( = ?auto_411158 ?auto_411160 ) ) ( not ( = ?auto_411158 ?auto_411161 ) ) ( not ( = ?auto_411158 ?auto_411162 ) ) ( not ( = ?auto_411158 ?auto_411163 ) ) ( not ( = ?auto_411158 ?auto_411164 ) ) ( not ( = ?auto_411158 ?auto_411165 ) ) ( not ( = ?auto_411158 ?auto_411166 ) ) ( not ( = ?auto_411159 ?auto_411160 ) ) ( not ( = ?auto_411159 ?auto_411161 ) ) ( not ( = ?auto_411159 ?auto_411162 ) ) ( not ( = ?auto_411159 ?auto_411163 ) ) ( not ( = ?auto_411159 ?auto_411164 ) ) ( not ( = ?auto_411159 ?auto_411165 ) ) ( not ( = ?auto_411159 ?auto_411166 ) ) ( not ( = ?auto_411160 ?auto_411161 ) ) ( not ( = ?auto_411160 ?auto_411162 ) ) ( not ( = ?auto_411160 ?auto_411163 ) ) ( not ( = ?auto_411160 ?auto_411164 ) ) ( not ( = ?auto_411160 ?auto_411165 ) ) ( not ( = ?auto_411160 ?auto_411166 ) ) ( not ( = ?auto_411161 ?auto_411162 ) ) ( not ( = ?auto_411161 ?auto_411163 ) ) ( not ( = ?auto_411161 ?auto_411164 ) ) ( not ( = ?auto_411161 ?auto_411165 ) ) ( not ( = ?auto_411161 ?auto_411166 ) ) ( not ( = ?auto_411162 ?auto_411163 ) ) ( not ( = ?auto_411162 ?auto_411164 ) ) ( not ( = ?auto_411162 ?auto_411165 ) ) ( not ( = ?auto_411162 ?auto_411166 ) ) ( not ( = ?auto_411163 ?auto_411164 ) ) ( not ( = ?auto_411163 ?auto_411165 ) ) ( not ( = ?auto_411163 ?auto_411166 ) ) ( not ( = ?auto_411164 ?auto_411165 ) ) ( not ( = ?auto_411164 ?auto_411166 ) ) ( not ( = ?auto_411165 ?auto_411166 ) ) ( ON ?auto_411164 ?auto_411165 ) ( CLEAR ?auto_411162 ) ( ON ?auto_411163 ?auto_411164 ) ( CLEAR ?auto_411163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_411152 ?auto_411153 ?auto_411154 ?auto_411155 ?auto_411156 ?auto_411157 ?auto_411158 ?auto_411159 ?auto_411160 ?auto_411161 ?auto_411162 ?auto_411163 )
      ( MAKE-14PILE ?auto_411152 ?auto_411153 ?auto_411154 ?auto_411155 ?auto_411156 ?auto_411157 ?auto_411158 ?auto_411159 ?auto_411160 ?auto_411161 ?auto_411162 ?auto_411163 ?auto_411164 ?auto_411165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411181 - BLOCK
      ?auto_411182 - BLOCK
      ?auto_411183 - BLOCK
      ?auto_411184 - BLOCK
      ?auto_411185 - BLOCK
      ?auto_411186 - BLOCK
      ?auto_411187 - BLOCK
      ?auto_411188 - BLOCK
      ?auto_411189 - BLOCK
      ?auto_411190 - BLOCK
      ?auto_411191 - BLOCK
      ?auto_411192 - BLOCK
      ?auto_411193 - BLOCK
      ?auto_411194 - BLOCK
    )
    :vars
    (
      ?auto_411195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411194 ?auto_411195 ) ( ON-TABLE ?auto_411181 ) ( ON ?auto_411182 ?auto_411181 ) ( ON ?auto_411183 ?auto_411182 ) ( ON ?auto_411184 ?auto_411183 ) ( ON ?auto_411185 ?auto_411184 ) ( ON ?auto_411186 ?auto_411185 ) ( ON ?auto_411187 ?auto_411186 ) ( ON ?auto_411188 ?auto_411187 ) ( ON ?auto_411189 ?auto_411188 ) ( ON ?auto_411190 ?auto_411189 ) ( ON ?auto_411191 ?auto_411190 ) ( not ( = ?auto_411181 ?auto_411182 ) ) ( not ( = ?auto_411181 ?auto_411183 ) ) ( not ( = ?auto_411181 ?auto_411184 ) ) ( not ( = ?auto_411181 ?auto_411185 ) ) ( not ( = ?auto_411181 ?auto_411186 ) ) ( not ( = ?auto_411181 ?auto_411187 ) ) ( not ( = ?auto_411181 ?auto_411188 ) ) ( not ( = ?auto_411181 ?auto_411189 ) ) ( not ( = ?auto_411181 ?auto_411190 ) ) ( not ( = ?auto_411181 ?auto_411191 ) ) ( not ( = ?auto_411181 ?auto_411192 ) ) ( not ( = ?auto_411181 ?auto_411193 ) ) ( not ( = ?auto_411181 ?auto_411194 ) ) ( not ( = ?auto_411181 ?auto_411195 ) ) ( not ( = ?auto_411182 ?auto_411183 ) ) ( not ( = ?auto_411182 ?auto_411184 ) ) ( not ( = ?auto_411182 ?auto_411185 ) ) ( not ( = ?auto_411182 ?auto_411186 ) ) ( not ( = ?auto_411182 ?auto_411187 ) ) ( not ( = ?auto_411182 ?auto_411188 ) ) ( not ( = ?auto_411182 ?auto_411189 ) ) ( not ( = ?auto_411182 ?auto_411190 ) ) ( not ( = ?auto_411182 ?auto_411191 ) ) ( not ( = ?auto_411182 ?auto_411192 ) ) ( not ( = ?auto_411182 ?auto_411193 ) ) ( not ( = ?auto_411182 ?auto_411194 ) ) ( not ( = ?auto_411182 ?auto_411195 ) ) ( not ( = ?auto_411183 ?auto_411184 ) ) ( not ( = ?auto_411183 ?auto_411185 ) ) ( not ( = ?auto_411183 ?auto_411186 ) ) ( not ( = ?auto_411183 ?auto_411187 ) ) ( not ( = ?auto_411183 ?auto_411188 ) ) ( not ( = ?auto_411183 ?auto_411189 ) ) ( not ( = ?auto_411183 ?auto_411190 ) ) ( not ( = ?auto_411183 ?auto_411191 ) ) ( not ( = ?auto_411183 ?auto_411192 ) ) ( not ( = ?auto_411183 ?auto_411193 ) ) ( not ( = ?auto_411183 ?auto_411194 ) ) ( not ( = ?auto_411183 ?auto_411195 ) ) ( not ( = ?auto_411184 ?auto_411185 ) ) ( not ( = ?auto_411184 ?auto_411186 ) ) ( not ( = ?auto_411184 ?auto_411187 ) ) ( not ( = ?auto_411184 ?auto_411188 ) ) ( not ( = ?auto_411184 ?auto_411189 ) ) ( not ( = ?auto_411184 ?auto_411190 ) ) ( not ( = ?auto_411184 ?auto_411191 ) ) ( not ( = ?auto_411184 ?auto_411192 ) ) ( not ( = ?auto_411184 ?auto_411193 ) ) ( not ( = ?auto_411184 ?auto_411194 ) ) ( not ( = ?auto_411184 ?auto_411195 ) ) ( not ( = ?auto_411185 ?auto_411186 ) ) ( not ( = ?auto_411185 ?auto_411187 ) ) ( not ( = ?auto_411185 ?auto_411188 ) ) ( not ( = ?auto_411185 ?auto_411189 ) ) ( not ( = ?auto_411185 ?auto_411190 ) ) ( not ( = ?auto_411185 ?auto_411191 ) ) ( not ( = ?auto_411185 ?auto_411192 ) ) ( not ( = ?auto_411185 ?auto_411193 ) ) ( not ( = ?auto_411185 ?auto_411194 ) ) ( not ( = ?auto_411185 ?auto_411195 ) ) ( not ( = ?auto_411186 ?auto_411187 ) ) ( not ( = ?auto_411186 ?auto_411188 ) ) ( not ( = ?auto_411186 ?auto_411189 ) ) ( not ( = ?auto_411186 ?auto_411190 ) ) ( not ( = ?auto_411186 ?auto_411191 ) ) ( not ( = ?auto_411186 ?auto_411192 ) ) ( not ( = ?auto_411186 ?auto_411193 ) ) ( not ( = ?auto_411186 ?auto_411194 ) ) ( not ( = ?auto_411186 ?auto_411195 ) ) ( not ( = ?auto_411187 ?auto_411188 ) ) ( not ( = ?auto_411187 ?auto_411189 ) ) ( not ( = ?auto_411187 ?auto_411190 ) ) ( not ( = ?auto_411187 ?auto_411191 ) ) ( not ( = ?auto_411187 ?auto_411192 ) ) ( not ( = ?auto_411187 ?auto_411193 ) ) ( not ( = ?auto_411187 ?auto_411194 ) ) ( not ( = ?auto_411187 ?auto_411195 ) ) ( not ( = ?auto_411188 ?auto_411189 ) ) ( not ( = ?auto_411188 ?auto_411190 ) ) ( not ( = ?auto_411188 ?auto_411191 ) ) ( not ( = ?auto_411188 ?auto_411192 ) ) ( not ( = ?auto_411188 ?auto_411193 ) ) ( not ( = ?auto_411188 ?auto_411194 ) ) ( not ( = ?auto_411188 ?auto_411195 ) ) ( not ( = ?auto_411189 ?auto_411190 ) ) ( not ( = ?auto_411189 ?auto_411191 ) ) ( not ( = ?auto_411189 ?auto_411192 ) ) ( not ( = ?auto_411189 ?auto_411193 ) ) ( not ( = ?auto_411189 ?auto_411194 ) ) ( not ( = ?auto_411189 ?auto_411195 ) ) ( not ( = ?auto_411190 ?auto_411191 ) ) ( not ( = ?auto_411190 ?auto_411192 ) ) ( not ( = ?auto_411190 ?auto_411193 ) ) ( not ( = ?auto_411190 ?auto_411194 ) ) ( not ( = ?auto_411190 ?auto_411195 ) ) ( not ( = ?auto_411191 ?auto_411192 ) ) ( not ( = ?auto_411191 ?auto_411193 ) ) ( not ( = ?auto_411191 ?auto_411194 ) ) ( not ( = ?auto_411191 ?auto_411195 ) ) ( not ( = ?auto_411192 ?auto_411193 ) ) ( not ( = ?auto_411192 ?auto_411194 ) ) ( not ( = ?auto_411192 ?auto_411195 ) ) ( not ( = ?auto_411193 ?auto_411194 ) ) ( not ( = ?auto_411193 ?auto_411195 ) ) ( not ( = ?auto_411194 ?auto_411195 ) ) ( ON ?auto_411193 ?auto_411194 ) ( CLEAR ?auto_411191 ) ( ON ?auto_411192 ?auto_411193 ) ( CLEAR ?auto_411192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_411181 ?auto_411182 ?auto_411183 ?auto_411184 ?auto_411185 ?auto_411186 ?auto_411187 ?auto_411188 ?auto_411189 ?auto_411190 ?auto_411191 ?auto_411192 )
      ( MAKE-14PILE ?auto_411181 ?auto_411182 ?auto_411183 ?auto_411184 ?auto_411185 ?auto_411186 ?auto_411187 ?auto_411188 ?auto_411189 ?auto_411190 ?auto_411191 ?auto_411192 ?auto_411193 ?auto_411194 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411210 - BLOCK
      ?auto_411211 - BLOCK
      ?auto_411212 - BLOCK
      ?auto_411213 - BLOCK
      ?auto_411214 - BLOCK
      ?auto_411215 - BLOCK
      ?auto_411216 - BLOCK
      ?auto_411217 - BLOCK
      ?auto_411218 - BLOCK
      ?auto_411219 - BLOCK
      ?auto_411220 - BLOCK
      ?auto_411221 - BLOCK
      ?auto_411222 - BLOCK
      ?auto_411223 - BLOCK
    )
    :vars
    (
      ?auto_411224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411223 ?auto_411224 ) ( ON-TABLE ?auto_411210 ) ( ON ?auto_411211 ?auto_411210 ) ( ON ?auto_411212 ?auto_411211 ) ( ON ?auto_411213 ?auto_411212 ) ( ON ?auto_411214 ?auto_411213 ) ( ON ?auto_411215 ?auto_411214 ) ( ON ?auto_411216 ?auto_411215 ) ( ON ?auto_411217 ?auto_411216 ) ( ON ?auto_411218 ?auto_411217 ) ( ON ?auto_411219 ?auto_411218 ) ( not ( = ?auto_411210 ?auto_411211 ) ) ( not ( = ?auto_411210 ?auto_411212 ) ) ( not ( = ?auto_411210 ?auto_411213 ) ) ( not ( = ?auto_411210 ?auto_411214 ) ) ( not ( = ?auto_411210 ?auto_411215 ) ) ( not ( = ?auto_411210 ?auto_411216 ) ) ( not ( = ?auto_411210 ?auto_411217 ) ) ( not ( = ?auto_411210 ?auto_411218 ) ) ( not ( = ?auto_411210 ?auto_411219 ) ) ( not ( = ?auto_411210 ?auto_411220 ) ) ( not ( = ?auto_411210 ?auto_411221 ) ) ( not ( = ?auto_411210 ?auto_411222 ) ) ( not ( = ?auto_411210 ?auto_411223 ) ) ( not ( = ?auto_411210 ?auto_411224 ) ) ( not ( = ?auto_411211 ?auto_411212 ) ) ( not ( = ?auto_411211 ?auto_411213 ) ) ( not ( = ?auto_411211 ?auto_411214 ) ) ( not ( = ?auto_411211 ?auto_411215 ) ) ( not ( = ?auto_411211 ?auto_411216 ) ) ( not ( = ?auto_411211 ?auto_411217 ) ) ( not ( = ?auto_411211 ?auto_411218 ) ) ( not ( = ?auto_411211 ?auto_411219 ) ) ( not ( = ?auto_411211 ?auto_411220 ) ) ( not ( = ?auto_411211 ?auto_411221 ) ) ( not ( = ?auto_411211 ?auto_411222 ) ) ( not ( = ?auto_411211 ?auto_411223 ) ) ( not ( = ?auto_411211 ?auto_411224 ) ) ( not ( = ?auto_411212 ?auto_411213 ) ) ( not ( = ?auto_411212 ?auto_411214 ) ) ( not ( = ?auto_411212 ?auto_411215 ) ) ( not ( = ?auto_411212 ?auto_411216 ) ) ( not ( = ?auto_411212 ?auto_411217 ) ) ( not ( = ?auto_411212 ?auto_411218 ) ) ( not ( = ?auto_411212 ?auto_411219 ) ) ( not ( = ?auto_411212 ?auto_411220 ) ) ( not ( = ?auto_411212 ?auto_411221 ) ) ( not ( = ?auto_411212 ?auto_411222 ) ) ( not ( = ?auto_411212 ?auto_411223 ) ) ( not ( = ?auto_411212 ?auto_411224 ) ) ( not ( = ?auto_411213 ?auto_411214 ) ) ( not ( = ?auto_411213 ?auto_411215 ) ) ( not ( = ?auto_411213 ?auto_411216 ) ) ( not ( = ?auto_411213 ?auto_411217 ) ) ( not ( = ?auto_411213 ?auto_411218 ) ) ( not ( = ?auto_411213 ?auto_411219 ) ) ( not ( = ?auto_411213 ?auto_411220 ) ) ( not ( = ?auto_411213 ?auto_411221 ) ) ( not ( = ?auto_411213 ?auto_411222 ) ) ( not ( = ?auto_411213 ?auto_411223 ) ) ( not ( = ?auto_411213 ?auto_411224 ) ) ( not ( = ?auto_411214 ?auto_411215 ) ) ( not ( = ?auto_411214 ?auto_411216 ) ) ( not ( = ?auto_411214 ?auto_411217 ) ) ( not ( = ?auto_411214 ?auto_411218 ) ) ( not ( = ?auto_411214 ?auto_411219 ) ) ( not ( = ?auto_411214 ?auto_411220 ) ) ( not ( = ?auto_411214 ?auto_411221 ) ) ( not ( = ?auto_411214 ?auto_411222 ) ) ( not ( = ?auto_411214 ?auto_411223 ) ) ( not ( = ?auto_411214 ?auto_411224 ) ) ( not ( = ?auto_411215 ?auto_411216 ) ) ( not ( = ?auto_411215 ?auto_411217 ) ) ( not ( = ?auto_411215 ?auto_411218 ) ) ( not ( = ?auto_411215 ?auto_411219 ) ) ( not ( = ?auto_411215 ?auto_411220 ) ) ( not ( = ?auto_411215 ?auto_411221 ) ) ( not ( = ?auto_411215 ?auto_411222 ) ) ( not ( = ?auto_411215 ?auto_411223 ) ) ( not ( = ?auto_411215 ?auto_411224 ) ) ( not ( = ?auto_411216 ?auto_411217 ) ) ( not ( = ?auto_411216 ?auto_411218 ) ) ( not ( = ?auto_411216 ?auto_411219 ) ) ( not ( = ?auto_411216 ?auto_411220 ) ) ( not ( = ?auto_411216 ?auto_411221 ) ) ( not ( = ?auto_411216 ?auto_411222 ) ) ( not ( = ?auto_411216 ?auto_411223 ) ) ( not ( = ?auto_411216 ?auto_411224 ) ) ( not ( = ?auto_411217 ?auto_411218 ) ) ( not ( = ?auto_411217 ?auto_411219 ) ) ( not ( = ?auto_411217 ?auto_411220 ) ) ( not ( = ?auto_411217 ?auto_411221 ) ) ( not ( = ?auto_411217 ?auto_411222 ) ) ( not ( = ?auto_411217 ?auto_411223 ) ) ( not ( = ?auto_411217 ?auto_411224 ) ) ( not ( = ?auto_411218 ?auto_411219 ) ) ( not ( = ?auto_411218 ?auto_411220 ) ) ( not ( = ?auto_411218 ?auto_411221 ) ) ( not ( = ?auto_411218 ?auto_411222 ) ) ( not ( = ?auto_411218 ?auto_411223 ) ) ( not ( = ?auto_411218 ?auto_411224 ) ) ( not ( = ?auto_411219 ?auto_411220 ) ) ( not ( = ?auto_411219 ?auto_411221 ) ) ( not ( = ?auto_411219 ?auto_411222 ) ) ( not ( = ?auto_411219 ?auto_411223 ) ) ( not ( = ?auto_411219 ?auto_411224 ) ) ( not ( = ?auto_411220 ?auto_411221 ) ) ( not ( = ?auto_411220 ?auto_411222 ) ) ( not ( = ?auto_411220 ?auto_411223 ) ) ( not ( = ?auto_411220 ?auto_411224 ) ) ( not ( = ?auto_411221 ?auto_411222 ) ) ( not ( = ?auto_411221 ?auto_411223 ) ) ( not ( = ?auto_411221 ?auto_411224 ) ) ( not ( = ?auto_411222 ?auto_411223 ) ) ( not ( = ?auto_411222 ?auto_411224 ) ) ( not ( = ?auto_411223 ?auto_411224 ) ) ( ON ?auto_411222 ?auto_411223 ) ( ON ?auto_411221 ?auto_411222 ) ( CLEAR ?auto_411219 ) ( ON ?auto_411220 ?auto_411221 ) ( CLEAR ?auto_411220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_411210 ?auto_411211 ?auto_411212 ?auto_411213 ?auto_411214 ?auto_411215 ?auto_411216 ?auto_411217 ?auto_411218 ?auto_411219 ?auto_411220 )
      ( MAKE-14PILE ?auto_411210 ?auto_411211 ?auto_411212 ?auto_411213 ?auto_411214 ?auto_411215 ?auto_411216 ?auto_411217 ?auto_411218 ?auto_411219 ?auto_411220 ?auto_411221 ?auto_411222 ?auto_411223 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411239 - BLOCK
      ?auto_411240 - BLOCK
      ?auto_411241 - BLOCK
      ?auto_411242 - BLOCK
      ?auto_411243 - BLOCK
      ?auto_411244 - BLOCK
      ?auto_411245 - BLOCK
      ?auto_411246 - BLOCK
      ?auto_411247 - BLOCK
      ?auto_411248 - BLOCK
      ?auto_411249 - BLOCK
      ?auto_411250 - BLOCK
      ?auto_411251 - BLOCK
      ?auto_411252 - BLOCK
    )
    :vars
    (
      ?auto_411253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411252 ?auto_411253 ) ( ON-TABLE ?auto_411239 ) ( ON ?auto_411240 ?auto_411239 ) ( ON ?auto_411241 ?auto_411240 ) ( ON ?auto_411242 ?auto_411241 ) ( ON ?auto_411243 ?auto_411242 ) ( ON ?auto_411244 ?auto_411243 ) ( ON ?auto_411245 ?auto_411244 ) ( ON ?auto_411246 ?auto_411245 ) ( ON ?auto_411247 ?auto_411246 ) ( ON ?auto_411248 ?auto_411247 ) ( not ( = ?auto_411239 ?auto_411240 ) ) ( not ( = ?auto_411239 ?auto_411241 ) ) ( not ( = ?auto_411239 ?auto_411242 ) ) ( not ( = ?auto_411239 ?auto_411243 ) ) ( not ( = ?auto_411239 ?auto_411244 ) ) ( not ( = ?auto_411239 ?auto_411245 ) ) ( not ( = ?auto_411239 ?auto_411246 ) ) ( not ( = ?auto_411239 ?auto_411247 ) ) ( not ( = ?auto_411239 ?auto_411248 ) ) ( not ( = ?auto_411239 ?auto_411249 ) ) ( not ( = ?auto_411239 ?auto_411250 ) ) ( not ( = ?auto_411239 ?auto_411251 ) ) ( not ( = ?auto_411239 ?auto_411252 ) ) ( not ( = ?auto_411239 ?auto_411253 ) ) ( not ( = ?auto_411240 ?auto_411241 ) ) ( not ( = ?auto_411240 ?auto_411242 ) ) ( not ( = ?auto_411240 ?auto_411243 ) ) ( not ( = ?auto_411240 ?auto_411244 ) ) ( not ( = ?auto_411240 ?auto_411245 ) ) ( not ( = ?auto_411240 ?auto_411246 ) ) ( not ( = ?auto_411240 ?auto_411247 ) ) ( not ( = ?auto_411240 ?auto_411248 ) ) ( not ( = ?auto_411240 ?auto_411249 ) ) ( not ( = ?auto_411240 ?auto_411250 ) ) ( not ( = ?auto_411240 ?auto_411251 ) ) ( not ( = ?auto_411240 ?auto_411252 ) ) ( not ( = ?auto_411240 ?auto_411253 ) ) ( not ( = ?auto_411241 ?auto_411242 ) ) ( not ( = ?auto_411241 ?auto_411243 ) ) ( not ( = ?auto_411241 ?auto_411244 ) ) ( not ( = ?auto_411241 ?auto_411245 ) ) ( not ( = ?auto_411241 ?auto_411246 ) ) ( not ( = ?auto_411241 ?auto_411247 ) ) ( not ( = ?auto_411241 ?auto_411248 ) ) ( not ( = ?auto_411241 ?auto_411249 ) ) ( not ( = ?auto_411241 ?auto_411250 ) ) ( not ( = ?auto_411241 ?auto_411251 ) ) ( not ( = ?auto_411241 ?auto_411252 ) ) ( not ( = ?auto_411241 ?auto_411253 ) ) ( not ( = ?auto_411242 ?auto_411243 ) ) ( not ( = ?auto_411242 ?auto_411244 ) ) ( not ( = ?auto_411242 ?auto_411245 ) ) ( not ( = ?auto_411242 ?auto_411246 ) ) ( not ( = ?auto_411242 ?auto_411247 ) ) ( not ( = ?auto_411242 ?auto_411248 ) ) ( not ( = ?auto_411242 ?auto_411249 ) ) ( not ( = ?auto_411242 ?auto_411250 ) ) ( not ( = ?auto_411242 ?auto_411251 ) ) ( not ( = ?auto_411242 ?auto_411252 ) ) ( not ( = ?auto_411242 ?auto_411253 ) ) ( not ( = ?auto_411243 ?auto_411244 ) ) ( not ( = ?auto_411243 ?auto_411245 ) ) ( not ( = ?auto_411243 ?auto_411246 ) ) ( not ( = ?auto_411243 ?auto_411247 ) ) ( not ( = ?auto_411243 ?auto_411248 ) ) ( not ( = ?auto_411243 ?auto_411249 ) ) ( not ( = ?auto_411243 ?auto_411250 ) ) ( not ( = ?auto_411243 ?auto_411251 ) ) ( not ( = ?auto_411243 ?auto_411252 ) ) ( not ( = ?auto_411243 ?auto_411253 ) ) ( not ( = ?auto_411244 ?auto_411245 ) ) ( not ( = ?auto_411244 ?auto_411246 ) ) ( not ( = ?auto_411244 ?auto_411247 ) ) ( not ( = ?auto_411244 ?auto_411248 ) ) ( not ( = ?auto_411244 ?auto_411249 ) ) ( not ( = ?auto_411244 ?auto_411250 ) ) ( not ( = ?auto_411244 ?auto_411251 ) ) ( not ( = ?auto_411244 ?auto_411252 ) ) ( not ( = ?auto_411244 ?auto_411253 ) ) ( not ( = ?auto_411245 ?auto_411246 ) ) ( not ( = ?auto_411245 ?auto_411247 ) ) ( not ( = ?auto_411245 ?auto_411248 ) ) ( not ( = ?auto_411245 ?auto_411249 ) ) ( not ( = ?auto_411245 ?auto_411250 ) ) ( not ( = ?auto_411245 ?auto_411251 ) ) ( not ( = ?auto_411245 ?auto_411252 ) ) ( not ( = ?auto_411245 ?auto_411253 ) ) ( not ( = ?auto_411246 ?auto_411247 ) ) ( not ( = ?auto_411246 ?auto_411248 ) ) ( not ( = ?auto_411246 ?auto_411249 ) ) ( not ( = ?auto_411246 ?auto_411250 ) ) ( not ( = ?auto_411246 ?auto_411251 ) ) ( not ( = ?auto_411246 ?auto_411252 ) ) ( not ( = ?auto_411246 ?auto_411253 ) ) ( not ( = ?auto_411247 ?auto_411248 ) ) ( not ( = ?auto_411247 ?auto_411249 ) ) ( not ( = ?auto_411247 ?auto_411250 ) ) ( not ( = ?auto_411247 ?auto_411251 ) ) ( not ( = ?auto_411247 ?auto_411252 ) ) ( not ( = ?auto_411247 ?auto_411253 ) ) ( not ( = ?auto_411248 ?auto_411249 ) ) ( not ( = ?auto_411248 ?auto_411250 ) ) ( not ( = ?auto_411248 ?auto_411251 ) ) ( not ( = ?auto_411248 ?auto_411252 ) ) ( not ( = ?auto_411248 ?auto_411253 ) ) ( not ( = ?auto_411249 ?auto_411250 ) ) ( not ( = ?auto_411249 ?auto_411251 ) ) ( not ( = ?auto_411249 ?auto_411252 ) ) ( not ( = ?auto_411249 ?auto_411253 ) ) ( not ( = ?auto_411250 ?auto_411251 ) ) ( not ( = ?auto_411250 ?auto_411252 ) ) ( not ( = ?auto_411250 ?auto_411253 ) ) ( not ( = ?auto_411251 ?auto_411252 ) ) ( not ( = ?auto_411251 ?auto_411253 ) ) ( not ( = ?auto_411252 ?auto_411253 ) ) ( ON ?auto_411251 ?auto_411252 ) ( ON ?auto_411250 ?auto_411251 ) ( CLEAR ?auto_411248 ) ( ON ?auto_411249 ?auto_411250 ) ( CLEAR ?auto_411249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_411239 ?auto_411240 ?auto_411241 ?auto_411242 ?auto_411243 ?auto_411244 ?auto_411245 ?auto_411246 ?auto_411247 ?auto_411248 ?auto_411249 )
      ( MAKE-14PILE ?auto_411239 ?auto_411240 ?auto_411241 ?auto_411242 ?auto_411243 ?auto_411244 ?auto_411245 ?auto_411246 ?auto_411247 ?auto_411248 ?auto_411249 ?auto_411250 ?auto_411251 ?auto_411252 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411268 - BLOCK
      ?auto_411269 - BLOCK
      ?auto_411270 - BLOCK
      ?auto_411271 - BLOCK
      ?auto_411272 - BLOCK
      ?auto_411273 - BLOCK
      ?auto_411274 - BLOCK
      ?auto_411275 - BLOCK
      ?auto_411276 - BLOCK
      ?auto_411277 - BLOCK
      ?auto_411278 - BLOCK
      ?auto_411279 - BLOCK
      ?auto_411280 - BLOCK
      ?auto_411281 - BLOCK
    )
    :vars
    (
      ?auto_411282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411281 ?auto_411282 ) ( ON-TABLE ?auto_411268 ) ( ON ?auto_411269 ?auto_411268 ) ( ON ?auto_411270 ?auto_411269 ) ( ON ?auto_411271 ?auto_411270 ) ( ON ?auto_411272 ?auto_411271 ) ( ON ?auto_411273 ?auto_411272 ) ( ON ?auto_411274 ?auto_411273 ) ( ON ?auto_411275 ?auto_411274 ) ( ON ?auto_411276 ?auto_411275 ) ( not ( = ?auto_411268 ?auto_411269 ) ) ( not ( = ?auto_411268 ?auto_411270 ) ) ( not ( = ?auto_411268 ?auto_411271 ) ) ( not ( = ?auto_411268 ?auto_411272 ) ) ( not ( = ?auto_411268 ?auto_411273 ) ) ( not ( = ?auto_411268 ?auto_411274 ) ) ( not ( = ?auto_411268 ?auto_411275 ) ) ( not ( = ?auto_411268 ?auto_411276 ) ) ( not ( = ?auto_411268 ?auto_411277 ) ) ( not ( = ?auto_411268 ?auto_411278 ) ) ( not ( = ?auto_411268 ?auto_411279 ) ) ( not ( = ?auto_411268 ?auto_411280 ) ) ( not ( = ?auto_411268 ?auto_411281 ) ) ( not ( = ?auto_411268 ?auto_411282 ) ) ( not ( = ?auto_411269 ?auto_411270 ) ) ( not ( = ?auto_411269 ?auto_411271 ) ) ( not ( = ?auto_411269 ?auto_411272 ) ) ( not ( = ?auto_411269 ?auto_411273 ) ) ( not ( = ?auto_411269 ?auto_411274 ) ) ( not ( = ?auto_411269 ?auto_411275 ) ) ( not ( = ?auto_411269 ?auto_411276 ) ) ( not ( = ?auto_411269 ?auto_411277 ) ) ( not ( = ?auto_411269 ?auto_411278 ) ) ( not ( = ?auto_411269 ?auto_411279 ) ) ( not ( = ?auto_411269 ?auto_411280 ) ) ( not ( = ?auto_411269 ?auto_411281 ) ) ( not ( = ?auto_411269 ?auto_411282 ) ) ( not ( = ?auto_411270 ?auto_411271 ) ) ( not ( = ?auto_411270 ?auto_411272 ) ) ( not ( = ?auto_411270 ?auto_411273 ) ) ( not ( = ?auto_411270 ?auto_411274 ) ) ( not ( = ?auto_411270 ?auto_411275 ) ) ( not ( = ?auto_411270 ?auto_411276 ) ) ( not ( = ?auto_411270 ?auto_411277 ) ) ( not ( = ?auto_411270 ?auto_411278 ) ) ( not ( = ?auto_411270 ?auto_411279 ) ) ( not ( = ?auto_411270 ?auto_411280 ) ) ( not ( = ?auto_411270 ?auto_411281 ) ) ( not ( = ?auto_411270 ?auto_411282 ) ) ( not ( = ?auto_411271 ?auto_411272 ) ) ( not ( = ?auto_411271 ?auto_411273 ) ) ( not ( = ?auto_411271 ?auto_411274 ) ) ( not ( = ?auto_411271 ?auto_411275 ) ) ( not ( = ?auto_411271 ?auto_411276 ) ) ( not ( = ?auto_411271 ?auto_411277 ) ) ( not ( = ?auto_411271 ?auto_411278 ) ) ( not ( = ?auto_411271 ?auto_411279 ) ) ( not ( = ?auto_411271 ?auto_411280 ) ) ( not ( = ?auto_411271 ?auto_411281 ) ) ( not ( = ?auto_411271 ?auto_411282 ) ) ( not ( = ?auto_411272 ?auto_411273 ) ) ( not ( = ?auto_411272 ?auto_411274 ) ) ( not ( = ?auto_411272 ?auto_411275 ) ) ( not ( = ?auto_411272 ?auto_411276 ) ) ( not ( = ?auto_411272 ?auto_411277 ) ) ( not ( = ?auto_411272 ?auto_411278 ) ) ( not ( = ?auto_411272 ?auto_411279 ) ) ( not ( = ?auto_411272 ?auto_411280 ) ) ( not ( = ?auto_411272 ?auto_411281 ) ) ( not ( = ?auto_411272 ?auto_411282 ) ) ( not ( = ?auto_411273 ?auto_411274 ) ) ( not ( = ?auto_411273 ?auto_411275 ) ) ( not ( = ?auto_411273 ?auto_411276 ) ) ( not ( = ?auto_411273 ?auto_411277 ) ) ( not ( = ?auto_411273 ?auto_411278 ) ) ( not ( = ?auto_411273 ?auto_411279 ) ) ( not ( = ?auto_411273 ?auto_411280 ) ) ( not ( = ?auto_411273 ?auto_411281 ) ) ( not ( = ?auto_411273 ?auto_411282 ) ) ( not ( = ?auto_411274 ?auto_411275 ) ) ( not ( = ?auto_411274 ?auto_411276 ) ) ( not ( = ?auto_411274 ?auto_411277 ) ) ( not ( = ?auto_411274 ?auto_411278 ) ) ( not ( = ?auto_411274 ?auto_411279 ) ) ( not ( = ?auto_411274 ?auto_411280 ) ) ( not ( = ?auto_411274 ?auto_411281 ) ) ( not ( = ?auto_411274 ?auto_411282 ) ) ( not ( = ?auto_411275 ?auto_411276 ) ) ( not ( = ?auto_411275 ?auto_411277 ) ) ( not ( = ?auto_411275 ?auto_411278 ) ) ( not ( = ?auto_411275 ?auto_411279 ) ) ( not ( = ?auto_411275 ?auto_411280 ) ) ( not ( = ?auto_411275 ?auto_411281 ) ) ( not ( = ?auto_411275 ?auto_411282 ) ) ( not ( = ?auto_411276 ?auto_411277 ) ) ( not ( = ?auto_411276 ?auto_411278 ) ) ( not ( = ?auto_411276 ?auto_411279 ) ) ( not ( = ?auto_411276 ?auto_411280 ) ) ( not ( = ?auto_411276 ?auto_411281 ) ) ( not ( = ?auto_411276 ?auto_411282 ) ) ( not ( = ?auto_411277 ?auto_411278 ) ) ( not ( = ?auto_411277 ?auto_411279 ) ) ( not ( = ?auto_411277 ?auto_411280 ) ) ( not ( = ?auto_411277 ?auto_411281 ) ) ( not ( = ?auto_411277 ?auto_411282 ) ) ( not ( = ?auto_411278 ?auto_411279 ) ) ( not ( = ?auto_411278 ?auto_411280 ) ) ( not ( = ?auto_411278 ?auto_411281 ) ) ( not ( = ?auto_411278 ?auto_411282 ) ) ( not ( = ?auto_411279 ?auto_411280 ) ) ( not ( = ?auto_411279 ?auto_411281 ) ) ( not ( = ?auto_411279 ?auto_411282 ) ) ( not ( = ?auto_411280 ?auto_411281 ) ) ( not ( = ?auto_411280 ?auto_411282 ) ) ( not ( = ?auto_411281 ?auto_411282 ) ) ( ON ?auto_411280 ?auto_411281 ) ( ON ?auto_411279 ?auto_411280 ) ( ON ?auto_411278 ?auto_411279 ) ( CLEAR ?auto_411276 ) ( ON ?auto_411277 ?auto_411278 ) ( CLEAR ?auto_411277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_411268 ?auto_411269 ?auto_411270 ?auto_411271 ?auto_411272 ?auto_411273 ?auto_411274 ?auto_411275 ?auto_411276 ?auto_411277 )
      ( MAKE-14PILE ?auto_411268 ?auto_411269 ?auto_411270 ?auto_411271 ?auto_411272 ?auto_411273 ?auto_411274 ?auto_411275 ?auto_411276 ?auto_411277 ?auto_411278 ?auto_411279 ?auto_411280 ?auto_411281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411297 - BLOCK
      ?auto_411298 - BLOCK
      ?auto_411299 - BLOCK
      ?auto_411300 - BLOCK
      ?auto_411301 - BLOCK
      ?auto_411302 - BLOCK
      ?auto_411303 - BLOCK
      ?auto_411304 - BLOCK
      ?auto_411305 - BLOCK
      ?auto_411306 - BLOCK
      ?auto_411307 - BLOCK
      ?auto_411308 - BLOCK
      ?auto_411309 - BLOCK
      ?auto_411310 - BLOCK
    )
    :vars
    (
      ?auto_411311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411310 ?auto_411311 ) ( ON-TABLE ?auto_411297 ) ( ON ?auto_411298 ?auto_411297 ) ( ON ?auto_411299 ?auto_411298 ) ( ON ?auto_411300 ?auto_411299 ) ( ON ?auto_411301 ?auto_411300 ) ( ON ?auto_411302 ?auto_411301 ) ( ON ?auto_411303 ?auto_411302 ) ( ON ?auto_411304 ?auto_411303 ) ( ON ?auto_411305 ?auto_411304 ) ( not ( = ?auto_411297 ?auto_411298 ) ) ( not ( = ?auto_411297 ?auto_411299 ) ) ( not ( = ?auto_411297 ?auto_411300 ) ) ( not ( = ?auto_411297 ?auto_411301 ) ) ( not ( = ?auto_411297 ?auto_411302 ) ) ( not ( = ?auto_411297 ?auto_411303 ) ) ( not ( = ?auto_411297 ?auto_411304 ) ) ( not ( = ?auto_411297 ?auto_411305 ) ) ( not ( = ?auto_411297 ?auto_411306 ) ) ( not ( = ?auto_411297 ?auto_411307 ) ) ( not ( = ?auto_411297 ?auto_411308 ) ) ( not ( = ?auto_411297 ?auto_411309 ) ) ( not ( = ?auto_411297 ?auto_411310 ) ) ( not ( = ?auto_411297 ?auto_411311 ) ) ( not ( = ?auto_411298 ?auto_411299 ) ) ( not ( = ?auto_411298 ?auto_411300 ) ) ( not ( = ?auto_411298 ?auto_411301 ) ) ( not ( = ?auto_411298 ?auto_411302 ) ) ( not ( = ?auto_411298 ?auto_411303 ) ) ( not ( = ?auto_411298 ?auto_411304 ) ) ( not ( = ?auto_411298 ?auto_411305 ) ) ( not ( = ?auto_411298 ?auto_411306 ) ) ( not ( = ?auto_411298 ?auto_411307 ) ) ( not ( = ?auto_411298 ?auto_411308 ) ) ( not ( = ?auto_411298 ?auto_411309 ) ) ( not ( = ?auto_411298 ?auto_411310 ) ) ( not ( = ?auto_411298 ?auto_411311 ) ) ( not ( = ?auto_411299 ?auto_411300 ) ) ( not ( = ?auto_411299 ?auto_411301 ) ) ( not ( = ?auto_411299 ?auto_411302 ) ) ( not ( = ?auto_411299 ?auto_411303 ) ) ( not ( = ?auto_411299 ?auto_411304 ) ) ( not ( = ?auto_411299 ?auto_411305 ) ) ( not ( = ?auto_411299 ?auto_411306 ) ) ( not ( = ?auto_411299 ?auto_411307 ) ) ( not ( = ?auto_411299 ?auto_411308 ) ) ( not ( = ?auto_411299 ?auto_411309 ) ) ( not ( = ?auto_411299 ?auto_411310 ) ) ( not ( = ?auto_411299 ?auto_411311 ) ) ( not ( = ?auto_411300 ?auto_411301 ) ) ( not ( = ?auto_411300 ?auto_411302 ) ) ( not ( = ?auto_411300 ?auto_411303 ) ) ( not ( = ?auto_411300 ?auto_411304 ) ) ( not ( = ?auto_411300 ?auto_411305 ) ) ( not ( = ?auto_411300 ?auto_411306 ) ) ( not ( = ?auto_411300 ?auto_411307 ) ) ( not ( = ?auto_411300 ?auto_411308 ) ) ( not ( = ?auto_411300 ?auto_411309 ) ) ( not ( = ?auto_411300 ?auto_411310 ) ) ( not ( = ?auto_411300 ?auto_411311 ) ) ( not ( = ?auto_411301 ?auto_411302 ) ) ( not ( = ?auto_411301 ?auto_411303 ) ) ( not ( = ?auto_411301 ?auto_411304 ) ) ( not ( = ?auto_411301 ?auto_411305 ) ) ( not ( = ?auto_411301 ?auto_411306 ) ) ( not ( = ?auto_411301 ?auto_411307 ) ) ( not ( = ?auto_411301 ?auto_411308 ) ) ( not ( = ?auto_411301 ?auto_411309 ) ) ( not ( = ?auto_411301 ?auto_411310 ) ) ( not ( = ?auto_411301 ?auto_411311 ) ) ( not ( = ?auto_411302 ?auto_411303 ) ) ( not ( = ?auto_411302 ?auto_411304 ) ) ( not ( = ?auto_411302 ?auto_411305 ) ) ( not ( = ?auto_411302 ?auto_411306 ) ) ( not ( = ?auto_411302 ?auto_411307 ) ) ( not ( = ?auto_411302 ?auto_411308 ) ) ( not ( = ?auto_411302 ?auto_411309 ) ) ( not ( = ?auto_411302 ?auto_411310 ) ) ( not ( = ?auto_411302 ?auto_411311 ) ) ( not ( = ?auto_411303 ?auto_411304 ) ) ( not ( = ?auto_411303 ?auto_411305 ) ) ( not ( = ?auto_411303 ?auto_411306 ) ) ( not ( = ?auto_411303 ?auto_411307 ) ) ( not ( = ?auto_411303 ?auto_411308 ) ) ( not ( = ?auto_411303 ?auto_411309 ) ) ( not ( = ?auto_411303 ?auto_411310 ) ) ( not ( = ?auto_411303 ?auto_411311 ) ) ( not ( = ?auto_411304 ?auto_411305 ) ) ( not ( = ?auto_411304 ?auto_411306 ) ) ( not ( = ?auto_411304 ?auto_411307 ) ) ( not ( = ?auto_411304 ?auto_411308 ) ) ( not ( = ?auto_411304 ?auto_411309 ) ) ( not ( = ?auto_411304 ?auto_411310 ) ) ( not ( = ?auto_411304 ?auto_411311 ) ) ( not ( = ?auto_411305 ?auto_411306 ) ) ( not ( = ?auto_411305 ?auto_411307 ) ) ( not ( = ?auto_411305 ?auto_411308 ) ) ( not ( = ?auto_411305 ?auto_411309 ) ) ( not ( = ?auto_411305 ?auto_411310 ) ) ( not ( = ?auto_411305 ?auto_411311 ) ) ( not ( = ?auto_411306 ?auto_411307 ) ) ( not ( = ?auto_411306 ?auto_411308 ) ) ( not ( = ?auto_411306 ?auto_411309 ) ) ( not ( = ?auto_411306 ?auto_411310 ) ) ( not ( = ?auto_411306 ?auto_411311 ) ) ( not ( = ?auto_411307 ?auto_411308 ) ) ( not ( = ?auto_411307 ?auto_411309 ) ) ( not ( = ?auto_411307 ?auto_411310 ) ) ( not ( = ?auto_411307 ?auto_411311 ) ) ( not ( = ?auto_411308 ?auto_411309 ) ) ( not ( = ?auto_411308 ?auto_411310 ) ) ( not ( = ?auto_411308 ?auto_411311 ) ) ( not ( = ?auto_411309 ?auto_411310 ) ) ( not ( = ?auto_411309 ?auto_411311 ) ) ( not ( = ?auto_411310 ?auto_411311 ) ) ( ON ?auto_411309 ?auto_411310 ) ( ON ?auto_411308 ?auto_411309 ) ( ON ?auto_411307 ?auto_411308 ) ( CLEAR ?auto_411305 ) ( ON ?auto_411306 ?auto_411307 ) ( CLEAR ?auto_411306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_411297 ?auto_411298 ?auto_411299 ?auto_411300 ?auto_411301 ?auto_411302 ?auto_411303 ?auto_411304 ?auto_411305 ?auto_411306 )
      ( MAKE-14PILE ?auto_411297 ?auto_411298 ?auto_411299 ?auto_411300 ?auto_411301 ?auto_411302 ?auto_411303 ?auto_411304 ?auto_411305 ?auto_411306 ?auto_411307 ?auto_411308 ?auto_411309 ?auto_411310 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411326 - BLOCK
      ?auto_411327 - BLOCK
      ?auto_411328 - BLOCK
      ?auto_411329 - BLOCK
      ?auto_411330 - BLOCK
      ?auto_411331 - BLOCK
      ?auto_411332 - BLOCK
      ?auto_411333 - BLOCK
      ?auto_411334 - BLOCK
      ?auto_411335 - BLOCK
      ?auto_411336 - BLOCK
      ?auto_411337 - BLOCK
      ?auto_411338 - BLOCK
      ?auto_411339 - BLOCK
    )
    :vars
    (
      ?auto_411340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411339 ?auto_411340 ) ( ON-TABLE ?auto_411326 ) ( ON ?auto_411327 ?auto_411326 ) ( ON ?auto_411328 ?auto_411327 ) ( ON ?auto_411329 ?auto_411328 ) ( ON ?auto_411330 ?auto_411329 ) ( ON ?auto_411331 ?auto_411330 ) ( ON ?auto_411332 ?auto_411331 ) ( ON ?auto_411333 ?auto_411332 ) ( not ( = ?auto_411326 ?auto_411327 ) ) ( not ( = ?auto_411326 ?auto_411328 ) ) ( not ( = ?auto_411326 ?auto_411329 ) ) ( not ( = ?auto_411326 ?auto_411330 ) ) ( not ( = ?auto_411326 ?auto_411331 ) ) ( not ( = ?auto_411326 ?auto_411332 ) ) ( not ( = ?auto_411326 ?auto_411333 ) ) ( not ( = ?auto_411326 ?auto_411334 ) ) ( not ( = ?auto_411326 ?auto_411335 ) ) ( not ( = ?auto_411326 ?auto_411336 ) ) ( not ( = ?auto_411326 ?auto_411337 ) ) ( not ( = ?auto_411326 ?auto_411338 ) ) ( not ( = ?auto_411326 ?auto_411339 ) ) ( not ( = ?auto_411326 ?auto_411340 ) ) ( not ( = ?auto_411327 ?auto_411328 ) ) ( not ( = ?auto_411327 ?auto_411329 ) ) ( not ( = ?auto_411327 ?auto_411330 ) ) ( not ( = ?auto_411327 ?auto_411331 ) ) ( not ( = ?auto_411327 ?auto_411332 ) ) ( not ( = ?auto_411327 ?auto_411333 ) ) ( not ( = ?auto_411327 ?auto_411334 ) ) ( not ( = ?auto_411327 ?auto_411335 ) ) ( not ( = ?auto_411327 ?auto_411336 ) ) ( not ( = ?auto_411327 ?auto_411337 ) ) ( not ( = ?auto_411327 ?auto_411338 ) ) ( not ( = ?auto_411327 ?auto_411339 ) ) ( not ( = ?auto_411327 ?auto_411340 ) ) ( not ( = ?auto_411328 ?auto_411329 ) ) ( not ( = ?auto_411328 ?auto_411330 ) ) ( not ( = ?auto_411328 ?auto_411331 ) ) ( not ( = ?auto_411328 ?auto_411332 ) ) ( not ( = ?auto_411328 ?auto_411333 ) ) ( not ( = ?auto_411328 ?auto_411334 ) ) ( not ( = ?auto_411328 ?auto_411335 ) ) ( not ( = ?auto_411328 ?auto_411336 ) ) ( not ( = ?auto_411328 ?auto_411337 ) ) ( not ( = ?auto_411328 ?auto_411338 ) ) ( not ( = ?auto_411328 ?auto_411339 ) ) ( not ( = ?auto_411328 ?auto_411340 ) ) ( not ( = ?auto_411329 ?auto_411330 ) ) ( not ( = ?auto_411329 ?auto_411331 ) ) ( not ( = ?auto_411329 ?auto_411332 ) ) ( not ( = ?auto_411329 ?auto_411333 ) ) ( not ( = ?auto_411329 ?auto_411334 ) ) ( not ( = ?auto_411329 ?auto_411335 ) ) ( not ( = ?auto_411329 ?auto_411336 ) ) ( not ( = ?auto_411329 ?auto_411337 ) ) ( not ( = ?auto_411329 ?auto_411338 ) ) ( not ( = ?auto_411329 ?auto_411339 ) ) ( not ( = ?auto_411329 ?auto_411340 ) ) ( not ( = ?auto_411330 ?auto_411331 ) ) ( not ( = ?auto_411330 ?auto_411332 ) ) ( not ( = ?auto_411330 ?auto_411333 ) ) ( not ( = ?auto_411330 ?auto_411334 ) ) ( not ( = ?auto_411330 ?auto_411335 ) ) ( not ( = ?auto_411330 ?auto_411336 ) ) ( not ( = ?auto_411330 ?auto_411337 ) ) ( not ( = ?auto_411330 ?auto_411338 ) ) ( not ( = ?auto_411330 ?auto_411339 ) ) ( not ( = ?auto_411330 ?auto_411340 ) ) ( not ( = ?auto_411331 ?auto_411332 ) ) ( not ( = ?auto_411331 ?auto_411333 ) ) ( not ( = ?auto_411331 ?auto_411334 ) ) ( not ( = ?auto_411331 ?auto_411335 ) ) ( not ( = ?auto_411331 ?auto_411336 ) ) ( not ( = ?auto_411331 ?auto_411337 ) ) ( not ( = ?auto_411331 ?auto_411338 ) ) ( not ( = ?auto_411331 ?auto_411339 ) ) ( not ( = ?auto_411331 ?auto_411340 ) ) ( not ( = ?auto_411332 ?auto_411333 ) ) ( not ( = ?auto_411332 ?auto_411334 ) ) ( not ( = ?auto_411332 ?auto_411335 ) ) ( not ( = ?auto_411332 ?auto_411336 ) ) ( not ( = ?auto_411332 ?auto_411337 ) ) ( not ( = ?auto_411332 ?auto_411338 ) ) ( not ( = ?auto_411332 ?auto_411339 ) ) ( not ( = ?auto_411332 ?auto_411340 ) ) ( not ( = ?auto_411333 ?auto_411334 ) ) ( not ( = ?auto_411333 ?auto_411335 ) ) ( not ( = ?auto_411333 ?auto_411336 ) ) ( not ( = ?auto_411333 ?auto_411337 ) ) ( not ( = ?auto_411333 ?auto_411338 ) ) ( not ( = ?auto_411333 ?auto_411339 ) ) ( not ( = ?auto_411333 ?auto_411340 ) ) ( not ( = ?auto_411334 ?auto_411335 ) ) ( not ( = ?auto_411334 ?auto_411336 ) ) ( not ( = ?auto_411334 ?auto_411337 ) ) ( not ( = ?auto_411334 ?auto_411338 ) ) ( not ( = ?auto_411334 ?auto_411339 ) ) ( not ( = ?auto_411334 ?auto_411340 ) ) ( not ( = ?auto_411335 ?auto_411336 ) ) ( not ( = ?auto_411335 ?auto_411337 ) ) ( not ( = ?auto_411335 ?auto_411338 ) ) ( not ( = ?auto_411335 ?auto_411339 ) ) ( not ( = ?auto_411335 ?auto_411340 ) ) ( not ( = ?auto_411336 ?auto_411337 ) ) ( not ( = ?auto_411336 ?auto_411338 ) ) ( not ( = ?auto_411336 ?auto_411339 ) ) ( not ( = ?auto_411336 ?auto_411340 ) ) ( not ( = ?auto_411337 ?auto_411338 ) ) ( not ( = ?auto_411337 ?auto_411339 ) ) ( not ( = ?auto_411337 ?auto_411340 ) ) ( not ( = ?auto_411338 ?auto_411339 ) ) ( not ( = ?auto_411338 ?auto_411340 ) ) ( not ( = ?auto_411339 ?auto_411340 ) ) ( ON ?auto_411338 ?auto_411339 ) ( ON ?auto_411337 ?auto_411338 ) ( ON ?auto_411336 ?auto_411337 ) ( ON ?auto_411335 ?auto_411336 ) ( CLEAR ?auto_411333 ) ( ON ?auto_411334 ?auto_411335 ) ( CLEAR ?auto_411334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_411326 ?auto_411327 ?auto_411328 ?auto_411329 ?auto_411330 ?auto_411331 ?auto_411332 ?auto_411333 ?auto_411334 )
      ( MAKE-14PILE ?auto_411326 ?auto_411327 ?auto_411328 ?auto_411329 ?auto_411330 ?auto_411331 ?auto_411332 ?auto_411333 ?auto_411334 ?auto_411335 ?auto_411336 ?auto_411337 ?auto_411338 ?auto_411339 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411355 - BLOCK
      ?auto_411356 - BLOCK
      ?auto_411357 - BLOCK
      ?auto_411358 - BLOCK
      ?auto_411359 - BLOCK
      ?auto_411360 - BLOCK
      ?auto_411361 - BLOCK
      ?auto_411362 - BLOCK
      ?auto_411363 - BLOCK
      ?auto_411364 - BLOCK
      ?auto_411365 - BLOCK
      ?auto_411366 - BLOCK
      ?auto_411367 - BLOCK
      ?auto_411368 - BLOCK
    )
    :vars
    (
      ?auto_411369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411368 ?auto_411369 ) ( ON-TABLE ?auto_411355 ) ( ON ?auto_411356 ?auto_411355 ) ( ON ?auto_411357 ?auto_411356 ) ( ON ?auto_411358 ?auto_411357 ) ( ON ?auto_411359 ?auto_411358 ) ( ON ?auto_411360 ?auto_411359 ) ( ON ?auto_411361 ?auto_411360 ) ( ON ?auto_411362 ?auto_411361 ) ( not ( = ?auto_411355 ?auto_411356 ) ) ( not ( = ?auto_411355 ?auto_411357 ) ) ( not ( = ?auto_411355 ?auto_411358 ) ) ( not ( = ?auto_411355 ?auto_411359 ) ) ( not ( = ?auto_411355 ?auto_411360 ) ) ( not ( = ?auto_411355 ?auto_411361 ) ) ( not ( = ?auto_411355 ?auto_411362 ) ) ( not ( = ?auto_411355 ?auto_411363 ) ) ( not ( = ?auto_411355 ?auto_411364 ) ) ( not ( = ?auto_411355 ?auto_411365 ) ) ( not ( = ?auto_411355 ?auto_411366 ) ) ( not ( = ?auto_411355 ?auto_411367 ) ) ( not ( = ?auto_411355 ?auto_411368 ) ) ( not ( = ?auto_411355 ?auto_411369 ) ) ( not ( = ?auto_411356 ?auto_411357 ) ) ( not ( = ?auto_411356 ?auto_411358 ) ) ( not ( = ?auto_411356 ?auto_411359 ) ) ( not ( = ?auto_411356 ?auto_411360 ) ) ( not ( = ?auto_411356 ?auto_411361 ) ) ( not ( = ?auto_411356 ?auto_411362 ) ) ( not ( = ?auto_411356 ?auto_411363 ) ) ( not ( = ?auto_411356 ?auto_411364 ) ) ( not ( = ?auto_411356 ?auto_411365 ) ) ( not ( = ?auto_411356 ?auto_411366 ) ) ( not ( = ?auto_411356 ?auto_411367 ) ) ( not ( = ?auto_411356 ?auto_411368 ) ) ( not ( = ?auto_411356 ?auto_411369 ) ) ( not ( = ?auto_411357 ?auto_411358 ) ) ( not ( = ?auto_411357 ?auto_411359 ) ) ( not ( = ?auto_411357 ?auto_411360 ) ) ( not ( = ?auto_411357 ?auto_411361 ) ) ( not ( = ?auto_411357 ?auto_411362 ) ) ( not ( = ?auto_411357 ?auto_411363 ) ) ( not ( = ?auto_411357 ?auto_411364 ) ) ( not ( = ?auto_411357 ?auto_411365 ) ) ( not ( = ?auto_411357 ?auto_411366 ) ) ( not ( = ?auto_411357 ?auto_411367 ) ) ( not ( = ?auto_411357 ?auto_411368 ) ) ( not ( = ?auto_411357 ?auto_411369 ) ) ( not ( = ?auto_411358 ?auto_411359 ) ) ( not ( = ?auto_411358 ?auto_411360 ) ) ( not ( = ?auto_411358 ?auto_411361 ) ) ( not ( = ?auto_411358 ?auto_411362 ) ) ( not ( = ?auto_411358 ?auto_411363 ) ) ( not ( = ?auto_411358 ?auto_411364 ) ) ( not ( = ?auto_411358 ?auto_411365 ) ) ( not ( = ?auto_411358 ?auto_411366 ) ) ( not ( = ?auto_411358 ?auto_411367 ) ) ( not ( = ?auto_411358 ?auto_411368 ) ) ( not ( = ?auto_411358 ?auto_411369 ) ) ( not ( = ?auto_411359 ?auto_411360 ) ) ( not ( = ?auto_411359 ?auto_411361 ) ) ( not ( = ?auto_411359 ?auto_411362 ) ) ( not ( = ?auto_411359 ?auto_411363 ) ) ( not ( = ?auto_411359 ?auto_411364 ) ) ( not ( = ?auto_411359 ?auto_411365 ) ) ( not ( = ?auto_411359 ?auto_411366 ) ) ( not ( = ?auto_411359 ?auto_411367 ) ) ( not ( = ?auto_411359 ?auto_411368 ) ) ( not ( = ?auto_411359 ?auto_411369 ) ) ( not ( = ?auto_411360 ?auto_411361 ) ) ( not ( = ?auto_411360 ?auto_411362 ) ) ( not ( = ?auto_411360 ?auto_411363 ) ) ( not ( = ?auto_411360 ?auto_411364 ) ) ( not ( = ?auto_411360 ?auto_411365 ) ) ( not ( = ?auto_411360 ?auto_411366 ) ) ( not ( = ?auto_411360 ?auto_411367 ) ) ( not ( = ?auto_411360 ?auto_411368 ) ) ( not ( = ?auto_411360 ?auto_411369 ) ) ( not ( = ?auto_411361 ?auto_411362 ) ) ( not ( = ?auto_411361 ?auto_411363 ) ) ( not ( = ?auto_411361 ?auto_411364 ) ) ( not ( = ?auto_411361 ?auto_411365 ) ) ( not ( = ?auto_411361 ?auto_411366 ) ) ( not ( = ?auto_411361 ?auto_411367 ) ) ( not ( = ?auto_411361 ?auto_411368 ) ) ( not ( = ?auto_411361 ?auto_411369 ) ) ( not ( = ?auto_411362 ?auto_411363 ) ) ( not ( = ?auto_411362 ?auto_411364 ) ) ( not ( = ?auto_411362 ?auto_411365 ) ) ( not ( = ?auto_411362 ?auto_411366 ) ) ( not ( = ?auto_411362 ?auto_411367 ) ) ( not ( = ?auto_411362 ?auto_411368 ) ) ( not ( = ?auto_411362 ?auto_411369 ) ) ( not ( = ?auto_411363 ?auto_411364 ) ) ( not ( = ?auto_411363 ?auto_411365 ) ) ( not ( = ?auto_411363 ?auto_411366 ) ) ( not ( = ?auto_411363 ?auto_411367 ) ) ( not ( = ?auto_411363 ?auto_411368 ) ) ( not ( = ?auto_411363 ?auto_411369 ) ) ( not ( = ?auto_411364 ?auto_411365 ) ) ( not ( = ?auto_411364 ?auto_411366 ) ) ( not ( = ?auto_411364 ?auto_411367 ) ) ( not ( = ?auto_411364 ?auto_411368 ) ) ( not ( = ?auto_411364 ?auto_411369 ) ) ( not ( = ?auto_411365 ?auto_411366 ) ) ( not ( = ?auto_411365 ?auto_411367 ) ) ( not ( = ?auto_411365 ?auto_411368 ) ) ( not ( = ?auto_411365 ?auto_411369 ) ) ( not ( = ?auto_411366 ?auto_411367 ) ) ( not ( = ?auto_411366 ?auto_411368 ) ) ( not ( = ?auto_411366 ?auto_411369 ) ) ( not ( = ?auto_411367 ?auto_411368 ) ) ( not ( = ?auto_411367 ?auto_411369 ) ) ( not ( = ?auto_411368 ?auto_411369 ) ) ( ON ?auto_411367 ?auto_411368 ) ( ON ?auto_411366 ?auto_411367 ) ( ON ?auto_411365 ?auto_411366 ) ( ON ?auto_411364 ?auto_411365 ) ( CLEAR ?auto_411362 ) ( ON ?auto_411363 ?auto_411364 ) ( CLEAR ?auto_411363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_411355 ?auto_411356 ?auto_411357 ?auto_411358 ?auto_411359 ?auto_411360 ?auto_411361 ?auto_411362 ?auto_411363 )
      ( MAKE-14PILE ?auto_411355 ?auto_411356 ?auto_411357 ?auto_411358 ?auto_411359 ?auto_411360 ?auto_411361 ?auto_411362 ?auto_411363 ?auto_411364 ?auto_411365 ?auto_411366 ?auto_411367 ?auto_411368 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411384 - BLOCK
      ?auto_411385 - BLOCK
      ?auto_411386 - BLOCK
      ?auto_411387 - BLOCK
      ?auto_411388 - BLOCK
      ?auto_411389 - BLOCK
      ?auto_411390 - BLOCK
      ?auto_411391 - BLOCK
      ?auto_411392 - BLOCK
      ?auto_411393 - BLOCK
      ?auto_411394 - BLOCK
      ?auto_411395 - BLOCK
      ?auto_411396 - BLOCK
      ?auto_411397 - BLOCK
    )
    :vars
    (
      ?auto_411398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411397 ?auto_411398 ) ( ON-TABLE ?auto_411384 ) ( ON ?auto_411385 ?auto_411384 ) ( ON ?auto_411386 ?auto_411385 ) ( ON ?auto_411387 ?auto_411386 ) ( ON ?auto_411388 ?auto_411387 ) ( ON ?auto_411389 ?auto_411388 ) ( ON ?auto_411390 ?auto_411389 ) ( not ( = ?auto_411384 ?auto_411385 ) ) ( not ( = ?auto_411384 ?auto_411386 ) ) ( not ( = ?auto_411384 ?auto_411387 ) ) ( not ( = ?auto_411384 ?auto_411388 ) ) ( not ( = ?auto_411384 ?auto_411389 ) ) ( not ( = ?auto_411384 ?auto_411390 ) ) ( not ( = ?auto_411384 ?auto_411391 ) ) ( not ( = ?auto_411384 ?auto_411392 ) ) ( not ( = ?auto_411384 ?auto_411393 ) ) ( not ( = ?auto_411384 ?auto_411394 ) ) ( not ( = ?auto_411384 ?auto_411395 ) ) ( not ( = ?auto_411384 ?auto_411396 ) ) ( not ( = ?auto_411384 ?auto_411397 ) ) ( not ( = ?auto_411384 ?auto_411398 ) ) ( not ( = ?auto_411385 ?auto_411386 ) ) ( not ( = ?auto_411385 ?auto_411387 ) ) ( not ( = ?auto_411385 ?auto_411388 ) ) ( not ( = ?auto_411385 ?auto_411389 ) ) ( not ( = ?auto_411385 ?auto_411390 ) ) ( not ( = ?auto_411385 ?auto_411391 ) ) ( not ( = ?auto_411385 ?auto_411392 ) ) ( not ( = ?auto_411385 ?auto_411393 ) ) ( not ( = ?auto_411385 ?auto_411394 ) ) ( not ( = ?auto_411385 ?auto_411395 ) ) ( not ( = ?auto_411385 ?auto_411396 ) ) ( not ( = ?auto_411385 ?auto_411397 ) ) ( not ( = ?auto_411385 ?auto_411398 ) ) ( not ( = ?auto_411386 ?auto_411387 ) ) ( not ( = ?auto_411386 ?auto_411388 ) ) ( not ( = ?auto_411386 ?auto_411389 ) ) ( not ( = ?auto_411386 ?auto_411390 ) ) ( not ( = ?auto_411386 ?auto_411391 ) ) ( not ( = ?auto_411386 ?auto_411392 ) ) ( not ( = ?auto_411386 ?auto_411393 ) ) ( not ( = ?auto_411386 ?auto_411394 ) ) ( not ( = ?auto_411386 ?auto_411395 ) ) ( not ( = ?auto_411386 ?auto_411396 ) ) ( not ( = ?auto_411386 ?auto_411397 ) ) ( not ( = ?auto_411386 ?auto_411398 ) ) ( not ( = ?auto_411387 ?auto_411388 ) ) ( not ( = ?auto_411387 ?auto_411389 ) ) ( not ( = ?auto_411387 ?auto_411390 ) ) ( not ( = ?auto_411387 ?auto_411391 ) ) ( not ( = ?auto_411387 ?auto_411392 ) ) ( not ( = ?auto_411387 ?auto_411393 ) ) ( not ( = ?auto_411387 ?auto_411394 ) ) ( not ( = ?auto_411387 ?auto_411395 ) ) ( not ( = ?auto_411387 ?auto_411396 ) ) ( not ( = ?auto_411387 ?auto_411397 ) ) ( not ( = ?auto_411387 ?auto_411398 ) ) ( not ( = ?auto_411388 ?auto_411389 ) ) ( not ( = ?auto_411388 ?auto_411390 ) ) ( not ( = ?auto_411388 ?auto_411391 ) ) ( not ( = ?auto_411388 ?auto_411392 ) ) ( not ( = ?auto_411388 ?auto_411393 ) ) ( not ( = ?auto_411388 ?auto_411394 ) ) ( not ( = ?auto_411388 ?auto_411395 ) ) ( not ( = ?auto_411388 ?auto_411396 ) ) ( not ( = ?auto_411388 ?auto_411397 ) ) ( not ( = ?auto_411388 ?auto_411398 ) ) ( not ( = ?auto_411389 ?auto_411390 ) ) ( not ( = ?auto_411389 ?auto_411391 ) ) ( not ( = ?auto_411389 ?auto_411392 ) ) ( not ( = ?auto_411389 ?auto_411393 ) ) ( not ( = ?auto_411389 ?auto_411394 ) ) ( not ( = ?auto_411389 ?auto_411395 ) ) ( not ( = ?auto_411389 ?auto_411396 ) ) ( not ( = ?auto_411389 ?auto_411397 ) ) ( not ( = ?auto_411389 ?auto_411398 ) ) ( not ( = ?auto_411390 ?auto_411391 ) ) ( not ( = ?auto_411390 ?auto_411392 ) ) ( not ( = ?auto_411390 ?auto_411393 ) ) ( not ( = ?auto_411390 ?auto_411394 ) ) ( not ( = ?auto_411390 ?auto_411395 ) ) ( not ( = ?auto_411390 ?auto_411396 ) ) ( not ( = ?auto_411390 ?auto_411397 ) ) ( not ( = ?auto_411390 ?auto_411398 ) ) ( not ( = ?auto_411391 ?auto_411392 ) ) ( not ( = ?auto_411391 ?auto_411393 ) ) ( not ( = ?auto_411391 ?auto_411394 ) ) ( not ( = ?auto_411391 ?auto_411395 ) ) ( not ( = ?auto_411391 ?auto_411396 ) ) ( not ( = ?auto_411391 ?auto_411397 ) ) ( not ( = ?auto_411391 ?auto_411398 ) ) ( not ( = ?auto_411392 ?auto_411393 ) ) ( not ( = ?auto_411392 ?auto_411394 ) ) ( not ( = ?auto_411392 ?auto_411395 ) ) ( not ( = ?auto_411392 ?auto_411396 ) ) ( not ( = ?auto_411392 ?auto_411397 ) ) ( not ( = ?auto_411392 ?auto_411398 ) ) ( not ( = ?auto_411393 ?auto_411394 ) ) ( not ( = ?auto_411393 ?auto_411395 ) ) ( not ( = ?auto_411393 ?auto_411396 ) ) ( not ( = ?auto_411393 ?auto_411397 ) ) ( not ( = ?auto_411393 ?auto_411398 ) ) ( not ( = ?auto_411394 ?auto_411395 ) ) ( not ( = ?auto_411394 ?auto_411396 ) ) ( not ( = ?auto_411394 ?auto_411397 ) ) ( not ( = ?auto_411394 ?auto_411398 ) ) ( not ( = ?auto_411395 ?auto_411396 ) ) ( not ( = ?auto_411395 ?auto_411397 ) ) ( not ( = ?auto_411395 ?auto_411398 ) ) ( not ( = ?auto_411396 ?auto_411397 ) ) ( not ( = ?auto_411396 ?auto_411398 ) ) ( not ( = ?auto_411397 ?auto_411398 ) ) ( ON ?auto_411396 ?auto_411397 ) ( ON ?auto_411395 ?auto_411396 ) ( ON ?auto_411394 ?auto_411395 ) ( ON ?auto_411393 ?auto_411394 ) ( ON ?auto_411392 ?auto_411393 ) ( CLEAR ?auto_411390 ) ( ON ?auto_411391 ?auto_411392 ) ( CLEAR ?auto_411391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_411384 ?auto_411385 ?auto_411386 ?auto_411387 ?auto_411388 ?auto_411389 ?auto_411390 ?auto_411391 )
      ( MAKE-14PILE ?auto_411384 ?auto_411385 ?auto_411386 ?auto_411387 ?auto_411388 ?auto_411389 ?auto_411390 ?auto_411391 ?auto_411392 ?auto_411393 ?auto_411394 ?auto_411395 ?auto_411396 ?auto_411397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411413 - BLOCK
      ?auto_411414 - BLOCK
      ?auto_411415 - BLOCK
      ?auto_411416 - BLOCK
      ?auto_411417 - BLOCK
      ?auto_411418 - BLOCK
      ?auto_411419 - BLOCK
      ?auto_411420 - BLOCK
      ?auto_411421 - BLOCK
      ?auto_411422 - BLOCK
      ?auto_411423 - BLOCK
      ?auto_411424 - BLOCK
      ?auto_411425 - BLOCK
      ?auto_411426 - BLOCK
    )
    :vars
    (
      ?auto_411427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411426 ?auto_411427 ) ( ON-TABLE ?auto_411413 ) ( ON ?auto_411414 ?auto_411413 ) ( ON ?auto_411415 ?auto_411414 ) ( ON ?auto_411416 ?auto_411415 ) ( ON ?auto_411417 ?auto_411416 ) ( ON ?auto_411418 ?auto_411417 ) ( ON ?auto_411419 ?auto_411418 ) ( not ( = ?auto_411413 ?auto_411414 ) ) ( not ( = ?auto_411413 ?auto_411415 ) ) ( not ( = ?auto_411413 ?auto_411416 ) ) ( not ( = ?auto_411413 ?auto_411417 ) ) ( not ( = ?auto_411413 ?auto_411418 ) ) ( not ( = ?auto_411413 ?auto_411419 ) ) ( not ( = ?auto_411413 ?auto_411420 ) ) ( not ( = ?auto_411413 ?auto_411421 ) ) ( not ( = ?auto_411413 ?auto_411422 ) ) ( not ( = ?auto_411413 ?auto_411423 ) ) ( not ( = ?auto_411413 ?auto_411424 ) ) ( not ( = ?auto_411413 ?auto_411425 ) ) ( not ( = ?auto_411413 ?auto_411426 ) ) ( not ( = ?auto_411413 ?auto_411427 ) ) ( not ( = ?auto_411414 ?auto_411415 ) ) ( not ( = ?auto_411414 ?auto_411416 ) ) ( not ( = ?auto_411414 ?auto_411417 ) ) ( not ( = ?auto_411414 ?auto_411418 ) ) ( not ( = ?auto_411414 ?auto_411419 ) ) ( not ( = ?auto_411414 ?auto_411420 ) ) ( not ( = ?auto_411414 ?auto_411421 ) ) ( not ( = ?auto_411414 ?auto_411422 ) ) ( not ( = ?auto_411414 ?auto_411423 ) ) ( not ( = ?auto_411414 ?auto_411424 ) ) ( not ( = ?auto_411414 ?auto_411425 ) ) ( not ( = ?auto_411414 ?auto_411426 ) ) ( not ( = ?auto_411414 ?auto_411427 ) ) ( not ( = ?auto_411415 ?auto_411416 ) ) ( not ( = ?auto_411415 ?auto_411417 ) ) ( not ( = ?auto_411415 ?auto_411418 ) ) ( not ( = ?auto_411415 ?auto_411419 ) ) ( not ( = ?auto_411415 ?auto_411420 ) ) ( not ( = ?auto_411415 ?auto_411421 ) ) ( not ( = ?auto_411415 ?auto_411422 ) ) ( not ( = ?auto_411415 ?auto_411423 ) ) ( not ( = ?auto_411415 ?auto_411424 ) ) ( not ( = ?auto_411415 ?auto_411425 ) ) ( not ( = ?auto_411415 ?auto_411426 ) ) ( not ( = ?auto_411415 ?auto_411427 ) ) ( not ( = ?auto_411416 ?auto_411417 ) ) ( not ( = ?auto_411416 ?auto_411418 ) ) ( not ( = ?auto_411416 ?auto_411419 ) ) ( not ( = ?auto_411416 ?auto_411420 ) ) ( not ( = ?auto_411416 ?auto_411421 ) ) ( not ( = ?auto_411416 ?auto_411422 ) ) ( not ( = ?auto_411416 ?auto_411423 ) ) ( not ( = ?auto_411416 ?auto_411424 ) ) ( not ( = ?auto_411416 ?auto_411425 ) ) ( not ( = ?auto_411416 ?auto_411426 ) ) ( not ( = ?auto_411416 ?auto_411427 ) ) ( not ( = ?auto_411417 ?auto_411418 ) ) ( not ( = ?auto_411417 ?auto_411419 ) ) ( not ( = ?auto_411417 ?auto_411420 ) ) ( not ( = ?auto_411417 ?auto_411421 ) ) ( not ( = ?auto_411417 ?auto_411422 ) ) ( not ( = ?auto_411417 ?auto_411423 ) ) ( not ( = ?auto_411417 ?auto_411424 ) ) ( not ( = ?auto_411417 ?auto_411425 ) ) ( not ( = ?auto_411417 ?auto_411426 ) ) ( not ( = ?auto_411417 ?auto_411427 ) ) ( not ( = ?auto_411418 ?auto_411419 ) ) ( not ( = ?auto_411418 ?auto_411420 ) ) ( not ( = ?auto_411418 ?auto_411421 ) ) ( not ( = ?auto_411418 ?auto_411422 ) ) ( not ( = ?auto_411418 ?auto_411423 ) ) ( not ( = ?auto_411418 ?auto_411424 ) ) ( not ( = ?auto_411418 ?auto_411425 ) ) ( not ( = ?auto_411418 ?auto_411426 ) ) ( not ( = ?auto_411418 ?auto_411427 ) ) ( not ( = ?auto_411419 ?auto_411420 ) ) ( not ( = ?auto_411419 ?auto_411421 ) ) ( not ( = ?auto_411419 ?auto_411422 ) ) ( not ( = ?auto_411419 ?auto_411423 ) ) ( not ( = ?auto_411419 ?auto_411424 ) ) ( not ( = ?auto_411419 ?auto_411425 ) ) ( not ( = ?auto_411419 ?auto_411426 ) ) ( not ( = ?auto_411419 ?auto_411427 ) ) ( not ( = ?auto_411420 ?auto_411421 ) ) ( not ( = ?auto_411420 ?auto_411422 ) ) ( not ( = ?auto_411420 ?auto_411423 ) ) ( not ( = ?auto_411420 ?auto_411424 ) ) ( not ( = ?auto_411420 ?auto_411425 ) ) ( not ( = ?auto_411420 ?auto_411426 ) ) ( not ( = ?auto_411420 ?auto_411427 ) ) ( not ( = ?auto_411421 ?auto_411422 ) ) ( not ( = ?auto_411421 ?auto_411423 ) ) ( not ( = ?auto_411421 ?auto_411424 ) ) ( not ( = ?auto_411421 ?auto_411425 ) ) ( not ( = ?auto_411421 ?auto_411426 ) ) ( not ( = ?auto_411421 ?auto_411427 ) ) ( not ( = ?auto_411422 ?auto_411423 ) ) ( not ( = ?auto_411422 ?auto_411424 ) ) ( not ( = ?auto_411422 ?auto_411425 ) ) ( not ( = ?auto_411422 ?auto_411426 ) ) ( not ( = ?auto_411422 ?auto_411427 ) ) ( not ( = ?auto_411423 ?auto_411424 ) ) ( not ( = ?auto_411423 ?auto_411425 ) ) ( not ( = ?auto_411423 ?auto_411426 ) ) ( not ( = ?auto_411423 ?auto_411427 ) ) ( not ( = ?auto_411424 ?auto_411425 ) ) ( not ( = ?auto_411424 ?auto_411426 ) ) ( not ( = ?auto_411424 ?auto_411427 ) ) ( not ( = ?auto_411425 ?auto_411426 ) ) ( not ( = ?auto_411425 ?auto_411427 ) ) ( not ( = ?auto_411426 ?auto_411427 ) ) ( ON ?auto_411425 ?auto_411426 ) ( ON ?auto_411424 ?auto_411425 ) ( ON ?auto_411423 ?auto_411424 ) ( ON ?auto_411422 ?auto_411423 ) ( ON ?auto_411421 ?auto_411422 ) ( CLEAR ?auto_411419 ) ( ON ?auto_411420 ?auto_411421 ) ( CLEAR ?auto_411420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_411413 ?auto_411414 ?auto_411415 ?auto_411416 ?auto_411417 ?auto_411418 ?auto_411419 ?auto_411420 )
      ( MAKE-14PILE ?auto_411413 ?auto_411414 ?auto_411415 ?auto_411416 ?auto_411417 ?auto_411418 ?auto_411419 ?auto_411420 ?auto_411421 ?auto_411422 ?auto_411423 ?auto_411424 ?auto_411425 ?auto_411426 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411442 - BLOCK
      ?auto_411443 - BLOCK
      ?auto_411444 - BLOCK
      ?auto_411445 - BLOCK
      ?auto_411446 - BLOCK
      ?auto_411447 - BLOCK
      ?auto_411448 - BLOCK
      ?auto_411449 - BLOCK
      ?auto_411450 - BLOCK
      ?auto_411451 - BLOCK
      ?auto_411452 - BLOCK
      ?auto_411453 - BLOCK
      ?auto_411454 - BLOCK
      ?auto_411455 - BLOCK
    )
    :vars
    (
      ?auto_411456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411455 ?auto_411456 ) ( ON-TABLE ?auto_411442 ) ( ON ?auto_411443 ?auto_411442 ) ( ON ?auto_411444 ?auto_411443 ) ( ON ?auto_411445 ?auto_411444 ) ( ON ?auto_411446 ?auto_411445 ) ( ON ?auto_411447 ?auto_411446 ) ( not ( = ?auto_411442 ?auto_411443 ) ) ( not ( = ?auto_411442 ?auto_411444 ) ) ( not ( = ?auto_411442 ?auto_411445 ) ) ( not ( = ?auto_411442 ?auto_411446 ) ) ( not ( = ?auto_411442 ?auto_411447 ) ) ( not ( = ?auto_411442 ?auto_411448 ) ) ( not ( = ?auto_411442 ?auto_411449 ) ) ( not ( = ?auto_411442 ?auto_411450 ) ) ( not ( = ?auto_411442 ?auto_411451 ) ) ( not ( = ?auto_411442 ?auto_411452 ) ) ( not ( = ?auto_411442 ?auto_411453 ) ) ( not ( = ?auto_411442 ?auto_411454 ) ) ( not ( = ?auto_411442 ?auto_411455 ) ) ( not ( = ?auto_411442 ?auto_411456 ) ) ( not ( = ?auto_411443 ?auto_411444 ) ) ( not ( = ?auto_411443 ?auto_411445 ) ) ( not ( = ?auto_411443 ?auto_411446 ) ) ( not ( = ?auto_411443 ?auto_411447 ) ) ( not ( = ?auto_411443 ?auto_411448 ) ) ( not ( = ?auto_411443 ?auto_411449 ) ) ( not ( = ?auto_411443 ?auto_411450 ) ) ( not ( = ?auto_411443 ?auto_411451 ) ) ( not ( = ?auto_411443 ?auto_411452 ) ) ( not ( = ?auto_411443 ?auto_411453 ) ) ( not ( = ?auto_411443 ?auto_411454 ) ) ( not ( = ?auto_411443 ?auto_411455 ) ) ( not ( = ?auto_411443 ?auto_411456 ) ) ( not ( = ?auto_411444 ?auto_411445 ) ) ( not ( = ?auto_411444 ?auto_411446 ) ) ( not ( = ?auto_411444 ?auto_411447 ) ) ( not ( = ?auto_411444 ?auto_411448 ) ) ( not ( = ?auto_411444 ?auto_411449 ) ) ( not ( = ?auto_411444 ?auto_411450 ) ) ( not ( = ?auto_411444 ?auto_411451 ) ) ( not ( = ?auto_411444 ?auto_411452 ) ) ( not ( = ?auto_411444 ?auto_411453 ) ) ( not ( = ?auto_411444 ?auto_411454 ) ) ( not ( = ?auto_411444 ?auto_411455 ) ) ( not ( = ?auto_411444 ?auto_411456 ) ) ( not ( = ?auto_411445 ?auto_411446 ) ) ( not ( = ?auto_411445 ?auto_411447 ) ) ( not ( = ?auto_411445 ?auto_411448 ) ) ( not ( = ?auto_411445 ?auto_411449 ) ) ( not ( = ?auto_411445 ?auto_411450 ) ) ( not ( = ?auto_411445 ?auto_411451 ) ) ( not ( = ?auto_411445 ?auto_411452 ) ) ( not ( = ?auto_411445 ?auto_411453 ) ) ( not ( = ?auto_411445 ?auto_411454 ) ) ( not ( = ?auto_411445 ?auto_411455 ) ) ( not ( = ?auto_411445 ?auto_411456 ) ) ( not ( = ?auto_411446 ?auto_411447 ) ) ( not ( = ?auto_411446 ?auto_411448 ) ) ( not ( = ?auto_411446 ?auto_411449 ) ) ( not ( = ?auto_411446 ?auto_411450 ) ) ( not ( = ?auto_411446 ?auto_411451 ) ) ( not ( = ?auto_411446 ?auto_411452 ) ) ( not ( = ?auto_411446 ?auto_411453 ) ) ( not ( = ?auto_411446 ?auto_411454 ) ) ( not ( = ?auto_411446 ?auto_411455 ) ) ( not ( = ?auto_411446 ?auto_411456 ) ) ( not ( = ?auto_411447 ?auto_411448 ) ) ( not ( = ?auto_411447 ?auto_411449 ) ) ( not ( = ?auto_411447 ?auto_411450 ) ) ( not ( = ?auto_411447 ?auto_411451 ) ) ( not ( = ?auto_411447 ?auto_411452 ) ) ( not ( = ?auto_411447 ?auto_411453 ) ) ( not ( = ?auto_411447 ?auto_411454 ) ) ( not ( = ?auto_411447 ?auto_411455 ) ) ( not ( = ?auto_411447 ?auto_411456 ) ) ( not ( = ?auto_411448 ?auto_411449 ) ) ( not ( = ?auto_411448 ?auto_411450 ) ) ( not ( = ?auto_411448 ?auto_411451 ) ) ( not ( = ?auto_411448 ?auto_411452 ) ) ( not ( = ?auto_411448 ?auto_411453 ) ) ( not ( = ?auto_411448 ?auto_411454 ) ) ( not ( = ?auto_411448 ?auto_411455 ) ) ( not ( = ?auto_411448 ?auto_411456 ) ) ( not ( = ?auto_411449 ?auto_411450 ) ) ( not ( = ?auto_411449 ?auto_411451 ) ) ( not ( = ?auto_411449 ?auto_411452 ) ) ( not ( = ?auto_411449 ?auto_411453 ) ) ( not ( = ?auto_411449 ?auto_411454 ) ) ( not ( = ?auto_411449 ?auto_411455 ) ) ( not ( = ?auto_411449 ?auto_411456 ) ) ( not ( = ?auto_411450 ?auto_411451 ) ) ( not ( = ?auto_411450 ?auto_411452 ) ) ( not ( = ?auto_411450 ?auto_411453 ) ) ( not ( = ?auto_411450 ?auto_411454 ) ) ( not ( = ?auto_411450 ?auto_411455 ) ) ( not ( = ?auto_411450 ?auto_411456 ) ) ( not ( = ?auto_411451 ?auto_411452 ) ) ( not ( = ?auto_411451 ?auto_411453 ) ) ( not ( = ?auto_411451 ?auto_411454 ) ) ( not ( = ?auto_411451 ?auto_411455 ) ) ( not ( = ?auto_411451 ?auto_411456 ) ) ( not ( = ?auto_411452 ?auto_411453 ) ) ( not ( = ?auto_411452 ?auto_411454 ) ) ( not ( = ?auto_411452 ?auto_411455 ) ) ( not ( = ?auto_411452 ?auto_411456 ) ) ( not ( = ?auto_411453 ?auto_411454 ) ) ( not ( = ?auto_411453 ?auto_411455 ) ) ( not ( = ?auto_411453 ?auto_411456 ) ) ( not ( = ?auto_411454 ?auto_411455 ) ) ( not ( = ?auto_411454 ?auto_411456 ) ) ( not ( = ?auto_411455 ?auto_411456 ) ) ( ON ?auto_411454 ?auto_411455 ) ( ON ?auto_411453 ?auto_411454 ) ( ON ?auto_411452 ?auto_411453 ) ( ON ?auto_411451 ?auto_411452 ) ( ON ?auto_411450 ?auto_411451 ) ( ON ?auto_411449 ?auto_411450 ) ( CLEAR ?auto_411447 ) ( ON ?auto_411448 ?auto_411449 ) ( CLEAR ?auto_411448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_411442 ?auto_411443 ?auto_411444 ?auto_411445 ?auto_411446 ?auto_411447 ?auto_411448 )
      ( MAKE-14PILE ?auto_411442 ?auto_411443 ?auto_411444 ?auto_411445 ?auto_411446 ?auto_411447 ?auto_411448 ?auto_411449 ?auto_411450 ?auto_411451 ?auto_411452 ?auto_411453 ?auto_411454 ?auto_411455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411471 - BLOCK
      ?auto_411472 - BLOCK
      ?auto_411473 - BLOCK
      ?auto_411474 - BLOCK
      ?auto_411475 - BLOCK
      ?auto_411476 - BLOCK
      ?auto_411477 - BLOCK
      ?auto_411478 - BLOCK
      ?auto_411479 - BLOCK
      ?auto_411480 - BLOCK
      ?auto_411481 - BLOCK
      ?auto_411482 - BLOCK
      ?auto_411483 - BLOCK
      ?auto_411484 - BLOCK
    )
    :vars
    (
      ?auto_411485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411484 ?auto_411485 ) ( ON-TABLE ?auto_411471 ) ( ON ?auto_411472 ?auto_411471 ) ( ON ?auto_411473 ?auto_411472 ) ( ON ?auto_411474 ?auto_411473 ) ( ON ?auto_411475 ?auto_411474 ) ( ON ?auto_411476 ?auto_411475 ) ( not ( = ?auto_411471 ?auto_411472 ) ) ( not ( = ?auto_411471 ?auto_411473 ) ) ( not ( = ?auto_411471 ?auto_411474 ) ) ( not ( = ?auto_411471 ?auto_411475 ) ) ( not ( = ?auto_411471 ?auto_411476 ) ) ( not ( = ?auto_411471 ?auto_411477 ) ) ( not ( = ?auto_411471 ?auto_411478 ) ) ( not ( = ?auto_411471 ?auto_411479 ) ) ( not ( = ?auto_411471 ?auto_411480 ) ) ( not ( = ?auto_411471 ?auto_411481 ) ) ( not ( = ?auto_411471 ?auto_411482 ) ) ( not ( = ?auto_411471 ?auto_411483 ) ) ( not ( = ?auto_411471 ?auto_411484 ) ) ( not ( = ?auto_411471 ?auto_411485 ) ) ( not ( = ?auto_411472 ?auto_411473 ) ) ( not ( = ?auto_411472 ?auto_411474 ) ) ( not ( = ?auto_411472 ?auto_411475 ) ) ( not ( = ?auto_411472 ?auto_411476 ) ) ( not ( = ?auto_411472 ?auto_411477 ) ) ( not ( = ?auto_411472 ?auto_411478 ) ) ( not ( = ?auto_411472 ?auto_411479 ) ) ( not ( = ?auto_411472 ?auto_411480 ) ) ( not ( = ?auto_411472 ?auto_411481 ) ) ( not ( = ?auto_411472 ?auto_411482 ) ) ( not ( = ?auto_411472 ?auto_411483 ) ) ( not ( = ?auto_411472 ?auto_411484 ) ) ( not ( = ?auto_411472 ?auto_411485 ) ) ( not ( = ?auto_411473 ?auto_411474 ) ) ( not ( = ?auto_411473 ?auto_411475 ) ) ( not ( = ?auto_411473 ?auto_411476 ) ) ( not ( = ?auto_411473 ?auto_411477 ) ) ( not ( = ?auto_411473 ?auto_411478 ) ) ( not ( = ?auto_411473 ?auto_411479 ) ) ( not ( = ?auto_411473 ?auto_411480 ) ) ( not ( = ?auto_411473 ?auto_411481 ) ) ( not ( = ?auto_411473 ?auto_411482 ) ) ( not ( = ?auto_411473 ?auto_411483 ) ) ( not ( = ?auto_411473 ?auto_411484 ) ) ( not ( = ?auto_411473 ?auto_411485 ) ) ( not ( = ?auto_411474 ?auto_411475 ) ) ( not ( = ?auto_411474 ?auto_411476 ) ) ( not ( = ?auto_411474 ?auto_411477 ) ) ( not ( = ?auto_411474 ?auto_411478 ) ) ( not ( = ?auto_411474 ?auto_411479 ) ) ( not ( = ?auto_411474 ?auto_411480 ) ) ( not ( = ?auto_411474 ?auto_411481 ) ) ( not ( = ?auto_411474 ?auto_411482 ) ) ( not ( = ?auto_411474 ?auto_411483 ) ) ( not ( = ?auto_411474 ?auto_411484 ) ) ( not ( = ?auto_411474 ?auto_411485 ) ) ( not ( = ?auto_411475 ?auto_411476 ) ) ( not ( = ?auto_411475 ?auto_411477 ) ) ( not ( = ?auto_411475 ?auto_411478 ) ) ( not ( = ?auto_411475 ?auto_411479 ) ) ( not ( = ?auto_411475 ?auto_411480 ) ) ( not ( = ?auto_411475 ?auto_411481 ) ) ( not ( = ?auto_411475 ?auto_411482 ) ) ( not ( = ?auto_411475 ?auto_411483 ) ) ( not ( = ?auto_411475 ?auto_411484 ) ) ( not ( = ?auto_411475 ?auto_411485 ) ) ( not ( = ?auto_411476 ?auto_411477 ) ) ( not ( = ?auto_411476 ?auto_411478 ) ) ( not ( = ?auto_411476 ?auto_411479 ) ) ( not ( = ?auto_411476 ?auto_411480 ) ) ( not ( = ?auto_411476 ?auto_411481 ) ) ( not ( = ?auto_411476 ?auto_411482 ) ) ( not ( = ?auto_411476 ?auto_411483 ) ) ( not ( = ?auto_411476 ?auto_411484 ) ) ( not ( = ?auto_411476 ?auto_411485 ) ) ( not ( = ?auto_411477 ?auto_411478 ) ) ( not ( = ?auto_411477 ?auto_411479 ) ) ( not ( = ?auto_411477 ?auto_411480 ) ) ( not ( = ?auto_411477 ?auto_411481 ) ) ( not ( = ?auto_411477 ?auto_411482 ) ) ( not ( = ?auto_411477 ?auto_411483 ) ) ( not ( = ?auto_411477 ?auto_411484 ) ) ( not ( = ?auto_411477 ?auto_411485 ) ) ( not ( = ?auto_411478 ?auto_411479 ) ) ( not ( = ?auto_411478 ?auto_411480 ) ) ( not ( = ?auto_411478 ?auto_411481 ) ) ( not ( = ?auto_411478 ?auto_411482 ) ) ( not ( = ?auto_411478 ?auto_411483 ) ) ( not ( = ?auto_411478 ?auto_411484 ) ) ( not ( = ?auto_411478 ?auto_411485 ) ) ( not ( = ?auto_411479 ?auto_411480 ) ) ( not ( = ?auto_411479 ?auto_411481 ) ) ( not ( = ?auto_411479 ?auto_411482 ) ) ( not ( = ?auto_411479 ?auto_411483 ) ) ( not ( = ?auto_411479 ?auto_411484 ) ) ( not ( = ?auto_411479 ?auto_411485 ) ) ( not ( = ?auto_411480 ?auto_411481 ) ) ( not ( = ?auto_411480 ?auto_411482 ) ) ( not ( = ?auto_411480 ?auto_411483 ) ) ( not ( = ?auto_411480 ?auto_411484 ) ) ( not ( = ?auto_411480 ?auto_411485 ) ) ( not ( = ?auto_411481 ?auto_411482 ) ) ( not ( = ?auto_411481 ?auto_411483 ) ) ( not ( = ?auto_411481 ?auto_411484 ) ) ( not ( = ?auto_411481 ?auto_411485 ) ) ( not ( = ?auto_411482 ?auto_411483 ) ) ( not ( = ?auto_411482 ?auto_411484 ) ) ( not ( = ?auto_411482 ?auto_411485 ) ) ( not ( = ?auto_411483 ?auto_411484 ) ) ( not ( = ?auto_411483 ?auto_411485 ) ) ( not ( = ?auto_411484 ?auto_411485 ) ) ( ON ?auto_411483 ?auto_411484 ) ( ON ?auto_411482 ?auto_411483 ) ( ON ?auto_411481 ?auto_411482 ) ( ON ?auto_411480 ?auto_411481 ) ( ON ?auto_411479 ?auto_411480 ) ( ON ?auto_411478 ?auto_411479 ) ( CLEAR ?auto_411476 ) ( ON ?auto_411477 ?auto_411478 ) ( CLEAR ?auto_411477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_411471 ?auto_411472 ?auto_411473 ?auto_411474 ?auto_411475 ?auto_411476 ?auto_411477 )
      ( MAKE-14PILE ?auto_411471 ?auto_411472 ?auto_411473 ?auto_411474 ?auto_411475 ?auto_411476 ?auto_411477 ?auto_411478 ?auto_411479 ?auto_411480 ?auto_411481 ?auto_411482 ?auto_411483 ?auto_411484 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411500 - BLOCK
      ?auto_411501 - BLOCK
      ?auto_411502 - BLOCK
      ?auto_411503 - BLOCK
      ?auto_411504 - BLOCK
      ?auto_411505 - BLOCK
      ?auto_411506 - BLOCK
      ?auto_411507 - BLOCK
      ?auto_411508 - BLOCK
      ?auto_411509 - BLOCK
      ?auto_411510 - BLOCK
      ?auto_411511 - BLOCK
      ?auto_411512 - BLOCK
      ?auto_411513 - BLOCK
    )
    :vars
    (
      ?auto_411514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411513 ?auto_411514 ) ( ON-TABLE ?auto_411500 ) ( ON ?auto_411501 ?auto_411500 ) ( ON ?auto_411502 ?auto_411501 ) ( ON ?auto_411503 ?auto_411502 ) ( ON ?auto_411504 ?auto_411503 ) ( not ( = ?auto_411500 ?auto_411501 ) ) ( not ( = ?auto_411500 ?auto_411502 ) ) ( not ( = ?auto_411500 ?auto_411503 ) ) ( not ( = ?auto_411500 ?auto_411504 ) ) ( not ( = ?auto_411500 ?auto_411505 ) ) ( not ( = ?auto_411500 ?auto_411506 ) ) ( not ( = ?auto_411500 ?auto_411507 ) ) ( not ( = ?auto_411500 ?auto_411508 ) ) ( not ( = ?auto_411500 ?auto_411509 ) ) ( not ( = ?auto_411500 ?auto_411510 ) ) ( not ( = ?auto_411500 ?auto_411511 ) ) ( not ( = ?auto_411500 ?auto_411512 ) ) ( not ( = ?auto_411500 ?auto_411513 ) ) ( not ( = ?auto_411500 ?auto_411514 ) ) ( not ( = ?auto_411501 ?auto_411502 ) ) ( not ( = ?auto_411501 ?auto_411503 ) ) ( not ( = ?auto_411501 ?auto_411504 ) ) ( not ( = ?auto_411501 ?auto_411505 ) ) ( not ( = ?auto_411501 ?auto_411506 ) ) ( not ( = ?auto_411501 ?auto_411507 ) ) ( not ( = ?auto_411501 ?auto_411508 ) ) ( not ( = ?auto_411501 ?auto_411509 ) ) ( not ( = ?auto_411501 ?auto_411510 ) ) ( not ( = ?auto_411501 ?auto_411511 ) ) ( not ( = ?auto_411501 ?auto_411512 ) ) ( not ( = ?auto_411501 ?auto_411513 ) ) ( not ( = ?auto_411501 ?auto_411514 ) ) ( not ( = ?auto_411502 ?auto_411503 ) ) ( not ( = ?auto_411502 ?auto_411504 ) ) ( not ( = ?auto_411502 ?auto_411505 ) ) ( not ( = ?auto_411502 ?auto_411506 ) ) ( not ( = ?auto_411502 ?auto_411507 ) ) ( not ( = ?auto_411502 ?auto_411508 ) ) ( not ( = ?auto_411502 ?auto_411509 ) ) ( not ( = ?auto_411502 ?auto_411510 ) ) ( not ( = ?auto_411502 ?auto_411511 ) ) ( not ( = ?auto_411502 ?auto_411512 ) ) ( not ( = ?auto_411502 ?auto_411513 ) ) ( not ( = ?auto_411502 ?auto_411514 ) ) ( not ( = ?auto_411503 ?auto_411504 ) ) ( not ( = ?auto_411503 ?auto_411505 ) ) ( not ( = ?auto_411503 ?auto_411506 ) ) ( not ( = ?auto_411503 ?auto_411507 ) ) ( not ( = ?auto_411503 ?auto_411508 ) ) ( not ( = ?auto_411503 ?auto_411509 ) ) ( not ( = ?auto_411503 ?auto_411510 ) ) ( not ( = ?auto_411503 ?auto_411511 ) ) ( not ( = ?auto_411503 ?auto_411512 ) ) ( not ( = ?auto_411503 ?auto_411513 ) ) ( not ( = ?auto_411503 ?auto_411514 ) ) ( not ( = ?auto_411504 ?auto_411505 ) ) ( not ( = ?auto_411504 ?auto_411506 ) ) ( not ( = ?auto_411504 ?auto_411507 ) ) ( not ( = ?auto_411504 ?auto_411508 ) ) ( not ( = ?auto_411504 ?auto_411509 ) ) ( not ( = ?auto_411504 ?auto_411510 ) ) ( not ( = ?auto_411504 ?auto_411511 ) ) ( not ( = ?auto_411504 ?auto_411512 ) ) ( not ( = ?auto_411504 ?auto_411513 ) ) ( not ( = ?auto_411504 ?auto_411514 ) ) ( not ( = ?auto_411505 ?auto_411506 ) ) ( not ( = ?auto_411505 ?auto_411507 ) ) ( not ( = ?auto_411505 ?auto_411508 ) ) ( not ( = ?auto_411505 ?auto_411509 ) ) ( not ( = ?auto_411505 ?auto_411510 ) ) ( not ( = ?auto_411505 ?auto_411511 ) ) ( not ( = ?auto_411505 ?auto_411512 ) ) ( not ( = ?auto_411505 ?auto_411513 ) ) ( not ( = ?auto_411505 ?auto_411514 ) ) ( not ( = ?auto_411506 ?auto_411507 ) ) ( not ( = ?auto_411506 ?auto_411508 ) ) ( not ( = ?auto_411506 ?auto_411509 ) ) ( not ( = ?auto_411506 ?auto_411510 ) ) ( not ( = ?auto_411506 ?auto_411511 ) ) ( not ( = ?auto_411506 ?auto_411512 ) ) ( not ( = ?auto_411506 ?auto_411513 ) ) ( not ( = ?auto_411506 ?auto_411514 ) ) ( not ( = ?auto_411507 ?auto_411508 ) ) ( not ( = ?auto_411507 ?auto_411509 ) ) ( not ( = ?auto_411507 ?auto_411510 ) ) ( not ( = ?auto_411507 ?auto_411511 ) ) ( not ( = ?auto_411507 ?auto_411512 ) ) ( not ( = ?auto_411507 ?auto_411513 ) ) ( not ( = ?auto_411507 ?auto_411514 ) ) ( not ( = ?auto_411508 ?auto_411509 ) ) ( not ( = ?auto_411508 ?auto_411510 ) ) ( not ( = ?auto_411508 ?auto_411511 ) ) ( not ( = ?auto_411508 ?auto_411512 ) ) ( not ( = ?auto_411508 ?auto_411513 ) ) ( not ( = ?auto_411508 ?auto_411514 ) ) ( not ( = ?auto_411509 ?auto_411510 ) ) ( not ( = ?auto_411509 ?auto_411511 ) ) ( not ( = ?auto_411509 ?auto_411512 ) ) ( not ( = ?auto_411509 ?auto_411513 ) ) ( not ( = ?auto_411509 ?auto_411514 ) ) ( not ( = ?auto_411510 ?auto_411511 ) ) ( not ( = ?auto_411510 ?auto_411512 ) ) ( not ( = ?auto_411510 ?auto_411513 ) ) ( not ( = ?auto_411510 ?auto_411514 ) ) ( not ( = ?auto_411511 ?auto_411512 ) ) ( not ( = ?auto_411511 ?auto_411513 ) ) ( not ( = ?auto_411511 ?auto_411514 ) ) ( not ( = ?auto_411512 ?auto_411513 ) ) ( not ( = ?auto_411512 ?auto_411514 ) ) ( not ( = ?auto_411513 ?auto_411514 ) ) ( ON ?auto_411512 ?auto_411513 ) ( ON ?auto_411511 ?auto_411512 ) ( ON ?auto_411510 ?auto_411511 ) ( ON ?auto_411509 ?auto_411510 ) ( ON ?auto_411508 ?auto_411509 ) ( ON ?auto_411507 ?auto_411508 ) ( ON ?auto_411506 ?auto_411507 ) ( CLEAR ?auto_411504 ) ( ON ?auto_411505 ?auto_411506 ) ( CLEAR ?auto_411505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_411500 ?auto_411501 ?auto_411502 ?auto_411503 ?auto_411504 ?auto_411505 )
      ( MAKE-14PILE ?auto_411500 ?auto_411501 ?auto_411502 ?auto_411503 ?auto_411504 ?auto_411505 ?auto_411506 ?auto_411507 ?auto_411508 ?auto_411509 ?auto_411510 ?auto_411511 ?auto_411512 ?auto_411513 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411529 - BLOCK
      ?auto_411530 - BLOCK
      ?auto_411531 - BLOCK
      ?auto_411532 - BLOCK
      ?auto_411533 - BLOCK
      ?auto_411534 - BLOCK
      ?auto_411535 - BLOCK
      ?auto_411536 - BLOCK
      ?auto_411537 - BLOCK
      ?auto_411538 - BLOCK
      ?auto_411539 - BLOCK
      ?auto_411540 - BLOCK
      ?auto_411541 - BLOCK
      ?auto_411542 - BLOCK
    )
    :vars
    (
      ?auto_411543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411542 ?auto_411543 ) ( ON-TABLE ?auto_411529 ) ( ON ?auto_411530 ?auto_411529 ) ( ON ?auto_411531 ?auto_411530 ) ( ON ?auto_411532 ?auto_411531 ) ( ON ?auto_411533 ?auto_411532 ) ( not ( = ?auto_411529 ?auto_411530 ) ) ( not ( = ?auto_411529 ?auto_411531 ) ) ( not ( = ?auto_411529 ?auto_411532 ) ) ( not ( = ?auto_411529 ?auto_411533 ) ) ( not ( = ?auto_411529 ?auto_411534 ) ) ( not ( = ?auto_411529 ?auto_411535 ) ) ( not ( = ?auto_411529 ?auto_411536 ) ) ( not ( = ?auto_411529 ?auto_411537 ) ) ( not ( = ?auto_411529 ?auto_411538 ) ) ( not ( = ?auto_411529 ?auto_411539 ) ) ( not ( = ?auto_411529 ?auto_411540 ) ) ( not ( = ?auto_411529 ?auto_411541 ) ) ( not ( = ?auto_411529 ?auto_411542 ) ) ( not ( = ?auto_411529 ?auto_411543 ) ) ( not ( = ?auto_411530 ?auto_411531 ) ) ( not ( = ?auto_411530 ?auto_411532 ) ) ( not ( = ?auto_411530 ?auto_411533 ) ) ( not ( = ?auto_411530 ?auto_411534 ) ) ( not ( = ?auto_411530 ?auto_411535 ) ) ( not ( = ?auto_411530 ?auto_411536 ) ) ( not ( = ?auto_411530 ?auto_411537 ) ) ( not ( = ?auto_411530 ?auto_411538 ) ) ( not ( = ?auto_411530 ?auto_411539 ) ) ( not ( = ?auto_411530 ?auto_411540 ) ) ( not ( = ?auto_411530 ?auto_411541 ) ) ( not ( = ?auto_411530 ?auto_411542 ) ) ( not ( = ?auto_411530 ?auto_411543 ) ) ( not ( = ?auto_411531 ?auto_411532 ) ) ( not ( = ?auto_411531 ?auto_411533 ) ) ( not ( = ?auto_411531 ?auto_411534 ) ) ( not ( = ?auto_411531 ?auto_411535 ) ) ( not ( = ?auto_411531 ?auto_411536 ) ) ( not ( = ?auto_411531 ?auto_411537 ) ) ( not ( = ?auto_411531 ?auto_411538 ) ) ( not ( = ?auto_411531 ?auto_411539 ) ) ( not ( = ?auto_411531 ?auto_411540 ) ) ( not ( = ?auto_411531 ?auto_411541 ) ) ( not ( = ?auto_411531 ?auto_411542 ) ) ( not ( = ?auto_411531 ?auto_411543 ) ) ( not ( = ?auto_411532 ?auto_411533 ) ) ( not ( = ?auto_411532 ?auto_411534 ) ) ( not ( = ?auto_411532 ?auto_411535 ) ) ( not ( = ?auto_411532 ?auto_411536 ) ) ( not ( = ?auto_411532 ?auto_411537 ) ) ( not ( = ?auto_411532 ?auto_411538 ) ) ( not ( = ?auto_411532 ?auto_411539 ) ) ( not ( = ?auto_411532 ?auto_411540 ) ) ( not ( = ?auto_411532 ?auto_411541 ) ) ( not ( = ?auto_411532 ?auto_411542 ) ) ( not ( = ?auto_411532 ?auto_411543 ) ) ( not ( = ?auto_411533 ?auto_411534 ) ) ( not ( = ?auto_411533 ?auto_411535 ) ) ( not ( = ?auto_411533 ?auto_411536 ) ) ( not ( = ?auto_411533 ?auto_411537 ) ) ( not ( = ?auto_411533 ?auto_411538 ) ) ( not ( = ?auto_411533 ?auto_411539 ) ) ( not ( = ?auto_411533 ?auto_411540 ) ) ( not ( = ?auto_411533 ?auto_411541 ) ) ( not ( = ?auto_411533 ?auto_411542 ) ) ( not ( = ?auto_411533 ?auto_411543 ) ) ( not ( = ?auto_411534 ?auto_411535 ) ) ( not ( = ?auto_411534 ?auto_411536 ) ) ( not ( = ?auto_411534 ?auto_411537 ) ) ( not ( = ?auto_411534 ?auto_411538 ) ) ( not ( = ?auto_411534 ?auto_411539 ) ) ( not ( = ?auto_411534 ?auto_411540 ) ) ( not ( = ?auto_411534 ?auto_411541 ) ) ( not ( = ?auto_411534 ?auto_411542 ) ) ( not ( = ?auto_411534 ?auto_411543 ) ) ( not ( = ?auto_411535 ?auto_411536 ) ) ( not ( = ?auto_411535 ?auto_411537 ) ) ( not ( = ?auto_411535 ?auto_411538 ) ) ( not ( = ?auto_411535 ?auto_411539 ) ) ( not ( = ?auto_411535 ?auto_411540 ) ) ( not ( = ?auto_411535 ?auto_411541 ) ) ( not ( = ?auto_411535 ?auto_411542 ) ) ( not ( = ?auto_411535 ?auto_411543 ) ) ( not ( = ?auto_411536 ?auto_411537 ) ) ( not ( = ?auto_411536 ?auto_411538 ) ) ( not ( = ?auto_411536 ?auto_411539 ) ) ( not ( = ?auto_411536 ?auto_411540 ) ) ( not ( = ?auto_411536 ?auto_411541 ) ) ( not ( = ?auto_411536 ?auto_411542 ) ) ( not ( = ?auto_411536 ?auto_411543 ) ) ( not ( = ?auto_411537 ?auto_411538 ) ) ( not ( = ?auto_411537 ?auto_411539 ) ) ( not ( = ?auto_411537 ?auto_411540 ) ) ( not ( = ?auto_411537 ?auto_411541 ) ) ( not ( = ?auto_411537 ?auto_411542 ) ) ( not ( = ?auto_411537 ?auto_411543 ) ) ( not ( = ?auto_411538 ?auto_411539 ) ) ( not ( = ?auto_411538 ?auto_411540 ) ) ( not ( = ?auto_411538 ?auto_411541 ) ) ( not ( = ?auto_411538 ?auto_411542 ) ) ( not ( = ?auto_411538 ?auto_411543 ) ) ( not ( = ?auto_411539 ?auto_411540 ) ) ( not ( = ?auto_411539 ?auto_411541 ) ) ( not ( = ?auto_411539 ?auto_411542 ) ) ( not ( = ?auto_411539 ?auto_411543 ) ) ( not ( = ?auto_411540 ?auto_411541 ) ) ( not ( = ?auto_411540 ?auto_411542 ) ) ( not ( = ?auto_411540 ?auto_411543 ) ) ( not ( = ?auto_411541 ?auto_411542 ) ) ( not ( = ?auto_411541 ?auto_411543 ) ) ( not ( = ?auto_411542 ?auto_411543 ) ) ( ON ?auto_411541 ?auto_411542 ) ( ON ?auto_411540 ?auto_411541 ) ( ON ?auto_411539 ?auto_411540 ) ( ON ?auto_411538 ?auto_411539 ) ( ON ?auto_411537 ?auto_411538 ) ( ON ?auto_411536 ?auto_411537 ) ( ON ?auto_411535 ?auto_411536 ) ( CLEAR ?auto_411533 ) ( ON ?auto_411534 ?auto_411535 ) ( CLEAR ?auto_411534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_411529 ?auto_411530 ?auto_411531 ?auto_411532 ?auto_411533 ?auto_411534 )
      ( MAKE-14PILE ?auto_411529 ?auto_411530 ?auto_411531 ?auto_411532 ?auto_411533 ?auto_411534 ?auto_411535 ?auto_411536 ?auto_411537 ?auto_411538 ?auto_411539 ?auto_411540 ?auto_411541 ?auto_411542 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411558 - BLOCK
      ?auto_411559 - BLOCK
      ?auto_411560 - BLOCK
      ?auto_411561 - BLOCK
      ?auto_411562 - BLOCK
      ?auto_411563 - BLOCK
      ?auto_411564 - BLOCK
      ?auto_411565 - BLOCK
      ?auto_411566 - BLOCK
      ?auto_411567 - BLOCK
      ?auto_411568 - BLOCK
      ?auto_411569 - BLOCK
      ?auto_411570 - BLOCK
      ?auto_411571 - BLOCK
    )
    :vars
    (
      ?auto_411572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411571 ?auto_411572 ) ( ON-TABLE ?auto_411558 ) ( ON ?auto_411559 ?auto_411558 ) ( ON ?auto_411560 ?auto_411559 ) ( ON ?auto_411561 ?auto_411560 ) ( not ( = ?auto_411558 ?auto_411559 ) ) ( not ( = ?auto_411558 ?auto_411560 ) ) ( not ( = ?auto_411558 ?auto_411561 ) ) ( not ( = ?auto_411558 ?auto_411562 ) ) ( not ( = ?auto_411558 ?auto_411563 ) ) ( not ( = ?auto_411558 ?auto_411564 ) ) ( not ( = ?auto_411558 ?auto_411565 ) ) ( not ( = ?auto_411558 ?auto_411566 ) ) ( not ( = ?auto_411558 ?auto_411567 ) ) ( not ( = ?auto_411558 ?auto_411568 ) ) ( not ( = ?auto_411558 ?auto_411569 ) ) ( not ( = ?auto_411558 ?auto_411570 ) ) ( not ( = ?auto_411558 ?auto_411571 ) ) ( not ( = ?auto_411558 ?auto_411572 ) ) ( not ( = ?auto_411559 ?auto_411560 ) ) ( not ( = ?auto_411559 ?auto_411561 ) ) ( not ( = ?auto_411559 ?auto_411562 ) ) ( not ( = ?auto_411559 ?auto_411563 ) ) ( not ( = ?auto_411559 ?auto_411564 ) ) ( not ( = ?auto_411559 ?auto_411565 ) ) ( not ( = ?auto_411559 ?auto_411566 ) ) ( not ( = ?auto_411559 ?auto_411567 ) ) ( not ( = ?auto_411559 ?auto_411568 ) ) ( not ( = ?auto_411559 ?auto_411569 ) ) ( not ( = ?auto_411559 ?auto_411570 ) ) ( not ( = ?auto_411559 ?auto_411571 ) ) ( not ( = ?auto_411559 ?auto_411572 ) ) ( not ( = ?auto_411560 ?auto_411561 ) ) ( not ( = ?auto_411560 ?auto_411562 ) ) ( not ( = ?auto_411560 ?auto_411563 ) ) ( not ( = ?auto_411560 ?auto_411564 ) ) ( not ( = ?auto_411560 ?auto_411565 ) ) ( not ( = ?auto_411560 ?auto_411566 ) ) ( not ( = ?auto_411560 ?auto_411567 ) ) ( not ( = ?auto_411560 ?auto_411568 ) ) ( not ( = ?auto_411560 ?auto_411569 ) ) ( not ( = ?auto_411560 ?auto_411570 ) ) ( not ( = ?auto_411560 ?auto_411571 ) ) ( not ( = ?auto_411560 ?auto_411572 ) ) ( not ( = ?auto_411561 ?auto_411562 ) ) ( not ( = ?auto_411561 ?auto_411563 ) ) ( not ( = ?auto_411561 ?auto_411564 ) ) ( not ( = ?auto_411561 ?auto_411565 ) ) ( not ( = ?auto_411561 ?auto_411566 ) ) ( not ( = ?auto_411561 ?auto_411567 ) ) ( not ( = ?auto_411561 ?auto_411568 ) ) ( not ( = ?auto_411561 ?auto_411569 ) ) ( not ( = ?auto_411561 ?auto_411570 ) ) ( not ( = ?auto_411561 ?auto_411571 ) ) ( not ( = ?auto_411561 ?auto_411572 ) ) ( not ( = ?auto_411562 ?auto_411563 ) ) ( not ( = ?auto_411562 ?auto_411564 ) ) ( not ( = ?auto_411562 ?auto_411565 ) ) ( not ( = ?auto_411562 ?auto_411566 ) ) ( not ( = ?auto_411562 ?auto_411567 ) ) ( not ( = ?auto_411562 ?auto_411568 ) ) ( not ( = ?auto_411562 ?auto_411569 ) ) ( not ( = ?auto_411562 ?auto_411570 ) ) ( not ( = ?auto_411562 ?auto_411571 ) ) ( not ( = ?auto_411562 ?auto_411572 ) ) ( not ( = ?auto_411563 ?auto_411564 ) ) ( not ( = ?auto_411563 ?auto_411565 ) ) ( not ( = ?auto_411563 ?auto_411566 ) ) ( not ( = ?auto_411563 ?auto_411567 ) ) ( not ( = ?auto_411563 ?auto_411568 ) ) ( not ( = ?auto_411563 ?auto_411569 ) ) ( not ( = ?auto_411563 ?auto_411570 ) ) ( not ( = ?auto_411563 ?auto_411571 ) ) ( not ( = ?auto_411563 ?auto_411572 ) ) ( not ( = ?auto_411564 ?auto_411565 ) ) ( not ( = ?auto_411564 ?auto_411566 ) ) ( not ( = ?auto_411564 ?auto_411567 ) ) ( not ( = ?auto_411564 ?auto_411568 ) ) ( not ( = ?auto_411564 ?auto_411569 ) ) ( not ( = ?auto_411564 ?auto_411570 ) ) ( not ( = ?auto_411564 ?auto_411571 ) ) ( not ( = ?auto_411564 ?auto_411572 ) ) ( not ( = ?auto_411565 ?auto_411566 ) ) ( not ( = ?auto_411565 ?auto_411567 ) ) ( not ( = ?auto_411565 ?auto_411568 ) ) ( not ( = ?auto_411565 ?auto_411569 ) ) ( not ( = ?auto_411565 ?auto_411570 ) ) ( not ( = ?auto_411565 ?auto_411571 ) ) ( not ( = ?auto_411565 ?auto_411572 ) ) ( not ( = ?auto_411566 ?auto_411567 ) ) ( not ( = ?auto_411566 ?auto_411568 ) ) ( not ( = ?auto_411566 ?auto_411569 ) ) ( not ( = ?auto_411566 ?auto_411570 ) ) ( not ( = ?auto_411566 ?auto_411571 ) ) ( not ( = ?auto_411566 ?auto_411572 ) ) ( not ( = ?auto_411567 ?auto_411568 ) ) ( not ( = ?auto_411567 ?auto_411569 ) ) ( not ( = ?auto_411567 ?auto_411570 ) ) ( not ( = ?auto_411567 ?auto_411571 ) ) ( not ( = ?auto_411567 ?auto_411572 ) ) ( not ( = ?auto_411568 ?auto_411569 ) ) ( not ( = ?auto_411568 ?auto_411570 ) ) ( not ( = ?auto_411568 ?auto_411571 ) ) ( not ( = ?auto_411568 ?auto_411572 ) ) ( not ( = ?auto_411569 ?auto_411570 ) ) ( not ( = ?auto_411569 ?auto_411571 ) ) ( not ( = ?auto_411569 ?auto_411572 ) ) ( not ( = ?auto_411570 ?auto_411571 ) ) ( not ( = ?auto_411570 ?auto_411572 ) ) ( not ( = ?auto_411571 ?auto_411572 ) ) ( ON ?auto_411570 ?auto_411571 ) ( ON ?auto_411569 ?auto_411570 ) ( ON ?auto_411568 ?auto_411569 ) ( ON ?auto_411567 ?auto_411568 ) ( ON ?auto_411566 ?auto_411567 ) ( ON ?auto_411565 ?auto_411566 ) ( ON ?auto_411564 ?auto_411565 ) ( ON ?auto_411563 ?auto_411564 ) ( CLEAR ?auto_411561 ) ( ON ?auto_411562 ?auto_411563 ) ( CLEAR ?auto_411562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_411558 ?auto_411559 ?auto_411560 ?auto_411561 ?auto_411562 )
      ( MAKE-14PILE ?auto_411558 ?auto_411559 ?auto_411560 ?auto_411561 ?auto_411562 ?auto_411563 ?auto_411564 ?auto_411565 ?auto_411566 ?auto_411567 ?auto_411568 ?auto_411569 ?auto_411570 ?auto_411571 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411587 - BLOCK
      ?auto_411588 - BLOCK
      ?auto_411589 - BLOCK
      ?auto_411590 - BLOCK
      ?auto_411591 - BLOCK
      ?auto_411592 - BLOCK
      ?auto_411593 - BLOCK
      ?auto_411594 - BLOCK
      ?auto_411595 - BLOCK
      ?auto_411596 - BLOCK
      ?auto_411597 - BLOCK
      ?auto_411598 - BLOCK
      ?auto_411599 - BLOCK
      ?auto_411600 - BLOCK
    )
    :vars
    (
      ?auto_411601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411600 ?auto_411601 ) ( ON-TABLE ?auto_411587 ) ( ON ?auto_411588 ?auto_411587 ) ( ON ?auto_411589 ?auto_411588 ) ( ON ?auto_411590 ?auto_411589 ) ( not ( = ?auto_411587 ?auto_411588 ) ) ( not ( = ?auto_411587 ?auto_411589 ) ) ( not ( = ?auto_411587 ?auto_411590 ) ) ( not ( = ?auto_411587 ?auto_411591 ) ) ( not ( = ?auto_411587 ?auto_411592 ) ) ( not ( = ?auto_411587 ?auto_411593 ) ) ( not ( = ?auto_411587 ?auto_411594 ) ) ( not ( = ?auto_411587 ?auto_411595 ) ) ( not ( = ?auto_411587 ?auto_411596 ) ) ( not ( = ?auto_411587 ?auto_411597 ) ) ( not ( = ?auto_411587 ?auto_411598 ) ) ( not ( = ?auto_411587 ?auto_411599 ) ) ( not ( = ?auto_411587 ?auto_411600 ) ) ( not ( = ?auto_411587 ?auto_411601 ) ) ( not ( = ?auto_411588 ?auto_411589 ) ) ( not ( = ?auto_411588 ?auto_411590 ) ) ( not ( = ?auto_411588 ?auto_411591 ) ) ( not ( = ?auto_411588 ?auto_411592 ) ) ( not ( = ?auto_411588 ?auto_411593 ) ) ( not ( = ?auto_411588 ?auto_411594 ) ) ( not ( = ?auto_411588 ?auto_411595 ) ) ( not ( = ?auto_411588 ?auto_411596 ) ) ( not ( = ?auto_411588 ?auto_411597 ) ) ( not ( = ?auto_411588 ?auto_411598 ) ) ( not ( = ?auto_411588 ?auto_411599 ) ) ( not ( = ?auto_411588 ?auto_411600 ) ) ( not ( = ?auto_411588 ?auto_411601 ) ) ( not ( = ?auto_411589 ?auto_411590 ) ) ( not ( = ?auto_411589 ?auto_411591 ) ) ( not ( = ?auto_411589 ?auto_411592 ) ) ( not ( = ?auto_411589 ?auto_411593 ) ) ( not ( = ?auto_411589 ?auto_411594 ) ) ( not ( = ?auto_411589 ?auto_411595 ) ) ( not ( = ?auto_411589 ?auto_411596 ) ) ( not ( = ?auto_411589 ?auto_411597 ) ) ( not ( = ?auto_411589 ?auto_411598 ) ) ( not ( = ?auto_411589 ?auto_411599 ) ) ( not ( = ?auto_411589 ?auto_411600 ) ) ( not ( = ?auto_411589 ?auto_411601 ) ) ( not ( = ?auto_411590 ?auto_411591 ) ) ( not ( = ?auto_411590 ?auto_411592 ) ) ( not ( = ?auto_411590 ?auto_411593 ) ) ( not ( = ?auto_411590 ?auto_411594 ) ) ( not ( = ?auto_411590 ?auto_411595 ) ) ( not ( = ?auto_411590 ?auto_411596 ) ) ( not ( = ?auto_411590 ?auto_411597 ) ) ( not ( = ?auto_411590 ?auto_411598 ) ) ( not ( = ?auto_411590 ?auto_411599 ) ) ( not ( = ?auto_411590 ?auto_411600 ) ) ( not ( = ?auto_411590 ?auto_411601 ) ) ( not ( = ?auto_411591 ?auto_411592 ) ) ( not ( = ?auto_411591 ?auto_411593 ) ) ( not ( = ?auto_411591 ?auto_411594 ) ) ( not ( = ?auto_411591 ?auto_411595 ) ) ( not ( = ?auto_411591 ?auto_411596 ) ) ( not ( = ?auto_411591 ?auto_411597 ) ) ( not ( = ?auto_411591 ?auto_411598 ) ) ( not ( = ?auto_411591 ?auto_411599 ) ) ( not ( = ?auto_411591 ?auto_411600 ) ) ( not ( = ?auto_411591 ?auto_411601 ) ) ( not ( = ?auto_411592 ?auto_411593 ) ) ( not ( = ?auto_411592 ?auto_411594 ) ) ( not ( = ?auto_411592 ?auto_411595 ) ) ( not ( = ?auto_411592 ?auto_411596 ) ) ( not ( = ?auto_411592 ?auto_411597 ) ) ( not ( = ?auto_411592 ?auto_411598 ) ) ( not ( = ?auto_411592 ?auto_411599 ) ) ( not ( = ?auto_411592 ?auto_411600 ) ) ( not ( = ?auto_411592 ?auto_411601 ) ) ( not ( = ?auto_411593 ?auto_411594 ) ) ( not ( = ?auto_411593 ?auto_411595 ) ) ( not ( = ?auto_411593 ?auto_411596 ) ) ( not ( = ?auto_411593 ?auto_411597 ) ) ( not ( = ?auto_411593 ?auto_411598 ) ) ( not ( = ?auto_411593 ?auto_411599 ) ) ( not ( = ?auto_411593 ?auto_411600 ) ) ( not ( = ?auto_411593 ?auto_411601 ) ) ( not ( = ?auto_411594 ?auto_411595 ) ) ( not ( = ?auto_411594 ?auto_411596 ) ) ( not ( = ?auto_411594 ?auto_411597 ) ) ( not ( = ?auto_411594 ?auto_411598 ) ) ( not ( = ?auto_411594 ?auto_411599 ) ) ( not ( = ?auto_411594 ?auto_411600 ) ) ( not ( = ?auto_411594 ?auto_411601 ) ) ( not ( = ?auto_411595 ?auto_411596 ) ) ( not ( = ?auto_411595 ?auto_411597 ) ) ( not ( = ?auto_411595 ?auto_411598 ) ) ( not ( = ?auto_411595 ?auto_411599 ) ) ( not ( = ?auto_411595 ?auto_411600 ) ) ( not ( = ?auto_411595 ?auto_411601 ) ) ( not ( = ?auto_411596 ?auto_411597 ) ) ( not ( = ?auto_411596 ?auto_411598 ) ) ( not ( = ?auto_411596 ?auto_411599 ) ) ( not ( = ?auto_411596 ?auto_411600 ) ) ( not ( = ?auto_411596 ?auto_411601 ) ) ( not ( = ?auto_411597 ?auto_411598 ) ) ( not ( = ?auto_411597 ?auto_411599 ) ) ( not ( = ?auto_411597 ?auto_411600 ) ) ( not ( = ?auto_411597 ?auto_411601 ) ) ( not ( = ?auto_411598 ?auto_411599 ) ) ( not ( = ?auto_411598 ?auto_411600 ) ) ( not ( = ?auto_411598 ?auto_411601 ) ) ( not ( = ?auto_411599 ?auto_411600 ) ) ( not ( = ?auto_411599 ?auto_411601 ) ) ( not ( = ?auto_411600 ?auto_411601 ) ) ( ON ?auto_411599 ?auto_411600 ) ( ON ?auto_411598 ?auto_411599 ) ( ON ?auto_411597 ?auto_411598 ) ( ON ?auto_411596 ?auto_411597 ) ( ON ?auto_411595 ?auto_411596 ) ( ON ?auto_411594 ?auto_411595 ) ( ON ?auto_411593 ?auto_411594 ) ( ON ?auto_411592 ?auto_411593 ) ( CLEAR ?auto_411590 ) ( ON ?auto_411591 ?auto_411592 ) ( CLEAR ?auto_411591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_411587 ?auto_411588 ?auto_411589 ?auto_411590 ?auto_411591 )
      ( MAKE-14PILE ?auto_411587 ?auto_411588 ?auto_411589 ?auto_411590 ?auto_411591 ?auto_411592 ?auto_411593 ?auto_411594 ?auto_411595 ?auto_411596 ?auto_411597 ?auto_411598 ?auto_411599 ?auto_411600 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411616 - BLOCK
      ?auto_411617 - BLOCK
      ?auto_411618 - BLOCK
      ?auto_411619 - BLOCK
      ?auto_411620 - BLOCK
      ?auto_411621 - BLOCK
      ?auto_411622 - BLOCK
      ?auto_411623 - BLOCK
      ?auto_411624 - BLOCK
      ?auto_411625 - BLOCK
      ?auto_411626 - BLOCK
      ?auto_411627 - BLOCK
      ?auto_411628 - BLOCK
      ?auto_411629 - BLOCK
    )
    :vars
    (
      ?auto_411630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411629 ?auto_411630 ) ( ON-TABLE ?auto_411616 ) ( ON ?auto_411617 ?auto_411616 ) ( ON ?auto_411618 ?auto_411617 ) ( not ( = ?auto_411616 ?auto_411617 ) ) ( not ( = ?auto_411616 ?auto_411618 ) ) ( not ( = ?auto_411616 ?auto_411619 ) ) ( not ( = ?auto_411616 ?auto_411620 ) ) ( not ( = ?auto_411616 ?auto_411621 ) ) ( not ( = ?auto_411616 ?auto_411622 ) ) ( not ( = ?auto_411616 ?auto_411623 ) ) ( not ( = ?auto_411616 ?auto_411624 ) ) ( not ( = ?auto_411616 ?auto_411625 ) ) ( not ( = ?auto_411616 ?auto_411626 ) ) ( not ( = ?auto_411616 ?auto_411627 ) ) ( not ( = ?auto_411616 ?auto_411628 ) ) ( not ( = ?auto_411616 ?auto_411629 ) ) ( not ( = ?auto_411616 ?auto_411630 ) ) ( not ( = ?auto_411617 ?auto_411618 ) ) ( not ( = ?auto_411617 ?auto_411619 ) ) ( not ( = ?auto_411617 ?auto_411620 ) ) ( not ( = ?auto_411617 ?auto_411621 ) ) ( not ( = ?auto_411617 ?auto_411622 ) ) ( not ( = ?auto_411617 ?auto_411623 ) ) ( not ( = ?auto_411617 ?auto_411624 ) ) ( not ( = ?auto_411617 ?auto_411625 ) ) ( not ( = ?auto_411617 ?auto_411626 ) ) ( not ( = ?auto_411617 ?auto_411627 ) ) ( not ( = ?auto_411617 ?auto_411628 ) ) ( not ( = ?auto_411617 ?auto_411629 ) ) ( not ( = ?auto_411617 ?auto_411630 ) ) ( not ( = ?auto_411618 ?auto_411619 ) ) ( not ( = ?auto_411618 ?auto_411620 ) ) ( not ( = ?auto_411618 ?auto_411621 ) ) ( not ( = ?auto_411618 ?auto_411622 ) ) ( not ( = ?auto_411618 ?auto_411623 ) ) ( not ( = ?auto_411618 ?auto_411624 ) ) ( not ( = ?auto_411618 ?auto_411625 ) ) ( not ( = ?auto_411618 ?auto_411626 ) ) ( not ( = ?auto_411618 ?auto_411627 ) ) ( not ( = ?auto_411618 ?auto_411628 ) ) ( not ( = ?auto_411618 ?auto_411629 ) ) ( not ( = ?auto_411618 ?auto_411630 ) ) ( not ( = ?auto_411619 ?auto_411620 ) ) ( not ( = ?auto_411619 ?auto_411621 ) ) ( not ( = ?auto_411619 ?auto_411622 ) ) ( not ( = ?auto_411619 ?auto_411623 ) ) ( not ( = ?auto_411619 ?auto_411624 ) ) ( not ( = ?auto_411619 ?auto_411625 ) ) ( not ( = ?auto_411619 ?auto_411626 ) ) ( not ( = ?auto_411619 ?auto_411627 ) ) ( not ( = ?auto_411619 ?auto_411628 ) ) ( not ( = ?auto_411619 ?auto_411629 ) ) ( not ( = ?auto_411619 ?auto_411630 ) ) ( not ( = ?auto_411620 ?auto_411621 ) ) ( not ( = ?auto_411620 ?auto_411622 ) ) ( not ( = ?auto_411620 ?auto_411623 ) ) ( not ( = ?auto_411620 ?auto_411624 ) ) ( not ( = ?auto_411620 ?auto_411625 ) ) ( not ( = ?auto_411620 ?auto_411626 ) ) ( not ( = ?auto_411620 ?auto_411627 ) ) ( not ( = ?auto_411620 ?auto_411628 ) ) ( not ( = ?auto_411620 ?auto_411629 ) ) ( not ( = ?auto_411620 ?auto_411630 ) ) ( not ( = ?auto_411621 ?auto_411622 ) ) ( not ( = ?auto_411621 ?auto_411623 ) ) ( not ( = ?auto_411621 ?auto_411624 ) ) ( not ( = ?auto_411621 ?auto_411625 ) ) ( not ( = ?auto_411621 ?auto_411626 ) ) ( not ( = ?auto_411621 ?auto_411627 ) ) ( not ( = ?auto_411621 ?auto_411628 ) ) ( not ( = ?auto_411621 ?auto_411629 ) ) ( not ( = ?auto_411621 ?auto_411630 ) ) ( not ( = ?auto_411622 ?auto_411623 ) ) ( not ( = ?auto_411622 ?auto_411624 ) ) ( not ( = ?auto_411622 ?auto_411625 ) ) ( not ( = ?auto_411622 ?auto_411626 ) ) ( not ( = ?auto_411622 ?auto_411627 ) ) ( not ( = ?auto_411622 ?auto_411628 ) ) ( not ( = ?auto_411622 ?auto_411629 ) ) ( not ( = ?auto_411622 ?auto_411630 ) ) ( not ( = ?auto_411623 ?auto_411624 ) ) ( not ( = ?auto_411623 ?auto_411625 ) ) ( not ( = ?auto_411623 ?auto_411626 ) ) ( not ( = ?auto_411623 ?auto_411627 ) ) ( not ( = ?auto_411623 ?auto_411628 ) ) ( not ( = ?auto_411623 ?auto_411629 ) ) ( not ( = ?auto_411623 ?auto_411630 ) ) ( not ( = ?auto_411624 ?auto_411625 ) ) ( not ( = ?auto_411624 ?auto_411626 ) ) ( not ( = ?auto_411624 ?auto_411627 ) ) ( not ( = ?auto_411624 ?auto_411628 ) ) ( not ( = ?auto_411624 ?auto_411629 ) ) ( not ( = ?auto_411624 ?auto_411630 ) ) ( not ( = ?auto_411625 ?auto_411626 ) ) ( not ( = ?auto_411625 ?auto_411627 ) ) ( not ( = ?auto_411625 ?auto_411628 ) ) ( not ( = ?auto_411625 ?auto_411629 ) ) ( not ( = ?auto_411625 ?auto_411630 ) ) ( not ( = ?auto_411626 ?auto_411627 ) ) ( not ( = ?auto_411626 ?auto_411628 ) ) ( not ( = ?auto_411626 ?auto_411629 ) ) ( not ( = ?auto_411626 ?auto_411630 ) ) ( not ( = ?auto_411627 ?auto_411628 ) ) ( not ( = ?auto_411627 ?auto_411629 ) ) ( not ( = ?auto_411627 ?auto_411630 ) ) ( not ( = ?auto_411628 ?auto_411629 ) ) ( not ( = ?auto_411628 ?auto_411630 ) ) ( not ( = ?auto_411629 ?auto_411630 ) ) ( ON ?auto_411628 ?auto_411629 ) ( ON ?auto_411627 ?auto_411628 ) ( ON ?auto_411626 ?auto_411627 ) ( ON ?auto_411625 ?auto_411626 ) ( ON ?auto_411624 ?auto_411625 ) ( ON ?auto_411623 ?auto_411624 ) ( ON ?auto_411622 ?auto_411623 ) ( ON ?auto_411621 ?auto_411622 ) ( ON ?auto_411620 ?auto_411621 ) ( CLEAR ?auto_411618 ) ( ON ?auto_411619 ?auto_411620 ) ( CLEAR ?auto_411619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_411616 ?auto_411617 ?auto_411618 ?auto_411619 )
      ( MAKE-14PILE ?auto_411616 ?auto_411617 ?auto_411618 ?auto_411619 ?auto_411620 ?auto_411621 ?auto_411622 ?auto_411623 ?auto_411624 ?auto_411625 ?auto_411626 ?auto_411627 ?auto_411628 ?auto_411629 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411645 - BLOCK
      ?auto_411646 - BLOCK
      ?auto_411647 - BLOCK
      ?auto_411648 - BLOCK
      ?auto_411649 - BLOCK
      ?auto_411650 - BLOCK
      ?auto_411651 - BLOCK
      ?auto_411652 - BLOCK
      ?auto_411653 - BLOCK
      ?auto_411654 - BLOCK
      ?auto_411655 - BLOCK
      ?auto_411656 - BLOCK
      ?auto_411657 - BLOCK
      ?auto_411658 - BLOCK
    )
    :vars
    (
      ?auto_411659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411658 ?auto_411659 ) ( ON-TABLE ?auto_411645 ) ( ON ?auto_411646 ?auto_411645 ) ( ON ?auto_411647 ?auto_411646 ) ( not ( = ?auto_411645 ?auto_411646 ) ) ( not ( = ?auto_411645 ?auto_411647 ) ) ( not ( = ?auto_411645 ?auto_411648 ) ) ( not ( = ?auto_411645 ?auto_411649 ) ) ( not ( = ?auto_411645 ?auto_411650 ) ) ( not ( = ?auto_411645 ?auto_411651 ) ) ( not ( = ?auto_411645 ?auto_411652 ) ) ( not ( = ?auto_411645 ?auto_411653 ) ) ( not ( = ?auto_411645 ?auto_411654 ) ) ( not ( = ?auto_411645 ?auto_411655 ) ) ( not ( = ?auto_411645 ?auto_411656 ) ) ( not ( = ?auto_411645 ?auto_411657 ) ) ( not ( = ?auto_411645 ?auto_411658 ) ) ( not ( = ?auto_411645 ?auto_411659 ) ) ( not ( = ?auto_411646 ?auto_411647 ) ) ( not ( = ?auto_411646 ?auto_411648 ) ) ( not ( = ?auto_411646 ?auto_411649 ) ) ( not ( = ?auto_411646 ?auto_411650 ) ) ( not ( = ?auto_411646 ?auto_411651 ) ) ( not ( = ?auto_411646 ?auto_411652 ) ) ( not ( = ?auto_411646 ?auto_411653 ) ) ( not ( = ?auto_411646 ?auto_411654 ) ) ( not ( = ?auto_411646 ?auto_411655 ) ) ( not ( = ?auto_411646 ?auto_411656 ) ) ( not ( = ?auto_411646 ?auto_411657 ) ) ( not ( = ?auto_411646 ?auto_411658 ) ) ( not ( = ?auto_411646 ?auto_411659 ) ) ( not ( = ?auto_411647 ?auto_411648 ) ) ( not ( = ?auto_411647 ?auto_411649 ) ) ( not ( = ?auto_411647 ?auto_411650 ) ) ( not ( = ?auto_411647 ?auto_411651 ) ) ( not ( = ?auto_411647 ?auto_411652 ) ) ( not ( = ?auto_411647 ?auto_411653 ) ) ( not ( = ?auto_411647 ?auto_411654 ) ) ( not ( = ?auto_411647 ?auto_411655 ) ) ( not ( = ?auto_411647 ?auto_411656 ) ) ( not ( = ?auto_411647 ?auto_411657 ) ) ( not ( = ?auto_411647 ?auto_411658 ) ) ( not ( = ?auto_411647 ?auto_411659 ) ) ( not ( = ?auto_411648 ?auto_411649 ) ) ( not ( = ?auto_411648 ?auto_411650 ) ) ( not ( = ?auto_411648 ?auto_411651 ) ) ( not ( = ?auto_411648 ?auto_411652 ) ) ( not ( = ?auto_411648 ?auto_411653 ) ) ( not ( = ?auto_411648 ?auto_411654 ) ) ( not ( = ?auto_411648 ?auto_411655 ) ) ( not ( = ?auto_411648 ?auto_411656 ) ) ( not ( = ?auto_411648 ?auto_411657 ) ) ( not ( = ?auto_411648 ?auto_411658 ) ) ( not ( = ?auto_411648 ?auto_411659 ) ) ( not ( = ?auto_411649 ?auto_411650 ) ) ( not ( = ?auto_411649 ?auto_411651 ) ) ( not ( = ?auto_411649 ?auto_411652 ) ) ( not ( = ?auto_411649 ?auto_411653 ) ) ( not ( = ?auto_411649 ?auto_411654 ) ) ( not ( = ?auto_411649 ?auto_411655 ) ) ( not ( = ?auto_411649 ?auto_411656 ) ) ( not ( = ?auto_411649 ?auto_411657 ) ) ( not ( = ?auto_411649 ?auto_411658 ) ) ( not ( = ?auto_411649 ?auto_411659 ) ) ( not ( = ?auto_411650 ?auto_411651 ) ) ( not ( = ?auto_411650 ?auto_411652 ) ) ( not ( = ?auto_411650 ?auto_411653 ) ) ( not ( = ?auto_411650 ?auto_411654 ) ) ( not ( = ?auto_411650 ?auto_411655 ) ) ( not ( = ?auto_411650 ?auto_411656 ) ) ( not ( = ?auto_411650 ?auto_411657 ) ) ( not ( = ?auto_411650 ?auto_411658 ) ) ( not ( = ?auto_411650 ?auto_411659 ) ) ( not ( = ?auto_411651 ?auto_411652 ) ) ( not ( = ?auto_411651 ?auto_411653 ) ) ( not ( = ?auto_411651 ?auto_411654 ) ) ( not ( = ?auto_411651 ?auto_411655 ) ) ( not ( = ?auto_411651 ?auto_411656 ) ) ( not ( = ?auto_411651 ?auto_411657 ) ) ( not ( = ?auto_411651 ?auto_411658 ) ) ( not ( = ?auto_411651 ?auto_411659 ) ) ( not ( = ?auto_411652 ?auto_411653 ) ) ( not ( = ?auto_411652 ?auto_411654 ) ) ( not ( = ?auto_411652 ?auto_411655 ) ) ( not ( = ?auto_411652 ?auto_411656 ) ) ( not ( = ?auto_411652 ?auto_411657 ) ) ( not ( = ?auto_411652 ?auto_411658 ) ) ( not ( = ?auto_411652 ?auto_411659 ) ) ( not ( = ?auto_411653 ?auto_411654 ) ) ( not ( = ?auto_411653 ?auto_411655 ) ) ( not ( = ?auto_411653 ?auto_411656 ) ) ( not ( = ?auto_411653 ?auto_411657 ) ) ( not ( = ?auto_411653 ?auto_411658 ) ) ( not ( = ?auto_411653 ?auto_411659 ) ) ( not ( = ?auto_411654 ?auto_411655 ) ) ( not ( = ?auto_411654 ?auto_411656 ) ) ( not ( = ?auto_411654 ?auto_411657 ) ) ( not ( = ?auto_411654 ?auto_411658 ) ) ( not ( = ?auto_411654 ?auto_411659 ) ) ( not ( = ?auto_411655 ?auto_411656 ) ) ( not ( = ?auto_411655 ?auto_411657 ) ) ( not ( = ?auto_411655 ?auto_411658 ) ) ( not ( = ?auto_411655 ?auto_411659 ) ) ( not ( = ?auto_411656 ?auto_411657 ) ) ( not ( = ?auto_411656 ?auto_411658 ) ) ( not ( = ?auto_411656 ?auto_411659 ) ) ( not ( = ?auto_411657 ?auto_411658 ) ) ( not ( = ?auto_411657 ?auto_411659 ) ) ( not ( = ?auto_411658 ?auto_411659 ) ) ( ON ?auto_411657 ?auto_411658 ) ( ON ?auto_411656 ?auto_411657 ) ( ON ?auto_411655 ?auto_411656 ) ( ON ?auto_411654 ?auto_411655 ) ( ON ?auto_411653 ?auto_411654 ) ( ON ?auto_411652 ?auto_411653 ) ( ON ?auto_411651 ?auto_411652 ) ( ON ?auto_411650 ?auto_411651 ) ( ON ?auto_411649 ?auto_411650 ) ( CLEAR ?auto_411647 ) ( ON ?auto_411648 ?auto_411649 ) ( CLEAR ?auto_411648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_411645 ?auto_411646 ?auto_411647 ?auto_411648 )
      ( MAKE-14PILE ?auto_411645 ?auto_411646 ?auto_411647 ?auto_411648 ?auto_411649 ?auto_411650 ?auto_411651 ?auto_411652 ?auto_411653 ?auto_411654 ?auto_411655 ?auto_411656 ?auto_411657 ?auto_411658 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411674 - BLOCK
      ?auto_411675 - BLOCK
      ?auto_411676 - BLOCK
      ?auto_411677 - BLOCK
      ?auto_411678 - BLOCK
      ?auto_411679 - BLOCK
      ?auto_411680 - BLOCK
      ?auto_411681 - BLOCK
      ?auto_411682 - BLOCK
      ?auto_411683 - BLOCK
      ?auto_411684 - BLOCK
      ?auto_411685 - BLOCK
      ?auto_411686 - BLOCK
      ?auto_411687 - BLOCK
    )
    :vars
    (
      ?auto_411688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411687 ?auto_411688 ) ( ON-TABLE ?auto_411674 ) ( ON ?auto_411675 ?auto_411674 ) ( not ( = ?auto_411674 ?auto_411675 ) ) ( not ( = ?auto_411674 ?auto_411676 ) ) ( not ( = ?auto_411674 ?auto_411677 ) ) ( not ( = ?auto_411674 ?auto_411678 ) ) ( not ( = ?auto_411674 ?auto_411679 ) ) ( not ( = ?auto_411674 ?auto_411680 ) ) ( not ( = ?auto_411674 ?auto_411681 ) ) ( not ( = ?auto_411674 ?auto_411682 ) ) ( not ( = ?auto_411674 ?auto_411683 ) ) ( not ( = ?auto_411674 ?auto_411684 ) ) ( not ( = ?auto_411674 ?auto_411685 ) ) ( not ( = ?auto_411674 ?auto_411686 ) ) ( not ( = ?auto_411674 ?auto_411687 ) ) ( not ( = ?auto_411674 ?auto_411688 ) ) ( not ( = ?auto_411675 ?auto_411676 ) ) ( not ( = ?auto_411675 ?auto_411677 ) ) ( not ( = ?auto_411675 ?auto_411678 ) ) ( not ( = ?auto_411675 ?auto_411679 ) ) ( not ( = ?auto_411675 ?auto_411680 ) ) ( not ( = ?auto_411675 ?auto_411681 ) ) ( not ( = ?auto_411675 ?auto_411682 ) ) ( not ( = ?auto_411675 ?auto_411683 ) ) ( not ( = ?auto_411675 ?auto_411684 ) ) ( not ( = ?auto_411675 ?auto_411685 ) ) ( not ( = ?auto_411675 ?auto_411686 ) ) ( not ( = ?auto_411675 ?auto_411687 ) ) ( not ( = ?auto_411675 ?auto_411688 ) ) ( not ( = ?auto_411676 ?auto_411677 ) ) ( not ( = ?auto_411676 ?auto_411678 ) ) ( not ( = ?auto_411676 ?auto_411679 ) ) ( not ( = ?auto_411676 ?auto_411680 ) ) ( not ( = ?auto_411676 ?auto_411681 ) ) ( not ( = ?auto_411676 ?auto_411682 ) ) ( not ( = ?auto_411676 ?auto_411683 ) ) ( not ( = ?auto_411676 ?auto_411684 ) ) ( not ( = ?auto_411676 ?auto_411685 ) ) ( not ( = ?auto_411676 ?auto_411686 ) ) ( not ( = ?auto_411676 ?auto_411687 ) ) ( not ( = ?auto_411676 ?auto_411688 ) ) ( not ( = ?auto_411677 ?auto_411678 ) ) ( not ( = ?auto_411677 ?auto_411679 ) ) ( not ( = ?auto_411677 ?auto_411680 ) ) ( not ( = ?auto_411677 ?auto_411681 ) ) ( not ( = ?auto_411677 ?auto_411682 ) ) ( not ( = ?auto_411677 ?auto_411683 ) ) ( not ( = ?auto_411677 ?auto_411684 ) ) ( not ( = ?auto_411677 ?auto_411685 ) ) ( not ( = ?auto_411677 ?auto_411686 ) ) ( not ( = ?auto_411677 ?auto_411687 ) ) ( not ( = ?auto_411677 ?auto_411688 ) ) ( not ( = ?auto_411678 ?auto_411679 ) ) ( not ( = ?auto_411678 ?auto_411680 ) ) ( not ( = ?auto_411678 ?auto_411681 ) ) ( not ( = ?auto_411678 ?auto_411682 ) ) ( not ( = ?auto_411678 ?auto_411683 ) ) ( not ( = ?auto_411678 ?auto_411684 ) ) ( not ( = ?auto_411678 ?auto_411685 ) ) ( not ( = ?auto_411678 ?auto_411686 ) ) ( not ( = ?auto_411678 ?auto_411687 ) ) ( not ( = ?auto_411678 ?auto_411688 ) ) ( not ( = ?auto_411679 ?auto_411680 ) ) ( not ( = ?auto_411679 ?auto_411681 ) ) ( not ( = ?auto_411679 ?auto_411682 ) ) ( not ( = ?auto_411679 ?auto_411683 ) ) ( not ( = ?auto_411679 ?auto_411684 ) ) ( not ( = ?auto_411679 ?auto_411685 ) ) ( not ( = ?auto_411679 ?auto_411686 ) ) ( not ( = ?auto_411679 ?auto_411687 ) ) ( not ( = ?auto_411679 ?auto_411688 ) ) ( not ( = ?auto_411680 ?auto_411681 ) ) ( not ( = ?auto_411680 ?auto_411682 ) ) ( not ( = ?auto_411680 ?auto_411683 ) ) ( not ( = ?auto_411680 ?auto_411684 ) ) ( not ( = ?auto_411680 ?auto_411685 ) ) ( not ( = ?auto_411680 ?auto_411686 ) ) ( not ( = ?auto_411680 ?auto_411687 ) ) ( not ( = ?auto_411680 ?auto_411688 ) ) ( not ( = ?auto_411681 ?auto_411682 ) ) ( not ( = ?auto_411681 ?auto_411683 ) ) ( not ( = ?auto_411681 ?auto_411684 ) ) ( not ( = ?auto_411681 ?auto_411685 ) ) ( not ( = ?auto_411681 ?auto_411686 ) ) ( not ( = ?auto_411681 ?auto_411687 ) ) ( not ( = ?auto_411681 ?auto_411688 ) ) ( not ( = ?auto_411682 ?auto_411683 ) ) ( not ( = ?auto_411682 ?auto_411684 ) ) ( not ( = ?auto_411682 ?auto_411685 ) ) ( not ( = ?auto_411682 ?auto_411686 ) ) ( not ( = ?auto_411682 ?auto_411687 ) ) ( not ( = ?auto_411682 ?auto_411688 ) ) ( not ( = ?auto_411683 ?auto_411684 ) ) ( not ( = ?auto_411683 ?auto_411685 ) ) ( not ( = ?auto_411683 ?auto_411686 ) ) ( not ( = ?auto_411683 ?auto_411687 ) ) ( not ( = ?auto_411683 ?auto_411688 ) ) ( not ( = ?auto_411684 ?auto_411685 ) ) ( not ( = ?auto_411684 ?auto_411686 ) ) ( not ( = ?auto_411684 ?auto_411687 ) ) ( not ( = ?auto_411684 ?auto_411688 ) ) ( not ( = ?auto_411685 ?auto_411686 ) ) ( not ( = ?auto_411685 ?auto_411687 ) ) ( not ( = ?auto_411685 ?auto_411688 ) ) ( not ( = ?auto_411686 ?auto_411687 ) ) ( not ( = ?auto_411686 ?auto_411688 ) ) ( not ( = ?auto_411687 ?auto_411688 ) ) ( ON ?auto_411686 ?auto_411687 ) ( ON ?auto_411685 ?auto_411686 ) ( ON ?auto_411684 ?auto_411685 ) ( ON ?auto_411683 ?auto_411684 ) ( ON ?auto_411682 ?auto_411683 ) ( ON ?auto_411681 ?auto_411682 ) ( ON ?auto_411680 ?auto_411681 ) ( ON ?auto_411679 ?auto_411680 ) ( ON ?auto_411678 ?auto_411679 ) ( ON ?auto_411677 ?auto_411678 ) ( CLEAR ?auto_411675 ) ( ON ?auto_411676 ?auto_411677 ) ( CLEAR ?auto_411676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_411674 ?auto_411675 ?auto_411676 )
      ( MAKE-14PILE ?auto_411674 ?auto_411675 ?auto_411676 ?auto_411677 ?auto_411678 ?auto_411679 ?auto_411680 ?auto_411681 ?auto_411682 ?auto_411683 ?auto_411684 ?auto_411685 ?auto_411686 ?auto_411687 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411703 - BLOCK
      ?auto_411704 - BLOCK
      ?auto_411705 - BLOCK
      ?auto_411706 - BLOCK
      ?auto_411707 - BLOCK
      ?auto_411708 - BLOCK
      ?auto_411709 - BLOCK
      ?auto_411710 - BLOCK
      ?auto_411711 - BLOCK
      ?auto_411712 - BLOCK
      ?auto_411713 - BLOCK
      ?auto_411714 - BLOCK
      ?auto_411715 - BLOCK
      ?auto_411716 - BLOCK
    )
    :vars
    (
      ?auto_411717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411716 ?auto_411717 ) ( ON-TABLE ?auto_411703 ) ( ON ?auto_411704 ?auto_411703 ) ( not ( = ?auto_411703 ?auto_411704 ) ) ( not ( = ?auto_411703 ?auto_411705 ) ) ( not ( = ?auto_411703 ?auto_411706 ) ) ( not ( = ?auto_411703 ?auto_411707 ) ) ( not ( = ?auto_411703 ?auto_411708 ) ) ( not ( = ?auto_411703 ?auto_411709 ) ) ( not ( = ?auto_411703 ?auto_411710 ) ) ( not ( = ?auto_411703 ?auto_411711 ) ) ( not ( = ?auto_411703 ?auto_411712 ) ) ( not ( = ?auto_411703 ?auto_411713 ) ) ( not ( = ?auto_411703 ?auto_411714 ) ) ( not ( = ?auto_411703 ?auto_411715 ) ) ( not ( = ?auto_411703 ?auto_411716 ) ) ( not ( = ?auto_411703 ?auto_411717 ) ) ( not ( = ?auto_411704 ?auto_411705 ) ) ( not ( = ?auto_411704 ?auto_411706 ) ) ( not ( = ?auto_411704 ?auto_411707 ) ) ( not ( = ?auto_411704 ?auto_411708 ) ) ( not ( = ?auto_411704 ?auto_411709 ) ) ( not ( = ?auto_411704 ?auto_411710 ) ) ( not ( = ?auto_411704 ?auto_411711 ) ) ( not ( = ?auto_411704 ?auto_411712 ) ) ( not ( = ?auto_411704 ?auto_411713 ) ) ( not ( = ?auto_411704 ?auto_411714 ) ) ( not ( = ?auto_411704 ?auto_411715 ) ) ( not ( = ?auto_411704 ?auto_411716 ) ) ( not ( = ?auto_411704 ?auto_411717 ) ) ( not ( = ?auto_411705 ?auto_411706 ) ) ( not ( = ?auto_411705 ?auto_411707 ) ) ( not ( = ?auto_411705 ?auto_411708 ) ) ( not ( = ?auto_411705 ?auto_411709 ) ) ( not ( = ?auto_411705 ?auto_411710 ) ) ( not ( = ?auto_411705 ?auto_411711 ) ) ( not ( = ?auto_411705 ?auto_411712 ) ) ( not ( = ?auto_411705 ?auto_411713 ) ) ( not ( = ?auto_411705 ?auto_411714 ) ) ( not ( = ?auto_411705 ?auto_411715 ) ) ( not ( = ?auto_411705 ?auto_411716 ) ) ( not ( = ?auto_411705 ?auto_411717 ) ) ( not ( = ?auto_411706 ?auto_411707 ) ) ( not ( = ?auto_411706 ?auto_411708 ) ) ( not ( = ?auto_411706 ?auto_411709 ) ) ( not ( = ?auto_411706 ?auto_411710 ) ) ( not ( = ?auto_411706 ?auto_411711 ) ) ( not ( = ?auto_411706 ?auto_411712 ) ) ( not ( = ?auto_411706 ?auto_411713 ) ) ( not ( = ?auto_411706 ?auto_411714 ) ) ( not ( = ?auto_411706 ?auto_411715 ) ) ( not ( = ?auto_411706 ?auto_411716 ) ) ( not ( = ?auto_411706 ?auto_411717 ) ) ( not ( = ?auto_411707 ?auto_411708 ) ) ( not ( = ?auto_411707 ?auto_411709 ) ) ( not ( = ?auto_411707 ?auto_411710 ) ) ( not ( = ?auto_411707 ?auto_411711 ) ) ( not ( = ?auto_411707 ?auto_411712 ) ) ( not ( = ?auto_411707 ?auto_411713 ) ) ( not ( = ?auto_411707 ?auto_411714 ) ) ( not ( = ?auto_411707 ?auto_411715 ) ) ( not ( = ?auto_411707 ?auto_411716 ) ) ( not ( = ?auto_411707 ?auto_411717 ) ) ( not ( = ?auto_411708 ?auto_411709 ) ) ( not ( = ?auto_411708 ?auto_411710 ) ) ( not ( = ?auto_411708 ?auto_411711 ) ) ( not ( = ?auto_411708 ?auto_411712 ) ) ( not ( = ?auto_411708 ?auto_411713 ) ) ( not ( = ?auto_411708 ?auto_411714 ) ) ( not ( = ?auto_411708 ?auto_411715 ) ) ( not ( = ?auto_411708 ?auto_411716 ) ) ( not ( = ?auto_411708 ?auto_411717 ) ) ( not ( = ?auto_411709 ?auto_411710 ) ) ( not ( = ?auto_411709 ?auto_411711 ) ) ( not ( = ?auto_411709 ?auto_411712 ) ) ( not ( = ?auto_411709 ?auto_411713 ) ) ( not ( = ?auto_411709 ?auto_411714 ) ) ( not ( = ?auto_411709 ?auto_411715 ) ) ( not ( = ?auto_411709 ?auto_411716 ) ) ( not ( = ?auto_411709 ?auto_411717 ) ) ( not ( = ?auto_411710 ?auto_411711 ) ) ( not ( = ?auto_411710 ?auto_411712 ) ) ( not ( = ?auto_411710 ?auto_411713 ) ) ( not ( = ?auto_411710 ?auto_411714 ) ) ( not ( = ?auto_411710 ?auto_411715 ) ) ( not ( = ?auto_411710 ?auto_411716 ) ) ( not ( = ?auto_411710 ?auto_411717 ) ) ( not ( = ?auto_411711 ?auto_411712 ) ) ( not ( = ?auto_411711 ?auto_411713 ) ) ( not ( = ?auto_411711 ?auto_411714 ) ) ( not ( = ?auto_411711 ?auto_411715 ) ) ( not ( = ?auto_411711 ?auto_411716 ) ) ( not ( = ?auto_411711 ?auto_411717 ) ) ( not ( = ?auto_411712 ?auto_411713 ) ) ( not ( = ?auto_411712 ?auto_411714 ) ) ( not ( = ?auto_411712 ?auto_411715 ) ) ( not ( = ?auto_411712 ?auto_411716 ) ) ( not ( = ?auto_411712 ?auto_411717 ) ) ( not ( = ?auto_411713 ?auto_411714 ) ) ( not ( = ?auto_411713 ?auto_411715 ) ) ( not ( = ?auto_411713 ?auto_411716 ) ) ( not ( = ?auto_411713 ?auto_411717 ) ) ( not ( = ?auto_411714 ?auto_411715 ) ) ( not ( = ?auto_411714 ?auto_411716 ) ) ( not ( = ?auto_411714 ?auto_411717 ) ) ( not ( = ?auto_411715 ?auto_411716 ) ) ( not ( = ?auto_411715 ?auto_411717 ) ) ( not ( = ?auto_411716 ?auto_411717 ) ) ( ON ?auto_411715 ?auto_411716 ) ( ON ?auto_411714 ?auto_411715 ) ( ON ?auto_411713 ?auto_411714 ) ( ON ?auto_411712 ?auto_411713 ) ( ON ?auto_411711 ?auto_411712 ) ( ON ?auto_411710 ?auto_411711 ) ( ON ?auto_411709 ?auto_411710 ) ( ON ?auto_411708 ?auto_411709 ) ( ON ?auto_411707 ?auto_411708 ) ( ON ?auto_411706 ?auto_411707 ) ( CLEAR ?auto_411704 ) ( ON ?auto_411705 ?auto_411706 ) ( CLEAR ?auto_411705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_411703 ?auto_411704 ?auto_411705 )
      ( MAKE-14PILE ?auto_411703 ?auto_411704 ?auto_411705 ?auto_411706 ?auto_411707 ?auto_411708 ?auto_411709 ?auto_411710 ?auto_411711 ?auto_411712 ?auto_411713 ?auto_411714 ?auto_411715 ?auto_411716 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411732 - BLOCK
      ?auto_411733 - BLOCK
      ?auto_411734 - BLOCK
      ?auto_411735 - BLOCK
      ?auto_411736 - BLOCK
      ?auto_411737 - BLOCK
      ?auto_411738 - BLOCK
      ?auto_411739 - BLOCK
      ?auto_411740 - BLOCK
      ?auto_411741 - BLOCK
      ?auto_411742 - BLOCK
      ?auto_411743 - BLOCK
      ?auto_411744 - BLOCK
      ?auto_411745 - BLOCK
    )
    :vars
    (
      ?auto_411746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411745 ?auto_411746 ) ( ON-TABLE ?auto_411732 ) ( not ( = ?auto_411732 ?auto_411733 ) ) ( not ( = ?auto_411732 ?auto_411734 ) ) ( not ( = ?auto_411732 ?auto_411735 ) ) ( not ( = ?auto_411732 ?auto_411736 ) ) ( not ( = ?auto_411732 ?auto_411737 ) ) ( not ( = ?auto_411732 ?auto_411738 ) ) ( not ( = ?auto_411732 ?auto_411739 ) ) ( not ( = ?auto_411732 ?auto_411740 ) ) ( not ( = ?auto_411732 ?auto_411741 ) ) ( not ( = ?auto_411732 ?auto_411742 ) ) ( not ( = ?auto_411732 ?auto_411743 ) ) ( not ( = ?auto_411732 ?auto_411744 ) ) ( not ( = ?auto_411732 ?auto_411745 ) ) ( not ( = ?auto_411732 ?auto_411746 ) ) ( not ( = ?auto_411733 ?auto_411734 ) ) ( not ( = ?auto_411733 ?auto_411735 ) ) ( not ( = ?auto_411733 ?auto_411736 ) ) ( not ( = ?auto_411733 ?auto_411737 ) ) ( not ( = ?auto_411733 ?auto_411738 ) ) ( not ( = ?auto_411733 ?auto_411739 ) ) ( not ( = ?auto_411733 ?auto_411740 ) ) ( not ( = ?auto_411733 ?auto_411741 ) ) ( not ( = ?auto_411733 ?auto_411742 ) ) ( not ( = ?auto_411733 ?auto_411743 ) ) ( not ( = ?auto_411733 ?auto_411744 ) ) ( not ( = ?auto_411733 ?auto_411745 ) ) ( not ( = ?auto_411733 ?auto_411746 ) ) ( not ( = ?auto_411734 ?auto_411735 ) ) ( not ( = ?auto_411734 ?auto_411736 ) ) ( not ( = ?auto_411734 ?auto_411737 ) ) ( not ( = ?auto_411734 ?auto_411738 ) ) ( not ( = ?auto_411734 ?auto_411739 ) ) ( not ( = ?auto_411734 ?auto_411740 ) ) ( not ( = ?auto_411734 ?auto_411741 ) ) ( not ( = ?auto_411734 ?auto_411742 ) ) ( not ( = ?auto_411734 ?auto_411743 ) ) ( not ( = ?auto_411734 ?auto_411744 ) ) ( not ( = ?auto_411734 ?auto_411745 ) ) ( not ( = ?auto_411734 ?auto_411746 ) ) ( not ( = ?auto_411735 ?auto_411736 ) ) ( not ( = ?auto_411735 ?auto_411737 ) ) ( not ( = ?auto_411735 ?auto_411738 ) ) ( not ( = ?auto_411735 ?auto_411739 ) ) ( not ( = ?auto_411735 ?auto_411740 ) ) ( not ( = ?auto_411735 ?auto_411741 ) ) ( not ( = ?auto_411735 ?auto_411742 ) ) ( not ( = ?auto_411735 ?auto_411743 ) ) ( not ( = ?auto_411735 ?auto_411744 ) ) ( not ( = ?auto_411735 ?auto_411745 ) ) ( not ( = ?auto_411735 ?auto_411746 ) ) ( not ( = ?auto_411736 ?auto_411737 ) ) ( not ( = ?auto_411736 ?auto_411738 ) ) ( not ( = ?auto_411736 ?auto_411739 ) ) ( not ( = ?auto_411736 ?auto_411740 ) ) ( not ( = ?auto_411736 ?auto_411741 ) ) ( not ( = ?auto_411736 ?auto_411742 ) ) ( not ( = ?auto_411736 ?auto_411743 ) ) ( not ( = ?auto_411736 ?auto_411744 ) ) ( not ( = ?auto_411736 ?auto_411745 ) ) ( not ( = ?auto_411736 ?auto_411746 ) ) ( not ( = ?auto_411737 ?auto_411738 ) ) ( not ( = ?auto_411737 ?auto_411739 ) ) ( not ( = ?auto_411737 ?auto_411740 ) ) ( not ( = ?auto_411737 ?auto_411741 ) ) ( not ( = ?auto_411737 ?auto_411742 ) ) ( not ( = ?auto_411737 ?auto_411743 ) ) ( not ( = ?auto_411737 ?auto_411744 ) ) ( not ( = ?auto_411737 ?auto_411745 ) ) ( not ( = ?auto_411737 ?auto_411746 ) ) ( not ( = ?auto_411738 ?auto_411739 ) ) ( not ( = ?auto_411738 ?auto_411740 ) ) ( not ( = ?auto_411738 ?auto_411741 ) ) ( not ( = ?auto_411738 ?auto_411742 ) ) ( not ( = ?auto_411738 ?auto_411743 ) ) ( not ( = ?auto_411738 ?auto_411744 ) ) ( not ( = ?auto_411738 ?auto_411745 ) ) ( not ( = ?auto_411738 ?auto_411746 ) ) ( not ( = ?auto_411739 ?auto_411740 ) ) ( not ( = ?auto_411739 ?auto_411741 ) ) ( not ( = ?auto_411739 ?auto_411742 ) ) ( not ( = ?auto_411739 ?auto_411743 ) ) ( not ( = ?auto_411739 ?auto_411744 ) ) ( not ( = ?auto_411739 ?auto_411745 ) ) ( not ( = ?auto_411739 ?auto_411746 ) ) ( not ( = ?auto_411740 ?auto_411741 ) ) ( not ( = ?auto_411740 ?auto_411742 ) ) ( not ( = ?auto_411740 ?auto_411743 ) ) ( not ( = ?auto_411740 ?auto_411744 ) ) ( not ( = ?auto_411740 ?auto_411745 ) ) ( not ( = ?auto_411740 ?auto_411746 ) ) ( not ( = ?auto_411741 ?auto_411742 ) ) ( not ( = ?auto_411741 ?auto_411743 ) ) ( not ( = ?auto_411741 ?auto_411744 ) ) ( not ( = ?auto_411741 ?auto_411745 ) ) ( not ( = ?auto_411741 ?auto_411746 ) ) ( not ( = ?auto_411742 ?auto_411743 ) ) ( not ( = ?auto_411742 ?auto_411744 ) ) ( not ( = ?auto_411742 ?auto_411745 ) ) ( not ( = ?auto_411742 ?auto_411746 ) ) ( not ( = ?auto_411743 ?auto_411744 ) ) ( not ( = ?auto_411743 ?auto_411745 ) ) ( not ( = ?auto_411743 ?auto_411746 ) ) ( not ( = ?auto_411744 ?auto_411745 ) ) ( not ( = ?auto_411744 ?auto_411746 ) ) ( not ( = ?auto_411745 ?auto_411746 ) ) ( ON ?auto_411744 ?auto_411745 ) ( ON ?auto_411743 ?auto_411744 ) ( ON ?auto_411742 ?auto_411743 ) ( ON ?auto_411741 ?auto_411742 ) ( ON ?auto_411740 ?auto_411741 ) ( ON ?auto_411739 ?auto_411740 ) ( ON ?auto_411738 ?auto_411739 ) ( ON ?auto_411737 ?auto_411738 ) ( ON ?auto_411736 ?auto_411737 ) ( ON ?auto_411735 ?auto_411736 ) ( ON ?auto_411734 ?auto_411735 ) ( CLEAR ?auto_411732 ) ( ON ?auto_411733 ?auto_411734 ) ( CLEAR ?auto_411733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_411732 ?auto_411733 )
      ( MAKE-14PILE ?auto_411732 ?auto_411733 ?auto_411734 ?auto_411735 ?auto_411736 ?auto_411737 ?auto_411738 ?auto_411739 ?auto_411740 ?auto_411741 ?auto_411742 ?auto_411743 ?auto_411744 ?auto_411745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411761 - BLOCK
      ?auto_411762 - BLOCK
      ?auto_411763 - BLOCK
      ?auto_411764 - BLOCK
      ?auto_411765 - BLOCK
      ?auto_411766 - BLOCK
      ?auto_411767 - BLOCK
      ?auto_411768 - BLOCK
      ?auto_411769 - BLOCK
      ?auto_411770 - BLOCK
      ?auto_411771 - BLOCK
      ?auto_411772 - BLOCK
      ?auto_411773 - BLOCK
      ?auto_411774 - BLOCK
    )
    :vars
    (
      ?auto_411775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411774 ?auto_411775 ) ( ON-TABLE ?auto_411761 ) ( not ( = ?auto_411761 ?auto_411762 ) ) ( not ( = ?auto_411761 ?auto_411763 ) ) ( not ( = ?auto_411761 ?auto_411764 ) ) ( not ( = ?auto_411761 ?auto_411765 ) ) ( not ( = ?auto_411761 ?auto_411766 ) ) ( not ( = ?auto_411761 ?auto_411767 ) ) ( not ( = ?auto_411761 ?auto_411768 ) ) ( not ( = ?auto_411761 ?auto_411769 ) ) ( not ( = ?auto_411761 ?auto_411770 ) ) ( not ( = ?auto_411761 ?auto_411771 ) ) ( not ( = ?auto_411761 ?auto_411772 ) ) ( not ( = ?auto_411761 ?auto_411773 ) ) ( not ( = ?auto_411761 ?auto_411774 ) ) ( not ( = ?auto_411761 ?auto_411775 ) ) ( not ( = ?auto_411762 ?auto_411763 ) ) ( not ( = ?auto_411762 ?auto_411764 ) ) ( not ( = ?auto_411762 ?auto_411765 ) ) ( not ( = ?auto_411762 ?auto_411766 ) ) ( not ( = ?auto_411762 ?auto_411767 ) ) ( not ( = ?auto_411762 ?auto_411768 ) ) ( not ( = ?auto_411762 ?auto_411769 ) ) ( not ( = ?auto_411762 ?auto_411770 ) ) ( not ( = ?auto_411762 ?auto_411771 ) ) ( not ( = ?auto_411762 ?auto_411772 ) ) ( not ( = ?auto_411762 ?auto_411773 ) ) ( not ( = ?auto_411762 ?auto_411774 ) ) ( not ( = ?auto_411762 ?auto_411775 ) ) ( not ( = ?auto_411763 ?auto_411764 ) ) ( not ( = ?auto_411763 ?auto_411765 ) ) ( not ( = ?auto_411763 ?auto_411766 ) ) ( not ( = ?auto_411763 ?auto_411767 ) ) ( not ( = ?auto_411763 ?auto_411768 ) ) ( not ( = ?auto_411763 ?auto_411769 ) ) ( not ( = ?auto_411763 ?auto_411770 ) ) ( not ( = ?auto_411763 ?auto_411771 ) ) ( not ( = ?auto_411763 ?auto_411772 ) ) ( not ( = ?auto_411763 ?auto_411773 ) ) ( not ( = ?auto_411763 ?auto_411774 ) ) ( not ( = ?auto_411763 ?auto_411775 ) ) ( not ( = ?auto_411764 ?auto_411765 ) ) ( not ( = ?auto_411764 ?auto_411766 ) ) ( not ( = ?auto_411764 ?auto_411767 ) ) ( not ( = ?auto_411764 ?auto_411768 ) ) ( not ( = ?auto_411764 ?auto_411769 ) ) ( not ( = ?auto_411764 ?auto_411770 ) ) ( not ( = ?auto_411764 ?auto_411771 ) ) ( not ( = ?auto_411764 ?auto_411772 ) ) ( not ( = ?auto_411764 ?auto_411773 ) ) ( not ( = ?auto_411764 ?auto_411774 ) ) ( not ( = ?auto_411764 ?auto_411775 ) ) ( not ( = ?auto_411765 ?auto_411766 ) ) ( not ( = ?auto_411765 ?auto_411767 ) ) ( not ( = ?auto_411765 ?auto_411768 ) ) ( not ( = ?auto_411765 ?auto_411769 ) ) ( not ( = ?auto_411765 ?auto_411770 ) ) ( not ( = ?auto_411765 ?auto_411771 ) ) ( not ( = ?auto_411765 ?auto_411772 ) ) ( not ( = ?auto_411765 ?auto_411773 ) ) ( not ( = ?auto_411765 ?auto_411774 ) ) ( not ( = ?auto_411765 ?auto_411775 ) ) ( not ( = ?auto_411766 ?auto_411767 ) ) ( not ( = ?auto_411766 ?auto_411768 ) ) ( not ( = ?auto_411766 ?auto_411769 ) ) ( not ( = ?auto_411766 ?auto_411770 ) ) ( not ( = ?auto_411766 ?auto_411771 ) ) ( not ( = ?auto_411766 ?auto_411772 ) ) ( not ( = ?auto_411766 ?auto_411773 ) ) ( not ( = ?auto_411766 ?auto_411774 ) ) ( not ( = ?auto_411766 ?auto_411775 ) ) ( not ( = ?auto_411767 ?auto_411768 ) ) ( not ( = ?auto_411767 ?auto_411769 ) ) ( not ( = ?auto_411767 ?auto_411770 ) ) ( not ( = ?auto_411767 ?auto_411771 ) ) ( not ( = ?auto_411767 ?auto_411772 ) ) ( not ( = ?auto_411767 ?auto_411773 ) ) ( not ( = ?auto_411767 ?auto_411774 ) ) ( not ( = ?auto_411767 ?auto_411775 ) ) ( not ( = ?auto_411768 ?auto_411769 ) ) ( not ( = ?auto_411768 ?auto_411770 ) ) ( not ( = ?auto_411768 ?auto_411771 ) ) ( not ( = ?auto_411768 ?auto_411772 ) ) ( not ( = ?auto_411768 ?auto_411773 ) ) ( not ( = ?auto_411768 ?auto_411774 ) ) ( not ( = ?auto_411768 ?auto_411775 ) ) ( not ( = ?auto_411769 ?auto_411770 ) ) ( not ( = ?auto_411769 ?auto_411771 ) ) ( not ( = ?auto_411769 ?auto_411772 ) ) ( not ( = ?auto_411769 ?auto_411773 ) ) ( not ( = ?auto_411769 ?auto_411774 ) ) ( not ( = ?auto_411769 ?auto_411775 ) ) ( not ( = ?auto_411770 ?auto_411771 ) ) ( not ( = ?auto_411770 ?auto_411772 ) ) ( not ( = ?auto_411770 ?auto_411773 ) ) ( not ( = ?auto_411770 ?auto_411774 ) ) ( not ( = ?auto_411770 ?auto_411775 ) ) ( not ( = ?auto_411771 ?auto_411772 ) ) ( not ( = ?auto_411771 ?auto_411773 ) ) ( not ( = ?auto_411771 ?auto_411774 ) ) ( not ( = ?auto_411771 ?auto_411775 ) ) ( not ( = ?auto_411772 ?auto_411773 ) ) ( not ( = ?auto_411772 ?auto_411774 ) ) ( not ( = ?auto_411772 ?auto_411775 ) ) ( not ( = ?auto_411773 ?auto_411774 ) ) ( not ( = ?auto_411773 ?auto_411775 ) ) ( not ( = ?auto_411774 ?auto_411775 ) ) ( ON ?auto_411773 ?auto_411774 ) ( ON ?auto_411772 ?auto_411773 ) ( ON ?auto_411771 ?auto_411772 ) ( ON ?auto_411770 ?auto_411771 ) ( ON ?auto_411769 ?auto_411770 ) ( ON ?auto_411768 ?auto_411769 ) ( ON ?auto_411767 ?auto_411768 ) ( ON ?auto_411766 ?auto_411767 ) ( ON ?auto_411765 ?auto_411766 ) ( ON ?auto_411764 ?auto_411765 ) ( ON ?auto_411763 ?auto_411764 ) ( CLEAR ?auto_411761 ) ( ON ?auto_411762 ?auto_411763 ) ( CLEAR ?auto_411762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_411761 ?auto_411762 )
      ( MAKE-14PILE ?auto_411761 ?auto_411762 ?auto_411763 ?auto_411764 ?auto_411765 ?auto_411766 ?auto_411767 ?auto_411768 ?auto_411769 ?auto_411770 ?auto_411771 ?auto_411772 ?auto_411773 ?auto_411774 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411790 - BLOCK
      ?auto_411791 - BLOCK
      ?auto_411792 - BLOCK
      ?auto_411793 - BLOCK
      ?auto_411794 - BLOCK
      ?auto_411795 - BLOCK
      ?auto_411796 - BLOCK
      ?auto_411797 - BLOCK
      ?auto_411798 - BLOCK
      ?auto_411799 - BLOCK
      ?auto_411800 - BLOCK
      ?auto_411801 - BLOCK
      ?auto_411802 - BLOCK
      ?auto_411803 - BLOCK
    )
    :vars
    (
      ?auto_411804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411803 ?auto_411804 ) ( not ( = ?auto_411790 ?auto_411791 ) ) ( not ( = ?auto_411790 ?auto_411792 ) ) ( not ( = ?auto_411790 ?auto_411793 ) ) ( not ( = ?auto_411790 ?auto_411794 ) ) ( not ( = ?auto_411790 ?auto_411795 ) ) ( not ( = ?auto_411790 ?auto_411796 ) ) ( not ( = ?auto_411790 ?auto_411797 ) ) ( not ( = ?auto_411790 ?auto_411798 ) ) ( not ( = ?auto_411790 ?auto_411799 ) ) ( not ( = ?auto_411790 ?auto_411800 ) ) ( not ( = ?auto_411790 ?auto_411801 ) ) ( not ( = ?auto_411790 ?auto_411802 ) ) ( not ( = ?auto_411790 ?auto_411803 ) ) ( not ( = ?auto_411790 ?auto_411804 ) ) ( not ( = ?auto_411791 ?auto_411792 ) ) ( not ( = ?auto_411791 ?auto_411793 ) ) ( not ( = ?auto_411791 ?auto_411794 ) ) ( not ( = ?auto_411791 ?auto_411795 ) ) ( not ( = ?auto_411791 ?auto_411796 ) ) ( not ( = ?auto_411791 ?auto_411797 ) ) ( not ( = ?auto_411791 ?auto_411798 ) ) ( not ( = ?auto_411791 ?auto_411799 ) ) ( not ( = ?auto_411791 ?auto_411800 ) ) ( not ( = ?auto_411791 ?auto_411801 ) ) ( not ( = ?auto_411791 ?auto_411802 ) ) ( not ( = ?auto_411791 ?auto_411803 ) ) ( not ( = ?auto_411791 ?auto_411804 ) ) ( not ( = ?auto_411792 ?auto_411793 ) ) ( not ( = ?auto_411792 ?auto_411794 ) ) ( not ( = ?auto_411792 ?auto_411795 ) ) ( not ( = ?auto_411792 ?auto_411796 ) ) ( not ( = ?auto_411792 ?auto_411797 ) ) ( not ( = ?auto_411792 ?auto_411798 ) ) ( not ( = ?auto_411792 ?auto_411799 ) ) ( not ( = ?auto_411792 ?auto_411800 ) ) ( not ( = ?auto_411792 ?auto_411801 ) ) ( not ( = ?auto_411792 ?auto_411802 ) ) ( not ( = ?auto_411792 ?auto_411803 ) ) ( not ( = ?auto_411792 ?auto_411804 ) ) ( not ( = ?auto_411793 ?auto_411794 ) ) ( not ( = ?auto_411793 ?auto_411795 ) ) ( not ( = ?auto_411793 ?auto_411796 ) ) ( not ( = ?auto_411793 ?auto_411797 ) ) ( not ( = ?auto_411793 ?auto_411798 ) ) ( not ( = ?auto_411793 ?auto_411799 ) ) ( not ( = ?auto_411793 ?auto_411800 ) ) ( not ( = ?auto_411793 ?auto_411801 ) ) ( not ( = ?auto_411793 ?auto_411802 ) ) ( not ( = ?auto_411793 ?auto_411803 ) ) ( not ( = ?auto_411793 ?auto_411804 ) ) ( not ( = ?auto_411794 ?auto_411795 ) ) ( not ( = ?auto_411794 ?auto_411796 ) ) ( not ( = ?auto_411794 ?auto_411797 ) ) ( not ( = ?auto_411794 ?auto_411798 ) ) ( not ( = ?auto_411794 ?auto_411799 ) ) ( not ( = ?auto_411794 ?auto_411800 ) ) ( not ( = ?auto_411794 ?auto_411801 ) ) ( not ( = ?auto_411794 ?auto_411802 ) ) ( not ( = ?auto_411794 ?auto_411803 ) ) ( not ( = ?auto_411794 ?auto_411804 ) ) ( not ( = ?auto_411795 ?auto_411796 ) ) ( not ( = ?auto_411795 ?auto_411797 ) ) ( not ( = ?auto_411795 ?auto_411798 ) ) ( not ( = ?auto_411795 ?auto_411799 ) ) ( not ( = ?auto_411795 ?auto_411800 ) ) ( not ( = ?auto_411795 ?auto_411801 ) ) ( not ( = ?auto_411795 ?auto_411802 ) ) ( not ( = ?auto_411795 ?auto_411803 ) ) ( not ( = ?auto_411795 ?auto_411804 ) ) ( not ( = ?auto_411796 ?auto_411797 ) ) ( not ( = ?auto_411796 ?auto_411798 ) ) ( not ( = ?auto_411796 ?auto_411799 ) ) ( not ( = ?auto_411796 ?auto_411800 ) ) ( not ( = ?auto_411796 ?auto_411801 ) ) ( not ( = ?auto_411796 ?auto_411802 ) ) ( not ( = ?auto_411796 ?auto_411803 ) ) ( not ( = ?auto_411796 ?auto_411804 ) ) ( not ( = ?auto_411797 ?auto_411798 ) ) ( not ( = ?auto_411797 ?auto_411799 ) ) ( not ( = ?auto_411797 ?auto_411800 ) ) ( not ( = ?auto_411797 ?auto_411801 ) ) ( not ( = ?auto_411797 ?auto_411802 ) ) ( not ( = ?auto_411797 ?auto_411803 ) ) ( not ( = ?auto_411797 ?auto_411804 ) ) ( not ( = ?auto_411798 ?auto_411799 ) ) ( not ( = ?auto_411798 ?auto_411800 ) ) ( not ( = ?auto_411798 ?auto_411801 ) ) ( not ( = ?auto_411798 ?auto_411802 ) ) ( not ( = ?auto_411798 ?auto_411803 ) ) ( not ( = ?auto_411798 ?auto_411804 ) ) ( not ( = ?auto_411799 ?auto_411800 ) ) ( not ( = ?auto_411799 ?auto_411801 ) ) ( not ( = ?auto_411799 ?auto_411802 ) ) ( not ( = ?auto_411799 ?auto_411803 ) ) ( not ( = ?auto_411799 ?auto_411804 ) ) ( not ( = ?auto_411800 ?auto_411801 ) ) ( not ( = ?auto_411800 ?auto_411802 ) ) ( not ( = ?auto_411800 ?auto_411803 ) ) ( not ( = ?auto_411800 ?auto_411804 ) ) ( not ( = ?auto_411801 ?auto_411802 ) ) ( not ( = ?auto_411801 ?auto_411803 ) ) ( not ( = ?auto_411801 ?auto_411804 ) ) ( not ( = ?auto_411802 ?auto_411803 ) ) ( not ( = ?auto_411802 ?auto_411804 ) ) ( not ( = ?auto_411803 ?auto_411804 ) ) ( ON ?auto_411802 ?auto_411803 ) ( ON ?auto_411801 ?auto_411802 ) ( ON ?auto_411800 ?auto_411801 ) ( ON ?auto_411799 ?auto_411800 ) ( ON ?auto_411798 ?auto_411799 ) ( ON ?auto_411797 ?auto_411798 ) ( ON ?auto_411796 ?auto_411797 ) ( ON ?auto_411795 ?auto_411796 ) ( ON ?auto_411794 ?auto_411795 ) ( ON ?auto_411793 ?auto_411794 ) ( ON ?auto_411792 ?auto_411793 ) ( ON ?auto_411791 ?auto_411792 ) ( ON ?auto_411790 ?auto_411791 ) ( CLEAR ?auto_411790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_411790 )
      ( MAKE-14PILE ?auto_411790 ?auto_411791 ?auto_411792 ?auto_411793 ?auto_411794 ?auto_411795 ?auto_411796 ?auto_411797 ?auto_411798 ?auto_411799 ?auto_411800 ?auto_411801 ?auto_411802 ?auto_411803 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_411819 - BLOCK
      ?auto_411820 - BLOCK
      ?auto_411821 - BLOCK
      ?auto_411822 - BLOCK
      ?auto_411823 - BLOCK
      ?auto_411824 - BLOCK
      ?auto_411825 - BLOCK
      ?auto_411826 - BLOCK
      ?auto_411827 - BLOCK
      ?auto_411828 - BLOCK
      ?auto_411829 - BLOCK
      ?auto_411830 - BLOCK
      ?auto_411831 - BLOCK
      ?auto_411832 - BLOCK
    )
    :vars
    (
      ?auto_411833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411832 ?auto_411833 ) ( not ( = ?auto_411819 ?auto_411820 ) ) ( not ( = ?auto_411819 ?auto_411821 ) ) ( not ( = ?auto_411819 ?auto_411822 ) ) ( not ( = ?auto_411819 ?auto_411823 ) ) ( not ( = ?auto_411819 ?auto_411824 ) ) ( not ( = ?auto_411819 ?auto_411825 ) ) ( not ( = ?auto_411819 ?auto_411826 ) ) ( not ( = ?auto_411819 ?auto_411827 ) ) ( not ( = ?auto_411819 ?auto_411828 ) ) ( not ( = ?auto_411819 ?auto_411829 ) ) ( not ( = ?auto_411819 ?auto_411830 ) ) ( not ( = ?auto_411819 ?auto_411831 ) ) ( not ( = ?auto_411819 ?auto_411832 ) ) ( not ( = ?auto_411819 ?auto_411833 ) ) ( not ( = ?auto_411820 ?auto_411821 ) ) ( not ( = ?auto_411820 ?auto_411822 ) ) ( not ( = ?auto_411820 ?auto_411823 ) ) ( not ( = ?auto_411820 ?auto_411824 ) ) ( not ( = ?auto_411820 ?auto_411825 ) ) ( not ( = ?auto_411820 ?auto_411826 ) ) ( not ( = ?auto_411820 ?auto_411827 ) ) ( not ( = ?auto_411820 ?auto_411828 ) ) ( not ( = ?auto_411820 ?auto_411829 ) ) ( not ( = ?auto_411820 ?auto_411830 ) ) ( not ( = ?auto_411820 ?auto_411831 ) ) ( not ( = ?auto_411820 ?auto_411832 ) ) ( not ( = ?auto_411820 ?auto_411833 ) ) ( not ( = ?auto_411821 ?auto_411822 ) ) ( not ( = ?auto_411821 ?auto_411823 ) ) ( not ( = ?auto_411821 ?auto_411824 ) ) ( not ( = ?auto_411821 ?auto_411825 ) ) ( not ( = ?auto_411821 ?auto_411826 ) ) ( not ( = ?auto_411821 ?auto_411827 ) ) ( not ( = ?auto_411821 ?auto_411828 ) ) ( not ( = ?auto_411821 ?auto_411829 ) ) ( not ( = ?auto_411821 ?auto_411830 ) ) ( not ( = ?auto_411821 ?auto_411831 ) ) ( not ( = ?auto_411821 ?auto_411832 ) ) ( not ( = ?auto_411821 ?auto_411833 ) ) ( not ( = ?auto_411822 ?auto_411823 ) ) ( not ( = ?auto_411822 ?auto_411824 ) ) ( not ( = ?auto_411822 ?auto_411825 ) ) ( not ( = ?auto_411822 ?auto_411826 ) ) ( not ( = ?auto_411822 ?auto_411827 ) ) ( not ( = ?auto_411822 ?auto_411828 ) ) ( not ( = ?auto_411822 ?auto_411829 ) ) ( not ( = ?auto_411822 ?auto_411830 ) ) ( not ( = ?auto_411822 ?auto_411831 ) ) ( not ( = ?auto_411822 ?auto_411832 ) ) ( not ( = ?auto_411822 ?auto_411833 ) ) ( not ( = ?auto_411823 ?auto_411824 ) ) ( not ( = ?auto_411823 ?auto_411825 ) ) ( not ( = ?auto_411823 ?auto_411826 ) ) ( not ( = ?auto_411823 ?auto_411827 ) ) ( not ( = ?auto_411823 ?auto_411828 ) ) ( not ( = ?auto_411823 ?auto_411829 ) ) ( not ( = ?auto_411823 ?auto_411830 ) ) ( not ( = ?auto_411823 ?auto_411831 ) ) ( not ( = ?auto_411823 ?auto_411832 ) ) ( not ( = ?auto_411823 ?auto_411833 ) ) ( not ( = ?auto_411824 ?auto_411825 ) ) ( not ( = ?auto_411824 ?auto_411826 ) ) ( not ( = ?auto_411824 ?auto_411827 ) ) ( not ( = ?auto_411824 ?auto_411828 ) ) ( not ( = ?auto_411824 ?auto_411829 ) ) ( not ( = ?auto_411824 ?auto_411830 ) ) ( not ( = ?auto_411824 ?auto_411831 ) ) ( not ( = ?auto_411824 ?auto_411832 ) ) ( not ( = ?auto_411824 ?auto_411833 ) ) ( not ( = ?auto_411825 ?auto_411826 ) ) ( not ( = ?auto_411825 ?auto_411827 ) ) ( not ( = ?auto_411825 ?auto_411828 ) ) ( not ( = ?auto_411825 ?auto_411829 ) ) ( not ( = ?auto_411825 ?auto_411830 ) ) ( not ( = ?auto_411825 ?auto_411831 ) ) ( not ( = ?auto_411825 ?auto_411832 ) ) ( not ( = ?auto_411825 ?auto_411833 ) ) ( not ( = ?auto_411826 ?auto_411827 ) ) ( not ( = ?auto_411826 ?auto_411828 ) ) ( not ( = ?auto_411826 ?auto_411829 ) ) ( not ( = ?auto_411826 ?auto_411830 ) ) ( not ( = ?auto_411826 ?auto_411831 ) ) ( not ( = ?auto_411826 ?auto_411832 ) ) ( not ( = ?auto_411826 ?auto_411833 ) ) ( not ( = ?auto_411827 ?auto_411828 ) ) ( not ( = ?auto_411827 ?auto_411829 ) ) ( not ( = ?auto_411827 ?auto_411830 ) ) ( not ( = ?auto_411827 ?auto_411831 ) ) ( not ( = ?auto_411827 ?auto_411832 ) ) ( not ( = ?auto_411827 ?auto_411833 ) ) ( not ( = ?auto_411828 ?auto_411829 ) ) ( not ( = ?auto_411828 ?auto_411830 ) ) ( not ( = ?auto_411828 ?auto_411831 ) ) ( not ( = ?auto_411828 ?auto_411832 ) ) ( not ( = ?auto_411828 ?auto_411833 ) ) ( not ( = ?auto_411829 ?auto_411830 ) ) ( not ( = ?auto_411829 ?auto_411831 ) ) ( not ( = ?auto_411829 ?auto_411832 ) ) ( not ( = ?auto_411829 ?auto_411833 ) ) ( not ( = ?auto_411830 ?auto_411831 ) ) ( not ( = ?auto_411830 ?auto_411832 ) ) ( not ( = ?auto_411830 ?auto_411833 ) ) ( not ( = ?auto_411831 ?auto_411832 ) ) ( not ( = ?auto_411831 ?auto_411833 ) ) ( not ( = ?auto_411832 ?auto_411833 ) ) ( ON ?auto_411831 ?auto_411832 ) ( ON ?auto_411830 ?auto_411831 ) ( ON ?auto_411829 ?auto_411830 ) ( ON ?auto_411828 ?auto_411829 ) ( ON ?auto_411827 ?auto_411828 ) ( ON ?auto_411826 ?auto_411827 ) ( ON ?auto_411825 ?auto_411826 ) ( ON ?auto_411824 ?auto_411825 ) ( ON ?auto_411823 ?auto_411824 ) ( ON ?auto_411822 ?auto_411823 ) ( ON ?auto_411821 ?auto_411822 ) ( ON ?auto_411820 ?auto_411821 ) ( ON ?auto_411819 ?auto_411820 ) ( CLEAR ?auto_411819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_411819 )
      ( MAKE-14PILE ?auto_411819 ?auto_411820 ?auto_411821 ?auto_411822 ?auto_411823 ?auto_411824 ?auto_411825 ?auto_411826 ?auto_411827 ?auto_411828 ?auto_411829 ?auto_411830 ?auto_411831 ?auto_411832 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_411849 - BLOCK
      ?auto_411850 - BLOCK
      ?auto_411851 - BLOCK
      ?auto_411852 - BLOCK
      ?auto_411853 - BLOCK
      ?auto_411854 - BLOCK
      ?auto_411855 - BLOCK
      ?auto_411856 - BLOCK
      ?auto_411857 - BLOCK
      ?auto_411858 - BLOCK
      ?auto_411859 - BLOCK
      ?auto_411860 - BLOCK
      ?auto_411861 - BLOCK
      ?auto_411862 - BLOCK
      ?auto_411863 - BLOCK
    )
    :vars
    (
      ?auto_411864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_411862 ) ( ON ?auto_411863 ?auto_411864 ) ( CLEAR ?auto_411863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_411849 ) ( ON ?auto_411850 ?auto_411849 ) ( ON ?auto_411851 ?auto_411850 ) ( ON ?auto_411852 ?auto_411851 ) ( ON ?auto_411853 ?auto_411852 ) ( ON ?auto_411854 ?auto_411853 ) ( ON ?auto_411855 ?auto_411854 ) ( ON ?auto_411856 ?auto_411855 ) ( ON ?auto_411857 ?auto_411856 ) ( ON ?auto_411858 ?auto_411857 ) ( ON ?auto_411859 ?auto_411858 ) ( ON ?auto_411860 ?auto_411859 ) ( ON ?auto_411861 ?auto_411860 ) ( ON ?auto_411862 ?auto_411861 ) ( not ( = ?auto_411849 ?auto_411850 ) ) ( not ( = ?auto_411849 ?auto_411851 ) ) ( not ( = ?auto_411849 ?auto_411852 ) ) ( not ( = ?auto_411849 ?auto_411853 ) ) ( not ( = ?auto_411849 ?auto_411854 ) ) ( not ( = ?auto_411849 ?auto_411855 ) ) ( not ( = ?auto_411849 ?auto_411856 ) ) ( not ( = ?auto_411849 ?auto_411857 ) ) ( not ( = ?auto_411849 ?auto_411858 ) ) ( not ( = ?auto_411849 ?auto_411859 ) ) ( not ( = ?auto_411849 ?auto_411860 ) ) ( not ( = ?auto_411849 ?auto_411861 ) ) ( not ( = ?auto_411849 ?auto_411862 ) ) ( not ( = ?auto_411849 ?auto_411863 ) ) ( not ( = ?auto_411849 ?auto_411864 ) ) ( not ( = ?auto_411850 ?auto_411851 ) ) ( not ( = ?auto_411850 ?auto_411852 ) ) ( not ( = ?auto_411850 ?auto_411853 ) ) ( not ( = ?auto_411850 ?auto_411854 ) ) ( not ( = ?auto_411850 ?auto_411855 ) ) ( not ( = ?auto_411850 ?auto_411856 ) ) ( not ( = ?auto_411850 ?auto_411857 ) ) ( not ( = ?auto_411850 ?auto_411858 ) ) ( not ( = ?auto_411850 ?auto_411859 ) ) ( not ( = ?auto_411850 ?auto_411860 ) ) ( not ( = ?auto_411850 ?auto_411861 ) ) ( not ( = ?auto_411850 ?auto_411862 ) ) ( not ( = ?auto_411850 ?auto_411863 ) ) ( not ( = ?auto_411850 ?auto_411864 ) ) ( not ( = ?auto_411851 ?auto_411852 ) ) ( not ( = ?auto_411851 ?auto_411853 ) ) ( not ( = ?auto_411851 ?auto_411854 ) ) ( not ( = ?auto_411851 ?auto_411855 ) ) ( not ( = ?auto_411851 ?auto_411856 ) ) ( not ( = ?auto_411851 ?auto_411857 ) ) ( not ( = ?auto_411851 ?auto_411858 ) ) ( not ( = ?auto_411851 ?auto_411859 ) ) ( not ( = ?auto_411851 ?auto_411860 ) ) ( not ( = ?auto_411851 ?auto_411861 ) ) ( not ( = ?auto_411851 ?auto_411862 ) ) ( not ( = ?auto_411851 ?auto_411863 ) ) ( not ( = ?auto_411851 ?auto_411864 ) ) ( not ( = ?auto_411852 ?auto_411853 ) ) ( not ( = ?auto_411852 ?auto_411854 ) ) ( not ( = ?auto_411852 ?auto_411855 ) ) ( not ( = ?auto_411852 ?auto_411856 ) ) ( not ( = ?auto_411852 ?auto_411857 ) ) ( not ( = ?auto_411852 ?auto_411858 ) ) ( not ( = ?auto_411852 ?auto_411859 ) ) ( not ( = ?auto_411852 ?auto_411860 ) ) ( not ( = ?auto_411852 ?auto_411861 ) ) ( not ( = ?auto_411852 ?auto_411862 ) ) ( not ( = ?auto_411852 ?auto_411863 ) ) ( not ( = ?auto_411852 ?auto_411864 ) ) ( not ( = ?auto_411853 ?auto_411854 ) ) ( not ( = ?auto_411853 ?auto_411855 ) ) ( not ( = ?auto_411853 ?auto_411856 ) ) ( not ( = ?auto_411853 ?auto_411857 ) ) ( not ( = ?auto_411853 ?auto_411858 ) ) ( not ( = ?auto_411853 ?auto_411859 ) ) ( not ( = ?auto_411853 ?auto_411860 ) ) ( not ( = ?auto_411853 ?auto_411861 ) ) ( not ( = ?auto_411853 ?auto_411862 ) ) ( not ( = ?auto_411853 ?auto_411863 ) ) ( not ( = ?auto_411853 ?auto_411864 ) ) ( not ( = ?auto_411854 ?auto_411855 ) ) ( not ( = ?auto_411854 ?auto_411856 ) ) ( not ( = ?auto_411854 ?auto_411857 ) ) ( not ( = ?auto_411854 ?auto_411858 ) ) ( not ( = ?auto_411854 ?auto_411859 ) ) ( not ( = ?auto_411854 ?auto_411860 ) ) ( not ( = ?auto_411854 ?auto_411861 ) ) ( not ( = ?auto_411854 ?auto_411862 ) ) ( not ( = ?auto_411854 ?auto_411863 ) ) ( not ( = ?auto_411854 ?auto_411864 ) ) ( not ( = ?auto_411855 ?auto_411856 ) ) ( not ( = ?auto_411855 ?auto_411857 ) ) ( not ( = ?auto_411855 ?auto_411858 ) ) ( not ( = ?auto_411855 ?auto_411859 ) ) ( not ( = ?auto_411855 ?auto_411860 ) ) ( not ( = ?auto_411855 ?auto_411861 ) ) ( not ( = ?auto_411855 ?auto_411862 ) ) ( not ( = ?auto_411855 ?auto_411863 ) ) ( not ( = ?auto_411855 ?auto_411864 ) ) ( not ( = ?auto_411856 ?auto_411857 ) ) ( not ( = ?auto_411856 ?auto_411858 ) ) ( not ( = ?auto_411856 ?auto_411859 ) ) ( not ( = ?auto_411856 ?auto_411860 ) ) ( not ( = ?auto_411856 ?auto_411861 ) ) ( not ( = ?auto_411856 ?auto_411862 ) ) ( not ( = ?auto_411856 ?auto_411863 ) ) ( not ( = ?auto_411856 ?auto_411864 ) ) ( not ( = ?auto_411857 ?auto_411858 ) ) ( not ( = ?auto_411857 ?auto_411859 ) ) ( not ( = ?auto_411857 ?auto_411860 ) ) ( not ( = ?auto_411857 ?auto_411861 ) ) ( not ( = ?auto_411857 ?auto_411862 ) ) ( not ( = ?auto_411857 ?auto_411863 ) ) ( not ( = ?auto_411857 ?auto_411864 ) ) ( not ( = ?auto_411858 ?auto_411859 ) ) ( not ( = ?auto_411858 ?auto_411860 ) ) ( not ( = ?auto_411858 ?auto_411861 ) ) ( not ( = ?auto_411858 ?auto_411862 ) ) ( not ( = ?auto_411858 ?auto_411863 ) ) ( not ( = ?auto_411858 ?auto_411864 ) ) ( not ( = ?auto_411859 ?auto_411860 ) ) ( not ( = ?auto_411859 ?auto_411861 ) ) ( not ( = ?auto_411859 ?auto_411862 ) ) ( not ( = ?auto_411859 ?auto_411863 ) ) ( not ( = ?auto_411859 ?auto_411864 ) ) ( not ( = ?auto_411860 ?auto_411861 ) ) ( not ( = ?auto_411860 ?auto_411862 ) ) ( not ( = ?auto_411860 ?auto_411863 ) ) ( not ( = ?auto_411860 ?auto_411864 ) ) ( not ( = ?auto_411861 ?auto_411862 ) ) ( not ( = ?auto_411861 ?auto_411863 ) ) ( not ( = ?auto_411861 ?auto_411864 ) ) ( not ( = ?auto_411862 ?auto_411863 ) ) ( not ( = ?auto_411862 ?auto_411864 ) ) ( not ( = ?auto_411863 ?auto_411864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_411863 ?auto_411864 )
      ( !STACK ?auto_411863 ?auto_411862 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_411880 - BLOCK
      ?auto_411881 - BLOCK
      ?auto_411882 - BLOCK
      ?auto_411883 - BLOCK
      ?auto_411884 - BLOCK
      ?auto_411885 - BLOCK
      ?auto_411886 - BLOCK
      ?auto_411887 - BLOCK
      ?auto_411888 - BLOCK
      ?auto_411889 - BLOCK
      ?auto_411890 - BLOCK
      ?auto_411891 - BLOCK
      ?auto_411892 - BLOCK
      ?auto_411893 - BLOCK
      ?auto_411894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_411893 ) ( ON-TABLE ?auto_411894 ) ( CLEAR ?auto_411894 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_411880 ) ( ON ?auto_411881 ?auto_411880 ) ( ON ?auto_411882 ?auto_411881 ) ( ON ?auto_411883 ?auto_411882 ) ( ON ?auto_411884 ?auto_411883 ) ( ON ?auto_411885 ?auto_411884 ) ( ON ?auto_411886 ?auto_411885 ) ( ON ?auto_411887 ?auto_411886 ) ( ON ?auto_411888 ?auto_411887 ) ( ON ?auto_411889 ?auto_411888 ) ( ON ?auto_411890 ?auto_411889 ) ( ON ?auto_411891 ?auto_411890 ) ( ON ?auto_411892 ?auto_411891 ) ( ON ?auto_411893 ?auto_411892 ) ( not ( = ?auto_411880 ?auto_411881 ) ) ( not ( = ?auto_411880 ?auto_411882 ) ) ( not ( = ?auto_411880 ?auto_411883 ) ) ( not ( = ?auto_411880 ?auto_411884 ) ) ( not ( = ?auto_411880 ?auto_411885 ) ) ( not ( = ?auto_411880 ?auto_411886 ) ) ( not ( = ?auto_411880 ?auto_411887 ) ) ( not ( = ?auto_411880 ?auto_411888 ) ) ( not ( = ?auto_411880 ?auto_411889 ) ) ( not ( = ?auto_411880 ?auto_411890 ) ) ( not ( = ?auto_411880 ?auto_411891 ) ) ( not ( = ?auto_411880 ?auto_411892 ) ) ( not ( = ?auto_411880 ?auto_411893 ) ) ( not ( = ?auto_411880 ?auto_411894 ) ) ( not ( = ?auto_411881 ?auto_411882 ) ) ( not ( = ?auto_411881 ?auto_411883 ) ) ( not ( = ?auto_411881 ?auto_411884 ) ) ( not ( = ?auto_411881 ?auto_411885 ) ) ( not ( = ?auto_411881 ?auto_411886 ) ) ( not ( = ?auto_411881 ?auto_411887 ) ) ( not ( = ?auto_411881 ?auto_411888 ) ) ( not ( = ?auto_411881 ?auto_411889 ) ) ( not ( = ?auto_411881 ?auto_411890 ) ) ( not ( = ?auto_411881 ?auto_411891 ) ) ( not ( = ?auto_411881 ?auto_411892 ) ) ( not ( = ?auto_411881 ?auto_411893 ) ) ( not ( = ?auto_411881 ?auto_411894 ) ) ( not ( = ?auto_411882 ?auto_411883 ) ) ( not ( = ?auto_411882 ?auto_411884 ) ) ( not ( = ?auto_411882 ?auto_411885 ) ) ( not ( = ?auto_411882 ?auto_411886 ) ) ( not ( = ?auto_411882 ?auto_411887 ) ) ( not ( = ?auto_411882 ?auto_411888 ) ) ( not ( = ?auto_411882 ?auto_411889 ) ) ( not ( = ?auto_411882 ?auto_411890 ) ) ( not ( = ?auto_411882 ?auto_411891 ) ) ( not ( = ?auto_411882 ?auto_411892 ) ) ( not ( = ?auto_411882 ?auto_411893 ) ) ( not ( = ?auto_411882 ?auto_411894 ) ) ( not ( = ?auto_411883 ?auto_411884 ) ) ( not ( = ?auto_411883 ?auto_411885 ) ) ( not ( = ?auto_411883 ?auto_411886 ) ) ( not ( = ?auto_411883 ?auto_411887 ) ) ( not ( = ?auto_411883 ?auto_411888 ) ) ( not ( = ?auto_411883 ?auto_411889 ) ) ( not ( = ?auto_411883 ?auto_411890 ) ) ( not ( = ?auto_411883 ?auto_411891 ) ) ( not ( = ?auto_411883 ?auto_411892 ) ) ( not ( = ?auto_411883 ?auto_411893 ) ) ( not ( = ?auto_411883 ?auto_411894 ) ) ( not ( = ?auto_411884 ?auto_411885 ) ) ( not ( = ?auto_411884 ?auto_411886 ) ) ( not ( = ?auto_411884 ?auto_411887 ) ) ( not ( = ?auto_411884 ?auto_411888 ) ) ( not ( = ?auto_411884 ?auto_411889 ) ) ( not ( = ?auto_411884 ?auto_411890 ) ) ( not ( = ?auto_411884 ?auto_411891 ) ) ( not ( = ?auto_411884 ?auto_411892 ) ) ( not ( = ?auto_411884 ?auto_411893 ) ) ( not ( = ?auto_411884 ?auto_411894 ) ) ( not ( = ?auto_411885 ?auto_411886 ) ) ( not ( = ?auto_411885 ?auto_411887 ) ) ( not ( = ?auto_411885 ?auto_411888 ) ) ( not ( = ?auto_411885 ?auto_411889 ) ) ( not ( = ?auto_411885 ?auto_411890 ) ) ( not ( = ?auto_411885 ?auto_411891 ) ) ( not ( = ?auto_411885 ?auto_411892 ) ) ( not ( = ?auto_411885 ?auto_411893 ) ) ( not ( = ?auto_411885 ?auto_411894 ) ) ( not ( = ?auto_411886 ?auto_411887 ) ) ( not ( = ?auto_411886 ?auto_411888 ) ) ( not ( = ?auto_411886 ?auto_411889 ) ) ( not ( = ?auto_411886 ?auto_411890 ) ) ( not ( = ?auto_411886 ?auto_411891 ) ) ( not ( = ?auto_411886 ?auto_411892 ) ) ( not ( = ?auto_411886 ?auto_411893 ) ) ( not ( = ?auto_411886 ?auto_411894 ) ) ( not ( = ?auto_411887 ?auto_411888 ) ) ( not ( = ?auto_411887 ?auto_411889 ) ) ( not ( = ?auto_411887 ?auto_411890 ) ) ( not ( = ?auto_411887 ?auto_411891 ) ) ( not ( = ?auto_411887 ?auto_411892 ) ) ( not ( = ?auto_411887 ?auto_411893 ) ) ( not ( = ?auto_411887 ?auto_411894 ) ) ( not ( = ?auto_411888 ?auto_411889 ) ) ( not ( = ?auto_411888 ?auto_411890 ) ) ( not ( = ?auto_411888 ?auto_411891 ) ) ( not ( = ?auto_411888 ?auto_411892 ) ) ( not ( = ?auto_411888 ?auto_411893 ) ) ( not ( = ?auto_411888 ?auto_411894 ) ) ( not ( = ?auto_411889 ?auto_411890 ) ) ( not ( = ?auto_411889 ?auto_411891 ) ) ( not ( = ?auto_411889 ?auto_411892 ) ) ( not ( = ?auto_411889 ?auto_411893 ) ) ( not ( = ?auto_411889 ?auto_411894 ) ) ( not ( = ?auto_411890 ?auto_411891 ) ) ( not ( = ?auto_411890 ?auto_411892 ) ) ( not ( = ?auto_411890 ?auto_411893 ) ) ( not ( = ?auto_411890 ?auto_411894 ) ) ( not ( = ?auto_411891 ?auto_411892 ) ) ( not ( = ?auto_411891 ?auto_411893 ) ) ( not ( = ?auto_411891 ?auto_411894 ) ) ( not ( = ?auto_411892 ?auto_411893 ) ) ( not ( = ?auto_411892 ?auto_411894 ) ) ( not ( = ?auto_411893 ?auto_411894 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_411894 )
      ( !STACK ?auto_411894 ?auto_411893 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_411910 - BLOCK
      ?auto_411911 - BLOCK
      ?auto_411912 - BLOCK
      ?auto_411913 - BLOCK
      ?auto_411914 - BLOCK
      ?auto_411915 - BLOCK
      ?auto_411916 - BLOCK
      ?auto_411917 - BLOCK
      ?auto_411918 - BLOCK
      ?auto_411919 - BLOCK
      ?auto_411920 - BLOCK
      ?auto_411921 - BLOCK
      ?auto_411922 - BLOCK
      ?auto_411923 - BLOCK
      ?auto_411924 - BLOCK
    )
    :vars
    (
      ?auto_411925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411924 ?auto_411925 ) ( ON-TABLE ?auto_411910 ) ( ON ?auto_411911 ?auto_411910 ) ( ON ?auto_411912 ?auto_411911 ) ( ON ?auto_411913 ?auto_411912 ) ( ON ?auto_411914 ?auto_411913 ) ( ON ?auto_411915 ?auto_411914 ) ( ON ?auto_411916 ?auto_411915 ) ( ON ?auto_411917 ?auto_411916 ) ( ON ?auto_411918 ?auto_411917 ) ( ON ?auto_411919 ?auto_411918 ) ( ON ?auto_411920 ?auto_411919 ) ( ON ?auto_411921 ?auto_411920 ) ( ON ?auto_411922 ?auto_411921 ) ( not ( = ?auto_411910 ?auto_411911 ) ) ( not ( = ?auto_411910 ?auto_411912 ) ) ( not ( = ?auto_411910 ?auto_411913 ) ) ( not ( = ?auto_411910 ?auto_411914 ) ) ( not ( = ?auto_411910 ?auto_411915 ) ) ( not ( = ?auto_411910 ?auto_411916 ) ) ( not ( = ?auto_411910 ?auto_411917 ) ) ( not ( = ?auto_411910 ?auto_411918 ) ) ( not ( = ?auto_411910 ?auto_411919 ) ) ( not ( = ?auto_411910 ?auto_411920 ) ) ( not ( = ?auto_411910 ?auto_411921 ) ) ( not ( = ?auto_411910 ?auto_411922 ) ) ( not ( = ?auto_411910 ?auto_411923 ) ) ( not ( = ?auto_411910 ?auto_411924 ) ) ( not ( = ?auto_411910 ?auto_411925 ) ) ( not ( = ?auto_411911 ?auto_411912 ) ) ( not ( = ?auto_411911 ?auto_411913 ) ) ( not ( = ?auto_411911 ?auto_411914 ) ) ( not ( = ?auto_411911 ?auto_411915 ) ) ( not ( = ?auto_411911 ?auto_411916 ) ) ( not ( = ?auto_411911 ?auto_411917 ) ) ( not ( = ?auto_411911 ?auto_411918 ) ) ( not ( = ?auto_411911 ?auto_411919 ) ) ( not ( = ?auto_411911 ?auto_411920 ) ) ( not ( = ?auto_411911 ?auto_411921 ) ) ( not ( = ?auto_411911 ?auto_411922 ) ) ( not ( = ?auto_411911 ?auto_411923 ) ) ( not ( = ?auto_411911 ?auto_411924 ) ) ( not ( = ?auto_411911 ?auto_411925 ) ) ( not ( = ?auto_411912 ?auto_411913 ) ) ( not ( = ?auto_411912 ?auto_411914 ) ) ( not ( = ?auto_411912 ?auto_411915 ) ) ( not ( = ?auto_411912 ?auto_411916 ) ) ( not ( = ?auto_411912 ?auto_411917 ) ) ( not ( = ?auto_411912 ?auto_411918 ) ) ( not ( = ?auto_411912 ?auto_411919 ) ) ( not ( = ?auto_411912 ?auto_411920 ) ) ( not ( = ?auto_411912 ?auto_411921 ) ) ( not ( = ?auto_411912 ?auto_411922 ) ) ( not ( = ?auto_411912 ?auto_411923 ) ) ( not ( = ?auto_411912 ?auto_411924 ) ) ( not ( = ?auto_411912 ?auto_411925 ) ) ( not ( = ?auto_411913 ?auto_411914 ) ) ( not ( = ?auto_411913 ?auto_411915 ) ) ( not ( = ?auto_411913 ?auto_411916 ) ) ( not ( = ?auto_411913 ?auto_411917 ) ) ( not ( = ?auto_411913 ?auto_411918 ) ) ( not ( = ?auto_411913 ?auto_411919 ) ) ( not ( = ?auto_411913 ?auto_411920 ) ) ( not ( = ?auto_411913 ?auto_411921 ) ) ( not ( = ?auto_411913 ?auto_411922 ) ) ( not ( = ?auto_411913 ?auto_411923 ) ) ( not ( = ?auto_411913 ?auto_411924 ) ) ( not ( = ?auto_411913 ?auto_411925 ) ) ( not ( = ?auto_411914 ?auto_411915 ) ) ( not ( = ?auto_411914 ?auto_411916 ) ) ( not ( = ?auto_411914 ?auto_411917 ) ) ( not ( = ?auto_411914 ?auto_411918 ) ) ( not ( = ?auto_411914 ?auto_411919 ) ) ( not ( = ?auto_411914 ?auto_411920 ) ) ( not ( = ?auto_411914 ?auto_411921 ) ) ( not ( = ?auto_411914 ?auto_411922 ) ) ( not ( = ?auto_411914 ?auto_411923 ) ) ( not ( = ?auto_411914 ?auto_411924 ) ) ( not ( = ?auto_411914 ?auto_411925 ) ) ( not ( = ?auto_411915 ?auto_411916 ) ) ( not ( = ?auto_411915 ?auto_411917 ) ) ( not ( = ?auto_411915 ?auto_411918 ) ) ( not ( = ?auto_411915 ?auto_411919 ) ) ( not ( = ?auto_411915 ?auto_411920 ) ) ( not ( = ?auto_411915 ?auto_411921 ) ) ( not ( = ?auto_411915 ?auto_411922 ) ) ( not ( = ?auto_411915 ?auto_411923 ) ) ( not ( = ?auto_411915 ?auto_411924 ) ) ( not ( = ?auto_411915 ?auto_411925 ) ) ( not ( = ?auto_411916 ?auto_411917 ) ) ( not ( = ?auto_411916 ?auto_411918 ) ) ( not ( = ?auto_411916 ?auto_411919 ) ) ( not ( = ?auto_411916 ?auto_411920 ) ) ( not ( = ?auto_411916 ?auto_411921 ) ) ( not ( = ?auto_411916 ?auto_411922 ) ) ( not ( = ?auto_411916 ?auto_411923 ) ) ( not ( = ?auto_411916 ?auto_411924 ) ) ( not ( = ?auto_411916 ?auto_411925 ) ) ( not ( = ?auto_411917 ?auto_411918 ) ) ( not ( = ?auto_411917 ?auto_411919 ) ) ( not ( = ?auto_411917 ?auto_411920 ) ) ( not ( = ?auto_411917 ?auto_411921 ) ) ( not ( = ?auto_411917 ?auto_411922 ) ) ( not ( = ?auto_411917 ?auto_411923 ) ) ( not ( = ?auto_411917 ?auto_411924 ) ) ( not ( = ?auto_411917 ?auto_411925 ) ) ( not ( = ?auto_411918 ?auto_411919 ) ) ( not ( = ?auto_411918 ?auto_411920 ) ) ( not ( = ?auto_411918 ?auto_411921 ) ) ( not ( = ?auto_411918 ?auto_411922 ) ) ( not ( = ?auto_411918 ?auto_411923 ) ) ( not ( = ?auto_411918 ?auto_411924 ) ) ( not ( = ?auto_411918 ?auto_411925 ) ) ( not ( = ?auto_411919 ?auto_411920 ) ) ( not ( = ?auto_411919 ?auto_411921 ) ) ( not ( = ?auto_411919 ?auto_411922 ) ) ( not ( = ?auto_411919 ?auto_411923 ) ) ( not ( = ?auto_411919 ?auto_411924 ) ) ( not ( = ?auto_411919 ?auto_411925 ) ) ( not ( = ?auto_411920 ?auto_411921 ) ) ( not ( = ?auto_411920 ?auto_411922 ) ) ( not ( = ?auto_411920 ?auto_411923 ) ) ( not ( = ?auto_411920 ?auto_411924 ) ) ( not ( = ?auto_411920 ?auto_411925 ) ) ( not ( = ?auto_411921 ?auto_411922 ) ) ( not ( = ?auto_411921 ?auto_411923 ) ) ( not ( = ?auto_411921 ?auto_411924 ) ) ( not ( = ?auto_411921 ?auto_411925 ) ) ( not ( = ?auto_411922 ?auto_411923 ) ) ( not ( = ?auto_411922 ?auto_411924 ) ) ( not ( = ?auto_411922 ?auto_411925 ) ) ( not ( = ?auto_411923 ?auto_411924 ) ) ( not ( = ?auto_411923 ?auto_411925 ) ) ( not ( = ?auto_411924 ?auto_411925 ) ) ( CLEAR ?auto_411922 ) ( ON ?auto_411923 ?auto_411924 ) ( CLEAR ?auto_411923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_411910 ?auto_411911 ?auto_411912 ?auto_411913 ?auto_411914 ?auto_411915 ?auto_411916 ?auto_411917 ?auto_411918 ?auto_411919 ?auto_411920 ?auto_411921 ?auto_411922 ?auto_411923 )
      ( MAKE-15PILE ?auto_411910 ?auto_411911 ?auto_411912 ?auto_411913 ?auto_411914 ?auto_411915 ?auto_411916 ?auto_411917 ?auto_411918 ?auto_411919 ?auto_411920 ?auto_411921 ?auto_411922 ?auto_411923 ?auto_411924 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_411941 - BLOCK
      ?auto_411942 - BLOCK
      ?auto_411943 - BLOCK
      ?auto_411944 - BLOCK
      ?auto_411945 - BLOCK
      ?auto_411946 - BLOCK
      ?auto_411947 - BLOCK
      ?auto_411948 - BLOCK
      ?auto_411949 - BLOCK
      ?auto_411950 - BLOCK
      ?auto_411951 - BLOCK
      ?auto_411952 - BLOCK
      ?auto_411953 - BLOCK
      ?auto_411954 - BLOCK
      ?auto_411955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_411955 ) ( ON-TABLE ?auto_411941 ) ( ON ?auto_411942 ?auto_411941 ) ( ON ?auto_411943 ?auto_411942 ) ( ON ?auto_411944 ?auto_411943 ) ( ON ?auto_411945 ?auto_411944 ) ( ON ?auto_411946 ?auto_411945 ) ( ON ?auto_411947 ?auto_411946 ) ( ON ?auto_411948 ?auto_411947 ) ( ON ?auto_411949 ?auto_411948 ) ( ON ?auto_411950 ?auto_411949 ) ( ON ?auto_411951 ?auto_411950 ) ( ON ?auto_411952 ?auto_411951 ) ( ON ?auto_411953 ?auto_411952 ) ( not ( = ?auto_411941 ?auto_411942 ) ) ( not ( = ?auto_411941 ?auto_411943 ) ) ( not ( = ?auto_411941 ?auto_411944 ) ) ( not ( = ?auto_411941 ?auto_411945 ) ) ( not ( = ?auto_411941 ?auto_411946 ) ) ( not ( = ?auto_411941 ?auto_411947 ) ) ( not ( = ?auto_411941 ?auto_411948 ) ) ( not ( = ?auto_411941 ?auto_411949 ) ) ( not ( = ?auto_411941 ?auto_411950 ) ) ( not ( = ?auto_411941 ?auto_411951 ) ) ( not ( = ?auto_411941 ?auto_411952 ) ) ( not ( = ?auto_411941 ?auto_411953 ) ) ( not ( = ?auto_411941 ?auto_411954 ) ) ( not ( = ?auto_411941 ?auto_411955 ) ) ( not ( = ?auto_411942 ?auto_411943 ) ) ( not ( = ?auto_411942 ?auto_411944 ) ) ( not ( = ?auto_411942 ?auto_411945 ) ) ( not ( = ?auto_411942 ?auto_411946 ) ) ( not ( = ?auto_411942 ?auto_411947 ) ) ( not ( = ?auto_411942 ?auto_411948 ) ) ( not ( = ?auto_411942 ?auto_411949 ) ) ( not ( = ?auto_411942 ?auto_411950 ) ) ( not ( = ?auto_411942 ?auto_411951 ) ) ( not ( = ?auto_411942 ?auto_411952 ) ) ( not ( = ?auto_411942 ?auto_411953 ) ) ( not ( = ?auto_411942 ?auto_411954 ) ) ( not ( = ?auto_411942 ?auto_411955 ) ) ( not ( = ?auto_411943 ?auto_411944 ) ) ( not ( = ?auto_411943 ?auto_411945 ) ) ( not ( = ?auto_411943 ?auto_411946 ) ) ( not ( = ?auto_411943 ?auto_411947 ) ) ( not ( = ?auto_411943 ?auto_411948 ) ) ( not ( = ?auto_411943 ?auto_411949 ) ) ( not ( = ?auto_411943 ?auto_411950 ) ) ( not ( = ?auto_411943 ?auto_411951 ) ) ( not ( = ?auto_411943 ?auto_411952 ) ) ( not ( = ?auto_411943 ?auto_411953 ) ) ( not ( = ?auto_411943 ?auto_411954 ) ) ( not ( = ?auto_411943 ?auto_411955 ) ) ( not ( = ?auto_411944 ?auto_411945 ) ) ( not ( = ?auto_411944 ?auto_411946 ) ) ( not ( = ?auto_411944 ?auto_411947 ) ) ( not ( = ?auto_411944 ?auto_411948 ) ) ( not ( = ?auto_411944 ?auto_411949 ) ) ( not ( = ?auto_411944 ?auto_411950 ) ) ( not ( = ?auto_411944 ?auto_411951 ) ) ( not ( = ?auto_411944 ?auto_411952 ) ) ( not ( = ?auto_411944 ?auto_411953 ) ) ( not ( = ?auto_411944 ?auto_411954 ) ) ( not ( = ?auto_411944 ?auto_411955 ) ) ( not ( = ?auto_411945 ?auto_411946 ) ) ( not ( = ?auto_411945 ?auto_411947 ) ) ( not ( = ?auto_411945 ?auto_411948 ) ) ( not ( = ?auto_411945 ?auto_411949 ) ) ( not ( = ?auto_411945 ?auto_411950 ) ) ( not ( = ?auto_411945 ?auto_411951 ) ) ( not ( = ?auto_411945 ?auto_411952 ) ) ( not ( = ?auto_411945 ?auto_411953 ) ) ( not ( = ?auto_411945 ?auto_411954 ) ) ( not ( = ?auto_411945 ?auto_411955 ) ) ( not ( = ?auto_411946 ?auto_411947 ) ) ( not ( = ?auto_411946 ?auto_411948 ) ) ( not ( = ?auto_411946 ?auto_411949 ) ) ( not ( = ?auto_411946 ?auto_411950 ) ) ( not ( = ?auto_411946 ?auto_411951 ) ) ( not ( = ?auto_411946 ?auto_411952 ) ) ( not ( = ?auto_411946 ?auto_411953 ) ) ( not ( = ?auto_411946 ?auto_411954 ) ) ( not ( = ?auto_411946 ?auto_411955 ) ) ( not ( = ?auto_411947 ?auto_411948 ) ) ( not ( = ?auto_411947 ?auto_411949 ) ) ( not ( = ?auto_411947 ?auto_411950 ) ) ( not ( = ?auto_411947 ?auto_411951 ) ) ( not ( = ?auto_411947 ?auto_411952 ) ) ( not ( = ?auto_411947 ?auto_411953 ) ) ( not ( = ?auto_411947 ?auto_411954 ) ) ( not ( = ?auto_411947 ?auto_411955 ) ) ( not ( = ?auto_411948 ?auto_411949 ) ) ( not ( = ?auto_411948 ?auto_411950 ) ) ( not ( = ?auto_411948 ?auto_411951 ) ) ( not ( = ?auto_411948 ?auto_411952 ) ) ( not ( = ?auto_411948 ?auto_411953 ) ) ( not ( = ?auto_411948 ?auto_411954 ) ) ( not ( = ?auto_411948 ?auto_411955 ) ) ( not ( = ?auto_411949 ?auto_411950 ) ) ( not ( = ?auto_411949 ?auto_411951 ) ) ( not ( = ?auto_411949 ?auto_411952 ) ) ( not ( = ?auto_411949 ?auto_411953 ) ) ( not ( = ?auto_411949 ?auto_411954 ) ) ( not ( = ?auto_411949 ?auto_411955 ) ) ( not ( = ?auto_411950 ?auto_411951 ) ) ( not ( = ?auto_411950 ?auto_411952 ) ) ( not ( = ?auto_411950 ?auto_411953 ) ) ( not ( = ?auto_411950 ?auto_411954 ) ) ( not ( = ?auto_411950 ?auto_411955 ) ) ( not ( = ?auto_411951 ?auto_411952 ) ) ( not ( = ?auto_411951 ?auto_411953 ) ) ( not ( = ?auto_411951 ?auto_411954 ) ) ( not ( = ?auto_411951 ?auto_411955 ) ) ( not ( = ?auto_411952 ?auto_411953 ) ) ( not ( = ?auto_411952 ?auto_411954 ) ) ( not ( = ?auto_411952 ?auto_411955 ) ) ( not ( = ?auto_411953 ?auto_411954 ) ) ( not ( = ?auto_411953 ?auto_411955 ) ) ( not ( = ?auto_411954 ?auto_411955 ) ) ( CLEAR ?auto_411953 ) ( ON ?auto_411954 ?auto_411955 ) ( CLEAR ?auto_411954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_411941 ?auto_411942 ?auto_411943 ?auto_411944 ?auto_411945 ?auto_411946 ?auto_411947 ?auto_411948 ?auto_411949 ?auto_411950 ?auto_411951 ?auto_411952 ?auto_411953 ?auto_411954 )
      ( MAKE-15PILE ?auto_411941 ?auto_411942 ?auto_411943 ?auto_411944 ?auto_411945 ?auto_411946 ?auto_411947 ?auto_411948 ?auto_411949 ?auto_411950 ?auto_411951 ?auto_411952 ?auto_411953 ?auto_411954 ?auto_411955 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_411971 - BLOCK
      ?auto_411972 - BLOCK
      ?auto_411973 - BLOCK
      ?auto_411974 - BLOCK
      ?auto_411975 - BLOCK
      ?auto_411976 - BLOCK
      ?auto_411977 - BLOCK
      ?auto_411978 - BLOCK
      ?auto_411979 - BLOCK
      ?auto_411980 - BLOCK
      ?auto_411981 - BLOCK
      ?auto_411982 - BLOCK
      ?auto_411983 - BLOCK
      ?auto_411984 - BLOCK
      ?auto_411985 - BLOCK
    )
    :vars
    (
      ?auto_411986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_411985 ?auto_411986 ) ( ON-TABLE ?auto_411971 ) ( ON ?auto_411972 ?auto_411971 ) ( ON ?auto_411973 ?auto_411972 ) ( ON ?auto_411974 ?auto_411973 ) ( ON ?auto_411975 ?auto_411974 ) ( ON ?auto_411976 ?auto_411975 ) ( ON ?auto_411977 ?auto_411976 ) ( ON ?auto_411978 ?auto_411977 ) ( ON ?auto_411979 ?auto_411978 ) ( ON ?auto_411980 ?auto_411979 ) ( ON ?auto_411981 ?auto_411980 ) ( ON ?auto_411982 ?auto_411981 ) ( not ( = ?auto_411971 ?auto_411972 ) ) ( not ( = ?auto_411971 ?auto_411973 ) ) ( not ( = ?auto_411971 ?auto_411974 ) ) ( not ( = ?auto_411971 ?auto_411975 ) ) ( not ( = ?auto_411971 ?auto_411976 ) ) ( not ( = ?auto_411971 ?auto_411977 ) ) ( not ( = ?auto_411971 ?auto_411978 ) ) ( not ( = ?auto_411971 ?auto_411979 ) ) ( not ( = ?auto_411971 ?auto_411980 ) ) ( not ( = ?auto_411971 ?auto_411981 ) ) ( not ( = ?auto_411971 ?auto_411982 ) ) ( not ( = ?auto_411971 ?auto_411983 ) ) ( not ( = ?auto_411971 ?auto_411984 ) ) ( not ( = ?auto_411971 ?auto_411985 ) ) ( not ( = ?auto_411971 ?auto_411986 ) ) ( not ( = ?auto_411972 ?auto_411973 ) ) ( not ( = ?auto_411972 ?auto_411974 ) ) ( not ( = ?auto_411972 ?auto_411975 ) ) ( not ( = ?auto_411972 ?auto_411976 ) ) ( not ( = ?auto_411972 ?auto_411977 ) ) ( not ( = ?auto_411972 ?auto_411978 ) ) ( not ( = ?auto_411972 ?auto_411979 ) ) ( not ( = ?auto_411972 ?auto_411980 ) ) ( not ( = ?auto_411972 ?auto_411981 ) ) ( not ( = ?auto_411972 ?auto_411982 ) ) ( not ( = ?auto_411972 ?auto_411983 ) ) ( not ( = ?auto_411972 ?auto_411984 ) ) ( not ( = ?auto_411972 ?auto_411985 ) ) ( not ( = ?auto_411972 ?auto_411986 ) ) ( not ( = ?auto_411973 ?auto_411974 ) ) ( not ( = ?auto_411973 ?auto_411975 ) ) ( not ( = ?auto_411973 ?auto_411976 ) ) ( not ( = ?auto_411973 ?auto_411977 ) ) ( not ( = ?auto_411973 ?auto_411978 ) ) ( not ( = ?auto_411973 ?auto_411979 ) ) ( not ( = ?auto_411973 ?auto_411980 ) ) ( not ( = ?auto_411973 ?auto_411981 ) ) ( not ( = ?auto_411973 ?auto_411982 ) ) ( not ( = ?auto_411973 ?auto_411983 ) ) ( not ( = ?auto_411973 ?auto_411984 ) ) ( not ( = ?auto_411973 ?auto_411985 ) ) ( not ( = ?auto_411973 ?auto_411986 ) ) ( not ( = ?auto_411974 ?auto_411975 ) ) ( not ( = ?auto_411974 ?auto_411976 ) ) ( not ( = ?auto_411974 ?auto_411977 ) ) ( not ( = ?auto_411974 ?auto_411978 ) ) ( not ( = ?auto_411974 ?auto_411979 ) ) ( not ( = ?auto_411974 ?auto_411980 ) ) ( not ( = ?auto_411974 ?auto_411981 ) ) ( not ( = ?auto_411974 ?auto_411982 ) ) ( not ( = ?auto_411974 ?auto_411983 ) ) ( not ( = ?auto_411974 ?auto_411984 ) ) ( not ( = ?auto_411974 ?auto_411985 ) ) ( not ( = ?auto_411974 ?auto_411986 ) ) ( not ( = ?auto_411975 ?auto_411976 ) ) ( not ( = ?auto_411975 ?auto_411977 ) ) ( not ( = ?auto_411975 ?auto_411978 ) ) ( not ( = ?auto_411975 ?auto_411979 ) ) ( not ( = ?auto_411975 ?auto_411980 ) ) ( not ( = ?auto_411975 ?auto_411981 ) ) ( not ( = ?auto_411975 ?auto_411982 ) ) ( not ( = ?auto_411975 ?auto_411983 ) ) ( not ( = ?auto_411975 ?auto_411984 ) ) ( not ( = ?auto_411975 ?auto_411985 ) ) ( not ( = ?auto_411975 ?auto_411986 ) ) ( not ( = ?auto_411976 ?auto_411977 ) ) ( not ( = ?auto_411976 ?auto_411978 ) ) ( not ( = ?auto_411976 ?auto_411979 ) ) ( not ( = ?auto_411976 ?auto_411980 ) ) ( not ( = ?auto_411976 ?auto_411981 ) ) ( not ( = ?auto_411976 ?auto_411982 ) ) ( not ( = ?auto_411976 ?auto_411983 ) ) ( not ( = ?auto_411976 ?auto_411984 ) ) ( not ( = ?auto_411976 ?auto_411985 ) ) ( not ( = ?auto_411976 ?auto_411986 ) ) ( not ( = ?auto_411977 ?auto_411978 ) ) ( not ( = ?auto_411977 ?auto_411979 ) ) ( not ( = ?auto_411977 ?auto_411980 ) ) ( not ( = ?auto_411977 ?auto_411981 ) ) ( not ( = ?auto_411977 ?auto_411982 ) ) ( not ( = ?auto_411977 ?auto_411983 ) ) ( not ( = ?auto_411977 ?auto_411984 ) ) ( not ( = ?auto_411977 ?auto_411985 ) ) ( not ( = ?auto_411977 ?auto_411986 ) ) ( not ( = ?auto_411978 ?auto_411979 ) ) ( not ( = ?auto_411978 ?auto_411980 ) ) ( not ( = ?auto_411978 ?auto_411981 ) ) ( not ( = ?auto_411978 ?auto_411982 ) ) ( not ( = ?auto_411978 ?auto_411983 ) ) ( not ( = ?auto_411978 ?auto_411984 ) ) ( not ( = ?auto_411978 ?auto_411985 ) ) ( not ( = ?auto_411978 ?auto_411986 ) ) ( not ( = ?auto_411979 ?auto_411980 ) ) ( not ( = ?auto_411979 ?auto_411981 ) ) ( not ( = ?auto_411979 ?auto_411982 ) ) ( not ( = ?auto_411979 ?auto_411983 ) ) ( not ( = ?auto_411979 ?auto_411984 ) ) ( not ( = ?auto_411979 ?auto_411985 ) ) ( not ( = ?auto_411979 ?auto_411986 ) ) ( not ( = ?auto_411980 ?auto_411981 ) ) ( not ( = ?auto_411980 ?auto_411982 ) ) ( not ( = ?auto_411980 ?auto_411983 ) ) ( not ( = ?auto_411980 ?auto_411984 ) ) ( not ( = ?auto_411980 ?auto_411985 ) ) ( not ( = ?auto_411980 ?auto_411986 ) ) ( not ( = ?auto_411981 ?auto_411982 ) ) ( not ( = ?auto_411981 ?auto_411983 ) ) ( not ( = ?auto_411981 ?auto_411984 ) ) ( not ( = ?auto_411981 ?auto_411985 ) ) ( not ( = ?auto_411981 ?auto_411986 ) ) ( not ( = ?auto_411982 ?auto_411983 ) ) ( not ( = ?auto_411982 ?auto_411984 ) ) ( not ( = ?auto_411982 ?auto_411985 ) ) ( not ( = ?auto_411982 ?auto_411986 ) ) ( not ( = ?auto_411983 ?auto_411984 ) ) ( not ( = ?auto_411983 ?auto_411985 ) ) ( not ( = ?auto_411983 ?auto_411986 ) ) ( not ( = ?auto_411984 ?auto_411985 ) ) ( not ( = ?auto_411984 ?auto_411986 ) ) ( not ( = ?auto_411985 ?auto_411986 ) ) ( ON ?auto_411984 ?auto_411985 ) ( CLEAR ?auto_411982 ) ( ON ?auto_411983 ?auto_411984 ) ( CLEAR ?auto_411983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_411971 ?auto_411972 ?auto_411973 ?auto_411974 ?auto_411975 ?auto_411976 ?auto_411977 ?auto_411978 ?auto_411979 ?auto_411980 ?auto_411981 ?auto_411982 ?auto_411983 )
      ( MAKE-15PILE ?auto_411971 ?auto_411972 ?auto_411973 ?auto_411974 ?auto_411975 ?auto_411976 ?auto_411977 ?auto_411978 ?auto_411979 ?auto_411980 ?auto_411981 ?auto_411982 ?auto_411983 ?auto_411984 ?auto_411985 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412002 - BLOCK
      ?auto_412003 - BLOCK
      ?auto_412004 - BLOCK
      ?auto_412005 - BLOCK
      ?auto_412006 - BLOCK
      ?auto_412007 - BLOCK
      ?auto_412008 - BLOCK
      ?auto_412009 - BLOCK
      ?auto_412010 - BLOCK
      ?auto_412011 - BLOCK
      ?auto_412012 - BLOCK
      ?auto_412013 - BLOCK
      ?auto_412014 - BLOCK
      ?auto_412015 - BLOCK
      ?auto_412016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412016 ) ( ON-TABLE ?auto_412002 ) ( ON ?auto_412003 ?auto_412002 ) ( ON ?auto_412004 ?auto_412003 ) ( ON ?auto_412005 ?auto_412004 ) ( ON ?auto_412006 ?auto_412005 ) ( ON ?auto_412007 ?auto_412006 ) ( ON ?auto_412008 ?auto_412007 ) ( ON ?auto_412009 ?auto_412008 ) ( ON ?auto_412010 ?auto_412009 ) ( ON ?auto_412011 ?auto_412010 ) ( ON ?auto_412012 ?auto_412011 ) ( ON ?auto_412013 ?auto_412012 ) ( not ( = ?auto_412002 ?auto_412003 ) ) ( not ( = ?auto_412002 ?auto_412004 ) ) ( not ( = ?auto_412002 ?auto_412005 ) ) ( not ( = ?auto_412002 ?auto_412006 ) ) ( not ( = ?auto_412002 ?auto_412007 ) ) ( not ( = ?auto_412002 ?auto_412008 ) ) ( not ( = ?auto_412002 ?auto_412009 ) ) ( not ( = ?auto_412002 ?auto_412010 ) ) ( not ( = ?auto_412002 ?auto_412011 ) ) ( not ( = ?auto_412002 ?auto_412012 ) ) ( not ( = ?auto_412002 ?auto_412013 ) ) ( not ( = ?auto_412002 ?auto_412014 ) ) ( not ( = ?auto_412002 ?auto_412015 ) ) ( not ( = ?auto_412002 ?auto_412016 ) ) ( not ( = ?auto_412003 ?auto_412004 ) ) ( not ( = ?auto_412003 ?auto_412005 ) ) ( not ( = ?auto_412003 ?auto_412006 ) ) ( not ( = ?auto_412003 ?auto_412007 ) ) ( not ( = ?auto_412003 ?auto_412008 ) ) ( not ( = ?auto_412003 ?auto_412009 ) ) ( not ( = ?auto_412003 ?auto_412010 ) ) ( not ( = ?auto_412003 ?auto_412011 ) ) ( not ( = ?auto_412003 ?auto_412012 ) ) ( not ( = ?auto_412003 ?auto_412013 ) ) ( not ( = ?auto_412003 ?auto_412014 ) ) ( not ( = ?auto_412003 ?auto_412015 ) ) ( not ( = ?auto_412003 ?auto_412016 ) ) ( not ( = ?auto_412004 ?auto_412005 ) ) ( not ( = ?auto_412004 ?auto_412006 ) ) ( not ( = ?auto_412004 ?auto_412007 ) ) ( not ( = ?auto_412004 ?auto_412008 ) ) ( not ( = ?auto_412004 ?auto_412009 ) ) ( not ( = ?auto_412004 ?auto_412010 ) ) ( not ( = ?auto_412004 ?auto_412011 ) ) ( not ( = ?auto_412004 ?auto_412012 ) ) ( not ( = ?auto_412004 ?auto_412013 ) ) ( not ( = ?auto_412004 ?auto_412014 ) ) ( not ( = ?auto_412004 ?auto_412015 ) ) ( not ( = ?auto_412004 ?auto_412016 ) ) ( not ( = ?auto_412005 ?auto_412006 ) ) ( not ( = ?auto_412005 ?auto_412007 ) ) ( not ( = ?auto_412005 ?auto_412008 ) ) ( not ( = ?auto_412005 ?auto_412009 ) ) ( not ( = ?auto_412005 ?auto_412010 ) ) ( not ( = ?auto_412005 ?auto_412011 ) ) ( not ( = ?auto_412005 ?auto_412012 ) ) ( not ( = ?auto_412005 ?auto_412013 ) ) ( not ( = ?auto_412005 ?auto_412014 ) ) ( not ( = ?auto_412005 ?auto_412015 ) ) ( not ( = ?auto_412005 ?auto_412016 ) ) ( not ( = ?auto_412006 ?auto_412007 ) ) ( not ( = ?auto_412006 ?auto_412008 ) ) ( not ( = ?auto_412006 ?auto_412009 ) ) ( not ( = ?auto_412006 ?auto_412010 ) ) ( not ( = ?auto_412006 ?auto_412011 ) ) ( not ( = ?auto_412006 ?auto_412012 ) ) ( not ( = ?auto_412006 ?auto_412013 ) ) ( not ( = ?auto_412006 ?auto_412014 ) ) ( not ( = ?auto_412006 ?auto_412015 ) ) ( not ( = ?auto_412006 ?auto_412016 ) ) ( not ( = ?auto_412007 ?auto_412008 ) ) ( not ( = ?auto_412007 ?auto_412009 ) ) ( not ( = ?auto_412007 ?auto_412010 ) ) ( not ( = ?auto_412007 ?auto_412011 ) ) ( not ( = ?auto_412007 ?auto_412012 ) ) ( not ( = ?auto_412007 ?auto_412013 ) ) ( not ( = ?auto_412007 ?auto_412014 ) ) ( not ( = ?auto_412007 ?auto_412015 ) ) ( not ( = ?auto_412007 ?auto_412016 ) ) ( not ( = ?auto_412008 ?auto_412009 ) ) ( not ( = ?auto_412008 ?auto_412010 ) ) ( not ( = ?auto_412008 ?auto_412011 ) ) ( not ( = ?auto_412008 ?auto_412012 ) ) ( not ( = ?auto_412008 ?auto_412013 ) ) ( not ( = ?auto_412008 ?auto_412014 ) ) ( not ( = ?auto_412008 ?auto_412015 ) ) ( not ( = ?auto_412008 ?auto_412016 ) ) ( not ( = ?auto_412009 ?auto_412010 ) ) ( not ( = ?auto_412009 ?auto_412011 ) ) ( not ( = ?auto_412009 ?auto_412012 ) ) ( not ( = ?auto_412009 ?auto_412013 ) ) ( not ( = ?auto_412009 ?auto_412014 ) ) ( not ( = ?auto_412009 ?auto_412015 ) ) ( not ( = ?auto_412009 ?auto_412016 ) ) ( not ( = ?auto_412010 ?auto_412011 ) ) ( not ( = ?auto_412010 ?auto_412012 ) ) ( not ( = ?auto_412010 ?auto_412013 ) ) ( not ( = ?auto_412010 ?auto_412014 ) ) ( not ( = ?auto_412010 ?auto_412015 ) ) ( not ( = ?auto_412010 ?auto_412016 ) ) ( not ( = ?auto_412011 ?auto_412012 ) ) ( not ( = ?auto_412011 ?auto_412013 ) ) ( not ( = ?auto_412011 ?auto_412014 ) ) ( not ( = ?auto_412011 ?auto_412015 ) ) ( not ( = ?auto_412011 ?auto_412016 ) ) ( not ( = ?auto_412012 ?auto_412013 ) ) ( not ( = ?auto_412012 ?auto_412014 ) ) ( not ( = ?auto_412012 ?auto_412015 ) ) ( not ( = ?auto_412012 ?auto_412016 ) ) ( not ( = ?auto_412013 ?auto_412014 ) ) ( not ( = ?auto_412013 ?auto_412015 ) ) ( not ( = ?auto_412013 ?auto_412016 ) ) ( not ( = ?auto_412014 ?auto_412015 ) ) ( not ( = ?auto_412014 ?auto_412016 ) ) ( not ( = ?auto_412015 ?auto_412016 ) ) ( ON ?auto_412015 ?auto_412016 ) ( CLEAR ?auto_412013 ) ( ON ?auto_412014 ?auto_412015 ) ( CLEAR ?auto_412014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_412002 ?auto_412003 ?auto_412004 ?auto_412005 ?auto_412006 ?auto_412007 ?auto_412008 ?auto_412009 ?auto_412010 ?auto_412011 ?auto_412012 ?auto_412013 ?auto_412014 )
      ( MAKE-15PILE ?auto_412002 ?auto_412003 ?auto_412004 ?auto_412005 ?auto_412006 ?auto_412007 ?auto_412008 ?auto_412009 ?auto_412010 ?auto_412011 ?auto_412012 ?auto_412013 ?auto_412014 ?auto_412015 ?auto_412016 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412032 - BLOCK
      ?auto_412033 - BLOCK
      ?auto_412034 - BLOCK
      ?auto_412035 - BLOCK
      ?auto_412036 - BLOCK
      ?auto_412037 - BLOCK
      ?auto_412038 - BLOCK
      ?auto_412039 - BLOCK
      ?auto_412040 - BLOCK
      ?auto_412041 - BLOCK
      ?auto_412042 - BLOCK
      ?auto_412043 - BLOCK
      ?auto_412044 - BLOCK
      ?auto_412045 - BLOCK
      ?auto_412046 - BLOCK
    )
    :vars
    (
      ?auto_412047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412046 ?auto_412047 ) ( ON-TABLE ?auto_412032 ) ( ON ?auto_412033 ?auto_412032 ) ( ON ?auto_412034 ?auto_412033 ) ( ON ?auto_412035 ?auto_412034 ) ( ON ?auto_412036 ?auto_412035 ) ( ON ?auto_412037 ?auto_412036 ) ( ON ?auto_412038 ?auto_412037 ) ( ON ?auto_412039 ?auto_412038 ) ( ON ?auto_412040 ?auto_412039 ) ( ON ?auto_412041 ?auto_412040 ) ( ON ?auto_412042 ?auto_412041 ) ( not ( = ?auto_412032 ?auto_412033 ) ) ( not ( = ?auto_412032 ?auto_412034 ) ) ( not ( = ?auto_412032 ?auto_412035 ) ) ( not ( = ?auto_412032 ?auto_412036 ) ) ( not ( = ?auto_412032 ?auto_412037 ) ) ( not ( = ?auto_412032 ?auto_412038 ) ) ( not ( = ?auto_412032 ?auto_412039 ) ) ( not ( = ?auto_412032 ?auto_412040 ) ) ( not ( = ?auto_412032 ?auto_412041 ) ) ( not ( = ?auto_412032 ?auto_412042 ) ) ( not ( = ?auto_412032 ?auto_412043 ) ) ( not ( = ?auto_412032 ?auto_412044 ) ) ( not ( = ?auto_412032 ?auto_412045 ) ) ( not ( = ?auto_412032 ?auto_412046 ) ) ( not ( = ?auto_412032 ?auto_412047 ) ) ( not ( = ?auto_412033 ?auto_412034 ) ) ( not ( = ?auto_412033 ?auto_412035 ) ) ( not ( = ?auto_412033 ?auto_412036 ) ) ( not ( = ?auto_412033 ?auto_412037 ) ) ( not ( = ?auto_412033 ?auto_412038 ) ) ( not ( = ?auto_412033 ?auto_412039 ) ) ( not ( = ?auto_412033 ?auto_412040 ) ) ( not ( = ?auto_412033 ?auto_412041 ) ) ( not ( = ?auto_412033 ?auto_412042 ) ) ( not ( = ?auto_412033 ?auto_412043 ) ) ( not ( = ?auto_412033 ?auto_412044 ) ) ( not ( = ?auto_412033 ?auto_412045 ) ) ( not ( = ?auto_412033 ?auto_412046 ) ) ( not ( = ?auto_412033 ?auto_412047 ) ) ( not ( = ?auto_412034 ?auto_412035 ) ) ( not ( = ?auto_412034 ?auto_412036 ) ) ( not ( = ?auto_412034 ?auto_412037 ) ) ( not ( = ?auto_412034 ?auto_412038 ) ) ( not ( = ?auto_412034 ?auto_412039 ) ) ( not ( = ?auto_412034 ?auto_412040 ) ) ( not ( = ?auto_412034 ?auto_412041 ) ) ( not ( = ?auto_412034 ?auto_412042 ) ) ( not ( = ?auto_412034 ?auto_412043 ) ) ( not ( = ?auto_412034 ?auto_412044 ) ) ( not ( = ?auto_412034 ?auto_412045 ) ) ( not ( = ?auto_412034 ?auto_412046 ) ) ( not ( = ?auto_412034 ?auto_412047 ) ) ( not ( = ?auto_412035 ?auto_412036 ) ) ( not ( = ?auto_412035 ?auto_412037 ) ) ( not ( = ?auto_412035 ?auto_412038 ) ) ( not ( = ?auto_412035 ?auto_412039 ) ) ( not ( = ?auto_412035 ?auto_412040 ) ) ( not ( = ?auto_412035 ?auto_412041 ) ) ( not ( = ?auto_412035 ?auto_412042 ) ) ( not ( = ?auto_412035 ?auto_412043 ) ) ( not ( = ?auto_412035 ?auto_412044 ) ) ( not ( = ?auto_412035 ?auto_412045 ) ) ( not ( = ?auto_412035 ?auto_412046 ) ) ( not ( = ?auto_412035 ?auto_412047 ) ) ( not ( = ?auto_412036 ?auto_412037 ) ) ( not ( = ?auto_412036 ?auto_412038 ) ) ( not ( = ?auto_412036 ?auto_412039 ) ) ( not ( = ?auto_412036 ?auto_412040 ) ) ( not ( = ?auto_412036 ?auto_412041 ) ) ( not ( = ?auto_412036 ?auto_412042 ) ) ( not ( = ?auto_412036 ?auto_412043 ) ) ( not ( = ?auto_412036 ?auto_412044 ) ) ( not ( = ?auto_412036 ?auto_412045 ) ) ( not ( = ?auto_412036 ?auto_412046 ) ) ( not ( = ?auto_412036 ?auto_412047 ) ) ( not ( = ?auto_412037 ?auto_412038 ) ) ( not ( = ?auto_412037 ?auto_412039 ) ) ( not ( = ?auto_412037 ?auto_412040 ) ) ( not ( = ?auto_412037 ?auto_412041 ) ) ( not ( = ?auto_412037 ?auto_412042 ) ) ( not ( = ?auto_412037 ?auto_412043 ) ) ( not ( = ?auto_412037 ?auto_412044 ) ) ( not ( = ?auto_412037 ?auto_412045 ) ) ( not ( = ?auto_412037 ?auto_412046 ) ) ( not ( = ?auto_412037 ?auto_412047 ) ) ( not ( = ?auto_412038 ?auto_412039 ) ) ( not ( = ?auto_412038 ?auto_412040 ) ) ( not ( = ?auto_412038 ?auto_412041 ) ) ( not ( = ?auto_412038 ?auto_412042 ) ) ( not ( = ?auto_412038 ?auto_412043 ) ) ( not ( = ?auto_412038 ?auto_412044 ) ) ( not ( = ?auto_412038 ?auto_412045 ) ) ( not ( = ?auto_412038 ?auto_412046 ) ) ( not ( = ?auto_412038 ?auto_412047 ) ) ( not ( = ?auto_412039 ?auto_412040 ) ) ( not ( = ?auto_412039 ?auto_412041 ) ) ( not ( = ?auto_412039 ?auto_412042 ) ) ( not ( = ?auto_412039 ?auto_412043 ) ) ( not ( = ?auto_412039 ?auto_412044 ) ) ( not ( = ?auto_412039 ?auto_412045 ) ) ( not ( = ?auto_412039 ?auto_412046 ) ) ( not ( = ?auto_412039 ?auto_412047 ) ) ( not ( = ?auto_412040 ?auto_412041 ) ) ( not ( = ?auto_412040 ?auto_412042 ) ) ( not ( = ?auto_412040 ?auto_412043 ) ) ( not ( = ?auto_412040 ?auto_412044 ) ) ( not ( = ?auto_412040 ?auto_412045 ) ) ( not ( = ?auto_412040 ?auto_412046 ) ) ( not ( = ?auto_412040 ?auto_412047 ) ) ( not ( = ?auto_412041 ?auto_412042 ) ) ( not ( = ?auto_412041 ?auto_412043 ) ) ( not ( = ?auto_412041 ?auto_412044 ) ) ( not ( = ?auto_412041 ?auto_412045 ) ) ( not ( = ?auto_412041 ?auto_412046 ) ) ( not ( = ?auto_412041 ?auto_412047 ) ) ( not ( = ?auto_412042 ?auto_412043 ) ) ( not ( = ?auto_412042 ?auto_412044 ) ) ( not ( = ?auto_412042 ?auto_412045 ) ) ( not ( = ?auto_412042 ?auto_412046 ) ) ( not ( = ?auto_412042 ?auto_412047 ) ) ( not ( = ?auto_412043 ?auto_412044 ) ) ( not ( = ?auto_412043 ?auto_412045 ) ) ( not ( = ?auto_412043 ?auto_412046 ) ) ( not ( = ?auto_412043 ?auto_412047 ) ) ( not ( = ?auto_412044 ?auto_412045 ) ) ( not ( = ?auto_412044 ?auto_412046 ) ) ( not ( = ?auto_412044 ?auto_412047 ) ) ( not ( = ?auto_412045 ?auto_412046 ) ) ( not ( = ?auto_412045 ?auto_412047 ) ) ( not ( = ?auto_412046 ?auto_412047 ) ) ( ON ?auto_412045 ?auto_412046 ) ( ON ?auto_412044 ?auto_412045 ) ( CLEAR ?auto_412042 ) ( ON ?auto_412043 ?auto_412044 ) ( CLEAR ?auto_412043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_412032 ?auto_412033 ?auto_412034 ?auto_412035 ?auto_412036 ?auto_412037 ?auto_412038 ?auto_412039 ?auto_412040 ?auto_412041 ?auto_412042 ?auto_412043 )
      ( MAKE-15PILE ?auto_412032 ?auto_412033 ?auto_412034 ?auto_412035 ?auto_412036 ?auto_412037 ?auto_412038 ?auto_412039 ?auto_412040 ?auto_412041 ?auto_412042 ?auto_412043 ?auto_412044 ?auto_412045 ?auto_412046 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412063 - BLOCK
      ?auto_412064 - BLOCK
      ?auto_412065 - BLOCK
      ?auto_412066 - BLOCK
      ?auto_412067 - BLOCK
      ?auto_412068 - BLOCK
      ?auto_412069 - BLOCK
      ?auto_412070 - BLOCK
      ?auto_412071 - BLOCK
      ?auto_412072 - BLOCK
      ?auto_412073 - BLOCK
      ?auto_412074 - BLOCK
      ?auto_412075 - BLOCK
      ?auto_412076 - BLOCK
      ?auto_412077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412077 ) ( ON-TABLE ?auto_412063 ) ( ON ?auto_412064 ?auto_412063 ) ( ON ?auto_412065 ?auto_412064 ) ( ON ?auto_412066 ?auto_412065 ) ( ON ?auto_412067 ?auto_412066 ) ( ON ?auto_412068 ?auto_412067 ) ( ON ?auto_412069 ?auto_412068 ) ( ON ?auto_412070 ?auto_412069 ) ( ON ?auto_412071 ?auto_412070 ) ( ON ?auto_412072 ?auto_412071 ) ( ON ?auto_412073 ?auto_412072 ) ( not ( = ?auto_412063 ?auto_412064 ) ) ( not ( = ?auto_412063 ?auto_412065 ) ) ( not ( = ?auto_412063 ?auto_412066 ) ) ( not ( = ?auto_412063 ?auto_412067 ) ) ( not ( = ?auto_412063 ?auto_412068 ) ) ( not ( = ?auto_412063 ?auto_412069 ) ) ( not ( = ?auto_412063 ?auto_412070 ) ) ( not ( = ?auto_412063 ?auto_412071 ) ) ( not ( = ?auto_412063 ?auto_412072 ) ) ( not ( = ?auto_412063 ?auto_412073 ) ) ( not ( = ?auto_412063 ?auto_412074 ) ) ( not ( = ?auto_412063 ?auto_412075 ) ) ( not ( = ?auto_412063 ?auto_412076 ) ) ( not ( = ?auto_412063 ?auto_412077 ) ) ( not ( = ?auto_412064 ?auto_412065 ) ) ( not ( = ?auto_412064 ?auto_412066 ) ) ( not ( = ?auto_412064 ?auto_412067 ) ) ( not ( = ?auto_412064 ?auto_412068 ) ) ( not ( = ?auto_412064 ?auto_412069 ) ) ( not ( = ?auto_412064 ?auto_412070 ) ) ( not ( = ?auto_412064 ?auto_412071 ) ) ( not ( = ?auto_412064 ?auto_412072 ) ) ( not ( = ?auto_412064 ?auto_412073 ) ) ( not ( = ?auto_412064 ?auto_412074 ) ) ( not ( = ?auto_412064 ?auto_412075 ) ) ( not ( = ?auto_412064 ?auto_412076 ) ) ( not ( = ?auto_412064 ?auto_412077 ) ) ( not ( = ?auto_412065 ?auto_412066 ) ) ( not ( = ?auto_412065 ?auto_412067 ) ) ( not ( = ?auto_412065 ?auto_412068 ) ) ( not ( = ?auto_412065 ?auto_412069 ) ) ( not ( = ?auto_412065 ?auto_412070 ) ) ( not ( = ?auto_412065 ?auto_412071 ) ) ( not ( = ?auto_412065 ?auto_412072 ) ) ( not ( = ?auto_412065 ?auto_412073 ) ) ( not ( = ?auto_412065 ?auto_412074 ) ) ( not ( = ?auto_412065 ?auto_412075 ) ) ( not ( = ?auto_412065 ?auto_412076 ) ) ( not ( = ?auto_412065 ?auto_412077 ) ) ( not ( = ?auto_412066 ?auto_412067 ) ) ( not ( = ?auto_412066 ?auto_412068 ) ) ( not ( = ?auto_412066 ?auto_412069 ) ) ( not ( = ?auto_412066 ?auto_412070 ) ) ( not ( = ?auto_412066 ?auto_412071 ) ) ( not ( = ?auto_412066 ?auto_412072 ) ) ( not ( = ?auto_412066 ?auto_412073 ) ) ( not ( = ?auto_412066 ?auto_412074 ) ) ( not ( = ?auto_412066 ?auto_412075 ) ) ( not ( = ?auto_412066 ?auto_412076 ) ) ( not ( = ?auto_412066 ?auto_412077 ) ) ( not ( = ?auto_412067 ?auto_412068 ) ) ( not ( = ?auto_412067 ?auto_412069 ) ) ( not ( = ?auto_412067 ?auto_412070 ) ) ( not ( = ?auto_412067 ?auto_412071 ) ) ( not ( = ?auto_412067 ?auto_412072 ) ) ( not ( = ?auto_412067 ?auto_412073 ) ) ( not ( = ?auto_412067 ?auto_412074 ) ) ( not ( = ?auto_412067 ?auto_412075 ) ) ( not ( = ?auto_412067 ?auto_412076 ) ) ( not ( = ?auto_412067 ?auto_412077 ) ) ( not ( = ?auto_412068 ?auto_412069 ) ) ( not ( = ?auto_412068 ?auto_412070 ) ) ( not ( = ?auto_412068 ?auto_412071 ) ) ( not ( = ?auto_412068 ?auto_412072 ) ) ( not ( = ?auto_412068 ?auto_412073 ) ) ( not ( = ?auto_412068 ?auto_412074 ) ) ( not ( = ?auto_412068 ?auto_412075 ) ) ( not ( = ?auto_412068 ?auto_412076 ) ) ( not ( = ?auto_412068 ?auto_412077 ) ) ( not ( = ?auto_412069 ?auto_412070 ) ) ( not ( = ?auto_412069 ?auto_412071 ) ) ( not ( = ?auto_412069 ?auto_412072 ) ) ( not ( = ?auto_412069 ?auto_412073 ) ) ( not ( = ?auto_412069 ?auto_412074 ) ) ( not ( = ?auto_412069 ?auto_412075 ) ) ( not ( = ?auto_412069 ?auto_412076 ) ) ( not ( = ?auto_412069 ?auto_412077 ) ) ( not ( = ?auto_412070 ?auto_412071 ) ) ( not ( = ?auto_412070 ?auto_412072 ) ) ( not ( = ?auto_412070 ?auto_412073 ) ) ( not ( = ?auto_412070 ?auto_412074 ) ) ( not ( = ?auto_412070 ?auto_412075 ) ) ( not ( = ?auto_412070 ?auto_412076 ) ) ( not ( = ?auto_412070 ?auto_412077 ) ) ( not ( = ?auto_412071 ?auto_412072 ) ) ( not ( = ?auto_412071 ?auto_412073 ) ) ( not ( = ?auto_412071 ?auto_412074 ) ) ( not ( = ?auto_412071 ?auto_412075 ) ) ( not ( = ?auto_412071 ?auto_412076 ) ) ( not ( = ?auto_412071 ?auto_412077 ) ) ( not ( = ?auto_412072 ?auto_412073 ) ) ( not ( = ?auto_412072 ?auto_412074 ) ) ( not ( = ?auto_412072 ?auto_412075 ) ) ( not ( = ?auto_412072 ?auto_412076 ) ) ( not ( = ?auto_412072 ?auto_412077 ) ) ( not ( = ?auto_412073 ?auto_412074 ) ) ( not ( = ?auto_412073 ?auto_412075 ) ) ( not ( = ?auto_412073 ?auto_412076 ) ) ( not ( = ?auto_412073 ?auto_412077 ) ) ( not ( = ?auto_412074 ?auto_412075 ) ) ( not ( = ?auto_412074 ?auto_412076 ) ) ( not ( = ?auto_412074 ?auto_412077 ) ) ( not ( = ?auto_412075 ?auto_412076 ) ) ( not ( = ?auto_412075 ?auto_412077 ) ) ( not ( = ?auto_412076 ?auto_412077 ) ) ( ON ?auto_412076 ?auto_412077 ) ( ON ?auto_412075 ?auto_412076 ) ( CLEAR ?auto_412073 ) ( ON ?auto_412074 ?auto_412075 ) ( CLEAR ?auto_412074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_412063 ?auto_412064 ?auto_412065 ?auto_412066 ?auto_412067 ?auto_412068 ?auto_412069 ?auto_412070 ?auto_412071 ?auto_412072 ?auto_412073 ?auto_412074 )
      ( MAKE-15PILE ?auto_412063 ?auto_412064 ?auto_412065 ?auto_412066 ?auto_412067 ?auto_412068 ?auto_412069 ?auto_412070 ?auto_412071 ?auto_412072 ?auto_412073 ?auto_412074 ?auto_412075 ?auto_412076 ?auto_412077 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412093 - BLOCK
      ?auto_412094 - BLOCK
      ?auto_412095 - BLOCK
      ?auto_412096 - BLOCK
      ?auto_412097 - BLOCK
      ?auto_412098 - BLOCK
      ?auto_412099 - BLOCK
      ?auto_412100 - BLOCK
      ?auto_412101 - BLOCK
      ?auto_412102 - BLOCK
      ?auto_412103 - BLOCK
      ?auto_412104 - BLOCK
      ?auto_412105 - BLOCK
      ?auto_412106 - BLOCK
      ?auto_412107 - BLOCK
    )
    :vars
    (
      ?auto_412108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412107 ?auto_412108 ) ( ON-TABLE ?auto_412093 ) ( ON ?auto_412094 ?auto_412093 ) ( ON ?auto_412095 ?auto_412094 ) ( ON ?auto_412096 ?auto_412095 ) ( ON ?auto_412097 ?auto_412096 ) ( ON ?auto_412098 ?auto_412097 ) ( ON ?auto_412099 ?auto_412098 ) ( ON ?auto_412100 ?auto_412099 ) ( ON ?auto_412101 ?auto_412100 ) ( ON ?auto_412102 ?auto_412101 ) ( not ( = ?auto_412093 ?auto_412094 ) ) ( not ( = ?auto_412093 ?auto_412095 ) ) ( not ( = ?auto_412093 ?auto_412096 ) ) ( not ( = ?auto_412093 ?auto_412097 ) ) ( not ( = ?auto_412093 ?auto_412098 ) ) ( not ( = ?auto_412093 ?auto_412099 ) ) ( not ( = ?auto_412093 ?auto_412100 ) ) ( not ( = ?auto_412093 ?auto_412101 ) ) ( not ( = ?auto_412093 ?auto_412102 ) ) ( not ( = ?auto_412093 ?auto_412103 ) ) ( not ( = ?auto_412093 ?auto_412104 ) ) ( not ( = ?auto_412093 ?auto_412105 ) ) ( not ( = ?auto_412093 ?auto_412106 ) ) ( not ( = ?auto_412093 ?auto_412107 ) ) ( not ( = ?auto_412093 ?auto_412108 ) ) ( not ( = ?auto_412094 ?auto_412095 ) ) ( not ( = ?auto_412094 ?auto_412096 ) ) ( not ( = ?auto_412094 ?auto_412097 ) ) ( not ( = ?auto_412094 ?auto_412098 ) ) ( not ( = ?auto_412094 ?auto_412099 ) ) ( not ( = ?auto_412094 ?auto_412100 ) ) ( not ( = ?auto_412094 ?auto_412101 ) ) ( not ( = ?auto_412094 ?auto_412102 ) ) ( not ( = ?auto_412094 ?auto_412103 ) ) ( not ( = ?auto_412094 ?auto_412104 ) ) ( not ( = ?auto_412094 ?auto_412105 ) ) ( not ( = ?auto_412094 ?auto_412106 ) ) ( not ( = ?auto_412094 ?auto_412107 ) ) ( not ( = ?auto_412094 ?auto_412108 ) ) ( not ( = ?auto_412095 ?auto_412096 ) ) ( not ( = ?auto_412095 ?auto_412097 ) ) ( not ( = ?auto_412095 ?auto_412098 ) ) ( not ( = ?auto_412095 ?auto_412099 ) ) ( not ( = ?auto_412095 ?auto_412100 ) ) ( not ( = ?auto_412095 ?auto_412101 ) ) ( not ( = ?auto_412095 ?auto_412102 ) ) ( not ( = ?auto_412095 ?auto_412103 ) ) ( not ( = ?auto_412095 ?auto_412104 ) ) ( not ( = ?auto_412095 ?auto_412105 ) ) ( not ( = ?auto_412095 ?auto_412106 ) ) ( not ( = ?auto_412095 ?auto_412107 ) ) ( not ( = ?auto_412095 ?auto_412108 ) ) ( not ( = ?auto_412096 ?auto_412097 ) ) ( not ( = ?auto_412096 ?auto_412098 ) ) ( not ( = ?auto_412096 ?auto_412099 ) ) ( not ( = ?auto_412096 ?auto_412100 ) ) ( not ( = ?auto_412096 ?auto_412101 ) ) ( not ( = ?auto_412096 ?auto_412102 ) ) ( not ( = ?auto_412096 ?auto_412103 ) ) ( not ( = ?auto_412096 ?auto_412104 ) ) ( not ( = ?auto_412096 ?auto_412105 ) ) ( not ( = ?auto_412096 ?auto_412106 ) ) ( not ( = ?auto_412096 ?auto_412107 ) ) ( not ( = ?auto_412096 ?auto_412108 ) ) ( not ( = ?auto_412097 ?auto_412098 ) ) ( not ( = ?auto_412097 ?auto_412099 ) ) ( not ( = ?auto_412097 ?auto_412100 ) ) ( not ( = ?auto_412097 ?auto_412101 ) ) ( not ( = ?auto_412097 ?auto_412102 ) ) ( not ( = ?auto_412097 ?auto_412103 ) ) ( not ( = ?auto_412097 ?auto_412104 ) ) ( not ( = ?auto_412097 ?auto_412105 ) ) ( not ( = ?auto_412097 ?auto_412106 ) ) ( not ( = ?auto_412097 ?auto_412107 ) ) ( not ( = ?auto_412097 ?auto_412108 ) ) ( not ( = ?auto_412098 ?auto_412099 ) ) ( not ( = ?auto_412098 ?auto_412100 ) ) ( not ( = ?auto_412098 ?auto_412101 ) ) ( not ( = ?auto_412098 ?auto_412102 ) ) ( not ( = ?auto_412098 ?auto_412103 ) ) ( not ( = ?auto_412098 ?auto_412104 ) ) ( not ( = ?auto_412098 ?auto_412105 ) ) ( not ( = ?auto_412098 ?auto_412106 ) ) ( not ( = ?auto_412098 ?auto_412107 ) ) ( not ( = ?auto_412098 ?auto_412108 ) ) ( not ( = ?auto_412099 ?auto_412100 ) ) ( not ( = ?auto_412099 ?auto_412101 ) ) ( not ( = ?auto_412099 ?auto_412102 ) ) ( not ( = ?auto_412099 ?auto_412103 ) ) ( not ( = ?auto_412099 ?auto_412104 ) ) ( not ( = ?auto_412099 ?auto_412105 ) ) ( not ( = ?auto_412099 ?auto_412106 ) ) ( not ( = ?auto_412099 ?auto_412107 ) ) ( not ( = ?auto_412099 ?auto_412108 ) ) ( not ( = ?auto_412100 ?auto_412101 ) ) ( not ( = ?auto_412100 ?auto_412102 ) ) ( not ( = ?auto_412100 ?auto_412103 ) ) ( not ( = ?auto_412100 ?auto_412104 ) ) ( not ( = ?auto_412100 ?auto_412105 ) ) ( not ( = ?auto_412100 ?auto_412106 ) ) ( not ( = ?auto_412100 ?auto_412107 ) ) ( not ( = ?auto_412100 ?auto_412108 ) ) ( not ( = ?auto_412101 ?auto_412102 ) ) ( not ( = ?auto_412101 ?auto_412103 ) ) ( not ( = ?auto_412101 ?auto_412104 ) ) ( not ( = ?auto_412101 ?auto_412105 ) ) ( not ( = ?auto_412101 ?auto_412106 ) ) ( not ( = ?auto_412101 ?auto_412107 ) ) ( not ( = ?auto_412101 ?auto_412108 ) ) ( not ( = ?auto_412102 ?auto_412103 ) ) ( not ( = ?auto_412102 ?auto_412104 ) ) ( not ( = ?auto_412102 ?auto_412105 ) ) ( not ( = ?auto_412102 ?auto_412106 ) ) ( not ( = ?auto_412102 ?auto_412107 ) ) ( not ( = ?auto_412102 ?auto_412108 ) ) ( not ( = ?auto_412103 ?auto_412104 ) ) ( not ( = ?auto_412103 ?auto_412105 ) ) ( not ( = ?auto_412103 ?auto_412106 ) ) ( not ( = ?auto_412103 ?auto_412107 ) ) ( not ( = ?auto_412103 ?auto_412108 ) ) ( not ( = ?auto_412104 ?auto_412105 ) ) ( not ( = ?auto_412104 ?auto_412106 ) ) ( not ( = ?auto_412104 ?auto_412107 ) ) ( not ( = ?auto_412104 ?auto_412108 ) ) ( not ( = ?auto_412105 ?auto_412106 ) ) ( not ( = ?auto_412105 ?auto_412107 ) ) ( not ( = ?auto_412105 ?auto_412108 ) ) ( not ( = ?auto_412106 ?auto_412107 ) ) ( not ( = ?auto_412106 ?auto_412108 ) ) ( not ( = ?auto_412107 ?auto_412108 ) ) ( ON ?auto_412106 ?auto_412107 ) ( ON ?auto_412105 ?auto_412106 ) ( ON ?auto_412104 ?auto_412105 ) ( CLEAR ?auto_412102 ) ( ON ?auto_412103 ?auto_412104 ) ( CLEAR ?auto_412103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_412093 ?auto_412094 ?auto_412095 ?auto_412096 ?auto_412097 ?auto_412098 ?auto_412099 ?auto_412100 ?auto_412101 ?auto_412102 ?auto_412103 )
      ( MAKE-15PILE ?auto_412093 ?auto_412094 ?auto_412095 ?auto_412096 ?auto_412097 ?auto_412098 ?auto_412099 ?auto_412100 ?auto_412101 ?auto_412102 ?auto_412103 ?auto_412104 ?auto_412105 ?auto_412106 ?auto_412107 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412124 - BLOCK
      ?auto_412125 - BLOCK
      ?auto_412126 - BLOCK
      ?auto_412127 - BLOCK
      ?auto_412128 - BLOCK
      ?auto_412129 - BLOCK
      ?auto_412130 - BLOCK
      ?auto_412131 - BLOCK
      ?auto_412132 - BLOCK
      ?auto_412133 - BLOCK
      ?auto_412134 - BLOCK
      ?auto_412135 - BLOCK
      ?auto_412136 - BLOCK
      ?auto_412137 - BLOCK
      ?auto_412138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412138 ) ( ON-TABLE ?auto_412124 ) ( ON ?auto_412125 ?auto_412124 ) ( ON ?auto_412126 ?auto_412125 ) ( ON ?auto_412127 ?auto_412126 ) ( ON ?auto_412128 ?auto_412127 ) ( ON ?auto_412129 ?auto_412128 ) ( ON ?auto_412130 ?auto_412129 ) ( ON ?auto_412131 ?auto_412130 ) ( ON ?auto_412132 ?auto_412131 ) ( ON ?auto_412133 ?auto_412132 ) ( not ( = ?auto_412124 ?auto_412125 ) ) ( not ( = ?auto_412124 ?auto_412126 ) ) ( not ( = ?auto_412124 ?auto_412127 ) ) ( not ( = ?auto_412124 ?auto_412128 ) ) ( not ( = ?auto_412124 ?auto_412129 ) ) ( not ( = ?auto_412124 ?auto_412130 ) ) ( not ( = ?auto_412124 ?auto_412131 ) ) ( not ( = ?auto_412124 ?auto_412132 ) ) ( not ( = ?auto_412124 ?auto_412133 ) ) ( not ( = ?auto_412124 ?auto_412134 ) ) ( not ( = ?auto_412124 ?auto_412135 ) ) ( not ( = ?auto_412124 ?auto_412136 ) ) ( not ( = ?auto_412124 ?auto_412137 ) ) ( not ( = ?auto_412124 ?auto_412138 ) ) ( not ( = ?auto_412125 ?auto_412126 ) ) ( not ( = ?auto_412125 ?auto_412127 ) ) ( not ( = ?auto_412125 ?auto_412128 ) ) ( not ( = ?auto_412125 ?auto_412129 ) ) ( not ( = ?auto_412125 ?auto_412130 ) ) ( not ( = ?auto_412125 ?auto_412131 ) ) ( not ( = ?auto_412125 ?auto_412132 ) ) ( not ( = ?auto_412125 ?auto_412133 ) ) ( not ( = ?auto_412125 ?auto_412134 ) ) ( not ( = ?auto_412125 ?auto_412135 ) ) ( not ( = ?auto_412125 ?auto_412136 ) ) ( not ( = ?auto_412125 ?auto_412137 ) ) ( not ( = ?auto_412125 ?auto_412138 ) ) ( not ( = ?auto_412126 ?auto_412127 ) ) ( not ( = ?auto_412126 ?auto_412128 ) ) ( not ( = ?auto_412126 ?auto_412129 ) ) ( not ( = ?auto_412126 ?auto_412130 ) ) ( not ( = ?auto_412126 ?auto_412131 ) ) ( not ( = ?auto_412126 ?auto_412132 ) ) ( not ( = ?auto_412126 ?auto_412133 ) ) ( not ( = ?auto_412126 ?auto_412134 ) ) ( not ( = ?auto_412126 ?auto_412135 ) ) ( not ( = ?auto_412126 ?auto_412136 ) ) ( not ( = ?auto_412126 ?auto_412137 ) ) ( not ( = ?auto_412126 ?auto_412138 ) ) ( not ( = ?auto_412127 ?auto_412128 ) ) ( not ( = ?auto_412127 ?auto_412129 ) ) ( not ( = ?auto_412127 ?auto_412130 ) ) ( not ( = ?auto_412127 ?auto_412131 ) ) ( not ( = ?auto_412127 ?auto_412132 ) ) ( not ( = ?auto_412127 ?auto_412133 ) ) ( not ( = ?auto_412127 ?auto_412134 ) ) ( not ( = ?auto_412127 ?auto_412135 ) ) ( not ( = ?auto_412127 ?auto_412136 ) ) ( not ( = ?auto_412127 ?auto_412137 ) ) ( not ( = ?auto_412127 ?auto_412138 ) ) ( not ( = ?auto_412128 ?auto_412129 ) ) ( not ( = ?auto_412128 ?auto_412130 ) ) ( not ( = ?auto_412128 ?auto_412131 ) ) ( not ( = ?auto_412128 ?auto_412132 ) ) ( not ( = ?auto_412128 ?auto_412133 ) ) ( not ( = ?auto_412128 ?auto_412134 ) ) ( not ( = ?auto_412128 ?auto_412135 ) ) ( not ( = ?auto_412128 ?auto_412136 ) ) ( not ( = ?auto_412128 ?auto_412137 ) ) ( not ( = ?auto_412128 ?auto_412138 ) ) ( not ( = ?auto_412129 ?auto_412130 ) ) ( not ( = ?auto_412129 ?auto_412131 ) ) ( not ( = ?auto_412129 ?auto_412132 ) ) ( not ( = ?auto_412129 ?auto_412133 ) ) ( not ( = ?auto_412129 ?auto_412134 ) ) ( not ( = ?auto_412129 ?auto_412135 ) ) ( not ( = ?auto_412129 ?auto_412136 ) ) ( not ( = ?auto_412129 ?auto_412137 ) ) ( not ( = ?auto_412129 ?auto_412138 ) ) ( not ( = ?auto_412130 ?auto_412131 ) ) ( not ( = ?auto_412130 ?auto_412132 ) ) ( not ( = ?auto_412130 ?auto_412133 ) ) ( not ( = ?auto_412130 ?auto_412134 ) ) ( not ( = ?auto_412130 ?auto_412135 ) ) ( not ( = ?auto_412130 ?auto_412136 ) ) ( not ( = ?auto_412130 ?auto_412137 ) ) ( not ( = ?auto_412130 ?auto_412138 ) ) ( not ( = ?auto_412131 ?auto_412132 ) ) ( not ( = ?auto_412131 ?auto_412133 ) ) ( not ( = ?auto_412131 ?auto_412134 ) ) ( not ( = ?auto_412131 ?auto_412135 ) ) ( not ( = ?auto_412131 ?auto_412136 ) ) ( not ( = ?auto_412131 ?auto_412137 ) ) ( not ( = ?auto_412131 ?auto_412138 ) ) ( not ( = ?auto_412132 ?auto_412133 ) ) ( not ( = ?auto_412132 ?auto_412134 ) ) ( not ( = ?auto_412132 ?auto_412135 ) ) ( not ( = ?auto_412132 ?auto_412136 ) ) ( not ( = ?auto_412132 ?auto_412137 ) ) ( not ( = ?auto_412132 ?auto_412138 ) ) ( not ( = ?auto_412133 ?auto_412134 ) ) ( not ( = ?auto_412133 ?auto_412135 ) ) ( not ( = ?auto_412133 ?auto_412136 ) ) ( not ( = ?auto_412133 ?auto_412137 ) ) ( not ( = ?auto_412133 ?auto_412138 ) ) ( not ( = ?auto_412134 ?auto_412135 ) ) ( not ( = ?auto_412134 ?auto_412136 ) ) ( not ( = ?auto_412134 ?auto_412137 ) ) ( not ( = ?auto_412134 ?auto_412138 ) ) ( not ( = ?auto_412135 ?auto_412136 ) ) ( not ( = ?auto_412135 ?auto_412137 ) ) ( not ( = ?auto_412135 ?auto_412138 ) ) ( not ( = ?auto_412136 ?auto_412137 ) ) ( not ( = ?auto_412136 ?auto_412138 ) ) ( not ( = ?auto_412137 ?auto_412138 ) ) ( ON ?auto_412137 ?auto_412138 ) ( ON ?auto_412136 ?auto_412137 ) ( ON ?auto_412135 ?auto_412136 ) ( CLEAR ?auto_412133 ) ( ON ?auto_412134 ?auto_412135 ) ( CLEAR ?auto_412134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_412124 ?auto_412125 ?auto_412126 ?auto_412127 ?auto_412128 ?auto_412129 ?auto_412130 ?auto_412131 ?auto_412132 ?auto_412133 ?auto_412134 )
      ( MAKE-15PILE ?auto_412124 ?auto_412125 ?auto_412126 ?auto_412127 ?auto_412128 ?auto_412129 ?auto_412130 ?auto_412131 ?auto_412132 ?auto_412133 ?auto_412134 ?auto_412135 ?auto_412136 ?auto_412137 ?auto_412138 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412154 - BLOCK
      ?auto_412155 - BLOCK
      ?auto_412156 - BLOCK
      ?auto_412157 - BLOCK
      ?auto_412158 - BLOCK
      ?auto_412159 - BLOCK
      ?auto_412160 - BLOCK
      ?auto_412161 - BLOCK
      ?auto_412162 - BLOCK
      ?auto_412163 - BLOCK
      ?auto_412164 - BLOCK
      ?auto_412165 - BLOCK
      ?auto_412166 - BLOCK
      ?auto_412167 - BLOCK
      ?auto_412168 - BLOCK
    )
    :vars
    (
      ?auto_412169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412168 ?auto_412169 ) ( ON-TABLE ?auto_412154 ) ( ON ?auto_412155 ?auto_412154 ) ( ON ?auto_412156 ?auto_412155 ) ( ON ?auto_412157 ?auto_412156 ) ( ON ?auto_412158 ?auto_412157 ) ( ON ?auto_412159 ?auto_412158 ) ( ON ?auto_412160 ?auto_412159 ) ( ON ?auto_412161 ?auto_412160 ) ( ON ?auto_412162 ?auto_412161 ) ( not ( = ?auto_412154 ?auto_412155 ) ) ( not ( = ?auto_412154 ?auto_412156 ) ) ( not ( = ?auto_412154 ?auto_412157 ) ) ( not ( = ?auto_412154 ?auto_412158 ) ) ( not ( = ?auto_412154 ?auto_412159 ) ) ( not ( = ?auto_412154 ?auto_412160 ) ) ( not ( = ?auto_412154 ?auto_412161 ) ) ( not ( = ?auto_412154 ?auto_412162 ) ) ( not ( = ?auto_412154 ?auto_412163 ) ) ( not ( = ?auto_412154 ?auto_412164 ) ) ( not ( = ?auto_412154 ?auto_412165 ) ) ( not ( = ?auto_412154 ?auto_412166 ) ) ( not ( = ?auto_412154 ?auto_412167 ) ) ( not ( = ?auto_412154 ?auto_412168 ) ) ( not ( = ?auto_412154 ?auto_412169 ) ) ( not ( = ?auto_412155 ?auto_412156 ) ) ( not ( = ?auto_412155 ?auto_412157 ) ) ( not ( = ?auto_412155 ?auto_412158 ) ) ( not ( = ?auto_412155 ?auto_412159 ) ) ( not ( = ?auto_412155 ?auto_412160 ) ) ( not ( = ?auto_412155 ?auto_412161 ) ) ( not ( = ?auto_412155 ?auto_412162 ) ) ( not ( = ?auto_412155 ?auto_412163 ) ) ( not ( = ?auto_412155 ?auto_412164 ) ) ( not ( = ?auto_412155 ?auto_412165 ) ) ( not ( = ?auto_412155 ?auto_412166 ) ) ( not ( = ?auto_412155 ?auto_412167 ) ) ( not ( = ?auto_412155 ?auto_412168 ) ) ( not ( = ?auto_412155 ?auto_412169 ) ) ( not ( = ?auto_412156 ?auto_412157 ) ) ( not ( = ?auto_412156 ?auto_412158 ) ) ( not ( = ?auto_412156 ?auto_412159 ) ) ( not ( = ?auto_412156 ?auto_412160 ) ) ( not ( = ?auto_412156 ?auto_412161 ) ) ( not ( = ?auto_412156 ?auto_412162 ) ) ( not ( = ?auto_412156 ?auto_412163 ) ) ( not ( = ?auto_412156 ?auto_412164 ) ) ( not ( = ?auto_412156 ?auto_412165 ) ) ( not ( = ?auto_412156 ?auto_412166 ) ) ( not ( = ?auto_412156 ?auto_412167 ) ) ( not ( = ?auto_412156 ?auto_412168 ) ) ( not ( = ?auto_412156 ?auto_412169 ) ) ( not ( = ?auto_412157 ?auto_412158 ) ) ( not ( = ?auto_412157 ?auto_412159 ) ) ( not ( = ?auto_412157 ?auto_412160 ) ) ( not ( = ?auto_412157 ?auto_412161 ) ) ( not ( = ?auto_412157 ?auto_412162 ) ) ( not ( = ?auto_412157 ?auto_412163 ) ) ( not ( = ?auto_412157 ?auto_412164 ) ) ( not ( = ?auto_412157 ?auto_412165 ) ) ( not ( = ?auto_412157 ?auto_412166 ) ) ( not ( = ?auto_412157 ?auto_412167 ) ) ( not ( = ?auto_412157 ?auto_412168 ) ) ( not ( = ?auto_412157 ?auto_412169 ) ) ( not ( = ?auto_412158 ?auto_412159 ) ) ( not ( = ?auto_412158 ?auto_412160 ) ) ( not ( = ?auto_412158 ?auto_412161 ) ) ( not ( = ?auto_412158 ?auto_412162 ) ) ( not ( = ?auto_412158 ?auto_412163 ) ) ( not ( = ?auto_412158 ?auto_412164 ) ) ( not ( = ?auto_412158 ?auto_412165 ) ) ( not ( = ?auto_412158 ?auto_412166 ) ) ( not ( = ?auto_412158 ?auto_412167 ) ) ( not ( = ?auto_412158 ?auto_412168 ) ) ( not ( = ?auto_412158 ?auto_412169 ) ) ( not ( = ?auto_412159 ?auto_412160 ) ) ( not ( = ?auto_412159 ?auto_412161 ) ) ( not ( = ?auto_412159 ?auto_412162 ) ) ( not ( = ?auto_412159 ?auto_412163 ) ) ( not ( = ?auto_412159 ?auto_412164 ) ) ( not ( = ?auto_412159 ?auto_412165 ) ) ( not ( = ?auto_412159 ?auto_412166 ) ) ( not ( = ?auto_412159 ?auto_412167 ) ) ( not ( = ?auto_412159 ?auto_412168 ) ) ( not ( = ?auto_412159 ?auto_412169 ) ) ( not ( = ?auto_412160 ?auto_412161 ) ) ( not ( = ?auto_412160 ?auto_412162 ) ) ( not ( = ?auto_412160 ?auto_412163 ) ) ( not ( = ?auto_412160 ?auto_412164 ) ) ( not ( = ?auto_412160 ?auto_412165 ) ) ( not ( = ?auto_412160 ?auto_412166 ) ) ( not ( = ?auto_412160 ?auto_412167 ) ) ( not ( = ?auto_412160 ?auto_412168 ) ) ( not ( = ?auto_412160 ?auto_412169 ) ) ( not ( = ?auto_412161 ?auto_412162 ) ) ( not ( = ?auto_412161 ?auto_412163 ) ) ( not ( = ?auto_412161 ?auto_412164 ) ) ( not ( = ?auto_412161 ?auto_412165 ) ) ( not ( = ?auto_412161 ?auto_412166 ) ) ( not ( = ?auto_412161 ?auto_412167 ) ) ( not ( = ?auto_412161 ?auto_412168 ) ) ( not ( = ?auto_412161 ?auto_412169 ) ) ( not ( = ?auto_412162 ?auto_412163 ) ) ( not ( = ?auto_412162 ?auto_412164 ) ) ( not ( = ?auto_412162 ?auto_412165 ) ) ( not ( = ?auto_412162 ?auto_412166 ) ) ( not ( = ?auto_412162 ?auto_412167 ) ) ( not ( = ?auto_412162 ?auto_412168 ) ) ( not ( = ?auto_412162 ?auto_412169 ) ) ( not ( = ?auto_412163 ?auto_412164 ) ) ( not ( = ?auto_412163 ?auto_412165 ) ) ( not ( = ?auto_412163 ?auto_412166 ) ) ( not ( = ?auto_412163 ?auto_412167 ) ) ( not ( = ?auto_412163 ?auto_412168 ) ) ( not ( = ?auto_412163 ?auto_412169 ) ) ( not ( = ?auto_412164 ?auto_412165 ) ) ( not ( = ?auto_412164 ?auto_412166 ) ) ( not ( = ?auto_412164 ?auto_412167 ) ) ( not ( = ?auto_412164 ?auto_412168 ) ) ( not ( = ?auto_412164 ?auto_412169 ) ) ( not ( = ?auto_412165 ?auto_412166 ) ) ( not ( = ?auto_412165 ?auto_412167 ) ) ( not ( = ?auto_412165 ?auto_412168 ) ) ( not ( = ?auto_412165 ?auto_412169 ) ) ( not ( = ?auto_412166 ?auto_412167 ) ) ( not ( = ?auto_412166 ?auto_412168 ) ) ( not ( = ?auto_412166 ?auto_412169 ) ) ( not ( = ?auto_412167 ?auto_412168 ) ) ( not ( = ?auto_412167 ?auto_412169 ) ) ( not ( = ?auto_412168 ?auto_412169 ) ) ( ON ?auto_412167 ?auto_412168 ) ( ON ?auto_412166 ?auto_412167 ) ( ON ?auto_412165 ?auto_412166 ) ( ON ?auto_412164 ?auto_412165 ) ( CLEAR ?auto_412162 ) ( ON ?auto_412163 ?auto_412164 ) ( CLEAR ?auto_412163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_412154 ?auto_412155 ?auto_412156 ?auto_412157 ?auto_412158 ?auto_412159 ?auto_412160 ?auto_412161 ?auto_412162 ?auto_412163 )
      ( MAKE-15PILE ?auto_412154 ?auto_412155 ?auto_412156 ?auto_412157 ?auto_412158 ?auto_412159 ?auto_412160 ?auto_412161 ?auto_412162 ?auto_412163 ?auto_412164 ?auto_412165 ?auto_412166 ?auto_412167 ?auto_412168 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412185 - BLOCK
      ?auto_412186 - BLOCK
      ?auto_412187 - BLOCK
      ?auto_412188 - BLOCK
      ?auto_412189 - BLOCK
      ?auto_412190 - BLOCK
      ?auto_412191 - BLOCK
      ?auto_412192 - BLOCK
      ?auto_412193 - BLOCK
      ?auto_412194 - BLOCK
      ?auto_412195 - BLOCK
      ?auto_412196 - BLOCK
      ?auto_412197 - BLOCK
      ?auto_412198 - BLOCK
      ?auto_412199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412199 ) ( ON-TABLE ?auto_412185 ) ( ON ?auto_412186 ?auto_412185 ) ( ON ?auto_412187 ?auto_412186 ) ( ON ?auto_412188 ?auto_412187 ) ( ON ?auto_412189 ?auto_412188 ) ( ON ?auto_412190 ?auto_412189 ) ( ON ?auto_412191 ?auto_412190 ) ( ON ?auto_412192 ?auto_412191 ) ( ON ?auto_412193 ?auto_412192 ) ( not ( = ?auto_412185 ?auto_412186 ) ) ( not ( = ?auto_412185 ?auto_412187 ) ) ( not ( = ?auto_412185 ?auto_412188 ) ) ( not ( = ?auto_412185 ?auto_412189 ) ) ( not ( = ?auto_412185 ?auto_412190 ) ) ( not ( = ?auto_412185 ?auto_412191 ) ) ( not ( = ?auto_412185 ?auto_412192 ) ) ( not ( = ?auto_412185 ?auto_412193 ) ) ( not ( = ?auto_412185 ?auto_412194 ) ) ( not ( = ?auto_412185 ?auto_412195 ) ) ( not ( = ?auto_412185 ?auto_412196 ) ) ( not ( = ?auto_412185 ?auto_412197 ) ) ( not ( = ?auto_412185 ?auto_412198 ) ) ( not ( = ?auto_412185 ?auto_412199 ) ) ( not ( = ?auto_412186 ?auto_412187 ) ) ( not ( = ?auto_412186 ?auto_412188 ) ) ( not ( = ?auto_412186 ?auto_412189 ) ) ( not ( = ?auto_412186 ?auto_412190 ) ) ( not ( = ?auto_412186 ?auto_412191 ) ) ( not ( = ?auto_412186 ?auto_412192 ) ) ( not ( = ?auto_412186 ?auto_412193 ) ) ( not ( = ?auto_412186 ?auto_412194 ) ) ( not ( = ?auto_412186 ?auto_412195 ) ) ( not ( = ?auto_412186 ?auto_412196 ) ) ( not ( = ?auto_412186 ?auto_412197 ) ) ( not ( = ?auto_412186 ?auto_412198 ) ) ( not ( = ?auto_412186 ?auto_412199 ) ) ( not ( = ?auto_412187 ?auto_412188 ) ) ( not ( = ?auto_412187 ?auto_412189 ) ) ( not ( = ?auto_412187 ?auto_412190 ) ) ( not ( = ?auto_412187 ?auto_412191 ) ) ( not ( = ?auto_412187 ?auto_412192 ) ) ( not ( = ?auto_412187 ?auto_412193 ) ) ( not ( = ?auto_412187 ?auto_412194 ) ) ( not ( = ?auto_412187 ?auto_412195 ) ) ( not ( = ?auto_412187 ?auto_412196 ) ) ( not ( = ?auto_412187 ?auto_412197 ) ) ( not ( = ?auto_412187 ?auto_412198 ) ) ( not ( = ?auto_412187 ?auto_412199 ) ) ( not ( = ?auto_412188 ?auto_412189 ) ) ( not ( = ?auto_412188 ?auto_412190 ) ) ( not ( = ?auto_412188 ?auto_412191 ) ) ( not ( = ?auto_412188 ?auto_412192 ) ) ( not ( = ?auto_412188 ?auto_412193 ) ) ( not ( = ?auto_412188 ?auto_412194 ) ) ( not ( = ?auto_412188 ?auto_412195 ) ) ( not ( = ?auto_412188 ?auto_412196 ) ) ( not ( = ?auto_412188 ?auto_412197 ) ) ( not ( = ?auto_412188 ?auto_412198 ) ) ( not ( = ?auto_412188 ?auto_412199 ) ) ( not ( = ?auto_412189 ?auto_412190 ) ) ( not ( = ?auto_412189 ?auto_412191 ) ) ( not ( = ?auto_412189 ?auto_412192 ) ) ( not ( = ?auto_412189 ?auto_412193 ) ) ( not ( = ?auto_412189 ?auto_412194 ) ) ( not ( = ?auto_412189 ?auto_412195 ) ) ( not ( = ?auto_412189 ?auto_412196 ) ) ( not ( = ?auto_412189 ?auto_412197 ) ) ( not ( = ?auto_412189 ?auto_412198 ) ) ( not ( = ?auto_412189 ?auto_412199 ) ) ( not ( = ?auto_412190 ?auto_412191 ) ) ( not ( = ?auto_412190 ?auto_412192 ) ) ( not ( = ?auto_412190 ?auto_412193 ) ) ( not ( = ?auto_412190 ?auto_412194 ) ) ( not ( = ?auto_412190 ?auto_412195 ) ) ( not ( = ?auto_412190 ?auto_412196 ) ) ( not ( = ?auto_412190 ?auto_412197 ) ) ( not ( = ?auto_412190 ?auto_412198 ) ) ( not ( = ?auto_412190 ?auto_412199 ) ) ( not ( = ?auto_412191 ?auto_412192 ) ) ( not ( = ?auto_412191 ?auto_412193 ) ) ( not ( = ?auto_412191 ?auto_412194 ) ) ( not ( = ?auto_412191 ?auto_412195 ) ) ( not ( = ?auto_412191 ?auto_412196 ) ) ( not ( = ?auto_412191 ?auto_412197 ) ) ( not ( = ?auto_412191 ?auto_412198 ) ) ( not ( = ?auto_412191 ?auto_412199 ) ) ( not ( = ?auto_412192 ?auto_412193 ) ) ( not ( = ?auto_412192 ?auto_412194 ) ) ( not ( = ?auto_412192 ?auto_412195 ) ) ( not ( = ?auto_412192 ?auto_412196 ) ) ( not ( = ?auto_412192 ?auto_412197 ) ) ( not ( = ?auto_412192 ?auto_412198 ) ) ( not ( = ?auto_412192 ?auto_412199 ) ) ( not ( = ?auto_412193 ?auto_412194 ) ) ( not ( = ?auto_412193 ?auto_412195 ) ) ( not ( = ?auto_412193 ?auto_412196 ) ) ( not ( = ?auto_412193 ?auto_412197 ) ) ( not ( = ?auto_412193 ?auto_412198 ) ) ( not ( = ?auto_412193 ?auto_412199 ) ) ( not ( = ?auto_412194 ?auto_412195 ) ) ( not ( = ?auto_412194 ?auto_412196 ) ) ( not ( = ?auto_412194 ?auto_412197 ) ) ( not ( = ?auto_412194 ?auto_412198 ) ) ( not ( = ?auto_412194 ?auto_412199 ) ) ( not ( = ?auto_412195 ?auto_412196 ) ) ( not ( = ?auto_412195 ?auto_412197 ) ) ( not ( = ?auto_412195 ?auto_412198 ) ) ( not ( = ?auto_412195 ?auto_412199 ) ) ( not ( = ?auto_412196 ?auto_412197 ) ) ( not ( = ?auto_412196 ?auto_412198 ) ) ( not ( = ?auto_412196 ?auto_412199 ) ) ( not ( = ?auto_412197 ?auto_412198 ) ) ( not ( = ?auto_412197 ?auto_412199 ) ) ( not ( = ?auto_412198 ?auto_412199 ) ) ( ON ?auto_412198 ?auto_412199 ) ( ON ?auto_412197 ?auto_412198 ) ( ON ?auto_412196 ?auto_412197 ) ( ON ?auto_412195 ?auto_412196 ) ( CLEAR ?auto_412193 ) ( ON ?auto_412194 ?auto_412195 ) ( CLEAR ?auto_412194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_412185 ?auto_412186 ?auto_412187 ?auto_412188 ?auto_412189 ?auto_412190 ?auto_412191 ?auto_412192 ?auto_412193 ?auto_412194 )
      ( MAKE-15PILE ?auto_412185 ?auto_412186 ?auto_412187 ?auto_412188 ?auto_412189 ?auto_412190 ?auto_412191 ?auto_412192 ?auto_412193 ?auto_412194 ?auto_412195 ?auto_412196 ?auto_412197 ?auto_412198 ?auto_412199 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412215 - BLOCK
      ?auto_412216 - BLOCK
      ?auto_412217 - BLOCK
      ?auto_412218 - BLOCK
      ?auto_412219 - BLOCK
      ?auto_412220 - BLOCK
      ?auto_412221 - BLOCK
      ?auto_412222 - BLOCK
      ?auto_412223 - BLOCK
      ?auto_412224 - BLOCK
      ?auto_412225 - BLOCK
      ?auto_412226 - BLOCK
      ?auto_412227 - BLOCK
      ?auto_412228 - BLOCK
      ?auto_412229 - BLOCK
    )
    :vars
    (
      ?auto_412230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412229 ?auto_412230 ) ( ON-TABLE ?auto_412215 ) ( ON ?auto_412216 ?auto_412215 ) ( ON ?auto_412217 ?auto_412216 ) ( ON ?auto_412218 ?auto_412217 ) ( ON ?auto_412219 ?auto_412218 ) ( ON ?auto_412220 ?auto_412219 ) ( ON ?auto_412221 ?auto_412220 ) ( ON ?auto_412222 ?auto_412221 ) ( not ( = ?auto_412215 ?auto_412216 ) ) ( not ( = ?auto_412215 ?auto_412217 ) ) ( not ( = ?auto_412215 ?auto_412218 ) ) ( not ( = ?auto_412215 ?auto_412219 ) ) ( not ( = ?auto_412215 ?auto_412220 ) ) ( not ( = ?auto_412215 ?auto_412221 ) ) ( not ( = ?auto_412215 ?auto_412222 ) ) ( not ( = ?auto_412215 ?auto_412223 ) ) ( not ( = ?auto_412215 ?auto_412224 ) ) ( not ( = ?auto_412215 ?auto_412225 ) ) ( not ( = ?auto_412215 ?auto_412226 ) ) ( not ( = ?auto_412215 ?auto_412227 ) ) ( not ( = ?auto_412215 ?auto_412228 ) ) ( not ( = ?auto_412215 ?auto_412229 ) ) ( not ( = ?auto_412215 ?auto_412230 ) ) ( not ( = ?auto_412216 ?auto_412217 ) ) ( not ( = ?auto_412216 ?auto_412218 ) ) ( not ( = ?auto_412216 ?auto_412219 ) ) ( not ( = ?auto_412216 ?auto_412220 ) ) ( not ( = ?auto_412216 ?auto_412221 ) ) ( not ( = ?auto_412216 ?auto_412222 ) ) ( not ( = ?auto_412216 ?auto_412223 ) ) ( not ( = ?auto_412216 ?auto_412224 ) ) ( not ( = ?auto_412216 ?auto_412225 ) ) ( not ( = ?auto_412216 ?auto_412226 ) ) ( not ( = ?auto_412216 ?auto_412227 ) ) ( not ( = ?auto_412216 ?auto_412228 ) ) ( not ( = ?auto_412216 ?auto_412229 ) ) ( not ( = ?auto_412216 ?auto_412230 ) ) ( not ( = ?auto_412217 ?auto_412218 ) ) ( not ( = ?auto_412217 ?auto_412219 ) ) ( not ( = ?auto_412217 ?auto_412220 ) ) ( not ( = ?auto_412217 ?auto_412221 ) ) ( not ( = ?auto_412217 ?auto_412222 ) ) ( not ( = ?auto_412217 ?auto_412223 ) ) ( not ( = ?auto_412217 ?auto_412224 ) ) ( not ( = ?auto_412217 ?auto_412225 ) ) ( not ( = ?auto_412217 ?auto_412226 ) ) ( not ( = ?auto_412217 ?auto_412227 ) ) ( not ( = ?auto_412217 ?auto_412228 ) ) ( not ( = ?auto_412217 ?auto_412229 ) ) ( not ( = ?auto_412217 ?auto_412230 ) ) ( not ( = ?auto_412218 ?auto_412219 ) ) ( not ( = ?auto_412218 ?auto_412220 ) ) ( not ( = ?auto_412218 ?auto_412221 ) ) ( not ( = ?auto_412218 ?auto_412222 ) ) ( not ( = ?auto_412218 ?auto_412223 ) ) ( not ( = ?auto_412218 ?auto_412224 ) ) ( not ( = ?auto_412218 ?auto_412225 ) ) ( not ( = ?auto_412218 ?auto_412226 ) ) ( not ( = ?auto_412218 ?auto_412227 ) ) ( not ( = ?auto_412218 ?auto_412228 ) ) ( not ( = ?auto_412218 ?auto_412229 ) ) ( not ( = ?auto_412218 ?auto_412230 ) ) ( not ( = ?auto_412219 ?auto_412220 ) ) ( not ( = ?auto_412219 ?auto_412221 ) ) ( not ( = ?auto_412219 ?auto_412222 ) ) ( not ( = ?auto_412219 ?auto_412223 ) ) ( not ( = ?auto_412219 ?auto_412224 ) ) ( not ( = ?auto_412219 ?auto_412225 ) ) ( not ( = ?auto_412219 ?auto_412226 ) ) ( not ( = ?auto_412219 ?auto_412227 ) ) ( not ( = ?auto_412219 ?auto_412228 ) ) ( not ( = ?auto_412219 ?auto_412229 ) ) ( not ( = ?auto_412219 ?auto_412230 ) ) ( not ( = ?auto_412220 ?auto_412221 ) ) ( not ( = ?auto_412220 ?auto_412222 ) ) ( not ( = ?auto_412220 ?auto_412223 ) ) ( not ( = ?auto_412220 ?auto_412224 ) ) ( not ( = ?auto_412220 ?auto_412225 ) ) ( not ( = ?auto_412220 ?auto_412226 ) ) ( not ( = ?auto_412220 ?auto_412227 ) ) ( not ( = ?auto_412220 ?auto_412228 ) ) ( not ( = ?auto_412220 ?auto_412229 ) ) ( not ( = ?auto_412220 ?auto_412230 ) ) ( not ( = ?auto_412221 ?auto_412222 ) ) ( not ( = ?auto_412221 ?auto_412223 ) ) ( not ( = ?auto_412221 ?auto_412224 ) ) ( not ( = ?auto_412221 ?auto_412225 ) ) ( not ( = ?auto_412221 ?auto_412226 ) ) ( not ( = ?auto_412221 ?auto_412227 ) ) ( not ( = ?auto_412221 ?auto_412228 ) ) ( not ( = ?auto_412221 ?auto_412229 ) ) ( not ( = ?auto_412221 ?auto_412230 ) ) ( not ( = ?auto_412222 ?auto_412223 ) ) ( not ( = ?auto_412222 ?auto_412224 ) ) ( not ( = ?auto_412222 ?auto_412225 ) ) ( not ( = ?auto_412222 ?auto_412226 ) ) ( not ( = ?auto_412222 ?auto_412227 ) ) ( not ( = ?auto_412222 ?auto_412228 ) ) ( not ( = ?auto_412222 ?auto_412229 ) ) ( not ( = ?auto_412222 ?auto_412230 ) ) ( not ( = ?auto_412223 ?auto_412224 ) ) ( not ( = ?auto_412223 ?auto_412225 ) ) ( not ( = ?auto_412223 ?auto_412226 ) ) ( not ( = ?auto_412223 ?auto_412227 ) ) ( not ( = ?auto_412223 ?auto_412228 ) ) ( not ( = ?auto_412223 ?auto_412229 ) ) ( not ( = ?auto_412223 ?auto_412230 ) ) ( not ( = ?auto_412224 ?auto_412225 ) ) ( not ( = ?auto_412224 ?auto_412226 ) ) ( not ( = ?auto_412224 ?auto_412227 ) ) ( not ( = ?auto_412224 ?auto_412228 ) ) ( not ( = ?auto_412224 ?auto_412229 ) ) ( not ( = ?auto_412224 ?auto_412230 ) ) ( not ( = ?auto_412225 ?auto_412226 ) ) ( not ( = ?auto_412225 ?auto_412227 ) ) ( not ( = ?auto_412225 ?auto_412228 ) ) ( not ( = ?auto_412225 ?auto_412229 ) ) ( not ( = ?auto_412225 ?auto_412230 ) ) ( not ( = ?auto_412226 ?auto_412227 ) ) ( not ( = ?auto_412226 ?auto_412228 ) ) ( not ( = ?auto_412226 ?auto_412229 ) ) ( not ( = ?auto_412226 ?auto_412230 ) ) ( not ( = ?auto_412227 ?auto_412228 ) ) ( not ( = ?auto_412227 ?auto_412229 ) ) ( not ( = ?auto_412227 ?auto_412230 ) ) ( not ( = ?auto_412228 ?auto_412229 ) ) ( not ( = ?auto_412228 ?auto_412230 ) ) ( not ( = ?auto_412229 ?auto_412230 ) ) ( ON ?auto_412228 ?auto_412229 ) ( ON ?auto_412227 ?auto_412228 ) ( ON ?auto_412226 ?auto_412227 ) ( ON ?auto_412225 ?auto_412226 ) ( ON ?auto_412224 ?auto_412225 ) ( CLEAR ?auto_412222 ) ( ON ?auto_412223 ?auto_412224 ) ( CLEAR ?auto_412223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_412215 ?auto_412216 ?auto_412217 ?auto_412218 ?auto_412219 ?auto_412220 ?auto_412221 ?auto_412222 ?auto_412223 )
      ( MAKE-15PILE ?auto_412215 ?auto_412216 ?auto_412217 ?auto_412218 ?auto_412219 ?auto_412220 ?auto_412221 ?auto_412222 ?auto_412223 ?auto_412224 ?auto_412225 ?auto_412226 ?auto_412227 ?auto_412228 ?auto_412229 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412246 - BLOCK
      ?auto_412247 - BLOCK
      ?auto_412248 - BLOCK
      ?auto_412249 - BLOCK
      ?auto_412250 - BLOCK
      ?auto_412251 - BLOCK
      ?auto_412252 - BLOCK
      ?auto_412253 - BLOCK
      ?auto_412254 - BLOCK
      ?auto_412255 - BLOCK
      ?auto_412256 - BLOCK
      ?auto_412257 - BLOCK
      ?auto_412258 - BLOCK
      ?auto_412259 - BLOCK
      ?auto_412260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412260 ) ( ON-TABLE ?auto_412246 ) ( ON ?auto_412247 ?auto_412246 ) ( ON ?auto_412248 ?auto_412247 ) ( ON ?auto_412249 ?auto_412248 ) ( ON ?auto_412250 ?auto_412249 ) ( ON ?auto_412251 ?auto_412250 ) ( ON ?auto_412252 ?auto_412251 ) ( ON ?auto_412253 ?auto_412252 ) ( not ( = ?auto_412246 ?auto_412247 ) ) ( not ( = ?auto_412246 ?auto_412248 ) ) ( not ( = ?auto_412246 ?auto_412249 ) ) ( not ( = ?auto_412246 ?auto_412250 ) ) ( not ( = ?auto_412246 ?auto_412251 ) ) ( not ( = ?auto_412246 ?auto_412252 ) ) ( not ( = ?auto_412246 ?auto_412253 ) ) ( not ( = ?auto_412246 ?auto_412254 ) ) ( not ( = ?auto_412246 ?auto_412255 ) ) ( not ( = ?auto_412246 ?auto_412256 ) ) ( not ( = ?auto_412246 ?auto_412257 ) ) ( not ( = ?auto_412246 ?auto_412258 ) ) ( not ( = ?auto_412246 ?auto_412259 ) ) ( not ( = ?auto_412246 ?auto_412260 ) ) ( not ( = ?auto_412247 ?auto_412248 ) ) ( not ( = ?auto_412247 ?auto_412249 ) ) ( not ( = ?auto_412247 ?auto_412250 ) ) ( not ( = ?auto_412247 ?auto_412251 ) ) ( not ( = ?auto_412247 ?auto_412252 ) ) ( not ( = ?auto_412247 ?auto_412253 ) ) ( not ( = ?auto_412247 ?auto_412254 ) ) ( not ( = ?auto_412247 ?auto_412255 ) ) ( not ( = ?auto_412247 ?auto_412256 ) ) ( not ( = ?auto_412247 ?auto_412257 ) ) ( not ( = ?auto_412247 ?auto_412258 ) ) ( not ( = ?auto_412247 ?auto_412259 ) ) ( not ( = ?auto_412247 ?auto_412260 ) ) ( not ( = ?auto_412248 ?auto_412249 ) ) ( not ( = ?auto_412248 ?auto_412250 ) ) ( not ( = ?auto_412248 ?auto_412251 ) ) ( not ( = ?auto_412248 ?auto_412252 ) ) ( not ( = ?auto_412248 ?auto_412253 ) ) ( not ( = ?auto_412248 ?auto_412254 ) ) ( not ( = ?auto_412248 ?auto_412255 ) ) ( not ( = ?auto_412248 ?auto_412256 ) ) ( not ( = ?auto_412248 ?auto_412257 ) ) ( not ( = ?auto_412248 ?auto_412258 ) ) ( not ( = ?auto_412248 ?auto_412259 ) ) ( not ( = ?auto_412248 ?auto_412260 ) ) ( not ( = ?auto_412249 ?auto_412250 ) ) ( not ( = ?auto_412249 ?auto_412251 ) ) ( not ( = ?auto_412249 ?auto_412252 ) ) ( not ( = ?auto_412249 ?auto_412253 ) ) ( not ( = ?auto_412249 ?auto_412254 ) ) ( not ( = ?auto_412249 ?auto_412255 ) ) ( not ( = ?auto_412249 ?auto_412256 ) ) ( not ( = ?auto_412249 ?auto_412257 ) ) ( not ( = ?auto_412249 ?auto_412258 ) ) ( not ( = ?auto_412249 ?auto_412259 ) ) ( not ( = ?auto_412249 ?auto_412260 ) ) ( not ( = ?auto_412250 ?auto_412251 ) ) ( not ( = ?auto_412250 ?auto_412252 ) ) ( not ( = ?auto_412250 ?auto_412253 ) ) ( not ( = ?auto_412250 ?auto_412254 ) ) ( not ( = ?auto_412250 ?auto_412255 ) ) ( not ( = ?auto_412250 ?auto_412256 ) ) ( not ( = ?auto_412250 ?auto_412257 ) ) ( not ( = ?auto_412250 ?auto_412258 ) ) ( not ( = ?auto_412250 ?auto_412259 ) ) ( not ( = ?auto_412250 ?auto_412260 ) ) ( not ( = ?auto_412251 ?auto_412252 ) ) ( not ( = ?auto_412251 ?auto_412253 ) ) ( not ( = ?auto_412251 ?auto_412254 ) ) ( not ( = ?auto_412251 ?auto_412255 ) ) ( not ( = ?auto_412251 ?auto_412256 ) ) ( not ( = ?auto_412251 ?auto_412257 ) ) ( not ( = ?auto_412251 ?auto_412258 ) ) ( not ( = ?auto_412251 ?auto_412259 ) ) ( not ( = ?auto_412251 ?auto_412260 ) ) ( not ( = ?auto_412252 ?auto_412253 ) ) ( not ( = ?auto_412252 ?auto_412254 ) ) ( not ( = ?auto_412252 ?auto_412255 ) ) ( not ( = ?auto_412252 ?auto_412256 ) ) ( not ( = ?auto_412252 ?auto_412257 ) ) ( not ( = ?auto_412252 ?auto_412258 ) ) ( not ( = ?auto_412252 ?auto_412259 ) ) ( not ( = ?auto_412252 ?auto_412260 ) ) ( not ( = ?auto_412253 ?auto_412254 ) ) ( not ( = ?auto_412253 ?auto_412255 ) ) ( not ( = ?auto_412253 ?auto_412256 ) ) ( not ( = ?auto_412253 ?auto_412257 ) ) ( not ( = ?auto_412253 ?auto_412258 ) ) ( not ( = ?auto_412253 ?auto_412259 ) ) ( not ( = ?auto_412253 ?auto_412260 ) ) ( not ( = ?auto_412254 ?auto_412255 ) ) ( not ( = ?auto_412254 ?auto_412256 ) ) ( not ( = ?auto_412254 ?auto_412257 ) ) ( not ( = ?auto_412254 ?auto_412258 ) ) ( not ( = ?auto_412254 ?auto_412259 ) ) ( not ( = ?auto_412254 ?auto_412260 ) ) ( not ( = ?auto_412255 ?auto_412256 ) ) ( not ( = ?auto_412255 ?auto_412257 ) ) ( not ( = ?auto_412255 ?auto_412258 ) ) ( not ( = ?auto_412255 ?auto_412259 ) ) ( not ( = ?auto_412255 ?auto_412260 ) ) ( not ( = ?auto_412256 ?auto_412257 ) ) ( not ( = ?auto_412256 ?auto_412258 ) ) ( not ( = ?auto_412256 ?auto_412259 ) ) ( not ( = ?auto_412256 ?auto_412260 ) ) ( not ( = ?auto_412257 ?auto_412258 ) ) ( not ( = ?auto_412257 ?auto_412259 ) ) ( not ( = ?auto_412257 ?auto_412260 ) ) ( not ( = ?auto_412258 ?auto_412259 ) ) ( not ( = ?auto_412258 ?auto_412260 ) ) ( not ( = ?auto_412259 ?auto_412260 ) ) ( ON ?auto_412259 ?auto_412260 ) ( ON ?auto_412258 ?auto_412259 ) ( ON ?auto_412257 ?auto_412258 ) ( ON ?auto_412256 ?auto_412257 ) ( ON ?auto_412255 ?auto_412256 ) ( CLEAR ?auto_412253 ) ( ON ?auto_412254 ?auto_412255 ) ( CLEAR ?auto_412254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_412246 ?auto_412247 ?auto_412248 ?auto_412249 ?auto_412250 ?auto_412251 ?auto_412252 ?auto_412253 ?auto_412254 )
      ( MAKE-15PILE ?auto_412246 ?auto_412247 ?auto_412248 ?auto_412249 ?auto_412250 ?auto_412251 ?auto_412252 ?auto_412253 ?auto_412254 ?auto_412255 ?auto_412256 ?auto_412257 ?auto_412258 ?auto_412259 ?auto_412260 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412276 - BLOCK
      ?auto_412277 - BLOCK
      ?auto_412278 - BLOCK
      ?auto_412279 - BLOCK
      ?auto_412280 - BLOCK
      ?auto_412281 - BLOCK
      ?auto_412282 - BLOCK
      ?auto_412283 - BLOCK
      ?auto_412284 - BLOCK
      ?auto_412285 - BLOCK
      ?auto_412286 - BLOCK
      ?auto_412287 - BLOCK
      ?auto_412288 - BLOCK
      ?auto_412289 - BLOCK
      ?auto_412290 - BLOCK
    )
    :vars
    (
      ?auto_412291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412290 ?auto_412291 ) ( ON-TABLE ?auto_412276 ) ( ON ?auto_412277 ?auto_412276 ) ( ON ?auto_412278 ?auto_412277 ) ( ON ?auto_412279 ?auto_412278 ) ( ON ?auto_412280 ?auto_412279 ) ( ON ?auto_412281 ?auto_412280 ) ( ON ?auto_412282 ?auto_412281 ) ( not ( = ?auto_412276 ?auto_412277 ) ) ( not ( = ?auto_412276 ?auto_412278 ) ) ( not ( = ?auto_412276 ?auto_412279 ) ) ( not ( = ?auto_412276 ?auto_412280 ) ) ( not ( = ?auto_412276 ?auto_412281 ) ) ( not ( = ?auto_412276 ?auto_412282 ) ) ( not ( = ?auto_412276 ?auto_412283 ) ) ( not ( = ?auto_412276 ?auto_412284 ) ) ( not ( = ?auto_412276 ?auto_412285 ) ) ( not ( = ?auto_412276 ?auto_412286 ) ) ( not ( = ?auto_412276 ?auto_412287 ) ) ( not ( = ?auto_412276 ?auto_412288 ) ) ( not ( = ?auto_412276 ?auto_412289 ) ) ( not ( = ?auto_412276 ?auto_412290 ) ) ( not ( = ?auto_412276 ?auto_412291 ) ) ( not ( = ?auto_412277 ?auto_412278 ) ) ( not ( = ?auto_412277 ?auto_412279 ) ) ( not ( = ?auto_412277 ?auto_412280 ) ) ( not ( = ?auto_412277 ?auto_412281 ) ) ( not ( = ?auto_412277 ?auto_412282 ) ) ( not ( = ?auto_412277 ?auto_412283 ) ) ( not ( = ?auto_412277 ?auto_412284 ) ) ( not ( = ?auto_412277 ?auto_412285 ) ) ( not ( = ?auto_412277 ?auto_412286 ) ) ( not ( = ?auto_412277 ?auto_412287 ) ) ( not ( = ?auto_412277 ?auto_412288 ) ) ( not ( = ?auto_412277 ?auto_412289 ) ) ( not ( = ?auto_412277 ?auto_412290 ) ) ( not ( = ?auto_412277 ?auto_412291 ) ) ( not ( = ?auto_412278 ?auto_412279 ) ) ( not ( = ?auto_412278 ?auto_412280 ) ) ( not ( = ?auto_412278 ?auto_412281 ) ) ( not ( = ?auto_412278 ?auto_412282 ) ) ( not ( = ?auto_412278 ?auto_412283 ) ) ( not ( = ?auto_412278 ?auto_412284 ) ) ( not ( = ?auto_412278 ?auto_412285 ) ) ( not ( = ?auto_412278 ?auto_412286 ) ) ( not ( = ?auto_412278 ?auto_412287 ) ) ( not ( = ?auto_412278 ?auto_412288 ) ) ( not ( = ?auto_412278 ?auto_412289 ) ) ( not ( = ?auto_412278 ?auto_412290 ) ) ( not ( = ?auto_412278 ?auto_412291 ) ) ( not ( = ?auto_412279 ?auto_412280 ) ) ( not ( = ?auto_412279 ?auto_412281 ) ) ( not ( = ?auto_412279 ?auto_412282 ) ) ( not ( = ?auto_412279 ?auto_412283 ) ) ( not ( = ?auto_412279 ?auto_412284 ) ) ( not ( = ?auto_412279 ?auto_412285 ) ) ( not ( = ?auto_412279 ?auto_412286 ) ) ( not ( = ?auto_412279 ?auto_412287 ) ) ( not ( = ?auto_412279 ?auto_412288 ) ) ( not ( = ?auto_412279 ?auto_412289 ) ) ( not ( = ?auto_412279 ?auto_412290 ) ) ( not ( = ?auto_412279 ?auto_412291 ) ) ( not ( = ?auto_412280 ?auto_412281 ) ) ( not ( = ?auto_412280 ?auto_412282 ) ) ( not ( = ?auto_412280 ?auto_412283 ) ) ( not ( = ?auto_412280 ?auto_412284 ) ) ( not ( = ?auto_412280 ?auto_412285 ) ) ( not ( = ?auto_412280 ?auto_412286 ) ) ( not ( = ?auto_412280 ?auto_412287 ) ) ( not ( = ?auto_412280 ?auto_412288 ) ) ( not ( = ?auto_412280 ?auto_412289 ) ) ( not ( = ?auto_412280 ?auto_412290 ) ) ( not ( = ?auto_412280 ?auto_412291 ) ) ( not ( = ?auto_412281 ?auto_412282 ) ) ( not ( = ?auto_412281 ?auto_412283 ) ) ( not ( = ?auto_412281 ?auto_412284 ) ) ( not ( = ?auto_412281 ?auto_412285 ) ) ( not ( = ?auto_412281 ?auto_412286 ) ) ( not ( = ?auto_412281 ?auto_412287 ) ) ( not ( = ?auto_412281 ?auto_412288 ) ) ( not ( = ?auto_412281 ?auto_412289 ) ) ( not ( = ?auto_412281 ?auto_412290 ) ) ( not ( = ?auto_412281 ?auto_412291 ) ) ( not ( = ?auto_412282 ?auto_412283 ) ) ( not ( = ?auto_412282 ?auto_412284 ) ) ( not ( = ?auto_412282 ?auto_412285 ) ) ( not ( = ?auto_412282 ?auto_412286 ) ) ( not ( = ?auto_412282 ?auto_412287 ) ) ( not ( = ?auto_412282 ?auto_412288 ) ) ( not ( = ?auto_412282 ?auto_412289 ) ) ( not ( = ?auto_412282 ?auto_412290 ) ) ( not ( = ?auto_412282 ?auto_412291 ) ) ( not ( = ?auto_412283 ?auto_412284 ) ) ( not ( = ?auto_412283 ?auto_412285 ) ) ( not ( = ?auto_412283 ?auto_412286 ) ) ( not ( = ?auto_412283 ?auto_412287 ) ) ( not ( = ?auto_412283 ?auto_412288 ) ) ( not ( = ?auto_412283 ?auto_412289 ) ) ( not ( = ?auto_412283 ?auto_412290 ) ) ( not ( = ?auto_412283 ?auto_412291 ) ) ( not ( = ?auto_412284 ?auto_412285 ) ) ( not ( = ?auto_412284 ?auto_412286 ) ) ( not ( = ?auto_412284 ?auto_412287 ) ) ( not ( = ?auto_412284 ?auto_412288 ) ) ( not ( = ?auto_412284 ?auto_412289 ) ) ( not ( = ?auto_412284 ?auto_412290 ) ) ( not ( = ?auto_412284 ?auto_412291 ) ) ( not ( = ?auto_412285 ?auto_412286 ) ) ( not ( = ?auto_412285 ?auto_412287 ) ) ( not ( = ?auto_412285 ?auto_412288 ) ) ( not ( = ?auto_412285 ?auto_412289 ) ) ( not ( = ?auto_412285 ?auto_412290 ) ) ( not ( = ?auto_412285 ?auto_412291 ) ) ( not ( = ?auto_412286 ?auto_412287 ) ) ( not ( = ?auto_412286 ?auto_412288 ) ) ( not ( = ?auto_412286 ?auto_412289 ) ) ( not ( = ?auto_412286 ?auto_412290 ) ) ( not ( = ?auto_412286 ?auto_412291 ) ) ( not ( = ?auto_412287 ?auto_412288 ) ) ( not ( = ?auto_412287 ?auto_412289 ) ) ( not ( = ?auto_412287 ?auto_412290 ) ) ( not ( = ?auto_412287 ?auto_412291 ) ) ( not ( = ?auto_412288 ?auto_412289 ) ) ( not ( = ?auto_412288 ?auto_412290 ) ) ( not ( = ?auto_412288 ?auto_412291 ) ) ( not ( = ?auto_412289 ?auto_412290 ) ) ( not ( = ?auto_412289 ?auto_412291 ) ) ( not ( = ?auto_412290 ?auto_412291 ) ) ( ON ?auto_412289 ?auto_412290 ) ( ON ?auto_412288 ?auto_412289 ) ( ON ?auto_412287 ?auto_412288 ) ( ON ?auto_412286 ?auto_412287 ) ( ON ?auto_412285 ?auto_412286 ) ( ON ?auto_412284 ?auto_412285 ) ( CLEAR ?auto_412282 ) ( ON ?auto_412283 ?auto_412284 ) ( CLEAR ?auto_412283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_412276 ?auto_412277 ?auto_412278 ?auto_412279 ?auto_412280 ?auto_412281 ?auto_412282 ?auto_412283 )
      ( MAKE-15PILE ?auto_412276 ?auto_412277 ?auto_412278 ?auto_412279 ?auto_412280 ?auto_412281 ?auto_412282 ?auto_412283 ?auto_412284 ?auto_412285 ?auto_412286 ?auto_412287 ?auto_412288 ?auto_412289 ?auto_412290 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412307 - BLOCK
      ?auto_412308 - BLOCK
      ?auto_412309 - BLOCK
      ?auto_412310 - BLOCK
      ?auto_412311 - BLOCK
      ?auto_412312 - BLOCK
      ?auto_412313 - BLOCK
      ?auto_412314 - BLOCK
      ?auto_412315 - BLOCK
      ?auto_412316 - BLOCK
      ?auto_412317 - BLOCK
      ?auto_412318 - BLOCK
      ?auto_412319 - BLOCK
      ?auto_412320 - BLOCK
      ?auto_412321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412321 ) ( ON-TABLE ?auto_412307 ) ( ON ?auto_412308 ?auto_412307 ) ( ON ?auto_412309 ?auto_412308 ) ( ON ?auto_412310 ?auto_412309 ) ( ON ?auto_412311 ?auto_412310 ) ( ON ?auto_412312 ?auto_412311 ) ( ON ?auto_412313 ?auto_412312 ) ( not ( = ?auto_412307 ?auto_412308 ) ) ( not ( = ?auto_412307 ?auto_412309 ) ) ( not ( = ?auto_412307 ?auto_412310 ) ) ( not ( = ?auto_412307 ?auto_412311 ) ) ( not ( = ?auto_412307 ?auto_412312 ) ) ( not ( = ?auto_412307 ?auto_412313 ) ) ( not ( = ?auto_412307 ?auto_412314 ) ) ( not ( = ?auto_412307 ?auto_412315 ) ) ( not ( = ?auto_412307 ?auto_412316 ) ) ( not ( = ?auto_412307 ?auto_412317 ) ) ( not ( = ?auto_412307 ?auto_412318 ) ) ( not ( = ?auto_412307 ?auto_412319 ) ) ( not ( = ?auto_412307 ?auto_412320 ) ) ( not ( = ?auto_412307 ?auto_412321 ) ) ( not ( = ?auto_412308 ?auto_412309 ) ) ( not ( = ?auto_412308 ?auto_412310 ) ) ( not ( = ?auto_412308 ?auto_412311 ) ) ( not ( = ?auto_412308 ?auto_412312 ) ) ( not ( = ?auto_412308 ?auto_412313 ) ) ( not ( = ?auto_412308 ?auto_412314 ) ) ( not ( = ?auto_412308 ?auto_412315 ) ) ( not ( = ?auto_412308 ?auto_412316 ) ) ( not ( = ?auto_412308 ?auto_412317 ) ) ( not ( = ?auto_412308 ?auto_412318 ) ) ( not ( = ?auto_412308 ?auto_412319 ) ) ( not ( = ?auto_412308 ?auto_412320 ) ) ( not ( = ?auto_412308 ?auto_412321 ) ) ( not ( = ?auto_412309 ?auto_412310 ) ) ( not ( = ?auto_412309 ?auto_412311 ) ) ( not ( = ?auto_412309 ?auto_412312 ) ) ( not ( = ?auto_412309 ?auto_412313 ) ) ( not ( = ?auto_412309 ?auto_412314 ) ) ( not ( = ?auto_412309 ?auto_412315 ) ) ( not ( = ?auto_412309 ?auto_412316 ) ) ( not ( = ?auto_412309 ?auto_412317 ) ) ( not ( = ?auto_412309 ?auto_412318 ) ) ( not ( = ?auto_412309 ?auto_412319 ) ) ( not ( = ?auto_412309 ?auto_412320 ) ) ( not ( = ?auto_412309 ?auto_412321 ) ) ( not ( = ?auto_412310 ?auto_412311 ) ) ( not ( = ?auto_412310 ?auto_412312 ) ) ( not ( = ?auto_412310 ?auto_412313 ) ) ( not ( = ?auto_412310 ?auto_412314 ) ) ( not ( = ?auto_412310 ?auto_412315 ) ) ( not ( = ?auto_412310 ?auto_412316 ) ) ( not ( = ?auto_412310 ?auto_412317 ) ) ( not ( = ?auto_412310 ?auto_412318 ) ) ( not ( = ?auto_412310 ?auto_412319 ) ) ( not ( = ?auto_412310 ?auto_412320 ) ) ( not ( = ?auto_412310 ?auto_412321 ) ) ( not ( = ?auto_412311 ?auto_412312 ) ) ( not ( = ?auto_412311 ?auto_412313 ) ) ( not ( = ?auto_412311 ?auto_412314 ) ) ( not ( = ?auto_412311 ?auto_412315 ) ) ( not ( = ?auto_412311 ?auto_412316 ) ) ( not ( = ?auto_412311 ?auto_412317 ) ) ( not ( = ?auto_412311 ?auto_412318 ) ) ( not ( = ?auto_412311 ?auto_412319 ) ) ( not ( = ?auto_412311 ?auto_412320 ) ) ( not ( = ?auto_412311 ?auto_412321 ) ) ( not ( = ?auto_412312 ?auto_412313 ) ) ( not ( = ?auto_412312 ?auto_412314 ) ) ( not ( = ?auto_412312 ?auto_412315 ) ) ( not ( = ?auto_412312 ?auto_412316 ) ) ( not ( = ?auto_412312 ?auto_412317 ) ) ( not ( = ?auto_412312 ?auto_412318 ) ) ( not ( = ?auto_412312 ?auto_412319 ) ) ( not ( = ?auto_412312 ?auto_412320 ) ) ( not ( = ?auto_412312 ?auto_412321 ) ) ( not ( = ?auto_412313 ?auto_412314 ) ) ( not ( = ?auto_412313 ?auto_412315 ) ) ( not ( = ?auto_412313 ?auto_412316 ) ) ( not ( = ?auto_412313 ?auto_412317 ) ) ( not ( = ?auto_412313 ?auto_412318 ) ) ( not ( = ?auto_412313 ?auto_412319 ) ) ( not ( = ?auto_412313 ?auto_412320 ) ) ( not ( = ?auto_412313 ?auto_412321 ) ) ( not ( = ?auto_412314 ?auto_412315 ) ) ( not ( = ?auto_412314 ?auto_412316 ) ) ( not ( = ?auto_412314 ?auto_412317 ) ) ( not ( = ?auto_412314 ?auto_412318 ) ) ( not ( = ?auto_412314 ?auto_412319 ) ) ( not ( = ?auto_412314 ?auto_412320 ) ) ( not ( = ?auto_412314 ?auto_412321 ) ) ( not ( = ?auto_412315 ?auto_412316 ) ) ( not ( = ?auto_412315 ?auto_412317 ) ) ( not ( = ?auto_412315 ?auto_412318 ) ) ( not ( = ?auto_412315 ?auto_412319 ) ) ( not ( = ?auto_412315 ?auto_412320 ) ) ( not ( = ?auto_412315 ?auto_412321 ) ) ( not ( = ?auto_412316 ?auto_412317 ) ) ( not ( = ?auto_412316 ?auto_412318 ) ) ( not ( = ?auto_412316 ?auto_412319 ) ) ( not ( = ?auto_412316 ?auto_412320 ) ) ( not ( = ?auto_412316 ?auto_412321 ) ) ( not ( = ?auto_412317 ?auto_412318 ) ) ( not ( = ?auto_412317 ?auto_412319 ) ) ( not ( = ?auto_412317 ?auto_412320 ) ) ( not ( = ?auto_412317 ?auto_412321 ) ) ( not ( = ?auto_412318 ?auto_412319 ) ) ( not ( = ?auto_412318 ?auto_412320 ) ) ( not ( = ?auto_412318 ?auto_412321 ) ) ( not ( = ?auto_412319 ?auto_412320 ) ) ( not ( = ?auto_412319 ?auto_412321 ) ) ( not ( = ?auto_412320 ?auto_412321 ) ) ( ON ?auto_412320 ?auto_412321 ) ( ON ?auto_412319 ?auto_412320 ) ( ON ?auto_412318 ?auto_412319 ) ( ON ?auto_412317 ?auto_412318 ) ( ON ?auto_412316 ?auto_412317 ) ( ON ?auto_412315 ?auto_412316 ) ( CLEAR ?auto_412313 ) ( ON ?auto_412314 ?auto_412315 ) ( CLEAR ?auto_412314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_412307 ?auto_412308 ?auto_412309 ?auto_412310 ?auto_412311 ?auto_412312 ?auto_412313 ?auto_412314 )
      ( MAKE-15PILE ?auto_412307 ?auto_412308 ?auto_412309 ?auto_412310 ?auto_412311 ?auto_412312 ?auto_412313 ?auto_412314 ?auto_412315 ?auto_412316 ?auto_412317 ?auto_412318 ?auto_412319 ?auto_412320 ?auto_412321 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412337 - BLOCK
      ?auto_412338 - BLOCK
      ?auto_412339 - BLOCK
      ?auto_412340 - BLOCK
      ?auto_412341 - BLOCK
      ?auto_412342 - BLOCK
      ?auto_412343 - BLOCK
      ?auto_412344 - BLOCK
      ?auto_412345 - BLOCK
      ?auto_412346 - BLOCK
      ?auto_412347 - BLOCK
      ?auto_412348 - BLOCK
      ?auto_412349 - BLOCK
      ?auto_412350 - BLOCK
      ?auto_412351 - BLOCK
    )
    :vars
    (
      ?auto_412352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412351 ?auto_412352 ) ( ON-TABLE ?auto_412337 ) ( ON ?auto_412338 ?auto_412337 ) ( ON ?auto_412339 ?auto_412338 ) ( ON ?auto_412340 ?auto_412339 ) ( ON ?auto_412341 ?auto_412340 ) ( ON ?auto_412342 ?auto_412341 ) ( not ( = ?auto_412337 ?auto_412338 ) ) ( not ( = ?auto_412337 ?auto_412339 ) ) ( not ( = ?auto_412337 ?auto_412340 ) ) ( not ( = ?auto_412337 ?auto_412341 ) ) ( not ( = ?auto_412337 ?auto_412342 ) ) ( not ( = ?auto_412337 ?auto_412343 ) ) ( not ( = ?auto_412337 ?auto_412344 ) ) ( not ( = ?auto_412337 ?auto_412345 ) ) ( not ( = ?auto_412337 ?auto_412346 ) ) ( not ( = ?auto_412337 ?auto_412347 ) ) ( not ( = ?auto_412337 ?auto_412348 ) ) ( not ( = ?auto_412337 ?auto_412349 ) ) ( not ( = ?auto_412337 ?auto_412350 ) ) ( not ( = ?auto_412337 ?auto_412351 ) ) ( not ( = ?auto_412337 ?auto_412352 ) ) ( not ( = ?auto_412338 ?auto_412339 ) ) ( not ( = ?auto_412338 ?auto_412340 ) ) ( not ( = ?auto_412338 ?auto_412341 ) ) ( not ( = ?auto_412338 ?auto_412342 ) ) ( not ( = ?auto_412338 ?auto_412343 ) ) ( not ( = ?auto_412338 ?auto_412344 ) ) ( not ( = ?auto_412338 ?auto_412345 ) ) ( not ( = ?auto_412338 ?auto_412346 ) ) ( not ( = ?auto_412338 ?auto_412347 ) ) ( not ( = ?auto_412338 ?auto_412348 ) ) ( not ( = ?auto_412338 ?auto_412349 ) ) ( not ( = ?auto_412338 ?auto_412350 ) ) ( not ( = ?auto_412338 ?auto_412351 ) ) ( not ( = ?auto_412338 ?auto_412352 ) ) ( not ( = ?auto_412339 ?auto_412340 ) ) ( not ( = ?auto_412339 ?auto_412341 ) ) ( not ( = ?auto_412339 ?auto_412342 ) ) ( not ( = ?auto_412339 ?auto_412343 ) ) ( not ( = ?auto_412339 ?auto_412344 ) ) ( not ( = ?auto_412339 ?auto_412345 ) ) ( not ( = ?auto_412339 ?auto_412346 ) ) ( not ( = ?auto_412339 ?auto_412347 ) ) ( not ( = ?auto_412339 ?auto_412348 ) ) ( not ( = ?auto_412339 ?auto_412349 ) ) ( not ( = ?auto_412339 ?auto_412350 ) ) ( not ( = ?auto_412339 ?auto_412351 ) ) ( not ( = ?auto_412339 ?auto_412352 ) ) ( not ( = ?auto_412340 ?auto_412341 ) ) ( not ( = ?auto_412340 ?auto_412342 ) ) ( not ( = ?auto_412340 ?auto_412343 ) ) ( not ( = ?auto_412340 ?auto_412344 ) ) ( not ( = ?auto_412340 ?auto_412345 ) ) ( not ( = ?auto_412340 ?auto_412346 ) ) ( not ( = ?auto_412340 ?auto_412347 ) ) ( not ( = ?auto_412340 ?auto_412348 ) ) ( not ( = ?auto_412340 ?auto_412349 ) ) ( not ( = ?auto_412340 ?auto_412350 ) ) ( not ( = ?auto_412340 ?auto_412351 ) ) ( not ( = ?auto_412340 ?auto_412352 ) ) ( not ( = ?auto_412341 ?auto_412342 ) ) ( not ( = ?auto_412341 ?auto_412343 ) ) ( not ( = ?auto_412341 ?auto_412344 ) ) ( not ( = ?auto_412341 ?auto_412345 ) ) ( not ( = ?auto_412341 ?auto_412346 ) ) ( not ( = ?auto_412341 ?auto_412347 ) ) ( not ( = ?auto_412341 ?auto_412348 ) ) ( not ( = ?auto_412341 ?auto_412349 ) ) ( not ( = ?auto_412341 ?auto_412350 ) ) ( not ( = ?auto_412341 ?auto_412351 ) ) ( not ( = ?auto_412341 ?auto_412352 ) ) ( not ( = ?auto_412342 ?auto_412343 ) ) ( not ( = ?auto_412342 ?auto_412344 ) ) ( not ( = ?auto_412342 ?auto_412345 ) ) ( not ( = ?auto_412342 ?auto_412346 ) ) ( not ( = ?auto_412342 ?auto_412347 ) ) ( not ( = ?auto_412342 ?auto_412348 ) ) ( not ( = ?auto_412342 ?auto_412349 ) ) ( not ( = ?auto_412342 ?auto_412350 ) ) ( not ( = ?auto_412342 ?auto_412351 ) ) ( not ( = ?auto_412342 ?auto_412352 ) ) ( not ( = ?auto_412343 ?auto_412344 ) ) ( not ( = ?auto_412343 ?auto_412345 ) ) ( not ( = ?auto_412343 ?auto_412346 ) ) ( not ( = ?auto_412343 ?auto_412347 ) ) ( not ( = ?auto_412343 ?auto_412348 ) ) ( not ( = ?auto_412343 ?auto_412349 ) ) ( not ( = ?auto_412343 ?auto_412350 ) ) ( not ( = ?auto_412343 ?auto_412351 ) ) ( not ( = ?auto_412343 ?auto_412352 ) ) ( not ( = ?auto_412344 ?auto_412345 ) ) ( not ( = ?auto_412344 ?auto_412346 ) ) ( not ( = ?auto_412344 ?auto_412347 ) ) ( not ( = ?auto_412344 ?auto_412348 ) ) ( not ( = ?auto_412344 ?auto_412349 ) ) ( not ( = ?auto_412344 ?auto_412350 ) ) ( not ( = ?auto_412344 ?auto_412351 ) ) ( not ( = ?auto_412344 ?auto_412352 ) ) ( not ( = ?auto_412345 ?auto_412346 ) ) ( not ( = ?auto_412345 ?auto_412347 ) ) ( not ( = ?auto_412345 ?auto_412348 ) ) ( not ( = ?auto_412345 ?auto_412349 ) ) ( not ( = ?auto_412345 ?auto_412350 ) ) ( not ( = ?auto_412345 ?auto_412351 ) ) ( not ( = ?auto_412345 ?auto_412352 ) ) ( not ( = ?auto_412346 ?auto_412347 ) ) ( not ( = ?auto_412346 ?auto_412348 ) ) ( not ( = ?auto_412346 ?auto_412349 ) ) ( not ( = ?auto_412346 ?auto_412350 ) ) ( not ( = ?auto_412346 ?auto_412351 ) ) ( not ( = ?auto_412346 ?auto_412352 ) ) ( not ( = ?auto_412347 ?auto_412348 ) ) ( not ( = ?auto_412347 ?auto_412349 ) ) ( not ( = ?auto_412347 ?auto_412350 ) ) ( not ( = ?auto_412347 ?auto_412351 ) ) ( not ( = ?auto_412347 ?auto_412352 ) ) ( not ( = ?auto_412348 ?auto_412349 ) ) ( not ( = ?auto_412348 ?auto_412350 ) ) ( not ( = ?auto_412348 ?auto_412351 ) ) ( not ( = ?auto_412348 ?auto_412352 ) ) ( not ( = ?auto_412349 ?auto_412350 ) ) ( not ( = ?auto_412349 ?auto_412351 ) ) ( not ( = ?auto_412349 ?auto_412352 ) ) ( not ( = ?auto_412350 ?auto_412351 ) ) ( not ( = ?auto_412350 ?auto_412352 ) ) ( not ( = ?auto_412351 ?auto_412352 ) ) ( ON ?auto_412350 ?auto_412351 ) ( ON ?auto_412349 ?auto_412350 ) ( ON ?auto_412348 ?auto_412349 ) ( ON ?auto_412347 ?auto_412348 ) ( ON ?auto_412346 ?auto_412347 ) ( ON ?auto_412345 ?auto_412346 ) ( ON ?auto_412344 ?auto_412345 ) ( CLEAR ?auto_412342 ) ( ON ?auto_412343 ?auto_412344 ) ( CLEAR ?auto_412343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_412337 ?auto_412338 ?auto_412339 ?auto_412340 ?auto_412341 ?auto_412342 ?auto_412343 )
      ( MAKE-15PILE ?auto_412337 ?auto_412338 ?auto_412339 ?auto_412340 ?auto_412341 ?auto_412342 ?auto_412343 ?auto_412344 ?auto_412345 ?auto_412346 ?auto_412347 ?auto_412348 ?auto_412349 ?auto_412350 ?auto_412351 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412368 - BLOCK
      ?auto_412369 - BLOCK
      ?auto_412370 - BLOCK
      ?auto_412371 - BLOCK
      ?auto_412372 - BLOCK
      ?auto_412373 - BLOCK
      ?auto_412374 - BLOCK
      ?auto_412375 - BLOCK
      ?auto_412376 - BLOCK
      ?auto_412377 - BLOCK
      ?auto_412378 - BLOCK
      ?auto_412379 - BLOCK
      ?auto_412380 - BLOCK
      ?auto_412381 - BLOCK
      ?auto_412382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412382 ) ( ON-TABLE ?auto_412368 ) ( ON ?auto_412369 ?auto_412368 ) ( ON ?auto_412370 ?auto_412369 ) ( ON ?auto_412371 ?auto_412370 ) ( ON ?auto_412372 ?auto_412371 ) ( ON ?auto_412373 ?auto_412372 ) ( not ( = ?auto_412368 ?auto_412369 ) ) ( not ( = ?auto_412368 ?auto_412370 ) ) ( not ( = ?auto_412368 ?auto_412371 ) ) ( not ( = ?auto_412368 ?auto_412372 ) ) ( not ( = ?auto_412368 ?auto_412373 ) ) ( not ( = ?auto_412368 ?auto_412374 ) ) ( not ( = ?auto_412368 ?auto_412375 ) ) ( not ( = ?auto_412368 ?auto_412376 ) ) ( not ( = ?auto_412368 ?auto_412377 ) ) ( not ( = ?auto_412368 ?auto_412378 ) ) ( not ( = ?auto_412368 ?auto_412379 ) ) ( not ( = ?auto_412368 ?auto_412380 ) ) ( not ( = ?auto_412368 ?auto_412381 ) ) ( not ( = ?auto_412368 ?auto_412382 ) ) ( not ( = ?auto_412369 ?auto_412370 ) ) ( not ( = ?auto_412369 ?auto_412371 ) ) ( not ( = ?auto_412369 ?auto_412372 ) ) ( not ( = ?auto_412369 ?auto_412373 ) ) ( not ( = ?auto_412369 ?auto_412374 ) ) ( not ( = ?auto_412369 ?auto_412375 ) ) ( not ( = ?auto_412369 ?auto_412376 ) ) ( not ( = ?auto_412369 ?auto_412377 ) ) ( not ( = ?auto_412369 ?auto_412378 ) ) ( not ( = ?auto_412369 ?auto_412379 ) ) ( not ( = ?auto_412369 ?auto_412380 ) ) ( not ( = ?auto_412369 ?auto_412381 ) ) ( not ( = ?auto_412369 ?auto_412382 ) ) ( not ( = ?auto_412370 ?auto_412371 ) ) ( not ( = ?auto_412370 ?auto_412372 ) ) ( not ( = ?auto_412370 ?auto_412373 ) ) ( not ( = ?auto_412370 ?auto_412374 ) ) ( not ( = ?auto_412370 ?auto_412375 ) ) ( not ( = ?auto_412370 ?auto_412376 ) ) ( not ( = ?auto_412370 ?auto_412377 ) ) ( not ( = ?auto_412370 ?auto_412378 ) ) ( not ( = ?auto_412370 ?auto_412379 ) ) ( not ( = ?auto_412370 ?auto_412380 ) ) ( not ( = ?auto_412370 ?auto_412381 ) ) ( not ( = ?auto_412370 ?auto_412382 ) ) ( not ( = ?auto_412371 ?auto_412372 ) ) ( not ( = ?auto_412371 ?auto_412373 ) ) ( not ( = ?auto_412371 ?auto_412374 ) ) ( not ( = ?auto_412371 ?auto_412375 ) ) ( not ( = ?auto_412371 ?auto_412376 ) ) ( not ( = ?auto_412371 ?auto_412377 ) ) ( not ( = ?auto_412371 ?auto_412378 ) ) ( not ( = ?auto_412371 ?auto_412379 ) ) ( not ( = ?auto_412371 ?auto_412380 ) ) ( not ( = ?auto_412371 ?auto_412381 ) ) ( not ( = ?auto_412371 ?auto_412382 ) ) ( not ( = ?auto_412372 ?auto_412373 ) ) ( not ( = ?auto_412372 ?auto_412374 ) ) ( not ( = ?auto_412372 ?auto_412375 ) ) ( not ( = ?auto_412372 ?auto_412376 ) ) ( not ( = ?auto_412372 ?auto_412377 ) ) ( not ( = ?auto_412372 ?auto_412378 ) ) ( not ( = ?auto_412372 ?auto_412379 ) ) ( not ( = ?auto_412372 ?auto_412380 ) ) ( not ( = ?auto_412372 ?auto_412381 ) ) ( not ( = ?auto_412372 ?auto_412382 ) ) ( not ( = ?auto_412373 ?auto_412374 ) ) ( not ( = ?auto_412373 ?auto_412375 ) ) ( not ( = ?auto_412373 ?auto_412376 ) ) ( not ( = ?auto_412373 ?auto_412377 ) ) ( not ( = ?auto_412373 ?auto_412378 ) ) ( not ( = ?auto_412373 ?auto_412379 ) ) ( not ( = ?auto_412373 ?auto_412380 ) ) ( not ( = ?auto_412373 ?auto_412381 ) ) ( not ( = ?auto_412373 ?auto_412382 ) ) ( not ( = ?auto_412374 ?auto_412375 ) ) ( not ( = ?auto_412374 ?auto_412376 ) ) ( not ( = ?auto_412374 ?auto_412377 ) ) ( not ( = ?auto_412374 ?auto_412378 ) ) ( not ( = ?auto_412374 ?auto_412379 ) ) ( not ( = ?auto_412374 ?auto_412380 ) ) ( not ( = ?auto_412374 ?auto_412381 ) ) ( not ( = ?auto_412374 ?auto_412382 ) ) ( not ( = ?auto_412375 ?auto_412376 ) ) ( not ( = ?auto_412375 ?auto_412377 ) ) ( not ( = ?auto_412375 ?auto_412378 ) ) ( not ( = ?auto_412375 ?auto_412379 ) ) ( not ( = ?auto_412375 ?auto_412380 ) ) ( not ( = ?auto_412375 ?auto_412381 ) ) ( not ( = ?auto_412375 ?auto_412382 ) ) ( not ( = ?auto_412376 ?auto_412377 ) ) ( not ( = ?auto_412376 ?auto_412378 ) ) ( not ( = ?auto_412376 ?auto_412379 ) ) ( not ( = ?auto_412376 ?auto_412380 ) ) ( not ( = ?auto_412376 ?auto_412381 ) ) ( not ( = ?auto_412376 ?auto_412382 ) ) ( not ( = ?auto_412377 ?auto_412378 ) ) ( not ( = ?auto_412377 ?auto_412379 ) ) ( not ( = ?auto_412377 ?auto_412380 ) ) ( not ( = ?auto_412377 ?auto_412381 ) ) ( not ( = ?auto_412377 ?auto_412382 ) ) ( not ( = ?auto_412378 ?auto_412379 ) ) ( not ( = ?auto_412378 ?auto_412380 ) ) ( not ( = ?auto_412378 ?auto_412381 ) ) ( not ( = ?auto_412378 ?auto_412382 ) ) ( not ( = ?auto_412379 ?auto_412380 ) ) ( not ( = ?auto_412379 ?auto_412381 ) ) ( not ( = ?auto_412379 ?auto_412382 ) ) ( not ( = ?auto_412380 ?auto_412381 ) ) ( not ( = ?auto_412380 ?auto_412382 ) ) ( not ( = ?auto_412381 ?auto_412382 ) ) ( ON ?auto_412381 ?auto_412382 ) ( ON ?auto_412380 ?auto_412381 ) ( ON ?auto_412379 ?auto_412380 ) ( ON ?auto_412378 ?auto_412379 ) ( ON ?auto_412377 ?auto_412378 ) ( ON ?auto_412376 ?auto_412377 ) ( ON ?auto_412375 ?auto_412376 ) ( CLEAR ?auto_412373 ) ( ON ?auto_412374 ?auto_412375 ) ( CLEAR ?auto_412374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_412368 ?auto_412369 ?auto_412370 ?auto_412371 ?auto_412372 ?auto_412373 ?auto_412374 )
      ( MAKE-15PILE ?auto_412368 ?auto_412369 ?auto_412370 ?auto_412371 ?auto_412372 ?auto_412373 ?auto_412374 ?auto_412375 ?auto_412376 ?auto_412377 ?auto_412378 ?auto_412379 ?auto_412380 ?auto_412381 ?auto_412382 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412398 - BLOCK
      ?auto_412399 - BLOCK
      ?auto_412400 - BLOCK
      ?auto_412401 - BLOCK
      ?auto_412402 - BLOCK
      ?auto_412403 - BLOCK
      ?auto_412404 - BLOCK
      ?auto_412405 - BLOCK
      ?auto_412406 - BLOCK
      ?auto_412407 - BLOCK
      ?auto_412408 - BLOCK
      ?auto_412409 - BLOCK
      ?auto_412410 - BLOCK
      ?auto_412411 - BLOCK
      ?auto_412412 - BLOCK
    )
    :vars
    (
      ?auto_412413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412412 ?auto_412413 ) ( ON-TABLE ?auto_412398 ) ( ON ?auto_412399 ?auto_412398 ) ( ON ?auto_412400 ?auto_412399 ) ( ON ?auto_412401 ?auto_412400 ) ( ON ?auto_412402 ?auto_412401 ) ( not ( = ?auto_412398 ?auto_412399 ) ) ( not ( = ?auto_412398 ?auto_412400 ) ) ( not ( = ?auto_412398 ?auto_412401 ) ) ( not ( = ?auto_412398 ?auto_412402 ) ) ( not ( = ?auto_412398 ?auto_412403 ) ) ( not ( = ?auto_412398 ?auto_412404 ) ) ( not ( = ?auto_412398 ?auto_412405 ) ) ( not ( = ?auto_412398 ?auto_412406 ) ) ( not ( = ?auto_412398 ?auto_412407 ) ) ( not ( = ?auto_412398 ?auto_412408 ) ) ( not ( = ?auto_412398 ?auto_412409 ) ) ( not ( = ?auto_412398 ?auto_412410 ) ) ( not ( = ?auto_412398 ?auto_412411 ) ) ( not ( = ?auto_412398 ?auto_412412 ) ) ( not ( = ?auto_412398 ?auto_412413 ) ) ( not ( = ?auto_412399 ?auto_412400 ) ) ( not ( = ?auto_412399 ?auto_412401 ) ) ( not ( = ?auto_412399 ?auto_412402 ) ) ( not ( = ?auto_412399 ?auto_412403 ) ) ( not ( = ?auto_412399 ?auto_412404 ) ) ( not ( = ?auto_412399 ?auto_412405 ) ) ( not ( = ?auto_412399 ?auto_412406 ) ) ( not ( = ?auto_412399 ?auto_412407 ) ) ( not ( = ?auto_412399 ?auto_412408 ) ) ( not ( = ?auto_412399 ?auto_412409 ) ) ( not ( = ?auto_412399 ?auto_412410 ) ) ( not ( = ?auto_412399 ?auto_412411 ) ) ( not ( = ?auto_412399 ?auto_412412 ) ) ( not ( = ?auto_412399 ?auto_412413 ) ) ( not ( = ?auto_412400 ?auto_412401 ) ) ( not ( = ?auto_412400 ?auto_412402 ) ) ( not ( = ?auto_412400 ?auto_412403 ) ) ( not ( = ?auto_412400 ?auto_412404 ) ) ( not ( = ?auto_412400 ?auto_412405 ) ) ( not ( = ?auto_412400 ?auto_412406 ) ) ( not ( = ?auto_412400 ?auto_412407 ) ) ( not ( = ?auto_412400 ?auto_412408 ) ) ( not ( = ?auto_412400 ?auto_412409 ) ) ( not ( = ?auto_412400 ?auto_412410 ) ) ( not ( = ?auto_412400 ?auto_412411 ) ) ( not ( = ?auto_412400 ?auto_412412 ) ) ( not ( = ?auto_412400 ?auto_412413 ) ) ( not ( = ?auto_412401 ?auto_412402 ) ) ( not ( = ?auto_412401 ?auto_412403 ) ) ( not ( = ?auto_412401 ?auto_412404 ) ) ( not ( = ?auto_412401 ?auto_412405 ) ) ( not ( = ?auto_412401 ?auto_412406 ) ) ( not ( = ?auto_412401 ?auto_412407 ) ) ( not ( = ?auto_412401 ?auto_412408 ) ) ( not ( = ?auto_412401 ?auto_412409 ) ) ( not ( = ?auto_412401 ?auto_412410 ) ) ( not ( = ?auto_412401 ?auto_412411 ) ) ( not ( = ?auto_412401 ?auto_412412 ) ) ( not ( = ?auto_412401 ?auto_412413 ) ) ( not ( = ?auto_412402 ?auto_412403 ) ) ( not ( = ?auto_412402 ?auto_412404 ) ) ( not ( = ?auto_412402 ?auto_412405 ) ) ( not ( = ?auto_412402 ?auto_412406 ) ) ( not ( = ?auto_412402 ?auto_412407 ) ) ( not ( = ?auto_412402 ?auto_412408 ) ) ( not ( = ?auto_412402 ?auto_412409 ) ) ( not ( = ?auto_412402 ?auto_412410 ) ) ( not ( = ?auto_412402 ?auto_412411 ) ) ( not ( = ?auto_412402 ?auto_412412 ) ) ( not ( = ?auto_412402 ?auto_412413 ) ) ( not ( = ?auto_412403 ?auto_412404 ) ) ( not ( = ?auto_412403 ?auto_412405 ) ) ( not ( = ?auto_412403 ?auto_412406 ) ) ( not ( = ?auto_412403 ?auto_412407 ) ) ( not ( = ?auto_412403 ?auto_412408 ) ) ( not ( = ?auto_412403 ?auto_412409 ) ) ( not ( = ?auto_412403 ?auto_412410 ) ) ( not ( = ?auto_412403 ?auto_412411 ) ) ( not ( = ?auto_412403 ?auto_412412 ) ) ( not ( = ?auto_412403 ?auto_412413 ) ) ( not ( = ?auto_412404 ?auto_412405 ) ) ( not ( = ?auto_412404 ?auto_412406 ) ) ( not ( = ?auto_412404 ?auto_412407 ) ) ( not ( = ?auto_412404 ?auto_412408 ) ) ( not ( = ?auto_412404 ?auto_412409 ) ) ( not ( = ?auto_412404 ?auto_412410 ) ) ( not ( = ?auto_412404 ?auto_412411 ) ) ( not ( = ?auto_412404 ?auto_412412 ) ) ( not ( = ?auto_412404 ?auto_412413 ) ) ( not ( = ?auto_412405 ?auto_412406 ) ) ( not ( = ?auto_412405 ?auto_412407 ) ) ( not ( = ?auto_412405 ?auto_412408 ) ) ( not ( = ?auto_412405 ?auto_412409 ) ) ( not ( = ?auto_412405 ?auto_412410 ) ) ( not ( = ?auto_412405 ?auto_412411 ) ) ( not ( = ?auto_412405 ?auto_412412 ) ) ( not ( = ?auto_412405 ?auto_412413 ) ) ( not ( = ?auto_412406 ?auto_412407 ) ) ( not ( = ?auto_412406 ?auto_412408 ) ) ( not ( = ?auto_412406 ?auto_412409 ) ) ( not ( = ?auto_412406 ?auto_412410 ) ) ( not ( = ?auto_412406 ?auto_412411 ) ) ( not ( = ?auto_412406 ?auto_412412 ) ) ( not ( = ?auto_412406 ?auto_412413 ) ) ( not ( = ?auto_412407 ?auto_412408 ) ) ( not ( = ?auto_412407 ?auto_412409 ) ) ( not ( = ?auto_412407 ?auto_412410 ) ) ( not ( = ?auto_412407 ?auto_412411 ) ) ( not ( = ?auto_412407 ?auto_412412 ) ) ( not ( = ?auto_412407 ?auto_412413 ) ) ( not ( = ?auto_412408 ?auto_412409 ) ) ( not ( = ?auto_412408 ?auto_412410 ) ) ( not ( = ?auto_412408 ?auto_412411 ) ) ( not ( = ?auto_412408 ?auto_412412 ) ) ( not ( = ?auto_412408 ?auto_412413 ) ) ( not ( = ?auto_412409 ?auto_412410 ) ) ( not ( = ?auto_412409 ?auto_412411 ) ) ( not ( = ?auto_412409 ?auto_412412 ) ) ( not ( = ?auto_412409 ?auto_412413 ) ) ( not ( = ?auto_412410 ?auto_412411 ) ) ( not ( = ?auto_412410 ?auto_412412 ) ) ( not ( = ?auto_412410 ?auto_412413 ) ) ( not ( = ?auto_412411 ?auto_412412 ) ) ( not ( = ?auto_412411 ?auto_412413 ) ) ( not ( = ?auto_412412 ?auto_412413 ) ) ( ON ?auto_412411 ?auto_412412 ) ( ON ?auto_412410 ?auto_412411 ) ( ON ?auto_412409 ?auto_412410 ) ( ON ?auto_412408 ?auto_412409 ) ( ON ?auto_412407 ?auto_412408 ) ( ON ?auto_412406 ?auto_412407 ) ( ON ?auto_412405 ?auto_412406 ) ( ON ?auto_412404 ?auto_412405 ) ( CLEAR ?auto_412402 ) ( ON ?auto_412403 ?auto_412404 ) ( CLEAR ?auto_412403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_412398 ?auto_412399 ?auto_412400 ?auto_412401 ?auto_412402 ?auto_412403 )
      ( MAKE-15PILE ?auto_412398 ?auto_412399 ?auto_412400 ?auto_412401 ?auto_412402 ?auto_412403 ?auto_412404 ?auto_412405 ?auto_412406 ?auto_412407 ?auto_412408 ?auto_412409 ?auto_412410 ?auto_412411 ?auto_412412 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412429 - BLOCK
      ?auto_412430 - BLOCK
      ?auto_412431 - BLOCK
      ?auto_412432 - BLOCK
      ?auto_412433 - BLOCK
      ?auto_412434 - BLOCK
      ?auto_412435 - BLOCK
      ?auto_412436 - BLOCK
      ?auto_412437 - BLOCK
      ?auto_412438 - BLOCK
      ?auto_412439 - BLOCK
      ?auto_412440 - BLOCK
      ?auto_412441 - BLOCK
      ?auto_412442 - BLOCK
      ?auto_412443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412443 ) ( ON-TABLE ?auto_412429 ) ( ON ?auto_412430 ?auto_412429 ) ( ON ?auto_412431 ?auto_412430 ) ( ON ?auto_412432 ?auto_412431 ) ( ON ?auto_412433 ?auto_412432 ) ( not ( = ?auto_412429 ?auto_412430 ) ) ( not ( = ?auto_412429 ?auto_412431 ) ) ( not ( = ?auto_412429 ?auto_412432 ) ) ( not ( = ?auto_412429 ?auto_412433 ) ) ( not ( = ?auto_412429 ?auto_412434 ) ) ( not ( = ?auto_412429 ?auto_412435 ) ) ( not ( = ?auto_412429 ?auto_412436 ) ) ( not ( = ?auto_412429 ?auto_412437 ) ) ( not ( = ?auto_412429 ?auto_412438 ) ) ( not ( = ?auto_412429 ?auto_412439 ) ) ( not ( = ?auto_412429 ?auto_412440 ) ) ( not ( = ?auto_412429 ?auto_412441 ) ) ( not ( = ?auto_412429 ?auto_412442 ) ) ( not ( = ?auto_412429 ?auto_412443 ) ) ( not ( = ?auto_412430 ?auto_412431 ) ) ( not ( = ?auto_412430 ?auto_412432 ) ) ( not ( = ?auto_412430 ?auto_412433 ) ) ( not ( = ?auto_412430 ?auto_412434 ) ) ( not ( = ?auto_412430 ?auto_412435 ) ) ( not ( = ?auto_412430 ?auto_412436 ) ) ( not ( = ?auto_412430 ?auto_412437 ) ) ( not ( = ?auto_412430 ?auto_412438 ) ) ( not ( = ?auto_412430 ?auto_412439 ) ) ( not ( = ?auto_412430 ?auto_412440 ) ) ( not ( = ?auto_412430 ?auto_412441 ) ) ( not ( = ?auto_412430 ?auto_412442 ) ) ( not ( = ?auto_412430 ?auto_412443 ) ) ( not ( = ?auto_412431 ?auto_412432 ) ) ( not ( = ?auto_412431 ?auto_412433 ) ) ( not ( = ?auto_412431 ?auto_412434 ) ) ( not ( = ?auto_412431 ?auto_412435 ) ) ( not ( = ?auto_412431 ?auto_412436 ) ) ( not ( = ?auto_412431 ?auto_412437 ) ) ( not ( = ?auto_412431 ?auto_412438 ) ) ( not ( = ?auto_412431 ?auto_412439 ) ) ( not ( = ?auto_412431 ?auto_412440 ) ) ( not ( = ?auto_412431 ?auto_412441 ) ) ( not ( = ?auto_412431 ?auto_412442 ) ) ( not ( = ?auto_412431 ?auto_412443 ) ) ( not ( = ?auto_412432 ?auto_412433 ) ) ( not ( = ?auto_412432 ?auto_412434 ) ) ( not ( = ?auto_412432 ?auto_412435 ) ) ( not ( = ?auto_412432 ?auto_412436 ) ) ( not ( = ?auto_412432 ?auto_412437 ) ) ( not ( = ?auto_412432 ?auto_412438 ) ) ( not ( = ?auto_412432 ?auto_412439 ) ) ( not ( = ?auto_412432 ?auto_412440 ) ) ( not ( = ?auto_412432 ?auto_412441 ) ) ( not ( = ?auto_412432 ?auto_412442 ) ) ( not ( = ?auto_412432 ?auto_412443 ) ) ( not ( = ?auto_412433 ?auto_412434 ) ) ( not ( = ?auto_412433 ?auto_412435 ) ) ( not ( = ?auto_412433 ?auto_412436 ) ) ( not ( = ?auto_412433 ?auto_412437 ) ) ( not ( = ?auto_412433 ?auto_412438 ) ) ( not ( = ?auto_412433 ?auto_412439 ) ) ( not ( = ?auto_412433 ?auto_412440 ) ) ( not ( = ?auto_412433 ?auto_412441 ) ) ( not ( = ?auto_412433 ?auto_412442 ) ) ( not ( = ?auto_412433 ?auto_412443 ) ) ( not ( = ?auto_412434 ?auto_412435 ) ) ( not ( = ?auto_412434 ?auto_412436 ) ) ( not ( = ?auto_412434 ?auto_412437 ) ) ( not ( = ?auto_412434 ?auto_412438 ) ) ( not ( = ?auto_412434 ?auto_412439 ) ) ( not ( = ?auto_412434 ?auto_412440 ) ) ( not ( = ?auto_412434 ?auto_412441 ) ) ( not ( = ?auto_412434 ?auto_412442 ) ) ( not ( = ?auto_412434 ?auto_412443 ) ) ( not ( = ?auto_412435 ?auto_412436 ) ) ( not ( = ?auto_412435 ?auto_412437 ) ) ( not ( = ?auto_412435 ?auto_412438 ) ) ( not ( = ?auto_412435 ?auto_412439 ) ) ( not ( = ?auto_412435 ?auto_412440 ) ) ( not ( = ?auto_412435 ?auto_412441 ) ) ( not ( = ?auto_412435 ?auto_412442 ) ) ( not ( = ?auto_412435 ?auto_412443 ) ) ( not ( = ?auto_412436 ?auto_412437 ) ) ( not ( = ?auto_412436 ?auto_412438 ) ) ( not ( = ?auto_412436 ?auto_412439 ) ) ( not ( = ?auto_412436 ?auto_412440 ) ) ( not ( = ?auto_412436 ?auto_412441 ) ) ( not ( = ?auto_412436 ?auto_412442 ) ) ( not ( = ?auto_412436 ?auto_412443 ) ) ( not ( = ?auto_412437 ?auto_412438 ) ) ( not ( = ?auto_412437 ?auto_412439 ) ) ( not ( = ?auto_412437 ?auto_412440 ) ) ( not ( = ?auto_412437 ?auto_412441 ) ) ( not ( = ?auto_412437 ?auto_412442 ) ) ( not ( = ?auto_412437 ?auto_412443 ) ) ( not ( = ?auto_412438 ?auto_412439 ) ) ( not ( = ?auto_412438 ?auto_412440 ) ) ( not ( = ?auto_412438 ?auto_412441 ) ) ( not ( = ?auto_412438 ?auto_412442 ) ) ( not ( = ?auto_412438 ?auto_412443 ) ) ( not ( = ?auto_412439 ?auto_412440 ) ) ( not ( = ?auto_412439 ?auto_412441 ) ) ( not ( = ?auto_412439 ?auto_412442 ) ) ( not ( = ?auto_412439 ?auto_412443 ) ) ( not ( = ?auto_412440 ?auto_412441 ) ) ( not ( = ?auto_412440 ?auto_412442 ) ) ( not ( = ?auto_412440 ?auto_412443 ) ) ( not ( = ?auto_412441 ?auto_412442 ) ) ( not ( = ?auto_412441 ?auto_412443 ) ) ( not ( = ?auto_412442 ?auto_412443 ) ) ( ON ?auto_412442 ?auto_412443 ) ( ON ?auto_412441 ?auto_412442 ) ( ON ?auto_412440 ?auto_412441 ) ( ON ?auto_412439 ?auto_412440 ) ( ON ?auto_412438 ?auto_412439 ) ( ON ?auto_412437 ?auto_412438 ) ( ON ?auto_412436 ?auto_412437 ) ( ON ?auto_412435 ?auto_412436 ) ( CLEAR ?auto_412433 ) ( ON ?auto_412434 ?auto_412435 ) ( CLEAR ?auto_412434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_412429 ?auto_412430 ?auto_412431 ?auto_412432 ?auto_412433 ?auto_412434 )
      ( MAKE-15PILE ?auto_412429 ?auto_412430 ?auto_412431 ?auto_412432 ?auto_412433 ?auto_412434 ?auto_412435 ?auto_412436 ?auto_412437 ?auto_412438 ?auto_412439 ?auto_412440 ?auto_412441 ?auto_412442 ?auto_412443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412459 - BLOCK
      ?auto_412460 - BLOCK
      ?auto_412461 - BLOCK
      ?auto_412462 - BLOCK
      ?auto_412463 - BLOCK
      ?auto_412464 - BLOCK
      ?auto_412465 - BLOCK
      ?auto_412466 - BLOCK
      ?auto_412467 - BLOCK
      ?auto_412468 - BLOCK
      ?auto_412469 - BLOCK
      ?auto_412470 - BLOCK
      ?auto_412471 - BLOCK
      ?auto_412472 - BLOCK
      ?auto_412473 - BLOCK
    )
    :vars
    (
      ?auto_412474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412473 ?auto_412474 ) ( ON-TABLE ?auto_412459 ) ( ON ?auto_412460 ?auto_412459 ) ( ON ?auto_412461 ?auto_412460 ) ( ON ?auto_412462 ?auto_412461 ) ( not ( = ?auto_412459 ?auto_412460 ) ) ( not ( = ?auto_412459 ?auto_412461 ) ) ( not ( = ?auto_412459 ?auto_412462 ) ) ( not ( = ?auto_412459 ?auto_412463 ) ) ( not ( = ?auto_412459 ?auto_412464 ) ) ( not ( = ?auto_412459 ?auto_412465 ) ) ( not ( = ?auto_412459 ?auto_412466 ) ) ( not ( = ?auto_412459 ?auto_412467 ) ) ( not ( = ?auto_412459 ?auto_412468 ) ) ( not ( = ?auto_412459 ?auto_412469 ) ) ( not ( = ?auto_412459 ?auto_412470 ) ) ( not ( = ?auto_412459 ?auto_412471 ) ) ( not ( = ?auto_412459 ?auto_412472 ) ) ( not ( = ?auto_412459 ?auto_412473 ) ) ( not ( = ?auto_412459 ?auto_412474 ) ) ( not ( = ?auto_412460 ?auto_412461 ) ) ( not ( = ?auto_412460 ?auto_412462 ) ) ( not ( = ?auto_412460 ?auto_412463 ) ) ( not ( = ?auto_412460 ?auto_412464 ) ) ( not ( = ?auto_412460 ?auto_412465 ) ) ( not ( = ?auto_412460 ?auto_412466 ) ) ( not ( = ?auto_412460 ?auto_412467 ) ) ( not ( = ?auto_412460 ?auto_412468 ) ) ( not ( = ?auto_412460 ?auto_412469 ) ) ( not ( = ?auto_412460 ?auto_412470 ) ) ( not ( = ?auto_412460 ?auto_412471 ) ) ( not ( = ?auto_412460 ?auto_412472 ) ) ( not ( = ?auto_412460 ?auto_412473 ) ) ( not ( = ?auto_412460 ?auto_412474 ) ) ( not ( = ?auto_412461 ?auto_412462 ) ) ( not ( = ?auto_412461 ?auto_412463 ) ) ( not ( = ?auto_412461 ?auto_412464 ) ) ( not ( = ?auto_412461 ?auto_412465 ) ) ( not ( = ?auto_412461 ?auto_412466 ) ) ( not ( = ?auto_412461 ?auto_412467 ) ) ( not ( = ?auto_412461 ?auto_412468 ) ) ( not ( = ?auto_412461 ?auto_412469 ) ) ( not ( = ?auto_412461 ?auto_412470 ) ) ( not ( = ?auto_412461 ?auto_412471 ) ) ( not ( = ?auto_412461 ?auto_412472 ) ) ( not ( = ?auto_412461 ?auto_412473 ) ) ( not ( = ?auto_412461 ?auto_412474 ) ) ( not ( = ?auto_412462 ?auto_412463 ) ) ( not ( = ?auto_412462 ?auto_412464 ) ) ( not ( = ?auto_412462 ?auto_412465 ) ) ( not ( = ?auto_412462 ?auto_412466 ) ) ( not ( = ?auto_412462 ?auto_412467 ) ) ( not ( = ?auto_412462 ?auto_412468 ) ) ( not ( = ?auto_412462 ?auto_412469 ) ) ( not ( = ?auto_412462 ?auto_412470 ) ) ( not ( = ?auto_412462 ?auto_412471 ) ) ( not ( = ?auto_412462 ?auto_412472 ) ) ( not ( = ?auto_412462 ?auto_412473 ) ) ( not ( = ?auto_412462 ?auto_412474 ) ) ( not ( = ?auto_412463 ?auto_412464 ) ) ( not ( = ?auto_412463 ?auto_412465 ) ) ( not ( = ?auto_412463 ?auto_412466 ) ) ( not ( = ?auto_412463 ?auto_412467 ) ) ( not ( = ?auto_412463 ?auto_412468 ) ) ( not ( = ?auto_412463 ?auto_412469 ) ) ( not ( = ?auto_412463 ?auto_412470 ) ) ( not ( = ?auto_412463 ?auto_412471 ) ) ( not ( = ?auto_412463 ?auto_412472 ) ) ( not ( = ?auto_412463 ?auto_412473 ) ) ( not ( = ?auto_412463 ?auto_412474 ) ) ( not ( = ?auto_412464 ?auto_412465 ) ) ( not ( = ?auto_412464 ?auto_412466 ) ) ( not ( = ?auto_412464 ?auto_412467 ) ) ( not ( = ?auto_412464 ?auto_412468 ) ) ( not ( = ?auto_412464 ?auto_412469 ) ) ( not ( = ?auto_412464 ?auto_412470 ) ) ( not ( = ?auto_412464 ?auto_412471 ) ) ( not ( = ?auto_412464 ?auto_412472 ) ) ( not ( = ?auto_412464 ?auto_412473 ) ) ( not ( = ?auto_412464 ?auto_412474 ) ) ( not ( = ?auto_412465 ?auto_412466 ) ) ( not ( = ?auto_412465 ?auto_412467 ) ) ( not ( = ?auto_412465 ?auto_412468 ) ) ( not ( = ?auto_412465 ?auto_412469 ) ) ( not ( = ?auto_412465 ?auto_412470 ) ) ( not ( = ?auto_412465 ?auto_412471 ) ) ( not ( = ?auto_412465 ?auto_412472 ) ) ( not ( = ?auto_412465 ?auto_412473 ) ) ( not ( = ?auto_412465 ?auto_412474 ) ) ( not ( = ?auto_412466 ?auto_412467 ) ) ( not ( = ?auto_412466 ?auto_412468 ) ) ( not ( = ?auto_412466 ?auto_412469 ) ) ( not ( = ?auto_412466 ?auto_412470 ) ) ( not ( = ?auto_412466 ?auto_412471 ) ) ( not ( = ?auto_412466 ?auto_412472 ) ) ( not ( = ?auto_412466 ?auto_412473 ) ) ( not ( = ?auto_412466 ?auto_412474 ) ) ( not ( = ?auto_412467 ?auto_412468 ) ) ( not ( = ?auto_412467 ?auto_412469 ) ) ( not ( = ?auto_412467 ?auto_412470 ) ) ( not ( = ?auto_412467 ?auto_412471 ) ) ( not ( = ?auto_412467 ?auto_412472 ) ) ( not ( = ?auto_412467 ?auto_412473 ) ) ( not ( = ?auto_412467 ?auto_412474 ) ) ( not ( = ?auto_412468 ?auto_412469 ) ) ( not ( = ?auto_412468 ?auto_412470 ) ) ( not ( = ?auto_412468 ?auto_412471 ) ) ( not ( = ?auto_412468 ?auto_412472 ) ) ( not ( = ?auto_412468 ?auto_412473 ) ) ( not ( = ?auto_412468 ?auto_412474 ) ) ( not ( = ?auto_412469 ?auto_412470 ) ) ( not ( = ?auto_412469 ?auto_412471 ) ) ( not ( = ?auto_412469 ?auto_412472 ) ) ( not ( = ?auto_412469 ?auto_412473 ) ) ( not ( = ?auto_412469 ?auto_412474 ) ) ( not ( = ?auto_412470 ?auto_412471 ) ) ( not ( = ?auto_412470 ?auto_412472 ) ) ( not ( = ?auto_412470 ?auto_412473 ) ) ( not ( = ?auto_412470 ?auto_412474 ) ) ( not ( = ?auto_412471 ?auto_412472 ) ) ( not ( = ?auto_412471 ?auto_412473 ) ) ( not ( = ?auto_412471 ?auto_412474 ) ) ( not ( = ?auto_412472 ?auto_412473 ) ) ( not ( = ?auto_412472 ?auto_412474 ) ) ( not ( = ?auto_412473 ?auto_412474 ) ) ( ON ?auto_412472 ?auto_412473 ) ( ON ?auto_412471 ?auto_412472 ) ( ON ?auto_412470 ?auto_412471 ) ( ON ?auto_412469 ?auto_412470 ) ( ON ?auto_412468 ?auto_412469 ) ( ON ?auto_412467 ?auto_412468 ) ( ON ?auto_412466 ?auto_412467 ) ( ON ?auto_412465 ?auto_412466 ) ( ON ?auto_412464 ?auto_412465 ) ( CLEAR ?auto_412462 ) ( ON ?auto_412463 ?auto_412464 ) ( CLEAR ?auto_412463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_412459 ?auto_412460 ?auto_412461 ?auto_412462 ?auto_412463 )
      ( MAKE-15PILE ?auto_412459 ?auto_412460 ?auto_412461 ?auto_412462 ?auto_412463 ?auto_412464 ?auto_412465 ?auto_412466 ?auto_412467 ?auto_412468 ?auto_412469 ?auto_412470 ?auto_412471 ?auto_412472 ?auto_412473 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412490 - BLOCK
      ?auto_412491 - BLOCK
      ?auto_412492 - BLOCK
      ?auto_412493 - BLOCK
      ?auto_412494 - BLOCK
      ?auto_412495 - BLOCK
      ?auto_412496 - BLOCK
      ?auto_412497 - BLOCK
      ?auto_412498 - BLOCK
      ?auto_412499 - BLOCK
      ?auto_412500 - BLOCK
      ?auto_412501 - BLOCK
      ?auto_412502 - BLOCK
      ?auto_412503 - BLOCK
      ?auto_412504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412504 ) ( ON-TABLE ?auto_412490 ) ( ON ?auto_412491 ?auto_412490 ) ( ON ?auto_412492 ?auto_412491 ) ( ON ?auto_412493 ?auto_412492 ) ( not ( = ?auto_412490 ?auto_412491 ) ) ( not ( = ?auto_412490 ?auto_412492 ) ) ( not ( = ?auto_412490 ?auto_412493 ) ) ( not ( = ?auto_412490 ?auto_412494 ) ) ( not ( = ?auto_412490 ?auto_412495 ) ) ( not ( = ?auto_412490 ?auto_412496 ) ) ( not ( = ?auto_412490 ?auto_412497 ) ) ( not ( = ?auto_412490 ?auto_412498 ) ) ( not ( = ?auto_412490 ?auto_412499 ) ) ( not ( = ?auto_412490 ?auto_412500 ) ) ( not ( = ?auto_412490 ?auto_412501 ) ) ( not ( = ?auto_412490 ?auto_412502 ) ) ( not ( = ?auto_412490 ?auto_412503 ) ) ( not ( = ?auto_412490 ?auto_412504 ) ) ( not ( = ?auto_412491 ?auto_412492 ) ) ( not ( = ?auto_412491 ?auto_412493 ) ) ( not ( = ?auto_412491 ?auto_412494 ) ) ( not ( = ?auto_412491 ?auto_412495 ) ) ( not ( = ?auto_412491 ?auto_412496 ) ) ( not ( = ?auto_412491 ?auto_412497 ) ) ( not ( = ?auto_412491 ?auto_412498 ) ) ( not ( = ?auto_412491 ?auto_412499 ) ) ( not ( = ?auto_412491 ?auto_412500 ) ) ( not ( = ?auto_412491 ?auto_412501 ) ) ( not ( = ?auto_412491 ?auto_412502 ) ) ( not ( = ?auto_412491 ?auto_412503 ) ) ( not ( = ?auto_412491 ?auto_412504 ) ) ( not ( = ?auto_412492 ?auto_412493 ) ) ( not ( = ?auto_412492 ?auto_412494 ) ) ( not ( = ?auto_412492 ?auto_412495 ) ) ( not ( = ?auto_412492 ?auto_412496 ) ) ( not ( = ?auto_412492 ?auto_412497 ) ) ( not ( = ?auto_412492 ?auto_412498 ) ) ( not ( = ?auto_412492 ?auto_412499 ) ) ( not ( = ?auto_412492 ?auto_412500 ) ) ( not ( = ?auto_412492 ?auto_412501 ) ) ( not ( = ?auto_412492 ?auto_412502 ) ) ( not ( = ?auto_412492 ?auto_412503 ) ) ( not ( = ?auto_412492 ?auto_412504 ) ) ( not ( = ?auto_412493 ?auto_412494 ) ) ( not ( = ?auto_412493 ?auto_412495 ) ) ( not ( = ?auto_412493 ?auto_412496 ) ) ( not ( = ?auto_412493 ?auto_412497 ) ) ( not ( = ?auto_412493 ?auto_412498 ) ) ( not ( = ?auto_412493 ?auto_412499 ) ) ( not ( = ?auto_412493 ?auto_412500 ) ) ( not ( = ?auto_412493 ?auto_412501 ) ) ( not ( = ?auto_412493 ?auto_412502 ) ) ( not ( = ?auto_412493 ?auto_412503 ) ) ( not ( = ?auto_412493 ?auto_412504 ) ) ( not ( = ?auto_412494 ?auto_412495 ) ) ( not ( = ?auto_412494 ?auto_412496 ) ) ( not ( = ?auto_412494 ?auto_412497 ) ) ( not ( = ?auto_412494 ?auto_412498 ) ) ( not ( = ?auto_412494 ?auto_412499 ) ) ( not ( = ?auto_412494 ?auto_412500 ) ) ( not ( = ?auto_412494 ?auto_412501 ) ) ( not ( = ?auto_412494 ?auto_412502 ) ) ( not ( = ?auto_412494 ?auto_412503 ) ) ( not ( = ?auto_412494 ?auto_412504 ) ) ( not ( = ?auto_412495 ?auto_412496 ) ) ( not ( = ?auto_412495 ?auto_412497 ) ) ( not ( = ?auto_412495 ?auto_412498 ) ) ( not ( = ?auto_412495 ?auto_412499 ) ) ( not ( = ?auto_412495 ?auto_412500 ) ) ( not ( = ?auto_412495 ?auto_412501 ) ) ( not ( = ?auto_412495 ?auto_412502 ) ) ( not ( = ?auto_412495 ?auto_412503 ) ) ( not ( = ?auto_412495 ?auto_412504 ) ) ( not ( = ?auto_412496 ?auto_412497 ) ) ( not ( = ?auto_412496 ?auto_412498 ) ) ( not ( = ?auto_412496 ?auto_412499 ) ) ( not ( = ?auto_412496 ?auto_412500 ) ) ( not ( = ?auto_412496 ?auto_412501 ) ) ( not ( = ?auto_412496 ?auto_412502 ) ) ( not ( = ?auto_412496 ?auto_412503 ) ) ( not ( = ?auto_412496 ?auto_412504 ) ) ( not ( = ?auto_412497 ?auto_412498 ) ) ( not ( = ?auto_412497 ?auto_412499 ) ) ( not ( = ?auto_412497 ?auto_412500 ) ) ( not ( = ?auto_412497 ?auto_412501 ) ) ( not ( = ?auto_412497 ?auto_412502 ) ) ( not ( = ?auto_412497 ?auto_412503 ) ) ( not ( = ?auto_412497 ?auto_412504 ) ) ( not ( = ?auto_412498 ?auto_412499 ) ) ( not ( = ?auto_412498 ?auto_412500 ) ) ( not ( = ?auto_412498 ?auto_412501 ) ) ( not ( = ?auto_412498 ?auto_412502 ) ) ( not ( = ?auto_412498 ?auto_412503 ) ) ( not ( = ?auto_412498 ?auto_412504 ) ) ( not ( = ?auto_412499 ?auto_412500 ) ) ( not ( = ?auto_412499 ?auto_412501 ) ) ( not ( = ?auto_412499 ?auto_412502 ) ) ( not ( = ?auto_412499 ?auto_412503 ) ) ( not ( = ?auto_412499 ?auto_412504 ) ) ( not ( = ?auto_412500 ?auto_412501 ) ) ( not ( = ?auto_412500 ?auto_412502 ) ) ( not ( = ?auto_412500 ?auto_412503 ) ) ( not ( = ?auto_412500 ?auto_412504 ) ) ( not ( = ?auto_412501 ?auto_412502 ) ) ( not ( = ?auto_412501 ?auto_412503 ) ) ( not ( = ?auto_412501 ?auto_412504 ) ) ( not ( = ?auto_412502 ?auto_412503 ) ) ( not ( = ?auto_412502 ?auto_412504 ) ) ( not ( = ?auto_412503 ?auto_412504 ) ) ( ON ?auto_412503 ?auto_412504 ) ( ON ?auto_412502 ?auto_412503 ) ( ON ?auto_412501 ?auto_412502 ) ( ON ?auto_412500 ?auto_412501 ) ( ON ?auto_412499 ?auto_412500 ) ( ON ?auto_412498 ?auto_412499 ) ( ON ?auto_412497 ?auto_412498 ) ( ON ?auto_412496 ?auto_412497 ) ( ON ?auto_412495 ?auto_412496 ) ( CLEAR ?auto_412493 ) ( ON ?auto_412494 ?auto_412495 ) ( CLEAR ?auto_412494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_412490 ?auto_412491 ?auto_412492 ?auto_412493 ?auto_412494 )
      ( MAKE-15PILE ?auto_412490 ?auto_412491 ?auto_412492 ?auto_412493 ?auto_412494 ?auto_412495 ?auto_412496 ?auto_412497 ?auto_412498 ?auto_412499 ?auto_412500 ?auto_412501 ?auto_412502 ?auto_412503 ?auto_412504 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412520 - BLOCK
      ?auto_412521 - BLOCK
      ?auto_412522 - BLOCK
      ?auto_412523 - BLOCK
      ?auto_412524 - BLOCK
      ?auto_412525 - BLOCK
      ?auto_412526 - BLOCK
      ?auto_412527 - BLOCK
      ?auto_412528 - BLOCK
      ?auto_412529 - BLOCK
      ?auto_412530 - BLOCK
      ?auto_412531 - BLOCK
      ?auto_412532 - BLOCK
      ?auto_412533 - BLOCK
      ?auto_412534 - BLOCK
    )
    :vars
    (
      ?auto_412535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412534 ?auto_412535 ) ( ON-TABLE ?auto_412520 ) ( ON ?auto_412521 ?auto_412520 ) ( ON ?auto_412522 ?auto_412521 ) ( not ( = ?auto_412520 ?auto_412521 ) ) ( not ( = ?auto_412520 ?auto_412522 ) ) ( not ( = ?auto_412520 ?auto_412523 ) ) ( not ( = ?auto_412520 ?auto_412524 ) ) ( not ( = ?auto_412520 ?auto_412525 ) ) ( not ( = ?auto_412520 ?auto_412526 ) ) ( not ( = ?auto_412520 ?auto_412527 ) ) ( not ( = ?auto_412520 ?auto_412528 ) ) ( not ( = ?auto_412520 ?auto_412529 ) ) ( not ( = ?auto_412520 ?auto_412530 ) ) ( not ( = ?auto_412520 ?auto_412531 ) ) ( not ( = ?auto_412520 ?auto_412532 ) ) ( not ( = ?auto_412520 ?auto_412533 ) ) ( not ( = ?auto_412520 ?auto_412534 ) ) ( not ( = ?auto_412520 ?auto_412535 ) ) ( not ( = ?auto_412521 ?auto_412522 ) ) ( not ( = ?auto_412521 ?auto_412523 ) ) ( not ( = ?auto_412521 ?auto_412524 ) ) ( not ( = ?auto_412521 ?auto_412525 ) ) ( not ( = ?auto_412521 ?auto_412526 ) ) ( not ( = ?auto_412521 ?auto_412527 ) ) ( not ( = ?auto_412521 ?auto_412528 ) ) ( not ( = ?auto_412521 ?auto_412529 ) ) ( not ( = ?auto_412521 ?auto_412530 ) ) ( not ( = ?auto_412521 ?auto_412531 ) ) ( not ( = ?auto_412521 ?auto_412532 ) ) ( not ( = ?auto_412521 ?auto_412533 ) ) ( not ( = ?auto_412521 ?auto_412534 ) ) ( not ( = ?auto_412521 ?auto_412535 ) ) ( not ( = ?auto_412522 ?auto_412523 ) ) ( not ( = ?auto_412522 ?auto_412524 ) ) ( not ( = ?auto_412522 ?auto_412525 ) ) ( not ( = ?auto_412522 ?auto_412526 ) ) ( not ( = ?auto_412522 ?auto_412527 ) ) ( not ( = ?auto_412522 ?auto_412528 ) ) ( not ( = ?auto_412522 ?auto_412529 ) ) ( not ( = ?auto_412522 ?auto_412530 ) ) ( not ( = ?auto_412522 ?auto_412531 ) ) ( not ( = ?auto_412522 ?auto_412532 ) ) ( not ( = ?auto_412522 ?auto_412533 ) ) ( not ( = ?auto_412522 ?auto_412534 ) ) ( not ( = ?auto_412522 ?auto_412535 ) ) ( not ( = ?auto_412523 ?auto_412524 ) ) ( not ( = ?auto_412523 ?auto_412525 ) ) ( not ( = ?auto_412523 ?auto_412526 ) ) ( not ( = ?auto_412523 ?auto_412527 ) ) ( not ( = ?auto_412523 ?auto_412528 ) ) ( not ( = ?auto_412523 ?auto_412529 ) ) ( not ( = ?auto_412523 ?auto_412530 ) ) ( not ( = ?auto_412523 ?auto_412531 ) ) ( not ( = ?auto_412523 ?auto_412532 ) ) ( not ( = ?auto_412523 ?auto_412533 ) ) ( not ( = ?auto_412523 ?auto_412534 ) ) ( not ( = ?auto_412523 ?auto_412535 ) ) ( not ( = ?auto_412524 ?auto_412525 ) ) ( not ( = ?auto_412524 ?auto_412526 ) ) ( not ( = ?auto_412524 ?auto_412527 ) ) ( not ( = ?auto_412524 ?auto_412528 ) ) ( not ( = ?auto_412524 ?auto_412529 ) ) ( not ( = ?auto_412524 ?auto_412530 ) ) ( not ( = ?auto_412524 ?auto_412531 ) ) ( not ( = ?auto_412524 ?auto_412532 ) ) ( not ( = ?auto_412524 ?auto_412533 ) ) ( not ( = ?auto_412524 ?auto_412534 ) ) ( not ( = ?auto_412524 ?auto_412535 ) ) ( not ( = ?auto_412525 ?auto_412526 ) ) ( not ( = ?auto_412525 ?auto_412527 ) ) ( not ( = ?auto_412525 ?auto_412528 ) ) ( not ( = ?auto_412525 ?auto_412529 ) ) ( not ( = ?auto_412525 ?auto_412530 ) ) ( not ( = ?auto_412525 ?auto_412531 ) ) ( not ( = ?auto_412525 ?auto_412532 ) ) ( not ( = ?auto_412525 ?auto_412533 ) ) ( not ( = ?auto_412525 ?auto_412534 ) ) ( not ( = ?auto_412525 ?auto_412535 ) ) ( not ( = ?auto_412526 ?auto_412527 ) ) ( not ( = ?auto_412526 ?auto_412528 ) ) ( not ( = ?auto_412526 ?auto_412529 ) ) ( not ( = ?auto_412526 ?auto_412530 ) ) ( not ( = ?auto_412526 ?auto_412531 ) ) ( not ( = ?auto_412526 ?auto_412532 ) ) ( not ( = ?auto_412526 ?auto_412533 ) ) ( not ( = ?auto_412526 ?auto_412534 ) ) ( not ( = ?auto_412526 ?auto_412535 ) ) ( not ( = ?auto_412527 ?auto_412528 ) ) ( not ( = ?auto_412527 ?auto_412529 ) ) ( not ( = ?auto_412527 ?auto_412530 ) ) ( not ( = ?auto_412527 ?auto_412531 ) ) ( not ( = ?auto_412527 ?auto_412532 ) ) ( not ( = ?auto_412527 ?auto_412533 ) ) ( not ( = ?auto_412527 ?auto_412534 ) ) ( not ( = ?auto_412527 ?auto_412535 ) ) ( not ( = ?auto_412528 ?auto_412529 ) ) ( not ( = ?auto_412528 ?auto_412530 ) ) ( not ( = ?auto_412528 ?auto_412531 ) ) ( not ( = ?auto_412528 ?auto_412532 ) ) ( not ( = ?auto_412528 ?auto_412533 ) ) ( not ( = ?auto_412528 ?auto_412534 ) ) ( not ( = ?auto_412528 ?auto_412535 ) ) ( not ( = ?auto_412529 ?auto_412530 ) ) ( not ( = ?auto_412529 ?auto_412531 ) ) ( not ( = ?auto_412529 ?auto_412532 ) ) ( not ( = ?auto_412529 ?auto_412533 ) ) ( not ( = ?auto_412529 ?auto_412534 ) ) ( not ( = ?auto_412529 ?auto_412535 ) ) ( not ( = ?auto_412530 ?auto_412531 ) ) ( not ( = ?auto_412530 ?auto_412532 ) ) ( not ( = ?auto_412530 ?auto_412533 ) ) ( not ( = ?auto_412530 ?auto_412534 ) ) ( not ( = ?auto_412530 ?auto_412535 ) ) ( not ( = ?auto_412531 ?auto_412532 ) ) ( not ( = ?auto_412531 ?auto_412533 ) ) ( not ( = ?auto_412531 ?auto_412534 ) ) ( not ( = ?auto_412531 ?auto_412535 ) ) ( not ( = ?auto_412532 ?auto_412533 ) ) ( not ( = ?auto_412532 ?auto_412534 ) ) ( not ( = ?auto_412532 ?auto_412535 ) ) ( not ( = ?auto_412533 ?auto_412534 ) ) ( not ( = ?auto_412533 ?auto_412535 ) ) ( not ( = ?auto_412534 ?auto_412535 ) ) ( ON ?auto_412533 ?auto_412534 ) ( ON ?auto_412532 ?auto_412533 ) ( ON ?auto_412531 ?auto_412532 ) ( ON ?auto_412530 ?auto_412531 ) ( ON ?auto_412529 ?auto_412530 ) ( ON ?auto_412528 ?auto_412529 ) ( ON ?auto_412527 ?auto_412528 ) ( ON ?auto_412526 ?auto_412527 ) ( ON ?auto_412525 ?auto_412526 ) ( ON ?auto_412524 ?auto_412525 ) ( CLEAR ?auto_412522 ) ( ON ?auto_412523 ?auto_412524 ) ( CLEAR ?auto_412523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_412520 ?auto_412521 ?auto_412522 ?auto_412523 )
      ( MAKE-15PILE ?auto_412520 ?auto_412521 ?auto_412522 ?auto_412523 ?auto_412524 ?auto_412525 ?auto_412526 ?auto_412527 ?auto_412528 ?auto_412529 ?auto_412530 ?auto_412531 ?auto_412532 ?auto_412533 ?auto_412534 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412551 - BLOCK
      ?auto_412552 - BLOCK
      ?auto_412553 - BLOCK
      ?auto_412554 - BLOCK
      ?auto_412555 - BLOCK
      ?auto_412556 - BLOCK
      ?auto_412557 - BLOCK
      ?auto_412558 - BLOCK
      ?auto_412559 - BLOCK
      ?auto_412560 - BLOCK
      ?auto_412561 - BLOCK
      ?auto_412562 - BLOCK
      ?auto_412563 - BLOCK
      ?auto_412564 - BLOCK
      ?auto_412565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412565 ) ( ON-TABLE ?auto_412551 ) ( ON ?auto_412552 ?auto_412551 ) ( ON ?auto_412553 ?auto_412552 ) ( not ( = ?auto_412551 ?auto_412552 ) ) ( not ( = ?auto_412551 ?auto_412553 ) ) ( not ( = ?auto_412551 ?auto_412554 ) ) ( not ( = ?auto_412551 ?auto_412555 ) ) ( not ( = ?auto_412551 ?auto_412556 ) ) ( not ( = ?auto_412551 ?auto_412557 ) ) ( not ( = ?auto_412551 ?auto_412558 ) ) ( not ( = ?auto_412551 ?auto_412559 ) ) ( not ( = ?auto_412551 ?auto_412560 ) ) ( not ( = ?auto_412551 ?auto_412561 ) ) ( not ( = ?auto_412551 ?auto_412562 ) ) ( not ( = ?auto_412551 ?auto_412563 ) ) ( not ( = ?auto_412551 ?auto_412564 ) ) ( not ( = ?auto_412551 ?auto_412565 ) ) ( not ( = ?auto_412552 ?auto_412553 ) ) ( not ( = ?auto_412552 ?auto_412554 ) ) ( not ( = ?auto_412552 ?auto_412555 ) ) ( not ( = ?auto_412552 ?auto_412556 ) ) ( not ( = ?auto_412552 ?auto_412557 ) ) ( not ( = ?auto_412552 ?auto_412558 ) ) ( not ( = ?auto_412552 ?auto_412559 ) ) ( not ( = ?auto_412552 ?auto_412560 ) ) ( not ( = ?auto_412552 ?auto_412561 ) ) ( not ( = ?auto_412552 ?auto_412562 ) ) ( not ( = ?auto_412552 ?auto_412563 ) ) ( not ( = ?auto_412552 ?auto_412564 ) ) ( not ( = ?auto_412552 ?auto_412565 ) ) ( not ( = ?auto_412553 ?auto_412554 ) ) ( not ( = ?auto_412553 ?auto_412555 ) ) ( not ( = ?auto_412553 ?auto_412556 ) ) ( not ( = ?auto_412553 ?auto_412557 ) ) ( not ( = ?auto_412553 ?auto_412558 ) ) ( not ( = ?auto_412553 ?auto_412559 ) ) ( not ( = ?auto_412553 ?auto_412560 ) ) ( not ( = ?auto_412553 ?auto_412561 ) ) ( not ( = ?auto_412553 ?auto_412562 ) ) ( not ( = ?auto_412553 ?auto_412563 ) ) ( not ( = ?auto_412553 ?auto_412564 ) ) ( not ( = ?auto_412553 ?auto_412565 ) ) ( not ( = ?auto_412554 ?auto_412555 ) ) ( not ( = ?auto_412554 ?auto_412556 ) ) ( not ( = ?auto_412554 ?auto_412557 ) ) ( not ( = ?auto_412554 ?auto_412558 ) ) ( not ( = ?auto_412554 ?auto_412559 ) ) ( not ( = ?auto_412554 ?auto_412560 ) ) ( not ( = ?auto_412554 ?auto_412561 ) ) ( not ( = ?auto_412554 ?auto_412562 ) ) ( not ( = ?auto_412554 ?auto_412563 ) ) ( not ( = ?auto_412554 ?auto_412564 ) ) ( not ( = ?auto_412554 ?auto_412565 ) ) ( not ( = ?auto_412555 ?auto_412556 ) ) ( not ( = ?auto_412555 ?auto_412557 ) ) ( not ( = ?auto_412555 ?auto_412558 ) ) ( not ( = ?auto_412555 ?auto_412559 ) ) ( not ( = ?auto_412555 ?auto_412560 ) ) ( not ( = ?auto_412555 ?auto_412561 ) ) ( not ( = ?auto_412555 ?auto_412562 ) ) ( not ( = ?auto_412555 ?auto_412563 ) ) ( not ( = ?auto_412555 ?auto_412564 ) ) ( not ( = ?auto_412555 ?auto_412565 ) ) ( not ( = ?auto_412556 ?auto_412557 ) ) ( not ( = ?auto_412556 ?auto_412558 ) ) ( not ( = ?auto_412556 ?auto_412559 ) ) ( not ( = ?auto_412556 ?auto_412560 ) ) ( not ( = ?auto_412556 ?auto_412561 ) ) ( not ( = ?auto_412556 ?auto_412562 ) ) ( not ( = ?auto_412556 ?auto_412563 ) ) ( not ( = ?auto_412556 ?auto_412564 ) ) ( not ( = ?auto_412556 ?auto_412565 ) ) ( not ( = ?auto_412557 ?auto_412558 ) ) ( not ( = ?auto_412557 ?auto_412559 ) ) ( not ( = ?auto_412557 ?auto_412560 ) ) ( not ( = ?auto_412557 ?auto_412561 ) ) ( not ( = ?auto_412557 ?auto_412562 ) ) ( not ( = ?auto_412557 ?auto_412563 ) ) ( not ( = ?auto_412557 ?auto_412564 ) ) ( not ( = ?auto_412557 ?auto_412565 ) ) ( not ( = ?auto_412558 ?auto_412559 ) ) ( not ( = ?auto_412558 ?auto_412560 ) ) ( not ( = ?auto_412558 ?auto_412561 ) ) ( not ( = ?auto_412558 ?auto_412562 ) ) ( not ( = ?auto_412558 ?auto_412563 ) ) ( not ( = ?auto_412558 ?auto_412564 ) ) ( not ( = ?auto_412558 ?auto_412565 ) ) ( not ( = ?auto_412559 ?auto_412560 ) ) ( not ( = ?auto_412559 ?auto_412561 ) ) ( not ( = ?auto_412559 ?auto_412562 ) ) ( not ( = ?auto_412559 ?auto_412563 ) ) ( not ( = ?auto_412559 ?auto_412564 ) ) ( not ( = ?auto_412559 ?auto_412565 ) ) ( not ( = ?auto_412560 ?auto_412561 ) ) ( not ( = ?auto_412560 ?auto_412562 ) ) ( not ( = ?auto_412560 ?auto_412563 ) ) ( not ( = ?auto_412560 ?auto_412564 ) ) ( not ( = ?auto_412560 ?auto_412565 ) ) ( not ( = ?auto_412561 ?auto_412562 ) ) ( not ( = ?auto_412561 ?auto_412563 ) ) ( not ( = ?auto_412561 ?auto_412564 ) ) ( not ( = ?auto_412561 ?auto_412565 ) ) ( not ( = ?auto_412562 ?auto_412563 ) ) ( not ( = ?auto_412562 ?auto_412564 ) ) ( not ( = ?auto_412562 ?auto_412565 ) ) ( not ( = ?auto_412563 ?auto_412564 ) ) ( not ( = ?auto_412563 ?auto_412565 ) ) ( not ( = ?auto_412564 ?auto_412565 ) ) ( ON ?auto_412564 ?auto_412565 ) ( ON ?auto_412563 ?auto_412564 ) ( ON ?auto_412562 ?auto_412563 ) ( ON ?auto_412561 ?auto_412562 ) ( ON ?auto_412560 ?auto_412561 ) ( ON ?auto_412559 ?auto_412560 ) ( ON ?auto_412558 ?auto_412559 ) ( ON ?auto_412557 ?auto_412558 ) ( ON ?auto_412556 ?auto_412557 ) ( ON ?auto_412555 ?auto_412556 ) ( CLEAR ?auto_412553 ) ( ON ?auto_412554 ?auto_412555 ) ( CLEAR ?auto_412554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_412551 ?auto_412552 ?auto_412553 ?auto_412554 )
      ( MAKE-15PILE ?auto_412551 ?auto_412552 ?auto_412553 ?auto_412554 ?auto_412555 ?auto_412556 ?auto_412557 ?auto_412558 ?auto_412559 ?auto_412560 ?auto_412561 ?auto_412562 ?auto_412563 ?auto_412564 ?auto_412565 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412581 - BLOCK
      ?auto_412582 - BLOCK
      ?auto_412583 - BLOCK
      ?auto_412584 - BLOCK
      ?auto_412585 - BLOCK
      ?auto_412586 - BLOCK
      ?auto_412587 - BLOCK
      ?auto_412588 - BLOCK
      ?auto_412589 - BLOCK
      ?auto_412590 - BLOCK
      ?auto_412591 - BLOCK
      ?auto_412592 - BLOCK
      ?auto_412593 - BLOCK
      ?auto_412594 - BLOCK
      ?auto_412595 - BLOCK
    )
    :vars
    (
      ?auto_412596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412595 ?auto_412596 ) ( ON-TABLE ?auto_412581 ) ( ON ?auto_412582 ?auto_412581 ) ( not ( = ?auto_412581 ?auto_412582 ) ) ( not ( = ?auto_412581 ?auto_412583 ) ) ( not ( = ?auto_412581 ?auto_412584 ) ) ( not ( = ?auto_412581 ?auto_412585 ) ) ( not ( = ?auto_412581 ?auto_412586 ) ) ( not ( = ?auto_412581 ?auto_412587 ) ) ( not ( = ?auto_412581 ?auto_412588 ) ) ( not ( = ?auto_412581 ?auto_412589 ) ) ( not ( = ?auto_412581 ?auto_412590 ) ) ( not ( = ?auto_412581 ?auto_412591 ) ) ( not ( = ?auto_412581 ?auto_412592 ) ) ( not ( = ?auto_412581 ?auto_412593 ) ) ( not ( = ?auto_412581 ?auto_412594 ) ) ( not ( = ?auto_412581 ?auto_412595 ) ) ( not ( = ?auto_412581 ?auto_412596 ) ) ( not ( = ?auto_412582 ?auto_412583 ) ) ( not ( = ?auto_412582 ?auto_412584 ) ) ( not ( = ?auto_412582 ?auto_412585 ) ) ( not ( = ?auto_412582 ?auto_412586 ) ) ( not ( = ?auto_412582 ?auto_412587 ) ) ( not ( = ?auto_412582 ?auto_412588 ) ) ( not ( = ?auto_412582 ?auto_412589 ) ) ( not ( = ?auto_412582 ?auto_412590 ) ) ( not ( = ?auto_412582 ?auto_412591 ) ) ( not ( = ?auto_412582 ?auto_412592 ) ) ( not ( = ?auto_412582 ?auto_412593 ) ) ( not ( = ?auto_412582 ?auto_412594 ) ) ( not ( = ?auto_412582 ?auto_412595 ) ) ( not ( = ?auto_412582 ?auto_412596 ) ) ( not ( = ?auto_412583 ?auto_412584 ) ) ( not ( = ?auto_412583 ?auto_412585 ) ) ( not ( = ?auto_412583 ?auto_412586 ) ) ( not ( = ?auto_412583 ?auto_412587 ) ) ( not ( = ?auto_412583 ?auto_412588 ) ) ( not ( = ?auto_412583 ?auto_412589 ) ) ( not ( = ?auto_412583 ?auto_412590 ) ) ( not ( = ?auto_412583 ?auto_412591 ) ) ( not ( = ?auto_412583 ?auto_412592 ) ) ( not ( = ?auto_412583 ?auto_412593 ) ) ( not ( = ?auto_412583 ?auto_412594 ) ) ( not ( = ?auto_412583 ?auto_412595 ) ) ( not ( = ?auto_412583 ?auto_412596 ) ) ( not ( = ?auto_412584 ?auto_412585 ) ) ( not ( = ?auto_412584 ?auto_412586 ) ) ( not ( = ?auto_412584 ?auto_412587 ) ) ( not ( = ?auto_412584 ?auto_412588 ) ) ( not ( = ?auto_412584 ?auto_412589 ) ) ( not ( = ?auto_412584 ?auto_412590 ) ) ( not ( = ?auto_412584 ?auto_412591 ) ) ( not ( = ?auto_412584 ?auto_412592 ) ) ( not ( = ?auto_412584 ?auto_412593 ) ) ( not ( = ?auto_412584 ?auto_412594 ) ) ( not ( = ?auto_412584 ?auto_412595 ) ) ( not ( = ?auto_412584 ?auto_412596 ) ) ( not ( = ?auto_412585 ?auto_412586 ) ) ( not ( = ?auto_412585 ?auto_412587 ) ) ( not ( = ?auto_412585 ?auto_412588 ) ) ( not ( = ?auto_412585 ?auto_412589 ) ) ( not ( = ?auto_412585 ?auto_412590 ) ) ( not ( = ?auto_412585 ?auto_412591 ) ) ( not ( = ?auto_412585 ?auto_412592 ) ) ( not ( = ?auto_412585 ?auto_412593 ) ) ( not ( = ?auto_412585 ?auto_412594 ) ) ( not ( = ?auto_412585 ?auto_412595 ) ) ( not ( = ?auto_412585 ?auto_412596 ) ) ( not ( = ?auto_412586 ?auto_412587 ) ) ( not ( = ?auto_412586 ?auto_412588 ) ) ( not ( = ?auto_412586 ?auto_412589 ) ) ( not ( = ?auto_412586 ?auto_412590 ) ) ( not ( = ?auto_412586 ?auto_412591 ) ) ( not ( = ?auto_412586 ?auto_412592 ) ) ( not ( = ?auto_412586 ?auto_412593 ) ) ( not ( = ?auto_412586 ?auto_412594 ) ) ( not ( = ?auto_412586 ?auto_412595 ) ) ( not ( = ?auto_412586 ?auto_412596 ) ) ( not ( = ?auto_412587 ?auto_412588 ) ) ( not ( = ?auto_412587 ?auto_412589 ) ) ( not ( = ?auto_412587 ?auto_412590 ) ) ( not ( = ?auto_412587 ?auto_412591 ) ) ( not ( = ?auto_412587 ?auto_412592 ) ) ( not ( = ?auto_412587 ?auto_412593 ) ) ( not ( = ?auto_412587 ?auto_412594 ) ) ( not ( = ?auto_412587 ?auto_412595 ) ) ( not ( = ?auto_412587 ?auto_412596 ) ) ( not ( = ?auto_412588 ?auto_412589 ) ) ( not ( = ?auto_412588 ?auto_412590 ) ) ( not ( = ?auto_412588 ?auto_412591 ) ) ( not ( = ?auto_412588 ?auto_412592 ) ) ( not ( = ?auto_412588 ?auto_412593 ) ) ( not ( = ?auto_412588 ?auto_412594 ) ) ( not ( = ?auto_412588 ?auto_412595 ) ) ( not ( = ?auto_412588 ?auto_412596 ) ) ( not ( = ?auto_412589 ?auto_412590 ) ) ( not ( = ?auto_412589 ?auto_412591 ) ) ( not ( = ?auto_412589 ?auto_412592 ) ) ( not ( = ?auto_412589 ?auto_412593 ) ) ( not ( = ?auto_412589 ?auto_412594 ) ) ( not ( = ?auto_412589 ?auto_412595 ) ) ( not ( = ?auto_412589 ?auto_412596 ) ) ( not ( = ?auto_412590 ?auto_412591 ) ) ( not ( = ?auto_412590 ?auto_412592 ) ) ( not ( = ?auto_412590 ?auto_412593 ) ) ( not ( = ?auto_412590 ?auto_412594 ) ) ( not ( = ?auto_412590 ?auto_412595 ) ) ( not ( = ?auto_412590 ?auto_412596 ) ) ( not ( = ?auto_412591 ?auto_412592 ) ) ( not ( = ?auto_412591 ?auto_412593 ) ) ( not ( = ?auto_412591 ?auto_412594 ) ) ( not ( = ?auto_412591 ?auto_412595 ) ) ( not ( = ?auto_412591 ?auto_412596 ) ) ( not ( = ?auto_412592 ?auto_412593 ) ) ( not ( = ?auto_412592 ?auto_412594 ) ) ( not ( = ?auto_412592 ?auto_412595 ) ) ( not ( = ?auto_412592 ?auto_412596 ) ) ( not ( = ?auto_412593 ?auto_412594 ) ) ( not ( = ?auto_412593 ?auto_412595 ) ) ( not ( = ?auto_412593 ?auto_412596 ) ) ( not ( = ?auto_412594 ?auto_412595 ) ) ( not ( = ?auto_412594 ?auto_412596 ) ) ( not ( = ?auto_412595 ?auto_412596 ) ) ( ON ?auto_412594 ?auto_412595 ) ( ON ?auto_412593 ?auto_412594 ) ( ON ?auto_412592 ?auto_412593 ) ( ON ?auto_412591 ?auto_412592 ) ( ON ?auto_412590 ?auto_412591 ) ( ON ?auto_412589 ?auto_412590 ) ( ON ?auto_412588 ?auto_412589 ) ( ON ?auto_412587 ?auto_412588 ) ( ON ?auto_412586 ?auto_412587 ) ( ON ?auto_412585 ?auto_412586 ) ( ON ?auto_412584 ?auto_412585 ) ( CLEAR ?auto_412582 ) ( ON ?auto_412583 ?auto_412584 ) ( CLEAR ?auto_412583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_412581 ?auto_412582 ?auto_412583 )
      ( MAKE-15PILE ?auto_412581 ?auto_412582 ?auto_412583 ?auto_412584 ?auto_412585 ?auto_412586 ?auto_412587 ?auto_412588 ?auto_412589 ?auto_412590 ?auto_412591 ?auto_412592 ?auto_412593 ?auto_412594 ?auto_412595 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412612 - BLOCK
      ?auto_412613 - BLOCK
      ?auto_412614 - BLOCK
      ?auto_412615 - BLOCK
      ?auto_412616 - BLOCK
      ?auto_412617 - BLOCK
      ?auto_412618 - BLOCK
      ?auto_412619 - BLOCK
      ?auto_412620 - BLOCK
      ?auto_412621 - BLOCK
      ?auto_412622 - BLOCK
      ?auto_412623 - BLOCK
      ?auto_412624 - BLOCK
      ?auto_412625 - BLOCK
      ?auto_412626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412626 ) ( ON-TABLE ?auto_412612 ) ( ON ?auto_412613 ?auto_412612 ) ( not ( = ?auto_412612 ?auto_412613 ) ) ( not ( = ?auto_412612 ?auto_412614 ) ) ( not ( = ?auto_412612 ?auto_412615 ) ) ( not ( = ?auto_412612 ?auto_412616 ) ) ( not ( = ?auto_412612 ?auto_412617 ) ) ( not ( = ?auto_412612 ?auto_412618 ) ) ( not ( = ?auto_412612 ?auto_412619 ) ) ( not ( = ?auto_412612 ?auto_412620 ) ) ( not ( = ?auto_412612 ?auto_412621 ) ) ( not ( = ?auto_412612 ?auto_412622 ) ) ( not ( = ?auto_412612 ?auto_412623 ) ) ( not ( = ?auto_412612 ?auto_412624 ) ) ( not ( = ?auto_412612 ?auto_412625 ) ) ( not ( = ?auto_412612 ?auto_412626 ) ) ( not ( = ?auto_412613 ?auto_412614 ) ) ( not ( = ?auto_412613 ?auto_412615 ) ) ( not ( = ?auto_412613 ?auto_412616 ) ) ( not ( = ?auto_412613 ?auto_412617 ) ) ( not ( = ?auto_412613 ?auto_412618 ) ) ( not ( = ?auto_412613 ?auto_412619 ) ) ( not ( = ?auto_412613 ?auto_412620 ) ) ( not ( = ?auto_412613 ?auto_412621 ) ) ( not ( = ?auto_412613 ?auto_412622 ) ) ( not ( = ?auto_412613 ?auto_412623 ) ) ( not ( = ?auto_412613 ?auto_412624 ) ) ( not ( = ?auto_412613 ?auto_412625 ) ) ( not ( = ?auto_412613 ?auto_412626 ) ) ( not ( = ?auto_412614 ?auto_412615 ) ) ( not ( = ?auto_412614 ?auto_412616 ) ) ( not ( = ?auto_412614 ?auto_412617 ) ) ( not ( = ?auto_412614 ?auto_412618 ) ) ( not ( = ?auto_412614 ?auto_412619 ) ) ( not ( = ?auto_412614 ?auto_412620 ) ) ( not ( = ?auto_412614 ?auto_412621 ) ) ( not ( = ?auto_412614 ?auto_412622 ) ) ( not ( = ?auto_412614 ?auto_412623 ) ) ( not ( = ?auto_412614 ?auto_412624 ) ) ( not ( = ?auto_412614 ?auto_412625 ) ) ( not ( = ?auto_412614 ?auto_412626 ) ) ( not ( = ?auto_412615 ?auto_412616 ) ) ( not ( = ?auto_412615 ?auto_412617 ) ) ( not ( = ?auto_412615 ?auto_412618 ) ) ( not ( = ?auto_412615 ?auto_412619 ) ) ( not ( = ?auto_412615 ?auto_412620 ) ) ( not ( = ?auto_412615 ?auto_412621 ) ) ( not ( = ?auto_412615 ?auto_412622 ) ) ( not ( = ?auto_412615 ?auto_412623 ) ) ( not ( = ?auto_412615 ?auto_412624 ) ) ( not ( = ?auto_412615 ?auto_412625 ) ) ( not ( = ?auto_412615 ?auto_412626 ) ) ( not ( = ?auto_412616 ?auto_412617 ) ) ( not ( = ?auto_412616 ?auto_412618 ) ) ( not ( = ?auto_412616 ?auto_412619 ) ) ( not ( = ?auto_412616 ?auto_412620 ) ) ( not ( = ?auto_412616 ?auto_412621 ) ) ( not ( = ?auto_412616 ?auto_412622 ) ) ( not ( = ?auto_412616 ?auto_412623 ) ) ( not ( = ?auto_412616 ?auto_412624 ) ) ( not ( = ?auto_412616 ?auto_412625 ) ) ( not ( = ?auto_412616 ?auto_412626 ) ) ( not ( = ?auto_412617 ?auto_412618 ) ) ( not ( = ?auto_412617 ?auto_412619 ) ) ( not ( = ?auto_412617 ?auto_412620 ) ) ( not ( = ?auto_412617 ?auto_412621 ) ) ( not ( = ?auto_412617 ?auto_412622 ) ) ( not ( = ?auto_412617 ?auto_412623 ) ) ( not ( = ?auto_412617 ?auto_412624 ) ) ( not ( = ?auto_412617 ?auto_412625 ) ) ( not ( = ?auto_412617 ?auto_412626 ) ) ( not ( = ?auto_412618 ?auto_412619 ) ) ( not ( = ?auto_412618 ?auto_412620 ) ) ( not ( = ?auto_412618 ?auto_412621 ) ) ( not ( = ?auto_412618 ?auto_412622 ) ) ( not ( = ?auto_412618 ?auto_412623 ) ) ( not ( = ?auto_412618 ?auto_412624 ) ) ( not ( = ?auto_412618 ?auto_412625 ) ) ( not ( = ?auto_412618 ?auto_412626 ) ) ( not ( = ?auto_412619 ?auto_412620 ) ) ( not ( = ?auto_412619 ?auto_412621 ) ) ( not ( = ?auto_412619 ?auto_412622 ) ) ( not ( = ?auto_412619 ?auto_412623 ) ) ( not ( = ?auto_412619 ?auto_412624 ) ) ( not ( = ?auto_412619 ?auto_412625 ) ) ( not ( = ?auto_412619 ?auto_412626 ) ) ( not ( = ?auto_412620 ?auto_412621 ) ) ( not ( = ?auto_412620 ?auto_412622 ) ) ( not ( = ?auto_412620 ?auto_412623 ) ) ( not ( = ?auto_412620 ?auto_412624 ) ) ( not ( = ?auto_412620 ?auto_412625 ) ) ( not ( = ?auto_412620 ?auto_412626 ) ) ( not ( = ?auto_412621 ?auto_412622 ) ) ( not ( = ?auto_412621 ?auto_412623 ) ) ( not ( = ?auto_412621 ?auto_412624 ) ) ( not ( = ?auto_412621 ?auto_412625 ) ) ( not ( = ?auto_412621 ?auto_412626 ) ) ( not ( = ?auto_412622 ?auto_412623 ) ) ( not ( = ?auto_412622 ?auto_412624 ) ) ( not ( = ?auto_412622 ?auto_412625 ) ) ( not ( = ?auto_412622 ?auto_412626 ) ) ( not ( = ?auto_412623 ?auto_412624 ) ) ( not ( = ?auto_412623 ?auto_412625 ) ) ( not ( = ?auto_412623 ?auto_412626 ) ) ( not ( = ?auto_412624 ?auto_412625 ) ) ( not ( = ?auto_412624 ?auto_412626 ) ) ( not ( = ?auto_412625 ?auto_412626 ) ) ( ON ?auto_412625 ?auto_412626 ) ( ON ?auto_412624 ?auto_412625 ) ( ON ?auto_412623 ?auto_412624 ) ( ON ?auto_412622 ?auto_412623 ) ( ON ?auto_412621 ?auto_412622 ) ( ON ?auto_412620 ?auto_412621 ) ( ON ?auto_412619 ?auto_412620 ) ( ON ?auto_412618 ?auto_412619 ) ( ON ?auto_412617 ?auto_412618 ) ( ON ?auto_412616 ?auto_412617 ) ( ON ?auto_412615 ?auto_412616 ) ( CLEAR ?auto_412613 ) ( ON ?auto_412614 ?auto_412615 ) ( CLEAR ?auto_412614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_412612 ?auto_412613 ?auto_412614 )
      ( MAKE-15PILE ?auto_412612 ?auto_412613 ?auto_412614 ?auto_412615 ?auto_412616 ?auto_412617 ?auto_412618 ?auto_412619 ?auto_412620 ?auto_412621 ?auto_412622 ?auto_412623 ?auto_412624 ?auto_412625 ?auto_412626 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412642 - BLOCK
      ?auto_412643 - BLOCK
      ?auto_412644 - BLOCK
      ?auto_412645 - BLOCK
      ?auto_412646 - BLOCK
      ?auto_412647 - BLOCK
      ?auto_412648 - BLOCK
      ?auto_412649 - BLOCK
      ?auto_412650 - BLOCK
      ?auto_412651 - BLOCK
      ?auto_412652 - BLOCK
      ?auto_412653 - BLOCK
      ?auto_412654 - BLOCK
      ?auto_412655 - BLOCK
      ?auto_412656 - BLOCK
    )
    :vars
    (
      ?auto_412657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412656 ?auto_412657 ) ( ON-TABLE ?auto_412642 ) ( not ( = ?auto_412642 ?auto_412643 ) ) ( not ( = ?auto_412642 ?auto_412644 ) ) ( not ( = ?auto_412642 ?auto_412645 ) ) ( not ( = ?auto_412642 ?auto_412646 ) ) ( not ( = ?auto_412642 ?auto_412647 ) ) ( not ( = ?auto_412642 ?auto_412648 ) ) ( not ( = ?auto_412642 ?auto_412649 ) ) ( not ( = ?auto_412642 ?auto_412650 ) ) ( not ( = ?auto_412642 ?auto_412651 ) ) ( not ( = ?auto_412642 ?auto_412652 ) ) ( not ( = ?auto_412642 ?auto_412653 ) ) ( not ( = ?auto_412642 ?auto_412654 ) ) ( not ( = ?auto_412642 ?auto_412655 ) ) ( not ( = ?auto_412642 ?auto_412656 ) ) ( not ( = ?auto_412642 ?auto_412657 ) ) ( not ( = ?auto_412643 ?auto_412644 ) ) ( not ( = ?auto_412643 ?auto_412645 ) ) ( not ( = ?auto_412643 ?auto_412646 ) ) ( not ( = ?auto_412643 ?auto_412647 ) ) ( not ( = ?auto_412643 ?auto_412648 ) ) ( not ( = ?auto_412643 ?auto_412649 ) ) ( not ( = ?auto_412643 ?auto_412650 ) ) ( not ( = ?auto_412643 ?auto_412651 ) ) ( not ( = ?auto_412643 ?auto_412652 ) ) ( not ( = ?auto_412643 ?auto_412653 ) ) ( not ( = ?auto_412643 ?auto_412654 ) ) ( not ( = ?auto_412643 ?auto_412655 ) ) ( not ( = ?auto_412643 ?auto_412656 ) ) ( not ( = ?auto_412643 ?auto_412657 ) ) ( not ( = ?auto_412644 ?auto_412645 ) ) ( not ( = ?auto_412644 ?auto_412646 ) ) ( not ( = ?auto_412644 ?auto_412647 ) ) ( not ( = ?auto_412644 ?auto_412648 ) ) ( not ( = ?auto_412644 ?auto_412649 ) ) ( not ( = ?auto_412644 ?auto_412650 ) ) ( not ( = ?auto_412644 ?auto_412651 ) ) ( not ( = ?auto_412644 ?auto_412652 ) ) ( not ( = ?auto_412644 ?auto_412653 ) ) ( not ( = ?auto_412644 ?auto_412654 ) ) ( not ( = ?auto_412644 ?auto_412655 ) ) ( not ( = ?auto_412644 ?auto_412656 ) ) ( not ( = ?auto_412644 ?auto_412657 ) ) ( not ( = ?auto_412645 ?auto_412646 ) ) ( not ( = ?auto_412645 ?auto_412647 ) ) ( not ( = ?auto_412645 ?auto_412648 ) ) ( not ( = ?auto_412645 ?auto_412649 ) ) ( not ( = ?auto_412645 ?auto_412650 ) ) ( not ( = ?auto_412645 ?auto_412651 ) ) ( not ( = ?auto_412645 ?auto_412652 ) ) ( not ( = ?auto_412645 ?auto_412653 ) ) ( not ( = ?auto_412645 ?auto_412654 ) ) ( not ( = ?auto_412645 ?auto_412655 ) ) ( not ( = ?auto_412645 ?auto_412656 ) ) ( not ( = ?auto_412645 ?auto_412657 ) ) ( not ( = ?auto_412646 ?auto_412647 ) ) ( not ( = ?auto_412646 ?auto_412648 ) ) ( not ( = ?auto_412646 ?auto_412649 ) ) ( not ( = ?auto_412646 ?auto_412650 ) ) ( not ( = ?auto_412646 ?auto_412651 ) ) ( not ( = ?auto_412646 ?auto_412652 ) ) ( not ( = ?auto_412646 ?auto_412653 ) ) ( not ( = ?auto_412646 ?auto_412654 ) ) ( not ( = ?auto_412646 ?auto_412655 ) ) ( not ( = ?auto_412646 ?auto_412656 ) ) ( not ( = ?auto_412646 ?auto_412657 ) ) ( not ( = ?auto_412647 ?auto_412648 ) ) ( not ( = ?auto_412647 ?auto_412649 ) ) ( not ( = ?auto_412647 ?auto_412650 ) ) ( not ( = ?auto_412647 ?auto_412651 ) ) ( not ( = ?auto_412647 ?auto_412652 ) ) ( not ( = ?auto_412647 ?auto_412653 ) ) ( not ( = ?auto_412647 ?auto_412654 ) ) ( not ( = ?auto_412647 ?auto_412655 ) ) ( not ( = ?auto_412647 ?auto_412656 ) ) ( not ( = ?auto_412647 ?auto_412657 ) ) ( not ( = ?auto_412648 ?auto_412649 ) ) ( not ( = ?auto_412648 ?auto_412650 ) ) ( not ( = ?auto_412648 ?auto_412651 ) ) ( not ( = ?auto_412648 ?auto_412652 ) ) ( not ( = ?auto_412648 ?auto_412653 ) ) ( not ( = ?auto_412648 ?auto_412654 ) ) ( not ( = ?auto_412648 ?auto_412655 ) ) ( not ( = ?auto_412648 ?auto_412656 ) ) ( not ( = ?auto_412648 ?auto_412657 ) ) ( not ( = ?auto_412649 ?auto_412650 ) ) ( not ( = ?auto_412649 ?auto_412651 ) ) ( not ( = ?auto_412649 ?auto_412652 ) ) ( not ( = ?auto_412649 ?auto_412653 ) ) ( not ( = ?auto_412649 ?auto_412654 ) ) ( not ( = ?auto_412649 ?auto_412655 ) ) ( not ( = ?auto_412649 ?auto_412656 ) ) ( not ( = ?auto_412649 ?auto_412657 ) ) ( not ( = ?auto_412650 ?auto_412651 ) ) ( not ( = ?auto_412650 ?auto_412652 ) ) ( not ( = ?auto_412650 ?auto_412653 ) ) ( not ( = ?auto_412650 ?auto_412654 ) ) ( not ( = ?auto_412650 ?auto_412655 ) ) ( not ( = ?auto_412650 ?auto_412656 ) ) ( not ( = ?auto_412650 ?auto_412657 ) ) ( not ( = ?auto_412651 ?auto_412652 ) ) ( not ( = ?auto_412651 ?auto_412653 ) ) ( not ( = ?auto_412651 ?auto_412654 ) ) ( not ( = ?auto_412651 ?auto_412655 ) ) ( not ( = ?auto_412651 ?auto_412656 ) ) ( not ( = ?auto_412651 ?auto_412657 ) ) ( not ( = ?auto_412652 ?auto_412653 ) ) ( not ( = ?auto_412652 ?auto_412654 ) ) ( not ( = ?auto_412652 ?auto_412655 ) ) ( not ( = ?auto_412652 ?auto_412656 ) ) ( not ( = ?auto_412652 ?auto_412657 ) ) ( not ( = ?auto_412653 ?auto_412654 ) ) ( not ( = ?auto_412653 ?auto_412655 ) ) ( not ( = ?auto_412653 ?auto_412656 ) ) ( not ( = ?auto_412653 ?auto_412657 ) ) ( not ( = ?auto_412654 ?auto_412655 ) ) ( not ( = ?auto_412654 ?auto_412656 ) ) ( not ( = ?auto_412654 ?auto_412657 ) ) ( not ( = ?auto_412655 ?auto_412656 ) ) ( not ( = ?auto_412655 ?auto_412657 ) ) ( not ( = ?auto_412656 ?auto_412657 ) ) ( ON ?auto_412655 ?auto_412656 ) ( ON ?auto_412654 ?auto_412655 ) ( ON ?auto_412653 ?auto_412654 ) ( ON ?auto_412652 ?auto_412653 ) ( ON ?auto_412651 ?auto_412652 ) ( ON ?auto_412650 ?auto_412651 ) ( ON ?auto_412649 ?auto_412650 ) ( ON ?auto_412648 ?auto_412649 ) ( ON ?auto_412647 ?auto_412648 ) ( ON ?auto_412646 ?auto_412647 ) ( ON ?auto_412645 ?auto_412646 ) ( ON ?auto_412644 ?auto_412645 ) ( CLEAR ?auto_412642 ) ( ON ?auto_412643 ?auto_412644 ) ( CLEAR ?auto_412643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412642 ?auto_412643 )
      ( MAKE-15PILE ?auto_412642 ?auto_412643 ?auto_412644 ?auto_412645 ?auto_412646 ?auto_412647 ?auto_412648 ?auto_412649 ?auto_412650 ?auto_412651 ?auto_412652 ?auto_412653 ?auto_412654 ?auto_412655 ?auto_412656 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412673 - BLOCK
      ?auto_412674 - BLOCK
      ?auto_412675 - BLOCK
      ?auto_412676 - BLOCK
      ?auto_412677 - BLOCK
      ?auto_412678 - BLOCK
      ?auto_412679 - BLOCK
      ?auto_412680 - BLOCK
      ?auto_412681 - BLOCK
      ?auto_412682 - BLOCK
      ?auto_412683 - BLOCK
      ?auto_412684 - BLOCK
      ?auto_412685 - BLOCK
      ?auto_412686 - BLOCK
      ?auto_412687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412687 ) ( ON-TABLE ?auto_412673 ) ( not ( = ?auto_412673 ?auto_412674 ) ) ( not ( = ?auto_412673 ?auto_412675 ) ) ( not ( = ?auto_412673 ?auto_412676 ) ) ( not ( = ?auto_412673 ?auto_412677 ) ) ( not ( = ?auto_412673 ?auto_412678 ) ) ( not ( = ?auto_412673 ?auto_412679 ) ) ( not ( = ?auto_412673 ?auto_412680 ) ) ( not ( = ?auto_412673 ?auto_412681 ) ) ( not ( = ?auto_412673 ?auto_412682 ) ) ( not ( = ?auto_412673 ?auto_412683 ) ) ( not ( = ?auto_412673 ?auto_412684 ) ) ( not ( = ?auto_412673 ?auto_412685 ) ) ( not ( = ?auto_412673 ?auto_412686 ) ) ( not ( = ?auto_412673 ?auto_412687 ) ) ( not ( = ?auto_412674 ?auto_412675 ) ) ( not ( = ?auto_412674 ?auto_412676 ) ) ( not ( = ?auto_412674 ?auto_412677 ) ) ( not ( = ?auto_412674 ?auto_412678 ) ) ( not ( = ?auto_412674 ?auto_412679 ) ) ( not ( = ?auto_412674 ?auto_412680 ) ) ( not ( = ?auto_412674 ?auto_412681 ) ) ( not ( = ?auto_412674 ?auto_412682 ) ) ( not ( = ?auto_412674 ?auto_412683 ) ) ( not ( = ?auto_412674 ?auto_412684 ) ) ( not ( = ?auto_412674 ?auto_412685 ) ) ( not ( = ?auto_412674 ?auto_412686 ) ) ( not ( = ?auto_412674 ?auto_412687 ) ) ( not ( = ?auto_412675 ?auto_412676 ) ) ( not ( = ?auto_412675 ?auto_412677 ) ) ( not ( = ?auto_412675 ?auto_412678 ) ) ( not ( = ?auto_412675 ?auto_412679 ) ) ( not ( = ?auto_412675 ?auto_412680 ) ) ( not ( = ?auto_412675 ?auto_412681 ) ) ( not ( = ?auto_412675 ?auto_412682 ) ) ( not ( = ?auto_412675 ?auto_412683 ) ) ( not ( = ?auto_412675 ?auto_412684 ) ) ( not ( = ?auto_412675 ?auto_412685 ) ) ( not ( = ?auto_412675 ?auto_412686 ) ) ( not ( = ?auto_412675 ?auto_412687 ) ) ( not ( = ?auto_412676 ?auto_412677 ) ) ( not ( = ?auto_412676 ?auto_412678 ) ) ( not ( = ?auto_412676 ?auto_412679 ) ) ( not ( = ?auto_412676 ?auto_412680 ) ) ( not ( = ?auto_412676 ?auto_412681 ) ) ( not ( = ?auto_412676 ?auto_412682 ) ) ( not ( = ?auto_412676 ?auto_412683 ) ) ( not ( = ?auto_412676 ?auto_412684 ) ) ( not ( = ?auto_412676 ?auto_412685 ) ) ( not ( = ?auto_412676 ?auto_412686 ) ) ( not ( = ?auto_412676 ?auto_412687 ) ) ( not ( = ?auto_412677 ?auto_412678 ) ) ( not ( = ?auto_412677 ?auto_412679 ) ) ( not ( = ?auto_412677 ?auto_412680 ) ) ( not ( = ?auto_412677 ?auto_412681 ) ) ( not ( = ?auto_412677 ?auto_412682 ) ) ( not ( = ?auto_412677 ?auto_412683 ) ) ( not ( = ?auto_412677 ?auto_412684 ) ) ( not ( = ?auto_412677 ?auto_412685 ) ) ( not ( = ?auto_412677 ?auto_412686 ) ) ( not ( = ?auto_412677 ?auto_412687 ) ) ( not ( = ?auto_412678 ?auto_412679 ) ) ( not ( = ?auto_412678 ?auto_412680 ) ) ( not ( = ?auto_412678 ?auto_412681 ) ) ( not ( = ?auto_412678 ?auto_412682 ) ) ( not ( = ?auto_412678 ?auto_412683 ) ) ( not ( = ?auto_412678 ?auto_412684 ) ) ( not ( = ?auto_412678 ?auto_412685 ) ) ( not ( = ?auto_412678 ?auto_412686 ) ) ( not ( = ?auto_412678 ?auto_412687 ) ) ( not ( = ?auto_412679 ?auto_412680 ) ) ( not ( = ?auto_412679 ?auto_412681 ) ) ( not ( = ?auto_412679 ?auto_412682 ) ) ( not ( = ?auto_412679 ?auto_412683 ) ) ( not ( = ?auto_412679 ?auto_412684 ) ) ( not ( = ?auto_412679 ?auto_412685 ) ) ( not ( = ?auto_412679 ?auto_412686 ) ) ( not ( = ?auto_412679 ?auto_412687 ) ) ( not ( = ?auto_412680 ?auto_412681 ) ) ( not ( = ?auto_412680 ?auto_412682 ) ) ( not ( = ?auto_412680 ?auto_412683 ) ) ( not ( = ?auto_412680 ?auto_412684 ) ) ( not ( = ?auto_412680 ?auto_412685 ) ) ( not ( = ?auto_412680 ?auto_412686 ) ) ( not ( = ?auto_412680 ?auto_412687 ) ) ( not ( = ?auto_412681 ?auto_412682 ) ) ( not ( = ?auto_412681 ?auto_412683 ) ) ( not ( = ?auto_412681 ?auto_412684 ) ) ( not ( = ?auto_412681 ?auto_412685 ) ) ( not ( = ?auto_412681 ?auto_412686 ) ) ( not ( = ?auto_412681 ?auto_412687 ) ) ( not ( = ?auto_412682 ?auto_412683 ) ) ( not ( = ?auto_412682 ?auto_412684 ) ) ( not ( = ?auto_412682 ?auto_412685 ) ) ( not ( = ?auto_412682 ?auto_412686 ) ) ( not ( = ?auto_412682 ?auto_412687 ) ) ( not ( = ?auto_412683 ?auto_412684 ) ) ( not ( = ?auto_412683 ?auto_412685 ) ) ( not ( = ?auto_412683 ?auto_412686 ) ) ( not ( = ?auto_412683 ?auto_412687 ) ) ( not ( = ?auto_412684 ?auto_412685 ) ) ( not ( = ?auto_412684 ?auto_412686 ) ) ( not ( = ?auto_412684 ?auto_412687 ) ) ( not ( = ?auto_412685 ?auto_412686 ) ) ( not ( = ?auto_412685 ?auto_412687 ) ) ( not ( = ?auto_412686 ?auto_412687 ) ) ( ON ?auto_412686 ?auto_412687 ) ( ON ?auto_412685 ?auto_412686 ) ( ON ?auto_412684 ?auto_412685 ) ( ON ?auto_412683 ?auto_412684 ) ( ON ?auto_412682 ?auto_412683 ) ( ON ?auto_412681 ?auto_412682 ) ( ON ?auto_412680 ?auto_412681 ) ( ON ?auto_412679 ?auto_412680 ) ( ON ?auto_412678 ?auto_412679 ) ( ON ?auto_412677 ?auto_412678 ) ( ON ?auto_412676 ?auto_412677 ) ( ON ?auto_412675 ?auto_412676 ) ( CLEAR ?auto_412673 ) ( ON ?auto_412674 ?auto_412675 ) ( CLEAR ?auto_412674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_412673 ?auto_412674 )
      ( MAKE-15PILE ?auto_412673 ?auto_412674 ?auto_412675 ?auto_412676 ?auto_412677 ?auto_412678 ?auto_412679 ?auto_412680 ?auto_412681 ?auto_412682 ?auto_412683 ?auto_412684 ?auto_412685 ?auto_412686 ?auto_412687 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412703 - BLOCK
      ?auto_412704 - BLOCK
      ?auto_412705 - BLOCK
      ?auto_412706 - BLOCK
      ?auto_412707 - BLOCK
      ?auto_412708 - BLOCK
      ?auto_412709 - BLOCK
      ?auto_412710 - BLOCK
      ?auto_412711 - BLOCK
      ?auto_412712 - BLOCK
      ?auto_412713 - BLOCK
      ?auto_412714 - BLOCK
      ?auto_412715 - BLOCK
      ?auto_412716 - BLOCK
      ?auto_412717 - BLOCK
    )
    :vars
    (
      ?auto_412718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_412717 ?auto_412718 ) ( not ( = ?auto_412703 ?auto_412704 ) ) ( not ( = ?auto_412703 ?auto_412705 ) ) ( not ( = ?auto_412703 ?auto_412706 ) ) ( not ( = ?auto_412703 ?auto_412707 ) ) ( not ( = ?auto_412703 ?auto_412708 ) ) ( not ( = ?auto_412703 ?auto_412709 ) ) ( not ( = ?auto_412703 ?auto_412710 ) ) ( not ( = ?auto_412703 ?auto_412711 ) ) ( not ( = ?auto_412703 ?auto_412712 ) ) ( not ( = ?auto_412703 ?auto_412713 ) ) ( not ( = ?auto_412703 ?auto_412714 ) ) ( not ( = ?auto_412703 ?auto_412715 ) ) ( not ( = ?auto_412703 ?auto_412716 ) ) ( not ( = ?auto_412703 ?auto_412717 ) ) ( not ( = ?auto_412703 ?auto_412718 ) ) ( not ( = ?auto_412704 ?auto_412705 ) ) ( not ( = ?auto_412704 ?auto_412706 ) ) ( not ( = ?auto_412704 ?auto_412707 ) ) ( not ( = ?auto_412704 ?auto_412708 ) ) ( not ( = ?auto_412704 ?auto_412709 ) ) ( not ( = ?auto_412704 ?auto_412710 ) ) ( not ( = ?auto_412704 ?auto_412711 ) ) ( not ( = ?auto_412704 ?auto_412712 ) ) ( not ( = ?auto_412704 ?auto_412713 ) ) ( not ( = ?auto_412704 ?auto_412714 ) ) ( not ( = ?auto_412704 ?auto_412715 ) ) ( not ( = ?auto_412704 ?auto_412716 ) ) ( not ( = ?auto_412704 ?auto_412717 ) ) ( not ( = ?auto_412704 ?auto_412718 ) ) ( not ( = ?auto_412705 ?auto_412706 ) ) ( not ( = ?auto_412705 ?auto_412707 ) ) ( not ( = ?auto_412705 ?auto_412708 ) ) ( not ( = ?auto_412705 ?auto_412709 ) ) ( not ( = ?auto_412705 ?auto_412710 ) ) ( not ( = ?auto_412705 ?auto_412711 ) ) ( not ( = ?auto_412705 ?auto_412712 ) ) ( not ( = ?auto_412705 ?auto_412713 ) ) ( not ( = ?auto_412705 ?auto_412714 ) ) ( not ( = ?auto_412705 ?auto_412715 ) ) ( not ( = ?auto_412705 ?auto_412716 ) ) ( not ( = ?auto_412705 ?auto_412717 ) ) ( not ( = ?auto_412705 ?auto_412718 ) ) ( not ( = ?auto_412706 ?auto_412707 ) ) ( not ( = ?auto_412706 ?auto_412708 ) ) ( not ( = ?auto_412706 ?auto_412709 ) ) ( not ( = ?auto_412706 ?auto_412710 ) ) ( not ( = ?auto_412706 ?auto_412711 ) ) ( not ( = ?auto_412706 ?auto_412712 ) ) ( not ( = ?auto_412706 ?auto_412713 ) ) ( not ( = ?auto_412706 ?auto_412714 ) ) ( not ( = ?auto_412706 ?auto_412715 ) ) ( not ( = ?auto_412706 ?auto_412716 ) ) ( not ( = ?auto_412706 ?auto_412717 ) ) ( not ( = ?auto_412706 ?auto_412718 ) ) ( not ( = ?auto_412707 ?auto_412708 ) ) ( not ( = ?auto_412707 ?auto_412709 ) ) ( not ( = ?auto_412707 ?auto_412710 ) ) ( not ( = ?auto_412707 ?auto_412711 ) ) ( not ( = ?auto_412707 ?auto_412712 ) ) ( not ( = ?auto_412707 ?auto_412713 ) ) ( not ( = ?auto_412707 ?auto_412714 ) ) ( not ( = ?auto_412707 ?auto_412715 ) ) ( not ( = ?auto_412707 ?auto_412716 ) ) ( not ( = ?auto_412707 ?auto_412717 ) ) ( not ( = ?auto_412707 ?auto_412718 ) ) ( not ( = ?auto_412708 ?auto_412709 ) ) ( not ( = ?auto_412708 ?auto_412710 ) ) ( not ( = ?auto_412708 ?auto_412711 ) ) ( not ( = ?auto_412708 ?auto_412712 ) ) ( not ( = ?auto_412708 ?auto_412713 ) ) ( not ( = ?auto_412708 ?auto_412714 ) ) ( not ( = ?auto_412708 ?auto_412715 ) ) ( not ( = ?auto_412708 ?auto_412716 ) ) ( not ( = ?auto_412708 ?auto_412717 ) ) ( not ( = ?auto_412708 ?auto_412718 ) ) ( not ( = ?auto_412709 ?auto_412710 ) ) ( not ( = ?auto_412709 ?auto_412711 ) ) ( not ( = ?auto_412709 ?auto_412712 ) ) ( not ( = ?auto_412709 ?auto_412713 ) ) ( not ( = ?auto_412709 ?auto_412714 ) ) ( not ( = ?auto_412709 ?auto_412715 ) ) ( not ( = ?auto_412709 ?auto_412716 ) ) ( not ( = ?auto_412709 ?auto_412717 ) ) ( not ( = ?auto_412709 ?auto_412718 ) ) ( not ( = ?auto_412710 ?auto_412711 ) ) ( not ( = ?auto_412710 ?auto_412712 ) ) ( not ( = ?auto_412710 ?auto_412713 ) ) ( not ( = ?auto_412710 ?auto_412714 ) ) ( not ( = ?auto_412710 ?auto_412715 ) ) ( not ( = ?auto_412710 ?auto_412716 ) ) ( not ( = ?auto_412710 ?auto_412717 ) ) ( not ( = ?auto_412710 ?auto_412718 ) ) ( not ( = ?auto_412711 ?auto_412712 ) ) ( not ( = ?auto_412711 ?auto_412713 ) ) ( not ( = ?auto_412711 ?auto_412714 ) ) ( not ( = ?auto_412711 ?auto_412715 ) ) ( not ( = ?auto_412711 ?auto_412716 ) ) ( not ( = ?auto_412711 ?auto_412717 ) ) ( not ( = ?auto_412711 ?auto_412718 ) ) ( not ( = ?auto_412712 ?auto_412713 ) ) ( not ( = ?auto_412712 ?auto_412714 ) ) ( not ( = ?auto_412712 ?auto_412715 ) ) ( not ( = ?auto_412712 ?auto_412716 ) ) ( not ( = ?auto_412712 ?auto_412717 ) ) ( not ( = ?auto_412712 ?auto_412718 ) ) ( not ( = ?auto_412713 ?auto_412714 ) ) ( not ( = ?auto_412713 ?auto_412715 ) ) ( not ( = ?auto_412713 ?auto_412716 ) ) ( not ( = ?auto_412713 ?auto_412717 ) ) ( not ( = ?auto_412713 ?auto_412718 ) ) ( not ( = ?auto_412714 ?auto_412715 ) ) ( not ( = ?auto_412714 ?auto_412716 ) ) ( not ( = ?auto_412714 ?auto_412717 ) ) ( not ( = ?auto_412714 ?auto_412718 ) ) ( not ( = ?auto_412715 ?auto_412716 ) ) ( not ( = ?auto_412715 ?auto_412717 ) ) ( not ( = ?auto_412715 ?auto_412718 ) ) ( not ( = ?auto_412716 ?auto_412717 ) ) ( not ( = ?auto_412716 ?auto_412718 ) ) ( not ( = ?auto_412717 ?auto_412718 ) ) ( ON ?auto_412716 ?auto_412717 ) ( ON ?auto_412715 ?auto_412716 ) ( ON ?auto_412714 ?auto_412715 ) ( ON ?auto_412713 ?auto_412714 ) ( ON ?auto_412712 ?auto_412713 ) ( ON ?auto_412711 ?auto_412712 ) ( ON ?auto_412710 ?auto_412711 ) ( ON ?auto_412709 ?auto_412710 ) ( ON ?auto_412708 ?auto_412709 ) ( ON ?auto_412707 ?auto_412708 ) ( ON ?auto_412706 ?auto_412707 ) ( ON ?auto_412705 ?auto_412706 ) ( ON ?auto_412704 ?auto_412705 ) ( ON ?auto_412703 ?auto_412704 ) ( CLEAR ?auto_412703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412703 )
      ( MAKE-15PILE ?auto_412703 ?auto_412704 ?auto_412705 ?auto_412706 ?auto_412707 ?auto_412708 ?auto_412709 ?auto_412710 ?auto_412711 ?auto_412712 ?auto_412713 ?auto_412714 ?auto_412715 ?auto_412716 ?auto_412717 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412734 - BLOCK
      ?auto_412735 - BLOCK
      ?auto_412736 - BLOCK
      ?auto_412737 - BLOCK
      ?auto_412738 - BLOCK
      ?auto_412739 - BLOCK
      ?auto_412740 - BLOCK
      ?auto_412741 - BLOCK
      ?auto_412742 - BLOCK
      ?auto_412743 - BLOCK
      ?auto_412744 - BLOCK
      ?auto_412745 - BLOCK
      ?auto_412746 - BLOCK
      ?auto_412747 - BLOCK
      ?auto_412748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_412748 ) ( not ( = ?auto_412734 ?auto_412735 ) ) ( not ( = ?auto_412734 ?auto_412736 ) ) ( not ( = ?auto_412734 ?auto_412737 ) ) ( not ( = ?auto_412734 ?auto_412738 ) ) ( not ( = ?auto_412734 ?auto_412739 ) ) ( not ( = ?auto_412734 ?auto_412740 ) ) ( not ( = ?auto_412734 ?auto_412741 ) ) ( not ( = ?auto_412734 ?auto_412742 ) ) ( not ( = ?auto_412734 ?auto_412743 ) ) ( not ( = ?auto_412734 ?auto_412744 ) ) ( not ( = ?auto_412734 ?auto_412745 ) ) ( not ( = ?auto_412734 ?auto_412746 ) ) ( not ( = ?auto_412734 ?auto_412747 ) ) ( not ( = ?auto_412734 ?auto_412748 ) ) ( not ( = ?auto_412735 ?auto_412736 ) ) ( not ( = ?auto_412735 ?auto_412737 ) ) ( not ( = ?auto_412735 ?auto_412738 ) ) ( not ( = ?auto_412735 ?auto_412739 ) ) ( not ( = ?auto_412735 ?auto_412740 ) ) ( not ( = ?auto_412735 ?auto_412741 ) ) ( not ( = ?auto_412735 ?auto_412742 ) ) ( not ( = ?auto_412735 ?auto_412743 ) ) ( not ( = ?auto_412735 ?auto_412744 ) ) ( not ( = ?auto_412735 ?auto_412745 ) ) ( not ( = ?auto_412735 ?auto_412746 ) ) ( not ( = ?auto_412735 ?auto_412747 ) ) ( not ( = ?auto_412735 ?auto_412748 ) ) ( not ( = ?auto_412736 ?auto_412737 ) ) ( not ( = ?auto_412736 ?auto_412738 ) ) ( not ( = ?auto_412736 ?auto_412739 ) ) ( not ( = ?auto_412736 ?auto_412740 ) ) ( not ( = ?auto_412736 ?auto_412741 ) ) ( not ( = ?auto_412736 ?auto_412742 ) ) ( not ( = ?auto_412736 ?auto_412743 ) ) ( not ( = ?auto_412736 ?auto_412744 ) ) ( not ( = ?auto_412736 ?auto_412745 ) ) ( not ( = ?auto_412736 ?auto_412746 ) ) ( not ( = ?auto_412736 ?auto_412747 ) ) ( not ( = ?auto_412736 ?auto_412748 ) ) ( not ( = ?auto_412737 ?auto_412738 ) ) ( not ( = ?auto_412737 ?auto_412739 ) ) ( not ( = ?auto_412737 ?auto_412740 ) ) ( not ( = ?auto_412737 ?auto_412741 ) ) ( not ( = ?auto_412737 ?auto_412742 ) ) ( not ( = ?auto_412737 ?auto_412743 ) ) ( not ( = ?auto_412737 ?auto_412744 ) ) ( not ( = ?auto_412737 ?auto_412745 ) ) ( not ( = ?auto_412737 ?auto_412746 ) ) ( not ( = ?auto_412737 ?auto_412747 ) ) ( not ( = ?auto_412737 ?auto_412748 ) ) ( not ( = ?auto_412738 ?auto_412739 ) ) ( not ( = ?auto_412738 ?auto_412740 ) ) ( not ( = ?auto_412738 ?auto_412741 ) ) ( not ( = ?auto_412738 ?auto_412742 ) ) ( not ( = ?auto_412738 ?auto_412743 ) ) ( not ( = ?auto_412738 ?auto_412744 ) ) ( not ( = ?auto_412738 ?auto_412745 ) ) ( not ( = ?auto_412738 ?auto_412746 ) ) ( not ( = ?auto_412738 ?auto_412747 ) ) ( not ( = ?auto_412738 ?auto_412748 ) ) ( not ( = ?auto_412739 ?auto_412740 ) ) ( not ( = ?auto_412739 ?auto_412741 ) ) ( not ( = ?auto_412739 ?auto_412742 ) ) ( not ( = ?auto_412739 ?auto_412743 ) ) ( not ( = ?auto_412739 ?auto_412744 ) ) ( not ( = ?auto_412739 ?auto_412745 ) ) ( not ( = ?auto_412739 ?auto_412746 ) ) ( not ( = ?auto_412739 ?auto_412747 ) ) ( not ( = ?auto_412739 ?auto_412748 ) ) ( not ( = ?auto_412740 ?auto_412741 ) ) ( not ( = ?auto_412740 ?auto_412742 ) ) ( not ( = ?auto_412740 ?auto_412743 ) ) ( not ( = ?auto_412740 ?auto_412744 ) ) ( not ( = ?auto_412740 ?auto_412745 ) ) ( not ( = ?auto_412740 ?auto_412746 ) ) ( not ( = ?auto_412740 ?auto_412747 ) ) ( not ( = ?auto_412740 ?auto_412748 ) ) ( not ( = ?auto_412741 ?auto_412742 ) ) ( not ( = ?auto_412741 ?auto_412743 ) ) ( not ( = ?auto_412741 ?auto_412744 ) ) ( not ( = ?auto_412741 ?auto_412745 ) ) ( not ( = ?auto_412741 ?auto_412746 ) ) ( not ( = ?auto_412741 ?auto_412747 ) ) ( not ( = ?auto_412741 ?auto_412748 ) ) ( not ( = ?auto_412742 ?auto_412743 ) ) ( not ( = ?auto_412742 ?auto_412744 ) ) ( not ( = ?auto_412742 ?auto_412745 ) ) ( not ( = ?auto_412742 ?auto_412746 ) ) ( not ( = ?auto_412742 ?auto_412747 ) ) ( not ( = ?auto_412742 ?auto_412748 ) ) ( not ( = ?auto_412743 ?auto_412744 ) ) ( not ( = ?auto_412743 ?auto_412745 ) ) ( not ( = ?auto_412743 ?auto_412746 ) ) ( not ( = ?auto_412743 ?auto_412747 ) ) ( not ( = ?auto_412743 ?auto_412748 ) ) ( not ( = ?auto_412744 ?auto_412745 ) ) ( not ( = ?auto_412744 ?auto_412746 ) ) ( not ( = ?auto_412744 ?auto_412747 ) ) ( not ( = ?auto_412744 ?auto_412748 ) ) ( not ( = ?auto_412745 ?auto_412746 ) ) ( not ( = ?auto_412745 ?auto_412747 ) ) ( not ( = ?auto_412745 ?auto_412748 ) ) ( not ( = ?auto_412746 ?auto_412747 ) ) ( not ( = ?auto_412746 ?auto_412748 ) ) ( not ( = ?auto_412747 ?auto_412748 ) ) ( ON ?auto_412747 ?auto_412748 ) ( ON ?auto_412746 ?auto_412747 ) ( ON ?auto_412745 ?auto_412746 ) ( ON ?auto_412744 ?auto_412745 ) ( ON ?auto_412743 ?auto_412744 ) ( ON ?auto_412742 ?auto_412743 ) ( ON ?auto_412741 ?auto_412742 ) ( ON ?auto_412740 ?auto_412741 ) ( ON ?auto_412739 ?auto_412740 ) ( ON ?auto_412738 ?auto_412739 ) ( ON ?auto_412737 ?auto_412738 ) ( ON ?auto_412736 ?auto_412737 ) ( ON ?auto_412735 ?auto_412736 ) ( ON ?auto_412734 ?auto_412735 ) ( CLEAR ?auto_412734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_412734 )
      ( MAKE-15PILE ?auto_412734 ?auto_412735 ?auto_412736 ?auto_412737 ?auto_412738 ?auto_412739 ?auto_412740 ?auto_412741 ?auto_412742 ?auto_412743 ?auto_412744 ?auto_412745 ?auto_412746 ?auto_412747 ?auto_412748 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_412764 - BLOCK
      ?auto_412765 - BLOCK
      ?auto_412766 - BLOCK
      ?auto_412767 - BLOCK
      ?auto_412768 - BLOCK
      ?auto_412769 - BLOCK
      ?auto_412770 - BLOCK
      ?auto_412771 - BLOCK
      ?auto_412772 - BLOCK
      ?auto_412773 - BLOCK
      ?auto_412774 - BLOCK
      ?auto_412775 - BLOCK
      ?auto_412776 - BLOCK
      ?auto_412777 - BLOCK
      ?auto_412778 - BLOCK
    )
    :vars
    (
      ?auto_412779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_412764 ?auto_412765 ) ) ( not ( = ?auto_412764 ?auto_412766 ) ) ( not ( = ?auto_412764 ?auto_412767 ) ) ( not ( = ?auto_412764 ?auto_412768 ) ) ( not ( = ?auto_412764 ?auto_412769 ) ) ( not ( = ?auto_412764 ?auto_412770 ) ) ( not ( = ?auto_412764 ?auto_412771 ) ) ( not ( = ?auto_412764 ?auto_412772 ) ) ( not ( = ?auto_412764 ?auto_412773 ) ) ( not ( = ?auto_412764 ?auto_412774 ) ) ( not ( = ?auto_412764 ?auto_412775 ) ) ( not ( = ?auto_412764 ?auto_412776 ) ) ( not ( = ?auto_412764 ?auto_412777 ) ) ( not ( = ?auto_412764 ?auto_412778 ) ) ( not ( = ?auto_412765 ?auto_412766 ) ) ( not ( = ?auto_412765 ?auto_412767 ) ) ( not ( = ?auto_412765 ?auto_412768 ) ) ( not ( = ?auto_412765 ?auto_412769 ) ) ( not ( = ?auto_412765 ?auto_412770 ) ) ( not ( = ?auto_412765 ?auto_412771 ) ) ( not ( = ?auto_412765 ?auto_412772 ) ) ( not ( = ?auto_412765 ?auto_412773 ) ) ( not ( = ?auto_412765 ?auto_412774 ) ) ( not ( = ?auto_412765 ?auto_412775 ) ) ( not ( = ?auto_412765 ?auto_412776 ) ) ( not ( = ?auto_412765 ?auto_412777 ) ) ( not ( = ?auto_412765 ?auto_412778 ) ) ( not ( = ?auto_412766 ?auto_412767 ) ) ( not ( = ?auto_412766 ?auto_412768 ) ) ( not ( = ?auto_412766 ?auto_412769 ) ) ( not ( = ?auto_412766 ?auto_412770 ) ) ( not ( = ?auto_412766 ?auto_412771 ) ) ( not ( = ?auto_412766 ?auto_412772 ) ) ( not ( = ?auto_412766 ?auto_412773 ) ) ( not ( = ?auto_412766 ?auto_412774 ) ) ( not ( = ?auto_412766 ?auto_412775 ) ) ( not ( = ?auto_412766 ?auto_412776 ) ) ( not ( = ?auto_412766 ?auto_412777 ) ) ( not ( = ?auto_412766 ?auto_412778 ) ) ( not ( = ?auto_412767 ?auto_412768 ) ) ( not ( = ?auto_412767 ?auto_412769 ) ) ( not ( = ?auto_412767 ?auto_412770 ) ) ( not ( = ?auto_412767 ?auto_412771 ) ) ( not ( = ?auto_412767 ?auto_412772 ) ) ( not ( = ?auto_412767 ?auto_412773 ) ) ( not ( = ?auto_412767 ?auto_412774 ) ) ( not ( = ?auto_412767 ?auto_412775 ) ) ( not ( = ?auto_412767 ?auto_412776 ) ) ( not ( = ?auto_412767 ?auto_412777 ) ) ( not ( = ?auto_412767 ?auto_412778 ) ) ( not ( = ?auto_412768 ?auto_412769 ) ) ( not ( = ?auto_412768 ?auto_412770 ) ) ( not ( = ?auto_412768 ?auto_412771 ) ) ( not ( = ?auto_412768 ?auto_412772 ) ) ( not ( = ?auto_412768 ?auto_412773 ) ) ( not ( = ?auto_412768 ?auto_412774 ) ) ( not ( = ?auto_412768 ?auto_412775 ) ) ( not ( = ?auto_412768 ?auto_412776 ) ) ( not ( = ?auto_412768 ?auto_412777 ) ) ( not ( = ?auto_412768 ?auto_412778 ) ) ( not ( = ?auto_412769 ?auto_412770 ) ) ( not ( = ?auto_412769 ?auto_412771 ) ) ( not ( = ?auto_412769 ?auto_412772 ) ) ( not ( = ?auto_412769 ?auto_412773 ) ) ( not ( = ?auto_412769 ?auto_412774 ) ) ( not ( = ?auto_412769 ?auto_412775 ) ) ( not ( = ?auto_412769 ?auto_412776 ) ) ( not ( = ?auto_412769 ?auto_412777 ) ) ( not ( = ?auto_412769 ?auto_412778 ) ) ( not ( = ?auto_412770 ?auto_412771 ) ) ( not ( = ?auto_412770 ?auto_412772 ) ) ( not ( = ?auto_412770 ?auto_412773 ) ) ( not ( = ?auto_412770 ?auto_412774 ) ) ( not ( = ?auto_412770 ?auto_412775 ) ) ( not ( = ?auto_412770 ?auto_412776 ) ) ( not ( = ?auto_412770 ?auto_412777 ) ) ( not ( = ?auto_412770 ?auto_412778 ) ) ( not ( = ?auto_412771 ?auto_412772 ) ) ( not ( = ?auto_412771 ?auto_412773 ) ) ( not ( = ?auto_412771 ?auto_412774 ) ) ( not ( = ?auto_412771 ?auto_412775 ) ) ( not ( = ?auto_412771 ?auto_412776 ) ) ( not ( = ?auto_412771 ?auto_412777 ) ) ( not ( = ?auto_412771 ?auto_412778 ) ) ( not ( = ?auto_412772 ?auto_412773 ) ) ( not ( = ?auto_412772 ?auto_412774 ) ) ( not ( = ?auto_412772 ?auto_412775 ) ) ( not ( = ?auto_412772 ?auto_412776 ) ) ( not ( = ?auto_412772 ?auto_412777 ) ) ( not ( = ?auto_412772 ?auto_412778 ) ) ( not ( = ?auto_412773 ?auto_412774 ) ) ( not ( = ?auto_412773 ?auto_412775 ) ) ( not ( = ?auto_412773 ?auto_412776 ) ) ( not ( = ?auto_412773 ?auto_412777 ) ) ( not ( = ?auto_412773 ?auto_412778 ) ) ( not ( = ?auto_412774 ?auto_412775 ) ) ( not ( = ?auto_412774 ?auto_412776 ) ) ( not ( = ?auto_412774 ?auto_412777 ) ) ( not ( = ?auto_412774 ?auto_412778 ) ) ( not ( = ?auto_412775 ?auto_412776 ) ) ( not ( = ?auto_412775 ?auto_412777 ) ) ( not ( = ?auto_412775 ?auto_412778 ) ) ( not ( = ?auto_412776 ?auto_412777 ) ) ( not ( = ?auto_412776 ?auto_412778 ) ) ( not ( = ?auto_412777 ?auto_412778 ) ) ( ON ?auto_412764 ?auto_412779 ) ( not ( = ?auto_412778 ?auto_412779 ) ) ( not ( = ?auto_412777 ?auto_412779 ) ) ( not ( = ?auto_412776 ?auto_412779 ) ) ( not ( = ?auto_412775 ?auto_412779 ) ) ( not ( = ?auto_412774 ?auto_412779 ) ) ( not ( = ?auto_412773 ?auto_412779 ) ) ( not ( = ?auto_412772 ?auto_412779 ) ) ( not ( = ?auto_412771 ?auto_412779 ) ) ( not ( = ?auto_412770 ?auto_412779 ) ) ( not ( = ?auto_412769 ?auto_412779 ) ) ( not ( = ?auto_412768 ?auto_412779 ) ) ( not ( = ?auto_412767 ?auto_412779 ) ) ( not ( = ?auto_412766 ?auto_412779 ) ) ( not ( = ?auto_412765 ?auto_412779 ) ) ( not ( = ?auto_412764 ?auto_412779 ) ) ( ON ?auto_412765 ?auto_412764 ) ( ON ?auto_412766 ?auto_412765 ) ( ON ?auto_412767 ?auto_412766 ) ( ON ?auto_412768 ?auto_412767 ) ( ON ?auto_412769 ?auto_412768 ) ( ON ?auto_412770 ?auto_412769 ) ( ON ?auto_412771 ?auto_412770 ) ( ON ?auto_412772 ?auto_412771 ) ( ON ?auto_412773 ?auto_412772 ) ( ON ?auto_412774 ?auto_412773 ) ( ON ?auto_412775 ?auto_412774 ) ( ON ?auto_412776 ?auto_412775 ) ( ON ?auto_412777 ?auto_412776 ) ( ON ?auto_412778 ?auto_412777 ) ( CLEAR ?auto_412778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_412778 ?auto_412777 ?auto_412776 ?auto_412775 ?auto_412774 ?auto_412773 ?auto_412772 ?auto_412771 ?auto_412770 ?auto_412769 ?auto_412768 ?auto_412767 ?auto_412766 ?auto_412765 ?auto_412764 )
      ( MAKE-15PILE ?auto_412764 ?auto_412765 ?auto_412766 ?auto_412767 ?auto_412768 ?auto_412769 ?auto_412770 ?auto_412771 ?auto_412772 ?auto_412773 ?auto_412774 ?auto_412775 ?auto_412776 ?auto_412777 ?auto_412778 ) )
  )

)

