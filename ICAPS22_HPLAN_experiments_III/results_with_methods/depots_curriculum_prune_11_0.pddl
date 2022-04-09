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
      ?auto_8563 - SURFACE
      ?auto_8564 - SURFACE
    )
    :vars
    (
      ?auto_8565 - HOIST
      ?auto_8566 - PLACE
      ?auto_8568 - PLACE
      ?auto_8569 - HOIST
      ?auto_8570 - SURFACE
      ?auto_8567 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8565 ?auto_8566 ) ( SURFACE-AT ?auto_8563 ?auto_8566 ) ( CLEAR ?auto_8563 ) ( IS-CRATE ?auto_8564 ) ( AVAILABLE ?auto_8565 ) ( not ( = ?auto_8568 ?auto_8566 ) ) ( HOIST-AT ?auto_8569 ?auto_8568 ) ( AVAILABLE ?auto_8569 ) ( SURFACE-AT ?auto_8564 ?auto_8568 ) ( ON ?auto_8564 ?auto_8570 ) ( CLEAR ?auto_8564 ) ( TRUCK-AT ?auto_8567 ?auto_8566 ) ( not ( = ?auto_8563 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8570 ) ) ( not ( = ?auto_8564 ?auto_8570 ) ) ( not ( = ?auto_8565 ?auto_8569 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8567 ?auto_8566 ?auto_8568 )
      ( !LIFT ?auto_8569 ?auto_8564 ?auto_8570 ?auto_8568 )
      ( !LOAD ?auto_8569 ?auto_8564 ?auto_8567 ?auto_8568 )
      ( !DRIVE ?auto_8567 ?auto_8568 ?auto_8566 )
      ( !UNLOAD ?auto_8565 ?auto_8564 ?auto_8567 ?auto_8566 )
      ( !DROP ?auto_8565 ?auto_8564 ?auto_8563 ?auto_8566 )
      ( MAKE-1CRATE-VERIFY ?auto_8563 ?auto_8564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8584 - SURFACE
      ?auto_8585 - SURFACE
      ?auto_8586 - SURFACE
    )
    :vars
    (
      ?auto_8589 - HOIST
      ?auto_8588 - PLACE
      ?auto_8591 - PLACE
      ?auto_8590 - HOIST
      ?auto_8592 - SURFACE
      ?auto_8594 - PLACE
      ?auto_8593 - HOIST
      ?auto_8595 - SURFACE
      ?auto_8587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8589 ?auto_8588 ) ( IS-CRATE ?auto_8586 ) ( not ( = ?auto_8591 ?auto_8588 ) ) ( HOIST-AT ?auto_8590 ?auto_8591 ) ( AVAILABLE ?auto_8590 ) ( SURFACE-AT ?auto_8586 ?auto_8591 ) ( ON ?auto_8586 ?auto_8592 ) ( CLEAR ?auto_8586 ) ( not ( = ?auto_8585 ?auto_8586 ) ) ( not ( = ?auto_8585 ?auto_8592 ) ) ( not ( = ?auto_8586 ?auto_8592 ) ) ( not ( = ?auto_8589 ?auto_8590 ) ) ( SURFACE-AT ?auto_8584 ?auto_8588 ) ( CLEAR ?auto_8584 ) ( IS-CRATE ?auto_8585 ) ( AVAILABLE ?auto_8589 ) ( not ( = ?auto_8594 ?auto_8588 ) ) ( HOIST-AT ?auto_8593 ?auto_8594 ) ( AVAILABLE ?auto_8593 ) ( SURFACE-AT ?auto_8585 ?auto_8594 ) ( ON ?auto_8585 ?auto_8595 ) ( CLEAR ?auto_8585 ) ( TRUCK-AT ?auto_8587 ?auto_8588 ) ( not ( = ?auto_8584 ?auto_8585 ) ) ( not ( = ?auto_8584 ?auto_8595 ) ) ( not ( = ?auto_8585 ?auto_8595 ) ) ( not ( = ?auto_8589 ?auto_8593 ) ) ( not ( = ?auto_8584 ?auto_8586 ) ) ( not ( = ?auto_8584 ?auto_8592 ) ) ( not ( = ?auto_8586 ?auto_8595 ) ) ( not ( = ?auto_8591 ?auto_8594 ) ) ( not ( = ?auto_8590 ?auto_8593 ) ) ( not ( = ?auto_8592 ?auto_8595 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8584 ?auto_8585 )
      ( MAKE-1CRATE ?auto_8585 ?auto_8586 )
      ( MAKE-2CRATE-VERIFY ?auto_8584 ?auto_8585 ?auto_8586 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8610 - SURFACE
      ?auto_8611 - SURFACE
      ?auto_8612 - SURFACE
      ?auto_8613 - SURFACE
    )
    :vars
    (
      ?auto_8616 - HOIST
      ?auto_8618 - PLACE
      ?auto_8617 - PLACE
      ?auto_8614 - HOIST
      ?auto_8615 - SURFACE
      ?auto_8620 - PLACE
      ?auto_8622 - HOIST
      ?auto_8623 - SURFACE
      ?auto_8624 - PLACE
      ?auto_8621 - HOIST
      ?auto_8625 - SURFACE
      ?auto_8619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8616 ?auto_8618 ) ( IS-CRATE ?auto_8613 ) ( not ( = ?auto_8617 ?auto_8618 ) ) ( HOIST-AT ?auto_8614 ?auto_8617 ) ( AVAILABLE ?auto_8614 ) ( SURFACE-AT ?auto_8613 ?auto_8617 ) ( ON ?auto_8613 ?auto_8615 ) ( CLEAR ?auto_8613 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8615 ) ) ( not ( = ?auto_8613 ?auto_8615 ) ) ( not ( = ?auto_8616 ?auto_8614 ) ) ( IS-CRATE ?auto_8612 ) ( not ( = ?auto_8620 ?auto_8618 ) ) ( HOIST-AT ?auto_8622 ?auto_8620 ) ( AVAILABLE ?auto_8622 ) ( SURFACE-AT ?auto_8612 ?auto_8620 ) ( ON ?auto_8612 ?auto_8623 ) ( CLEAR ?auto_8612 ) ( not ( = ?auto_8611 ?auto_8612 ) ) ( not ( = ?auto_8611 ?auto_8623 ) ) ( not ( = ?auto_8612 ?auto_8623 ) ) ( not ( = ?auto_8616 ?auto_8622 ) ) ( SURFACE-AT ?auto_8610 ?auto_8618 ) ( CLEAR ?auto_8610 ) ( IS-CRATE ?auto_8611 ) ( AVAILABLE ?auto_8616 ) ( not ( = ?auto_8624 ?auto_8618 ) ) ( HOIST-AT ?auto_8621 ?auto_8624 ) ( AVAILABLE ?auto_8621 ) ( SURFACE-AT ?auto_8611 ?auto_8624 ) ( ON ?auto_8611 ?auto_8625 ) ( CLEAR ?auto_8611 ) ( TRUCK-AT ?auto_8619 ?auto_8618 ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8625 ) ) ( not ( = ?auto_8611 ?auto_8625 ) ) ( not ( = ?auto_8616 ?auto_8621 ) ) ( not ( = ?auto_8610 ?auto_8612 ) ) ( not ( = ?auto_8610 ?auto_8623 ) ) ( not ( = ?auto_8612 ?auto_8625 ) ) ( not ( = ?auto_8620 ?auto_8624 ) ) ( not ( = ?auto_8622 ?auto_8621 ) ) ( not ( = ?auto_8623 ?auto_8625 ) ) ( not ( = ?auto_8610 ?auto_8613 ) ) ( not ( = ?auto_8610 ?auto_8615 ) ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8611 ?auto_8615 ) ) ( not ( = ?auto_8613 ?auto_8623 ) ) ( not ( = ?auto_8613 ?auto_8625 ) ) ( not ( = ?auto_8617 ?auto_8620 ) ) ( not ( = ?auto_8617 ?auto_8624 ) ) ( not ( = ?auto_8614 ?auto_8622 ) ) ( not ( = ?auto_8614 ?auto_8621 ) ) ( not ( = ?auto_8615 ?auto_8623 ) ) ( not ( = ?auto_8615 ?auto_8625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8610 ?auto_8611 ?auto_8612 )
      ( MAKE-1CRATE ?auto_8612 ?auto_8613 )
      ( MAKE-3CRATE-VERIFY ?auto_8610 ?auto_8611 ?auto_8612 ?auto_8613 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8641 - SURFACE
      ?auto_8642 - SURFACE
      ?auto_8643 - SURFACE
      ?auto_8644 - SURFACE
      ?auto_8645 - SURFACE
    )
    :vars
    (
      ?auto_8647 - HOIST
      ?auto_8651 - PLACE
      ?auto_8650 - PLACE
      ?auto_8646 - HOIST
      ?auto_8648 - SURFACE
      ?auto_8652 - PLACE
      ?auto_8653 - HOIST
      ?auto_8654 - SURFACE
      ?auto_8655 - PLACE
      ?auto_8658 - HOIST
      ?auto_8660 - SURFACE
      ?auto_8659 - PLACE
      ?auto_8656 - HOIST
      ?auto_8657 - SURFACE
      ?auto_8649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8647 ?auto_8651 ) ( IS-CRATE ?auto_8645 ) ( not ( = ?auto_8650 ?auto_8651 ) ) ( HOIST-AT ?auto_8646 ?auto_8650 ) ( AVAILABLE ?auto_8646 ) ( SURFACE-AT ?auto_8645 ?auto_8650 ) ( ON ?auto_8645 ?auto_8648 ) ( CLEAR ?auto_8645 ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8648 ) ) ( not ( = ?auto_8645 ?auto_8648 ) ) ( not ( = ?auto_8647 ?auto_8646 ) ) ( IS-CRATE ?auto_8644 ) ( not ( = ?auto_8652 ?auto_8651 ) ) ( HOIST-AT ?auto_8653 ?auto_8652 ) ( AVAILABLE ?auto_8653 ) ( SURFACE-AT ?auto_8644 ?auto_8652 ) ( ON ?auto_8644 ?auto_8654 ) ( CLEAR ?auto_8644 ) ( not ( = ?auto_8643 ?auto_8644 ) ) ( not ( = ?auto_8643 ?auto_8654 ) ) ( not ( = ?auto_8644 ?auto_8654 ) ) ( not ( = ?auto_8647 ?auto_8653 ) ) ( IS-CRATE ?auto_8643 ) ( not ( = ?auto_8655 ?auto_8651 ) ) ( HOIST-AT ?auto_8658 ?auto_8655 ) ( AVAILABLE ?auto_8658 ) ( SURFACE-AT ?auto_8643 ?auto_8655 ) ( ON ?auto_8643 ?auto_8660 ) ( CLEAR ?auto_8643 ) ( not ( = ?auto_8642 ?auto_8643 ) ) ( not ( = ?auto_8642 ?auto_8660 ) ) ( not ( = ?auto_8643 ?auto_8660 ) ) ( not ( = ?auto_8647 ?auto_8658 ) ) ( SURFACE-AT ?auto_8641 ?auto_8651 ) ( CLEAR ?auto_8641 ) ( IS-CRATE ?auto_8642 ) ( AVAILABLE ?auto_8647 ) ( not ( = ?auto_8659 ?auto_8651 ) ) ( HOIST-AT ?auto_8656 ?auto_8659 ) ( AVAILABLE ?auto_8656 ) ( SURFACE-AT ?auto_8642 ?auto_8659 ) ( ON ?auto_8642 ?auto_8657 ) ( CLEAR ?auto_8642 ) ( TRUCK-AT ?auto_8649 ?auto_8651 ) ( not ( = ?auto_8641 ?auto_8642 ) ) ( not ( = ?auto_8641 ?auto_8657 ) ) ( not ( = ?auto_8642 ?auto_8657 ) ) ( not ( = ?auto_8647 ?auto_8656 ) ) ( not ( = ?auto_8641 ?auto_8643 ) ) ( not ( = ?auto_8641 ?auto_8660 ) ) ( not ( = ?auto_8643 ?auto_8657 ) ) ( not ( = ?auto_8655 ?auto_8659 ) ) ( not ( = ?auto_8658 ?auto_8656 ) ) ( not ( = ?auto_8660 ?auto_8657 ) ) ( not ( = ?auto_8641 ?auto_8644 ) ) ( not ( = ?auto_8641 ?auto_8654 ) ) ( not ( = ?auto_8642 ?auto_8644 ) ) ( not ( = ?auto_8642 ?auto_8654 ) ) ( not ( = ?auto_8644 ?auto_8660 ) ) ( not ( = ?auto_8644 ?auto_8657 ) ) ( not ( = ?auto_8652 ?auto_8655 ) ) ( not ( = ?auto_8652 ?auto_8659 ) ) ( not ( = ?auto_8653 ?auto_8658 ) ) ( not ( = ?auto_8653 ?auto_8656 ) ) ( not ( = ?auto_8654 ?auto_8660 ) ) ( not ( = ?auto_8654 ?auto_8657 ) ) ( not ( = ?auto_8641 ?auto_8645 ) ) ( not ( = ?auto_8641 ?auto_8648 ) ) ( not ( = ?auto_8642 ?auto_8645 ) ) ( not ( = ?auto_8642 ?auto_8648 ) ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8643 ?auto_8648 ) ) ( not ( = ?auto_8645 ?auto_8654 ) ) ( not ( = ?auto_8645 ?auto_8660 ) ) ( not ( = ?auto_8645 ?auto_8657 ) ) ( not ( = ?auto_8650 ?auto_8652 ) ) ( not ( = ?auto_8650 ?auto_8655 ) ) ( not ( = ?auto_8650 ?auto_8659 ) ) ( not ( = ?auto_8646 ?auto_8653 ) ) ( not ( = ?auto_8646 ?auto_8658 ) ) ( not ( = ?auto_8646 ?auto_8656 ) ) ( not ( = ?auto_8648 ?auto_8654 ) ) ( not ( = ?auto_8648 ?auto_8660 ) ) ( not ( = ?auto_8648 ?auto_8657 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8641 ?auto_8642 ?auto_8643 ?auto_8644 )
      ( MAKE-1CRATE ?auto_8644 ?auto_8645 )
      ( MAKE-4CRATE-VERIFY ?auto_8641 ?auto_8642 ?auto_8643 ?auto_8644 ?auto_8645 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_8677 - SURFACE
      ?auto_8678 - SURFACE
      ?auto_8679 - SURFACE
      ?auto_8680 - SURFACE
      ?auto_8681 - SURFACE
      ?auto_8682 - SURFACE
    )
    :vars
    (
      ?auto_8687 - HOIST
      ?auto_8686 - PLACE
      ?auto_8684 - PLACE
      ?auto_8688 - HOIST
      ?auto_8683 - SURFACE
      ?auto_8697 - PLACE
      ?auto_8690 - HOIST
      ?auto_8699 - SURFACE
      ?auto_8694 - PLACE
      ?auto_8693 - HOIST
      ?auto_8695 - SURFACE
      ?auto_8692 - PLACE
      ?auto_8698 - HOIST
      ?auto_8696 - SURFACE
      ?auto_8689 - PLACE
      ?auto_8691 - HOIST
      ?auto_8700 - SURFACE
      ?auto_8685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8687 ?auto_8686 ) ( IS-CRATE ?auto_8682 ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( HOIST-AT ?auto_8688 ?auto_8684 ) ( AVAILABLE ?auto_8688 ) ( SURFACE-AT ?auto_8682 ?auto_8684 ) ( ON ?auto_8682 ?auto_8683 ) ( CLEAR ?auto_8682 ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8683 ) ) ( not ( = ?auto_8682 ?auto_8683 ) ) ( not ( = ?auto_8687 ?auto_8688 ) ) ( IS-CRATE ?auto_8681 ) ( not ( = ?auto_8697 ?auto_8686 ) ) ( HOIST-AT ?auto_8690 ?auto_8697 ) ( AVAILABLE ?auto_8690 ) ( SURFACE-AT ?auto_8681 ?auto_8697 ) ( ON ?auto_8681 ?auto_8699 ) ( CLEAR ?auto_8681 ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8699 ) ) ( not ( = ?auto_8681 ?auto_8699 ) ) ( not ( = ?auto_8687 ?auto_8690 ) ) ( IS-CRATE ?auto_8680 ) ( not ( = ?auto_8694 ?auto_8686 ) ) ( HOIST-AT ?auto_8693 ?auto_8694 ) ( AVAILABLE ?auto_8693 ) ( SURFACE-AT ?auto_8680 ?auto_8694 ) ( ON ?auto_8680 ?auto_8695 ) ( CLEAR ?auto_8680 ) ( not ( = ?auto_8679 ?auto_8680 ) ) ( not ( = ?auto_8679 ?auto_8695 ) ) ( not ( = ?auto_8680 ?auto_8695 ) ) ( not ( = ?auto_8687 ?auto_8693 ) ) ( IS-CRATE ?auto_8679 ) ( not ( = ?auto_8692 ?auto_8686 ) ) ( HOIST-AT ?auto_8698 ?auto_8692 ) ( AVAILABLE ?auto_8698 ) ( SURFACE-AT ?auto_8679 ?auto_8692 ) ( ON ?auto_8679 ?auto_8696 ) ( CLEAR ?auto_8679 ) ( not ( = ?auto_8678 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8696 ) ) ( not ( = ?auto_8679 ?auto_8696 ) ) ( not ( = ?auto_8687 ?auto_8698 ) ) ( SURFACE-AT ?auto_8677 ?auto_8686 ) ( CLEAR ?auto_8677 ) ( IS-CRATE ?auto_8678 ) ( AVAILABLE ?auto_8687 ) ( not ( = ?auto_8689 ?auto_8686 ) ) ( HOIST-AT ?auto_8691 ?auto_8689 ) ( AVAILABLE ?auto_8691 ) ( SURFACE-AT ?auto_8678 ?auto_8689 ) ( ON ?auto_8678 ?auto_8700 ) ( CLEAR ?auto_8678 ) ( TRUCK-AT ?auto_8685 ?auto_8686 ) ( not ( = ?auto_8677 ?auto_8678 ) ) ( not ( = ?auto_8677 ?auto_8700 ) ) ( not ( = ?auto_8678 ?auto_8700 ) ) ( not ( = ?auto_8687 ?auto_8691 ) ) ( not ( = ?auto_8677 ?auto_8679 ) ) ( not ( = ?auto_8677 ?auto_8696 ) ) ( not ( = ?auto_8679 ?auto_8700 ) ) ( not ( = ?auto_8692 ?auto_8689 ) ) ( not ( = ?auto_8698 ?auto_8691 ) ) ( not ( = ?auto_8696 ?auto_8700 ) ) ( not ( = ?auto_8677 ?auto_8680 ) ) ( not ( = ?auto_8677 ?auto_8695 ) ) ( not ( = ?auto_8678 ?auto_8680 ) ) ( not ( = ?auto_8678 ?auto_8695 ) ) ( not ( = ?auto_8680 ?auto_8696 ) ) ( not ( = ?auto_8680 ?auto_8700 ) ) ( not ( = ?auto_8694 ?auto_8692 ) ) ( not ( = ?auto_8694 ?auto_8689 ) ) ( not ( = ?auto_8693 ?auto_8698 ) ) ( not ( = ?auto_8693 ?auto_8691 ) ) ( not ( = ?auto_8695 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8700 ) ) ( not ( = ?auto_8677 ?auto_8681 ) ) ( not ( = ?auto_8677 ?auto_8699 ) ) ( not ( = ?auto_8678 ?auto_8681 ) ) ( not ( = ?auto_8678 ?auto_8699 ) ) ( not ( = ?auto_8679 ?auto_8681 ) ) ( not ( = ?auto_8679 ?auto_8699 ) ) ( not ( = ?auto_8681 ?auto_8695 ) ) ( not ( = ?auto_8681 ?auto_8696 ) ) ( not ( = ?auto_8681 ?auto_8700 ) ) ( not ( = ?auto_8697 ?auto_8694 ) ) ( not ( = ?auto_8697 ?auto_8692 ) ) ( not ( = ?auto_8697 ?auto_8689 ) ) ( not ( = ?auto_8690 ?auto_8693 ) ) ( not ( = ?auto_8690 ?auto_8698 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( not ( = ?auto_8699 ?auto_8695 ) ) ( not ( = ?auto_8699 ?auto_8696 ) ) ( not ( = ?auto_8699 ?auto_8700 ) ) ( not ( = ?auto_8677 ?auto_8682 ) ) ( not ( = ?auto_8677 ?auto_8683 ) ) ( not ( = ?auto_8678 ?auto_8682 ) ) ( not ( = ?auto_8678 ?auto_8683 ) ) ( not ( = ?auto_8679 ?auto_8682 ) ) ( not ( = ?auto_8679 ?auto_8683 ) ) ( not ( = ?auto_8680 ?auto_8682 ) ) ( not ( = ?auto_8680 ?auto_8683 ) ) ( not ( = ?auto_8682 ?auto_8699 ) ) ( not ( = ?auto_8682 ?auto_8695 ) ) ( not ( = ?auto_8682 ?auto_8696 ) ) ( not ( = ?auto_8682 ?auto_8700 ) ) ( not ( = ?auto_8684 ?auto_8697 ) ) ( not ( = ?auto_8684 ?auto_8694 ) ) ( not ( = ?auto_8684 ?auto_8692 ) ) ( not ( = ?auto_8684 ?auto_8689 ) ) ( not ( = ?auto_8688 ?auto_8690 ) ) ( not ( = ?auto_8688 ?auto_8693 ) ) ( not ( = ?auto_8688 ?auto_8698 ) ) ( not ( = ?auto_8688 ?auto_8691 ) ) ( not ( = ?auto_8683 ?auto_8699 ) ) ( not ( = ?auto_8683 ?auto_8695 ) ) ( not ( = ?auto_8683 ?auto_8696 ) ) ( not ( = ?auto_8683 ?auto_8700 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8677 ?auto_8678 ?auto_8679 ?auto_8680 ?auto_8681 )
      ( MAKE-1CRATE ?auto_8681 ?auto_8682 )
      ( MAKE-5CRATE-VERIFY ?auto_8677 ?auto_8678 ?auto_8679 ?auto_8680 ?auto_8681 ?auto_8682 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_8718 - SURFACE
      ?auto_8719 - SURFACE
      ?auto_8720 - SURFACE
      ?auto_8721 - SURFACE
      ?auto_8722 - SURFACE
      ?auto_8723 - SURFACE
      ?auto_8724 - SURFACE
    )
    :vars
    (
      ?auto_8730 - HOIST
      ?auto_8729 - PLACE
      ?auto_8725 - PLACE
      ?auto_8727 - HOIST
      ?auto_8726 - SURFACE
      ?auto_8731 - PLACE
      ?auto_8741 - HOIST
      ?auto_8743 - SURFACE
      ?auto_8733 - SURFACE
      ?auto_8736 - PLACE
      ?auto_8737 - HOIST
      ?auto_8738 - SURFACE
      ?auto_8735 - PLACE
      ?auto_8739 - HOIST
      ?auto_8742 - SURFACE
      ?auto_8734 - PLACE
      ?auto_8740 - HOIST
      ?auto_8732 - SURFACE
      ?auto_8728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8730 ?auto_8729 ) ( IS-CRATE ?auto_8724 ) ( not ( = ?auto_8725 ?auto_8729 ) ) ( HOIST-AT ?auto_8727 ?auto_8725 ) ( SURFACE-AT ?auto_8724 ?auto_8725 ) ( ON ?auto_8724 ?auto_8726 ) ( CLEAR ?auto_8724 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( not ( = ?auto_8730 ?auto_8727 ) ) ( IS-CRATE ?auto_8723 ) ( not ( = ?auto_8731 ?auto_8729 ) ) ( HOIST-AT ?auto_8741 ?auto_8731 ) ( AVAILABLE ?auto_8741 ) ( SURFACE-AT ?auto_8723 ?auto_8731 ) ( ON ?auto_8723 ?auto_8743 ) ( CLEAR ?auto_8723 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8743 ) ) ( not ( = ?auto_8723 ?auto_8743 ) ) ( not ( = ?auto_8730 ?auto_8741 ) ) ( IS-CRATE ?auto_8722 ) ( AVAILABLE ?auto_8727 ) ( SURFACE-AT ?auto_8722 ?auto_8725 ) ( ON ?auto_8722 ?auto_8733 ) ( CLEAR ?auto_8722 ) ( not ( = ?auto_8721 ?auto_8722 ) ) ( not ( = ?auto_8721 ?auto_8733 ) ) ( not ( = ?auto_8722 ?auto_8733 ) ) ( IS-CRATE ?auto_8721 ) ( not ( = ?auto_8736 ?auto_8729 ) ) ( HOIST-AT ?auto_8737 ?auto_8736 ) ( AVAILABLE ?auto_8737 ) ( SURFACE-AT ?auto_8721 ?auto_8736 ) ( ON ?auto_8721 ?auto_8738 ) ( CLEAR ?auto_8721 ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8720 ?auto_8738 ) ) ( not ( = ?auto_8721 ?auto_8738 ) ) ( not ( = ?auto_8730 ?auto_8737 ) ) ( IS-CRATE ?auto_8720 ) ( not ( = ?auto_8735 ?auto_8729 ) ) ( HOIST-AT ?auto_8739 ?auto_8735 ) ( AVAILABLE ?auto_8739 ) ( SURFACE-AT ?auto_8720 ?auto_8735 ) ( ON ?auto_8720 ?auto_8742 ) ( CLEAR ?auto_8720 ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( not ( = ?auto_8719 ?auto_8742 ) ) ( not ( = ?auto_8720 ?auto_8742 ) ) ( not ( = ?auto_8730 ?auto_8739 ) ) ( SURFACE-AT ?auto_8718 ?auto_8729 ) ( CLEAR ?auto_8718 ) ( IS-CRATE ?auto_8719 ) ( AVAILABLE ?auto_8730 ) ( not ( = ?auto_8734 ?auto_8729 ) ) ( HOIST-AT ?auto_8740 ?auto_8734 ) ( AVAILABLE ?auto_8740 ) ( SURFACE-AT ?auto_8719 ?auto_8734 ) ( ON ?auto_8719 ?auto_8732 ) ( CLEAR ?auto_8719 ) ( TRUCK-AT ?auto_8728 ?auto_8729 ) ( not ( = ?auto_8718 ?auto_8719 ) ) ( not ( = ?auto_8718 ?auto_8732 ) ) ( not ( = ?auto_8719 ?auto_8732 ) ) ( not ( = ?auto_8730 ?auto_8740 ) ) ( not ( = ?auto_8718 ?auto_8720 ) ) ( not ( = ?auto_8718 ?auto_8742 ) ) ( not ( = ?auto_8720 ?auto_8732 ) ) ( not ( = ?auto_8735 ?auto_8734 ) ) ( not ( = ?auto_8739 ?auto_8740 ) ) ( not ( = ?auto_8742 ?auto_8732 ) ) ( not ( = ?auto_8718 ?auto_8721 ) ) ( not ( = ?auto_8718 ?auto_8738 ) ) ( not ( = ?auto_8719 ?auto_8721 ) ) ( not ( = ?auto_8719 ?auto_8738 ) ) ( not ( = ?auto_8721 ?auto_8742 ) ) ( not ( = ?auto_8721 ?auto_8732 ) ) ( not ( = ?auto_8736 ?auto_8735 ) ) ( not ( = ?auto_8736 ?auto_8734 ) ) ( not ( = ?auto_8737 ?auto_8739 ) ) ( not ( = ?auto_8737 ?auto_8740 ) ) ( not ( = ?auto_8738 ?auto_8742 ) ) ( not ( = ?auto_8738 ?auto_8732 ) ) ( not ( = ?auto_8718 ?auto_8722 ) ) ( not ( = ?auto_8718 ?auto_8733 ) ) ( not ( = ?auto_8719 ?auto_8722 ) ) ( not ( = ?auto_8719 ?auto_8733 ) ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8720 ?auto_8733 ) ) ( not ( = ?auto_8722 ?auto_8738 ) ) ( not ( = ?auto_8722 ?auto_8742 ) ) ( not ( = ?auto_8722 ?auto_8732 ) ) ( not ( = ?auto_8725 ?auto_8736 ) ) ( not ( = ?auto_8725 ?auto_8735 ) ) ( not ( = ?auto_8725 ?auto_8734 ) ) ( not ( = ?auto_8727 ?auto_8737 ) ) ( not ( = ?auto_8727 ?auto_8739 ) ) ( not ( = ?auto_8727 ?auto_8740 ) ) ( not ( = ?auto_8733 ?auto_8738 ) ) ( not ( = ?auto_8733 ?auto_8742 ) ) ( not ( = ?auto_8733 ?auto_8732 ) ) ( not ( = ?auto_8718 ?auto_8723 ) ) ( not ( = ?auto_8718 ?auto_8743 ) ) ( not ( = ?auto_8719 ?auto_8723 ) ) ( not ( = ?auto_8719 ?auto_8743 ) ) ( not ( = ?auto_8720 ?auto_8723 ) ) ( not ( = ?auto_8720 ?auto_8743 ) ) ( not ( = ?auto_8721 ?auto_8723 ) ) ( not ( = ?auto_8721 ?auto_8743 ) ) ( not ( = ?auto_8723 ?auto_8733 ) ) ( not ( = ?auto_8723 ?auto_8738 ) ) ( not ( = ?auto_8723 ?auto_8742 ) ) ( not ( = ?auto_8723 ?auto_8732 ) ) ( not ( = ?auto_8731 ?auto_8725 ) ) ( not ( = ?auto_8731 ?auto_8736 ) ) ( not ( = ?auto_8731 ?auto_8735 ) ) ( not ( = ?auto_8731 ?auto_8734 ) ) ( not ( = ?auto_8741 ?auto_8727 ) ) ( not ( = ?auto_8741 ?auto_8737 ) ) ( not ( = ?auto_8741 ?auto_8739 ) ) ( not ( = ?auto_8741 ?auto_8740 ) ) ( not ( = ?auto_8743 ?auto_8733 ) ) ( not ( = ?auto_8743 ?auto_8738 ) ) ( not ( = ?auto_8743 ?auto_8742 ) ) ( not ( = ?auto_8743 ?auto_8732 ) ) ( not ( = ?auto_8718 ?auto_8724 ) ) ( not ( = ?auto_8718 ?auto_8726 ) ) ( not ( = ?auto_8719 ?auto_8724 ) ) ( not ( = ?auto_8719 ?auto_8726 ) ) ( not ( = ?auto_8720 ?auto_8724 ) ) ( not ( = ?auto_8720 ?auto_8726 ) ) ( not ( = ?auto_8721 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8726 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8743 ) ) ( not ( = ?auto_8724 ?auto_8733 ) ) ( not ( = ?auto_8724 ?auto_8738 ) ) ( not ( = ?auto_8724 ?auto_8742 ) ) ( not ( = ?auto_8724 ?auto_8732 ) ) ( not ( = ?auto_8726 ?auto_8743 ) ) ( not ( = ?auto_8726 ?auto_8733 ) ) ( not ( = ?auto_8726 ?auto_8738 ) ) ( not ( = ?auto_8726 ?auto_8742 ) ) ( not ( = ?auto_8726 ?auto_8732 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8718 ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8723 )
      ( MAKE-1CRATE ?auto_8723 ?auto_8724 )
      ( MAKE-6CRATE-VERIFY ?auto_8718 ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8723 ?auto_8724 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_8762 - SURFACE
      ?auto_8763 - SURFACE
      ?auto_8764 - SURFACE
      ?auto_8765 - SURFACE
      ?auto_8766 - SURFACE
      ?auto_8767 - SURFACE
      ?auto_8768 - SURFACE
      ?auto_8769 - SURFACE
    )
    :vars
    (
      ?auto_8773 - HOIST
      ?auto_8774 - PLACE
      ?auto_8772 - PLACE
      ?auto_8771 - HOIST
      ?auto_8775 - SURFACE
      ?auto_8791 - PLACE
      ?auto_8789 - HOIST
      ?auto_8790 - SURFACE
      ?auto_8786 - PLACE
      ?auto_8783 - HOIST
      ?auto_8776 - SURFACE
      ?auto_8778 - SURFACE
      ?auto_8787 - PLACE
      ?auto_8780 - HOIST
      ?auto_8785 - SURFACE
      ?auto_8784 - PLACE
      ?auto_8782 - HOIST
      ?auto_8781 - SURFACE
      ?auto_8779 - PLACE
      ?auto_8777 - HOIST
      ?auto_8788 - SURFACE
      ?auto_8770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8773 ?auto_8774 ) ( IS-CRATE ?auto_8769 ) ( not ( = ?auto_8772 ?auto_8774 ) ) ( HOIST-AT ?auto_8771 ?auto_8772 ) ( AVAILABLE ?auto_8771 ) ( SURFACE-AT ?auto_8769 ?auto_8772 ) ( ON ?auto_8769 ?auto_8775 ) ( CLEAR ?auto_8769 ) ( not ( = ?auto_8768 ?auto_8769 ) ) ( not ( = ?auto_8768 ?auto_8775 ) ) ( not ( = ?auto_8769 ?auto_8775 ) ) ( not ( = ?auto_8773 ?auto_8771 ) ) ( IS-CRATE ?auto_8768 ) ( not ( = ?auto_8791 ?auto_8774 ) ) ( HOIST-AT ?auto_8789 ?auto_8791 ) ( SURFACE-AT ?auto_8768 ?auto_8791 ) ( ON ?auto_8768 ?auto_8790 ) ( CLEAR ?auto_8768 ) ( not ( = ?auto_8767 ?auto_8768 ) ) ( not ( = ?auto_8767 ?auto_8790 ) ) ( not ( = ?auto_8768 ?auto_8790 ) ) ( not ( = ?auto_8773 ?auto_8789 ) ) ( IS-CRATE ?auto_8767 ) ( not ( = ?auto_8786 ?auto_8774 ) ) ( HOIST-AT ?auto_8783 ?auto_8786 ) ( AVAILABLE ?auto_8783 ) ( SURFACE-AT ?auto_8767 ?auto_8786 ) ( ON ?auto_8767 ?auto_8776 ) ( CLEAR ?auto_8767 ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( not ( = ?auto_8766 ?auto_8776 ) ) ( not ( = ?auto_8767 ?auto_8776 ) ) ( not ( = ?auto_8773 ?auto_8783 ) ) ( IS-CRATE ?auto_8766 ) ( AVAILABLE ?auto_8789 ) ( SURFACE-AT ?auto_8766 ?auto_8791 ) ( ON ?auto_8766 ?auto_8778 ) ( CLEAR ?auto_8766 ) ( not ( = ?auto_8765 ?auto_8766 ) ) ( not ( = ?auto_8765 ?auto_8778 ) ) ( not ( = ?auto_8766 ?auto_8778 ) ) ( IS-CRATE ?auto_8765 ) ( not ( = ?auto_8787 ?auto_8774 ) ) ( HOIST-AT ?auto_8780 ?auto_8787 ) ( AVAILABLE ?auto_8780 ) ( SURFACE-AT ?auto_8765 ?auto_8787 ) ( ON ?auto_8765 ?auto_8785 ) ( CLEAR ?auto_8765 ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( not ( = ?auto_8764 ?auto_8785 ) ) ( not ( = ?auto_8765 ?auto_8785 ) ) ( not ( = ?auto_8773 ?auto_8780 ) ) ( IS-CRATE ?auto_8764 ) ( not ( = ?auto_8784 ?auto_8774 ) ) ( HOIST-AT ?auto_8782 ?auto_8784 ) ( AVAILABLE ?auto_8782 ) ( SURFACE-AT ?auto_8764 ?auto_8784 ) ( ON ?auto_8764 ?auto_8781 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8781 ) ) ( not ( = ?auto_8764 ?auto_8781 ) ) ( not ( = ?auto_8773 ?auto_8782 ) ) ( SURFACE-AT ?auto_8762 ?auto_8774 ) ( CLEAR ?auto_8762 ) ( IS-CRATE ?auto_8763 ) ( AVAILABLE ?auto_8773 ) ( not ( = ?auto_8779 ?auto_8774 ) ) ( HOIST-AT ?auto_8777 ?auto_8779 ) ( AVAILABLE ?auto_8777 ) ( SURFACE-AT ?auto_8763 ?auto_8779 ) ( ON ?auto_8763 ?auto_8788 ) ( CLEAR ?auto_8763 ) ( TRUCK-AT ?auto_8770 ?auto_8774 ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8788 ) ) ( not ( = ?auto_8763 ?auto_8788 ) ) ( not ( = ?auto_8773 ?auto_8777 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8762 ?auto_8781 ) ) ( not ( = ?auto_8764 ?auto_8788 ) ) ( not ( = ?auto_8784 ?auto_8779 ) ) ( not ( = ?auto_8782 ?auto_8777 ) ) ( not ( = ?auto_8781 ?auto_8788 ) ) ( not ( = ?auto_8762 ?auto_8765 ) ) ( not ( = ?auto_8762 ?auto_8785 ) ) ( not ( = ?auto_8763 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8785 ) ) ( not ( = ?auto_8765 ?auto_8781 ) ) ( not ( = ?auto_8765 ?auto_8788 ) ) ( not ( = ?auto_8787 ?auto_8784 ) ) ( not ( = ?auto_8787 ?auto_8779 ) ) ( not ( = ?auto_8780 ?auto_8782 ) ) ( not ( = ?auto_8780 ?auto_8777 ) ) ( not ( = ?auto_8785 ?auto_8781 ) ) ( not ( = ?auto_8785 ?auto_8788 ) ) ( not ( = ?auto_8762 ?auto_8766 ) ) ( not ( = ?auto_8762 ?auto_8778 ) ) ( not ( = ?auto_8763 ?auto_8766 ) ) ( not ( = ?auto_8763 ?auto_8778 ) ) ( not ( = ?auto_8764 ?auto_8766 ) ) ( not ( = ?auto_8764 ?auto_8778 ) ) ( not ( = ?auto_8766 ?auto_8785 ) ) ( not ( = ?auto_8766 ?auto_8781 ) ) ( not ( = ?auto_8766 ?auto_8788 ) ) ( not ( = ?auto_8791 ?auto_8787 ) ) ( not ( = ?auto_8791 ?auto_8784 ) ) ( not ( = ?auto_8791 ?auto_8779 ) ) ( not ( = ?auto_8789 ?auto_8780 ) ) ( not ( = ?auto_8789 ?auto_8782 ) ) ( not ( = ?auto_8789 ?auto_8777 ) ) ( not ( = ?auto_8778 ?auto_8785 ) ) ( not ( = ?auto_8778 ?auto_8781 ) ) ( not ( = ?auto_8778 ?auto_8788 ) ) ( not ( = ?auto_8762 ?auto_8767 ) ) ( not ( = ?auto_8762 ?auto_8776 ) ) ( not ( = ?auto_8763 ?auto_8767 ) ) ( not ( = ?auto_8763 ?auto_8776 ) ) ( not ( = ?auto_8764 ?auto_8767 ) ) ( not ( = ?auto_8764 ?auto_8776 ) ) ( not ( = ?auto_8765 ?auto_8767 ) ) ( not ( = ?auto_8765 ?auto_8776 ) ) ( not ( = ?auto_8767 ?auto_8778 ) ) ( not ( = ?auto_8767 ?auto_8785 ) ) ( not ( = ?auto_8767 ?auto_8781 ) ) ( not ( = ?auto_8767 ?auto_8788 ) ) ( not ( = ?auto_8786 ?auto_8791 ) ) ( not ( = ?auto_8786 ?auto_8787 ) ) ( not ( = ?auto_8786 ?auto_8784 ) ) ( not ( = ?auto_8786 ?auto_8779 ) ) ( not ( = ?auto_8783 ?auto_8789 ) ) ( not ( = ?auto_8783 ?auto_8780 ) ) ( not ( = ?auto_8783 ?auto_8782 ) ) ( not ( = ?auto_8783 ?auto_8777 ) ) ( not ( = ?auto_8776 ?auto_8778 ) ) ( not ( = ?auto_8776 ?auto_8785 ) ) ( not ( = ?auto_8776 ?auto_8781 ) ) ( not ( = ?auto_8776 ?auto_8788 ) ) ( not ( = ?auto_8762 ?auto_8768 ) ) ( not ( = ?auto_8762 ?auto_8790 ) ) ( not ( = ?auto_8763 ?auto_8768 ) ) ( not ( = ?auto_8763 ?auto_8790 ) ) ( not ( = ?auto_8764 ?auto_8768 ) ) ( not ( = ?auto_8764 ?auto_8790 ) ) ( not ( = ?auto_8765 ?auto_8768 ) ) ( not ( = ?auto_8765 ?auto_8790 ) ) ( not ( = ?auto_8766 ?auto_8768 ) ) ( not ( = ?auto_8766 ?auto_8790 ) ) ( not ( = ?auto_8768 ?auto_8776 ) ) ( not ( = ?auto_8768 ?auto_8778 ) ) ( not ( = ?auto_8768 ?auto_8785 ) ) ( not ( = ?auto_8768 ?auto_8781 ) ) ( not ( = ?auto_8768 ?auto_8788 ) ) ( not ( = ?auto_8790 ?auto_8776 ) ) ( not ( = ?auto_8790 ?auto_8778 ) ) ( not ( = ?auto_8790 ?auto_8785 ) ) ( not ( = ?auto_8790 ?auto_8781 ) ) ( not ( = ?auto_8790 ?auto_8788 ) ) ( not ( = ?auto_8762 ?auto_8769 ) ) ( not ( = ?auto_8762 ?auto_8775 ) ) ( not ( = ?auto_8763 ?auto_8769 ) ) ( not ( = ?auto_8763 ?auto_8775 ) ) ( not ( = ?auto_8764 ?auto_8769 ) ) ( not ( = ?auto_8764 ?auto_8775 ) ) ( not ( = ?auto_8765 ?auto_8769 ) ) ( not ( = ?auto_8765 ?auto_8775 ) ) ( not ( = ?auto_8766 ?auto_8769 ) ) ( not ( = ?auto_8766 ?auto_8775 ) ) ( not ( = ?auto_8767 ?auto_8769 ) ) ( not ( = ?auto_8767 ?auto_8775 ) ) ( not ( = ?auto_8769 ?auto_8790 ) ) ( not ( = ?auto_8769 ?auto_8776 ) ) ( not ( = ?auto_8769 ?auto_8778 ) ) ( not ( = ?auto_8769 ?auto_8785 ) ) ( not ( = ?auto_8769 ?auto_8781 ) ) ( not ( = ?auto_8769 ?auto_8788 ) ) ( not ( = ?auto_8772 ?auto_8791 ) ) ( not ( = ?auto_8772 ?auto_8786 ) ) ( not ( = ?auto_8772 ?auto_8787 ) ) ( not ( = ?auto_8772 ?auto_8784 ) ) ( not ( = ?auto_8772 ?auto_8779 ) ) ( not ( = ?auto_8771 ?auto_8789 ) ) ( not ( = ?auto_8771 ?auto_8783 ) ) ( not ( = ?auto_8771 ?auto_8780 ) ) ( not ( = ?auto_8771 ?auto_8782 ) ) ( not ( = ?auto_8771 ?auto_8777 ) ) ( not ( = ?auto_8775 ?auto_8790 ) ) ( not ( = ?auto_8775 ?auto_8776 ) ) ( not ( = ?auto_8775 ?auto_8778 ) ) ( not ( = ?auto_8775 ?auto_8785 ) ) ( not ( = ?auto_8775 ?auto_8781 ) ) ( not ( = ?auto_8775 ?auto_8788 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8762 ?auto_8763 ?auto_8764 ?auto_8765 ?auto_8766 ?auto_8767 ?auto_8768 )
      ( MAKE-1CRATE ?auto_8768 ?auto_8769 )
      ( MAKE-7CRATE-VERIFY ?auto_8762 ?auto_8763 ?auto_8764 ?auto_8765 ?auto_8766 ?auto_8767 ?auto_8768 ?auto_8769 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_8811 - SURFACE
      ?auto_8812 - SURFACE
      ?auto_8813 - SURFACE
      ?auto_8814 - SURFACE
      ?auto_8815 - SURFACE
      ?auto_8816 - SURFACE
      ?auto_8817 - SURFACE
      ?auto_8818 - SURFACE
      ?auto_8819 - SURFACE
    )
    :vars
    (
      ?auto_8823 - HOIST
      ?auto_8820 - PLACE
      ?auto_8824 - PLACE
      ?auto_8822 - HOIST
      ?auto_8821 - SURFACE
      ?auto_8835 - SURFACE
      ?auto_8834 - PLACE
      ?auto_8828 - HOIST
      ?auto_8838 - SURFACE
      ?auto_8837 - PLACE
      ?auto_8832 - HOIST
      ?auto_8836 - SURFACE
      ?auto_8827 - SURFACE
      ?auto_8831 - PLACE
      ?auto_8830 - HOIST
      ?auto_8833 - SURFACE
      ?auto_8829 - PLACE
      ?auto_8841 - HOIST
      ?auto_8842 - SURFACE
      ?auto_8840 - PLACE
      ?auto_8826 - HOIST
      ?auto_8839 - SURFACE
      ?auto_8825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8823 ?auto_8820 ) ( IS-CRATE ?auto_8819 ) ( not ( = ?auto_8824 ?auto_8820 ) ) ( HOIST-AT ?auto_8822 ?auto_8824 ) ( SURFACE-AT ?auto_8819 ?auto_8824 ) ( ON ?auto_8819 ?auto_8821 ) ( CLEAR ?auto_8819 ) ( not ( = ?auto_8818 ?auto_8819 ) ) ( not ( = ?auto_8818 ?auto_8821 ) ) ( not ( = ?auto_8819 ?auto_8821 ) ) ( not ( = ?auto_8823 ?auto_8822 ) ) ( IS-CRATE ?auto_8818 ) ( AVAILABLE ?auto_8822 ) ( SURFACE-AT ?auto_8818 ?auto_8824 ) ( ON ?auto_8818 ?auto_8835 ) ( CLEAR ?auto_8818 ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8835 ) ) ( not ( = ?auto_8818 ?auto_8835 ) ) ( IS-CRATE ?auto_8817 ) ( not ( = ?auto_8834 ?auto_8820 ) ) ( HOIST-AT ?auto_8828 ?auto_8834 ) ( SURFACE-AT ?auto_8817 ?auto_8834 ) ( ON ?auto_8817 ?auto_8838 ) ( CLEAR ?auto_8817 ) ( not ( = ?auto_8816 ?auto_8817 ) ) ( not ( = ?auto_8816 ?auto_8838 ) ) ( not ( = ?auto_8817 ?auto_8838 ) ) ( not ( = ?auto_8823 ?auto_8828 ) ) ( IS-CRATE ?auto_8816 ) ( not ( = ?auto_8837 ?auto_8820 ) ) ( HOIST-AT ?auto_8832 ?auto_8837 ) ( AVAILABLE ?auto_8832 ) ( SURFACE-AT ?auto_8816 ?auto_8837 ) ( ON ?auto_8816 ?auto_8836 ) ( CLEAR ?auto_8816 ) ( not ( = ?auto_8815 ?auto_8816 ) ) ( not ( = ?auto_8815 ?auto_8836 ) ) ( not ( = ?auto_8816 ?auto_8836 ) ) ( not ( = ?auto_8823 ?auto_8832 ) ) ( IS-CRATE ?auto_8815 ) ( AVAILABLE ?auto_8828 ) ( SURFACE-AT ?auto_8815 ?auto_8834 ) ( ON ?auto_8815 ?auto_8827 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8814 ?auto_8827 ) ) ( not ( = ?auto_8815 ?auto_8827 ) ) ( IS-CRATE ?auto_8814 ) ( not ( = ?auto_8831 ?auto_8820 ) ) ( HOIST-AT ?auto_8830 ?auto_8831 ) ( AVAILABLE ?auto_8830 ) ( SURFACE-AT ?auto_8814 ?auto_8831 ) ( ON ?auto_8814 ?auto_8833 ) ( CLEAR ?auto_8814 ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( not ( = ?auto_8813 ?auto_8833 ) ) ( not ( = ?auto_8814 ?auto_8833 ) ) ( not ( = ?auto_8823 ?auto_8830 ) ) ( IS-CRATE ?auto_8813 ) ( not ( = ?auto_8829 ?auto_8820 ) ) ( HOIST-AT ?auto_8841 ?auto_8829 ) ( AVAILABLE ?auto_8841 ) ( SURFACE-AT ?auto_8813 ?auto_8829 ) ( ON ?auto_8813 ?auto_8842 ) ( CLEAR ?auto_8813 ) ( not ( = ?auto_8812 ?auto_8813 ) ) ( not ( = ?auto_8812 ?auto_8842 ) ) ( not ( = ?auto_8813 ?auto_8842 ) ) ( not ( = ?auto_8823 ?auto_8841 ) ) ( SURFACE-AT ?auto_8811 ?auto_8820 ) ( CLEAR ?auto_8811 ) ( IS-CRATE ?auto_8812 ) ( AVAILABLE ?auto_8823 ) ( not ( = ?auto_8840 ?auto_8820 ) ) ( HOIST-AT ?auto_8826 ?auto_8840 ) ( AVAILABLE ?auto_8826 ) ( SURFACE-AT ?auto_8812 ?auto_8840 ) ( ON ?auto_8812 ?auto_8839 ) ( CLEAR ?auto_8812 ) ( TRUCK-AT ?auto_8825 ?auto_8820 ) ( not ( = ?auto_8811 ?auto_8812 ) ) ( not ( = ?auto_8811 ?auto_8839 ) ) ( not ( = ?auto_8812 ?auto_8839 ) ) ( not ( = ?auto_8823 ?auto_8826 ) ) ( not ( = ?auto_8811 ?auto_8813 ) ) ( not ( = ?auto_8811 ?auto_8842 ) ) ( not ( = ?auto_8813 ?auto_8839 ) ) ( not ( = ?auto_8829 ?auto_8840 ) ) ( not ( = ?auto_8841 ?auto_8826 ) ) ( not ( = ?auto_8842 ?auto_8839 ) ) ( not ( = ?auto_8811 ?auto_8814 ) ) ( not ( = ?auto_8811 ?auto_8833 ) ) ( not ( = ?auto_8812 ?auto_8814 ) ) ( not ( = ?auto_8812 ?auto_8833 ) ) ( not ( = ?auto_8814 ?auto_8842 ) ) ( not ( = ?auto_8814 ?auto_8839 ) ) ( not ( = ?auto_8831 ?auto_8829 ) ) ( not ( = ?auto_8831 ?auto_8840 ) ) ( not ( = ?auto_8830 ?auto_8841 ) ) ( not ( = ?auto_8830 ?auto_8826 ) ) ( not ( = ?auto_8833 ?auto_8842 ) ) ( not ( = ?auto_8833 ?auto_8839 ) ) ( not ( = ?auto_8811 ?auto_8815 ) ) ( not ( = ?auto_8811 ?auto_8827 ) ) ( not ( = ?auto_8812 ?auto_8815 ) ) ( not ( = ?auto_8812 ?auto_8827 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( not ( = ?auto_8813 ?auto_8827 ) ) ( not ( = ?auto_8815 ?auto_8833 ) ) ( not ( = ?auto_8815 ?auto_8842 ) ) ( not ( = ?auto_8815 ?auto_8839 ) ) ( not ( = ?auto_8834 ?auto_8831 ) ) ( not ( = ?auto_8834 ?auto_8829 ) ) ( not ( = ?auto_8834 ?auto_8840 ) ) ( not ( = ?auto_8828 ?auto_8830 ) ) ( not ( = ?auto_8828 ?auto_8841 ) ) ( not ( = ?auto_8828 ?auto_8826 ) ) ( not ( = ?auto_8827 ?auto_8833 ) ) ( not ( = ?auto_8827 ?auto_8842 ) ) ( not ( = ?auto_8827 ?auto_8839 ) ) ( not ( = ?auto_8811 ?auto_8816 ) ) ( not ( = ?auto_8811 ?auto_8836 ) ) ( not ( = ?auto_8812 ?auto_8816 ) ) ( not ( = ?auto_8812 ?auto_8836 ) ) ( not ( = ?auto_8813 ?auto_8816 ) ) ( not ( = ?auto_8813 ?auto_8836 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8814 ?auto_8836 ) ) ( not ( = ?auto_8816 ?auto_8827 ) ) ( not ( = ?auto_8816 ?auto_8833 ) ) ( not ( = ?auto_8816 ?auto_8842 ) ) ( not ( = ?auto_8816 ?auto_8839 ) ) ( not ( = ?auto_8837 ?auto_8834 ) ) ( not ( = ?auto_8837 ?auto_8831 ) ) ( not ( = ?auto_8837 ?auto_8829 ) ) ( not ( = ?auto_8837 ?auto_8840 ) ) ( not ( = ?auto_8832 ?auto_8828 ) ) ( not ( = ?auto_8832 ?auto_8830 ) ) ( not ( = ?auto_8832 ?auto_8841 ) ) ( not ( = ?auto_8832 ?auto_8826 ) ) ( not ( = ?auto_8836 ?auto_8827 ) ) ( not ( = ?auto_8836 ?auto_8833 ) ) ( not ( = ?auto_8836 ?auto_8842 ) ) ( not ( = ?auto_8836 ?auto_8839 ) ) ( not ( = ?auto_8811 ?auto_8817 ) ) ( not ( = ?auto_8811 ?auto_8838 ) ) ( not ( = ?auto_8812 ?auto_8817 ) ) ( not ( = ?auto_8812 ?auto_8838 ) ) ( not ( = ?auto_8813 ?auto_8817 ) ) ( not ( = ?auto_8813 ?auto_8838 ) ) ( not ( = ?auto_8814 ?auto_8817 ) ) ( not ( = ?auto_8814 ?auto_8838 ) ) ( not ( = ?auto_8815 ?auto_8817 ) ) ( not ( = ?auto_8815 ?auto_8838 ) ) ( not ( = ?auto_8817 ?auto_8836 ) ) ( not ( = ?auto_8817 ?auto_8827 ) ) ( not ( = ?auto_8817 ?auto_8833 ) ) ( not ( = ?auto_8817 ?auto_8842 ) ) ( not ( = ?auto_8817 ?auto_8839 ) ) ( not ( = ?auto_8838 ?auto_8836 ) ) ( not ( = ?auto_8838 ?auto_8827 ) ) ( not ( = ?auto_8838 ?auto_8833 ) ) ( not ( = ?auto_8838 ?auto_8842 ) ) ( not ( = ?auto_8838 ?auto_8839 ) ) ( not ( = ?auto_8811 ?auto_8818 ) ) ( not ( = ?auto_8811 ?auto_8835 ) ) ( not ( = ?auto_8812 ?auto_8818 ) ) ( not ( = ?auto_8812 ?auto_8835 ) ) ( not ( = ?auto_8813 ?auto_8818 ) ) ( not ( = ?auto_8813 ?auto_8835 ) ) ( not ( = ?auto_8814 ?auto_8818 ) ) ( not ( = ?auto_8814 ?auto_8835 ) ) ( not ( = ?auto_8815 ?auto_8818 ) ) ( not ( = ?auto_8815 ?auto_8835 ) ) ( not ( = ?auto_8816 ?auto_8818 ) ) ( not ( = ?auto_8816 ?auto_8835 ) ) ( not ( = ?auto_8818 ?auto_8838 ) ) ( not ( = ?auto_8818 ?auto_8836 ) ) ( not ( = ?auto_8818 ?auto_8827 ) ) ( not ( = ?auto_8818 ?auto_8833 ) ) ( not ( = ?auto_8818 ?auto_8842 ) ) ( not ( = ?auto_8818 ?auto_8839 ) ) ( not ( = ?auto_8824 ?auto_8834 ) ) ( not ( = ?auto_8824 ?auto_8837 ) ) ( not ( = ?auto_8824 ?auto_8831 ) ) ( not ( = ?auto_8824 ?auto_8829 ) ) ( not ( = ?auto_8824 ?auto_8840 ) ) ( not ( = ?auto_8822 ?auto_8828 ) ) ( not ( = ?auto_8822 ?auto_8832 ) ) ( not ( = ?auto_8822 ?auto_8830 ) ) ( not ( = ?auto_8822 ?auto_8841 ) ) ( not ( = ?auto_8822 ?auto_8826 ) ) ( not ( = ?auto_8835 ?auto_8838 ) ) ( not ( = ?auto_8835 ?auto_8836 ) ) ( not ( = ?auto_8835 ?auto_8827 ) ) ( not ( = ?auto_8835 ?auto_8833 ) ) ( not ( = ?auto_8835 ?auto_8842 ) ) ( not ( = ?auto_8835 ?auto_8839 ) ) ( not ( = ?auto_8811 ?auto_8819 ) ) ( not ( = ?auto_8811 ?auto_8821 ) ) ( not ( = ?auto_8812 ?auto_8819 ) ) ( not ( = ?auto_8812 ?auto_8821 ) ) ( not ( = ?auto_8813 ?auto_8819 ) ) ( not ( = ?auto_8813 ?auto_8821 ) ) ( not ( = ?auto_8814 ?auto_8819 ) ) ( not ( = ?auto_8814 ?auto_8821 ) ) ( not ( = ?auto_8815 ?auto_8819 ) ) ( not ( = ?auto_8815 ?auto_8821 ) ) ( not ( = ?auto_8816 ?auto_8819 ) ) ( not ( = ?auto_8816 ?auto_8821 ) ) ( not ( = ?auto_8817 ?auto_8819 ) ) ( not ( = ?auto_8817 ?auto_8821 ) ) ( not ( = ?auto_8819 ?auto_8835 ) ) ( not ( = ?auto_8819 ?auto_8838 ) ) ( not ( = ?auto_8819 ?auto_8836 ) ) ( not ( = ?auto_8819 ?auto_8827 ) ) ( not ( = ?auto_8819 ?auto_8833 ) ) ( not ( = ?auto_8819 ?auto_8842 ) ) ( not ( = ?auto_8819 ?auto_8839 ) ) ( not ( = ?auto_8821 ?auto_8835 ) ) ( not ( = ?auto_8821 ?auto_8838 ) ) ( not ( = ?auto_8821 ?auto_8836 ) ) ( not ( = ?auto_8821 ?auto_8827 ) ) ( not ( = ?auto_8821 ?auto_8833 ) ) ( not ( = ?auto_8821 ?auto_8842 ) ) ( not ( = ?auto_8821 ?auto_8839 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8811 ?auto_8812 ?auto_8813 ?auto_8814 ?auto_8815 ?auto_8816 ?auto_8817 ?auto_8818 )
      ( MAKE-1CRATE ?auto_8818 ?auto_8819 )
      ( MAKE-8CRATE-VERIFY ?auto_8811 ?auto_8812 ?auto_8813 ?auto_8814 ?auto_8815 ?auto_8816 ?auto_8817 ?auto_8818 ?auto_8819 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_8863 - SURFACE
      ?auto_8864 - SURFACE
      ?auto_8865 - SURFACE
      ?auto_8866 - SURFACE
      ?auto_8867 - SURFACE
      ?auto_8868 - SURFACE
      ?auto_8869 - SURFACE
      ?auto_8870 - SURFACE
      ?auto_8871 - SURFACE
      ?auto_8872 - SURFACE
    )
    :vars
    (
      ?auto_8875 - HOIST
      ?auto_8877 - PLACE
      ?auto_8876 - PLACE
      ?auto_8873 - HOIST
      ?auto_8874 - SURFACE
      ?auto_8891 - PLACE
      ?auto_8887 - HOIST
      ?auto_8893 - SURFACE
      ?auto_8885 - SURFACE
      ?auto_8881 - PLACE
      ?auto_8882 - HOIST
      ?auto_8894 - SURFACE
      ?auto_8883 - PLACE
      ?auto_8896 - HOIST
      ?auto_8892 - SURFACE
      ?auto_8880 - SURFACE
      ?auto_8884 - PLACE
      ?auto_8886 - HOIST
      ?auto_8890 - SURFACE
      ?auto_8889 - PLACE
      ?auto_8895 - HOIST
      ?auto_8879 - SURFACE
      ?auto_8888 - SURFACE
      ?auto_8878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8875 ?auto_8877 ) ( IS-CRATE ?auto_8872 ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( HOIST-AT ?auto_8873 ?auto_8876 ) ( SURFACE-AT ?auto_8872 ?auto_8876 ) ( ON ?auto_8872 ?auto_8874 ) ( CLEAR ?auto_8872 ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8874 ) ) ( not ( = ?auto_8872 ?auto_8874 ) ) ( not ( = ?auto_8875 ?auto_8873 ) ) ( IS-CRATE ?auto_8871 ) ( not ( = ?auto_8891 ?auto_8877 ) ) ( HOIST-AT ?auto_8887 ?auto_8891 ) ( SURFACE-AT ?auto_8871 ?auto_8891 ) ( ON ?auto_8871 ?auto_8893 ) ( CLEAR ?auto_8871 ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8893 ) ) ( not ( = ?auto_8871 ?auto_8893 ) ) ( not ( = ?auto_8875 ?auto_8887 ) ) ( IS-CRATE ?auto_8870 ) ( AVAILABLE ?auto_8887 ) ( SURFACE-AT ?auto_8870 ?auto_8891 ) ( ON ?auto_8870 ?auto_8885 ) ( CLEAR ?auto_8870 ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( not ( = ?auto_8869 ?auto_8885 ) ) ( not ( = ?auto_8870 ?auto_8885 ) ) ( IS-CRATE ?auto_8869 ) ( not ( = ?auto_8881 ?auto_8877 ) ) ( HOIST-AT ?auto_8882 ?auto_8881 ) ( SURFACE-AT ?auto_8869 ?auto_8881 ) ( ON ?auto_8869 ?auto_8894 ) ( CLEAR ?auto_8869 ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8894 ) ) ( not ( = ?auto_8869 ?auto_8894 ) ) ( not ( = ?auto_8875 ?auto_8882 ) ) ( IS-CRATE ?auto_8868 ) ( not ( = ?auto_8883 ?auto_8877 ) ) ( HOIST-AT ?auto_8896 ?auto_8883 ) ( AVAILABLE ?auto_8896 ) ( SURFACE-AT ?auto_8868 ?auto_8883 ) ( ON ?auto_8868 ?auto_8892 ) ( CLEAR ?auto_8868 ) ( not ( = ?auto_8867 ?auto_8868 ) ) ( not ( = ?auto_8867 ?auto_8892 ) ) ( not ( = ?auto_8868 ?auto_8892 ) ) ( not ( = ?auto_8875 ?auto_8896 ) ) ( IS-CRATE ?auto_8867 ) ( AVAILABLE ?auto_8882 ) ( SURFACE-AT ?auto_8867 ?auto_8881 ) ( ON ?auto_8867 ?auto_8880 ) ( CLEAR ?auto_8867 ) ( not ( = ?auto_8866 ?auto_8867 ) ) ( not ( = ?auto_8866 ?auto_8880 ) ) ( not ( = ?auto_8867 ?auto_8880 ) ) ( IS-CRATE ?auto_8866 ) ( not ( = ?auto_8884 ?auto_8877 ) ) ( HOIST-AT ?auto_8886 ?auto_8884 ) ( AVAILABLE ?auto_8886 ) ( SURFACE-AT ?auto_8866 ?auto_8884 ) ( ON ?auto_8866 ?auto_8890 ) ( CLEAR ?auto_8866 ) ( not ( = ?auto_8865 ?auto_8866 ) ) ( not ( = ?auto_8865 ?auto_8890 ) ) ( not ( = ?auto_8866 ?auto_8890 ) ) ( not ( = ?auto_8875 ?auto_8886 ) ) ( IS-CRATE ?auto_8865 ) ( not ( = ?auto_8889 ?auto_8877 ) ) ( HOIST-AT ?auto_8895 ?auto_8889 ) ( AVAILABLE ?auto_8895 ) ( SURFACE-AT ?auto_8865 ?auto_8889 ) ( ON ?auto_8865 ?auto_8879 ) ( CLEAR ?auto_8865 ) ( not ( = ?auto_8864 ?auto_8865 ) ) ( not ( = ?auto_8864 ?auto_8879 ) ) ( not ( = ?auto_8865 ?auto_8879 ) ) ( not ( = ?auto_8875 ?auto_8895 ) ) ( SURFACE-AT ?auto_8863 ?auto_8877 ) ( CLEAR ?auto_8863 ) ( IS-CRATE ?auto_8864 ) ( AVAILABLE ?auto_8875 ) ( AVAILABLE ?auto_8873 ) ( SURFACE-AT ?auto_8864 ?auto_8876 ) ( ON ?auto_8864 ?auto_8888 ) ( CLEAR ?auto_8864 ) ( TRUCK-AT ?auto_8878 ?auto_8877 ) ( not ( = ?auto_8863 ?auto_8864 ) ) ( not ( = ?auto_8863 ?auto_8888 ) ) ( not ( = ?auto_8864 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8865 ) ) ( not ( = ?auto_8863 ?auto_8879 ) ) ( not ( = ?auto_8865 ?auto_8888 ) ) ( not ( = ?auto_8889 ?auto_8876 ) ) ( not ( = ?auto_8895 ?auto_8873 ) ) ( not ( = ?auto_8879 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8866 ) ) ( not ( = ?auto_8863 ?auto_8890 ) ) ( not ( = ?auto_8864 ?auto_8866 ) ) ( not ( = ?auto_8864 ?auto_8890 ) ) ( not ( = ?auto_8866 ?auto_8879 ) ) ( not ( = ?auto_8866 ?auto_8888 ) ) ( not ( = ?auto_8884 ?auto_8889 ) ) ( not ( = ?auto_8884 ?auto_8876 ) ) ( not ( = ?auto_8886 ?auto_8895 ) ) ( not ( = ?auto_8886 ?auto_8873 ) ) ( not ( = ?auto_8890 ?auto_8879 ) ) ( not ( = ?auto_8890 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8867 ) ) ( not ( = ?auto_8863 ?auto_8880 ) ) ( not ( = ?auto_8864 ?auto_8867 ) ) ( not ( = ?auto_8864 ?auto_8880 ) ) ( not ( = ?auto_8865 ?auto_8867 ) ) ( not ( = ?auto_8865 ?auto_8880 ) ) ( not ( = ?auto_8867 ?auto_8890 ) ) ( not ( = ?auto_8867 ?auto_8879 ) ) ( not ( = ?auto_8867 ?auto_8888 ) ) ( not ( = ?auto_8881 ?auto_8884 ) ) ( not ( = ?auto_8881 ?auto_8889 ) ) ( not ( = ?auto_8881 ?auto_8876 ) ) ( not ( = ?auto_8882 ?auto_8886 ) ) ( not ( = ?auto_8882 ?auto_8895 ) ) ( not ( = ?auto_8882 ?auto_8873 ) ) ( not ( = ?auto_8880 ?auto_8890 ) ) ( not ( = ?auto_8880 ?auto_8879 ) ) ( not ( = ?auto_8880 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8868 ) ) ( not ( = ?auto_8863 ?auto_8892 ) ) ( not ( = ?auto_8864 ?auto_8868 ) ) ( not ( = ?auto_8864 ?auto_8892 ) ) ( not ( = ?auto_8865 ?auto_8868 ) ) ( not ( = ?auto_8865 ?auto_8892 ) ) ( not ( = ?auto_8866 ?auto_8868 ) ) ( not ( = ?auto_8866 ?auto_8892 ) ) ( not ( = ?auto_8868 ?auto_8880 ) ) ( not ( = ?auto_8868 ?auto_8890 ) ) ( not ( = ?auto_8868 ?auto_8879 ) ) ( not ( = ?auto_8868 ?auto_8888 ) ) ( not ( = ?auto_8883 ?auto_8881 ) ) ( not ( = ?auto_8883 ?auto_8884 ) ) ( not ( = ?auto_8883 ?auto_8889 ) ) ( not ( = ?auto_8883 ?auto_8876 ) ) ( not ( = ?auto_8896 ?auto_8882 ) ) ( not ( = ?auto_8896 ?auto_8886 ) ) ( not ( = ?auto_8896 ?auto_8895 ) ) ( not ( = ?auto_8896 ?auto_8873 ) ) ( not ( = ?auto_8892 ?auto_8880 ) ) ( not ( = ?auto_8892 ?auto_8890 ) ) ( not ( = ?auto_8892 ?auto_8879 ) ) ( not ( = ?auto_8892 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8869 ) ) ( not ( = ?auto_8863 ?auto_8894 ) ) ( not ( = ?auto_8864 ?auto_8869 ) ) ( not ( = ?auto_8864 ?auto_8894 ) ) ( not ( = ?auto_8865 ?auto_8869 ) ) ( not ( = ?auto_8865 ?auto_8894 ) ) ( not ( = ?auto_8866 ?auto_8869 ) ) ( not ( = ?auto_8866 ?auto_8894 ) ) ( not ( = ?auto_8867 ?auto_8869 ) ) ( not ( = ?auto_8867 ?auto_8894 ) ) ( not ( = ?auto_8869 ?auto_8892 ) ) ( not ( = ?auto_8869 ?auto_8880 ) ) ( not ( = ?auto_8869 ?auto_8890 ) ) ( not ( = ?auto_8869 ?auto_8879 ) ) ( not ( = ?auto_8869 ?auto_8888 ) ) ( not ( = ?auto_8894 ?auto_8892 ) ) ( not ( = ?auto_8894 ?auto_8880 ) ) ( not ( = ?auto_8894 ?auto_8890 ) ) ( not ( = ?auto_8894 ?auto_8879 ) ) ( not ( = ?auto_8894 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8870 ) ) ( not ( = ?auto_8863 ?auto_8885 ) ) ( not ( = ?auto_8864 ?auto_8870 ) ) ( not ( = ?auto_8864 ?auto_8885 ) ) ( not ( = ?auto_8865 ?auto_8870 ) ) ( not ( = ?auto_8865 ?auto_8885 ) ) ( not ( = ?auto_8866 ?auto_8870 ) ) ( not ( = ?auto_8866 ?auto_8885 ) ) ( not ( = ?auto_8867 ?auto_8870 ) ) ( not ( = ?auto_8867 ?auto_8885 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8885 ) ) ( not ( = ?auto_8870 ?auto_8894 ) ) ( not ( = ?auto_8870 ?auto_8892 ) ) ( not ( = ?auto_8870 ?auto_8880 ) ) ( not ( = ?auto_8870 ?auto_8890 ) ) ( not ( = ?auto_8870 ?auto_8879 ) ) ( not ( = ?auto_8870 ?auto_8888 ) ) ( not ( = ?auto_8891 ?auto_8881 ) ) ( not ( = ?auto_8891 ?auto_8883 ) ) ( not ( = ?auto_8891 ?auto_8884 ) ) ( not ( = ?auto_8891 ?auto_8889 ) ) ( not ( = ?auto_8891 ?auto_8876 ) ) ( not ( = ?auto_8887 ?auto_8882 ) ) ( not ( = ?auto_8887 ?auto_8896 ) ) ( not ( = ?auto_8887 ?auto_8886 ) ) ( not ( = ?auto_8887 ?auto_8895 ) ) ( not ( = ?auto_8887 ?auto_8873 ) ) ( not ( = ?auto_8885 ?auto_8894 ) ) ( not ( = ?auto_8885 ?auto_8892 ) ) ( not ( = ?auto_8885 ?auto_8880 ) ) ( not ( = ?auto_8885 ?auto_8890 ) ) ( not ( = ?auto_8885 ?auto_8879 ) ) ( not ( = ?auto_8885 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8871 ) ) ( not ( = ?auto_8863 ?auto_8893 ) ) ( not ( = ?auto_8864 ?auto_8871 ) ) ( not ( = ?auto_8864 ?auto_8893 ) ) ( not ( = ?auto_8865 ?auto_8871 ) ) ( not ( = ?auto_8865 ?auto_8893 ) ) ( not ( = ?auto_8866 ?auto_8871 ) ) ( not ( = ?auto_8866 ?auto_8893 ) ) ( not ( = ?auto_8867 ?auto_8871 ) ) ( not ( = ?auto_8867 ?auto_8893 ) ) ( not ( = ?auto_8868 ?auto_8871 ) ) ( not ( = ?auto_8868 ?auto_8893 ) ) ( not ( = ?auto_8869 ?auto_8871 ) ) ( not ( = ?auto_8869 ?auto_8893 ) ) ( not ( = ?auto_8871 ?auto_8885 ) ) ( not ( = ?auto_8871 ?auto_8894 ) ) ( not ( = ?auto_8871 ?auto_8892 ) ) ( not ( = ?auto_8871 ?auto_8880 ) ) ( not ( = ?auto_8871 ?auto_8890 ) ) ( not ( = ?auto_8871 ?auto_8879 ) ) ( not ( = ?auto_8871 ?auto_8888 ) ) ( not ( = ?auto_8893 ?auto_8885 ) ) ( not ( = ?auto_8893 ?auto_8894 ) ) ( not ( = ?auto_8893 ?auto_8892 ) ) ( not ( = ?auto_8893 ?auto_8880 ) ) ( not ( = ?auto_8893 ?auto_8890 ) ) ( not ( = ?auto_8893 ?auto_8879 ) ) ( not ( = ?auto_8893 ?auto_8888 ) ) ( not ( = ?auto_8863 ?auto_8872 ) ) ( not ( = ?auto_8863 ?auto_8874 ) ) ( not ( = ?auto_8864 ?auto_8872 ) ) ( not ( = ?auto_8864 ?auto_8874 ) ) ( not ( = ?auto_8865 ?auto_8872 ) ) ( not ( = ?auto_8865 ?auto_8874 ) ) ( not ( = ?auto_8866 ?auto_8872 ) ) ( not ( = ?auto_8866 ?auto_8874 ) ) ( not ( = ?auto_8867 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8874 ) ) ( not ( = ?auto_8868 ?auto_8872 ) ) ( not ( = ?auto_8868 ?auto_8874 ) ) ( not ( = ?auto_8869 ?auto_8872 ) ) ( not ( = ?auto_8869 ?auto_8874 ) ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8870 ?auto_8874 ) ) ( not ( = ?auto_8872 ?auto_8893 ) ) ( not ( = ?auto_8872 ?auto_8885 ) ) ( not ( = ?auto_8872 ?auto_8894 ) ) ( not ( = ?auto_8872 ?auto_8892 ) ) ( not ( = ?auto_8872 ?auto_8880 ) ) ( not ( = ?auto_8872 ?auto_8890 ) ) ( not ( = ?auto_8872 ?auto_8879 ) ) ( not ( = ?auto_8872 ?auto_8888 ) ) ( not ( = ?auto_8874 ?auto_8893 ) ) ( not ( = ?auto_8874 ?auto_8885 ) ) ( not ( = ?auto_8874 ?auto_8894 ) ) ( not ( = ?auto_8874 ?auto_8892 ) ) ( not ( = ?auto_8874 ?auto_8880 ) ) ( not ( = ?auto_8874 ?auto_8890 ) ) ( not ( = ?auto_8874 ?auto_8879 ) ) ( not ( = ?auto_8874 ?auto_8888 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8863 ?auto_8864 ?auto_8865 ?auto_8866 ?auto_8867 ?auto_8868 ?auto_8869 ?auto_8870 ?auto_8871 )
      ( MAKE-1CRATE ?auto_8871 ?auto_8872 )
      ( MAKE-9CRATE-VERIFY ?auto_8863 ?auto_8864 ?auto_8865 ?auto_8866 ?auto_8867 ?auto_8868 ?auto_8869 ?auto_8870 ?auto_8871 ?auto_8872 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_8918 - SURFACE
      ?auto_8919 - SURFACE
      ?auto_8920 - SURFACE
      ?auto_8921 - SURFACE
      ?auto_8922 - SURFACE
      ?auto_8923 - SURFACE
      ?auto_8924 - SURFACE
      ?auto_8925 - SURFACE
      ?auto_8926 - SURFACE
      ?auto_8927 - SURFACE
      ?auto_8928 - SURFACE
    )
    :vars
    (
      ?auto_8933 - HOIST
      ?auto_8929 - PLACE
      ?auto_8930 - PLACE
      ?auto_8932 - HOIST
      ?auto_8931 - SURFACE
      ?auto_8952 - PLACE
      ?auto_8945 - HOIST
      ?auto_8946 - SURFACE
      ?auto_8943 - PLACE
      ?auto_8950 - HOIST
      ?auto_8937 - SURFACE
      ?auto_8953 - SURFACE
      ?auto_8948 - PLACE
      ?auto_8940 - HOIST
      ?auto_8936 - SURFACE
      ?auto_8951 - PLACE
      ?auto_8938 - HOIST
      ?auto_8935 - SURFACE
      ?auto_8942 - SURFACE
      ?auto_8939 - SURFACE
      ?auto_8947 - PLACE
      ?auto_8944 - HOIST
      ?auto_8941 - SURFACE
      ?auto_8949 - SURFACE
      ?auto_8934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8933 ?auto_8929 ) ( IS-CRATE ?auto_8928 ) ( not ( = ?auto_8930 ?auto_8929 ) ) ( HOIST-AT ?auto_8932 ?auto_8930 ) ( SURFACE-AT ?auto_8928 ?auto_8930 ) ( ON ?auto_8928 ?auto_8931 ) ( CLEAR ?auto_8928 ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( not ( = ?auto_8927 ?auto_8931 ) ) ( not ( = ?auto_8928 ?auto_8931 ) ) ( not ( = ?auto_8933 ?auto_8932 ) ) ( IS-CRATE ?auto_8927 ) ( not ( = ?auto_8952 ?auto_8929 ) ) ( HOIST-AT ?auto_8945 ?auto_8952 ) ( SURFACE-AT ?auto_8927 ?auto_8952 ) ( ON ?auto_8927 ?auto_8946 ) ( CLEAR ?auto_8927 ) ( not ( = ?auto_8926 ?auto_8927 ) ) ( not ( = ?auto_8926 ?auto_8946 ) ) ( not ( = ?auto_8927 ?auto_8946 ) ) ( not ( = ?auto_8933 ?auto_8945 ) ) ( IS-CRATE ?auto_8926 ) ( not ( = ?auto_8943 ?auto_8929 ) ) ( HOIST-AT ?auto_8950 ?auto_8943 ) ( SURFACE-AT ?auto_8926 ?auto_8943 ) ( ON ?auto_8926 ?auto_8937 ) ( CLEAR ?auto_8926 ) ( not ( = ?auto_8925 ?auto_8926 ) ) ( not ( = ?auto_8925 ?auto_8937 ) ) ( not ( = ?auto_8926 ?auto_8937 ) ) ( not ( = ?auto_8933 ?auto_8950 ) ) ( IS-CRATE ?auto_8925 ) ( AVAILABLE ?auto_8950 ) ( SURFACE-AT ?auto_8925 ?auto_8943 ) ( ON ?auto_8925 ?auto_8953 ) ( CLEAR ?auto_8925 ) ( not ( = ?auto_8924 ?auto_8925 ) ) ( not ( = ?auto_8924 ?auto_8953 ) ) ( not ( = ?auto_8925 ?auto_8953 ) ) ( IS-CRATE ?auto_8924 ) ( not ( = ?auto_8948 ?auto_8929 ) ) ( HOIST-AT ?auto_8940 ?auto_8948 ) ( SURFACE-AT ?auto_8924 ?auto_8948 ) ( ON ?auto_8924 ?auto_8936 ) ( CLEAR ?auto_8924 ) ( not ( = ?auto_8923 ?auto_8924 ) ) ( not ( = ?auto_8923 ?auto_8936 ) ) ( not ( = ?auto_8924 ?auto_8936 ) ) ( not ( = ?auto_8933 ?auto_8940 ) ) ( IS-CRATE ?auto_8923 ) ( not ( = ?auto_8951 ?auto_8929 ) ) ( HOIST-AT ?auto_8938 ?auto_8951 ) ( AVAILABLE ?auto_8938 ) ( SURFACE-AT ?auto_8923 ?auto_8951 ) ( ON ?auto_8923 ?auto_8935 ) ( CLEAR ?auto_8923 ) ( not ( = ?auto_8922 ?auto_8923 ) ) ( not ( = ?auto_8922 ?auto_8935 ) ) ( not ( = ?auto_8923 ?auto_8935 ) ) ( not ( = ?auto_8933 ?auto_8938 ) ) ( IS-CRATE ?auto_8922 ) ( AVAILABLE ?auto_8940 ) ( SURFACE-AT ?auto_8922 ?auto_8948 ) ( ON ?auto_8922 ?auto_8942 ) ( CLEAR ?auto_8922 ) ( not ( = ?auto_8921 ?auto_8922 ) ) ( not ( = ?auto_8921 ?auto_8942 ) ) ( not ( = ?auto_8922 ?auto_8942 ) ) ( IS-CRATE ?auto_8921 ) ( AVAILABLE ?auto_8932 ) ( SURFACE-AT ?auto_8921 ?auto_8930 ) ( ON ?auto_8921 ?auto_8939 ) ( CLEAR ?auto_8921 ) ( not ( = ?auto_8920 ?auto_8921 ) ) ( not ( = ?auto_8920 ?auto_8939 ) ) ( not ( = ?auto_8921 ?auto_8939 ) ) ( IS-CRATE ?auto_8920 ) ( not ( = ?auto_8947 ?auto_8929 ) ) ( HOIST-AT ?auto_8944 ?auto_8947 ) ( AVAILABLE ?auto_8944 ) ( SURFACE-AT ?auto_8920 ?auto_8947 ) ( ON ?auto_8920 ?auto_8941 ) ( CLEAR ?auto_8920 ) ( not ( = ?auto_8919 ?auto_8920 ) ) ( not ( = ?auto_8919 ?auto_8941 ) ) ( not ( = ?auto_8920 ?auto_8941 ) ) ( not ( = ?auto_8933 ?auto_8944 ) ) ( SURFACE-AT ?auto_8918 ?auto_8929 ) ( CLEAR ?auto_8918 ) ( IS-CRATE ?auto_8919 ) ( AVAILABLE ?auto_8933 ) ( AVAILABLE ?auto_8945 ) ( SURFACE-AT ?auto_8919 ?auto_8952 ) ( ON ?auto_8919 ?auto_8949 ) ( CLEAR ?auto_8919 ) ( TRUCK-AT ?auto_8934 ?auto_8929 ) ( not ( = ?auto_8918 ?auto_8919 ) ) ( not ( = ?auto_8918 ?auto_8949 ) ) ( not ( = ?auto_8919 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8920 ) ) ( not ( = ?auto_8918 ?auto_8941 ) ) ( not ( = ?auto_8920 ?auto_8949 ) ) ( not ( = ?auto_8947 ?auto_8952 ) ) ( not ( = ?auto_8944 ?auto_8945 ) ) ( not ( = ?auto_8941 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8921 ) ) ( not ( = ?auto_8918 ?auto_8939 ) ) ( not ( = ?auto_8919 ?auto_8921 ) ) ( not ( = ?auto_8919 ?auto_8939 ) ) ( not ( = ?auto_8921 ?auto_8941 ) ) ( not ( = ?auto_8921 ?auto_8949 ) ) ( not ( = ?auto_8930 ?auto_8947 ) ) ( not ( = ?auto_8930 ?auto_8952 ) ) ( not ( = ?auto_8932 ?auto_8944 ) ) ( not ( = ?auto_8932 ?auto_8945 ) ) ( not ( = ?auto_8939 ?auto_8941 ) ) ( not ( = ?auto_8939 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8922 ) ) ( not ( = ?auto_8918 ?auto_8942 ) ) ( not ( = ?auto_8919 ?auto_8922 ) ) ( not ( = ?auto_8919 ?auto_8942 ) ) ( not ( = ?auto_8920 ?auto_8922 ) ) ( not ( = ?auto_8920 ?auto_8942 ) ) ( not ( = ?auto_8922 ?auto_8939 ) ) ( not ( = ?auto_8922 ?auto_8941 ) ) ( not ( = ?auto_8922 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8930 ) ) ( not ( = ?auto_8948 ?auto_8947 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8940 ?auto_8932 ) ) ( not ( = ?auto_8940 ?auto_8944 ) ) ( not ( = ?auto_8940 ?auto_8945 ) ) ( not ( = ?auto_8942 ?auto_8939 ) ) ( not ( = ?auto_8942 ?auto_8941 ) ) ( not ( = ?auto_8942 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8923 ) ) ( not ( = ?auto_8918 ?auto_8935 ) ) ( not ( = ?auto_8919 ?auto_8923 ) ) ( not ( = ?auto_8919 ?auto_8935 ) ) ( not ( = ?auto_8920 ?auto_8923 ) ) ( not ( = ?auto_8920 ?auto_8935 ) ) ( not ( = ?auto_8921 ?auto_8923 ) ) ( not ( = ?auto_8921 ?auto_8935 ) ) ( not ( = ?auto_8923 ?auto_8942 ) ) ( not ( = ?auto_8923 ?auto_8939 ) ) ( not ( = ?auto_8923 ?auto_8941 ) ) ( not ( = ?auto_8923 ?auto_8949 ) ) ( not ( = ?auto_8951 ?auto_8948 ) ) ( not ( = ?auto_8951 ?auto_8930 ) ) ( not ( = ?auto_8951 ?auto_8947 ) ) ( not ( = ?auto_8951 ?auto_8952 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8932 ) ) ( not ( = ?auto_8938 ?auto_8944 ) ) ( not ( = ?auto_8938 ?auto_8945 ) ) ( not ( = ?auto_8935 ?auto_8942 ) ) ( not ( = ?auto_8935 ?auto_8939 ) ) ( not ( = ?auto_8935 ?auto_8941 ) ) ( not ( = ?auto_8935 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8924 ) ) ( not ( = ?auto_8918 ?auto_8936 ) ) ( not ( = ?auto_8919 ?auto_8924 ) ) ( not ( = ?auto_8919 ?auto_8936 ) ) ( not ( = ?auto_8920 ?auto_8924 ) ) ( not ( = ?auto_8920 ?auto_8936 ) ) ( not ( = ?auto_8921 ?auto_8924 ) ) ( not ( = ?auto_8921 ?auto_8936 ) ) ( not ( = ?auto_8922 ?auto_8924 ) ) ( not ( = ?auto_8922 ?auto_8936 ) ) ( not ( = ?auto_8924 ?auto_8935 ) ) ( not ( = ?auto_8924 ?auto_8942 ) ) ( not ( = ?auto_8924 ?auto_8939 ) ) ( not ( = ?auto_8924 ?auto_8941 ) ) ( not ( = ?auto_8924 ?auto_8949 ) ) ( not ( = ?auto_8936 ?auto_8935 ) ) ( not ( = ?auto_8936 ?auto_8942 ) ) ( not ( = ?auto_8936 ?auto_8939 ) ) ( not ( = ?auto_8936 ?auto_8941 ) ) ( not ( = ?auto_8936 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8925 ) ) ( not ( = ?auto_8918 ?auto_8953 ) ) ( not ( = ?auto_8919 ?auto_8925 ) ) ( not ( = ?auto_8919 ?auto_8953 ) ) ( not ( = ?auto_8920 ?auto_8925 ) ) ( not ( = ?auto_8920 ?auto_8953 ) ) ( not ( = ?auto_8921 ?auto_8925 ) ) ( not ( = ?auto_8921 ?auto_8953 ) ) ( not ( = ?auto_8922 ?auto_8925 ) ) ( not ( = ?auto_8922 ?auto_8953 ) ) ( not ( = ?auto_8923 ?auto_8925 ) ) ( not ( = ?auto_8923 ?auto_8953 ) ) ( not ( = ?auto_8925 ?auto_8936 ) ) ( not ( = ?auto_8925 ?auto_8935 ) ) ( not ( = ?auto_8925 ?auto_8942 ) ) ( not ( = ?auto_8925 ?auto_8939 ) ) ( not ( = ?auto_8925 ?auto_8941 ) ) ( not ( = ?auto_8925 ?auto_8949 ) ) ( not ( = ?auto_8943 ?auto_8948 ) ) ( not ( = ?auto_8943 ?auto_8951 ) ) ( not ( = ?auto_8943 ?auto_8930 ) ) ( not ( = ?auto_8943 ?auto_8947 ) ) ( not ( = ?auto_8943 ?auto_8952 ) ) ( not ( = ?auto_8950 ?auto_8940 ) ) ( not ( = ?auto_8950 ?auto_8938 ) ) ( not ( = ?auto_8950 ?auto_8932 ) ) ( not ( = ?auto_8950 ?auto_8944 ) ) ( not ( = ?auto_8950 ?auto_8945 ) ) ( not ( = ?auto_8953 ?auto_8936 ) ) ( not ( = ?auto_8953 ?auto_8935 ) ) ( not ( = ?auto_8953 ?auto_8942 ) ) ( not ( = ?auto_8953 ?auto_8939 ) ) ( not ( = ?auto_8953 ?auto_8941 ) ) ( not ( = ?auto_8953 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8926 ) ) ( not ( = ?auto_8918 ?auto_8937 ) ) ( not ( = ?auto_8919 ?auto_8926 ) ) ( not ( = ?auto_8919 ?auto_8937 ) ) ( not ( = ?auto_8920 ?auto_8926 ) ) ( not ( = ?auto_8920 ?auto_8937 ) ) ( not ( = ?auto_8921 ?auto_8926 ) ) ( not ( = ?auto_8921 ?auto_8937 ) ) ( not ( = ?auto_8922 ?auto_8926 ) ) ( not ( = ?auto_8922 ?auto_8937 ) ) ( not ( = ?auto_8923 ?auto_8926 ) ) ( not ( = ?auto_8923 ?auto_8937 ) ) ( not ( = ?auto_8924 ?auto_8926 ) ) ( not ( = ?auto_8924 ?auto_8937 ) ) ( not ( = ?auto_8926 ?auto_8953 ) ) ( not ( = ?auto_8926 ?auto_8936 ) ) ( not ( = ?auto_8926 ?auto_8935 ) ) ( not ( = ?auto_8926 ?auto_8942 ) ) ( not ( = ?auto_8926 ?auto_8939 ) ) ( not ( = ?auto_8926 ?auto_8941 ) ) ( not ( = ?auto_8926 ?auto_8949 ) ) ( not ( = ?auto_8937 ?auto_8953 ) ) ( not ( = ?auto_8937 ?auto_8936 ) ) ( not ( = ?auto_8937 ?auto_8935 ) ) ( not ( = ?auto_8937 ?auto_8942 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8937 ?auto_8941 ) ) ( not ( = ?auto_8937 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8927 ) ) ( not ( = ?auto_8918 ?auto_8946 ) ) ( not ( = ?auto_8919 ?auto_8927 ) ) ( not ( = ?auto_8919 ?auto_8946 ) ) ( not ( = ?auto_8920 ?auto_8927 ) ) ( not ( = ?auto_8920 ?auto_8946 ) ) ( not ( = ?auto_8921 ?auto_8927 ) ) ( not ( = ?auto_8921 ?auto_8946 ) ) ( not ( = ?auto_8922 ?auto_8927 ) ) ( not ( = ?auto_8922 ?auto_8946 ) ) ( not ( = ?auto_8923 ?auto_8927 ) ) ( not ( = ?auto_8923 ?auto_8946 ) ) ( not ( = ?auto_8924 ?auto_8927 ) ) ( not ( = ?auto_8924 ?auto_8946 ) ) ( not ( = ?auto_8925 ?auto_8927 ) ) ( not ( = ?auto_8925 ?auto_8946 ) ) ( not ( = ?auto_8927 ?auto_8937 ) ) ( not ( = ?auto_8927 ?auto_8953 ) ) ( not ( = ?auto_8927 ?auto_8936 ) ) ( not ( = ?auto_8927 ?auto_8935 ) ) ( not ( = ?auto_8927 ?auto_8942 ) ) ( not ( = ?auto_8927 ?auto_8939 ) ) ( not ( = ?auto_8927 ?auto_8941 ) ) ( not ( = ?auto_8927 ?auto_8949 ) ) ( not ( = ?auto_8946 ?auto_8937 ) ) ( not ( = ?auto_8946 ?auto_8953 ) ) ( not ( = ?auto_8946 ?auto_8936 ) ) ( not ( = ?auto_8946 ?auto_8935 ) ) ( not ( = ?auto_8946 ?auto_8942 ) ) ( not ( = ?auto_8946 ?auto_8939 ) ) ( not ( = ?auto_8946 ?auto_8941 ) ) ( not ( = ?auto_8946 ?auto_8949 ) ) ( not ( = ?auto_8918 ?auto_8928 ) ) ( not ( = ?auto_8918 ?auto_8931 ) ) ( not ( = ?auto_8919 ?auto_8928 ) ) ( not ( = ?auto_8919 ?auto_8931 ) ) ( not ( = ?auto_8920 ?auto_8928 ) ) ( not ( = ?auto_8920 ?auto_8931 ) ) ( not ( = ?auto_8921 ?auto_8928 ) ) ( not ( = ?auto_8921 ?auto_8931 ) ) ( not ( = ?auto_8922 ?auto_8928 ) ) ( not ( = ?auto_8922 ?auto_8931 ) ) ( not ( = ?auto_8923 ?auto_8928 ) ) ( not ( = ?auto_8923 ?auto_8931 ) ) ( not ( = ?auto_8924 ?auto_8928 ) ) ( not ( = ?auto_8924 ?auto_8931 ) ) ( not ( = ?auto_8925 ?auto_8928 ) ) ( not ( = ?auto_8925 ?auto_8931 ) ) ( not ( = ?auto_8926 ?auto_8928 ) ) ( not ( = ?auto_8926 ?auto_8931 ) ) ( not ( = ?auto_8928 ?auto_8946 ) ) ( not ( = ?auto_8928 ?auto_8937 ) ) ( not ( = ?auto_8928 ?auto_8953 ) ) ( not ( = ?auto_8928 ?auto_8936 ) ) ( not ( = ?auto_8928 ?auto_8935 ) ) ( not ( = ?auto_8928 ?auto_8942 ) ) ( not ( = ?auto_8928 ?auto_8939 ) ) ( not ( = ?auto_8928 ?auto_8941 ) ) ( not ( = ?auto_8928 ?auto_8949 ) ) ( not ( = ?auto_8931 ?auto_8946 ) ) ( not ( = ?auto_8931 ?auto_8937 ) ) ( not ( = ?auto_8931 ?auto_8953 ) ) ( not ( = ?auto_8931 ?auto_8936 ) ) ( not ( = ?auto_8931 ?auto_8935 ) ) ( not ( = ?auto_8931 ?auto_8942 ) ) ( not ( = ?auto_8931 ?auto_8939 ) ) ( not ( = ?auto_8931 ?auto_8941 ) ) ( not ( = ?auto_8931 ?auto_8949 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8918 ?auto_8919 ?auto_8920 ?auto_8921 ?auto_8922 ?auto_8923 ?auto_8924 ?auto_8925 ?auto_8926 ?auto_8927 )
      ( MAKE-1CRATE ?auto_8927 ?auto_8928 )
      ( MAKE-10CRATE-VERIFY ?auto_8918 ?auto_8919 ?auto_8920 ?auto_8921 ?auto_8922 ?auto_8923 ?auto_8924 ?auto_8925 ?auto_8926 ?auto_8927 ?auto_8928 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_8976 - SURFACE
      ?auto_8977 - SURFACE
      ?auto_8978 - SURFACE
      ?auto_8979 - SURFACE
      ?auto_8980 - SURFACE
      ?auto_8981 - SURFACE
      ?auto_8982 - SURFACE
      ?auto_8983 - SURFACE
      ?auto_8984 - SURFACE
      ?auto_8985 - SURFACE
      ?auto_8986 - SURFACE
      ?auto_8987 - SURFACE
    )
    :vars
    (
      ?auto_8993 - HOIST
      ?auto_8989 - PLACE
      ?auto_8991 - PLACE
      ?auto_8992 - HOIST
      ?auto_8990 - SURFACE
      ?auto_9015 - PLACE
      ?auto_9005 - HOIST
      ?auto_9004 - SURFACE
      ?auto_9006 - PLACE
      ?auto_9009 - HOIST
      ?auto_8998 - SURFACE
      ?auto_8995 - PLACE
      ?auto_9014 - HOIST
      ?auto_9003 - SURFACE
      ?auto_8996 - SURFACE
      ?auto_9013 - PLACE
      ?auto_9011 - HOIST
      ?auto_8994 - SURFACE
      ?auto_9001 - PLACE
      ?auto_9002 - HOIST
      ?auto_9010 - SURFACE
      ?auto_8997 - SURFACE
      ?auto_9008 - SURFACE
      ?auto_9000 - PLACE
      ?auto_9012 - HOIST
      ?auto_8999 - SURFACE
      ?auto_9007 - SURFACE
      ?auto_8988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8993 ?auto_8989 ) ( IS-CRATE ?auto_8987 ) ( not ( = ?auto_8991 ?auto_8989 ) ) ( HOIST-AT ?auto_8992 ?auto_8991 ) ( AVAILABLE ?auto_8992 ) ( SURFACE-AT ?auto_8987 ?auto_8991 ) ( ON ?auto_8987 ?auto_8990 ) ( CLEAR ?auto_8987 ) ( not ( = ?auto_8986 ?auto_8987 ) ) ( not ( = ?auto_8986 ?auto_8990 ) ) ( not ( = ?auto_8987 ?auto_8990 ) ) ( not ( = ?auto_8993 ?auto_8992 ) ) ( IS-CRATE ?auto_8986 ) ( not ( = ?auto_9015 ?auto_8989 ) ) ( HOIST-AT ?auto_9005 ?auto_9015 ) ( SURFACE-AT ?auto_8986 ?auto_9015 ) ( ON ?auto_8986 ?auto_9004 ) ( CLEAR ?auto_8986 ) ( not ( = ?auto_8985 ?auto_8986 ) ) ( not ( = ?auto_8985 ?auto_9004 ) ) ( not ( = ?auto_8986 ?auto_9004 ) ) ( not ( = ?auto_8993 ?auto_9005 ) ) ( IS-CRATE ?auto_8985 ) ( not ( = ?auto_9006 ?auto_8989 ) ) ( HOIST-AT ?auto_9009 ?auto_9006 ) ( SURFACE-AT ?auto_8985 ?auto_9006 ) ( ON ?auto_8985 ?auto_8998 ) ( CLEAR ?auto_8985 ) ( not ( = ?auto_8984 ?auto_8985 ) ) ( not ( = ?auto_8984 ?auto_8998 ) ) ( not ( = ?auto_8985 ?auto_8998 ) ) ( not ( = ?auto_8993 ?auto_9009 ) ) ( IS-CRATE ?auto_8984 ) ( not ( = ?auto_8995 ?auto_8989 ) ) ( HOIST-AT ?auto_9014 ?auto_8995 ) ( SURFACE-AT ?auto_8984 ?auto_8995 ) ( ON ?auto_8984 ?auto_9003 ) ( CLEAR ?auto_8984 ) ( not ( = ?auto_8983 ?auto_8984 ) ) ( not ( = ?auto_8983 ?auto_9003 ) ) ( not ( = ?auto_8984 ?auto_9003 ) ) ( not ( = ?auto_8993 ?auto_9014 ) ) ( IS-CRATE ?auto_8983 ) ( AVAILABLE ?auto_9014 ) ( SURFACE-AT ?auto_8983 ?auto_8995 ) ( ON ?auto_8983 ?auto_8996 ) ( CLEAR ?auto_8983 ) ( not ( = ?auto_8982 ?auto_8983 ) ) ( not ( = ?auto_8982 ?auto_8996 ) ) ( not ( = ?auto_8983 ?auto_8996 ) ) ( IS-CRATE ?auto_8982 ) ( not ( = ?auto_9013 ?auto_8989 ) ) ( HOIST-AT ?auto_9011 ?auto_9013 ) ( SURFACE-AT ?auto_8982 ?auto_9013 ) ( ON ?auto_8982 ?auto_8994 ) ( CLEAR ?auto_8982 ) ( not ( = ?auto_8981 ?auto_8982 ) ) ( not ( = ?auto_8981 ?auto_8994 ) ) ( not ( = ?auto_8982 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_9011 ) ) ( IS-CRATE ?auto_8981 ) ( not ( = ?auto_9001 ?auto_8989 ) ) ( HOIST-AT ?auto_9002 ?auto_9001 ) ( AVAILABLE ?auto_9002 ) ( SURFACE-AT ?auto_8981 ?auto_9001 ) ( ON ?auto_8981 ?auto_9010 ) ( CLEAR ?auto_8981 ) ( not ( = ?auto_8980 ?auto_8981 ) ) ( not ( = ?auto_8980 ?auto_9010 ) ) ( not ( = ?auto_8981 ?auto_9010 ) ) ( not ( = ?auto_8993 ?auto_9002 ) ) ( IS-CRATE ?auto_8980 ) ( AVAILABLE ?auto_9011 ) ( SURFACE-AT ?auto_8980 ?auto_9013 ) ( ON ?auto_8980 ?auto_8997 ) ( CLEAR ?auto_8980 ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_8997 ) ) ( not ( = ?auto_8980 ?auto_8997 ) ) ( IS-CRATE ?auto_8979 ) ( AVAILABLE ?auto_9005 ) ( SURFACE-AT ?auto_8979 ?auto_9015 ) ( ON ?auto_8979 ?auto_9008 ) ( CLEAR ?auto_8979 ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_9008 ) ) ( not ( = ?auto_8979 ?auto_9008 ) ) ( IS-CRATE ?auto_8978 ) ( not ( = ?auto_9000 ?auto_8989 ) ) ( HOIST-AT ?auto_9012 ?auto_9000 ) ( AVAILABLE ?auto_9012 ) ( SURFACE-AT ?auto_8978 ?auto_9000 ) ( ON ?auto_8978 ?auto_8999 ) ( CLEAR ?auto_8978 ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8977 ?auto_8999 ) ) ( not ( = ?auto_8978 ?auto_8999 ) ) ( not ( = ?auto_8993 ?auto_9012 ) ) ( SURFACE-AT ?auto_8976 ?auto_8989 ) ( CLEAR ?auto_8976 ) ( IS-CRATE ?auto_8977 ) ( AVAILABLE ?auto_8993 ) ( AVAILABLE ?auto_9009 ) ( SURFACE-AT ?auto_8977 ?auto_9006 ) ( ON ?auto_8977 ?auto_9007 ) ( CLEAR ?auto_8977 ) ( TRUCK-AT ?auto_8988 ?auto_8989 ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( not ( = ?auto_8976 ?auto_9007 ) ) ( not ( = ?auto_8977 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8978 ) ) ( not ( = ?auto_8976 ?auto_8999 ) ) ( not ( = ?auto_8978 ?auto_9007 ) ) ( not ( = ?auto_9000 ?auto_9006 ) ) ( not ( = ?auto_9012 ?auto_9009 ) ) ( not ( = ?auto_8999 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8979 ) ) ( not ( = ?auto_8976 ?auto_9008 ) ) ( not ( = ?auto_8977 ?auto_8979 ) ) ( not ( = ?auto_8977 ?auto_9008 ) ) ( not ( = ?auto_8979 ?auto_8999 ) ) ( not ( = ?auto_8979 ?auto_9007 ) ) ( not ( = ?auto_9015 ?auto_9000 ) ) ( not ( = ?auto_9015 ?auto_9006 ) ) ( not ( = ?auto_9005 ?auto_9012 ) ) ( not ( = ?auto_9005 ?auto_9009 ) ) ( not ( = ?auto_9008 ?auto_8999 ) ) ( not ( = ?auto_9008 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8980 ) ) ( not ( = ?auto_8976 ?auto_8997 ) ) ( not ( = ?auto_8977 ?auto_8980 ) ) ( not ( = ?auto_8977 ?auto_8997 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( not ( = ?auto_8978 ?auto_8997 ) ) ( not ( = ?auto_8980 ?auto_9008 ) ) ( not ( = ?auto_8980 ?auto_8999 ) ) ( not ( = ?auto_8980 ?auto_9007 ) ) ( not ( = ?auto_9013 ?auto_9015 ) ) ( not ( = ?auto_9013 ?auto_9000 ) ) ( not ( = ?auto_9013 ?auto_9006 ) ) ( not ( = ?auto_9011 ?auto_9005 ) ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9009 ) ) ( not ( = ?auto_8997 ?auto_9008 ) ) ( not ( = ?auto_8997 ?auto_8999 ) ) ( not ( = ?auto_8997 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8981 ) ) ( not ( = ?auto_8976 ?auto_9010 ) ) ( not ( = ?auto_8977 ?auto_8981 ) ) ( not ( = ?auto_8977 ?auto_9010 ) ) ( not ( = ?auto_8978 ?auto_8981 ) ) ( not ( = ?auto_8978 ?auto_9010 ) ) ( not ( = ?auto_8979 ?auto_8981 ) ) ( not ( = ?auto_8979 ?auto_9010 ) ) ( not ( = ?auto_8981 ?auto_8997 ) ) ( not ( = ?auto_8981 ?auto_9008 ) ) ( not ( = ?auto_8981 ?auto_8999 ) ) ( not ( = ?auto_8981 ?auto_9007 ) ) ( not ( = ?auto_9001 ?auto_9013 ) ) ( not ( = ?auto_9001 ?auto_9015 ) ) ( not ( = ?auto_9001 ?auto_9000 ) ) ( not ( = ?auto_9001 ?auto_9006 ) ) ( not ( = ?auto_9002 ?auto_9011 ) ) ( not ( = ?auto_9002 ?auto_9005 ) ) ( not ( = ?auto_9002 ?auto_9012 ) ) ( not ( = ?auto_9002 ?auto_9009 ) ) ( not ( = ?auto_9010 ?auto_8997 ) ) ( not ( = ?auto_9010 ?auto_9008 ) ) ( not ( = ?auto_9010 ?auto_8999 ) ) ( not ( = ?auto_9010 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8982 ) ) ( not ( = ?auto_8976 ?auto_8994 ) ) ( not ( = ?auto_8977 ?auto_8982 ) ) ( not ( = ?auto_8977 ?auto_8994 ) ) ( not ( = ?auto_8978 ?auto_8982 ) ) ( not ( = ?auto_8978 ?auto_8994 ) ) ( not ( = ?auto_8979 ?auto_8982 ) ) ( not ( = ?auto_8979 ?auto_8994 ) ) ( not ( = ?auto_8980 ?auto_8982 ) ) ( not ( = ?auto_8980 ?auto_8994 ) ) ( not ( = ?auto_8982 ?auto_9010 ) ) ( not ( = ?auto_8982 ?auto_8997 ) ) ( not ( = ?auto_8982 ?auto_9008 ) ) ( not ( = ?auto_8982 ?auto_8999 ) ) ( not ( = ?auto_8982 ?auto_9007 ) ) ( not ( = ?auto_8994 ?auto_9010 ) ) ( not ( = ?auto_8994 ?auto_8997 ) ) ( not ( = ?auto_8994 ?auto_9008 ) ) ( not ( = ?auto_8994 ?auto_8999 ) ) ( not ( = ?auto_8994 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8983 ) ) ( not ( = ?auto_8976 ?auto_8996 ) ) ( not ( = ?auto_8977 ?auto_8983 ) ) ( not ( = ?auto_8977 ?auto_8996 ) ) ( not ( = ?auto_8978 ?auto_8983 ) ) ( not ( = ?auto_8978 ?auto_8996 ) ) ( not ( = ?auto_8979 ?auto_8983 ) ) ( not ( = ?auto_8979 ?auto_8996 ) ) ( not ( = ?auto_8980 ?auto_8983 ) ) ( not ( = ?auto_8980 ?auto_8996 ) ) ( not ( = ?auto_8981 ?auto_8983 ) ) ( not ( = ?auto_8981 ?auto_8996 ) ) ( not ( = ?auto_8983 ?auto_8994 ) ) ( not ( = ?auto_8983 ?auto_9010 ) ) ( not ( = ?auto_8983 ?auto_8997 ) ) ( not ( = ?auto_8983 ?auto_9008 ) ) ( not ( = ?auto_8983 ?auto_8999 ) ) ( not ( = ?auto_8983 ?auto_9007 ) ) ( not ( = ?auto_8995 ?auto_9013 ) ) ( not ( = ?auto_8995 ?auto_9001 ) ) ( not ( = ?auto_8995 ?auto_9015 ) ) ( not ( = ?auto_8995 ?auto_9000 ) ) ( not ( = ?auto_8995 ?auto_9006 ) ) ( not ( = ?auto_9014 ?auto_9011 ) ) ( not ( = ?auto_9014 ?auto_9002 ) ) ( not ( = ?auto_9014 ?auto_9005 ) ) ( not ( = ?auto_9014 ?auto_9012 ) ) ( not ( = ?auto_9014 ?auto_9009 ) ) ( not ( = ?auto_8996 ?auto_8994 ) ) ( not ( = ?auto_8996 ?auto_9010 ) ) ( not ( = ?auto_8996 ?auto_8997 ) ) ( not ( = ?auto_8996 ?auto_9008 ) ) ( not ( = ?auto_8996 ?auto_8999 ) ) ( not ( = ?auto_8996 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8984 ) ) ( not ( = ?auto_8976 ?auto_9003 ) ) ( not ( = ?auto_8977 ?auto_8984 ) ) ( not ( = ?auto_8977 ?auto_9003 ) ) ( not ( = ?auto_8978 ?auto_8984 ) ) ( not ( = ?auto_8978 ?auto_9003 ) ) ( not ( = ?auto_8979 ?auto_8984 ) ) ( not ( = ?auto_8979 ?auto_9003 ) ) ( not ( = ?auto_8980 ?auto_8984 ) ) ( not ( = ?auto_8980 ?auto_9003 ) ) ( not ( = ?auto_8981 ?auto_8984 ) ) ( not ( = ?auto_8981 ?auto_9003 ) ) ( not ( = ?auto_8982 ?auto_8984 ) ) ( not ( = ?auto_8982 ?auto_9003 ) ) ( not ( = ?auto_8984 ?auto_8996 ) ) ( not ( = ?auto_8984 ?auto_8994 ) ) ( not ( = ?auto_8984 ?auto_9010 ) ) ( not ( = ?auto_8984 ?auto_8997 ) ) ( not ( = ?auto_8984 ?auto_9008 ) ) ( not ( = ?auto_8984 ?auto_8999 ) ) ( not ( = ?auto_8984 ?auto_9007 ) ) ( not ( = ?auto_9003 ?auto_8996 ) ) ( not ( = ?auto_9003 ?auto_8994 ) ) ( not ( = ?auto_9003 ?auto_9010 ) ) ( not ( = ?auto_9003 ?auto_8997 ) ) ( not ( = ?auto_9003 ?auto_9008 ) ) ( not ( = ?auto_9003 ?auto_8999 ) ) ( not ( = ?auto_9003 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8985 ) ) ( not ( = ?auto_8976 ?auto_8998 ) ) ( not ( = ?auto_8977 ?auto_8985 ) ) ( not ( = ?auto_8977 ?auto_8998 ) ) ( not ( = ?auto_8978 ?auto_8985 ) ) ( not ( = ?auto_8978 ?auto_8998 ) ) ( not ( = ?auto_8979 ?auto_8985 ) ) ( not ( = ?auto_8979 ?auto_8998 ) ) ( not ( = ?auto_8980 ?auto_8985 ) ) ( not ( = ?auto_8980 ?auto_8998 ) ) ( not ( = ?auto_8981 ?auto_8985 ) ) ( not ( = ?auto_8981 ?auto_8998 ) ) ( not ( = ?auto_8982 ?auto_8985 ) ) ( not ( = ?auto_8982 ?auto_8998 ) ) ( not ( = ?auto_8983 ?auto_8985 ) ) ( not ( = ?auto_8983 ?auto_8998 ) ) ( not ( = ?auto_8985 ?auto_9003 ) ) ( not ( = ?auto_8985 ?auto_8996 ) ) ( not ( = ?auto_8985 ?auto_8994 ) ) ( not ( = ?auto_8985 ?auto_9010 ) ) ( not ( = ?auto_8985 ?auto_8997 ) ) ( not ( = ?auto_8985 ?auto_9008 ) ) ( not ( = ?auto_8985 ?auto_8999 ) ) ( not ( = ?auto_8985 ?auto_9007 ) ) ( not ( = ?auto_8998 ?auto_9003 ) ) ( not ( = ?auto_8998 ?auto_8996 ) ) ( not ( = ?auto_8998 ?auto_8994 ) ) ( not ( = ?auto_8998 ?auto_9010 ) ) ( not ( = ?auto_8998 ?auto_8997 ) ) ( not ( = ?auto_8998 ?auto_9008 ) ) ( not ( = ?auto_8998 ?auto_8999 ) ) ( not ( = ?auto_8998 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8986 ) ) ( not ( = ?auto_8976 ?auto_9004 ) ) ( not ( = ?auto_8977 ?auto_8986 ) ) ( not ( = ?auto_8977 ?auto_9004 ) ) ( not ( = ?auto_8978 ?auto_8986 ) ) ( not ( = ?auto_8978 ?auto_9004 ) ) ( not ( = ?auto_8979 ?auto_8986 ) ) ( not ( = ?auto_8979 ?auto_9004 ) ) ( not ( = ?auto_8980 ?auto_8986 ) ) ( not ( = ?auto_8980 ?auto_9004 ) ) ( not ( = ?auto_8981 ?auto_8986 ) ) ( not ( = ?auto_8981 ?auto_9004 ) ) ( not ( = ?auto_8982 ?auto_8986 ) ) ( not ( = ?auto_8982 ?auto_9004 ) ) ( not ( = ?auto_8983 ?auto_8986 ) ) ( not ( = ?auto_8983 ?auto_9004 ) ) ( not ( = ?auto_8984 ?auto_8986 ) ) ( not ( = ?auto_8984 ?auto_9004 ) ) ( not ( = ?auto_8986 ?auto_8998 ) ) ( not ( = ?auto_8986 ?auto_9003 ) ) ( not ( = ?auto_8986 ?auto_8996 ) ) ( not ( = ?auto_8986 ?auto_8994 ) ) ( not ( = ?auto_8986 ?auto_9010 ) ) ( not ( = ?auto_8986 ?auto_8997 ) ) ( not ( = ?auto_8986 ?auto_9008 ) ) ( not ( = ?auto_8986 ?auto_8999 ) ) ( not ( = ?auto_8986 ?auto_9007 ) ) ( not ( = ?auto_9004 ?auto_8998 ) ) ( not ( = ?auto_9004 ?auto_9003 ) ) ( not ( = ?auto_9004 ?auto_8996 ) ) ( not ( = ?auto_9004 ?auto_8994 ) ) ( not ( = ?auto_9004 ?auto_9010 ) ) ( not ( = ?auto_9004 ?auto_8997 ) ) ( not ( = ?auto_9004 ?auto_9008 ) ) ( not ( = ?auto_9004 ?auto_8999 ) ) ( not ( = ?auto_9004 ?auto_9007 ) ) ( not ( = ?auto_8976 ?auto_8987 ) ) ( not ( = ?auto_8976 ?auto_8990 ) ) ( not ( = ?auto_8977 ?auto_8987 ) ) ( not ( = ?auto_8977 ?auto_8990 ) ) ( not ( = ?auto_8978 ?auto_8987 ) ) ( not ( = ?auto_8978 ?auto_8990 ) ) ( not ( = ?auto_8979 ?auto_8987 ) ) ( not ( = ?auto_8979 ?auto_8990 ) ) ( not ( = ?auto_8980 ?auto_8987 ) ) ( not ( = ?auto_8980 ?auto_8990 ) ) ( not ( = ?auto_8981 ?auto_8987 ) ) ( not ( = ?auto_8981 ?auto_8990 ) ) ( not ( = ?auto_8982 ?auto_8987 ) ) ( not ( = ?auto_8982 ?auto_8990 ) ) ( not ( = ?auto_8983 ?auto_8987 ) ) ( not ( = ?auto_8983 ?auto_8990 ) ) ( not ( = ?auto_8984 ?auto_8987 ) ) ( not ( = ?auto_8984 ?auto_8990 ) ) ( not ( = ?auto_8985 ?auto_8987 ) ) ( not ( = ?auto_8985 ?auto_8990 ) ) ( not ( = ?auto_8987 ?auto_9004 ) ) ( not ( = ?auto_8987 ?auto_8998 ) ) ( not ( = ?auto_8987 ?auto_9003 ) ) ( not ( = ?auto_8987 ?auto_8996 ) ) ( not ( = ?auto_8987 ?auto_8994 ) ) ( not ( = ?auto_8987 ?auto_9010 ) ) ( not ( = ?auto_8987 ?auto_8997 ) ) ( not ( = ?auto_8987 ?auto_9008 ) ) ( not ( = ?auto_8987 ?auto_8999 ) ) ( not ( = ?auto_8987 ?auto_9007 ) ) ( not ( = ?auto_8991 ?auto_9015 ) ) ( not ( = ?auto_8991 ?auto_9006 ) ) ( not ( = ?auto_8991 ?auto_8995 ) ) ( not ( = ?auto_8991 ?auto_9013 ) ) ( not ( = ?auto_8991 ?auto_9001 ) ) ( not ( = ?auto_8991 ?auto_9000 ) ) ( not ( = ?auto_8992 ?auto_9005 ) ) ( not ( = ?auto_8992 ?auto_9009 ) ) ( not ( = ?auto_8992 ?auto_9014 ) ) ( not ( = ?auto_8992 ?auto_9011 ) ) ( not ( = ?auto_8992 ?auto_9002 ) ) ( not ( = ?auto_8992 ?auto_9012 ) ) ( not ( = ?auto_8990 ?auto_9004 ) ) ( not ( = ?auto_8990 ?auto_8998 ) ) ( not ( = ?auto_8990 ?auto_9003 ) ) ( not ( = ?auto_8990 ?auto_8996 ) ) ( not ( = ?auto_8990 ?auto_8994 ) ) ( not ( = ?auto_8990 ?auto_9010 ) ) ( not ( = ?auto_8990 ?auto_8997 ) ) ( not ( = ?auto_8990 ?auto_9008 ) ) ( not ( = ?auto_8990 ?auto_8999 ) ) ( not ( = ?auto_8990 ?auto_9007 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_8976 ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8980 ?auto_8981 ?auto_8982 ?auto_8983 ?auto_8984 ?auto_8985 ?auto_8986 )
      ( MAKE-1CRATE ?auto_8986 ?auto_8987 )
      ( MAKE-11CRATE-VERIFY ?auto_8976 ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8980 ?auto_8981 ?auto_8982 ?auto_8983 ?auto_8984 ?auto_8985 ?auto_8986 ?auto_8987 ) )
  )

)

