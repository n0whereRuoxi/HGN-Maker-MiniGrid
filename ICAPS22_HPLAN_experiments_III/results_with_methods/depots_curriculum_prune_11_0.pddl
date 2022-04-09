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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8626 - SURFACE
      ?auto_8627 - SURFACE
      ?auto_8628 - SURFACE
    )
    :vars
    (
      ?auto_8634 - HOIST
      ?auto_8633 - PLACE
      ?auto_8629 - PLACE
      ?auto_8630 - HOIST
      ?auto_8631 - SURFACE
      ?auto_8635 - PLACE
      ?auto_8636 - HOIST
      ?auto_8637 - SURFACE
      ?auto_8632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8634 ?auto_8633 ) ( IS-CRATE ?auto_8628 ) ( not ( = ?auto_8629 ?auto_8633 ) ) ( HOIST-AT ?auto_8630 ?auto_8629 ) ( AVAILABLE ?auto_8630 ) ( SURFACE-AT ?auto_8628 ?auto_8629 ) ( ON ?auto_8628 ?auto_8631 ) ( CLEAR ?auto_8628 ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8627 ?auto_8631 ) ) ( not ( = ?auto_8628 ?auto_8631 ) ) ( not ( = ?auto_8634 ?auto_8630 ) ) ( SURFACE-AT ?auto_8626 ?auto_8633 ) ( CLEAR ?auto_8626 ) ( IS-CRATE ?auto_8627 ) ( AVAILABLE ?auto_8634 ) ( not ( = ?auto_8635 ?auto_8633 ) ) ( HOIST-AT ?auto_8636 ?auto_8635 ) ( AVAILABLE ?auto_8636 ) ( SURFACE-AT ?auto_8627 ?auto_8635 ) ( ON ?auto_8627 ?auto_8637 ) ( CLEAR ?auto_8627 ) ( TRUCK-AT ?auto_8632 ?auto_8633 ) ( not ( = ?auto_8626 ?auto_8627 ) ) ( not ( = ?auto_8626 ?auto_8637 ) ) ( not ( = ?auto_8627 ?auto_8637 ) ) ( not ( = ?auto_8634 ?auto_8636 ) ) ( not ( = ?auto_8626 ?auto_8628 ) ) ( not ( = ?auto_8626 ?auto_8631 ) ) ( not ( = ?auto_8628 ?auto_8637 ) ) ( not ( = ?auto_8629 ?auto_8635 ) ) ( not ( = ?auto_8630 ?auto_8636 ) ) ( not ( = ?auto_8631 ?auto_8637 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8626 ?auto_8627 )
      ( MAKE-1CRATE ?auto_8627 ?auto_8628 )
      ( MAKE-2CRATE-VERIFY ?auto_8626 ?auto_8627 ?auto_8628 ) )
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
      ?auto_8660 - HOIST
      ?auto_8661 - PLACE
      ?auto_8658 - PLACE
      ?auto_8656 - HOIST
      ?auto_8657 - SURFACE
      ?auto_8666 - PLACE
      ?auto_8665 - HOIST
      ?auto_8664 - SURFACE
      ?auto_8667 - PLACE
      ?auto_8662 - HOIST
      ?auto_8663 - SURFACE
      ?auto_8659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8660 ?auto_8661 ) ( IS-CRATE ?auto_8655 ) ( not ( = ?auto_8658 ?auto_8661 ) ) ( HOIST-AT ?auto_8656 ?auto_8658 ) ( AVAILABLE ?auto_8656 ) ( SURFACE-AT ?auto_8655 ?auto_8658 ) ( ON ?auto_8655 ?auto_8657 ) ( CLEAR ?auto_8655 ) ( not ( = ?auto_8654 ?auto_8655 ) ) ( not ( = ?auto_8654 ?auto_8657 ) ) ( not ( = ?auto_8655 ?auto_8657 ) ) ( not ( = ?auto_8660 ?auto_8656 ) ) ( IS-CRATE ?auto_8654 ) ( not ( = ?auto_8666 ?auto_8661 ) ) ( HOIST-AT ?auto_8665 ?auto_8666 ) ( AVAILABLE ?auto_8665 ) ( SURFACE-AT ?auto_8654 ?auto_8666 ) ( ON ?auto_8654 ?auto_8664 ) ( CLEAR ?auto_8654 ) ( not ( = ?auto_8653 ?auto_8654 ) ) ( not ( = ?auto_8653 ?auto_8664 ) ) ( not ( = ?auto_8654 ?auto_8664 ) ) ( not ( = ?auto_8660 ?auto_8665 ) ) ( SURFACE-AT ?auto_8652 ?auto_8661 ) ( CLEAR ?auto_8652 ) ( IS-CRATE ?auto_8653 ) ( AVAILABLE ?auto_8660 ) ( not ( = ?auto_8667 ?auto_8661 ) ) ( HOIST-AT ?auto_8662 ?auto_8667 ) ( AVAILABLE ?auto_8662 ) ( SURFACE-AT ?auto_8653 ?auto_8667 ) ( ON ?auto_8653 ?auto_8663 ) ( CLEAR ?auto_8653 ) ( TRUCK-AT ?auto_8659 ?auto_8661 ) ( not ( = ?auto_8652 ?auto_8653 ) ) ( not ( = ?auto_8652 ?auto_8663 ) ) ( not ( = ?auto_8653 ?auto_8663 ) ) ( not ( = ?auto_8660 ?auto_8662 ) ) ( not ( = ?auto_8652 ?auto_8654 ) ) ( not ( = ?auto_8652 ?auto_8664 ) ) ( not ( = ?auto_8654 ?auto_8663 ) ) ( not ( = ?auto_8666 ?auto_8667 ) ) ( not ( = ?auto_8665 ?auto_8662 ) ) ( not ( = ?auto_8664 ?auto_8663 ) ) ( not ( = ?auto_8652 ?auto_8655 ) ) ( not ( = ?auto_8652 ?auto_8657 ) ) ( not ( = ?auto_8653 ?auto_8655 ) ) ( not ( = ?auto_8653 ?auto_8657 ) ) ( not ( = ?auto_8655 ?auto_8664 ) ) ( not ( = ?auto_8655 ?auto_8663 ) ) ( not ( = ?auto_8658 ?auto_8666 ) ) ( not ( = ?auto_8658 ?auto_8667 ) ) ( not ( = ?auto_8656 ?auto_8665 ) ) ( not ( = ?auto_8656 ?auto_8662 ) ) ( not ( = ?auto_8657 ?auto_8664 ) ) ( not ( = ?auto_8657 ?auto_8663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8652 ?auto_8653 ?auto_8654 )
      ( MAKE-1CRATE ?auto_8654 ?auto_8655 )
      ( MAKE-3CRATE-VERIFY ?auto_8652 ?auto_8653 ?auto_8654 ?auto_8655 ) )
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
      ?auto_8689 - HOIST
      ?auto_8690 - PLACE
      ?auto_8688 - PLACE
      ?auto_8693 - HOIST
      ?auto_8692 - SURFACE
      ?auto_8697 - PLACE
      ?auto_8702 - HOIST
      ?auto_8699 - SURFACE
      ?auto_8700 - PLACE
      ?auto_8701 - HOIST
      ?auto_8695 - SURFACE
      ?auto_8694 - PLACE
      ?auto_8696 - HOIST
      ?auto_8698 - SURFACE
      ?auto_8691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8689 ?auto_8690 ) ( IS-CRATE ?auto_8687 ) ( not ( = ?auto_8688 ?auto_8690 ) ) ( HOIST-AT ?auto_8693 ?auto_8688 ) ( AVAILABLE ?auto_8693 ) ( SURFACE-AT ?auto_8687 ?auto_8688 ) ( ON ?auto_8687 ?auto_8692 ) ( CLEAR ?auto_8687 ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( not ( = ?auto_8686 ?auto_8692 ) ) ( not ( = ?auto_8687 ?auto_8692 ) ) ( not ( = ?auto_8689 ?auto_8693 ) ) ( IS-CRATE ?auto_8686 ) ( not ( = ?auto_8697 ?auto_8690 ) ) ( HOIST-AT ?auto_8702 ?auto_8697 ) ( AVAILABLE ?auto_8702 ) ( SURFACE-AT ?auto_8686 ?auto_8697 ) ( ON ?auto_8686 ?auto_8699 ) ( CLEAR ?auto_8686 ) ( not ( = ?auto_8685 ?auto_8686 ) ) ( not ( = ?auto_8685 ?auto_8699 ) ) ( not ( = ?auto_8686 ?auto_8699 ) ) ( not ( = ?auto_8689 ?auto_8702 ) ) ( IS-CRATE ?auto_8685 ) ( not ( = ?auto_8700 ?auto_8690 ) ) ( HOIST-AT ?auto_8701 ?auto_8700 ) ( AVAILABLE ?auto_8701 ) ( SURFACE-AT ?auto_8685 ?auto_8700 ) ( ON ?auto_8685 ?auto_8695 ) ( CLEAR ?auto_8685 ) ( not ( = ?auto_8684 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8695 ) ) ( not ( = ?auto_8685 ?auto_8695 ) ) ( not ( = ?auto_8689 ?auto_8701 ) ) ( SURFACE-AT ?auto_8683 ?auto_8690 ) ( CLEAR ?auto_8683 ) ( IS-CRATE ?auto_8684 ) ( AVAILABLE ?auto_8689 ) ( not ( = ?auto_8694 ?auto_8690 ) ) ( HOIST-AT ?auto_8696 ?auto_8694 ) ( AVAILABLE ?auto_8696 ) ( SURFACE-AT ?auto_8684 ?auto_8694 ) ( ON ?auto_8684 ?auto_8698 ) ( CLEAR ?auto_8684 ) ( TRUCK-AT ?auto_8691 ?auto_8690 ) ( not ( = ?auto_8683 ?auto_8684 ) ) ( not ( = ?auto_8683 ?auto_8698 ) ) ( not ( = ?auto_8684 ?auto_8698 ) ) ( not ( = ?auto_8689 ?auto_8696 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8695 ) ) ( not ( = ?auto_8685 ?auto_8698 ) ) ( not ( = ?auto_8700 ?auto_8694 ) ) ( not ( = ?auto_8701 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8698 ) ) ( not ( = ?auto_8683 ?auto_8686 ) ) ( not ( = ?auto_8683 ?auto_8699 ) ) ( not ( = ?auto_8684 ?auto_8686 ) ) ( not ( = ?auto_8684 ?auto_8699 ) ) ( not ( = ?auto_8686 ?auto_8695 ) ) ( not ( = ?auto_8686 ?auto_8698 ) ) ( not ( = ?auto_8697 ?auto_8700 ) ) ( not ( = ?auto_8697 ?auto_8694 ) ) ( not ( = ?auto_8702 ?auto_8701 ) ) ( not ( = ?auto_8702 ?auto_8696 ) ) ( not ( = ?auto_8699 ?auto_8695 ) ) ( not ( = ?auto_8699 ?auto_8698 ) ) ( not ( = ?auto_8683 ?auto_8687 ) ) ( not ( = ?auto_8683 ?auto_8692 ) ) ( not ( = ?auto_8684 ?auto_8687 ) ) ( not ( = ?auto_8684 ?auto_8692 ) ) ( not ( = ?auto_8685 ?auto_8687 ) ) ( not ( = ?auto_8685 ?auto_8692 ) ) ( not ( = ?auto_8687 ?auto_8699 ) ) ( not ( = ?auto_8687 ?auto_8695 ) ) ( not ( = ?auto_8687 ?auto_8698 ) ) ( not ( = ?auto_8688 ?auto_8697 ) ) ( not ( = ?auto_8688 ?auto_8700 ) ) ( not ( = ?auto_8688 ?auto_8694 ) ) ( not ( = ?auto_8693 ?auto_8702 ) ) ( not ( = ?auto_8693 ?auto_8701 ) ) ( not ( = ?auto_8693 ?auto_8696 ) ) ( not ( = ?auto_8692 ?auto_8699 ) ) ( not ( = ?auto_8692 ?auto_8695 ) ) ( not ( = ?auto_8692 ?auto_8698 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_8683 ?auto_8684 ?auto_8685 ?auto_8686 )
      ( MAKE-1CRATE ?auto_8686 ?auto_8687 )
      ( MAKE-4CRATE-VERIFY ?auto_8683 ?auto_8684 ?auto_8685 ?auto_8686 ?auto_8687 ) )
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
      ?auto_8730 - HOIST
      ?auto_8729 - PLACE
      ?auto_8728 - PLACE
      ?auto_8727 - HOIST
      ?auto_8726 - SURFACE
      ?auto_8735 - SURFACE
      ?auto_8739 - PLACE
      ?auto_8733 - HOIST
      ?auto_8736 - SURFACE
      ?auto_8740 - PLACE
      ?auto_8737 - HOIST
      ?auto_8738 - SURFACE
      ?auto_8731 - PLACE
      ?auto_8732 - HOIST
      ?auto_8734 - SURFACE
      ?auto_8725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8730 ?auto_8729 ) ( IS-CRATE ?auto_8724 ) ( not ( = ?auto_8728 ?auto_8729 ) ) ( HOIST-AT ?auto_8727 ?auto_8728 ) ( SURFACE-AT ?auto_8724 ?auto_8728 ) ( ON ?auto_8724 ?auto_8726 ) ( CLEAR ?auto_8724 ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8726 ) ) ( not ( = ?auto_8730 ?auto_8727 ) ) ( IS-CRATE ?auto_8723 ) ( AVAILABLE ?auto_8727 ) ( SURFACE-AT ?auto_8723 ?auto_8728 ) ( ON ?auto_8723 ?auto_8735 ) ( CLEAR ?auto_8723 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8735 ) ) ( not ( = ?auto_8723 ?auto_8735 ) ) ( IS-CRATE ?auto_8722 ) ( not ( = ?auto_8739 ?auto_8729 ) ) ( HOIST-AT ?auto_8733 ?auto_8739 ) ( AVAILABLE ?auto_8733 ) ( SURFACE-AT ?auto_8722 ?auto_8739 ) ( ON ?auto_8722 ?auto_8736 ) ( CLEAR ?auto_8722 ) ( not ( = ?auto_8721 ?auto_8722 ) ) ( not ( = ?auto_8721 ?auto_8736 ) ) ( not ( = ?auto_8722 ?auto_8736 ) ) ( not ( = ?auto_8730 ?auto_8733 ) ) ( IS-CRATE ?auto_8721 ) ( not ( = ?auto_8740 ?auto_8729 ) ) ( HOIST-AT ?auto_8737 ?auto_8740 ) ( AVAILABLE ?auto_8737 ) ( SURFACE-AT ?auto_8721 ?auto_8740 ) ( ON ?auto_8721 ?auto_8738 ) ( CLEAR ?auto_8721 ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8720 ?auto_8738 ) ) ( not ( = ?auto_8721 ?auto_8738 ) ) ( not ( = ?auto_8730 ?auto_8737 ) ) ( SURFACE-AT ?auto_8719 ?auto_8729 ) ( CLEAR ?auto_8719 ) ( IS-CRATE ?auto_8720 ) ( AVAILABLE ?auto_8730 ) ( not ( = ?auto_8731 ?auto_8729 ) ) ( HOIST-AT ?auto_8732 ?auto_8731 ) ( AVAILABLE ?auto_8732 ) ( SURFACE-AT ?auto_8720 ?auto_8731 ) ( ON ?auto_8720 ?auto_8734 ) ( CLEAR ?auto_8720 ) ( TRUCK-AT ?auto_8725 ?auto_8729 ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( not ( = ?auto_8719 ?auto_8734 ) ) ( not ( = ?auto_8720 ?auto_8734 ) ) ( not ( = ?auto_8730 ?auto_8732 ) ) ( not ( = ?auto_8719 ?auto_8721 ) ) ( not ( = ?auto_8719 ?auto_8738 ) ) ( not ( = ?auto_8721 ?auto_8734 ) ) ( not ( = ?auto_8740 ?auto_8731 ) ) ( not ( = ?auto_8737 ?auto_8732 ) ) ( not ( = ?auto_8738 ?auto_8734 ) ) ( not ( = ?auto_8719 ?auto_8722 ) ) ( not ( = ?auto_8719 ?auto_8736 ) ) ( not ( = ?auto_8720 ?auto_8722 ) ) ( not ( = ?auto_8720 ?auto_8736 ) ) ( not ( = ?auto_8722 ?auto_8738 ) ) ( not ( = ?auto_8722 ?auto_8734 ) ) ( not ( = ?auto_8739 ?auto_8740 ) ) ( not ( = ?auto_8739 ?auto_8731 ) ) ( not ( = ?auto_8733 ?auto_8737 ) ) ( not ( = ?auto_8733 ?auto_8732 ) ) ( not ( = ?auto_8736 ?auto_8738 ) ) ( not ( = ?auto_8736 ?auto_8734 ) ) ( not ( = ?auto_8719 ?auto_8723 ) ) ( not ( = ?auto_8719 ?auto_8735 ) ) ( not ( = ?auto_8720 ?auto_8723 ) ) ( not ( = ?auto_8720 ?auto_8735 ) ) ( not ( = ?auto_8721 ?auto_8723 ) ) ( not ( = ?auto_8721 ?auto_8735 ) ) ( not ( = ?auto_8723 ?auto_8736 ) ) ( not ( = ?auto_8723 ?auto_8738 ) ) ( not ( = ?auto_8723 ?auto_8734 ) ) ( not ( = ?auto_8728 ?auto_8739 ) ) ( not ( = ?auto_8728 ?auto_8740 ) ) ( not ( = ?auto_8728 ?auto_8731 ) ) ( not ( = ?auto_8727 ?auto_8733 ) ) ( not ( = ?auto_8727 ?auto_8737 ) ) ( not ( = ?auto_8727 ?auto_8732 ) ) ( not ( = ?auto_8735 ?auto_8736 ) ) ( not ( = ?auto_8735 ?auto_8738 ) ) ( not ( = ?auto_8735 ?auto_8734 ) ) ( not ( = ?auto_8719 ?auto_8724 ) ) ( not ( = ?auto_8719 ?auto_8726 ) ) ( not ( = ?auto_8720 ?auto_8724 ) ) ( not ( = ?auto_8720 ?auto_8726 ) ) ( not ( = ?auto_8721 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8726 ) ) ( not ( = ?auto_8722 ?auto_8724 ) ) ( not ( = ?auto_8722 ?auto_8726 ) ) ( not ( = ?auto_8724 ?auto_8735 ) ) ( not ( = ?auto_8724 ?auto_8736 ) ) ( not ( = ?auto_8724 ?auto_8738 ) ) ( not ( = ?auto_8724 ?auto_8734 ) ) ( not ( = ?auto_8726 ?auto_8735 ) ) ( not ( = ?auto_8726 ?auto_8736 ) ) ( not ( = ?auto_8726 ?auto_8738 ) ) ( not ( = ?auto_8726 ?auto_8734 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8723 )
      ( MAKE-1CRATE ?auto_8723 ?auto_8724 )
      ( MAKE-5CRATE-VERIFY ?auto_8719 ?auto_8720 ?auto_8721 ?auto_8722 ?auto_8723 ?auto_8724 ) )
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
      ?auto_8769 - HOIST
      ?auto_8768 - PLACE
      ?auto_8765 - PLACE
      ?auto_8766 - HOIST
      ?auto_8767 - SURFACE
      ?auto_8772 - SURFACE
      ?auto_8779 - SURFACE
      ?auto_8774 - PLACE
      ?auto_8777 - HOIST
      ?auto_8781 - SURFACE
      ?auto_8776 - PLACE
      ?auto_8775 - HOIST
      ?auto_8771 - SURFACE
      ?auto_8778 - PLACE
      ?auto_8773 - HOIST
      ?auto_8780 - SURFACE
      ?auto_8770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8769 ?auto_8768 ) ( IS-CRATE ?auto_8764 ) ( not ( = ?auto_8765 ?auto_8768 ) ) ( HOIST-AT ?auto_8766 ?auto_8765 ) ( SURFACE-AT ?auto_8764 ?auto_8765 ) ( ON ?auto_8764 ?auto_8767 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8763 ?auto_8764 ) ) ( not ( = ?auto_8763 ?auto_8767 ) ) ( not ( = ?auto_8764 ?auto_8767 ) ) ( not ( = ?auto_8769 ?auto_8766 ) ) ( IS-CRATE ?auto_8763 ) ( SURFACE-AT ?auto_8763 ?auto_8765 ) ( ON ?auto_8763 ?auto_8772 ) ( CLEAR ?auto_8763 ) ( not ( = ?auto_8762 ?auto_8763 ) ) ( not ( = ?auto_8762 ?auto_8772 ) ) ( not ( = ?auto_8763 ?auto_8772 ) ) ( IS-CRATE ?auto_8762 ) ( AVAILABLE ?auto_8766 ) ( SURFACE-AT ?auto_8762 ?auto_8765 ) ( ON ?auto_8762 ?auto_8779 ) ( CLEAR ?auto_8762 ) ( not ( = ?auto_8761 ?auto_8762 ) ) ( not ( = ?auto_8761 ?auto_8779 ) ) ( not ( = ?auto_8762 ?auto_8779 ) ) ( IS-CRATE ?auto_8761 ) ( not ( = ?auto_8774 ?auto_8768 ) ) ( HOIST-AT ?auto_8777 ?auto_8774 ) ( AVAILABLE ?auto_8777 ) ( SURFACE-AT ?auto_8761 ?auto_8774 ) ( ON ?auto_8761 ?auto_8781 ) ( CLEAR ?auto_8761 ) ( not ( = ?auto_8760 ?auto_8761 ) ) ( not ( = ?auto_8760 ?auto_8781 ) ) ( not ( = ?auto_8761 ?auto_8781 ) ) ( not ( = ?auto_8769 ?auto_8777 ) ) ( IS-CRATE ?auto_8760 ) ( not ( = ?auto_8776 ?auto_8768 ) ) ( HOIST-AT ?auto_8775 ?auto_8776 ) ( AVAILABLE ?auto_8775 ) ( SURFACE-AT ?auto_8760 ?auto_8776 ) ( ON ?auto_8760 ?auto_8771 ) ( CLEAR ?auto_8760 ) ( not ( = ?auto_8759 ?auto_8760 ) ) ( not ( = ?auto_8759 ?auto_8771 ) ) ( not ( = ?auto_8760 ?auto_8771 ) ) ( not ( = ?auto_8769 ?auto_8775 ) ) ( SURFACE-AT ?auto_8758 ?auto_8768 ) ( CLEAR ?auto_8758 ) ( IS-CRATE ?auto_8759 ) ( AVAILABLE ?auto_8769 ) ( not ( = ?auto_8778 ?auto_8768 ) ) ( HOIST-AT ?auto_8773 ?auto_8778 ) ( AVAILABLE ?auto_8773 ) ( SURFACE-AT ?auto_8759 ?auto_8778 ) ( ON ?auto_8759 ?auto_8780 ) ( CLEAR ?auto_8759 ) ( TRUCK-AT ?auto_8770 ?auto_8768 ) ( not ( = ?auto_8758 ?auto_8759 ) ) ( not ( = ?auto_8758 ?auto_8780 ) ) ( not ( = ?auto_8759 ?auto_8780 ) ) ( not ( = ?auto_8769 ?auto_8773 ) ) ( not ( = ?auto_8758 ?auto_8760 ) ) ( not ( = ?auto_8758 ?auto_8771 ) ) ( not ( = ?auto_8760 ?auto_8780 ) ) ( not ( = ?auto_8776 ?auto_8778 ) ) ( not ( = ?auto_8775 ?auto_8773 ) ) ( not ( = ?auto_8771 ?auto_8780 ) ) ( not ( = ?auto_8758 ?auto_8761 ) ) ( not ( = ?auto_8758 ?auto_8781 ) ) ( not ( = ?auto_8759 ?auto_8761 ) ) ( not ( = ?auto_8759 ?auto_8781 ) ) ( not ( = ?auto_8761 ?auto_8771 ) ) ( not ( = ?auto_8761 ?auto_8780 ) ) ( not ( = ?auto_8774 ?auto_8776 ) ) ( not ( = ?auto_8774 ?auto_8778 ) ) ( not ( = ?auto_8777 ?auto_8775 ) ) ( not ( = ?auto_8777 ?auto_8773 ) ) ( not ( = ?auto_8781 ?auto_8771 ) ) ( not ( = ?auto_8781 ?auto_8780 ) ) ( not ( = ?auto_8758 ?auto_8762 ) ) ( not ( = ?auto_8758 ?auto_8779 ) ) ( not ( = ?auto_8759 ?auto_8762 ) ) ( not ( = ?auto_8759 ?auto_8779 ) ) ( not ( = ?auto_8760 ?auto_8762 ) ) ( not ( = ?auto_8760 ?auto_8779 ) ) ( not ( = ?auto_8762 ?auto_8781 ) ) ( not ( = ?auto_8762 ?auto_8771 ) ) ( not ( = ?auto_8762 ?auto_8780 ) ) ( not ( = ?auto_8765 ?auto_8774 ) ) ( not ( = ?auto_8765 ?auto_8776 ) ) ( not ( = ?auto_8765 ?auto_8778 ) ) ( not ( = ?auto_8766 ?auto_8777 ) ) ( not ( = ?auto_8766 ?auto_8775 ) ) ( not ( = ?auto_8766 ?auto_8773 ) ) ( not ( = ?auto_8779 ?auto_8781 ) ) ( not ( = ?auto_8779 ?auto_8771 ) ) ( not ( = ?auto_8779 ?auto_8780 ) ) ( not ( = ?auto_8758 ?auto_8763 ) ) ( not ( = ?auto_8758 ?auto_8772 ) ) ( not ( = ?auto_8759 ?auto_8763 ) ) ( not ( = ?auto_8759 ?auto_8772 ) ) ( not ( = ?auto_8760 ?auto_8763 ) ) ( not ( = ?auto_8760 ?auto_8772 ) ) ( not ( = ?auto_8761 ?auto_8763 ) ) ( not ( = ?auto_8761 ?auto_8772 ) ) ( not ( = ?auto_8763 ?auto_8779 ) ) ( not ( = ?auto_8763 ?auto_8781 ) ) ( not ( = ?auto_8763 ?auto_8771 ) ) ( not ( = ?auto_8763 ?auto_8780 ) ) ( not ( = ?auto_8772 ?auto_8779 ) ) ( not ( = ?auto_8772 ?auto_8781 ) ) ( not ( = ?auto_8772 ?auto_8771 ) ) ( not ( = ?auto_8772 ?auto_8780 ) ) ( not ( = ?auto_8758 ?auto_8764 ) ) ( not ( = ?auto_8758 ?auto_8767 ) ) ( not ( = ?auto_8759 ?auto_8764 ) ) ( not ( = ?auto_8759 ?auto_8767 ) ) ( not ( = ?auto_8760 ?auto_8764 ) ) ( not ( = ?auto_8760 ?auto_8767 ) ) ( not ( = ?auto_8761 ?auto_8764 ) ) ( not ( = ?auto_8761 ?auto_8767 ) ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( not ( = ?auto_8762 ?auto_8767 ) ) ( not ( = ?auto_8764 ?auto_8772 ) ) ( not ( = ?auto_8764 ?auto_8779 ) ) ( not ( = ?auto_8764 ?auto_8781 ) ) ( not ( = ?auto_8764 ?auto_8771 ) ) ( not ( = ?auto_8764 ?auto_8780 ) ) ( not ( = ?auto_8767 ?auto_8772 ) ) ( not ( = ?auto_8767 ?auto_8779 ) ) ( not ( = ?auto_8767 ?auto_8781 ) ) ( not ( = ?auto_8767 ?auto_8771 ) ) ( not ( = ?auto_8767 ?auto_8780 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_8758 ?auto_8759 ?auto_8760 ?auto_8761 ?auto_8762 ?auto_8763 )
      ( MAKE-1CRATE ?auto_8763 ?auto_8764 )
      ( MAKE-6CRATE-VERIFY ?auto_8758 ?auto_8759 ?auto_8760 ?auto_8761 ?auto_8762 ?auto_8763 ?auto_8764 ) )
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
      ?auto_8813 - HOIST
      ?auto_8810 - PLACE
      ?auto_8811 - PLACE
      ?auto_8809 - HOIST
      ?auto_8812 - SURFACE
      ?auto_8817 - PLACE
      ?auto_8824 - HOIST
      ?auto_8825 - SURFACE
      ?auto_8815 - SURFACE
      ?auto_8818 - SURFACE
      ?auto_8819 - PLACE
      ?auto_8814 - HOIST
      ?auto_8821 - SURFACE
      ?auto_8823 - SURFACE
      ?auto_8822 - PLACE
      ?auto_8816 - HOIST
      ?auto_8820 - SURFACE
      ?auto_8808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8813 ?auto_8810 ) ( IS-CRATE ?auto_8807 ) ( not ( = ?auto_8811 ?auto_8810 ) ) ( HOIST-AT ?auto_8809 ?auto_8811 ) ( SURFACE-AT ?auto_8807 ?auto_8811 ) ( ON ?auto_8807 ?auto_8812 ) ( CLEAR ?auto_8807 ) ( not ( = ?auto_8806 ?auto_8807 ) ) ( not ( = ?auto_8806 ?auto_8812 ) ) ( not ( = ?auto_8807 ?auto_8812 ) ) ( not ( = ?auto_8813 ?auto_8809 ) ) ( IS-CRATE ?auto_8806 ) ( not ( = ?auto_8817 ?auto_8810 ) ) ( HOIST-AT ?auto_8824 ?auto_8817 ) ( SURFACE-AT ?auto_8806 ?auto_8817 ) ( ON ?auto_8806 ?auto_8825 ) ( CLEAR ?auto_8806 ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( not ( = ?auto_8805 ?auto_8825 ) ) ( not ( = ?auto_8806 ?auto_8825 ) ) ( not ( = ?auto_8813 ?auto_8824 ) ) ( IS-CRATE ?auto_8805 ) ( SURFACE-AT ?auto_8805 ?auto_8817 ) ( ON ?auto_8805 ?auto_8815 ) ( CLEAR ?auto_8805 ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8804 ?auto_8815 ) ) ( not ( = ?auto_8805 ?auto_8815 ) ) ( IS-CRATE ?auto_8804 ) ( AVAILABLE ?auto_8824 ) ( SURFACE-AT ?auto_8804 ?auto_8817 ) ( ON ?auto_8804 ?auto_8818 ) ( CLEAR ?auto_8804 ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8818 ) ) ( not ( = ?auto_8804 ?auto_8818 ) ) ( IS-CRATE ?auto_8803 ) ( not ( = ?auto_8819 ?auto_8810 ) ) ( HOIST-AT ?auto_8814 ?auto_8819 ) ( AVAILABLE ?auto_8814 ) ( SURFACE-AT ?auto_8803 ?auto_8819 ) ( ON ?auto_8803 ?auto_8821 ) ( CLEAR ?auto_8803 ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( not ( = ?auto_8802 ?auto_8821 ) ) ( not ( = ?auto_8803 ?auto_8821 ) ) ( not ( = ?auto_8813 ?auto_8814 ) ) ( IS-CRATE ?auto_8802 ) ( AVAILABLE ?auto_8809 ) ( SURFACE-AT ?auto_8802 ?auto_8811 ) ( ON ?auto_8802 ?auto_8823 ) ( CLEAR ?auto_8802 ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8801 ?auto_8823 ) ) ( not ( = ?auto_8802 ?auto_8823 ) ) ( SURFACE-AT ?auto_8800 ?auto_8810 ) ( CLEAR ?auto_8800 ) ( IS-CRATE ?auto_8801 ) ( AVAILABLE ?auto_8813 ) ( not ( = ?auto_8822 ?auto_8810 ) ) ( HOIST-AT ?auto_8816 ?auto_8822 ) ( AVAILABLE ?auto_8816 ) ( SURFACE-AT ?auto_8801 ?auto_8822 ) ( ON ?auto_8801 ?auto_8820 ) ( CLEAR ?auto_8801 ) ( TRUCK-AT ?auto_8808 ?auto_8810 ) ( not ( = ?auto_8800 ?auto_8801 ) ) ( not ( = ?auto_8800 ?auto_8820 ) ) ( not ( = ?auto_8801 ?auto_8820 ) ) ( not ( = ?auto_8813 ?auto_8816 ) ) ( not ( = ?auto_8800 ?auto_8802 ) ) ( not ( = ?auto_8800 ?auto_8823 ) ) ( not ( = ?auto_8802 ?auto_8820 ) ) ( not ( = ?auto_8811 ?auto_8822 ) ) ( not ( = ?auto_8809 ?auto_8816 ) ) ( not ( = ?auto_8823 ?auto_8820 ) ) ( not ( = ?auto_8800 ?auto_8803 ) ) ( not ( = ?auto_8800 ?auto_8821 ) ) ( not ( = ?auto_8801 ?auto_8803 ) ) ( not ( = ?auto_8801 ?auto_8821 ) ) ( not ( = ?auto_8803 ?auto_8823 ) ) ( not ( = ?auto_8803 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8811 ) ) ( not ( = ?auto_8819 ?auto_8822 ) ) ( not ( = ?auto_8814 ?auto_8809 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8821 ?auto_8823 ) ) ( not ( = ?auto_8821 ?auto_8820 ) ) ( not ( = ?auto_8800 ?auto_8804 ) ) ( not ( = ?auto_8800 ?auto_8818 ) ) ( not ( = ?auto_8801 ?auto_8804 ) ) ( not ( = ?auto_8801 ?auto_8818 ) ) ( not ( = ?auto_8802 ?auto_8804 ) ) ( not ( = ?auto_8802 ?auto_8818 ) ) ( not ( = ?auto_8804 ?auto_8821 ) ) ( not ( = ?auto_8804 ?auto_8823 ) ) ( not ( = ?auto_8804 ?auto_8820 ) ) ( not ( = ?auto_8817 ?auto_8819 ) ) ( not ( = ?auto_8817 ?auto_8811 ) ) ( not ( = ?auto_8817 ?auto_8822 ) ) ( not ( = ?auto_8824 ?auto_8814 ) ) ( not ( = ?auto_8824 ?auto_8809 ) ) ( not ( = ?auto_8824 ?auto_8816 ) ) ( not ( = ?auto_8818 ?auto_8821 ) ) ( not ( = ?auto_8818 ?auto_8823 ) ) ( not ( = ?auto_8818 ?auto_8820 ) ) ( not ( = ?auto_8800 ?auto_8805 ) ) ( not ( = ?auto_8800 ?auto_8815 ) ) ( not ( = ?auto_8801 ?auto_8805 ) ) ( not ( = ?auto_8801 ?auto_8815 ) ) ( not ( = ?auto_8802 ?auto_8805 ) ) ( not ( = ?auto_8802 ?auto_8815 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8815 ) ) ( not ( = ?auto_8805 ?auto_8818 ) ) ( not ( = ?auto_8805 ?auto_8821 ) ) ( not ( = ?auto_8805 ?auto_8823 ) ) ( not ( = ?auto_8805 ?auto_8820 ) ) ( not ( = ?auto_8815 ?auto_8818 ) ) ( not ( = ?auto_8815 ?auto_8821 ) ) ( not ( = ?auto_8815 ?auto_8823 ) ) ( not ( = ?auto_8815 ?auto_8820 ) ) ( not ( = ?auto_8800 ?auto_8806 ) ) ( not ( = ?auto_8800 ?auto_8825 ) ) ( not ( = ?auto_8801 ?auto_8806 ) ) ( not ( = ?auto_8801 ?auto_8825 ) ) ( not ( = ?auto_8802 ?auto_8806 ) ) ( not ( = ?auto_8802 ?auto_8825 ) ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( not ( = ?auto_8803 ?auto_8825 ) ) ( not ( = ?auto_8804 ?auto_8806 ) ) ( not ( = ?auto_8804 ?auto_8825 ) ) ( not ( = ?auto_8806 ?auto_8815 ) ) ( not ( = ?auto_8806 ?auto_8818 ) ) ( not ( = ?auto_8806 ?auto_8821 ) ) ( not ( = ?auto_8806 ?auto_8823 ) ) ( not ( = ?auto_8806 ?auto_8820 ) ) ( not ( = ?auto_8825 ?auto_8815 ) ) ( not ( = ?auto_8825 ?auto_8818 ) ) ( not ( = ?auto_8825 ?auto_8821 ) ) ( not ( = ?auto_8825 ?auto_8823 ) ) ( not ( = ?auto_8825 ?auto_8820 ) ) ( not ( = ?auto_8800 ?auto_8807 ) ) ( not ( = ?auto_8800 ?auto_8812 ) ) ( not ( = ?auto_8801 ?auto_8807 ) ) ( not ( = ?auto_8801 ?auto_8812 ) ) ( not ( = ?auto_8802 ?auto_8807 ) ) ( not ( = ?auto_8802 ?auto_8812 ) ) ( not ( = ?auto_8803 ?auto_8807 ) ) ( not ( = ?auto_8803 ?auto_8812 ) ) ( not ( = ?auto_8804 ?auto_8807 ) ) ( not ( = ?auto_8804 ?auto_8812 ) ) ( not ( = ?auto_8805 ?auto_8807 ) ) ( not ( = ?auto_8805 ?auto_8812 ) ) ( not ( = ?auto_8807 ?auto_8825 ) ) ( not ( = ?auto_8807 ?auto_8815 ) ) ( not ( = ?auto_8807 ?auto_8818 ) ) ( not ( = ?auto_8807 ?auto_8821 ) ) ( not ( = ?auto_8807 ?auto_8823 ) ) ( not ( = ?auto_8807 ?auto_8820 ) ) ( not ( = ?auto_8812 ?auto_8825 ) ) ( not ( = ?auto_8812 ?auto_8815 ) ) ( not ( = ?auto_8812 ?auto_8818 ) ) ( not ( = ?auto_8812 ?auto_8821 ) ) ( not ( = ?auto_8812 ?auto_8823 ) ) ( not ( = ?auto_8812 ?auto_8820 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_8800 ?auto_8801 ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ?auto_8806 )
      ( MAKE-1CRATE ?auto_8806 ?auto_8807 )
      ( MAKE-7CRATE-VERIFY ?auto_8800 ?auto_8801 ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ?auto_8806 ?auto_8807 ) )
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
      ?auto_8852 - SURFACE
      ?auto_8853 - SURFACE
    )
    :vars
    (
      ?auto_8854 - HOIST
      ?auto_8856 - PLACE
      ?auto_8857 - PLACE
      ?auto_8855 - HOIST
      ?auto_8859 - SURFACE
      ?auto_8860 - PLACE
      ?auto_8865 - HOIST
      ?auto_8874 - SURFACE
      ?auto_8866 - PLACE
      ?auto_8871 - HOIST
      ?auto_8869 - SURFACE
      ?auto_8863 - SURFACE
      ?auto_8861 - SURFACE
      ?auto_8864 - PLACE
      ?auto_8867 - HOIST
      ?auto_8868 - SURFACE
      ?auto_8862 - SURFACE
      ?auto_8872 - PLACE
      ?auto_8870 - HOIST
      ?auto_8873 - SURFACE
      ?auto_8858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8854 ?auto_8856 ) ( IS-CRATE ?auto_8853 ) ( not ( = ?auto_8857 ?auto_8856 ) ) ( HOIST-AT ?auto_8855 ?auto_8857 ) ( AVAILABLE ?auto_8855 ) ( SURFACE-AT ?auto_8853 ?auto_8857 ) ( ON ?auto_8853 ?auto_8859 ) ( CLEAR ?auto_8853 ) ( not ( = ?auto_8852 ?auto_8853 ) ) ( not ( = ?auto_8852 ?auto_8859 ) ) ( not ( = ?auto_8853 ?auto_8859 ) ) ( not ( = ?auto_8854 ?auto_8855 ) ) ( IS-CRATE ?auto_8852 ) ( not ( = ?auto_8860 ?auto_8856 ) ) ( HOIST-AT ?auto_8865 ?auto_8860 ) ( SURFACE-AT ?auto_8852 ?auto_8860 ) ( ON ?auto_8852 ?auto_8874 ) ( CLEAR ?auto_8852 ) ( not ( = ?auto_8851 ?auto_8852 ) ) ( not ( = ?auto_8851 ?auto_8874 ) ) ( not ( = ?auto_8852 ?auto_8874 ) ) ( not ( = ?auto_8854 ?auto_8865 ) ) ( IS-CRATE ?auto_8851 ) ( not ( = ?auto_8866 ?auto_8856 ) ) ( HOIST-AT ?auto_8871 ?auto_8866 ) ( SURFACE-AT ?auto_8851 ?auto_8866 ) ( ON ?auto_8851 ?auto_8869 ) ( CLEAR ?auto_8851 ) ( not ( = ?auto_8850 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8869 ) ) ( not ( = ?auto_8851 ?auto_8869 ) ) ( not ( = ?auto_8854 ?auto_8871 ) ) ( IS-CRATE ?auto_8850 ) ( SURFACE-AT ?auto_8850 ?auto_8866 ) ( ON ?auto_8850 ?auto_8863 ) ( CLEAR ?auto_8850 ) ( not ( = ?auto_8849 ?auto_8850 ) ) ( not ( = ?auto_8849 ?auto_8863 ) ) ( not ( = ?auto_8850 ?auto_8863 ) ) ( IS-CRATE ?auto_8849 ) ( AVAILABLE ?auto_8871 ) ( SURFACE-AT ?auto_8849 ?auto_8866 ) ( ON ?auto_8849 ?auto_8861 ) ( CLEAR ?auto_8849 ) ( not ( = ?auto_8848 ?auto_8849 ) ) ( not ( = ?auto_8848 ?auto_8861 ) ) ( not ( = ?auto_8849 ?auto_8861 ) ) ( IS-CRATE ?auto_8848 ) ( not ( = ?auto_8864 ?auto_8856 ) ) ( HOIST-AT ?auto_8867 ?auto_8864 ) ( AVAILABLE ?auto_8867 ) ( SURFACE-AT ?auto_8848 ?auto_8864 ) ( ON ?auto_8848 ?auto_8868 ) ( CLEAR ?auto_8848 ) ( not ( = ?auto_8847 ?auto_8848 ) ) ( not ( = ?auto_8847 ?auto_8868 ) ) ( not ( = ?auto_8848 ?auto_8868 ) ) ( not ( = ?auto_8854 ?auto_8867 ) ) ( IS-CRATE ?auto_8847 ) ( AVAILABLE ?auto_8865 ) ( SURFACE-AT ?auto_8847 ?auto_8860 ) ( ON ?auto_8847 ?auto_8862 ) ( CLEAR ?auto_8847 ) ( not ( = ?auto_8846 ?auto_8847 ) ) ( not ( = ?auto_8846 ?auto_8862 ) ) ( not ( = ?auto_8847 ?auto_8862 ) ) ( SURFACE-AT ?auto_8845 ?auto_8856 ) ( CLEAR ?auto_8845 ) ( IS-CRATE ?auto_8846 ) ( AVAILABLE ?auto_8854 ) ( not ( = ?auto_8872 ?auto_8856 ) ) ( HOIST-AT ?auto_8870 ?auto_8872 ) ( AVAILABLE ?auto_8870 ) ( SURFACE-AT ?auto_8846 ?auto_8872 ) ( ON ?auto_8846 ?auto_8873 ) ( CLEAR ?auto_8846 ) ( TRUCK-AT ?auto_8858 ?auto_8856 ) ( not ( = ?auto_8845 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8873 ) ) ( not ( = ?auto_8846 ?auto_8873 ) ) ( not ( = ?auto_8854 ?auto_8870 ) ) ( not ( = ?auto_8845 ?auto_8847 ) ) ( not ( = ?auto_8845 ?auto_8862 ) ) ( not ( = ?auto_8847 ?auto_8873 ) ) ( not ( = ?auto_8860 ?auto_8872 ) ) ( not ( = ?auto_8865 ?auto_8870 ) ) ( not ( = ?auto_8862 ?auto_8873 ) ) ( not ( = ?auto_8845 ?auto_8848 ) ) ( not ( = ?auto_8845 ?auto_8868 ) ) ( not ( = ?auto_8846 ?auto_8848 ) ) ( not ( = ?auto_8846 ?auto_8868 ) ) ( not ( = ?auto_8848 ?auto_8862 ) ) ( not ( = ?auto_8848 ?auto_8873 ) ) ( not ( = ?auto_8864 ?auto_8860 ) ) ( not ( = ?auto_8864 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8865 ) ) ( not ( = ?auto_8867 ?auto_8870 ) ) ( not ( = ?auto_8868 ?auto_8862 ) ) ( not ( = ?auto_8868 ?auto_8873 ) ) ( not ( = ?auto_8845 ?auto_8849 ) ) ( not ( = ?auto_8845 ?auto_8861 ) ) ( not ( = ?auto_8846 ?auto_8849 ) ) ( not ( = ?auto_8846 ?auto_8861 ) ) ( not ( = ?auto_8847 ?auto_8849 ) ) ( not ( = ?auto_8847 ?auto_8861 ) ) ( not ( = ?auto_8849 ?auto_8868 ) ) ( not ( = ?auto_8849 ?auto_8862 ) ) ( not ( = ?auto_8849 ?auto_8873 ) ) ( not ( = ?auto_8866 ?auto_8864 ) ) ( not ( = ?auto_8866 ?auto_8860 ) ) ( not ( = ?auto_8866 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8867 ) ) ( not ( = ?auto_8871 ?auto_8865 ) ) ( not ( = ?auto_8871 ?auto_8870 ) ) ( not ( = ?auto_8861 ?auto_8868 ) ) ( not ( = ?auto_8861 ?auto_8862 ) ) ( not ( = ?auto_8861 ?auto_8873 ) ) ( not ( = ?auto_8845 ?auto_8850 ) ) ( not ( = ?auto_8845 ?auto_8863 ) ) ( not ( = ?auto_8846 ?auto_8850 ) ) ( not ( = ?auto_8846 ?auto_8863 ) ) ( not ( = ?auto_8847 ?auto_8850 ) ) ( not ( = ?auto_8847 ?auto_8863 ) ) ( not ( = ?auto_8848 ?auto_8850 ) ) ( not ( = ?auto_8848 ?auto_8863 ) ) ( not ( = ?auto_8850 ?auto_8861 ) ) ( not ( = ?auto_8850 ?auto_8868 ) ) ( not ( = ?auto_8850 ?auto_8862 ) ) ( not ( = ?auto_8850 ?auto_8873 ) ) ( not ( = ?auto_8863 ?auto_8861 ) ) ( not ( = ?auto_8863 ?auto_8868 ) ) ( not ( = ?auto_8863 ?auto_8862 ) ) ( not ( = ?auto_8863 ?auto_8873 ) ) ( not ( = ?auto_8845 ?auto_8851 ) ) ( not ( = ?auto_8845 ?auto_8869 ) ) ( not ( = ?auto_8846 ?auto_8851 ) ) ( not ( = ?auto_8846 ?auto_8869 ) ) ( not ( = ?auto_8847 ?auto_8851 ) ) ( not ( = ?auto_8847 ?auto_8869 ) ) ( not ( = ?auto_8848 ?auto_8851 ) ) ( not ( = ?auto_8848 ?auto_8869 ) ) ( not ( = ?auto_8849 ?auto_8851 ) ) ( not ( = ?auto_8849 ?auto_8869 ) ) ( not ( = ?auto_8851 ?auto_8863 ) ) ( not ( = ?auto_8851 ?auto_8861 ) ) ( not ( = ?auto_8851 ?auto_8868 ) ) ( not ( = ?auto_8851 ?auto_8862 ) ) ( not ( = ?auto_8851 ?auto_8873 ) ) ( not ( = ?auto_8869 ?auto_8863 ) ) ( not ( = ?auto_8869 ?auto_8861 ) ) ( not ( = ?auto_8869 ?auto_8868 ) ) ( not ( = ?auto_8869 ?auto_8862 ) ) ( not ( = ?auto_8869 ?auto_8873 ) ) ( not ( = ?auto_8845 ?auto_8852 ) ) ( not ( = ?auto_8845 ?auto_8874 ) ) ( not ( = ?auto_8846 ?auto_8852 ) ) ( not ( = ?auto_8846 ?auto_8874 ) ) ( not ( = ?auto_8847 ?auto_8852 ) ) ( not ( = ?auto_8847 ?auto_8874 ) ) ( not ( = ?auto_8848 ?auto_8852 ) ) ( not ( = ?auto_8848 ?auto_8874 ) ) ( not ( = ?auto_8849 ?auto_8852 ) ) ( not ( = ?auto_8849 ?auto_8874 ) ) ( not ( = ?auto_8850 ?auto_8852 ) ) ( not ( = ?auto_8850 ?auto_8874 ) ) ( not ( = ?auto_8852 ?auto_8869 ) ) ( not ( = ?auto_8852 ?auto_8863 ) ) ( not ( = ?auto_8852 ?auto_8861 ) ) ( not ( = ?auto_8852 ?auto_8868 ) ) ( not ( = ?auto_8852 ?auto_8862 ) ) ( not ( = ?auto_8852 ?auto_8873 ) ) ( not ( = ?auto_8874 ?auto_8869 ) ) ( not ( = ?auto_8874 ?auto_8863 ) ) ( not ( = ?auto_8874 ?auto_8861 ) ) ( not ( = ?auto_8874 ?auto_8868 ) ) ( not ( = ?auto_8874 ?auto_8862 ) ) ( not ( = ?auto_8874 ?auto_8873 ) ) ( not ( = ?auto_8845 ?auto_8853 ) ) ( not ( = ?auto_8845 ?auto_8859 ) ) ( not ( = ?auto_8846 ?auto_8853 ) ) ( not ( = ?auto_8846 ?auto_8859 ) ) ( not ( = ?auto_8847 ?auto_8853 ) ) ( not ( = ?auto_8847 ?auto_8859 ) ) ( not ( = ?auto_8848 ?auto_8853 ) ) ( not ( = ?auto_8848 ?auto_8859 ) ) ( not ( = ?auto_8849 ?auto_8853 ) ) ( not ( = ?auto_8849 ?auto_8859 ) ) ( not ( = ?auto_8850 ?auto_8853 ) ) ( not ( = ?auto_8850 ?auto_8859 ) ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( not ( = ?auto_8851 ?auto_8859 ) ) ( not ( = ?auto_8853 ?auto_8874 ) ) ( not ( = ?auto_8853 ?auto_8869 ) ) ( not ( = ?auto_8853 ?auto_8863 ) ) ( not ( = ?auto_8853 ?auto_8861 ) ) ( not ( = ?auto_8853 ?auto_8868 ) ) ( not ( = ?auto_8853 ?auto_8862 ) ) ( not ( = ?auto_8853 ?auto_8873 ) ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( not ( = ?auto_8857 ?auto_8866 ) ) ( not ( = ?auto_8857 ?auto_8864 ) ) ( not ( = ?auto_8857 ?auto_8872 ) ) ( not ( = ?auto_8855 ?auto_8865 ) ) ( not ( = ?auto_8855 ?auto_8871 ) ) ( not ( = ?auto_8855 ?auto_8867 ) ) ( not ( = ?auto_8855 ?auto_8870 ) ) ( not ( = ?auto_8859 ?auto_8874 ) ) ( not ( = ?auto_8859 ?auto_8869 ) ) ( not ( = ?auto_8859 ?auto_8863 ) ) ( not ( = ?auto_8859 ?auto_8861 ) ) ( not ( = ?auto_8859 ?auto_8868 ) ) ( not ( = ?auto_8859 ?auto_8862 ) ) ( not ( = ?auto_8859 ?auto_8873 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_8845 ?auto_8846 ?auto_8847 ?auto_8848 ?auto_8849 ?auto_8850 ?auto_8851 ?auto_8852 )
      ( MAKE-1CRATE ?auto_8852 ?auto_8853 )
      ( MAKE-8CRATE-VERIFY ?auto_8845 ?auto_8846 ?auto_8847 ?auto_8848 ?auto_8849 ?auto_8850 ?auto_8851 ?auto_8852 ?auto_8853 ) )
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
      ?auto_8902 - SURFACE
      ?auto_8903 - SURFACE
      ?auto_8904 - SURFACE
    )
    :vars
    (
      ?auto_8910 - HOIST
      ?auto_8907 - PLACE
      ?auto_8908 - PLACE
      ?auto_8906 - HOIST
      ?auto_8905 - SURFACE
      ?auto_8924 - PLACE
      ?auto_8923 - HOIST
      ?auto_8921 - SURFACE
      ?auto_8925 - PLACE
      ?auto_8911 - HOIST
      ?auto_8917 - SURFACE
      ?auto_8912 - PLACE
      ?auto_8916 - HOIST
      ?auto_8922 - SURFACE
      ?auto_8913 - SURFACE
      ?auto_8926 - SURFACE
      ?auto_8915 - PLACE
      ?auto_8919 - HOIST
      ?auto_8918 - SURFACE
      ?auto_8914 - SURFACE
      ?auto_8920 - SURFACE
      ?auto_8909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8910 ?auto_8907 ) ( IS-CRATE ?auto_8904 ) ( not ( = ?auto_8908 ?auto_8907 ) ) ( HOIST-AT ?auto_8906 ?auto_8908 ) ( SURFACE-AT ?auto_8904 ?auto_8908 ) ( ON ?auto_8904 ?auto_8905 ) ( CLEAR ?auto_8904 ) ( not ( = ?auto_8903 ?auto_8904 ) ) ( not ( = ?auto_8903 ?auto_8905 ) ) ( not ( = ?auto_8904 ?auto_8905 ) ) ( not ( = ?auto_8910 ?auto_8906 ) ) ( IS-CRATE ?auto_8903 ) ( not ( = ?auto_8924 ?auto_8907 ) ) ( HOIST-AT ?auto_8923 ?auto_8924 ) ( AVAILABLE ?auto_8923 ) ( SURFACE-AT ?auto_8903 ?auto_8924 ) ( ON ?auto_8903 ?auto_8921 ) ( CLEAR ?auto_8903 ) ( not ( = ?auto_8902 ?auto_8903 ) ) ( not ( = ?auto_8902 ?auto_8921 ) ) ( not ( = ?auto_8903 ?auto_8921 ) ) ( not ( = ?auto_8910 ?auto_8923 ) ) ( IS-CRATE ?auto_8902 ) ( not ( = ?auto_8925 ?auto_8907 ) ) ( HOIST-AT ?auto_8911 ?auto_8925 ) ( SURFACE-AT ?auto_8902 ?auto_8925 ) ( ON ?auto_8902 ?auto_8917 ) ( CLEAR ?auto_8902 ) ( not ( = ?auto_8901 ?auto_8902 ) ) ( not ( = ?auto_8901 ?auto_8917 ) ) ( not ( = ?auto_8902 ?auto_8917 ) ) ( not ( = ?auto_8910 ?auto_8911 ) ) ( IS-CRATE ?auto_8901 ) ( not ( = ?auto_8912 ?auto_8907 ) ) ( HOIST-AT ?auto_8916 ?auto_8912 ) ( SURFACE-AT ?auto_8901 ?auto_8912 ) ( ON ?auto_8901 ?auto_8922 ) ( CLEAR ?auto_8901 ) ( not ( = ?auto_8900 ?auto_8901 ) ) ( not ( = ?auto_8900 ?auto_8922 ) ) ( not ( = ?auto_8901 ?auto_8922 ) ) ( not ( = ?auto_8910 ?auto_8916 ) ) ( IS-CRATE ?auto_8900 ) ( SURFACE-AT ?auto_8900 ?auto_8912 ) ( ON ?auto_8900 ?auto_8913 ) ( CLEAR ?auto_8900 ) ( not ( = ?auto_8899 ?auto_8900 ) ) ( not ( = ?auto_8899 ?auto_8913 ) ) ( not ( = ?auto_8900 ?auto_8913 ) ) ( IS-CRATE ?auto_8899 ) ( AVAILABLE ?auto_8916 ) ( SURFACE-AT ?auto_8899 ?auto_8912 ) ( ON ?auto_8899 ?auto_8926 ) ( CLEAR ?auto_8899 ) ( not ( = ?auto_8898 ?auto_8899 ) ) ( not ( = ?auto_8898 ?auto_8926 ) ) ( not ( = ?auto_8899 ?auto_8926 ) ) ( IS-CRATE ?auto_8898 ) ( not ( = ?auto_8915 ?auto_8907 ) ) ( HOIST-AT ?auto_8919 ?auto_8915 ) ( AVAILABLE ?auto_8919 ) ( SURFACE-AT ?auto_8898 ?auto_8915 ) ( ON ?auto_8898 ?auto_8918 ) ( CLEAR ?auto_8898 ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8918 ) ) ( not ( = ?auto_8898 ?auto_8918 ) ) ( not ( = ?auto_8910 ?auto_8919 ) ) ( IS-CRATE ?auto_8897 ) ( AVAILABLE ?auto_8911 ) ( SURFACE-AT ?auto_8897 ?auto_8925 ) ( ON ?auto_8897 ?auto_8914 ) ( CLEAR ?auto_8897 ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8896 ?auto_8914 ) ) ( not ( = ?auto_8897 ?auto_8914 ) ) ( SURFACE-AT ?auto_8895 ?auto_8907 ) ( CLEAR ?auto_8895 ) ( IS-CRATE ?auto_8896 ) ( AVAILABLE ?auto_8910 ) ( AVAILABLE ?auto_8906 ) ( SURFACE-AT ?auto_8896 ?auto_8908 ) ( ON ?auto_8896 ?auto_8920 ) ( CLEAR ?auto_8896 ) ( TRUCK-AT ?auto_8909 ?auto_8907 ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( not ( = ?auto_8895 ?auto_8920 ) ) ( not ( = ?auto_8896 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8897 ) ) ( not ( = ?auto_8895 ?auto_8914 ) ) ( not ( = ?auto_8897 ?auto_8920 ) ) ( not ( = ?auto_8925 ?auto_8908 ) ) ( not ( = ?auto_8911 ?auto_8906 ) ) ( not ( = ?auto_8914 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8898 ) ) ( not ( = ?auto_8895 ?auto_8918 ) ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8896 ?auto_8918 ) ) ( not ( = ?auto_8898 ?auto_8914 ) ) ( not ( = ?auto_8898 ?auto_8920 ) ) ( not ( = ?auto_8915 ?auto_8925 ) ) ( not ( = ?auto_8915 ?auto_8908 ) ) ( not ( = ?auto_8919 ?auto_8911 ) ) ( not ( = ?auto_8919 ?auto_8906 ) ) ( not ( = ?auto_8918 ?auto_8914 ) ) ( not ( = ?auto_8918 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8899 ) ) ( not ( = ?auto_8895 ?auto_8926 ) ) ( not ( = ?auto_8896 ?auto_8899 ) ) ( not ( = ?auto_8896 ?auto_8926 ) ) ( not ( = ?auto_8897 ?auto_8899 ) ) ( not ( = ?auto_8897 ?auto_8926 ) ) ( not ( = ?auto_8899 ?auto_8918 ) ) ( not ( = ?auto_8899 ?auto_8914 ) ) ( not ( = ?auto_8899 ?auto_8920 ) ) ( not ( = ?auto_8912 ?auto_8915 ) ) ( not ( = ?auto_8912 ?auto_8925 ) ) ( not ( = ?auto_8912 ?auto_8908 ) ) ( not ( = ?auto_8916 ?auto_8919 ) ) ( not ( = ?auto_8916 ?auto_8911 ) ) ( not ( = ?auto_8916 ?auto_8906 ) ) ( not ( = ?auto_8926 ?auto_8918 ) ) ( not ( = ?auto_8926 ?auto_8914 ) ) ( not ( = ?auto_8926 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8900 ) ) ( not ( = ?auto_8895 ?auto_8913 ) ) ( not ( = ?auto_8896 ?auto_8900 ) ) ( not ( = ?auto_8896 ?auto_8913 ) ) ( not ( = ?auto_8897 ?auto_8900 ) ) ( not ( = ?auto_8897 ?auto_8913 ) ) ( not ( = ?auto_8898 ?auto_8900 ) ) ( not ( = ?auto_8898 ?auto_8913 ) ) ( not ( = ?auto_8900 ?auto_8926 ) ) ( not ( = ?auto_8900 ?auto_8918 ) ) ( not ( = ?auto_8900 ?auto_8914 ) ) ( not ( = ?auto_8900 ?auto_8920 ) ) ( not ( = ?auto_8913 ?auto_8926 ) ) ( not ( = ?auto_8913 ?auto_8918 ) ) ( not ( = ?auto_8913 ?auto_8914 ) ) ( not ( = ?auto_8913 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8901 ) ) ( not ( = ?auto_8895 ?auto_8922 ) ) ( not ( = ?auto_8896 ?auto_8901 ) ) ( not ( = ?auto_8896 ?auto_8922 ) ) ( not ( = ?auto_8897 ?auto_8901 ) ) ( not ( = ?auto_8897 ?auto_8922 ) ) ( not ( = ?auto_8898 ?auto_8901 ) ) ( not ( = ?auto_8898 ?auto_8922 ) ) ( not ( = ?auto_8899 ?auto_8901 ) ) ( not ( = ?auto_8899 ?auto_8922 ) ) ( not ( = ?auto_8901 ?auto_8913 ) ) ( not ( = ?auto_8901 ?auto_8926 ) ) ( not ( = ?auto_8901 ?auto_8918 ) ) ( not ( = ?auto_8901 ?auto_8914 ) ) ( not ( = ?auto_8901 ?auto_8920 ) ) ( not ( = ?auto_8922 ?auto_8913 ) ) ( not ( = ?auto_8922 ?auto_8926 ) ) ( not ( = ?auto_8922 ?auto_8918 ) ) ( not ( = ?auto_8922 ?auto_8914 ) ) ( not ( = ?auto_8922 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8902 ) ) ( not ( = ?auto_8895 ?auto_8917 ) ) ( not ( = ?auto_8896 ?auto_8902 ) ) ( not ( = ?auto_8896 ?auto_8917 ) ) ( not ( = ?auto_8897 ?auto_8902 ) ) ( not ( = ?auto_8897 ?auto_8917 ) ) ( not ( = ?auto_8898 ?auto_8902 ) ) ( not ( = ?auto_8898 ?auto_8917 ) ) ( not ( = ?auto_8899 ?auto_8902 ) ) ( not ( = ?auto_8899 ?auto_8917 ) ) ( not ( = ?auto_8900 ?auto_8902 ) ) ( not ( = ?auto_8900 ?auto_8917 ) ) ( not ( = ?auto_8902 ?auto_8922 ) ) ( not ( = ?auto_8902 ?auto_8913 ) ) ( not ( = ?auto_8902 ?auto_8926 ) ) ( not ( = ?auto_8902 ?auto_8918 ) ) ( not ( = ?auto_8902 ?auto_8914 ) ) ( not ( = ?auto_8902 ?auto_8920 ) ) ( not ( = ?auto_8917 ?auto_8922 ) ) ( not ( = ?auto_8917 ?auto_8913 ) ) ( not ( = ?auto_8917 ?auto_8926 ) ) ( not ( = ?auto_8917 ?auto_8918 ) ) ( not ( = ?auto_8917 ?auto_8914 ) ) ( not ( = ?auto_8917 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8903 ) ) ( not ( = ?auto_8895 ?auto_8921 ) ) ( not ( = ?auto_8896 ?auto_8903 ) ) ( not ( = ?auto_8896 ?auto_8921 ) ) ( not ( = ?auto_8897 ?auto_8903 ) ) ( not ( = ?auto_8897 ?auto_8921 ) ) ( not ( = ?auto_8898 ?auto_8903 ) ) ( not ( = ?auto_8898 ?auto_8921 ) ) ( not ( = ?auto_8899 ?auto_8903 ) ) ( not ( = ?auto_8899 ?auto_8921 ) ) ( not ( = ?auto_8900 ?auto_8903 ) ) ( not ( = ?auto_8900 ?auto_8921 ) ) ( not ( = ?auto_8901 ?auto_8903 ) ) ( not ( = ?auto_8901 ?auto_8921 ) ) ( not ( = ?auto_8903 ?auto_8917 ) ) ( not ( = ?auto_8903 ?auto_8922 ) ) ( not ( = ?auto_8903 ?auto_8913 ) ) ( not ( = ?auto_8903 ?auto_8926 ) ) ( not ( = ?auto_8903 ?auto_8918 ) ) ( not ( = ?auto_8903 ?auto_8914 ) ) ( not ( = ?auto_8903 ?auto_8920 ) ) ( not ( = ?auto_8924 ?auto_8925 ) ) ( not ( = ?auto_8924 ?auto_8912 ) ) ( not ( = ?auto_8924 ?auto_8915 ) ) ( not ( = ?auto_8924 ?auto_8908 ) ) ( not ( = ?auto_8923 ?auto_8911 ) ) ( not ( = ?auto_8923 ?auto_8916 ) ) ( not ( = ?auto_8923 ?auto_8919 ) ) ( not ( = ?auto_8923 ?auto_8906 ) ) ( not ( = ?auto_8921 ?auto_8917 ) ) ( not ( = ?auto_8921 ?auto_8922 ) ) ( not ( = ?auto_8921 ?auto_8913 ) ) ( not ( = ?auto_8921 ?auto_8926 ) ) ( not ( = ?auto_8921 ?auto_8918 ) ) ( not ( = ?auto_8921 ?auto_8914 ) ) ( not ( = ?auto_8921 ?auto_8920 ) ) ( not ( = ?auto_8895 ?auto_8904 ) ) ( not ( = ?auto_8895 ?auto_8905 ) ) ( not ( = ?auto_8896 ?auto_8904 ) ) ( not ( = ?auto_8896 ?auto_8905 ) ) ( not ( = ?auto_8897 ?auto_8904 ) ) ( not ( = ?auto_8897 ?auto_8905 ) ) ( not ( = ?auto_8898 ?auto_8904 ) ) ( not ( = ?auto_8898 ?auto_8905 ) ) ( not ( = ?auto_8899 ?auto_8904 ) ) ( not ( = ?auto_8899 ?auto_8905 ) ) ( not ( = ?auto_8900 ?auto_8904 ) ) ( not ( = ?auto_8900 ?auto_8905 ) ) ( not ( = ?auto_8901 ?auto_8904 ) ) ( not ( = ?auto_8901 ?auto_8905 ) ) ( not ( = ?auto_8902 ?auto_8904 ) ) ( not ( = ?auto_8902 ?auto_8905 ) ) ( not ( = ?auto_8904 ?auto_8921 ) ) ( not ( = ?auto_8904 ?auto_8917 ) ) ( not ( = ?auto_8904 ?auto_8922 ) ) ( not ( = ?auto_8904 ?auto_8913 ) ) ( not ( = ?auto_8904 ?auto_8926 ) ) ( not ( = ?auto_8904 ?auto_8918 ) ) ( not ( = ?auto_8904 ?auto_8914 ) ) ( not ( = ?auto_8904 ?auto_8920 ) ) ( not ( = ?auto_8905 ?auto_8921 ) ) ( not ( = ?auto_8905 ?auto_8917 ) ) ( not ( = ?auto_8905 ?auto_8922 ) ) ( not ( = ?auto_8905 ?auto_8913 ) ) ( not ( = ?auto_8905 ?auto_8926 ) ) ( not ( = ?auto_8905 ?auto_8918 ) ) ( not ( = ?auto_8905 ?auto_8914 ) ) ( not ( = ?auto_8905 ?auto_8920 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_8895 ?auto_8896 ?auto_8897 ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8901 ?auto_8902 ?auto_8903 )
      ( MAKE-1CRATE ?auto_8903 ?auto_8904 )
      ( MAKE-9CRATE-VERIFY ?auto_8895 ?auto_8896 ?auto_8897 ?auto_8898 ?auto_8899 ?auto_8900 ?auto_8901 ?auto_8902 ?auto_8903 ?auto_8904 ) )
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
      ?auto_8955 - SURFACE
      ?auto_8956 - SURFACE
      ?auto_8957 - SURFACE
      ?auto_8958 - SURFACE
    )
    :vars
    (
      ?auto_8960 - HOIST
      ?auto_8959 - PLACE
      ?auto_8962 - PLACE
      ?auto_8964 - HOIST
      ?auto_8963 - SURFACE
      ?auto_8975 - PLACE
      ?auto_8978 - HOIST
      ?auto_8968 - SURFACE
      ?auto_8969 - PLACE
      ?auto_8966 - HOIST
      ?auto_8981 - SURFACE
      ?auto_8974 - PLACE
      ?auto_8977 - HOIST
      ?auto_8980 - SURFACE
      ?auto_8972 - SURFACE
      ?auto_8973 - SURFACE
      ?auto_8979 - SURFACE
      ?auto_8970 - PLACE
      ?auto_8967 - HOIST
      ?auto_8965 - SURFACE
      ?auto_8976 - SURFACE
      ?auto_8971 - SURFACE
      ?auto_8961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8960 ?auto_8959 ) ( IS-CRATE ?auto_8958 ) ( not ( = ?auto_8962 ?auto_8959 ) ) ( HOIST-AT ?auto_8964 ?auto_8962 ) ( SURFACE-AT ?auto_8958 ?auto_8962 ) ( ON ?auto_8958 ?auto_8963 ) ( CLEAR ?auto_8958 ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( not ( = ?auto_8957 ?auto_8963 ) ) ( not ( = ?auto_8958 ?auto_8963 ) ) ( not ( = ?auto_8960 ?auto_8964 ) ) ( IS-CRATE ?auto_8957 ) ( not ( = ?auto_8975 ?auto_8959 ) ) ( HOIST-AT ?auto_8978 ?auto_8975 ) ( SURFACE-AT ?auto_8957 ?auto_8975 ) ( ON ?auto_8957 ?auto_8968 ) ( CLEAR ?auto_8957 ) ( not ( = ?auto_8956 ?auto_8957 ) ) ( not ( = ?auto_8956 ?auto_8968 ) ) ( not ( = ?auto_8957 ?auto_8968 ) ) ( not ( = ?auto_8960 ?auto_8978 ) ) ( IS-CRATE ?auto_8956 ) ( not ( = ?auto_8969 ?auto_8959 ) ) ( HOIST-AT ?auto_8966 ?auto_8969 ) ( AVAILABLE ?auto_8966 ) ( SURFACE-AT ?auto_8956 ?auto_8969 ) ( ON ?auto_8956 ?auto_8981 ) ( CLEAR ?auto_8956 ) ( not ( = ?auto_8955 ?auto_8956 ) ) ( not ( = ?auto_8955 ?auto_8981 ) ) ( not ( = ?auto_8956 ?auto_8981 ) ) ( not ( = ?auto_8960 ?auto_8966 ) ) ( IS-CRATE ?auto_8955 ) ( not ( = ?auto_8974 ?auto_8959 ) ) ( HOIST-AT ?auto_8977 ?auto_8974 ) ( SURFACE-AT ?auto_8955 ?auto_8974 ) ( ON ?auto_8955 ?auto_8980 ) ( CLEAR ?auto_8955 ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8980 ) ) ( not ( = ?auto_8955 ?auto_8980 ) ) ( not ( = ?auto_8960 ?auto_8977 ) ) ( IS-CRATE ?auto_8954 ) ( SURFACE-AT ?auto_8954 ?auto_8962 ) ( ON ?auto_8954 ?auto_8972 ) ( CLEAR ?auto_8954 ) ( not ( = ?auto_8953 ?auto_8954 ) ) ( not ( = ?auto_8953 ?auto_8972 ) ) ( not ( = ?auto_8954 ?auto_8972 ) ) ( IS-CRATE ?auto_8953 ) ( SURFACE-AT ?auto_8953 ?auto_8962 ) ( ON ?auto_8953 ?auto_8973 ) ( CLEAR ?auto_8953 ) ( not ( = ?auto_8952 ?auto_8953 ) ) ( not ( = ?auto_8952 ?auto_8973 ) ) ( not ( = ?auto_8953 ?auto_8973 ) ) ( IS-CRATE ?auto_8952 ) ( AVAILABLE ?auto_8964 ) ( SURFACE-AT ?auto_8952 ?auto_8962 ) ( ON ?auto_8952 ?auto_8979 ) ( CLEAR ?auto_8952 ) ( not ( = ?auto_8951 ?auto_8952 ) ) ( not ( = ?auto_8951 ?auto_8979 ) ) ( not ( = ?auto_8952 ?auto_8979 ) ) ( IS-CRATE ?auto_8951 ) ( not ( = ?auto_8970 ?auto_8959 ) ) ( HOIST-AT ?auto_8967 ?auto_8970 ) ( AVAILABLE ?auto_8967 ) ( SURFACE-AT ?auto_8951 ?auto_8970 ) ( ON ?auto_8951 ?auto_8965 ) ( CLEAR ?auto_8951 ) ( not ( = ?auto_8950 ?auto_8951 ) ) ( not ( = ?auto_8950 ?auto_8965 ) ) ( not ( = ?auto_8951 ?auto_8965 ) ) ( not ( = ?auto_8960 ?auto_8967 ) ) ( IS-CRATE ?auto_8950 ) ( AVAILABLE ?auto_8977 ) ( SURFACE-AT ?auto_8950 ?auto_8974 ) ( ON ?auto_8950 ?auto_8976 ) ( CLEAR ?auto_8950 ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( not ( = ?auto_8949 ?auto_8976 ) ) ( not ( = ?auto_8950 ?auto_8976 ) ) ( SURFACE-AT ?auto_8948 ?auto_8959 ) ( CLEAR ?auto_8948 ) ( IS-CRATE ?auto_8949 ) ( AVAILABLE ?auto_8960 ) ( AVAILABLE ?auto_8978 ) ( SURFACE-AT ?auto_8949 ?auto_8975 ) ( ON ?auto_8949 ?auto_8971 ) ( CLEAR ?auto_8949 ) ( TRUCK-AT ?auto_8961 ?auto_8959 ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8971 ) ) ( not ( = ?auto_8949 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8950 ) ) ( not ( = ?auto_8948 ?auto_8976 ) ) ( not ( = ?auto_8950 ?auto_8971 ) ) ( not ( = ?auto_8974 ?auto_8975 ) ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8976 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8951 ) ) ( not ( = ?auto_8948 ?auto_8965 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8949 ?auto_8965 ) ) ( not ( = ?auto_8951 ?auto_8976 ) ) ( not ( = ?auto_8951 ?auto_8971 ) ) ( not ( = ?auto_8970 ?auto_8974 ) ) ( not ( = ?auto_8970 ?auto_8975 ) ) ( not ( = ?auto_8967 ?auto_8977 ) ) ( not ( = ?auto_8967 ?auto_8978 ) ) ( not ( = ?auto_8965 ?auto_8976 ) ) ( not ( = ?auto_8965 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8952 ) ) ( not ( = ?auto_8948 ?auto_8979 ) ) ( not ( = ?auto_8949 ?auto_8952 ) ) ( not ( = ?auto_8949 ?auto_8979 ) ) ( not ( = ?auto_8950 ?auto_8952 ) ) ( not ( = ?auto_8950 ?auto_8979 ) ) ( not ( = ?auto_8952 ?auto_8965 ) ) ( not ( = ?auto_8952 ?auto_8976 ) ) ( not ( = ?auto_8952 ?auto_8971 ) ) ( not ( = ?auto_8962 ?auto_8970 ) ) ( not ( = ?auto_8962 ?auto_8974 ) ) ( not ( = ?auto_8962 ?auto_8975 ) ) ( not ( = ?auto_8964 ?auto_8967 ) ) ( not ( = ?auto_8964 ?auto_8977 ) ) ( not ( = ?auto_8964 ?auto_8978 ) ) ( not ( = ?auto_8979 ?auto_8965 ) ) ( not ( = ?auto_8979 ?auto_8976 ) ) ( not ( = ?auto_8979 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8953 ) ) ( not ( = ?auto_8948 ?auto_8973 ) ) ( not ( = ?auto_8949 ?auto_8953 ) ) ( not ( = ?auto_8949 ?auto_8973 ) ) ( not ( = ?auto_8950 ?auto_8953 ) ) ( not ( = ?auto_8950 ?auto_8973 ) ) ( not ( = ?auto_8951 ?auto_8953 ) ) ( not ( = ?auto_8951 ?auto_8973 ) ) ( not ( = ?auto_8953 ?auto_8979 ) ) ( not ( = ?auto_8953 ?auto_8965 ) ) ( not ( = ?auto_8953 ?auto_8976 ) ) ( not ( = ?auto_8953 ?auto_8971 ) ) ( not ( = ?auto_8973 ?auto_8979 ) ) ( not ( = ?auto_8973 ?auto_8965 ) ) ( not ( = ?auto_8973 ?auto_8976 ) ) ( not ( = ?auto_8973 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8954 ) ) ( not ( = ?auto_8948 ?auto_8972 ) ) ( not ( = ?auto_8949 ?auto_8954 ) ) ( not ( = ?auto_8949 ?auto_8972 ) ) ( not ( = ?auto_8950 ?auto_8954 ) ) ( not ( = ?auto_8950 ?auto_8972 ) ) ( not ( = ?auto_8951 ?auto_8954 ) ) ( not ( = ?auto_8951 ?auto_8972 ) ) ( not ( = ?auto_8952 ?auto_8954 ) ) ( not ( = ?auto_8952 ?auto_8972 ) ) ( not ( = ?auto_8954 ?auto_8973 ) ) ( not ( = ?auto_8954 ?auto_8979 ) ) ( not ( = ?auto_8954 ?auto_8965 ) ) ( not ( = ?auto_8954 ?auto_8976 ) ) ( not ( = ?auto_8954 ?auto_8971 ) ) ( not ( = ?auto_8972 ?auto_8973 ) ) ( not ( = ?auto_8972 ?auto_8979 ) ) ( not ( = ?auto_8972 ?auto_8965 ) ) ( not ( = ?auto_8972 ?auto_8976 ) ) ( not ( = ?auto_8972 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8955 ) ) ( not ( = ?auto_8948 ?auto_8980 ) ) ( not ( = ?auto_8949 ?auto_8955 ) ) ( not ( = ?auto_8949 ?auto_8980 ) ) ( not ( = ?auto_8950 ?auto_8955 ) ) ( not ( = ?auto_8950 ?auto_8980 ) ) ( not ( = ?auto_8951 ?auto_8955 ) ) ( not ( = ?auto_8951 ?auto_8980 ) ) ( not ( = ?auto_8952 ?auto_8955 ) ) ( not ( = ?auto_8952 ?auto_8980 ) ) ( not ( = ?auto_8953 ?auto_8955 ) ) ( not ( = ?auto_8953 ?auto_8980 ) ) ( not ( = ?auto_8955 ?auto_8972 ) ) ( not ( = ?auto_8955 ?auto_8973 ) ) ( not ( = ?auto_8955 ?auto_8979 ) ) ( not ( = ?auto_8955 ?auto_8965 ) ) ( not ( = ?auto_8955 ?auto_8976 ) ) ( not ( = ?auto_8955 ?auto_8971 ) ) ( not ( = ?auto_8980 ?auto_8972 ) ) ( not ( = ?auto_8980 ?auto_8973 ) ) ( not ( = ?auto_8980 ?auto_8979 ) ) ( not ( = ?auto_8980 ?auto_8965 ) ) ( not ( = ?auto_8980 ?auto_8976 ) ) ( not ( = ?auto_8980 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8956 ) ) ( not ( = ?auto_8948 ?auto_8981 ) ) ( not ( = ?auto_8949 ?auto_8956 ) ) ( not ( = ?auto_8949 ?auto_8981 ) ) ( not ( = ?auto_8950 ?auto_8956 ) ) ( not ( = ?auto_8950 ?auto_8981 ) ) ( not ( = ?auto_8951 ?auto_8956 ) ) ( not ( = ?auto_8951 ?auto_8981 ) ) ( not ( = ?auto_8952 ?auto_8956 ) ) ( not ( = ?auto_8952 ?auto_8981 ) ) ( not ( = ?auto_8953 ?auto_8956 ) ) ( not ( = ?auto_8953 ?auto_8981 ) ) ( not ( = ?auto_8954 ?auto_8956 ) ) ( not ( = ?auto_8954 ?auto_8981 ) ) ( not ( = ?auto_8956 ?auto_8980 ) ) ( not ( = ?auto_8956 ?auto_8972 ) ) ( not ( = ?auto_8956 ?auto_8973 ) ) ( not ( = ?auto_8956 ?auto_8979 ) ) ( not ( = ?auto_8956 ?auto_8965 ) ) ( not ( = ?auto_8956 ?auto_8976 ) ) ( not ( = ?auto_8956 ?auto_8971 ) ) ( not ( = ?auto_8969 ?auto_8974 ) ) ( not ( = ?auto_8969 ?auto_8962 ) ) ( not ( = ?auto_8969 ?auto_8970 ) ) ( not ( = ?auto_8969 ?auto_8975 ) ) ( not ( = ?auto_8966 ?auto_8977 ) ) ( not ( = ?auto_8966 ?auto_8964 ) ) ( not ( = ?auto_8966 ?auto_8967 ) ) ( not ( = ?auto_8966 ?auto_8978 ) ) ( not ( = ?auto_8981 ?auto_8980 ) ) ( not ( = ?auto_8981 ?auto_8972 ) ) ( not ( = ?auto_8981 ?auto_8973 ) ) ( not ( = ?auto_8981 ?auto_8979 ) ) ( not ( = ?auto_8981 ?auto_8965 ) ) ( not ( = ?auto_8981 ?auto_8976 ) ) ( not ( = ?auto_8981 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8957 ) ) ( not ( = ?auto_8948 ?auto_8968 ) ) ( not ( = ?auto_8949 ?auto_8957 ) ) ( not ( = ?auto_8949 ?auto_8968 ) ) ( not ( = ?auto_8950 ?auto_8957 ) ) ( not ( = ?auto_8950 ?auto_8968 ) ) ( not ( = ?auto_8951 ?auto_8957 ) ) ( not ( = ?auto_8951 ?auto_8968 ) ) ( not ( = ?auto_8952 ?auto_8957 ) ) ( not ( = ?auto_8952 ?auto_8968 ) ) ( not ( = ?auto_8953 ?auto_8957 ) ) ( not ( = ?auto_8953 ?auto_8968 ) ) ( not ( = ?auto_8954 ?auto_8957 ) ) ( not ( = ?auto_8954 ?auto_8968 ) ) ( not ( = ?auto_8955 ?auto_8957 ) ) ( not ( = ?auto_8955 ?auto_8968 ) ) ( not ( = ?auto_8957 ?auto_8981 ) ) ( not ( = ?auto_8957 ?auto_8980 ) ) ( not ( = ?auto_8957 ?auto_8972 ) ) ( not ( = ?auto_8957 ?auto_8973 ) ) ( not ( = ?auto_8957 ?auto_8979 ) ) ( not ( = ?auto_8957 ?auto_8965 ) ) ( not ( = ?auto_8957 ?auto_8976 ) ) ( not ( = ?auto_8957 ?auto_8971 ) ) ( not ( = ?auto_8968 ?auto_8981 ) ) ( not ( = ?auto_8968 ?auto_8980 ) ) ( not ( = ?auto_8968 ?auto_8972 ) ) ( not ( = ?auto_8968 ?auto_8973 ) ) ( not ( = ?auto_8968 ?auto_8979 ) ) ( not ( = ?auto_8968 ?auto_8965 ) ) ( not ( = ?auto_8968 ?auto_8976 ) ) ( not ( = ?auto_8968 ?auto_8971 ) ) ( not ( = ?auto_8948 ?auto_8958 ) ) ( not ( = ?auto_8948 ?auto_8963 ) ) ( not ( = ?auto_8949 ?auto_8958 ) ) ( not ( = ?auto_8949 ?auto_8963 ) ) ( not ( = ?auto_8950 ?auto_8958 ) ) ( not ( = ?auto_8950 ?auto_8963 ) ) ( not ( = ?auto_8951 ?auto_8958 ) ) ( not ( = ?auto_8951 ?auto_8963 ) ) ( not ( = ?auto_8952 ?auto_8958 ) ) ( not ( = ?auto_8952 ?auto_8963 ) ) ( not ( = ?auto_8953 ?auto_8958 ) ) ( not ( = ?auto_8953 ?auto_8963 ) ) ( not ( = ?auto_8954 ?auto_8958 ) ) ( not ( = ?auto_8954 ?auto_8963 ) ) ( not ( = ?auto_8955 ?auto_8958 ) ) ( not ( = ?auto_8955 ?auto_8963 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( not ( = ?auto_8956 ?auto_8963 ) ) ( not ( = ?auto_8958 ?auto_8968 ) ) ( not ( = ?auto_8958 ?auto_8981 ) ) ( not ( = ?auto_8958 ?auto_8980 ) ) ( not ( = ?auto_8958 ?auto_8972 ) ) ( not ( = ?auto_8958 ?auto_8973 ) ) ( not ( = ?auto_8958 ?auto_8979 ) ) ( not ( = ?auto_8958 ?auto_8965 ) ) ( not ( = ?auto_8958 ?auto_8976 ) ) ( not ( = ?auto_8958 ?auto_8971 ) ) ( not ( = ?auto_8963 ?auto_8968 ) ) ( not ( = ?auto_8963 ?auto_8981 ) ) ( not ( = ?auto_8963 ?auto_8980 ) ) ( not ( = ?auto_8963 ?auto_8972 ) ) ( not ( = ?auto_8963 ?auto_8973 ) ) ( not ( = ?auto_8963 ?auto_8979 ) ) ( not ( = ?auto_8963 ?auto_8965 ) ) ( not ( = ?auto_8963 ?auto_8976 ) ) ( not ( = ?auto_8963 ?auto_8971 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8951 ?auto_8952 ?auto_8953 ?auto_8954 ?auto_8955 ?auto_8956 ?auto_8957 )
      ( MAKE-1CRATE ?auto_8957 ?auto_8958 )
      ( MAKE-10CRATE-VERIFY ?auto_8948 ?auto_8949 ?auto_8950 ?auto_8951 ?auto_8952 ?auto_8953 ?auto_8954 ?auto_8955 ?auto_8956 ?auto_8957 ?auto_8958 ) )
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
      ?auto_9011 - SURFACE
      ?auto_9012 - SURFACE
      ?auto_9013 - SURFACE
      ?auto_9014 - SURFACE
      ?auto_9015 - SURFACE
    )
    :vars
    (
      ?auto_9020 - HOIST
      ?auto_9016 - PLACE
      ?auto_9018 - PLACE
      ?auto_9021 - HOIST
      ?auto_9019 - SURFACE
      ?auto_9029 - PLACE
      ?auto_9023 - HOIST
      ?auto_9032 - SURFACE
      ?auto_9026 - PLACE
      ?auto_9039 - HOIST
      ?auto_9036 - SURFACE
      ?auto_9025 - PLACE
      ?auto_9033 - HOIST
      ?auto_9035 - SURFACE
      ?auto_9022 - PLACE
      ?auto_9041 - HOIST
      ?auto_9037 - SURFACE
      ?auto_9024 - SURFACE
      ?auto_9027 - SURFACE
      ?auto_9031 - SURFACE
      ?auto_9030 - PLACE
      ?auto_9034 - HOIST
      ?auto_9038 - SURFACE
      ?auto_9040 - SURFACE
      ?auto_9028 - SURFACE
      ?auto_9017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9020 ?auto_9016 ) ( IS-CRATE ?auto_9015 ) ( not ( = ?auto_9018 ?auto_9016 ) ) ( HOIST-AT ?auto_9021 ?auto_9018 ) ( AVAILABLE ?auto_9021 ) ( SURFACE-AT ?auto_9015 ?auto_9018 ) ( ON ?auto_9015 ?auto_9019 ) ( CLEAR ?auto_9015 ) ( not ( = ?auto_9014 ?auto_9015 ) ) ( not ( = ?auto_9014 ?auto_9019 ) ) ( not ( = ?auto_9015 ?auto_9019 ) ) ( not ( = ?auto_9020 ?auto_9021 ) ) ( IS-CRATE ?auto_9014 ) ( not ( = ?auto_9029 ?auto_9016 ) ) ( HOIST-AT ?auto_9023 ?auto_9029 ) ( SURFACE-AT ?auto_9014 ?auto_9029 ) ( ON ?auto_9014 ?auto_9032 ) ( CLEAR ?auto_9014 ) ( not ( = ?auto_9013 ?auto_9014 ) ) ( not ( = ?auto_9013 ?auto_9032 ) ) ( not ( = ?auto_9014 ?auto_9032 ) ) ( not ( = ?auto_9020 ?auto_9023 ) ) ( IS-CRATE ?auto_9013 ) ( not ( = ?auto_9026 ?auto_9016 ) ) ( HOIST-AT ?auto_9039 ?auto_9026 ) ( SURFACE-AT ?auto_9013 ?auto_9026 ) ( ON ?auto_9013 ?auto_9036 ) ( CLEAR ?auto_9013 ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( not ( = ?auto_9012 ?auto_9036 ) ) ( not ( = ?auto_9013 ?auto_9036 ) ) ( not ( = ?auto_9020 ?auto_9039 ) ) ( IS-CRATE ?auto_9012 ) ( not ( = ?auto_9025 ?auto_9016 ) ) ( HOIST-AT ?auto_9033 ?auto_9025 ) ( AVAILABLE ?auto_9033 ) ( SURFACE-AT ?auto_9012 ?auto_9025 ) ( ON ?auto_9012 ?auto_9035 ) ( CLEAR ?auto_9012 ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9035 ) ) ( not ( = ?auto_9012 ?auto_9035 ) ) ( not ( = ?auto_9020 ?auto_9033 ) ) ( IS-CRATE ?auto_9011 ) ( not ( = ?auto_9022 ?auto_9016 ) ) ( HOIST-AT ?auto_9041 ?auto_9022 ) ( SURFACE-AT ?auto_9011 ?auto_9022 ) ( ON ?auto_9011 ?auto_9037 ) ( CLEAR ?auto_9011 ) ( not ( = ?auto_9010 ?auto_9011 ) ) ( not ( = ?auto_9010 ?auto_9037 ) ) ( not ( = ?auto_9011 ?auto_9037 ) ) ( not ( = ?auto_9020 ?auto_9041 ) ) ( IS-CRATE ?auto_9010 ) ( SURFACE-AT ?auto_9010 ?auto_9029 ) ( ON ?auto_9010 ?auto_9024 ) ( CLEAR ?auto_9010 ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( not ( = ?auto_9009 ?auto_9024 ) ) ( not ( = ?auto_9010 ?auto_9024 ) ) ( IS-CRATE ?auto_9009 ) ( SURFACE-AT ?auto_9009 ?auto_9029 ) ( ON ?auto_9009 ?auto_9027 ) ( CLEAR ?auto_9009 ) ( not ( = ?auto_9008 ?auto_9009 ) ) ( not ( = ?auto_9008 ?auto_9027 ) ) ( not ( = ?auto_9009 ?auto_9027 ) ) ( IS-CRATE ?auto_9008 ) ( AVAILABLE ?auto_9023 ) ( SURFACE-AT ?auto_9008 ?auto_9029 ) ( ON ?auto_9008 ?auto_9031 ) ( CLEAR ?auto_9008 ) ( not ( = ?auto_9007 ?auto_9008 ) ) ( not ( = ?auto_9007 ?auto_9031 ) ) ( not ( = ?auto_9008 ?auto_9031 ) ) ( IS-CRATE ?auto_9007 ) ( not ( = ?auto_9030 ?auto_9016 ) ) ( HOIST-AT ?auto_9034 ?auto_9030 ) ( AVAILABLE ?auto_9034 ) ( SURFACE-AT ?auto_9007 ?auto_9030 ) ( ON ?auto_9007 ?auto_9038 ) ( CLEAR ?auto_9007 ) ( not ( = ?auto_9006 ?auto_9007 ) ) ( not ( = ?auto_9006 ?auto_9038 ) ) ( not ( = ?auto_9007 ?auto_9038 ) ) ( not ( = ?auto_9020 ?auto_9034 ) ) ( IS-CRATE ?auto_9006 ) ( AVAILABLE ?auto_9041 ) ( SURFACE-AT ?auto_9006 ?auto_9022 ) ( ON ?auto_9006 ?auto_9040 ) ( CLEAR ?auto_9006 ) ( not ( = ?auto_9005 ?auto_9006 ) ) ( not ( = ?auto_9005 ?auto_9040 ) ) ( not ( = ?auto_9006 ?auto_9040 ) ) ( SURFACE-AT ?auto_9004 ?auto_9016 ) ( CLEAR ?auto_9004 ) ( IS-CRATE ?auto_9005 ) ( AVAILABLE ?auto_9020 ) ( AVAILABLE ?auto_9039 ) ( SURFACE-AT ?auto_9005 ?auto_9026 ) ( ON ?auto_9005 ?auto_9028 ) ( CLEAR ?auto_9005 ) ( TRUCK-AT ?auto_9017 ?auto_9016 ) ( not ( = ?auto_9004 ?auto_9005 ) ) ( not ( = ?auto_9004 ?auto_9028 ) ) ( not ( = ?auto_9005 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9006 ) ) ( not ( = ?auto_9004 ?auto_9040 ) ) ( not ( = ?auto_9006 ?auto_9028 ) ) ( not ( = ?auto_9022 ?auto_9026 ) ) ( not ( = ?auto_9041 ?auto_9039 ) ) ( not ( = ?auto_9040 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9007 ) ) ( not ( = ?auto_9004 ?auto_9038 ) ) ( not ( = ?auto_9005 ?auto_9007 ) ) ( not ( = ?auto_9005 ?auto_9038 ) ) ( not ( = ?auto_9007 ?auto_9040 ) ) ( not ( = ?auto_9007 ?auto_9028 ) ) ( not ( = ?auto_9030 ?auto_9022 ) ) ( not ( = ?auto_9030 ?auto_9026 ) ) ( not ( = ?auto_9034 ?auto_9041 ) ) ( not ( = ?auto_9034 ?auto_9039 ) ) ( not ( = ?auto_9038 ?auto_9040 ) ) ( not ( = ?auto_9038 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9008 ) ) ( not ( = ?auto_9004 ?auto_9031 ) ) ( not ( = ?auto_9005 ?auto_9008 ) ) ( not ( = ?auto_9005 ?auto_9031 ) ) ( not ( = ?auto_9006 ?auto_9008 ) ) ( not ( = ?auto_9006 ?auto_9031 ) ) ( not ( = ?auto_9008 ?auto_9038 ) ) ( not ( = ?auto_9008 ?auto_9040 ) ) ( not ( = ?auto_9008 ?auto_9028 ) ) ( not ( = ?auto_9029 ?auto_9030 ) ) ( not ( = ?auto_9029 ?auto_9022 ) ) ( not ( = ?auto_9029 ?auto_9026 ) ) ( not ( = ?auto_9023 ?auto_9034 ) ) ( not ( = ?auto_9023 ?auto_9041 ) ) ( not ( = ?auto_9023 ?auto_9039 ) ) ( not ( = ?auto_9031 ?auto_9038 ) ) ( not ( = ?auto_9031 ?auto_9040 ) ) ( not ( = ?auto_9031 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9009 ) ) ( not ( = ?auto_9004 ?auto_9027 ) ) ( not ( = ?auto_9005 ?auto_9009 ) ) ( not ( = ?auto_9005 ?auto_9027 ) ) ( not ( = ?auto_9006 ?auto_9009 ) ) ( not ( = ?auto_9006 ?auto_9027 ) ) ( not ( = ?auto_9007 ?auto_9009 ) ) ( not ( = ?auto_9007 ?auto_9027 ) ) ( not ( = ?auto_9009 ?auto_9031 ) ) ( not ( = ?auto_9009 ?auto_9038 ) ) ( not ( = ?auto_9009 ?auto_9040 ) ) ( not ( = ?auto_9009 ?auto_9028 ) ) ( not ( = ?auto_9027 ?auto_9031 ) ) ( not ( = ?auto_9027 ?auto_9038 ) ) ( not ( = ?auto_9027 ?auto_9040 ) ) ( not ( = ?auto_9027 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9010 ) ) ( not ( = ?auto_9004 ?auto_9024 ) ) ( not ( = ?auto_9005 ?auto_9010 ) ) ( not ( = ?auto_9005 ?auto_9024 ) ) ( not ( = ?auto_9006 ?auto_9010 ) ) ( not ( = ?auto_9006 ?auto_9024 ) ) ( not ( = ?auto_9007 ?auto_9010 ) ) ( not ( = ?auto_9007 ?auto_9024 ) ) ( not ( = ?auto_9008 ?auto_9010 ) ) ( not ( = ?auto_9008 ?auto_9024 ) ) ( not ( = ?auto_9010 ?auto_9027 ) ) ( not ( = ?auto_9010 ?auto_9031 ) ) ( not ( = ?auto_9010 ?auto_9038 ) ) ( not ( = ?auto_9010 ?auto_9040 ) ) ( not ( = ?auto_9010 ?auto_9028 ) ) ( not ( = ?auto_9024 ?auto_9027 ) ) ( not ( = ?auto_9024 ?auto_9031 ) ) ( not ( = ?auto_9024 ?auto_9038 ) ) ( not ( = ?auto_9024 ?auto_9040 ) ) ( not ( = ?auto_9024 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9011 ) ) ( not ( = ?auto_9004 ?auto_9037 ) ) ( not ( = ?auto_9005 ?auto_9011 ) ) ( not ( = ?auto_9005 ?auto_9037 ) ) ( not ( = ?auto_9006 ?auto_9011 ) ) ( not ( = ?auto_9006 ?auto_9037 ) ) ( not ( = ?auto_9007 ?auto_9011 ) ) ( not ( = ?auto_9007 ?auto_9037 ) ) ( not ( = ?auto_9008 ?auto_9011 ) ) ( not ( = ?auto_9008 ?auto_9037 ) ) ( not ( = ?auto_9009 ?auto_9011 ) ) ( not ( = ?auto_9009 ?auto_9037 ) ) ( not ( = ?auto_9011 ?auto_9024 ) ) ( not ( = ?auto_9011 ?auto_9027 ) ) ( not ( = ?auto_9011 ?auto_9031 ) ) ( not ( = ?auto_9011 ?auto_9038 ) ) ( not ( = ?auto_9011 ?auto_9040 ) ) ( not ( = ?auto_9011 ?auto_9028 ) ) ( not ( = ?auto_9037 ?auto_9024 ) ) ( not ( = ?auto_9037 ?auto_9027 ) ) ( not ( = ?auto_9037 ?auto_9031 ) ) ( not ( = ?auto_9037 ?auto_9038 ) ) ( not ( = ?auto_9037 ?auto_9040 ) ) ( not ( = ?auto_9037 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9012 ) ) ( not ( = ?auto_9004 ?auto_9035 ) ) ( not ( = ?auto_9005 ?auto_9012 ) ) ( not ( = ?auto_9005 ?auto_9035 ) ) ( not ( = ?auto_9006 ?auto_9012 ) ) ( not ( = ?auto_9006 ?auto_9035 ) ) ( not ( = ?auto_9007 ?auto_9012 ) ) ( not ( = ?auto_9007 ?auto_9035 ) ) ( not ( = ?auto_9008 ?auto_9012 ) ) ( not ( = ?auto_9008 ?auto_9035 ) ) ( not ( = ?auto_9009 ?auto_9012 ) ) ( not ( = ?auto_9009 ?auto_9035 ) ) ( not ( = ?auto_9010 ?auto_9012 ) ) ( not ( = ?auto_9010 ?auto_9035 ) ) ( not ( = ?auto_9012 ?auto_9037 ) ) ( not ( = ?auto_9012 ?auto_9024 ) ) ( not ( = ?auto_9012 ?auto_9027 ) ) ( not ( = ?auto_9012 ?auto_9031 ) ) ( not ( = ?auto_9012 ?auto_9038 ) ) ( not ( = ?auto_9012 ?auto_9040 ) ) ( not ( = ?auto_9012 ?auto_9028 ) ) ( not ( = ?auto_9025 ?auto_9022 ) ) ( not ( = ?auto_9025 ?auto_9029 ) ) ( not ( = ?auto_9025 ?auto_9030 ) ) ( not ( = ?auto_9025 ?auto_9026 ) ) ( not ( = ?auto_9033 ?auto_9041 ) ) ( not ( = ?auto_9033 ?auto_9023 ) ) ( not ( = ?auto_9033 ?auto_9034 ) ) ( not ( = ?auto_9033 ?auto_9039 ) ) ( not ( = ?auto_9035 ?auto_9037 ) ) ( not ( = ?auto_9035 ?auto_9024 ) ) ( not ( = ?auto_9035 ?auto_9027 ) ) ( not ( = ?auto_9035 ?auto_9031 ) ) ( not ( = ?auto_9035 ?auto_9038 ) ) ( not ( = ?auto_9035 ?auto_9040 ) ) ( not ( = ?auto_9035 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9013 ) ) ( not ( = ?auto_9004 ?auto_9036 ) ) ( not ( = ?auto_9005 ?auto_9013 ) ) ( not ( = ?auto_9005 ?auto_9036 ) ) ( not ( = ?auto_9006 ?auto_9013 ) ) ( not ( = ?auto_9006 ?auto_9036 ) ) ( not ( = ?auto_9007 ?auto_9013 ) ) ( not ( = ?auto_9007 ?auto_9036 ) ) ( not ( = ?auto_9008 ?auto_9013 ) ) ( not ( = ?auto_9008 ?auto_9036 ) ) ( not ( = ?auto_9009 ?auto_9013 ) ) ( not ( = ?auto_9009 ?auto_9036 ) ) ( not ( = ?auto_9010 ?auto_9013 ) ) ( not ( = ?auto_9010 ?auto_9036 ) ) ( not ( = ?auto_9011 ?auto_9013 ) ) ( not ( = ?auto_9011 ?auto_9036 ) ) ( not ( = ?auto_9013 ?auto_9035 ) ) ( not ( = ?auto_9013 ?auto_9037 ) ) ( not ( = ?auto_9013 ?auto_9024 ) ) ( not ( = ?auto_9013 ?auto_9027 ) ) ( not ( = ?auto_9013 ?auto_9031 ) ) ( not ( = ?auto_9013 ?auto_9038 ) ) ( not ( = ?auto_9013 ?auto_9040 ) ) ( not ( = ?auto_9013 ?auto_9028 ) ) ( not ( = ?auto_9036 ?auto_9035 ) ) ( not ( = ?auto_9036 ?auto_9037 ) ) ( not ( = ?auto_9036 ?auto_9024 ) ) ( not ( = ?auto_9036 ?auto_9027 ) ) ( not ( = ?auto_9036 ?auto_9031 ) ) ( not ( = ?auto_9036 ?auto_9038 ) ) ( not ( = ?auto_9036 ?auto_9040 ) ) ( not ( = ?auto_9036 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9014 ) ) ( not ( = ?auto_9004 ?auto_9032 ) ) ( not ( = ?auto_9005 ?auto_9014 ) ) ( not ( = ?auto_9005 ?auto_9032 ) ) ( not ( = ?auto_9006 ?auto_9014 ) ) ( not ( = ?auto_9006 ?auto_9032 ) ) ( not ( = ?auto_9007 ?auto_9014 ) ) ( not ( = ?auto_9007 ?auto_9032 ) ) ( not ( = ?auto_9008 ?auto_9014 ) ) ( not ( = ?auto_9008 ?auto_9032 ) ) ( not ( = ?auto_9009 ?auto_9014 ) ) ( not ( = ?auto_9009 ?auto_9032 ) ) ( not ( = ?auto_9010 ?auto_9014 ) ) ( not ( = ?auto_9010 ?auto_9032 ) ) ( not ( = ?auto_9011 ?auto_9014 ) ) ( not ( = ?auto_9011 ?auto_9032 ) ) ( not ( = ?auto_9012 ?auto_9014 ) ) ( not ( = ?auto_9012 ?auto_9032 ) ) ( not ( = ?auto_9014 ?auto_9036 ) ) ( not ( = ?auto_9014 ?auto_9035 ) ) ( not ( = ?auto_9014 ?auto_9037 ) ) ( not ( = ?auto_9014 ?auto_9024 ) ) ( not ( = ?auto_9014 ?auto_9027 ) ) ( not ( = ?auto_9014 ?auto_9031 ) ) ( not ( = ?auto_9014 ?auto_9038 ) ) ( not ( = ?auto_9014 ?auto_9040 ) ) ( not ( = ?auto_9014 ?auto_9028 ) ) ( not ( = ?auto_9032 ?auto_9036 ) ) ( not ( = ?auto_9032 ?auto_9035 ) ) ( not ( = ?auto_9032 ?auto_9037 ) ) ( not ( = ?auto_9032 ?auto_9024 ) ) ( not ( = ?auto_9032 ?auto_9027 ) ) ( not ( = ?auto_9032 ?auto_9031 ) ) ( not ( = ?auto_9032 ?auto_9038 ) ) ( not ( = ?auto_9032 ?auto_9040 ) ) ( not ( = ?auto_9032 ?auto_9028 ) ) ( not ( = ?auto_9004 ?auto_9015 ) ) ( not ( = ?auto_9004 ?auto_9019 ) ) ( not ( = ?auto_9005 ?auto_9015 ) ) ( not ( = ?auto_9005 ?auto_9019 ) ) ( not ( = ?auto_9006 ?auto_9015 ) ) ( not ( = ?auto_9006 ?auto_9019 ) ) ( not ( = ?auto_9007 ?auto_9015 ) ) ( not ( = ?auto_9007 ?auto_9019 ) ) ( not ( = ?auto_9008 ?auto_9015 ) ) ( not ( = ?auto_9008 ?auto_9019 ) ) ( not ( = ?auto_9009 ?auto_9015 ) ) ( not ( = ?auto_9009 ?auto_9019 ) ) ( not ( = ?auto_9010 ?auto_9015 ) ) ( not ( = ?auto_9010 ?auto_9019 ) ) ( not ( = ?auto_9011 ?auto_9015 ) ) ( not ( = ?auto_9011 ?auto_9019 ) ) ( not ( = ?auto_9012 ?auto_9015 ) ) ( not ( = ?auto_9012 ?auto_9019 ) ) ( not ( = ?auto_9013 ?auto_9015 ) ) ( not ( = ?auto_9013 ?auto_9019 ) ) ( not ( = ?auto_9015 ?auto_9032 ) ) ( not ( = ?auto_9015 ?auto_9036 ) ) ( not ( = ?auto_9015 ?auto_9035 ) ) ( not ( = ?auto_9015 ?auto_9037 ) ) ( not ( = ?auto_9015 ?auto_9024 ) ) ( not ( = ?auto_9015 ?auto_9027 ) ) ( not ( = ?auto_9015 ?auto_9031 ) ) ( not ( = ?auto_9015 ?auto_9038 ) ) ( not ( = ?auto_9015 ?auto_9040 ) ) ( not ( = ?auto_9015 ?auto_9028 ) ) ( not ( = ?auto_9018 ?auto_9029 ) ) ( not ( = ?auto_9018 ?auto_9026 ) ) ( not ( = ?auto_9018 ?auto_9025 ) ) ( not ( = ?auto_9018 ?auto_9022 ) ) ( not ( = ?auto_9018 ?auto_9030 ) ) ( not ( = ?auto_9021 ?auto_9023 ) ) ( not ( = ?auto_9021 ?auto_9039 ) ) ( not ( = ?auto_9021 ?auto_9033 ) ) ( not ( = ?auto_9021 ?auto_9041 ) ) ( not ( = ?auto_9021 ?auto_9034 ) ) ( not ( = ?auto_9019 ?auto_9032 ) ) ( not ( = ?auto_9019 ?auto_9036 ) ) ( not ( = ?auto_9019 ?auto_9035 ) ) ( not ( = ?auto_9019 ?auto_9037 ) ) ( not ( = ?auto_9019 ?auto_9024 ) ) ( not ( = ?auto_9019 ?auto_9027 ) ) ( not ( = ?auto_9019 ?auto_9031 ) ) ( not ( = ?auto_9019 ?auto_9038 ) ) ( not ( = ?auto_9019 ?auto_9040 ) ) ( not ( = ?auto_9019 ?auto_9028 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9004 ?auto_9005 ?auto_9006 ?auto_9007 ?auto_9008 ?auto_9009 ?auto_9010 ?auto_9011 ?auto_9012 ?auto_9013 ?auto_9014 )
      ( MAKE-1CRATE ?auto_9014 ?auto_9015 )
      ( MAKE-11CRATE-VERIFY ?auto_9004 ?auto_9005 ?auto_9006 ?auto_9007 ?auto_9008 ?auto_9009 ?auto_9010 ?auto_9011 ?auto_9012 ?auto_9013 ?auto_9014 ?auto_9015 ) )
  )

)

