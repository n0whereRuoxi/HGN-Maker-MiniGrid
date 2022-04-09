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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14652 - SURFACE
      ?auto_14653 - SURFACE
    )
    :vars
    (
      ?auto_14654 - HOIST
      ?auto_14655 - PLACE
      ?auto_14657 - PLACE
      ?auto_14658 - HOIST
      ?auto_14659 - SURFACE
      ?auto_14656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14654 ?auto_14655 ) ( SURFACE-AT ?auto_14652 ?auto_14655 ) ( CLEAR ?auto_14652 ) ( IS-CRATE ?auto_14653 ) ( AVAILABLE ?auto_14654 ) ( not ( = ?auto_14657 ?auto_14655 ) ) ( HOIST-AT ?auto_14658 ?auto_14657 ) ( AVAILABLE ?auto_14658 ) ( SURFACE-AT ?auto_14653 ?auto_14657 ) ( ON ?auto_14653 ?auto_14659 ) ( CLEAR ?auto_14653 ) ( TRUCK-AT ?auto_14656 ?auto_14655 ) ( not ( = ?auto_14652 ?auto_14653 ) ) ( not ( = ?auto_14652 ?auto_14659 ) ) ( not ( = ?auto_14653 ?auto_14659 ) ) ( not ( = ?auto_14654 ?auto_14658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14656 ?auto_14655 ?auto_14657 )
      ( !LIFT ?auto_14658 ?auto_14653 ?auto_14659 ?auto_14657 )
      ( !LOAD ?auto_14658 ?auto_14653 ?auto_14656 ?auto_14657 )
      ( !DRIVE ?auto_14656 ?auto_14657 ?auto_14655 )
      ( !UNLOAD ?auto_14654 ?auto_14653 ?auto_14656 ?auto_14655 )
      ( !DROP ?auto_14654 ?auto_14653 ?auto_14652 ?auto_14655 )
      ( MAKE-1CRATE-VERIFY ?auto_14652 ?auto_14653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14662 - SURFACE
      ?auto_14663 - SURFACE
    )
    :vars
    (
      ?auto_14664 - HOIST
      ?auto_14665 - PLACE
      ?auto_14667 - PLACE
      ?auto_14668 - HOIST
      ?auto_14669 - SURFACE
      ?auto_14666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14664 ?auto_14665 ) ( SURFACE-AT ?auto_14662 ?auto_14665 ) ( CLEAR ?auto_14662 ) ( IS-CRATE ?auto_14663 ) ( AVAILABLE ?auto_14664 ) ( not ( = ?auto_14667 ?auto_14665 ) ) ( HOIST-AT ?auto_14668 ?auto_14667 ) ( AVAILABLE ?auto_14668 ) ( SURFACE-AT ?auto_14663 ?auto_14667 ) ( ON ?auto_14663 ?auto_14669 ) ( CLEAR ?auto_14663 ) ( TRUCK-AT ?auto_14666 ?auto_14665 ) ( not ( = ?auto_14662 ?auto_14663 ) ) ( not ( = ?auto_14662 ?auto_14669 ) ) ( not ( = ?auto_14663 ?auto_14669 ) ) ( not ( = ?auto_14664 ?auto_14668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14666 ?auto_14665 ?auto_14667 )
      ( !LIFT ?auto_14668 ?auto_14663 ?auto_14669 ?auto_14667 )
      ( !LOAD ?auto_14668 ?auto_14663 ?auto_14666 ?auto_14667 )
      ( !DRIVE ?auto_14666 ?auto_14667 ?auto_14665 )
      ( !UNLOAD ?auto_14664 ?auto_14663 ?auto_14666 ?auto_14665 )
      ( !DROP ?auto_14664 ?auto_14663 ?auto_14662 ?auto_14665 )
      ( MAKE-1CRATE-VERIFY ?auto_14662 ?auto_14663 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14673 - SURFACE
      ?auto_14674 - SURFACE
      ?auto_14675 - SURFACE
    )
    :vars
    (
      ?auto_14679 - HOIST
      ?auto_14680 - PLACE
      ?auto_14681 - PLACE
      ?auto_14678 - HOIST
      ?auto_14676 - SURFACE
      ?auto_14682 - SURFACE
      ?auto_14677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14679 ?auto_14680 ) ( IS-CRATE ?auto_14675 ) ( not ( = ?auto_14681 ?auto_14680 ) ) ( HOIST-AT ?auto_14678 ?auto_14681 ) ( SURFACE-AT ?auto_14675 ?auto_14681 ) ( ON ?auto_14675 ?auto_14676 ) ( CLEAR ?auto_14675 ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14674 ?auto_14676 ) ) ( not ( = ?auto_14675 ?auto_14676 ) ) ( not ( = ?auto_14679 ?auto_14678 ) ) ( SURFACE-AT ?auto_14673 ?auto_14680 ) ( CLEAR ?auto_14673 ) ( IS-CRATE ?auto_14674 ) ( AVAILABLE ?auto_14679 ) ( AVAILABLE ?auto_14678 ) ( SURFACE-AT ?auto_14674 ?auto_14681 ) ( ON ?auto_14674 ?auto_14682 ) ( CLEAR ?auto_14674 ) ( TRUCK-AT ?auto_14677 ?auto_14680 ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14682 ) ) ( not ( = ?auto_14674 ?auto_14682 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( not ( = ?auto_14675 ?auto_14682 ) ) ( not ( = ?auto_14676 ?auto_14682 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14673 ?auto_14674 )
      ( MAKE-1CRATE ?auto_14674 ?auto_14675 )
      ( MAKE-2CRATE-VERIFY ?auto_14673 ?auto_14674 ?auto_14675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14685 - SURFACE
      ?auto_14686 - SURFACE
    )
    :vars
    (
      ?auto_14687 - HOIST
      ?auto_14688 - PLACE
      ?auto_14690 - PLACE
      ?auto_14691 - HOIST
      ?auto_14692 - SURFACE
      ?auto_14689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14687 ?auto_14688 ) ( SURFACE-AT ?auto_14685 ?auto_14688 ) ( CLEAR ?auto_14685 ) ( IS-CRATE ?auto_14686 ) ( AVAILABLE ?auto_14687 ) ( not ( = ?auto_14690 ?auto_14688 ) ) ( HOIST-AT ?auto_14691 ?auto_14690 ) ( AVAILABLE ?auto_14691 ) ( SURFACE-AT ?auto_14686 ?auto_14690 ) ( ON ?auto_14686 ?auto_14692 ) ( CLEAR ?auto_14686 ) ( TRUCK-AT ?auto_14689 ?auto_14688 ) ( not ( = ?auto_14685 ?auto_14686 ) ) ( not ( = ?auto_14685 ?auto_14692 ) ) ( not ( = ?auto_14686 ?auto_14692 ) ) ( not ( = ?auto_14687 ?auto_14691 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14689 ?auto_14688 ?auto_14690 )
      ( !LIFT ?auto_14691 ?auto_14686 ?auto_14692 ?auto_14690 )
      ( !LOAD ?auto_14691 ?auto_14686 ?auto_14689 ?auto_14690 )
      ( !DRIVE ?auto_14689 ?auto_14690 ?auto_14688 )
      ( !UNLOAD ?auto_14687 ?auto_14686 ?auto_14689 ?auto_14688 )
      ( !DROP ?auto_14687 ?auto_14686 ?auto_14685 ?auto_14688 )
      ( MAKE-1CRATE-VERIFY ?auto_14685 ?auto_14686 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14697 - SURFACE
      ?auto_14698 - SURFACE
      ?auto_14699 - SURFACE
      ?auto_14700 - SURFACE
    )
    :vars
    (
      ?auto_14706 - HOIST
      ?auto_14704 - PLACE
      ?auto_14701 - PLACE
      ?auto_14703 - HOIST
      ?auto_14702 - SURFACE
      ?auto_14709 - PLACE
      ?auto_14707 - HOIST
      ?auto_14710 - SURFACE
      ?auto_14708 - SURFACE
      ?auto_14705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14706 ?auto_14704 ) ( IS-CRATE ?auto_14700 ) ( not ( = ?auto_14701 ?auto_14704 ) ) ( HOIST-AT ?auto_14703 ?auto_14701 ) ( AVAILABLE ?auto_14703 ) ( SURFACE-AT ?auto_14700 ?auto_14701 ) ( ON ?auto_14700 ?auto_14702 ) ( CLEAR ?auto_14700 ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( not ( = ?auto_14699 ?auto_14702 ) ) ( not ( = ?auto_14700 ?auto_14702 ) ) ( not ( = ?auto_14706 ?auto_14703 ) ) ( IS-CRATE ?auto_14699 ) ( not ( = ?auto_14709 ?auto_14704 ) ) ( HOIST-AT ?auto_14707 ?auto_14709 ) ( SURFACE-AT ?auto_14699 ?auto_14709 ) ( ON ?auto_14699 ?auto_14710 ) ( CLEAR ?auto_14699 ) ( not ( = ?auto_14698 ?auto_14699 ) ) ( not ( = ?auto_14698 ?auto_14710 ) ) ( not ( = ?auto_14699 ?auto_14710 ) ) ( not ( = ?auto_14706 ?auto_14707 ) ) ( SURFACE-AT ?auto_14697 ?auto_14704 ) ( CLEAR ?auto_14697 ) ( IS-CRATE ?auto_14698 ) ( AVAILABLE ?auto_14706 ) ( AVAILABLE ?auto_14707 ) ( SURFACE-AT ?auto_14698 ?auto_14709 ) ( ON ?auto_14698 ?auto_14708 ) ( CLEAR ?auto_14698 ) ( TRUCK-AT ?auto_14705 ?auto_14704 ) ( not ( = ?auto_14697 ?auto_14698 ) ) ( not ( = ?auto_14697 ?auto_14708 ) ) ( not ( = ?auto_14698 ?auto_14708 ) ) ( not ( = ?auto_14697 ?auto_14699 ) ) ( not ( = ?auto_14697 ?auto_14710 ) ) ( not ( = ?auto_14699 ?auto_14708 ) ) ( not ( = ?auto_14710 ?auto_14708 ) ) ( not ( = ?auto_14697 ?auto_14700 ) ) ( not ( = ?auto_14697 ?auto_14702 ) ) ( not ( = ?auto_14698 ?auto_14700 ) ) ( not ( = ?auto_14698 ?auto_14702 ) ) ( not ( = ?auto_14700 ?auto_14710 ) ) ( not ( = ?auto_14700 ?auto_14708 ) ) ( not ( = ?auto_14701 ?auto_14709 ) ) ( not ( = ?auto_14703 ?auto_14707 ) ) ( not ( = ?auto_14702 ?auto_14710 ) ) ( not ( = ?auto_14702 ?auto_14708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14697 ?auto_14698 ?auto_14699 )
      ( MAKE-1CRATE ?auto_14699 ?auto_14700 )
      ( MAKE-3CRATE-VERIFY ?auto_14697 ?auto_14698 ?auto_14699 ?auto_14700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14713 - SURFACE
      ?auto_14714 - SURFACE
    )
    :vars
    (
      ?auto_14715 - HOIST
      ?auto_14716 - PLACE
      ?auto_14718 - PLACE
      ?auto_14719 - HOIST
      ?auto_14720 - SURFACE
      ?auto_14717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14715 ?auto_14716 ) ( SURFACE-AT ?auto_14713 ?auto_14716 ) ( CLEAR ?auto_14713 ) ( IS-CRATE ?auto_14714 ) ( AVAILABLE ?auto_14715 ) ( not ( = ?auto_14718 ?auto_14716 ) ) ( HOIST-AT ?auto_14719 ?auto_14718 ) ( AVAILABLE ?auto_14719 ) ( SURFACE-AT ?auto_14714 ?auto_14718 ) ( ON ?auto_14714 ?auto_14720 ) ( CLEAR ?auto_14714 ) ( TRUCK-AT ?auto_14717 ?auto_14716 ) ( not ( = ?auto_14713 ?auto_14714 ) ) ( not ( = ?auto_14713 ?auto_14720 ) ) ( not ( = ?auto_14714 ?auto_14720 ) ) ( not ( = ?auto_14715 ?auto_14719 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14717 ?auto_14716 ?auto_14718 )
      ( !LIFT ?auto_14719 ?auto_14714 ?auto_14720 ?auto_14718 )
      ( !LOAD ?auto_14719 ?auto_14714 ?auto_14717 ?auto_14718 )
      ( !DRIVE ?auto_14717 ?auto_14718 ?auto_14716 )
      ( !UNLOAD ?auto_14715 ?auto_14714 ?auto_14717 ?auto_14716 )
      ( !DROP ?auto_14715 ?auto_14714 ?auto_14713 ?auto_14716 )
      ( MAKE-1CRATE-VERIFY ?auto_14713 ?auto_14714 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14726 - SURFACE
      ?auto_14727 - SURFACE
      ?auto_14728 - SURFACE
      ?auto_14729 - SURFACE
      ?auto_14730 - SURFACE
    )
    :vars
    (
      ?auto_14731 - HOIST
      ?auto_14732 - PLACE
      ?auto_14736 - PLACE
      ?auto_14735 - HOIST
      ?auto_14733 - SURFACE
      ?auto_14740 - PLACE
      ?auto_14738 - HOIST
      ?auto_14737 - SURFACE
      ?auto_14741 - SURFACE
      ?auto_14739 - SURFACE
      ?auto_14734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14731 ?auto_14732 ) ( IS-CRATE ?auto_14730 ) ( not ( = ?auto_14736 ?auto_14732 ) ) ( HOIST-AT ?auto_14735 ?auto_14736 ) ( SURFACE-AT ?auto_14730 ?auto_14736 ) ( ON ?auto_14730 ?auto_14733 ) ( CLEAR ?auto_14730 ) ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) ( not ( = ?auto_14730 ?auto_14733 ) ) ( not ( = ?auto_14731 ?auto_14735 ) ) ( IS-CRATE ?auto_14729 ) ( not ( = ?auto_14740 ?auto_14732 ) ) ( HOIST-AT ?auto_14738 ?auto_14740 ) ( AVAILABLE ?auto_14738 ) ( SURFACE-AT ?auto_14729 ?auto_14740 ) ( ON ?auto_14729 ?auto_14737 ) ( CLEAR ?auto_14729 ) ( not ( = ?auto_14728 ?auto_14729 ) ) ( not ( = ?auto_14728 ?auto_14737 ) ) ( not ( = ?auto_14729 ?auto_14737 ) ) ( not ( = ?auto_14731 ?auto_14738 ) ) ( IS-CRATE ?auto_14728 ) ( SURFACE-AT ?auto_14728 ?auto_14736 ) ( ON ?auto_14728 ?auto_14741 ) ( CLEAR ?auto_14728 ) ( not ( = ?auto_14727 ?auto_14728 ) ) ( not ( = ?auto_14727 ?auto_14741 ) ) ( not ( = ?auto_14728 ?auto_14741 ) ) ( SURFACE-AT ?auto_14726 ?auto_14732 ) ( CLEAR ?auto_14726 ) ( IS-CRATE ?auto_14727 ) ( AVAILABLE ?auto_14731 ) ( AVAILABLE ?auto_14735 ) ( SURFACE-AT ?auto_14727 ?auto_14736 ) ( ON ?auto_14727 ?auto_14739 ) ( CLEAR ?auto_14727 ) ( TRUCK-AT ?auto_14734 ?auto_14732 ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14739 ) ) ( not ( = ?auto_14727 ?auto_14739 ) ) ( not ( = ?auto_14726 ?auto_14728 ) ) ( not ( = ?auto_14726 ?auto_14741 ) ) ( not ( = ?auto_14728 ?auto_14739 ) ) ( not ( = ?auto_14741 ?auto_14739 ) ) ( not ( = ?auto_14726 ?auto_14729 ) ) ( not ( = ?auto_14726 ?auto_14737 ) ) ( not ( = ?auto_14727 ?auto_14729 ) ) ( not ( = ?auto_14727 ?auto_14737 ) ) ( not ( = ?auto_14729 ?auto_14741 ) ) ( not ( = ?auto_14729 ?auto_14739 ) ) ( not ( = ?auto_14740 ?auto_14736 ) ) ( not ( = ?auto_14738 ?auto_14735 ) ) ( not ( = ?auto_14737 ?auto_14741 ) ) ( not ( = ?auto_14737 ?auto_14739 ) ) ( not ( = ?auto_14726 ?auto_14730 ) ) ( not ( = ?auto_14726 ?auto_14733 ) ) ( not ( = ?auto_14727 ?auto_14730 ) ) ( not ( = ?auto_14727 ?auto_14733 ) ) ( not ( = ?auto_14728 ?auto_14730 ) ) ( not ( = ?auto_14728 ?auto_14733 ) ) ( not ( = ?auto_14730 ?auto_14737 ) ) ( not ( = ?auto_14730 ?auto_14741 ) ) ( not ( = ?auto_14730 ?auto_14739 ) ) ( not ( = ?auto_14733 ?auto_14737 ) ) ( not ( = ?auto_14733 ?auto_14741 ) ) ( not ( = ?auto_14733 ?auto_14739 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14726 ?auto_14727 ?auto_14728 ?auto_14729 )
      ( MAKE-1CRATE ?auto_14729 ?auto_14730 )
      ( MAKE-4CRATE-VERIFY ?auto_14726 ?auto_14727 ?auto_14728 ?auto_14729 ?auto_14730 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14744 - SURFACE
      ?auto_14745 - SURFACE
    )
    :vars
    (
      ?auto_14746 - HOIST
      ?auto_14747 - PLACE
      ?auto_14749 - PLACE
      ?auto_14750 - HOIST
      ?auto_14751 - SURFACE
      ?auto_14748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14746 ?auto_14747 ) ( SURFACE-AT ?auto_14744 ?auto_14747 ) ( CLEAR ?auto_14744 ) ( IS-CRATE ?auto_14745 ) ( AVAILABLE ?auto_14746 ) ( not ( = ?auto_14749 ?auto_14747 ) ) ( HOIST-AT ?auto_14750 ?auto_14749 ) ( AVAILABLE ?auto_14750 ) ( SURFACE-AT ?auto_14745 ?auto_14749 ) ( ON ?auto_14745 ?auto_14751 ) ( CLEAR ?auto_14745 ) ( TRUCK-AT ?auto_14748 ?auto_14747 ) ( not ( = ?auto_14744 ?auto_14745 ) ) ( not ( = ?auto_14744 ?auto_14751 ) ) ( not ( = ?auto_14745 ?auto_14751 ) ) ( not ( = ?auto_14746 ?auto_14750 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14748 ?auto_14747 ?auto_14749 )
      ( !LIFT ?auto_14750 ?auto_14745 ?auto_14751 ?auto_14749 )
      ( !LOAD ?auto_14750 ?auto_14745 ?auto_14748 ?auto_14749 )
      ( !DRIVE ?auto_14748 ?auto_14749 ?auto_14747 )
      ( !UNLOAD ?auto_14746 ?auto_14745 ?auto_14748 ?auto_14747 )
      ( !DROP ?auto_14746 ?auto_14745 ?auto_14744 ?auto_14747 )
      ( MAKE-1CRATE-VERIFY ?auto_14744 ?auto_14745 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14758 - SURFACE
      ?auto_14759 - SURFACE
      ?auto_14760 - SURFACE
      ?auto_14761 - SURFACE
      ?auto_14762 - SURFACE
      ?auto_14763 - SURFACE
    )
    :vars
    (
      ?auto_14765 - HOIST
      ?auto_14769 - PLACE
      ?auto_14766 - PLACE
      ?auto_14768 - HOIST
      ?auto_14767 - SURFACE
      ?auto_14774 - PLACE
      ?auto_14771 - HOIST
      ?auto_14772 - SURFACE
      ?auto_14776 - PLACE
      ?auto_14777 - HOIST
      ?auto_14770 - SURFACE
      ?auto_14773 - SURFACE
      ?auto_14775 - SURFACE
      ?auto_14764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14765 ?auto_14769 ) ( IS-CRATE ?auto_14763 ) ( not ( = ?auto_14766 ?auto_14769 ) ) ( HOIST-AT ?auto_14768 ?auto_14766 ) ( AVAILABLE ?auto_14768 ) ( SURFACE-AT ?auto_14763 ?auto_14766 ) ( ON ?auto_14763 ?auto_14767 ) ( CLEAR ?auto_14763 ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14762 ?auto_14767 ) ) ( not ( = ?auto_14763 ?auto_14767 ) ) ( not ( = ?auto_14765 ?auto_14768 ) ) ( IS-CRATE ?auto_14762 ) ( not ( = ?auto_14774 ?auto_14769 ) ) ( HOIST-AT ?auto_14771 ?auto_14774 ) ( SURFACE-AT ?auto_14762 ?auto_14774 ) ( ON ?auto_14762 ?auto_14772 ) ( CLEAR ?auto_14762 ) ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14772 ) ) ( not ( = ?auto_14762 ?auto_14772 ) ) ( not ( = ?auto_14765 ?auto_14771 ) ) ( IS-CRATE ?auto_14761 ) ( not ( = ?auto_14776 ?auto_14769 ) ) ( HOIST-AT ?auto_14777 ?auto_14776 ) ( AVAILABLE ?auto_14777 ) ( SURFACE-AT ?auto_14761 ?auto_14776 ) ( ON ?auto_14761 ?auto_14770 ) ( CLEAR ?auto_14761 ) ( not ( = ?auto_14760 ?auto_14761 ) ) ( not ( = ?auto_14760 ?auto_14770 ) ) ( not ( = ?auto_14761 ?auto_14770 ) ) ( not ( = ?auto_14765 ?auto_14777 ) ) ( IS-CRATE ?auto_14760 ) ( SURFACE-AT ?auto_14760 ?auto_14774 ) ( ON ?auto_14760 ?auto_14773 ) ( CLEAR ?auto_14760 ) ( not ( = ?auto_14759 ?auto_14760 ) ) ( not ( = ?auto_14759 ?auto_14773 ) ) ( not ( = ?auto_14760 ?auto_14773 ) ) ( SURFACE-AT ?auto_14758 ?auto_14769 ) ( CLEAR ?auto_14758 ) ( IS-CRATE ?auto_14759 ) ( AVAILABLE ?auto_14765 ) ( AVAILABLE ?auto_14771 ) ( SURFACE-AT ?auto_14759 ?auto_14774 ) ( ON ?auto_14759 ?auto_14775 ) ( CLEAR ?auto_14759 ) ( TRUCK-AT ?auto_14764 ?auto_14769 ) ( not ( = ?auto_14758 ?auto_14759 ) ) ( not ( = ?auto_14758 ?auto_14775 ) ) ( not ( = ?auto_14759 ?auto_14775 ) ) ( not ( = ?auto_14758 ?auto_14760 ) ) ( not ( = ?auto_14758 ?auto_14773 ) ) ( not ( = ?auto_14760 ?auto_14775 ) ) ( not ( = ?auto_14773 ?auto_14775 ) ) ( not ( = ?auto_14758 ?auto_14761 ) ) ( not ( = ?auto_14758 ?auto_14770 ) ) ( not ( = ?auto_14759 ?auto_14761 ) ) ( not ( = ?auto_14759 ?auto_14770 ) ) ( not ( = ?auto_14761 ?auto_14773 ) ) ( not ( = ?auto_14761 ?auto_14775 ) ) ( not ( = ?auto_14776 ?auto_14774 ) ) ( not ( = ?auto_14777 ?auto_14771 ) ) ( not ( = ?auto_14770 ?auto_14773 ) ) ( not ( = ?auto_14770 ?auto_14775 ) ) ( not ( = ?auto_14758 ?auto_14762 ) ) ( not ( = ?auto_14758 ?auto_14772 ) ) ( not ( = ?auto_14759 ?auto_14762 ) ) ( not ( = ?auto_14759 ?auto_14772 ) ) ( not ( = ?auto_14760 ?auto_14762 ) ) ( not ( = ?auto_14760 ?auto_14772 ) ) ( not ( = ?auto_14762 ?auto_14770 ) ) ( not ( = ?auto_14762 ?auto_14773 ) ) ( not ( = ?auto_14762 ?auto_14775 ) ) ( not ( = ?auto_14772 ?auto_14770 ) ) ( not ( = ?auto_14772 ?auto_14773 ) ) ( not ( = ?auto_14772 ?auto_14775 ) ) ( not ( = ?auto_14758 ?auto_14763 ) ) ( not ( = ?auto_14758 ?auto_14767 ) ) ( not ( = ?auto_14759 ?auto_14763 ) ) ( not ( = ?auto_14759 ?auto_14767 ) ) ( not ( = ?auto_14760 ?auto_14763 ) ) ( not ( = ?auto_14760 ?auto_14767 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14767 ) ) ( not ( = ?auto_14763 ?auto_14772 ) ) ( not ( = ?auto_14763 ?auto_14770 ) ) ( not ( = ?auto_14763 ?auto_14773 ) ) ( not ( = ?auto_14763 ?auto_14775 ) ) ( not ( = ?auto_14766 ?auto_14774 ) ) ( not ( = ?auto_14766 ?auto_14776 ) ) ( not ( = ?auto_14768 ?auto_14771 ) ) ( not ( = ?auto_14768 ?auto_14777 ) ) ( not ( = ?auto_14767 ?auto_14772 ) ) ( not ( = ?auto_14767 ?auto_14770 ) ) ( not ( = ?auto_14767 ?auto_14773 ) ) ( not ( = ?auto_14767 ?auto_14775 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14758 ?auto_14759 ?auto_14760 ?auto_14761 ?auto_14762 )
      ( MAKE-1CRATE ?auto_14762 ?auto_14763 )
      ( MAKE-5CRATE-VERIFY ?auto_14758 ?auto_14759 ?auto_14760 ?auto_14761 ?auto_14762 ?auto_14763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14780 - SURFACE
      ?auto_14781 - SURFACE
    )
    :vars
    (
      ?auto_14782 - HOIST
      ?auto_14783 - PLACE
      ?auto_14785 - PLACE
      ?auto_14786 - HOIST
      ?auto_14787 - SURFACE
      ?auto_14784 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14782 ?auto_14783 ) ( SURFACE-AT ?auto_14780 ?auto_14783 ) ( CLEAR ?auto_14780 ) ( IS-CRATE ?auto_14781 ) ( AVAILABLE ?auto_14782 ) ( not ( = ?auto_14785 ?auto_14783 ) ) ( HOIST-AT ?auto_14786 ?auto_14785 ) ( AVAILABLE ?auto_14786 ) ( SURFACE-AT ?auto_14781 ?auto_14785 ) ( ON ?auto_14781 ?auto_14787 ) ( CLEAR ?auto_14781 ) ( TRUCK-AT ?auto_14784 ?auto_14783 ) ( not ( = ?auto_14780 ?auto_14781 ) ) ( not ( = ?auto_14780 ?auto_14787 ) ) ( not ( = ?auto_14781 ?auto_14787 ) ) ( not ( = ?auto_14782 ?auto_14786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14784 ?auto_14783 ?auto_14785 )
      ( !LIFT ?auto_14786 ?auto_14781 ?auto_14787 ?auto_14785 )
      ( !LOAD ?auto_14786 ?auto_14781 ?auto_14784 ?auto_14785 )
      ( !DRIVE ?auto_14784 ?auto_14785 ?auto_14783 )
      ( !UNLOAD ?auto_14782 ?auto_14781 ?auto_14784 ?auto_14783 )
      ( !DROP ?auto_14782 ?auto_14781 ?auto_14780 ?auto_14783 )
      ( MAKE-1CRATE-VERIFY ?auto_14780 ?auto_14781 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14795 - SURFACE
      ?auto_14796 - SURFACE
      ?auto_14797 - SURFACE
      ?auto_14798 - SURFACE
      ?auto_14799 - SURFACE
      ?auto_14800 - SURFACE
      ?auto_14801 - SURFACE
    )
    :vars
    (
      ?auto_14806 - HOIST
      ?auto_14804 - PLACE
      ?auto_14805 - PLACE
      ?auto_14803 - HOIST
      ?auto_14802 - SURFACE
      ?auto_14809 - SURFACE
      ?auto_14814 - PLACE
      ?auto_14816 - HOIST
      ?auto_14811 - SURFACE
      ?auto_14815 - PLACE
      ?auto_14810 - HOIST
      ?auto_14813 - SURFACE
      ?auto_14808 - SURFACE
      ?auto_14812 - SURFACE
      ?auto_14807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14806 ?auto_14804 ) ( IS-CRATE ?auto_14801 ) ( not ( = ?auto_14805 ?auto_14804 ) ) ( HOIST-AT ?auto_14803 ?auto_14805 ) ( SURFACE-AT ?auto_14801 ?auto_14805 ) ( ON ?auto_14801 ?auto_14802 ) ( CLEAR ?auto_14801 ) ( not ( = ?auto_14800 ?auto_14801 ) ) ( not ( = ?auto_14800 ?auto_14802 ) ) ( not ( = ?auto_14801 ?auto_14802 ) ) ( not ( = ?auto_14806 ?auto_14803 ) ) ( IS-CRATE ?auto_14800 ) ( AVAILABLE ?auto_14803 ) ( SURFACE-AT ?auto_14800 ?auto_14805 ) ( ON ?auto_14800 ?auto_14809 ) ( CLEAR ?auto_14800 ) ( not ( = ?auto_14799 ?auto_14800 ) ) ( not ( = ?auto_14799 ?auto_14809 ) ) ( not ( = ?auto_14800 ?auto_14809 ) ) ( IS-CRATE ?auto_14799 ) ( not ( = ?auto_14814 ?auto_14804 ) ) ( HOIST-AT ?auto_14816 ?auto_14814 ) ( SURFACE-AT ?auto_14799 ?auto_14814 ) ( ON ?auto_14799 ?auto_14811 ) ( CLEAR ?auto_14799 ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14811 ) ) ( not ( = ?auto_14799 ?auto_14811 ) ) ( not ( = ?auto_14806 ?auto_14816 ) ) ( IS-CRATE ?auto_14798 ) ( not ( = ?auto_14815 ?auto_14804 ) ) ( HOIST-AT ?auto_14810 ?auto_14815 ) ( AVAILABLE ?auto_14810 ) ( SURFACE-AT ?auto_14798 ?auto_14815 ) ( ON ?auto_14798 ?auto_14813 ) ( CLEAR ?auto_14798 ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14813 ) ) ( not ( = ?auto_14798 ?auto_14813 ) ) ( not ( = ?auto_14806 ?auto_14810 ) ) ( IS-CRATE ?auto_14797 ) ( SURFACE-AT ?auto_14797 ?auto_14814 ) ( ON ?auto_14797 ?auto_14808 ) ( CLEAR ?auto_14797 ) ( not ( = ?auto_14796 ?auto_14797 ) ) ( not ( = ?auto_14796 ?auto_14808 ) ) ( not ( = ?auto_14797 ?auto_14808 ) ) ( SURFACE-AT ?auto_14795 ?auto_14804 ) ( CLEAR ?auto_14795 ) ( IS-CRATE ?auto_14796 ) ( AVAILABLE ?auto_14806 ) ( AVAILABLE ?auto_14816 ) ( SURFACE-AT ?auto_14796 ?auto_14814 ) ( ON ?auto_14796 ?auto_14812 ) ( CLEAR ?auto_14796 ) ( TRUCK-AT ?auto_14807 ?auto_14804 ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14812 ) ) ( not ( = ?auto_14796 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14797 ) ) ( not ( = ?auto_14795 ?auto_14808 ) ) ( not ( = ?auto_14797 ?auto_14812 ) ) ( not ( = ?auto_14808 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14798 ) ) ( not ( = ?auto_14795 ?auto_14813 ) ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14813 ) ) ( not ( = ?auto_14798 ?auto_14808 ) ) ( not ( = ?auto_14798 ?auto_14812 ) ) ( not ( = ?auto_14815 ?auto_14814 ) ) ( not ( = ?auto_14810 ?auto_14816 ) ) ( not ( = ?auto_14813 ?auto_14808 ) ) ( not ( = ?auto_14813 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14799 ) ) ( not ( = ?auto_14795 ?auto_14811 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14796 ?auto_14811 ) ) ( not ( = ?auto_14797 ?auto_14799 ) ) ( not ( = ?auto_14797 ?auto_14811 ) ) ( not ( = ?auto_14799 ?auto_14813 ) ) ( not ( = ?auto_14799 ?auto_14808 ) ) ( not ( = ?auto_14799 ?auto_14812 ) ) ( not ( = ?auto_14811 ?auto_14813 ) ) ( not ( = ?auto_14811 ?auto_14808 ) ) ( not ( = ?auto_14811 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14800 ) ) ( not ( = ?auto_14795 ?auto_14809 ) ) ( not ( = ?auto_14796 ?auto_14800 ) ) ( not ( = ?auto_14796 ?auto_14809 ) ) ( not ( = ?auto_14797 ?auto_14800 ) ) ( not ( = ?auto_14797 ?auto_14809 ) ) ( not ( = ?auto_14798 ?auto_14800 ) ) ( not ( = ?auto_14798 ?auto_14809 ) ) ( not ( = ?auto_14800 ?auto_14811 ) ) ( not ( = ?auto_14800 ?auto_14813 ) ) ( not ( = ?auto_14800 ?auto_14808 ) ) ( not ( = ?auto_14800 ?auto_14812 ) ) ( not ( = ?auto_14805 ?auto_14814 ) ) ( not ( = ?auto_14805 ?auto_14815 ) ) ( not ( = ?auto_14803 ?auto_14816 ) ) ( not ( = ?auto_14803 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14811 ) ) ( not ( = ?auto_14809 ?auto_14813 ) ) ( not ( = ?auto_14809 ?auto_14808 ) ) ( not ( = ?auto_14809 ?auto_14812 ) ) ( not ( = ?auto_14795 ?auto_14801 ) ) ( not ( = ?auto_14795 ?auto_14802 ) ) ( not ( = ?auto_14796 ?auto_14801 ) ) ( not ( = ?auto_14796 ?auto_14802 ) ) ( not ( = ?auto_14797 ?auto_14801 ) ) ( not ( = ?auto_14797 ?auto_14802 ) ) ( not ( = ?auto_14798 ?auto_14801 ) ) ( not ( = ?auto_14798 ?auto_14802 ) ) ( not ( = ?auto_14799 ?auto_14801 ) ) ( not ( = ?auto_14799 ?auto_14802 ) ) ( not ( = ?auto_14801 ?auto_14809 ) ) ( not ( = ?auto_14801 ?auto_14811 ) ) ( not ( = ?auto_14801 ?auto_14813 ) ) ( not ( = ?auto_14801 ?auto_14808 ) ) ( not ( = ?auto_14801 ?auto_14812 ) ) ( not ( = ?auto_14802 ?auto_14809 ) ) ( not ( = ?auto_14802 ?auto_14811 ) ) ( not ( = ?auto_14802 ?auto_14813 ) ) ( not ( = ?auto_14802 ?auto_14808 ) ) ( not ( = ?auto_14802 ?auto_14812 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14795 ?auto_14796 ?auto_14797 ?auto_14798 ?auto_14799 ?auto_14800 )
      ( MAKE-1CRATE ?auto_14800 ?auto_14801 )
      ( MAKE-6CRATE-VERIFY ?auto_14795 ?auto_14796 ?auto_14797 ?auto_14798 ?auto_14799 ?auto_14800 ?auto_14801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14819 - SURFACE
      ?auto_14820 - SURFACE
    )
    :vars
    (
      ?auto_14821 - HOIST
      ?auto_14822 - PLACE
      ?auto_14824 - PLACE
      ?auto_14825 - HOIST
      ?auto_14826 - SURFACE
      ?auto_14823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14821 ?auto_14822 ) ( SURFACE-AT ?auto_14819 ?auto_14822 ) ( CLEAR ?auto_14819 ) ( IS-CRATE ?auto_14820 ) ( AVAILABLE ?auto_14821 ) ( not ( = ?auto_14824 ?auto_14822 ) ) ( HOIST-AT ?auto_14825 ?auto_14824 ) ( AVAILABLE ?auto_14825 ) ( SURFACE-AT ?auto_14820 ?auto_14824 ) ( ON ?auto_14820 ?auto_14826 ) ( CLEAR ?auto_14820 ) ( TRUCK-AT ?auto_14823 ?auto_14822 ) ( not ( = ?auto_14819 ?auto_14820 ) ) ( not ( = ?auto_14819 ?auto_14826 ) ) ( not ( = ?auto_14820 ?auto_14826 ) ) ( not ( = ?auto_14821 ?auto_14825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14823 ?auto_14822 ?auto_14824 )
      ( !LIFT ?auto_14825 ?auto_14820 ?auto_14826 ?auto_14824 )
      ( !LOAD ?auto_14825 ?auto_14820 ?auto_14823 ?auto_14824 )
      ( !DRIVE ?auto_14823 ?auto_14824 ?auto_14822 )
      ( !UNLOAD ?auto_14821 ?auto_14820 ?auto_14823 ?auto_14822 )
      ( !DROP ?auto_14821 ?auto_14820 ?auto_14819 ?auto_14822 )
      ( MAKE-1CRATE-VERIFY ?auto_14819 ?auto_14820 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14835 - SURFACE
      ?auto_14836 - SURFACE
      ?auto_14837 - SURFACE
      ?auto_14838 - SURFACE
      ?auto_14839 - SURFACE
      ?auto_14840 - SURFACE
      ?auto_14842 - SURFACE
      ?auto_14841 - SURFACE
    )
    :vars
    (
      ?auto_14848 - HOIST
      ?auto_14843 - PLACE
      ?auto_14847 - PLACE
      ?auto_14846 - HOIST
      ?auto_14844 - SURFACE
      ?auto_14849 - PLACE
      ?auto_14852 - HOIST
      ?auto_14860 - SURFACE
      ?auto_14850 - SURFACE
      ?auto_14855 - PLACE
      ?auto_14856 - HOIST
      ?auto_14859 - SURFACE
      ?auto_14854 - PLACE
      ?auto_14851 - HOIST
      ?auto_14858 - SURFACE
      ?auto_14853 - SURFACE
      ?auto_14857 - SURFACE
      ?auto_14845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14848 ?auto_14843 ) ( IS-CRATE ?auto_14841 ) ( not ( = ?auto_14847 ?auto_14843 ) ) ( HOIST-AT ?auto_14846 ?auto_14847 ) ( AVAILABLE ?auto_14846 ) ( SURFACE-AT ?auto_14841 ?auto_14847 ) ( ON ?auto_14841 ?auto_14844 ) ( CLEAR ?auto_14841 ) ( not ( = ?auto_14842 ?auto_14841 ) ) ( not ( = ?auto_14842 ?auto_14844 ) ) ( not ( = ?auto_14841 ?auto_14844 ) ) ( not ( = ?auto_14848 ?auto_14846 ) ) ( IS-CRATE ?auto_14842 ) ( not ( = ?auto_14849 ?auto_14843 ) ) ( HOIST-AT ?auto_14852 ?auto_14849 ) ( SURFACE-AT ?auto_14842 ?auto_14849 ) ( ON ?auto_14842 ?auto_14860 ) ( CLEAR ?auto_14842 ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14860 ) ) ( not ( = ?auto_14842 ?auto_14860 ) ) ( not ( = ?auto_14848 ?auto_14852 ) ) ( IS-CRATE ?auto_14840 ) ( AVAILABLE ?auto_14852 ) ( SURFACE-AT ?auto_14840 ?auto_14849 ) ( ON ?auto_14840 ?auto_14850 ) ( CLEAR ?auto_14840 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14850 ) ) ( not ( = ?auto_14840 ?auto_14850 ) ) ( IS-CRATE ?auto_14839 ) ( not ( = ?auto_14855 ?auto_14843 ) ) ( HOIST-AT ?auto_14856 ?auto_14855 ) ( SURFACE-AT ?auto_14839 ?auto_14855 ) ( ON ?auto_14839 ?auto_14859 ) ( CLEAR ?auto_14839 ) ( not ( = ?auto_14838 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14859 ) ) ( not ( = ?auto_14839 ?auto_14859 ) ) ( not ( = ?auto_14848 ?auto_14856 ) ) ( IS-CRATE ?auto_14838 ) ( not ( = ?auto_14854 ?auto_14843 ) ) ( HOIST-AT ?auto_14851 ?auto_14854 ) ( AVAILABLE ?auto_14851 ) ( SURFACE-AT ?auto_14838 ?auto_14854 ) ( ON ?auto_14838 ?auto_14858 ) ( CLEAR ?auto_14838 ) ( not ( = ?auto_14837 ?auto_14838 ) ) ( not ( = ?auto_14837 ?auto_14858 ) ) ( not ( = ?auto_14838 ?auto_14858 ) ) ( not ( = ?auto_14848 ?auto_14851 ) ) ( IS-CRATE ?auto_14837 ) ( SURFACE-AT ?auto_14837 ?auto_14855 ) ( ON ?auto_14837 ?auto_14853 ) ( CLEAR ?auto_14837 ) ( not ( = ?auto_14836 ?auto_14837 ) ) ( not ( = ?auto_14836 ?auto_14853 ) ) ( not ( = ?auto_14837 ?auto_14853 ) ) ( SURFACE-AT ?auto_14835 ?auto_14843 ) ( CLEAR ?auto_14835 ) ( IS-CRATE ?auto_14836 ) ( AVAILABLE ?auto_14848 ) ( AVAILABLE ?auto_14856 ) ( SURFACE-AT ?auto_14836 ?auto_14855 ) ( ON ?auto_14836 ?auto_14857 ) ( CLEAR ?auto_14836 ) ( TRUCK-AT ?auto_14845 ?auto_14843 ) ( not ( = ?auto_14835 ?auto_14836 ) ) ( not ( = ?auto_14835 ?auto_14857 ) ) ( not ( = ?auto_14836 ?auto_14857 ) ) ( not ( = ?auto_14835 ?auto_14837 ) ) ( not ( = ?auto_14835 ?auto_14853 ) ) ( not ( = ?auto_14837 ?auto_14857 ) ) ( not ( = ?auto_14853 ?auto_14857 ) ) ( not ( = ?auto_14835 ?auto_14838 ) ) ( not ( = ?auto_14835 ?auto_14858 ) ) ( not ( = ?auto_14836 ?auto_14838 ) ) ( not ( = ?auto_14836 ?auto_14858 ) ) ( not ( = ?auto_14838 ?auto_14853 ) ) ( not ( = ?auto_14838 ?auto_14857 ) ) ( not ( = ?auto_14854 ?auto_14855 ) ) ( not ( = ?auto_14851 ?auto_14856 ) ) ( not ( = ?auto_14858 ?auto_14853 ) ) ( not ( = ?auto_14858 ?auto_14857 ) ) ( not ( = ?auto_14835 ?auto_14839 ) ) ( not ( = ?auto_14835 ?auto_14859 ) ) ( not ( = ?auto_14836 ?auto_14839 ) ) ( not ( = ?auto_14836 ?auto_14859 ) ) ( not ( = ?auto_14837 ?auto_14839 ) ) ( not ( = ?auto_14837 ?auto_14859 ) ) ( not ( = ?auto_14839 ?auto_14858 ) ) ( not ( = ?auto_14839 ?auto_14853 ) ) ( not ( = ?auto_14839 ?auto_14857 ) ) ( not ( = ?auto_14859 ?auto_14858 ) ) ( not ( = ?auto_14859 ?auto_14853 ) ) ( not ( = ?auto_14859 ?auto_14857 ) ) ( not ( = ?auto_14835 ?auto_14840 ) ) ( not ( = ?auto_14835 ?auto_14850 ) ) ( not ( = ?auto_14836 ?auto_14840 ) ) ( not ( = ?auto_14836 ?auto_14850 ) ) ( not ( = ?auto_14837 ?auto_14840 ) ) ( not ( = ?auto_14837 ?auto_14850 ) ) ( not ( = ?auto_14838 ?auto_14840 ) ) ( not ( = ?auto_14838 ?auto_14850 ) ) ( not ( = ?auto_14840 ?auto_14859 ) ) ( not ( = ?auto_14840 ?auto_14858 ) ) ( not ( = ?auto_14840 ?auto_14853 ) ) ( not ( = ?auto_14840 ?auto_14857 ) ) ( not ( = ?auto_14849 ?auto_14855 ) ) ( not ( = ?auto_14849 ?auto_14854 ) ) ( not ( = ?auto_14852 ?auto_14856 ) ) ( not ( = ?auto_14852 ?auto_14851 ) ) ( not ( = ?auto_14850 ?auto_14859 ) ) ( not ( = ?auto_14850 ?auto_14858 ) ) ( not ( = ?auto_14850 ?auto_14853 ) ) ( not ( = ?auto_14850 ?auto_14857 ) ) ( not ( = ?auto_14835 ?auto_14842 ) ) ( not ( = ?auto_14835 ?auto_14860 ) ) ( not ( = ?auto_14836 ?auto_14842 ) ) ( not ( = ?auto_14836 ?auto_14860 ) ) ( not ( = ?auto_14837 ?auto_14842 ) ) ( not ( = ?auto_14837 ?auto_14860 ) ) ( not ( = ?auto_14838 ?auto_14842 ) ) ( not ( = ?auto_14838 ?auto_14860 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14860 ) ) ( not ( = ?auto_14842 ?auto_14850 ) ) ( not ( = ?auto_14842 ?auto_14859 ) ) ( not ( = ?auto_14842 ?auto_14858 ) ) ( not ( = ?auto_14842 ?auto_14853 ) ) ( not ( = ?auto_14842 ?auto_14857 ) ) ( not ( = ?auto_14860 ?auto_14850 ) ) ( not ( = ?auto_14860 ?auto_14859 ) ) ( not ( = ?auto_14860 ?auto_14858 ) ) ( not ( = ?auto_14860 ?auto_14853 ) ) ( not ( = ?auto_14860 ?auto_14857 ) ) ( not ( = ?auto_14835 ?auto_14841 ) ) ( not ( = ?auto_14835 ?auto_14844 ) ) ( not ( = ?auto_14836 ?auto_14841 ) ) ( not ( = ?auto_14836 ?auto_14844 ) ) ( not ( = ?auto_14837 ?auto_14841 ) ) ( not ( = ?auto_14837 ?auto_14844 ) ) ( not ( = ?auto_14838 ?auto_14841 ) ) ( not ( = ?auto_14838 ?auto_14844 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14839 ?auto_14844 ) ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14844 ) ) ( not ( = ?auto_14841 ?auto_14860 ) ) ( not ( = ?auto_14841 ?auto_14850 ) ) ( not ( = ?auto_14841 ?auto_14859 ) ) ( not ( = ?auto_14841 ?auto_14858 ) ) ( not ( = ?auto_14841 ?auto_14853 ) ) ( not ( = ?auto_14841 ?auto_14857 ) ) ( not ( = ?auto_14847 ?auto_14849 ) ) ( not ( = ?auto_14847 ?auto_14855 ) ) ( not ( = ?auto_14847 ?auto_14854 ) ) ( not ( = ?auto_14846 ?auto_14852 ) ) ( not ( = ?auto_14846 ?auto_14856 ) ) ( not ( = ?auto_14846 ?auto_14851 ) ) ( not ( = ?auto_14844 ?auto_14860 ) ) ( not ( = ?auto_14844 ?auto_14850 ) ) ( not ( = ?auto_14844 ?auto_14859 ) ) ( not ( = ?auto_14844 ?auto_14858 ) ) ( not ( = ?auto_14844 ?auto_14853 ) ) ( not ( = ?auto_14844 ?auto_14857 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14835 ?auto_14836 ?auto_14837 ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14842 )
      ( MAKE-1CRATE ?auto_14842 ?auto_14841 )
      ( MAKE-7CRATE-VERIFY ?auto_14835 ?auto_14836 ?auto_14837 ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14842 ?auto_14841 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14863 - SURFACE
      ?auto_14864 - SURFACE
    )
    :vars
    (
      ?auto_14865 - HOIST
      ?auto_14866 - PLACE
      ?auto_14868 - PLACE
      ?auto_14869 - HOIST
      ?auto_14870 - SURFACE
      ?auto_14867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14865 ?auto_14866 ) ( SURFACE-AT ?auto_14863 ?auto_14866 ) ( CLEAR ?auto_14863 ) ( IS-CRATE ?auto_14864 ) ( AVAILABLE ?auto_14865 ) ( not ( = ?auto_14868 ?auto_14866 ) ) ( HOIST-AT ?auto_14869 ?auto_14868 ) ( AVAILABLE ?auto_14869 ) ( SURFACE-AT ?auto_14864 ?auto_14868 ) ( ON ?auto_14864 ?auto_14870 ) ( CLEAR ?auto_14864 ) ( TRUCK-AT ?auto_14867 ?auto_14866 ) ( not ( = ?auto_14863 ?auto_14864 ) ) ( not ( = ?auto_14863 ?auto_14870 ) ) ( not ( = ?auto_14864 ?auto_14870 ) ) ( not ( = ?auto_14865 ?auto_14869 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14867 ?auto_14866 ?auto_14868 )
      ( !LIFT ?auto_14869 ?auto_14864 ?auto_14870 ?auto_14868 )
      ( !LOAD ?auto_14869 ?auto_14864 ?auto_14867 ?auto_14868 )
      ( !DRIVE ?auto_14867 ?auto_14868 ?auto_14866 )
      ( !UNLOAD ?auto_14865 ?auto_14864 ?auto_14867 ?auto_14866 )
      ( !DROP ?auto_14865 ?auto_14864 ?auto_14863 ?auto_14866 )
      ( MAKE-1CRATE-VERIFY ?auto_14863 ?auto_14864 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14880 - SURFACE
      ?auto_14881 - SURFACE
      ?auto_14882 - SURFACE
      ?auto_14883 - SURFACE
      ?auto_14884 - SURFACE
      ?auto_14885 - SURFACE
      ?auto_14888 - SURFACE
      ?auto_14887 - SURFACE
      ?auto_14886 - SURFACE
    )
    :vars
    (
      ?auto_14890 - HOIST
      ?auto_14893 - PLACE
      ?auto_14889 - PLACE
      ?auto_14894 - HOIST
      ?auto_14891 - SURFACE
      ?auto_14899 - PLACE
      ?auto_14900 - HOIST
      ?auto_14898 - SURFACE
      ?auto_14901 - PLACE
      ?auto_14897 - HOIST
      ?auto_14905 - SURFACE
      ?auto_14895 - SURFACE
      ?auto_14907 - PLACE
      ?auto_14906 - HOIST
      ?auto_14903 - SURFACE
      ?auto_14908 - PLACE
      ?auto_14896 - HOIST
      ?auto_14904 - SURFACE
      ?auto_14909 - SURFACE
      ?auto_14902 - SURFACE
      ?auto_14892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14890 ?auto_14893 ) ( IS-CRATE ?auto_14886 ) ( not ( = ?auto_14889 ?auto_14893 ) ) ( HOIST-AT ?auto_14894 ?auto_14889 ) ( AVAILABLE ?auto_14894 ) ( SURFACE-AT ?auto_14886 ?auto_14889 ) ( ON ?auto_14886 ?auto_14891 ) ( CLEAR ?auto_14886 ) ( not ( = ?auto_14887 ?auto_14886 ) ) ( not ( = ?auto_14887 ?auto_14891 ) ) ( not ( = ?auto_14886 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14894 ) ) ( IS-CRATE ?auto_14887 ) ( not ( = ?auto_14899 ?auto_14893 ) ) ( HOIST-AT ?auto_14900 ?auto_14899 ) ( AVAILABLE ?auto_14900 ) ( SURFACE-AT ?auto_14887 ?auto_14899 ) ( ON ?auto_14887 ?auto_14898 ) ( CLEAR ?auto_14887 ) ( not ( = ?auto_14888 ?auto_14887 ) ) ( not ( = ?auto_14888 ?auto_14898 ) ) ( not ( = ?auto_14887 ?auto_14898 ) ) ( not ( = ?auto_14890 ?auto_14900 ) ) ( IS-CRATE ?auto_14888 ) ( not ( = ?auto_14901 ?auto_14893 ) ) ( HOIST-AT ?auto_14897 ?auto_14901 ) ( SURFACE-AT ?auto_14888 ?auto_14901 ) ( ON ?auto_14888 ?auto_14905 ) ( CLEAR ?auto_14888 ) ( not ( = ?auto_14885 ?auto_14888 ) ) ( not ( = ?auto_14885 ?auto_14905 ) ) ( not ( = ?auto_14888 ?auto_14905 ) ) ( not ( = ?auto_14890 ?auto_14897 ) ) ( IS-CRATE ?auto_14885 ) ( AVAILABLE ?auto_14897 ) ( SURFACE-AT ?auto_14885 ?auto_14901 ) ( ON ?auto_14885 ?auto_14895 ) ( CLEAR ?auto_14885 ) ( not ( = ?auto_14884 ?auto_14885 ) ) ( not ( = ?auto_14884 ?auto_14895 ) ) ( not ( = ?auto_14885 ?auto_14895 ) ) ( IS-CRATE ?auto_14884 ) ( not ( = ?auto_14907 ?auto_14893 ) ) ( HOIST-AT ?auto_14906 ?auto_14907 ) ( SURFACE-AT ?auto_14884 ?auto_14907 ) ( ON ?auto_14884 ?auto_14903 ) ( CLEAR ?auto_14884 ) ( not ( = ?auto_14883 ?auto_14884 ) ) ( not ( = ?auto_14883 ?auto_14903 ) ) ( not ( = ?auto_14884 ?auto_14903 ) ) ( not ( = ?auto_14890 ?auto_14906 ) ) ( IS-CRATE ?auto_14883 ) ( not ( = ?auto_14908 ?auto_14893 ) ) ( HOIST-AT ?auto_14896 ?auto_14908 ) ( AVAILABLE ?auto_14896 ) ( SURFACE-AT ?auto_14883 ?auto_14908 ) ( ON ?auto_14883 ?auto_14904 ) ( CLEAR ?auto_14883 ) ( not ( = ?auto_14882 ?auto_14883 ) ) ( not ( = ?auto_14882 ?auto_14904 ) ) ( not ( = ?auto_14883 ?auto_14904 ) ) ( not ( = ?auto_14890 ?auto_14896 ) ) ( IS-CRATE ?auto_14882 ) ( SURFACE-AT ?auto_14882 ?auto_14907 ) ( ON ?auto_14882 ?auto_14909 ) ( CLEAR ?auto_14882 ) ( not ( = ?auto_14881 ?auto_14882 ) ) ( not ( = ?auto_14881 ?auto_14909 ) ) ( not ( = ?auto_14882 ?auto_14909 ) ) ( SURFACE-AT ?auto_14880 ?auto_14893 ) ( CLEAR ?auto_14880 ) ( IS-CRATE ?auto_14881 ) ( AVAILABLE ?auto_14890 ) ( AVAILABLE ?auto_14906 ) ( SURFACE-AT ?auto_14881 ?auto_14907 ) ( ON ?auto_14881 ?auto_14902 ) ( CLEAR ?auto_14881 ) ( TRUCK-AT ?auto_14892 ?auto_14893 ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14902 ) ) ( not ( = ?auto_14881 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14882 ) ) ( not ( = ?auto_14880 ?auto_14909 ) ) ( not ( = ?auto_14882 ?auto_14902 ) ) ( not ( = ?auto_14909 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14883 ) ) ( not ( = ?auto_14880 ?auto_14904 ) ) ( not ( = ?auto_14881 ?auto_14883 ) ) ( not ( = ?auto_14881 ?auto_14904 ) ) ( not ( = ?auto_14883 ?auto_14909 ) ) ( not ( = ?auto_14883 ?auto_14902 ) ) ( not ( = ?auto_14908 ?auto_14907 ) ) ( not ( = ?auto_14896 ?auto_14906 ) ) ( not ( = ?auto_14904 ?auto_14909 ) ) ( not ( = ?auto_14904 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14884 ) ) ( not ( = ?auto_14880 ?auto_14903 ) ) ( not ( = ?auto_14881 ?auto_14884 ) ) ( not ( = ?auto_14881 ?auto_14903 ) ) ( not ( = ?auto_14882 ?auto_14884 ) ) ( not ( = ?auto_14882 ?auto_14903 ) ) ( not ( = ?auto_14884 ?auto_14904 ) ) ( not ( = ?auto_14884 ?auto_14909 ) ) ( not ( = ?auto_14884 ?auto_14902 ) ) ( not ( = ?auto_14903 ?auto_14904 ) ) ( not ( = ?auto_14903 ?auto_14909 ) ) ( not ( = ?auto_14903 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14885 ) ) ( not ( = ?auto_14880 ?auto_14895 ) ) ( not ( = ?auto_14881 ?auto_14885 ) ) ( not ( = ?auto_14881 ?auto_14895 ) ) ( not ( = ?auto_14882 ?auto_14885 ) ) ( not ( = ?auto_14882 ?auto_14895 ) ) ( not ( = ?auto_14883 ?auto_14885 ) ) ( not ( = ?auto_14883 ?auto_14895 ) ) ( not ( = ?auto_14885 ?auto_14903 ) ) ( not ( = ?auto_14885 ?auto_14904 ) ) ( not ( = ?auto_14885 ?auto_14909 ) ) ( not ( = ?auto_14885 ?auto_14902 ) ) ( not ( = ?auto_14901 ?auto_14907 ) ) ( not ( = ?auto_14901 ?auto_14908 ) ) ( not ( = ?auto_14897 ?auto_14906 ) ) ( not ( = ?auto_14897 ?auto_14896 ) ) ( not ( = ?auto_14895 ?auto_14903 ) ) ( not ( = ?auto_14895 ?auto_14904 ) ) ( not ( = ?auto_14895 ?auto_14909 ) ) ( not ( = ?auto_14895 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14888 ) ) ( not ( = ?auto_14880 ?auto_14905 ) ) ( not ( = ?auto_14881 ?auto_14888 ) ) ( not ( = ?auto_14881 ?auto_14905 ) ) ( not ( = ?auto_14882 ?auto_14888 ) ) ( not ( = ?auto_14882 ?auto_14905 ) ) ( not ( = ?auto_14883 ?auto_14888 ) ) ( not ( = ?auto_14883 ?auto_14905 ) ) ( not ( = ?auto_14884 ?auto_14888 ) ) ( not ( = ?auto_14884 ?auto_14905 ) ) ( not ( = ?auto_14888 ?auto_14895 ) ) ( not ( = ?auto_14888 ?auto_14903 ) ) ( not ( = ?auto_14888 ?auto_14904 ) ) ( not ( = ?auto_14888 ?auto_14909 ) ) ( not ( = ?auto_14888 ?auto_14902 ) ) ( not ( = ?auto_14905 ?auto_14895 ) ) ( not ( = ?auto_14905 ?auto_14903 ) ) ( not ( = ?auto_14905 ?auto_14904 ) ) ( not ( = ?auto_14905 ?auto_14909 ) ) ( not ( = ?auto_14905 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14887 ) ) ( not ( = ?auto_14880 ?auto_14898 ) ) ( not ( = ?auto_14881 ?auto_14887 ) ) ( not ( = ?auto_14881 ?auto_14898 ) ) ( not ( = ?auto_14882 ?auto_14887 ) ) ( not ( = ?auto_14882 ?auto_14898 ) ) ( not ( = ?auto_14883 ?auto_14887 ) ) ( not ( = ?auto_14883 ?auto_14898 ) ) ( not ( = ?auto_14884 ?auto_14887 ) ) ( not ( = ?auto_14884 ?auto_14898 ) ) ( not ( = ?auto_14885 ?auto_14887 ) ) ( not ( = ?auto_14885 ?auto_14898 ) ) ( not ( = ?auto_14887 ?auto_14905 ) ) ( not ( = ?auto_14887 ?auto_14895 ) ) ( not ( = ?auto_14887 ?auto_14903 ) ) ( not ( = ?auto_14887 ?auto_14904 ) ) ( not ( = ?auto_14887 ?auto_14909 ) ) ( not ( = ?auto_14887 ?auto_14902 ) ) ( not ( = ?auto_14899 ?auto_14901 ) ) ( not ( = ?auto_14899 ?auto_14907 ) ) ( not ( = ?auto_14899 ?auto_14908 ) ) ( not ( = ?auto_14900 ?auto_14897 ) ) ( not ( = ?auto_14900 ?auto_14906 ) ) ( not ( = ?auto_14900 ?auto_14896 ) ) ( not ( = ?auto_14898 ?auto_14905 ) ) ( not ( = ?auto_14898 ?auto_14895 ) ) ( not ( = ?auto_14898 ?auto_14903 ) ) ( not ( = ?auto_14898 ?auto_14904 ) ) ( not ( = ?auto_14898 ?auto_14909 ) ) ( not ( = ?auto_14898 ?auto_14902 ) ) ( not ( = ?auto_14880 ?auto_14886 ) ) ( not ( = ?auto_14880 ?auto_14891 ) ) ( not ( = ?auto_14881 ?auto_14886 ) ) ( not ( = ?auto_14881 ?auto_14891 ) ) ( not ( = ?auto_14882 ?auto_14886 ) ) ( not ( = ?auto_14882 ?auto_14891 ) ) ( not ( = ?auto_14883 ?auto_14886 ) ) ( not ( = ?auto_14883 ?auto_14891 ) ) ( not ( = ?auto_14884 ?auto_14886 ) ) ( not ( = ?auto_14884 ?auto_14891 ) ) ( not ( = ?auto_14885 ?auto_14886 ) ) ( not ( = ?auto_14885 ?auto_14891 ) ) ( not ( = ?auto_14888 ?auto_14886 ) ) ( not ( = ?auto_14888 ?auto_14891 ) ) ( not ( = ?auto_14886 ?auto_14898 ) ) ( not ( = ?auto_14886 ?auto_14905 ) ) ( not ( = ?auto_14886 ?auto_14895 ) ) ( not ( = ?auto_14886 ?auto_14903 ) ) ( not ( = ?auto_14886 ?auto_14904 ) ) ( not ( = ?auto_14886 ?auto_14909 ) ) ( not ( = ?auto_14886 ?auto_14902 ) ) ( not ( = ?auto_14889 ?auto_14899 ) ) ( not ( = ?auto_14889 ?auto_14901 ) ) ( not ( = ?auto_14889 ?auto_14907 ) ) ( not ( = ?auto_14889 ?auto_14908 ) ) ( not ( = ?auto_14894 ?auto_14900 ) ) ( not ( = ?auto_14894 ?auto_14897 ) ) ( not ( = ?auto_14894 ?auto_14906 ) ) ( not ( = ?auto_14894 ?auto_14896 ) ) ( not ( = ?auto_14891 ?auto_14898 ) ) ( not ( = ?auto_14891 ?auto_14905 ) ) ( not ( = ?auto_14891 ?auto_14895 ) ) ( not ( = ?auto_14891 ?auto_14903 ) ) ( not ( = ?auto_14891 ?auto_14904 ) ) ( not ( = ?auto_14891 ?auto_14909 ) ) ( not ( = ?auto_14891 ?auto_14902 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14880 ?auto_14881 ?auto_14882 ?auto_14883 ?auto_14884 ?auto_14885 ?auto_14888 ?auto_14887 )
      ( MAKE-1CRATE ?auto_14887 ?auto_14886 )
      ( MAKE-8CRATE-VERIFY ?auto_14880 ?auto_14881 ?auto_14882 ?auto_14883 ?auto_14884 ?auto_14885 ?auto_14888 ?auto_14887 ?auto_14886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14912 - SURFACE
      ?auto_14913 - SURFACE
    )
    :vars
    (
      ?auto_14914 - HOIST
      ?auto_14915 - PLACE
      ?auto_14917 - PLACE
      ?auto_14918 - HOIST
      ?auto_14919 - SURFACE
      ?auto_14916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14914 ?auto_14915 ) ( SURFACE-AT ?auto_14912 ?auto_14915 ) ( CLEAR ?auto_14912 ) ( IS-CRATE ?auto_14913 ) ( AVAILABLE ?auto_14914 ) ( not ( = ?auto_14917 ?auto_14915 ) ) ( HOIST-AT ?auto_14918 ?auto_14917 ) ( AVAILABLE ?auto_14918 ) ( SURFACE-AT ?auto_14913 ?auto_14917 ) ( ON ?auto_14913 ?auto_14919 ) ( CLEAR ?auto_14913 ) ( TRUCK-AT ?auto_14916 ?auto_14915 ) ( not ( = ?auto_14912 ?auto_14913 ) ) ( not ( = ?auto_14912 ?auto_14919 ) ) ( not ( = ?auto_14913 ?auto_14919 ) ) ( not ( = ?auto_14914 ?auto_14918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14916 ?auto_14915 ?auto_14917 )
      ( !LIFT ?auto_14918 ?auto_14913 ?auto_14919 ?auto_14917 )
      ( !LOAD ?auto_14918 ?auto_14913 ?auto_14916 ?auto_14917 )
      ( !DRIVE ?auto_14916 ?auto_14917 ?auto_14915 )
      ( !UNLOAD ?auto_14914 ?auto_14913 ?auto_14916 ?auto_14915 )
      ( !DROP ?auto_14914 ?auto_14913 ?auto_14912 ?auto_14915 )
      ( MAKE-1CRATE-VERIFY ?auto_14912 ?auto_14913 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14930 - SURFACE
      ?auto_14931 - SURFACE
      ?auto_14932 - SURFACE
      ?auto_14933 - SURFACE
      ?auto_14934 - SURFACE
      ?auto_14935 - SURFACE
      ?auto_14938 - SURFACE
      ?auto_14937 - SURFACE
      ?auto_14936 - SURFACE
      ?auto_14939 - SURFACE
    )
    :vars
    (
      ?auto_14942 - HOIST
      ?auto_14940 - PLACE
      ?auto_14941 - PLACE
      ?auto_14944 - HOIST
      ?auto_14943 - SURFACE
      ?auto_14957 - PLACE
      ?auto_14961 - HOIST
      ?auto_14956 - SURFACE
      ?auto_14955 - PLACE
      ?auto_14954 - HOIST
      ?auto_14950 - SURFACE
      ?auto_14953 - PLACE
      ?auto_14958 - HOIST
      ?auto_14947 - SURFACE
      ?auto_14949 - SURFACE
      ?auto_14948 - SURFACE
      ?auto_14951 - PLACE
      ?auto_14959 - HOIST
      ?auto_14946 - SURFACE
      ?auto_14960 - SURFACE
      ?auto_14952 - SURFACE
      ?auto_14945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14942 ?auto_14940 ) ( IS-CRATE ?auto_14939 ) ( not ( = ?auto_14941 ?auto_14940 ) ) ( HOIST-AT ?auto_14944 ?auto_14941 ) ( SURFACE-AT ?auto_14939 ?auto_14941 ) ( ON ?auto_14939 ?auto_14943 ) ( CLEAR ?auto_14939 ) ( not ( = ?auto_14936 ?auto_14939 ) ) ( not ( = ?auto_14936 ?auto_14943 ) ) ( not ( = ?auto_14939 ?auto_14943 ) ) ( not ( = ?auto_14942 ?auto_14944 ) ) ( IS-CRATE ?auto_14936 ) ( not ( = ?auto_14957 ?auto_14940 ) ) ( HOIST-AT ?auto_14961 ?auto_14957 ) ( AVAILABLE ?auto_14961 ) ( SURFACE-AT ?auto_14936 ?auto_14957 ) ( ON ?auto_14936 ?auto_14956 ) ( CLEAR ?auto_14936 ) ( not ( = ?auto_14937 ?auto_14936 ) ) ( not ( = ?auto_14937 ?auto_14956 ) ) ( not ( = ?auto_14936 ?auto_14956 ) ) ( not ( = ?auto_14942 ?auto_14961 ) ) ( IS-CRATE ?auto_14937 ) ( not ( = ?auto_14955 ?auto_14940 ) ) ( HOIST-AT ?auto_14954 ?auto_14955 ) ( AVAILABLE ?auto_14954 ) ( SURFACE-AT ?auto_14937 ?auto_14955 ) ( ON ?auto_14937 ?auto_14950 ) ( CLEAR ?auto_14937 ) ( not ( = ?auto_14938 ?auto_14937 ) ) ( not ( = ?auto_14938 ?auto_14950 ) ) ( not ( = ?auto_14937 ?auto_14950 ) ) ( not ( = ?auto_14942 ?auto_14954 ) ) ( IS-CRATE ?auto_14938 ) ( not ( = ?auto_14953 ?auto_14940 ) ) ( HOIST-AT ?auto_14958 ?auto_14953 ) ( SURFACE-AT ?auto_14938 ?auto_14953 ) ( ON ?auto_14938 ?auto_14947 ) ( CLEAR ?auto_14938 ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14947 ) ) ( not ( = ?auto_14938 ?auto_14947 ) ) ( not ( = ?auto_14942 ?auto_14958 ) ) ( IS-CRATE ?auto_14935 ) ( AVAILABLE ?auto_14958 ) ( SURFACE-AT ?auto_14935 ?auto_14953 ) ( ON ?auto_14935 ?auto_14949 ) ( CLEAR ?auto_14935 ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14934 ?auto_14949 ) ) ( not ( = ?auto_14935 ?auto_14949 ) ) ( IS-CRATE ?auto_14934 ) ( SURFACE-AT ?auto_14934 ?auto_14941 ) ( ON ?auto_14934 ?auto_14948 ) ( CLEAR ?auto_14934 ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( not ( = ?auto_14933 ?auto_14948 ) ) ( not ( = ?auto_14934 ?auto_14948 ) ) ( IS-CRATE ?auto_14933 ) ( not ( = ?auto_14951 ?auto_14940 ) ) ( HOIST-AT ?auto_14959 ?auto_14951 ) ( AVAILABLE ?auto_14959 ) ( SURFACE-AT ?auto_14933 ?auto_14951 ) ( ON ?auto_14933 ?auto_14946 ) ( CLEAR ?auto_14933 ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14946 ) ) ( not ( = ?auto_14933 ?auto_14946 ) ) ( not ( = ?auto_14942 ?auto_14959 ) ) ( IS-CRATE ?auto_14932 ) ( SURFACE-AT ?auto_14932 ?auto_14941 ) ( ON ?auto_14932 ?auto_14960 ) ( CLEAR ?auto_14932 ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14960 ) ) ( not ( = ?auto_14932 ?auto_14960 ) ) ( SURFACE-AT ?auto_14930 ?auto_14940 ) ( CLEAR ?auto_14930 ) ( IS-CRATE ?auto_14931 ) ( AVAILABLE ?auto_14942 ) ( AVAILABLE ?auto_14944 ) ( SURFACE-AT ?auto_14931 ?auto_14941 ) ( ON ?auto_14931 ?auto_14952 ) ( CLEAR ?auto_14931 ) ( TRUCK-AT ?auto_14945 ?auto_14940 ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14930 ?auto_14952 ) ) ( not ( = ?auto_14931 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14932 ) ) ( not ( = ?auto_14930 ?auto_14960 ) ) ( not ( = ?auto_14932 ?auto_14952 ) ) ( not ( = ?auto_14960 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14933 ) ) ( not ( = ?auto_14930 ?auto_14946 ) ) ( not ( = ?auto_14931 ?auto_14933 ) ) ( not ( = ?auto_14931 ?auto_14946 ) ) ( not ( = ?auto_14933 ?auto_14960 ) ) ( not ( = ?auto_14933 ?auto_14952 ) ) ( not ( = ?auto_14951 ?auto_14941 ) ) ( not ( = ?auto_14959 ?auto_14944 ) ) ( not ( = ?auto_14946 ?auto_14960 ) ) ( not ( = ?auto_14946 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14934 ) ) ( not ( = ?auto_14930 ?auto_14948 ) ) ( not ( = ?auto_14931 ?auto_14934 ) ) ( not ( = ?auto_14931 ?auto_14948 ) ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14948 ) ) ( not ( = ?auto_14934 ?auto_14946 ) ) ( not ( = ?auto_14934 ?auto_14960 ) ) ( not ( = ?auto_14934 ?auto_14952 ) ) ( not ( = ?auto_14948 ?auto_14946 ) ) ( not ( = ?auto_14948 ?auto_14960 ) ) ( not ( = ?auto_14948 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14935 ) ) ( not ( = ?auto_14930 ?auto_14949 ) ) ( not ( = ?auto_14931 ?auto_14935 ) ) ( not ( = ?auto_14931 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14935 ) ) ( not ( = ?auto_14932 ?auto_14949 ) ) ( not ( = ?auto_14933 ?auto_14935 ) ) ( not ( = ?auto_14933 ?auto_14949 ) ) ( not ( = ?auto_14935 ?auto_14948 ) ) ( not ( = ?auto_14935 ?auto_14946 ) ) ( not ( = ?auto_14935 ?auto_14960 ) ) ( not ( = ?auto_14935 ?auto_14952 ) ) ( not ( = ?auto_14953 ?auto_14941 ) ) ( not ( = ?auto_14953 ?auto_14951 ) ) ( not ( = ?auto_14958 ?auto_14944 ) ) ( not ( = ?auto_14958 ?auto_14959 ) ) ( not ( = ?auto_14949 ?auto_14948 ) ) ( not ( = ?auto_14949 ?auto_14946 ) ) ( not ( = ?auto_14949 ?auto_14960 ) ) ( not ( = ?auto_14949 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14938 ) ) ( not ( = ?auto_14930 ?auto_14947 ) ) ( not ( = ?auto_14931 ?auto_14938 ) ) ( not ( = ?auto_14931 ?auto_14947 ) ) ( not ( = ?auto_14932 ?auto_14938 ) ) ( not ( = ?auto_14932 ?auto_14947 ) ) ( not ( = ?auto_14933 ?auto_14938 ) ) ( not ( = ?auto_14933 ?auto_14947 ) ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14934 ?auto_14947 ) ) ( not ( = ?auto_14938 ?auto_14949 ) ) ( not ( = ?auto_14938 ?auto_14948 ) ) ( not ( = ?auto_14938 ?auto_14946 ) ) ( not ( = ?auto_14938 ?auto_14960 ) ) ( not ( = ?auto_14938 ?auto_14952 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14946 ) ) ( not ( = ?auto_14947 ?auto_14960 ) ) ( not ( = ?auto_14947 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14937 ) ) ( not ( = ?auto_14930 ?auto_14950 ) ) ( not ( = ?auto_14931 ?auto_14937 ) ) ( not ( = ?auto_14931 ?auto_14950 ) ) ( not ( = ?auto_14932 ?auto_14937 ) ) ( not ( = ?auto_14932 ?auto_14950 ) ) ( not ( = ?auto_14933 ?auto_14937 ) ) ( not ( = ?auto_14933 ?auto_14950 ) ) ( not ( = ?auto_14934 ?auto_14937 ) ) ( not ( = ?auto_14934 ?auto_14950 ) ) ( not ( = ?auto_14935 ?auto_14937 ) ) ( not ( = ?auto_14935 ?auto_14950 ) ) ( not ( = ?auto_14937 ?auto_14947 ) ) ( not ( = ?auto_14937 ?auto_14949 ) ) ( not ( = ?auto_14937 ?auto_14948 ) ) ( not ( = ?auto_14937 ?auto_14946 ) ) ( not ( = ?auto_14937 ?auto_14960 ) ) ( not ( = ?auto_14937 ?auto_14952 ) ) ( not ( = ?auto_14955 ?auto_14953 ) ) ( not ( = ?auto_14955 ?auto_14941 ) ) ( not ( = ?auto_14955 ?auto_14951 ) ) ( not ( = ?auto_14954 ?auto_14958 ) ) ( not ( = ?auto_14954 ?auto_14944 ) ) ( not ( = ?auto_14954 ?auto_14959 ) ) ( not ( = ?auto_14950 ?auto_14947 ) ) ( not ( = ?auto_14950 ?auto_14949 ) ) ( not ( = ?auto_14950 ?auto_14948 ) ) ( not ( = ?auto_14950 ?auto_14946 ) ) ( not ( = ?auto_14950 ?auto_14960 ) ) ( not ( = ?auto_14950 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14936 ) ) ( not ( = ?auto_14930 ?auto_14956 ) ) ( not ( = ?auto_14931 ?auto_14936 ) ) ( not ( = ?auto_14931 ?auto_14956 ) ) ( not ( = ?auto_14932 ?auto_14936 ) ) ( not ( = ?auto_14932 ?auto_14956 ) ) ( not ( = ?auto_14933 ?auto_14936 ) ) ( not ( = ?auto_14933 ?auto_14956 ) ) ( not ( = ?auto_14934 ?auto_14936 ) ) ( not ( = ?auto_14934 ?auto_14956 ) ) ( not ( = ?auto_14935 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14956 ) ) ( not ( = ?auto_14938 ?auto_14936 ) ) ( not ( = ?auto_14938 ?auto_14956 ) ) ( not ( = ?auto_14936 ?auto_14950 ) ) ( not ( = ?auto_14936 ?auto_14947 ) ) ( not ( = ?auto_14936 ?auto_14949 ) ) ( not ( = ?auto_14936 ?auto_14948 ) ) ( not ( = ?auto_14936 ?auto_14946 ) ) ( not ( = ?auto_14936 ?auto_14960 ) ) ( not ( = ?auto_14936 ?auto_14952 ) ) ( not ( = ?auto_14957 ?auto_14955 ) ) ( not ( = ?auto_14957 ?auto_14953 ) ) ( not ( = ?auto_14957 ?auto_14941 ) ) ( not ( = ?auto_14957 ?auto_14951 ) ) ( not ( = ?auto_14961 ?auto_14954 ) ) ( not ( = ?auto_14961 ?auto_14958 ) ) ( not ( = ?auto_14961 ?auto_14944 ) ) ( not ( = ?auto_14961 ?auto_14959 ) ) ( not ( = ?auto_14956 ?auto_14950 ) ) ( not ( = ?auto_14956 ?auto_14947 ) ) ( not ( = ?auto_14956 ?auto_14949 ) ) ( not ( = ?auto_14956 ?auto_14948 ) ) ( not ( = ?auto_14956 ?auto_14946 ) ) ( not ( = ?auto_14956 ?auto_14960 ) ) ( not ( = ?auto_14956 ?auto_14952 ) ) ( not ( = ?auto_14930 ?auto_14939 ) ) ( not ( = ?auto_14930 ?auto_14943 ) ) ( not ( = ?auto_14931 ?auto_14939 ) ) ( not ( = ?auto_14931 ?auto_14943 ) ) ( not ( = ?auto_14932 ?auto_14939 ) ) ( not ( = ?auto_14932 ?auto_14943 ) ) ( not ( = ?auto_14933 ?auto_14939 ) ) ( not ( = ?auto_14933 ?auto_14943 ) ) ( not ( = ?auto_14934 ?auto_14939 ) ) ( not ( = ?auto_14934 ?auto_14943 ) ) ( not ( = ?auto_14935 ?auto_14939 ) ) ( not ( = ?auto_14935 ?auto_14943 ) ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14943 ) ) ( not ( = ?auto_14937 ?auto_14939 ) ) ( not ( = ?auto_14937 ?auto_14943 ) ) ( not ( = ?auto_14939 ?auto_14956 ) ) ( not ( = ?auto_14939 ?auto_14950 ) ) ( not ( = ?auto_14939 ?auto_14947 ) ) ( not ( = ?auto_14939 ?auto_14949 ) ) ( not ( = ?auto_14939 ?auto_14948 ) ) ( not ( = ?auto_14939 ?auto_14946 ) ) ( not ( = ?auto_14939 ?auto_14960 ) ) ( not ( = ?auto_14939 ?auto_14952 ) ) ( not ( = ?auto_14943 ?auto_14956 ) ) ( not ( = ?auto_14943 ?auto_14950 ) ) ( not ( = ?auto_14943 ?auto_14947 ) ) ( not ( = ?auto_14943 ?auto_14949 ) ) ( not ( = ?auto_14943 ?auto_14948 ) ) ( not ( = ?auto_14943 ?auto_14946 ) ) ( not ( = ?auto_14943 ?auto_14960 ) ) ( not ( = ?auto_14943 ?auto_14952 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14930 ?auto_14931 ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14938 ?auto_14937 ?auto_14936 )
      ( MAKE-1CRATE ?auto_14936 ?auto_14939 )
      ( MAKE-9CRATE-VERIFY ?auto_14930 ?auto_14931 ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14938 ?auto_14937 ?auto_14936 ?auto_14939 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14964 - SURFACE
      ?auto_14965 - SURFACE
    )
    :vars
    (
      ?auto_14966 - HOIST
      ?auto_14967 - PLACE
      ?auto_14969 - PLACE
      ?auto_14970 - HOIST
      ?auto_14971 - SURFACE
      ?auto_14968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14966 ?auto_14967 ) ( SURFACE-AT ?auto_14964 ?auto_14967 ) ( CLEAR ?auto_14964 ) ( IS-CRATE ?auto_14965 ) ( AVAILABLE ?auto_14966 ) ( not ( = ?auto_14969 ?auto_14967 ) ) ( HOIST-AT ?auto_14970 ?auto_14969 ) ( AVAILABLE ?auto_14970 ) ( SURFACE-AT ?auto_14965 ?auto_14969 ) ( ON ?auto_14965 ?auto_14971 ) ( CLEAR ?auto_14965 ) ( TRUCK-AT ?auto_14968 ?auto_14967 ) ( not ( = ?auto_14964 ?auto_14965 ) ) ( not ( = ?auto_14964 ?auto_14971 ) ) ( not ( = ?auto_14965 ?auto_14971 ) ) ( not ( = ?auto_14966 ?auto_14970 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14968 ?auto_14967 ?auto_14969 )
      ( !LIFT ?auto_14970 ?auto_14965 ?auto_14971 ?auto_14969 )
      ( !LOAD ?auto_14970 ?auto_14965 ?auto_14968 ?auto_14969 )
      ( !DRIVE ?auto_14968 ?auto_14969 ?auto_14967 )
      ( !UNLOAD ?auto_14966 ?auto_14965 ?auto_14968 ?auto_14967 )
      ( !DROP ?auto_14966 ?auto_14965 ?auto_14964 ?auto_14967 )
      ( MAKE-1CRATE-VERIFY ?auto_14964 ?auto_14965 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_14983 - SURFACE
      ?auto_14984 - SURFACE
      ?auto_14985 - SURFACE
      ?auto_14986 - SURFACE
      ?auto_14987 - SURFACE
      ?auto_14988 - SURFACE
      ?auto_14991 - SURFACE
      ?auto_14990 - SURFACE
      ?auto_14989 - SURFACE
      ?auto_14992 - SURFACE
      ?auto_14993 - SURFACE
    )
    :vars
    (
      ?auto_14995 - HOIST
      ?auto_14998 - PLACE
      ?auto_14999 - PLACE
      ?auto_14997 - HOIST
      ?auto_14996 - SURFACE
      ?auto_15015 - PLACE
      ?auto_15009 - HOIST
      ?auto_15000 - SURFACE
      ?auto_15005 - PLACE
      ?auto_15006 - HOIST
      ?auto_15017 - SURFACE
      ?auto_15002 - PLACE
      ?auto_15001 - HOIST
      ?auto_15014 - SURFACE
      ?auto_15004 - PLACE
      ?auto_15007 - HOIST
      ?auto_15011 - SURFACE
      ?auto_15018 - SURFACE
      ?auto_15016 - SURFACE
      ?auto_15013 - PLACE
      ?auto_15003 - HOIST
      ?auto_15010 - SURFACE
      ?auto_15012 - SURFACE
      ?auto_15008 - SURFACE
      ?auto_14994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14995 ?auto_14998 ) ( IS-CRATE ?auto_14993 ) ( not ( = ?auto_14999 ?auto_14998 ) ) ( HOIST-AT ?auto_14997 ?auto_14999 ) ( AVAILABLE ?auto_14997 ) ( SURFACE-AT ?auto_14993 ?auto_14999 ) ( ON ?auto_14993 ?auto_14996 ) ( CLEAR ?auto_14993 ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( not ( = ?auto_14992 ?auto_14996 ) ) ( not ( = ?auto_14993 ?auto_14996 ) ) ( not ( = ?auto_14995 ?auto_14997 ) ) ( IS-CRATE ?auto_14992 ) ( not ( = ?auto_15015 ?auto_14998 ) ) ( HOIST-AT ?auto_15009 ?auto_15015 ) ( SURFACE-AT ?auto_14992 ?auto_15015 ) ( ON ?auto_14992 ?auto_15000 ) ( CLEAR ?auto_14992 ) ( not ( = ?auto_14989 ?auto_14992 ) ) ( not ( = ?auto_14989 ?auto_15000 ) ) ( not ( = ?auto_14992 ?auto_15000 ) ) ( not ( = ?auto_14995 ?auto_15009 ) ) ( IS-CRATE ?auto_14989 ) ( not ( = ?auto_15005 ?auto_14998 ) ) ( HOIST-AT ?auto_15006 ?auto_15005 ) ( AVAILABLE ?auto_15006 ) ( SURFACE-AT ?auto_14989 ?auto_15005 ) ( ON ?auto_14989 ?auto_15017 ) ( CLEAR ?auto_14989 ) ( not ( = ?auto_14990 ?auto_14989 ) ) ( not ( = ?auto_14990 ?auto_15017 ) ) ( not ( = ?auto_14989 ?auto_15017 ) ) ( not ( = ?auto_14995 ?auto_15006 ) ) ( IS-CRATE ?auto_14990 ) ( not ( = ?auto_15002 ?auto_14998 ) ) ( HOIST-AT ?auto_15001 ?auto_15002 ) ( AVAILABLE ?auto_15001 ) ( SURFACE-AT ?auto_14990 ?auto_15002 ) ( ON ?auto_14990 ?auto_15014 ) ( CLEAR ?auto_14990 ) ( not ( = ?auto_14991 ?auto_14990 ) ) ( not ( = ?auto_14991 ?auto_15014 ) ) ( not ( = ?auto_14990 ?auto_15014 ) ) ( not ( = ?auto_14995 ?auto_15001 ) ) ( IS-CRATE ?auto_14991 ) ( not ( = ?auto_15004 ?auto_14998 ) ) ( HOIST-AT ?auto_15007 ?auto_15004 ) ( SURFACE-AT ?auto_14991 ?auto_15004 ) ( ON ?auto_14991 ?auto_15011 ) ( CLEAR ?auto_14991 ) ( not ( = ?auto_14988 ?auto_14991 ) ) ( not ( = ?auto_14988 ?auto_15011 ) ) ( not ( = ?auto_14991 ?auto_15011 ) ) ( not ( = ?auto_14995 ?auto_15007 ) ) ( IS-CRATE ?auto_14988 ) ( AVAILABLE ?auto_15007 ) ( SURFACE-AT ?auto_14988 ?auto_15004 ) ( ON ?auto_14988 ?auto_15018 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14987 ?auto_15018 ) ) ( not ( = ?auto_14988 ?auto_15018 ) ) ( IS-CRATE ?auto_14987 ) ( SURFACE-AT ?auto_14987 ?auto_15015 ) ( ON ?auto_14987 ?auto_15016 ) ( CLEAR ?auto_14987 ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_15016 ) ) ( not ( = ?auto_14987 ?auto_15016 ) ) ( IS-CRATE ?auto_14986 ) ( not ( = ?auto_15013 ?auto_14998 ) ) ( HOIST-AT ?auto_15003 ?auto_15013 ) ( AVAILABLE ?auto_15003 ) ( SURFACE-AT ?auto_14986 ?auto_15013 ) ( ON ?auto_14986 ?auto_15010 ) ( CLEAR ?auto_14986 ) ( not ( = ?auto_14985 ?auto_14986 ) ) ( not ( = ?auto_14985 ?auto_15010 ) ) ( not ( = ?auto_14986 ?auto_15010 ) ) ( not ( = ?auto_14995 ?auto_15003 ) ) ( IS-CRATE ?auto_14985 ) ( SURFACE-AT ?auto_14985 ?auto_15015 ) ( ON ?auto_14985 ?auto_15012 ) ( CLEAR ?auto_14985 ) ( not ( = ?auto_14984 ?auto_14985 ) ) ( not ( = ?auto_14984 ?auto_15012 ) ) ( not ( = ?auto_14985 ?auto_15012 ) ) ( SURFACE-AT ?auto_14983 ?auto_14998 ) ( CLEAR ?auto_14983 ) ( IS-CRATE ?auto_14984 ) ( AVAILABLE ?auto_14995 ) ( AVAILABLE ?auto_15009 ) ( SURFACE-AT ?auto_14984 ?auto_15015 ) ( ON ?auto_14984 ?auto_15008 ) ( CLEAR ?auto_14984 ) ( TRUCK-AT ?auto_14994 ?auto_14998 ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_15008 ) ) ( not ( = ?auto_14984 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14985 ) ) ( not ( = ?auto_14983 ?auto_15012 ) ) ( not ( = ?auto_14985 ?auto_15008 ) ) ( not ( = ?auto_15012 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14986 ) ) ( not ( = ?auto_14983 ?auto_15010 ) ) ( not ( = ?auto_14984 ?auto_14986 ) ) ( not ( = ?auto_14984 ?auto_15010 ) ) ( not ( = ?auto_14986 ?auto_15012 ) ) ( not ( = ?auto_14986 ?auto_15008 ) ) ( not ( = ?auto_15013 ?auto_15015 ) ) ( not ( = ?auto_15003 ?auto_15009 ) ) ( not ( = ?auto_15010 ?auto_15012 ) ) ( not ( = ?auto_15010 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14987 ) ) ( not ( = ?auto_14983 ?auto_15016 ) ) ( not ( = ?auto_14984 ?auto_14987 ) ) ( not ( = ?auto_14984 ?auto_15016 ) ) ( not ( = ?auto_14985 ?auto_14987 ) ) ( not ( = ?auto_14985 ?auto_15016 ) ) ( not ( = ?auto_14987 ?auto_15010 ) ) ( not ( = ?auto_14987 ?auto_15012 ) ) ( not ( = ?auto_14987 ?auto_15008 ) ) ( not ( = ?auto_15016 ?auto_15010 ) ) ( not ( = ?auto_15016 ?auto_15012 ) ) ( not ( = ?auto_15016 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14988 ) ) ( not ( = ?auto_14983 ?auto_15018 ) ) ( not ( = ?auto_14984 ?auto_14988 ) ) ( not ( = ?auto_14984 ?auto_15018 ) ) ( not ( = ?auto_14985 ?auto_14988 ) ) ( not ( = ?auto_14985 ?auto_15018 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_15018 ) ) ( not ( = ?auto_14988 ?auto_15016 ) ) ( not ( = ?auto_14988 ?auto_15010 ) ) ( not ( = ?auto_14988 ?auto_15012 ) ) ( not ( = ?auto_14988 ?auto_15008 ) ) ( not ( = ?auto_15004 ?auto_15015 ) ) ( not ( = ?auto_15004 ?auto_15013 ) ) ( not ( = ?auto_15007 ?auto_15009 ) ) ( not ( = ?auto_15007 ?auto_15003 ) ) ( not ( = ?auto_15018 ?auto_15016 ) ) ( not ( = ?auto_15018 ?auto_15010 ) ) ( not ( = ?auto_15018 ?auto_15012 ) ) ( not ( = ?auto_15018 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14991 ) ) ( not ( = ?auto_14983 ?auto_15011 ) ) ( not ( = ?auto_14984 ?auto_14991 ) ) ( not ( = ?auto_14984 ?auto_15011 ) ) ( not ( = ?auto_14985 ?auto_14991 ) ) ( not ( = ?auto_14985 ?auto_15011 ) ) ( not ( = ?auto_14986 ?auto_14991 ) ) ( not ( = ?auto_14986 ?auto_15011 ) ) ( not ( = ?auto_14987 ?auto_14991 ) ) ( not ( = ?auto_14987 ?auto_15011 ) ) ( not ( = ?auto_14991 ?auto_15018 ) ) ( not ( = ?auto_14991 ?auto_15016 ) ) ( not ( = ?auto_14991 ?auto_15010 ) ) ( not ( = ?auto_14991 ?auto_15012 ) ) ( not ( = ?auto_14991 ?auto_15008 ) ) ( not ( = ?auto_15011 ?auto_15018 ) ) ( not ( = ?auto_15011 ?auto_15016 ) ) ( not ( = ?auto_15011 ?auto_15010 ) ) ( not ( = ?auto_15011 ?auto_15012 ) ) ( not ( = ?auto_15011 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14990 ) ) ( not ( = ?auto_14983 ?auto_15014 ) ) ( not ( = ?auto_14984 ?auto_14990 ) ) ( not ( = ?auto_14984 ?auto_15014 ) ) ( not ( = ?auto_14985 ?auto_14990 ) ) ( not ( = ?auto_14985 ?auto_15014 ) ) ( not ( = ?auto_14986 ?auto_14990 ) ) ( not ( = ?auto_14986 ?auto_15014 ) ) ( not ( = ?auto_14987 ?auto_14990 ) ) ( not ( = ?auto_14987 ?auto_15014 ) ) ( not ( = ?auto_14988 ?auto_14990 ) ) ( not ( = ?auto_14988 ?auto_15014 ) ) ( not ( = ?auto_14990 ?auto_15011 ) ) ( not ( = ?auto_14990 ?auto_15018 ) ) ( not ( = ?auto_14990 ?auto_15016 ) ) ( not ( = ?auto_14990 ?auto_15010 ) ) ( not ( = ?auto_14990 ?auto_15012 ) ) ( not ( = ?auto_14990 ?auto_15008 ) ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15015 ) ) ( not ( = ?auto_15002 ?auto_15013 ) ) ( not ( = ?auto_15001 ?auto_15007 ) ) ( not ( = ?auto_15001 ?auto_15009 ) ) ( not ( = ?auto_15001 ?auto_15003 ) ) ( not ( = ?auto_15014 ?auto_15011 ) ) ( not ( = ?auto_15014 ?auto_15018 ) ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15010 ) ) ( not ( = ?auto_15014 ?auto_15012 ) ) ( not ( = ?auto_15014 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14989 ) ) ( not ( = ?auto_14983 ?auto_15017 ) ) ( not ( = ?auto_14984 ?auto_14989 ) ) ( not ( = ?auto_14984 ?auto_15017 ) ) ( not ( = ?auto_14985 ?auto_14989 ) ) ( not ( = ?auto_14985 ?auto_15017 ) ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14986 ?auto_15017 ) ) ( not ( = ?auto_14987 ?auto_14989 ) ) ( not ( = ?auto_14987 ?auto_15017 ) ) ( not ( = ?auto_14988 ?auto_14989 ) ) ( not ( = ?auto_14988 ?auto_15017 ) ) ( not ( = ?auto_14991 ?auto_14989 ) ) ( not ( = ?auto_14991 ?auto_15017 ) ) ( not ( = ?auto_14989 ?auto_15014 ) ) ( not ( = ?auto_14989 ?auto_15011 ) ) ( not ( = ?auto_14989 ?auto_15018 ) ) ( not ( = ?auto_14989 ?auto_15016 ) ) ( not ( = ?auto_14989 ?auto_15010 ) ) ( not ( = ?auto_14989 ?auto_15012 ) ) ( not ( = ?auto_14989 ?auto_15008 ) ) ( not ( = ?auto_15005 ?auto_15002 ) ) ( not ( = ?auto_15005 ?auto_15004 ) ) ( not ( = ?auto_15005 ?auto_15015 ) ) ( not ( = ?auto_15005 ?auto_15013 ) ) ( not ( = ?auto_15006 ?auto_15001 ) ) ( not ( = ?auto_15006 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15009 ) ) ( not ( = ?auto_15006 ?auto_15003 ) ) ( not ( = ?auto_15017 ?auto_15014 ) ) ( not ( = ?auto_15017 ?auto_15011 ) ) ( not ( = ?auto_15017 ?auto_15018 ) ) ( not ( = ?auto_15017 ?auto_15016 ) ) ( not ( = ?auto_15017 ?auto_15010 ) ) ( not ( = ?auto_15017 ?auto_15012 ) ) ( not ( = ?auto_15017 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14992 ) ) ( not ( = ?auto_14983 ?auto_15000 ) ) ( not ( = ?auto_14984 ?auto_14992 ) ) ( not ( = ?auto_14984 ?auto_15000 ) ) ( not ( = ?auto_14985 ?auto_14992 ) ) ( not ( = ?auto_14985 ?auto_15000 ) ) ( not ( = ?auto_14986 ?auto_14992 ) ) ( not ( = ?auto_14986 ?auto_15000 ) ) ( not ( = ?auto_14987 ?auto_14992 ) ) ( not ( = ?auto_14987 ?auto_15000 ) ) ( not ( = ?auto_14988 ?auto_14992 ) ) ( not ( = ?auto_14988 ?auto_15000 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( not ( = ?auto_14991 ?auto_15000 ) ) ( not ( = ?auto_14990 ?auto_14992 ) ) ( not ( = ?auto_14990 ?auto_15000 ) ) ( not ( = ?auto_14992 ?auto_15017 ) ) ( not ( = ?auto_14992 ?auto_15014 ) ) ( not ( = ?auto_14992 ?auto_15011 ) ) ( not ( = ?auto_14992 ?auto_15018 ) ) ( not ( = ?auto_14992 ?auto_15016 ) ) ( not ( = ?auto_14992 ?auto_15010 ) ) ( not ( = ?auto_14992 ?auto_15012 ) ) ( not ( = ?auto_14992 ?auto_15008 ) ) ( not ( = ?auto_15000 ?auto_15017 ) ) ( not ( = ?auto_15000 ?auto_15014 ) ) ( not ( = ?auto_15000 ?auto_15011 ) ) ( not ( = ?auto_15000 ?auto_15018 ) ) ( not ( = ?auto_15000 ?auto_15016 ) ) ( not ( = ?auto_15000 ?auto_15010 ) ) ( not ( = ?auto_15000 ?auto_15012 ) ) ( not ( = ?auto_15000 ?auto_15008 ) ) ( not ( = ?auto_14983 ?auto_14993 ) ) ( not ( = ?auto_14983 ?auto_14996 ) ) ( not ( = ?auto_14984 ?auto_14993 ) ) ( not ( = ?auto_14984 ?auto_14996 ) ) ( not ( = ?auto_14985 ?auto_14993 ) ) ( not ( = ?auto_14985 ?auto_14996 ) ) ( not ( = ?auto_14986 ?auto_14993 ) ) ( not ( = ?auto_14986 ?auto_14996 ) ) ( not ( = ?auto_14987 ?auto_14993 ) ) ( not ( = ?auto_14987 ?auto_14996 ) ) ( not ( = ?auto_14988 ?auto_14993 ) ) ( not ( = ?auto_14988 ?auto_14996 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14996 ) ) ( not ( = ?auto_14990 ?auto_14993 ) ) ( not ( = ?auto_14990 ?auto_14996 ) ) ( not ( = ?auto_14989 ?auto_14993 ) ) ( not ( = ?auto_14989 ?auto_14996 ) ) ( not ( = ?auto_14993 ?auto_15000 ) ) ( not ( = ?auto_14993 ?auto_15017 ) ) ( not ( = ?auto_14993 ?auto_15014 ) ) ( not ( = ?auto_14993 ?auto_15011 ) ) ( not ( = ?auto_14993 ?auto_15018 ) ) ( not ( = ?auto_14993 ?auto_15016 ) ) ( not ( = ?auto_14993 ?auto_15010 ) ) ( not ( = ?auto_14993 ?auto_15012 ) ) ( not ( = ?auto_14993 ?auto_15008 ) ) ( not ( = ?auto_14999 ?auto_15015 ) ) ( not ( = ?auto_14999 ?auto_15005 ) ) ( not ( = ?auto_14999 ?auto_15002 ) ) ( not ( = ?auto_14999 ?auto_15004 ) ) ( not ( = ?auto_14999 ?auto_15013 ) ) ( not ( = ?auto_14997 ?auto_15009 ) ) ( not ( = ?auto_14997 ?auto_15006 ) ) ( not ( = ?auto_14997 ?auto_15001 ) ) ( not ( = ?auto_14997 ?auto_15007 ) ) ( not ( = ?auto_14997 ?auto_15003 ) ) ( not ( = ?auto_14996 ?auto_15000 ) ) ( not ( = ?auto_14996 ?auto_15017 ) ) ( not ( = ?auto_14996 ?auto_15014 ) ) ( not ( = ?auto_14996 ?auto_15011 ) ) ( not ( = ?auto_14996 ?auto_15018 ) ) ( not ( = ?auto_14996 ?auto_15016 ) ) ( not ( = ?auto_14996 ?auto_15010 ) ) ( not ( = ?auto_14996 ?auto_15012 ) ) ( not ( = ?auto_14996 ?auto_15008 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14991 ?auto_14990 ?auto_14989 ?auto_14992 )
      ( MAKE-1CRATE ?auto_14992 ?auto_14993 )
      ( MAKE-10CRATE-VERIFY ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14991 ?auto_14990 ?auto_14989 ?auto_14992 ?auto_14993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15021 - SURFACE
      ?auto_15022 - SURFACE
    )
    :vars
    (
      ?auto_15023 - HOIST
      ?auto_15024 - PLACE
      ?auto_15026 - PLACE
      ?auto_15027 - HOIST
      ?auto_15028 - SURFACE
      ?auto_15025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15023 ?auto_15024 ) ( SURFACE-AT ?auto_15021 ?auto_15024 ) ( CLEAR ?auto_15021 ) ( IS-CRATE ?auto_15022 ) ( AVAILABLE ?auto_15023 ) ( not ( = ?auto_15026 ?auto_15024 ) ) ( HOIST-AT ?auto_15027 ?auto_15026 ) ( AVAILABLE ?auto_15027 ) ( SURFACE-AT ?auto_15022 ?auto_15026 ) ( ON ?auto_15022 ?auto_15028 ) ( CLEAR ?auto_15022 ) ( TRUCK-AT ?auto_15025 ?auto_15024 ) ( not ( = ?auto_15021 ?auto_15022 ) ) ( not ( = ?auto_15021 ?auto_15028 ) ) ( not ( = ?auto_15022 ?auto_15028 ) ) ( not ( = ?auto_15023 ?auto_15027 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15025 ?auto_15024 ?auto_15026 )
      ( !LIFT ?auto_15027 ?auto_15022 ?auto_15028 ?auto_15026 )
      ( !LOAD ?auto_15027 ?auto_15022 ?auto_15025 ?auto_15026 )
      ( !DRIVE ?auto_15025 ?auto_15026 ?auto_15024 )
      ( !UNLOAD ?auto_15023 ?auto_15022 ?auto_15025 ?auto_15024 )
      ( !DROP ?auto_15023 ?auto_15022 ?auto_15021 ?auto_15024 )
      ( MAKE-1CRATE-VERIFY ?auto_15021 ?auto_15022 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15041 - SURFACE
      ?auto_15042 - SURFACE
      ?auto_15043 - SURFACE
      ?auto_15044 - SURFACE
      ?auto_15045 - SURFACE
      ?auto_15046 - SURFACE
      ?auto_15049 - SURFACE
      ?auto_15048 - SURFACE
      ?auto_15047 - SURFACE
      ?auto_15050 - SURFACE
      ?auto_15052 - SURFACE
      ?auto_15051 - SURFACE
    )
    :vars
    (
      ?auto_15058 - HOIST
      ?auto_15057 - PLACE
      ?auto_15056 - PLACE
      ?auto_15055 - HOIST
      ?auto_15053 - SURFACE
      ?auto_15080 - PLACE
      ?auto_15079 - HOIST
      ?auto_15067 - SURFACE
      ?auto_15066 - PLACE
      ?auto_15071 - HOIST
      ?auto_15076 - SURFACE
      ?auto_15077 - PLACE
      ?auto_15070 - HOIST
      ?auto_15064 - SURFACE
      ?auto_15062 - PLACE
      ?auto_15068 - HOIST
      ?auto_15072 - SURFACE
      ?auto_15065 - PLACE
      ?auto_15075 - HOIST
      ?auto_15060 - SURFACE
      ?auto_15063 - SURFACE
      ?auto_15061 - SURFACE
      ?auto_15069 - PLACE
      ?auto_15059 - HOIST
      ?auto_15074 - SURFACE
      ?auto_15073 - SURFACE
      ?auto_15078 - SURFACE
      ?auto_15054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15058 ?auto_15057 ) ( IS-CRATE ?auto_15051 ) ( not ( = ?auto_15056 ?auto_15057 ) ) ( HOIST-AT ?auto_15055 ?auto_15056 ) ( AVAILABLE ?auto_15055 ) ( SURFACE-AT ?auto_15051 ?auto_15056 ) ( ON ?auto_15051 ?auto_15053 ) ( CLEAR ?auto_15051 ) ( not ( = ?auto_15052 ?auto_15051 ) ) ( not ( = ?auto_15052 ?auto_15053 ) ) ( not ( = ?auto_15051 ?auto_15053 ) ) ( not ( = ?auto_15058 ?auto_15055 ) ) ( IS-CRATE ?auto_15052 ) ( not ( = ?auto_15080 ?auto_15057 ) ) ( HOIST-AT ?auto_15079 ?auto_15080 ) ( AVAILABLE ?auto_15079 ) ( SURFACE-AT ?auto_15052 ?auto_15080 ) ( ON ?auto_15052 ?auto_15067 ) ( CLEAR ?auto_15052 ) ( not ( = ?auto_15050 ?auto_15052 ) ) ( not ( = ?auto_15050 ?auto_15067 ) ) ( not ( = ?auto_15052 ?auto_15067 ) ) ( not ( = ?auto_15058 ?auto_15079 ) ) ( IS-CRATE ?auto_15050 ) ( not ( = ?auto_15066 ?auto_15057 ) ) ( HOIST-AT ?auto_15071 ?auto_15066 ) ( SURFACE-AT ?auto_15050 ?auto_15066 ) ( ON ?auto_15050 ?auto_15076 ) ( CLEAR ?auto_15050 ) ( not ( = ?auto_15047 ?auto_15050 ) ) ( not ( = ?auto_15047 ?auto_15076 ) ) ( not ( = ?auto_15050 ?auto_15076 ) ) ( not ( = ?auto_15058 ?auto_15071 ) ) ( IS-CRATE ?auto_15047 ) ( not ( = ?auto_15077 ?auto_15057 ) ) ( HOIST-AT ?auto_15070 ?auto_15077 ) ( AVAILABLE ?auto_15070 ) ( SURFACE-AT ?auto_15047 ?auto_15077 ) ( ON ?auto_15047 ?auto_15064 ) ( CLEAR ?auto_15047 ) ( not ( = ?auto_15048 ?auto_15047 ) ) ( not ( = ?auto_15048 ?auto_15064 ) ) ( not ( = ?auto_15047 ?auto_15064 ) ) ( not ( = ?auto_15058 ?auto_15070 ) ) ( IS-CRATE ?auto_15048 ) ( not ( = ?auto_15062 ?auto_15057 ) ) ( HOIST-AT ?auto_15068 ?auto_15062 ) ( AVAILABLE ?auto_15068 ) ( SURFACE-AT ?auto_15048 ?auto_15062 ) ( ON ?auto_15048 ?auto_15072 ) ( CLEAR ?auto_15048 ) ( not ( = ?auto_15049 ?auto_15048 ) ) ( not ( = ?auto_15049 ?auto_15072 ) ) ( not ( = ?auto_15048 ?auto_15072 ) ) ( not ( = ?auto_15058 ?auto_15068 ) ) ( IS-CRATE ?auto_15049 ) ( not ( = ?auto_15065 ?auto_15057 ) ) ( HOIST-AT ?auto_15075 ?auto_15065 ) ( SURFACE-AT ?auto_15049 ?auto_15065 ) ( ON ?auto_15049 ?auto_15060 ) ( CLEAR ?auto_15049 ) ( not ( = ?auto_15046 ?auto_15049 ) ) ( not ( = ?auto_15046 ?auto_15060 ) ) ( not ( = ?auto_15049 ?auto_15060 ) ) ( not ( = ?auto_15058 ?auto_15075 ) ) ( IS-CRATE ?auto_15046 ) ( AVAILABLE ?auto_15075 ) ( SURFACE-AT ?auto_15046 ?auto_15065 ) ( ON ?auto_15046 ?auto_15063 ) ( CLEAR ?auto_15046 ) ( not ( = ?auto_15045 ?auto_15046 ) ) ( not ( = ?auto_15045 ?auto_15063 ) ) ( not ( = ?auto_15046 ?auto_15063 ) ) ( IS-CRATE ?auto_15045 ) ( SURFACE-AT ?auto_15045 ?auto_15066 ) ( ON ?auto_15045 ?auto_15061 ) ( CLEAR ?auto_15045 ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15061 ) ) ( not ( = ?auto_15045 ?auto_15061 ) ) ( IS-CRATE ?auto_15044 ) ( not ( = ?auto_15069 ?auto_15057 ) ) ( HOIST-AT ?auto_15059 ?auto_15069 ) ( AVAILABLE ?auto_15059 ) ( SURFACE-AT ?auto_15044 ?auto_15069 ) ( ON ?auto_15044 ?auto_15074 ) ( CLEAR ?auto_15044 ) ( not ( = ?auto_15043 ?auto_15044 ) ) ( not ( = ?auto_15043 ?auto_15074 ) ) ( not ( = ?auto_15044 ?auto_15074 ) ) ( not ( = ?auto_15058 ?auto_15059 ) ) ( IS-CRATE ?auto_15043 ) ( SURFACE-AT ?auto_15043 ?auto_15066 ) ( ON ?auto_15043 ?auto_15073 ) ( CLEAR ?auto_15043 ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15073 ) ) ( not ( = ?auto_15043 ?auto_15073 ) ) ( SURFACE-AT ?auto_15041 ?auto_15057 ) ( CLEAR ?auto_15041 ) ( IS-CRATE ?auto_15042 ) ( AVAILABLE ?auto_15058 ) ( AVAILABLE ?auto_15071 ) ( SURFACE-AT ?auto_15042 ?auto_15066 ) ( ON ?auto_15042 ?auto_15078 ) ( CLEAR ?auto_15042 ) ( TRUCK-AT ?auto_15054 ?auto_15057 ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15078 ) ) ( not ( = ?auto_15042 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( not ( = ?auto_15041 ?auto_15073 ) ) ( not ( = ?auto_15043 ?auto_15078 ) ) ( not ( = ?auto_15073 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15044 ) ) ( not ( = ?auto_15041 ?auto_15074 ) ) ( not ( = ?auto_15042 ?auto_15044 ) ) ( not ( = ?auto_15042 ?auto_15074 ) ) ( not ( = ?auto_15044 ?auto_15073 ) ) ( not ( = ?auto_15044 ?auto_15078 ) ) ( not ( = ?auto_15069 ?auto_15066 ) ) ( not ( = ?auto_15059 ?auto_15071 ) ) ( not ( = ?auto_15074 ?auto_15073 ) ) ( not ( = ?auto_15074 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15045 ) ) ( not ( = ?auto_15041 ?auto_15061 ) ) ( not ( = ?auto_15042 ?auto_15045 ) ) ( not ( = ?auto_15042 ?auto_15061 ) ) ( not ( = ?auto_15043 ?auto_15045 ) ) ( not ( = ?auto_15043 ?auto_15061 ) ) ( not ( = ?auto_15045 ?auto_15074 ) ) ( not ( = ?auto_15045 ?auto_15073 ) ) ( not ( = ?auto_15045 ?auto_15078 ) ) ( not ( = ?auto_15061 ?auto_15074 ) ) ( not ( = ?auto_15061 ?auto_15073 ) ) ( not ( = ?auto_15061 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15046 ) ) ( not ( = ?auto_15041 ?auto_15063 ) ) ( not ( = ?auto_15042 ?auto_15046 ) ) ( not ( = ?auto_15042 ?auto_15063 ) ) ( not ( = ?auto_15043 ?auto_15046 ) ) ( not ( = ?auto_15043 ?auto_15063 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15063 ) ) ( not ( = ?auto_15046 ?auto_15061 ) ) ( not ( = ?auto_15046 ?auto_15074 ) ) ( not ( = ?auto_15046 ?auto_15073 ) ) ( not ( = ?auto_15046 ?auto_15078 ) ) ( not ( = ?auto_15065 ?auto_15066 ) ) ( not ( = ?auto_15065 ?auto_15069 ) ) ( not ( = ?auto_15075 ?auto_15071 ) ) ( not ( = ?auto_15075 ?auto_15059 ) ) ( not ( = ?auto_15063 ?auto_15061 ) ) ( not ( = ?auto_15063 ?auto_15074 ) ) ( not ( = ?auto_15063 ?auto_15073 ) ) ( not ( = ?auto_15063 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15049 ) ) ( not ( = ?auto_15041 ?auto_15060 ) ) ( not ( = ?auto_15042 ?auto_15049 ) ) ( not ( = ?auto_15042 ?auto_15060 ) ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( not ( = ?auto_15043 ?auto_15060 ) ) ( not ( = ?auto_15044 ?auto_15049 ) ) ( not ( = ?auto_15044 ?auto_15060 ) ) ( not ( = ?auto_15045 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15060 ) ) ( not ( = ?auto_15049 ?auto_15063 ) ) ( not ( = ?auto_15049 ?auto_15061 ) ) ( not ( = ?auto_15049 ?auto_15074 ) ) ( not ( = ?auto_15049 ?auto_15073 ) ) ( not ( = ?auto_15049 ?auto_15078 ) ) ( not ( = ?auto_15060 ?auto_15063 ) ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15074 ) ) ( not ( = ?auto_15060 ?auto_15073 ) ) ( not ( = ?auto_15060 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15048 ) ) ( not ( = ?auto_15041 ?auto_15072 ) ) ( not ( = ?auto_15042 ?auto_15048 ) ) ( not ( = ?auto_15042 ?auto_15072 ) ) ( not ( = ?auto_15043 ?auto_15048 ) ) ( not ( = ?auto_15043 ?auto_15072 ) ) ( not ( = ?auto_15044 ?auto_15048 ) ) ( not ( = ?auto_15044 ?auto_15072 ) ) ( not ( = ?auto_15045 ?auto_15048 ) ) ( not ( = ?auto_15045 ?auto_15072 ) ) ( not ( = ?auto_15046 ?auto_15048 ) ) ( not ( = ?auto_15046 ?auto_15072 ) ) ( not ( = ?auto_15048 ?auto_15060 ) ) ( not ( = ?auto_15048 ?auto_15063 ) ) ( not ( = ?auto_15048 ?auto_15061 ) ) ( not ( = ?auto_15048 ?auto_15074 ) ) ( not ( = ?auto_15048 ?auto_15073 ) ) ( not ( = ?auto_15048 ?auto_15078 ) ) ( not ( = ?auto_15062 ?auto_15065 ) ) ( not ( = ?auto_15062 ?auto_15066 ) ) ( not ( = ?auto_15062 ?auto_15069 ) ) ( not ( = ?auto_15068 ?auto_15075 ) ) ( not ( = ?auto_15068 ?auto_15071 ) ) ( not ( = ?auto_15068 ?auto_15059 ) ) ( not ( = ?auto_15072 ?auto_15060 ) ) ( not ( = ?auto_15072 ?auto_15063 ) ) ( not ( = ?auto_15072 ?auto_15061 ) ) ( not ( = ?auto_15072 ?auto_15074 ) ) ( not ( = ?auto_15072 ?auto_15073 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15047 ) ) ( not ( = ?auto_15041 ?auto_15064 ) ) ( not ( = ?auto_15042 ?auto_15047 ) ) ( not ( = ?auto_15042 ?auto_15064 ) ) ( not ( = ?auto_15043 ?auto_15047 ) ) ( not ( = ?auto_15043 ?auto_15064 ) ) ( not ( = ?auto_15044 ?auto_15047 ) ) ( not ( = ?auto_15044 ?auto_15064 ) ) ( not ( = ?auto_15045 ?auto_15047 ) ) ( not ( = ?auto_15045 ?auto_15064 ) ) ( not ( = ?auto_15046 ?auto_15047 ) ) ( not ( = ?auto_15046 ?auto_15064 ) ) ( not ( = ?auto_15049 ?auto_15047 ) ) ( not ( = ?auto_15049 ?auto_15064 ) ) ( not ( = ?auto_15047 ?auto_15072 ) ) ( not ( = ?auto_15047 ?auto_15060 ) ) ( not ( = ?auto_15047 ?auto_15063 ) ) ( not ( = ?auto_15047 ?auto_15061 ) ) ( not ( = ?auto_15047 ?auto_15074 ) ) ( not ( = ?auto_15047 ?auto_15073 ) ) ( not ( = ?auto_15047 ?auto_15078 ) ) ( not ( = ?auto_15077 ?auto_15062 ) ) ( not ( = ?auto_15077 ?auto_15065 ) ) ( not ( = ?auto_15077 ?auto_15066 ) ) ( not ( = ?auto_15077 ?auto_15069 ) ) ( not ( = ?auto_15070 ?auto_15068 ) ) ( not ( = ?auto_15070 ?auto_15075 ) ) ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15059 ) ) ( not ( = ?auto_15064 ?auto_15072 ) ) ( not ( = ?auto_15064 ?auto_15060 ) ) ( not ( = ?auto_15064 ?auto_15063 ) ) ( not ( = ?auto_15064 ?auto_15061 ) ) ( not ( = ?auto_15064 ?auto_15074 ) ) ( not ( = ?auto_15064 ?auto_15073 ) ) ( not ( = ?auto_15064 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15050 ) ) ( not ( = ?auto_15041 ?auto_15076 ) ) ( not ( = ?auto_15042 ?auto_15050 ) ) ( not ( = ?auto_15042 ?auto_15076 ) ) ( not ( = ?auto_15043 ?auto_15050 ) ) ( not ( = ?auto_15043 ?auto_15076 ) ) ( not ( = ?auto_15044 ?auto_15050 ) ) ( not ( = ?auto_15044 ?auto_15076 ) ) ( not ( = ?auto_15045 ?auto_15050 ) ) ( not ( = ?auto_15045 ?auto_15076 ) ) ( not ( = ?auto_15046 ?auto_15050 ) ) ( not ( = ?auto_15046 ?auto_15076 ) ) ( not ( = ?auto_15049 ?auto_15050 ) ) ( not ( = ?auto_15049 ?auto_15076 ) ) ( not ( = ?auto_15048 ?auto_15050 ) ) ( not ( = ?auto_15048 ?auto_15076 ) ) ( not ( = ?auto_15050 ?auto_15064 ) ) ( not ( = ?auto_15050 ?auto_15072 ) ) ( not ( = ?auto_15050 ?auto_15060 ) ) ( not ( = ?auto_15050 ?auto_15063 ) ) ( not ( = ?auto_15050 ?auto_15061 ) ) ( not ( = ?auto_15050 ?auto_15074 ) ) ( not ( = ?auto_15050 ?auto_15073 ) ) ( not ( = ?auto_15050 ?auto_15078 ) ) ( not ( = ?auto_15076 ?auto_15064 ) ) ( not ( = ?auto_15076 ?auto_15072 ) ) ( not ( = ?auto_15076 ?auto_15060 ) ) ( not ( = ?auto_15076 ?auto_15063 ) ) ( not ( = ?auto_15076 ?auto_15061 ) ) ( not ( = ?auto_15076 ?auto_15074 ) ) ( not ( = ?auto_15076 ?auto_15073 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15052 ) ) ( not ( = ?auto_15041 ?auto_15067 ) ) ( not ( = ?auto_15042 ?auto_15052 ) ) ( not ( = ?auto_15042 ?auto_15067 ) ) ( not ( = ?auto_15043 ?auto_15052 ) ) ( not ( = ?auto_15043 ?auto_15067 ) ) ( not ( = ?auto_15044 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15067 ) ) ( not ( = ?auto_15045 ?auto_15052 ) ) ( not ( = ?auto_15045 ?auto_15067 ) ) ( not ( = ?auto_15046 ?auto_15052 ) ) ( not ( = ?auto_15046 ?auto_15067 ) ) ( not ( = ?auto_15049 ?auto_15052 ) ) ( not ( = ?auto_15049 ?auto_15067 ) ) ( not ( = ?auto_15048 ?auto_15052 ) ) ( not ( = ?auto_15048 ?auto_15067 ) ) ( not ( = ?auto_15047 ?auto_15052 ) ) ( not ( = ?auto_15047 ?auto_15067 ) ) ( not ( = ?auto_15052 ?auto_15076 ) ) ( not ( = ?auto_15052 ?auto_15064 ) ) ( not ( = ?auto_15052 ?auto_15072 ) ) ( not ( = ?auto_15052 ?auto_15060 ) ) ( not ( = ?auto_15052 ?auto_15063 ) ) ( not ( = ?auto_15052 ?auto_15061 ) ) ( not ( = ?auto_15052 ?auto_15074 ) ) ( not ( = ?auto_15052 ?auto_15073 ) ) ( not ( = ?auto_15052 ?auto_15078 ) ) ( not ( = ?auto_15080 ?auto_15066 ) ) ( not ( = ?auto_15080 ?auto_15077 ) ) ( not ( = ?auto_15080 ?auto_15062 ) ) ( not ( = ?auto_15080 ?auto_15065 ) ) ( not ( = ?auto_15080 ?auto_15069 ) ) ( not ( = ?auto_15079 ?auto_15071 ) ) ( not ( = ?auto_15079 ?auto_15070 ) ) ( not ( = ?auto_15079 ?auto_15068 ) ) ( not ( = ?auto_15079 ?auto_15075 ) ) ( not ( = ?auto_15079 ?auto_15059 ) ) ( not ( = ?auto_15067 ?auto_15076 ) ) ( not ( = ?auto_15067 ?auto_15064 ) ) ( not ( = ?auto_15067 ?auto_15072 ) ) ( not ( = ?auto_15067 ?auto_15060 ) ) ( not ( = ?auto_15067 ?auto_15063 ) ) ( not ( = ?auto_15067 ?auto_15061 ) ) ( not ( = ?auto_15067 ?auto_15074 ) ) ( not ( = ?auto_15067 ?auto_15073 ) ) ( not ( = ?auto_15067 ?auto_15078 ) ) ( not ( = ?auto_15041 ?auto_15051 ) ) ( not ( = ?auto_15041 ?auto_15053 ) ) ( not ( = ?auto_15042 ?auto_15051 ) ) ( not ( = ?auto_15042 ?auto_15053 ) ) ( not ( = ?auto_15043 ?auto_15051 ) ) ( not ( = ?auto_15043 ?auto_15053 ) ) ( not ( = ?auto_15044 ?auto_15051 ) ) ( not ( = ?auto_15044 ?auto_15053 ) ) ( not ( = ?auto_15045 ?auto_15051 ) ) ( not ( = ?auto_15045 ?auto_15053 ) ) ( not ( = ?auto_15046 ?auto_15051 ) ) ( not ( = ?auto_15046 ?auto_15053 ) ) ( not ( = ?auto_15049 ?auto_15051 ) ) ( not ( = ?auto_15049 ?auto_15053 ) ) ( not ( = ?auto_15048 ?auto_15051 ) ) ( not ( = ?auto_15048 ?auto_15053 ) ) ( not ( = ?auto_15047 ?auto_15051 ) ) ( not ( = ?auto_15047 ?auto_15053 ) ) ( not ( = ?auto_15050 ?auto_15051 ) ) ( not ( = ?auto_15050 ?auto_15053 ) ) ( not ( = ?auto_15051 ?auto_15067 ) ) ( not ( = ?auto_15051 ?auto_15076 ) ) ( not ( = ?auto_15051 ?auto_15064 ) ) ( not ( = ?auto_15051 ?auto_15072 ) ) ( not ( = ?auto_15051 ?auto_15060 ) ) ( not ( = ?auto_15051 ?auto_15063 ) ) ( not ( = ?auto_15051 ?auto_15061 ) ) ( not ( = ?auto_15051 ?auto_15074 ) ) ( not ( = ?auto_15051 ?auto_15073 ) ) ( not ( = ?auto_15051 ?auto_15078 ) ) ( not ( = ?auto_15056 ?auto_15080 ) ) ( not ( = ?auto_15056 ?auto_15066 ) ) ( not ( = ?auto_15056 ?auto_15077 ) ) ( not ( = ?auto_15056 ?auto_15062 ) ) ( not ( = ?auto_15056 ?auto_15065 ) ) ( not ( = ?auto_15056 ?auto_15069 ) ) ( not ( = ?auto_15055 ?auto_15079 ) ) ( not ( = ?auto_15055 ?auto_15071 ) ) ( not ( = ?auto_15055 ?auto_15070 ) ) ( not ( = ?auto_15055 ?auto_15068 ) ) ( not ( = ?auto_15055 ?auto_15075 ) ) ( not ( = ?auto_15055 ?auto_15059 ) ) ( not ( = ?auto_15053 ?auto_15067 ) ) ( not ( = ?auto_15053 ?auto_15076 ) ) ( not ( = ?auto_15053 ?auto_15064 ) ) ( not ( = ?auto_15053 ?auto_15072 ) ) ( not ( = ?auto_15053 ?auto_15060 ) ) ( not ( = ?auto_15053 ?auto_15063 ) ) ( not ( = ?auto_15053 ?auto_15061 ) ) ( not ( = ?auto_15053 ?auto_15074 ) ) ( not ( = ?auto_15053 ?auto_15073 ) ) ( not ( = ?auto_15053 ?auto_15078 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15041 ?auto_15042 ?auto_15043 ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15049 ?auto_15048 ?auto_15047 ?auto_15050 ?auto_15052 )
      ( MAKE-1CRATE ?auto_15052 ?auto_15051 )
      ( MAKE-11CRATE-VERIFY ?auto_15041 ?auto_15042 ?auto_15043 ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15049 ?auto_15048 ?auto_15047 ?auto_15050 ?auto_15052 ?auto_15051 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15083 - SURFACE
      ?auto_15084 - SURFACE
    )
    :vars
    (
      ?auto_15085 - HOIST
      ?auto_15086 - PLACE
      ?auto_15088 - PLACE
      ?auto_15089 - HOIST
      ?auto_15090 - SURFACE
      ?auto_15087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15085 ?auto_15086 ) ( SURFACE-AT ?auto_15083 ?auto_15086 ) ( CLEAR ?auto_15083 ) ( IS-CRATE ?auto_15084 ) ( AVAILABLE ?auto_15085 ) ( not ( = ?auto_15088 ?auto_15086 ) ) ( HOIST-AT ?auto_15089 ?auto_15088 ) ( AVAILABLE ?auto_15089 ) ( SURFACE-AT ?auto_15084 ?auto_15088 ) ( ON ?auto_15084 ?auto_15090 ) ( CLEAR ?auto_15084 ) ( TRUCK-AT ?auto_15087 ?auto_15086 ) ( not ( = ?auto_15083 ?auto_15084 ) ) ( not ( = ?auto_15083 ?auto_15090 ) ) ( not ( = ?auto_15084 ?auto_15090 ) ) ( not ( = ?auto_15085 ?auto_15089 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15087 ?auto_15086 ?auto_15088 )
      ( !LIFT ?auto_15089 ?auto_15084 ?auto_15090 ?auto_15088 )
      ( !LOAD ?auto_15089 ?auto_15084 ?auto_15087 ?auto_15088 )
      ( !DRIVE ?auto_15087 ?auto_15088 ?auto_15086 )
      ( !UNLOAD ?auto_15085 ?auto_15084 ?auto_15087 ?auto_15086 )
      ( !DROP ?auto_15085 ?auto_15084 ?auto_15083 ?auto_15086 )
      ( MAKE-1CRATE-VERIFY ?auto_15083 ?auto_15084 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15104 - SURFACE
      ?auto_15105 - SURFACE
      ?auto_15106 - SURFACE
      ?auto_15107 - SURFACE
      ?auto_15108 - SURFACE
      ?auto_15109 - SURFACE
      ?auto_15112 - SURFACE
      ?auto_15111 - SURFACE
      ?auto_15110 - SURFACE
      ?auto_15113 - SURFACE
      ?auto_15115 - SURFACE
      ?auto_15114 - SURFACE
      ?auto_15116 - SURFACE
    )
    :vars
    (
      ?auto_15121 - HOIST
      ?auto_15118 - PLACE
      ?auto_15119 - PLACE
      ?auto_15120 - HOIST
      ?auto_15122 - SURFACE
      ?auto_15132 - PLACE
      ?auto_15131 - HOIST
      ?auto_15133 - SURFACE
      ?auto_15125 - SURFACE
      ?auto_15145 - PLACE
      ?auto_15123 - HOIST
      ?auto_15143 - SURFACE
      ?auto_15139 - PLACE
      ?auto_15130 - HOIST
      ?auto_15137 - SURFACE
      ?auto_15138 - PLACE
      ?auto_15135 - HOIST
      ?auto_15128 - SURFACE
      ?auto_15144 - PLACE
      ?auto_15142 - HOIST
      ?auto_15127 - SURFACE
      ?auto_15129 - SURFACE
      ?auto_15141 - SURFACE
      ?auto_15134 - PLACE
      ?auto_15136 - HOIST
      ?auto_15126 - SURFACE
      ?auto_15140 - SURFACE
      ?auto_15124 - SURFACE
      ?auto_15117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15121 ?auto_15118 ) ( IS-CRATE ?auto_15116 ) ( not ( = ?auto_15119 ?auto_15118 ) ) ( HOIST-AT ?auto_15120 ?auto_15119 ) ( SURFACE-AT ?auto_15116 ?auto_15119 ) ( ON ?auto_15116 ?auto_15122 ) ( CLEAR ?auto_15116 ) ( not ( = ?auto_15114 ?auto_15116 ) ) ( not ( = ?auto_15114 ?auto_15122 ) ) ( not ( = ?auto_15116 ?auto_15122 ) ) ( not ( = ?auto_15121 ?auto_15120 ) ) ( IS-CRATE ?auto_15114 ) ( not ( = ?auto_15132 ?auto_15118 ) ) ( HOIST-AT ?auto_15131 ?auto_15132 ) ( AVAILABLE ?auto_15131 ) ( SURFACE-AT ?auto_15114 ?auto_15132 ) ( ON ?auto_15114 ?auto_15133 ) ( CLEAR ?auto_15114 ) ( not ( = ?auto_15115 ?auto_15114 ) ) ( not ( = ?auto_15115 ?auto_15133 ) ) ( not ( = ?auto_15114 ?auto_15133 ) ) ( not ( = ?auto_15121 ?auto_15131 ) ) ( IS-CRATE ?auto_15115 ) ( AVAILABLE ?auto_15120 ) ( SURFACE-AT ?auto_15115 ?auto_15119 ) ( ON ?auto_15115 ?auto_15125 ) ( CLEAR ?auto_15115 ) ( not ( = ?auto_15113 ?auto_15115 ) ) ( not ( = ?auto_15113 ?auto_15125 ) ) ( not ( = ?auto_15115 ?auto_15125 ) ) ( IS-CRATE ?auto_15113 ) ( not ( = ?auto_15145 ?auto_15118 ) ) ( HOIST-AT ?auto_15123 ?auto_15145 ) ( SURFACE-AT ?auto_15113 ?auto_15145 ) ( ON ?auto_15113 ?auto_15143 ) ( CLEAR ?auto_15113 ) ( not ( = ?auto_15110 ?auto_15113 ) ) ( not ( = ?auto_15110 ?auto_15143 ) ) ( not ( = ?auto_15113 ?auto_15143 ) ) ( not ( = ?auto_15121 ?auto_15123 ) ) ( IS-CRATE ?auto_15110 ) ( not ( = ?auto_15139 ?auto_15118 ) ) ( HOIST-AT ?auto_15130 ?auto_15139 ) ( AVAILABLE ?auto_15130 ) ( SURFACE-AT ?auto_15110 ?auto_15139 ) ( ON ?auto_15110 ?auto_15137 ) ( CLEAR ?auto_15110 ) ( not ( = ?auto_15111 ?auto_15110 ) ) ( not ( = ?auto_15111 ?auto_15137 ) ) ( not ( = ?auto_15110 ?auto_15137 ) ) ( not ( = ?auto_15121 ?auto_15130 ) ) ( IS-CRATE ?auto_15111 ) ( not ( = ?auto_15138 ?auto_15118 ) ) ( HOIST-AT ?auto_15135 ?auto_15138 ) ( AVAILABLE ?auto_15135 ) ( SURFACE-AT ?auto_15111 ?auto_15138 ) ( ON ?auto_15111 ?auto_15128 ) ( CLEAR ?auto_15111 ) ( not ( = ?auto_15112 ?auto_15111 ) ) ( not ( = ?auto_15112 ?auto_15128 ) ) ( not ( = ?auto_15111 ?auto_15128 ) ) ( not ( = ?auto_15121 ?auto_15135 ) ) ( IS-CRATE ?auto_15112 ) ( not ( = ?auto_15144 ?auto_15118 ) ) ( HOIST-AT ?auto_15142 ?auto_15144 ) ( SURFACE-AT ?auto_15112 ?auto_15144 ) ( ON ?auto_15112 ?auto_15127 ) ( CLEAR ?auto_15112 ) ( not ( = ?auto_15109 ?auto_15112 ) ) ( not ( = ?auto_15109 ?auto_15127 ) ) ( not ( = ?auto_15112 ?auto_15127 ) ) ( not ( = ?auto_15121 ?auto_15142 ) ) ( IS-CRATE ?auto_15109 ) ( AVAILABLE ?auto_15142 ) ( SURFACE-AT ?auto_15109 ?auto_15144 ) ( ON ?auto_15109 ?auto_15129 ) ( CLEAR ?auto_15109 ) ( not ( = ?auto_15108 ?auto_15109 ) ) ( not ( = ?auto_15108 ?auto_15129 ) ) ( not ( = ?auto_15109 ?auto_15129 ) ) ( IS-CRATE ?auto_15108 ) ( SURFACE-AT ?auto_15108 ?auto_15145 ) ( ON ?auto_15108 ?auto_15141 ) ( CLEAR ?auto_15108 ) ( not ( = ?auto_15107 ?auto_15108 ) ) ( not ( = ?auto_15107 ?auto_15141 ) ) ( not ( = ?auto_15108 ?auto_15141 ) ) ( IS-CRATE ?auto_15107 ) ( not ( = ?auto_15134 ?auto_15118 ) ) ( HOIST-AT ?auto_15136 ?auto_15134 ) ( AVAILABLE ?auto_15136 ) ( SURFACE-AT ?auto_15107 ?auto_15134 ) ( ON ?auto_15107 ?auto_15126 ) ( CLEAR ?auto_15107 ) ( not ( = ?auto_15106 ?auto_15107 ) ) ( not ( = ?auto_15106 ?auto_15126 ) ) ( not ( = ?auto_15107 ?auto_15126 ) ) ( not ( = ?auto_15121 ?auto_15136 ) ) ( IS-CRATE ?auto_15106 ) ( SURFACE-AT ?auto_15106 ?auto_15145 ) ( ON ?auto_15106 ?auto_15140 ) ( CLEAR ?auto_15106 ) ( not ( = ?auto_15105 ?auto_15106 ) ) ( not ( = ?auto_15105 ?auto_15140 ) ) ( not ( = ?auto_15106 ?auto_15140 ) ) ( SURFACE-AT ?auto_15104 ?auto_15118 ) ( CLEAR ?auto_15104 ) ( IS-CRATE ?auto_15105 ) ( AVAILABLE ?auto_15121 ) ( AVAILABLE ?auto_15123 ) ( SURFACE-AT ?auto_15105 ?auto_15145 ) ( ON ?auto_15105 ?auto_15124 ) ( CLEAR ?auto_15105 ) ( TRUCK-AT ?auto_15117 ?auto_15118 ) ( not ( = ?auto_15104 ?auto_15105 ) ) ( not ( = ?auto_15104 ?auto_15124 ) ) ( not ( = ?auto_15105 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15106 ) ) ( not ( = ?auto_15104 ?auto_15140 ) ) ( not ( = ?auto_15106 ?auto_15124 ) ) ( not ( = ?auto_15140 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15107 ) ) ( not ( = ?auto_15104 ?auto_15126 ) ) ( not ( = ?auto_15105 ?auto_15107 ) ) ( not ( = ?auto_15105 ?auto_15126 ) ) ( not ( = ?auto_15107 ?auto_15140 ) ) ( not ( = ?auto_15107 ?auto_15124 ) ) ( not ( = ?auto_15134 ?auto_15145 ) ) ( not ( = ?auto_15136 ?auto_15123 ) ) ( not ( = ?auto_15126 ?auto_15140 ) ) ( not ( = ?auto_15126 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15108 ) ) ( not ( = ?auto_15104 ?auto_15141 ) ) ( not ( = ?auto_15105 ?auto_15108 ) ) ( not ( = ?auto_15105 ?auto_15141 ) ) ( not ( = ?auto_15106 ?auto_15108 ) ) ( not ( = ?auto_15106 ?auto_15141 ) ) ( not ( = ?auto_15108 ?auto_15126 ) ) ( not ( = ?auto_15108 ?auto_15140 ) ) ( not ( = ?auto_15108 ?auto_15124 ) ) ( not ( = ?auto_15141 ?auto_15126 ) ) ( not ( = ?auto_15141 ?auto_15140 ) ) ( not ( = ?auto_15141 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15109 ) ) ( not ( = ?auto_15104 ?auto_15129 ) ) ( not ( = ?auto_15105 ?auto_15109 ) ) ( not ( = ?auto_15105 ?auto_15129 ) ) ( not ( = ?auto_15106 ?auto_15109 ) ) ( not ( = ?auto_15106 ?auto_15129 ) ) ( not ( = ?auto_15107 ?auto_15109 ) ) ( not ( = ?auto_15107 ?auto_15129 ) ) ( not ( = ?auto_15109 ?auto_15141 ) ) ( not ( = ?auto_15109 ?auto_15126 ) ) ( not ( = ?auto_15109 ?auto_15140 ) ) ( not ( = ?auto_15109 ?auto_15124 ) ) ( not ( = ?auto_15144 ?auto_15145 ) ) ( not ( = ?auto_15144 ?auto_15134 ) ) ( not ( = ?auto_15142 ?auto_15123 ) ) ( not ( = ?auto_15142 ?auto_15136 ) ) ( not ( = ?auto_15129 ?auto_15141 ) ) ( not ( = ?auto_15129 ?auto_15126 ) ) ( not ( = ?auto_15129 ?auto_15140 ) ) ( not ( = ?auto_15129 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15112 ) ) ( not ( = ?auto_15104 ?auto_15127 ) ) ( not ( = ?auto_15105 ?auto_15112 ) ) ( not ( = ?auto_15105 ?auto_15127 ) ) ( not ( = ?auto_15106 ?auto_15112 ) ) ( not ( = ?auto_15106 ?auto_15127 ) ) ( not ( = ?auto_15107 ?auto_15112 ) ) ( not ( = ?auto_15107 ?auto_15127 ) ) ( not ( = ?auto_15108 ?auto_15112 ) ) ( not ( = ?auto_15108 ?auto_15127 ) ) ( not ( = ?auto_15112 ?auto_15129 ) ) ( not ( = ?auto_15112 ?auto_15141 ) ) ( not ( = ?auto_15112 ?auto_15126 ) ) ( not ( = ?auto_15112 ?auto_15140 ) ) ( not ( = ?auto_15112 ?auto_15124 ) ) ( not ( = ?auto_15127 ?auto_15129 ) ) ( not ( = ?auto_15127 ?auto_15141 ) ) ( not ( = ?auto_15127 ?auto_15126 ) ) ( not ( = ?auto_15127 ?auto_15140 ) ) ( not ( = ?auto_15127 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15111 ) ) ( not ( = ?auto_15104 ?auto_15128 ) ) ( not ( = ?auto_15105 ?auto_15111 ) ) ( not ( = ?auto_15105 ?auto_15128 ) ) ( not ( = ?auto_15106 ?auto_15111 ) ) ( not ( = ?auto_15106 ?auto_15128 ) ) ( not ( = ?auto_15107 ?auto_15111 ) ) ( not ( = ?auto_15107 ?auto_15128 ) ) ( not ( = ?auto_15108 ?auto_15111 ) ) ( not ( = ?auto_15108 ?auto_15128 ) ) ( not ( = ?auto_15109 ?auto_15111 ) ) ( not ( = ?auto_15109 ?auto_15128 ) ) ( not ( = ?auto_15111 ?auto_15127 ) ) ( not ( = ?auto_15111 ?auto_15129 ) ) ( not ( = ?auto_15111 ?auto_15141 ) ) ( not ( = ?auto_15111 ?auto_15126 ) ) ( not ( = ?auto_15111 ?auto_15140 ) ) ( not ( = ?auto_15111 ?auto_15124 ) ) ( not ( = ?auto_15138 ?auto_15144 ) ) ( not ( = ?auto_15138 ?auto_15145 ) ) ( not ( = ?auto_15138 ?auto_15134 ) ) ( not ( = ?auto_15135 ?auto_15142 ) ) ( not ( = ?auto_15135 ?auto_15123 ) ) ( not ( = ?auto_15135 ?auto_15136 ) ) ( not ( = ?auto_15128 ?auto_15127 ) ) ( not ( = ?auto_15128 ?auto_15129 ) ) ( not ( = ?auto_15128 ?auto_15141 ) ) ( not ( = ?auto_15128 ?auto_15126 ) ) ( not ( = ?auto_15128 ?auto_15140 ) ) ( not ( = ?auto_15128 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15110 ) ) ( not ( = ?auto_15104 ?auto_15137 ) ) ( not ( = ?auto_15105 ?auto_15110 ) ) ( not ( = ?auto_15105 ?auto_15137 ) ) ( not ( = ?auto_15106 ?auto_15110 ) ) ( not ( = ?auto_15106 ?auto_15137 ) ) ( not ( = ?auto_15107 ?auto_15110 ) ) ( not ( = ?auto_15107 ?auto_15137 ) ) ( not ( = ?auto_15108 ?auto_15110 ) ) ( not ( = ?auto_15108 ?auto_15137 ) ) ( not ( = ?auto_15109 ?auto_15110 ) ) ( not ( = ?auto_15109 ?auto_15137 ) ) ( not ( = ?auto_15112 ?auto_15110 ) ) ( not ( = ?auto_15112 ?auto_15137 ) ) ( not ( = ?auto_15110 ?auto_15128 ) ) ( not ( = ?auto_15110 ?auto_15127 ) ) ( not ( = ?auto_15110 ?auto_15129 ) ) ( not ( = ?auto_15110 ?auto_15141 ) ) ( not ( = ?auto_15110 ?auto_15126 ) ) ( not ( = ?auto_15110 ?auto_15140 ) ) ( not ( = ?auto_15110 ?auto_15124 ) ) ( not ( = ?auto_15139 ?auto_15138 ) ) ( not ( = ?auto_15139 ?auto_15144 ) ) ( not ( = ?auto_15139 ?auto_15145 ) ) ( not ( = ?auto_15139 ?auto_15134 ) ) ( not ( = ?auto_15130 ?auto_15135 ) ) ( not ( = ?auto_15130 ?auto_15142 ) ) ( not ( = ?auto_15130 ?auto_15123 ) ) ( not ( = ?auto_15130 ?auto_15136 ) ) ( not ( = ?auto_15137 ?auto_15128 ) ) ( not ( = ?auto_15137 ?auto_15127 ) ) ( not ( = ?auto_15137 ?auto_15129 ) ) ( not ( = ?auto_15137 ?auto_15141 ) ) ( not ( = ?auto_15137 ?auto_15126 ) ) ( not ( = ?auto_15137 ?auto_15140 ) ) ( not ( = ?auto_15137 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15113 ) ) ( not ( = ?auto_15104 ?auto_15143 ) ) ( not ( = ?auto_15105 ?auto_15113 ) ) ( not ( = ?auto_15105 ?auto_15143 ) ) ( not ( = ?auto_15106 ?auto_15113 ) ) ( not ( = ?auto_15106 ?auto_15143 ) ) ( not ( = ?auto_15107 ?auto_15113 ) ) ( not ( = ?auto_15107 ?auto_15143 ) ) ( not ( = ?auto_15108 ?auto_15113 ) ) ( not ( = ?auto_15108 ?auto_15143 ) ) ( not ( = ?auto_15109 ?auto_15113 ) ) ( not ( = ?auto_15109 ?auto_15143 ) ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15112 ?auto_15143 ) ) ( not ( = ?auto_15111 ?auto_15113 ) ) ( not ( = ?auto_15111 ?auto_15143 ) ) ( not ( = ?auto_15113 ?auto_15137 ) ) ( not ( = ?auto_15113 ?auto_15128 ) ) ( not ( = ?auto_15113 ?auto_15127 ) ) ( not ( = ?auto_15113 ?auto_15129 ) ) ( not ( = ?auto_15113 ?auto_15141 ) ) ( not ( = ?auto_15113 ?auto_15126 ) ) ( not ( = ?auto_15113 ?auto_15140 ) ) ( not ( = ?auto_15113 ?auto_15124 ) ) ( not ( = ?auto_15143 ?auto_15137 ) ) ( not ( = ?auto_15143 ?auto_15128 ) ) ( not ( = ?auto_15143 ?auto_15127 ) ) ( not ( = ?auto_15143 ?auto_15129 ) ) ( not ( = ?auto_15143 ?auto_15141 ) ) ( not ( = ?auto_15143 ?auto_15126 ) ) ( not ( = ?auto_15143 ?auto_15140 ) ) ( not ( = ?auto_15143 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15115 ) ) ( not ( = ?auto_15104 ?auto_15125 ) ) ( not ( = ?auto_15105 ?auto_15115 ) ) ( not ( = ?auto_15105 ?auto_15125 ) ) ( not ( = ?auto_15106 ?auto_15115 ) ) ( not ( = ?auto_15106 ?auto_15125 ) ) ( not ( = ?auto_15107 ?auto_15115 ) ) ( not ( = ?auto_15107 ?auto_15125 ) ) ( not ( = ?auto_15108 ?auto_15115 ) ) ( not ( = ?auto_15108 ?auto_15125 ) ) ( not ( = ?auto_15109 ?auto_15115 ) ) ( not ( = ?auto_15109 ?auto_15125 ) ) ( not ( = ?auto_15112 ?auto_15115 ) ) ( not ( = ?auto_15112 ?auto_15125 ) ) ( not ( = ?auto_15111 ?auto_15115 ) ) ( not ( = ?auto_15111 ?auto_15125 ) ) ( not ( = ?auto_15110 ?auto_15115 ) ) ( not ( = ?auto_15110 ?auto_15125 ) ) ( not ( = ?auto_15115 ?auto_15143 ) ) ( not ( = ?auto_15115 ?auto_15137 ) ) ( not ( = ?auto_15115 ?auto_15128 ) ) ( not ( = ?auto_15115 ?auto_15127 ) ) ( not ( = ?auto_15115 ?auto_15129 ) ) ( not ( = ?auto_15115 ?auto_15141 ) ) ( not ( = ?auto_15115 ?auto_15126 ) ) ( not ( = ?auto_15115 ?auto_15140 ) ) ( not ( = ?auto_15115 ?auto_15124 ) ) ( not ( = ?auto_15119 ?auto_15145 ) ) ( not ( = ?auto_15119 ?auto_15139 ) ) ( not ( = ?auto_15119 ?auto_15138 ) ) ( not ( = ?auto_15119 ?auto_15144 ) ) ( not ( = ?auto_15119 ?auto_15134 ) ) ( not ( = ?auto_15120 ?auto_15123 ) ) ( not ( = ?auto_15120 ?auto_15130 ) ) ( not ( = ?auto_15120 ?auto_15135 ) ) ( not ( = ?auto_15120 ?auto_15142 ) ) ( not ( = ?auto_15120 ?auto_15136 ) ) ( not ( = ?auto_15125 ?auto_15143 ) ) ( not ( = ?auto_15125 ?auto_15137 ) ) ( not ( = ?auto_15125 ?auto_15128 ) ) ( not ( = ?auto_15125 ?auto_15127 ) ) ( not ( = ?auto_15125 ?auto_15129 ) ) ( not ( = ?auto_15125 ?auto_15141 ) ) ( not ( = ?auto_15125 ?auto_15126 ) ) ( not ( = ?auto_15125 ?auto_15140 ) ) ( not ( = ?auto_15125 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15114 ) ) ( not ( = ?auto_15104 ?auto_15133 ) ) ( not ( = ?auto_15105 ?auto_15114 ) ) ( not ( = ?auto_15105 ?auto_15133 ) ) ( not ( = ?auto_15106 ?auto_15114 ) ) ( not ( = ?auto_15106 ?auto_15133 ) ) ( not ( = ?auto_15107 ?auto_15114 ) ) ( not ( = ?auto_15107 ?auto_15133 ) ) ( not ( = ?auto_15108 ?auto_15114 ) ) ( not ( = ?auto_15108 ?auto_15133 ) ) ( not ( = ?auto_15109 ?auto_15114 ) ) ( not ( = ?auto_15109 ?auto_15133 ) ) ( not ( = ?auto_15112 ?auto_15114 ) ) ( not ( = ?auto_15112 ?auto_15133 ) ) ( not ( = ?auto_15111 ?auto_15114 ) ) ( not ( = ?auto_15111 ?auto_15133 ) ) ( not ( = ?auto_15110 ?auto_15114 ) ) ( not ( = ?auto_15110 ?auto_15133 ) ) ( not ( = ?auto_15113 ?auto_15114 ) ) ( not ( = ?auto_15113 ?auto_15133 ) ) ( not ( = ?auto_15114 ?auto_15125 ) ) ( not ( = ?auto_15114 ?auto_15143 ) ) ( not ( = ?auto_15114 ?auto_15137 ) ) ( not ( = ?auto_15114 ?auto_15128 ) ) ( not ( = ?auto_15114 ?auto_15127 ) ) ( not ( = ?auto_15114 ?auto_15129 ) ) ( not ( = ?auto_15114 ?auto_15141 ) ) ( not ( = ?auto_15114 ?auto_15126 ) ) ( not ( = ?auto_15114 ?auto_15140 ) ) ( not ( = ?auto_15114 ?auto_15124 ) ) ( not ( = ?auto_15132 ?auto_15119 ) ) ( not ( = ?auto_15132 ?auto_15145 ) ) ( not ( = ?auto_15132 ?auto_15139 ) ) ( not ( = ?auto_15132 ?auto_15138 ) ) ( not ( = ?auto_15132 ?auto_15144 ) ) ( not ( = ?auto_15132 ?auto_15134 ) ) ( not ( = ?auto_15131 ?auto_15120 ) ) ( not ( = ?auto_15131 ?auto_15123 ) ) ( not ( = ?auto_15131 ?auto_15130 ) ) ( not ( = ?auto_15131 ?auto_15135 ) ) ( not ( = ?auto_15131 ?auto_15142 ) ) ( not ( = ?auto_15131 ?auto_15136 ) ) ( not ( = ?auto_15133 ?auto_15125 ) ) ( not ( = ?auto_15133 ?auto_15143 ) ) ( not ( = ?auto_15133 ?auto_15137 ) ) ( not ( = ?auto_15133 ?auto_15128 ) ) ( not ( = ?auto_15133 ?auto_15127 ) ) ( not ( = ?auto_15133 ?auto_15129 ) ) ( not ( = ?auto_15133 ?auto_15141 ) ) ( not ( = ?auto_15133 ?auto_15126 ) ) ( not ( = ?auto_15133 ?auto_15140 ) ) ( not ( = ?auto_15133 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15116 ) ) ( not ( = ?auto_15104 ?auto_15122 ) ) ( not ( = ?auto_15105 ?auto_15116 ) ) ( not ( = ?auto_15105 ?auto_15122 ) ) ( not ( = ?auto_15106 ?auto_15116 ) ) ( not ( = ?auto_15106 ?auto_15122 ) ) ( not ( = ?auto_15107 ?auto_15116 ) ) ( not ( = ?auto_15107 ?auto_15122 ) ) ( not ( = ?auto_15108 ?auto_15116 ) ) ( not ( = ?auto_15108 ?auto_15122 ) ) ( not ( = ?auto_15109 ?auto_15116 ) ) ( not ( = ?auto_15109 ?auto_15122 ) ) ( not ( = ?auto_15112 ?auto_15116 ) ) ( not ( = ?auto_15112 ?auto_15122 ) ) ( not ( = ?auto_15111 ?auto_15116 ) ) ( not ( = ?auto_15111 ?auto_15122 ) ) ( not ( = ?auto_15110 ?auto_15116 ) ) ( not ( = ?auto_15110 ?auto_15122 ) ) ( not ( = ?auto_15113 ?auto_15116 ) ) ( not ( = ?auto_15113 ?auto_15122 ) ) ( not ( = ?auto_15115 ?auto_15116 ) ) ( not ( = ?auto_15115 ?auto_15122 ) ) ( not ( = ?auto_15116 ?auto_15133 ) ) ( not ( = ?auto_15116 ?auto_15125 ) ) ( not ( = ?auto_15116 ?auto_15143 ) ) ( not ( = ?auto_15116 ?auto_15137 ) ) ( not ( = ?auto_15116 ?auto_15128 ) ) ( not ( = ?auto_15116 ?auto_15127 ) ) ( not ( = ?auto_15116 ?auto_15129 ) ) ( not ( = ?auto_15116 ?auto_15141 ) ) ( not ( = ?auto_15116 ?auto_15126 ) ) ( not ( = ?auto_15116 ?auto_15140 ) ) ( not ( = ?auto_15116 ?auto_15124 ) ) ( not ( = ?auto_15122 ?auto_15133 ) ) ( not ( = ?auto_15122 ?auto_15125 ) ) ( not ( = ?auto_15122 ?auto_15143 ) ) ( not ( = ?auto_15122 ?auto_15137 ) ) ( not ( = ?auto_15122 ?auto_15128 ) ) ( not ( = ?auto_15122 ?auto_15127 ) ) ( not ( = ?auto_15122 ?auto_15129 ) ) ( not ( = ?auto_15122 ?auto_15141 ) ) ( not ( = ?auto_15122 ?auto_15126 ) ) ( not ( = ?auto_15122 ?auto_15140 ) ) ( not ( = ?auto_15122 ?auto_15124 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15104 ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15108 ?auto_15109 ?auto_15112 ?auto_15111 ?auto_15110 ?auto_15113 ?auto_15115 ?auto_15114 )
      ( MAKE-1CRATE ?auto_15114 ?auto_15116 )
      ( MAKE-12CRATE-VERIFY ?auto_15104 ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15108 ?auto_15109 ?auto_15112 ?auto_15111 ?auto_15110 ?auto_15113 ?auto_15115 ?auto_15114 ?auto_15116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15148 - SURFACE
      ?auto_15149 - SURFACE
    )
    :vars
    (
      ?auto_15150 - HOIST
      ?auto_15151 - PLACE
      ?auto_15153 - PLACE
      ?auto_15154 - HOIST
      ?auto_15155 - SURFACE
      ?auto_15152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15150 ?auto_15151 ) ( SURFACE-AT ?auto_15148 ?auto_15151 ) ( CLEAR ?auto_15148 ) ( IS-CRATE ?auto_15149 ) ( AVAILABLE ?auto_15150 ) ( not ( = ?auto_15153 ?auto_15151 ) ) ( HOIST-AT ?auto_15154 ?auto_15153 ) ( AVAILABLE ?auto_15154 ) ( SURFACE-AT ?auto_15149 ?auto_15153 ) ( ON ?auto_15149 ?auto_15155 ) ( CLEAR ?auto_15149 ) ( TRUCK-AT ?auto_15152 ?auto_15151 ) ( not ( = ?auto_15148 ?auto_15149 ) ) ( not ( = ?auto_15148 ?auto_15155 ) ) ( not ( = ?auto_15149 ?auto_15155 ) ) ( not ( = ?auto_15150 ?auto_15154 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15152 ?auto_15151 ?auto_15153 )
      ( !LIFT ?auto_15154 ?auto_15149 ?auto_15155 ?auto_15153 )
      ( !LOAD ?auto_15154 ?auto_15149 ?auto_15152 ?auto_15153 )
      ( !DRIVE ?auto_15152 ?auto_15153 ?auto_15151 )
      ( !UNLOAD ?auto_15150 ?auto_15149 ?auto_15152 ?auto_15151 )
      ( !DROP ?auto_15150 ?auto_15149 ?auto_15148 ?auto_15151 )
      ( MAKE-1CRATE-VERIFY ?auto_15148 ?auto_15149 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15170 - SURFACE
      ?auto_15171 - SURFACE
      ?auto_15172 - SURFACE
      ?auto_15173 - SURFACE
      ?auto_15174 - SURFACE
      ?auto_15175 - SURFACE
      ?auto_15178 - SURFACE
      ?auto_15177 - SURFACE
      ?auto_15176 - SURFACE
      ?auto_15179 - SURFACE
      ?auto_15181 - SURFACE
      ?auto_15180 - SURFACE
      ?auto_15182 - SURFACE
      ?auto_15183 - SURFACE
    )
    :vars
    (
      ?auto_15188 - HOIST
      ?auto_15184 - PLACE
      ?auto_15187 - PLACE
      ?auto_15189 - HOIST
      ?auto_15186 - SURFACE
      ?auto_15204 - PLACE
      ?auto_15191 - HOIST
      ?auto_15205 - SURFACE
      ?auto_15211 - PLACE
      ?auto_15199 - HOIST
      ?auto_15206 - SURFACE
      ?auto_15210 - SURFACE
      ?auto_15214 - PLACE
      ?auto_15202 - HOIST
      ?auto_15198 - SURFACE
      ?auto_15193 - PLACE
      ?auto_15212 - HOIST
      ?auto_15190 - SURFACE
      ?auto_15197 - PLACE
      ?auto_15192 - HOIST
      ?auto_15209 - SURFACE
      ?auto_15194 - PLACE
      ?auto_15215 - HOIST
      ?auto_15195 - SURFACE
      ?auto_15201 - SURFACE
      ?auto_15203 - SURFACE
      ?auto_15196 - PLACE
      ?auto_15207 - HOIST
      ?auto_15208 - SURFACE
      ?auto_15213 - SURFACE
      ?auto_15200 - SURFACE
      ?auto_15185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15188 ?auto_15184 ) ( IS-CRATE ?auto_15183 ) ( not ( = ?auto_15187 ?auto_15184 ) ) ( HOIST-AT ?auto_15189 ?auto_15187 ) ( AVAILABLE ?auto_15189 ) ( SURFACE-AT ?auto_15183 ?auto_15187 ) ( ON ?auto_15183 ?auto_15186 ) ( CLEAR ?auto_15183 ) ( not ( = ?auto_15182 ?auto_15183 ) ) ( not ( = ?auto_15182 ?auto_15186 ) ) ( not ( = ?auto_15183 ?auto_15186 ) ) ( not ( = ?auto_15188 ?auto_15189 ) ) ( IS-CRATE ?auto_15182 ) ( not ( = ?auto_15204 ?auto_15184 ) ) ( HOIST-AT ?auto_15191 ?auto_15204 ) ( SURFACE-AT ?auto_15182 ?auto_15204 ) ( ON ?auto_15182 ?auto_15205 ) ( CLEAR ?auto_15182 ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15180 ?auto_15205 ) ) ( not ( = ?auto_15182 ?auto_15205 ) ) ( not ( = ?auto_15188 ?auto_15191 ) ) ( IS-CRATE ?auto_15180 ) ( not ( = ?auto_15211 ?auto_15184 ) ) ( HOIST-AT ?auto_15199 ?auto_15211 ) ( AVAILABLE ?auto_15199 ) ( SURFACE-AT ?auto_15180 ?auto_15211 ) ( ON ?auto_15180 ?auto_15206 ) ( CLEAR ?auto_15180 ) ( not ( = ?auto_15181 ?auto_15180 ) ) ( not ( = ?auto_15181 ?auto_15206 ) ) ( not ( = ?auto_15180 ?auto_15206 ) ) ( not ( = ?auto_15188 ?auto_15199 ) ) ( IS-CRATE ?auto_15181 ) ( AVAILABLE ?auto_15191 ) ( SURFACE-AT ?auto_15181 ?auto_15204 ) ( ON ?auto_15181 ?auto_15210 ) ( CLEAR ?auto_15181 ) ( not ( = ?auto_15179 ?auto_15181 ) ) ( not ( = ?auto_15179 ?auto_15210 ) ) ( not ( = ?auto_15181 ?auto_15210 ) ) ( IS-CRATE ?auto_15179 ) ( not ( = ?auto_15214 ?auto_15184 ) ) ( HOIST-AT ?auto_15202 ?auto_15214 ) ( SURFACE-AT ?auto_15179 ?auto_15214 ) ( ON ?auto_15179 ?auto_15198 ) ( CLEAR ?auto_15179 ) ( not ( = ?auto_15176 ?auto_15179 ) ) ( not ( = ?auto_15176 ?auto_15198 ) ) ( not ( = ?auto_15179 ?auto_15198 ) ) ( not ( = ?auto_15188 ?auto_15202 ) ) ( IS-CRATE ?auto_15176 ) ( not ( = ?auto_15193 ?auto_15184 ) ) ( HOIST-AT ?auto_15212 ?auto_15193 ) ( AVAILABLE ?auto_15212 ) ( SURFACE-AT ?auto_15176 ?auto_15193 ) ( ON ?auto_15176 ?auto_15190 ) ( CLEAR ?auto_15176 ) ( not ( = ?auto_15177 ?auto_15176 ) ) ( not ( = ?auto_15177 ?auto_15190 ) ) ( not ( = ?auto_15176 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15212 ) ) ( IS-CRATE ?auto_15177 ) ( not ( = ?auto_15197 ?auto_15184 ) ) ( HOIST-AT ?auto_15192 ?auto_15197 ) ( AVAILABLE ?auto_15192 ) ( SURFACE-AT ?auto_15177 ?auto_15197 ) ( ON ?auto_15177 ?auto_15209 ) ( CLEAR ?auto_15177 ) ( not ( = ?auto_15178 ?auto_15177 ) ) ( not ( = ?auto_15178 ?auto_15209 ) ) ( not ( = ?auto_15177 ?auto_15209 ) ) ( not ( = ?auto_15188 ?auto_15192 ) ) ( IS-CRATE ?auto_15178 ) ( not ( = ?auto_15194 ?auto_15184 ) ) ( HOIST-AT ?auto_15215 ?auto_15194 ) ( SURFACE-AT ?auto_15178 ?auto_15194 ) ( ON ?auto_15178 ?auto_15195 ) ( CLEAR ?auto_15178 ) ( not ( = ?auto_15175 ?auto_15178 ) ) ( not ( = ?auto_15175 ?auto_15195 ) ) ( not ( = ?auto_15178 ?auto_15195 ) ) ( not ( = ?auto_15188 ?auto_15215 ) ) ( IS-CRATE ?auto_15175 ) ( AVAILABLE ?auto_15215 ) ( SURFACE-AT ?auto_15175 ?auto_15194 ) ( ON ?auto_15175 ?auto_15201 ) ( CLEAR ?auto_15175 ) ( not ( = ?auto_15174 ?auto_15175 ) ) ( not ( = ?auto_15174 ?auto_15201 ) ) ( not ( = ?auto_15175 ?auto_15201 ) ) ( IS-CRATE ?auto_15174 ) ( SURFACE-AT ?auto_15174 ?auto_15214 ) ( ON ?auto_15174 ?auto_15203 ) ( CLEAR ?auto_15174 ) ( not ( = ?auto_15173 ?auto_15174 ) ) ( not ( = ?auto_15173 ?auto_15203 ) ) ( not ( = ?auto_15174 ?auto_15203 ) ) ( IS-CRATE ?auto_15173 ) ( not ( = ?auto_15196 ?auto_15184 ) ) ( HOIST-AT ?auto_15207 ?auto_15196 ) ( AVAILABLE ?auto_15207 ) ( SURFACE-AT ?auto_15173 ?auto_15196 ) ( ON ?auto_15173 ?auto_15208 ) ( CLEAR ?auto_15173 ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( not ( = ?auto_15172 ?auto_15208 ) ) ( not ( = ?auto_15173 ?auto_15208 ) ) ( not ( = ?auto_15188 ?auto_15207 ) ) ( IS-CRATE ?auto_15172 ) ( SURFACE-AT ?auto_15172 ?auto_15214 ) ( ON ?auto_15172 ?auto_15213 ) ( CLEAR ?auto_15172 ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15171 ?auto_15213 ) ) ( not ( = ?auto_15172 ?auto_15213 ) ) ( SURFACE-AT ?auto_15170 ?auto_15184 ) ( CLEAR ?auto_15170 ) ( IS-CRATE ?auto_15171 ) ( AVAILABLE ?auto_15188 ) ( AVAILABLE ?auto_15202 ) ( SURFACE-AT ?auto_15171 ?auto_15214 ) ( ON ?auto_15171 ?auto_15200 ) ( CLEAR ?auto_15171 ) ( TRUCK-AT ?auto_15185 ?auto_15184 ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15170 ?auto_15200 ) ) ( not ( = ?auto_15171 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15172 ) ) ( not ( = ?auto_15170 ?auto_15213 ) ) ( not ( = ?auto_15172 ?auto_15200 ) ) ( not ( = ?auto_15213 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15173 ) ) ( not ( = ?auto_15170 ?auto_15208 ) ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15171 ?auto_15208 ) ) ( not ( = ?auto_15173 ?auto_15213 ) ) ( not ( = ?auto_15173 ?auto_15200 ) ) ( not ( = ?auto_15196 ?auto_15214 ) ) ( not ( = ?auto_15207 ?auto_15202 ) ) ( not ( = ?auto_15208 ?auto_15213 ) ) ( not ( = ?auto_15208 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15174 ) ) ( not ( = ?auto_15170 ?auto_15203 ) ) ( not ( = ?auto_15171 ?auto_15174 ) ) ( not ( = ?auto_15171 ?auto_15203 ) ) ( not ( = ?auto_15172 ?auto_15174 ) ) ( not ( = ?auto_15172 ?auto_15203 ) ) ( not ( = ?auto_15174 ?auto_15208 ) ) ( not ( = ?auto_15174 ?auto_15213 ) ) ( not ( = ?auto_15174 ?auto_15200 ) ) ( not ( = ?auto_15203 ?auto_15208 ) ) ( not ( = ?auto_15203 ?auto_15213 ) ) ( not ( = ?auto_15203 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15175 ) ) ( not ( = ?auto_15170 ?auto_15201 ) ) ( not ( = ?auto_15171 ?auto_15175 ) ) ( not ( = ?auto_15171 ?auto_15201 ) ) ( not ( = ?auto_15172 ?auto_15175 ) ) ( not ( = ?auto_15172 ?auto_15201 ) ) ( not ( = ?auto_15173 ?auto_15175 ) ) ( not ( = ?auto_15173 ?auto_15201 ) ) ( not ( = ?auto_15175 ?auto_15203 ) ) ( not ( = ?auto_15175 ?auto_15208 ) ) ( not ( = ?auto_15175 ?auto_15213 ) ) ( not ( = ?auto_15175 ?auto_15200 ) ) ( not ( = ?auto_15194 ?auto_15214 ) ) ( not ( = ?auto_15194 ?auto_15196 ) ) ( not ( = ?auto_15215 ?auto_15202 ) ) ( not ( = ?auto_15215 ?auto_15207 ) ) ( not ( = ?auto_15201 ?auto_15203 ) ) ( not ( = ?auto_15201 ?auto_15208 ) ) ( not ( = ?auto_15201 ?auto_15213 ) ) ( not ( = ?auto_15201 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15178 ) ) ( not ( = ?auto_15170 ?auto_15195 ) ) ( not ( = ?auto_15171 ?auto_15178 ) ) ( not ( = ?auto_15171 ?auto_15195 ) ) ( not ( = ?auto_15172 ?auto_15178 ) ) ( not ( = ?auto_15172 ?auto_15195 ) ) ( not ( = ?auto_15173 ?auto_15178 ) ) ( not ( = ?auto_15173 ?auto_15195 ) ) ( not ( = ?auto_15174 ?auto_15178 ) ) ( not ( = ?auto_15174 ?auto_15195 ) ) ( not ( = ?auto_15178 ?auto_15201 ) ) ( not ( = ?auto_15178 ?auto_15203 ) ) ( not ( = ?auto_15178 ?auto_15208 ) ) ( not ( = ?auto_15178 ?auto_15213 ) ) ( not ( = ?auto_15178 ?auto_15200 ) ) ( not ( = ?auto_15195 ?auto_15201 ) ) ( not ( = ?auto_15195 ?auto_15203 ) ) ( not ( = ?auto_15195 ?auto_15208 ) ) ( not ( = ?auto_15195 ?auto_15213 ) ) ( not ( = ?auto_15195 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15177 ) ) ( not ( = ?auto_15170 ?auto_15209 ) ) ( not ( = ?auto_15171 ?auto_15177 ) ) ( not ( = ?auto_15171 ?auto_15209 ) ) ( not ( = ?auto_15172 ?auto_15177 ) ) ( not ( = ?auto_15172 ?auto_15209 ) ) ( not ( = ?auto_15173 ?auto_15177 ) ) ( not ( = ?auto_15173 ?auto_15209 ) ) ( not ( = ?auto_15174 ?auto_15177 ) ) ( not ( = ?auto_15174 ?auto_15209 ) ) ( not ( = ?auto_15175 ?auto_15177 ) ) ( not ( = ?auto_15175 ?auto_15209 ) ) ( not ( = ?auto_15177 ?auto_15195 ) ) ( not ( = ?auto_15177 ?auto_15201 ) ) ( not ( = ?auto_15177 ?auto_15203 ) ) ( not ( = ?auto_15177 ?auto_15208 ) ) ( not ( = ?auto_15177 ?auto_15213 ) ) ( not ( = ?auto_15177 ?auto_15200 ) ) ( not ( = ?auto_15197 ?auto_15194 ) ) ( not ( = ?auto_15197 ?auto_15214 ) ) ( not ( = ?auto_15197 ?auto_15196 ) ) ( not ( = ?auto_15192 ?auto_15215 ) ) ( not ( = ?auto_15192 ?auto_15202 ) ) ( not ( = ?auto_15192 ?auto_15207 ) ) ( not ( = ?auto_15209 ?auto_15195 ) ) ( not ( = ?auto_15209 ?auto_15201 ) ) ( not ( = ?auto_15209 ?auto_15203 ) ) ( not ( = ?auto_15209 ?auto_15208 ) ) ( not ( = ?auto_15209 ?auto_15213 ) ) ( not ( = ?auto_15209 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15176 ) ) ( not ( = ?auto_15170 ?auto_15190 ) ) ( not ( = ?auto_15171 ?auto_15176 ) ) ( not ( = ?auto_15171 ?auto_15190 ) ) ( not ( = ?auto_15172 ?auto_15176 ) ) ( not ( = ?auto_15172 ?auto_15190 ) ) ( not ( = ?auto_15173 ?auto_15176 ) ) ( not ( = ?auto_15173 ?auto_15190 ) ) ( not ( = ?auto_15174 ?auto_15176 ) ) ( not ( = ?auto_15174 ?auto_15190 ) ) ( not ( = ?auto_15175 ?auto_15176 ) ) ( not ( = ?auto_15175 ?auto_15190 ) ) ( not ( = ?auto_15178 ?auto_15176 ) ) ( not ( = ?auto_15178 ?auto_15190 ) ) ( not ( = ?auto_15176 ?auto_15209 ) ) ( not ( = ?auto_15176 ?auto_15195 ) ) ( not ( = ?auto_15176 ?auto_15201 ) ) ( not ( = ?auto_15176 ?auto_15203 ) ) ( not ( = ?auto_15176 ?auto_15208 ) ) ( not ( = ?auto_15176 ?auto_15213 ) ) ( not ( = ?auto_15176 ?auto_15200 ) ) ( not ( = ?auto_15193 ?auto_15197 ) ) ( not ( = ?auto_15193 ?auto_15194 ) ) ( not ( = ?auto_15193 ?auto_15214 ) ) ( not ( = ?auto_15193 ?auto_15196 ) ) ( not ( = ?auto_15212 ?auto_15192 ) ) ( not ( = ?auto_15212 ?auto_15215 ) ) ( not ( = ?auto_15212 ?auto_15202 ) ) ( not ( = ?auto_15212 ?auto_15207 ) ) ( not ( = ?auto_15190 ?auto_15209 ) ) ( not ( = ?auto_15190 ?auto_15195 ) ) ( not ( = ?auto_15190 ?auto_15201 ) ) ( not ( = ?auto_15190 ?auto_15203 ) ) ( not ( = ?auto_15190 ?auto_15208 ) ) ( not ( = ?auto_15190 ?auto_15213 ) ) ( not ( = ?auto_15190 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15179 ) ) ( not ( = ?auto_15170 ?auto_15198 ) ) ( not ( = ?auto_15171 ?auto_15179 ) ) ( not ( = ?auto_15171 ?auto_15198 ) ) ( not ( = ?auto_15172 ?auto_15179 ) ) ( not ( = ?auto_15172 ?auto_15198 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15198 ) ) ( not ( = ?auto_15174 ?auto_15179 ) ) ( not ( = ?auto_15174 ?auto_15198 ) ) ( not ( = ?auto_15175 ?auto_15179 ) ) ( not ( = ?auto_15175 ?auto_15198 ) ) ( not ( = ?auto_15178 ?auto_15179 ) ) ( not ( = ?auto_15178 ?auto_15198 ) ) ( not ( = ?auto_15177 ?auto_15179 ) ) ( not ( = ?auto_15177 ?auto_15198 ) ) ( not ( = ?auto_15179 ?auto_15190 ) ) ( not ( = ?auto_15179 ?auto_15209 ) ) ( not ( = ?auto_15179 ?auto_15195 ) ) ( not ( = ?auto_15179 ?auto_15201 ) ) ( not ( = ?auto_15179 ?auto_15203 ) ) ( not ( = ?auto_15179 ?auto_15208 ) ) ( not ( = ?auto_15179 ?auto_15213 ) ) ( not ( = ?auto_15179 ?auto_15200 ) ) ( not ( = ?auto_15198 ?auto_15190 ) ) ( not ( = ?auto_15198 ?auto_15209 ) ) ( not ( = ?auto_15198 ?auto_15195 ) ) ( not ( = ?auto_15198 ?auto_15201 ) ) ( not ( = ?auto_15198 ?auto_15203 ) ) ( not ( = ?auto_15198 ?auto_15208 ) ) ( not ( = ?auto_15198 ?auto_15213 ) ) ( not ( = ?auto_15198 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15181 ) ) ( not ( = ?auto_15170 ?auto_15210 ) ) ( not ( = ?auto_15171 ?auto_15181 ) ) ( not ( = ?auto_15171 ?auto_15210 ) ) ( not ( = ?auto_15172 ?auto_15181 ) ) ( not ( = ?auto_15172 ?auto_15210 ) ) ( not ( = ?auto_15173 ?auto_15181 ) ) ( not ( = ?auto_15173 ?auto_15210 ) ) ( not ( = ?auto_15174 ?auto_15181 ) ) ( not ( = ?auto_15174 ?auto_15210 ) ) ( not ( = ?auto_15175 ?auto_15181 ) ) ( not ( = ?auto_15175 ?auto_15210 ) ) ( not ( = ?auto_15178 ?auto_15181 ) ) ( not ( = ?auto_15178 ?auto_15210 ) ) ( not ( = ?auto_15177 ?auto_15181 ) ) ( not ( = ?auto_15177 ?auto_15210 ) ) ( not ( = ?auto_15176 ?auto_15181 ) ) ( not ( = ?auto_15176 ?auto_15210 ) ) ( not ( = ?auto_15181 ?auto_15198 ) ) ( not ( = ?auto_15181 ?auto_15190 ) ) ( not ( = ?auto_15181 ?auto_15209 ) ) ( not ( = ?auto_15181 ?auto_15195 ) ) ( not ( = ?auto_15181 ?auto_15201 ) ) ( not ( = ?auto_15181 ?auto_15203 ) ) ( not ( = ?auto_15181 ?auto_15208 ) ) ( not ( = ?auto_15181 ?auto_15213 ) ) ( not ( = ?auto_15181 ?auto_15200 ) ) ( not ( = ?auto_15204 ?auto_15214 ) ) ( not ( = ?auto_15204 ?auto_15193 ) ) ( not ( = ?auto_15204 ?auto_15197 ) ) ( not ( = ?auto_15204 ?auto_15194 ) ) ( not ( = ?auto_15204 ?auto_15196 ) ) ( not ( = ?auto_15191 ?auto_15202 ) ) ( not ( = ?auto_15191 ?auto_15212 ) ) ( not ( = ?auto_15191 ?auto_15192 ) ) ( not ( = ?auto_15191 ?auto_15215 ) ) ( not ( = ?auto_15191 ?auto_15207 ) ) ( not ( = ?auto_15210 ?auto_15198 ) ) ( not ( = ?auto_15210 ?auto_15190 ) ) ( not ( = ?auto_15210 ?auto_15209 ) ) ( not ( = ?auto_15210 ?auto_15195 ) ) ( not ( = ?auto_15210 ?auto_15201 ) ) ( not ( = ?auto_15210 ?auto_15203 ) ) ( not ( = ?auto_15210 ?auto_15208 ) ) ( not ( = ?auto_15210 ?auto_15213 ) ) ( not ( = ?auto_15210 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15180 ) ) ( not ( = ?auto_15170 ?auto_15206 ) ) ( not ( = ?auto_15171 ?auto_15180 ) ) ( not ( = ?auto_15171 ?auto_15206 ) ) ( not ( = ?auto_15172 ?auto_15180 ) ) ( not ( = ?auto_15172 ?auto_15206 ) ) ( not ( = ?auto_15173 ?auto_15180 ) ) ( not ( = ?auto_15173 ?auto_15206 ) ) ( not ( = ?auto_15174 ?auto_15180 ) ) ( not ( = ?auto_15174 ?auto_15206 ) ) ( not ( = ?auto_15175 ?auto_15180 ) ) ( not ( = ?auto_15175 ?auto_15206 ) ) ( not ( = ?auto_15178 ?auto_15180 ) ) ( not ( = ?auto_15178 ?auto_15206 ) ) ( not ( = ?auto_15177 ?auto_15180 ) ) ( not ( = ?auto_15177 ?auto_15206 ) ) ( not ( = ?auto_15176 ?auto_15180 ) ) ( not ( = ?auto_15176 ?auto_15206 ) ) ( not ( = ?auto_15179 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15206 ) ) ( not ( = ?auto_15180 ?auto_15210 ) ) ( not ( = ?auto_15180 ?auto_15198 ) ) ( not ( = ?auto_15180 ?auto_15190 ) ) ( not ( = ?auto_15180 ?auto_15209 ) ) ( not ( = ?auto_15180 ?auto_15195 ) ) ( not ( = ?auto_15180 ?auto_15201 ) ) ( not ( = ?auto_15180 ?auto_15203 ) ) ( not ( = ?auto_15180 ?auto_15208 ) ) ( not ( = ?auto_15180 ?auto_15213 ) ) ( not ( = ?auto_15180 ?auto_15200 ) ) ( not ( = ?auto_15211 ?auto_15204 ) ) ( not ( = ?auto_15211 ?auto_15214 ) ) ( not ( = ?auto_15211 ?auto_15193 ) ) ( not ( = ?auto_15211 ?auto_15197 ) ) ( not ( = ?auto_15211 ?auto_15194 ) ) ( not ( = ?auto_15211 ?auto_15196 ) ) ( not ( = ?auto_15199 ?auto_15191 ) ) ( not ( = ?auto_15199 ?auto_15202 ) ) ( not ( = ?auto_15199 ?auto_15212 ) ) ( not ( = ?auto_15199 ?auto_15192 ) ) ( not ( = ?auto_15199 ?auto_15215 ) ) ( not ( = ?auto_15199 ?auto_15207 ) ) ( not ( = ?auto_15206 ?auto_15210 ) ) ( not ( = ?auto_15206 ?auto_15198 ) ) ( not ( = ?auto_15206 ?auto_15190 ) ) ( not ( = ?auto_15206 ?auto_15209 ) ) ( not ( = ?auto_15206 ?auto_15195 ) ) ( not ( = ?auto_15206 ?auto_15201 ) ) ( not ( = ?auto_15206 ?auto_15203 ) ) ( not ( = ?auto_15206 ?auto_15208 ) ) ( not ( = ?auto_15206 ?auto_15213 ) ) ( not ( = ?auto_15206 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15182 ) ) ( not ( = ?auto_15170 ?auto_15205 ) ) ( not ( = ?auto_15171 ?auto_15182 ) ) ( not ( = ?auto_15171 ?auto_15205 ) ) ( not ( = ?auto_15172 ?auto_15182 ) ) ( not ( = ?auto_15172 ?auto_15205 ) ) ( not ( = ?auto_15173 ?auto_15182 ) ) ( not ( = ?auto_15173 ?auto_15205 ) ) ( not ( = ?auto_15174 ?auto_15182 ) ) ( not ( = ?auto_15174 ?auto_15205 ) ) ( not ( = ?auto_15175 ?auto_15182 ) ) ( not ( = ?auto_15175 ?auto_15205 ) ) ( not ( = ?auto_15178 ?auto_15182 ) ) ( not ( = ?auto_15178 ?auto_15205 ) ) ( not ( = ?auto_15177 ?auto_15182 ) ) ( not ( = ?auto_15177 ?auto_15205 ) ) ( not ( = ?auto_15176 ?auto_15182 ) ) ( not ( = ?auto_15176 ?auto_15205 ) ) ( not ( = ?auto_15179 ?auto_15182 ) ) ( not ( = ?auto_15179 ?auto_15205 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15205 ) ) ( not ( = ?auto_15182 ?auto_15206 ) ) ( not ( = ?auto_15182 ?auto_15210 ) ) ( not ( = ?auto_15182 ?auto_15198 ) ) ( not ( = ?auto_15182 ?auto_15190 ) ) ( not ( = ?auto_15182 ?auto_15209 ) ) ( not ( = ?auto_15182 ?auto_15195 ) ) ( not ( = ?auto_15182 ?auto_15201 ) ) ( not ( = ?auto_15182 ?auto_15203 ) ) ( not ( = ?auto_15182 ?auto_15208 ) ) ( not ( = ?auto_15182 ?auto_15213 ) ) ( not ( = ?auto_15182 ?auto_15200 ) ) ( not ( = ?auto_15205 ?auto_15206 ) ) ( not ( = ?auto_15205 ?auto_15210 ) ) ( not ( = ?auto_15205 ?auto_15198 ) ) ( not ( = ?auto_15205 ?auto_15190 ) ) ( not ( = ?auto_15205 ?auto_15209 ) ) ( not ( = ?auto_15205 ?auto_15195 ) ) ( not ( = ?auto_15205 ?auto_15201 ) ) ( not ( = ?auto_15205 ?auto_15203 ) ) ( not ( = ?auto_15205 ?auto_15208 ) ) ( not ( = ?auto_15205 ?auto_15213 ) ) ( not ( = ?auto_15205 ?auto_15200 ) ) ( not ( = ?auto_15170 ?auto_15183 ) ) ( not ( = ?auto_15170 ?auto_15186 ) ) ( not ( = ?auto_15171 ?auto_15183 ) ) ( not ( = ?auto_15171 ?auto_15186 ) ) ( not ( = ?auto_15172 ?auto_15183 ) ) ( not ( = ?auto_15172 ?auto_15186 ) ) ( not ( = ?auto_15173 ?auto_15183 ) ) ( not ( = ?auto_15173 ?auto_15186 ) ) ( not ( = ?auto_15174 ?auto_15183 ) ) ( not ( = ?auto_15174 ?auto_15186 ) ) ( not ( = ?auto_15175 ?auto_15183 ) ) ( not ( = ?auto_15175 ?auto_15186 ) ) ( not ( = ?auto_15178 ?auto_15183 ) ) ( not ( = ?auto_15178 ?auto_15186 ) ) ( not ( = ?auto_15177 ?auto_15183 ) ) ( not ( = ?auto_15177 ?auto_15186 ) ) ( not ( = ?auto_15176 ?auto_15183 ) ) ( not ( = ?auto_15176 ?auto_15186 ) ) ( not ( = ?auto_15179 ?auto_15183 ) ) ( not ( = ?auto_15179 ?auto_15186 ) ) ( not ( = ?auto_15181 ?auto_15183 ) ) ( not ( = ?auto_15181 ?auto_15186 ) ) ( not ( = ?auto_15180 ?auto_15183 ) ) ( not ( = ?auto_15180 ?auto_15186 ) ) ( not ( = ?auto_15183 ?auto_15205 ) ) ( not ( = ?auto_15183 ?auto_15206 ) ) ( not ( = ?auto_15183 ?auto_15210 ) ) ( not ( = ?auto_15183 ?auto_15198 ) ) ( not ( = ?auto_15183 ?auto_15190 ) ) ( not ( = ?auto_15183 ?auto_15209 ) ) ( not ( = ?auto_15183 ?auto_15195 ) ) ( not ( = ?auto_15183 ?auto_15201 ) ) ( not ( = ?auto_15183 ?auto_15203 ) ) ( not ( = ?auto_15183 ?auto_15208 ) ) ( not ( = ?auto_15183 ?auto_15213 ) ) ( not ( = ?auto_15183 ?auto_15200 ) ) ( not ( = ?auto_15187 ?auto_15204 ) ) ( not ( = ?auto_15187 ?auto_15211 ) ) ( not ( = ?auto_15187 ?auto_15214 ) ) ( not ( = ?auto_15187 ?auto_15193 ) ) ( not ( = ?auto_15187 ?auto_15197 ) ) ( not ( = ?auto_15187 ?auto_15194 ) ) ( not ( = ?auto_15187 ?auto_15196 ) ) ( not ( = ?auto_15189 ?auto_15191 ) ) ( not ( = ?auto_15189 ?auto_15199 ) ) ( not ( = ?auto_15189 ?auto_15202 ) ) ( not ( = ?auto_15189 ?auto_15212 ) ) ( not ( = ?auto_15189 ?auto_15192 ) ) ( not ( = ?auto_15189 ?auto_15215 ) ) ( not ( = ?auto_15189 ?auto_15207 ) ) ( not ( = ?auto_15186 ?auto_15205 ) ) ( not ( = ?auto_15186 ?auto_15206 ) ) ( not ( = ?auto_15186 ?auto_15210 ) ) ( not ( = ?auto_15186 ?auto_15198 ) ) ( not ( = ?auto_15186 ?auto_15190 ) ) ( not ( = ?auto_15186 ?auto_15209 ) ) ( not ( = ?auto_15186 ?auto_15195 ) ) ( not ( = ?auto_15186 ?auto_15201 ) ) ( not ( = ?auto_15186 ?auto_15203 ) ) ( not ( = ?auto_15186 ?auto_15208 ) ) ( not ( = ?auto_15186 ?auto_15213 ) ) ( not ( = ?auto_15186 ?auto_15200 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15170 ?auto_15171 ?auto_15172 ?auto_15173 ?auto_15174 ?auto_15175 ?auto_15178 ?auto_15177 ?auto_15176 ?auto_15179 ?auto_15181 ?auto_15180 ?auto_15182 )
      ( MAKE-1CRATE ?auto_15182 ?auto_15183 )
      ( MAKE-13CRATE-VERIFY ?auto_15170 ?auto_15171 ?auto_15172 ?auto_15173 ?auto_15174 ?auto_15175 ?auto_15178 ?auto_15177 ?auto_15176 ?auto_15179 ?auto_15181 ?auto_15180 ?auto_15182 ?auto_15183 ) )
  )

)

