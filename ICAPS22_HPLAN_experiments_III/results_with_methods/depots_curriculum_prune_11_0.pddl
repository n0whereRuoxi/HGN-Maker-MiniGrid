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
      ?auto_8590 - HOIST
      ?auto_8591 - PLACE
      ?auto_8592 - PLACE
      ?auto_8587 - HOIST
      ?auto_8588 - SURFACE
      ?auto_8593 - PLACE
      ?auto_8594 - HOIST
      ?auto_8595 - SURFACE
      ?auto_8589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8590 ?auto_8591 ) ( IS-CRATE ?auto_8586 ) ( not ( = ?auto_8592 ?auto_8591 ) ) ( HOIST-AT ?auto_8587 ?auto_8592 ) ( AVAILABLE ?auto_8587 ) ( SURFACE-AT ?auto_8586 ?auto_8592 ) ( ON ?auto_8586 ?auto_8588 ) ( CLEAR ?auto_8586 ) ( not ( = ?auto_8585 ?auto_8586 ) ) ( not ( = ?auto_8585 ?auto_8588 ) ) ( not ( = ?auto_8586 ?auto_8588 ) ) ( not ( = ?auto_8590 ?auto_8587 ) ) ( SURFACE-AT ?auto_8584 ?auto_8591 ) ( CLEAR ?auto_8584 ) ( IS-CRATE ?auto_8585 ) ( AVAILABLE ?auto_8590 ) ( not ( = ?auto_8593 ?auto_8591 ) ) ( HOIST-AT ?auto_8594 ?auto_8593 ) ( AVAILABLE ?auto_8594 ) ( SURFACE-AT ?auto_8585 ?auto_8593 ) ( ON ?auto_8585 ?auto_8595 ) ( CLEAR ?auto_8585 ) ( TRUCK-AT ?auto_8589 ?auto_8591 ) ( not ( = ?auto_8584 ?auto_8585 ) ) ( not ( = ?auto_8584 ?auto_8595 ) ) ( not ( = ?auto_8585 ?auto_8595 ) ) ( not ( = ?auto_8590 ?auto_8594 ) ) ( not ( = ?auto_8584 ?auto_8586 ) ) ( not ( = ?auto_8584 ?auto_8588 ) ) ( not ( = ?auto_8586 ?auto_8595 ) ) ( not ( = ?auto_8592 ?auto_8593 ) ) ( not ( = ?auto_8587 ?auto_8594 ) ) ( not ( = ?auto_8588 ?auto_8595 ) ) )
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
      ?auto_8618 - HOIST
      ?auto_8615 - PLACE
      ?auto_8616 - PLACE
      ?auto_8614 - HOIST
      ?auto_8619 - SURFACE
      ?auto_8623 - PLACE
      ?auto_8625 - HOIST
      ?auto_8624 - SURFACE
      ?auto_8620 - PLACE
      ?auto_8621 - HOIST
      ?auto_8622 - SURFACE
      ?auto_8617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8618 ?auto_8615 ) ( IS-CRATE ?auto_8613 ) ( not ( = ?auto_8616 ?auto_8615 ) ) ( HOIST-AT ?auto_8614 ?auto_8616 ) ( AVAILABLE ?auto_8614 ) ( SURFACE-AT ?auto_8613 ?auto_8616 ) ( ON ?auto_8613 ?auto_8619 ) ( CLEAR ?auto_8613 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8619 ) ) ( not ( = ?auto_8613 ?auto_8619 ) ) ( not ( = ?auto_8618 ?auto_8614 ) ) ( IS-CRATE ?auto_8612 ) ( not ( = ?auto_8623 ?auto_8615 ) ) ( HOIST-AT ?auto_8625 ?auto_8623 ) ( AVAILABLE ?auto_8625 ) ( SURFACE-AT ?auto_8612 ?auto_8623 ) ( ON ?auto_8612 ?auto_8624 ) ( CLEAR ?auto_8612 ) ( not ( = ?auto_8611 ?auto_8612 ) ) ( not ( = ?auto_8611 ?auto_8624 ) ) ( not ( = ?auto_8612 ?auto_8624 ) ) ( not ( = ?auto_8618 ?auto_8625 ) ) ( SURFACE-AT ?auto_8610 ?auto_8615 ) ( CLEAR ?auto_8610 ) ( IS-CRATE ?auto_8611 ) ( AVAILABLE ?auto_8618 ) ( not ( = ?auto_8620 ?auto_8615 ) ) ( HOIST-AT ?auto_8621 ?auto_8620 ) ( AVAILABLE ?auto_8621 ) ( SURFACE-AT ?auto_8611 ?auto_8620 ) ( ON ?auto_8611 ?auto_8622 ) ( CLEAR ?auto_8611 ) ( TRUCK-AT ?auto_8617 ?auto_8615 ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8622 ) ) ( not ( = ?auto_8611 ?auto_8622 ) ) ( not ( = ?auto_8618 ?auto_8621 ) ) ( not ( = ?auto_8610 ?auto_8612 ) ) ( not ( = ?auto_8610 ?auto_8624 ) ) ( not ( = ?auto_8612 ?auto_8622 ) ) ( not ( = ?auto_8623 ?auto_8620 ) ) ( not ( = ?auto_8625 ?auto_8621 ) ) ( not ( = ?auto_8624 ?auto_8622 ) ) ( not ( = ?auto_8610 ?auto_8613 ) ) ( not ( = ?auto_8610 ?auto_8619 ) ) ( not ( = ?auto_8611 ?auto_8613 ) ) ( not ( = ?auto_8611 ?auto_8619 ) ) ( not ( = ?auto_8613 ?auto_8624 ) ) ( not ( = ?auto_8613 ?auto_8622 ) ) ( not ( = ?auto_8616 ?auto_8623 ) ) ( not ( = ?auto_8616 ?auto_8620 ) ) ( not ( = ?auto_8614 ?auto_8625 ) ) ( not ( = ?auto_8614 ?auto_8621 ) ) ( not ( = ?auto_8619 ?auto_8624 ) ) ( not ( = ?auto_8619 ?auto_8622 ) ) )
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
      ?auto_8648 - HOIST
      ?auto_8646 - PLACE
      ?auto_8649 - PLACE
      ?auto_8647 - HOIST
      ?auto_8650 - SURFACE
      ?auto_8660 - PLACE
      ?auto_8658 - HOIST
      ?auto_8655 - SURFACE
      ?auto_8654 - PLACE
      ?auto_8657 - HOIST
      ?auto_8653 - SURFACE
      ?auto_8659 - PLACE
      ?auto_8656 - HOIST
      ?auto_8652 - SURFACE
      ?auto_8651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8648 ?auto_8646 ) ( IS-CRATE ?auto_8645 ) ( not ( = ?auto_8649 ?auto_8646 ) ) ( HOIST-AT ?auto_8647 ?auto_8649 ) ( AVAILABLE ?auto_8647 ) ( SURFACE-AT ?auto_8645 ?auto_8649 ) ( ON ?auto_8645 ?auto_8650 ) ( CLEAR ?auto_8645 ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8650 ) ) ( not ( = ?auto_8645 ?auto_8650 ) ) ( not ( = ?auto_8648 ?auto_8647 ) ) ( IS-CRATE ?auto_8644 ) ( not ( = ?auto_8660 ?auto_8646 ) ) ( HOIST-AT ?auto_8658 ?auto_8660 ) ( AVAILABLE ?auto_8658 ) ( SURFACE-AT ?auto_8644 ?auto_8660 ) ( ON ?auto_8644 ?auto_8655 ) ( CLEAR ?auto_8644 ) ( not ( = ?auto_8643 ?auto_8644 ) ) ( not ( = ?auto_8643 ?auto_8655 ) ) ( not ( = ?auto_8644 ?auto_8655 ) ) ( not ( = ?auto_8648 ?auto_8658 ) ) ( IS-CRATE ?auto_8643 ) ( not ( = ?auto_8654 ?auto_8646 ) ) ( HOIST-AT ?auto_8657 ?auto_8654 ) ( AVAILABLE ?auto_8657 ) ( SURFACE-AT ?auto_8643 ?auto_8654 ) ( ON ?auto_8643 ?auto_8653 ) ( CLEAR ?auto_8643 ) ( not ( = ?auto_8642 ?auto_8643 ) ) ( not ( = ?auto_8642 ?auto_8653 ) ) ( not ( = ?auto_8643 ?auto_8653 ) ) ( not ( = ?auto_8648 ?auto_8657 ) ) ( SURFACE-AT ?auto_8641 ?auto_8646 ) ( CLEAR ?auto_8641 ) ( IS-CRATE ?auto_8642 ) ( AVAILABLE ?auto_8648 ) ( not ( = ?auto_8659 ?auto_8646 ) ) ( HOIST-AT ?auto_8656 ?auto_8659 ) ( AVAILABLE ?auto_8656 ) ( SURFACE-AT ?auto_8642 ?auto_8659 ) ( ON ?auto_8642 ?auto_8652 ) ( CLEAR ?auto_8642 ) ( TRUCK-AT ?auto_8651 ?auto_8646 ) ( not ( = ?auto_8641 ?auto_8642 ) ) ( not ( = ?auto_8641 ?auto_8652 ) ) ( not ( = ?auto_8642 ?auto_8652 ) ) ( not ( = ?auto_8648 ?auto_8656 ) ) ( not ( = ?auto_8641 ?auto_8643 ) ) ( not ( = ?auto_8641 ?auto_8653 ) ) ( not ( = ?auto_8643 ?auto_8652 ) ) ( not ( = ?auto_8654 ?auto_8659 ) ) ( not ( = ?auto_8657 ?auto_8656 ) ) ( not ( = ?auto_8653 ?auto_8652 ) ) ( not ( = ?auto_8641 ?auto_8644 ) ) ( not ( = ?auto_8641 ?auto_8655 ) ) ( not ( = ?auto_8642 ?auto_8644 ) ) ( not ( = ?auto_8642 ?auto_8655 ) ) ( not ( = ?auto_8644 ?auto_8653 ) ) ( not ( = ?auto_8644 ?auto_8652 ) ) ( not ( = ?auto_8660 ?auto_8654 ) ) ( not ( = ?auto_8660 ?auto_8659 ) ) ( not ( = ?auto_8658 ?auto_8657 ) ) ( not ( = ?auto_8658 ?auto_8656 ) ) ( not ( = ?auto_8655 ?auto_8653 ) ) ( not ( = ?auto_8655 ?auto_8652 ) ) ( not ( = ?auto_8641 ?auto_8645 ) ) ( not ( = ?auto_8641 ?auto_8650 ) ) ( not ( = ?auto_8642 ?auto_8645 ) ) ( not ( = ?auto_8642 ?auto_8650 ) ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8643 ?auto_8650 ) ) ( not ( = ?auto_8645 ?auto_8655 ) ) ( not ( = ?auto_8645 ?auto_8653 ) ) ( not ( = ?auto_8645 ?auto_8652 ) ) ( not ( = ?auto_8649 ?auto_8660 ) ) ( not ( = ?auto_8649 ?auto_8654 ) ) ( not ( = ?auto_8649 ?auto_8659 ) ) ( not ( = ?auto_8647 ?auto_8658 ) ) ( not ( = ?auto_8647 ?auto_8657 ) ) ( not ( = ?auto_8647 ?auto_8656 ) ) ( not ( = ?auto_8650 ?auto_8655 ) ) ( not ( = ?auto_8650 ?auto_8653 ) ) ( not ( = ?auto_8650 ?auto_8652 ) ) )
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
      ?auto_8684 - HOIST
      ?auto_8687 - PLACE
      ?auto_8686 - PLACE
      ?auto_8688 - HOIST
      ?auto_8685 - SURFACE
      ?auto_8697 - PLACE
      ?auto_8700 - HOIST
      ?auto_8696 - SURFACE
      ?auto_8699 - PLACE
      ?auto_8692 - HOIST
      ?auto_8694 - SURFACE
      ?auto_8689 - PLACE
      ?auto_8690 - HOIST
      ?auto_8693 - SURFACE
      ?auto_8695 - PLACE
      ?auto_8691 - HOIST
      ?auto_8698 - SURFACE
      ?auto_8683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8684 ?auto_8687 ) ( IS-CRATE ?auto_8682 ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( HOIST-AT ?auto_8688 ?auto_8686 ) ( AVAILABLE ?auto_8688 ) ( SURFACE-AT ?auto_8682 ?auto_8686 ) ( ON ?auto_8682 ?auto_8685 ) ( CLEAR ?auto_8682 ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8685 ) ) ( not ( = ?auto_8682 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8688 ) ) ( IS-CRATE ?auto_8681 ) ( not ( = ?auto_8697 ?auto_8687 ) ) ( HOIST-AT ?auto_8700 ?auto_8697 ) ( AVAILABLE ?auto_8700 ) ( SURFACE-AT ?auto_8681 ?auto_8697 ) ( ON ?auto_8681 ?auto_8696 ) ( CLEAR ?auto_8681 ) ( not ( = ?auto_8680 ?auto_8681 ) ) ( not ( = ?auto_8680 ?auto_8696 ) ) ( not ( = ?auto_8681 ?auto_8696 ) ) ( not ( = ?auto_8684 ?auto_8700 ) ) ( IS-CRATE ?auto_8680 ) ( not ( = ?auto_8699 ?auto_8687 ) ) ( HOIST-AT ?auto_8692 ?auto_8699 ) ( AVAILABLE ?auto_8692 ) ( SURFACE-AT ?auto_8680 ?auto_8699 ) ( ON ?auto_8680 ?auto_8694 ) ( CLEAR ?auto_8680 ) ( not ( = ?auto_8679 ?auto_8680 ) ) ( not ( = ?auto_8679 ?auto_8694 ) ) ( not ( = ?auto_8680 ?auto_8694 ) ) ( not ( = ?auto_8684 ?auto_8692 ) ) ( IS-CRATE ?auto_8679 ) ( not ( = ?auto_8689 ?auto_8687 ) ) ( HOIST-AT ?auto_8690 ?auto_8689 ) ( AVAILABLE ?auto_8690 ) ( SURFACE-AT ?auto_8679 ?auto_8689 ) ( ON ?auto_8679 ?auto_8693 ) ( CLEAR ?auto_8679 ) ( not ( = ?auto_8678 ?auto_8679 ) ) ( not ( = ?auto_8678 ?auto_8693 ) ) ( not ( = ?auto_8679 ?auto_8693 ) ) ( not ( = ?auto_8684 ?auto_8690 ) ) ( SURFACE-AT ?auto_8677 ?auto_8687 ) ( CLEAR ?auto_8677 ) ( IS-CRATE ?auto_8678 ) ( AVAILABLE ?auto_8684 ) ( not ( = ?auto_8695 ?auto_8687 ) ) ( HOIST-AT ?auto_8691 ?auto_8695 ) ( AVAILABLE ?auto_8691 ) ( SURFACE-AT ?auto_8678 ?auto_8695 ) ( ON ?auto_8678 ?auto_8698 ) ( CLEAR ?auto_8678 ) ( TRUCK-AT ?auto_8683 ?auto_8687 ) ( not ( = ?auto_8677 ?auto_8678 ) ) ( not ( = ?auto_8677 ?auto_8698 ) ) ( not ( = ?auto_8678 ?auto_8698 ) ) ( not ( = ?auto_8684 ?auto_8691 ) ) ( not ( = ?auto_8677 ?auto_8679 ) ) ( not ( = ?auto_8677 ?auto_8693 ) ) ( not ( = ?auto_8679 ?auto_8698 ) ) ( not ( = ?auto_8689 ?auto_8695 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( not ( = ?auto_8693 ?auto_8698 ) ) ( not ( = ?auto_8677 ?auto_8680 ) ) ( not ( = ?auto_8677 ?auto_8694 ) ) ( not ( = ?auto_8678 ?auto_8680 ) ) ( not ( = ?auto_8678 ?auto_8694 ) ) ( not ( = ?auto_8680 ?auto_8693 ) ) ( not ( = ?auto_8680 ?auto_8698 ) ) ( not ( = ?auto_8699 ?auto_8689 ) ) ( not ( = ?auto_8699 ?auto_8695 ) ) ( not ( = ?auto_8692 ?auto_8690 ) ) ( not ( = ?auto_8692 ?auto_8691 ) ) ( not ( = ?auto_8694 ?auto_8693 ) ) ( not ( = ?auto_8694 ?auto_8698 ) ) ( not ( = ?auto_8677 ?auto_8681 ) ) ( not ( = ?auto_8677 ?auto_8696 ) ) ( not ( = ?auto_8678 ?auto_8681 ) ) ( not ( = ?auto_8678 ?auto_8696 ) ) ( not ( = ?auto_8679 ?auto_8681 ) ) ( not ( = ?auto_8679 ?auto_8696 ) ) ( not ( = ?auto_8681 ?auto_8694 ) ) ( not ( = ?auto_8681 ?auto_8693 ) ) ( not ( = ?auto_8681 ?auto_8698 ) ) ( not ( = ?auto_8697 ?auto_8699 ) ) ( not ( = ?auto_8697 ?auto_8689 ) ) ( not ( = ?auto_8697 ?auto_8695 ) ) ( not ( = ?auto_8700 ?auto_8692 ) ) ( not ( = ?auto_8700 ?auto_8690 ) ) ( not ( = ?auto_8700 ?auto_8691 ) ) ( not ( = ?auto_8696 ?auto_8694 ) ) ( not ( = ?auto_8696 ?auto_8693 ) ) ( not ( = ?auto_8696 ?auto_8698 ) ) ( not ( = ?auto_8677 ?auto_8682 ) ) ( not ( = ?auto_8677 ?auto_8685 ) ) ( not ( = ?auto_8678 ?auto_8682 ) ) ( not ( = ?auto_8678 ?auto_8685 ) ) ( not ( = ?auto_8679 ?auto_8682 ) ) ( not ( = ?auto_8679 ?auto_8685 ) ) ( not ( = ?auto_8680 ?auto_8682 ) ) ( not ( = ?auto_8680 ?auto_8685 ) ) ( not ( = ?auto_8682 ?auto_8696 ) ) ( not ( = ?auto_8682 ?auto_8694 ) ) ( not ( = ?auto_8682 ?auto_8693 ) ) ( not ( = ?auto_8682 ?auto_8698 ) ) ( not ( = ?auto_8686 ?auto_8697 ) ) ( not ( = ?auto_8686 ?auto_8699 ) ) ( not ( = ?auto_8686 ?auto_8689 ) ) ( not ( = ?auto_8686 ?auto_8695 ) ) ( not ( = ?auto_8688 ?auto_8700 ) ) ( not ( = ?auto_8688 ?auto_8692 ) ) ( not ( = ?auto_8688 ?auto_8690 ) ) ( not ( = ?auto_8688 ?auto_8691 ) ) ( not ( = ?auto_8685 ?auto_8696 ) ) ( not ( = ?auto_8685 ?auto_8694 ) ) ( not ( = ?auto_8685 ?auto_8693 ) ) ( not ( = ?auto_8685 ?auto_8698 ) ) )
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
      ?auto_8726 - HOIST
      ?auto_8727 - SURFACE
      ?auto_8739 - PLACE
      ?auto_8736 - HOIST
      ?auto_8738 - SURFACE
      ?auto_8743 - SURFACE
      ?auto_8740 - PLACE
      ?auto_8732 - HOIST
      ?auto_8742 - SURFACE
      ?auto_8733 - PLACE
      ?auto_8735 - HOIST
      ?auto_8731 - SURFACE
      ?auto_8741 - PLACE
      ?auto_8734 - HOIST
      ?auto_8737 - SURFACE
      ?auto_8728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8730 ?auto_8729 ) ( IS-CRATE ?auto_8724 ) ( not ( = ?auto_8725 ?auto_8729 ) ) ( HOIST-AT ?auto_8726 ?auto_8725 ) ( SURFACE-AT ?auto_8724 ?auto_8725 ) ( ON ?auto_8724 ?auto_8727 ) ( CLEAR ?auto_8724 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8727 ) ) ( not ( = ?auto_8724 ?auto_8727 ) ) ( not ( = ?auto_8730 ?auto_8726 ) ) ( IS-CRATE ?auto_8723 ) ( not ( = ?auto_8739 ?auto_8729 ) ) ( HOIST-AT ?auto_8736 ?auto_8739 ) ( AVAILABLE ?auto_8736 ) ( SURFACE-AT ?auto_8723 ?auto_8739 ) ( ON ?auto_8723 ?auto_8738 ) ( CLEAR ?auto_8723 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8738 ) ) ( not ( = ?auto_8723 ?auto_8738 ) ) ( not ( = ?auto_8730 ?auto_8736 ) ) ( IS-CRATE ?auto_8722 ) ( AVAILABLE ?auto_8726 ) ( SURFACE-AT ?auto_8722 ?auto_8725 ) ( ON ?auto_8722 ?auto_8743 ) ( CLEAR ?auto_8722 ) ( not ( = ?auto_8721 ?auto_8722 ) ) ( not ( = ?auto_8721 ?auto_8743 ) ) ( not ( = ?auto_8722 ?auto_8743 ) ) ( IS-CRATE ?auto_8721 ) ( not ( = ?auto_8740 ?auto_8729 ) ) ( HOIST-AT ?auto_8732 ?auto_8740 ) ( AVAILABLE ?auto_8732 ) ( SURFACE-AT ?auto_8721 ?auto_8740 ) ( ON ?auto_8721 ?auto_8742 ) ( CLEAR ?auto_8721 ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8720 ?auto_8742 ) ) ( not ( = ?auto_8721 ?auto_8742 ) ) ( not ( = ?auto_8730 ?auto_8732 ) ) ( IS-CRATE ?auto_8720 ) ( not ( = ?auto_8733 ?auto_8729 ) ) ( HOIST-AT ?auto_8735 ?auto_8733 ) ( AVAILABLE ?auto_8735 ) ( SURFACE-AT ?auto_8720 ?auto_8733 ) ( ON ?auto_8720 ?auto_8731 ) ( CLEAR ?auto_8720 ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( not ( = ?auto_8719 ?auto_8731 ) ) ( not ( = ?auto_8720 ?auto_8731 ) ) ( not ( = ?auto_8730 ?auto_8735 ) ) ( SURFACE-AT ?auto_8718 ?auto_8729 ) ( CLEAR ?auto_8718 ) ( IS-CRATE ?auto_8719 ) ( AVAILABLE ?auto_8730 ) ( not ( = ?auto_8741 ?auto_8729 ) ) ( HOIST-AT ?auto_8734 ?auto_8741 ) ( AVAILABLE ?auto_8734 ) ( SURFACE-AT ?auto_8719 ?auto_8741 ) ( ON ?auto_8719 ?auto_8737 ) ( CLEAR ?auto_8719 ) ( TRUCK-AT ?auto_8728 ?auto_8729 ) ( not ( = ?auto_8718 ?auto_8719 ) ) ( not ( = ?auto_8718 ?auto_8737 ) ) ( not ( = ?auto_8719 ?auto_8737 ) ) ( not ( = ?auto_8730 ?auto_8734 ) ) ( not ( = ?auto_8718 ?auto_8720 ) ) ( not ( = ?auto_8718 ?auto_8731 ) ) ( not ( = ?auto_8720 ?auto_8737 ) ) ( not ( = ?auto_8733 ?auto_8741 ) ) ( not ( = ?auto_8735 ?auto_8734 ) ) ( not ( = ?auto_8731 ?auto_8737 ) ) ( not ( = ?auto_8718 ?auto_8721 ) ) ( not ( = ?auto_8718 ?auto_8742 ) ) ( not ( = ?auto_8719 ?auto_8721 ) ) ( not ( = ?auto_8719 ?auto_8742 ) ) ( not ( = ?auto_8721 ?auto_8731 ) ) ( not ( = ?auto_8721 ?auto_8737 ) ) ( not ( = ?auto_8740 ?auto_8733 ) ) ( not ( = ?auto_8740 ?auto_8741 ) ) ( not ( = ?auto_8732 ?auto_8735 ) ) ( not ( = ?auto_8732 ?auto_8734 ) ) ( not ( = ?auto_8742 ?auto_8731 ) ) ( not ( = ?auto_8742 ?auto_8737 ) ) ( not ( = ?auto_8718 ?auto_8722 ) ) ( not ( = ?auto_8718 ?auto_8743 ) ) ( not ( = ?auto_8719 ?auto_8722 ) ) ( not ( = ?auto_8719 ?auto_8743 ) ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8720 ?auto_8743 ) ) ( not ( = ?auto_8722 ?auto_8742 ) ) ( not ( = ?auto_8722 ?auto_8731 ) ) ( not ( = ?auto_8722 ?auto_8737 ) ) ( not ( = ?auto_8725 ?auto_8740 ) ) ( not ( = ?auto_8725 ?auto_8733 ) ) ( not ( = ?auto_8725 ?auto_8741 ) ) ( not ( = ?auto_8726 ?auto_8732 ) ) ( not ( = ?auto_8726 ?auto_8735 ) ) ( not ( = ?auto_8726 ?auto_8734 ) ) ( not ( = ?auto_8743 ?auto_8742 ) ) ( not ( = ?auto_8743 ?auto_8731 ) ) ( not ( = ?auto_8743 ?auto_8737 ) ) ( not ( = ?auto_8718 ?auto_8723 ) ) ( not ( = ?auto_8718 ?auto_8738 ) ) ( not ( = ?auto_8719 ?auto_8723 ) ) ( not ( = ?auto_8719 ?auto_8738 ) ) ( not ( = ?auto_8720 ?auto_8723 ) ) ( not ( = ?auto_8720 ?auto_8738 ) ) ( not ( = ?auto_8721 ?auto_8723 ) ) ( not ( = ?auto_8721 ?auto_8738 ) ) ( not ( = ?auto_8723 ?auto_8743 ) ) ( not ( = ?auto_8723 ?auto_8742 ) ) ( not ( = ?auto_8723 ?auto_8731 ) ) ( not ( = ?auto_8723 ?auto_8737 ) ) ( not ( = ?auto_8739 ?auto_8725 ) ) ( not ( = ?auto_8739 ?auto_8740 ) ) ( not ( = ?auto_8739 ?auto_8733 ) ) ( not ( = ?auto_8739 ?auto_8741 ) ) ( not ( = ?auto_8736 ?auto_8726 ) ) ( not ( = ?auto_8736 ?auto_8732 ) ) ( not ( = ?auto_8736 ?auto_8735 ) ) ( not ( = ?auto_8736 ?auto_8734 ) ) ( not ( = ?auto_8738 ?auto_8743 ) ) ( not ( = ?auto_8738 ?auto_8742 ) ) ( not ( = ?auto_8738 ?auto_8731 ) ) ( not ( = ?auto_8738 ?auto_8737 ) ) ( not ( = ?auto_8718 ?auto_8724 ) ) ( not ( = ?auto_8718 ?auto_8727 ) ) ( not ( = ?auto_8719 ?auto_8724 ) ) ( not ( = ?auto_8719 ?auto_8727 ) ) ( not ( = ?auto_8720 ?auto_8724 ) ) ( not ( = ?auto_8720 ?auto_8727 ) ) ( not ( = ?auto_8721 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8727 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8727 ) ) ( not ( = ?auto_8724 ?auto_8738 ) ) ( not ( = ?auto_8724 ?auto_8743 ) ) ( not ( = ?auto_8724 ?auto_8742 ) ) ( not ( = ?auto_8724 ?auto_8731 ) ) ( not ( = ?auto_8724 ?auto_8737 ) ) ( not ( = ?auto_8727 ?auto_8738 ) ) ( not ( = ?auto_8727 ?auto_8743 ) ) ( not ( = ?auto_8727 ?auto_8742 ) ) ( not ( = ?auto_8727 ?auto_8731 ) ) ( not ( = ?auto_8727 ?auto_8737 ) ) )
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
      ?auto_8771 - HOIST
      ?auto_8774 - PLACE
      ?auto_8775 - PLACE
      ?auto_8773 - HOIST
      ?auto_8772 - SURFACE
      ?auto_8778 - PLACE
      ?auto_8788 - HOIST
      ?auto_8776 - SURFACE
      ?auto_8785 - PLACE
      ?auto_8787 - HOIST
      ?auto_8791 - SURFACE
      ?auto_8777 - SURFACE
      ?auto_8780 - PLACE
      ?auto_8779 - HOIST
      ?auto_8784 - SURFACE
      ?auto_8781 - PLACE
      ?auto_8790 - HOIST
      ?auto_8789 - SURFACE
      ?auto_8786 - PLACE
      ?auto_8782 - HOIST
      ?auto_8783 - SURFACE
      ?auto_8770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8771 ?auto_8774 ) ( IS-CRATE ?auto_8769 ) ( not ( = ?auto_8775 ?auto_8774 ) ) ( HOIST-AT ?auto_8773 ?auto_8775 ) ( AVAILABLE ?auto_8773 ) ( SURFACE-AT ?auto_8769 ?auto_8775 ) ( ON ?auto_8769 ?auto_8772 ) ( CLEAR ?auto_8769 ) ( not ( = ?auto_8768 ?auto_8769 ) ) ( not ( = ?auto_8768 ?auto_8772 ) ) ( not ( = ?auto_8769 ?auto_8772 ) ) ( not ( = ?auto_8771 ?auto_8773 ) ) ( IS-CRATE ?auto_8768 ) ( not ( = ?auto_8778 ?auto_8774 ) ) ( HOIST-AT ?auto_8788 ?auto_8778 ) ( SURFACE-AT ?auto_8768 ?auto_8778 ) ( ON ?auto_8768 ?auto_8776 ) ( CLEAR ?auto_8768 ) ( not ( = ?auto_8767 ?auto_8768 ) ) ( not ( = ?auto_8767 ?auto_8776 ) ) ( not ( = ?auto_8768 ?auto_8776 ) ) ( not ( = ?auto_8771 ?auto_8788 ) ) ( IS-CRATE ?auto_8767 ) ( not ( = ?auto_8785 ?auto_8774 ) ) ( HOIST-AT ?auto_8787 ?auto_8785 ) ( AVAILABLE ?auto_8787 ) ( SURFACE-AT ?auto_8767 ?auto_8785 ) ( ON ?auto_8767 ?auto_8791 ) ( CLEAR ?auto_8767 ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( not ( = ?auto_8766 ?auto_8791 ) ) ( not ( = ?auto_8767 ?auto_8791 ) ) ( not ( = ?auto_8771 ?auto_8787 ) ) ( IS-CRATE ?auto_8766 ) ( AVAILABLE ?auto_8788 ) ( SURFACE-AT ?auto_8766 ?auto_8778 ) ( ON ?auto_8766 ?auto_8777 ) ( CLEAR ?auto_8766 ) ( not ( = ?auto_8765 ?auto_8766 ) ) ( not ( = ?auto_8765 ?auto_8777 ) ) ( not ( = ?auto_8766 ?auto_8777 ) ) ( IS-CRATE ?auto_8765 ) ( not ( = ?auto_8780 ?auto_8774 ) ) ( HOIST-AT ?auto_8779 ?auto_8780 ) ( AVAILABLE ?auto_8779 ) ( SURFACE-AT ?auto_8765 ?auto_8780 ) ( ON ?auto_8765 ?auto_8784 ) ( CLEAR ?auto_8765 ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( not ( = ?auto_8764 ?auto_8784 ) ) ( not ( = ?auto_8765 ?auto_8784 ) ) ( not ( = ?auto_8771 ?auto_8779 ) ) ( IS-CRATE ?auto_8764 ) ( not ( = ?auto_8781 ?auto_8774 ) ) ( HOIST-AT ?auto_8790 ?auto_8781 ) ( AVAILABLE ?auto_8790 ) ( SURFACE-AT ?auto_8764 ?auto_8781 ) ( ON ?auto_8764 ?auto_8789 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8789 ) ) ( not ( = ?auto_8764 ?auto_8789 ) ) ( not ( = ?auto_8771 ?auto_8790 ) ) ( SURFACE-AT ?auto_8762 ?auto_8774 ) ( CLEAR ?auto_8762 ) ( IS-CRATE ?auto_8763 ) ( AVAILABLE ?auto_8771 ) ( not ( = ?auto_8786 ?auto_8774 ) ) ( HOIST-AT ?auto_8782 ?auto_8786 ) ( AVAILABLE ?auto_8782 ) ( SURFACE-AT ?auto_8763 ?auto_8786 ) ( ON ?auto_8763 ?auto_8783 ) ( CLEAR ?auto_8763 ) ( TRUCK-AT ?auto_8770 ?auto_8774 ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8783 ) ) ( not ( = ?auto_8763 ?auto_8783 ) ) ( not ( = ?auto_8771 ?auto_8782 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8762 ?auto_8789 ) ) ( not ( = ?auto_8764 ?auto_8783 ) ) ( not ( = ?auto_8781 ?auto_8786 ) ) ( not ( = ?auto_8790 ?auto_8782 ) ) ( not ( = ?auto_8789 ?auto_8783 ) ) ( not ( = ?auto_8762 ?auto_8765 ) ) ( not ( = ?auto_8762 ?auto_8784 ) ) ( not ( = ?auto_8763 ?auto_8765 ) ) ( not ( = ?auto_8763 ?auto_8784 ) ) ( not ( = ?auto_8765 ?auto_8789 ) ) ( not ( = ?auto_8765 ?auto_8783 ) ) ( not ( = ?auto_8780 ?auto_8781 ) ) ( not ( = ?auto_8780 ?auto_8786 ) ) ( not ( = ?auto_8779 ?auto_8790 ) ) ( not ( = ?auto_8779 ?auto_8782 ) ) ( not ( = ?auto_8784 ?auto_8789 ) ) ( not ( = ?auto_8784 ?auto_8783 ) ) ( not ( = ?auto_8762 ?auto_8766 ) ) ( not ( = ?auto_8762 ?auto_8777 ) ) ( not ( = ?auto_8763 ?auto_8766 ) ) ( not ( = ?auto_8763 ?auto_8777 ) ) ( not ( = ?auto_8764 ?auto_8766 ) ) ( not ( = ?auto_8764 ?auto_8777 ) ) ( not ( = ?auto_8766 ?auto_8784 ) ) ( not ( = ?auto_8766 ?auto_8789 ) ) ( not ( = ?auto_8766 ?auto_8783 ) ) ( not ( = ?auto_8778 ?auto_8780 ) ) ( not ( = ?auto_8778 ?auto_8781 ) ) ( not ( = ?auto_8778 ?auto_8786 ) ) ( not ( = ?auto_8788 ?auto_8779 ) ) ( not ( = ?auto_8788 ?auto_8790 ) ) ( not ( = ?auto_8788 ?auto_8782 ) ) ( not ( = ?auto_8777 ?auto_8784 ) ) ( not ( = ?auto_8777 ?auto_8789 ) ) ( not ( = ?auto_8777 ?auto_8783 ) ) ( not ( = ?auto_8762 ?auto_8767 ) ) ( not ( = ?auto_8762 ?auto_8791 ) ) ( not ( = ?auto_8763 ?auto_8767 ) ) ( not ( = ?auto_8763 ?auto_8791 ) ) ( not ( = ?auto_8764 ?auto_8767 ) ) ( not ( = ?auto_8764 ?auto_8791 ) ) ( not ( = ?auto_8765 ?auto_8767 ) ) ( not ( = ?auto_8765 ?auto_8791 ) ) ( not ( = ?auto_8767 ?auto_8777 ) ) ( not ( = ?auto_8767 ?auto_8784 ) ) ( not ( = ?auto_8767 ?auto_8789 ) ) ( not ( = ?auto_8767 ?auto_8783 ) ) ( not ( = ?auto_8785 ?auto_8778 ) ) ( not ( = ?auto_8785 ?auto_8780 ) ) ( not ( = ?auto_8785 ?auto_8781 ) ) ( not ( = ?auto_8785 ?auto_8786 ) ) ( not ( = ?auto_8787 ?auto_8788 ) ) ( not ( = ?auto_8787 ?auto_8779 ) ) ( not ( = ?auto_8787 ?auto_8790 ) ) ( not ( = ?auto_8787 ?auto_8782 ) ) ( not ( = ?auto_8791 ?auto_8777 ) ) ( not ( = ?auto_8791 ?auto_8784 ) ) ( not ( = ?auto_8791 ?auto_8789 ) ) ( not ( = ?auto_8791 ?auto_8783 ) ) ( not ( = ?auto_8762 ?auto_8768 ) ) ( not ( = ?auto_8762 ?auto_8776 ) ) ( not ( = ?auto_8763 ?auto_8768 ) ) ( not ( = ?auto_8763 ?auto_8776 ) ) ( not ( = ?auto_8764 ?auto_8768 ) ) ( not ( = ?auto_8764 ?auto_8776 ) ) ( not ( = ?auto_8765 ?auto_8768 ) ) ( not ( = ?auto_8765 ?auto_8776 ) ) ( not ( = ?auto_8766 ?auto_8768 ) ) ( not ( = ?auto_8766 ?auto_8776 ) ) ( not ( = ?auto_8768 ?auto_8791 ) ) ( not ( = ?auto_8768 ?auto_8777 ) ) ( not ( = ?auto_8768 ?auto_8784 ) ) ( not ( = ?auto_8768 ?auto_8789 ) ) ( not ( = ?auto_8768 ?auto_8783 ) ) ( not ( = ?auto_8776 ?auto_8791 ) ) ( not ( = ?auto_8776 ?auto_8777 ) ) ( not ( = ?auto_8776 ?auto_8784 ) ) ( not ( = ?auto_8776 ?auto_8789 ) ) ( not ( = ?auto_8776 ?auto_8783 ) ) ( not ( = ?auto_8762 ?auto_8769 ) ) ( not ( = ?auto_8762 ?auto_8772 ) ) ( not ( = ?auto_8763 ?auto_8769 ) ) ( not ( = ?auto_8763 ?auto_8772 ) ) ( not ( = ?auto_8764 ?auto_8769 ) ) ( not ( = ?auto_8764 ?auto_8772 ) ) ( not ( = ?auto_8765 ?auto_8769 ) ) ( not ( = ?auto_8765 ?auto_8772 ) ) ( not ( = ?auto_8766 ?auto_8769 ) ) ( not ( = ?auto_8766 ?auto_8772 ) ) ( not ( = ?auto_8767 ?auto_8769 ) ) ( not ( = ?auto_8767 ?auto_8772 ) ) ( not ( = ?auto_8769 ?auto_8776 ) ) ( not ( = ?auto_8769 ?auto_8791 ) ) ( not ( = ?auto_8769 ?auto_8777 ) ) ( not ( = ?auto_8769 ?auto_8784 ) ) ( not ( = ?auto_8769 ?auto_8789 ) ) ( not ( = ?auto_8769 ?auto_8783 ) ) ( not ( = ?auto_8775 ?auto_8778 ) ) ( not ( = ?auto_8775 ?auto_8785 ) ) ( not ( = ?auto_8775 ?auto_8780 ) ) ( not ( = ?auto_8775 ?auto_8781 ) ) ( not ( = ?auto_8775 ?auto_8786 ) ) ( not ( = ?auto_8773 ?auto_8788 ) ) ( not ( = ?auto_8773 ?auto_8787 ) ) ( not ( = ?auto_8773 ?auto_8779 ) ) ( not ( = ?auto_8773 ?auto_8790 ) ) ( not ( = ?auto_8773 ?auto_8782 ) ) ( not ( = ?auto_8772 ?auto_8776 ) ) ( not ( = ?auto_8772 ?auto_8791 ) ) ( not ( = ?auto_8772 ?auto_8777 ) ) ( not ( = ?auto_8772 ?auto_8784 ) ) ( not ( = ?auto_8772 ?auto_8789 ) ) ( not ( = ?auto_8772 ?auto_8783 ) ) )
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
      ?auto_8824 - HOIST
      ?auto_8822 - PLACE
      ?auto_8821 - PLACE
      ?auto_8820 - HOIST
      ?auto_8823 - SURFACE
      ?auto_8830 - SURFACE
      ?auto_8826 - PLACE
      ?auto_8827 - HOIST
      ?auto_8832 - SURFACE
      ?auto_8828 - PLACE
      ?auto_8839 - HOIST
      ?auto_8837 - SURFACE
      ?auto_8831 - SURFACE
      ?auto_8835 - PLACE
      ?auto_8838 - HOIST
      ?auto_8833 - SURFACE
      ?auto_8836 - PLACE
      ?auto_8829 - HOIST
      ?auto_8840 - SURFACE
      ?auto_8834 - PLACE
      ?auto_8842 - HOIST
      ?auto_8841 - SURFACE
      ?auto_8825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8824 ?auto_8822 ) ( IS-CRATE ?auto_8819 ) ( not ( = ?auto_8821 ?auto_8822 ) ) ( HOIST-AT ?auto_8820 ?auto_8821 ) ( SURFACE-AT ?auto_8819 ?auto_8821 ) ( ON ?auto_8819 ?auto_8823 ) ( CLEAR ?auto_8819 ) ( not ( = ?auto_8818 ?auto_8819 ) ) ( not ( = ?auto_8818 ?auto_8823 ) ) ( not ( = ?auto_8819 ?auto_8823 ) ) ( not ( = ?auto_8824 ?auto_8820 ) ) ( IS-CRATE ?auto_8818 ) ( AVAILABLE ?auto_8820 ) ( SURFACE-AT ?auto_8818 ?auto_8821 ) ( ON ?auto_8818 ?auto_8830 ) ( CLEAR ?auto_8818 ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8830 ) ) ( not ( = ?auto_8818 ?auto_8830 ) ) ( IS-CRATE ?auto_8817 ) ( not ( = ?auto_8826 ?auto_8822 ) ) ( HOIST-AT ?auto_8827 ?auto_8826 ) ( SURFACE-AT ?auto_8817 ?auto_8826 ) ( ON ?auto_8817 ?auto_8832 ) ( CLEAR ?auto_8817 ) ( not ( = ?auto_8816 ?auto_8817 ) ) ( not ( = ?auto_8816 ?auto_8832 ) ) ( not ( = ?auto_8817 ?auto_8832 ) ) ( not ( = ?auto_8824 ?auto_8827 ) ) ( IS-CRATE ?auto_8816 ) ( not ( = ?auto_8828 ?auto_8822 ) ) ( HOIST-AT ?auto_8839 ?auto_8828 ) ( AVAILABLE ?auto_8839 ) ( SURFACE-AT ?auto_8816 ?auto_8828 ) ( ON ?auto_8816 ?auto_8837 ) ( CLEAR ?auto_8816 ) ( not ( = ?auto_8815 ?auto_8816 ) ) ( not ( = ?auto_8815 ?auto_8837 ) ) ( not ( = ?auto_8816 ?auto_8837 ) ) ( not ( = ?auto_8824 ?auto_8839 ) ) ( IS-CRATE ?auto_8815 ) ( AVAILABLE ?auto_8827 ) ( SURFACE-AT ?auto_8815 ?auto_8826 ) ( ON ?auto_8815 ?auto_8831 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8814 ?auto_8831 ) ) ( not ( = ?auto_8815 ?auto_8831 ) ) ( IS-CRATE ?auto_8814 ) ( not ( = ?auto_8835 ?auto_8822 ) ) ( HOIST-AT ?auto_8838 ?auto_8835 ) ( AVAILABLE ?auto_8838 ) ( SURFACE-AT ?auto_8814 ?auto_8835 ) ( ON ?auto_8814 ?auto_8833 ) ( CLEAR ?auto_8814 ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( not ( = ?auto_8813 ?auto_8833 ) ) ( not ( = ?auto_8814 ?auto_8833 ) ) ( not ( = ?auto_8824 ?auto_8838 ) ) ( IS-CRATE ?auto_8813 ) ( not ( = ?auto_8836 ?auto_8822 ) ) ( HOIST-AT ?auto_8829 ?auto_8836 ) ( AVAILABLE ?auto_8829 ) ( SURFACE-AT ?auto_8813 ?auto_8836 ) ( ON ?auto_8813 ?auto_8840 ) ( CLEAR ?auto_8813 ) ( not ( = ?auto_8812 ?auto_8813 ) ) ( not ( = ?auto_8812 ?auto_8840 ) ) ( not ( = ?auto_8813 ?auto_8840 ) ) ( not ( = ?auto_8824 ?auto_8829 ) ) ( SURFACE-AT ?auto_8811 ?auto_8822 ) ( CLEAR ?auto_8811 ) ( IS-CRATE ?auto_8812 ) ( AVAILABLE ?auto_8824 ) ( not ( = ?auto_8834 ?auto_8822 ) ) ( HOIST-AT ?auto_8842 ?auto_8834 ) ( AVAILABLE ?auto_8842 ) ( SURFACE-AT ?auto_8812 ?auto_8834 ) ( ON ?auto_8812 ?auto_8841 ) ( CLEAR ?auto_8812 ) ( TRUCK-AT ?auto_8825 ?auto_8822 ) ( not ( = ?auto_8811 ?auto_8812 ) ) ( not ( = ?auto_8811 ?auto_8841 ) ) ( not ( = ?auto_8812 ?auto_8841 ) ) ( not ( = ?auto_8824 ?auto_8842 ) ) ( not ( = ?auto_8811 ?auto_8813 ) ) ( not ( = ?auto_8811 ?auto_8840 ) ) ( not ( = ?auto_8813 ?auto_8841 ) ) ( not ( = ?auto_8836 ?auto_8834 ) ) ( not ( = ?auto_8829 ?auto_8842 ) ) ( not ( = ?auto_8840 ?auto_8841 ) ) ( not ( = ?auto_8811 ?auto_8814 ) ) ( not ( = ?auto_8811 ?auto_8833 ) ) ( not ( = ?auto_8812 ?auto_8814 ) ) ( not ( = ?auto_8812 ?auto_8833 ) ) ( not ( = ?auto_8814 ?auto_8840 ) ) ( not ( = ?auto_8814 ?auto_8841 ) ) ( not ( = ?auto_8835 ?auto_8836 ) ) ( not ( = ?auto_8835 ?auto_8834 ) ) ( not ( = ?auto_8838 ?auto_8829 ) ) ( not ( = ?auto_8838 ?auto_8842 ) ) ( not ( = ?auto_8833 ?auto_8840 ) ) ( not ( = ?auto_8833 ?auto_8841 ) ) ( not ( = ?auto_8811 ?auto_8815 ) ) ( not ( = ?auto_8811 ?auto_8831 ) ) ( not ( = ?auto_8812 ?auto_8815 ) ) ( not ( = ?auto_8812 ?auto_8831 ) ) ( not ( = ?auto_8813 ?auto_8815 ) ) ( not ( = ?auto_8813 ?auto_8831 ) ) ( not ( = ?auto_8815 ?auto_8833 ) ) ( not ( = ?auto_8815 ?auto_8840 ) ) ( not ( = ?auto_8815 ?auto_8841 ) ) ( not ( = ?auto_8826 ?auto_8835 ) ) ( not ( = ?auto_8826 ?auto_8836 ) ) ( not ( = ?auto_8826 ?auto_8834 ) ) ( not ( = ?auto_8827 ?auto_8838 ) ) ( not ( = ?auto_8827 ?auto_8829 ) ) ( not ( = ?auto_8827 ?auto_8842 ) ) ( not ( = ?auto_8831 ?auto_8833 ) ) ( not ( = ?auto_8831 ?auto_8840 ) ) ( not ( = ?auto_8831 ?auto_8841 ) ) ( not ( = ?auto_8811 ?auto_8816 ) ) ( not ( = ?auto_8811 ?auto_8837 ) ) ( not ( = ?auto_8812 ?auto_8816 ) ) ( not ( = ?auto_8812 ?auto_8837 ) ) ( not ( = ?auto_8813 ?auto_8816 ) ) ( not ( = ?auto_8813 ?auto_8837 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8814 ?auto_8837 ) ) ( not ( = ?auto_8816 ?auto_8831 ) ) ( not ( = ?auto_8816 ?auto_8833 ) ) ( not ( = ?auto_8816 ?auto_8840 ) ) ( not ( = ?auto_8816 ?auto_8841 ) ) ( not ( = ?auto_8828 ?auto_8826 ) ) ( not ( = ?auto_8828 ?auto_8835 ) ) ( not ( = ?auto_8828 ?auto_8836 ) ) ( not ( = ?auto_8828 ?auto_8834 ) ) ( not ( = ?auto_8839 ?auto_8827 ) ) ( not ( = ?auto_8839 ?auto_8838 ) ) ( not ( = ?auto_8839 ?auto_8829 ) ) ( not ( = ?auto_8839 ?auto_8842 ) ) ( not ( = ?auto_8837 ?auto_8831 ) ) ( not ( = ?auto_8837 ?auto_8833 ) ) ( not ( = ?auto_8837 ?auto_8840 ) ) ( not ( = ?auto_8837 ?auto_8841 ) ) ( not ( = ?auto_8811 ?auto_8817 ) ) ( not ( = ?auto_8811 ?auto_8832 ) ) ( not ( = ?auto_8812 ?auto_8817 ) ) ( not ( = ?auto_8812 ?auto_8832 ) ) ( not ( = ?auto_8813 ?auto_8817 ) ) ( not ( = ?auto_8813 ?auto_8832 ) ) ( not ( = ?auto_8814 ?auto_8817 ) ) ( not ( = ?auto_8814 ?auto_8832 ) ) ( not ( = ?auto_8815 ?auto_8817 ) ) ( not ( = ?auto_8815 ?auto_8832 ) ) ( not ( = ?auto_8817 ?auto_8837 ) ) ( not ( = ?auto_8817 ?auto_8831 ) ) ( not ( = ?auto_8817 ?auto_8833 ) ) ( not ( = ?auto_8817 ?auto_8840 ) ) ( not ( = ?auto_8817 ?auto_8841 ) ) ( not ( = ?auto_8832 ?auto_8837 ) ) ( not ( = ?auto_8832 ?auto_8831 ) ) ( not ( = ?auto_8832 ?auto_8833 ) ) ( not ( = ?auto_8832 ?auto_8840 ) ) ( not ( = ?auto_8832 ?auto_8841 ) ) ( not ( = ?auto_8811 ?auto_8818 ) ) ( not ( = ?auto_8811 ?auto_8830 ) ) ( not ( = ?auto_8812 ?auto_8818 ) ) ( not ( = ?auto_8812 ?auto_8830 ) ) ( not ( = ?auto_8813 ?auto_8818 ) ) ( not ( = ?auto_8813 ?auto_8830 ) ) ( not ( = ?auto_8814 ?auto_8818 ) ) ( not ( = ?auto_8814 ?auto_8830 ) ) ( not ( = ?auto_8815 ?auto_8818 ) ) ( not ( = ?auto_8815 ?auto_8830 ) ) ( not ( = ?auto_8816 ?auto_8818 ) ) ( not ( = ?auto_8816 ?auto_8830 ) ) ( not ( = ?auto_8818 ?auto_8832 ) ) ( not ( = ?auto_8818 ?auto_8837 ) ) ( not ( = ?auto_8818 ?auto_8831 ) ) ( not ( = ?auto_8818 ?auto_8833 ) ) ( not ( = ?auto_8818 ?auto_8840 ) ) ( not ( = ?auto_8818 ?auto_8841 ) ) ( not ( = ?auto_8821 ?auto_8826 ) ) ( not ( = ?auto_8821 ?auto_8828 ) ) ( not ( = ?auto_8821 ?auto_8835 ) ) ( not ( = ?auto_8821 ?auto_8836 ) ) ( not ( = ?auto_8821 ?auto_8834 ) ) ( not ( = ?auto_8820 ?auto_8827 ) ) ( not ( = ?auto_8820 ?auto_8839 ) ) ( not ( = ?auto_8820 ?auto_8838 ) ) ( not ( = ?auto_8820 ?auto_8829 ) ) ( not ( = ?auto_8820 ?auto_8842 ) ) ( not ( = ?auto_8830 ?auto_8832 ) ) ( not ( = ?auto_8830 ?auto_8837 ) ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8833 ) ) ( not ( = ?auto_8830 ?auto_8840 ) ) ( not ( = ?auto_8830 ?auto_8841 ) ) ( not ( = ?auto_8811 ?auto_8819 ) ) ( not ( = ?auto_8811 ?auto_8823 ) ) ( not ( = ?auto_8812 ?auto_8819 ) ) ( not ( = ?auto_8812 ?auto_8823 ) ) ( not ( = ?auto_8813 ?auto_8819 ) ) ( not ( = ?auto_8813 ?auto_8823 ) ) ( not ( = ?auto_8814 ?auto_8819 ) ) ( not ( = ?auto_8814 ?auto_8823 ) ) ( not ( = ?auto_8815 ?auto_8819 ) ) ( not ( = ?auto_8815 ?auto_8823 ) ) ( not ( = ?auto_8816 ?auto_8819 ) ) ( not ( = ?auto_8816 ?auto_8823 ) ) ( not ( = ?auto_8817 ?auto_8819 ) ) ( not ( = ?auto_8817 ?auto_8823 ) ) ( not ( = ?auto_8819 ?auto_8830 ) ) ( not ( = ?auto_8819 ?auto_8832 ) ) ( not ( = ?auto_8819 ?auto_8837 ) ) ( not ( = ?auto_8819 ?auto_8831 ) ) ( not ( = ?auto_8819 ?auto_8833 ) ) ( not ( = ?auto_8819 ?auto_8840 ) ) ( not ( = ?auto_8819 ?auto_8841 ) ) ( not ( = ?auto_8823 ?auto_8830 ) ) ( not ( = ?auto_8823 ?auto_8832 ) ) ( not ( = ?auto_8823 ?auto_8837 ) ) ( not ( = ?auto_8823 ?auto_8831 ) ) ( not ( = ?auto_8823 ?auto_8833 ) ) ( not ( = ?auto_8823 ?auto_8840 ) ) ( not ( = ?auto_8823 ?auto_8841 ) ) )
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
      ?auto_8876 - HOIST
      ?auto_8878 - PLACE
      ?auto_8877 - PLACE
      ?auto_8873 - HOIST
      ?auto_8875 - SURFACE
      ?auto_8879 - PLACE
      ?auto_8891 - HOIST
      ?auto_8885 - SURFACE
      ?auto_8894 - SURFACE
      ?auto_8880 - PLACE
      ?auto_8888 - HOIST
      ?auto_8896 - SURFACE
      ?auto_8892 - PLACE
      ?auto_8881 - HOIST
      ?auto_8890 - SURFACE
      ?auto_8882 - SURFACE
      ?auto_8887 - PLACE
      ?auto_8886 - HOIST
      ?auto_8895 - SURFACE
      ?auto_8884 - PLACE
      ?auto_8893 - HOIST
      ?auto_8883 - SURFACE
      ?auto_8889 - SURFACE
      ?auto_8874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8876 ?auto_8878 ) ( IS-CRATE ?auto_8872 ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( HOIST-AT ?auto_8873 ?auto_8877 ) ( SURFACE-AT ?auto_8872 ?auto_8877 ) ( ON ?auto_8872 ?auto_8875 ) ( CLEAR ?auto_8872 ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8875 ) ) ( not ( = ?auto_8872 ?auto_8875 ) ) ( not ( = ?auto_8876 ?auto_8873 ) ) ( IS-CRATE ?auto_8871 ) ( not ( = ?auto_8879 ?auto_8878 ) ) ( HOIST-AT ?auto_8891 ?auto_8879 ) ( SURFACE-AT ?auto_8871 ?auto_8879 ) ( ON ?auto_8871 ?auto_8885 ) ( CLEAR ?auto_8871 ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8885 ) ) ( not ( = ?auto_8871 ?auto_8885 ) ) ( not ( = ?auto_8876 ?auto_8891 ) ) ( IS-CRATE ?auto_8870 ) ( AVAILABLE ?auto_8891 ) ( SURFACE-AT ?auto_8870 ?auto_8879 ) ( ON ?auto_8870 ?auto_8894 ) ( CLEAR ?auto_8870 ) ( not ( = ?auto_8869 ?auto_8870 ) ) ( not ( = ?auto_8869 ?auto_8894 ) ) ( not ( = ?auto_8870 ?auto_8894 ) ) ( IS-CRATE ?auto_8869 ) ( not ( = ?auto_8880 ?auto_8878 ) ) ( HOIST-AT ?auto_8888 ?auto_8880 ) ( SURFACE-AT ?auto_8869 ?auto_8880 ) ( ON ?auto_8869 ?auto_8896 ) ( CLEAR ?auto_8869 ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8868 ?auto_8896 ) ) ( not ( = ?auto_8869 ?auto_8896 ) ) ( not ( = ?auto_8876 ?auto_8888 ) ) ( IS-CRATE ?auto_8868 ) ( not ( = ?auto_8892 ?auto_8878 ) ) ( HOIST-AT ?auto_8881 ?auto_8892 ) ( AVAILABLE ?auto_8881 ) ( SURFACE-AT ?auto_8868 ?auto_8892 ) ( ON ?auto_8868 ?auto_8890 ) ( CLEAR ?auto_8868 ) ( not ( = ?auto_8867 ?auto_8868 ) ) ( not ( = ?auto_8867 ?auto_8890 ) ) ( not ( = ?auto_8868 ?auto_8890 ) ) ( not ( = ?auto_8876 ?auto_8881 ) ) ( IS-CRATE ?auto_8867 ) ( AVAILABLE ?auto_8888 ) ( SURFACE-AT ?auto_8867 ?auto_8880 ) ( ON ?auto_8867 ?auto_8882 ) ( CLEAR ?auto_8867 ) ( not ( = ?auto_8866 ?auto_8867 ) ) ( not ( = ?auto_8866 ?auto_8882 ) ) ( not ( = ?auto_8867 ?auto_8882 ) ) ( IS-CRATE ?auto_8866 ) ( not ( = ?auto_8887 ?auto_8878 ) ) ( HOIST-AT ?auto_8886 ?auto_8887 ) ( AVAILABLE ?auto_8886 ) ( SURFACE-AT ?auto_8866 ?auto_8887 ) ( ON ?auto_8866 ?auto_8895 ) ( CLEAR ?auto_8866 ) ( not ( = ?auto_8865 ?auto_8866 ) ) ( not ( = ?auto_8865 ?auto_8895 ) ) ( not ( = ?auto_8866 ?auto_8895 ) ) ( not ( = ?auto_8876 ?auto_8886 ) ) ( IS-CRATE ?auto_8865 ) ( not ( = ?auto_8884 ?auto_8878 ) ) ( HOIST-AT ?auto_8893 ?auto_8884 ) ( AVAILABLE ?auto_8893 ) ( SURFACE-AT ?auto_8865 ?auto_8884 ) ( ON ?auto_8865 ?auto_8883 ) ( CLEAR ?auto_8865 ) ( not ( = ?auto_8864 ?auto_8865 ) ) ( not ( = ?auto_8864 ?auto_8883 ) ) ( not ( = ?auto_8865 ?auto_8883 ) ) ( not ( = ?auto_8876 ?auto_8893 ) ) ( SURFACE-AT ?auto_8863 ?auto_8878 ) ( CLEAR ?auto_8863 ) ( IS-CRATE ?auto_8864 ) ( AVAILABLE ?auto_8876 ) ( AVAILABLE ?auto_8873 ) ( SURFACE-AT ?auto_8864 ?auto_8877 ) ( ON ?auto_8864 ?auto_8889 ) ( CLEAR ?auto_8864 ) ( TRUCK-AT ?auto_8874 ?auto_8878 ) ( not ( = ?auto_8863 ?auto_8864 ) ) ( not ( = ?auto_8863 ?auto_8889 ) ) ( not ( = ?auto_8864 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8865 ) ) ( not ( = ?auto_8863 ?auto_8883 ) ) ( not ( = ?auto_8865 ?auto_8889 ) ) ( not ( = ?auto_8884 ?auto_8877 ) ) ( not ( = ?auto_8893 ?auto_8873 ) ) ( not ( = ?auto_8883 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8866 ) ) ( not ( = ?auto_8863 ?auto_8895 ) ) ( not ( = ?auto_8864 ?auto_8866 ) ) ( not ( = ?auto_8864 ?auto_8895 ) ) ( not ( = ?auto_8866 ?auto_8883 ) ) ( not ( = ?auto_8866 ?auto_8889 ) ) ( not ( = ?auto_8887 ?auto_8884 ) ) ( not ( = ?auto_8887 ?auto_8877 ) ) ( not ( = ?auto_8886 ?auto_8893 ) ) ( not ( = ?auto_8886 ?auto_8873 ) ) ( not ( = ?auto_8895 ?auto_8883 ) ) ( not ( = ?auto_8895 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8867 ) ) ( not ( = ?auto_8863 ?auto_8882 ) ) ( not ( = ?auto_8864 ?auto_8867 ) ) ( not ( = ?auto_8864 ?auto_8882 ) ) ( not ( = ?auto_8865 ?auto_8867 ) ) ( not ( = ?auto_8865 ?auto_8882 ) ) ( not ( = ?auto_8867 ?auto_8895 ) ) ( not ( = ?auto_8867 ?auto_8883 ) ) ( not ( = ?auto_8867 ?auto_8889 ) ) ( not ( = ?auto_8880 ?auto_8887 ) ) ( not ( = ?auto_8880 ?auto_8884 ) ) ( not ( = ?auto_8880 ?auto_8877 ) ) ( not ( = ?auto_8888 ?auto_8886 ) ) ( not ( = ?auto_8888 ?auto_8893 ) ) ( not ( = ?auto_8888 ?auto_8873 ) ) ( not ( = ?auto_8882 ?auto_8895 ) ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( not ( = ?auto_8882 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8868 ) ) ( not ( = ?auto_8863 ?auto_8890 ) ) ( not ( = ?auto_8864 ?auto_8868 ) ) ( not ( = ?auto_8864 ?auto_8890 ) ) ( not ( = ?auto_8865 ?auto_8868 ) ) ( not ( = ?auto_8865 ?auto_8890 ) ) ( not ( = ?auto_8866 ?auto_8868 ) ) ( not ( = ?auto_8866 ?auto_8890 ) ) ( not ( = ?auto_8868 ?auto_8882 ) ) ( not ( = ?auto_8868 ?auto_8895 ) ) ( not ( = ?auto_8868 ?auto_8883 ) ) ( not ( = ?auto_8868 ?auto_8889 ) ) ( not ( = ?auto_8892 ?auto_8880 ) ) ( not ( = ?auto_8892 ?auto_8887 ) ) ( not ( = ?auto_8892 ?auto_8884 ) ) ( not ( = ?auto_8892 ?auto_8877 ) ) ( not ( = ?auto_8881 ?auto_8888 ) ) ( not ( = ?auto_8881 ?auto_8886 ) ) ( not ( = ?auto_8881 ?auto_8893 ) ) ( not ( = ?auto_8881 ?auto_8873 ) ) ( not ( = ?auto_8890 ?auto_8882 ) ) ( not ( = ?auto_8890 ?auto_8895 ) ) ( not ( = ?auto_8890 ?auto_8883 ) ) ( not ( = ?auto_8890 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8869 ) ) ( not ( = ?auto_8863 ?auto_8896 ) ) ( not ( = ?auto_8864 ?auto_8869 ) ) ( not ( = ?auto_8864 ?auto_8896 ) ) ( not ( = ?auto_8865 ?auto_8869 ) ) ( not ( = ?auto_8865 ?auto_8896 ) ) ( not ( = ?auto_8866 ?auto_8869 ) ) ( not ( = ?auto_8866 ?auto_8896 ) ) ( not ( = ?auto_8867 ?auto_8869 ) ) ( not ( = ?auto_8867 ?auto_8896 ) ) ( not ( = ?auto_8869 ?auto_8890 ) ) ( not ( = ?auto_8869 ?auto_8882 ) ) ( not ( = ?auto_8869 ?auto_8895 ) ) ( not ( = ?auto_8869 ?auto_8883 ) ) ( not ( = ?auto_8869 ?auto_8889 ) ) ( not ( = ?auto_8896 ?auto_8890 ) ) ( not ( = ?auto_8896 ?auto_8882 ) ) ( not ( = ?auto_8896 ?auto_8895 ) ) ( not ( = ?auto_8896 ?auto_8883 ) ) ( not ( = ?auto_8896 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8870 ) ) ( not ( = ?auto_8863 ?auto_8894 ) ) ( not ( = ?auto_8864 ?auto_8870 ) ) ( not ( = ?auto_8864 ?auto_8894 ) ) ( not ( = ?auto_8865 ?auto_8870 ) ) ( not ( = ?auto_8865 ?auto_8894 ) ) ( not ( = ?auto_8866 ?auto_8870 ) ) ( not ( = ?auto_8866 ?auto_8894 ) ) ( not ( = ?auto_8867 ?auto_8870 ) ) ( not ( = ?auto_8867 ?auto_8894 ) ) ( not ( = ?auto_8868 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8894 ) ) ( not ( = ?auto_8870 ?auto_8896 ) ) ( not ( = ?auto_8870 ?auto_8890 ) ) ( not ( = ?auto_8870 ?auto_8882 ) ) ( not ( = ?auto_8870 ?auto_8895 ) ) ( not ( = ?auto_8870 ?auto_8883 ) ) ( not ( = ?auto_8870 ?auto_8889 ) ) ( not ( = ?auto_8879 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8892 ) ) ( not ( = ?auto_8879 ?auto_8887 ) ) ( not ( = ?auto_8879 ?auto_8884 ) ) ( not ( = ?auto_8879 ?auto_8877 ) ) ( not ( = ?auto_8891 ?auto_8888 ) ) ( not ( = ?auto_8891 ?auto_8881 ) ) ( not ( = ?auto_8891 ?auto_8886 ) ) ( not ( = ?auto_8891 ?auto_8893 ) ) ( not ( = ?auto_8891 ?auto_8873 ) ) ( not ( = ?auto_8894 ?auto_8896 ) ) ( not ( = ?auto_8894 ?auto_8890 ) ) ( not ( = ?auto_8894 ?auto_8882 ) ) ( not ( = ?auto_8894 ?auto_8895 ) ) ( not ( = ?auto_8894 ?auto_8883 ) ) ( not ( = ?auto_8894 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8871 ) ) ( not ( = ?auto_8863 ?auto_8885 ) ) ( not ( = ?auto_8864 ?auto_8871 ) ) ( not ( = ?auto_8864 ?auto_8885 ) ) ( not ( = ?auto_8865 ?auto_8871 ) ) ( not ( = ?auto_8865 ?auto_8885 ) ) ( not ( = ?auto_8866 ?auto_8871 ) ) ( not ( = ?auto_8866 ?auto_8885 ) ) ( not ( = ?auto_8867 ?auto_8871 ) ) ( not ( = ?auto_8867 ?auto_8885 ) ) ( not ( = ?auto_8868 ?auto_8871 ) ) ( not ( = ?auto_8868 ?auto_8885 ) ) ( not ( = ?auto_8869 ?auto_8871 ) ) ( not ( = ?auto_8869 ?auto_8885 ) ) ( not ( = ?auto_8871 ?auto_8894 ) ) ( not ( = ?auto_8871 ?auto_8896 ) ) ( not ( = ?auto_8871 ?auto_8890 ) ) ( not ( = ?auto_8871 ?auto_8882 ) ) ( not ( = ?auto_8871 ?auto_8895 ) ) ( not ( = ?auto_8871 ?auto_8883 ) ) ( not ( = ?auto_8871 ?auto_8889 ) ) ( not ( = ?auto_8885 ?auto_8894 ) ) ( not ( = ?auto_8885 ?auto_8896 ) ) ( not ( = ?auto_8885 ?auto_8890 ) ) ( not ( = ?auto_8885 ?auto_8882 ) ) ( not ( = ?auto_8885 ?auto_8895 ) ) ( not ( = ?auto_8885 ?auto_8883 ) ) ( not ( = ?auto_8885 ?auto_8889 ) ) ( not ( = ?auto_8863 ?auto_8872 ) ) ( not ( = ?auto_8863 ?auto_8875 ) ) ( not ( = ?auto_8864 ?auto_8872 ) ) ( not ( = ?auto_8864 ?auto_8875 ) ) ( not ( = ?auto_8865 ?auto_8872 ) ) ( not ( = ?auto_8865 ?auto_8875 ) ) ( not ( = ?auto_8866 ?auto_8872 ) ) ( not ( = ?auto_8866 ?auto_8875 ) ) ( not ( = ?auto_8867 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8875 ) ) ( not ( = ?auto_8868 ?auto_8872 ) ) ( not ( = ?auto_8868 ?auto_8875 ) ) ( not ( = ?auto_8869 ?auto_8872 ) ) ( not ( = ?auto_8869 ?auto_8875 ) ) ( not ( = ?auto_8870 ?auto_8872 ) ) ( not ( = ?auto_8870 ?auto_8875 ) ) ( not ( = ?auto_8872 ?auto_8885 ) ) ( not ( = ?auto_8872 ?auto_8894 ) ) ( not ( = ?auto_8872 ?auto_8896 ) ) ( not ( = ?auto_8872 ?auto_8890 ) ) ( not ( = ?auto_8872 ?auto_8882 ) ) ( not ( = ?auto_8872 ?auto_8895 ) ) ( not ( = ?auto_8872 ?auto_8883 ) ) ( not ( = ?auto_8872 ?auto_8889 ) ) ( not ( = ?auto_8875 ?auto_8885 ) ) ( not ( = ?auto_8875 ?auto_8894 ) ) ( not ( = ?auto_8875 ?auto_8896 ) ) ( not ( = ?auto_8875 ?auto_8890 ) ) ( not ( = ?auto_8875 ?auto_8882 ) ) ( not ( = ?auto_8875 ?auto_8895 ) ) ( not ( = ?auto_8875 ?auto_8883 ) ) ( not ( = ?auto_8875 ?auto_8889 ) ) )
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
      ?auto_8934 - HOIST
      ?auto_8929 - PLACE
      ?auto_8931 - PLACE
      ?auto_8933 - HOIST
      ?auto_8932 - SURFACE
      ?auto_8941 - PLACE
      ?auto_8952 - HOIST
      ?auto_8950 - SURFACE
      ?auto_8935 - PLACE
      ?auto_8953 - HOIST
      ?auto_8949 - SURFACE
      ?auto_8938 - SURFACE
      ?auto_8936 - PLACE
      ?auto_8948 - HOIST
      ?auto_8951 - SURFACE
      ?auto_8947 - PLACE
      ?auto_8939 - HOIST
      ?auto_8942 - SURFACE
      ?auto_8944 - SURFACE
      ?auto_8940 - SURFACE
      ?auto_8945 - PLACE
      ?auto_8943 - HOIST
      ?auto_8946 - SURFACE
      ?auto_8937 - SURFACE
      ?auto_8930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8934 ?auto_8929 ) ( IS-CRATE ?auto_8928 ) ( not ( = ?auto_8931 ?auto_8929 ) ) ( HOIST-AT ?auto_8933 ?auto_8931 ) ( SURFACE-AT ?auto_8928 ?auto_8931 ) ( ON ?auto_8928 ?auto_8932 ) ( CLEAR ?auto_8928 ) ( not ( = ?auto_8927 ?auto_8928 ) ) ( not ( = ?auto_8927 ?auto_8932 ) ) ( not ( = ?auto_8928 ?auto_8932 ) ) ( not ( = ?auto_8934 ?auto_8933 ) ) ( IS-CRATE ?auto_8927 ) ( not ( = ?auto_8941 ?auto_8929 ) ) ( HOIST-AT ?auto_8952 ?auto_8941 ) ( SURFACE-AT ?auto_8927 ?auto_8941 ) ( ON ?auto_8927 ?auto_8950 ) ( CLEAR ?auto_8927 ) ( not ( = ?auto_8926 ?auto_8927 ) ) ( not ( = ?auto_8926 ?auto_8950 ) ) ( not ( = ?auto_8927 ?auto_8950 ) ) ( not ( = ?auto_8934 ?auto_8952 ) ) ( IS-CRATE ?auto_8926 ) ( not ( = ?auto_8935 ?auto_8929 ) ) ( HOIST-AT ?auto_8953 ?auto_8935 ) ( SURFACE-AT ?auto_8926 ?auto_8935 ) ( ON ?auto_8926 ?auto_8949 ) ( CLEAR ?auto_8926 ) ( not ( = ?auto_8925 ?auto_8926 ) ) ( not ( = ?auto_8925 ?auto_8949 ) ) ( not ( = ?auto_8926 ?auto_8949 ) ) ( not ( = ?auto_8934 ?auto_8953 ) ) ( IS-CRATE ?auto_8925 ) ( AVAILABLE ?auto_8953 ) ( SURFACE-AT ?auto_8925 ?auto_8935 ) ( ON ?auto_8925 ?auto_8938 ) ( CLEAR ?auto_8925 ) ( not ( = ?auto_8924 ?auto_8925 ) ) ( not ( = ?auto_8924 ?auto_8938 ) ) ( not ( = ?auto_8925 ?auto_8938 ) ) ( IS-CRATE ?auto_8924 ) ( not ( = ?auto_8936 ?auto_8929 ) ) ( HOIST-AT ?auto_8948 ?auto_8936 ) ( SURFACE-AT ?auto_8924 ?auto_8936 ) ( ON ?auto_8924 ?auto_8951 ) ( CLEAR ?auto_8924 ) ( not ( = ?auto_8923 ?auto_8924 ) ) ( not ( = ?auto_8923 ?auto_8951 ) ) ( not ( = ?auto_8924 ?auto_8951 ) ) ( not ( = ?auto_8934 ?auto_8948 ) ) ( IS-CRATE ?auto_8923 ) ( not ( = ?auto_8947 ?auto_8929 ) ) ( HOIST-AT ?auto_8939 ?auto_8947 ) ( AVAILABLE ?auto_8939 ) ( SURFACE-AT ?auto_8923 ?auto_8947 ) ( ON ?auto_8923 ?auto_8942 ) ( CLEAR ?auto_8923 ) ( not ( = ?auto_8922 ?auto_8923 ) ) ( not ( = ?auto_8922 ?auto_8942 ) ) ( not ( = ?auto_8923 ?auto_8942 ) ) ( not ( = ?auto_8934 ?auto_8939 ) ) ( IS-CRATE ?auto_8922 ) ( AVAILABLE ?auto_8948 ) ( SURFACE-AT ?auto_8922 ?auto_8936 ) ( ON ?auto_8922 ?auto_8944 ) ( CLEAR ?auto_8922 ) ( not ( = ?auto_8921 ?auto_8922 ) ) ( not ( = ?auto_8921 ?auto_8944 ) ) ( not ( = ?auto_8922 ?auto_8944 ) ) ( IS-CRATE ?auto_8921 ) ( AVAILABLE ?auto_8933 ) ( SURFACE-AT ?auto_8921 ?auto_8931 ) ( ON ?auto_8921 ?auto_8940 ) ( CLEAR ?auto_8921 ) ( not ( = ?auto_8920 ?auto_8921 ) ) ( not ( = ?auto_8920 ?auto_8940 ) ) ( not ( = ?auto_8921 ?auto_8940 ) ) ( IS-CRATE ?auto_8920 ) ( not ( = ?auto_8945 ?auto_8929 ) ) ( HOIST-AT ?auto_8943 ?auto_8945 ) ( AVAILABLE ?auto_8943 ) ( SURFACE-AT ?auto_8920 ?auto_8945 ) ( ON ?auto_8920 ?auto_8946 ) ( CLEAR ?auto_8920 ) ( not ( = ?auto_8919 ?auto_8920 ) ) ( not ( = ?auto_8919 ?auto_8946 ) ) ( not ( = ?auto_8920 ?auto_8946 ) ) ( not ( = ?auto_8934 ?auto_8943 ) ) ( SURFACE-AT ?auto_8918 ?auto_8929 ) ( CLEAR ?auto_8918 ) ( IS-CRATE ?auto_8919 ) ( AVAILABLE ?auto_8934 ) ( AVAILABLE ?auto_8952 ) ( SURFACE-AT ?auto_8919 ?auto_8941 ) ( ON ?auto_8919 ?auto_8937 ) ( CLEAR ?auto_8919 ) ( TRUCK-AT ?auto_8930 ?auto_8929 ) ( not ( = ?auto_8918 ?auto_8919 ) ) ( not ( = ?auto_8918 ?auto_8937 ) ) ( not ( = ?auto_8919 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8920 ) ) ( not ( = ?auto_8918 ?auto_8946 ) ) ( not ( = ?auto_8920 ?auto_8937 ) ) ( not ( = ?auto_8945 ?auto_8941 ) ) ( not ( = ?auto_8943 ?auto_8952 ) ) ( not ( = ?auto_8946 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8921 ) ) ( not ( = ?auto_8918 ?auto_8940 ) ) ( not ( = ?auto_8919 ?auto_8921 ) ) ( not ( = ?auto_8919 ?auto_8940 ) ) ( not ( = ?auto_8921 ?auto_8946 ) ) ( not ( = ?auto_8921 ?auto_8937 ) ) ( not ( = ?auto_8931 ?auto_8945 ) ) ( not ( = ?auto_8931 ?auto_8941 ) ) ( not ( = ?auto_8933 ?auto_8943 ) ) ( not ( = ?auto_8933 ?auto_8952 ) ) ( not ( = ?auto_8940 ?auto_8946 ) ) ( not ( = ?auto_8940 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8922 ) ) ( not ( = ?auto_8918 ?auto_8944 ) ) ( not ( = ?auto_8919 ?auto_8922 ) ) ( not ( = ?auto_8919 ?auto_8944 ) ) ( not ( = ?auto_8920 ?auto_8922 ) ) ( not ( = ?auto_8920 ?auto_8944 ) ) ( not ( = ?auto_8922 ?auto_8940 ) ) ( not ( = ?auto_8922 ?auto_8946 ) ) ( not ( = ?auto_8922 ?auto_8937 ) ) ( not ( = ?auto_8936 ?auto_8931 ) ) ( not ( = ?auto_8936 ?auto_8945 ) ) ( not ( = ?auto_8936 ?auto_8941 ) ) ( not ( = ?auto_8948 ?auto_8933 ) ) ( not ( = ?auto_8948 ?auto_8943 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8944 ?auto_8940 ) ) ( not ( = ?auto_8944 ?auto_8946 ) ) ( not ( = ?auto_8944 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8923 ) ) ( not ( = ?auto_8918 ?auto_8942 ) ) ( not ( = ?auto_8919 ?auto_8923 ) ) ( not ( = ?auto_8919 ?auto_8942 ) ) ( not ( = ?auto_8920 ?auto_8923 ) ) ( not ( = ?auto_8920 ?auto_8942 ) ) ( not ( = ?auto_8921 ?auto_8923 ) ) ( not ( = ?auto_8921 ?auto_8942 ) ) ( not ( = ?auto_8923 ?auto_8944 ) ) ( not ( = ?auto_8923 ?auto_8940 ) ) ( not ( = ?auto_8923 ?auto_8946 ) ) ( not ( = ?auto_8923 ?auto_8937 ) ) ( not ( = ?auto_8947 ?auto_8936 ) ) ( not ( = ?auto_8947 ?auto_8931 ) ) ( not ( = ?auto_8947 ?auto_8945 ) ) ( not ( = ?auto_8947 ?auto_8941 ) ) ( not ( = ?auto_8939 ?auto_8948 ) ) ( not ( = ?auto_8939 ?auto_8933 ) ) ( not ( = ?auto_8939 ?auto_8943 ) ) ( not ( = ?auto_8939 ?auto_8952 ) ) ( not ( = ?auto_8942 ?auto_8944 ) ) ( not ( = ?auto_8942 ?auto_8940 ) ) ( not ( = ?auto_8942 ?auto_8946 ) ) ( not ( = ?auto_8942 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8924 ) ) ( not ( = ?auto_8918 ?auto_8951 ) ) ( not ( = ?auto_8919 ?auto_8924 ) ) ( not ( = ?auto_8919 ?auto_8951 ) ) ( not ( = ?auto_8920 ?auto_8924 ) ) ( not ( = ?auto_8920 ?auto_8951 ) ) ( not ( = ?auto_8921 ?auto_8924 ) ) ( not ( = ?auto_8921 ?auto_8951 ) ) ( not ( = ?auto_8922 ?auto_8924 ) ) ( not ( = ?auto_8922 ?auto_8951 ) ) ( not ( = ?auto_8924 ?auto_8942 ) ) ( not ( = ?auto_8924 ?auto_8944 ) ) ( not ( = ?auto_8924 ?auto_8940 ) ) ( not ( = ?auto_8924 ?auto_8946 ) ) ( not ( = ?auto_8924 ?auto_8937 ) ) ( not ( = ?auto_8951 ?auto_8942 ) ) ( not ( = ?auto_8951 ?auto_8944 ) ) ( not ( = ?auto_8951 ?auto_8940 ) ) ( not ( = ?auto_8951 ?auto_8946 ) ) ( not ( = ?auto_8951 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8925 ) ) ( not ( = ?auto_8918 ?auto_8938 ) ) ( not ( = ?auto_8919 ?auto_8925 ) ) ( not ( = ?auto_8919 ?auto_8938 ) ) ( not ( = ?auto_8920 ?auto_8925 ) ) ( not ( = ?auto_8920 ?auto_8938 ) ) ( not ( = ?auto_8921 ?auto_8925 ) ) ( not ( = ?auto_8921 ?auto_8938 ) ) ( not ( = ?auto_8922 ?auto_8925 ) ) ( not ( = ?auto_8922 ?auto_8938 ) ) ( not ( = ?auto_8923 ?auto_8925 ) ) ( not ( = ?auto_8923 ?auto_8938 ) ) ( not ( = ?auto_8925 ?auto_8951 ) ) ( not ( = ?auto_8925 ?auto_8942 ) ) ( not ( = ?auto_8925 ?auto_8944 ) ) ( not ( = ?auto_8925 ?auto_8940 ) ) ( not ( = ?auto_8925 ?auto_8946 ) ) ( not ( = ?auto_8925 ?auto_8937 ) ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8935 ?auto_8947 ) ) ( not ( = ?auto_8935 ?auto_8931 ) ) ( not ( = ?auto_8935 ?auto_8945 ) ) ( not ( = ?auto_8935 ?auto_8941 ) ) ( not ( = ?auto_8953 ?auto_8948 ) ) ( not ( = ?auto_8953 ?auto_8939 ) ) ( not ( = ?auto_8953 ?auto_8933 ) ) ( not ( = ?auto_8953 ?auto_8943 ) ) ( not ( = ?auto_8953 ?auto_8952 ) ) ( not ( = ?auto_8938 ?auto_8951 ) ) ( not ( = ?auto_8938 ?auto_8942 ) ) ( not ( = ?auto_8938 ?auto_8944 ) ) ( not ( = ?auto_8938 ?auto_8940 ) ) ( not ( = ?auto_8938 ?auto_8946 ) ) ( not ( = ?auto_8938 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8926 ) ) ( not ( = ?auto_8918 ?auto_8949 ) ) ( not ( = ?auto_8919 ?auto_8926 ) ) ( not ( = ?auto_8919 ?auto_8949 ) ) ( not ( = ?auto_8920 ?auto_8926 ) ) ( not ( = ?auto_8920 ?auto_8949 ) ) ( not ( = ?auto_8921 ?auto_8926 ) ) ( not ( = ?auto_8921 ?auto_8949 ) ) ( not ( = ?auto_8922 ?auto_8926 ) ) ( not ( = ?auto_8922 ?auto_8949 ) ) ( not ( = ?auto_8923 ?auto_8926 ) ) ( not ( = ?auto_8923 ?auto_8949 ) ) ( not ( = ?auto_8924 ?auto_8926 ) ) ( not ( = ?auto_8924 ?auto_8949 ) ) ( not ( = ?auto_8926 ?auto_8938 ) ) ( not ( = ?auto_8926 ?auto_8951 ) ) ( not ( = ?auto_8926 ?auto_8942 ) ) ( not ( = ?auto_8926 ?auto_8944 ) ) ( not ( = ?auto_8926 ?auto_8940 ) ) ( not ( = ?auto_8926 ?auto_8946 ) ) ( not ( = ?auto_8926 ?auto_8937 ) ) ( not ( = ?auto_8949 ?auto_8938 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8949 ?auto_8942 ) ) ( not ( = ?auto_8949 ?auto_8944 ) ) ( not ( = ?auto_8949 ?auto_8940 ) ) ( not ( = ?auto_8949 ?auto_8946 ) ) ( not ( = ?auto_8949 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8927 ) ) ( not ( = ?auto_8918 ?auto_8950 ) ) ( not ( = ?auto_8919 ?auto_8927 ) ) ( not ( = ?auto_8919 ?auto_8950 ) ) ( not ( = ?auto_8920 ?auto_8927 ) ) ( not ( = ?auto_8920 ?auto_8950 ) ) ( not ( = ?auto_8921 ?auto_8927 ) ) ( not ( = ?auto_8921 ?auto_8950 ) ) ( not ( = ?auto_8922 ?auto_8927 ) ) ( not ( = ?auto_8922 ?auto_8950 ) ) ( not ( = ?auto_8923 ?auto_8927 ) ) ( not ( = ?auto_8923 ?auto_8950 ) ) ( not ( = ?auto_8924 ?auto_8927 ) ) ( not ( = ?auto_8924 ?auto_8950 ) ) ( not ( = ?auto_8925 ?auto_8927 ) ) ( not ( = ?auto_8925 ?auto_8950 ) ) ( not ( = ?auto_8927 ?auto_8949 ) ) ( not ( = ?auto_8927 ?auto_8938 ) ) ( not ( = ?auto_8927 ?auto_8951 ) ) ( not ( = ?auto_8927 ?auto_8942 ) ) ( not ( = ?auto_8927 ?auto_8944 ) ) ( not ( = ?auto_8927 ?auto_8940 ) ) ( not ( = ?auto_8927 ?auto_8946 ) ) ( not ( = ?auto_8927 ?auto_8937 ) ) ( not ( = ?auto_8950 ?auto_8949 ) ) ( not ( = ?auto_8950 ?auto_8938 ) ) ( not ( = ?auto_8950 ?auto_8951 ) ) ( not ( = ?auto_8950 ?auto_8942 ) ) ( not ( = ?auto_8950 ?auto_8944 ) ) ( not ( = ?auto_8950 ?auto_8940 ) ) ( not ( = ?auto_8950 ?auto_8946 ) ) ( not ( = ?auto_8950 ?auto_8937 ) ) ( not ( = ?auto_8918 ?auto_8928 ) ) ( not ( = ?auto_8918 ?auto_8932 ) ) ( not ( = ?auto_8919 ?auto_8928 ) ) ( not ( = ?auto_8919 ?auto_8932 ) ) ( not ( = ?auto_8920 ?auto_8928 ) ) ( not ( = ?auto_8920 ?auto_8932 ) ) ( not ( = ?auto_8921 ?auto_8928 ) ) ( not ( = ?auto_8921 ?auto_8932 ) ) ( not ( = ?auto_8922 ?auto_8928 ) ) ( not ( = ?auto_8922 ?auto_8932 ) ) ( not ( = ?auto_8923 ?auto_8928 ) ) ( not ( = ?auto_8923 ?auto_8932 ) ) ( not ( = ?auto_8924 ?auto_8928 ) ) ( not ( = ?auto_8924 ?auto_8932 ) ) ( not ( = ?auto_8925 ?auto_8928 ) ) ( not ( = ?auto_8925 ?auto_8932 ) ) ( not ( = ?auto_8926 ?auto_8928 ) ) ( not ( = ?auto_8926 ?auto_8932 ) ) ( not ( = ?auto_8928 ?auto_8950 ) ) ( not ( = ?auto_8928 ?auto_8949 ) ) ( not ( = ?auto_8928 ?auto_8938 ) ) ( not ( = ?auto_8928 ?auto_8951 ) ) ( not ( = ?auto_8928 ?auto_8942 ) ) ( not ( = ?auto_8928 ?auto_8944 ) ) ( not ( = ?auto_8928 ?auto_8940 ) ) ( not ( = ?auto_8928 ?auto_8946 ) ) ( not ( = ?auto_8928 ?auto_8937 ) ) ( not ( = ?auto_8932 ?auto_8950 ) ) ( not ( = ?auto_8932 ?auto_8949 ) ) ( not ( = ?auto_8932 ?auto_8938 ) ) ( not ( = ?auto_8932 ?auto_8951 ) ) ( not ( = ?auto_8932 ?auto_8942 ) ) ( not ( = ?auto_8932 ?auto_8944 ) ) ( not ( = ?auto_8932 ?auto_8940 ) ) ( not ( = ?auto_8932 ?auto_8946 ) ) ( not ( = ?auto_8932 ?auto_8937 ) ) )
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
      ?auto_8988 - PLACE
      ?auto_8991 - PLACE
      ?auto_8992 - HOIST
      ?auto_8990 - SURFACE
      ?auto_9012 - PLACE
      ?auto_9014 - HOIST
      ?auto_9006 - SURFACE
      ?auto_9013 - PLACE
      ?auto_8997 - HOIST
      ?auto_9008 - SURFACE
      ?auto_8994 - PLACE
      ?auto_8999 - HOIST
      ?auto_9003 - SURFACE
      ?auto_8998 - SURFACE
      ?auto_9001 - PLACE
      ?auto_9007 - HOIST
      ?auto_9004 - SURFACE
      ?auto_9009 - PLACE
      ?auto_8996 - HOIST
      ?auto_9000 - SURFACE
      ?auto_9015 - SURFACE
      ?auto_8995 - SURFACE
      ?auto_9010 - PLACE
      ?auto_9011 - HOIST
      ?auto_9002 - SURFACE
      ?auto_9005 - SURFACE
      ?auto_8989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8993 ?auto_8988 ) ( IS-CRATE ?auto_8987 ) ( not ( = ?auto_8991 ?auto_8988 ) ) ( HOIST-AT ?auto_8992 ?auto_8991 ) ( AVAILABLE ?auto_8992 ) ( SURFACE-AT ?auto_8987 ?auto_8991 ) ( ON ?auto_8987 ?auto_8990 ) ( CLEAR ?auto_8987 ) ( not ( = ?auto_8986 ?auto_8987 ) ) ( not ( = ?auto_8986 ?auto_8990 ) ) ( not ( = ?auto_8987 ?auto_8990 ) ) ( not ( = ?auto_8993 ?auto_8992 ) ) ( IS-CRATE ?auto_8986 ) ( not ( = ?auto_9012 ?auto_8988 ) ) ( HOIST-AT ?auto_9014 ?auto_9012 ) ( SURFACE-AT ?auto_8986 ?auto_9012 ) ( ON ?auto_8986 ?auto_9006 ) ( CLEAR ?auto_8986 ) ( not ( = ?auto_8985 ?auto_8986 ) ) ( not ( = ?auto_8985 ?auto_9006 ) ) ( not ( = ?auto_8986 ?auto_9006 ) ) ( not ( = ?auto_8993 ?auto_9014 ) ) ( IS-CRATE ?auto_8985 ) ( not ( = ?auto_9013 ?auto_8988 ) ) ( HOIST-AT ?auto_8997 ?auto_9013 ) ( SURFACE-AT ?auto_8985 ?auto_9013 ) ( ON ?auto_8985 ?auto_9008 ) ( CLEAR ?auto_8985 ) ( not ( = ?auto_8984 ?auto_8985 ) ) ( not ( = ?auto_8984 ?auto_9008 ) ) ( not ( = ?auto_8985 ?auto_9008 ) ) ( not ( = ?auto_8993 ?auto_8997 ) ) ( IS-CRATE ?auto_8984 ) ( not ( = ?auto_8994 ?auto_8988 ) ) ( HOIST-AT ?auto_8999 ?auto_8994 ) ( SURFACE-AT ?auto_8984 ?auto_8994 ) ( ON ?auto_8984 ?auto_9003 ) ( CLEAR ?auto_8984 ) ( not ( = ?auto_8983 ?auto_8984 ) ) ( not ( = ?auto_8983 ?auto_9003 ) ) ( not ( = ?auto_8984 ?auto_9003 ) ) ( not ( = ?auto_8993 ?auto_8999 ) ) ( IS-CRATE ?auto_8983 ) ( AVAILABLE ?auto_8999 ) ( SURFACE-AT ?auto_8983 ?auto_8994 ) ( ON ?auto_8983 ?auto_8998 ) ( CLEAR ?auto_8983 ) ( not ( = ?auto_8982 ?auto_8983 ) ) ( not ( = ?auto_8982 ?auto_8998 ) ) ( not ( = ?auto_8983 ?auto_8998 ) ) ( IS-CRATE ?auto_8982 ) ( not ( = ?auto_9001 ?auto_8988 ) ) ( HOIST-AT ?auto_9007 ?auto_9001 ) ( SURFACE-AT ?auto_8982 ?auto_9001 ) ( ON ?auto_8982 ?auto_9004 ) ( CLEAR ?auto_8982 ) ( not ( = ?auto_8981 ?auto_8982 ) ) ( not ( = ?auto_8981 ?auto_9004 ) ) ( not ( = ?auto_8982 ?auto_9004 ) ) ( not ( = ?auto_8993 ?auto_9007 ) ) ( IS-CRATE ?auto_8981 ) ( not ( = ?auto_9009 ?auto_8988 ) ) ( HOIST-AT ?auto_8996 ?auto_9009 ) ( AVAILABLE ?auto_8996 ) ( SURFACE-AT ?auto_8981 ?auto_9009 ) ( ON ?auto_8981 ?auto_9000 ) ( CLEAR ?auto_8981 ) ( not ( = ?auto_8980 ?auto_8981 ) ) ( not ( = ?auto_8980 ?auto_9000 ) ) ( not ( = ?auto_8981 ?auto_9000 ) ) ( not ( = ?auto_8993 ?auto_8996 ) ) ( IS-CRATE ?auto_8980 ) ( AVAILABLE ?auto_9007 ) ( SURFACE-AT ?auto_8980 ?auto_9001 ) ( ON ?auto_8980 ?auto_9015 ) ( CLEAR ?auto_8980 ) ( not ( = ?auto_8979 ?auto_8980 ) ) ( not ( = ?auto_8979 ?auto_9015 ) ) ( not ( = ?auto_8980 ?auto_9015 ) ) ( IS-CRATE ?auto_8979 ) ( AVAILABLE ?auto_9014 ) ( SURFACE-AT ?auto_8979 ?auto_9012 ) ( ON ?auto_8979 ?auto_8995 ) ( CLEAR ?auto_8979 ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_8995 ) ) ( not ( = ?auto_8979 ?auto_8995 ) ) ( IS-CRATE ?auto_8978 ) ( not ( = ?auto_9010 ?auto_8988 ) ) ( HOIST-AT ?auto_9011 ?auto_9010 ) ( AVAILABLE ?auto_9011 ) ( SURFACE-AT ?auto_8978 ?auto_9010 ) ( ON ?auto_8978 ?auto_9002 ) ( CLEAR ?auto_8978 ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8977 ?auto_9002 ) ) ( not ( = ?auto_8978 ?auto_9002 ) ) ( not ( = ?auto_8993 ?auto_9011 ) ) ( SURFACE-AT ?auto_8976 ?auto_8988 ) ( CLEAR ?auto_8976 ) ( IS-CRATE ?auto_8977 ) ( AVAILABLE ?auto_8993 ) ( AVAILABLE ?auto_8997 ) ( SURFACE-AT ?auto_8977 ?auto_9013 ) ( ON ?auto_8977 ?auto_9005 ) ( CLEAR ?auto_8977 ) ( TRUCK-AT ?auto_8989 ?auto_8988 ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( not ( = ?auto_8976 ?auto_9005 ) ) ( not ( = ?auto_8977 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8978 ) ) ( not ( = ?auto_8976 ?auto_9002 ) ) ( not ( = ?auto_8978 ?auto_9005 ) ) ( not ( = ?auto_9010 ?auto_9013 ) ) ( not ( = ?auto_9011 ?auto_8997 ) ) ( not ( = ?auto_9002 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8979 ) ) ( not ( = ?auto_8976 ?auto_8995 ) ) ( not ( = ?auto_8977 ?auto_8979 ) ) ( not ( = ?auto_8977 ?auto_8995 ) ) ( not ( = ?auto_8979 ?auto_9002 ) ) ( not ( = ?auto_8979 ?auto_9005 ) ) ( not ( = ?auto_9012 ?auto_9010 ) ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( not ( = ?auto_9014 ?auto_9011 ) ) ( not ( = ?auto_9014 ?auto_8997 ) ) ( not ( = ?auto_8995 ?auto_9002 ) ) ( not ( = ?auto_8995 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8980 ) ) ( not ( = ?auto_8976 ?auto_9015 ) ) ( not ( = ?auto_8977 ?auto_8980 ) ) ( not ( = ?auto_8977 ?auto_9015 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( not ( = ?auto_8978 ?auto_9015 ) ) ( not ( = ?auto_8980 ?auto_8995 ) ) ( not ( = ?auto_8980 ?auto_9002 ) ) ( not ( = ?auto_8980 ?auto_9005 ) ) ( not ( = ?auto_9001 ?auto_9012 ) ) ( not ( = ?auto_9001 ?auto_9010 ) ) ( not ( = ?auto_9001 ?auto_9013 ) ) ( not ( = ?auto_9007 ?auto_9014 ) ) ( not ( = ?auto_9007 ?auto_9011 ) ) ( not ( = ?auto_9007 ?auto_8997 ) ) ( not ( = ?auto_9015 ?auto_8995 ) ) ( not ( = ?auto_9015 ?auto_9002 ) ) ( not ( = ?auto_9015 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8981 ) ) ( not ( = ?auto_8976 ?auto_9000 ) ) ( not ( = ?auto_8977 ?auto_8981 ) ) ( not ( = ?auto_8977 ?auto_9000 ) ) ( not ( = ?auto_8978 ?auto_8981 ) ) ( not ( = ?auto_8978 ?auto_9000 ) ) ( not ( = ?auto_8979 ?auto_8981 ) ) ( not ( = ?auto_8979 ?auto_9000 ) ) ( not ( = ?auto_8981 ?auto_9015 ) ) ( not ( = ?auto_8981 ?auto_8995 ) ) ( not ( = ?auto_8981 ?auto_9002 ) ) ( not ( = ?auto_8981 ?auto_9005 ) ) ( not ( = ?auto_9009 ?auto_9001 ) ) ( not ( = ?auto_9009 ?auto_9012 ) ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( not ( = ?auto_9009 ?auto_9013 ) ) ( not ( = ?auto_8996 ?auto_9007 ) ) ( not ( = ?auto_8996 ?auto_9014 ) ) ( not ( = ?auto_8996 ?auto_9011 ) ) ( not ( = ?auto_8996 ?auto_8997 ) ) ( not ( = ?auto_9000 ?auto_9015 ) ) ( not ( = ?auto_9000 ?auto_8995 ) ) ( not ( = ?auto_9000 ?auto_9002 ) ) ( not ( = ?auto_9000 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8982 ) ) ( not ( = ?auto_8976 ?auto_9004 ) ) ( not ( = ?auto_8977 ?auto_8982 ) ) ( not ( = ?auto_8977 ?auto_9004 ) ) ( not ( = ?auto_8978 ?auto_8982 ) ) ( not ( = ?auto_8978 ?auto_9004 ) ) ( not ( = ?auto_8979 ?auto_8982 ) ) ( not ( = ?auto_8979 ?auto_9004 ) ) ( not ( = ?auto_8980 ?auto_8982 ) ) ( not ( = ?auto_8980 ?auto_9004 ) ) ( not ( = ?auto_8982 ?auto_9000 ) ) ( not ( = ?auto_8982 ?auto_9015 ) ) ( not ( = ?auto_8982 ?auto_8995 ) ) ( not ( = ?auto_8982 ?auto_9002 ) ) ( not ( = ?auto_8982 ?auto_9005 ) ) ( not ( = ?auto_9004 ?auto_9000 ) ) ( not ( = ?auto_9004 ?auto_9015 ) ) ( not ( = ?auto_9004 ?auto_8995 ) ) ( not ( = ?auto_9004 ?auto_9002 ) ) ( not ( = ?auto_9004 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8983 ) ) ( not ( = ?auto_8976 ?auto_8998 ) ) ( not ( = ?auto_8977 ?auto_8983 ) ) ( not ( = ?auto_8977 ?auto_8998 ) ) ( not ( = ?auto_8978 ?auto_8983 ) ) ( not ( = ?auto_8978 ?auto_8998 ) ) ( not ( = ?auto_8979 ?auto_8983 ) ) ( not ( = ?auto_8979 ?auto_8998 ) ) ( not ( = ?auto_8980 ?auto_8983 ) ) ( not ( = ?auto_8980 ?auto_8998 ) ) ( not ( = ?auto_8981 ?auto_8983 ) ) ( not ( = ?auto_8981 ?auto_8998 ) ) ( not ( = ?auto_8983 ?auto_9004 ) ) ( not ( = ?auto_8983 ?auto_9000 ) ) ( not ( = ?auto_8983 ?auto_9015 ) ) ( not ( = ?auto_8983 ?auto_8995 ) ) ( not ( = ?auto_8983 ?auto_9002 ) ) ( not ( = ?auto_8983 ?auto_9005 ) ) ( not ( = ?auto_8994 ?auto_9001 ) ) ( not ( = ?auto_8994 ?auto_9009 ) ) ( not ( = ?auto_8994 ?auto_9012 ) ) ( not ( = ?auto_8994 ?auto_9010 ) ) ( not ( = ?auto_8994 ?auto_9013 ) ) ( not ( = ?auto_8999 ?auto_9007 ) ) ( not ( = ?auto_8999 ?auto_8996 ) ) ( not ( = ?auto_8999 ?auto_9014 ) ) ( not ( = ?auto_8999 ?auto_9011 ) ) ( not ( = ?auto_8999 ?auto_8997 ) ) ( not ( = ?auto_8998 ?auto_9004 ) ) ( not ( = ?auto_8998 ?auto_9000 ) ) ( not ( = ?auto_8998 ?auto_9015 ) ) ( not ( = ?auto_8998 ?auto_8995 ) ) ( not ( = ?auto_8998 ?auto_9002 ) ) ( not ( = ?auto_8998 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8984 ) ) ( not ( = ?auto_8976 ?auto_9003 ) ) ( not ( = ?auto_8977 ?auto_8984 ) ) ( not ( = ?auto_8977 ?auto_9003 ) ) ( not ( = ?auto_8978 ?auto_8984 ) ) ( not ( = ?auto_8978 ?auto_9003 ) ) ( not ( = ?auto_8979 ?auto_8984 ) ) ( not ( = ?auto_8979 ?auto_9003 ) ) ( not ( = ?auto_8980 ?auto_8984 ) ) ( not ( = ?auto_8980 ?auto_9003 ) ) ( not ( = ?auto_8981 ?auto_8984 ) ) ( not ( = ?auto_8981 ?auto_9003 ) ) ( not ( = ?auto_8982 ?auto_8984 ) ) ( not ( = ?auto_8982 ?auto_9003 ) ) ( not ( = ?auto_8984 ?auto_8998 ) ) ( not ( = ?auto_8984 ?auto_9004 ) ) ( not ( = ?auto_8984 ?auto_9000 ) ) ( not ( = ?auto_8984 ?auto_9015 ) ) ( not ( = ?auto_8984 ?auto_8995 ) ) ( not ( = ?auto_8984 ?auto_9002 ) ) ( not ( = ?auto_8984 ?auto_9005 ) ) ( not ( = ?auto_9003 ?auto_8998 ) ) ( not ( = ?auto_9003 ?auto_9004 ) ) ( not ( = ?auto_9003 ?auto_9000 ) ) ( not ( = ?auto_9003 ?auto_9015 ) ) ( not ( = ?auto_9003 ?auto_8995 ) ) ( not ( = ?auto_9003 ?auto_9002 ) ) ( not ( = ?auto_9003 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8985 ) ) ( not ( = ?auto_8976 ?auto_9008 ) ) ( not ( = ?auto_8977 ?auto_8985 ) ) ( not ( = ?auto_8977 ?auto_9008 ) ) ( not ( = ?auto_8978 ?auto_8985 ) ) ( not ( = ?auto_8978 ?auto_9008 ) ) ( not ( = ?auto_8979 ?auto_8985 ) ) ( not ( = ?auto_8979 ?auto_9008 ) ) ( not ( = ?auto_8980 ?auto_8985 ) ) ( not ( = ?auto_8980 ?auto_9008 ) ) ( not ( = ?auto_8981 ?auto_8985 ) ) ( not ( = ?auto_8981 ?auto_9008 ) ) ( not ( = ?auto_8982 ?auto_8985 ) ) ( not ( = ?auto_8982 ?auto_9008 ) ) ( not ( = ?auto_8983 ?auto_8985 ) ) ( not ( = ?auto_8983 ?auto_9008 ) ) ( not ( = ?auto_8985 ?auto_9003 ) ) ( not ( = ?auto_8985 ?auto_8998 ) ) ( not ( = ?auto_8985 ?auto_9004 ) ) ( not ( = ?auto_8985 ?auto_9000 ) ) ( not ( = ?auto_8985 ?auto_9015 ) ) ( not ( = ?auto_8985 ?auto_8995 ) ) ( not ( = ?auto_8985 ?auto_9002 ) ) ( not ( = ?auto_8985 ?auto_9005 ) ) ( not ( = ?auto_9008 ?auto_9003 ) ) ( not ( = ?auto_9008 ?auto_8998 ) ) ( not ( = ?auto_9008 ?auto_9004 ) ) ( not ( = ?auto_9008 ?auto_9000 ) ) ( not ( = ?auto_9008 ?auto_9015 ) ) ( not ( = ?auto_9008 ?auto_8995 ) ) ( not ( = ?auto_9008 ?auto_9002 ) ) ( not ( = ?auto_9008 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8986 ) ) ( not ( = ?auto_8976 ?auto_9006 ) ) ( not ( = ?auto_8977 ?auto_8986 ) ) ( not ( = ?auto_8977 ?auto_9006 ) ) ( not ( = ?auto_8978 ?auto_8986 ) ) ( not ( = ?auto_8978 ?auto_9006 ) ) ( not ( = ?auto_8979 ?auto_8986 ) ) ( not ( = ?auto_8979 ?auto_9006 ) ) ( not ( = ?auto_8980 ?auto_8986 ) ) ( not ( = ?auto_8980 ?auto_9006 ) ) ( not ( = ?auto_8981 ?auto_8986 ) ) ( not ( = ?auto_8981 ?auto_9006 ) ) ( not ( = ?auto_8982 ?auto_8986 ) ) ( not ( = ?auto_8982 ?auto_9006 ) ) ( not ( = ?auto_8983 ?auto_8986 ) ) ( not ( = ?auto_8983 ?auto_9006 ) ) ( not ( = ?auto_8984 ?auto_8986 ) ) ( not ( = ?auto_8984 ?auto_9006 ) ) ( not ( = ?auto_8986 ?auto_9008 ) ) ( not ( = ?auto_8986 ?auto_9003 ) ) ( not ( = ?auto_8986 ?auto_8998 ) ) ( not ( = ?auto_8986 ?auto_9004 ) ) ( not ( = ?auto_8986 ?auto_9000 ) ) ( not ( = ?auto_8986 ?auto_9015 ) ) ( not ( = ?auto_8986 ?auto_8995 ) ) ( not ( = ?auto_8986 ?auto_9002 ) ) ( not ( = ?auto_8986 ?auto_9005 ) ) ( not ( = ?auto_9006 ?auto_9008 ) ) ( not ( = ?auto_9006 ?auto_9003 ) ) ( not ( = ?auto_9006 ?auto_8998 ) ) ( not ( = ?auto_9006 ?auto_9004 ) ) ( not ( = ?auto_9006 ?auto_9000 ) ) ( not ( = ?auto_9006 ?auto_9015 ) ) ( not ( = ?auto_9006 ?auto_8995 ) ) ( not ( = ?auto_9006 ?auto_9002 ) ) ( not ( = ?auto_9006 ?auto_9005 ) ) ( not ( = ?auto_8976 ?auto_8987 ) ) ( not ( = ?auto_8976 ?auto_8990 ) ) ( not ( = ?auto_8977 ?auto_8987 ) ) ( not ( = ?auto_8977 ?auto_8990 ) ) ( not ( = ?auto_8978 ?auto_8987 ) ) ( not ( = ?auto_8978 ?auto_8990 ) ) ( not ( = ?auto_8979 ?auto_8987 ) ) ( not ( = ?auto_8979 ?auto_8990 ) ) ( not ( = ?auto_8980 ?auto_8987 ) ) ( not ( = ?auto_8980 ?auto_8990 ) ) ( not ( = ?auto_8981 ?auto_8987 ) ) ( not ( = ?auto_8981 ?auto_8990 ) ) ( not ( = ?auto_8982 ?auto_8987 ) ) ( not ( = ?auto_8982 ?auto_8990 ) ) ( not ( = ?auto_8983 ?auto_8987 ) ) ( not ( = ?auto_8983 ?auto_8990 ) ) ( not ( = ?auto_8984 ?auto_8987 ) ) ( not ( = ?auto_8984 ?auto_8990 ) ) ( not ( = ?auto_8985 ?auto_8987 ) ) ( not ( = ?auto_8985 ?auto_8990 ) ) ( not ( = ?auto_8987 ?auto_9006 ) ) ( not ( = ?auto_8987 ?auto_9008 ) ) ( not ( = ?auto_8987 ?auto_9003 ) ) ( not ( = ?auto_8987 ?auto_8998 ) ) ( not ( = ?auto_8987 ?auto_9004 ) ) ( not ( = ?auto_8987 ?auto_9000 ) ) ( not ( = ?auto_8987 ?auto_9015 ) ) ( not ( = ?auto_8987 ?auto_8995 ) ) ( not ( = ?auto_8987 ?auto_9002 ) ) ( not ( = ?auto_8987 ?auto_9005 ) ) ( not ( = ?auto_8991 ?auto_9012 ) ) ( not ( = ?auto_8991 ?auto_9013 ) ) ( not ( = ?auto_8991 ?auto_8994 ) ) ( not ( = ?auto_8991 ?auto_9001 ) ) ( not ( = ?auto_8991 ?auto_9009 ) ) ( not ( = ?auto_8991 ?auto_9010 ) ) ( not ( = ?auto_8992 ?auto_9014 ) ) ( not ( = ?auto_8992 ?auto_8997 ) ) ( not ( = ?auto_8992 ?auto_8999 ) ) ( not ( = ?auto_8992 ?auto_9007 ) ) ( not ( = ?auto_8992 ?auto_8996 ) ) ( not ( = ?auto_8992 ?auto_9011 ) ) ( not ( = ?auto_8990 ?auto_9006 ) ) ( not ( = ?auto_8990 ?auto_9008 ) ) ( not ( = ?auto_8990 ?auto_9003 ) ) ( not ( = ?auto_8990 ?auto_8998 ) ) ( not ( = ?auto_8990 ?auto_9004 ) ) ( not ( = ?auto_8990 ?auto_9000 ) ) ( not ( = ?auto_8990 ?auto_9015 ) ) ( not ( = ?auto_8990 ?auto_8995 ) ) ( not ( = ?auto_8990 ?auto_9002 ) ) ( not ( = ?auto_8990 ?auto_9005 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_8976 ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8980 ?auto_8981 ?auto_8982 ?auto_8983 ?auto_8984 ?auto_8985 ?auto_8986 )
      ( MAKE-1CRATE ?auto_8986 ?auto_8987 )
      ( MAKE-11CRATE-VERIFY ?auto_8976 ?auto_8977 ?auto_8978 ?auto_8979 ?auto_8980 ?auto_8981 ?auto_8982 ?auto_8983 ?auto_8984 ?auto_8985 ?auto_8986 ?auto_8987 ) )
  )

)

