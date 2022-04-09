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
      ?auto_14692 - SURFACE
      ?auto_14693 - SURFACE
    )
    :vars
    (
      ?auto_14694 - HOIST
      ?auto_14695 - PLACE
      ?auto_14697 - PLACE
      ?auto_14698 - HOIST
      ?auto_14699 - SURFACE
      ?auto_14696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14694 ?auto_14695 ) ( SURFACE-AT ?auto_14692 ?auto_14695 ) ( CLEAR ?auto_14692 ) ( IS-CRATE ?auto_14693 ) ( AVAILABLE ?auto_14694 ) ( not ( = ?auto_14697 ?auto_14695 ) ) ( HOIST-AT ?auto_14698 ?auto_14697 ) ( AVAILABLE ?auto_14698 ) ( SURFACE-AT ?auto_14693 ?auto_14697 ) ( ON ?auto_14693 ?auto_14699 ) ( CLEAR ?auto_14693 ) ( TRUCK-AT ?auto_14696 ?auto_14695 ) ( not ( = ?auto_14692 ?auto_14693 ) ) ( not ( = ?auto_14692 ?auto_14699 ) ) ( not ( = ?auto_14693 ?auto_14699 ) ) ( not ( = ?auto_14694 ?auto_14698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14696 ?auto_14695 ?auto_14697 )
      ( !LIFT ?auto_14698 ?auto_14693 ?auto_14699 ?auto_14697 )
      ( !LOAD ?auto_14698 ?auto_14693 ?auto_14696 ?auto_14697 )
      ( !DRIVE ?auto_14696 ?auto_14697 ?auto_14695 )
      ( !UNLOAD ?auto_14694 ?auto_14693 ?auto_14696 ?auto_14695 )
      ( !DROP ?auto_14694 ?auto_14693 ?auto_14692 ?auto_14695 )
      ( MAKE-1CRATE-VERIFY ?auto_14692 ?auto_14693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14702 - SURFACE
      ?auto_14703 - SURFACE
    )
    :vars
    (
      ?auto_14704 - HOIST
      ?auto_14705 - PLACE
      ?auto_14707 - PLACE
      ?auto_14708 - HOIST
      ?auto_14709 - SURFACE
      ?auto_14706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14704 ?auto_14705 ) ( SURFACE-AT ?auto_14702 ?auto_14705 ) ( CLEAR ?auto_14702 ) ( IS-CRATE ?auto_14703 ) ( AVAILABLE ?auto_14704 ) ( not ( = ?auto_14707 ?auto_14705 ) ) ( HOIST-AT ?auto_14708 ?auto_14707 ) ( AVAILABLE ?auto_14708 ) ( SURFACE-AT ?auto_14703 ?auto_14707 ) ( ON ?auto_14703 ?auto_14709 ) ( CLEAR ?auto_14703 ) ( TRUCK-AT ?auto_14706 ?auto_14705 ) ( not ( = ?auto_14702 ?auto_14703 ) ) ( not ( = ?auto_14702 ?auto_14709 ) ) ( not ( = ?auto_14703 ?auto_14709 ) ) ( not ( = ?auto_14704 ?auto_14708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14706 ?auto_14705 ?auto_14707 )
      ( !LIFT ?auto_14708 ?auto_14703 ?auto_14709 ?auto_14707 )
      ( !LOAD ?auto_14708 ?auto_14703 ?auto_14706 ?auto_14707 )
      ( !DRIVE ?auto_14706 ?auto_14707 ?auto_14705 )
      ( !UNLOAD ?auto_14704 ?auto_14703 ?auto_14706 ?auto_14705 )
      ( !DROP ?auto_14704 ?auto_14703 ?auto_14702 ?auto_14705 )
      ( MAKE-1CRATE-VERIFY ?auto_14702 ?auto_14703 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14713 - SURFACE
      ?auto_14714 - SURFACE
      ?auto_14715 - SURFACE
    )
    :vars
    (
      ?auto_14716 - HOIST
      ?auto_14719 - PLACE
      ?auto_14717 - PLACE
      ?auto_14721 - HOIST
      ?auto_14720 - SURFACE
      ?auto_14722 - PLACE
      ?auto_14723 - HOIST
      ?auto_14724 - SURFACE
      ?auto_14718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14716 ?auto_14719 ) ( IS-CRATE ?auto_14715 ) ( not ( = ?auto_14717 ?auto_14719 ) ) ( HOIST-AT ?auto_14721 ?auto_14717 ) ( AVAILABLE ?auto_14721 ) ( SURFACE-AT ?auto_14715 ?auto_14717 ) ( ON ?auto_14715 ?auto_14720 ) ( CLEAR ?auto_14715 ) ( not ( = ?auto_14714 ?auto_14715 ) ) ( not ( = ?auto_14714 ?auto_14720 ) ) ( not ( = ?auto_14715 ?auto_14720 ) ) ( not ( = ?auto_14716 ?auto_14721 ) ) ( SURFACE-AT ?auto_14713 ?auto_14719 ) ( CLEAR ?auto_14713 ) ( IS-CRATE ?auto_14714 ) ( AVAILABLE ?auto_14716 ) ( not ( = ?auto_14722 ?auto_14719 ) ) ( HOIST-AT ?auto_14723 ?auto_14722 ) ( AVAILABLE ?auto_14723 ) ( SURFACE-AT ?auto_14714 ?auto_14722 ) ( ON ?auto_14714 ?auto_14724 ) ( CLEAR ?auto_14714 ) ( TRUCK-AT ?auto_14718 ?auto_14719 ) ( not ( = ?auto_14713 ?auto_14714 ) ) ( not ( = ?auto_14713 ?auto_14724 ) ) ( not ( = ?auto_14714 ?auto_14724 ) ) ( not ( = ?auto_14716 ?auto_14723 ) ) ( not ( = ?auto_14713 ?auto_14715 ) ) ( not ( = ?auto_14713 ?auto_14720 ) ) ( not ( = ?auto_14715 ?auto_14724 ) ) ( not ( = ?auto_14717 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14723 ) ) ( not ( = ?auto_14720 ?auto_14724 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14713 ?auto_14714 )
      ( MAKE-1CRATE ?auto_14714 ?auto_14715 )
      ( MAKE-2CRATE-VERIFY ?auto_14713 ?auto_14714 ?auto_14715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14727 - SURFACE
      ?auto_14728 - SURFACE
    )
    :vars
    (
      ?auto_14729 - HOIST
      ?auto_14730 - PLACE
      ?auto_14732 - PLACE
      ?auto_14733 - HOIST
      ?auto_14734 - SURFACE
      ?auto_14731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14729 ?auto_14730 ) ( SURFACE-AT ?auto_14727 ?auto_14730 ) ( CLEAR ?auto_14727 ) ( IS-CRATE ?auto_14728 ) ( AVAILABLE ?auto_14729 ) ( not ( = ?auto_14732 ?auto_14730 ) ) ( HOIST-AT ?auto_14733 ?auto_14732 ) ( AVAILABLE ?auto_14733 ) ( SURFACE-AT ?auto_14728 ?auto_14732 ) ( ON ?auto_14728 ?auto_14734 ) ( CLEAR ?auto_14728 ) ( TRUCK-AT ?auto_14731 ?auto_14730 ) ( not ( = ?auto_14727 ?auto_14728 ) ) ( not ( = ?auto_14727 ?auto_14734 ) ) ( not ( = ?auto_14728 ?auto_14734 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14731 ?auto_14730 ?auto_14732 )
      ( !LIFT ?auto_14733 ?auto_14728 ?auto_14734 ?auto_14732 )
      ( !LOAD ?auto_14733 ?auto_14728 ?auto_14731 ?auto_14732 )
      ( !DRIVE ?auto_14731 ?auto_14732 ?auto_14730 )
      ( !UNLOAD ?auto_14729 ?auto_14728 ?auto_14731 ?auto_14730 )
      ( !DROP ?auto_14729 ?auto_14728 ?auto_14727 ?auto_14730 )
      ( MAKE-1CRATE-VERIFY ?auto_14727 ?auto_14728 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_14739 - SURFACE
      ?auto_14740 - SURFACE
      ?auto_14741 - SURFACE
      ?auto_14742 - SURFACE
    )
    :vars
    (
      ?auto_14744 - HOIST
      ?auto_14743 - PLACE
      ?auto_14747 - PLACE
      ?auto_14748 - HOIST
      ?auto_14746 - SURFACE
      ?auto_14752 - PLACE
      ?auto_14754 - HOIST
      ?auto_14750 - SURFACE
      ?auto_14753 - PLACE
      ?auto_14751 - HOIST
      ?auto_14749 - SURFACE
      ?auto_14745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14744 ?auto_14743 ) ( IS-CRATE ?auto_14742 ) ( not ( = ?auto_14747 ?auto_14743 ) ) ( HOIST-AT ?auto_14748 ?auto_14747 ) ( AVAILABLE ?auto_14748 ) ( SURFACE-AT ?auto_14742 ?auto_14747 ) ( ON ?auto_14742 ?auto_14746 ) ( CLEAR ?auto_14742 ) ( not ( = ?auto_14741 ?auto_14742 ) ) ( not ( = ?auto_14741 ?auto_14746 ) ) ( not ( = ?auto_14742 ?auto_14746 ) ) ( not ( = ?auto_14744 ?auto_14748 ) ) ( IS-CRATE ?auto_14741 ) ( not ( = ?auto_14752 ?auto_14743 ) ) ( HOIST-AT ?auto_14754 ?auto_14752 ) ( AVAILABLE ?auto_14754 ) ( SURFACE-AT ?auto_14741 ?auto_14752 ) ( ON ?auto_14741 ?auto_14750 ) ( CLEAR ?auto_14741 ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14750 ) ) ( not ( = ?auto_14741 ?auto_14750 ) ) ( not ( = ?auto_14744 ?auto_14754 ) ) ( SURFACE-AT ?auto_14739 ?auto_14743 ) ( CLEAR ?auto_14739 ) ( IS-CRATE ?auto_14740 ) ( AVAILABLE ?auto_14744 ) ( not ( = ?auto_14753 ?auto_14743 ) ) ( HOIST-AT ?auto_14751 ?auto_14753 ) ( AVAILABLE ?auto_14751 ) ( SURFACE-AT ?auto_14740 ?auto_14753 ) ( ON ?auto_14740 ?auto_14749 ) ( CLEAR ?auto_14740 ) ( TRUCK-AT ?auto_14745 ?auto_14743 ) ( not ( = ?auto_14739 ?auto_14740 ) ) ( not ( = ?auto_14739 ?auto_14749 ) ) ( not ( = ?auto_14740 ?auto_14749 ) ) ( not ( = ?auto_14744 ?auto_14751 ) ) ( not ( = ?auto_14739 ?auto_14741 ) ) ( not ( = ?auto_14739 ?auto_14750 ) ) ( not ( = ?auto_14741 ?auto_14749 ) ) ( not ( = ?auto_14752 ?auto_14753 ) ) ( not ( = ?auto_14754 ?auto_14751 ) ) ( not ( = ?auto_14750 ?auto_14749 ) ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( not ( = ?auto_14739 ?auto_14746 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14746 ) ) ( not ( = ?auto_14742 ?auto_14750 ) ) ( not ( = ?auto_14742 ?auto_14749 ) ) ( not ( = ?auto_14747 ?auto_14752 ) ) ( not ( = ?auto_14747 ?auto_14753 ) ) ( not ( = ?auto_14748 ?auto_14754 ) ) ( not ( = ?auto_14748 ?auto_14751 ) ) ( not ( = ?auto_14746 ?auto_14750 ) ) ( not ( = ?auto_14746 ?auto_14749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14739 ?auto_14740 ?auto_14741 )
      ( MAKE-1CRATE ?auto_14741 ?auto_14742 )
      ( MAKE-3CRATE-VERIFY ?auto_14739 ?auto_14740 ?auto_14741 ?auto_14742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14757 - SURFACE
      ?auto_14758 - SURFACE
    )
    :vars
    (
      ?auto_14759 - HOIST
      ?auto_14760 - PLACE
      ?auto_14762 - PLACE
      ?auto_14763 - HOIST
      ?auto_14764 - SURFACE
      ?auto_14761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14759 ?auto_14760 ) ( SURFACE-AT ?auto_14757 ?auto_14760 ) ( CLEAR ?auto_14757 ) ( IS-CRATE ?auto_14758 ) ( AVAILABLE ?auto_14759 ) ( not ( = ?auto_14762 ?auto_14760 ) ) ( HOIST-AT ?auto_14763 ?auto_14762 ) ( AVAILABLE ?auto_14763 ) ( SURFACE-AT ?auto_14758 ?auto_14762 ) ( ON ?auto_14758 ?auto_14764 ) ( CLEAR ?auto_14758 ) ( TRUCK-AT ?auto_14761 ?auto_14760 ) ( not ( = ?auto_14757 ?auto_14758 ) ) ( not ( = ?auto_14757 ?auto_14764 ) ) ( not ( = ?auto_14758 ?auto_14764 ) ) ( not ( = ?auto_14759 ?auto_14763 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14761 ?auto_14760 ?auto_14762 )
      ( !LIFT ?auto_14763 ?auto_14758 ?auto_14764 ?auto_14762 )
      ( !LOAD ?auto_14763 ?auto_14758 ?auto_14761 ?auto_14762 )
      ( !DRIVE ?auto_14761 ?auto_14762 ?auto_14760 )
      ( !UNLOAD ?auto_14759 ?auto_14758 ?auto_14761 ?auto_14760 )
      ( !DROP ?auto_14759 ?auto_14758 ?auto_14757 ?auto_14760 )
      ( MAKE-1CRATE-VERIFY ?auto_14757 ?auto_14758 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_14770 - SURFACE
      ?auto_14771 - SURFACE
      ?auto_14772 - SURFACE
      ?auto_14773 - SURFACE
      ?auto_14774 - SURFACE
    )
    :vars
    (
      ?auto_14775 - HOIST
      ?auto_14776 - PLACE
      ?auto_14779 - PLACE
      ?auto_14780 - HOIST
      ?auto_14778 - SURFACE
      ?auto_14783 - PLACE
      ?auto_14784 - HOIST
      ?auto_14785 - SURFACE
      ?auto_14787 - PLACE
      ?auto_14781 - HOIST
      ?auto_14782 - SURFACE
      ?auto_14786 - SURFACE
      ?auto_14777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14775 ?auto_14776 ) ( IS-CRATE ?auto_14774 ) ( not ( = ?auto_14779 ?auto_14776 ) ) ( HOIST-AT ?auto_14780 ?auto_14779 ) ( SURFACE-AT ?auto_14774 ?auto_14779 ) ( ON ?auto_14774 ?auto_14778 ) ( CLEAR ?auto_14774 ) ( not ( = ?auto_14773 ?auto_14774 ) ) ( not ( = ?auto_14773 ?auto_14778 ) ) ( not ( = ?auto_14774 ?auto_14778 ) ) ( not ( = ?auto_14775 ?auto_14780 ) ) ( IS-CRATE ?auto_14773 ) ( not ( = ?auto_14783 ?auto_14776 ) ) ( HOIST-AT ?auto_14784 ?auto_14783 ) ( AVAILABLE ?auto_14784 ) ( SURFACE-AT ?auto_14773 ?auto_14783 ) ( ON ?auto_14773 ?auto_14785 ) ( CLEAR ?auto_14773 ) ( not ( = ?auto_14772 ?auto_14773 ) ) ( not ( = ?auto_14772 ?auto_14785 ) ) ( not ( = ?auto_14773 ?auto_14785 ) ) ( not ( = ?auto_14775 ?auto_14784 ) ) ( IS-CRATE ?auto_14772 ) ( not ( = ?auto_14787 ?auto_14776 ) ) ( HOIST-AT ?auto_14781 ?auto_14787 ) ( AVAILABLE ?auto_14781 ) ( SURFACE-AT ?auto_14772 ?auto_14787 ) ( ON ?auto_14772 ?auto_14782 ) ( CLEAR ?auto_14772 ) ( not ( = ?auto_14771 ?auto_14772 ) ) ( not ( = ?auto_14771 ?auto_14782 ) ) ( not ( = ?auto_14772 ?auto_14782 ) ) ( not ( = ?auto_14775 ?auto_14781 ) ) ( SURFACE-AT ?auto_14770 ?auto_14776 ) ( CLEAR ?auto_14770 ) ( IS-CRATE ?auto_14771 ) ( AVAILABLE ?auto_14775 ) ( AVAILABLE ?auto_14780 ) ( SURFACE-AT ?auto_14771 ?auto_14779 ) ( ON ?auto_14771 ?auto_14786 ) ( CLEAR ?auto_14771 ) ( TRUCK-AT ?auto_14777 ?auto_14776 ) ( not ( = ?auto_14770 ?auto_14771 ) ) ( not ( = ?auto_14770 ?auto_14786 ) ) ( not ( = ?auto_14771 ?auto_14786 ) ) ( not ( = ?auto_14770 ?auto_14772 ) ) ( not ( = ?auto_14770 ?auto_14782 ) ) ( not ( = ?auto_14772 ?auto_14786 ) ) ( not ( = ?auto_14787 ?auto_14779 ) ) ( not ( = ?auto_14781 ?auto_14780 ) ) ( not ( = ?auto_14782 ?auto_14786 ) ) ( not ( = ?auto_14770 ?auto_14773 ) ) ( not ( = ?auto_14770 ?auto_14785 ) ) ( not ( = ?auto_14771 ?auto_14773 ) ) ( not ( = ?auto_14771 ?auto_14785 ) ) ( not ( = ?auto_14773 ?auto_14782 ) ) ( not ( = ?auto_14773 ?auto_14786 ) ) ( not ( = ?auto_14783 ?auto_14787 ) ) ( not ( = ?auto_14783 ?auto_14779 ) ) ( not ( = ?auto_14784 ?auto_14781 ) ) ( not ( = ?auto_14784 ?auto_14780 ) ) ( not ( = ?auto_14785 ?auto_14782 ) ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( not ( = ?auto_14770 ?auto_14774 ) ) ( not ( = ?auto_14770 ?auto_14778 ) ) ( not ( = ?auto_14771 ?auto_14774 ) ) ( not ( = ?auto_14771 ?auto_14778 ) ) ( not ( = ?auto_14772 ?auto_14774 ) ) ( not ( = ?auto_14772 ?auto_14778 ) ) ( not ( = ?auto_14774 ?auto_14785 ) ) ( not ( = ?auto_14774 ?auto_14782 ) ) ( not ( = ?auto_14774 ?auto_14786 ) ) ( not ( = ?auto_14778 ?auto_14785 ) ) ( not ( = ?auto_14778 ?auto_14782 ) ) ( not ( = ?auto_14778 ?auto_14786 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14770 ?auto_14771 ?auto_14772 ?auto_14773 )
      ( MAKE-1CRATE ?auto_14773 ?auto_14774 )
      ( MAKE-4CRATE-VERIFY ?auto_14770 ?auto_14771 ?auto_14772 ?auto_14773 ?auto_14774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14790 - SURFACE
      ?auto_14791 - SURFACE
    )
    :vars
    (
      ?auto_14792 - HOIST
      ?auto_14793 - PLACE
      ?auto_14795 - PLACE
      ?auto_14796 - HOIST
      ?auto_14797 - SURFACE
      ?auto_14794 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14792 ?auto_14793 ) ( SURFACE-AT ?auto_14790 ?auto_14793 ) ( CLEAR ?auto_14790 ) ( IS-CRATE ?auto_14791 ) ( AVAILABLE ?auto_14792 ) ( not ( = ?auto_14795 ?auto_14793 ) ) ( HOIST-AT ?auto_14796 ?auto_14795 ) ( AVAILABLE ?auto_14796 ) ( SURFACE-AT ?auto_14791 ?auto_14795 ) ( ON ?auto_14791 ?auto_14797 ) ( CLEAR ?auto_14791 ) ( TRUCK-AT ?auto_14794 ?auto_14793 ) ( not ( = ?auto_14790 ?auto_14791 ) ) ( not ( = ?auto_14790 ?auto_14797 ) ) ( not ( = ?auto_14791 ?auto_14797 ) ) ( not ( = ?auto_14792 ?auto_14796 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14794 ?auto_14793 ?auto_14795 )
      ( !LIFT ?auto_14796 ?auto_14791 ?auto_14797 ?auto_14795 )
      ( !LOAD ?auto_14796 ?auto_14791 ?auto_14794 ?auto_14795 )
      ( !DRIVE ?auto_14794 ?auto_14795 ?auto_14793 )
      ( !UNLOAD ?auto_14792 ?auto_14791 ?auto_14794 ?auto_14793 )
      ( !DROP ?auto_14792 ?auto_14791 ?auto_14790 ?auto_14793 )
      ( MAKE-1CRATE-VERIFY ?auto_14790 ?auto_14791 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14804 - SURFACE
      ?auto_14805 - SURFACE
      ?auto_14806 - SURFACE
      ?auto_14807 - SURFACE
      ?auto_14808 - SURFACE
      ?auto_14809 - SURFACE
    )
    :vars
    (
      ?auto_14811 - HOIST
      ?auto_14815 - PLACE
      ?auto_14812 - PLACE
      ?auto_14813 - HOIST
      ?auto_14810 - SURFACE
      ?auto_14822 - PLACE
      ?auto_14816 - HOIST
      ?auto_14818 - SURFACE
      ?auto_14819 - PLACE
      ?auto_14823 - HOIST
      ?auto_14825 - SURFACE
      ?auto_14820 - PLACE
      ?auto_14817 - HOIST
      ?auto_14821 - SURFACE
      ?auto_14824 - SURFACE
      ?auto_14814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14811 ?auto_14815 ) ( IS-CRATE ?auto_14809 ) ( not ( = ?auto_14812 ?auto_14815 ) ) ( HOIST-AT ?auto_14813 ?auto_14812 ) ( AVAILABLE ?auto_14813 ) ( SURFACE-AT ?auto_14809 ?auto_14812 ) ( ON ?auto_14809 ?auto_14810 ) ( CLEAR ?auto_14809 ) ( not ( = ?auto_14808 ?auto_14809 ) ) ( not ( = ?auto_14808 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14810 ) ) ( not ( = ?auto_14811 ?auto_14813 ) ) ( IS-CRATE ?auto_14808 ) ( not ( = ?auto_14822 ?auto_14815 ) ) ( HOIST-AT ?auto_14816 ?auto_14822 ) ( SURFACE-AT ?auto_14808 ?auto_14822 ) ( ON ?auto_14808 ?auto_14818 ) ( CLEAR ?auto_14808 ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14807 ?auto_14818 ) ) ( not ( = ?auto_14808 ?auto_14818 ) ) ( not ( = ?auto_14811 ?auto_14816 ) ) ( IS-CRATE ?auto_14807 ) ( not ( = ?auto_14819 ?auto_14815 ) ) ( HOIST-AT ?auto_14823 ?auto_14819 ) ( AVAILABLE ?auto_14823 ) ( SURFACE-AT ?auto_14807 ?auto_14819 ) ( ON ?auto_14807 ?auto_14825 ) ( CLEAR ?auto_14807 ) ( not ( = ?auto_14806 ?auto_14807 ) ) ( not ( = ?auto_14806 ?auto_14825 ) ) ( not ( = ?auto_14807 ?auto_14825 ) ) ( not ( = ?auto_14811 ?auto_14823 ) ) ( IS-CRATE ?auto_14806 ) ( not ( = ?auto_14820 ?auto_14815 ) ) ( HOIST-AT ?auto_14817 ?auto_14820 ) ( AVAILABLE ?auto_14817 ) ( SURFACE-AT ?auto_14806 ?auto_14820 ) ( ON ?auto_14806 ?auto_14821 ) ( CLEAR ?auto_14806 ) ( not ( = ?auto_14805 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14821 ) ) ( not ( = ?auto_14806 ?auto_14821 ) ) ( not ( = ?auto_14811 ?auto_14817 ) ) ( SURFACE-AT ?auto_14804 ?auto_14815 ) ( CLEAR ?auto_14804 ) ( IS-CRATE ?auto_14805 ) ( AVAILABLE ?auto_14811 ) ( AVAILABLE ?auto_14816 ) ( SURFACE-AT ?auto_14805 ?auto_14822 ) ( ON ?auto_14805 ?auto_14824 ) ( CLEAR ?auto_14805 ) ( TRUCK-AT ?auto_14814 ?auto_14815 ) ( not ( = ?auto_14804 ?auto_14805 ) ) ( not ( = ?auto_14804 ?auto_14824 ) ) ( not ( = ?auto_14805 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14806 ) ) ( not ( = ?auto_14804 ?auto_14821 ) ) ( not ( = ?auto_14806 ?auto_14824 ) ) ( not ( = ?auto_14820 ?auto_14822 ) ) ( not ( = ?auto_14817 ?auto_14816 ) ) ( not ( = ?auto_14821 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14807 ) ) ( not ( = ?auto_14804 ?auto_14825 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14805 ?auto_14825 ) ) ( not ( = ?auto_14807 ?auto_14821 ) ) ( not ( = ?auto_14807 ?auto_14824 ) ) ( not ( = ?auto_14819 ?auto_14820 ) ) ( not ( = ?auto_14819 ?auto_14822 ) ) ( not ( = ?auto_14823 ?auto_14817 ) ) ( not ( = ?auto_14823 ?auto_14816 ) ) ( not ( = ?auto_14825 ?auto_14821 ) ) ( not ( = ?auto_14825 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14808 ) ) ( not ( = ?auto_14804 ?auto_14818 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14818 ) ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14806 ?auto_14818 ) ) ( not ( = ?auto_14808 ?auto_14825 ) ) ( not ( = ?auto_14808 ?auto_14821 ) ) ( not ( = ?auto_14808 ?auto_14824 ) ) ( not ( = ?auto_14818 ?auto_14825 ) ) ( not ( = ?auto_14818 ?auto_14821 ) ) ( not ( = ?auto_14818 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14809 ) ) ( not ( = ?auto_14804 ?auto_14810 ) ) ( not ( = ?auto_14805 ?auto_14809 ) ) ( not ( = ?auto_14805 ?auto_14810 ) ) ( not ( = ?auto_14806 ?auto_14809 ) ) ( not ( = ?auto_14806 ?auto_14810 ) ) ( not ( = ?auto_14807 ?auto_14809 ) ) ( not ( = ?auto_14807 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14818 ) ) ( not ( = ?auto_14809 ?auto_14825 ) ) ( not ( = ?auto_14809 ?auto_14821 ) ) ( not ( = ?auto_14809 ?auto_14824 ) ) ( not ( = ?auto_14812 ?auto_14822 ) ) ( not ( = ?auto_14812 ?auto_14819 ) ) ( not ( = ?auto_14812 ?auto_14820 ) ) ( not ( = ?auto_14813 ?auto_14816 ) ) ( not ( = ?auto_14813 ?auto_14823 ) ) ( not ( = ?auto_14813 ?auto_14817 ) ) ( not ( = ?auto_14810 ?auto_14818 ) ) ( not ( = ?auto_14810 ?auto_14825 ) ) ( not ( = ?auto_14810 ?auto_14821 ) ) ( not ( = ?auto_14810 ?auto_14824 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14804 ?auto_14805 ?auto_14806 ?auto_14807 ?auto_14808 )
      ( MAKE-1CRATE ?auto_14808 ?auto_14809 )
      ( MAKE-5CRATE-VERIFY ?auto_14804 ?auto_14805 ?auto_14806 ?auto_14807 ?auto_14808 ?auto_14809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14828 - SURFACE
      ?auto_14829 - SURFACE
    )
    :vars
    (
      ?auto_14830 - HOIST
      ?auto_14831 - PLACE
      ?auto_14833 - PLACE
      ?auto_14834 - HOIST
      ?auto_14835 - SURFACE
      ?auto_14832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14830 ?auto_14831 ) ( SURFACE-AT ?auto_14828 ?auto_14831 ) ( CLEAR ?auto_14828 ) ( IS-CRATE ?auto_14829 ) ( AVAILABLE ?auto_14830 ) ( not ( = ?auto_14833 ?auto_14831 ) ) ( HOIST-AT ?auto_14834 ?auto_14833 ) ( AVAILABLE ?auto_14834 ) ( SURFACE-AT ?auto_14829 ?auto_14833 ) ( ON ?auto_14829 ?auto_14835 ) ( CLEAR ?auto_14829 ) ( TRUCK-AT ?auto_14832 ?auto_14831 ) ( not ( = ?auto_14828 ?auto_14829 ) ) ( not ( = ?auto_14828 ?auto_14835 ) ) ( not ( = ?auto_14829 ?auto_14835 ) ) ( not ( = ?auto_14830 ?auto_14834 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14832 ?auto_14831 ?auto_14833 )
      ( !LIFT ?auto_14834 ?auto_14829 ?auto_14835 ?auto_14833 )
      ( !LOAD ?auto_14834 ?auto_14829 ?auto_14832 ?auto_14833 )
      ( !DRIVE ?auto_14832 ?auto_14833 ?auto_14831 )
      ( !UNLOAD ?auto_14830 ?auto_14829 ?auto_14832 ?auto_14831 )
      ( !DROP ?auto_14830 ?auto_14829 ?auto_14828 ?auto_14831 )
      ( MAKE-1CRATE-VERIFY ?auto_14828 ?auto_14829 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_14843 - SURFACE
      ?auto_14844 - SURFACE
      ?auto_14845 - SURFACE
      ?auto_14846 - SURFACE
      ?auto_14847 - SURFACE
      ?auto_14848 - SURFACE
      ?auto_14849 - SURFACE
    )
    :vars
    (
      ?auto_14853 - HOIST
      ?auto_14852 - PLACE
      ?auto_14850 - PLACE
      ?auto_14851 - HOIST
      ?auto_14855 - SURFACE
      ?auto_14860 - PLACE
      ?auto_14858 - HOIST
      ?auto_14859 - SURFACE
      ?auto_14865 - SURFACE
      ?auto_14856 - PLACE
      ?auto_14863 - HOIST
      ?auto_14861 - SURFACE
      ?auto_14866 - PLACE
      ?auto_14862 - HOIST
      ?auto_14857 - SURFACE
      ?auto_14864 - SURFACE
      ?auto_14854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14853 ?auto_14852 ) ( IS-CRATE ?auto_14849 ) ( not ( = ?auto_14850 ?auto_14852 ) ) ( HOIST-AT ?auto_14851 ?auto_14850 ) ( SURFACE-AT ?auto_14849 ?auto_14850 ) ( ON ?auto_14849 ?auto_14855 ) ( CLEAR ?auto_14849 ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( not ( = ?auto_14848 ?auto_14855 ) ) ( not ( = ?auto_14849 ?auto_14855 ) ) ( not ( = ?auto_14853 ?auto_14851 ) ) ( IS-CRATE ?auto_14848 ) ( not ( = ?auto_14860 ?auto_14852 ) ) ( HOIST-AT ?auto_14858 ?auto_14860 ) ( AVAILABLE ?auto_14858 ) ( SURFACE-AT ?auto_14848 ?auto_14860 ) ( ON ?auto_14848 ?auto_14859 ) ( CLEAR ?auto_14848 ) ( not ( = ?auto_14847 ?auto_14848 ) ) ( not ( = ?auto_14847 ?auto_14859 ) ) ( not ( = ?auto_14848 ?auto_14859 ) ) ( not ( = ?auto_14853 ?auto_14858 ) ) ( IS-CRATE ?auto_14847 ) ( SURFACE-AT ?auto_14847 ?auto_14850 ) ( ON ?auto_14847 ?auto_14865 ) ( CLEAR ?auto_14847 ) ( not ( = ?auto_14846 ?auto_14847 ) ) ( not ( = ?auto_14846 ?auto_14865 ) ) ( not ( = ?auto_14847 ?auto_14865 ) ) ( IS-CRATE ?auto_14846 ) ( not ( = ?auto_14856 ?auto_14852 ) ) ( HOIST-AT ?auto_14863 ?auto_14856 ) ( AVAILABLE ?auto_14863 ) ( SURFACE-AT ?auto_14846 ?auto_14856 ) ( ON ?auto_14846 ?auto_14861 ) ( CLEAR ?auto_14846 ) ( not ( = ?auto_14845 ?auto_14846 ) ) ( not ( = ?auto_14845 ?auto_14861 ) ) ( not ( = ?auto_14846 ?auto_14861 ) ) ( not ( = ?auto_14853 ?auto_14863 ) ) ( IS-CRATE ?auto_14845 ) ( not ( = ?auto_14866 ?auto_14852 ) ) ( HOIST-AT ?auto_14862 ?auto_14866 ) ( AVAILABLE ?auto_14862 ) ( SURFACE-AT ?auto_14845 ?auto_14866 ) ( ON ?auto_14845 ?auto_14857 ) ( CLEAR ?auto_14845 ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14857 ) ) ( not ( = ?auto_14845 ?auto_14857 ) ) ( not ( = ?auto_14853 ?auto_14862 ) ) ( SURFACE-AT ?auto_14843 ?auto_14852 ) ( CLEAR ?auto_14843 ) ( IS-CRATE ?auto_14844 ) ( AVAILABLE ?auto_14853 ) ( AVAILABLE ?auto_14851 ) ( SURFACE-AT ?auto_14844 ?auto_14850 ) ( ON ?auto_14844 ?auto_14864 ) ( CLEAR ?auto_14844 ) ( TRUCK-AT ?auto_14854 ?auto_14852 ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14864 ) ) ( not ( = ?auto_14844 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14857 ) ) ( not ( = ?auto_14845 ?auto_14864 ) ) ( not ( = ?auto_14866 ?auto_14850 ) ) ( not ( = ?auto_14862 ?auto_14851 ) ) ( not ( = ?auto_14857 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14846 ) ) ( not ( = ?auto_14843 ?auto_14861 ) ) ( not ( = ?auto_14844 ?auto_14846 ) ) ( not ( = ?auto_14844 ?auto_14861 ) ) ( not ( = ?auto_14846 ?auto_14857 ) ) ( not ( = ?auto_14846 ?auto_14864 ) ) ( not ( = ?auto_14856 ?auto_14866 ) ) ( not ( = ?auto_14856 ?auto_14850 ) ) ( not ( = ?auto_14863 ?auto_14862 ) ) ( not ( = ?auto_14863 ?auto_14851 ) ) ( not ( = ?auto_14861 ?auto_14857 ) ) ( not ( = ?auto_14861 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14847 ) ) ( not ( = ?auto_14843 ?auto_14865 ) ) ( not ( = ?auto_14844 ?auto_14847 ) ) ( not ( = ?auto_14844 ?auto_14865 ) ) ( not ( = ?auto_14845 ?auto_14847 ) ) ( not ( = ?auto_14845 ?auto_14865 ) ) ( not ( = ?auto_14847 ?auto_14861 ) ) ( not ( = ?auto_14847 ?auto_14857 ) ) ( not ( = ?auto_14847 ?auto_14864 ) ) ( not ( = ?auto_14865 ?auto_14861 ) ) ( not ( = ?auto_14865 ?auto_14857 ) ) ( not ( = ?auto_14865 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14848 ) ) ( not ( = ?auto_14843 ?auto_14859 ) ) ( not ( = ?auto_14844 ?auto_14848 ) ) ( not ( = ?auto_14844 ?auto_14859 ) ) ( not ( = ?auto_14845 ?auto_14848 ) ) ( not ( = ?auto_14845 ?auto_14859 ) ) ( not ( = ?auto_14846 ?auto_14848 ) ) ( not ( = ?auto_14846 ?auto_14859 ) ) ( not ( = ?auto_14848 ?auto_14865 ) ) ( not ( = ?auto_14848 ?auto_14861 ) ) ( not ( = ?auto_14848 ?auto_14857 ) ) ( not ( = ?auto_14848 ?auto_14864 ) ) ( not ( = ?auto_14860 ?auto_14850 ) ) ( not ( = ?auto_14860 ?auto_14856 ) ) ( not ( = ?auto_14860 ?auto_14866 ) ) ( not ( = ?auto_14858 ?auto_14851 ) ) ( not ( = ?auto_14858 ?auto_14863 ) ) ( not ( = ?auto_14858 ?auto_14862 ) ) ( not ( = ?auto_14859 ?auto_14865 ) ) ( not ( = ?auto_14859 ?auto_14861 ) ) ( not ( = ?auto_14859 ?auto_14857 ) ) ( not ( = ?auto_14859 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14849 ) ) ( not ( = ?auto_14843 ?auto_14855 ) ) ( not ( = ?auto_14844 ?auto_14849 ) ) ( not ( = ?auto_14844 ?auto_14855 ) ) ( not ( = ?auto_14845 ?auto_14849 ) ) ( not ( = ?auto_14845 ?auto_14855 ) ) ( not ( = ?auto_14846 ?auto_14849 ) ) ( not ( = ?auto_14846 ?auto_14855 ) ) ( not ( = ?auto_14847 ?auto_14849 ) ) ( not ( = ?auto_14847 ?auto_14855 ) ) ( not ( = ?auto_14849 ?auto_14859 ) ) ( not ( = ?auto_14849 ?auto_14865 ) ) ( not ( = ?auto_14849 ?auto_14861 ) ) ( not ( = ?auto_14849 ?auto_14857 ) ) ( not ( = ?auto_14849 ?auto_14864 ) ) ( not ( = ?auto_14855 ?auto_14859 ) ) ( not ( = ?auto_14855 ?auto_14865 ) ) ( not ( = ?auto_14855 ?auto_14861 ) ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14864 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14843 ?auto_14844 ?auto_14845 ?auto_14846 ?auto_14847 ?auto_14848 )
      ( MAKE-1CRATE ?auto_14848 ?auto_14849 )
      ( MAKE-6CRATE-VERIFY ?auto_14843 ?auto_14844 ?auto_14845 ?auto_14846 ?auto_14847 ?auto_14848 ?auto_14849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14869 - SURFACE
      ?auto_14870 - SURFACE
    )
    :vars
    (
      ?auto_14871 - HOIST
      ?auto_14872 - PLACE
      ?auto_14874 - PLACE
      ?auto_14875 - HOIST
      ?auto_14876 - SURFACE
      ?auto_14873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14871 ?auto_14872 ) ( SURFACE-AT ?auto_14869 ?auto_14872 ) ( CLEAR ?auto_14869 ) ( IS-CRATE ?auto_14870 ) ( AVAILABLE ?auto_14871 ) ( not ( = ?auto_14874 ?auto_14872 ) ) ( HOIST-AT ?auto_14875 ?auto_14874 ) ( AVAILABLE ?auto_14875 ) ( SURFACE-AT ?auto_14870 ?auto_14874 ) ( ON ?auto_14870 ?auto_14876 ) ( CLEAR ?auto_14870 ) ( TRUCK-AT ?auto_14873 ?auto_14872 ) ( not ( = ?auto_14869 ?auto_14870 ) ) ( not ( = ?auto_14869 ?auto_14876 ) ) ( not ( = ?auto_14870 ?auto_14876 ) ) ( not ( = ?auto_14871 ?auto_14875 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14873 ?auto_14872 ?auto_14874 )
      ( !LIFT ?auto_14875 ?auto_14870 ?auto_14876 ?auto_14874 )
      ( !LOAD ?auto_14875 ?auto_14870 ?auto_14873 ?auto_14874 )
      ( !DRIVE ?auto_14873 ?auto_14874 ?auto_14872 )
      ( !UNLOAD ?auto_14871 ?auto_14870 ?auto_14873 ?auto_14872 )
      ( !DROP ?auto_14871 ?auto_14870 ?auto_14869 ?auto_14872 )
      ( MAKE-1CRATE-VERIFY ?auto_14869 ?auto_14870 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_14885 - SURFACE
      ?auto_14886 - SURFACE
      ?auto_14887 - SURFACE
      ?auto_14888 - SURFACE
      ?auto_14889 - SURFACE
      ?auto_14890 - SURFACE
      ?auto_14891 - SURFACE
      ?auto_14892 - SURFACE
    )
    :vars
    (
      ?auto_14898 - HOIST
      ?auto_14895 - PLACE
      ?auto_14894 - PLACE
      ?auto_14893 - HOIST
      ?auto_14896 - SURFACE
      ?auto_14905 - PLACE
      ?auto_14904 - HOIST
      ?auto_14899 - SURFACE
      ?auto_14901 - PLACE
      ?auto_14906 - HOIST
      ?auto_14903 - SURFACE
      ?auto_14910 - SURFACE
      ?auto_14907 - PLACE
      ?auto_14911 - HOIST
      ?auto_14902 - SURFACE
      ?auto_14909 - PLACE
      ?auto_14912 - HOIST
      ?auto_14900 - SURFACE
      ?auto_14908 - SURFACE
      ?auto_14897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14898 ?auto_14895 ) ( IS-CRATE ?auto_14892 ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( HOIST-AT ?auto_14893 ?auto_14894 ) ( AVAILABLE ?auto_14893 ) ( SURFACE-AT ?auto_14892 ?auto_14894 ) ( ON ?auto_14892 ?auto_14896 ) ( CLEAR ?auto_14892 ) ( not ( = ?auto_14891 ?auto_14892 ) ) ( not ( = ?auto_14891 ?auto_14896 ) ) ( not ( = ?auto_14892 ?auto_14896 ) ) ( not ( = ?auto_14898 ?auto_14893 ) ) ( IS-CRATE ?auto_14891 ) ( not ( = ?auto_14905 ?auto_14895 ) ) ( HOIST-AT ?auto_14904 ?auto_14905 ) ( SURFACE-AT ?auto_14891 ?auto_14905 ) ( ON ?auto_14891 ?auto_14899 ) ( CLEAR ?auto_14891 ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14899 ) ) ( not ( = ?auto_14891 ?auto_14899 ) ) ( not ( = ?auto_14898 ?auto_14904 ) ) ( IS-CRATE ?auto_14890 ) ( not ( = ?auto_14901 ?auto_14895 ) ) ( HOIST-AT ?auto_14906 ?auto_14901 ) ( AVAILABLE ?auto_14906 ) ( SURFACE-AT ?auto_14890 ?auto_14901 ) ( ON ?auto_14890 ?auto_14903 ) ( CLEAR ?auto_14890 ) ( not ( = ?auto_14889 ?auto_14890 ) ) ( not ( = ?auto_14889 ?auto_14903 ) ) ( not ( = ?auto_14890 ?auto_14903 ) ) ( not ( = ?auto_14898 ?auto_14906 ) ) ( IS-CRATE ?auto_14889 ) ( SURFACE-AT ?auto_14889 ?auto_14905 ) ( ON ?auto_14889 ?auto_14910 ) ( CLEAR ?auto_14889 ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14910 ) ) ( not ( = ?auto_14889 ?auto_14910 ) ) ( IS-CRATE ?auto_14888 ) ( not ( = ?auto_14907 ?auto_14895 ) ) ( HOIST-AT ?auto_14911 ?auto_14907 ) ( AVAILABLE ?auto_14911 ) ( SURFACE-AT ?auto_14888 ?auto_14907 ) ( ON ?auto_14888 ?auto_14902 ) ( CLEAR ?auto_14888 ) ( not ( = ?auto_14887 ?auto_14888 ) ) ( not ( = ?auto_14887 ?auto_14902 ) ) ( not ( = ?auto_14888 ?auto_14902 ) ) ( not ( = ?auto_14898 ?auto_14911 ) ) ( IS-CRATE ?auto_14887 ) ( not ( = ?auto_14909 ?auto_14895 ) ) ( HOIST-AT ?auto_14912 ?auto_14909 ) ( AVAILABLE ?auto_14912 ) ( SURFACE-AT ?auto_14887 ?auto_14909 ) ( ON ?auto_14887 ?auto_14900 ) ( CLEAR ?auto_14887 ) ( not ( = ?auto_14886 ?auto_14887 ) ) ( not ( = ?auto_14886 ?auto_14900 ) ) ( not ( = ?auto_14887 ?auto_14900 ) ) ( not ( = ?auto_14898 ?auto_14912 ) ) ( SURFACE-AT ?auto_14885 ?auto_14895 ) ( CLEAR ?auto_14885 ) ( IS-CRATE ?auto_14886 ) ( AVAILABLE ?auto_14898 ) ( AVAILABLE ?auto_14904 ) ( SURFACE-AT ?auto_14886 ?auto_14905 ) ( ON ?auto_14886 ?auto_14908 ) ( CLEAR ?auto_14886 ) ( TRUCK-AT ?auto_14897 ?auto_14895 ) ( not ( = ?auto_14885 ?auto_14886 ) ) ( not ( = ?auto_14885 ?auto_14908 ) ) ( not ( = ?auto_14886 ?auto_14908 ) ) ( not ( = ?auto_14885 ?auto_14887 ) ) ( not ( = ?auto_14885 ?auto_14900 ) ) ( not ( = ?auto_14887 ?auto_14908 ) ) ( not ( = ?auto_14909 ?auto_14905 ) ) ( not ( = ?auto_14912 ?auto_14904 ) ) ( not ( = ?auto_14900 ?auto_14908 ) ) ( not ( = ?auto_14885 ?auto_14888 ) ) ( not ( = ?auto_14885 ?auto_14902 ) ) ( not ( = ?auto_14886 ?auto_14888 ) ) ( not ( = ?auto_14886 ?auto_14902 ) ) ( not ( = ?auto_14888 ?auto_14900 ) ) ( not ( = ?auto_14888 ?auto_14908 ) ) ( not ( = ?auto_14907 ?auto_14909 ) ) ( not ( = ?auto_14907 ?auto_14905 ) ) ( not ( = ?auto_14911 ?auto_14912 ) ) ( not ( = ?auto_14911 ?auto_14904 ) ) ( not ( = ?auto_14902 ?auto_14900 ) ) ( not ( = ?auto_14902 ?auto_14908 ) ) ( not ( = ?auto_14885 ?auto_14889 ) ) ( not ( = ?auto_14885 ?auto_14910 ) ) ( not ( = ?auto_14886 ?auto_14889 ) ) ( not ( = ?auto_14886 ?auto_14910 ) ) ( not ( = ?auto_14887 ?auto_14889 ) ) ( not ( = ?auto_14887 ?auto_14910 ) ) ( not ( = ?auto_14889 ?auto_14902 ) ) ( not ( = ?auto_14889 ?auto_14900 ) ) ( not ( = ?auto_14889 ?auto_14908 ) ) ( not ( = ?auto_14910 ?auto_14902 ) ) ( not ( = ?auto_14910 ?auto_14900 ) ) ( not ( = ?auto_14910 ?auto_14908 ) ) ( not ( = ?auto_14885 ?auto_14890 ) ) ( not ( = ?auto_14885 ?auto_14903 ) ) ( not ( = ?auto_14886 ?auto_14890 ) ) ( not ( = ?auto_14886 ?auto_14903 ) ) ( not ( = ?auto_14887 ?auto_14890 ) ) ( not ( = ?auto_14887 ?auto_14903 ) ) ( not ( = ?auto_14888 ?auto_14890 ) ) ( not ( = ?auto_14888 ?auto_14903 ) ) ( not ( = ?auto_14890 ?auto_14910 ) ) ( not ( = ?auto_14890 ?auto_14902 ) ) ( not ( = ?auto_14890 ?auto_14900 ) ) ( not ( = ?auto_14890 ?auto_14908 ) ) ( not ( = ?auto_14901 ?auto_14905 ) ) ( not ( = ?auto_14901 ?auto_14907 ) ) ( not ( = ?auto_14901 ?auto_14909 ) ) ( not ( = ?auto_14906 ?auto_14904 ) ) ( not ( = ?auto_14906 ?auto_14911 ) ) ( not ( = ?auto_14906 ?auto_14912 ) ) ( not ( = ?auto_14903 ?auto_14910 ) ) ( not ( = ?auto_14903 ?auto_14902 ) ) ( not ( = ?auto_14903 ?auto_14900 ) ) ( not ( = ?auto_14903 ?auto_14908 ) ) ( not ( = ?auto_14885 ?auto_14891 ) ) ( not ( = ?auto_14885 ?auto_14899 ) ) ( not ( = ?auto_14886 ?auto_14891 ) ) ( not ( = ?auto_14886 ?auto_14899 ) ) ( not ( = ?auto_14887 ?auto_14891 ) ) ( not ( = ?auto_14887 ?auto_14899 ) ) ( not ( = ?auto_14888 ?auto_14891 ) ) ( not ( = ?auto_14888 ?auto_14899 ) ) ( not ( = ?auto_14889 ?auto_14891 ) ) ( not ( = ?auto_14889 ?auto_14899 ) ) ( not ( = ?auto_14891 ?auto_14903 ) ) ( not ( = ?auto_14891 ?auto_14910 ) ) ( not ( = ?auto_14891 ?auto_14902 ) ) ( not ( = ?auto_14891 ?auto_14900 ) ) ( not ( = ?auto_14891 ?auto_14908 ) ) ( not ( = ?auto_14899 ?auto_14903 ) ) ( not ( = ?auto_14899 ?auto_14910 ) ) ( not ( = ?auto_14899 ?auto_14902 ) ) ( not ( = ?auto_14899 ?auto_14900 ) ) ( not ( = ?auto_14899 ?auto_14908 ) ) ( not ( = ?auto_14885 ?auto_14892 ) ) ( not ( = ?auto_14885 ?auto_14896 ) ) ( not ( = ?auto_14886 ?auto_14892 ) ) ( not ( = ?auto_14886 ?auto_14896 ) ) ( not ( = ?auto_14887 ?auto_14892 ) ) ( not ( = ?auto_14887 ?auto_14896 ) ) ( not ( = ?auto_14888 ?auto_14892 ) ) ( not ( = ?auto_14888 ?auto_14896 ) ) ( not ( = ?auto_14889 ?auto_14892 ) ) ( not ( = ?auto_14889 ?auto_14896 ) ) ( not ( = ?auto_14890 ?auto_14892 ) ) ( not ( = ?auto_14890 ?auto_14896 ) ) ( not ( = ?auto_14892 ?auto_14899 ) ) ( not ( = ?auto_14892 ?auto_14903 ) ) ( not ( = ?auto_14892 ?auto_14910 ) ) ( not ( = ?auto_14892 ?auto_14902 ) ) ( not ( = ?auto_14892 ?auto_14900 ) ) ( not ( = ?auto_14892 ?auto_14908 ) ) ( not ( = ?auto_14894 ?auto_14905 ) ) ( not ( = ?auto_14894 ?auto_14901 ) ) ( not ( = ?auto_14894 ?auto_14907 ) ) ( not ( = ?auto_14894 ?auto_14909 ) ) ( not ( = ?auto_14893 ?auto_14904 ) ) ( not ( = ?auto_14893 ?auto_14906 ) ) ( not ( = ?auto_14893 ?auto_14911 ) ) ( not ( = ?auto_14893 ?auto_14912 ) ) ( not ( = ?auto_14896 ?auto_14899 ) ) ( not ( = ?auto_14896 ?auto_14903 ) ) ( not ( = ?auto_14896 ?auto_14910 ) ) ( not ( = ?auto_14896 ?auto_14902 ) ) ( not ( = ?auto_14896 ?auto_14900 ) ) ( not ( = ?auto_14896 ?auto_14908 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14885 ?auto_14886 ?auto_14887 ?auto_14888 ?auto_14889 ?auto_14890 ?auto_14891 )
      ( MAKE-1CRATE ?auto_14891 ?auto_14892 )
      ( MAKE-7CRATE-VERIFY ?auto_14885 ?auto_14886 ?auto_14887 ?auto_14888 ?auto_14889 ?auto_14890 ?auto_14891 ?auto_14892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14915 - SURFACE
      ?auto_14916 - SURFACE
    )
    :vars
    (
      ?auto_14917 - HOIST
      ?auto_14918 - PLACE
      ?auto_14920 - PLACE
      ?auto_14921 - HOIST
      ?auto_14922 - SURFACE
      ?auto_14919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14917 ?auto_14918 ) ( SURFACE-AT ?auto_14915 ?auto_14918 ) ( CLEAR ?auto_14915 ) ( IS-CRATE ?auto_14916 ) ( AVAILABLE ?auto_14917 ) ( not ( = ?auto_14920 ?auto_14918 ) ) ( HOIST-AT ?auto_14921 ?auto_14920 ) ( AVAILABLE ?auto_14921 ) ( SURFACE-AT ?auto_14916 ?auto_14920 ) ( ON ?auto_14916 ?auto_14922 ) ( CLEAR ?auto_14916 ) ( TRUCK-AT ?auto_14919 ?auto_14918 ) ( not ( = ?auto_14915 ?auto_14916 ) ) ( not ( = ?auto_14915 ?auto_14922 ) ) ( not ( = ?auto_14916 ?auto_14922 ) ) ( not ( = ?auto_14917 ?auto_14921 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_14919 ?auto_14918 ?auto_14920 )
      ( !LIFT ?auto_14921 ?auto_14916 ?auto_14922 ?auto_14920 )
      ( !LOAD ?auto_14921 ?auto_14916 ?auto_14919 ?auto_14920 )
      ( !DRIVE ?auto_14919 ?auto_14920 ?auto_14918 )
      ( !UNLOAD ?auto_14917 ?auto_14916 ?auto_14919 ?auto_14918 )
      ( !DROP ?auto_14917 ?auto_14916 ?auto_14915 ?auto_14918 )
      ( MAKE-1CRATE-VERIFY ?auto_14915 ?auto_14916 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_14932 - SURFACE
      ?auto_14933 - SURFACE
      ?auto_14934 - SURFACE
      ?auto_14935 - SURFACE
      ?auto_14936 - SURFACE
      ?auto_14937 - SURFACE
      ?auto_14938 - SURFACE
      ?auto_14940 - SURFACE
      ?auto_14939 - SURFACE
    )
    :vars
    (
      ?auto_14946 - HOIST
      ?auto_14943 - PLACE
      ?auto_14944 - PLACE
      ?auto_14942 - HOIST
      ?auto_14941 - SURFACE
      ?auto_14948 - PLACE
      ?auto_14953 - HOIST
      ?auto_14949 - SURFACE
      ?auto_14950 - PLACE
      ?auto_14951 - HOIST
      ?auto_14955 - SURFACE
      ?auto_14956 - PLACE
      ?auto_14961 - HOIST
      ?auto_14952 - SURFACE
      ?auto_14959 - SURFACE
      ?auto_14947 - SURFACE
      ?auto_14957 - PLACE
      ?auto_14960 - HOIST
      ?auto_14954 - SURFACE
      ?auto_14958 - SURFACE
      ?auto_14945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14946 ?auto_14943 ) ( IS-CRATE ?auto_14939 ) ( not ( = ?auto_14944 ?auto_14943 ) ) ( HOIST-AT ?auto_14942 ?auto_14944 ) ( SURFACE-AT ?auto_14939 ?auto_14944 ) ( ON ?auto_14939 ?auto_14941 ) ( CLEAR ?auto_14939 ) ( not ( = ?auto_14940 ?auto_14939 ) ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( not ( = ?auto_14946 ?auto_14942 ) ) ( IS-CRATE ?auto_14940 ) ( not ( = ?auto_14948 ?auto_14943 ) ) ( HOIST-AT ?auto_14953 ?auto_14948 ) ( AVAILABLE ?auto_14953 ) ( SURFACE-AT ?auto_14940 ?auto_14948 ) ( ON ?auto_14940 ?auto_14949 ) ( CLEAR ?auto_14940 ) ( not ( = ?auto_14938 ?auto_14940 ) ) ( not ( = ?auto_14938 ?auto_14949 ) ) ( not ( = ?auto_14940 ?auto_14949 ) ) ( not ( = ?auto_14946 ?auto_14953 ) ) ( IS-CRATE ?auto_14938 ) ( not ( = ?auto_14950 ?auto_14943 ) ) ( HOIST-AT ?auto_14951 ?auto_14950 ) ( SURFACE-AT ?auto_14938 ?auto_14950 ) ( ON ?auto_14938 ?auto_14955 ) ( CLEAR ?auto_14938 ) ( not ( = ?auto_14937 ?auto_14938 ) ) ( not ( = ?auto_14937 ?auto_14955 ) ) ( not ( = ?auto_14938 ?auto_14955 ) ) ( not ( = ?auto_14946 ?auto_14951 ) ) ( IS-CRATE ?auto_14937 ) ( not ( = ?auto_14956 ?auto_14943 ) ) ( HOIST-AT ?auto_14961 ?auto_14956 ) ( AVAILABLE ?auto_14961 ) ( SURFACE-AT ?auto_14937 ?auto_14956 ) ( ON ?auto_14937 ?auto_14952 ) ( CLEAR ?auto_14937 ) ( not ( = ?auto_14936 ?auto_14937 ) ) ( not ( = ?auto_14936 ?auto_14952 ) ) ( not ( = ?auto_14937 ?auto_14952 ) ) ( not ( = ?auto_14946 ?auto_14961 ) ) ( IS-CRATE ?auto_14936 ) ( SURFACE-AT ?auto_14936 ?auto_14950 ) ( ON ?auto_14936 ?auto_14959 ) ( CLEAR ?auto_14936 ) ( not ( = ?auto_14935 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14959 ) ) ( not ( = ?auto_14936 ?auto_14959 ) ) ( IS-CRATE ?auto_14935 ) ( AVAILABLE ?auto_14942 ) ( SURFACE-AT ?auto_14935 ?auto_14944 ) ( ON ?auto_14935 ?auto_14947 ) ( CLEAR ?auto_14935 ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14934 ?auto_14947 ) ) ( not ( = ?auto_14935 ?auto_14947 ) ) ( IS-CRATE ?auto_14934 ) ( not ( = ?auto_14957 ?auto_14943 ) ) ( HOIST-AT ?auto_14960 ?auto_14957 ) ( AVAILABLE ?auto_14960 ) ( SURFACE-AT ?auto_14934 ?auto_14957 ) ( ON ?auto_14934 ?auto_14954 ) ( CLEAR ?auto_14934 ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( not ( = ?auto_14933 ?auto_14954 ) ) ( not ( = ?auto_14934 ?auto_14954 ) ) ( not ( = ?auto_14946 ?auto_14960 ) ) ( SURFACE-AT ?auto_14932 ?auto_14943 ) ( CLEAR ?auto_14932 ) ( IS-CRATE ?auto_14933 ) ( AVAILABLE ?auto_14946 ) ( AVAILABLE ?auto_14951 ) ( SURFACE-AT ?auto_14933 ?auto_14950 ) ( ON ?auto_14933 ?auto_14958 ) ( CLEAR ?auto_14933 ) ( TRUCK-AT ?auto_14945 ?auto_14943 ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14958 ) ) ( not ( = ?auto_14933 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14954 ) ) ( not ( = ?auto_14934 ?auto_14958 ) ) ( not ( = ?auto_14957 ?auto_14950 ) ) ( not ( = ?auto_14960 ?auto_14951 ) ) ( not ( = ?auto_14954 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14935 ) ) ( not ( = ?auto_14932 ?auto_14947 ) ) ( not ( = ?auto_14933 ?auto_14935 ) ) ( not ( = ?auto_14933 ?auto_14947 ) ) ( not ( = ?auto_14935 ?auto_14954 ) ) ( not ( = ?auto_14935 ?auto_14958 ) ) ( not ( = ?auto_14944 ?auto_14957 ) ) ( not ( = ?auto_14944 ?auto_14950 ) ) ( not ( = ?auto_14942 ?auto_14960 ) ) ( not ( = ?auto_14942 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14954 ) ) ( not ( = ?auto_14947 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14936 ) ) ( not ( = ?auto_14932 ?auto_14959 ) ) ( not ( = ?auto_14933 ?auto_14936 ) ) ( not ( = ?auto_14933 ?auto_14959 ) ) ( not ( = ?auto_14934 ?auto_14936 ) ) ( not ( = ?auto_14934 ?auto_14959 ) ) ( not ( = ?auto_14936 ?auto_14947 ) ) ( not ( = ?auto_14936 ?auto_14954 ) ) ( not ( = ?auto_14936 ?auto_14958 ) ) ( not ( = ?auto_14959 ?auto_14947 ) ) ( not ( = ?auto_14959 ?auto_14954 ) ) ( not ( = ?auto_14959 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14937 ) ) ( not ( = ?auto_14932 ?auto_14952 ) ) ( not ( = ?auto_14933 ?auto_14937 ) ) ( not ( = ?auto_14933 ?auto_14952 ) ) ( not ( = ?auto_14934 ?auto_14937 ) ) ( not ( = ?auto_14934 ?auto_14952 ) ) ( not ( = ?auto_14935 ?auto_14937 ) ) ( not ( = ?auto_14935 ?auto_14952 ) ) ( not ( = ?auto_14937 ?auto_14959 ) ) ( not ( = ?auto_14937 ?auto_14947 ) ) ( not ( = ?auto_14937 ?auto_14954 ) ) ( not ( = ?auto_14937 ?auto_14958 ) ) ( not ( = ?auto_14956 ?auto_14950 ) ) ( not ( = ?auto_14956 ?auto_14944 ) ) ( not ( = ?auto_14956 ?auto_14957 ) ) ( not ( = ?auto_14961 ?auto_14951 ) ) ( not ( = ?auto_14961 ?auto_14942 ) ) ( not ( = ?auto_14961 ?auto_14960 ) ) ( not ( = ?auto_14952 ?auto_14959 ) ) ( not ( = ?auto_14952 ?auto_14947 ) ) ( not ( = ?auto_14952 ?auto_14954 ) ) ( not ( = ?auto_14952 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14938 ) ) ( not ( = ?auto_14932 ?auto_14955 ) ) ( not ( = ?auto_14933 ?auto_14938 ) ) ( not ( = ?auto_14933 ?auto_14955 ) ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14934 ?auto_14955 ) ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14955 ) ) ( not ( = ?auto_14936 ?auto_14938 ) ) ( not ( = ?auto_14936 ?auto_14955 ) ) ( not ( = ?auto_14938 ?auto_14952 ) ) ( not ( = ?auto_14938 ?auto_14959 ) ) ( not ( = ?auto_14938 ?auto_14947 ) ) ( not ( = ?auto_14938 ?auto_14954 ) ) ( not ( = ?auto_14938 ?auto_14958 ) ) ( not ( = ?auto_14955 ?auto_14952 ) ) ( not ( = ?auto_14955 ?auto_14959 ) ) ( not ( = ?auto_14955 ?auto_14947 ) ) ( not ( = ?auto_14955 ?auto_14954 ) ) ( not ( = ?auto_14955 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14940 ) ) ( not ( = ?auto_14932 ?auto_14949 ) ) ( not ( = ?auto_14933 ?auto_14940 ) ) ( not ( = ?auto_14933 ?auto_14949 ) ) ( not ( = ?auto_14934 ?auto_14940 ) ) ( not ( = ?auto_14934 ?auto_14949 ) ) ( not ( = ?auto_14935 ?auto_14940 ) ) ( not ( = ?auto_14935 ?auto_14949 ) ) ( not ( = ?auto_14936 ?auto_14940 ) ) ( not ( = ?auto_14936 ?auto_14949 ) ) ( not ( = ?auto_14937 ?auto_14940 ) ) ( not ( = ?auto_14937 ?auto_14949 ) ) ( not ( = ?auto_14940 ?auto_14955 ) ) ( not ( = ?auto_14940 ?auto_14952 ) ) ( not ( = ?auto_14940 ?auto_14959 ) ) ( not ( = ?auto_14940 ?auto_14947 ) ) ( not ( = ?auto_14940 ?auto_14954 ) ) ( not ( = ?auto_14940 ?auto_14958 ) ) ( not ( = ?auto_14948 ?auto_14950 ) ) ( not ( = ?auto_14948 ?auto_14956 ) ) ( not ( = ?auto_14948 ?auto_14944 ) ) ( not ( = ?auto_14948 ?auto_14957 ) ) ( not ( = ?auto_14953 ?auto_14951 ) ) ( not ( = ?auto_14953 ?auto_14961 ) ) ( not ( = ?auto_14953 ?auto_14942 ) ) ( not ( = ?auto_14953 ?auto_14960 ) ) ( not ( = ?auto_14949 ?auto_14955 ) ) ( not ( = ?auto_14949 ?auto_14952 ) ) ( not ( = ?auto_14949 ?auto_14959 ) ) ( not ( = ?auto_14949 ?auto_14947 ) ) ( not ( = ?auto_14949 ?auto_14954 ) ) ( not ( = ?auto_14949 ?auto_14958 ) ) ( not ( = ?auto_14932 ?auto_14939 ) ) ( not ( = ?auto_14932 ?auto_14941 ) ) ( not ( = ?auto_14933 ?auto_14939 ) ) ( not ( = ?auto_14933 ?auto_14941 ) ) ( not ( = ?auto_14934 ?auto_14939 ) ) ( not ( = ?auto_14934 ?auto_14941 ) ) ( not ( = ?auto_14935 ?auto_14939 ) ) ( not ( = ?auto_14935 ?auto_14941 ) ) ( not ( = ?auto_14936 ?auto_14939 ) ) ( not ( = ?auto_14936 ?auto_14941 ) ) ( not ( = ?auto_14937 ?auto_14939 ) ) ( not ( = ?auto_14937 ?auto_14941 ) ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14941 ) ) ( not ( = ?auto_14939 ?auto_14949 ) ) ( not ( = ?auto_14939 ?auto_14955 ) ) ( not ( = ?auto_14939 ?auto_14952 ) ) ( not ( = ?auto_14939 ?auto_14959 ) ) ( not ( = ?auto_14939 ?auto_14947 ) ) ( not ( = ?auto_14939 ?auto_14954 ) ) ( not ( = ?auto_14939 ?auto_14958 ) ) ( not ( = ?auto_14941 ?auto_14949 ) ) ( not ( = ?auto_14941 ?auto_14955 ) ) ( not ( = ?auto_14941 ?auto_14952 ) ) ( not ( = ?auto_14941 ?auto_14959 ) ) ( not ( = ?auto_14941 ?auto_14947 ) ) ( not ( = ?auto_14941 ?auto_14954 ) ) ( not ( = ?auto_14941 ?auto_14958 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ?auto_14938 ?auto_14940 )
      ( MAKE-1CRATE ?auto_14940 ?auto_14939 )
      ( MAKE-8CRATE-VERIFY ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ?auto_14938 ?auto_14940 ?auto_14939 ) )
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

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_14982 - SURFACE
      ?auto_14983 - SURFACE
      ?auto_14984 - SURFACE
      ?auto_14985 - SURFACE
      ?auto_14986 - SURFACE
      ?auto_14987 - SURFACE
      ?auto_14988 - SURFACE
      ?auto_14991 - SURFACE
      ?auto_14990 - SURFACE
      ?auto_14989 - SURFACE
    )
    :vars
    (
      ?auto_14995 - HOIST
      ?auto_14992 - PLACE
      ?auto_14994 - PLACE
      ?auto_14996 - HOIST
      ?auto_14993 - SURFACE
      ?auto_15013 - PLACE
      ?auto_14999 - HOIST
      ?auto_15011 - SURFACE
      ?auto_15000 - PLACE
      ?auto_15010 - HOIST
      ?auto_15004 - SURFACE
      ?auto_14998 - PLACE
      ?auto_15009 - HOIST
      ?auto_15002 - SURFACE
      ?auto_15012 - SURFACE
      ?auto_15006 - SURFACE
      ?auto_15001 - SURFACE
      ?auto_15003 - PLACE
      ?auto_15007 - HOIST
      ?auto_15008 - SURFACE
      ?auto_15005 - SURFACE
      ?auto_14997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14995 ?auto_14992 ) ( IS-CRATE ?auto_14989 ) ( not ( = ?auto_14994 ?auto_14992 ) ) ( HOIST-AT ?auto_14996 ?auto_14994 ) ( SURFACE-AT ?auto_14989 ?auto_14994 ) ( ON ?auto_14989 ?auto_14993 ) ( CLEAR ?auto_14989 ) ( not ( = ?auto_14990 ?auto_14989 ) ) ( not ( = ?auto_14990 ?auto_14993 ) ) ( not ( = ?auto_14989 ?auto_14993 ) ) ( not ( = ?auto_14995 ?auto_14996 ) ) ( IS-CRATE ?auto_14990 ) ( not ( = ?auto_15013 ?auto_14992 ) ) ( HOIST-AT ?auto_14999 ?auto_15013 ) ( SURFACE-AT ?auto_14990 ?auto_15013 ) ( ON ?auto_14990 ?auto_15011 ) ( CLEAR ?auto_14990 ) ( not ( = ?auto_14991 ?auto_14990 ) ) ( not ( = ?auto_14991 ?auto_15011 ) ) ( not ( = ?auto_14990 ?auto_15011 ) ) ( not ( = ?auto_14995 ?auto_14999 ) ) ( IS-CRATE ?auto_14991 ) ( not ( = ?auto_15000 ?auto_14992 ) ) ( HOIST-AT ?auto_15010 ?auto_15000 ) ( AVAILABLE ?auto_15010 ) ( SURFACE-AT ?auto_14991 ?auto_15000 ) ( ON ?auto_14991 ?auto_15004 ) ( CLEAR ?auto_14991 ) ( not ( = ?auto_14988 ?auto_14991 ) ) ( not ( = ?auto_14988 ?auto_15004 ) ) ( not ( = ?auto_14991 ?auto_15004 ) ) ( not ( = ?auto_14995 ?auto_15010 ) ) ( IS-CRATE ?auto_14988 ) ( not ( = ?auto_14998 ?auto_14992 ) ) ( HOIST-AT ?auto_15009 ?auto_14998 ) ( SURFACE-AT ?auto_14988 ?auto_14998 ) ( ON ?auto_14988 ?auto_15002 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14987 ?auto_15002 ) ) ( not ( = ?auto_14988 ?auto_15002 ) ) ( not ( = ?auto_14995 ?auto_15009 ) ) ( IS-CRATE ?auto_14987 ) ( AVAILABLE ?auto_14996 ) ( SURFACE-AT ?auto_14987 ?auto_14994 ) ( ON ?auto_14987 ?auto_15012 ) ( CLEAR ?auto_14987 ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_15012 ) ) ( not ( = ?auto_14987 ?auto_15012 ) ) ( IS-CRATE ?auto_14986 ) ( SURFACE-AT ?auto_14986 ?auto_14998 ) ( ON ?auto_14986 ?auto_15006 ) ( CLEAR ?auto_14986 ) ( not ( = ?auto_14985 ?auto_14986 ) ) ( not ( = ?auto_14985 ?auto_15006 ) ) ( not ( = ?auto_14986 ?auto_15006 ) ) ( IS-CRATE ?auto_14985 ) ( AVAILABLE ?auto_14999 ) ( SURFACE-AT ?auto_14985 ?auto_15013 ) ( ON ?auto_14985 ?auto_15001 ) ( CLEAR ?auto_14985 ) ( not ( = ?auto_14984 ?auto_14985 ) ) ( not ( = ?auto_14984 ?auto_15001 ) ) ( not ( = ?auto_14985 ?auto_15001 ) ) ( IS-CRATE ?auto_14984 ) ( not ( = ?auto_15003 ?auto_14992 ) ) ( HOIST-AT ?auto_15007 ?auto_15003 ) ( AVAILABLE ?auto_15007 ) ( SURFACE-AT ?auto_14984 ?auto_15003 ) ( ON ?auto_14984 ?auto_15008 ) ( CLEAR ?auto_14984 ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_15008 ) ) ( not ( = ?auto_14984 ?auto_15008 ) ) ( not ( = ?auto_14995 ?auto_15007 ) ) ( SURFACE-AT ?auto_14982 ?auto_14992 ) ( CLEAR ?auto_14982 ) ( IS-CRATE ?auto_14983 ) ( AVAILABLE ?auto_14995 ) ( AVAILABLE ?auto_15009 ) ( SURFACE-AT ?auto_14983 ?auto_14998 ) ( ON ?auto_14983 ?auto_15005 ) ( CLEAR ?auto_14983 ) ( TRUCK-AT ?auto_14997 ?auto_14992 ) ( not ( = ?auto_14982 ?auto_14983 ) ) ( not ( = ?auto_14982 ?auto_15005 ) ) ( not ( = ?auto_14983 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14984 ) ) ( not ( = ?auto_14982 ?auto_15008 ) ) ( not ( = ?auto_14984 ?auto_15005 ) ) ( not ( = ?auto_15003 ?auto_14998 ) ) ( not ( = ?auto_15007 ?auto_15009 ) ) ( not ( = ?auto_15008 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14985 ) ) ( not ( = ?auto_14982 ?auto_15001 ) ) ( not ( = ?auto_14983 ?auto_14985 ) ) ( not ( = ?auto_14983 ?auto_15001 ) ) ( not ( = ?auto_14985 ?auto_15008 ) ) ( not ( = ?auto_14985 ?auto_15005 ) ) ( not ( = ?auto_15013 ?auto_15003 ) ) ( not ( = ?auto_15013 ?auto_14998 ) ) ( not ( = ?auto_14999 ?auto_15007 ) ) ( not ( = ?auto_14999 ?auto_15009 ) ) ( not ( = ?auto_15001 ?auto_15008 ) ) ( not ( = ?auto_15001 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14986 ) ) ( not ( = ?auto_14982 ?auto_15006 ) ) ( not ( = ?auto_14983 ?auto_14986 ) ) ( not ( = ?auto_14983 ?auto_15006 ) ) ( not ( = ?auto_14984 ?auto_14986 ) ) ( not ( = ?auto_14984 ?auto_15006 ) ) ( not ( = ?auto_14986 ?auto_15001 ) ) ( not ( = ?auto_14986 ?auto_15008 ) ) ( not ( = ?auto_14986 ?auto_15005 ) ) ( not ( = ?auto_15006 ?auto_15001 ) ) ( not ( = ?auto_15006 ?auto_15008 ) ) ( not ( = ?auto_15006 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14987 ) ) ( not ( = ?auto_14982 ?auto_15012 ) ) ( not ( = ?auto_14983 ?auto_14987 ) ) ( not ( = ?auto_14983 ?auto_15012 ) ) ( not ( = ?auto_14984 ?auto_14987 ) ) ( not ( = ?auto_14984 ?auto_15012 ) ) ( not ( = ?auto_14985 ?auto_14987 ) ) ( not ( = ?auto_14985 ?auto_15012 ) ) ( not ( = ?auto_14987 ?auto_15006 ) ) ( not ( = ?auto_14987 ?auto_15001 ) ) ( not ( = ?auto_14987 ?auto_15008 ) ) ( not ( = ?auto_14987 ?auto_15005 ) ) ( not ( = ?auto_14994 ?auto_14998 ) ) ( not ( = ?auto_14994 ?auto_15013 ) ) ( not ( = ?auto_14994 ?auto_15003 ) ) ( not ( = ?auto_14996 ?auto_15009 ) ) ( not ( = ?auto_14996 ?auto_14999 ) ) ( not ( = ?auto_14996 ?auto_15007 ) ) ( not ( = ?auto_15012 ?auto_15006 ) ) ( not ( = ?auto_15012 ?auto_15001 ) ) ( not ( = ?auto_15012 ?auto_15008 ) ) ( not ( = ?auto_15012 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14988 ) ) ( not ( = ?auto_14982 ?auto_15002 ) ) ( not ( = ?auto_14983 ?auto_14988 ) ) ( not ( = ?auto_14983 ?auto_15002 ) ) ( not ( = ?auto_14984 ?auto_14988 ) ) ( not ( = ?auto_14984 ?auto_15002 ) ) ( not ( = ?auto_14985 ?auto_14988 ) ) ( not ( = ?auto_14985 ?auto_15002 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_15002 ) ) ( not ( = ?auto_14988 ?auto_15012 ) ) ( not ( = ?auto_14988 ?auto_15006 ) ) ( not ( = ?auto_14988 ?auto_15001 ) ) ( not ( = ?auto_14988 ?auto_15008 ) ) ( not ( = ?auto_14988 ?auto_15005 ) ) ( not ( = ?auto_15002 ?auto_15012 ) ) ( not ( = ?auto_15002 ?auto_15006 ) ) ( not ( = ?auto_15002 ?auto_15001 ) ) ( not ( = ?auto_15002 ?auto_15008 ) ) ( not ( = ?auto_15002 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14991 ) ) ( not ( = ?auto_14982 ?auto_15004 ) ) ( not ( = ?auto_14983 ?auto_14991 ) ) ( not ( = ?auto_14983 ?auto_15004 ) ) ( not ( = ?auto_14984 ?auto_14991 ) ) ( not ( = ?auto_14984 ?auto_15004 ) ) ( not ( = ?auto_14985 ?auto_14991 ) ) ( not ( = ?auto_14985 ?auto_15004 ) ) ( not ( = ?auto_14986 ?auto_14991 ) ) ( not ( = ?auto_14986 ?auto_15004 ) ) ( not ( = ?auto_14987 ?auto_14991 ) ) ( not ( = ?auto_14987 ?auto_15004 ) ) ( not ( = ?auto_14991 ?auto_15002 ) ) ( not ( = ?auto_14991 ?auto_15012 ) ) ( not ( = ?auto_14991 ?auto_15006 ) ) ( not ( = ?auto_14991 ?auto_15001 ) ) ( not ( = ?auto_14991 ?auto_15008 ) ) ( not ( = ?auto_14991 ?auto_15005 ) ) ( not ( = ?auto_15000 ?auto_14998 ) ) ( not ( = ?auto_15000 ?auto_14994 ) ) ( not ( = ?auto_15000 ?auto_15013 ) ) ( not ( = ?auto_15000 ?auto_15003 ) ) ( not ( = ?auto_15010 ?auto_15009 ) ) ( not ( = ?auto_15010 ?auto_14996 ) ) ( not ( = ?auto_15010 ?auto_14999 ) ) ( not ( = ?auto_15010 ?auto_15007 ) ) ( not ( = ?auto_15004 ?auto_15002 ) ) ( not ( = ?auto_15004 ?auto_15012 ) ) ( not ( = ?auto_15004 ?auto_15006 ) ) ( not ( = ?auto_15004 ?auto_15001 ) ) ( not ( = ?auto_15004 ?auto_15008 ) ) ( not ( = ?auto_15004 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14990 ) ) ( not ( = ?auto_14982 ?auto_15011 ) ) ( not ( = ?auto_14983 ?auto_14990 ) ) ( not ( = ?auto_14983 ?auto_15011 ) ) ( not ( = ?auto_14984 ?auto_14990 ) ) ( not ( = ?auto_14984 ?auto_15011 ) ) ( not ( = ?auto_14985 ?auto_14990 ) ) ( not ( = ?auto_14985 ?auto_15011 ) ) ( not ( = ?auto_14986 ?auto_14990 ) ) ( not ( = ?auto_14986 ?auto_15011 ) ) ( not ( = ?auto_14987 ?auto_14990 ) ) ( not ( = ?auto_14987 ?auto_15011 ) ) ( not ( = ?auto_14988 ?auto_14990 ) ) ( not ( = ?auto_14988 ?auto_15011 ) ) ( not ( = ?auto_14990 ?auto_15004 ) ) ( not ( = ?auto_14990 ?auto_15002 ) ) ( not ( = ?auto_14990 ?auto_15012 ) ) ( not ( = ?auto_14990 ?auto_15006 ) ) ( not ( = ?auto_14990 ?auto_15001 ) ) ( not ( = ?auto_14990 ?auto_15008 ) ) ( not ( = ?auto_14990 ?auto_15005 ) ) ( not ( = ?auto_15011 ?auto_15004 ) ) ( not ( = ?auto_15011 ?auto_15002 ) ) ( not ( = ?auto_15011 ?auto_15012 ) ) ( not ( = ?auto_15011 ?auto_15006 ) ) ( not ( = ?auto_15011 ?auto_15001 ) ) ( not ( = ?auto_15011 ?auto_15008 ) ) ( not ( = ?auto_15011 ?auto_15005 ) ) ( not ( = ?auto_14982 ?auto_14989 ) ) ( not ( = ?auto_14982 ?auto_14993 ) ) ( not ( = ?auto_14983 ?auto_14989 ) ) ( not ( = ?auto_14983 ?auto_14993 ) ) ( not ( = ?auto_14984 ?auto_14989 ) ) ( not ( = ?auto_14984 ?auto_14993 ) ) ( not ( = ?auto_14985 ?auto_14989 ) ) ( not ( = ?auto_14985 ?auto_14993 ) ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14986 ?auto_14993 ) ) ( not ( = ?auto_14987 ?auto_14989 ) ) ( not ( = ?auto_14987 ?auto_14993 ) ) ( not ( = ?auto_14988 ?auto_14989 ) ) ( not ( = ?auto_14988 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14989 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14989 ?auto_15011 ) ) ( not ( = ?auto_14989 ?auto_15004 ) ) ( not ( = ?auto_14989 ?auto_15002 ) ) ( not ( = ?auto_14989 ?auto_15012 ) ) ( not ( = ?auto_14989 ?auto_15006 ) ) ( not ( = ?auto_14989 ?auto_15001 ) ) ( not ( = ?auto_14989 ?auto_15008 ) ) ( not ( = ?auto_14989 ?auto_15005 ) ) ( not ( = ?auto_14993 ?auto_15011 ) ) ( not ( = ?auto_14993 ?auto_15004 ) ) ( not ( = ?auto_14993 ?auto_15002 ) ) ( not ( = ?auto_14993 ?auto_15012 ) ) ( not ( = ?auto_14993 ?auto_15006 ) ) ( not ( = ?auto_14993 ?auto_15001 ) ) ( not ( = ?auto_14993 ?auto_15008 ) ) ( not ( = ?auto_14993 ?auto_15005 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14982 ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14991 ?auto_14990 )
      ( MAKE-1CRATE ?auto_14990 ?auto_14989 )
      ( MAKE-9CRATE-VERIFY ?auto_14982 ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14991 ?auto_14990 ?auto_14989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15016 - SURFACE
      ?auto_15017 - SURFACE
    )
    :vars
    (
      ?auto_15018 - HOIST
      ?auto_15019 - PLACE
      ?auto_15021 - PLACE
      ?auto_15022 - HOIST
      ?auto_15023 - SURFACE
      ?auto_15020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15018 ?auto_15019 ) ( SURFACE-AT ?auto_15016 ?auto_15019 ) ( CLEAR ?auto_15016 ) ( IS-CRATE ?auto_15017 ) ( AVAILABLE ?auto_15018 ) ( not ( = ?auto_15021 ?auto_15019 ) ) ( HOIST-AT ?auto_15022 ?auto_15021 ) ( AVAILABLE ?auto_15022 ) ( SURFACE-AT ?auto_15017 ?auto_15021 ) ( ON ?auto_15017 ?auto_15023 ) ( CLEAR ?auto_15017 ) ( TRUCK-AT ?auto_15020 ?auto_15019 ) ( not ( = ?auto_15016 ?auto_15017 ) ) ( not ( = ?auto_15016 ?auto_15023 ) ) ( not ( = ?auto_15017 ?auto_15023 ) ) ( not ( = ?auto_15018 ?auto_15022 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15020 ?auto_15019 ?auto_15021 )
      ( !LIFT ?auto_15022 ?auto_15017 ?auto_15023 ?auto_15021 )
      ( !LOAD ?auto_15022 ?auto_15017 ?auto_15020 ?auto_15021 )
      ( !DRIVE ?auto_15020 ?auto_15021 ?auto_15019 )
      ( !UNLOAD ?auto_15018 ?auto_15017 ?auto_15020 ?auto_15019 )
      ( !DROP ?auto_15018 ?auto_15017 ?auto_15016 ?auto_15019 )
      ( MAKE-1CRATE-VERIFY ?auto_15016 ?auto_15017 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_15035 - SURFACE
      ?auto_15036 - SURFACE
      ?auto_15037 - SURFACE
      ?auto_15038 - SURFACE
      ?auto_15039 - SURFACE
      ?auto_15040 - SURFACE
      ?auto_15041 - SURFACE
      ?auto_15044 - SURFACE
      ?auto_15043 - SURFACE
      ?auto_15042 - SURFACE
      ?auto_15045 - SURFACE
    )
    :vars
    (
      ?auto_15047 - HOIST
      ?auto_15048 - PLACE
      ?auto_15051 - PLACE
      ?auto_15050 - HOIST
      ?auto_15049 - SURFACE
      ?auto_15067 - PLACE
      ?auto_15066 - HOIST
      ?auto_15065 - SURFACE
      ?auto_15056 - PLACE
      ?auto_15058 - HOIST
      ?auto_15054 - SURFACE
      ?auto_15063 - PLACE
      ?auto_15059 - HOIST
      ?auto_15060 - SURFACE
      ?auto_15062 - SURFACE
      ?auto_15068 - SURFACE
      ?auto_15052 - SURFACE
      ?auto_15057 - SURFACE
      ?auto_15061 - PLACE
      ?auto_15053 - HOIST
      ?auto_15064 - SURFACE
      ?auto_15055 - SURFACE
      ?auto_15046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15047 ?auto_15048 ) ( IS-CRATE ?auto_15045 ) ( not ( = ?auto_15051 ?auto_15048 ) ) ( HOIST-AT ?auto_15050 ?auto_15051 ) ( SURFACE-AT ?auto_15045 ?auto_15051 ) ( ON ?auto_15045 ?auto_15049 ) ( CLEAR ?auto_15045 ) ( not ( = ?auto_15042 ?auto_15045 ) ) ( not ( = ?auto_15042 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15049 ) ) ( not ( = ?auto_15047 ?auto_15050 ) ) ( IS-CRATE ?auto_15042 ) ( not ( = ?auto_15067 ?auto_15048 ) ) ( HOIST-AT ?auto_15066 ?auto_15067 ) ( SURFACE-AT ?auto_15042 ?auto_15067 ) ( ON ?auto_15042 ?auto_15065 ) ( CLEAR ?auto_15042 ) ( not ( = ?auto_15043 ?auto_15042 ) ) ( not ( = ?auto_15043 ?auto_15065 ) ) ( not ( = ?auto_15042 ?auto_15065 ) ) ( not ( = ?auto_15047 ?auto_15066 ) ) ( IS-CRATE ?auto_15043 ) ( not ( = ?auto_15056 ?auto_15048 ) ) ( HOIST-AT ?auto_15058 ?auto_15056 ) ( SURFACE-AT ?auto_15043 ?auto_15056 ) ( ON ?auto_15043 ?auto_15054 ) ( CLEAR ?auto_15043 ) ( not ( = ?auto_15044 ?auto_15043 ) ) ( not ( = ?auto_15044 ?auto_15054 ) ) ( not ( = ?auto_15043 ?auto_15054 ) ) ( not ( = ?auto_15047 ?auto_15058 ) ) ( IS-CRATE ?auto_15044 ) ( not ( = ?auto_15063 ?auto_15048 ) ) ( HOIST-AT ?auto_15059 ?auto_15063 ) ( AVAILABLE ?auto_15059 ) ( SURFACE-AT ?auto_15044 ?auto_15063 ) ( ON ?auto_15044 ?auto_15060 ) ( CLEAR ?auto_15044 ) ( not ( = ?auto_15041 ?auto_15044 ) ) ( not ( = ?auto_15041 ?auto_15060 ) ) ( not ( = ?auto_15044 ?auto_15060 ) ) ( not ( = ?auto_15047 ?auto_15059 ) ) ( IS-CRATE ?auto_15041 ) ( SURFACE-AT ?auto_15041 ?auto_15051 ) ( ON ?auto_15041 ?auto_15062 ) ( CLEAR ?auto_15041 ) ( not ( = ?auto_15040 ?auto_15041 ) ) ( not ( = ?auto_15040 ?auto_15062 ) ) ( not ( = ?auto_15041 ?auto_15062 ) ) ( IS-CRATE ?auto_15040 ) ( AVAILABLE ?auto_15066 ) ( SURFACE-AT ?auto_15040 ?auto_15067 ) ( ON ?auto_15040 ?auto_15068 ) ( CLEAR ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15039 ?auto_15068 ) ) ( not ( = ?auto_15040 ?auto_15068 ) ) ( IS-CRATE ?auto_15039 ) ( SURFACE-AT ?auto_15039 ?auto_15051 ) ( ON ?auto_15039 ?auto_15052 ) ( CLEAR ?auto_15039 ) ( not ( = ?auto_15038 ?auto_15039 ) ) ( not ( = ?auto_15038 ?auto_15052 ) ) ( not ( = ?auto_15039 ?auto_15052 ) ) ( IS-CRATE ?auto_15038 ) ( AVAILABLE ?auto_15058 ) ( SURFACE-AT ?auto_15038 ?auto_15056 ) ( ON ?auto_15038 ?auto_15057 ) ( CLEAR ?auto_15038 ) ( not ( = ?auto_15037 ?auto_15038 ) ) ( not ( = ?auto_15037 ?auto_15057 ) ) ( not ( = ?auto_15038 ?auto_15057 ) ) ( IS-CRATE ?auto_15037 ) ( not ( = ?auto_15061 ?auto_15048 ) ) ( HOIST-AT ?auto_15053 ?auto_15061 ) ( AVAILABLE ?auto_15053 ) ( SURFACE-AT ?auto_15037 ?auto_15061 ) ( ON ?auto_15037 ?auto_15064 ) ( CLEAR ?auto_15037 ) ( not ( = ?auto_15036 ?auto_15037 ) ) ( not ( = ?auto_15036 ?auto_15064 ) ) ( not ( = ?auto_15037 ?auto_15064 ) ) ( not ( = ?auto_15047 ?auto_15053 ) ) ( SURFACE-AT ?auto_15035 ?auto_15048 ) ( CLEAR ?auto_15035 ) ( IS-CRATE ?auto_15036 ) ( AVAILABLE ?auto_15047 ) ( AVAILABLE ?auto_15050 ) ( SURFACE-AT ?auto_15036 ?auto_15051 ) ( ON ?auto_15036 ?auto_15055 ) ( CLEAR ?auto_15036 ) ( TRUCK-AT ?auto_15046 ?auto_15048 ) ( not ( = ?auto_15035 ?auto_15036 ) ) ( not ( = ?auto_15035 ?auto_15055 ) ) ( not ( = ?auto_15036 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15037 ) ) ( not ( = ?auto_15035 ?auto_15064 ) ) ( not ( = ?auto_15037 ?auto_15055 ) ) ( not ( = ?auto_15061 ?auto_15051 ) ) ( not ( = ?auto_15053 ?auto_15050 ) ) ( not ( = ?auto_15064 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15038 ) ) ( not ( = ?auto_15035 ?auto_15057 ) ) ( not ( = ?auto_15036 ?auto_15038 ) ) ( not ( = ?auto_15036 ?auto_15057 ) ) ( not ( = ?auto_15038 ?auto_15064 ) ) ( not ( = ?auto_15038 ?auto_15055 ) ) ( not ( = ?auto_15056 ?auto_15061 ) ) ( not ( = ?auto_15056 ?auto_15051 ) ) ( not ( = ?auto_15058 ?auto_15053 ) ) ( not ( = ?auto_15058 ?auto_15050 ) ) ( not ( = ?auto_15057 ?auto_15064 ) ) ( not ( = ?auto_15057 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15039 ) ) ( not ( = ?auto_15035 ?auto_15052 ) ) ( not ( = ?auto_15036 ?auto_15039 ) ) ( not ( = ?auto_15036 ?auto_15052 ) ) ( not ( = ?auto_15037 ?auto_15039 ) ) ( not ( = ?auto_15037 ?auto_15052 ) ) ( not ( = ?auto_15039 ?auto_15057 ) ) ( not ( = ?auto_15039 ?auto_15064 ) ) ( not ( = ?auto_15039 ?auto_15055 ) ) ( not ( = ?auto_15052 ?auto_15057 ) ) ( not ( = ?auto_15052 ?auto_15064 ) ) ( not ( = ?auto_15052 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15040 ) ) ( not ( = ?auto_15035 ?auto_15068 ) ) ( not ( = ?auto_15036 ?auto_15040 ) ) ( not ( = ?auto_15036 ?auto_15068 ) ) ( not ( = ?auto_15037 ?auto_15040 ) ) ( not ( = ?auto_15037 ?auto_15068 ) ) ( not ( = ?auto_15038 ?auto_15040 ) ) ( not ( = ?auto_15038 ?auto_15068 ) ) ( not ( = ?auto_15040 ?auto_15052 ) ) ( not ( = ?auto_15040 ?auto_15057 ) ) ( not ( = ?auto_15040 ?auto_15064 ) ) ( not ( = ?auto_15040 ?auto_15055 ) ) ( not ( = ?auto_15067 ?auto_15051 ) ) ( not ( = ?auto_15067 ?auto_15056 ) ) ( not ( = ?auto_15067 ?auto_15061 ) ) ( not ( = ?auto_15066 ?auto_15050 ) ) ( not ( = ?auto_15066 ?auto_15058 ) ) ( not ( = ?auto_15066 ?auto_15053 ) ) ( not ( = ?auto_15068 ?auto_15052 ) ) ( not ( = ?auto_15068 ?auto_15057 ) ) ( not ( = ?auto_15068 ?auto_15064 ) ) ( not ( = ?auto_15068 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15041 ) ) ( not ( = ?auto_15035 ?auto_15062 ) ) ( not ( = ?auto_15036 ?auto_15041 ) ) ( not ( = ?auto_15036 ?auto_15062 ) ) ( not ( = ?auto_15037 ?auto_15041 ) ) ( not ( = ?auto_15037 ?auto_15062 ) ) ( not ( = ?auto_15038 ?auto_15041 ) ) ( not ( = ?auto_15038 ?auto_15062 ) ) ( not ( = ?auto_15039 ?auto_15041 ) ) ( not ( = ?auto_15039 ?auto_15062 ) ) ( not ( = ?auto_15041 ?auto_15068 ) ) ( not ( = ?auto_15041 ?auto_15052 ) ) ( not ( = ?auto_15041 ?auto_15057 ) ) ( not ( = ?auto_15041 ?auto_15064 ) ) ( not ( = ?auto_15041 ?auto_15055 ) ) ( not ( = ?auto_15062 ?auto_15068 ) ) ( not ( = ?auto_15062 ?auto_15052 ) ) ( not ( = ?auto_15062 ?auto_15057 ) ) ( not ( = ?auto_15062 ?auto_15064 ) ) ( not ( = ?auto_15062 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15044 ) ) ( not ( = ?auto_15035 ?auto_15060 ) ) ( not ( = ?auto_15036 ?auto_15044 ) ) ( not ( = ?auto_15036 ?auto_15060 ) ) ( not ( = ?auto_15037 ?auto_15044 ) ) ( not ( = ?auto_15037 ?auto_15060 ) ) ( not ( = ?auto_15038 ?auto_15044 ) ) ( not ( = ?auto_15038 ?auto_15060 ) ) ( not ( = ?auto_15039 ?auto_15044 ) ) ( not ( = ?auto_15039 ?auto_15060 ) ) ( not ( = ?auto_15040 ?auto_15044 ) ) ( not ( = ?auto_15040 ?auto_15060 ) ) ( not ( = ?auto_15044 ?auto_15062 ) ) ( not ( = ?auto_15044 ?auto_15068 ) ) ( not ( = ?auto_15044 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15057 ) ) ( not ( = ?auto_15044 ?auto_15064 ) ) ( not ( = ?auto_15044 ?auto_15055 ) ) ( not ( = ?auto_15063 ?auto_15051 ) ) ( not ( = ?auto_15063 ?auto_15067 ) ) ( not ( = ?auto_15063 ?auto_15056 ) ) ( not ( = ?auto_15063 ?auto_15061 ) ) ( not ( = ?auto_15059 ?auto_15050 ) ) ( not ( = ?auto_15059 ?auto_15066 ) ) ( not ( = ?auto_15059 ?auto_15058 ) ) ( not ( = ?auto_15059 ?auto_15053 ) ) ( not ( = ?auto_15060 ?auto_15062 ) ) ( not ( = ?auto_15060 ?auto_15068 ) ) ( not ( = ?auto_15060 ?auto_15052 ) ) ( not ( = ?auto_15060 ?auto_15057 ) ) ( not ( = ?auto_15060 ?auto_15064 ) ) ( not ( = ?auto_15060 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15043 ) ) ( not ( = ?auto_15035 ?auto_15054 ) ) ( not ( = ?auto_15036 ?auto_15043 ) ) ( not ( = ?auto_15036 ?auto_15054 ) ) ( not ( = ?auto_15037 ?auto_15043 ) ) ( not ( = ?auto_15037 ?auto_15054 ) ) ( not ( = ?auto_15038 ?auto_15043 ) ) ( not ( = ?auto_15038 ?auto_15054 ) ) ( not ( = ?auto_15039 ?auto_15043 ) ) ( not ( = ?auto_15039 ?auto_15054 ) ) ( not ( = ?auto_15040 ?auto_15043 ) ) ( not ( = ?auto_15040 ?auto_15054 ) ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( not ( = ?auto_15041 ?auto_15054 ) ) ( not ( = ?auto_15043 ?auto_15060 ) ) ( not ( = ?auto_15043 ?auto_15062 ) ) ( not ( = ?auto_15043 ?auto_15068 ) ) ( not ( = ?auto_15043 ?auto_15052 ) ) ( not ( = ?auto_15043 ?auto_15057 ) ) ( not ( = ?auto_15043 ?auto_15064 ) ) ( not ( = ?auto_15043 ?auto_15055 ) ) ( not ( = ?auto_15054 ?auto_15060 ) ) ( not ( = ?auto_15054 ?auto_15062 ) ) ( not ( = ?auto_15054 ?auto_15068 ) ) ( not ( = ?auto_15054 ?auto_15052 ) ) ( not ( = ?auto_15054 ?auto_15057 ) ) ( not ( = ?auto_15054 ?auto_15064 ) ) ( not ( = ?auto_15054 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15042 ) ) ( not ( = ?auto_15035 ?auto_15065 ) ) ( not ( = ?auto_15036 ?auto_15042 ) ) ( not ( = ?auto_15036 ?auto_15065 ) ) ( not ( = ?auto_15037 ?auto_15042 ) ) ( not ( = ?auto_15037 ?auto_15065 ) ) ( not ( = ?auto_15038 ?auto_15042 ) ) ( not ( = ?auto_15038 ?auto_15065 ) ) ( not ( = ?auto_15039 ?auto_15042 ) ) ( not ( = ?auto_15039 ?auto_15065 ) ) ( not ( = ?auto_15040 ?auto_15042 ) ) ( not ( = ?auto_15040 ?auto_15065 ) ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15065 ) ) ( not ( = ?auto_15044 ?auto_15042 ) ) ( not ( = ?auto_15044 ?auto_15065 ) ) ( not ( = ?auto_15042 ?auto_15054 ) ) ( not ( = ?auto_15042 ?auto_15060 ) ) ( not ( = ?auto_15042 ?auto_15062 ) ) ( not ( = ?auto_15042 ?auto_15068 ) ) ( not ( = ?auto_15042 ?auto_15052 ) ) ( not ( = ?auto_15042 ?auto_15057 ) ) ( not ( = ?auto_15042 ?auto_15064 ) ) ( not ( = ?auto_15042 ?auto_15055 ) ) ( not ( = ?auto_15065 ?auto_15054 ) ) ( not ( = ?auto_15065 ?auto_15060 ) ) ( not ( = ?auto_15065 ?auto_15062 ) ) ( not ( = ?auto_15065 ?auto_15068 ) ) ( not ( = ?auto_15065 ?auto_15052 ) ) ( not ( = ?auto_15065 ?auto_15057 ) ) ( not ( = ?auto_15065 ?auto_15064 ) ) ( not ( = ?auto_15065 ?auto_15055 ) ) ( not ( = ?auto_15035 ?auto_15045 ) ) ( not ( = ?auto_15035 ?auto_15049 ) ) ( not ( = ?auto_15036 ?auto_15045 ) ) ( not ( = ?auto_15036 ?auto_15049 ) ) ( not ( = ?auto_15037 ?auto_15045 ) ) ( not ( = ?auto_15037 ?auto_15049 ) ) ( not ( = ?auto_15038 ?auto_15045 ) ) ( not ( = ?auto_15038 ?auto_15049 ) ) ( not ( = ?auto_15039 ?auto_15045 ) ) ( not ( = ?auto_15039 ?auto_15049 ) ) ( not ( = ?auto_15040 ?auto_15045 ) ) ( not ( = ?auto_15040 ?auto_15049 ) ) ( not ( = ?auto_15041 ?auto_15045 ) ) ( not ( = ?auto_15041 ?auto_15049 ) ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15049 ) ) ( not ( = ?auto_15043 ?auto_15045 ) ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15065 ) ) ( not ( = ?auto_15045 ?auto_15054 ) ) ( not ( = ?auto_15045 ?auto_15060 ) ) ( not ( = ?auto_15045 ?auto_15062 ) ) ( not ( = ?auto_15045 ?auto_15068 ) ) ( not ( = ?auto_15045 ?auto_15052 ) ) ( not ( = ?auto_15045 ?auto_15057 ) ) ( not ( = ?auto_15045 ?auto_15064 ) ) ( not ( = ?auto_15045 ?auto_15055 ) ) ( not ( = ?auto_15049 ?auto_15065 ) ) ( not ( = ?auto_15049 ?auto_15054 ) ) ( not ( = ?auto_15049 ?auto_15060 ) ) ( not ( = ?auto_15049 ?auto_15062 ) ) ( not ( = ?auto_15049 ?auto_15068 ) ) ( not ( = ?auto_15049 ?auto_15052 ) ) ( not ( = ?auto_15049 ?auto_15057 ) ) ( not ( = ?auto_15049 ?auto_15064 ) ) ( not ( = ?auto_15049 ?auto_15055 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15035 ?auto_15036 ?auto_15037 ?auto_15038 ?auto_15039 ?auto_15040 ?auto_15041 ?auto_15044 ?auto_15043 ?auto_15042 )
      ( MAKE-1CRATE ?auto_15042 ?auto_15045 )
      ( MAKE-10CRATE-VERIFY ?auto_15035 ?auto_15036 ?auto_15037 ?auto_15038 ?auto_15039 ?auto_15040 ?auto_15041 ?auto_15044 ?auto_15043 ?auto_15042 ?auto_15045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15071 - SURFACE
      ?auto_15072 - SURFACE
    )
    :vars
    (
      ?auto_15073 - HOIST
      ?auto_15074 - PLACE
      ?auto_15076 - PLACE
      ?auto_15077 - HOIST
      ?auto_15078 - SURFACE
      ?auto_15075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15073 ?auto_15074 ) ( SURFACE-AT ?auto_15071 ?auto_15074 ) ( CLEAR ?auto_15071 ) ( IS-CRATE ?auto_15072 ) ( AVAILABLE ?auto_15073 ) ( not ( = ?auto_15076 ?auto_15074 ) ) ( HOIST-AT ?auto_15077 ?auto_15076 ) ( AVAILABLE ?auto_15077 ) ( SURFACE-AT ?auto_15072 ?auto_15076 ) ( ON ?auto_15072 ?auto_15078 ) ( CLEAR ?auto_15072 ) ( TRUCK-AT ?auto_15075 ?auto_15074 ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( not ( = ?auto_15072 ?auto_15078 ) ) ( not ( = ?auto_15073 ?auto_15077 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15075 ?auto_15074 ?auto_15076 )
      ( !LIFT ?auto_15077 ?auto_15072 ?auto_15078 ?auto_15076 )
      ( !LOAD ?auto_15077 ?auto_15072 ?auto_15075 ?auto_15076 )
      ( !DRIVE ?auto_15075 ?auto_15076 ?auto_15074 )
      ( !UNLOAD ?auto_15073 ?auto_15072 ?auto_15075 ?auto_15074 )
      ( !DROP ?auto_15073 ?auto_15072 ?auto_15071 ?auto_15074 )
      ( MAKE-1CRATE-VERIFY ?auto_15071 ?auto_15072 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_15091 - SURFACE
      ?auto_15092 - SURFACE
      ?auto_15093 - SURFACE
      ?auto_15094 - SURFACE
      ?auto_15095 - SURFACE
      ?auto_15096 - SURFACE
      ?auto_15097 - SURFACE
      ?auto_15100 - SURFACE
      ?auto_15099 - SURFACE
      ?auto_15098 - SURFACE
      ?auto_15101 - SURFACE
      ?auto_15102 - SURFACE
    )
    :vars
    (
      ?auto_15106 - HOIST
      ?auto_15104 - PLACE
      ?auto_15105 - PLACE
      ?auto_15108 - HOIST
      ?auto_15103 - SURFACE
      ?auto_15118 - SURFACE
      ?auto_15122 - PLACE
      ?auto_15124 - HOIST
      ?auto_15121 - SURFACE
      ?auto_15117 - PLACE
      ?auto_15120 - HOIST
      ?auto_15110 - SURFACE
      ?auto_15116 - PLACE
      ?auto_15109 - HOIST
      ?auto_15115 - SURFACE
      ?auto_15126 - SURFACE
      ?auto_15112 - SURFACE
      ?auto_15113 - SURFACE
      ?auto_15114 - SURFACE
      ?auto_15123 - PLACE
      ?auto_15119 - HOIST
      ?auto_15125 - SURFACE
      ?auto_15111 - SURFACE
      ?auto_15107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15106 ?auto_15104 ) ( IS-CRATE ?auto_15102 ) ( not ( = ?auto_15105 ?auto_15104 ) ) ( HOIST-AT ?auto_15108 ?auto_15105 ) ( SURFACE-AT ?auto_15102 ?auto_15105 ) ( ON ?auto_15102 ?auto_15103 ) ( CLEAR ?auto_15102 ) ( not ( = ?auto_15101 ?auto_15102 ) ) ( not ( = ?auto_15101 ?auto_15103 ) ) ( not ( = ?auto_15102 ?auto_15103 ) ) ( not ( = ?auto_15106 ?auto_15108 ) ) ( IS-CRATE ?auto_15101 ) ( SURFACE-AT ?auto_15101 ?auto_15105 ) ( ON ?auto_15101 ?auto_15118 ) ( CLEAR ?auto_15101 ) ( not ( = ?auto_15098 ?auto_15101 ) ) ( not ( = ?auto_15098 ?auto_15118 ) ) ( not ( = ?auto_15101 ?auto_15118 ) ) ( IS-CRATE ?auto_15098 ) ( not ( = ?auto_15122 ?auto_15104 ) ) ( HOIST-AT ?auto_15124 ?auto_15122 ) ( SURFACE-AT ?auto_15098 ?auto_15122 ) ( ON ?auto_15098 ?auto_15121 ) ( CLEAR ?auto_15098 ) ( not ( = ?auto_15099 ?auto_15098 ) ) ( not ( = ?auto_15099 ?auto_15121 ) ) ( not ( = ?auto_15098 ?auto_15121 ) ) ( not ( = ?auto_15106 ?auto_15124 ) ) ( IS-CRATE ?auto_15099 ) ( not ( = ?auto_15117 ?auto_15104 ) ) ( HOIST-AT ?auto_15120 ?auto_15117 ) ( SURFACE-AT ?auto_15099 ?auto_15117 ) ( ON ?auto_15099 ?auto_15110 ) ( CLEAR ?auto_15099 ) ( not ( = ?auto_15100 ?auto_15099 ) ) ( not ( = ?auto_15100 ?auto_15110 ) ) ( not ( = ?auto_15099 ?auto_15110 ) ) ( not ( = ?auto_15106 ?auto_15120 ) ) ( IS-CRATE ?auto_15100 ) ( not ( = ?auto_15116 ?auto_15104 ) ) ( HOIST-AT ?auto_15109 ?auto_15116 ) ( AVAILABLE ?auto_15109 ) ( SURFACE-AT ?auto_15100 ?auto_15116 ) ( ON ?auto_15100 ?auto_15115 ) ( CLEAR ?auto_15100 ) ( not ( = ?auto_15097 ?auto_15100 ) ) ( not ( = ?auto_15097 ?auto_15115 ) ) ( not ( = ?auto_15100 ?auto_15115 ) ) ( not ( = ?auto_15106 ?auto_15109 ) ) ( IS-CRATE ?auto_15097 ) ( SURFACE-AT ?auto_15097 ?auto_15105 ) ( ON ?auto_15097 ?auto_15126 ) ( CLEAR ?auto_15097 ) ( not ( = ?auto_15096 ?auto_15097 ) ) ( not ( = ?auto_15096 ?auto_15126 ) ) ( not ( = ?auto_15097 ?auto_15126 ) ) ( IS-CRATE ?auto_15096 ) ( AVAILABLE ?auto_15124 ) ( SURFACE-AT ?auto_15096 ?auto_15122 ) ( ON ?auto_15096 ?auto_15112 ) ( CLEAR ?auto_15096 ) ( not ( = ?auto_15095 ?auto_15096 ) ) ( not ( = ?auto_15095 ?auto_15112 ) ) ( not ( = ?auto_15096 ?auto_15112 ) ) ( IS-CRATE ?auto_15095 ) ( SURFACE-AT ?auto_15095 ?auto_15105 ) ( ON ?auto_15095 ?auto_15113 ) ( CLEAR ?auto_15095 ) ( not ( = ?auto_15094 ?auto_15095 ) ) ( not ( = ?auto_15094 ?auto_15113 ) ) ( not ( = ?auto_15095 ?auto_15113 ) ) ( IS-CRATE ?auto_15094 ) ( AVAILABLE ?auto_15120 ) ( SURFACE-AT ?auto_15094 ?auto_15117 ) ( ON ?auto_15094 ?auto_15114 ) ( CLEAR ?auto_15094 ) ( not ( = ?auto_15093 ?auto_15094 ) ) ( not ( = ?auto_15093 ?auto_15114 ) ) ( not ( = ?auto_15094 ?auto_15114 ) ) ( IS-CRATE ?auto_15093 ) ( not ( = ?auto_15123 ?auto_15104 ) ) ( HOIST-AT ?auto_15119 ?auto_15123 ) ( AVAILABLE ?auto_15119 ) ( SURFACE-AT ?auto_15093 ?auto_15123 ) ( ON ?auto_15093 ?auto_15125 ) ( CLEAR ?auto_15093 ) ( not ( = ?auto_15092 ?auto_15093 ) ) ( not ( = ?auto_15092 ?auto_15125 ) ) ( not ( = ?auto_15093 ?auto_15125 ) ) ( not ( = ?auto_15106 ?auto_15119 ) ) ( SURFACE-AT ?auto_15091 ?auto_15104 ) ( CLEAR ?auto_15091 ) ( IS-CRATE ?auto_15092 ) ( AVAILABLE ?auto_15106 ) ( AVAILABLE ?auto_15108 ) ( SURFACE-AT ?auto_15092 ?auto_15105 ) ( ON ?auto_15092 ?auto_15111 ) ( CLEAR ?auto_15092 ) ( TRUCK-AT ?auto_15107 ?auto_15104 ) ( not ( = ?auto_15091 ?auto_15092 ) ) ( not ( = ?auto_15091 ?auto_15111 ) ) ( not ( = ?auto_15092 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15093 ) ) ( not ( = ?auto_15091 ?auto_15125 ) ) ( not ( = ?auto_15093 ?auto_15111 ) ) ( not ( = ?auto_15123 ?auto_15105 ) ) ( not ( = ?auto_15119 ?auto_15108 ) ) ( not ( = ?auto_15125 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15094 ) ) ( not ( = ?auto_15091 ?auto_15114 ) ) ( not ( = ?auto_15092 ?auto_15094 ) ) ( not ( = ?auto_15092 ?auto_15114 ) ) ( not ( = ?auto_15094 ?auto_15125 ) ) ( not ( = ?auto_15094 ?auto_15111 ) ) ( not ( = ?auto_15117 ?auto_15123 ) ) ( not ( = ?auto_15117 ?auto_15105 ) ) ( not ( = ?auto_15120 ?auto_15119 ) ) ( not ( = ?auto_15120 ?auto_15108 ) ) ( not ( = ?auto_15114 ?auto_15125 ) ) ( not ( = ?auto_15114 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15095 ) ) ( not ( = ?auto_15091 ?auto_15113 ) ) ( not ( = ?auto_15092 ?auto_15095 ) ) ( not ( = ?auto_15092 ?auto_15113 ) ) ( not ( = ?auto_15093 ?auto_15095 ) ) ( not ( = ?auto_15093 ?auto_15113 ) ) ( not ( = ?auto_15095 ?auto_15114 ) ) ( not ( = ?auto_15095 ?auto_15125 ) ) ( not ( = ?auto_15095 ?auto_15111 ) ) ( not ( = ?auto_15113 ?auto_15114 ) ) ( not ( = ?auto_15113 ?auto_15125 ) ) ( not ( = ?auto_15113 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15096 ) ) ( not ( = ?auto_15091 ?auto_15112 ) ) ( not ( = ?auto_15092 ?auto_15096 ) ) ( not ( = ?auto_15092 ?auto_15112 ) ) ( not ( = ?auto_15093 ?auto_15096 ) ) ( not ( = ?auto_15093 ?auto_15112 ) ) ( not ( = ?auto_15094 ?auto_15096 ) ) ( not ( = ?auto_15094 ?auto_15112 ) ) ( not ( = ?auto_15096 ?auto_15113 ) ) ( not ( = ?auto_15096 ?auto_15114 ) ) ( not ( = ?auto_15096 ?auto_15125 ) ) ( not ( = ?auto_15096 ?auto_15111 ) ) ( not ( = ?auto_15122 ?auto_15105 ) ) ( not ( = ?auto_15122 ?auto_15117 ) ) ( not ( = ?auto_15122 ?auto_15123 ) ) ( not ( = ?auto_15124 ?auto_15108 ) ) ( not ( = ?auto_15124 ?auto_15120 ) ) ( not ( = ?auto_15124 ?auto_15119 ) ) ( not ( = ?auto_15112 ?auto_15113 ) ) ( not ( = ?auto_15112 ?auto_15114 ) ) ( not ( = ?auto_15112 ?auto_15125 ) ) ( not ( = ?auto_15112 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15097 ) ) ( not ( = ?auto_15091 ?auto_15126 ) ) ( not ( = ?auto_15092 ?auto_15097 ) ) ( not ( = ?auto_15092 ?auto_15126 ) ) ( not ( = ?auto_15093 ?auto_15097 ) ) ( not ( = ?auto_15093 ?auto_15126 ) ) ( not ( = ?auto_15094 ?auto_15097 ) ) ( not ( = ?auto_15094 ?auto_15126 ) ) ( not ( = ?auto_15095 ?auto_15097 ) ) ( not ( = ?auto_15095 ?auto_15126 ) ) ( not ( = ?auto_15097 ?auto_15112 ) ) ( not ( = ?auto_15097 ?auto_15113 ) ) ( not ( = ?auto_15097 ?auto_15114 ) ) ( not ( = ?auto_15097 ?auto_15125 ) ) ( not ( = ?auto_15097 ?auto_15111 ) ) ( not ( = ?auto_15126 ?auto_15112 ) ) ( not ( = ?auto_15126 ?auto_15113 ) ) ( not ( = ?auto_15126 ?auto_15114 ) ) ( not ( = ?auto_15126 ?auto_15125 ) ) ( not ( = ?auto_15126 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15100 ) ) ( not ( = ?auto_15091 ?auto_15115 ) ) ( not ( = ?auto_15092 ?auto_15100 ) ) ( not ( = ?auto_15092 ?auto_15115 ) ) ( not ( = ?auto_15093 ?auto_15100 ) ) ( not ( = ?auto_15093 ?auto_15115 ) ) ( not ( = ?auto_15094 ?auto_15100 ) ) ( not ( = ?auto_15094 ?auto_15115 ) ) ( not ( = ?auto_15095 ?auto_15100 ) ) ( not ( = ?auto_15095 ?auto_15115 ) ) ( not ( = ?auto_15096 ?auto_15100 ) ) ( not ( = ?auto_15096 ?auto_15115 ) ) ( not ( = ?auto_15100 ?auto_15126 ) ) ( not ( = ?auto_15100 ?auto_15112 ) ) ( not ( = ?auto_15100 ?auto_15113 ) ) ( not ( = ?auto_15100 ?auto_15114 ) ) ( not ( = ?auto_15100 ?auto_15125 ) ) ( not ( = ?auto_15100 ?auto_15111 ) ) ( not ( = ?auto_15116 ?auto_15105 ) ) ( not ( = ?auto_15116 ?auto_15122 ) ) ( not ( = ?auto_15116 ?auto_15117 ) ) ( not ( = ?auto_15116 ?auto_15123 ) ) ( not ( = ?auto_15109 ?auto_15108 ) ) ( not ( = ?auto_15109 ?auto_15124 ) ) ( not ( = ?auto_15109 ?auto_15120 ) ) ( not ( = ?auto_15109 ?auto_15119 ) ) ( not ( = ?auto_15115 ?auto_15126 ) ) ( not ( = ?auto_15115 ?auto_15112 ) ) ( not ( = ?auto_15115 ?auto_15113 ) ) ( not ( = ?auto_15115 ?auto_15114 ) ) ( not ( = ?auto_15115 ?auto_15125 ) ) ( not ( = ?auto_15115 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15099 ) ) ( not ( = ?auto_15091 ?auto_15110 ) ) ( not ( = ?auto_15092 ?auto_15099 ) ) ( not ( = ?auto_15092 ?auto_15110 ) ) ( not ( = ?auto_15093 ?auto_15099 ) ) ( not ( = ?auto_15093 ?auto_15110 ) ) ( not ( = ?auto_15094 ?auto_15099 ) ) ( not ( = ?auto_15094 ?auto_15110 ) ) ( not ( = ?auto_15095 ?auto_15099 ) ) ( not ( = ?auto_15095 ?auto_15110 ) ) ( not ( = ?auto_15096 ?auto_15099 ) ) ( not ( = ?auto_15096 ?auto_15110 ) ) ( not ( = ?auto_15097 ?auto_15099 ) ) ( not ( = ?auto_15097 ?auto_15110 ) ) ( not ( = ?auto_15099 ?auto_15115 ) ) ( not ( = ?auto_15099 ?auto_15126 ) ) ( not ( = ?auto_15099 ?auto_15112 ) ) ( not ( = ?auto_15099 ?auto_15113 ) ) ( not ( = ?auto_15099 ?auto_15114 ) ) ( not ( = ?auto_15099 ?auto_15125 ) ) ( not ( = ?auto_15099 ?auto_15111 ) ) ( not ( = ?auto_15110 ?auto_15115 ) ) ( not ( = ?auto_15110 ?auto_15126 ) ) ( not ( = ?auto_15110 ?auto_15112 ) ) ( not ( = ?auto_15110 ?auto_15113 ) ) ( not ( = ?auto_15110 ?auto_15114 ) ) ( not ( = ?auto_15110 ?auto_15125 ) ) ( not ( = ?auto_15110 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15098 ) ) ( not ( = ?auto_15091 ?auto_15121 ) ) ( not ( = ?auto_15092 ?auto_15098 ) ) ( not ( = ?auto_15092 ?auto_15121 ) ) ( not ( = ?auto_15093 ?auto_15098 ) ) ( not ( = ?auto_15093 ?auto_15121 ) ) ( not ( = ?auto_15094 ?auto_15098 ) ) ( not ( = ?auto_15094 ?auto_15121 ) ) ( not ( = ?auto_15095 ?auto_15098 ) ) ( not ( = ?auto_15095 ?auto_15121 ) ) ( not ( = ?auto_15096 ?auto_15098 ) ) ( not ( = ?auto_15096 ?auto_15121 ) ) ( not ( = ?auto_15097 ?auto_15098 ) ) ( not ( = ?auto_15097 ?auto_15121 ) ) ( not ( = ?auto_15100 ?auto_15098 ) ) ( not ( = ?auto_15100 ?auto_15121 ) ) ( not ( = ?auto_15098 ?auto_15110 ) ) ( not ( = ?auto_15098 ?auto_15115 ) ) ( not ( = ?auto_15098 ?auto_15126 ) ) ( not ( = ?auto_15098 ?auto_15112 ) ) ( not ( = ?auto_15098 ?auto_15113 ) ) ( not ( = ?auto_15098 ?auto_15114 ) ) ( not ( = ?auto_15098 ?auto_15125 ) ) ( not ( = ?auto_15098 ?auto_15111 ) ) ( not ( = ?auto_15121 ?auto_15110 ) ) ( not ( = ?auto_15121 ?auto_15115 ) ) ( not ( = ?auto_15121 ?auto_15126 ) ) ( not ( = ?auto_15121 ?auto_15112 ) ) ( not ( = ?auto_15121 ?auto_15113 ) ) ( not ( = ?auto_15121 ?auto_15114 ) ) ( not ( = ?auto_15121 ?auto_15125 ) ) ( not ( = ?auto_15121 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15101 ) ) ( not ( = ?auto_15091 ?auto_15118 ) ) ( not ( = ?auto_15092 ?auto_15101 ) ) ( not ( = ?auto_15092 ?auto_15118 ) ) ( not ( = ?auto_15093 ?auto_15101 ) ) ( not ( = ?auto_15093 ?auto_15118 ) ) ( not ( = ?auto_15094 ?auto_15101 ) ) ( not ( = ?auto_15094 ?auto_15118 ) ) ( not ( = ?auto_15095 ?auto_15101 ) ) ( not ( = ?auto_15095 ?auto_15118 ) ) ( not ( = ?auto_15096 ?auto_15101 ) ) ( not ( = ?auto_15096 ?auto_15118 ) ) ( not ( = ?auto_15097 ?auto_15101 ) ) ( not ( = ?auto_15097 ?auto_15118 ) ) ( not ( = ?auto_15100 ?auto_15101 ) ) ( not ( = ?auto_15100 ?auto_15118 ) ) ( not ( = ?auto_15099 ?auto_15101 ) ) ( not ( = ?auto_15099 ?auto_15118 ) ) ( not ( = ?auto_15101 ?auto_15121 ) ) ( not ( = ?auto_15101 ?auto_15110 ) ) ( not ( = ?auto_15101 ?auto_15115 ) ) ( not ( = ?auto_15101 ?auto_15126 ) ) ( not ( = ?auto_15101 ?auto_15112 ) ) ( not ( = ?auto_15101 ?auto_15113 ) ) ( not ( = ?auto_15101 ?auto_15114 ) ) ( not ( = ?auto_15101 ?auto_15125 ) ) ( not ( = ?auto_15101 ?auto_15111 ) ) ( not ( = ?auto_15118 ?auto_15121 ) ) ( not ( = ?auto_15118 ?auto_15110 ) ) ( not ( = ?auto_15118 ?auto_15115 ) ) ( not ( = ?auto_15118 ?auto_15126 ) ) ( not ( = ?auto_15118 ?auto_15112 ) ) ( not ( = ?auto_15118 ?auto_15113 ) ) ( not ( = ?auto_15118 ?auto_15114 ) ) ( not ( = ?auto_15118 ?auto_15125 ) ) ( not ( = ?auto_15118 ?auto_15111 ) ) ( not ( = ?auto_15091 ?auto_15102 ) ) ( not ( = ?auto_15091 ?auto_15103 ) ) ( not ( = ?auto_15092 ?auto_15102 ) ) ( not ( = ?auto_15092 ?auto_15103 ) ) ( not ( = ?auto_15093 ?auto_15102 ) ) ( not ( = ?auto_15093 ?auto_15103 ) ) ( not ( = ?auto_15094 ?auto_15102 ) ) ( not ( = ?auto_15094 ?auto_15103 ) ) ( not ( = ?auto_15095 ?auto_15102 ) ) ( not ( = ?auto_15095 ?auto_15103 ) ) ( not ( = ?auto_15096 ?auto_15102 ) ) ( not ( = ?auto_15096 ?auto_15103 ) ) ( not ( = ?auto_15097 ?auto_15102 ) ) ( not ( = ?auto_15097 ?auto_15103 ) ) ( not ( = ?auto_15100 ?auto_15102 ) ) ( not ( = ?auto_15100 ?auto_15103 ) ) ( not ( = ?auto_15099 ?auto_15102 ) ) ( not ( = ?auto_15099 ?auto_15103 ) ) ( not ( = ?auto_15098 ?auto_15102 ) ) ( not ( = ?auto_15098 ?auto_15103 ) ) ( not ( = ?auto_15102 ?auto_15118 ) ) ( not ( = ?auto_15102 ?auto_15121 ) ) ( not ( = ?auto_15102 ?auto_15110 ) ) ( not ( = ?auto_15102 ?auto_15115 ) ) ( not ( = ?auto_15102 ?auto_15126 ) ) ( not ( = ?auto_15102 ?auto_15112 ) ) ( not ( = ?auto_15102 ?auto_15113 ) ) ( not ( = ?auto_15102 ?auto_15114 ) ) ( not ( = ?auto_15102 ?auto_15125 ) ) ( not ( = ?auto_15102 ?auto_15111 ) ) ( not ( = ?auto_15103 ?auto_15118 ) ) ( not ( = ?auto_15103 ?auto_15121 ) ) ( not ( = ?auto_15103 ?auto_15110 ) ) ( not ( = ?auto_15103 ?auto_15115 ) ) ( not ( = ?auto_15103 ?auto_15126 ) ) ( not ( = ?auto_15103 ?auto_15112 ) ) ( not ( = ?auto_15103 ?auto_15113 ) ) ( not ( = ?auto_15103 ?auto_15114 ) ) ( not ( = ?auto_15103 ?auto_15125 ) ) ( not ( = ?auto_15103 ?auto_15111 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15091 ?auto_15092 ?auto_15093 ?auto_15094 ?auto_15095 ?auto_15096 ?auto_15097 ?auto_15100 ?auto_15099 ?auto_15098 ?auto_15101 )
      ( MAKE-1CRATE ?auto_15101 ?auto_15102 )
      ( MAKE-11CRATE-VERIFY ?auto_15091 ?auto_15092 ?auto_15093 ?auto_15094 ?auto_15095 ?auto_15096 ?auto_15097 ?auto_15100 ?auto_15099 ?auto_15098 ?auto_15101 ?auto_15102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15129 - SURFACE
      ?auto_15130 - SURFACE
    )
    :vars
    (
      ?auto_15131 - HOIST
      ?auto_15132 - PLACE
      ?auto_15134 - PLACE
      ?auto_15135 - HOIST
      ?auto_15136 - SURFACE
      ?auto_15133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15131 ?auto_15132 ) ( SURFACE-AT ?auto_15129 ?auto_15132 ) ( CLEAR ?auto_15129 ) ( IS-CRATE ?auto_15130 ) ( AVAILABLE ?auto_15131 ) ( not ( = ?auto_15134 ?auto_15132 ) ) ( HOIST-AT ?auto_15135 ?auto_15134 ) ( AVAILABLE ?auto_15135 ) ( SURFACE-AT ?auto_15130 ?auto_15134 ) ( ON ?auto_15130 ?auto_15136 ) ( CLEAR ?auto_15130 ) ( TRUCK-AT ?auto_15133 ?auto_15132 ) ( not ( = ?auto_15129 ?auto_15130 ) ) ( not ( = ?auto_15129 ?auto_15136 ) ) ( not ( = ?auto_15130 ?auto_15136 ) ) ( not ( = ?auto_15131 ?auto_15135 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15133 ?auto_15132 ?auto_15134 )
      ( !LIFT ?auto_15135 ?auto_15130 ?auto_15136 ?auto_15134 )
      ( !LOAD ?auto_15135 ?auto_15130 ?auto_15133 ?auto_15134 )
      ( !DRIVE ?auto_15133 ?auto_15134 ?auto_15132 )
      ( !UNLOAD ?auto_15131 ?auto_15130 ?auto_15133 ?auto_15132 )
      ( !DROP ?auto_15131 ?auto_15130 ?auto_15129 ?auto_15132 )
      ( MAKE-1CRATE-VERIFY ?auto_15129 ?auto_15130 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_15150 - SURFACE
      ?auto_15151 - SURFACE
      ?auto_15152 - SURFACE
      ?auto_15153 - SURFACE
      ?auto_15154 - SURFACE
      ?auto_15155 - SURFACE
      ?auto_15156 - SURFACE
      ?auto_15159 - SURFACE
      ?auto_15158 - SURFACE
      ?auto_15157 - SURFACE
      ?auto_15160 - SURFACE
      ?auto_15161 - SURFACE
      ?auto_15162 - SURFACE
    )
    :vars
    (
      ?auto_15166 - HOIST
      ?auto_15167 - PLACE
      ?auto_15165 - PLACE
      ?auto_15168 - HOIST
      ?auto_15164 - SURFACE
      ?auto_15171 - PLACE
      ?auto_15185 - HOIST
      ?auto_15188 - SURFACE
      ?auto_15189 - SURFACE
      ?auto_15183 - PLACE
      ?auto_15172 - HOIST
      ?auto_15181 - SURFACE
      ?auto_15170 - PLACE
      ?auto_15173 - HOIST
      ?auto_15182 - SURFACE
      ?auto_15180 - PLACE
      ?auto_15175 - HOIST
      ?auto_15178 - SURFACE
      ?auto_15179 - SURFACE
      ?auto_15174 - SURFACE
      ?auto_15169 - SURFACE
      ?auto_15184 - SURFACE
      ?auto_15186 - PLACE
      ?auto_15187 - HOIST
      ?auto_15177 - SURFACE
      ?auto_15176 - SURFACE
      ?auto_15163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15166 ?auto_15167 ) ( IS-CRATE ?auto_15162 ) ( not ( = ?auto_15165 ?auto_15167 ) ) ( HOIST-AT ?auto_15168 ?auto_15165 ) ( AVAILABLE ?auto_15168 ) ( SURFACE-AT ?auto_15162 ?auto_15165 ) ( ON ?auto_15162 ?auto_15164 ) ( CLEAR ?auto_15162 ) ( not ( = ?auto_15161 ?auto_15162 ) ) ( not ( = ?auto_15161 ?auto_15164 ) ) ( not ( = ?auto_15162 ?auto_15164 ) ) ( not ( = ?auto_15166 ?auto_15168 ) ) ( IS-CRATE ?auto_15161 ) ( not ( = ?auto_15171 ?auto_15167 ) ) ( HOIST-AT ?auto_15185 ?auto_15171 ) ( SURFACE-AT ?auto_15161 ?auto_15171 ) ( ON ?auto_15161 ?auto_15188 ) ( CLEAR ?auto_15161 ) ( not ( = ?auto_15160 ?auto_15161 ) ) ( not ( = ?auto_15160 ?auto_15188 ) ) ( not ( = ?auto_15161 ?auto_15188 ) ) ( not ( = ?auto_15166 ?auto_15185 ) ) ( IS-CRATE ?auto_15160 ) ( SURFACE-AT ?auto_15160 ?auto_15171 ) ( ON ?auto_15160 ?auto_15189 ) ( CLEAR ?auto_15160 ) ( not ( = ?auto_15157 ?auto_15160 ) ) ( not ( = ?auto_15157 ?auto_15189 ) ) ( not ( = ?auto_15160 ?auto_15189 ) ) ( IS-CRATE ?auto_15157 ) ( not ( = ?auto_15183 ?auto_15167 ) ) ( HOIST-AT ?auto_15172 ?auto_15183 ) ( SURFACE-AT ?auto_15157 ?auto_15183 ) ( ON ?auto_15157 ?auto_15181 ) ( CLEAR ?auto_15157 ) ( not ( = ?auto_15158 ?auto_15157 ) ) ( not ( = ?auto_15158 ?auto_15181 ) ) ( not ( = ?auto_15157 ?auto_15181 ) ) ( not ( = ?auto_15166 ?auto_15172 ) ) ( IS-CRATE ?auto_15158 ) ( not ( = ?auto_15170 ?auto_15167 ) ) ( HOIST-AT ?auto_15173 ?auto_15170 ) ( SURFACE-AT ?auto_15158 ?auto_15170 ) ( ON ?auto_15158 ?auto_15182 ) ( CLEAR ?auto_15158 ) ( not ( = ?auto_15159 ?auto_15158 ) ) ( not ( = ?auto_15159 ?auto_15182 ) ) ( not ( = ?auto_15158 ?auto_15182 ) ) ( not ( = ?auto_15166 ?auto_15173 ) ) ( IS-CRATE ?auto_15159 ) ( not ( = ?auto_15180 ?auto_15167 ) ) ( HOIST-AT ?auto_15175 ?auto_15180 ) ( AVAILABLE ?auto_15175 ) ( SURFACE-AT ?auto_15159 ?auto_15180 ) ( ON ?auto_15159 ?auto_15178 ) ( CLEAR ?auto_15159 ) ( not ( = ?auto_15156 ?auto_15159 ) ) ( not ( = ?auto_15156 ?auto_15178 ) ) ( not ( = ?auto_15159 ?auto_15178 ) ) ( not ( = ?auto_15166 ?auto_15175 ) ) ( IS-CRATE ?auto_15156 ) ( SURFACE-AT ?auto_15156 ?auto_15171 ) ( ON ?auto_15156 ?auto_15179 ) ( CLEAR ?auto_15156 ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15155 ?auto_15179 ) ) ( not ( = ?auto_15156 ?auto_15179 ) ) ( IS-CRATE ?auto_15155 ) ( AVAILABLE ?auto_15172 ) ( SURFACE-AT ?auto_15155 ?auto_15183 ) ( ON ?auto_15155 ?auto_15174 ) ( CLEAR ?auto_15155 ) ( not ( = ?auto_15154 ?auto_15155 ) ) ( not ( = ?auto_15154 ?auto_15174 ) ) ( not ( = ?auto_15155 ?auto_15174 ) ) ( IS-CRATE ?auto_15154 ) ( SURFACE-AT ?auto_15154 ?auto_15171 ) ( ON ?auto_15154 ?auto_15169 ) ( CLEAR ?auto_15154 ) ( not ( = ?auto_15153 ?auto_15154 ) ) ( not ( = ?auto_15153 ?auto_15169 ) ) ( not ( = ?auto_15154 ?auto_15169 ) ) ( IS-CRATE ?auto_15153 ) ( AVAILABLE ?auto_15173 ) ( SURFACE-AT ?auto_15153 ?auto_15170 ) ( ON ?auto_15153 ?auto_15184 ) ( CLEAR ?auto_15153 ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( not ( = ?auto_15152 ?auto_15184 ) ) ( not ( = ?auto_15153 ?auto_15184 ) ) ( IS-CRATE ?auto_15152 ) ( not ( = ?auto_15186 ?auto_15167 ) ) ( HOIST-AT ?auto_15187 ?auto_15186 ) ( AVAILABLE ?auto_15187 ) ( SURFACE-AT ?auto_15152 ?auto_15186 ) ( ON ?auto_15152 ?auto_15177 ) ( CLEAR ?auto_15152 ) ( not ( = ?auto_15151 ?auto_15152 ) ) ( not ( = ?auto_15151 ?auto_15177 ) ) ( not ( = ?auto_15152 ?auto_15177 ) ) ( not ( = ?auto_15166 ?auto_15187 ) ) ( SURFACE-AT ?auto_15150 ?auto_15167 ) ( CLEAR ?auto_15150 ) ( IS-CRATE ?auto_15151 ) ( AVAILABLE ?auto_15166 ) ( AVAILABLE ?auto_15185 ) ( SURFACE-AT ?auto_15151 ?auto_15171 ) ( ON ?auto_15151 ?auto_15176 ) ( CLEAR ?auto_15151 ) ( TRUCK-AT ?auto_15163 ?auto_15167 ) ( not ( = ?auto_15150 ?auto_15151 ) ) ( not ( = ?auto_15150 ?auto_15176 ) ) ( not ( = ?auto_15151 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15152 ) ) ( not ( = ?auto_15150 ?auto_15177 ) ) ( not ( = ?auto_15152 ?auto_15176 ) ) ( not ( = ?auto_15186 ?auto_15171 ) ) ( not ( = ?auto_15187 ?auto_15185 ) ) ( not ( = ?auto_15177 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15153 ) ) ( not ( = ?auto_15150 ?auto_15184 ) ) ( not ( = ?auto_15151 ?auto_15153 ) ) ( not ( = ?auto_15151 ?auto_15184 ) ) ( not ( = ?auto_15153 ?auto_15177 ) ) ( not ( = ?auto_15153 ?auto_15176 ) ) ( not ( = ?auto_15170 ?auto_15186 ) ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15173 ?auto_15187 ) ) ( not ( = ?auto_15173 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15177 ) ) ( not ( = ?auto_15184 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15154 ) ) ( not ( = ?auto_15150 ?auto_15169 ) ) ( not ( = ?auto_15151 ?auto_15154 ) ) ( not ( = ?auto_15151 ?auto_15169 ) ) ( not ( = ?auto_15152 ?auto_15154 ) ) ( not ( = ?auto_15152 ?auto_15169 ) ) ( not ( = ?auto_15154 ?auto_15184 ) ) ( not ( = ?auto_15154 ?auto_15177 ) ) ( not ( = ?auto_15154 ?auto_15176 ) ) ( not ( = ?auto_15169 ?auto_15184 ) ) ( not ( = ?auto_15169 ?auto_15177 ) ) ( not ( = ?auto_15169 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15155 ) ) ( not ( = ?auto_15150 ?auto_15174 ) ) ( not ( = ?auto_15151 ?auto_15155 ) ) ( not ( = ?auto_15151 ?auto_15174 ) ) ( not ( = ?auto_15152 ?auto_15155 ) ) ( not ( = ?auto_15152 ?auto_15174 ) ) ( not ( = ?auto_15153 ?auto_15155 ) ) ( not ( = ?auto_15153 ?auto_15174 ) ) ( not ( = ?auto_15155 ?auto_15169 ) ) ( not ( = ?auto_15155 ?auto_15184 ) ) ( not ( = ?auto_15155 ?auto_15177 ) ) ( not ( = ?auto_15155 ?auto_15176 ) ) ( not ( = ?auto_15183 ?auto_15171 ) ) ( not ( = ?auto_15183 ?auto_15170 ) ) ( not ( = ?auto_15183 ?auto_15186 ) ) ( not ( = ?auto_15172 ?auto_15185 ) ) ( not ( = ?auto_15172 ?auto_15173 ) ) ( not ( = ?auto_15172 ?auto_15187 ) ) ( not ( = ?auto_15174 ?auto_15169 ) ) ( not ( = ?auto_15174 ?auto_15184 ) ) ( not ( = ?auto_15174 ?auto_15177 ) ) ( not ( = ?auto_15174 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15156 ) ) ( not ( = ?auto_15150 ?auto_15179 ) ) ( not ( = ?auto_15151 ?auto_15156 ) ) ( not ( = ?auto_15151 ?auto_15179 ) ) ( not ( = ?auto_15152 ?auto_15156 ) ) ( not ( = ?auto_15152 ?auto_15179 ) ) ( not ( = ?auto_15153 ?auto_15156 ) ) ( not ( = ?auto_15153 ?auto_15179 ) ) ( not ( = ?auto_15154 ?auto_15156 ) ) ( not ( = ?auto_15154 ?auto_15179 ) ) ( not ( = ?auto_15156 ?auto_15174 ) ) ( not ( = ?auto_15156 ?auto_15169 ) ) ( not ( = ?auto_15156 ?auto_15184 ) ) ( not ( = ?auto_15156 ?auto_15177 ) ) ( not ( = ?auto_15156 ?auto_15176 ) ) ( not ( = ?auto_15179 ?auto_15174 ) ) ( not ( = ?auto_15179 ?auto_15169 ) ) ( not ( = ?auto_15179 ?auto_15184 ) ) ( not ( = ?auto_15179 ?auto_15177 ) ) ( not ( = ?auto_15179 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15159 ) ) ( not ( = ?auto_15150 ?auto_15178 ) ) ( not ( = ?auto_15151 ?auto_15159 ) ) ( not ( = ?auto_15151 ?auto_15178 ) ) ( not ( = ?auto_15152 ?auto_15159 ) ) ( not ( = ?auto_15152 ?auto_15178 ) ) ( not ( = ?auto_15153 ?auto_15159 ) ) ( not ( = ?auto_15153 ?auto_15178 ) ) ( not ( = ?auto_15154 ?auto_15159 ) ) ( not ( = ?auto_15154 ?auto_15178 ) ) ( not ( = ?auto_15155 ?auto_15159 ) ) ( not ( = ?auto_15155 ?auto_15178 ) ) ( not ( = ?auto_15159 ?auto_15179 ) ) ( not ( = ?auto_15159 ?auto_15174 ) ) ( not ( = ?auto_15159 ?auto_15169 ) ) ( not ( = ?auto_15159 ?auto_15184 ) ) ( not ( = ?auto_15159 ?auto_15177 ) ) ( not ( = ?auto_15159 ?auto_15176 ) ) ( not ( = ?auto_15180 ?auto_15171 ) ) ( not ( = ?auto_15180 ?auto_15183 ) ) ( not ( = ?auto_15180 ?auto_15170 ) ) ( not ( = ?auto_15180 ?auto_15186 ) ) ( not ( = ?auto_15175 ?auto_15185 ) ) ( not ( = ?auto_15175 ?auto_15172 ) ) ( not ( = ?auto_15175 ?auto_15173 ) ) ( not ( = ?auto_15175 ?auto_15187 ) ) ( not ( = ?auto_15178 ?auto_15179 ) ) ( not ( = ?auto_15178 ?auto_15174 ) ) ( not ( = ?auto_15178 ?auto_15169 ) ) ( not ( = ?auto_15178 ?auto_15184 ) ) ( not ( = ?auto_15178 ?auto_15177 ) ) ( not ( = ?auto_15178 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15158 ) ) ( not ( = ?auto_15150 ?auto_15182 ) ) ( not ( = ?auto_15151 ?auto_15158 ) ) ( not ( = ?auto_15151 ?auto_15182 ) ) ( not ( = ?auto_15152 ?auto_15158 ) ) ( not ( = ?auto_15152 ?auto_15182 ) ) ( not ( = ?auto_15153 ?auto_15158 ) ) ( not ( = ?auto_15153 ?auto_15182 ) ) ( not ( = ?auto_15154 ?auto_15158 ) ) ( not ( = ?auto_15154 ?auto_15182 ) ) ( not ( = ?auto_15155 ?auto_15158 ) ) ( not ( = ?auto_15155 ?auto_15182 ) ) ( not ( = ?auto_15156 ?auto_15158 ) ) ( not ( = ?auto_15156 ?auto_15182 ) ) ( not ( = ?auto_15158 ?auto_15178 ) ) ( not ( = ?auto_15158 ?auto_15179 ) ) ( not ( = ?auto_15158 ?auto_15174 ) ) ( not ( = ?auto_15158 ?auto_15169 ) ) ( not ( = ?auto_15158 ?auto_15184 ) ) ( not ( = ?auto_15158 ?auto_15177 ) ) ( not ( = ?auto_15158 ?auto_15176 ) ) ( not ( = ?auto_15182 ?auto_15178 ) ) ( not ( = ?auto_15182 ?auto_15179 ) ) ( not ( = ?auto_15182 ?auto_15174 ) ) ( not ( = ?auto_15182 ?auto_15169 ) ) ( not ( = ?auto_15182 ?auto_15184 ) ) ( not ( = ?auto_15182 ?auto_15177 ) ) ( not ( = ?auto_15182 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15157 ) ) ( not ( = ?auto_15150 ?auto_15181 ) ) ( not ( = ?auto_15151 ?auto_15157 ) ) ( not ( = ?auto_15151 ?auto_15181 ) ) ( not ( = ?auto_15152 ?auto_15157 ) ) ( not ( = ?auto_15152 ?auto_15181 ) ) ( not ( = ?auto_15153 ?auto_15157 ) ) ( not ( = ?auto_15153 ?auto_15181 ) ) ( not ( = ?auto_15154 ?auto_15157 ) ) ( not ( = ?auto_15154 ?auto_15181 ) ) ( not ( = ?auto_15155 ?auto_15157 ) ) ( not ( = ?auto_15155 ?auto_15181 ) ) ( not ( = ?auto_15156 ?auto_15157 ) ) ( not ( = ?auto_15156 ?auto_15181 ) ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( not ( = ?auto_15159 ?auto_15181 ) ) ( not ( = ?auto_15157 ?auto_15182 ) ) ( not ( = ?auto_15157 ?auto_15178 ) ) ( not ( = ?auto_15157 ?auto_15179 ) ) ( not ( = ?auto_15157 ?auto_15174 ) ) ( not ( = ?auto_15157 ?auto_15169 ) ) ( not ( = ?auto_15157 ?auto_15184 ) ) ( not ( = ?auto_15157 ?auto_15177 ) ) ( not ( = ?auto_15157 ?auto_15176 ) ) ( not ( = ?auto_15181 ?auto_15182 ) ) ( not ( = ?auto_15181 ?auto_15178 ) ) ( not ( = ?auto_15181 ?auto_15179 ) ) ( not ( = ?auto_15181 ?auto_15174 ) ) ( not ( = ?auto_15181 ?auto_15169 ) ) ( not ( = ?auto_15181 ?auto_15184 ) ) ( not ( = ?auto_15181 ?auto_15177 ) ) ( not ( = ?auto_15181 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15160 ) ) ( not ( = ?auto_15150 ?auto_15189 ) ) ( not ( = ?auto_15151 ?auto_15160 ) ) ( not ( = ?auto_15151 ?auto_15189 ) ) ( not ( = ?auto_15152 ?auto_15160 ) ) ( not ( = ?auto_15152 ?auto_15189 ) ) ( not ( = ?auto_15153 ?auto_15160 ) ) ( not ( = ?auto_15153 ?auto_15189 ) ) ( not ( = ?auto_15154 ?auto_15160 ) ) ( not ( = ?auto_15154 ?auto_15189 ) ) ( not ( = ?auto_15155 ?auto_15160 ) ) ( not ( = ?auto_15155 ?auto_15189 ) ) ( not ( = ?auto_15156 ?auto_15160 ) ) ( not ( = ?auto_15156 ?auto_15189 ) ) ( not ( = ?auto_15159 ?auto_15160 ) ) ( not ( = ?auto_15159 ?auto_15189 ) ) ( not ( = ?auto_15158 ?auto_15160 ) ) ( not ( = ?auto_15158 ?auto_15189 ) ) ( not ( = ?auto_15160 ?auto_15181 ) ) ( not ( = ?auto_15160 ?auto_15182 ) ) ( not ( = ?auto_15160 ?auto_15178 ) ) ( not ( = ?auto_15160 ?auto_15179 ) ) ( not ( = ?auto_15160 ?auto_15174 ) ) ( not ( = ?auto_15160 ?auto_15169 ) ) ( not ( = ?auto_15160 ?auto_15184 ) ) ( not ( = ?auto_15160 ?auto_15177 ) ) ( not ( = ?auto_15160 ?auto_15176 ) ) ( not ( = ?auto_15189 ?auto_15181 ) ) ( not ( = ?auto_15189 ?auto_15182 ) ) ( not ( = ?auto_15189 ?auto_15178 ) ) ( not ( = ?auto_15189 ?auto_15179 ) ) ( not ( = ?auto_15189 ?auto_15174 ) ) ( not ( = ?auto_15189 ?auto_15169 ) ) ( not ( = ?auto_15189 ?auto_15184 ) ) ( not ( = ?auto_15189 ?auto_15177 ) ) ( not ( = ?auto_15189 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15161 ) ) ( not ( = ?auto_15150 ?auto_15188 ) ) ( not ( = ?auto_15151 ?auto_15161 ) ) ( not ( = ?auto_15151 ?auto_15188 ) ) ( not ( = ?auto_15152 ?auto_15161 ) ) ( not ( = ?auto_15152 ?auto_15188 ) ) ( not ( = ?auto_15153 ?auto_15161 ) ) ( not ( = ?auto_15153 ?auto_15188 ) ) ( not ( = ?auto_15154 ?auto_15161 ) ) ( not ( = ?auto_15154 ?auto_15188 ) ) ( not ( = ?auto_15155 ?auto_15161 ) ) ( not ( = ?auto_15155 ?auto_15188 ) ) ( not ( = ?auto_15156 ?auto_15161 ) ) ( not ( = ?auto_15156 ?auto_15188 ) ) ( not ( = ?auto_15159 ?auto_15161 ) ) ( not ( = ?auto_15159 ?auto_15188 ) ) ( not ( = ?auto_15158 ?auto_15161 ) ) ( not ( = ?auto_15158 ?auto_15188 ) ) ( not ( = ?auto_15157 ?auto_15161 ) ) ( not ( = ?auto_15157 ?auto_15188 ) ) ( not ( = ?auto_15161 ?auto_15189 ) ) ( not ( = ?auto_15161 ?auto_15181 ) ) ( not ( = ?auto_15161 ?auto_15182 ) ) ( not ( = ?auto_15161 ?auto_15178 ) ) ( not ( = ?auto_15161 ?auto_15179 ) ) ( not ( = ?auto_15161 ?auto_15174 ) ) ( not ( = ?auto_15161 ?auto_15169 ) ) ( not ( = ?auto_15161 ?auto_15184 ) ) ( not ( = ?auto_15161 ?auto_15177 ) ) ( not ( = ?auto_15161 ?auto_15176 ) ) ( not ( = ?auto_15188 ?auto_15189 ) ) ( not ( = ?auto_15188 ?auto_15181 ) ) ( not ( = ?auto_15188 ?auto_15182 ) ) ( not ( = ?auto_15188 ?auto_15178 ) ) ( not ( = ?auto_15188 ?auto_15179 ) ) ( not ( = ?auto_15188 ?auto_15174 ) ) ( not ( = ?auto_15188 ?auto_15169 ) ) ( not ( = ?auto_15188 ?auto_15184 ) ) ( not ( = ?auto_15188 ?auto_15177 ) ) ( not ( = ?auto_15188 ?auto_15176 ) ) ( not ( = ?auto_15150 ?auto_15162 ) ) ( not ( = ?auto_15150 ?auto_15164 ) ) ( not ( = ?auto_15151 ?auto_15162 ) ) ( not ( = ?auto_15151 ?auto_15164 ) ) ( not ( = ?auto_15152 ?auto_15162 ) ) ( not ( = ?auto_15152 ?auto_15164 ) ) ( not ( = ?auto_15153 ?auto_15162 ) ) ( not ( = ?auto_15153 ?auto_15164 ) ) ( not ( = ?auto_15154 ?auto_15162 ) ) ( not ( = ?auto_15154 ?auto_15164 ) ) ( not ( = ?auto_15155 ?auto_15162 ) ) ( not ( = ?auto_15155 ?auto_15164 ) ) ( not ( = ?auto_15156 ?auto_15162 ) ) ( not ( = ?auto_15156 ?auto_15164 ) ) ( not ( = ?auto_15159 ?auto_15162 ) ) ( not ( = ?auto_15159 ?auto_15164 ) ) ( not ( = ?auto_15158 ?auto_15162 ) ) ( not ( = ?auto_15158 ?auto_15164 ) ) ( not ( = ?auto_15157 ?auto_15162 ) ) ( not ( = ?auto_15157 ?auto_15164 ) ) ( not ( = ?auto_15160 ?auto_15162 ) ) ( not ( = ?auto_15160 ?auto_15164 ) ) ( not ( = ?auto_15162 ?auto_15188 ) ) ( not ( = ?auto_15162 ?auto_15189 ) ) ( not ( = ?auto_15162 ?auto_15181 ) ) ( not ( = ?auto_15162 ?auto_15182 ) ) ( not ( = ?auto_15162 ?auto_15178 ) ) ( not ( = ?auto_15162 ?auto_15179 ) ) ( not ( = ?auto_15162 ?auto_15174 ) ) ( not ( = ?auto_15162 ?auto_15169 ) ) ( not ( = ?auto_15162 ?auto_15184 ) ) ( not ( = ?auto_15162 ?auto_15177 ) ) ( not ( = ?auto_15162 ?auto_15176 ) ) ( not ( = ?auto_15165 ?auto_15171 ) ) ( not ( = ?auto_15165 ?auto_15183 ) ) ( not ( = ?auto_15165 ?auto_15170 ) ) ( not ( = ?auto_15165 ?auto_15180 ) ) ( not ( = ?auto_15165 ?auto_15186 ) ) ( not ( = ?auto_15168 ?auto_15185 ) ) ( not ( = ?auto_15168 ?auto_15172 ) ) ( not ( = ?auto_15168 ?auto_15173 ) ) ( not ( = ?auto_15168 ?auto_15175 ) ) ( not ( = ?auto_15168 ?auto_15187 ) ) ( not ( = ?auto_15164 ?auto_15188 ) ) ( not ( = ?auto_15164 ?auto_15189 ) ) ( not ( = ?auto_15164 ?auto_15181 ) ) ( not ( = ?auto_15164 ?auto_15182 ) ) ( not ( = ?auto_15164 ?auto_15178 ) ) ( not ( = ?auto_15164 ?auto_15179 ) ) ( not ( = ?auto_15164 ?auto_15174 ) ) ( not ( = ?auto_15164 ?auto_15169 ) ) ( not ( = ?auto_15164 ?auto_15184 ) ) ( not ( = ?auto_15164 ?auto_15177 ) ) ( not ( = ?auto_15164 ?auto_15176 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15150 ?auto_15151 ?auto_15152 ?auto_15153 ?auto_15154 ?auto_15155 ?auto_15156 ?auto_15159 ?auto_15158 ?auto_15157 ?auto_15160 ?auto_15161 )
      ( MAKE-1CRATE ?auto_15161 ?auto_15162 )
      ( MAKE-12CRATE-VERIFY ?auto_15150 ?auto_15151 ?auto_15152 ?auto_15153 ?auto_15154 ?auto_15155 ?auto_15156 ?auto_15159 ?auto_15158 ?auto_15157 ?auto_15160 ?auto_15161 ?auto_15162 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15192 - SURFACE
      ?auto_15193 - SURFACE
    )
    :vars
    (
      ?auto_15194 - HOIST
      ?auto_15195 - PLACE
      ?auto_15197 - PLACE
      ?auto_15198 - HOIST
      ?auto_15199 - SURFACE
      ?auto_15196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15194 ?auto_15195 ) ( SURFACE-AT ?auto_15192 ?auto_15195 ) ( CLEAR ?auto_15192 ) ( IS-CRATE ?auto_15193 ) ( AVAILABLE ?auto_15194 ) ( not ( = ?auto_15197 ?auto_15195 ) ) ( HOIST-AT ?auto_15198 ?auto_15197 ) ( AVAILABLE ?auto_15198 ) ( SURFACE-AT ?auto_15193 ?auto_15197 ) ( ON ?auto_15193 ?auto_15199 ) ( CLEAR ?auto_15193 ) ( TRUCK-AT ?auto_15196 ?auto_15195 ) ( not ( = ?auto_15192 ?auto_15193 ) ) ( not ( = ?auto_15192 ?auto_15199 ) ) ( not ( = ?auto_15193 ?auto_15199 ) ) ( not ( = ?auto_15194 ?auto_15198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15196 ?auto_15195 ?auto_15197 )
      ( !LIFT ?auto_15198 ?auto_15193 ?auto_15199 ?auto_15197 )
      ( !LOAD ?auto_15198 ?auto_15193 ?auto_15196 ?auto_15197 )
      ( !DRIVE ?auto_15196 ?auto_15197 ?auto_15195 )
      ( !UNLOAD ?auto_15194 ?auto_15193 ?auto_15196 ?auto_15195 )
      ( !DROP ?auto_15194 ?auto_15193 ?auto_15192 ?auto_15195 )
      ( MAKE-1CRATE-VERIFY ?auto_15192 ?auto_15193 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_15214 - SURFACE
      ?auto_15215 - SURFACE
      ?auto_15216 - SURFACE
      ?auto_15217 - SURFACE
      ?auto_15218 - SURFACE
      ?auto_15219 - SURFACE
      ?auto_15220 - SURFACE
      ?auto_15223 - SURFACE
      ?auto_15222 - SURFACE
      ?auto_15221 - SURFACE
      ?auto_15224 - SURFACE
      ?auto_15225 - SURFACE
      ?auto_15226 - SURFACE
      ?auto_15227 - SURFACE
    )
    :vars
    (
      ?auto_15229 - HOIST
      ?auto_15233 - PLACE
      ?auto_15228 - PLACE
      ?auto_15231 - HOIST
      ?auto_15230 - SURFACE
      ?auto_15243 - PLACE
      ?auto_15245 - HOIST
      ?auto_15244 - SURFACE
      ?auto_15254 - PLACE
      ?auto_15252 - HOIST
      ?auto_15248 - SURFACE
      ?auto_15236 - SURFACE
      ?auto_15240 - SURFACE
      ?auto_15242 - PLACE
      ?auto_15239 - HOIST
      ?auto_15241 - SURFACE
      ?auto_15238 - PLACE
      ?auto_15235 - HOIST
      ?auto_15255 - SURFACE
      ?auto_15246 - SURFACE
      ?auto_15253 - SURFACE
      ?auto_15249 - SURFACE
      ?auto_15237 - SURFACE
      ?auto_15247 - PLACE
      ?auto_15250 - HOIST
      ?auto_15234 - SURFACE
      ?auto_15251 - SURFACE
      ?auto_15232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15229 ?auto_15233 ) ( IS-CRATE ?auto_15227 ) ( not ( = ?auto_15228 ?auto_15233 ) ) ( HOIST-AT ?auto_15231 ?auto_15228 ) ( SURFACE-AT ?auto_15227 ?auto_15228 ) ( ON ?auto_15227 ?auto_15230 ) ( CLEAR ?auto_15227 ) ( not ( = ?auto_15226 ?auto_15227 ) ) ( not ( = ?auto_15226 ?auto_15230 ) ) ( not ( = ?auto_15227 ?auto_15230 ) ) ( not ( = ?auto_15229 ?auto_15231 ) ) ( IS-CRATE ?auto_15226 ) ( not ( = ?auto_15243 ?auto_15233 ) ) ( HOIST-AT ?auto_15245 ?auto_15243 ) ( AVAILABLE ?auto_15245 ) ( SURFACE-AT ?auto_15226 ?auto_15243 ) ( ON ?auto_15226 ?auto_15244 ) ( CLEAR ?auto_15226 ) ( not ( = ?auto_15225 ?auto_15226 ) ) ( not ( = ?auto_15225 ?auto_15244 ) ) ( not ( = ?auto_15226 ?auto_15244 ) ) ( not ( = ?auto_15229 ?auto_15245 ) ) ( IS-CRATE ?auto_15225 ) ( not ( = ?auto_15254 ?auto_15233 ) ) ( HOIST-AT ?auto_15252 ?auto_15254 ) ( SURFACE-AT ?auto_15225 ?auto_15254 ) ( ON ?auto_15225 ?auto_15248 ) ( CLEAR ?auto_15225 ) ( not ( = ?auto_15224 ?auto_15225 ) ) ( not ( = ?auto_15224 ?auto_15248 ) ) ( not ( = ?auto_15225 ?auto_15248 ) ) ( not ( = ?auto_15229 ?auto_15252 ) ) ( IS-CRATE ?auto_15224 ) ( SURFACE-AT ?auto_15224 ?auto_15254 ) ( ON ?auto_15224 ?auto_15236 ) ( CLEAR ?auto_15224 ) ( not ( = ?auto_15221 ?auto_15224 ) ) ( not ( = ?auto_15221 ?auto_15236 ) ) ( not ( = ?auto_15224 ?auto_15236 ) ) ( IS-CRATE ?auto_15221 ) ( SURFACE-AT ?auto_15221 ?auto_15228 ) ( ON ?auto_15221 ?auto_15240 ) ( CLEAR ?auto_15221 ) ( not ( = ?auto_15222 ?auto_15221 ) ) ( not ( = ?auto_15222 ?auto_15240 ) ) ( not ( = ?auto_15221 ?auto_15240 ) ) ( IS-CRATE ?auto_15222 ) ( not ( = ?auto_15242 ?auto_15233 ) ) ( HOIST-AT ?auto_15239 ?auto_15242 ) ( SURFACE-AT ?auto_15222 ?auto_15242 ) ( ON ?auto_15222 ?auto_15241 ) ( CLEAR ?auto_15222 ) ( not ( = ?auto_15223 ?auto_15222 ) ) ( not ( = ?auto_15223 ?auto_15241 ) ) ( not ( = ?auto_15222 ?auto_15241 ) ) ( not ( = ?auto_15229 ?auto_15239 ) ) ( IS-CRATE ?auto_15223 ) ( not ( = ?auto_15238 ?auto_15233 ) ) ( HOIST-AT ?auto_15235 ?auto_15238 ) ( AVAILABLE ?auto_15235 ) ( SURFACE-AT ?auto_15223 ?auto_15238 ) ( ON ?auto_15223 ?auto_15255 ) ( CLEAR ?auto_15223 ) ( not ( = ?auto_15220 ?auto_15223 ) ) ( not ( = ?auto_15220 ?auto_15255 ) ) ( not ( = ?auto_15223 ?auto_15255 ) ) ( not ( = ?auto_15229 ?auto_15235 ) ) ( IS-CRATE ?auto_15220 ) ( SURFACE-AT ?auto_15220 ?auto_15254 ) ( ON ?auto_15220 ?auto_15246 ) ( CLEAR ?auto_15220 ) ( not ( = ?auto_15219 ?auto_15220 ) ) ( not ( = ?auto_15219 ?auto_15246 ) ) ( not ( = ?auto_15220 ?auto_15246 ) ) ( IS-CRATE ?auto_15219 ) ( AVAILABLE ?auto_15231 ) ( SURFACE-AT ?auto_15219 ?auto_15228 ) ( ON ?auto_15219 ?auto_15253 ) ( CLEAR ?auto_15219 ) ( not ( = ?auto_15218 ?auto_15219 ) ) ( not ( = ?auto_15218 ?auto_15253 ) ) ( not ( = ?auto_15219 ?auto_15253 ) ) ( IS-CRATE ?auto_15218 ) ( SURFACE-AT ?auto_15218 ?auto_15254 ) ( ON ?auto_15218 ?auto_15249 ) ( CLEAR ?auto_15218 ) ( not ( = ?auto_15217 ?auto_15218 ) ) ( not ( = ?auto_15217 ?auto_15249 ) ) ( not ( = ?auto_15218 ?auto_15249 ) ) ( IS-CRATE ?auto_15217 ) ( AVAILABLE ?auto_15239 ) ( SURFACE-AT ?auto_15217 ?auto_15242 ) ( ON ?auto_15217 ?auto_15237 ) ( CLEAR ?auto_15217 ) ( not ( = ?auto_15216 ?auto_15217 ) ) ( not ( = ?auto_15216 ?auto_15237 ) ) ( not ( = ?auto_15217 ?auto_15237 ) ) ( IS-CRATE ?auto_15216 ) ( not ( = ?auto_15247 ?auto_15233 ) ) ( HOIST-AT ?auto_15250 ?auto_15247 ) ( AVAILABLE ?auto_15250 ) ( SURFACE-AT ?auto_15216 ?auto_15247 ) ( ON ?auto_15216 ?auto_15234 ) ( CLEAR ?auto_15216 ) ( not ( = ?auto_15215 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15234 ) ) ( not ( = ?auto_15216 ?auto_15234 ) ) ( not ( = ?auto_15229 ?auto_15250 ) ) ( SURFACE-AT ?auto_15214 ?auto_15233 ) ( CLEAR ?auto_15214 ) ( IS-CRATE ?auto_15215 ) ( AVAILABLE ?auto_15229 ) ( AVAILABLE ?auto_15252 ) ( SURFACE-AT ?auto_15215 ?auto_15254 ) ( ON ?auto_15215 ?auto_15251 ) ( CLEAR ?auto_15215 ) ( TRUCK-AT ?auto_15232 ?auto_15233 ) ( not ( = ?auto_15214 ?auto_15215 ) ) ( not ( = ?auto_15214 ?auto_15251 ) ) ( not ( = ?auto_15215 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15216 ) ) ( not ( = ?auto_15214 ?auto_15234 ) ) ( not ( = ?auto_15216 ?auto_15251 ) ) ( not ( = ?auto_15247 ?auto_15254 ) ) ( not ( = ?auto_15250 ?auto_15252 ) ) ( not ( = ?auto_15234 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15217 ) ) ( not ( = ?auto_15214 ?auto_15237 ) ) ( not ( = ?auto_15215 ?auto_15217 ) ) ( not ( = ?auto_15215 ?auto_15237 ) ) ( not ( = ?auto_15217 ?auto_15234 ) ) ( not ( = ?auto_15217 ?auto_15251 ) ) ( not ( = ?auto_15242 ?auto_15247 ) ) ( not ( = ?auto_15242 ?auto_15254 ) ) ( not ( = ?auto_15239 ?auto_15250 ) ) ( not ( = ?auto_15239 ?auto_15252 ) ) ( not ( = ?auto_15237 ?auto_15234 ) ) ( not ( = ?auto_15237 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15218 ) ) ( not ( = ?auto_15214 ?auto_15249 ) ) ( not ( = ?auto_15215 ?auto_15218 ) ) ( not ( = ?auto_15215 ?auto_15249 ) ) ( not ( = ?auto_15216 ?auto_15218 ) ) ( not ( = ?auto_15216 ?auto_15249 ) ) ( not ( = ?auto_15218 ?auto_15237 ) ) ( not ( = ?auto_15218 ?auto_15234 ) ) ( not ( = ?auto_15218 ?auto_15251 ) ) ( not ( = ?auto_15249 ?auto_15237 ) ) ( not ( = ?auto_15249 ?auto_15234 ) ) ( not ( = ?auto_15249 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15219 ) ) ( not ( = ?auto_15214 ?auto_15253 ) ) ( not ( = ?auto_15215 ?auto_15219 ) ) ( not ( = ?auto_15215 ?auto_15253 ) ) ( not ( = ?auto_15216 ?auto_15219 ) ) ( not ( = ?auto_15216 ?auto_15253 ) ) ( not ( = ?auto_15217 ?auto_15219 ) ) ( not ( = ?auto_15217 ?auto_15253 ) ) ( not ( = ?auto_15219 ?auto_15249 ) ) ( not ( = ?auto_15219 ?auto_15237 ) ) ( not ( = ?auto_15219 ?auto_15234 ) ) ( not ( = ?auto_15219 ?auto_15251 ) ) ( not ( = ?auto_15228 ?auto_15254 ) ) ( not ( = ?auto_15228 ?auto_15242 ) ) ( not ( = ?auto_15228 ?auto_15247 ) ) ( not ( = ?auto_15231 ?auto_15252 ) ) ( not ( = ?auto_15231 ?auto_15239 ) ) ( not ( = ?auto_15231 ?auto_15250 ) ) ( not ( = ?auto_15253 ?auto_15249 ) ) ( not ( = ?auto_15253 ?auto_15237 ) ) ( not ( = ?auto_15253 ?auto_15234 ) ) ( not ( = ?auto_15253 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15220 ) ) ( not ( = ?auto_15214 ?auto_15246 ) ) ( not ( = ?auto_15215 ?auto_15220 ) ) ( not ( = ?auto_15215 ?auto_15246 ) ) ( not ( = ?auto_15216 ?auto_15220 ) ) ( not ( = ?auto_15216 ?auto_15246 ) ) ( not ( = ?auto_15217 ?auto_15220 ) ) ( not ( = ?auto_15217 ?auto_15246 ) ) ( not ( = ?auto_15218 ?auto_15220 ) ) ( not ( = ?auto_15218 ?auto_15246 ) ) ( not ( = ?auto_15220 ?auto_15253 ) ) ( not ( = ?auto_15220 ?auto_15249 ) ) ( not ( = ?auto_15220 ?auto_15237 ) ) ( not ( = ?auto_15220 ?auto_15234 ) ) ( not ( = ?auto_15220 ?auto_15251 ) ) ( not ( = ?auto_15246 ?auto_15253 ) ) ( not ( = ?auto_15246 ?auto_15249 ) ) ( not ( = ?auto_15246 ?auto_15237 ) ) ( not ( = ?auto_15246 ?auto_15234 ) ) ( not ( = ?auto_15246 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15223 ) ) ( not ( = ?auto_15214 ?auto_15255 ) ) ( not ( = ?auto_15215 ?auto_15223 ) ) ( not ( = ?auto_15215 ?auto_15255 ) ) ( not ( = ?auto_15216 ?auto_15223 ) ) ( not ( = ?auto_15216 ?auto_15255 ) ) ( not ( = ?auto_15217 ?auto_15223 ) ) ( not ( = ?auto_15217 ?auto_15255 ) ) ( not ( = ?auto_15218 ?auto_15223 ) ) ( not ( = ?auto_15218 ?auto_15255 ) ) ( not ( = ?auto_15219 ?auto_15223 ) ) ( not ( = ?auto_15219 ?auto_15255 ) ) ( not ( = ?auto_15223 ?auto_15246 ) ) ( not ( = ?auto_15223 ?auto_15253 ) ) ( not ( = ?auto_15223 ?auto_15249 ) ) ( not ( = ?auto_15223 ?auto_15237 ) ) ( not ( = ?auto_15223 ?auto_15234 ) ) ( not ( = ?auto_15223 ?auto_15251 ) ) ( not ( = ?auto_15238 ?auto_15254 ) ) ( not ( = ?auto_15238 ?auto_15228 ) ) ( not ( = ?auto_15238 ?auto_15242 ) ) ( not ( = ?auto_15238 ?auto_15247 ) ) ( not ( = ?auto_15235 ?auto_15252 ) ) ( not ( = ?auto_15235 ?auto_15231 ) ) ( not ( = ?auto_15235 ?auto_15239 ) ) ( not ( = ?auto_15235 ?auto_15250 ) ) ( not ( = ?auto_15255 ?auto_15246 ) ) ( not ( = ?auto_15255 ?auto_15253 ) ) ( not ( = ?auto_15255 ?auto_15249 ) ) ( not ( = ?auto_15255 ?auto_15237 ) ) ( not ( = ?auto_15255 ?auto_15234 ) ) ( not ( = ?auto_15255 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15222 ) ) ( not ( = ?auto_15214 ?auto_15241 ) ) ( not ( = ?auto_15215 ?auto_15222 ) ) ( not ( = ?auto_15215 ?auto_15241 ) ) ( not ( = ?auto_15216 ?auto_15222 ) ) ( not ( = ?auto_15216 ?auto_15241 ) ) ( not ( = ?auto_15217 ?auto_15222 ) ) ( not ( = ?auto_15217 ?auto_15241 ) ) ( not ( = ?auto_15218 ?auto_15222 ) ) ( not ( = ?auto_15218 ?auto_15241 ) ) ( not ( = ?auto_15219 ?auto_15222 ) ) ( not ( = ?auto_15219 ?auto_15241 ) ) ( not ( = ?auto_15220 ?auto_15222 ) ) ( not ( = ?auto_15220 ?auto_15241 ) ) ( not ( = ?auto_15222 ?auto_15255 ) ) ( not ( = ?auto_15222 ?auto_15246 ) ) ( not ( = ?auto_15222 ?auto_15253 ) ) ( not ( = ?auto_15222 ?auto_15249 ) ) ( not ( = ?auto_15222 ?auto_15237 ) ) ( not ( = ?auto_15222 ?auto_15234 ) ) ( not ( = ?auto_15222 ?auto_15251 ) ) ( not ( = ?auto_15241 ?auto_15255 ) ) ( not ( = ?auto_15241 ?auto_15246 ) ) ( not ( = ?auto_15241 ?auto_15253 ) ) ( not ( = ?auto_15241 ?auto_15249 ) ) ( not ( = ?auto_15241 ?auto_15237 ) ) ( not ( = ?auto_15241 ?auto_15234 ) ) ( not ( = ?auto_15241 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15221 ) ) ( not ( = ?auto_15214 ?auto_15240 ) ) ( not ( = ?auto_15215 ?auto_15221 ) ) ( not ( = ?auto_15215 ?auto_15240 ) ) ( not ( = ?auto_15216 ?auto_15221 ) ) ( not ( = ?auto_15216 ?auto_15240 ) ) ( not ( = ?auto_15217 ?auto_15221 ) ) ( not ( = ?auto_15217 ?auto_15240 ) ) ( not ( = ?auto_15218 ?auto_15221 ) ) ( not ( = ?auto_15218 ?auto_15240 ) ) ( not ( = ?auto_15219 ?auto_15221 ) ) ( not ( = ?auto_15219 ?auto_15240 ) ) ( not ( = ?auto_15220 ?auto_15221 ) ) ( not ( = ?auto_15220 ?auto_15240 ) ) ( not ( = ?auto_15223 ?auto_15221 ) ) ( not ( = ?auto_15223 ?auto_15240 ) ) ( not ( = ?auto_15221 ?auto_15241 ) ) ( not ( = ?auto_15221 ?auto_15255 ) ) ( not ( = ?auto_15221 ?auto_15246 ) ) ( not ( = ?auto_15221 ?auto_15253 ) ) ( not ( = ?auto_15221 ?auto_15249 ) ) ( not ( = ?auto_15221 ?auto_15237 ) ) ( not ( = ?auto_15221 ?auto_15234 ) ) ( not ( = ?auto_15221 ?auto_15251 ) ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15255 ) ) ( not ( = ?auto_15240 ?auto_15246 ) ) ( not ( = ?auto_15240 ?auto_15253 ) ) ( not ( = ?auto_15240 ?auto_15249 ) ) ( not ( = ?auto_15240 ?auto_15237 ) ) ( not ( = ?auto_15240 ?auto_15234 ) ) ( not ( = ?auto_15240 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15224 ) ) ( not ( = ?auto_15214 ?auto_15236 ) ) ( not ( = ?auto_15215 ?auto_15224 ) ) ( not ( = ?auto_15215 ?auto_15236 ) ) ( not ( = ?auto_15216 ?auto_15224 ) ) ( not ( = ?auto_15216 ?auto_15236 ) ) ( not ( = ?auto_15217 ?auto_15224 ) ) ( not ( = ?auto_15217 ?auto_15236 ) ) ( not ( = ?auto_15218 ?auto_15224 ) ) ( not ( = ?auto_15218 ?auto_15236 ) ) ( not ( = ?auto_15219 ?auto_15224 ) ) ( not ( = ?auto_15219 ?auto_15236 ) ) ( not ( = ?auto_15220 ?auto_15224 ) ) ( not ( = ?auto_15220 ?auto_15236 ) ) ( not ( = ?auto_15223 ?auto_15224 ) ) ( not ( = ?auto_15223 ?auto_15236 ) ) ( not ( = ?auto_15222 ?auto_15224 ) ) ( not ( = ?auto_15222 ?auto_15236 ) ) ( not ( = ?auto_15224 ?auto_15240 ) ) ( not ( = ?auto_15224 ?auto_15241 ) ) ( not ( = ?auto_15224 ?auto_15255 ) ) ( not ( = ?auto_15224 ?auto_15246 ) ) ( not ( = ?auto_15224 ?auto_15253 ) ) ( not ( = ?auto_15224 ?auto_15249 ) ) ( not ( = ?auto_15224 ?auto_15237 ) ) ( not ( = ?auto_15224 ?auto_15234 ) ) ( not ( = ?auto_15224 ?auto_15251 ) ) ( not ( = ?auto_15236 ?auto_15240 ) ) ( not ( = ?auto_15236 ?auto_15241 ) ) ( not ( = ?auto_15236 ?auto_15255 ) ) ( not ( = ?auto_15236 ?auto_15246 ) ) ( not ( = ?auto_15236 ?auto_15253 ) ) ( not ( = ?auto_15236 ?auto_15249 ) ) ( not ( = ?auto_15236 ?auto_15237 ) ) ( not ( = ?auto_15236 ?auto_15234 ) ) ( not ( = ?auto_15236 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15225 ) ) ( not ( = ?auto_15214 ?auto_15248 ) ) ( not ( = ?auto_15215 ?auto_15225 ) ) ( not ( = ?auto_15215 ?auto_15248 ) ) ( not ( = ?auto_15216 ?auto_15225 ) ) ( not ( = ?auto_15216 ?auto_15248 ) ) ( not ( = ?auto_15217 ?auto_15225 ) ) ( not ( = ?auto_15217 ?auto_15248 ) ) ( not ( = ?auto_15218 ?auto_15225 ) ) ( not ( = ?auto_15218 ?auto_15248 ) ) ( not ( = ?auto_15219 ?auto_15225 ) ) ( not ( = ?auto_15219 ?auto_15248 ) ) ( not ( = ?auto_15220 ?auto_15225 ) ) ( not ( = ?auto_15220 ?auto_15248 ) ) ( not ( = ?auto_15223 ?auto_15225 ) ) ( not ( = ?auto_15223 ?auto_15248 ) ) ( not ( = ?auto_15222 ?auto_15225 ) ) ( not ( = ?auto_15222 ?auto_15248 ) ) ( not ( = ?auto_15221 ?auto_15225 ) ) ( not ( = ?auto_15221 ?auto_15248 ) ) ( not ( = ?auto_15225 ?auto_15236 ) ) ( not ( = ?auto_15225 ?auto_15240 ) ) ( not ( = ?auto_15225 ?auto_15241 ) ) ( not ( = ?auto_15225 ?auto_15255 ) ) ( not ( = ?auto_15225 ?auto_15246 ) ) ( not ( = ?auto_15225 ?auto_15253 ) ) ( not ( = ?auto_15225 ?auto_15249 ) ) ( not ( = ?auto_15225 ?auto_15237 ) ) ( not ( = ?auto_15225 ?auto_15234 ) ) ( not ( = ?auto_15225 ?auto_15251 ) ) ( not ( = ?auto_15248 ?auto_15236 ) ) ( not ( = ?auto_15248 ?auto_15240 ) ) ( not ( = ?auto_15248 ?auto_15241 ) ) ( not ( = ?auto_15248 ?auto_15255 ) ) ( not ( = ?auto_15248 ?auto_15246 ) ) ( not ( = ?auto_15248 ?auto_15253 ) ) ( not ( = ?auto_15248 ?auto_15249 ) ) ( not ( = ?auto_15248 ?auto_15237 ) ) ( not ( = ?auto_15248 ?auto_15234 ) ) ( not ( = ?auto_15248 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15226 ) ) ( not ( = ?auto_15214 ?auto_15244 ) ) ( not ( = ?auto_15215 ?auto_15226 ) ) ( not ( = ?auto_15215 ?auto_15244 ) ) ( not ( = ?auto_15216 ?auto_15226 ) ) ( not ( = ?auto_15216 ?auto_15244 ) ) ( not ( = ?auto_15217 ?auto_15226 ) ) ( not ( = ?auto_15217 ?auto_15244 ) ) ( not ( = ?auto_15218 ?auto_15226 ) ) ( not ( = ?auto_15218 ?auto_15244 ) ) ( not ( = ?auto_15219 ?auto_15226 ) ) ( not ( = ?auto_15219 ?auto_15244 ) ) ( not ( = ?auto_15220 ?auto_15226 ) ) ( not ( = ?auto_15220 ?auto_15244 ) ) ( not ( = ?auto_15223 ?auto_15226 ) ) ( not ( = ?auto_15223 ?auto_15244 ) ) ( not ( = ?auto_15222 ?auto_15226 ) ) ( not ( = ?auto_15222 ?auto_15244 ) ) ( not ( = ?auto_15221 ?auto_15226 ) ) ( not ( = ?auto_15221 ?auto_15244 ) ) ( not ( = ?auto_15224 ?auto_15226 ) ) ( not ( = ?auto_15224 ?auto_15244 ) ) ( not ( = ?auto_15226 ?auto_15248 ) ) ( not ( = ?auto_15226 ?auto_15236 ) ) ( not ( = ?auto_15226 ?auto_15240 ) ) ( not ( = ?auto_15226 ?auto_15241 ) ) ( not ( = ?auto_15226 ?auto_15255 ) ) ( not ( = ?auto_15226 ?auto_15246 ) ) ( not ( = ?auto_15226 ?auto_15253 ) ) ( not ( = ?auto_15226 ?auto_15249 ) ) ( not ( = ?auto_15226 ?auto_15237 ) ) ( not ( = ?auto_15226 ?auto_15234 ) ) ( not ( = ?auto_15226 ?auto_15251 ) ) ( not ( = ?auto_15243 ?auto_15254 ) ) ( not ( = ?auto_15243 ?auto_15228 ) ) ( not ( = ?auto_15243 ?auto_15242 ) ) ( not ( = ?auto_15243 ?auto_15238 ) ) ( not ( = ?auto_15243 ?auto_15247 ) ) ( not ( = ?auto_15245 ?auto_15252 ) ) ( not ( = ?auto_15245 ?auto_15231 ) ) ( not ( = ?auto_15245 ?auto_15239 ) ) ( not ( = ?auto_15245 ?auto_15235 ) ) ( not ( = ?auto_15245 ?auto_15250 ) ) ( not ( = ?auto_15244 ?auto_15248 ) ) ( not ( = ?auto_15244 ?auto_15236 ) ) ( not ( = ?auto_15244 ?auto_15240 ) ) ( not ( = ?auto_15244 ?auto_15241 ) ) ( not ( = ?auto_15244 ?auto_15255 ) ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15253 ) ) ( not ( = ?auto_15244 ?auto_15249 ) ) ( not ( = ?auto_15244 ?auto_15237 ) ) ( not ( = ?auto_15244 ?auto_15234 ) ) ( not ( = ?auto_15244 ?auto_15251 ) ) ( not ( = ?auto_15214 ?auto_15227 ) ) ( not ( = ?auto_15214 ?auto_15230 ) ) ( not ( = ?auto_15215 ?auto_15227 ) ) ( not ( = ?auto_15215 ?auto_15230 ) ) ( not ( = ?auto_15216 ?auto_15227 ) ) ( not ( = ?auto_15216 ?auto_15230 ) ) ( not ( = ?auto_15217 ?auto_15227 ) ) ( not ( = ?auto_15217 ?auto_15230 ) ) ( not ( = ?auto_15218 ?auto_15227 ) ) ( not ( = ?auto_15218 ?auto_15230 ) ) ( not ( = ?auto_15219 ?auto_15227 ) ) ( not ( = ?auto_15219 ?auto_15230 ) ) ( not ( = ?auto_15220 ?auto_15227 ) ) ( not ( = ?auto_15220 ?auto_15230 ) ) ( not ( = ?auto_15223 ?auto_15227 ) ) ( not ( = ?auto_15223 ?auto_15230 ) ) ( not ( = ?auto_15222 ?auto_15227 ) ) ( not ( = ?auto_15222 ?auto_15230 ) ) ( not ( = ?auto_15221 ?auto_15227 ) ) ( not ( = ?auto_15221 ?auto_15230 ) ) ( not ( = ?auto_15224 ?auto_15227 ) ) ( not ( = ?auto_15224 ?auto_15230 ) ) ( not ( = ?auto_15225 ?auto_15227 ) ) ( not ( = ?auto_15225 ?auto_15230 ) ) ( not ( = ?auto_15227 ?auto_15244 ) ) ( not ( = ?auto_15227 ?auto_15248 ) ) ( not ( = ?auto_15227 ?auto_15236 ) ) ( not ( = ?auto_15227 ?auto_15240 ) ) ( not ( = ?auto_15227 ?auto_15241 ) ) ( not ( = ?auto_15227 ?auto_15255 ) ) ( not ( = ?auto_15227 ?auto_15246 ) ) ( not ( = ?auto_15227 ?auto_15253 ) ) ( not ( = ?auto_15227 ?auto_15249 ) ) ( not ( = ?auto_15227 ?auto_15237 ) ) ( not ( = ?auto_15227 ?auto_15234 ) ) ( not ( = ?auto_15227 ?auto_15251 ) ) ( not ( = ?auto_15230 ?auto_15244 ) ) ( not ( = ?auto_15230 ?auto_15248 ) ) ( not ( = ?auto_15230 ?auto_15236 ) ) ( not ( = ?auto_15230 ?auto_15240 ) ) ( not ( = ?auto_15230 ?auto_15241 ) ) ( not ( = ?auto_15230 ?auto_15255 ) ) ( not ( = ?auto_15230 ?auto_15246 ) ) ( not ( = ?auto_15230 ?auto_15253 ) ) ( not ( = ?auto_15230 ?auto_15249 ) ) ( not ( = ?auto_15230 ?auto_15237 ) ) ( not ( = ?auto_15230 ?auto_15234 ) ) ( not ( = ?auto_15230 ?auto_15251 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15214 ?auto_15215 ?auto_15216 ?auto_15217 ?auto_15218 ?auto_15219 ?auto_15220 ?auto_15223 ?auto_15222 ?auto_15221 ?auto_15224 ?auto_15225 ?auto_15226 )
      ( MAKE-1CRATE ?auto_15226 ?auto_15227 )
      ( MAKE-13CRATE-VERIFY ?auto_15214 ?auto_15215 ?auto_15216 ?auto_15217 ?auto_15218 ?auto_15219 ?auto_15220 ?auto_15223 ?auto_15222 ?auto_15221 ?auto_15224 ?auto_15225 ?auto_15226 ?auto_15227 ) )
  )

)

