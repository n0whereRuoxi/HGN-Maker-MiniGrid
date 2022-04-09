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
      ?auto_14677 - PLACE
      ?auto_14676 - HOIST
      ?auto_14678 - SURFACE
      ?auto_14682 - SURFACE
      ?auto_14681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14679 ?auto_14680 ) ( IS-CRATE ?auto_14675 ) ( not ( = ?auto_14677 ?auto_14680 ) ) ( HOIST-AT ?auto_14676 ?auto_14677 ) ( SURFACE-AT ?auto_14675 ?auto_14677 ) ( ON ?auto_14675 ?auto_14678 ) ( CLEAR ?auto_14675 ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14674 ?auto_14678 ) ) ( not ( = ?auto_14675 ?auto_14678 ) ) ( not ( = ?auto_14679 ?auto_14676 ) ) ( SURFACE-AT ?auto_14673 ?auto_14680 ) ( CLEAR ?auto_14673 ) ( IS-CRATE ?auto_14674 ) ( AVAILABLE ?auto_14679 ) ( AVAILABLE ?auto_14676 ) ( SURFACE-AT ?auto_14674 ?auto_14677 ) ( ON ?auto_14674 ?auto_14682 ) ( CLEAR ?auto_14674 ) ( TRUCK-AT ?auto_14681 ?auto_14680 ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14682 ) ) ( not ( = ?auto_14674 ?auto_14682 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14678 ) ) ( not ( = ?auto_14675 ?auto_14682 ) ) ( not ( = ?auto_14678 ?auto_14682 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14673 ?auto_14674 )
      ( MAKE-1CRATE ?auto_14674 ?auto_14675 )
      ( MAKE-2CRATE-VERIFY ?auto_14673 ?auto_14674 ?auto_14675 ) )
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
      ?auto_14704 - HOIST
      ?auto_14706 - PLACE
      ?auto_14703 - PLACE
      ?auto_14705 - HOIST
      ?auto_14702 - SURFACE
      ?auto_14707 - PLACE
      ?auto_14708 - HOIST
      ?auto_14709 - SURFACE
      ?auto_14710 - SURFACE
      ?auto_14701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14704 ?auto_14706 ) ( IS-CRATE ?auto_14700 ) ( not ( = ?auto_14703 ?auto_14706 ) ) ( HOIST-AT ?auto_14705 ?auto_14703 ) ( AVAILABLE ?auto_14705 ) ( SURFACE-AT ?auto_14700 ?auto_14703 ) ( ON ?auto_14700 ?auto_14702 ) ( CLEAR ?auto_14700 ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( not ( = ?auto_14699 ?auto_14702 ) ) ( not ( = ?auto_14700 ?auto_14702 ) ) ( not ( = ?auto_14704 ?auto_14705 ) ) ( IS-CRATE ?auto_14699 ) ( not ( = ?auto_14707 ?auto_14706 ) ) ( HOIST-AT ?auto_14708 ?auto_14707 ) ( SURFACE-AT ?auto_14699 ?auto_14707 ) ( ON ?auto_14699 ?auto_14709 ) ( CLEAR ?auto_14699 ) ( not ( = ?auto_14698 ?auto_14699 ) ) ( not ( = ?auto_14698 ?auto_14709 ) ) ( not ( = ?auto_14699 ?auto_14709 ) ) ( not ( = ?auto_14704 ?auto_14708 ) ) ( SURFACE-AT ?auto_14697 ?auto_14706 ) ( CLEAR ?auto_14697 ) ( IS-CRATE ?auto_14698 ) ( AVAILABLE ?auto_14704 ) ( AVAILABLE ?auto_14708 ) ( SURFACE-AT ?auto_14698 ?auto_14707 ) ( ON ?auto_14698 ?auto_14710 ) ( CLEAR ?auto_14698 ) ( TRUCK-AT ?auto_14701 ?auto_14706 ) ( not ( = ?auto_14697 ?auto_14698 ) ) ( not ( = ?auto_14697 ?auto_14710 ) ) ( not ( = ?auto_14698 ?auto_14710 ) ) ( not ( = ?auto_14697 ?auto_14699 ) ) ( not ( = ?auto_14697 ?auto_14709 ) ) ( not ( = ?auto_14699 ?auto_14710 ) ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( not ( = ?auto_14697 ?auto_14700 ) ) ( not ( = ?auto_14697 ?auto_14702 ) ) ( not ( = ?auto_14698 ?auto_14700 ) ) ( not ( = ?auto_14698 ?auto_14702 ) ) ( not ( = ?auto_14700 ?auto_14709 ) ) ( not ( = ?auto_14700 ?auto_14710 ) ) ( not ( = ?auto_14703 ?auto_14707 ) ) ( not ( = ?auto_14705 ?auto_14708 ) ) ( not ( = ?auto_14702 ?auto_14709 ) ) ( not ( = ?auto_14702 ?auto_14710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14697 ?auto_14698 ?auto_14699 )
      ( MAKE-1CRATE ?auto_14699 ?auto_14700 )
      ( MAKE-3CRATE-VERIFY ?auto_14697 ?auto_14698 ?auto_14699 ?auto_14700 ) )
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
      ?auto_14735 - PLACE
      ?auto_14734 - PLACE
      ?auto_14733 - HOIST
      ?auto_14732 - SURFACE
      ?auto_14737 - PLACE
      ?auto_14741 - HOIST
      ?auto_14740 - SURFACE
      ?auto_14739 - SURFACE
      ?auto_14738 - SURFACE
      ?auto_14736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14731 ?auto_14735 ) ( IS-CRATE ?auto_14730 ) ( not ( = ?auto_14734 ?auto_14735 ) ) ( HOIST-AT ?auto_14733 ?auto_14734 ) ( SURFACE-AT ?auto_14730 ?auto_14734 ) ( ON ?auto_14730 ?auto_14732 ) ( CLEAR ?auto_14730 ) ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14729 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14731 ?auto_14733 ) ) ( IS-CRATE ?auto_14729 ) ( not ( = ?auto_14737 ?auto_14735 ) ) ( HOIST-AT ?auto_14741 ?auto_14737 ) ( AVAILABLE ?auto_14741 ) ( SURFACE-AT ?auto_14729 ?auto_14737 ) ( ON ?auto_14729 ?auto_14740 ) ( CLEAR ?auto_14729 ) ( not ( = ?auto_14728 ?auto_14729 ) ) ( not ( = ?auto_14728 ?auto_14740 ) ) ( not ( = ?auto_14729 ?auto_14740 ) ) ( not ( = ?auto_14731 ?auto_14741 ) ) ( IS-CRATE ?auto_14728 ) ( SURFACE-AT ?auto_14728 ?auto_14734 ) ( ON ?auto_14728 ?auto_14739 ) ( CLEAR ?auto_14728 ) ( not ( = ?auto_14727 ?auto_14728 ) ) ( not ( = ?auto_14727 ?auto_14739 ) ) ( not ( = ?auto_14728 ?auto_14739 ) ) ( SURFACE-AT ?auto_14726 ?auto_14735 ) ( CLEAR ?auto_14726 ) ( IS-CRATE ?auto_14727 ) ( AVAILABLE ?auto_14731 ) ( AVAILABLE ?auto_14733 ) ( SURFACE-AT ?auto_14727 ?auto_14734 ) ( ON ?auto_14727 ?auto_14738 ) ( CLEAR ?auto_14727 ) ( TRUCK-AT ?auto_14736 ?auto_14735 ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14738 ) ) ( not ( = ?auto_14727 ?auto_14738 ) ) ( not ( = ?auto_14726 ?auto_14728 ) ) ( not ( = ?auto_14726 ?auto_14739 ) ) ( not ( = ?auto_14728 ?auto_14738 ) ) ( not ( = ?auto_14739 ?auto_14738 ) ) ( not ( = ?auto_14726 ?auto_14729 ) ) ( not ( = ?auto_14726 ?auto_14740 ) ) ( not ( = ?auto_14727 ?auto_14729 ) ) ( not ( = ?auto_14727 ?auto_14740 ) ) ( not ( = ?auto_14729 ?auto_14739 ) ) ( not ( = ?auto_14729 ?auto_14738 ) ) ( not ( = ?auto_14737 ?auto_14734 ) ) ( not ( = ?auto_14741 ?auto_14733 ) ) ( not ( = ?auto_14740 ?auto_14739 ) ) ( not ( = ?auto_14740 ?auto_14738 ) ) ( not ( = ?auto_14726 ?auto_14730 ) ) ( not ( = ?auto_14726 ?auto_14732 ) ) ( not ( = ?auto_14727 ?auto_14730 ) ) ( not ( = ?auto_14727 ?auto_14732 ) ) ( not ( = ?auto_14728 ?auto_14730 ) ) ( not ( = ?auto_14728 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14740 ) ) ( not ( = ?auto_14730 ?auto_14739 ) ) ( not ( = ?auto_14730 ?auto_14738 ) ) ( not ( = ?auto_14732 ?auto_14740 ) ) ( not ( = ?auto_14732 ?auto_14739 ) ) ( not ( = ?auto_14732 ?auto_14738 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14726 ?auto_14727 ?auto_14728 ?auto_14729 )
      ( MAKE-1CRATE ?auto_14729 ?auto_14730 )
      ( MAKE-4CRATE-VERIFY ?auto_14726 ?auto_14727 ?auto_14728 ?auto_14729 ?auto_14730 ) )
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
      ?auto_14767 - HOIST
      ?auto_14769 - PLACE
      ?auto_14768 - PLACE
      ?auto_14765 - HOIST
      ?auto_14766 - SURFACE
      ?auto_14771 - PLACE
      ?auto_14775 - HOIST
      ?auto_14777 - SURFACE
      ?auto_14770 - PLACE
      ?auto_14773 - HOIST
      ?auto_14772 - SURFACE
      ?auto_14776 - SURFACE
      ?auto_14774 - SURFACE
      ?auto_14764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14767 ?auto_14769 ) ( IS-CRATE ?auto_14763 ) ( not ( = ?auto_14768 ?auto_14769 ) ) ( HOIST-AT ?auto_14765 ?auto_14768 ) ( AVAILABLE ?auto_14765 ) ( SURFACE-AT ?auto_14763 ?auto_14768 ) ( ON ?auto_14763 ?auto_14766 ) ( CLEAR ?auto_14763 ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14762 ?auto_14766 ) ) ( not ( = ?auto_14763 ?auto_14766 ) ) ( not ( = ?auto_14767 ?auto_14765 ) ) ( IS-CRATE ?auto_14762 ) ( not ( = ?auto_14771 ?auto_14769 ) ) ( HOIST-AT ?auto_14775 ?auto_14771 ) ( SURFACE-AT ?auto_14762 ?auto_14771 ) ( ON ?auto_14762 ?auto_14777 ) ( CLEAR ?auto_14762 ) ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14777 ) ) ( not ( = ?auto_14762 ?auto_14777 ) ) ( not ( = ?auto_14767 ?auto_14775 ) ) ( IS-CRATE ?auto_14761 ) ( not ( = ?auto_14770 ?auto_14769 ) ) ( HOIST-AT ?auto_14773 ?auto_14770 ) ( AVAILABLE ?auto_14773 ) ( SURFACE-AT ?auto_14761 ?auto_14770 ) ( ON ?auto_14761 ?auto_14772 ) ( CLEAR ?auto_14761 ) ( not ( = ?auto_14760 ?auto_14761 ) ) ( not ( = ?auto_14760 ?auto_14772 ) ) ( not ( = ?auto_14761 ?auto_14772 ) ) ( not ( = ?auto_14767 ?auto_14773 ) ) ( IS-CRATE ?auto_14760 ) ( SURFACE-AT ?auto_14760 ?auto_14771 ) ( ON ?auto_14760 ?auto_14776 ) ( CLEAR ?auto_14760 ) ( not ( = ?auto_14759 ?auto_14760 ) ) ( not ( = ?auto_14759 ?auto_14776 ) ) ( not ( = ?auto_14760 ?auto_14776 ) ) ( SURFACE-AT ?auto_14758 ?auto_14769 ) ( CLEAR ?auto_14758 ) ( IS-CRATE ?auto_14759 ) ( AVAILABLE ?auto_14767 ) ( AVAILABLE ?auto_14775 ) ( SURFACE-AT ?auto_14759 ?auto_14771 ) ( ON ?auto_14759 ?auto_14774 ) ( CLEAR ?auto_14759 ) ( TRUCK-AT ?auto_14764 ?auto_14769 ) ( not ( = ?auto_14758 ?auto_14759 ) ) ( not ( = ?auto_14758 ?auto_14774 ) ) ( not ( = ?auto_14759 ?auto_14774 ) ) ( not ( = ?auto_14758 ?auto_14760 ) ) ( not ( = ?auto_14758 ?auto_14776 ) ) ( not ( = ?auto_14760 ?auto_14774 ) ) ( not ( = ?auto_14776 ?auto_14774 ) ) ( not ( = ?auto_14758 ?auto_14761 ) ) ( not ( = ?auto_14758 ?auto_14772 ) ) ( not ( = ?auto_14759 ?auto_14761 ) ) ( not ( = ?auto_14759 ?auto_14772 ) ) ( not ( = ?auto_14761 ?auto_14776 ) ) ( not ( = ?auto_14761 ?auto_14774 ) ) ( not ( = ?auto_14770 ?auto_14771 ) ) ( not ( = ?auto_14773 ?auto_14775 ) ) ( not ( = ?auto_14772 ?auto_14776 ) ) ( not ( = ?auto_14772 ?auto_14774 ) ) ( not ( = ?auto_14758 ?auto_14762 ) ) ( not ( = ?auto_14758 ?auto_14777 ) ) ( not ( = ?auto_14759 ?auto_14762 ) ) ( not ( = ?auto_14759 ?auto_14777 ) ) ( not ( = ?auto_14760 ?auto_14762 ) ) ( not ( = ?auto_14760 ?auto_14777 ) ) ( not ( = ?auto_14762 ?auto_14772 ) ) ( not ( = ?auto_14762 ?auto_14776 ) ) ( not ( = ?auto_14762 ?auto_14774 ) ) ( not ( = ?auto_14777 ?auto_14772 ) ) ( not ( = ?auto_14777 ?auto_14776 ) ) ( not ( = ?auto_14777 ?auto_14774 ) ) ( not ( = ?auto_14758 ?auto_14763 ) ) ( not ( = ?auto_14758 ?auto_14766 ) ) ( not ( = ?auto_14759 ?auto_14763 ) ) ( not ( = ?auto_14759 ?auto_14766 ) ) ( not ( = ?auto_14760 ?auto_14763 ) ) ( not ( = ?auto_14760 ?auto_14766 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14766 ) ) ( not ( = ?auto_14763 ?auto_14777 ) ) ( not ( = ?auto_14763 ?auto_14772 ) ) ( not ( = ?auto_14763 ?auto_14776 ) ) ( not ( = ?auto_14763 ?auto_14774 ) ) ( not ( = ?auto_14768 ?auto_14771 ) ) ( not ( = ?auto_14768 ?auto_14770 ) ) ( not ( = ?auto_14765 ?auto_14775 ) ) ( not ( = ?auto_14765 ?auto_14773 ) ) ( not ( = ?auto_14766 ?auto_14777 ) ) ( not ( = ?auto_14766 ?auto_14772 ) ) ( not ( = ?auto_14766 ?auto_14776 ) ) ( not ( = ?auto_14766 ?auto_14774 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14758 ?auto_14759 ?auto_14760 ?auto_14761 ?auto_14762 )
      ( MAKE-1CRATE ?auto_14762 ?auto_14763 )
      ( MAKE-5CRATE-VERIFY ?auto_14758 ?auto_14759 ?auto_14760 ?auto_14761 ?auto_14762 ?auto_14763 ) )
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
      ?auto_14805 - HOIST
      ?auto_14804 - PLACE
      ?auto_14803 - PLACE
      ?auto_14807 - HOIST
      ?auto_14806 - SURFACE
      ?auto_14809 - SURFACE
      ?auto_14815 - PLACE
      ?auto_14812 - HOIST
      ?auto_14810 - SURFACE
      ?auto_14816 - PLACE
      ?auto_14811 - HOIST
      ?auto_14808 - SURFACE
      ?auto_14814 - SURFACE
      ?auto_14813 - SURFACE
      ?auto_14802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14805 ?auto_14804 ) ( IS-CRATE ?auto_14801 ) ( not ( = ?auto_14803 ?auto_14804 ) ) ( HOIST-AT ?auto_14807 ?auto_14803 ) ( SURFACE-AT ?auto_14801 ?auto_14803 ) ( ON ?auto_14801 ?auto_14806 ) ( CLEAR ?auto_14801 ) ( not ( = ?auto_14800 ?auto_14801 ) ) ( not ( = ?auto_14800 ?auto_14806 ) ) ( not ( = ?auto_14801 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( IS-CRATE ?auto_14800 ) ( AVAILABLE ?auto_14807 ) ( SURFACE-AT ?auto_14800 ?auto_14803 ) ( ON ?auto_14800 ?auto_14809 ) ( CLEAR ?auto_14800 ) ( not ( = ?auto_14799 ?auto_14800 ) ) ( not ( = ?auto_14799 ?auto_14809 ) ) ( not ( = ?auto_14800 ?auto_14809 ) ) ( IS-CRATE ?auto_14799 ) ( not ( = ?auto_14815 ?auto_14804 ) ) ( HOIST-AT ?auto_14812 ?auto_14815 ) ( SURFACE-AT ?auto_14799 ?auto_14815 ) ( ON ?auto_14799 ?auto_14810 ) ( CLEAR ?auto_14799 ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14810 ) ) ( not ( = ?auto_14799 ?auto_14810 ) ) ( not ( = ?auto_14805 ?auto_14812 ) ) ( IS-CRATE ?auto_14798 ) ( not ( = ?auto_14816 ?auto_14804 ) ) ( HOIST-AT ?auto_14811 ?auto_14816 ) ( AVAILABLE ?auto_14811 ) ( SURFACE-AT ?auto_14798 ?auto_14816 ) ( ON ?auto_14798 ?auto_14808 ) ( CLEAR ?auto_14798 ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14808 ) ) ( not ( = ?auto_14798 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14811 ) ) ( IS-CRATE ?auto_14797 ) ( SURFACE-AT ?auto_14797 ?auto_14815 ) ( ON ?auto_14797 ?auto_14814 ) ( CLEAR ?auto_14797 ) ( not ( = ?auto_14796 ?auto_14797 ) ) ( not ( = ?auto_14796 ?auto_14814 ) ) ( not ( = ?auto_14797 ?auto_14814 ) ) ( SURFACE-AT ?auto_14795 ?auto_14804 ) ( CLEAR ?auto_14795 ) ( IS-CRATE ?auto_14796 ) ( AVAILABLE ?auto_14805 ) ( AVAILABLE ?auto_14812 ) ( SURFACE-AT ?auto_14796 ?auto_14815 ) ( ON ?auto_14796 ?auto_14813 ) ( CLEAR ?auto_14796 ) ( TRUCK-AT ?auto_14802 ?auto_14804 ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14813 ) ) ( not ( = ?auto_14796 ?auto_14813 ) ) ( not ( = ?auto_14795 ?auto_14797 ) ) ( not ( = ?auto_14795 ?auto_14814 ) ) ( not ( = ?auto_14797 ?auto_14813 ) ) ( not ( = ?auto_14814 ?auto_14813 ) ) ( not ( = ?auto_14795 ?auto_14798 ) ) ( not ( = ?auto_14795 ?auto_14808 ) ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14808 ) ) ( not ( = ?auto_14798 ?auto_14814 ) ) ( not ( = ?auto_14798 ?auto_14813 ) ) ( not ( = ?auto_14816 ?auto_14815 ) ) ( not ( = ?auto_14811 ?auto_14812 ) ) ( not ( = ?auto_14808 ?auto_14814 ) ) ( not ( = ?auto_14808 ?auto_14813 ) ) ( not ( = ?auto_14795 ?auto_14799 ) ) ( not ( = ?auto_14795 ?auto_14810 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14796 ?auto_14810 ) ) ( not ( = ?auto_14797 ?auto_14799 ) ) ( not ( = ?auto_14797 ?auto_14810 ) ) ( not ( = ?auto_14799 ?auto_14808 ) ) ( not ( = ?auto_14799 ?auto_14814 ) ) ( not ( = ?auto_14799 ?auto_14813 ) ) ( not ( = ?auto_14810 ?auto_14808 ) ) ( not ( = ?auto_14810 ?auto_14814 ) ) ( not ( = ?auto_14810 ?auto_14813 ) ) ( not ( = ?auto_14795 ?auto_14800 ) ) ( not ( = ?auto_14795 ?auto_14809 ) ) ( not ( = ?auto_14796 ?auto_14800 ) ) ( not ( = ?auto_14796 ?auto_14809 ) ) ( not ( = ?auto_14797 ?auto_14800 ) ) ( not ( = ?auto_14797 ?auto_14809 ) ) ( not ( = ?auto_14798 ?auto_14800 ) ) ( not ( = ?auto_14798 ?auto_14809 ) ) ( not ( = ?auto_14800 ?auto_14810 ) ) ( not ( = ?auto_14800 ?auto_14808 ) ) ( not ( = ?auto_14800 ?auto_14814 ) ) ( not ( = ?auto_14800 ?auto_14813 ) ) ( not ( = ?auto_14803 ?auto_14815 ) ) ( not ( = ?auto_14803 ?auto_14816 ) ) ( not ( = ?auto_14807 ?auto_14812 ) ) ( not ( = ?auto_14807 ?auto_14811 ) ) ( not ( = ?auto_14809 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14808 ) ) ( not ( = ?auto_14809 ?auto_14814 ) ) ( not ( = ?auto_14809 ?auto_14813 ) ) ( not ( = ?auto_14795 ?auto_14801 ) ) ( not ( = ?auto_14795 ?auto_14806 ) ) ( not ( = ?auto_14796 ?auto_14801 ) ) ( not ( = ?auto_14796 ?auto_14806 ) ) ( not ( = ?auto_14797 ?auto_14801 ) ) ( not ( = ?auto_14797 ?auto_14806 ) ) ( not ( = ?auto_14798 ?auto_14801 ) ) ( not ( = ?auto_14798 ?auto_14806 ) ) ( not ( = ?auto_14799 ?auto_14801 ) ) ( not ( = ?auto_14799 ?auto_14806 ) ) ( not ( = ?auto_14801 ?auto_14809 ) ) ( not ( = ?auto_14801 ?auto_14810 ) ) ( not ( = ?auto_14801 ?auto_14808 ) ) ( not ( = ?auto_14801 ?auto_14814 ) ) ( not ( = ?auto_14801 ?auto_14813 ) ) ( not ( = ?auto_14806 ?auto_14809 ) ) ( not ( = ?auto_14806 ?auto_14810 ) ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14806 ?auto_14814 ) ) ( not ( = ?auto_14806 ?auto_14813 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14795 ?auto_14796 ?auto_14797 ?auto_14798 ?auto_14799 ?auto_14800 )
      ( MAKE-1CRATE ?auto_14800 ?auto_14801 )
      ( MAKE-6CRATE-VERIFY ?auto_14795 ?auto_14796 ?auto_14797 ?auto_14798 ?auto_14799 ?auto_14800 ?auto_14801 ) )
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
      ?auto_14841 - SURFACE
      ?auto_14842 - SURFACE
    )
    :vars
    (
      ?auto_14847 - HOIST
      ?auto_14845 - PLACE
      ?auto_14843 - PLACE
      ?auto_14844 - HOIST
      ?auto_14846 - SURFACE
      ?auto_14855 - PLACE
      ?auto_14851 - HOIST
      ?auto_14856 - SURFACE
      ?auto_14849 - SURFACE
      ?auto_14857 - PLACE
      ?auto_14850 - HOIST
      ?auto_14854 - SURFACE
      ?auto_14853 - PLACE
      ?auto_14858 - HOIST
      ?auto_14860 - SURFACE
      ?auto_14859 - SURFACE
      ?auto_14852 - SURFACE
      ?auto_14848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14847 ?auto_14845 ) ( IS-CRATE ?auto_14842 ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( HOIST-AT ?auto_14844 ?auto_14843 ) ( AVAILABLE ?auto_14844 ) ( SURFACE-AT ?auto_14842 ?auto_14843 ) ( ON ?auto_14842 ?auto_14846 ) ( CLEAR ?auto_14842 ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14841 ?auto_14846 ) ) ( not ( = ?auto_14842 ?auto_14846 ) ) ( not ( = ?auto_14847 ?auto_14844 ) ) ( IS-CRATE ?auto_14841 ) ( not ( = ?auto_14855 ?auto_14845 ) ) ( HOIST-AT ?auto_14851 ?auto_14855 ) ( SURFACE-AT ?auto_14841 ?auto_14855 ) ( ON ?auto_14841 ?auto_14856 ) ( CLEAR ?auto_14841 ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14856 ) ) ( not ( = ?auto_14841 ?auto_14856 ) ) ( not ( = ?auto_14847 ?auto_14851 ) ) ( IS-CRATE ?auto_14840 ) ( AVAILABLE ?auto_14851 ) ( SURFACE-AT ?auto_14840 ?auto_14855 ) ( ON ?auto_14840 ?auto_14849 ) ( CLEAR ?auto_14840 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14849 ) ) ( not ( = ?auto_14840 ?auto_14849 ) ) ( IS-CRATE ?auto_14839 ) ( not ( = ?auto_14857 ?auto_14845 ) ) ( HOIST-AT ?auto_14850 ?auto_14857 ) ( SURFACE-AT ?auto_14839 ?auto_14857 ) ( ON ?auto_14839 ?auto_14854 ) ( CLEAR ?auto_14839 ) ( not ( = ?auto_14838 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14854 ) ) ( not ( = ?auto_14839 ?auto_14854 ) ) ( not ( = ?auto_14847 ?auto_14850 ) ) ( IS-CRATE ?auto_14838 ) ( not ( = ?auto_14853 ?auto_14845 ) ) ( HOIST-AT ?auto_14858 ?auto_14853 ) ( AVAILABLE ?auto_14858 ) ( SURFACE-AT ?auto_14838 ?auto_14853 ) ( ON ?auto_14838 ?auto_14860 ) ( CLEAR ?auto_14838 ) ( not ( = ?auto_14837 ?auto_14838 ) ) ( not ( = ?auto_14837 ?auto_14860 ) ) ( not ( = ?auto_14838 ?auto_14860 ) ) ( not ( = ?auto_14847 ?auto_14858 ) ) ( IS-CRATE ?auto_14837 ) ( SURFACE-AT ?auto_14837 ?auto_14857 ) ( ON ?auto_14837 ?auto_14859 ) ( CLEAR ?auto_14837 ) ( not ( = ?auto_14836 ?auto_14837 ) ) ( not ( = ?auto_14836 ?auto_14859 ) ) ( not ( = ?auto_14837 ?auto_14859 ) ) ( SURFACE-AT ?auto_14835 ?auto_14845 ) ( CLEAR ?auto_14835 ) ( IS-CRATE ?auto_14836 ) ( AVAILABLE ?auto_14847 ) ( AVAILABLE ?auto_14850 ) ( SURFACE-AT ?auto_14836 ?auto_14857 ) ( ON ?auto_14836 ?auto_14852 ) ( CLEAR ?auto_14836 ) ( TRUCK-AT ?auto_14848 ?auto_14845 ) ( not ( = ?auto_14835 ?auto_14836 ) ) ( not ( = ?auto_14835 ?auto_14852 ) ) ( not ( = ?auto_14836 ?auto_14852 ) ) ( not ( = ?auto_14835 ?auto_14837 ) ) ( not ( = ?auto_14835 ?auto_14859 ) ) ( not ( = ?auto_14837 ?auto_14852 ) ) ( not ( = ?auto_14859 ?auto_14852 ) ) ( not ( = ?auto_14835 ?auto_14838 ) ) ( not ( = ?auto_14835 ?auto_14860 ) ) ( not ( = ?auto_14836 ?auto_14838 ) ) ( not ( = ?auto_14836 ?auto_14860 ) ) ( not ( = ?auto_14838 ?auto_14859 ) ) ( not ( = ?auto_14838 ?auto_14852 ) ) ( not ( = ?auto_14853 ?auto_14857 ) ) ( not ( = ?auto_14858 ?auto_14850 ) ) ( not ( = ?auto_14860 ?auto_14859 ) ) ( not ( = ?auto_14860 ?auto_14852 ) ) ( not ( = ?auto_14835 ?auto_14839 ) ) ( not ( = ?auto_14835 ?auto_14854 ) ) ( not ( = ?auto_14836 ?auto_14839 ) ) ( not ( = ?auto_14836 ?auto_14854 ) ) ( not ( = ?auto_14837 ?auto_14839 ) ) ( not ( = ?auto_14837 ?auto_14854 ) ) ( not ( = ?auto_14839 ?auto_14860 ) ) ( not ( = ?auto_14839 ?auto_14859 ) ) ( not ( = ?auto_14839 ?auto_14852 ) ) ( not ( = ?auto_14854 ?auto_14860 ) ) ( not ( = ?auto_14854 ?auto_14859 ) ) ( not ( = ?auto_14854 ?auto_14852 ) ) ( not ( = ?auto_14835 ?auto_14840 ) ) ( not ( = ?auto_14835 ?auto_14849 ) ) ( not ( = ?auto_14836 ?auto_14840 ) ) ( not ( = ?auto_14836 ?auto_14849 ) ) ( not ( = ?auto_14837 ?auto_14840 ) ) ( not ( = ?auto_14837 ?auto_14849 ) ) ( not ( = ?auto_14838 ?auto_14840 ) ) ( not ( = ?auto_14838 ?auto_14849 ) ) ( not ( = ?auto_14840 ?auto_14854 ) ) ( not ( = ?auto_14840 ?auto_14860 ) ) ( not ( = ?auto_14840 ?auto_14859 ) ) ( not ( = ?auto_14840 ?auto_14852 ) ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14853 ) ) ( not ( = ?auto_14851 ?auto_14850 ) ) ( not ( = ?auto_14851 ?auto_14858 ) ) ( not ( = ?auto_14849 ?auto_14854 ) ) ( not ( = ?auto_14849 ?auto_14860 ) ) ( not ( = ?auto_14849 ?auto_14859 ) ) ( not ( = ?auto_14849 ?auto_14852 ) ) ( not ( = ?auto_14835 ?auto_14841 ) ) ( not ( = ?auto_14835 ?auto_14856 ) ) ( not ( = ?auto_14836 ?auto_14841 ) ) ( not ( = ?auto_14836 ?auto_14856 ) ) ( not ( = ?auto_14837 ?auto_14841 ) ) ( not ( = ?auto_14837 ?auto_14856 ) ) ( not ( = ?auto_14838 ?auto_14841 ) ) ( not ( = ?auto_14838 ?auto_14856 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14839 ?auto_14856 ) ) ( not ( = ?auto_14841 ?auto_14849 ) ) ( not ( = ?auto_14841 ?auto_14854 ) ) ( not ( = ?auto_14841 ?auto_14860 ) ) ( not ( = ?auto_14841 ?auto_14859 ) ) ( not ( = ?auto_14841 ?auto_14852 ) ) ( not ( = ?auto_14856 ?auto_14849 ) ) ( not ( = ?auto_14856 ?auto_14854 ) ) ( not ( = ?auto_14856 ?auto_14860 ) ) ( not ( = ?auto_14856 ?auto_14859 ) ) ( not ( = ?auto_14856 ?auto_14852 ) ) ( not ( = ?auto_14835 ?auto_14842 ) ) ( not ( = ?auto_14835 ?auto_14846 ) ) ( not ( = ?auto_14836 ?auto_14842 ) ) ( not ( = ?auto_14836 ?auto_14846 ) ) ( not ( = ?auto_14837 ?auto_14842 ) ) ( not ( = ?auto_14837 ?auto_14846 ) ) ( not ( = ?auto_14838 ?auto_14842 ) ) ( not ( = ?auto_14838 ?auto_14846 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14846 ) ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14846 ) ) ( not ( = ?auto_14842 ?auto_14856 ) ) ( not ( = ?auto_14842 ?auto_14849 ) ) ( not ( = ?auto_14842 ?auto_14854 ) ) ( not ( = ?auto_14842 ?auto_14860 ) ) ( not ( = ?auto_14842 ?auto_14859 ) ) ( not ( = ?auto_14842 ?auto_14852 ) ) ( not ( = ?auto_14843 ?auto_14855 ) ) ( not ( = ?auto_14843 ?auto_14857 ) ) ( not ( = ?auto_14843 ?auto_14853 ) ) ( not ( = ?auto_14844 ?auto_14851 ) ) ( not ( = ?auto_14844 ?auto_14850 ) ) ( not ( = ?auto_14844 ?auto_14858 ) ) ( not ( = ?auto_14846 ?auto_14856 ) ) ( not ( = ?auto_14846 ?auto_14849 ) ) ( not ( = ?auto_14846 ?auto_14854 ) ) ( not ( = ?auto_14846 ?auto_14860 ) ) ( not ( = ?auto_14846 ?auto_14859 ) ) ( not ( = ?auto_14846 ?auto_14852 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14835 ?auto_14836 ?auto_14837 ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14841 )
      ( MAKE-1CRATE ?auto_14841 ?auto_14842 )
      ( MAKE-7CRATE-VERIFY ?auto_14835 ?auto_14836 ?auto_14837 ?auto_14838 ?auto_14839 ?auto_14840 ?auto_14841 ?auto_14842 ) )
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
      ?auto_14886 - SURFACE
      ?auto_14887 - SURFACE
      ?auto_14888 - SURFACE
    )
    :vars
    (
      ?auto_14889 - HOIST
      ?auto_14894 - PLACE
      ?auto_14893 - PLACE
      ?auto_14890 - HOIST
      ?auto_14892 - SURFACE
      ?auto_14895 - PLACE
      ?auto_14908 - HOIST
      ?auto_14909 - SURFACE
      ?auto_14899 - PLACE
      ?auto_14907 - HOIST
      ?auto_14901 - SURFACE
      ?auto_14900 - SURFACE
      ?auto_14906 - PLACE
      ?auto_14898 - HOIST
      ?auto_14904 - SURFACE
      ?auto_14903 - PLACE
      ?auto_14902 - HOIST
      ?auto_14897 - SURFACE
      ?auto_14905 - SURFACE
      ?auto_14896 - SURFACE
      ?auto_14891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14889 ?auto_14894 ) ( IS-CRATE ?auto_14888 ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( HOIST-AT ?auto_14890 ?auto_14893 ) ( AVAILABLE ?auto_14890 ) ( SURFACE-AT ?auto_14888 ?auto_14893 ) ( ON ?auto_14888 ?auto_14892 ) ( CLEAR ?auto_14888 ) ( not ( = ?auto_14887 ?auto_14888 ) ) ( not ( = ?auto_14887 ?auto_14892 ) ) ( not ( = ?auto_14888 ?auto_14892 ) ) ( not ( = ?auto_14889 ?auto_14890 ) ) ( IS-CRATE ?auto_14887 ) ( not ( = ?auto_14895 ?auto_14894 ) ) ( HOIST-AT ?auto_14908 ?auto_14895 ) ( AVAILABLE ?auto_14908 ) ( SURFACE-AT ?auto_14887 ?auto_14895 ) ( ON ?auto_14887 ?auto_14909 ) ( CLEAR ?auto_14887 ) ( not ( = ?auto_14886 ?auto_14887 ) ) ( not ( = ?auto_14886 ?auto_14909 ) ) ( not ( = ?auto_14887 ?auto_14909 ) ) ( not ( = ?auto_14889 ?auto_14908 ) ) ( IS-CRATE ?auto_14886 ) ( not ( = ?auto_14899 ?auto_14894 ) ) ( HOIST-AT ?auto_14907 ?auto_14899 ) ( SURFACE-AT ?auto_14886 ?auto_14899 ) ( ON ?auto_14886 ?auto_14901 ) ( CLEAR ?auto_14886 ) ( not ( = ?auto_14885 ?auto_14886 ) ) ( not ( = ?auto_14885 ?auto_14901 ) ) ( not ( = ?auto_14886 ?auto_14901 ) ) ( not ( = ?auto_14889 ?auto_14907 ) ) ( IS-CRATE ?auto_14885 ) ( AVAILABLE ?auto_14907 ) ( SURFACE-AT ?auto_14885 ?auto_14899 ) ( ON ?auto_14885 ?auto_14900 ) ( CLEAR ?auto_14885 ) ( not ( = ?auto_14884 ?auto_14885 ) ) ( not ( = ?auto_14884 ?auto_14900 ) ) ( not ( = ?auto_14885 ?auto_14900 ) ) ( IS-CRATE ?auto_14884 ) ( not ( = ?auto_14906 ?auto_14894 ) ) ( HOIST-AT ?auto_14898 ?auto_14906 ) ( SURFACE-AT ?auto_14884 ?auto_14906 ) ( ON ?auto_14884 ?auto_14904 ) ( CLEAR ?auto_14884 ) ( not ( = ?auto_14883 ?auto_14884 ) ) ( not ( = ?auto_14883 ?auto_14904 ) ) ( not ( = ?auto_14884 ?auto_14904 ) ) ( not ( = ?auto_14889 ?auto_14898 ) ) ( IS-CRATE ?auto_14883 ) ( not ( = ?auto_14903 ?auto_14894 ) ) ( HOIST-AT ?auto_14902 ?auto_14903 ) ( AVAILABLE ?auto_14902 ) ( SURFACE-AT ?auto_14883 ?auto_14903 ) ( ON ?auto_14883 ?auto_14897 ) ( CLEAR ?auto_14883 ) ( not ( = ?auto_14882 ?auto_14883 ) ) ( not ( = ?auto_14882 ?auto_14897 ) ) ( not ( = ?auto_14883 ?auto_14897 ) ) ( not ( = ?auto_14889 ?auto_14902 ) ) ( IS-CRATE ?auto_14882 ) ( SURFACE-AT ?auto_14882 ?auto_14906 ) ( ON ?auto_14882 ?auto_14905 ) ( CLEAR ?auto_14882 ) ( not ( = ?auto_14881 ?auto_14882 ) ) ( not ( = ?auto_14881 ?auto_14905 ) ) ( not ( = ?auto_14882 ?auto_14905 ) ) ( SURFACE-AT ?auto_14880 ?auto_14894 ) ( CLEAR ?auto_14880 ) ( IS-CRATE ?auto_14881 ) ( AVAILABLE ?auto_14889 ) ( AVAILABLE ?auto_14898 ) ( SURFACE-AT ?auto_14881 ?auto_14906 ) ( ON ?auto_14881 ?auto_14896 ) ( CLEAR ?auto_14881 ) ( TRUCK-AT ?auto_14891 ?auto_14894 ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14896 ) ) ( not ( = ?auto_14881 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14882 ) ) ( not ( = ?auto_14880 ?auto_14905 ) ) ( not ( = ?auto_14882 ?auto_14896 ) ) ( not ( = ?auto_14905 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14883 ) ) ( not ( = ?auto_14880 ?auto_14897 ) ) ( not ( = ?auto_14881 ?auto_14883 ) ) ( not ( = ?auto_14881 ?auto_14897 ) ) ( not ( = ?auto_14883 ?auto_14905 ) ) ( not ( = ?auto_14883 ?auto_14896 ) ) ( not ( = ?auto_14903 ?auto_14906 ) ) ( not ( = ?auto_14902 ?auto_14898 ) ) ( not ( = ?auto_14897 ?auto_14905 ) ) ( not ( = ?auto_14897 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14884 ) ) ( not ( = ?auto_14880 ?auto_14904 ) ) ( not ( = ?auto_14881 ?auto_14884 ) ) ( not ( = ?auto_14881 ?auto_14904 ) ) ( not ( = ?auto_14882 ?auto_14884 ) ) ( not ( = ?auto_14882 ?auto_14904 ) ) ( not ( = ?auto_14884 ?auto_14897 ) ) ( not ( = ?auto_14884 ?auto_14905 ) ) ( not ( = ?auto_14884 ?auto_14896 ) ) ( not ( = ?auto_14904 ?auto_14897 ) ) ( not ( = ?auto_14904 ?auto_14905 ) ) ( not ( = ?auto_14904 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14885 ) ) ( not ( = ?auto_14880 ?auto_14900 ) ) ( not ( = ?auto_14881 ?auto_14885 ) ) ( not ( = ?auto_14881 ?auto_14900 ) ) ( not ( = ?auto_14882 ?auto_14885 ) ) ( not ( = ?auto_14882 ?auto_14900 ) ) ( not ( = ?auto_14883 ?auto_14885 ) ) ( not ( = ?auto_14883 ?auto_14900 ) ) ( not ( = ?auto_14885 ?auto_14904 ) ) ( not ( = ?auto_14885 ?auto_14897 ) ) ( not ( = ?auto_14885 ?auto_14905 ) ) ( not ( = ?auto_14885 ?auto_14896 ) ) ( not ( = ?auto_14899 ?auto_14906 ) ) ( not ( = ?auto_14899 ?auto_14903 ) ) ( not ( = ?auto_14907 ?auto_14898 ) ) ( not ( = ?auto_14907 ?auto_14902 ) ) ( not ( = ?auto_14900 ?auto_14904 ) ) ( not ( = ?auto_14900 ?auto_14897 ) ) ( not ( = ?auto_14900 ?auto_14905 ) ) ( not ( = ?auto_14900 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14886 ) ) ( not ( = ?auto_14880 ?auto_14901 ) ) ( not ( = ?auto_14881 ?auto_14886 ) ) ( not ( = ?auto_14881 ?auto_14901 ) ) ( not ( = ?auto_14882 ?auto_14886 ) ) ( not ( = ?auto_14882 ?auto_14901 ) ) ( not ( = ?auto_14883 ?auto_14886 ) ) ( not ( = ?auto_14883 ?auto_14901 ) ) ( not ( = ?auto_14884 ?auto_14886 ) ) ( not ( = ?auto_14884 ?auto_14901 ) ) ( not ( = ?auto_14886 ?auto_14900 ) ) ( not ( = ?auto_14886 ?auto_14904 ) ) ( not ( = ?auto_14886 ?auto_14897 ) ) ( not ( = ?auto_14886 ?auto_14905 ) ) ( not ( = ?auto_14886 ?auto_14896 ) ) ( not ( = ?auto_14901 ?auto_14900 ) ) ( not ( = ?auto_14901 ?auto_14904 ) ) ( not ( = ?auto_14901 ?auto_14897 ) ) ( not ( = ?auto_14901 ?auto_14905 ) ) ( not ( = ?auto_14901 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14887 ) ) ( not ( = ?auto_14880 ?auto_14909 ) ) ( not ( = ?auto_14881 ?auto_14887 ) ) ( not ( = ?auto_14881 ?auto_14909 ) ) ( not ( = ?auto_14882 ?auto_14887 ) ) ( not ( = ?auto_14882 ?auto_14909 ) ) ( not ( = ?auto_14883 ?auto_14887 ) ) ( not ( = ?auto_14883 ?auto_14909 ) ) ( not ( = ?auto_14884 ?auto_14887 ) ) ( not ( = ?auto_14884 ?auto_14909 ) ) ( not ( = ?auto_14885 ?auto_14887 ) ) ( not ( = ?auto_14885 ?auto_14909 ) ) ( not ( = ?auto_14887 ?auto_14901 ) ) ( not ( = ?auto_14887 ?auto_14900 ) ) ( not ( = ?auto_14887 ?auto_14904 ) ) ( not ( = ?auto_14887 ?auto_14897 ) ) ( not ( = ?auto_14887 ?auto_14905 ) ) ( not ( = ?auto_14887 ?auto_14896 ) ) ( not ( = ?auto_14895 ?auto_14899 ) ) ( not ( = ?auto_14895 ?auto_14906 ) ) ( not ( = ?auto_14895 ?auto_14903 ) ) ( not ( = ?auto_14908 ?auto_14907 ) ) ( not ( = ?auto_14908 ?auto_14898 ) ) ( not ( = ?auto_14908 ?auto_14902 ) ) ( not ( = ?auto_14909 ?auto_14901 ) ) ( not ( = ?auto_14909 ?auto_14900 ) ) ( not ( = ?auto_14909 ?auto_14904 ) ) ( not ( = ?auto_14909 ?auto_14897 ) ) ( not ( = ?auto_14909 ?auto_14905 ) ) ( not ( = ?auto_14909 ?auto_14896 ) ) ( not ( = ?auto_14880 ?auto_14888 ) ) ( not ( = ?auto_14880 ?auto_14892 ) ) ( not ( = ?auto_14881 ?auto_14888 ) ) ( not ( = ?auto_14881 ?auto_14892 ) ) ( not ( = ?auto_14882 ?auto_14888 ) ) ( not ( = ?auto_14882 ?auto_14892 ) ) ( not ( = ?auto_14883 ?auto_14888 ) ) ( not ( = ?auto_14883 ?auto_14892 ) ) ( not ( = ?auto_14884 ?auto_14888 ) ) ( not ( = ?auto_14884 ?auto_14892 ) ) ( not ( = ?auto_14885 ?auto_14888 ) ) ( not ( = ?auto_14885 ?auto_14892 ) ) ( not ( = ?auto_14886 ?auto_14888 ) ) ( not ( = ?auto_14886 ?auto_14892 ) ) ( not ( = ?auto_14888 ?auto_14909 ) ) ( not ( = ?auto_14888 ?auto_14901 ) ) ( not ( = ?auto_14888 ?auto_14900 ) ) ( not ( = ?auto_14888 ?auto_14904 ) ) ( not ( = ?auto_14888 ?auto_14897 ) ) ( not ( = ?auto_14888 ?auto_14905 ) ) ( not ( = ?auto_14888 ?auto_14896 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14899 ) ) ( not ( = ?auto_14893 ?auto_14906 ) ) ( not ( = ?auto_14893 ?auto_14903 ) ) ( not ( = ?auto_14890 ?auto_14908 ) ) ( not ( = ?auto_14890 ?auto_14907 ) ) ( not ( = ?auto_14890 ?auto_14898 ) ) ( not ( = ?auto_14890 ?auto_14902 ) ) ( not ( = ?auto_14892 ?auto_14909 ) ) ( not ( = ?auto_14892 ?auto_14901 ) ) ( not ( = ?auto_14892 ?auto_14900 ) ) ( not ( = ?auto_14892 ?auto_14904 ) ) ( not ( = ?auto_14892 ?auto_14897 ) ) ( not ( = ?auto_14892 ?auto_14905 ) ) ( not ( = ?auto_14892 ?auto_14896 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14880 ?auto_14881 ?auto_14882 ?auto_14883 ?auto_14884 ?auto_14885 ?auto_14886 ?auto_14887 )
      ( MAKE-1CRATE ?auto_14887 ?auto_14888 )
      ( MAKE-8CRATE-VERIFY ?auto_14880 ?auto_14881 ?auto_14882 ?auto_14883 ?auto_14884 ?auto_14885 ?auto_14886 ?auto_14887 ?auto_14888 ) )
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
      ?auto_14936 - SURFACE
      ?auto_14937 - SURFACE
      ?auto_14938 - SURFACE
      ?auto_14939 - SURFACE
    )
    :vars
    (
      ?auto_14944 - HOIST
      ?auto_14942 - PLACE
      ?auto_14941 - PLACE
      ?auto_14943 - HOIST
      ?auto_14940 - SURFACE
      ?auto_14959 - PLACE
      ?auto_14952 - HOIST
      ?auto_14947 - SURFACE
      ?auto_14957 - PLACE
      ?auto_14953 - HOIST
      ?auto_14951 - SURFACE
      ?auto_14950 - PLACE
      ?auto_14949 - HOIST
      ?auto_14958 - SURFACE
      ?auto_14946 - SURFACE
      ?auto_14954 - SURFACE
      ?auto_14956 - PLACE
      ?auto_14955 - HOIST
      ?auto_14961 - SURFACE
      ?auto_14960 - SURFACE
      ?auto_14948 - SURFACE
      ?auto_14945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14944 ?auto_14942 ) ( IS-CRATE ?auto_14939 ) ( not ( = ?auto_14941 ?auto_14942 ) ) ( HOIST-AT ?auto_14943 ?auto_14941 ) ( SURFACE-AT ?auto_14939 ?auto_14941 ) ( ON ?auto_14939 ?auto_14940 ) ( CLEAR ?auto_14939 ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14940 ) ) ( not ( = ?auto_14944 ?auto_14943 ) ) ( IS-CRATE ?auto_14938 ) ( not ( = ?auto_14959 ?auto_14942 ) ) ( HOIST-AT ?auto_14952 ?auto_14959 ) ( AVAILABLE ?auto_14952 ) ( SURFACE-AT ?auto_14938 ?auto_14959 ) ( ON ?auto_14938 ?auto_14947 ) ( CLEAR ?auto_14938 ) ( not ( = ?auto_14937 ?auto_14938 ) ) ( not ( = ?auto_14937 ?auto_14947 ) ) ( not ( = ?auto_14938 ?auto_14947 ) ) ( not ( = ?auto_14944 ?auto_14952 ) ) ( IS-CRATE ?auto_14937 ) ( not ( = ?auto_14957 ?auto_14942 ) ) ( HOIST-AT ?auto_14953 ?auto_14957 ) ( AVAILABLE ?auto_14953 ) ( SURFACE-AT ?auto_14937 ?auto_14957 ) ( ON ?auto_14937 ?auto_14951 ) ( CLEAR ?auto_14937 ) ( not ( = ?auto_14936 ?auto_14937 ) ) ( not ( = ?auto_14936 ?auto_14951 ) ) ( not ( = ?auto_14937 ?auto_14951 ) ) ( not ( = ?auto_14944 ?auto_14953 ) ) ( IS-CRATE ?auto_14936 ) ( not ( = ?auto_14950 ?auto_14942 ) ) ( HOIST-AT ?auto_14949 ?auto_14950 ) ( SURFACE-AT ?auto_14936 ?auto_14950 ) ( ON ?auto_14936 ?auto_14958 ) ( CLEAR ?auto_14936 ) ( not ( = ?auto_14935 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14958 ) ) ( not ( = ?auto_14936 ?auto_14958 ) ) ( not ( = ?auto_14944 ?auto_14949 ) ) ( IS-CRATE ?auto_14935 ) ( AVAILABLE ?auto_14949 ) ( SURFACE-AT ?auto_14935 ?auto_14950 ) ( ON ?auto_14935 ?auto_14946 ) ( CLEAR ?auto_14935 ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14934 ?auto_14946 ) ) ( not ( = ?auto_14935 ?auto_14946 ) ) ( IS-CRATE ?auto_14934 ) ( SURFACE-AT ?auto_14934 ?auto_14941 ) ( ON ?auto_14934 ?auto_14954 ) ( CLEAR ?auto_14934 ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( not ( = ?auto_14933 ?auto_14954 ) ) ( not ( = ?auto_14934 ?auto_14954 ) ) ( IS-CRATE ?auto_14933 ) ( not ( = ?auto_14956 ?auto_14942 ) ) ( HOIST-AT ?auto_14955 ?auto_14956 ) ( AVAILABLE ?auto_14955 ) ( SURFACE-AT ?auto_14933 ?auto_14956 ) ( ON ?auto_14933 ?auto_14961 ) ( CLEAR ?auto_14933 ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14961 ) ) ( not ( = ?auto_14933 ?auto_14961 ) ) ( not ( = ?auto_14944 ?auto_14955 ) ) ( IS-CRATE ?auto_14932 ) ( SURFACE-AT ?auto_14932 ?auto_14941 ) ( ON ?auto_14932 ?auto_14960 ) ( CLEAR ?auto_14932 ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14960 ) ) ( not ( = ?auto_14932 ?auto_14960 ) ) ( SURFACE-AT ?auto_14930 ?auto_14942 ) ( CLEAR ?auto_14930 ) ( IS-CRATE ?auto_14931 ) ( AVAILABLE ?auto_14944 ) ( AVAILABLE ?auto_14943 ) ( SURFACE-AT ?auto_14931 ?auto_14941 ) ( ON ?auto_14931 ?auto_14948 ) ( CLEAR ?auto_14931 ) ( TRUCK-AT ?auto_14945 ?auto_14942 ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14930 ?auto_14948 ) ) ( not ( = ?auto_14931 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14932 ) ) ( not ( = ?auto_14930 ?auto_14960 ) ) ( not ( = ?auto_14932 ?auto_14948 ) ) ( not ( = ?auto_14960 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14933 ) ) ( not ( = ?auto_14930 ?auto_14961 ) ) ( not ( = ?auto_14931 ?auto_14933 ) ) ( not ( = ?auto_14931 ?auto_14961 ) ) ( not ( = ?auto_14933 ?auto_14960 ) ) ( not ( = ?auto_14933 ?auto_14948 ) ) ( not ( = ?auto_14956 ?auto_14941 ) ) ( not ( = ?auto_14955 ?auto_14943 ) ) ( not ( = ?auto_14961 ?auto_14960 ) ) ( not ( = ?auto_14961 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14934 ) ) ( not ( = ?auto_14930 ?auto_14954 ) ) ( not ( = ?auto_14931 ?auto_14934 ) ) ( not ( = ?auto_14931 ?auto_14954 ) ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14954 ) ) ( not ( = ?auto_14934 ?auto_14961 ) ) ( not ( = ?auto_14934 ?auto_14960 ) ) ( not ( = ?auto_14934 ?auto_14948 ) ) ( not ( = ?auto_14954 ?auto_14961 ) ) ( not ( = ?auto_14954 ?auto_14960 ) ) ( not ( = ?auto_14954 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14935 ) ) ( not ( = ?auto_14930 ?auto_14946 ) ) ( not ( = ?auto_14931 ?auto_14935 ) ) ( not ( = ?auto_14931 ?auto_14946 ) ) ( not ( = ?auto_14932 ?auto_14935 ) ) ( not ( = ?auto_14932 ?auto_14946 ) ) ( not ( = ?auto_14933 ?auto_14935 ) ) ( not ( = ?auto_14933 ?auto_14946 ) ) ( not ( = ?auto_14935 ?auto_14954 ) ) ( not ( = ?auto_14935 ?auto_14961 ) ) ( not ( = ?auto_14935 ?auto_14960 ) ) ( not ( = ?auto_14935 ?auto_14948 ) ) ( not ( = ?auto_14950 ?auto_14941 ) ) ( not ( = ?auto_14950 ?auto_14956 ) ) ( not ( = ?auto_14949 ?auto_14943 ) ) ( not ( = ?auto_14949 ?auto_14955 ) ) ( not ( = ?auto_14946 ?auto_14954 ) ) ( not ( = ?auto_14946 ?auto_14961 ) ) ( not ( = ?auto_14946 ?auto_14960 ) ) ( not ( = ?auto_14946 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14936 ) ) ( not ( = ?auto_14930 ?auto_14958 ) ) ( not ( = ?auto_14931 ?auto_14936 ) ) ( not ( = ?auto_14931 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14936 ) ) ( not ( = ?auto_14932 ?auto_14958 ) ) ( not ( = ?auto_14933 ?auto_14936 ) ) ( not ( = ?auto_14933 ?auto_14958 ) ) ( not ( = ?auto_14934 ?auto_14936 ) ) ( not ( = ?auto_14934 ?auto_14958 ) ) ( not ( = ?auto_14936 ?auto_14946 ) ) ( not ( = ?auto_14936 ?auto_14954 ) ) ( not ( = ?auto_14936 ?auto_14961 ) ) ( not ( = ?auto_14936 ?auto_14960 ) ) ( not ( = ?auto_14936 ?auto_14948 ) ) ( not ( = ?auto_14958 ?auto_14946 ) ) ( not ( = ?auto_14958 ?auto_14954 ) ) ( not ( = ?auto_14958 ?auto_14961 ) ) ( not ( = ?auto_14958 ?auto_14960 ) ) ( not ( = ?auto_14958 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14937 ) ) ( not ( = ?auto_14930 ?auto_14951 ) ) ( not ( = ?auto_14931 ?auto_14937 ) ) ( not ( = ?auto_14931 ?auto_14951 ) ) ( not ( = ?auto_14932 ?auto_14937 ) ) ( not ( = ?auto_14932 ?auto_14951 ) ) ( not ( = ?auto_14933 ?auto_14937 ) ) ( not ( = ?auto_14933 ?auto_14951 ) ) ( not ( = ?auto_14934 ?auto_14937 ) ) ( not ( = ?auto_14934 ?auto_14951 ) ) ( not ( = ?auto_14935 ?auto_14937 ) ) ( not ( = ?auto_14935 ?auto_14951 ) ) ( not ( = ?auto_14937 ?auto_14958 ) ) ( not ( = ?auto_14937 ?auto_14946 ) ) ( not ( = ?auto_14937 ?auto_14954 ) ) ( not ( = ?auto_14937 ?auto_14961 ) ) ( not ( = ?auto_14937 ?auto_14960 ) ) ( not ( = ?auto_14937 ?auto_14948 ) ) ( not ( = ?auto_14957 ?auto_14950 ) ) ( not ( = ?auto_14957 ?auto_14941 ) ) ( not ( = ?auto_14957 ?auto_14956 ) ) ( not ( = ?auto_14953 ?auto_14949 ) ) ( not ( = ?auto_14953 ?auto_14943 ) ) ( not ( = ?auto_14953 ?auto_14955 ) ) ( not ( = ?auto_14951 ?auto_14958 ) ) ( not ( = ?auto_14951 ?auto_14946 ) ) ( not ( = ?auto_14951 ?auto_14954 ) ) ( not ( = ?auto_14951 ?auto_14961 ) ) ( not ( = ?auto_14951 ?auto_14960 ) ) ( not ( = ?auto_14951 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14938 ) ) ( not ( = ?auto_14930 ?auto_14947 ) ) ( not ( = ?auto_14931 ?auto_14938 ) ) ( not ( = ?auto_14931 ?auto_14947 ) ) ( not ( = ?auto_14932 ?auto_14938 ) ) ( not ( = ?auto_14932 ?auto_14947 ) ) ( not ( = ?auto_14933 ?auto_14938 ) ) ( not ( = ?auto_14933 ?auto_14947 ) ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14934 ?auto_14947 ) ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14947 ) ) ( not ( = ?auto_14936 ?auto_14938 ) ) ( not ( = ?auto_14936 ?auto_14947 ) ) ( not ( = ?auto_14938 ?auto_14951 ) ) ( not ( = ?auto_14938 ?auto_14958 ) ) ( not ( = ?auto_14938 ?auto_14946 ) ) ( not ( = ?auto_14938 ?auto_14954 ) ) ( not ( = ?auto_14938 ?auto_14961 ) ) ( not ( = ?auto_14938 ?auto_14960 ) ) ( not ( = ?auto_14938 ?auto_14948 ) ) ( not ( = ?auto_14959 ?auto_14957 ) ) ( not ( = ?auto_14959 ?auto_14950 ) ) ( not ( = ?auto_14959 ?auto_14941 ) ) ( not ( = ?auto_14959 ?auto_14956 ) ) ( not ( = ?auto_14952 ?auto_14953 ) ) ( not ( = ?auto_14952 ?auto_14949 ) ) ( not ( = ?auto_14952 ?auto_14943 ) ) ( not ( = ?auto_14952 ?auto_14955 ) ) ( not ( = ?auto_14947 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14958 ) ) ( not ( = ?auto_14947 ?auto_14946 ) ) ( not ( = ?auto_14947 ?auto_14954 ) ) ( not ( = ?auto_14947 ?auto_14961 ) ) ( not ( = ?auto_14947 ?auto_14960 ) ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14930 ?auto_14939 ) ) ( not ( = ?auto_14930 ?auto_14940 ) ) ( not ( = ?auto_14931 ?auto_14939 ) ) ( not ( = ?auto_14931 ?auto_14940 ) ) ( not ( = ?auto_14932 ?auto_14939 ) ) ( not ( = ?auto_14932 ?auto_14940 ) ) ( not ( = ?auto_14933 ?auto_14939 ) ) ( not ( = ?auto_14933 ?auto_14940 ) ) ( not ( = ?auto_14934 ?auto_14939 ) ) ( not ( = ?auto_14934 ?auto_14940 ) ) ( not ( = ?auto_14935 ?auto_14939 ) ) ( not ( = ?auto_14935 ?auto_14940 ) ) ( not ( = ?auto_14936 ?auto_14939 ) ) ( not ( = ?auto_14936 ?auto_14940 ) ) ( not ( = ?auto_14937 ?auto_14939 ) ) ( not ( = ?auto_14937 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14947 ) ) ( not ( = ?auto_14939 ?auto_14951 ) ) ( not ( = ?auto_14939 ?auto_14958 ) ) ( not ( = ?auto_14939 ?auto_14946 ) ) ( not ( = ?auto_14939 ?auto_14954 ) ) ( not ( = ?auto_14939 ?auto_14961 ) ) ( not ( = ?auto_14939 ?auto_14960 ) ) ( not ( = ?auto_14939 ?auto_14948 ) ) ( not ( = ?auto_14940 ?auto_14947 ) ) ( not ( = ?auto_14940 ?auto_14951 ) ) ( not ( = ?auto_14940 ?auto_14958 ) ) ( not ( = ?auto_14940 ?auto_14946 ) ) ( not ( = ?auto_14940 ?auto_14954 ) ) ( not ( = ?auto_14940 ?auto_14961 ) ) ( not ( = ?auto_14940 ?auto_14960 ) ) ( not ( = ?auto_14940 ?auto_14948 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14930 ?auto_14931 ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ?auto_14938 )
      ( MAKE-1CRATE ?auto_14938 ?auto_14939 )
      ( MAKE-9CRATE-VERIFY ?auto_14930 ?auto_14931 ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ?auto_14938 ?auto_14939 ) )
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
      ?auto_14989 - SURFACE
      ?auto_14990 - SURFACE
      ?auto_14991 - SURFACE
      ?auto_14992 - SURFACE
      ?auto_14993 - SURFACE
    )
    :vars
    (
      ?auto_14997 - HOIST
      ?auto_14994 - PLACE
      ?auto_14996 - PLACE
      ?auto_14995 - HOIST
      ?auto_14999 - SURFACE
      ?auto_15009 - PLACE
      ?auto_15006 - HOIST
      ?auto_15002 - SURFACE
      ?auto_15005 - PLACE
      ?auto_15000 - HOIST
      ?auto_15017 - SURFACE
      ?auto_15012 - PLACE
      ?auto_15014 - HOIST
      ?auto_15004 - SURFACE
      ?auto_15016 - PLACE
      ?auto_15007 - HOIST
      ?auto_15015 - SURFACE
      ?auto_15018 - SURFACE
      ?auto_15013 - SURFACE
      ?auto_15003 - PLACE
      ?auto_15001 - HOIST
      ?auto_15011 - SURFACE
      ?auto_15008 - SURFACE
      ?auto_15010 - SURFACE
      ?auto_14998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14997 ?auto_14994 ) ( IS-CRATE ?auto_14993 ) ( not ( = ?auto_14996 ?auto_14994 ) ) ( HOIST-AT ?auto_14995 ?auto_14996 ) ( AVAILABLE ?auto_14995 ) ( SURFACE-AT ?auto_14993 ?auto_14996 ) ( ON ?auto_14993 ?auto_14999 ) ( CLEAR ?auto_14993 ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( not ( = ?auto_14992 ?auto_14999 ) ) ( not ( = ?auto_14993 ?auto_14999 ) ) ( not ( = ?auto_14997 ?auto_14995 ) ) ( IS-CRATE ?auto_14992 ) ( not ( = ?auto_15009 ?auto_14994 ) ) ( HOIST-AT ?auto_15006 ?auto_15009 ) ( SURFACE-AT ?auto_14992 ?auto_15009 ) ( ON ?auto_14992 ?auto_15002 ) ( CLEAR ?auto_14992 ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( not ( = ?auto_14991 ?auto_15002 ) ) ( not ( = ?auto_14992 ?auto_15002 ) ) ( not ( = ?auto_14997 ?auto_15006 ) ) ( IS-CRATE ?auto_14991 ) ( not ( = ?auto_15005 ?auto_14994 ) ) ( HOIST-AT ?auto_15000 ?auto_15005 ) ( AVAILABLE ?auto_15000 ) ( SURFACE-AT ?auto_14991 ?auto_15005 ) ( ON ?auto_14991 ?auto_15017 ) ( CLEAR ?auto_14991 ) ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14990 ?auto_15017 ) ) ( not ( = ?auto_14991 ?auto_15017 ) ) ( not ( = ?auto_14997 ?auto_15000 ) ) ( IS-CRATE ?auto_14990 ) ( not ( = ?auto_15012 ?auto_14994 ) ) ( HOIST-AT ?auto_15014 ?auto_15012 ) ( AVAILABLE ?auto_15014 ) ( SURFACE-AT ?auto_14990 ?auto_15012 ) ( ON ?auto_14990 ?auto_15004 ) ( CLEAR ?auto_14990 ) ( not ( = ?auto_14989 ?auto_14990 ) ) ( not ( = ?auto_14989 ?auto_15004 ) ) ( not ( = ?auto_14990 ?auto_15004 ) ) ( not ( = ?auto_14997 ?auto_15014 ) ) ( IS-CRATE ?auto_14989 ) ( not ( = ?auto_15016 ?auto_14994 ) ) ( HOIST-AT ?auto_15007 ?auto_15016 ) ( SURFACE-AT ?auto_14989 ?auto_15016 ) ( ON ?auto_14989 ?auto_15015 ) ( CLEAR ?auto_14989 ) ( not ( = ?auto_14988 ?auto_14989 ) ) ( not ( = ?auto_14988 ?auto_15015 ) ) ( not ( = ?auto_14989 ?auto_15015 ) ) ( not ( = ?auto_14997 ?auto_15007 ) ) ( IS-CRATE ?auto_14988 ) ( AVAILABLE ?auto_15007 ) ( SURFACE-AT ?auto_14988 ?auto_15016 ) ( ON ?auto_14988 ?auto_15018 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14987 ?auto_15018 ) ) ( not ( = ?auto_14988 ?auto_15018 ) ) ( IS-CRATE ?auto_14987 ) ( SURFACE-AT ?auto_14987 ?auto_15009 ) ( ON ?auto_14987 ?auto_15013 ) ( CLEAR ?auto_14987 ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_15013 ) ) ( not ( = ?auto_14987 ?auto_15013 ) ) ( IS-CRATE ?auto_14986 ) ( not ( = ?auto_15003 ?auto_14994 ) ) ( HOIST-AT ?auto_15001 ?auto_15003 ) ( AVAILABLE ?auto_15001 ) ( SURFACE-AT ?auto_14986 ?auto_15003 ) ( ON ?auto_14986 ?auto_15011 ) ( CLEAR ?auto_14986 ) ( not ( = ?auto_14985 ?auto_14986 ) ) ( not ( = ?auto_14985 ?auto_15011 ) ) ( not ( = ?auto_14986 ?auto_15011 ) ) ( not ( = ?auto_14997 ?auto_15001 ) ) ( IS-CRATE ?auto_14985 ) ( SURFACE-AT ?auto_14985 ?auto_15009 ) ( ON ?auto_14985 ?auto_15008 ) ( CLEAR ?auto_14985 ) ( not ( = ?auto_14984 ?auto_14985 ) ) ( not ( = ?auto_14984 ?auto_15008 ) ) ( not ( = ?auto_14985 ?auto_15008 ) ) ( SURFACE-AT ?auto_14983 ?auto_14994 ) ( CLEAR ?auto_14983 ) ( IS-CRATE ?auto_14984 ) ( AVAILABLE ?auto_14997 ) ( AVAILABLE ?auto_15006 ) ( SURFACE-AT ?auto_14984 ?auto_15009 ) ( ON ?auto_14984 ?auto_15010 ) ( CLEAR ?auto_14984 ) ( TRUCK-AT ?auto_14998 ?auto_14994 ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_15010 ) ) ( not ( = ?auto_14984 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14985 ) ) ( not ( = ?auto_14983 ?auto_15008 ) ) ( not ( = ?auto_14985 ?auto_15010 ) ) ( not ( = ?auto_15008 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14986 ) ) ( not ( = ?auto_14983 ?auto_15011 ) ) ( not ( = ?auto_14984 ?auto_14986 ) ) ( not ( = ?auto_14984 ?auto_15011 ) ) ( not ( = ?auto_14986 ?auto_15008 ) ) ( not ( = ?auto_14986 ?auto_15010 ) ) ( not ( = ?auto_15003 ?auto_15009 ) ) ( not ( = ?auto_15001 ?auto_15006 ) ) ( not ( = ?auto_15011 ?auto_15008 ) ) ( not ( = ?auto_15011 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14987 ) ) ( not ( = ?auto_14983 ?auto_15013 ) ) ( not ( = ?auto_14984 ?auto_14987 ) ) ( not ( = ?auto_14984 ?auto_15013 ) ) ( not ( = ?auto_14985 ?auto_14987 ) ) ( not ( = ?auto_14985 ?auto_15013 ) ) ( not ( = ?auto_14987 ?auto_15011 ) ) ( not ( = ?auto_14987 ?auto_15008 ) ) ( not ( = ?auto_14987 ?auto_15010 ) ) ( not ( = ?auto_15013 ?auto_15011 ) ) ( not ( = ?auto_15013 ?auto_15008 ) ) ( not ( = ?auto_15013 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14988 ) ) ( not ( = ?auto_14983 ?auto_15018 ) ) ( not ( = ?auto_14984 ?auto_14988 ) ) ( not ( = ?auto_14984 ?auto_15018 ) ) ( not ( = ?auto_14985 ?auto_14988 ) ) ( not ( = ?auto_14985 ?auto_15018 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_15018 ) ) ( not ( = ?auto_14988 ?auto_15013 ) ) ( not ( = ?auto_14988 ?auto_15011 ) ) ( not ( = ?auto_14988 ?auto_15008 ) ) ( not ( = ?auto_14988 ?auto_15010 ) ) ( not ( = ?auto_15016 ?auto_15009 ) ) ( not ( = ?auto_15016 ?auto_15003 ) ) ( not ( = ?auto_15007 ?auto_15006 ) ) ( not ( = ?auto_15007 ?auto_15001 ) ) ( not ( = ?auto_15018 ?auto_15013 ) ) ( not ( = ?auto_15018 ?auto_15011 ) ) ( not ( = ?auto_15018 ?auto_15008 ) ) ( not ( = ?auto_15018 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14989 ) ) ( not ( = ?auto_14983 ?auto_15015 ) ) ( not ( = ?auto_14984 ?auto_14989 ) ) ( not ( = ?auto_14984 ?auto_15015 ) ) ( not ( = ?auto_14985 ?auto_14989 ) ) ( not ( = ?auto_14985 ?auto_15015 ) ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14986 ?auto_15015 ) ) ( not ( = ?auto_14987 ?auto_14989 ) ) ( not ( = ?auto_14987 ?auto_15015 ) ) ( not ( = ?auto_14989 ?auto_15018 ) ) ( not ( = ?auto_14989 ?auto_15013 ) ) ( not ( = ?auto_14989 ?auto_15011 ) ) ( not ( = ?auto_14989 ?auto_15008 ) ) ( not ( = ?auto_14989 ?auto_15010 ) ) ( not ( = ?auto_15015 ?auto_15018 ) ) ( not ( = ?auto_15015 ?auto_15013 ) ) ( not ( = ?auto_15015 ?auto_15011 ) ) ( not ( = ?auto_15015 ?auto_15008 ) ) ( not ( = ?auto_15015 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14990 ) ) ( not ( = ?auto_14983 ?auto_15004 ) ) ( not ( = ?auto_14984 ?auto_14990 ) ) ( not ( = ?auto_14984 ?auto_15004 ) ) ( not ( = ?auto_14985 ?auto_14990 ) ) ( not ( = ?auto_14985 ?auto_15004 ) ) ( not ( = ?auto_14986 ?auto_14990 ) ) ( not ( = ?auto_14986 ?auto_15004 ) ) ( not ( = ?auto_14987 ?auto_14990 ) ) ( not ( = ?auto_14987 ?auto_15004 ) ) ( not ( = ?auto_14988 ?auto_14990 ) ) ( not ( = ?auto_14988 ?auto_15004 ) ) ( not ( = ?auto_14990 ?auto_15015 ) ) ( not ( = ?auto_14990 ?auto_15018 ) ) ( not ( = ?auto_14990 ?auto_15013 ) ) ( not ( = ?auto_14990 ?auto_15011 ) ) ( not ( = ?auto_14990 ?auto_15008 ) ) ( not ( = ?auto_14990 ?auto_15010 ) ) ( not ( = ?auto_15012 ?auto_15016 ) ) ( not ( = ?auto_15012 ?auto_15009 ) ) ( not ( = ?auto_15012 ?auto_15003 ) ) ( not ( = ?auto_15014 ?auto_15007 ) ) ( not ( = ?auto_15014 ?auto_15006 ) ) ( not ( = ?auto_15014 ?auto_15001 ) ) ( not ( = ?auto_15004 ?auto_15015 ) ) ( not ( = ?auto_15004 ?auto_15018 ) ) ( not ( = ?auto_15004 ?auto_15013 ) ) ( not ( = ?auto_15004 ?auto_15011 ) ) ( not ( = ?auto_15004 ?auto_15008 ) ) ( not ( = ?auto_15004 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14991 ) ) ( not ( = ?auto_14983 ?auto_15017 ) ) ( not ( = ?auto_14984 ?auto_14991 ) ) ( not ( = ?auto_14984 ?auto_15017 ) ) ( not ( = ?auto_14985 ?auto_14991 ) ) ( not ( = ?auto_14985 ?auto_15017 ) ) ( not ( = ?auto_14986 ?auto_14991 ) ) ( not ( = ?auto_14986 ?auto_15017 ) ) ( not ( = ?auto_14987 ?auto_14991 ) ) ( not ( = ?auto_14987 ?auto_15017 ) ) ( not ( = ?auto_14988 ?auto_14991 ) ) ( not ( = ?auto_14988 ?auto_15017 ) ) ( not ( = ?auto_14989 ?auto_14991 ) ) ( not ( = ?auto_14989 ?auto_15017 ) ) ( not ( = ?auto_14991 ?auto_15004 ) ) ( not ( = ?auto_14991 ?auto_15015 ) ) ( not ( = ?auto_14991 ?auto_15018 ) ) ( not ( = ?auto_14991 ?auto_15013 ) ) ( not ( = ?auto_14991 ?auto_15011 ) ) ( not ( = ?auto_14991 ?auto_15008 ) ) ( not ( = ?auto_14991 ?auto_15010 ) ) ( not ( = ?auto_15005 ?auto_15012 ) ) ( not ( = ?auto_15005 ?auto_15016 ) ) ( not ( = ?auto_15005 ?auto_15009 ) ) ( not ( = ?auto_15005 ?auto_15003 ) ) ( not ( = ?auto_15000 ?auto_15014 ) ) ( not ( = ?auto_15000 ?auto_15007 ) ) ( not ( = ?auto_15000 ?auto_15006 ) ) ( not ( = ?auto_15000 ?auto_15001 ) ) ( not ( = ?auto_15017 ?auto_15004 ) ) ( not ( = ?auto_15017 ?auto_15015 ) ) ( not ( = ?auto_15017 ?auto_15018 ) ) ( not ( = ?auto_15017 ?auto_15013 ) ) ( not ( = ?auto_15017 ?auto_15011 ) ) ( not ( = ?auto_15017 ?auto_15008 ) ) ( not ( = ?auto_15017 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14992 ) ) ( not ( = ?auto_14983 ?auto_15002 ) ) ( not ( = ?auto_14984 ?auto_14992 ) ) ( not ( = ?auto_14984 ?auto_15002 ) ) ( not ( = ?auto_14985 ?auto_14992 ) ) ( not ( = ?auto_14985 ?auto_15002 ) ) ( not ( = ?auto_14986 ?auto_14992 ) ) ( not ( = ?auto_14986 ?auto_15002 ) ) ( not ( = ?auto_14987 ?auto_14992 ) ) ( not ( = ?auto_14987 ?auto_15002 ) ) ( not ( = ?auto_14988 ?auto_14992 ) ) ( not ( = ?auto_14988 ?auto_15002 ) ) ( not ( = ?auto_14989 ?auto_14992 ) ) ( not ( = ?auto_14989 ?auto_15002 ) ) ( not ( = ?auto_14990 ?auto_14992 ) ) ( not ( = ?auto_14990 ?auto_15002 ) ) ( not ( = ?auto_14992 ?auto_15017 ) ) ( not ( = ?auto_14992 ?auto_15004 ) ) ( not ( = ?auto_14992 ?auto_15015 ) ) ( not ( = ?auto_14992 ?auto_15018 ) ) ( not ( = ?auto_14992 ?auto_15013 ) ) ( not ( = ?auto_14992 ?auto_15011 ) ) ( not ( = ?auto_14992 ?auto_15008 ) ) ( not ( = ?auto_14992 ?auto_15010 ) ) ( not ( = ?auto_15002 ?auto_15017 ) ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15015 ) ) ( not ( = ?auto_15002 ?auto_15018 ) ) ( not ( = ?auto_15002 ?auto_15013 ) ) ( not ( = ?auto_15002 ?auto_15011 ) ) ( not ( = ?auto_15002 ?auto_15008 ) ) ( not ( = ?auto_15002 ?auto_15010 ) ) ( not ( = ?auto_14983 ?auto_14993 ) ) ( not ( = ?auto_14983 ?auto_14999 ) ) ( not ( = ?auto_14984 ?auto_14993 ) ) ( not ( = ?auto_14984 ?auto_14999 ) ) ( not ( = ?auto_14985 ?auto_14993 ) ) ( not ( = ?auto_14985 ?auto_14999 ) ) ( not ( = ?auto_14986 ?auto_14993 ) ) ( not ( = ?auto_14986 ?auto_14999 ) ) ( not ( = ?auto_14987 ?auto_14993 ) ) ( not ( = ?auto_14987 ?auto_14999 ) ) ( not ( = ?auto_14988 ?auto_14993 ) ) ( not ( = ?auto_14988 ?auto_14999 ) ) ( not ( = ?auto_14989 ?auto_14993 ) ) ( not ( = ?auto_14989 ?auto_14999 ) ) ( not ( = ?auto_14990 ?auto_14993 ) ) ( not ( = ?auto_14990 ?auto_14999 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14999 ) ) ( not ( = ?auto_14993 ?auto_15002 ) ) ( not ( = ?auto_14993 ?auto_15017 ) ) ( not ( = ?auto_14993 ?auto_15004 ) ) ( not ( = ?auto_14993 ?auto_15015 ) ) ( not ( = ?auto_14993 ?auto_15018 ) ) ( not ( = ?auto_14993 ?auto_15013 ) ) ( not ( = ?auto_14993 ?auto_15011 ) ) ( not ( = ?auto_14993 ?auto_15008 ) ) ( not ( = ?auto_14993 ?auto_15010 ) ) ( not ( = ?auto_14996 ?auto_15009 ) ) ( not ( = ?auto_14996 ?auto_15005 ) ) ( not ( = ?auto_14996 ?auto_15012 ) ) ( not ( = ?auto_14996 ?auto_15016 ) ) ( not ( = ?auto_14996 ?auto_15003 ) ) ( not ( = ?auto_14995 ?auto_15006 ) ) ( not ( = ?auto_14995 ?auto_15000 ) ) ( not ( = ?auto_14995 ?auto_15014 ) ) ( not ( = ?auto_14995 ?auto_15007 ) ) ( not ( = ?auto_14995 ?auto_15001 ) ) ( not ( = ?auto_14999 ?auto_15002 ) ) ( not ( = ?auto_14999 ?auto_15017 ) ) ( not ( = ?auto_14999 ?auto_15004 ) ) ( not ( = ?auto_14999 ?auto_15015 ) ) ( not ( = ?auto_14999 ?auto_15018 ) ) ( not ( = ?auto_14999 ?auto_15013 ) ) ( not ( = ?auto_14999 ?auto_15011 ) ) ( not ( = ?auto_14999 ?auto_15008 ) ) ( not ( = ?auto_14999 ?auto_15010 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14989 ?auto_14990 ?auto_14991 ?auto_14992 )
      ( MAKE-1CRATE ?auto_14992 ?auto_14993 )
      ( MAKE-10CRATE-VERIFY ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14989 ?auto_14990 ?auto_14991 ?auto_14992 ?auto_14993 ) )
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
      ?auto_15047 - SURFACE
      ?auto_15048 - SURFACE
      ?auto_15049 - SURFACE
      ?auto_15050 - SURFACE
      ?auto_15051 - SURFACE
      ?auto_15052 - SURFACE
    )
    :vars
    (
      ?auto_15054 - HOIST
      ?auto_15058 - PLACE
      ?auto_15055 - PLACE
      ?auto_15057 - HOIST
      ?auto_15053 - SURFACE
      ?auto_15061 - PLACE
      ?auto_15069 - HOIST
      ?auto_15059 - SURFACE
      ?auto_15062 - PLACE
      ?auto_15075 - HOIST
      ?auto_15063 - SURFACE
      ?auto_15065 - PLACE
      ?auto_15072 - HOIST
      ?auto_15079 - SURFACE
      ?auto_15076 - PLACE
      ?auto_15070 - HOIST
      ?auto_15064 - SURFACE
      ?auto_15078 - PLACE
      ?auto_15066 - HOIST
      ?auto_15080 - SURFACE
      ?auto_15073 - SURFACE
      ?auto_15074 - SURFACE
      ?auto_15067 - PLACE
      ?auto_15077 - HOIST
      ?auto_15060 - SURFACE
      ?auto_15071 - SURFACE
      ?auto_15068 - SURFACE
      ?auto_15056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15054 ?auto_15058 ) ( IS-CRATE ?auto_15052 ) ( not ( = ?auto_15055 ?auto_15058 ) ) ( HOIST-AT ?auto_15057 ?auto_15055 ) ( AVAILABLE ?auto_15057 ) ( SURFACE-AT ?auto_15052 ?auto_15055 ) ( ON ?auto_15052 ?auto_15053 ) ( CLEAR ?auto_15052 ) ( not ( = ?auto_15051 ?auto_15052 ) ) ( not ( = ?auto_15051 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15053 ) ) ( not ( = ?auto_15054 ?auto_15057 ) ) ( IS-CRATE ?auto_15051 ) ( not ( = ?auto_15061 ?auto_15058 ) ) ( HOIST-AT ?auto_15069 ?auto_15061 ) ( AVAILABLE ?auto_15069 ) ( SURFACE-AT ?auto_15051 ?auto_15061 ) ( ON ?auto_15051 ?auto_15059 ) ( CLEAR ?auto_15051 ) ( not ( = ?auto_15050 ?auto_15051 ) ) ( not ( = ?auto_15050 ?auto_15059 ) ) ( not ( = ?auto_15051 ?auto_15059 ) ) ( not ( = ?auto_15054 ?auto_15069 ) ) ( IS-CRATE ?auto_15050 ) ( not ( = ?auto_15062 ?auto_15058 ) ) ( HOIST-AT ?auto_15075 ?auto_15062 ) ( SURFACE-AT ?auto_15050 ?auto_15062 ) ( ON ?auto_15050 ?auto_15063 ) ( CLEAR ?auto_15050 ) ( not ( = ?auto_15049 ?auto_15050 ) ) ( not ( = ?auto_15049 ?auto_15063 ) ) ( not ( = ?auto_15050 ?auto_15063 ) ) ( not ( = ?auto_15054 ?auto_15075 ) ) ( IS-CRATE ?auto_15049 ) ( not ( = ?auto_15065 ?auto_15058 ) ) ( HOIST-AT ?auto_15072 ?auto_15065 ) ( AVAILABLE ?auto_15072 ) ( SURFACE-AT ?auto_15049 ?auto_15065 ) ( ON ?auto_15049 ?auto_15079 ) ( CLEAR ?auto_15049 ) ( not ( = ?auto_15048 ?auto_15049 ) ) ( not ( = ?auto_15048 ?auto_15079 ) ) ( not ( = ?auto_15049 ?auto_15079 ) ) ( not ( = ?auto_15054 ?auto_15072 ) ) ( IS-CRATE ?auto_15048 ) ( not ( = ?auto_15076 ?auto_15058 ) ) ( HOIST-AT ?auto_15070 ?auto_15076 ) ( AVAILABLE ?auto_15070 ) ( SURFACE-AT ?auto_15048 ?auto_15076 ) ( ON ?auto_15048 ?auto_15064 ) ( CLEAR ?auto_15048 ) ( not ( = ?auto_15047 ?auto_15048 ) ) ( not ( = ?auto_15047 ?auto_15064 ) ) ( not ( = ?auto_15048 ?auto_15064 ) ) ( not ( = ?auto_15054 ?auto_15070 ) ) ( IS-CRATE ?auto_15047 ) ( not ( = ?auto_15078 ?auto_15058 ) ) ( HOIST-AT ?auto_15066 ?auto_15078 ) ( SURFACE-AT ?auto_15047 ?auto_15078 ) ( ON ?auto_15047 ?auto_15080 ) ( CLEAR ?auto_15047 ) ( not ( = ?auto_15046 ?auto_15047 ) ) ( not ( = ?auto_15046 ?auto_15080 ) ) ( not ( = ?auto_15047 ?auto_15080 ) ) ( not ( = ?auto_15054 ?auto_15066 ) ) ( IS-CRATE ?auto_15046 ) ( AVAILABLE ?auto_15066 ) ( SURFACE-AT ?auto_15046 ?auto_15078 ) ( ON ?auto_15046 ?auto_15073 ) ( CLEAR ?auto_15046 ) ( not ( = ?auto_15045 ?auto_15046 ) ) ( not ( = ?auto_15045 ?auto_15073 ) ) ( not ( = ?auto_15046 ?auto_15073 ) ) ( IS-CRATE ?auto_15045 ) ( SURFACE-AT ?auto_15045 ?auto_15062 ) ( ON ?auto_15045 ?auto_15074 ) ( CLEAR ?auto_15045 ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15074 ) ) ( not ( = ?auto_15045 ?auto_15074 ) ) ( IS-CRATE ?auto_15044 ) ( not ( = ?auto_15067 ?auto_15058 ) ) ( HOIST-AT ?auto_15077 ?auto_15067 ) ( AVAILABLE ?auto_15077 ) ( SURFACE-AT ?auto_15044 ?auto_15067 ) ( ON ?auto_15044 ?auto_15060 ) ( CLEAR ?auto_15044 ) ( not ( = ?auto_15043 ?auto_15044 ) ) ( not ( = ?auto_15043 ?auto_15060 ) ) ( not ( = ?auto_15044 ?auto_15060 ) ) ( not ( = ?auto_15054 ?auto_15077 ) ) ( IS-CRATE ?auto_15043 ) ( SURFACE-AT ?auto_15043 ?auto_15062 ) ( ON ?auto_15043 ?auto_15071 ) ( CLEAR ?auto_15043 ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15071 ) ) ( not ( = ?auto_15043 ?auto_15071 ) ) ( SURFACE-AT ?auto_15041 ?auto_15058 ) ( CLEAR ?auto_15041 ) ( IS-CRATE ?auto_15042 ) ( AVAILABLE ?auto_15054 ) ( AVAILABLE ?auto_15075 ) ( SURFACE-AT ?auto_15042 ?auto_15062 ) ( ON ?auto_15042 ?auto_15068 ) ( CLEAR ?auto_15042 ) ( TRUCK-AT ?auto_15056 ?auto_15058 ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15068 ) ) ( not ( = ?auto_15042 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( not ( = ?auto_15041 ?auto_15071 ) ) ( not ( = ?auto_15043 ?auto_15068 ) ) ( not ( = ?auto_15071 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15044 ) ) ( not ( = ?auto_15041 ?auto_15060 ) ) ( not ( = ?auto_15042 ?auto_15044 ) ) ( not ( = ?auto_15042 ?auto_15060 ) ) ( not ( = ?auto_15044 ?auto_15071 ) ) ( not ( = ?auto_15044 ?auto_15068 ) ) ( not ( = ?auto_15067 ?auto_15062 ) ) ( not ( = ?auto_15077 ?auto_15075 ) ) ( not ( = ?auto_15060 ?auto_15071 ) ) ( not ( = ?auto_15060 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15045 ) ) ( not ( = ?auto_15041 ?auto_15074 ) ) ( not ( = ?auto_15042 ?auto_15045 ) ) ( not ( = ?auto_15042 ?auto_15074 ) ) ( not ( = ?auto_15043 ?auto_15045 ) ) ( not ( = ?auto_15043 ?auto_15074 ) ) ( not ( = ?auto_15045 ?auto_15060 ) ) ( not ( = ?auto_15045 ?auto_15071 ) ) ( not ( = ?auto_15045 ?auto_15068 ) ) ( not ( = ?auto_15074 ?auto_15060 ) ) ( not ( = ?auto_15074 ?auto_15071 ) ) ( not ( = ?auto_15074 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15046 ) ) ( not ( = ?auto_15041 ?auto_15073 ) ) ( not ( = ?auto_15042 ?auto_15046 ) ) ( not ( = ?auto_15042 ?auto_15073 ) ) ( not ( = ?auto_15043 ?auto_15046 ) ) ( not ( = ?auto_15043 ?auto_15073 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15073 ) ) ( not ( = ?auto_15046 ?auto_15074 ) ) ( not ( = ?auto_15046 ?auto_15060 ) ) ( not ( = ?auto_15046 ?auto_15071 ) ) ( not ( = ?auto_15046 ?auto_15068 ) ) ( not ( = ?auto_15078 ?auto_15062 ) ) ( not ( = ?auto_15078 ?auto_15067 ) ) ( not ( = ?auto_15066 ?auto_15075 ) ) ( not ( = ?auto_15066 ?auto_15077 ) ) ( not ( = ?auto_15073 ?auto_15074 ) ) ( not ( = ?auto_15073 ?auto_15060 ) ) ( not ( = ?auto_15073 ?auto_15071 ) ) ( not ( = ?auto_15073 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15047 ) ) ( not ( = ?auto_15041 ?auto_15080 ) ) ( not ( = ?auto_15042 ?auto_15047 ) ) ( not ( = ?auto_15042 ?auto_15080 ) ) ( not ( = ?auto_15043 ?auto_15047 ) ) ( not ( = ?auto_15043 ?auto_15080 ) ) ( not ( = ?auto_15044 ?auto_15047 ) ) ( not ( = ?auto_15044 ?auto_15080 ) ) ( not ( = ?auto_15045 ?auto_15047 ) ) ( not ( = ?auto_15045 ?auto_15080 ) ) ( not ( = ?auto_15047 ?auto_15073 ) ) ( not ( = ?auto_15047 ?auto_15074 ) ) ( not ( = ?auto_15047 ?auto_15060 ) ) ( not ( = ?auto_15047 ?auto_15071 ) ) ( not ( = ?auto_15047 ?auto_15068 ) ) ( not ( = ?auto_15080 ?auto_15073 ) ) ( not ( = ?auto_15080 ?auto_15074 ) ) ( not ( = ?auto_15080 ?auto_15060 ) ) ( not ( = ?auto_15080 ?auto_15071 ) ) ( not ( = ?auto_15080 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15048 ) ) ( not ( = ?auto_15041 ?auto_15064 ) ) ( not ( = ?auto_15042 ?auto_15048 ) ) ( not ( = ?auto_15042 ?auto_15064 ) ) ( not ( = ?auto_15043 ?auto_15048 ) ) ( not ( = ?auto_15043 ?auto_15064 ) ) ( not ( = ?auto_15044 ?auto_15048 ) ) ( not ( = ?auto_15044 ?auto_15064 ) ) ( not ( = ?auto_15045 ?auto_15048 ) ) ( not ( = ?auto_15045 ?auto_15064 ) ) ( not ( = ?auto_15046 ?auto_15048 ) ) ( not ( = ?auto_15046 ?auto_15064 ) ) ( not ( = ?auto_15048 ?auto_15080 ) ) ( not ( = ?auto_15048 ?auto_15073 ) ) ( not ( = ?auto_15048 ?auto_15074 ) ) ( not ( = ?auto_15048 ?auto_15060 ) ) ( not ( = ?auto_15048 ?auto_15071 ) ) ( not ( = ?auto_15048 ?auto_15068 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) ( not ( = ?auto_15076 ?auto_15062 ) ) ( not ( = ?auto_15076 ?auto_15067 ) ) ( not ( = ?auto_15070 ?auto_15066 ) ) ( not ( = ?auto_15070 ?auto_15075 ) ) ( not ( = ?auto_15070 ?auto_15077 ) ) ( not ( = ?auto_15064 ?auto_15080 ) ) ( not ( = ?auto_15064 ?auto_15073 ) ) ( not ( = ?auto_15064 ?auto_15074 ) ) ( not ( = ?auto_15064 ?auto_15060 ) ) ( not ( = ?auto_15064 ?auto_15071 ) ) ( not ( = ?auto_15064 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15049 ) ) ( not ( = ?auto_15041 ?auto_15079 ) ) ( not ( = ?auto_15042 ?auto_15049 ) ) ( not ( = ?auto_15042 ?auto_15079 ) ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( not ( = ?auto_15043 ?auto_15079 ) ) ( not ( = ?auto_15044 ?auto_15049 ) ) ( not ( = ?auto_15044 ?auto_15079 ) ) ( not ( = ?auto_15045 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15079 ) ) ( not ( = ?auto_15046 ?auto_15049 ) ) ( not ( = ?auto_15046 ?auto_15079 ) ) ( not ( = ?auto_15047 ?auto_15049 ) ) ( not ( = ?auto_15047 ?auto_15079 ) ) ( not ( = ?auto_15049 ?auto_15064 ) ) ( not ( = ?auto_15049 ?auto_15080 ) ) ( not ( = ?auto_15049 ?auto_15073 ) ) ( not ( = ?auto_15049 ?auto_15074 ) ) ( not ( = ?auto_15049 ?auto_15060 ) ) ( not ( = ?auto_15049 ?auto_15071 ) ) ( not ( = ?auto_15049 ?auto_15068 ) ) ( not ( = ?auto_15065 ?auto_15076 ) ) ( not ( = ?auto_15065 ?auto_15078 ) ) ( not ( = ?auto_15065 ?auto_15062 ) ) ( not ( = ?auto_15065 ?auto_15067 ) ) ( not ( = ?auto_15072 ?auto_15070 ) ) ( not ( = ?auto_15072 ?auto_15066 ) ) ( not ( = ?auto_15072 ?auto_15075 ) ) ( not ( = ?auto_15072 ?auto_15077 ) ) ( not ( = ?auto_15079 ?auto_15064 ) ) ( not ( = ?auto_15079 ?auto_15080 ) ) ( not ( = ?auto_15079 ?auto_15073 ) ) ( not ( = ?auto_15079 ?auto_15074 ) ) ( not ( = ?auto_15079 ?auto_15060 ) ) ( not ( = ?auto_15079 ?auto_15071 ) ) ( not ( = ?auto_15079 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15050 ) ) ( not ( = ?auto_15041 ?auto_15063 ) ) ( not ( = ?auto_15042 ?auto_15050 ) ) ( not ( = ?auto_15042 ?auto_15063 ) ) ( not ( = ?auto_15043 ?auto_15050 ) ) ( not ( = ?auto_15043 ?auto_15063 ) ) ( not ( = ?auto_15044 ?auto_15050 ) ) ( not ( = ?auto_15044 ?auto_15063 ) ) ( not ( = ?auto_15045 ?auto_15050 ) ) ( not ( = ?auto_15045 ?auto_15063 ) ) ( not ( = ?auto_15046 ?auto_15050 ) ) ( not ( = ?auto_15046 ?auto_15063 ) ) ( not ( = ?auto_15047 ?auto_15050 ) ) ( not ( = ?auto_15047 ?auto_15063 ) ) ( not ( = ?auto_15048 ?auto_15050 ) ) ( not ( = ?auto_15048 ?auto_15063 ) ) ( not ( = ?auto_15050 ?auto_15079 ) ) ( not ( = ?auto_15050 ?auto_15064 ) ) ( not ( = ?auto_15050 ?auto_15080 ) ) ( not ( = ?auto_15050 ?auto_15073 ) ) ( not ( = ?auto_15050 ?auto_15074 ) ) ( not ( = ?auto_15050 ?auto_15060 ) ) ( not ( = ?auto_15050 ?auto_15071 ) ) ( not ( = ?auto_15050 ?auto_15068 ) ) ( not ( = ?auto_15063 ?auto_15079 ) ) ( not ( = ?auto_15063 ?auto_15064 ) ) ( not ( = ?auto_15063 ?auto_15080 ) ) ( not ( = ?auto_15063 ?auto_15073 ) ) ( not ( = ?auto_15063 ?auto_15074 ) ) ( not ( = ?auto_15063 ?auto_15060 ) ) ( not ( = ?auto_15063 ?auto_15071 ) ) ( not ( = ?auto_15063 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15051 ) ) ( not ( = ?auto_15041 ?auto_15059 ) ) ( not ( = ?auto_15042 ?auto_15051 ) ) ( not ( = ?auto_15042 ?auto_15059 ) ) ( not ( = ?auto_15043 ?auto_15051 ) ) ( not ( = ?auto_15043 ?auto_15059 ) ) ( not ( = ?auto_15044 ?auto_15051 ) ) ( not ( = ?auto_15044 ?auto_15059 ) ) ( not ( = ?auto_15045 ?auto_15051 ) ) ( not ( = ?auto_15045 ?auto_15059 ) ) ( not ( = ?auto_15046 ?auto_15051 ) ) ( not ( = ?auto_15046 ?auto_15059 ) ) ( not ( = ?auto_15047 ?auto_15051 ) ) ( not ( = ?auto_15047 ?auto_15059 ) ) ( not ( = ?auto_15048 ?auto_15051 ) ) ( not ( = ?auto_15048 ?auto_15059 ) ) ( not ( = ?auto_15049 ?auto_15051 ) ) ( not ( = ?auto_15049 ?auto_15059 ) ) ( not ( = ?auto_15051 ?auto_15063 ) ) ( not ( = ?auto_15051 ?auto_15079 ) ) ( not ( = ?auto_15051 ?auto_15064 ) ) ( not ( = ?auto_15051 ?auto_15080 ) ) ( not ( = ?auto_15051 ?auto_15073 ) ) ( not ( = ?auto_15051 ?auto_15074 ) ) ( not ( = ?auto_15051 ?auto_15060 ) ) ( not ( = ?auto_15051 ?auto_15071 ) ) ( not ( = ?auto_15051 ?auto_15068 ) ) ( not ( = ?auto_15061 ?auto_15062 ) ) ( not ( = ?auto_15061 ?auto_15065 ) ) ( not ( = ?auto_15061 ?auto_15076 ) ) ( not ( = ?auto_15061 ?auto_15078 ) ) ( not ( = ?auto_15061 ?auto_15067 ) ) ( not ( = ?auto_15069 ?auto_15075 ) ) ( not ( = ?auto_15069 ?auto_15072 ) ) ( not ( = ?auto_15069 ?auto_15070 ) ) ( not ( = ?auto_15069 ?auto_15066 ) ) ( not ( = ?auto_15069 ?auto_15077 ) ) ( not ( = ?auto_15059 ?auto_15063 ) ) ( not ( = ?auto_15059 ?auto_15079 ) ) ( not ( = ?auto_15059 ?auto_15064 ) ) ( not ( = ?auto_15059 ?auto_15080 ) ) ( not ( = ?auto_15059 ?auto_15073 ) ) ( not ( = ?auto_15059 ?auto_15074 ) ) ( not ( = ?auto_15059 ?auto_15060 ) ) ( not ( = ?auto_15059 ?auto_15071 ) ) ( not ( = ?auto_15059 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15052 ) ) ( not ( = ?auto_15041 ?auto_15053 ) ) ( not ( = ?auto_15042 ?auto_15052 ) ) ( not ( = ?auto_15042 ?auto_15053 ) ) ( not ( = ?auto_15043 ?auto_15052 ) ) ( not ( = ?auto_15043 ?auto_15053 ) ) ( not ( = ?auto_15044 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15053 ) ) ( not ( = ?auto_15045 ?auto_15052 ) ) ( not ( = ?auto_15045 ?auto_15053 ) ) ( not ( = ?auto_15046 ?auto_15052 ) ) ( not ( = ?auto_15046 ?auto_15053 ) ) ( not ( = ?auto_15047 ?auto_15052 ) ) ( not ( = ?auto_15047 ?auto_15053 ) ) ( not ( = ?auto_15048 ?auto_15052 ) ) ( not ( = ?auto_15048 ?auto_15053 ) ) ( not ( = ?auto_15049 ?auto_15052 ) ) ( not ( = ?auto_15049 ?auto_15053 ) ) ( not ( = ?auto_15050 ?auto_15052 ) ) ( not ( = ?auto_15050 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15059 ) ) ( not ( = ?auto_15052 ?auto_15063 ) ) ( not ( = ?auto_15052 ?auto_15079 ) ) ( not ( = ?auto_15052 ?auto_15064 ) ) ( not ( = ?auto_15052 ?auto_15080 ) ) ( not ( = ?auto_15052 ?auto_15073 ) ) ( not ( = ?auto_15052 ?auto_15074 ) ) ( not ( = ?auto_15052 ?auto_15060 ) ) ( not ( = ?auto_15052 ?auto_15071 ) ) ( not ( = ?auto_15052 ?auto_15068 ) ) ( not ( = ?auto_15055 ?auto_15061 ) ) ( not ( = ?auto_15055 ?auto_15062 ) ) ( not ( = ?auto_15055 ?auto_15065 ) ) ( not ( = ?auto_15055 ?auto_15076 ) ) ( not ( = ?auto_15055 ?auto_15078 ) ) ( not ( = ?auto_15055 ?auto_15067 ) ) ( not ( = ?auto_15057 ?auto_15069 ) ) ( not ( = ?auto_15057 ?auto_15075 ) ) ( not ( = ?auto_15057 ?auto_15072 ) ) ( not ( = ?auto_15057 ?auto_15070 ) ) ( not ( = ?auto_15057 ?auto_15066 ) ) ( not ( = ?auto_15057 ?auto_15077 ) ) ( not ( = ?auto_15053 ?auto_15059 ) ) ( not ( = ?auto_15053 ?auto_15063 ) ) ( not ( = ?auto_15053 ?auto_15079 ) ) ( not ( = ?auto_15053 ?auto_15064 ) ) ( not ( = ?auto_15053 ?auto_15080 ) ) ( not ( = ?auto_15053 ?auto_15073 ) ) ( not ( = ?auto_15053 ?auto_15074 ) ) ( not ( = ?auto_15053 ?auto_15060 ) ) ( not ( = ?auto_15053 ?auto_15071 ) ) ( not ( = ?auto_15053 ?auto_15068 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15041 ?auto_15042 ?auto_15043 ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15047 ?auto_15048 ?auto_15049 ?auto_15050 ?auto_15051 )
      ( MAKE-1CRATE ?auto_15051 ?auto_15052 )
      ( MAKE-11CRATE-VERIFY ?auto_15041 ?auto_15042 ?auto_15043 ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15047 ?auto_15048 ?auto_15049 ?auto_15050 ?auto_15051 ?auto_15052 ) )
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
      ?auto_15110 - SURFACE
      ?auto_15111 - SURFACE
      ?auto_15112 - SURFACE
      ?auto_15113 - SURFACE
      ?auto_15114 - SURFACE
      ?auto_15115 - SURFACE
      ?auto_15116 - SURFACE
    )
    :vars
    (
      ?auto_15117 - HOIST
      ?auto_15118 - PLACE
      ?auto_15122 - PLACE
      ?auto_15119 - HOIST
      ?auto_15121 - SURFACE
      ?auto_15132 - PLACE
      ?auto_15141 - HOIST
      ?auto_15129 - SURFACE
      ?auto_15124 - SURFACE
      ?auto_15133 - PLACE
      ?auto_15127 - HOIST
      ?auto_15136 - SURFACE
      ?auto_15143 - PLACE
      ?auto_15142 - HOIST
      ?auto_15130 - SURFACE
      ?auto_15126 - PLACE
      ?auto_15140 - HOIST
      ?auto_15139 - SURFACE
      ?auto_15128 - PLACE
      ?auto_15145 - HOIST
      ?auto_15125 - SURFACE
      ?auto_15137 - SURFACE
      ?auto_15134 - SURFACE
      ?auto_15135 - PLACE
      ?auto_15144 - HOIST
      ?auto_15123 - SURFACE
      ?auto_15138 - SURFACE
      ?auto_15131 - SURFACE
      ?auto_15120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15117 ?auto_15118 ) ( IS-CRATE ?auto_15116 ) ( not ( = ?auto_15122 ?auto_15118 ) ) ( HOIST-AT ?auto_15119 ?auto_15122 ) ( SURFACE-AT ?auto_15116 ?auto_15122 ) ( ON ?auto_15116 ?auto_15121 ) ( CLEAR ?auto_15116 ) ( not ( = ?auto_15115 ?auto_15116 ) ) ( not ( = ?auto_15115 ?auto_15121 ) ) ( not ( = ?auto_15116 ?auto_15121 ) ) ( not ( = ?auto_15117 ?auto_15119 ) ) ( IS-CRATE ?auto_15115 ) ( not ( = ?auto_15132 ?auto_15118 ) ) ( HOIST-AT ?auto_15141 ?auto_15132 ) ( AVAILABLE ?auto_15141 ) ( SURFACE-AT ?auto_15115 ?auto_15132 ) ( ON ?auto_15115 ?auto_15129 ) ( CLEAR ?auto_15115 ) ( not ( = ?auto_15114 ?auto_15115 ) ) ( not ( = ?auto_15114 ?auto_15129 ) ) ( not ( = ?auto_15115 ?auto_15129 ) ) ( not ( = ?auto_15117 ?auto_15141 ) ) ( IS-CRATE ?auto_15114 ) ( AVAILABLE ?auto_15119 ) ( SURFACE-AT ?auto_15114 ?auto_15122 ) ( ON ?auto_15114 ?auto_15124 ) ( CLEAR ?auto_15114 ) ( not ( = ?auto_15113 ?auto_15114 ) ) ( not ( = ?auto_15113 ?auto_15124 ) ) ( not ( = ?auto_15114 ?auto_15124 ) ) ( IS-CRATE ?auto_15113 ) ( not ( = ?auto_15133 ?auto_15118 ) ) ( HOIST-AT ?auto_15127 ?auto_15133 ) ( SURFACE-AT ?auto_15113 ?auto_15133 ) ( ON ?auto_15113 ?auto_15136 ) ( CLEAR ?auto_15113 ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15112 ?auto_15136 ) ) ( not ( = ?auto_15113 ?auto_15136 ) ) ( not ( = ?auto_15117 ?auto_15127 ) ) ( IS-CRATE ?auto_15112 ) ( not ( = ?auto_15143 ?auto_15118 ) ) ( HOIST-AT ?auto_15142 ?auto_15143 ) ( AVAILABLE ?auto_15142 ) ( SURFACE-AT ?auto_15112 ?auto_15143 ) ( ON ?auto_15112 ?auto_15130 ) ( CLEAR ?auto_15112 ) ( not ( = ?auto_15111 ?auto_15112 ) ) ( not ( = ?auto_15111 ?auto_15130 ) ) ( not ( = ?auto_15112 ?auto_15130 ) ) ( not ( = ?auto_15117 ?auto_15142 ) ) ( IS-CRATE ?auto_15111 ) ( not ( = ?auto_15126 ?auto_15118 ) ) ( HOIST-AT ?auto_15140 ?auto_15126 ) ( AVAILABLE ?auto_15140 ) ( SURFACE-AT ?auto_15111 ?auto_15126 ) ( ON ?auto_15111 ?auto_15139 ) ( CLEAR ?auto_15111 ) ( not ( = ?auto_15110 ?auto_15111 ) ) ( not ( = ?auto_15110 ?auto_15139 ) ) ( not ( = ?auto_15111 ?auto_15139 ) ) ( not ( = ?auto_15117 ?auto_15140 ) ) ( IS-CRATE ?auto_15110 ) ( not ( = ?auto_15128 ?auto_15118 ) ) ( HOIST-AT ?auto_15145 ?auto_15128 ) ( SURFACE-AT ?auto_15110 ?auto_15128 ) ( ON ?auto_15110 ?auto_15125 ) ( CLEAR ?auto_15110 ) ( not ( = ?auto_15109 ?auto_15110 ) ) ( not ( = ?auto_15109 ?auto_15125 ) ) ( not ( = ?auto_15110 ?auto_15125 ) ) ( not ( = ?auto_15117 ?auto_15145 ) ) ( IS-CRATE ?auto_15109 ) ( AVAILABLE ?auto_15145 ) ( SURFACE-AT ?auto_15109 ?auto_15128 ) ( ON ?auto_15109 ?auto_15137 ) ( CLEAR ?auto_15109 ) ( not ( = ?auto_15108 ?auto_15109 ) ) ( not ( = ?auto_15108 ?auto_15137 ) ) ( not ( = ?auto_15109 ?auto_15137 ) ) ( IS-CRATE ?auto_15108 ) ( SURFACE-AT ?auto_15108 ?auto_15133 ) ( ON ?auto_15108 ?auto_15134 ) ( CLEAR ?auto_15108 ) ( not ( = ?auto_15107 ?auto_15108 ) ) ( not ( = ?auto_15107 ?auto_15134 ) ) ( not ( = ?auto_15108 ?auto_15134 ) ) ( IS-CRATE ?auto_15107 ) ( not ( = ?auto_15135 ?auto_15118 ) ) ( HOIST-AT ?auto_15144 ?auto_15135 ) ( AVAILABLE ?auto_15144 ) ( SURFACE-AT ?auto_15107 ?auto_15135 ) ( ON ?auto_15107 ?auto_15123 ) ( CLEAR ?auto_15107 ) ( not ( = ?auto_15106 ?auto_15107 ) ) ( not ( = ?auto_15106 ?auto_15123 ) ) ( not ( = ?auto_15107 ?auto_15123 ) ) ( not ( = ?auto_15117 ?auto_15144 ) ) ( IS-CRATE ?auto_15106 ) ( SURFACE-AT ?auto_15106 ?auto_15133 ) ( ON ?auto_15106 ?auto_15138 ) ( CLEAR ?auto_15106 ) ( not ( = ?auto_15105 ?auto_15106 ) ) ( not ( = ?auto_15105 ?auto_15138 ) ) ( not ( = ?auto_15106 ?auto_15138 ) ) ( SURFACE-AT ?auto_15104 ?auto_15118 ) ( CLEAR ?auto_15104 ) ( IS-CRATE ?auto_15105 ) ( AVAILABLE ?auto_15117 ) ( AVAILABLE ?auto_15127 ) ( SURFACE-AT ?auto_15105 ?auto_15133 ) ( ON ?auto_15105 ?auto_15131 ) ( CLEAR ?auto_15105 ) ( TRUCK-AT ?auto_15120 ?auto_15118 ) ( not ( = ?auto_15104 ?auto_15105 ) ) ( not ( = ?auto_15104 ?auto_15131 ) ) ( not ( = ?auto_15105 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15106 ) ) ( not ( = ?auto_15104 ?auto_15138 ) ) ( not ( = ?auto_15106 ?auto_15131 ) ) ( not ( = ?auto_15138 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15107 ) ) ( not ( = ?auto_15104 ?auto_15123 ) ) ( not ( = ?auto_15105 ?auto_15107 ) ) ( not ( = ?auto_15105 ?auto_15123 ) ) ( not ( = ?auto_15107 ?auto_15138 ) ) ( not ( = ?auto_15107 ?auto_15131 ) ) ( not ( = ?auto_15135 ?auto_15133 ) ) ( not ( = ?auto_15144 ?auto_15127 ) ) ( not ( = ?auto_15123 ?auto_15138 ) ) ( not ( = ?auto_15123 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15108 ) ) ( not ( = ?auto_15104 ?auto_15134 ) ) ( not ( = ?auto_15105 ?auto_15108 ) ) ( not ( = ?auto_15105 ?auto_15134 ) ) ( not ( = ?auto_15106 ?auto_15108 ) ) ( not ( = ?auto_15106 ?auto_15134 ) ) ( not ( = ?auto_15108 ?auto_15123 ) ) ( not ( = ?auto_15108 ?auto_15138 ) ) ( not ( = ?auto_15108 ?auto_15131 ) ) ( not ( = ?auto_15134 ?auto_15123 ) ) ( not ( = ?auto_15134 ?auto_15138 ) ) ( not ( = ?auto_15134 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15109 ) ) ( not ( = ?auto_15104 ?auto_15137 ) ) ( not ( = ?auto_15105 ?auto_15109 ) ) ( not ( = ?auto_15105 ?auto_15137 ) ) ( not ( = ?auto_15106 ?auto_15109 ) ) ( not ( = ?auto_15106 ?auto_15137 ) ) ( not ( = ?auto_15107 ?auto_15109 ) ) ( not ( = ?auto_15107 ?auto_15137 ) ) ( not ( = ?auto_15109 ?auto_15134 ) ) ( not ( = ?auto_15109 ?auto_15123 ) ) ( not ( = ?auto_15109 ?auto_15138 ) ) ( not ( = ?auto_15109 ?auto_15131 ) ) ( not ( = ?auto_15128 ?auto_15133 ) ) ( not ( = ?auto_15128 ?auto_15135 ) ) ( not ( = ?auto_15145 ?auto_15127 ) ) ( not ( = ?auto_15145 ?auto_15144 ) ) ( not ( = ?auto_15137 ?auto_15134 ) ) ( not ( = ?auto_15137 ?auto_15123 ) ) ( not ( = ?auto_15137 ?auto_15138 ) ) ( not ( = ?auto_15137 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15110 ) ) ( not ( = ?auto_15104 ?auto_15125 ) ) ( not ( = ?auto_15105 ?auto_15110 ) ) ( not ( = ?auto_15105 ?auto_15125 ) ) ( not ( = ?auto_15106 ?auto_15110 ) ) ( not ( = ?auto_15106 ?auto_15125 ) ) ( not ( = ?auto_15107 ?auto_15110 ) ) ( not ( = ?auto_15107 ?auto_15125 ) ) ( not ( = ?auto_15108 ?auto_15110 ) ) ( not ( = ?auto_15108 ?auto_15125 ) ) ( not ( = ?auto_15110 ?auto_15137 ) ) ( not ( = ?auto_15110 ?auto_15134 ) ) ( not ( = ?auto_15110 ?auto_15123 ) ) ( not ( = ?auto_15110 ?auto_15138 ) ) ( not ( = ?auto_15110 ?auto_15131 ) ) ( not ( = ?auto_15125 ?auto_15137 ) ) ( not ( = ?auto_15125 ?auto_15134 ) ) ( not ( = ?auto_15125 ?auto_15123 ) ) ( not ( = ?auto_15125 ?auto_15138 ) ) ( not ( = ?auto_15125 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15111 ) ) ( not ( = ?auto_15104 ?auto_15139 ) ) ( not ( = ?auto_15105 ?auto_15111 ) ) ( not ( = ?auto_15105 ?auto_15139 ) ) ( not ( = ?auto_15106 ?auto_15111 ) ) ( not ( = ?auto_15106 ?auto_15139 ) ) ( not ( = ?auto_15107 ?auto_15111 ) ) ( not ( = ?auto_15107 ?auto_15139 ) ) ( not ( = ?auto_15108 ?auto_15111 ) ) ( not ( = ?auto_15108 ?auto_15139 ) ) ( not ( = ?auto_15109 ?auto_15111 ) ) ( not ( = ?auto_15109 ?auto_15139 ) ) ( not ( = ?auto_15111 ?auto_15125 ) ) ( not ( = ?auto_15111 ?auto_15137 ) ) ( not ( = ?auto_15111 ?auto_15134 ) ) ( not ( = ?auto_15111 ?auto_15123 ) ) ( not ( = ?auto_15111 ?auto_15138 ) ) ( not ( = ?auto_15111 ?auto_15131 ) ) ( not ( = ?auto_15126 ?auto_15128 ) ) ( not ( = ?auto_15126 ?auto_15133 ) ) ( not ( = ?auto_15126 ?auto_15135 ) ) ( not ( = ?auto_15140 ?auto_15145 ) ) ( not ( = ?auto_15140 ?auto_15127 ) ) ( not ( = ?auto_15140 ?auto_15144 ) ) ( not ( = ?auto_15139 ?auto_15125 ) ) ( not ( = ?auto_15139 ?auto_15137 ) ) ( not ( = ?auto_15139 ?auto_15134 ) ) ( not ( = ?auto_15139 ?auto_15123 ) ) ( not ( = ?auto_15139 ?auto_15138 ) ) ( not ( = ?auto_15139 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15112 ) ) ( not ( = ?auto_15104 ?auto_15130 ) ) ( not ( = ?auto_15105 ?auto_15112 ) ) ( not ( = ?auto_15105 ?auto_15130 ) ) ( not ( = ?auto_15106 ?auto_15112 ) ) ( not ( = ?auto_15106 ?auto_15130 ) ) ( not ( = ?auto_15107 ?auto_15112 ) ) ( not ( = ?auto_15107 ?auto_15130 ) ) ( not ( = ?auto_15108 ?auto_15112 ) ) ( not ( = ?auto_15108 ?auto_15130 ) ) ( not ( = ?auto_15109 ?auto_15112 ) ) ( not ( = ?auto_15109 ?auto_15130 ) ) ( not ( = ?auto_15110 ?auto_15112 ) ) ( not ( = ?auto_15110 ?auto_15130 ) ) ( not ( = ?auto_15112 ?auto_15139 ) ) ( not ( = ?auto_15112 ?auto_15125 ) ) ( not ( = ?auto_15112 ?auto_15137 ) ) ( not ( = ?auto_15112 ?auto_15134 ) ) ( not ( = ?auto_15112 ?auto_15123 ) ) ( not ( = ?auto_15112 ?auto_15138 ) ) ( not ( = ?auto_15112 ?auto_15131 ) ) ( not ( = ?auto_15143 ?auto_15126 ) ) ( not ( = ?auto_15143 ?auto_15128 ) ) ( not ( = ?auto_15143 ?auto_15133 ) ) ( not ( = ?auto_15143 ?auto_15135 ) ) ( not ( = ?auto_15142 ?auto_15140 ) ) ( not ( = ?auto_15142 ?auto_15145 ) ) ( not ( = ?auto_15142 ?auto_15127 ) ) ( not ( = ?auto_15142 ?auto_15144 ) ) ( not ( = ?auto_15130 ?auto_15139 ) ) ( not ( = ?auto_15130 ?auto_15125 ) ) ( not ( = ?auto_15130 ?auto_15137 ) ) ( not ( = ?auto_15130 ?auto_15134 ) ) ( not ( = ?auto_15130 ?auto_15123 ) ) ( not ( = ?auto_15130 ?auto_15138 ) ) ( not ( = ?auto_15130 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15113 ) ) ( not ( = ?auto_15104 ?auto_15136 ) ) ( not ( = ?auto_15105 ?auto_15113 ) ) ( not ( = ?auto_15105 ?auto_15136 ) ) ( not ( = ?auto_15106 ?auto_15113 ) ) ( not ( = ?auto_15106 ?auto_15136 ) ) ( not ( = ?auto_15107 ?auto_15113 ) ) ( not ( = ?auto_15107 ?auto_15136 ) ) ( not ( = ?auto_15108 ?auto_15113 ) ) ( not ( = ?auto_15108 ?auto_15136 ) ) ( not ( = ?auto_15109 ?auto_15113 ) ) ( not ( = ?auto_15109 ?auto_15136 ) ) ( not ( = ?auto_15110 ?auto_15113 ) ) ( not ( = ?auto_15110 ?auto_15136 ) ) ( not ( = ?auto_15111 ?auto_15113 ) ) ( not ( = ?auto_15111 ?auto_15136 ) ) ( not ( = ?auto_15113 ?auto_15130 ) ) ( not ( = ?auto_15113 ?auto_15139 ) ) ( not ( = ?auto_15113 ?auto_15125 ) ) ( not ( = ?auto_15113 ?auto_15137 ) ) ( not ( = ?auto_15113 ?auto_15134 ) ) ( not ( = ?auto_15113 ?auto_15123 ) ) ( not ( = ?auto_15113 ?auto_15138 ) ) ( not ( = ?auto_15113 ?auto_15131 ) ) ( not ( = ?auto_15136 ?auto_15130 ) ) ( not ( = ?auto_15136 ?auto_15139 ) ) ( not ( = ?auto_15136 ?auto_15125 ) ) ( not ( = ?auto_15136 ?auto_15137 ) ) ( not ( = ?auto_15136 ?auto_15134 ) ) ( not ( = ?auto_15136 ?auto_15123 ) ) ( not ( = ?auto_15136 ?auto_15138 ) ) ( not ( = ?auto_15136 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15114 ) ) ( not ( = ?auto_15104 ?auto_15124 ) ) ( not ( = ?auto_15105 ?auto_15114 ) ) ( not ( = ?auto_15105 ?auto_15124 ) ) ( not ( = ?auto_15106 ?auto_15114 ) ) ( not ( = ?auto_15106 ?auto_15124 ) ) ( not ( = ?auto_15107 ?auto_15114 ) ) ( not ( = ?auto_15107 ?auto_15124 ) ) ( not ( = ?auto_15108 ?auto_15114 ) ) ( not ( = ?auto_15108 ?auto_15124 ) ) ( not ( = ?auto_15109 ?auto_15114 ) ) ( not ( = ?auto_15109 ?auto_15124 ) ) ( not ( = ?auto_15110 ?auto_15114 ) ) ( not ( = ?auto_15110 ?auto_15124 ) ) ( not ( = ?auto_15111 ?auto_15114 ) ) ( not ( = ?auto_15111 ?auto_15124 ) ) ( not ( = ?auto_15112 ?auto_15114 ) ) ( not ( = ?auto_15112 ?auto_15124 ) ) ( not ( = ?auto_15114 ?auto_15136 ) ) ( not ( = ?auto_15114 ?auto_15130 ) ) ( not ( = ?auto_15114 ?auto_15139 ) ) ( not ( = ?auto_15114 ?auto_15125 ) ) ( not ( = ?auto_15114 ?auto_15137 ) ) ( not ( = ?auto_15114 ?auto_15134 ) ) ( not ( = ?auto_15114 ?auto_15123 ) ) ( not ( = ?auto_15114 ?auto_15138 ) ) ( not ( = ?auto_15114 ?auto_15131 ) ) ( not ( = ?auto_15122 ?auto_15133 ) ) ( not ( = ?auto_15122 ?auto_15143 ) ) ( not ( = ?auto_15122 ?auto_15126 ) ) ( not ( = ?auto_15122 ?auto_15128 ) ) ( not ( = ?auto_15122 ?auto_15135 ) ) ( not ( = ?auto_15119 ?auto_15127 ) ) ( not ( = ?auto_15119 ?auto_15142 ) ) ( not ( = ?auto_15119 ?auto_15140 ) ) ( not ( = ?auto_15119 ?auto_15145 ) ) ( not ( = ?auto_15119 ?auto_15144 ) ) ( not ( = ?auto_15124 ?auto_15136 ) ) ( not ( = ?auto_15124 ?auto_15130 ) ) ( not ( = ?auto_15124 ?auto_15139 ) ) ( not ( = ?auto_15124 ?auto_15125 ) ) ( not ( = ?auto_15124 ?auto_15137 ) ) ( not ( = ?auto_15124 ?auto_15134 ) ) ( not ( = ?auto_15124 ?auto_15123 ) ) ( not ( = ?auto_15124 ?auto_15138 ) ) ( not ( = ?auto_15124 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15115 ) ) ( not ( = ?auto_15104 ?auto_15129 ) ) ( not ( = ?auto_15105 ?auto_15115 ) ) ( not ( = ?auto_15105 ?auto_15129 ) ) ( not ( = ?auto_15106 ?auto_15115 ) ) ( not ( = ?auto_15106 ?auto_15129 ) ) ( not ( = ?auto_15107 ?auto_15115 ) ) ( not ( = ?auto_15107 ?auto_15129 ) ) ( not ( = ?auto_15108 ?auto_15115 ) ) ( not ( = ?auto_15108 ?auto_15129 ) ) ( not ( = ?auto_15109 ?auto_15115 ) ) ( not ( = ?auto_15109 ?auto_15129 ) ) ( not ( = ?auto_15110 ?auto_15115 ) ) ( not ( = ?auto_15110 ?auto_15129 ) ) ( not ( = ?auto_15111 ?auto_15115 ) ) ( not ( = ?auto_15111 ?auto_15129 ) ) ( not ( = ?auto_15112 ?auto_15115 ) ) ( not ( = ?auto_15112 ?auto_15129 ) ) ( not ( = ?auto_15113 ?auto_15115 ) ) ( not ( = ?auto_15113 ?auto_15129 ) ) ( not ( = ?auto_15115 ?auto_15124 ) ) ( not ( = ?auto_15115 ?auto_15136 ) ) ( not ( = ?auto_15115 ?auto_15130 ) ) ( not ( = ?auto_15115 ?auto_15139 ) ) ( not ( = ?auto_15115 ?auto_15125 ) ) ( not ( = ?auto_15115 ?auto_15137 ) ) ( not ( = ?auto_15115 ?auto_15134 ) ) ( not ( = ?auto_15115 ?auto_15123 ) ) ( not ( = ?auto_15115 ?auto_15138 ) ) ( not ( = ?auto_15115 ?auto_15131 ) ) ( not ( = ?auto_15132 ?auto_15122 ) ) ( not ( = ?auto_15132 ?auto_15133 ) ) ( not ( = ?auto_15132 ?auto_15143 ) ) ( not ( = ?auto_15132 ?auto_15126 ) ) ( not ( = ?auto_15132 ?auto_15128 ) ) ( not ( = ?auto_15132 ?auto_15135 ) ) ( not ( = ?auto_15141 ?auto_15119 ) ) ( not ( = ?auto_15141 ?auto_15127 ) ) ( not ( = ?auto_15141 ?auto_15142 ) ) ( not ( = ?auto_15141 ?auto_15140 ) ) ( not ( = ?auto_15141 ?auto_15145 ) ) ( not ( = ?auto_15141 ?auto_15144 ) ) ( not ( = ?auto_15129 ?auto_15124 ) ) ( not ( = ?auto_15129 ?auto_15136 ) ) ( not ( = ?auto_15129 ?auto_15130 ) ) ( not ( = ?auto_15129 ?auto_15139 ) ) ( not ( = ?auto_15129 ?auto_15125 ) ) ( not ( = ?auto_15129 ?auto_15137 ) ) ( not ( = ?auto_15129 ?auto_15134 ) ) ( not ( = ?auto_15129 ?auto_15123 ) ) ( not ( = ?auto_15129 ?auto_15138 ) ) ( not ( = ?auto_15129 ?auto_15131 ) ) ( not ( = ?auto_15104 ?auto_15116 ) ) ( not ( = ?auto_15104 ?auto_15121 ) ) ( not ( = ?auto_15105 ?auto_15116 ) ) ( not ( = ?auto_15105 ?auto_15121 ) ) ( not ( = ?auto_15106 ?auto_15116 ) ) ( not ( = ?auto_15106 ?auto_15121 ) ) ( not ( = ?auto_15107 ?auto_15116 ) ) ( not ( = ?auto_15107 ?auto_15121 ) ) ( not ( = ?auto_15108 ?auto_15116 ) ) ( not ( = ?auto_15108 ?auto_15121 ) ) ( not ( = ?auto_15109 ?auto_15116 ) ) ( not ( = ?auto_15109 ?auto_15121 ) ) ( not ( = ?auto_15110 ?auto_15116 ) ) ( not ( = ?auto_15110 ?auto_15121 ) ) ( not ( = ?auto_15111 ?auto_15116 ) ) ( not ( = ?auto_15111 ?auto_15121 ) ) ( not ( = ?auto_15112 ?auto_15116 ) ) ( not ( = ?auto_15112 ?auto_15121 ) ) ( not ( = ?auto_15113 ?auto_15116 ) ) ( not ( = ?auto_15113 ?auto_15121 ) ) ( not ( = ?auto_15114 ?auto_15116 ) ) ( not ( = ?auto_15114 ?auto_15121 ) ) ( not ( = ?auto_15116 ?auto_15129 ) ) ( not ( = ?auto_15116 ?auto_15124 ) ) ( not ( = ?auto_15116 ?auto_15136 ) ) ( not ( = ?auto_15116 ?auto_15130 ) ) ( not ( = ?auto_15116 ?auto_15139 ) ) ( not ( = ?auto_15116 ?auto_15125 ) ) ( not ( = ?auto_15116 ?auto_15137 ) ) ( not ( = ?auto_15116 ?auto_15134 ) ) ( not ( = ?auto_15116 ?auto_15123 ) ) ( not ( = ?auto_15116 ?auto_15138 ) ) ( not ( = ?auto_15116 ?auto_15131 ) ) ( not ( = ?auto_15121 ?auto_15129 ) ) ( not ( = ?auto_15121 ?auto_15124 ) ) ( not ( = ?auto_15121 ?auto_15136 ) ) ( not ( = ?auto_15121 ?auto_15130 ) ) ( not ( = ?auto_15121 ?auto_15139 ) ) ( not ( = ?auto_15121 ?auto_15125 ) ) ( not ( = ?auto_15121 ?auto_15137 ) ) ( not ( = ?auto_15121 ?auto_15134 ) ) ( not ( = ?auto_15121 ?auto_15123 ) ) ( not ( = ?auto_15121 ?auto_15138 ) ) ( not ( = ?auto_15121 ?auto_15131 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15104 ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15108 ?auto_15109 ?auto_15110 ?auto_15111 ?auto_15112 ?auto_15113 ?auto_15114 ?auto_15115 )
      ( MAKE-1CRATE ?auto_15115 ?auto_15116 )
      ( MAKE-12CRATE-VERIFY ?auto_15104 ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15108 ?auto_15109 ?auto_15110 ?auto_15111 ?auto_15112 ?auto_15113 ?auto_15114 ?auto_15115 ?auto_15116 ) )
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
      ?auto_15176 - SURFACE
      ?auto_15177 - SURFACE
      ?auto_15178 - SURFACE
      ?auto_15179 - SURFACE
      ?auto_15180 - SURFACE
      ?auto_15181 - SURFACE
      ?auto_15182 - SURFACE
      ?auto_15183 - SURFACE
    )
    :vars
    (
      ?auto_15185 - HOIST
      ?auto_15189 - PLACE
      ?auto_15184 - PLACE
      ?auto_15186 - HOIST
      ?auto_15188 - SURFACE
      ?auto_15196 - PLACE
      ?auto_15195 - HOIST
      ?auto_15214 - SURFACE
      ?auto_15199 - PLACE
      ?auto_15203 - HOIST
      ?auto_15205 - SURFACE
      ?auto_15206 - SURFACE
      ?auto_15201 - PLACE
      ?auto_15215 - HOIST
      ?auto_15210 - SURFACE
      ?auto_15191 - PLACE
      ?auto_15192 - HOIST
      ?auto_15193 - SURFACE
      ?auto_15200 - PLACE
      ?auto_15194 - HOIST
      ?auto_15207 - SURFACE
      ?auto_15197 - PLACE
      ?auto_15208 - HOIST
      ?auto_15198 - SURFACE
      ?auto_15209 - SURFACE
      ?auto_15212 - SURFACE
      ?auto_15211 - PLACE
      ?auto_15213 - HOIST
      ?auto_15202 - SURFACE
      ?auto_15190 - SURFACE
      ?auto_15204 - SURFACE
      ?auto_15187 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15185 ?auto_15189 ) ( IS-CRATE ?auto_15183 ) ( not ( = ?auto_15184 ?auto_15189 ) ) ( HOIST-AT ?auto_15186 ?auto_15184 ) ( AVAILABLE ?auto_15186 ) ( SURFACE-AT ?auto_15183 ?auto_15184 ) ( ON ?auto_15183 ?auto_15188 ) ( CLEAR ?auto_15183 ) ( not ( = ?auto_15182 ?auto_15183 ) ) ( not ( = ?auto_15182 ?auto_15188 ) ) ( not ( = ?auto_15183 ?auto_15188 ) ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( IS-CRATE ?auto_15182 ) ( not ( = ?auto_15196 ?auto_15189 ) ) ( HOIST-AT ?auto_15195 ?auto_15196 ) ( SURFACE-AT ?auto_15182 ?auto_15196 ) ( ON ?auto_15182 ?auto_15214 ) ( CLEAR ?auto_15182 ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15214 ) ) ( not ( = ?auto_15182 ?auto_15214 ) ) ( not ( = ?auto_15185 ?auto_15195 ) ) ( IS-CRATE ?auto_15181 ) ( not ( = ?auto_15199 ?auto_15189 ) ) ( HOIST-AT ?auto_15203 ?auto_15199 ) ( AVAILABLE ?auto_15203 ) ( SURFACE-AT ?auto_15181 ?auto_15199 ) ( ON ?auto_15181 ?auto_15205 ) ( CLEAR ?auto_15181 ) ( not ( = ?auto_15180 ?auto_15181 ) ) ( not ( = ?auto_15180 ?auto_15205 ) ) ( not ( = ?auto_15181 ?auto_15205 ) ) ( not ( = ?auto_15185 ?auto_15203 ) ) ( IS-CRATE ?auto_15180 ) ( AVAILABLE ?auto_15195 ) ( SURFACE-AT ?auto_15180 ?auto_15196 ) ( ON ?auto_15180 ?auto_15206 ) ( CLEAR ?auto_15180 ) ( not ( = ?auto_15179 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15206 ) ) ( not ( = ?auto_15180 ?auto_15206 ) ) ( IS-CRATE ?auto_15179 ) ( not ( = ?auto_15201 ?auto_15189 ) ) ( HOIST-AT ?auto_15215 ?auto_15201 ) ( SURFACE-AT ?auto_15179 ?auto_15201 ) ( ON ?auto_15179 ?auto_15210 ) ( CLEAR ?auto_15179 ) ( not ( = ?auto_15178 ?auto_15179 ) ) ( not ( = ?auto_15178 ?auto_15210 ) ) ( not ( = ?auto_15179 ?auto_15210 ) ) ( not ( = ?auto_15185 ?auto_15215 ) ) ( IS-CRATE ?auto_15178 ) ( not ( = ?auto_15191 ?auto_15189 ) ) ( HOIST-AT ?auto_15192 ?auto_15191 ) ( AVAILABLE ?auto_15192 ) ( SURFACE-AT ?auto_15178 ?auto_15191 ) ( ON ?auto_15178 ?auto_15193 ) ( CLEAR ?auto_15178 ) ( not ( = ?auto_15177 ?auto_15178 ) ) ( not ( = ?auto_15177 ?auto_15193 ) ) ( not ( = ?auto_15178 ?auto_15193 ) ) ( not ( = ?auto_15185 ?auto_15192 ) ) ( IS-CRATE ?auto_15177 ) ( not ( = ?auto_15200 ?auto_15189 ) ) ( HOIST-AT ?auto_15194 ?auto_15200 ) ( AVAILABLE ?auto_15194 ) ( SURFACE-AT ?auto_15177 ?auto_15200 ) ( ON ?auto_15177 ?auto_15207 ) ( CLEAR ?auto_15177 ) ( not ( = ?auto_15176 ?auto_15177 ) ) ( not ( = ?auto_15176 ?auto_15207 ) ) ( not ( = ?auto_15177 ?auto_15207 ) ) ( not ( = ?auto_15185 ?auto_15194 ) ) ( IS-CRATE ?auto_15176 ) ( not ( = ?auto_15197 ?auto_15189 ) ) ( HOIST-AT ?auto_15208 ?auto_15197 ) ( SURFACE-AT ?auto_15176 ?auto_15197 ) ( ON ?auto_15176 ?auto_15198 ) ( CLEAR ?auto_15176 ) ( not ( = ?auto_15175 ?auto_15176 ) ) ( not ( = ?auto_15175 ?auto_15198 ) ) ( not ( = ?auto_15176 ?auto_15198 ) ) ( not ( = ?auto_15185 ?auto_15208 ) ) ( IS-CRATE ?auto_15175 ) ( AVAILABLE ?auto_15208 ) ( SURFACE-AT ?auto_15175 ?auto_15197 ) ( ON ?auto_15175 ?auto_15209 ) ( CLEAR ?auto_15175 ) ( not ( = ?auto_15174 ?auto_15175 ) ) ( not ( = ?auto_15174 ?auto_15209 ) ) ( not ( = ?auto_15175 ?auto_15209 ) ) ( IS-CRATE ?auto_15174 ) ( SURFACE-AT ?auto_15174 ?auto_15201 ) ( ON ?auto_15174 ?auto_15212 ) ( CLEAR ?auto_15174 ) ( not ( = ?auto_15173 ?auto_15174 ) ) ( not ( = ?auto_15173 ?auto_15212 ) ) ( not ( = ?auto_15174 ?auto_15212 ) ) ( IS-CRATE ?auto_15173 ) ( not ( = ?auto_15211 ?auto_15189 ) ) ( HOIST-AT ?auto_15213 ?auto_15211 ) ( AVAILABLE ?auto_15213 ) ( SURFACE-AT ?auto_15173 ?auto_15211 ) ( ON ?auto_15173 ?auto_15202 ) ( CLEAR ?auto_15173 ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( not ( = ?auto_15172 ?auto_15202 ) ) ( not ( = ?auto_15173 ?auto_15202 ) ) ( not ( = ?auto_15185 ?auto_15213 ) ) ( IS-CRATE ?auto_15172 ) ( SURFACE-AT ?auto_15172 ?auto_15201 ) ( ON ?auto_15172 ?auto_15190 ) ( CLEAR ?auto_15172 ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15171 ?auto_15190 ) ) ( not ( = ?auto_15172 ?auto_15190 ) ) ( SURFACE-AT ?auto_15170 ?auto_15189 ) ( CLEAR ?auto_15170 ) ( IS-CRATE ?auto_15171 ) ( AVAILABLE ?auto_15185 ) ( AVAILABLE ?auto_15215 ) ( SURFACE-AT ?auto_15171 ?auto_15201 ) ( ON ?auto_15171 ?auto_15204 ) ( CLEAR ?auto_15171 ) ( TRUCK-AT ?auto_15187 ?auto_15189 ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15170 ?auto_15204 ) ) ( not ( = ?auto_15171 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15172 ) ) ( not ( = ?auto_15170 ?auto_15190 ) ) ( not ( = ?auto_15172 ?auto_15204 ) ) ( not ( = ?auto_15190 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15173 ) ) ( not ( = ?auto_15170 ?auto_15202 ) ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15171 ?auto_15202 ) ) ( not ( = ?auto_15173 ?auto_15190 ) ) ( not ( = ?auto_15173 ?auto_15204 ) ) ( not ( = ?auto_15211 ?auto_15201 ) ) ( not ( = ?auto_15213 ?auto_15215 ) ) ( not ( = ?auto_15202 ?auto_15190 ) ) ( not ( = ?auto_15202 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15174 ) ) ( not ( = ?auto_15170 ?auto_15212 ) ) ( not ( = ?auto_15171 ?auto_15174 ) ) ( not ( = ?auto_15171 ?auto_15212 ) ) ( not ( = ?auto_15172 ?auto_15174 ) ) ( not ( = ?auto_15172 ?auto_15212 ) ) ( not ( = ?auto_15174 ?auto_15202 ) ) ( not ( = ?auto_15174 ?auto_15190 ) ) ( not ( = ?auto_15174 ?auto_15204 ) ) ( not ( = ?auto_15212 ?auto_15202 ) ) ( not ( = ?auto_15212 ?auto_15190 ) ) ( not ( = ?auto_15212 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15175 ) ) ( not ( = ?auto_15170 ?auto_15209 ) ) ( not ( = ?auto_15171 ?auto_15175 ) ) ( not ( = ?auto_15171 ?auto_15209 ) ) ( not ( = ?auto_15172 ?auto_15175 ) ) ( not ( = ?auto_15172 ?auto_15209 ) ) ( not ( = ?auto_15173 ?auto_15175 ) ) ( not ( = ?auto_15173 ?auto_15209 ) ) ( not ( = ?auto_15175 ?auto_15212 ) ) ( not ( = ?auto_15175 ?auto_15202 ) ) ( not ( = ?auto_15175 ?auto_15190 ) ) ( not ( = ?auto_15175 ?auto_15204 ) ) ( not ( = ?auto_15197 ?auto_15201 ) ) ( not ( = ?auto_15197 ?auto_15211 ) ) ( not ( = ?auto_15208 ?auto_15215 ) ) ( not ( = ?auto_15208 ?auto_15213 ) ) ( not ( = ?auto_15209 ?auto_15212 ) ) ( not ( = ?auto_15209 ?auto_15202 ) ) ( not ( = ?auto_15209 ?auto_15190 ) ) ( not ( = ?auto_15209 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15176 ) ) ( not ( = ?auto_15170 ?auto_15198 ) ) ( not ( = ?auto_15171 ?auto_15176 ) ) ( not ( = ?auto_15171 ?auto_15198 ) ) ( not ( = ?auto_15172 ?auto_15176 ) ) ( not ( = ?auto_15172 ?auto_15198 ) ) ( not ( = ?auto_15173 ?auto_15176 ) ) ( not ( = ?auto_15173 ?auto_15198 ) ) ( not ( = ?auto_15174 ?auto_15176 ) ) ( not ( = ?auto_15174 ?auto_15198 ) ) ( not ( = ?auto_15176 ?auto_15209 ) ) ( not ( = ?auto_15176 ?auto_15212 ) ) ( not ( = ?auto_15176 ?auto_15202 ) ) ( not ( = ?auto_15176 ?auto_15190 ) ) ( not ( = ?auto_15176 ?auto_15204 ) ) ( not ( = ?auto_15198 ?auto_15209 ) ) ( not ( = ?auto_15198 ?auto_15212 ) ) ( not ( = ?auto_15198 ?auto_15202 ) ) ( not ( = ?auto_15198 ?auto_15190 ) ) ( not ( = ?auto_15198 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15177 ) ) ( not ( = ?auto_15170 ?auto_15207 ) ) ( not ( = ?auto_15171 ?auto_15177 ) ) ( not ( = ?auto_15171 ?auto_15207 ) ) ( not ( = ?auto_15172 ?auto_15177 ) ) ( not ( = ?auto_15172 ?auto_15207 ) ) ( not ( = ?auto_15173 ?auto_15177 ) ) ( not ( = ?auto_15173 ?auto_15207 ) ) ( not ( = ?auto_15174 ?auto_15177 ) ) ( not ( = ?auto_15174 ?auto_15207 ) ) ( not ( = ?auto_15175 ?auto_15177 ) ) ( not ( = ?auto_15175 ?auto_15207 ) ) ( not ( = ?auto_15177 ?auto_15198 ) ) ( not ( = ?auto_15177 ?auto_15209 ) ) ( not ( = ?auto_15177 ?auto_15212 ) ) ( not ( = ?auto_15177 ?auto_15202 ) ) ( not ( = ?auto_15177 ?auto_15190 ) ) ( not ( = ?auto_15177 ?auto_15204 ) ) ( not ( = ?auto_15200 ?auto_15197 ) ) ( not ( = ?auto_15200 ?auto_15201 ) ) ( not ( = ?auto_15200 ?auto_15211 ) ) ( not ( = ?auto_15194 ?auto_15208 ) ) ( not ( = ?auto_15194 ?auto_15215 ) ) ( not ( = ?auto_15194 ?auto_15213 ) ) ( not ( = ?auto_15207 ?auto_15198 ) ) ( not ( = ?auto_15207 ?auto_15209 ) ) ( not ( = ?auto_15207 ?auto_15212 ) ) ( not ( = ?auto_15207 ?auto_15202 ) ) ( not ( = ?auto_15207 ?auto_15190 ) ) ( not ( = ?auto_15207 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15178 ) ) ( not ( = ?auto_15170 ?auto_15193 ) ) ( not ( = ?auto_15171 ?auto_15178 ) ) ( not ( = ?auto_15171 ?auto_15193 ) ) ( not ( = ?auto_15172 ?auto_15178 ) ) ( not ( = ?auto_15172 ?auto_15193 ) ) ( not ( = ?auto_15173 ?auto_15178 ) ) ( not ( = ?auto_15173 ?auto_15193 ) ) ( not ( = ?auto_15174 ?auto_15178 ) ) ( not ( = ?auto_15174 ?auto_15193 ) ) ( not ( = ?auto_15175 ?auto_15178 ) ) ( not ( = ?auto_15175 ?auto_15193 ) ) ( not ( = ?auto_15176 ?auto_15178 ) ) ( not ( = ?auto_15176 ?auto_15193 ) ) ( not ( = ?auto_15178 ?auto_15207 ) ) ( not ( = ?auto_15178 ?auto_15198 ) ) ( not ( = ?auto_15178 ?auto_15209 ) ) ( not ( = ?auto_15178 ?auto_15212 ) ) ( not ( = ?auto_15178 ?auto_15202 ) ) ( not ( = ?auto_15178 ?auto_15190 ) ) ( not ( = ?auto_15178 ?auto_15204 ) ) ( not ( = ?auto_15191 ?auto_15200 ) ) ( not ( = ?auto_15191 ?auto_15197 ) ) ( not ( = ?auto_15191 ?auto_15201 ) ) ( not ( = ?auto_15191 ?auto_15211 ) ) ( not ( = ?auto_15192 ?auto_15194 ) ) ( not ( = ?auto_15192 ?auto_15208 ) ) ( not ( = ?auto_15192 ?auto_15215 ) ) ( not ( = ?auto_15192 ?auto_15213 ) ) ( not ( = ?auto_15193 ?auto_15207 ) ) ( not ( = ?auto_15193 ?auto_15198 ) ) ( not ( = ?auto_15193 ?auto_15209 ) ) ( not ( = ?auto_15193 ?auto_15212 ) ) ( not ( = ?auto_15193 ?auto_15202 ) ) ( not ( = ?auto_15193 ?auto_15190 ) ) ( not ( = ?auto_15193 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15179 ) ) ( not ( = ?auto_15170 ?auto_15210 ) ) ( not ( = ?auto_15171 ?auto_15179 ) ) ( not ( = ?auto_15171 ?auto_15210 ) ) ( not ( = ?auto_15172 ?auto_15179 ) ) ( not ( = ?auto_15172 ?auto_15210 ) ) ( not ( = ?auto_15173 ?auto_15179 ) ) ( not ( = ?auto_15173 ?auto_15210 ) ) ( not ( = ?auto_15174 ?auto_15179 ) ) ( not ( = ?auto_15174 ?auto_15210 ) ) ( not ( = ?auto_15175 ?auto_15179 ) ) ( not ( = ?auto_15175 ?auto_15210 ) ) ( not ( = ?auto_15176 ?auto_15179 ) ) ( not ( = ?auto_15176 ?auto_15210 ) ) ( not ( = ?auto_15177 ?auto_15179 ) ) ( not ( = ?auto_15177 ?auto_15210 ) ) ( not ( = ?auto_15179 ?auto_15193 ) ) ( not ( = ?auto_15179 ?auto_15207 ) ) ( not ( = ?auto_15179 ?auto_15198 ) ) ( not ( = ?auto_15179 ?auto_15209 ) ) ( not ( = ?auto_15179 ?auto_15212 ) ) ( not ( = ?auto_15179 ?auto_15202 ) ) ( not ( = ?auto_15179 ?auto_15190 ) ) ( not ( = ?auto_15179 ?auto_15204 ) ) ( not ( = ?auto_15210 ?auto_15193 ) ) ( not ( = ?auto_15210 ?auto_15207 ) ) ( not ( = ?auto_15210 ?auto_15198 ) ) ( not ( = ?auto_15210 ?auto_15209 ) ) ( not ( = ?auto_15210 ?auto_15212 ) ) ( not ( = ?auto_15210 ?auto_15202 ) ) ( not ( = ?auto_15210 ?auto_15190 ) ) ( not ( = ?auto_15210 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15180 ) ) ( not ( = ?auto_15170 ?auto_15206 ) ) ( not ( = ?auto_15171 ?auto_15180 ) ) ( not ( = ?auto_15171 ?auto_15206 ) ) ( not ( = ?auto_15172 ?auto_15180 ) ) ( not ( = ?auto_15172 ?auto_15206 ) ) ( not ( = ?auto_15173 ?auto_15180 ) ) ( not ( = ?auto_15173 ?auto_15206 ) ) ( not ( = ?auto_15174 ?auto_15180 ) ) ( not ( = ?auto_15174 ?auto_15206 ) ) ( not ( = ?auto_15175 ?auto_15180 ) ) ( not ( = ?auto_15175 ?auto_15206 ) ) ( not ( = ?auto_15176 ?auto_15180 ) ) ( not ( = ?auto_15176 ?auto_15206 ) ) ( not ( = ?auto_15177 ?auto_15180 ) ) ( not ( = ?auto_15177 ?auto_15206 ) ) ( not ( = ?auto_15178 ?auto_15180 ) ) ( not ( = ?auto_15178 ?auto_15206 ) ) ( not ( = ?auto_15180 ?auto_15210 ) ) ( not ( = ?auto_15180 ?auto_15193 ) ) ( not ( = ?auto_15180 ?auto_15207 ) ) ( not ( = ?auto_15180 ?auto_15198 ) ) ( not ( = ?auto_15180 ?auto_15209 ) ) ( not ( = ?auto_15180 ?auto_15212 ) ) ( not ( = ?auto_15180 ?auto_15202 ) ) ( not ( = ?auto_15180 ?auto_15190 ) ) ( not ( = ?auto_15180 ?auto_15204 ) ) ( not ( = ?auto_15196 ?auto_15201 ) ) ( not ( = ?auto_15196 ?auto_15191 ) ) ( not ( = ?auto_15196 ?auto_15200 ) ) ( not ( = ?auto_15196 ?auto_15197 ) ) ( not ( = ?auto_15196 ?auto_15211 ) ) ( not ( = ?auto_15195 ?auto_15215 ) ) ( not ( = ?auto_15195 ?auto_15192 ) ) ( not ( = ?auto_15195 ?auto_15194 ) ) ( not ( = ?auto_15195 ?auto_15208 ) ) ( not ( = ?auto_15195 ?auto_15213 ) ) ( not ( = ?auto_15206 ?auto_15210 ) ) ( not ( = ?auto_15206 ?auto_15193 ) ) ( not ( = ?auto_15206 ?auto_15207 ) ) ( not ( = ?auto_15206 ?auto_15198 ) ) ( not ( = ?auto_15206 ?auto_15209 ) ) ( not ( = ?auto_15206 ?auto_15212 ) ) ( not ( = ?auto_15206 ?auto_15202 ) ) ( not ( = ?auto_15206 ?auto_15190 ) ) ( not ( = ?auto_15206 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15181 ) ) ( not ( = ?auto_15170 ?auto_15205 ) ) ( not ( = ?auto_15171 ?auto_15181 ) ) ( not ( = ?auto_15171 ?auto_15205 ) ) ( not ( = ?auto_15172 ?auto_15181 ) ) ( not ( = ?auto_15172 ?auto_15205 ) ) ( not ( = ?auto_15173 ?auto_15181 ) ) ( not ( = ?auto_15173 ?auto_15205 ) ) ( not ( = ?auto_15174 ?auto_15181 ) ) ( not ( = ?auto_15174 ?auto_15205 ) ) ( not ( = ?auto_15175 ?auto_15181 ) ) ( not ( = ?auto_15175 ?auto_15205 ) ) ( not ( = ?auto_15176 ?auto_15181 ) ) ( not ( = ?auto_15176 ?auto_15205 ) ) ( not ( = ?auto_15177 ?auto_15181 ) ) ( not ( = ?auto_15177 ?auto_15205 ) ) ( not ( = ?auto_15178 ?auto_15181 ) ) ( not ( = ?auto_15178 ?auto_15205 ) ) ( not ( = ?auto_15179 ?auto_15181 ) ) ( not ( = ?auto_15179 ?auto_15205 ) ) ( not ( = ?auto_15181 ?auto_15206 ) ) ( not ( = ?auto_15181 ?auto_15210 ) ) ( not ( = ?auto_15181 ?auto_15193 ) ) ( not ( = ?auto_15181 ?auto_15207 ) ) ( not ( = ?auto_15181 ?auto_15198 ) ) ( not ( = ?auto_15181 ?auto_15209 ) ) ( not ( = ?auto_15181 ?auto_15212 ) ) ( not ( = ?auto_15181 ?auto_15202 ) ) ( not ( = ?auto_15181 ?auto_15190 ) ) ( not ( = ?auto_15181 ?auto_15204 ) ) ( not ( = ?auto_15199 ?auto_15196 ) ) ( not ( = ?auto_15199 ?auto_15201 ) ) ( not ( = ?auto_15199 ?auto_15191 ) ) ( not ( = ?auto_15199 ?auto_15200 ) ) ( not ( = ?auto_15199 ?auto_15197 ) ) ( not ( = ?auto_15199 ?auto_15211 ) ) ( not ( = ?auto_15203 ?auto_15195 ) ) ( not ( = ?auto_15203 ?auto_15215 ) ) ( not ( = ?auto_15203 ?auto_15192 ) ) ( not ( = ?auto_15203 ?auto_15194 ) ) ( not ( = ?auto_15203 ?auto_15208 ) ) ( not ( = ?auto_15203 ?auto_15213 ) ) ( not ( = ?auto_15205 ?auto_15206 ) ) ( not ( = ?auto_15205 ?auto_15210 ) ) ( not ( = ?auto_15205 ?auto_15193 ) ) ( not ( = ?auto_15205 ?auto_15207 ) ) ( not ( = ?auto_15205 ?auto_15198 ) ) ( not ( = ?auto_15205 ?auto_15209 ) ) ( not ( = ?auto_15205 ?auto_15212 ) ) ( not ( = ?auto_15205 ?auto_15202 ) ) ( not ( = ?auto_15205 ?auto_15190 ) ) ( not ( = ?auto_15205 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15182 ) ) ( not ( = ?auto_15170 ?auto_15214 ) ) ( not ( = ?auto_15171 ?auto_15182 ) ) ( not ( = ?auto_15171 ?auto_15214 ) ) ( not ( = ?auto_15172 ?auto_15182 ) ) ( not ( = ?auto_15172 ?auto_15214 ) ) ( not ( = ?auto_15173 ?auto_15182 ) ) ( not ( = ?auto_15173 ?auto_15214 ) ) ( not ( = ?auto_15174 ?auto_15182 ) ) ( not ( = ?auto_15174 ?auto_15214 ) ) ( not ( = ?auto_15175 ?auto_15182 ) ) ( not ( = ?auto_15175 ?auto_15214 ) ) ( not ( = ?auto_15176 ?auto_15182 ) ) ( not ( = ?auto_15176 ?auto_15214 ) ) ( not ( = ?auto_15177 ?auto_15182 ) ) ( not ( = ?auto_15177 ?auto_15214 ) ) ( not ( = ?auto_15178 ?auto_15182 ) ) ( not ( = ?auto_15178 ?auto_15214 ) ) ( not ( = ?auto_15179 ?auto_15182 ) ) ( not ( = ?auto_15179 ?auto_15214 ) ) ( not ( = ?auto_15180 ?auto_15182 ) ) ( not ( = ?auto_15180 ?auto_15214 ) ) ( not ( = ?auto_15182 ?auto_15205 ) ) ( not ( = ?auto_15182 ?auto_15206 ) ) ( not ( = ?auto_15182 ?auto_15210 ) ) ( not ( = ?auto_15182 ?auto_15193 ) ) ( not ( = ?auto_15182 ?auto_15207 ) ) ( not ( = ?auto_15182 ?auto_15198 ) ) ( not ( = ?auto_15182 ?auto_15209 ) ) ( not ( = ?auto_15182 ?auto_15212 ) ) ( not ( = ?auto_15182 ?auto_15202 ) ) ( not ( = ?auto_15182 ?auto_15190 ) ) ( not ( = ?auto_15182 ?auto_15204 ) ) ( not ( = ?auto_15214 ?auto_15205 ) ) ( not ( = ?auto_15214 ?auto_15206 ) ) ( not ( = ?auto_15214 ?auto_15210 ) ) ( not ( = ?auto_15214 ?auto_15193 ) ) ( not ( = ?auto_15214 ?auto_15207 ) ) ( not ( = ?auto_15214 ?auto_15198 ) ) ( not ( = ?auto_15214 ?auto_15209 ) ) ( not ( = ?auto_15214 ?auto_15212 ) ) ( not ( = ?auto_15214 ?auto_15202 ) ) ( not ( = ?auto_15214 ?auto_15190 ) ) ( not ( = ?auto_15214 ?auto_15204 ) ) ( not ( = ?auto_15170 ?auto_15183 ) ) ( not ( = ?auto_15170 ?auto_15188 ) ) ( not ( = ?auto_15171 ?auto_15183 ) ) ( not ( = ?auto_15171 ?auto_15188 ) ) ( not ( = ?auto_15172 ?auto_15183 ) ) ( not ( = ?auto_15172 ?auto_15188 ) ) ( not ( = ?auto_15173 ?auto_15183 ) ) ( not ( = ?auto_15173 ?auto_15188 ) ) ( not ( = ?auto_15174 ?auto_15183 ) ) ( not ( = ?auto_15174 ?auto_15188 ) ) ( not ( = ?auto_15175 ?auto_15183 ) ) ( not ( = ?auto_15175 ?auto_15188 ) ) ( not ( = ?auto_15176 ?auto_15183 ) ) ( not ( = ?auto_15176 ?auto_15188 ) ) ( not ( = ?auto_15177 ?auto_15183 ) ) ( not ( = ?auto_15177 ?auto_15188 ) ) ( not ( = ?auto_15178 ?auto_15183 ) ) ( not ( = ?auto_15178 ?auto_15188 ) ) ( not ( = ?auto_15179 ?auto_15183 ) ) ( not ( = ?auto_15179 ?auto_15188 ) ) ( not ( = ?auto_15180 ?auto_15183 ) ) ( not ( = ?auto_15180 ?auto_15188 ) ) ( not ( = ?auto_15181 ?auto_15183 ) ) ( not ( = ?auto_15181 ?auto_15188 ) ) ( not ( = ?auto_15183 ?auto_15214 ) ) ( not ( = ?auto_15183 ?auto_15205 ) ) ( not ( = ?auto_15183 ?auto_15206 ) ) ( not ( = ?auto_15183 ?auto_15210 ) ) ( not ( = ?auto_15183 ?auto_15193 ) ) ( not ( = ?auto_15183 ?auto_15207 ) ) ( not ( = ?auto_15183 ?auto_15198 ) ) ( not ( = ?auto_15183 ?auto_15209 ) ) ( not ( = ?auto_15183 ?auto_15212 ) ) ( not ( = ?auto_15183 ?auto_15202 ) ) ( not ( = ?auto_15183 ?auto_15190 ) ) ( not ( = ?auto_15183 ?auto_15204 ) ) ( not ( = ?auto_15184 ?auto_15196 ) ) ( not ( = ?auto_15184 ?auto_15199 ) ) ( not ( = ?auto_15184 ?auto_15201 ) ) ( not ( = ?auto_15184 ?auto_15191 ) ) ( not ( = ?auto_15184 ?auto_15200 ) ) ( not ( = ?auto_15184 ?auto_15197 ) ) ( not ( = ?auto_15184 ?auto_15211 ) ) ( not ( = ?auto_15186 ?auto_15195 ) ) ( not ( = ?auto_15186 ?auto_15203 ) ) ( not ( = ?auto_15186 ?auto_15215 ) ) ( not ( = ?auto_15186 ?auto_15192 ) ) ( not ( = ?auto_15186 ?auto_15194 ) ) ( not ( = ?auto_15186 ?auto_15208 ) ) ( not ( = ?auto_15186 ?auto_15213 ) ) ( not ( = ?auto_15188 ?auto_15214 ) ) ( not ( = ?auto_15188 ?auto_15205 ) ) ( not ( = ?auto_15188 ?auto_15206 ) ) ( not ( = ?auto_15188 ?auto_15210 ) ) ( not ( = ?auto_15188 ?auto_15193 ) ) ( not ( = ?auto_15188 ?auto_15207 ) ) ( not ( = ?auto_15188 ?auto_15198 ) ) ( not ( = ?auto_15188 ?auto_15209 ) ) ( not ( = ?auto_15188 ?auto_15212 ) ) ( not ( = ?auto_15188 ?auto_15202 ) ) ( not ( = ?auto_15188 ?auto_15190 ) ) ( not ( = ?auto_15188 ?auto_15204 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15170 ?auto_15171 ?auto_15172 ?auto_15173 ?auto_15174 ?auto_15175 ?auto_15176 ?auto_15177 ?auto_15178 ?auto_15179 ?auto_15180 ?auto_15181 ?auto_15182 )
      ( MAKE-1CRATE ?auto_15182 ?auto_15183 )
      ( MAKE-13CRATE-VERIFY ?auto_15170 ?auto_15171 ?auto_15172 ?auto_15173 ?auto_15174 ?auto_15175 ?auto_15176 ?auto_15177 ?auto_15178 ?auto_15179 ?auto_15180 ?auto_15181 ?auto_15182 ?auto_15183 ) )
  )

)

