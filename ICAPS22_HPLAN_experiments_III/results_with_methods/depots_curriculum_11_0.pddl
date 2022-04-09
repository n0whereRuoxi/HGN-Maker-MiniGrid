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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8605 - SURFACE
      ?auto_8606 - SURFACE
    )
    :vars
    (
      ?auto_8607 - HOIST
      ?auto_8608 - PLACE
      ?auto_8610 - PLACE
      ?auto_8611 - HOIST
      ?auto_8612 - SURFACE
      ?auto_8609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8607 ?auto_8608 ) ( SURFACE-AT ?auto_8605 ?auto_8608 ) ( CLEAR ?auto_8605 ) ( IS-CRATE ?auto_8606 ) ( AVAILABLE ?auto_8607 ) ( not ( = ?auto_8610 ?auto_8608 ) ) ( HOIST-AT ?auto_8611 ?auto_8610 ) ( AVAILABLE ?auto_8611 ) ( SURFACE-AT ?auto_8606 ?auto_8610 ) ( ON ?auto_8606 ?auto_8612 ) ( CLEAR ?auto_8606 ) ( TRUCK-AT ?auto_8609 ?auto_8608 ) ( not ( = ?auto_8605 ?auto_8606 ) ) ( not ( = ?auto_8605 ?auto_8612 ) ) ( not ( = ?auto_8606 ?auto_8612 ) ) ( not ( = ?auto_8607 ?auto_8611 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8609 ?auto_8608 ?auto_8610 )
      ( !LIFT ?auto_8611 ?auto_8606 ?auto_8612 ?auto_8610 )
      ( !LOAD ?auto_8611 ?auto_8606 ?auto_8609 ?auto_8610 )
      ( !DRIVE ?auto_8609 ?auto_8610 ?auto_8608 )
      ( !UNLOAD ?auto_8607 ?auto_8606 ?auto_8609 ?auto_8608 )
      ( !DROP ?auto_8607 ?auto_8606 ?auto_8605 ?auto_8608 )
      ( MAKE-1CRATE-VERIFY ?auto_8605 ?auto_8606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8615 - SURFACE
      ?auto_8616 - SURFACE
    )
    :vars
    (
      ?auto_8617 - HOIST
      ?auto_8618 - PLACE
      ?auto_8620 - PLACE
      ?auto_8621 - HOIST
      ?auto_8622 - SURFACE
      ?auto_8619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8617 ?auto_8618 ) ( SURFACE-AT ?auto_8615 ?auto_8618 ) ( CLEAR ?auto_8615 ) ( IS-CRATE ?auto_8616 ) ( AVAILABLE ?auto_8617 ) ( not ( = ?auto_8620 ?auto_8618 ) ) ( HOIST-AT ?auto_8621 ?auto_8620 ) ( AVAILABLE ?auto_8621 ) ( SURFACE-AT ?auto_8616 ?auto_8620 ) ( ON ?auto_8616 ?auto_8622 ) ( CLEAR ?auto_8616 ) ( TRUCK-AT ?auto_8619 ?auto_8618 ) ( not ( = ?auto_8615 ?auto_8616 ) ) ( not ( = ?auto_8615 ?auto_8622 ) ) ( not ( = ?auto_8616 ?auto_8622 ) ) ( not ( = ?auto_8617 ?auto_8621 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8619 ?auto_8618 ?auto_8620 )
      ( !LIFT ?auto_8621 ?auto_8616 ?auto_8622 ?auto_8620 )
      ( !LOAD ?auto_8621 ?auto_8616 ?auto_8619 ?auto_8620 )
      ( !DRIVE ?auto_8619 ?auto_8620 ?auto_8618 )
      ( !UNLOAD ?auto_8617 ?auto_8616 ?auto_8619 ?auto_8618 )
      ( !DROP ?auto_8617 ?auto_8616 ?auto_8615 ?auto_8618 )
      ( MAKE-1CRATE-VERIFY ?auto_8615 ?auto_8616 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8626 - SURFACE
      ?auto_8627 - SURFACE
      ?auto_8628 - SURFACE
    )
    :vars
    (
      ?auto_8631 - HOIST
      ?auto_8630 - PLACE
      ?auto_8633 - PLACE
      ?auto_8632 - HOIST
      ?auto_8629 - SURFACE
      ?auto_8637 - PLACE
      ?auto_8636 - HOIST
      ?auto_8635 - SURFACE
      ?auto_8634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8631 ?auto_8630 ) ( IS-CRATE ?auto_8628 ) ( not ( = ?auto_8633 ?auto_8630 ) ) ( HOIST-AT ?auto_8632 ?auto_8633 ) ( AVAILABLE ?auto_8632 ) ( SURFACE-AT ?auto_8628 ?auto_8633 ) ( ON ?auto_8628 ?auto_8629 ) ( CLEAR ?auto_8628 ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8627 ?auto_8629 ) ) ( not ( = ?auto_8628 ?auto_8629 ) ) ( not ( = ?auto_8631 ?auto_8632 ) ) ( SURFACE-AT ?auto_8626 ?auto_8630 ) ( CLEAR ?auto_8626 ) ( IS-CRATE ?auto_8627 ) ( AVAILABLE ?auto_8631 ) ( not ( = ?auto_8637 ?auto_8630 ) ) ( HOIST-AT ?auto_8636 ?auto_8637 ) ( AVAILABLE ?auto_8636 ) ( SURFACE-AT ?auto_8627 ?auto_8637 ) ( ON ?auto_8627 ?auto_8635 ) ( CLEAR ?auto_8627 ) ( TRUCK-AT ?auto_8634 ?auto_8630 ) ( not ( = ?auto_8626 ?auto_8627 ) ) ( not ( = ?auto_8626 ?auto_8635 ) ) ( not ( = ?auto_8627 ?auto_8635 ) ) ( not ( = ?auto_8631 ?auto_8636 ) ) ( not ( = ?auto_8626 ?auto_8628 ) ) ( not ( = ?auto_8626 ?auto_8629 ) ) ( not ( = ?auto_8628 ?auto_8635 ) ) ( not ( = ?auto_8633 ?auto_8637 ) ) ( not ( = ?auto_8632 ?auto_8636 ) ) ( not ( = ?auto_8629 ?auto_8635 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8626 ?auto_8627 )
      ( MAKE-1CRATE ?auto_8627 ?auto_8628 )
      ( MAKE-2CRATE-VERIFY ?auto_8626 ?auto_8627 ?auto_8628 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8640 - SURFACE
      ?auto_8641 - SURFACE
    )
    :vars
    (
      ?auto_8642 - HOIST
      ?auto_8643 - PLACE
      ?auto_8645 - PLACE
      ?auto_8646 - HOIST
      ?auto_8647 - SURFACE
      ?auto_8644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8642 ?auto_8643 ) ( SURFACE-AT ?auto_8640 ?auto_8643 ) ( CLEAR ?auto_8640 ) ( IS-CRATE ?auto_8641 ) ( AVAILABLE ?auto_8642 ) ( not ( = ?auto_8645 ?auto_8643 ) ) ( HOIST-AT ?auto_8646 ?auto_8645 ) ( AVAILABLE ?auto_8646 ) ( SURFACE-AT ?auto_8641 ?auto_8645 ) ( ON ?auto_8641 ?auto_8647 ) ( CLEAR ?auto_8641 ) ( TRUCK-AT ?auto_8644 ?auto_8643 ) ( not ( = ?auto_8640 ?auto_8641 ) ) ( not ( = ?auto_8640 ?auto_8647 ) ) ( not ( = ?auto_8641 ?auto_8647 ) ) ( not ( = ?auto_8642 ?auto_8646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8644 ?auto_8643 ?auto_8645 )
      ( !LIFT ?auto_8646 ?auto_8641 ?auto_8647 ?auto_8645 )
      ( !LOAD ?auto_8646 ?auto_8641 ?auto_8644 ?auto_8645 )
      ( !DRIVE ?auto_8644 ?auto_8645 ?auto_8643 )
      ( !UNLOAD ?auto_8642 ?auto_8641 ?auto_8644 ?auto_8643 )
      ( !DROP ?auto_8642 ?auto_8641 ?auto_8640 ?auto_8643 )
      ( MAKE-1CRATE-VERIFY ?auto_8640 ?auto_8641 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8652 - SURFACE
      ?auto_8653 - SURFACE
      ?auto_8654 - SURFACE
      ?auto_8655 - SURFACE
    )
    :vars
    (
      ?auto_8657 - HOIST
      ?auto_8659 - PLACE
      ?auto_8656 - PLACE
      ?auto_8660 - HOIST
      ?auto_8661 - SURFACE
      ?auto_8662 - PLACE
      ?auto_8663 - HOIST
      ?auto_8664 - SURFACE
      ?auto_8667 - PLACE
      ?auto_8666 - HOIST
      ?auto_8665 - SURFACE
      ?auto_8658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8657 ?auto_8659 ) ( IS-CRATE ?auto_8655 ) ( not ( = ?auto_8656 ?auto_8659 ) ) ( HOIST-AT ?auto_8660 ?auto_8656 ) ( AVAILABLE ?auto_8660 ) ( SURFACE-AT ?auto_8655 ?auto_8656 ) ( ON ?auto_8655 ?auto_8661 ) ( CLEAR ?auto_8655 ) ( not ( = ?auto_8654 ?auto_8655 ) ) ( not ( = ?auto_8654 ?auto_8661 ) ) ( not ( = ?auto_8655 ?auto_8661 ) ) ( not ( = ?auto_8657 ?auto_8660 ) ) ( IS-CRATE ?auto_8654 ) ( not ( = ?auto_8662 ?auto_8659 ) ) ( HOIST-AT ?auto_8663 ?auto_8662 ) ( AVAILABLE ?auto_8663 ) ( SURFACE-AT ?auto_8654 ?auto_8662 ) ( ON ?auto_8654 ?auto_8664 ) ( CLEAR ?auto_8654 ) ( not ( = ?auto_8653 ?auto_8654 ) ) ( not ( = ?auto_8653 ?auto_8664 ) ) ( not ( = ?auto_8654 ?auto_8664 ) ) ( not ( = ?auto_8657 ?auto_8663 ) ) ( SURFACE-AT ?auto_8652 ?auto_8659 ) ( CLEAR ?auto_8652 ) ( IS-CRATE ?auto_8653 ) ( AVAILABLE ?auto_8657 ) ( not ( = ?auto_8667 ?auto_8659 ) ) ( HOIST-AT ?auto_8666 ?auto_8667 ) ( AVAILABLE ?auto_8666 ) ( SURFACE-AT ?auto_8653 ?auto_8667 ) ( ON ?auto_8653 ?auto_8665 ) ( CLEAR ?auto_8653 ) ( TRUCK-AT ?auto_8658 ?auto_8659 ) ( not ( = ?auto_8652 ?auto_8653 ) ) ( not ( = ?auto_8652 ?auto_8665 ) ) ( not ( = ?auto_8653 ?auto_8665 ) ) ( not ( = ?auto_8657 ?auto_8666 ) ) ( not ( = ?auto_8652 ?auto_8654 ) ) ( not ( = ?auto_8652 ?auto_8664 ) ) ( not ( = ?auto_8654 ?auto_8665 ) ) ( not ( = ?auto_8662 ?auto_8667 ) ) ( not ( = ?auto_8663 ?auto_8666 ) ) ( not ( = ?auto_8664 ?auto_8665 ) ) ( not ( = ?auto_8652 ?auto_8655 ) ) ( not ( = ?auto_8652 ?auto_8661 ) ) ( not ( = ?auto_8653 ?auto_8655 ) ) ( not ( = ?auto_8653 ?auto_8661 ) ) ( not ( = ?auto_8655 ?auto_8664 ) ) ( not ( = ?auto_8655 ?auto_8665 ) ) ( not ( = ?auto_8656 ?auto_8662 ) ) ( not ( = ?auto_8656 ?auto_8667 ) ) ( not ( = ?auto_8660 ?auto_8663 ) ) ( not ( = ?auto_8660 ?auto_8666 ) ) ( not ( = ?auto_8661 ?auto_8664 ) ) ( not ( = ?auto_8661 ?auto_8665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8652 ?auto_8653 ?auto_8654 )
      ( MAKE-1CRATE ?auto_8654 ?auto_8655 )
      ( MAKE-3CRATE-VERIFY ?auto_8652 ?auto_8653 ?auto_8654 ?auto_8655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8670 - SURFACE
      ?auto_8671 - SURFACE
    )
    :vars
    (
      ?auto_8672 - HOIST
      ?auto_8673 - PLACE
      ?auto_8675 - PLACE
      ?auto_8676 - HOIST
      ?auto_8677 - SURFACE
      ?auto_8674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8672 ?auto_8673 ) ( SURFACE-AT ?auto_8670 ?auto_8673 ) ( CLEAR ?auto_8670 ) ( IS-CRATE ?auto_8671 ) ( AVAILABLE ?auto_8672 ) ( not ( = ?auto_8675 ?auto_8673 ) ) ( HOIST-AT ?auto_8676 ?auto_8675 ) ( AVAILABLE ?auto_8676 ) ( SURFACE-AT ?auto_8671 ?auto_8675 ) ( ON ?auto_8671 ?auto_8677 ) ( CLEAR ?auto_8671 ) ( TRUCK-AT ?auto_8674 ?auto_8673 ) ( not ( = ?auto_8670 ?auto_8671 ) ) ( not ( = ?auto_8670 ?auto_8677 ) ) ( not ( = ?auto_8671 ?auto_8677 ) ) ( not ( = ?auto_8672 ?auto_8676 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8674 ?auto_8673 ?auto_8675 )
      ( !LIFT ?auto_8676 ?auto_8671 ?auto_8677 ?auto_8675 )
      ( !LOAD ?auto_8676 ?auto_8671 ?auto_8674 ?auto_8675 )
      ( !DRIVE ?auto_8674 ?auto_8675 ?auto_8673 )
      ( !UNLOAD ?auto_8672 ?auto_8671 ?auto_8674 ?auto_8673 )
      ( !DROP ?auto_8672 ?auto_8671 ?auto_8670 ?auto_8673 )
      ( MAKE-1CRATE-VERIFY ?auto_8670 ?auto_8671 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8683 - SURFACE
      ?auto_8684 - SURFACE
      ?auto_8685 - SURFACE
      ?auto_8686 - SURFACE
      ?auto_8687 - SURFACE
    )
    :vars
    (
      ?auto_8691 - HOIST
      ?auto_8690 - PLACE
      ?auto_8688 - PLACE
      ?auto_8692 - HOIST
      ?auto_8693 - SURFACE
      ?auto_8694 - PLACE
      ?auto_8698 - HOIST
      ?auto_8697 - SURFACE
      ?auto_8695 - PLACE
      ?auto_8696 - HOIST
      ?auto_8700 - SURFACE
      ?auto_8699 - PLACE
      ?auto_8702 - HOIST
      ?auto_8701 - SURFACE
      ?auto_8689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8691 ?auto_8690 ) ( IS-CRATE ?auto_8687 ) ( not ( = ?auto_8688 ?auto_8690 ) ) ( HOIST-AT ?auto_8692 ?auto_8688 ) ( AVAILABLE ?auto_8692 ) ( SURFACE-AT ?auto_8687 ?auto_8688 ) ( ON ?auto_8687 ?auto_8693 ) ( CLEAR ?auto_8687 ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( not ( = ?auto_8686 ?auto_8693 ) ) ( not ( = ?auto_8687 ?auto_8693 ) ) ( not ( = ?auto_8691 ?auto_8692 ) ) ( IS-CRATE ?auto_8686 ) ( not ( = ?auto_8694 ?auto_8690 ) ) ( HOIST-AT ?auto_8698 ?auto_8694 ) ( AVAILABLE ?auto_8698 ) ( SURFACE-AT ?auto_8686 ?auto_8694 ) ( ON ?auto_8686 ?auto_8697 ) ( CLEAR ?auto_8686 ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( not ( = ?auto_8685 ?auto_8697 ) ) ( not ( = ?auto_8686 ?auto_8697 ) ) ( not ( = ?auto_8691 ?auto_8698 ) ) ( IS-CRATE ?auto_8685 ) ( not ( = ?auto_8695 ?auto_8690 ) ) ( HOIST-AT ?auto_8696 ?auto_8695 ) ( AVAILABLE ?auto_8696 ) ( SURFACE-AT ?auto_8685 ?auto_8695 ) ( ON ?auto_8685 ?auto_8700 ) ( CLEAR ?auto_8685 ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8700 ) ) ( not ( = ?auto_8685 ?auto_8700 ) ) ( not ( = ?auto_8691 ?auto_8696 ) ) ( SURFACE-AT ?auto_8683 ?auto_8690 ) ( CLEAR ?auto_8683 ) ( IS-CRATE ?auto_8684 ) ( AVAILABLE ?auto_8691 ) ( not ( = ?auto_8699 ?auto_8690 ) ) ( HOIST-AT ?auto_8702 ?auto_8699 ) ( AVAILABLE ?auto_8702 ) ( SURFACE-AT ?auto_8684 ?auto_8699 ) ( ON ?auto_8684 ?auto_8701 ) ( CLEAR ?auto_8684 ) ( TRUCK-AT ?auto_8689 ?auto_8690 ) ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8701 ) ) ( not ( = ?auto_8684 ?auto_8701 ) ) ( not ( = ?auto_8691 ?auto_8702 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8700 ) ) ( not ( = ?auto_8685 ?auto_8701 ) ) ( not ( = ?auto_8695 ?auto_8699 ) ) ( not ( = ?auto_8696 ?auto_8702 ) ) ( not ( = ?auto_8700 ?auto_8701 ) ) ( not ( = ?auto_8683 ?auto_8686 ) ) ( not ( = ?auto_8683 ?auto_8697 ) ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8684 ?auto_8697 ) ) ( not ( = ?auto_8686 ?auto_8700 ) ) ( not ( = ?auto_8686 ?auto_8701 ) ) ( not ( = ?auto_8694 ?auto_8695 ) ) ( not ( = ?auto_8694 ?auto_8699 ) ) ( not ( = ?auto_8698 ?auto_8696 ) ) ( not ( = ?auto_8698 ?auto_8702 ) ) ( not ( = ?auto_8697 ?auto_8700 ) ) ( not ( = ?auto_8697 ?auto_8701 ) ) ( not ( = ?auto_8683 ?auto_8687 ) ) ( not ( = ?auto_8683 ?auto_8693 ) ) ( not ( = ?auto_8684 ?auto_8687 ) ) ( not ( = ?auto_8684 ?auto_8693 ) ) ( not ( = ?auto_8685 ?auto_8687 ) ) ( not ( = ?auto_8685 ?auto_8693 ) ) ( not ( = ?auto_8687 ?auto_8697 ) ) ( not ( = ?auto_8687 ?auto_8700 ) ) ( not ( = ?auto_8687 ?auto_8701 ) ) ( not ( = ?auto_8688 ?auto_8694 ) ) ( not ( = ?auto_8688 ?auto_8695 ) ) ( not ( = ?auto_8688 ?auto_8699 ) ) ( not ( = ?auto_8692 ?auto_8698 ) ) ( not ( = ?auto_8692 ?auto_8696 ) ) ( not ( = ?auto_8692 ?auto_8702 ) ) ( not ( = ?auto_8693 ?auto_8697 ) ) ( not ( = ?auto_8693 ?auto_8700 ) ) ( not ( = ?auto_8693 ?auto_8701 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8683 ?auto_8684 ?auto_8685 ?auto_8686 )
      ( MAKE-1CRATE ?auto_8686 ?auto_8687 )
      ( MAKE-4CRATE-VERIFY ?auto_8683 ?auto_8684 ?auto_8685 ?auto_8686 ?auto_8687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8705 - SURFACE
      ?auto_8706 - SURFACE
    )
    :vars
    (
      ?auto_8707 - HOIST
      ?auto_8708 - PLACE
      ?auto_8710 - PLACE
      ?auto_8711 - HOIST
      ?auto_8712 - SURFACE
      ?auto_8709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8707 ?auto_8708 ) ( SURFACE-AT ?auto_8705 ?auto_8708 ) ( CLEAR ?auto_8705 ) ( IS-CRATE ?auto_8706 ) ( AVAILABLE ?auto_8707 ) ( not ( = ?auto_8710 ?auto_8708 ) ) ( HOIST-AT ?auto_8711 ?auto_8710 ) ( AVAILABLE ?auto_8711 ) ( SURFACE-AT ?auto_8706 ?auto_8710 ) ( ON ?auto_8706 ?auto_8712 ) ( CLEAR ?auto_8706 ) ( TRUCK-AT ?auto_8709 ?auto_8708 ) ( not ( = ?auto_8705 ?auto_8706 ) ) ( not ( = ?auto_8705 ?auto_8712 ) ) ( not ( = ?auto_8706 ?auto_8712 ) ) ( not ( = ?auto_8707 ?auto_8711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8709 ?auto_8708 ?auto_8710 )
      ( !LIFT ?auto_8711 ?auto_8706 ?auto_8712 ?auto_8710 )
      ( !LOAD ?auto_8711 ?auto_8706 ?auto_8709 ?auto_8710 )
      ( !DRIVE ?auto_8709 ?auto_8710 ?auto_8708 )
      ( !UNLOAD ?auto_8707 ?auto_8706 ?auto_8709 ?auto_8708 )
      ( !DROP ?auto_8707 ?auto_8706 ?auto_8705 ?auto_8708 )
      ( MAKE-1CRATE-VERIFY ?auto_8705 ?auto_8706 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8719 - SURFACE
      ?auto_8720 - SURFACE
      ?auto_8721 - SURFACE
      ?auto_8722 - SURFACE
      ?auto_8723 - SURFACE
      ?auto_8724 - SURFACE
    )
    :vars
    (
      ?auto_8727 - HOIST
      ?auto_8728 - PLACE
      ?auto_8730 - PLACE
      ?auto_8729 - HOIST
      ?auto_8726 - SURFACE
      ?auto_8732 - SURFACE
      ?auto_8733 - PLACE
      ?auto_8736 - HOIST
      ?auto_8740 - SURFACE
      ?auto_8734 - PLACE
      ?auto_8735 - HOIST
      ?auto_8739 - SURFACE
      ?auto_8737 - PLACE
      ?auto_8731 - HOIST
      ?auto_8738 - SURFACE
      ?auto_8725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8727 ?auto_8728 ) ( IS-CRATE ?auto_8724 ) ( not ( = ?auto_8730 ?auto_8728 ) ) ( HOIST-AT ?auto_8729 ?auto_8730 ) ( SURFACE-AT ?auto_8724 ?auto_8730 ) ( ON ?auto_8724 ?auto_8726 ) ( CLEAR ?auto_8724 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( not ( = ?auto_8727 ?auto_8729 ) ) ( IS-CRATE ?auto_8723 ) ( AVAILABLE ?auto_8729 ) ( SURFACE-AT ?auto_8723 ?auto_8730 ) ( ON ?auto_8723 ?auto_8732 ) ( CLEAR ?auto_8723 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8732 ) ) ( not ( = ?auto_8723 ?auto_8732 ) ) ( IS-CRATE ?auto_8722 ) ( not ( = ?auto_8733 ?auto_8728 ) ) ( HOIST-AT ?auto_8736 ?auto_8733 ) ( AVAILABLE ?auto_8736 ) ( SURFACE-AT ?auto_8722 ?auto_8733 ) ( ON ?auto_8722 ?auto_8740 ) ( CLEAR ?auto_8722 ) ( not ( = ?auto_8721 ?auto_8722 ) ) ( not ( = ?auto_8721 ?auto_8740 ) ) ( not ( = ?auto_8722 ?auto_8740 ) ) ( not ( = ?auto_8727 ?auto_8736 ) ) ( IS-CRATE ?auto_8721 ) ( not ( = ?auto_8734 ?auto_8728 ) ) ( HOIST-AT ?auto_8735 ?auto_8734 ) ( AVAILABLE ?auto_8735 ) ( SURFACE-AT ?auto_8721 ?auto_8734 ) ( ON ?auto_8721 ?auto_8739 ) ( CLEAR ?auto_8721 ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8720 ?auto_8739 ) ) ( not ( = ?auto_8721 ?auto_8739 ) ) ( not ( = ?auto_8727 ?auto_8735 ) ) ( SURFACE-AT ?auto_8719 ?auto_8728 ) ( CLEAR ?auto_8719 ) ( IS-CRATE ?auto_8720 ) ( AVAILABLE ?auto_8727 ) ( not ( = ?auto_8737 ?auto_8728 ) ) ( HOIST-AT ?auto_8731 ?auto_8737 ) ( AVAILABLE ?auto_8731 ) ( SURFACE-AT ?auto_8720 ?auto_8737 ) ( ON ?auto_8720 ?auto_8738 ) ( CLEAR ?auto_8720 ) ( TRUCK-AT ?auto_8725 ?auto_8728 ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( not ( = ?auto_8719 ?auto_8738 ) ) ( not ( = ?auto_8720 ?auto_8738 ) ) ( not ( = ?auto_8727 ?auto_8731 ) ) ( not ( = ?auto_8719 ?auto_8721 ) ) ( not ( = ?auto_8719 ?auto_8739 ) ) ( not ( = ?auto_8721 ?auto_8738 ) ) ( not ( = ?auto_8734 ?auto_8737 ) ) ( not ( = ?auto_8735 ?auto_8731 ) ) ( not ( = ?auto_8739 ?auto_8738 ) ) ( not ( = ?auto_8719 ?auto_8722 ) ) ( not ( = ?auto_8719 ?auto_8740 ) ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8720 ?auto_8740 ) ) ( not ( = ?auto_8722 ?auto_8739 ) ) ( not ( = ?auto_8722 ?auto_8738 ) ) ( not ( = ?auto_8733 ?auto_8734 ) ) ( not ( = ?auto_8733 ?auto_8737 ) ) ( not ( = ?auto_8736 ?auto_8735 ) ) ( not ( = ?auto_8736 ?auto_8731 ) ) ( not ( = ?auto_8740 ?auto_8739 ) ) ( not ( = ?auto_8740 ?auto_8738 ) ) ( not ( = ?auto_8719 ?auto_8723 ) ) ( not ( = ?auto_8719 ?auto_8732 ) ) ( not ( = ?auto_8720 ?auto_8723 ) ) ( not ( = ?auto_8720 ?auto_8732 ) ) ( not ( = ?auto_8721 ?auto_8723 ) ) ( not ( = ?auto_8721 ?auto_8732 ) ) ( not ( = ?auto_8723 ?auto_8740 ) ) ( not ( = ?auto_8723 ?auto_8739 ) ) ( not ( = ?auto_8723 ?auto_8738 ) ) ( not ( = ?auto_8730 ?auto_8733 ) ) ( not ( = ?auto_8730 ?auto_8734 ) ) ( not ( = ?auto_8730 ?auto_8737 ) ) ( not ( = ?auto_8729 ?auto_8736 ) ) ( not ( = ?auto_8729 ?auto_8735 ) ) ( not ( = ?auto_8729 ?auto_8731 ) ) ( not ( = ?auto_8732 ?auto_8740 ) ) ( not ( = ?auto_8732 ?auto_8739 ) ) ( not ( = ?auto_8732 ?auto_8738 ) ) ( not ( = ?auto_8719 ?auto_8724 ) ) ( not ( = ?auto_8719 ?auto_8726 ) ) ( not ( = ?auto_8720 ?auto_8724 ) ) ( not ( = ?auto_8720 ?auto_8726 ) ) ( not ( = ?auto_8721 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8726 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8732 ) ) ( not ( = ?auto_8724 ?auto_8740 ) ) ( not ( = ?auto_8724 ?auto_8739 ) ) ( not ( = ?auto_8724 ?auto_8738 ) ) ( not ( = ?auto_8726 ?auto_8732 ) ) ( not ( = ?auto_8726 ?auto_8740 ) ) ( not ( = ?auto_8726 ?auto_8739 ) ) ( not ( = ?auto_8726 ?auto_8738 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8723 )
      ( MAKE-1CRATE ?auto_8723 ?auto_8724 )
      ( MAKE-5CRATE-VERIFY ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8723 ?auto_8724 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8743 - SURFACE
      ?auto_8744 - SURFACE
    )
    :vars
    (
      ?auto_8745 - HOIST
      ?auto_8746 - PLACE
      ?auto_8748 - PLACE
      ?auto_8749 - HOIST
      ?auto_8750 - SURFACE
      ?auto_8747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8745 ?auto_8746 ) ( SURFACE-AT ?auto_8743 ?auto_8746 ) ( CLEAR ?auto_8743 ) ( IS-CRATE ?auto_8744 ) ( AVAILABLE ?auto_8745 ) ( not ( = ?auto_8748 ?auto_8746 ) ) ( HOIST-AT ?auto_8749 ?auto_8748 ) ( AVAILABLE ?auto_8749 ) ( SURFACE-AT ?auto_8744 ?auto_8748 ) ( ON ?auto_8744 ?auto_8750 ) ( CLEAR ?auto_8744 ) ( TRUCK-AT ?auto_8747 ?auto_8746 ) ( not ( = ?auto_8743 ?auto_8744 ) ) ( not ( = ?auto_8743 ?auto_8750 ) ) ( not ( = ?auto_8744 ?auto_8750 ) ) ( not ( = ?auto_8745 ?auto_8749 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8747 ?auto_8746 ?auto_8748 )
      ( !LIFT ?auto_8749 ?auto_8744 ?auto_8750 ?auto_8748 )
      ( !LOAD ?auto_8749 ?auto_8744 ?auto_8747 ?auto_8748 )
      ( !DRIVE ?auto_8747 ?auto_8748 ?auto_8746 )
      ( !UNLOAD ?auto_8745 ?auto_8744 ?auto_8747 ?auto_8746 )
      ( !DROP ?auto_8745 ?auto_8744 ?auto_8743 ?auto_8746 )
      ( MAKE-1CRATE-VERIFY ?auto_8743 ?auto_8744 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8758 - SURFACE
      ?auto_8759 - SURFACE
      ?auto_8760 - SURFACE
      ?auto_8761 - SURFACE
      ?auto_8762 - SURFACE
      ?auto_8763 - SURFACE
      ?auto_8764 - SURFACE
    )
    :vars
    (
      ?auto_8770 - HOIST
      ?auto_8766 - PLACE
      ?auto_8765 - PLACE
      ?auto_8769 - HOIST
      ?auto_8767 - SURFACE
      ?auto_8775 - SURFACE
      ?auto_8779 - SURFACE
      ?auto_8773 - PLACE
      ?auto_8776 - HOIST
      ?auto_8778 - SURFACE
      ?auto_8774 - PLACE
      ?auto_8772 - HOIST
      ?auto_8777 - SURFACE
      ?auto_8781 - PLACE
      ?auto_8780 - HOIST
      ?auto_8771 - SURFACE
      ?auto_8768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8770 ?auto_8766 ) ( IS-CRATE ?auto_8764 ) ( not ( = ?auto_8765 ?auto_8766 ) ) ( HOIST-AT ?auto_8769 ?auto_8765 ) ( SURFACE-AT ?auto_8764 ?auto_8765 ) ( ON ?auto_8764 ?auto_8767 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8767 ) ) ( not ( = ?auto_8764 ?auto_8767 ) ) ( not ( = ?auto_8770 ?auto_8769 ) ) ( IS-CRATE ?auto_8763 ) ( SURFACE-AT ?auto_8763 ?auto_8765 ) ( ON ?auto_8763 ?auto_8775 ) ( CLEAR ?auto_8763 ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8775 ) ) ( not ( = ?auto_8763 ?auto_8775 ) ) ( IS-CRATE ?auto_8762 ) ( AVAILABLE ?auto_8769 ) ( SURFACE-AT ?auto_8762 ?auto_8765 ) ( ON ?auto_8762 ?auto_8779 ) ( CLEAR ?auto_8762 ) ( not ( = ?auto_8761 ?auto_8762 ) ) ( not ( = ?auto_8761 ?auto_8779 ) ) ( not ( = ?auto_8762 ?auto_8779 ) ) ( IS-CRATE ?auto_8761 ) ( not ( = ?auto_8773 ?auto_8766 ) ) ( HOIST-AT ?auto_8776 ?auto_8773 ) ( AVAILABLE ?auto_8776 ) ( SURFACE-AT ?auto_8761 ?auto_8773 ) ( ON ?auto_8761 ?auto_8778 ) ( CLEAR ?auto_8761 ) ( not ( = ?auto_8760 ?auto_8761 ) ) ( not ( = ?auto_8760 ?auto_8778 ) ) ( not ( = ?auto_8761 ?auto_8778 ) ) ( not ( = ?auto_8770 ?auto_8776 ) ) ( IS-CRATE ?auto_8760 ) ( not ( = ?auto_8774 ?auto_8766 ) ) ( HOIST-AT ?auto_8772 ?auto_8774 ) ( AVAILABLE ?auto_8772 ) ( SURFACE-AT ?auto_8760 ?auto_8774 ) ( ON ?auto_8760 ?auto_8777 ) ( CLEAR ?auto_8760 ) ( not ( = ?auto_8759 ?auto_8760 ) ) ( not ( = ?auto_8759 ?auto_8777 ) ) ( not ( = ?auto_8760 ?auto_8777 ) ) ( not ( = ?auto_8770 ?auto_8772 ) ) ( SURFACE-AT ?auto_8758 ?auto_8766 ) ( CLEAR ?auto_8758 ) ( IS-CRATE ?auto_8759 ) ( AVAILABLE ?auto_8770 ) ( not ( = ?auto_8781 ?auto_8766 ) ) ( HOIST-AT ?auto_8780 ?auto_8781 ) ( AVAILABLE ?auto_8780 ) ( SURFACE-AT ?auto_8759 ?auto_8781 ) ( ON ?auto_8759 ?auto_8771 ) ( CLEAR ?auto_8759 ) ( TRUCK-AT ?auto_8768 ?auto_8766 ) ( not ( = ?auto_8758 ?auto_8759 ) ) ( not ( = ?auto_8758 ?auto_8771 ) ) ( not ( = ?auto_8759 ?auto_8771 ) ) ( not ( = ?auto_8770 ?auto_8780 ) ) ( not ( = ?auto_8758 ?auto_8760 ) ) ( not ( = ?auto_8758 ?auto_8777 ) ) ( not ( = ?auto_8760 ?auto_8771 ) ) ( not ( = ?auto_8774 ?auto_8781 ) ) ( not ( = ?auto_8772 ?auto_8780 ) ) ( not ( = ?auto_8777 ?auto_8771 ) ) ( not ( = ?auto_8758 ?auto_8761 ) ) ( not ( = ?auto_8758 ?auto_8778 ) ) ( not ( = ?auto_8759 ?auto_8761 ) ) ( not ( = ?auto_8759 ?auto_8778 ) ) ( not ( = ?auto_8761 ?auto_8777 ) ) ( not ( = ?auto_8761 ?auto_8771 ) ) ( not ( = ?auto_8773 ?auto_8774 ) ) ( not ( = ?auto_8773 ?auto_8781 ) ) ( not ( = ?auto_8776 ?auto_8772 ) ) ( not ( = ?auto_8776 ?auto_8780 ) ) ( not ( = ?auto_8778 ?auto_8777 ) ) ( not ( = ?auto_8778 ?auto_8771 ) ) ( not ( = ?auto_8758 ?auto_8762 ) ) ( not ( = ?auto_8758 ?auto_8779 ) ) ( not ( = ?auto_8759 ?auto_8762 ) ) ( not ( = ?auto_8759 ?auto_8779 ) ) ( not ( = ?auto_8760 ?auto_8762 ) ) ( not ( = ?auto_8760 ?auto_8779 ) ) ( not ( = ?auto_8762 ?auto_8778 ) ) ( not ( = ?auto_8762 ?auto_8777 ) ) ( not ( = ?auto_8762 ?auto_8771 ) ) ( not ( = ?auto_8765 ?auto_8773 ) ) ( not ( = ?auto_8765 ?auto_8774 ) ) ( not ( = ?auto_8765 ?auto_8781 ) ) ( not ( = ?auto_8769 ?auto_8776 ) ) ( not ( = ?auto_8769 ?auto_8772 ) ) ( not ( = ?auto_8769 ?auto_8780 ) ) ( not ( = ?auto_8779 ?auto_8778 ) ) ( not ( = ?auto_8779 ?auto_8777 ) ) ( not ( = ?auto_8779 ?auto_8771 ) ) ( not ( = ?auto_8758 ?auto_8763 ) ) ( not ( = ?auto_8758 ?auto_8775 ) ) ( not ( = ?auto_8759 ?auto_8763 ) ) ( not ( = ?auto_8759 ?auto_8775 ) ) ( not ( = ?auto_8760 ?auto_8763 ) ) ( not ( = ?auto_8760 ?auto_8775 ) ) ( not ( = ?auto_8761 ?auto_8763 ) ) ( not ( = ?auto_8761 ?auto_8775 ) ) ( not ( = ?auto_8763 ?auto_8779 ) ) ( not ( = ?auto_8763 ?auto_8778 ) ) ( not ( = ?auto_8763 ?auto_8777 ) ) ( not ( = ?auto_8763 ?auto_8771 ) ) ( not ( = ?auto_8775 ?auto_8779 ) ) ( not ( = ?auto_8775 ?auto_8778 ) ) ( not ( = ?auto_8775 ?auto_8777 ) ) ( not ( = ?auto_8775 ?auto_8771 ) ) ( not ( = ?auto_8758 ?auto_8764 ) ) ( not ( = ?auto_8758 ?auto_8767 ) ) ( not ( = ?auto_8759 ?auto_8764 ) ) ( not ( = ?auto_8759 ?auto_8767 ) ) ( not ( = ?auto_8760 ?auto_8764 ) ) ( not ( = ?auto_8760 ?auto_8767 ) ) ( not ( = ?auto_8761 ?auto_8764 ) ) ( not ( = ?auto_8761 ?auto_8767 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8762 ?auto_8767 ) ) ( not ( = ?auto_8764 ?auto_8775 ) ) ( not ( = ?auto_8764 ?auto_8779 ) ) ( not ( = ?auto_8764 ?auto_8778 ) ) ( not ( = ?auto_8764 ?auto_8777 ) ) ( not ( = ?auto_8764 ?auto_8771 ) ) ( not ( = ?auto_8767 ?auto_8775 ) ) ( not ( = ?auto_8767 ?auto_8779 ) ) ( not ( = ?auto_8767 ?auto_8778 ) ) ( not ( = ?auto_8767 ?auto_8777 ) ) ( not ( = ?auto_8767 ?auto_8771 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8758 ?auto_8759 ?auto_8760 ?auto_8761 ?auto_8762 ?auto_8763 )
      ( MAKE-1CRATE ?auto_8763 ?auto_8764 )
      ( MAKE-6CRATE-VERIFY ?auto_8758 ?auto_8759 ?auto_8760 ?auto_8761 ?auto_8762 ?auto_8763 ?auto_8764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8784 - SURFACE
      ?auto_8785 - SURFACE
    )
    :vars
    (
      ?auto_8786 - HOIST
      ?auto_8787 - PLACE
      ?auto_8789 - PLACE
      ?auto_8790 - HOIST
      ?auto_8791 - SURFACE
      ?auto_8788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8786 ?auto_8787 ) ( SURFACE-AT ?auto_8784 ?auto_8787 ) ( CLEAR ?auto_8784 ) ( IS-CRATE ?auto_8785 ) ( AVAILABLE ?auto_8786 ) ( not ( = ?auto_8789 ?auto_8787 ) ) ( HOIST-AT ?auto_8790 ?auto_8789 ) ( AVAILABLE ?auto_8790 ) ( SURFACE-AT ?auto_8785 ?auto_8789 ) ( ON ?auto_8785 ?auto_8791 ) ( CLEAR ?auto_8785 ) ( TRUCK-AT ?auto_8788 ?auto_8787 ) ( not ( = ?auto_8784 ?auto_8785 ) ) ( not ( = ?auto_8784 ?auto_8791 ) ) ( not ( = ?auto_8785 ?auto_8791 ) ) ( not ( = ?auto_8786 ?auto_8790 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8788 ?auto_8787 ?auto_8789 )
      ( !LIFT ?auto_8790 ?auto_8785 ?auto_8791 ?auto_8789 )
      ( !LOAD ?auto_8790 ?auto_8785 ?auto_8788 ?auto_8789 )
      ( !DRIVE ?auto_8788 ?auto_8789 ?auto_8787 )
      ( !UNLOAD ?auto_8786 ?auto_8785 ?auto_8788 ?auto_8787 )
      ( !DROP ?auto_8786 ?auto_8785 ?auto_8784 ?auto_8787 )
      ( MAKE-1CRATE-VERIFY ?auto_8784 ?auto_8785 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8800 - SURFACE
      ?auto_8801 - SURFACE
      ?auto_8802 - SURFACE
      ?auto_8803 - SURFACE
      ?auto_8804 - SURFACE
      ?auto_8805 - SURFACE
      ?auto_8806 - SURFACE
      ?auto_8807 - SURFACE
    )
    :vars
    (
      ?auto_8812 - HOIST
      ?auto_8813 - PLACE
      ?auto_8811 - PLACE
      ?auto_8808 - HOIST
      ?auto_8809 - SURFACE
      ?auto_8824 - PLACE
      ?auto_8825 - HOIST
      ?auto_8814 - SURFACE
      ?auto_8819 - SURFACE
      ?auto_8820 - SURFACE
      ?auto_8815 - PLACE
      ?auto_8818 - HOIST
      ?auto_8816 - SURFACE
      ?auto_8817 - SURFACE
      ?auto_8821 - PLACE
      ?auto_8822 - HOIST
      ?auto_8823 - SURFACE
      ?auto_8810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8812 ?auto_8813 ) ( IS-CRATE ?auto_8807 ) ( not ( = ?auto_8811 ?auto_8813 ) ) ( HOIST-AT ?auto_8808 ?auto_8811 ) ( SURFACE-AT ?auto_8807 ?auto_8811 ) ( ON ?auto_8807 ?auto_8809 ) ( CLEAR ?auto_8807 ) ( not ( = ?auto_8806 ?auto_8807 ) ) ( not ( = ?auto_8806 ?auto_8809 ) ) ( not ( = ?auto_8807 ?auto_8809 ) ) ( not ( = ?auto_8812 ?auto_8808 ) ) ( IS-CRATE ?auto_8806 ) ( not ( = ?auto_8824 ?auto_8813 ) ) ( HOIST-AT ?auto_8825 ?auto_8824 ) ( SURFACE-AT ?auto_8806 ?auto_8824 ) ( ON ?auto_8806 ?auto_8814 ) ( CLEAR ?auto_8806 ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( not ( = ?auto_8805 ?auto_8814 ) ) ( not ( = ?auto_8806 ?auto_8814 ) ) ( not ( = ?auto_8812 ?auto_8825 ) ) ( IS-CRATE ?auto_8805 ) ( SURFACE-AT ?auto_8805 ?auto_8824 ) ( ON ?auto_8805 ?auto_8819 ) ( CLEAR ?auto_8805 ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8804 ?auto_8819 ) ) ( not ( = ?auto_8805 ?auto_8819 ) ) ( IS-CRATE ?auto_8804 ) ( AVAILABLE ?auto_8825 ) ( SURFACE-AT ?auto_8804 ?auto_8824 ) ( ON ?auto_8804 ?auto_8820 ) ( CLEAR ?auto_8804 ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8820 ) ) ( not ( = ?auto_8804 ?auto_8820 ) ) ( IS-CRATE ?auto_8803 ) ( not ( = ?auto_8815 ?auto_8813 ) ) ( HOIST-AT ?auto_8818 ?auto_8815 ) ( AVAILABLE ?auto_8818 ) ( SURFACE-AT ?auto_8803 ?auto_8815 ) ( ON ?auto_8803 ?auto_8816 ) ( CLEAR ?auto_8803 ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( not ( = ?auto_8802 ?auto_8816 ) ) ( not ( = ?auto_8803 ?auto_8816 ) ) ( not ( = ?auto_8812 ?auto_8818 ) ) ( IS-CRATE ?auto_8802 ) ( AVAILABLE ?auto_8808 ) ( SURFACE-AT ?auto_8802 ?auto_8811 ) ( ON ?auto_8802 ?auto_8817 ) ( CLEAR ?auto_8802 ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8801 ?auto_8817 ) ) ( not ( = ?auto_8802 ?auto_8817 ) ) ( SURFACE-AT ?auto_8800 ?auto_8813 ) ( CLEAR ?auto_8800 ) ( IS-CRATE ?auto_8801 ) ( AVAILABLE ?auto_8812 ) ( not ( = ?auto_8821 ?auto_8813 ) ) ( HOIST-AT ?auto_8822 ?auto_8821 ) ( AVAILABLE ?auto_8822 ) ( SURFACE-AT ?auto_8801 ?auto_8821 ) ( ON ?auto_8801 ?auto_8823 ) ( CLEAR ?auto_8801 ) ( TRUCK-AT ?auto_8810 ?auto_8813 ) ( not ( = ?auto_8800 ?auto_8801 ) ) ( not ( = ?auto_8800 ?auto_8823 ) ) ( not ( = ?auto_8801 ?auto_8823 ) ) ( not ( = ?auto_8812 ?auto_8822 ) ) ( not ( = ?auto_8800 ?auto_8802 ) ) ( not ( = ?auto_8800 ?auto_8817 ) ) ( not ( = ?auto_8802 ?auto_8823 ) ) ( not ( = ?auto_8811 ?auto_8821 ) ) ( not ( = ?auto_8808 ?auto_8822 ) ) ( not ( = ?auto_8817 ?auto_8823 ) ) ( not ( = ?auto_8800 ?auto_8803 ) ) ( not ( = ?auto_8800 ?auto_8816 ) ) ( not ( = ?auto_8801 ?auto_8803 ) ) ( not ( = ?auto_8801 ?auto_8816 ) ) ( not ( = ?auto_8803 ?auto_8817 ) ) ( not ( = ?auto_8803 ?auto_8823 ) ) ( not ( = ?auto_8815 ?auto_8811 ) ) ( not ( = ?auto_8815 ?auto_8821 ) ) ( not ( = ?auto_8818 ?auto_8808 ) ) ( not ( = ?auto_8818 ?auto_8822 ) ) ( not ( = ?auto_8816 ?auto_8817 ) ) ( not ( = ?auto_8816 ?auto_8823 ) ) ( not ( = ?auto_8800 ?auto_8804 ) ) ( not ( = ?auto_8800 ?auto_8820 ) ) ( not ( = ?auto_8801 ?auto_8804 ) ) ( not ( = ?auto_8801 ?auto_8820 ) ) ( not ( = ?auto_8802 ?auto_8804 ) ) ( not ( = ?auto_8802 ?auto_8820 ) ) ( not ( = ?auto_8804 ?auto_8816 ) ) ( not ( = ?auto_8804 ?auto_8817 ) ) ( not ( = ?auto_8804 ?auto_8823 ) ) ( not ( = ?auto_8824 ?auto_8815 ) ) ( not ( = ?auto_8824 ?auto_8811 ) ) ( not ( = ?auto_8824 ?auto_8821 ) ) ( not ( = ?auto_8825 ?auto_8818 ) ) ( not ( = ?auto_8825 ?auto_8808 ) ) ( not ( = ?auto_8825 ?auto_8822 ) ) ( not ( = ?auto_8820 ?auto_8816 ) ) ( not ( = ?auto_8820 ?auto_8817 ) ) ( not ( = ?auto_8820 ?auto_8823 ) ) ( not ( = ?auto_8800 ?auto_8805 ) ) ( not ( = ?auto_8800 ?auto_8819 ) ) ( not ( = ?auto_8801 ?auto_8805 ) ) ( not ( = ?auto_8801 ?auto_8819 ) ) ( not ( = ?auto_8802 ?auto_8805 ) ) ( not ( = ?auto_8802 ?auto_8819 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8819 ) ) ( not ( = ?auto_8805 ?auto_8820 ) ) ( not ( = ?auto_8805 ?auto_8816 ) ) ( not ( = ?auto_8805 ?auto_8817 ) ) ( not ( = ?auto_8805 ?auto_8823 ) ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8816 ) ) ( not ( = ?auto_8819 ?auto_8817 ) ) ( not ( = ?auto_8819 ?auto_8823 ) ) ( not ( = ?auto_8800 ?auto_8806 ) ) ( not ( = ?auto_8800 ?auto_8814 ) ) ( not ( = ?auto_8801 ?auto_8806 ) ) ( not ( = ?auto_8801 ?auto_8814 ) ) ( not ( = ?auto_8802 ?auto_8806 ) ) ( not ( = ?auto_8802 ?auto_8814 ) ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( not ( = ?auto_8803 ?auto_8814 ) ) ( not ( = ?auto_8804 ?auto_8806 ) ) ( not ( = ?auto_8804 ?auto_8814 ) ) ( not ( = ?auto_8806 ?auto_8819 ) ) ( not ( = ?auto_8806 ?auto_8820 ) ) ( not ( = ?auto_8806 ?auto_8816 ) ) ( not ( = ?auto_8806 ?auto_8817 ) ) ( not ( = ?auto_8806 ?auto_8823 ) ) ( not ( = ?auto_8814 ?auto_8819 ) ) ( not ( = ?auto_8814 ?auto_8820 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8814 ?auto_8817 ) ) ( not ( = ?auto_8814 ?auto_8823 ) ) ( not ( = ?auto_8800 ?auto_8807 ) ) ( not ( = ?auto_8800 ?auto_8809 ) ) ( not ( = ?auto_8801 ?auto_8807 ) ) ( not ( = ?auto_8801 ?auto_8809 ) ) ( not ( = ?auto_8802 ?auto_8807 ) ) ( not ( = ?auto_8802 ?auto_8809 ) ) ( not ( = ?auto_8803 ?auto_8807 ) ) ( not ( = ?auto_8803 ?auto_8809 ) ) ( not ( = ?auto_8804 ?auto_8807 ) ) ( not ( = ?auto_8804 ?auto_8809 ) ) ( not ( = ?auto_8805 ?auto_8807 ) ) ( not ( = ?auto_8805 ?auto_8809 ) ) ( not ( = ?auto_8807 ?auto_8814 ) ) ( not ( = ?auto_8807 ?auto_8819 ) ) ( not ( = ?auto_8807 ?auto_8820 ) ) ( not ( = ?auto_8807 ?auto_8816 ) ) ( not ( = ?auto_8807 ?auto_8817 ) ) ( not ( = ?auto_8807 ?auto_8823 ) ) ( not ( = ?auto_8809 ?auto_8814 ) ) ( not ( = ?auto_8809 ?auto_8819 ) ) ( not ( = ?auto_8809 ?auto_8820 ) ) ( not ( = ?auto_8809 ?auto_8816 ) ) ( not ( = ?auto_8809 ?auto_8817 ) ) ( not ( = ?auto_8809 ?auto_8823 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8800 ?auto_8801 ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ?auto_8806 )
      ( MAKE-1CRATE ?auto_8806 ?auto_8807 )
      ( MAKE-7CRATE-VERIFY ?auto_8800 ?auto_8801 ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ?auto_8806 ?auto_8807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8828 - SURFACE
      ?auto_8829 - SURFACE
    )
    :vars
    (
      ?auto_8830 - HOIST
      ?auto_8831 - PLACE
      ?auto_8833 - PLACE
      ?auto_8834 - HOIST
      ?auto_8835 - SURFACE
      ?auto_8832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8830 ?auto_8831 ) ( SURFACE-AT ?auto_8828 ?auto_8831 ) ( CLEAR ?auto_8828 ) ( IS-CRATE ?auto_8829 ) ( AVAILABLE ?auto_8830 ) ( not ( = ?auto_8833 ?auto_8831 ) ) ( HOIST-AT ?auto_8834 ?auto_8833 ) ( AVAILABLE ?auto_8834 ) ( SURFACE-AT ?auto_8829 ?auto_8833 ) ( ON ?auto_8829 ?auto_8835 ) ( CLEAR ?auto_8829 ) ( TRUCK-AT ?auto_8832 ?auto_8831 ) ( not ( = ?auto_8828 ?auto_8829 ) ) ( not ( = ?auto_8828 ?auto_8835 ) ) ( not ( = ?auto_8829 ?auto_8835 ) ) ( not ( = ?auto_8830 ?auto_8834 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8832 ?auto_8831 ?auto_8833 )
      ( !LIFT ?auto_8834 ?auto_8829 ?auto_8835 ?auto_8833 )
      ( !LOAD ?auto_8834 ?auto_8829 ?auto_8832 ?auto_8833 )
      ( !DRIVE ?auto_8832 ?auto_8833 ?auto_8831 )
      ( !UNLOAD ?auto_8830 ?auto_8829 ?auto_8832 ?auto_8831 )
      ( !DROP ?auto_8830 ?auto_8829 ?auto_8828 ?auto_8831 )
      ( MAKE-1CRATE-VERIFY ?auto_8828 ?auto_8829 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8845 - SURFACE
      ?auto_8846 - SURFACE
      ?auto_8847 - SURFACE
      ?auto_8848 - SURFACE
      ?auto_8849 - SURFACE
      ?auto_8850 - SURFACE
      ?auto_8851 - SURFACE
      ?auto_8853 - SURFACE
      ?auto_8852 - SURFACE
    )
    :vars
    (
      ?auto_8858 - HOIST
      ?auto_8855 - PLACE
      ?auto_8857 - PLACE
      ?auto_8856 - HOIST
      ?auto_8859 - SURFACE
      ?auto_8865 - PLACE
      ?auto_8868 - HOIST
      ?auto_8867 - SURFACE
      ?auto_8870 - PLACE
      ?auto_8860 - HOIST
      ?auto_8872 - SURFACE
      ?auto_8863 - SURFACE
      ?auto_8862 - SURFACE
      ?auto_8866 - PLACE
      ?auto_8864 - HOIST
      ?auto_8874 - SURFACE
      ?auto_8873 - SURFACE
      ?auto_8861 - PLACE
      ?auto_8869 - HOIST
      ?auto_8871 - SURFACE
      ?auto_8854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8858 ?auto_8855 ) ( IS-CRATE ?auto_8852 ) ( not ( = ?auto_8857 ?auto_8855 ) ) ( HOIST-AT ?auto_8856 ?auto_8857 ) ( AVAILABLE ?auto_8856 ) ( SURFACE-AT ?auto_8852 ?auto_8857 ) ( ON ?auto_8852 ?auto_8859 ) ( CLEAR ?auto_8852 ) ( not ( = ?auto_8853 ?auto_8852 ) ) ( not ( = ?auto_8853 ?auto_8859 ) ) ( not ( = ?auto_8852 ?auto_8859 ) ) ( not ( = ?auto_8858 ?auto_8856 ) ) ( IS-CRATE ?auto_8853 ) ( not ( = ?auto_8865 ?auto_8855 ) ) ( HOIST-AT ?auto_8868 ?auto_8865 ) ( SURFACE-AT ?auto_8853 ?auto_8865 ) ( ON ?auto_8853 ?auto_8867 ) ( CLEAR ?auto_8853 ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( not ( = ?auto_8851 ?auto_8867 ) ) ( not ( = ?auto_8853 ?auto_8867 ) ) ( not ( = ?auto_8858 ?auto_8868 ) ) ( IS-CRATE ?auto_8851 ) ( not ( = ?auto_8870 ?auto_8855 ) ) ( HOIST-AT ?auto_8860 ?auto_8870 ) ( SURFACE-AT ?auto_8851 ?auto_8870 ) ( ON ?auto_8851 ?auto_8872 ) ( CLEAR ?auto_8851 ) ( not ( = ?auto_8850 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8872 ) ) ( not ( = ?auto_8851 ?auto_8872 ) ) ( not ( = ?auto_8858 ?auto_8860 ) ) ( IS-CRATE ?auto_8850 ) ( SURFACE-AT ?auto_8850 ?auto_8870 ) ( ON ?auto_8850 ?auto_8863 ) ( CLEAR ?auto_8850 ) ( not ( = ?auto_8849 ?auto_8850 ) ) ( not ( = ?auto_8849 ?auto_8863 ) ) ( not ( = ?auto_8850 ?auto_8863 ) ) ( IS-CRATE ?auto_8849 ) ( AVAILABLE ?auto_8860 ) ( SURFACE-AT ?auto_8849 ?auto_8870 ) ( ON ?auto_8849 ?auto_8862 ) ( CLEAR ?auto_8849 ) ( not ( = ?auto_8848 ?auto_8849 ) ) ( not ( = ?auto_8848 ?auto_8862 ) ) ( not ( = ?auto_8849 ?auto_8862 ) ) ( IS-CRATE ?auto_8848 ) ( not ( = ?auto_8866 ?auto_8855 ) ) ( HOIST-AT ?auto_8864 ?auto_8866 ) ( AVAILABLE ?auto_8864 ) ( SURFACE-AT ?auto_8848 ?auto_8866 ) ( ON ?auto_8848 ?auto_8874 ) ( CLEAR ?auto_8848 ) ( not ( = ?auto_8847 ?auto_8848 ) ) ( not ( = ?auto_8847 ?auto_8874 ) ) ( not ( = ?auto_8848 ?auto_8874 ) ) ( not ( = ?auto_8858 ?auto_8864 ) ) ( IS-CRATE ?auto_8847 ) ( AVAILABLE ?auto_8868 ) ( SURFACE-AT ?auto_8847 ?auto_8865 ) ( ON ?auto_8847 ?auto_8873 ) ( CLEAR ?auto_8847 ) ( not ( = ?auto_8846 ?auto_8847 ) ) ( not ( = ?auto_8846 ?auto_8873 ) ) ( not ( = ?auto_8847 ?auto_8873 ) ) ( SURFACE-AT ?auto_8845 ?auto_8855 ) ( CLEAR ?auto_8845 ) ( IS-CRATE ?auto_8846 ) ( AVAILABLE ?auto_8858 ) ( not ( = ?auto_8861 ?auto_8855 ) ) ( HOIST-AT ?auto_8869 ?auto_8861 ) ( AVAILABLE ?auto_8869 ) ( SURFACE-AT ?auto_8846 ?auto_8861 ) ( ON ?auto_8846 ?auto_8871 ) ( CLEAR ?auto_8846 ) ( TRUCK-AT ?auto_8854 ?auto_8855 ) ( not ( = ?auto_8845 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8871 ) ) ( not ( = ?auto_8846 ?auto_8871 ) ) ( not ( = ?auto_8858 ?auto_8869 ) ) ( not ( = ?auto_8845 ?auto_8847 ) ) ( not ( = ?auto_8845 ?auto_8873 ) ) ( not ( = ?auto_8847 ?auto_8871 ) ) ( not ( = ?auto_8865 ?auto_8861 ) ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8873 ?auto_8871 ) ) ( not ( = ?auto_8845 ?auto_8848 ) ) ( not ( = ?auto_8845 ?auto_8874 ) ) ( not ( = ?auto_8846 ?auto_8848 ) ) ( not ( = ?auto_8846 ?auto_8874 ) ) ( not ( = ?auto_8848 ?auto_8873 ) ) ( not ( = ?auto_8848 ?auto_8871 ) ) ( not ( = ?auto_8866 ?auto_8865 ) ) ( not ( = ?auto_8866 ?auto_8861 ) ) ( not ( = ?auto_8864 ?auto_8868 ) ) ( not ( = ?auto_8864 ?auto_8869 ) ) ( not ( = ?auto_8874 ?auto_8873 ) ) ( not ( = ?auto_8874 ?auto_8871 ) ) ( not ( = ?auto_8845 ?auto_8849 ) ) ( not ( = ?auto_8845 ?auto_8862 ) ) ( not ( = ?auto_8846 ?auto_8849 ) ) ( not ( = ?auto_8846 ?auto_8862 ) ) ( not ( = ?auto_8847 ?auto_8849 ) ) ( not ( = ?auto_8847 ?auto_8862 ) ) ( not ( = ?auto_8849 ?auto_8874 ) ) ( not ( = ?auto_8849 ?auto_8873 ) ) ( not ( = ?auto_8849 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8866 ) ) ( not ( = ?auto_8870 ?auto_8865 ) ) ( not ( = ?auto_8870 ?auto_8861 ) ) ( not ( = ?auto_8860 ?auto_8864 ) ) ( not ( = ?auto_8860 ?auto_8868 ) ) ( not ( = ?auto_8860 ?auto_8869 ) ) ( not ( = ?auto_8862 ?auto_8874 ) ) ( not ( = ?auto_8862 ?auto_8873 ) ) ( not ( = ?auto_8862 ?auto_8871 ) ) ( not ( = ?auto_8845 ?auto_8850 ) ) ( not ( = ?auto_8845 ?auto_8863 ) ) ( not ( = ?auto_8846 ?auto_8850 ) ) ( not ( = ?auto_8846 ?auto_8863 ) ) ( not ( = ?auto_8847 ?auto_8850 ) ) ( not ( = ?auto_8847 ?auto_8863 ) ) ( not ( = ?auto_8848 ?auto_8850 ) ) ( not ( = ?auto_8848 ?auto_8863 ) ) ( not ( = ?auto_8850 ?auto_8862 ) ) ( not ( = ?auto_8850 ?auto_8874 ) ) ( not ( = ?auto_8850 ?auto_8873 ) ) ( not ( = ?auto_8850 ?auto_8871 ) ) ( not ( = ?auto_8863 ?auto_8862 ) ) ( not ( = ?auto_8863 ?auto_8874 ) ) ( not ( = ?auto_8863 ?auto_8873 ) ) ( not ( = ?auto_8863 ?auto_8871 ) ) ( not ( = ?auto_8845 ?auto_8851 ) ) ( not ( = ?auto_8845 ?auto_8872 ) ) ( not ( = ?auto_8846 ?auto_8851 ) ) ( not ( = ?auto_8846 ?auto_8872 ) ) ( not ( = ?auto_8847 ?auto_8851 ) ) ( not ( = ?auto_8847 ?auto_8872 ) ) ( not ( = ?auto_8848 ?auto_8851 ) ) ( not ( = ?auto_8848 ?auto_8872 ) ) ( not ( = ?auto_8849 ?auto_8851 ) ) ( not ( = ?auto_8849 ?auto_8872 ) ) ( not ( = ?auto_8851 ?auto_8863 ) ) ( not ( = ?auto_8851 ?auto_8862 ) ) ( not ( = ?auto_8851 ?auto_8874 ) ) ( not ( = ?auto_8851 ?auto_8873 ) ) ( not ( = ?auto_8851 ?auto_8871 ) ) ( not ( = ?auto_8872 ?auto_8863 ) ) ( not ( = ?auto_8872 ?auto_8862 ) ) ( not ( = ?auto_8872 ?auto_8874 ) ) ( not ( = ?auto_8872 ?auto_8873 ) ) ( not ( = ?auto_8872 ?auto_8871 ) ) ( not ( = ?auto_8845 ?auto_8853 ) ) ( not ( = ?auto_8845 ?auto_8867 ) ) ( not ( = ?auto_8846 ?auto_8853 ) ) ( not ( = ?auto_8846 ?auto_8867 ) ) ( not ( = ?auto_8847 ?auto_8853 ) ) ( not ( = ?auto_8847 ?auto_8867 ) ) ( not ( = ?auto_8848 ?auto_8853 ) ) ( not ( = ?auto_8848 ?auto_8867 ) ) ( not ( = ?auto_8849 ?auto_8853 ) ) ( not ( = ?auto_8849 ?auto_8867 ) ) ( not ( = ?auto_8850 ?auto_8853 ) ) ( not ( = ?auto_8850 ?auto_8867 ) ) ( not ( = ?auto_8853 ?auto_8872 ) ) ( not ( = ?auto_8853 ?auto_8863 ) ) ( not ( = ?auto_8853 ?auto_8862 ) ) ( not ( = ?auto_8853 ?auto_8874 ) ) ( not ( = ?auto_8853 ?auto_8873 ) ) ( not ( = ?auto_8853 ?auto_8871 ) ) ( not ( = ?auto_8867 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8863 ) ) ( not ( = ?auto_8867 ?auto_8862 ) ) ( not ( = ?auto_8867 ?auto_8874 ) ) ( not ( = ?auto_8867 ?auto_8873 ) ) ( not ( = ?auto_8867 ?auto_8871 ) ) ( not ( = ?auto_8845 ?auto_8852 ) ) ( not ( = ?auto_8845 ?auto_8859 ) ) ( not ( = ?auto_8846 ?auto_8852 ) ) ( not ( = ?auto_8846 ?auto_8859 ) ) ( not ( = ?auto_8847 ?auto_8852 ) ) ( not ( = ?auto_8847 ?auto_8859 ) ) ( not ( = ?auto_8848 ?auto_8852 ) ) ( not ( = ?auto_8848 ?auto_8859 ) ) ( not ( = ?auto_8849 ?auto_8852 ) ) ( not ( = ?auto_8849 ?auto_8859 ) ) ( not ( = ?auto_8850 ?auto_8852 ) ) ( not ( = ?auto_8850 ?auto_8859 ) ) ( not ( = ?auto_8851 ?auto_8852 ) ) ( not ( = ?auto_8851 ?auto_8859 ) ) ( not ( = ?auto_8852 ?auto_8867 ) ) ( not ( = ?auto_8852 ?auto_8872 ) ) ( not ( = ?auto_8852 ?auto_8863 ) ) ( not ( = ?auto_8852 ?auto_8862 ) ) ( not ( = ?auto_8852 ?auto_8874 ) ) ( not ( = ?auto_8852 ?auto_8873 ) ) ( not ( = ?auto_8852 ?auto_8871 ) ) ( not ( = ?auto_8857 ?auto_8865 ) ) ( not ( = ?auto_8857 ?auto_8870 ) ) ( not ( = ?auto_8857 ?auto_8866 ) ) ( not ( = ?auto_8857 ?auto_8861 ) ) ( not ( = ?auto_8856 ?auto_8868 ) ) ( not ( = ?auto_8856 ?auto_8860 ) ) ( not ( = ?auto_8856 ?auto_8864 ) ) ( not ( = ?auto_8856 ?auto_8869 ) ) ( not ( = ?auto_8859 ?auto_8867 ) ) ( not ( = ?auto_8859 ?auto_8872 ) ) ( not ( = ?auto_8859 ?auto_8863 ) ) ( not ( = ?auto_8859 ?auto_8862 ) ) ( not ( = ?auto_8859 ?auto_8874 ) ) ( not ( = ?auto_8859 ?auto_8873 ) ) ( not ( = ?auto_8859 ?auto_8871 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8845 ?auto_8846 ?auto_8847 ?auto_8848 ?auto_8849 ?auto_8850 ?auto_8851 ?auto_8853 )
      ( MAKE-1CRATE ?auto_8853 ?auto_8852 )
      ( MAKE-8CRATE-VERIFY ?auto_8845 ?auto_8846 ?auto_8847 ?auto_8848 ?auto_8849 ?auto_8850 ?auto_8851 ?auto_8853 ?auto_8852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8877 - SURFACE
      ?auto_8878 - SURFACE
    )
    :vars
    (
      ?auto_8879 - HOIST
      ?auto_8880 - PLACE
      ?auto_8882 - PLACE
      ?auto_8883 - HOIST
      ?auto_8884 - SURFACE
      ?auto_8881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8879 ?auto_8880 ) ( SURFACE-AT ?auto_8877 ?auto_8880 ) ( CLEAR ?auto_8877 ) ( IS-CRATE ?auto_8878 ) ( AVAILABLE ?auto_8879 ) ( not ( = ?auto_8882 ?auto_8880 ) ) ( HOIST-AT ?auto_8883 ?auto_8882 ) ( AVAILABLE ?auto_8883 ) ( SURFACE-AT ?auto_8878 ?auto_8882 ) ( ON ?auto_8878 ?auto_8884 ) ( CLEAR ?auto_8878 ) ( TRUCK-AT ?auto_8881 ?auto_8880 ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( not ( = ?auto_8877 ?auto_8884 ) ) ( not ( = ?auto_8878 ?auto_8884 ) ) ( not ( = ?auto_8879 ?auto_8883 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8881 ?auto_8880 ?auto_8882 )
      ( !LIFT ?auto_8883 ?auto_8878 ?auto_8884 ?auto_8882 )
      ( !LOAD ?auto_8883 ?auto_8878 ?auto_8881 ?auto_8882 )
      ( !DRIVE ?auto_8881 ?auto_8882 ?auto_8880 )
      ( !UNLOAD ?auto_8879 ?auto_8878 ?auto_8881 ?auto_8880 )
      ( !DROP ?auto_8879 ?auto_8878 ?auto_8877 ?auto_8880 )
      ( MAKE-1CRATE-VERIFY ?auto_8877 ?auto_8878 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8895 - SURFACE
      ?auto_8896 - SURFACE
      ?auto_8897 - SURFACE
      ?auto_8898 - SURFACE
      ?auto_8899 - SURFACE
      ?auto_8900 - SURFACE
      ?auto_8901 - SURFACE
      ?auto_8904 - SURFACE
      ?auto_8903 - SURFACE
      ?auto_8902 - SURFACE
    )
    :vars
    (
      ?auto_8906 - HOIST
      ?auto_8905 - PLACE
      ?auto_8909 - PLACE
      ?auto_8910 - HOIST
      ?auto_8908 - SURFACE
      ?auto_8922 - PLACE
      ?auto_8925 - HOIST
      ?auto_8924 - SURFACE
      ?auto_8919 - PLACE
      ?auto_8912 - HOIST
      ?auto_8917 - SURFACE
      ?auto_8911 - PLACE
      ?auto_8913 - HOIST
      ?auto_8915 - SURFACE
      ?auto_8923 - SURFACE
      ?auto_8921 - SURFACE
      ?auto_8918 - PLACE
      ?auto_8920 - HOIST
      ?auto_8926 - SURFACE
      ?auto_8916 - SURFACE
      ?auto_8914 - SURFACE
      ?auto_8907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8906 ?auto_8905 ) ( IS-CRATE ?auto_8902 ) ( not ( = ?auto_8909 ?auto_8905 ) ) ( HOIST-AT ?auto_8910 ?auto_8909 ) ( SURFACE-AT ?auto_8902 ?auto_8909 ) ( ON ?auto_8902 ?auto_8908 ) ( CLEAR ?auto_8902 ) ( not ( = ?auto_8903 ?auto_8902 ) ) ( not ( = ?auto_8903 ?auto_8908 ) ) ( not ( = ?auto_8902 ?auto_8908 ) ) ( not ( = ?auto_8906 ?auto_8910 ) ) ( IS-CRATE ?auto_8903 ) ( not ( = ?auto_8922 ?auto_8905 ) ) ( HOIST-AT ?auto_8925 ?auto_8922 ) ( AVAILABLE ?auto_8925 ) ( SURFACE-AT ?auto_8903 ?auto_8922 ) ( ON ?auto_8903 ?auto_8924 ) ( CLEAR ?auto_8903 ) ( not ( = ?auto_8904 ?auto_8903 ) ) ( not ( = ?auto_8904 ?auto_8924 ) ) ( not ( = ?auto_8903 ?auto_8924 ) ) ( not ( = ?auto_8906 ?auto_8925 ) ) ( IS-CRATE ?auto_8904 ) ( not ( = ?auto_8919 ?auto_8905 ) ) ( HOIST-AT ?auto_8912 ?auto_8919 ) ( SURFACE-AT ?auto_8904 ?auto_8919 ) ( ON ?auto_8904 ?auto_8917 ) ( CLEAR ?auto_8904 ) ( not ( = ?auto_8901 ?auto_8904 ) ) ( not ( = ?auto_8901 ?auto_8917 ) ) ( not ( = ?auto_8904 ?auto_8917 ) ) ( not ( = ?auto_8906 ?auto_8912 ) ) ( IS-CRATE ?auto_8901 ) ( not ( = ?auto_8911 ?auto_8905 ) ) ( HOIST-AT ?auto_8913 ?auto_8911 ) ( SURFACE-AT ?auto_8901 ?auto_8911 ) ( ON ?auto_8901 ?auto_8915 ) ( CLEAR ?auto_8901 ) ( not ( = ?auto_8900 ?auto_8901 ) ) ( not ( = ?auto_8900 ?auto_8915 ) ) ( not ( = ?auto_8901 ?auto_8915 ) ) ( not ( = ?auto_8906 ?auto_8913 ) ) ( IS-CRATE ?auto_8900 ) ( SURFACE-AT ?auto_8900 ?auto_8911 ) ( ON ?auto_8900 ?auto_8923 ) ( CLEAR ?auto_8900 ) ( not ( = ?auto_8899 ?auto_8900 ) ) ( not ( = ?auto_8899 ?auto_8923 ) ) ( not ( = ?auto_8900 ?auto_8923 ) ) ( IS-CRATE ?auto_8899 ) ( AVAILABLE ?auto_8913 ) ( SURFACE-AT ?auto_8899 ?auto_8911 ) ( ON ?auto_8899 ?auto_8921 ) ( CLEAR ?auto_8899 ) ( not ( = ?auto_8898 ?auto_8899 ) ) ( not ( = ?auto_8898 ?auto_8921 ) ) ( not ( = ?auto_8899 ?auto_8921 ) ) ( IS-CRATE ?auto_8898 ) ( not ( = ?auto_8918 ?auto_8905 ) ) ( HOIST-AT ?auto_8920 ?auto_8918 ) ( AVAILABLE ?auto_8920 ) ( SURFACE-AT ?auto_8898 ?auto_8918 ) ( ON ?auto_8898 ?auto_8926 ) ( CLEAR ?auto_8898 ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8926 ) ) ( not ( = ?auto_8898 ?auto_8926 ) ) ( not ( = ?auto_8906 ?auto_8920 ) ) ( IS-CRATE ?auto_8897 ) ( AVAILABLE ?auto_8912 ) ( SURFACE-AT ?auto_8897 ?auto_8919 ) ( ON ?auto_8897 ?auto_8916 ) ( CLEAR ?auto_8897 ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8896 ?auto_8916 ) ) ( not ( = ?auto_8897 ?auto_8916 ) ) ( SURFACE-AT ?auto_8895 ?auto_8905 ) ( CLEAR ?auto_8895 ) ( IS-CRATE ?auto_8896 ) ( AVAILABLE ?auto_8906 ) ( AVAILABLE ?auto_8910 ) ( SURFACE-AT ?auto_8896 ?auto_8909 ) ( ON ?auto_8896 ?auto_8914 ) ( CLEAR ?auto_8896 ) ( TRUCK-AT ?auto_8907 ?auto_8905 ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( not ( = ?auto_8895 ?auto_8914 ) ) ( not ( = ?auto_8896 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8897 ) ) ( not ( = ?auto_8895 ?auto_8916 ) ) ( not ( = ?auto_8897 ?auto_8914 ) ) ( not ( = ?auto_8919 ?auto_8909 ) ) ( not ( = ?auto_8912 ?auto_8910 ) ) ( not ( = ?auto_8916 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8898 ) ) ( not ( = ?auto_8895 ?auto_8926 ) ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8896 ?auto_8926 ) ) ( not ( = ?auto_8898 ?auto_8916 ) ) ( not ( = ?auto_8898 ?auto_8914 ) ) ( not ( = ?auto_8918 ?auto_8919 ) ) ( not ( = ?auto_8918 ?auto_8909 ) ) ( not ( = ?auto_8920 ?auto_8912 ) ) ( not ( = ?auto_8920 ?auto_8910 ) ) ( not ( = ?auto_8926 ?auto_8916 ) ) ( not ( = ?auto_8926 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8899 ) ) ( not ( = ?auto_8895 ?auto_8921 ) ) ( not ( = ?auto_8896 ?auto_8899 ) ) ( not ( = ?auto_8896 ?auto_8921 ) ) ( not ( = ?auto_8897 ?auto_8899 ) ) ( not ( = ?auto_8897 ?auto_8921 ) ) ( not ( = ?auto_8899 ?auto_8926 ) ) ( not ( = ?auto_8899 ?auto_8916 ) ) ( not ( = ?auto_8899 ?auto_8914 ) ) ( not ( = ?auto_8911 ?auto_8918 ) ) ( not ( = ?auto_8911 ?auto_8919 ) ) ( not ( = ?auto_8911 ?auto_8909 ) ) ( not ( = ?auto_8913 ?auto_8920 ) ) ( not ( = ?auto_8913 ?auto_8912 ) ) ( not ( = ?auto_8913 ?auto_8910 ) ) ( not ( = ?auto_8921 ?auto_8926 ) ) ( not ( = ?auto_8921 ?auto_8916 ) ) ( not ( = ?auto_8921 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8900 ) ) ( not ( = ?auto_8895 ?auto_8923 ) ) ( not ( = ?auto_8896 ?auto_8900 ) ) ( not ( = ?auto_8896 ?auto_8923 ) ) ( not ( = ?auto_8897 ?auto_8900 ) ) ( not ( = ?auto_8897 ?auto_8923 ) ) ( not ( = ?auto_8898 ?auto_8900 ) ) ( not ( = ?auto_8898 ?auto_8923 ) ) ( not ( = ?auto_8900 ?auto_8921 ) ) ( not ( = ?auto_8900 ?auto_8926 ) ) ( not ( = ?auto_8900 ?auto_8916 ) ) ( not ( = ?auto_8900 ?auto_8914 ) ) ( not ( = ?auto_8923 ?auto_8921 ) ) ( not ( = ?auto_8923 ?auto_8926 ) ) ( not ( = ?auto_8923 ?auto_8916 ) ) ( not ( = ?auto_8923 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8901 ) ) ( not ( = ?auto_8895 ?auto_8915 ) ) ( not ( = ?auto_8896 ?auto_8901 ) ) ( not ( = ?auto_8896 ?auto_8915 ) ) ( not ( = ?auto_8897 ?auto_8901 ) ) ( not ( = ?auto_8897 ?auto_8915 ) ) ( not ( = ?auto_8898 ?auto_8901 ) ) ( not ( = ?auto_8898 ?auto_8915 ) ) ( not ( = ?auto_8899 ?auto_8901 ) ) ( not ( = ?auto_8899 ?auto_8915 ) ) ( not ( = ?auto_8901 ?auto_8923 ) ) ( not ( = ?auto_8901 ?auto_8921 ) ) ( not ( = ?auto_8901 ?auto_8926 ) ) ( not ( = ?auto_8901 ?auto_8916 ) ) ( not ( = ?auto_8901 ?auto_8914 ) ) ( not ( = ?auto_8915 ?auto_8923 ) ) ( not ( = ?auto_8915 ?auto_8921 ) ) ( not ( = ?auto_8915 ?auto_8926 ) ) ( not ( = ?auto_8915 ?auto_8916 ) ) ( not ( = ?auto_8915 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8904 ) ) ( not ( = ?auto_8895 ?auto_8917 ) ) ( not ( = ?auto_8896 ?auto_8904 ) ) ( not ( = ?auto_8896 ?auto_8917 ) ) ( not ( = ?auto_8897 ?auto_8904 ) ) ( not ( = ?auto_8897 ?auto_8917 ) ) ( not ( = ?auto_8898 ?auto_8904 ) ) ( not ( = ?auto_8898 ?auto_8917 ) ) ( not ( = ?auto_8899 ?auto_8904 ) ) ( not ( = ?auto_8899 ?auto_8917 ) ) ( not ( = ?auto_8900 ?auto_8904 ) ) ( not ( = ?auto_8900 ?auto_8917 ) ) ( not ( = ?auto_8904 ?auto_8915 ) ) ( not ( = ?auto_8904 ?auto_8923 ) ) ( not ( = ?auto_8904 ?auto_8921 ) ) ( not ( = ?auto_8904 ?auto_8926 ) ) ( not ( = ?auto_8904 ?auto_8916 ) ) ( not ( = ?auto_8904 ?auto_8914 ) ) ( not ( = ?auto_8917 ?auto_8915 ) ) ( not ( = ?auto_8917 ?auto_8923 ) ) ( not ( = ?auto_8917 ?auto_8921 ) ) ( not ( = ?auto_8917 ?auto_8926 ) ) ( not ( = ?auto_8917 ?auto_8916 ) ) ( not ( = ?auto_8917 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8903 ) ) ( not ( = ?auto_8895 ?auto_8924 ) ) ( not ( = ?auto_8896 ?auto_8903 ) ) ( not ( = ?auto_8896 ?auto_8924 ) ) ( not ( = ?auto_8897 ?auto_8903 ) ) ( not ( = ?auto_8897 ?auto_8924 ) ) ( not ( = ?auto_8898 ?auto_8903 ) ) ( not ( = ?auto_8898 ?auto_8924 ) ) ( not ( = ?auto_8899 ?auto_8903 ) ) ( not ( = ?auto_8899 ?auto_8924 ) ) ( not ( = ?auto_8900 ?auto_8903 ) ) ( not ( = ?auto_8900 ?auto_8924 ) ) ( not ( = ?auto_8901 ?auto_8903 ) ) ( not ( = ?auto_8901 ?auto_8924 ) ) ( not ( = ?auto_8903 ?auto_8917 ) ) ( not ( = ?auto_8903 ?auto_8915 ) ) ( not ( = ?auto_8903 ?auto_8923 ) ) ( not ( = ?auto_8903 ?auto_8921 ) ) ( not ( = ?auto_8903 ?auto_8926 ) ) ( not ( = ?auto_8903 ?auto_8916 ) ) ( not ( = ?auto_8903 ?auto_8914 ) ) ( not ( = ?auto_8922 ?auto_8919 ) ) ( not ( = ?auto_8922 ?auto_8911 ) ) ( not ( = ?auto_8922 ?auto_8918 ) ) ( not ( = ?auto_8922 ?auto_8909 ) ) ( not ( = ?auto_8925 ?auto_8912 ) ) ( not ( = ?auto_8925 ?auto_8913 ) ) ( not ( = ?auto_8925 ?auto_8920 ) ) ( not ( = ?auto_8925 ?auto_8910 ) ) ( not ( = ?auto_8924 ?auto_8917 ) ) ( not ( = ?auto_8924 ?auto_8915 ) ) ( not ( = ?auto_8924 ?auto_8923 ) ) ( not ( = ?auto_8924 ?auto_8921 ) ) ( not ( = ?auto_8924 ?auto_8926 ) ) ( not ( = ?auto_8924 ?auto_8916 ) ) ( not ( = ?auto_8924 ?auto_8914 ) ) ( not ( = ?auto_8895 ?auto_8902 ) ) ( not ( = ?auto_8895 ?auto_8908 ) ) ( not ( = ?auto_8896 ?auto_8902 ) ) ( not ( = ?auto_8896 ?auto_8908 ) ) ( not ( = ?auto_8897 ?auto_8902 ) ) ( not ( = ?auto_8897 ?auto_8908 ) ) ( not ( = ?auto_8898 ?auto_8902 ) ) ( not ( = ?auto_8898 ?auto_8908 ) ) ( not ( = ?auto_8899 ?auto_8902 ) ) ( not ( = ?auto_8899 ?auto_8908 ) ) ( not ( = ?auto_8900 ?auto_8902 ) ) ( not ( = ?auto_8900 ?auto_8908 ) ) ( not ( = ?auto_8901 ?auto_8902 ) ) ( not ( = ?auto_8901 ?auto_8908 ) ) ( not ( = ?auto_8904 ?auto_8902 ) ) ( not ( = ?auto_8904 ?auto_8908 ) ) ( not ( = ?auto_8902 ?auto_8924 ) ) ( not ( = ?auto_8902 ?auto_8917 ) ) ( not ( = ?auto_8902 ?auto_8915 ) ) ( not ( = ?auto_8902 ?auto_8923 ) ) ( not ( = ?auto_8902 ?auto_8921 ) ) ( not ( = ?auto_8902 ?auto_8926 ) ) ( not ( = ?auto_8902 ?auto_8916 ) ) ( not ( = ?auto_8902 ?auto_8914 ) ) ( not ( = ?auto_8908 ?auto_8924 ) ) ( not ( = ?auto_8908 ?auto_8917 ) ) ( not ( = ?auto_8908 ?auto_8915 ) ) ( not ( = ?auto_8908 ?auto_8923 ) ) ( not ( = ?auto_8908 ?auto_8921 ) ) ( not ( = ?auto_8908 ?auto_8926 ) ) ( not ( = ?auto_8908 ?auto_8916 ) ) ( not ( = ?auto_8908 ?auto_8914 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8895 ?auto_8896 ?auto_8897 ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8901 ?auto_8904 ?auto_8903 )
      ( MAKE-1CRATE ?auto_8903 ?auto_8902 )
      ( MAKE-9CRATE-VERIFY ?auto_8895 ?auto_8896 ?auto_8897 ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8901 ?auto_8904 ?auto_8903 ?auto_8902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8929 - SURFACE
      ?auto_8930 - SURFACE
    )
    :vars
    (
      ?auto_8931 - HOIST
      ?auto_8932 - PLACE
      ?auto_8934 - PLACE
      ?auto_8935 - HOIST
      ?auto_8936 - SURFACE
      ?auto_8933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8931 ?auto_8932 ) ( SURFACE-AT ?auto_8929 ?auto_8932 ) ( CLEAR ?auto_8929 ) ( IS-CRATE ?auto_8930 ) ( AVAILABLE ?auto_8931 ) ( not ( = ?auto_8934 ?auto_8932 ) ) ( HOIST-AT ?auto_8935 ?auto_8934 ) ( AVAILABLE ?auto_8935 ) ( SURFACE-AT ?auto_8930 ?auto_8934 ) ( ON ?auto_8930 ?auto_8936 ) ( CLEAR ?auto_8930 ) ( TRUCK-AT ?auto_8933 ?auto_8932 ) ( not ( = ?auto_8929 ?auto_8930 ) ) ( not ( = ?auto_8929 ?auto_8936 ) ) ( not ( = ?auto_8930 ?auto_8936 ) ) ( not ( = ?auto_8931 ?auto_8935 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8933 ?auto_8932 ?auto_8934 )
      ( !LIFT ?auto_8935 ?auto_8930 ?auto_8936 ?auto_8934 )
      ( !LOAD ?auto_8935 ?auto_8930 ?auto_8933 ?auto_8934 )
      ( !DRIVE ?auto_8933 ?auto_8934 ?auto_8932 )
      ( !UNLOAD ?auto_8931 ?auto_8930 ?auto_8933 ?auto_8932 )
      ( !DROP ?auto_8931 ?auto_8930 ?auto_8929 ?auto_8932 )
      ( MAKE-1CRATE-VERIFY ?auto_8929 ?auto_8930 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8948 - SURFACE
      ?auto_8949 - SURFACE
      ?auto_8950 - SURFACE
      ?auto_8951 - SURFACE
      ?auto_8952 - SURFACE
      ?auto_8953 - SURFACE
      ?auto_8954 - SURFACE
      ?auto_8957 - SURFACE
      ?auto_8956 - SURFACE
      ?auto_8955 - SURFACE
      ?auto_8958 - SURFACE
    )
    :vars
    (
      ?auto_8964 - HOIST
      ?auto_8959 - PLACE
      ?auto_8963 - PLACE
      ?auto_8961 - HOIST
      ?auto_8962 - SURFACE
      ?auto_8981 - PLACE
      ?auto_8970 - HOIST
      ?auto_8978 - SURFACE
      ?auto_8975 - PLACE
      ?auto_8966 - HOIST
      ?auto_8973 - SURFACE
      ?auto_8971 - PLACE
      ?auto_8968 - HOIST
      ?auto_8965 - SURFACE
      ?auto_8979 - SURFACE
      ?auto_8969 - SURFACE
      ?auto_8967 - SURFACE
      ?auto_8974 - PLACE
      ?auto_8972 - HOIST
      ?auto_8976 - SURFACE
      ?auto_8980 - SURFACE
      ?auto_8977 - SURFACE
      ?auto_8960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8964 ?auto_8959 ) ( IS-CRATE ?auto_8958 ) ( not ( = ?auto_8963 ?auto_8959 ) ) ( HOIST-AT ?auto_8961 ?auto_8963 ) ( SURFACE-AT ?auto_8958 ?auto_8963 ) ( ON ?auto_8958 ?auto_8962 ) ( CLEAR ?auto_8958 ) ( not ( = ?auto_8955 ?auto_8958 ) ) ( not ( = ?auto_8955 ?auto_8962 ) ) ( not ( = ?auto_8958 ?auto_8962 ) ) ( not ( = ?auto_8964 ?auto_8961 ) ) ( IS-CRATE ?auto_8955 ) ( not ( = ?auto_8981 ?auto_8959 ) ) ( HOIST-AT ?auto_8970 ?auto_8981 ) ( SURFACE-AT ?auto_8955 ?auto_8981 ) ( ON ?auto_8955 ?auto_8978 ) ( CLEAR ?auto_8955 ) ( not ( = ?auto_8956 ?auto_8955 ) ) ( not ( = ?auto_8956 ?auto_8978 ) ) ( not ( = ?auto_8955 ?auto_8978 ) ) ( not ( = ?auto_8964 ?auto_8970 ) ) ( IS-CRATE ?auto_8956 ) ( not ( = ?auto_8975 ?auto_8959 ) ) ( HOIST-AT ?auto_8966 ?auto_8975 ) ( AVAILABLE ?auto_8966 ) ( SURFACE-AT ?auto_8956 ?auto_8975 ) ( ON ?auto_8956 ?auto_8973 ) ( CLEAR ?auto_8956 ) ( not ( = ?auto_8957 ?auto_8956 ) ) ( not ( = ?auto_8957 ?auto_8973 ) ) ( not ( = ?auto_8956 ?auto_8973 ) ) ( not ( = ?auto_8964 ?auto_8966 ) ) ( IS-CRATE ?auto_8957 ) ( not ( = ?auto_8971 ?auto_8959 ) ) ( HOIST-AT ?auto_8968 ?auto_8971 ) ( SURFACE-AT ?auto_8957 ?auto_8971 ) ( ON ?auto_8957 ?auto_8965 ) ( CLEAR ?auto_8957 ) ( not ( = ?auto_8954 ?auto_8957 ) ) ( not ( = ?auto_8954 ?auto_8965 ) ) ( not ( = ?auto_8957 ?auto_8965 ) ) ( not ( = ?auto_8964 ?auto_8968 ) ) ( IS-CRATE ?auto_8954 ) ( SURFACE-AT ?auto_8954 ?auto_8963 ) ( ON ?auto_8954 ?auto_8979 ) ( CLEAR ?auto_8954 ) ( not ( = ?auto_8953 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8979 ) ) ( not ( = ?auto_8954 ?auto_8979 ) ) ( IS-CRATE ?auto_8953 ) ( SURFACE-AT ?auto_8953 ?auto_8963 ) ( ON ?auto_8953 ?auto_8969 ) ( CLEAR ?auto_8953 ) ( not ( = ?auto_8952 ?auto_8953 ) ) ( not ( = ?auto_8952 ?auto_8969 ) ) ( not ( = ?auto_8953 ?auto_8969 ) ) ( IS-CRATE ?auto_8952 ) ( AVAILABLE ?auto_8961 ) ( SURFACE-AT ?auto_8952 ?auto_8963 ) ( ON ?auto_8952 ?auto_8967 ) ( CLEAR ?auto_8952 ) ( not ( = ?auto_8951 ?auto_8952 ) ) ( not ( = ?auto_8951 ?auto_8967 ) ) ( not ( = ?auto_8952 ?auto_8967 ) ) ( IS-CRATE ?auto_8951 ) ( not ( = ?auto_8974 ?auto_8959 ) ) ( HOIST-AT ?auto_8972 ?auto_8974 ) ( AVAILABLE ?auto_8972 ) ( SURFACE-AT ?auto_8951 ?auto_8974 ) ( ON ?auto_8951 ?auto_8976 ) ( CLEAR ?auto_8951 ) ( not ( = ?auto_8950 ?auto_8951 ) ) ( not ( = ?auto_8950 ?auto_8976 ) ) ( not ( = ?auto_8951 ?auto_8976 ) ) ( not ( = ?auto_8964 ?auto_8972 ) ) ( IS-CRATE ?auto_8950 ) ( AVAILABLE ?auto_8968 ) ( SURFACE-AT ?auto_8950 ?auto_8971 ) ( ON ?auto_8950 ?auto_8980 ) ( CLEAR ?auto_8950 ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( not ( = ?auto_8949 ?auto_8980 ) ) ( not ( = ?auto_8950 ?auto_8980 ) ) ( SURFACE-AT ?auto_8948 ?auto_8959 ) ( CLEAR ?auto_8948 ) ( IS-CRATE ?auto_8949 ) ( AVAILABLE ?auto_8964 ) ( AVAILABLE ?auto_8970 ) ( SURFACE-AT ?auto_8949 ?auto_8981 ) ( ON ?auto_8949 ?auto_8977 ) ( CLEAR ?auto_8949 ) ( TRUCK-AT ?auto_8960 ?auto_8959 ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8977 ) ) ( not ( = ?auto_8949 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8950 ) ) ( not ( = ?auto_8948 ?auto_8980 ) ) ( not ( = ?auto_8950 ?auto_8977 ) ) ( not ( = ?auto_8971 ?auto_8981 ) ) ( not ( = ?auto_8968 ?auto_8970 ) ) ( not ( = ?auto_8980 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8951 ) ) ( not ( = ?auto_8948 ?auto_8976 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8949 ?auto_8976 ) ) ( not ( = ?auto_8951 ?auto_8980 ) ) ( not ( = ?auto_8951 ?auto_8977 ) ) ( not ( = ?auto_8974 ?auto_8971 ) ) ( not ( = ?auto_8974 ?auto_8981 ) ) ( not ( = ?auto_8972 ?auto_8968 ) ) ( not ( = ?auto_8972 ?auto_8970 ) ) ( not ( = ?auto_8976 ?auto_8980 ) ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8948 ?auto_8967 ) ) ( not ( = ?auto_8949 ?auto_8952 ) ) ( not ( = ?auto_8949 ?auto_8967 ) ) ( not ( = ?auto_8950 ?auto_8952 ) ) ( not ( = ?auto_8950 ?auto_8967 ) ) ( not ( = ?auto_8952 ?auto_8976 ) ) ( not ( = ?auto_8952 ?auto_8980 ) ) ( not ( = ?auto_8952 ?auto_8977 ) ) ( not ( = ?auto_8963 ?auto_8974 ) ) ( not ( = ?auto_8963 ?auto_8971 ) ) ( not ( = ?auto_8963 ?auto_8981 ) ) ( not ( = ?auto_8961 ?auto_8972 ) ) ( not ( = ?auto_8961 ?auto_8968 ) ) ( not ( = ?auto_8961 ?auto_8970 ) ) ( not ( = ?auto_8967 ?auto_8976 ) ) ( not ( = ?auto_8967 ?auto_8980 ) ) ( not ( = ?auto_8967 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8953 ) ) ( not ( = ?auto_8948 ?auto_8969 ) ) ( not ( = ?auto_8949 ?auto_8953 ) ) ( not ( = ?auto_8949 ?auto_8969 ) ) ( not ( = ?auto_8950 ?auto_8953 ) ) ( not ( = ?auto_8950 ?auto_8969 ) ) ( not ( = ?auto_8951 ?auto_8953 ) ) ( not ( = ?auto_8951 ?auto_8969 ) ) ( not ( = ?auto_8953 ?auto_8967 ) ) ( not ( = ?auto_8953 ?auto_8976 ) ) ( not ( = ?auto_8953 ?auto_8980 ) ) ( not ( = ?auto_8953 ?auto_8977 ) ) ( not ( = ?auto_8969 ?auto_8967 ) ) ( not ( = ?auto_8969 ?auto_8976 ) ) ( not ( = ?auto_8969 ?auto_8980 ) ) ( not ( = ?auto_8969 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8954 ) ) ( not ( = ?auto_8948 ?auto_8979 ) ) ( not ( = ?auto_8949 ?auto_8954 ) ) ( not ( = ?auto_8949 ?auto_8979 ) ) ( not ( = ?auto_8950 ?auto_8954 ) ) ( not ( = ?auto_8950 ?auto_8979 ) ) ( not ( = ?auto_8951 ?auto_8954 ) ) ( not ( = ?auto_8951 ?auto_8979 ) ) ( not ( = ?auto_8952 ?auto_8954 ) ) ( not ( = ?auto_8952 ?auto_8979 ) ) ( not ( = ?auto_8954 ?auto_8969 ) ) ( not ( = ?auto_8954 ?auto_8967 ) ) ( not ( = ?auto_8954 ?auto_8976 ) ) ( not ( = ?auto_8954 ?auto_8980 ) ) ( not ( = ?auto_8954 ?auto_8977 ) ) ( not ( = ?auto_8979 ?auto_8969 ) ) ( not ( = ?auto_8979 ?auto_8967 ) ) ( not ( = ?auto_8979 ?auto_8976 ) ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8957 ) ) ( not ( = ?auto_8948 ?auto_8965 ) ) ( not ( = ?auto_8949 ?auto_8957 ) ) ( not ( = ?auto_8949 ?auto_8965 ) ) ( not ( = ?auto_8950 ?auto_8957 ) ) ( not ( = ?auto_8950 ?auto_8965 ) ) ( not ( = ?auto_8951 ?auto_8957 ) ) ( not ( = ?auto_8951 ?auto_8965 ) ) ( not ( = ?auto_8952 ?auto_8957 ) ) ( not ( = ?auto_8952 ?auto_8965 ) ) ( not ( = ?auto_8953 ?auto_8957 ) ) ( not ( = ?auto_8953 ?auto_8965 ) ) ( not ( = ?auto_8957 ?auto_8979 ) ) ( not ( = ?auto_8957 ?auto_8969 ) ) ( not ( = ?auto_8957 ?auto_8967 ) ) ( not ( = ?auto_8957 ?auto_8976 ) ) ( not ( = ?auto_8957 ?auto_8980 ) ) ( not ( = ?auto_8957 ?auto_8977 ) ) ( not ( = ?auto_8965 ?auto_8979 ) ) ( not ( = ?auto_8965 ?auto_8969 ) ) ( not ( = ?auto_8965 ?auto_8967 ) ) ( not ( = ?auto_8965 ?auto_8976 ) ) ( not ( = ?auto_8965 ?auto_8980 ) ) ( not ( = ?auto_8965 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8956 ) ) ( not ( = ?auto_8948 ?auto_8973 ) ) ( not ( = ?auto_8949 ?auto_8956 ) ) ( not ( = ?auto_8949 ?auto_8973 ) ) ( not ( = ?auto_8950 ?auto_8956 ) ) ( not ( = ?auto_8950 ?auto_8973 ) ) ( not ( = ?auto_8951 ?auto_8956 ) ) ( not ( = ?auto_8951 ?auto_8973 ) ) ( not ( = ?auto_8952 ?auto_8956 ) ) ( not ( = ?auto_8952 ?auto_8973 ) ) ( not ( = ?auto_8953 ?auto_8956 ) ) ( not ( = ?auto_8953 ?auto_8973 ) ) ( not ( = ?auto_8954 ?auto_8956 ) ) ( not ( = ?auto_8954 ?auto_8973 ) ) ( not ( = ?auto_8956 ?auto_8965 ) ) ( not ( = ?auto_8956 ?auto_8979 ) ) ( not ( = ?auto_8956 ?auto_8969 ) ) ( not ( = ?auto_8956 ?auto_8967 ) ) ( not ( = ?auto_8956 ?auto_8976 ) ) ( not ( = ?auto_8956 ?auto_8980 ) ) ( not ( = ?auto_8956 ?auto_8977 ) ) ( not ( = ?auto_8975 ?auto_8971 ) ) ( not ( = ?auto_8975 ?auto_8963 ) ) ( not ( = ?auto_8975 ?auto_8974 ) ) ( not ( = ?auto_8975 ?auto_8981 ) ) ( not ( = ?auto_8966 ?auto_8968 ) ) ( not ( = ?auto_8966 ?auto_8961 ) ) ( not ( = ?auto_8966 ?auto_8972 ) ) ( not ( = ?auto_8966 ?auto_8970 ) ) ( not ( = ?auto_8973 ?auto_8965 ) ) ( not ( = ?auto_8973 ?auto_8979 ) ) ( not ( = ?auto_8973 ?auto_8969 ) ) ( not ( = ?auto_8973 ?auto_8967 ) ) ( not ( = ?auto_8973 ?auto_8976 ) ) ( not ( = ?auto_8973 ?auto_8980 ) ) ( not ( = ?auto_8973 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8955 ) ) ( not ( = ?auto_8948 ?auto_8978 ) ) ( not ( = ?auto_8949 ?auto_8955 ) ) ( not ( = ?auto_8949 ?auto_8978 ) ) ( not ( = ?auto_8950 ?auto_8955 ) ) ( not ( = ?auto_8950 ?auto_8978 ) ) ( not ( = ?auto_8951 ?auto_8955 ) ) ( not ( = ?auto_8951 ?auto_8978 ) ) ( not ( = ?auto_8952 ?auto_8955 ) ) ( not ( = ?auto_8952 ?auto_8978 ) ) ( not ( = ?auto_8953 ?auto_8955 ) ) ( not ( = ?auto_8953 ?auto_8978 ) ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8978 ) ) ( not ( = ?auto_8957 ?auto_8955 ) ) ( not ( = ?auto_8957 ?auto_8978 ) ) ( not ( = ?auto_8955 ?auto_8973 ) ) ( not ( = ?auto_8955 ?auto_8965 ) ) ( not ( = ?auto_8955 ?auto_8979 ) ) ( not ( = ?auto_8955 ?auto_8969 ) ) ( not ( = ?auto_8955 ?auto_8967 ) ) ( not ( = ?auto_8955 ?auto_8976 ) ) ( not ( = ?auto_8955 ?auto_8980 ) ) ( not ( = ?auto_8955 ?auto_8977 ) ) ( not ( = ?auto_8978 ?auto_8973 ) ) ( not ( = ?auto_8978 ?auto_8965 ) ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_8969 ) ) ( not ( = ?auto_8978 ?auto_8967 ) ) ( not ( = ?auto_8978 ?auto_8976 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( not ( = ?auto_8978 ?auto_8977 ) ) ( not ( = ?auto_8948 ?auto_8958 ) ) ( not ( = ?auto_8948 ?auto_8962 ) ) ( not ( = ?auto_8949 ?auto_8958 ) ) ( not ( = ?auto_8949 ?auto_8962 ) ) ( not ( = ?auto_8950 ?auto_8958 ) ) ( not ( = ?auto_8950 ?auto_8962 ) ) ( not ( = ?auto_8951 ?auto_8958 ) ) ( not ( = ?auto_8951 ?auto_8962 ) ) ( not ( = ?auto_8952 ?auto_8958 ) ) ( not ( = ?auto_8952 ?auto_8962 ) ) ( not ( = ?auto_8953 ?auto_8958 ) ) ( not ( = ?auto_8953 ?auto_8962 ) ) ( not ( = ?auto_8954 ?auto_8958 ) ) ( not ( = ?auto_8954 ?auto_8962 ) ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( not ( = ?auto_8957 ?auto_8962 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( not ( = ?auto_8956 ?auto_8962 ) ) ( not ( = ?auto_8958 ?auto_8978 ) ) ( not ( = ?auto_8958 ?auto_8973 ) ) ( not ( = ?auto_8958 ?auto_8965 ) ) ( not ( = ?auto_8958 ?auto_8979 ) ) ( not ( = ?auto_8958 ?auto_8969 ) ) ( not ( = ?auto_8958 ?auto_8967 ) ) ( not ( = ?auto_8958 ?auto_8976 ) ) ( not ( = ?auto_8958 ?auto_8980 ) ) ( not ( = ?auto_8958 ?auto_8977 ) ) ( not ( = ?auto_8962 ?auto_8978 ) ) ( not ( = ?auto_8962 ?auto_8973 ) ) ( not ( = ?auto_8962 ?auto_8965 ) ) ( not ( = ?auto_8962 ?auto_8979 ) ) ( not ( = ?auto_8962 ?auto_8969 ) ) ( not ( = ?auto_8962 ?auto_8967 ) ) ( not ( = ?auto_8962 ?auto_8976 ) ) ( not ( = ?auto_8962 ?auto_8980 ) ) ( not ( = ?auto_8962 ?auto_8977 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8951 ?auto_8952 ?auto_8953 ?auto_8954 ?auto_8957 ?auto_8956 ?auto_8955 )
      ( MAKE-1CRATE ?auto_8955 ?auto_8958 )
      ( MAKE-10CRATE-VERIFY ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8951 ?auto_8952 ?auto_8953 ?auto_8954 ?auto_8957 ?auto_8956 ?auto_8955 ?auto_8958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8984 - SURFACE
      ?auto_8985 - SURFACE
    )
    :vars
    (
      ?auto_8986 - HOIST
      ?auto_8987 - PLACE
      ?auto_8989 - PLACE
      ?auto_8990 - HOIST
      ?auto_8991 - SURFACE
      ?auto_8988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8986 ?auto_8987 ) ( SURFACE-AT ?auto_8984 ?auto_8987 ) ( CLEAR ?auto_8984 ) ( IS-CRATE ?auto_8985 ) ( AVAILABLE ?auto_8986 ) ( not ( = ?auto_8989 ?auto_8987 ) ) ( HOIST-AT ?auto_8990 ?auto_8989 ) ( AVAILABLE ?auto_8990 ) ( SURFACE-AT ?auto_8985 ?auto_8989 ) ( ON ?auto_8985 ?auto_8991 ) ( CLEAR ?auto_8985 ) ( TRUCK-AT ?auto_8988 ?auto_8987 ) ( not ( = ?auto_8984 ?auto_8985 ) ) ( not ( = ?auto_8984 ?auto_8991 ) ) ( not ( = ?auto_8985 ?auto_8991 ) ) ( not ( = ?auto_8986 ?auto_8990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8988 ?auto_8987 ?auto_8989 )
      ( !LIFT ?auto_8990 ?auto_8985 ?auto_8991 ?auto_8989 )
      ( !LOAD ?auto_8990 ?auto_8985 ?auto_8988 ?auto_8989 )
      ( !DRIVE ?auto_8988 ?auto_8989 ?auto_8987 )
      ( !UNLOAD ?auto_8986 ?auto_8985 ?auto_8988 ?auto_8987 )
      ( !DROP ?auto_8986 ?auto_8985 ?auto_8984 ?auto_8987 )
      ( MAKE-1CRATE-VERIFY ?auto_8984 ?auto_8985 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9004 - SURFACE
      ?auto_9005 - SURFACE
      ?auto_9006 - SURFACE
      ?auto_9007 - SURFACE
      ?auto_9008 - SURFACE
      ?auto_9009 - SURFACE
      ?auto_9010 - SURFACE
      ?auto_9013 - SURFACE
      ?auto_9012 - SURFACE
      ?auto_9011 - SURFACE
      ?auto_9014 - SURFACE
      ?auto_9015 - SURFACE
    )
    :vars
    (
      ?auto_9020 - HOIST
      ?auto_9019 - PLACE
      ?auto_9018 - PLACE
      ?auto_9017 - HOIST
      ?auto_9021 - SURFACE
      ?auto_9031 - PLACE
      ?auto_9026 - HOIST
      ?auto_9041 - SURFACE
      ?auto_9036 - PLACE
      ?auto_9033 - HOIST
      ?auto_9024 - SURFACE
      ?auto_9030 - PLACE
      ?auto_9022 - HOIST
      ?auto_9032 - SURFACE
      ?auto_9023 - PLACE
      ?auto_9035 - HOIST
      ?auto_9034 - SURFACE
      ?auto_9028 - SURFACE
      ?auto_9039 - SURFACE
      ?auto_9037 - SURFACE
      ?auto_9040 - PLACE
      ?auto_9027 - HOIST
      ?auto_9038 - SURFACE
      ?auto_9025 - SURFACE
      ?auto_9029 - SURFACE
      ?auto_9016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9020 ?auto_9019 ) ( IS-CRATE ?auto_9015 ) ( not ( = ?auto_9018 ?auto_9019 ) ) ( HOIST-AT ?auto_9017 ?auto_9018 ) ( AVAILABLE ?auto_9017 ) ( SURFACE-AT ?auto_9015 ?auto_9018 ) ( ON ?auto_9015 ?auto_9021 ) ( CLEAR ?auto_9015 ) ( not ( = ?auto_9014 ?auto_9015 ) ) ( not ( = ?auto_9014 ?auto_9021 ) ) ( not ( = ?auto_9015 ?auto_9021 ) ) ( not ( = ?auto_9020 ?auto_9017 ) ) ( IS-CRATE ?auto_9014 ) ( not ( = ?auto_9031 ?auto_9019 ) ) ( HOIST-AT ?auto_9026 ?auto_9031 ) ( SURFACE-AT ?auto_9014 ?auto_9031 ) ( ON ?auto_9014 ?auto_9041 ) ( CLEAR ?auto_9014 ) ( not ( = ?auto_9011 ?auto_9014 ) ) ( not ( = ?auto_9011 ?auto_9041 ) ) ( not ( = ?auto_9014 ?auto_9041 ) ) ( not ( = ?auto_9020 ?auto_9026 ) ) ( IS-CRATE ?auto_9011 ) ( not ( = ?auto_9036 ?auto_9019 ) ) ( HOIST-AT ?auto_9033 ?auto_9036 ) ( SURFACE-AT ?auto_9011 ?auto_9036 ) ( ON ?auto_9011 ?auto_9024 ) ( CLEAR ?auto_9011 ) ( not ( = ?auto_9012 ?auto_9011 ) ) ( not ( = ?auto_9012 ?auto_9024 ) ) ( not ( = ?auto_9011 ?auto_9024 ) ) ( not ( = ?auto_9020 ?auto_9033 ) ) ( IS-CRATE ?auto_9012 ) ( not ( = ?auto_9030 ?auto_9019 ) ) ( HOIST-AT ?auto_9022 ?auto_9030 ) ( AVAILABLE ?auto_9022 ) ( SURFACE-AT ?auto_9012 ?auto_9030 ) ( ON ?auto_9012 ?auto_9032 ) ( CLEAR ?auto_9012 ) ( not ( = ?auto_9013 ?auto_9012 ) ) ( not ( = ?auto_9013 ?auto_9032 ) ) ( not ( = ?auto_9012 ?auto_9032 ) ) ( not ( = ?auto_9020 ?auto_9022 ) ) ( IS-CRATE ?auto_9013 ) ( not ( = ?auto_9023 ?auto_9019 ) ) ( HOIST-AT ?auto_9035 ?auto_9023 ) ( SURFACE-AT ?auto_9013 ?auto_9023 ) ( ON ?auto_9013 ?auto_9034 ) ( CLEAR ?auto_9013 ) ( not ( = ?auto_9010 ?auto_9013 ) ) ( not ( = ?auto_9010 ?auto_9034 ) ) ( not ( = ?auto_9013 ?auto_9034 ) ) ( not ( = ?auto_9020 ?auto_9035 ) ) ( IS-CRATE ?auto_9010 ) ( SURFACE-AT ?auto_9010 ?auto_9031 ) ( ON ?auto_9010 ?auto_9028 ) ( CLEAR ?auto_9010 ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( not ( = ?auto_9009 ?auto_9028 ) ) ( not ( = ?auto_9010 ?auto_9028 ) ) ( IS-CRATE ?auto_9009 ) ( SURFACE-AT ?auto_9009 ?auto_9031 ) ( ON ?auto_9009 ?auto_9039 ) ( CLEAR ?auto_9009 ) ( not ( = ?auto_9008 ?auto_9009 ) ) ( not ( = ?auto_9008 ?auto_9039 ) ) ( not ( = ?auto_9009 ?auto_9039 ) ) ( IS-CRATE ?auto_9008 ) ( AVAILABLE ?auto_9026 ) ( SURFACE-AT ?auto_9008 ?auto_9031 ) ( ON ?auto_9008 ?auto_9037 ) ( CLEAR ?auto_9008 ) ( not ( = ?auto_9007 ?auto_9008 ) ) ( not ( = ?auto_9007 ?auto_9037 ) ) ( not ( = ?auto_9008 ?auto_9037 ) ) ( IS-CRATE ?auto_9007 ) ( not ( = ?auto_9040 ?auto_9019 ) ) ( HOIST-AT ?auto_9027 ?auto_9040 ) ( AVAILABLE ?auto_9027 ) ( SURFACE-AT ?auto_9007 ?auto_9040 ) ( ON ?auto_9007 ?auto_9038 ) ( CLEAR ?auto_9007 ) ( not ( = ?auto_9006 ?auto_9007 ) ) ( not ( = ?auto_9006 ?auto_9038 ) ) ( not ( = ?auto_9007 ?auto_9038 ) ) ( not ( = ?auto_9020 ?auto_9027 ) ) ( IS-CRATE ?auto_9006 ) ( AVAILABLE ?auto_9035 ) ( SURFACE-AT ?auto_9006 ?auto_9023 ) ( ON ?auto_9006 ?auto_9025 ) ( CLEAR ?auto_9006 ) ( not ( = ?auto_9005 ?auto_9006 ) ) ( not ( = ?auto_9005 ?auto_9025 ) ) ( not ( = ?auto_9006 ?auto_9025 ) ) ( SURFACE-AT ?auto_9004 ?auto_9019 ) ( CLEAR ?auto_9004 ) ( IS-CRATE ?auto_9005 ) ( AVAILABLE ?auto_9020 ) ( AVAILABLE ?auto_9033 ) ( SURFACE-AT ?auto_9005 ?auto_9036 ) ( ON ?auto_9005 ?auto_9029 ) ( CLEAR ?auto_9005 ) ( TRUCK-AT ?auto_9016 ?auto_9019 ) ( not ( = ?auto_9004 ?auto_9005 ) ) ( not ( = ?auto_9004 ?auto_9029 ) ) ( not ( = ?auto_9005 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9006 ) ) ( not ( = ?auto_9004 ?auto_9025 ) ) ( not ( = ?auto_9006 ?auto_9029 ) ) ( not ( = ?auto_9023 ?auto_9036 ) ) ( not ( = ?auto_9035 ?auto_9033 ) ) ( not ( = ?auto_9025 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9007 ) ) ( not ( = ?auto_9004 ?auto_9038 ) ) ( not ( = ?auto_9005 ?auto_9007 ) ) ( not ( = ?auto_9005 ?auto_9038 ) ) ( not ( = ?auto_9007 ?auto_9025 ) ) ( not ( = ?auto_9007 ?auto_9029 ) ) ( not ( = ?auto_9040 ?auto_9023 ) ) ( not ( = ?auto_9040 ?auto_9036 ) ) ( not ( = ?auto_9027 ?auto_9035 ) ) ( not ( = ?auto_9027 ?auto_9033 ) ) ( not ( = ?auto_9038 ?auto_9025 ) ) ( not ( = ?auto_9038 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9008 ) ) ( not ( = ?auto_9004 ?auto_9037 ) ) ( not ( = ?auto_9005 ?auto_9008 ) ) ( not ( = ?auto_9005 ?auto_9037 ) ) ( not ( = ?auto_9006 ?auto_9008 ) ) ( not ( = ?auto_9006 ?auto_9037 ) ) ( not ( = ?auto_9008 ?auto_9038 ) ) ( not ( = ?auto_9008 ?auto_9025 ) ) ( not ( = ?auto_9008 ?auto_9029 ) ) ( not ( = ?auto_9031 ?auto_9040 ) ) ( not ( = ?auto_9031 ?auto_9023 ) ) ( not ( = ?auto_9031 ?auto_9036 ) ) ( not ( = ?auto_9026 ?auto_9027 ) ) ( not ( = ?auto_9026 ?auto_9035 ) ) ( not ( = ?auto_9026 ?auto_9033 ) ) ( not ( = ?auto_9037 ?auto_9038 ) ) ( not ( = ?auto_9037 ?auto_9025 ) ) ( not ( = ?auto_9037 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9009 ) ) ( not ( = ?auto_9004 ?auto_9039 ) ) ( not ( = ?auto_9005 ?auto_9009 ) ) ( not ( = ?auto_9005 ?auto_9039 ) ) ( not ( = ?auto_9006 ?auto_9009 ) ) ( not ( = ?auto_9006 ?auto_9039 ) ) ( not ( = ?auto_9007 ?auto_9009 ) ) ( not ( = ?auto_9007 ?auto_9039 ) ) ( not ( = ?auto_9009 ?auto_9037 ) ) ( not ( = ?auto_9009 ?auto_9038 ) ) ( not ( = ?auto_9009 ?auto_9025 ) ) ( not ( = ?auto_9009 ?auto_9029 ) ) ( not ( = ?auto_9039 ?auto_9037 ) ) ( not ( = ?auto_9039 ?auto_9038 ) ) ( not ( = ?auto_9039 ?auto_9025 ) ) ( not ( = ?auto_9039 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9010 ) ) ( not ( = ?auto_9004 ?auto_9028 ) ) ( not ( = ?auto_9005 ?auto_9010 ) ) ( not ( = ?auto_9005 ?auto_9028 ) ) ( not ( = ?auto_9006 ?auto_9010 ) ) ( not ( = ?auto_9006 ?auto_9028 ) ) ( not ( = ?auto_9007 ?auto_9010 ) ) ( not ( = ?auto_9007 ?auto_9028 ) ) ( not ( = ?auto_9008 ?auto_9010 ) ) ( not ( = ?auto_9008 ?auto_9028 ) ) ( not ( = ?auto_9010 ?auto_9039 ) ) ( not ( = ?auto_9010 ?auto_9037 ) ) ( not ( = ?auto_9010 ?auto_9038 ) ) ( not ( = ?auto_9010 ?auto_9025 ) ) ( not ( = ?auto_9010 ?auto_9029 ) ) ( not ( = ?auto_9028 ?auto_9039 ) ) ( not ( = ?auto_9028 ?auto_9037 ) ) ( not ( = ?auto_9028 ?auto_9038 ) ) ( not ( = ?auto_9028 ?auto_9025 ) ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9013 ) ) ( not ( = ?auto_9004 ?auto_9034 ) ) ( not ( = ?auto_9005 ?auto_9013 ) ) ( not ( = ?auto_9005 ?auto_9034 ) ) ( not ( = ?auto_9006 ?auto_9013 ) ) ( not ( = ?auto_9006 ?auto_9034 ) ) ( not ( = ?auto_9007 ?auto_9013 ) ) ( not ( = ?auto_9007 ?auto_9034 ) ) ( not ( = ?auto_9008 ?auto_9013 ) ) ( not ( = ?auto_9008 ?auto_9034 ) ) ( not ( = ?auto_9009 ?auto_9013 ) ) ( not ( = ?auto_9009 ?auto_9034 ) ) ( not ( = ?auto_9013 ?auto_9028 ) ) ( not ( = ?auto_9013 ?auto_9039 ) ) ( not ( = ?auto_9013 ?auto_9037 ) ) ( not ( = ?auto_9013 ?auto_9038 ) ) ( not ( = ?auto_9013 ?auto_9025 ) ) ( not ( = ?auto_9013 ?auto_9029 ) ) ( not ( = ?auto_9034 ?auto_9028 ) ) ( not ( = ?auto_9034 ?auto_9039 ) ) ( not ( = ?auto_9034 ?auto_9037 ) ) ( not ( = ?auto_9034 ?auto_9038 ) ) ( not ( = ?auto_9034 ?auto_9025 ) ) ( not ( = ?auto_9034 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9012 ) ) ( not ( = ?auto_9004 ?auto_9032 ) ) ( not ( = ?auto_9005 ?auto_9012 ) ) ( not ( = ?auto_9005 ?auto_9032 ) ) ( not ( = ?auto_9006 ?auto_9012 ) ) ( not ( = ?auto_9006 ?auto_9032 ) ) ( not ( = ?auto_9007 ?auto_9012 ) ) ( not ( = ?auto_9007 ?auto_9032 ) ) ( not ( = ?auto_9008 ?auto_9012 ) ) ( not ( = ?auto_9008 ?auto_9032 ) ) ( not ( = ?auto_9009 ?auto_9012 ) ) ( not ( = ?auto_9009 ?auto_9032 ) ) ( not ( = ?auto_9010 ?auto_9012 ) ) ( not ( = ?auto_9010 ?auto_9032 ) ) ( not ( = ?auto_9012 ?auto_9034 ) ) ( not ( = ?auto_9012 ?auto_9028 ) ) ( not ( = ?auto_9012 ?auto_9039 ) ) ( not ( = ?auto_9012 ?auto_9037 ) ) ( not ( = ?auto_9012 ?auto_9038 ) ) ( not ( = ?auto_9012 ?auto_9025 ) ) ( not ( = ?auto_9012 ?auto_9029 ) ) ( not ( = ?auto_9030 ?auto_9023 ) ) ( not ( = ?auto_9030 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9040 ) ) ( not ( = ?auto_9030 ?auto_9036 ) ) ( not ( = ?auto_9022 ?auto_9035 ) ) ( not ( = ?auto_9022 ?auto_9026 ) ) ( not ( = ?auto_9022 ?auto_9027 ) ) ( not ( = ?auto_9022 ?auto_9033 ) ) ( not ( = ?auto_9032 ?auto_9034 ) ) ( not ( = ?auto_9032 ?auto_9028 ) ) ( not ( = ?auto_9032 ?auto_9039 ) ) ( not ( = ?auto_9032 ?auto_9037 ) ) ( not ( = ?auto_9032 ?auto_9038 ) ) ( not ( = ?auto_9032 ?auto_9025 ) ) ( not ( = ?auto_9032 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9011 ) ) ( not ( = ?auto_9004 ?auto_9024 ) ) ( not ( = ?auto_9005 ?auto_9011 ) ) ( not ( = ?auto_9005 ?auto_9024 ) ) ( not ( = ?auto_9006 ?auto_9011 ) ) ( not ( = ?auto_9006 ?auto_9024 ) ) ( not ( = ?auto_9007 ?auto_9011 ) ) ( not ( = ?auto_9007 ?auto_9024 ) ) ( not ( = ?auto_9008 ?auto_9011 ) ) ( not ( = ?auto_9008 ?auto_9024 ) ) ( not ( = ?auto_9009 ?auto_9011 ) ) ( not ( = ?auto_9009 ?auto_9024 ) ) ( not ( = ?auto_9010 ?auto_9011 ) ) ( not ( = ?auto_9010 ?auto_9024 ) ) ( not ( = ?auto_9013 ?auto_9011 ) ) ( not ( = ?auto_9013 ?auto_9024 ) ) ( not ( = ?auto_9011 ?auto_9032 ) ) ( not ( = ?auto_9011 ?auto_9034 ) ) ( not ( = ?auto_9011 ?auto_9028 ) ) ( not ( = ?auto_9011 ?auto_9039 ) ) ( not ( = ?auto_9011 ?auto_9037 ) ) ( not ( = ?auto_9011 ?auto_9038 ) ) ( not ( = ?auto_9011 ?auto_9025 ) ) ( not ( = ?auto_9011 ?auto_9029 ) ) ( not ( = ?auto_9024 ?auto_9032 ) ) ( not ( = ?auto_9024 ?auto_9034 ) ) ( not ( = ?auto_9024 ?auto_9028 ) ) ( not ( = ?auto_9024 ?auto_9039 ) ) ( not ( = ?auto_9024 ?auto_9037 ) ) ( not ( = ?auto_9024 ?auto_9038 ) ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9024 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9014 ) ) ( not ( = ?auto_9004 ?auto_9041 ) ) ( not ( = ?auto_9005 ?auto_9014 ) ) ( not ( = ?auto_9005 ?auto_9041 ) ) ( not ( = ?auto_9006 ?auto_9014 ) ) ( not ( = ?auto_9006 ?auto_9041 ) ) ( not ( = ?auto_9007 ?auto_9014 ) ) ( not ( = ?auto_9007 ?auto_9041 ) ) ( not ( = ?auto_9008 ?auto_9014 ) ) ( not ( = ?auto_9008 ?auto_9041 ) ) ( not ( = ?auto_9009 ?auto_9014 ) ) ( not ( = ?auto_9009 ?auto_9041 ) ) ( not ( = ?auto_9010 ?auto_9014 ) ) ( not ( = ?auto_9010 ?auto_9041 ) ) ( not ( = ?auto_9013 ?auto_9014 ) ) ( not ( = ?auto_9013 ?auto_9041 ) ) ( not ( = ?auto_9012 ?auto_9014 ) ) ( not ( = ?auto_9012 ?auto_9041 ) ) ( not ( = ?auto_9014 ?auto_9024 ) ) ( not ( = ?auto_9014 ?auto_9032 ) ) ( not ( = ?auto_9014 ?auto_9034 ) ) ( not ( = ?auto_9014 ?auto_9028 ) ) ( not ( = ?auto_9014 ?auto_9039 ) ) ( not ( = ?auto_9014 ?auto_9037 ) ) ( not ( = ?auto_9014 ?auto_9038 ) ) ( not ( = ?auto_9014 ?auto_9025 ) ) ( not ( = ?auto_9014 ?auto_9029 ) ) ( not ( = ?auto_9041 ?auto_9024 ) ) ( not ( = ?auto_9041 ?auto_9032 ) ) ( not ( = ?auto_9041 ?auto_9034 ) ) ( not ( = ?auto_9041 ?auto_9028 ) ) ( not ( = ?auto_9041 ?auto_9039 ) ) ( not ( = ?auto_9041 ?auto_9037 ) ) ( not ( = ?auto_9041 ?auto_9038 ) ) ( not ( = ?auto_9041 ?auto_9025 ) ) ( not ( = ?auto_9041 ?auto_9029 ) ) ( not ( = ?auto_9004 ?auto_9015 ) ) ( not ( = ?auto_9004 ?auto_9021 ) ) ( not ( = ?auto_9005 ?auto_9015 ) ) ( not ( = ?auto_9005 ?auto_9021 ) ) ( not ( = ?auto_9006 ?auto_9015 ) ) ( not ( = ?auto_9006 ?auto_9021 ) ) ( not ( = ?auto_9007 ?auto_9015 ) ) ( not ( = ?auto_9007 ?auto_9021 ) ) ( not ( = ?auto_9008 ?auto_9015 ) ) ( not ( = ?auto_9008 ?auto_9021 ) ) ( not ( = ?auto_9009 ?auto_9015 ) ) ( not ( = ?auto_9009 ?auto_9021 ) ) ( not ( = ?auto_9010 ?auto_9015 ) ) ( not ( = ?auto_9010 ?auto_9021 ) ) ( not ( = ?auto_9013 ?auto_9015 ) ) ( not ( = ?auto_9013 ?auto_9021 ) ) ( not ( = ?auto_9012 ?auto_9015 ) ) ( not ( = ?auto_9012 ?auto_9021 ) ) ( not ( = ?auto_9011 ?auto_9015 ) ) ( not ( = ?auto_9011 ?auto_9021 ) ) ( not ( = ?auto_9015 ?auto_9041 ) ) ( not ( = ?auto_9015 ?auto_9024 ) ) ( not ( = ?auto_9015 ?auto_9032 ) ) ( not ( = ?auto_9015 ?auto_9034 ) ) ( not ( = ?auto_9015 ?auto_9028 ) ) ( not ( = ?auto_9015 ?auto_9039 ) ) ( not ( = ?auto_9015 ?auto_9037 ) ) ( not ( = ?auto_9015 ?auto_9038 ) ) ( not ( = ?auto_9015 ?auto_9025 ) ) ( not ( = ?auto_9015 ?auto_9029 ) ) ( not ( = ?auto_9018 ?auto_9031 ) ) ( not ( = ?auto_9018 ?auto_9036 ) ) ( not ( = ?auto_9018 ?auto_9030 ) ) ( not ( = ?auto_9018 ?auto_9023 ) ) ( not ( = ?auto_9018 ?auto_9040 ) ) ( not ( = ?auto_9017 ?auto_9026 ) ) ( not ( = ?auto_9017 ?auto_9033 ) ) ( not ( = ?auto_9017 ?auto_9022 ) ) ( not ( = ?auto_9017 ?auto_9035 ) ) ( not ( = ?auto_9017 ?auto_9027 ) ) ( not ( = ?auto_9021 ?auto_9041 ) ) ( not ( = ?auto_9021 ?auto_9024 ) ) ( not ( = ?auto_9021 ?auto_9032 ) ) ( not ( = ?auto_9021 ?auto_9034 ) ) ( not ( = ?auto_9021 ?auto_9028 ) ) ( not ( = ?auto_9021 ?auto_9039 ) ) ( not ( = ?auto_9021 ?auto_9037 ) ) ( not ( = ?auto_9021 ?auto_9038 ) ) ( not ( = ?auto_9021 ?auto_9025 ) ) ( not ( = ?auto_9021 ?auto_9029 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9004 ?auto_9005 ?auto_9006 ?auto_9007 ?auto_9008 ?auto_9009 ?auto_9010 ?auto_9013 ?auto_9012 ?auto_9011 ?auto_9014 )
      ( MAKE-1CRATE ?auto_9014 ?auto_9015 )
      ( MAKE-11CRATE-VERIFY ?auto_9004 ?auto_9005 ?auto_9006 ?auto_9007 ?auto_9008 ?auto_9009 ?auto_9010 ?auto_9013 ?auto_9012 ?auto_9011 ?auto_9014 ?auto_9015 ) )
  )

)

