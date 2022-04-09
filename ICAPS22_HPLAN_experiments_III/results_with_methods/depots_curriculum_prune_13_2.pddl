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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_14713 - SURFACE
      ?auto_14714 - SURFACE
      ?auto_14715 - SURFACE
    )
    :vars
    (
      ?auto_14718 - HOIST
      ?auto_14720 - PLACE
      ?auto_14721 - PLACE
      ?auto_14716 - HOIST
      ?auto_14717 - SURFACE
      ?auto_14722 - PLACE
      ?auto_14724 - HOIST
      ?auto_14723 - SURFACE
      ?auto_14719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14718 ?auto_14720 ) ( IS-CRATE ?auto_14715 ) ( not ( = ?auto_14721 ?auto_14720 ) ) ( HOIST-AT ?auto_14716 ?auto_14721 ) ( AVAILABLE ?auto_14716 ) ( SURFACE-AT ?auto_14715 ?auto_14721 ) ( ON ?auto_14715 ?auto_14717 ) ( CLEAR ?auto_14715 ) ( not ( = ?auto_14714 ?auto_14715 ) ) ( not ( = ?auto_14714 ?auto_14717 ) ) ( not ( = ?auto_14715 ?auto_14717 ) ) ( not ( = ?auto_14718 ?auto_14716 ) ) ( SURFACE-AT ?auto_14713 ?auto_14720 ) ( CLEAR ?auto_14713 ) ( IS-CRATE ?auto_14714 ) ( AVAILABLE ?auto_14718 ) ( not ( = ?auto_14722 ?auto_14720 ) ) ( HOIST-AT ?auto_14724 ?auto_14722 ) ( AVAILABLE ?auto_14724 ) ( SURFACE-AT ?auto_14714 ?auto_14722 ) ( ON ?auto_14714 ?auto_14723 ) ( CLEAR ?auto_14714 ) ( TRUCK-AT ?auto_14719 ?auto_14720 ) ( not ( = ?auto_14713 ?auto_14714 ) ) ( not ( = ?auto_14713 ?auto_14723 ) ) ( not ( = ?auto_14714 ?auto_14723 ) ) ( not ( = ?auto_14718 ?auto_14724 ) ) ( not ( = ?auto_14713 ?auto_14715 ) ) ( not ( = ?auto_14713 ?auto_14717 ) ) ( not ( = ?auto_14715 ?auto_14723 ) ) ( not ( = ?auto_14721 ?auto_14722 ) ) ( not ( = ?auto_14716 ?auto_14724 ) ) ( not ( = ?auto_14717 ?auto_14723 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14713 ?auto_14714 )
      ( MAKE-1CRATE ?auto_14714 ?auto_14715 )
      ( MAKE-2CRATE-VERIFY ?auto_14713 ?auto_14714 ?auto_14715 ) )
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
      ?auto_14745 - HOIST
      ?auto_14743 - PLACE
      ?auto_14746 - PLACE
      ?auto_14747 - HOIST
      ?auto_14748 - SURFACE
      ?auto_14754 - PLACE
      ?auto_14750 - HOIST
      ?auto_14753 - SURFACE
      ?auto_14749 - PLACE
      ?auto_14752 - HOIST
      ?auto_14751 - SURFACE
      ?auto_14744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14745 ?auto_14743 ) ( IS-CRATE ?auto_14742 ) ( not ( = ?auto_14746 ?auto_14743 ) ) ( HOIST-AT ?auto_14747 ?auto_14746 ) ( AVAILABLE ?auto_14747 ) ( SURFACE-AT ?auto_14742 ?auto_14746 ) ( ON ?auto_14742 ?auto_14748 ) ( CLEAR ?auto_14742 ) ( not ( = ?auto_14741 ?auto_14742 ) ) ( not ( = ?auto_14741 ?auto_14748 ) ) ( not ( = ?auto_14742 ?auto_14748 ) ) ( not ( = ?auto_14745 ?auto_14747 ) ) ( IS-CRATE ?auto_14741 ) ( not ( = ?auto_14754 ?auto_14743 ) ) ( HOIST-AT ?auto_14750 ?auto_14754 ) ( AVAILABLE ?auto_14750 ) ( SURFACE-AT ?auto_14741 ?auto_14754 ) ( ON ?auto_14741 ?auto_14753 ) ( CLEAR ?auto_14741 ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14753 ) ) ( not ( = ?auto_14741 ?auto_14753 ) ) ( not ( = ?auto_14745 ?auto_14750 ) ) ( SURFACE-AT ?auto_14739 ?auto_14743 ) ( CLEAR ?auto_14739 ) ( IS-CRATE ?auto_14740 ) ( AVAILABLE ?auto_14745 ) ( not ( = ?auto_14749 ?auto_14743 ) ) ( HOIST-AT ?auto_14752 ?auto_14749 ) ( AVAILABLE ?auto_14752 ) ( SURFACE-AT ?auto_14740 ?auto_14749 ) ( ON ?auto_14740 ?auto_14751 ) ( CLEAR ?auto_14740 ) ( TRUCK-AT ?auto_14744 ?auto_14743 ) ( not ( = ?auto_14739 ?auto_14740 ) ) ( not ( = ?auto_14739 ?auto_14751 ) ) ( not ( = ?auto_14740 ?auto_14751 ) ) ( not ( = ?auto_14745 ?auto_14752 ) ) ( not ( = ?auto_14739 ?auto_14741 ) ) ( not ( = ?auto_14739 ?auto_14753 ) ) ( not ( = ?auto_14741 ?auto_14751 ) ) ( not ( = ?auto_14754 ?auto_14749 ) ) ( not ( = ?auto_14750 ?auto_14752 ) ) ( not ( = ?auto_14753 ?auto_14751 ) ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( not ( = ?auto_14739 ?auto_14748 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14748 ) ) ( not ( = ?auto_14742 ?auto_14753 ) ) ( not ( = ?auto_14742 ?auto_14751 ) ) ( not ( = ?auto_14746 ?auto_14754 ) ) ( not ( = ?auto_14746 ?auto_14749 ) ) ( not ( = ?auto_14747 ?auto_14750 ) ) ( not ( = ?auto_14747 ?auto_14752 ) ) ( not ( = ?auto_14748 ?auto_14753 ) ) ( not ( = ?auto_14748 ?auto_14751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14739 ?auto_14740 ?auto_14741 )
      ( MAKE-1CRATE ?auto_14741 ?auto_14742 )
      ( MAKE-3CRATE-VERIFY ?auto_14739 ?auto_14740 ?auto_14741 ?auto_14742 ) )
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
      ?auto_14778 - HOIST
      ?auto_14779 - PLACE
      ?auto_14775 - PLACE
      ?auto_14780 - HOIST
      ?auto_14777 - SURFACE
      ?auto_14783 - PLACE
      ?auto_14781 - HOIST
      ?auto_14785 - SURFACE
      ?auto_14782 - PLACE
      ?auto_14784 - HOIST
      ?auto_14786 - SURFACE
      ?auto_14787 - SURFACE
      ?auto_14776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14778 ?auto_14779 ) ( IS-CRATE ?auto_14774 ) ( not ( = ?auto_14775 ?auto_14779 ) ) ( HOIST-AT ?auto_14780 ?auto_14775 ) ( SURFACE-AT ?auto_14774 ?auto_14775 ) ( ON ?auto_14774 ?auto_14777 ) ( CLEAR ?auto_14774 ) ( not ( = ?auto_14773 ?auto_14774 ) ) ( not ( = ?auto_14773 ?auto_14777 ) ) ( not ( = ?auto_14774 ?auto_14777 ) ) ( not ( = ?auto_14778 ?auto_14780 ) ) ( IS-CRATE ?auto_14773 ) ( not ( = ?auto_14783 ?auto_14779 ) ) ( HOIST-AT ?auto_14781 ?auto_14783 ) ( AVAILABLE ?auto_14781 ) ( SURFACE-AT ?auto_14773 ?auto_14783 ) ( ON ?auto_14773 ?auto_14785 ) ( CLEAR ?auto_14773 ) ( not ( = ?auto_14772 ?auto_14773 ) ) ( not ( = ?auto_14772 ?auto_14785 ) ) ( not ( = ?auto_14773 ?auto_14785 ) ) ( not ( = ?auto_14778 ?auto_14781 ) ) ( IS-CRATE ?auto_14772 ) ( not ( = ?auto_14782 ?auto_14779 ) ) ( HOIST-AT ?auto_14784 ?auto_14782 ) ( AVAILABLE ?auto_14784 ) ( SURFACE-AT ?auto_14772 ?auto_14782 ) ( ON ?auto_14772 ?auto_14786 ) ( CLEAR ?auto_14772 ) ( not ( = ?auto_14771 ?auto_14772 ) ) ( not ( = ?auto_14771 ?auto_14786 ) ) ( not ( = ?auto_14772 ?auto_14786 ) ) ( not ( = ?auto_14778 ?auto_14784 ) ) ( SURFACE-AT ?auto_14770 ?auto_14779 ) ( CLEAR ?auto_14770 ) ( IS-CRATE ?auto_14771 ) ( AVAILABLE ?auto_14778 ) ( AVAILABLE ?auto_14780 ) ( SURFACE-AT ?auto_14771 ?auto_14775 ) ( ON ?auto_14771 ?auto_14787 ) ( CLEAR ?auto_14771 ) ( TRUCK-AT ?auto_14776 ?auto_14779 ) ( not ( = ?auto_14770 ?auto_14771 ) ) ( not ( = ?auto_14770 ?auto_14787 ) ) ( not ( = ?auto_14771 ?auto_14787 ) ) ( not ( = ?auto_14770 ?auto_14772 ) ) ( not ( = ?auto_14770 ?auto_14786 ) ) ( not ( = ?auto_14772 ?auto_14787 ) ) ( not ( = ?auto_14782 ?auto_14775 ) ) ( not ( = ?auto_14784 ?auto_14780 ) ) ( not ( = ?auto_14786 ?auto_14787 ) ) ( not ( = ?auto_14770 ?auto_14773 ) ) ( not ( = ?auto_14770 ?auto_14785 ) ) ( not ( = ?auto_14771 ?auto_14773 ) ) ( not ( = ?auto_14771 ?auto_14785 ) ) ( not ( = ?auto_14773 ?auto_14786 ) ) ( not ( = ?auto_14773 ?auto_14787 ) ) ( not ( = ?auto_14783 ?auto_14782 ) ) ( not ( = ?auto_14783 ?auto_14775 ) ) ( not ( = ?auto_14781 ?auto_14784 ) ) ( not ( = ?auto_14781 ?auto_14780 ) ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( not ( = ?auto_14785 ?auto_14787 ) ) ( not ( = ?auto_14770 ?auto_14774 ) ) ( not ( = ?auto_14770 ?auto_14777 ) ) ( not ( = ?auto_14771 ?auto_14774 ) ) ( not ( = ?auto_14771 ?auto_14777 ) ) ( not ( = ?auto_14772 ?auto_14774 ) ) ( not ( = ?auto_14772 ?auto_14777 ) ) ( not ( = ?auto_14774 ?auto_14785 ) ) ( not ( = ?auto_14774 ?auto_14786 ) ) ( not ( = ?auto_14774 ?auto_14787 ) ) ( not ( = ?auto_14777 ?auto_14785 ) ) ( not ( = ?auto_14777 ?auto_14786 ) ) ( not ( = ?auto_14777 ?auto_14787 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_14770 ?auto_14771 ?auto_14772 ?auto_14773 )
      ( MAKE-1CRATE ?auto_14773 ?auto_14774 )
      ( MAKE-4CRATE-VERIFY ?auto_14770 ?auto_14771 ?auto_14772 ?auto_14773 ?auto_14774 ) )
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
      ?auto_14810 - HOIST
      ?auto_14815 - PLACE
      ?auto_14814 - PLACE
      ?auto_14811 - HOIST
      ?auto_14812 - SURFACE
      ?auto_14822 - PLACE
      ?auto_14817 - HOIST
      ?auto_14819 - SURFACE
      ?auto_14820 - PLACE
      ?auto_14816 - HOIST
      ?auto_14821 - SURFACE
      ?auto_14818 - PLACE
      ?auto_14823 - HOIST
      ?auto_14825 - SURFACE
      ?auto_14824 - SURFACE
      ?auto_14813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14810 ?auto_14815 ) ( IS-CRATE ?auto_14809 ) ( not ( = ?auto_14814 ?auto_14815 ) ) ( HOIST-AT ?auto_14811 ?auto_14814 ) ( AVAILABLE ?auto_14811 ) ( SURFACE-AT ?auto_14809 ?auto_14814 ) ( ON ?auto_14809 ?auto_14812 ) ( CLEAR ?auto_14809 ) ( not ( = ?auto_14808 ?auto_14809 ) ) ( not ( = ?auto_14808 ?auto_14812 ) ) ( not ( = ?auto_14809 ?auto_14812 ) ) ( not ( = ?auto_14810 ?auto_14811 ) ) ( IS-CRATE ?auto_14808 ) ( not ( = ?auto_14822 ?auto_14815 ) ) ( HOIST-AT ?auto_14817 ?auto_14822 ) ( SURFACE-AT ?auto_14808 ?auto_14822 ) ( ON ?auto_14808 ?auto_14819 ) ( CLEAR ?auto_14808 ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14807 ?auto_14819 ) ) ( not ( = ?auto_14808 ?auto_14819 ) ) ( not ( = ?auto_14810 ?auto_14817 ) ) ( IS-CRATE ?auto_14807 ) ( not ( = ?auto_14820 ?auto_14815 ) ) ( HOIST-AT ?auto_14816 ?auto_14820 ) ( AVAILABLE ?auto_14816 ) ( SURFACE-AT ?auto_14807 ?auto_14820 ) ( ON ?auto_14807 ?auto_14821 ) ( CLEAR ?auto_14807 ) ( not ( = ?auto_14806 ?auto_14807 ) ) ( not ( = ?auto_14806 ?auto_14821 ) ) ( not ( = ?auto_14807 ?auto_14821 ) ) ( not ( = ?auto_14810 ?auto_14816 ) ) ( IS-CRATE ?auto_14806 ) ( not ( = ?auto_14818 ?auto_14815 ) ) ( HOIST-AT ?auto_14823 ?auto_14818 ) ( AVAILABLE ?auto_14823 ) ( SURFACE-AT ?auto_14806 ?auto_14818 ) ( ON ?auto_14806 ?auto_14825 ) ( CLEAR ?auto_14806 ) ( not ( = ?auto_14805 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14825 ) ) ( not ( = ?auto_14806 ?auto_14825 ) ) ( not ( = ?auto_14810 ?auto_14823 ) ) ( SURFACE-AT ?auto_14804 ?auto_14815 ) ( CLEAR ?auto_14804 ) ( IS-CRATE ?auto_14805 ) ( AVAILABLE ?auto_14810 ) ( AVAILABLE ?auto_14817 ) ( SURFACE-AT ?auto_14805 ?auto_14822 ) ( ON ?auto_14805 ?auto_14824 ) ( CLEAR ?auto_14805 ) ( TRUCK-AT ?auto_14813 ?auto_14815 ) ( not ( = ?auto_14804 ?auto_14805 ) ) ( not ( = ?auto_14804 ?auto_14824 ) ) ( not ( = ?auto_14805 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14806 ) ) ( not ( = ?auto_14804 ?auto_14825 ) ) ( not ( = ?auto_14806 ?auto_14824 ) ) ( not ( = ?auto_14818 ?auto_14822 ) ) ( not ( = ?auto_14823 ?auto_14817 ) ) ( not ( = ?auto_14825 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14807 ) ) ( not ( = ?auto_14804 ?auto_14821 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14805 ?auto_14821 ) ) ( not ( = ?auto_14807 ?auto_14825 ) ) ( not ( = ?auto_14807 ?auto_14824 ) ) ( not ( = ?auto_14820 ?auto_14818 ) ) ( not ( = ?auto_14820 ?auto_14822 ) ) ( not ( = ?auto_14816 ?auto_14823 ) ) ( not ( = ?auto_14816 ?auto_14817 ) ) ( not ( = ?auto_14821 ?auto_14825 ) ) ( not ( = ?auto_14821 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14808 ) ) ( not ( = ?auto_14804 ?auto_14819 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14819 ) ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14806 ?auto_14819 ) ) ( not ( = ?auto_14808 ?auto_14821 ) ) ( not ( = ?auto_14808 ?auto_14825 ) ) ( not ( = ?auto_14808 ?auto_14824 ) ) ( not ( = ?auto_14819 ?auto_14821 ) ) ( not ( = ?auto_14819 ?auto_14825 ) ) ( not ( = ?auto_14819 ?auto_14824 ) ) ( not ( = ?auto_14804 ?auto_14809 ) ) ( not ( = ?auto_14804 ?auto_14812 ) ) ( not ( = ?auto_14805 ?auto_14809 ) ) ( not ( = ?auto_14805 ?auto_14812 ) ) ( not ( = ?auto_14806 ?auto_14809 ) ) ( not ( = ?auto_14806 ?auto_14812 ) ) ( not ( = ?auto_14807 ?auto_14809 ) ) ( not ( = ?auto_14807 ?auto_14812 ) ) ( not ( = ?auto_14809 ?auto_14819 ) ) ( not ( = ?auto_14809 ?auto_14821 ) ) ( not ( = ?auto_14809 ?auto_14825 ) ) ( not ( = ?auto_14809 ?auto_14824 ) ) ( not ( = ?auto_14814 ?auto_14822 ) ) ( not ( = ?auto_14814 ?auto_14820 ) ) ( not ( = ?auto_14814 ?auto_14818 ) ) ( not ( = ?auto_14811 ?auto_14817 ) ) ( not ( = ?auto_14811 ?auto_14816 ) ) ( not ( = ?auto_14811 ?auto_14823 ) ) ( not ( = ?auto_14812 ?auto_14819 ) ) ( not ( = ?auto_14812 ?auto_14821 ) ) ( not ( = ?auto_14812 ?auto_14825 ) ) ( not ( = ?auto_14812 ?auto_14824 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_14804 ?auto_14805 ?auto_14806 ?auto_14807 ?auto_14808 )
      ( MAKE-1CRATE ?auto_14808 ?auto_14809 )
      ( MAKE-5CRATE-VERIFY ?auto_14804 ?auto_14805 ?auto_14806 ?auto_14807 ?auto_14808 ?auto_14809 ) )
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
      ?auto_14855 - HOIST
      ?auto_14854 - PLACE
      ?auto_14850 - PLACE
      ?auto_14851 - HOIST
      ?auto_14852 - SURFACE
      ?auto_14859 - PLACE
      ?auto_14858 - HOIST
      ?auto_14863 - SURFACE
      ?auto_14862 - SURFACE
      ?auto_14860 - PLACE
      ?auto_14861 - HOIST
      ?auto_14857 - SURFACE
      ?auto_14856 - PLACE
      ?auto_14865 - HOIST
      ?auto_14866 - SURFACE
      ?auto_14864 - SURFACE
      ?auto_14853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14855 ?auto_14854 ) ( IS-CRATE ?auto_14849 ) ( not ( = ?auto_14850 ?auto_14854 ) ) ( HOIST-AT ?auto_14851 ?auto_14850 ) ( SURFACE-AT ?auto_14849 ?auto_14850 ) ( ON ?auto_14849 ?auto_14852 ) ( CLEAR ?auto_14849 ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( not ( = ?auto_14848 ?auto_14852 ) ) ( not ( = ?auto_14849 ?auto_14852 ) ) ( not ( = ?auto_14855 ?auto_14851 ) ) ( IS-CRATE ?auto_14848 ) ( not ( = ?auto_14859 ?auto_14854 ) ) ( HOIST-AT ?auto_14858 ?auto_14859 ) ( AVAILABLE ?auto_14858 ) ( SURFACE-AT ?auto_14848 ?auto_14859 ) ( ON ?auto_14848 ?auto_14863 ) ( CLEAR ?auto_14848 ) ( not ( = ?auto_14847 ?auto_14848 ) ) ( not ( = ?auto_14847 ?auto_14863 ) ) ( not ( = ?auto_14848 ?auto_14863 ) ) ( not ( = ?auto_14855 ?auto_14858 ) ) ( IS-CRATE ?auto_14847 ) ( SURFACE-AT ?auto_14847 ?auto_14850 ) ( ON ?auto_14847 ?auto_14862 ) ( CLEAR ?auto_14847 ) ( not ( = ?auto_14846 ?auto_14847 ) ) ( not ( = ?auto_14846 ?auto_14862 ) ) ( not ( = ?auto_14847 ?auto_14862 ) ) ( IS-CRATE ?auto_14846 ) ( not ( = ?auto_14860 ?auto_14854 ) ) ( HOIST-AT ?auto_14861 ?auto_14860 ) ( AVAILABLE ?auto_14861 ) ( SURFACE-AT ?auto_14846 ?auto_14860 ) ( ON ?auto_14846 ?auto_14857 ) ( CLEAR ?auto_14846 ) ( not ( = ?auto_14845 ?auto_14846 ) ) ( not ( = ?auto_14845 ?auto_14857 ) ) ( not ( = ?auto_14846 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14861 ) ) ( IS-CRATE ?auto_14845 ) ( not ( = ?auto_14856 ?auto_14854 ) ) ( HOIST-AT ?auto_14865 ?auto_14856 ) ( AVAILABLE ?auto_14865 ) ( SURFACE-AT ?auto_14845 ?auto_14856 ) ( ON ?auto_14845 ?auto_14866 ) ( CLEAR ?auto_14845 ) ( not ( = ?auto_14844 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14866 ) ) ( not ( = ?auto_14845 ?auto_14866 ) ) ( not ( = ?auto_14855 ?auto_14865 ) ) ( SURFACE-AT ?auto_14843 ?auto_14854 ) ( CLEAR ?auto_14843 ) ( IS-CRATE ?auto_14844 ) ( AVAILABLE ?auto_14855 ) ( AVAILABLE ?auto_14851 ) ( SURFACE-AT ?auto_14844 ?auto_14850 ) ( ON ?auto_14844 ?auto_14864 ) ( CLEAR ?auto_14844 ) ( TRUCK-AT ?auto_14853 ?auto_14854 ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14864 ) ) ( not ( = ?auto_14844 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14866 ) ) ( not ( = ?auto_14845 ?auto_14864 ) ) ( not ( = ?auto_14856 ?auto_14850 ) ) ( not ( = ?auto_14865 ?auto_14851 ) ) ( not ( = ?auto_14866 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14846 ) ) ( not ( = ?auto_14843 ?auto_14857 ) ) ( not ( = ?auto_14844 ?auto_14846 ) ) ( not ( = ?auto_14844 ?auto_14857 ) ) ( not ( = ?auto_14846 ?auto_14866 ) ) ( not ( = ?auto_14846 ?auto_14864 ) ) ( not ( = ?auto_14860 ?auto_14856 ) ) ( not ( = ?auto_14860 ?auto_14850 ) ) ( not ( = ?auto_14861 ?auto_14865 ) ) ( not ( = ?auto_14861 ?auto_14851 ) ) ( not ( = ?auto_14857 ?auto_14866 ) ) ( not ( = ?auto_14857 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14847 ) ) ( not ( = ?auto_14843 ?auto_14862 ) ) ( not ( = ?auto_14844 ?auto_14847 ) ) ( not ( = ?auto_14844 ?auto_14862 ) ) ( not ( = ?auto_14845 ?auto_14847 ) ) ( not ( = ?auto_14845 ?auto_14862 ) ) ( not ( = ?auto_14847 ?auto_14857 ) ) ( not ( = ?auto_14847 ?auto_14866 ) ) ( not ( = ?auto_14847 ?auto_14864 ) ) ( not ( = ?auto_14862 ?auto_14857 ) ) ( not ( = ?auto_14862 ?auto_14866 ) ) ( not ( = ?auto_14862 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14848 ) ) ( not ( = ?auto_14843 ?auto_14863 ) ) ( not ( = ?auto_14844 ?auto_14848 ) ) ( not ( = ?auto_14844 ?auto_14863 ) ) ( not ( = ?auto_14845 ?auto_14848 ) ) ( not ( = ?auto_14845 ?auto_14863 ) ) ( not ( = ?auto_14846 ?auto_14848 ) ) ( not ( = ?auto_14846 ?auto_14863 ) ) ( not ( = ?auto_14848 ?auto_14862 ) ) ( not ( = ?auto_14848 ?auto_14857 ) ) ( not ( = ?auto_14848 ?auto_14866 ) ) ( not ( = ?auto_14848 ?auto_14864 ) ) ( not ( = ?auto_14859 ?auto_14850 ) ) ( not ( = ?auto_14859 ?auto_14860 ) ) ( not ( = ?auto_14859 ?auto_14856 ) ) ( not ( = ?auto_14858 ?auto_14851 ) ) ( not ( = ?auto_14858 ?auto_14861 ) ) ( not ( = ?auto_14858 ?auto_14865 ) ) ( not ( = ?auto_14863 ?auto_14862 ) ) ( not ( = ?auto_14863 ?auto_14857 ) ) ( not ( = ?auto_14863 ?auto_14866 ) ) ( not ( = ?auto_14863 ?auto_14864 ) ) ( not ( = ?auto_14843 ?auto_14849 ) ) ( not ( = ?auto_14843 ?auto_14852 ) ) ( not ( = ?auto_14844 ?auto_14849 ) ) ( not ( = ?auto_14844 ?auto_14852 ) ) ( not ( = ?auto_14845 ?auto_14849 ) ) ( not ( = ?auto_14845 ?auto_14852 ) ) ( not ( = ?auto_14846 ?auto_14849 ) ) ( not ( = ?auto_14846 ?auto_14852 ) ) ( not ( = ?auto_14847 ?auto_14849 ) ) ( not ( = ?auto_14847 ?auto_14852 ) ) ( not ( = ?auto_14849 ?auto_14863 ) ) ( not ( = ?auto_14849 ?auto_14862 ) ) ( not ( = ?auto_14849 ?auto_14857 ) ) ( not ( = ?auto_14849 ?auto_14866 ) ) ( not ( = ?auto_14849 ?auto_14864 ) ) ( not ( = ?auto_14852 ?auto_14863 ) ) ( not ( = ?auto_14852 ?auto_14862 ) ) ( not ( = ?auto_14852 ?auto_14857 ) ) ( not ( = ?auto_14852 ?auto_14866 ) ) ( not ( = ?auto_14852 ?auto_14864 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_14843 ?auto_14844 ?auto_14845 ?auto_14846 ?auto_14847 ?auto_14848 )
      ( MAKE-1CRATE ?auto_14848 ?auto_14849 )
      ( MAKE-6CRATE-VERIFY ?auto_14843 ?auto_14844 ?auto_14845 ?auto_14846 ?auto_14847 ?auto_14848 ?auto_14849 ) )
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
      ?auto_14895 - HOIST
      ?auto_14896 - PLACE
      ?auto_14894 - PLACE
      ?auto_14893 - HOIST
      ?auto_14897 - SURFACE
      ?auto_14909 - PLACE
      ?auto_14900 - HOIST
      ?auto_14910 - SURFACE
      ?auto_14906 - PLACE
      ?auto_14902 - HOIST
      ?auto_14901 - SURFACE
      ?auto_14904 - SURFACE
      ?auto_14903 - PLACE
      ?auto_14912 - HOIST
      ?auto_14907 - SURFACE
      ?auto_14899 - PLACE
      ?auto_14908 - HOIST
      ?auto_14905 - SURFACE
      ?auto_14911 - SURFACE
      ?auto_14898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14895 ?auto_14896 ) ( IS-CRATE ?auto_14892 ) ( not ( = ?auto_14894 ?auto_14896 ) ) ( HOIST-AT ?auto_14893 ?auto_14894 ) ( AVAILABLE ?auto_14893 ) ( SURFACE-AT ?auto_14892 ?auto_14894 ) ( ON ?auto_14892 ?auto_14897 ) ( CLEAR ?auto_14892 ) ( not ( = ?auto_14891 ?auto_14892 ) ) ( not ( = ?auto_14891 ?auto_14897 ) ) ( not ( = ?auto_14892 ?auto_14897 ) ) ( not ( = ?auto_14895 ?auto_14893 ) ) ( IS-CRATE ?auto_14891 ) ( not ( = ?auto_14909 ?auto_14896 ) ) ( HOIST-AT ?auto_14900 ?auto_14909 ) ( SURFACE-AT ?auto_14891 ?auto_14909 ) ( ON ?auto_14891 ?auto_14910 ) ( CLEAR ?auto_14891 ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14910 ) ) ( not ( = ?auto_14891 ?auto_14910 ) ) ( not ( = ?auto_14895 ?auto_14900 ) ) ( IS-CRATE ?auto_14890 ) ( not ( = ?auto_14906 ?auto_14896 ) ) ( HOIST-AT ?auto_14902 ?auto_14906 ) ( AVAILABLE ?auto_14902 ) ( SURFACE-AT ?auto_14890 ?auto_14906 ) ( ON ?auto_14890 ?auto_14901 ) ( CLEAR ?auto_14890 ) ( not ( = ?auto_14889 ?auto_14890 ) ) ( not ( = ?auto_14889 ?auto_14901 ) ) ( not ( = ?auto_14890 ?auto_14901 ) ) ( not ( = ?auto_14895 ?auto_14902 ) ) ( IS-CRATE ?auto_14889 ) ( SURFACE-AT ?auto_14889 ?auto_14909 ) ( ON ?auto_14889 ?auto_14904 ) ( CLEAR ?auto_14889 ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14904 ) ) ( not ( = ?auto_14889 ?auto_14904 ) ) ( IS-CRATE ?auto_14888 ) ( not ( = ?auto_14903 ?auto_14896 ) ) ( HOIST-AT ?auto_14912 ?auto_14903 ) ( AVAILABLE ?auto_14912 ) ( SURFACE-AT ?auto_14888 ?auto_14903 ) ( ON ?auto_14888 ?auto_14907 ) ( CLEAR ?auto_14888 ) ( not ( = ?auto_14887 ?auto_14888 ) ) ( not ( = ?auto_14887 ?auto_14907 ) ) ( not ( = ?auto_14888 ?auto_14907 ) ) ( not ( = ?auto_14895 ?auto_14912 ) ) ( IS-CRATE ?auto_14887 ) ( not ( = ?auto_14899 ?auto_14896 ) ) ( HOIST-AT ?auto_14908 ?auto_14899 ) ( AVAILABLE ?auto_14908 ) ( SURFACE-AT ?auto_14887 ?auto_14899 ) ( ON ?auto_14887 ?auto_14905 ) ( CLEAR ?auto_14887 ) ( not ( = ?auto_14886 ?auto_14887 ) ) ( not ( = ?auto_14886 ?auto_14905 ) ) ( not ( = ?auto_14887 ?auto_14905 ) ) ( not ( = ?auto_14895 ?auto_14908 ) ) ( SURFACE-AT ?auto_14885 ?auto_14896 ) ( CLEAR ?auto_14885 ) ( IS-CRATE ?auto_14886 ) ( AVAILABLE ?auto_14895 ) ( AVAILABLE ?auto_14900 ) ( SURFACE-AT ?auto_14886 ?auto_14909 ) ( ON ?auto_14886 ?auto_14911 ) ( CLEAR ?auto_14886 ) ( TRUCK-AT ?auto_14898 ?auto_14896 ) ( not ( = ?auto_14885 ?auto_14886 ) ) ( not ( = ?auto_14885 ?auto_14911 ) ) ( not ( = ?auto_14886 ?auto_14911 ) ) ( not ( = ?auto_14885 ?auto_14887 ) ) ( not ( = ?auto_14885 ?auto_14905 ) ) ( not ( = ?auto_14887 ?auto_14911 ) ) ( not ( = ?auto_14899 ?auto_14909 ) ) ( not ( = ?auto_14908 ?auto_14900 ) ) ( not ( = ?auto_14905 ?auto_14911 ) ) ( not ( = ?auto_14885 ?auto_14888 ) ) ( not ( = ?auto_14885 ?auto_14907 ) ) ( not ( = ?auto_14886 ?auto_14888 ) ) ( not ( = ?auto_14886 ?auto_14907 ) ) ( not ( = ?auto_14888 ?auto_14905 ) ) ( not ( = ?auto_14888 ?auto_14911 ) ) ( not ( = ?auto_14903 ?auto_14899 ) ) ( not ( = ?auto_14903 ?auto_14909 ) ) ( not ( = ?auto_14912 ?auto_14908 ) ) ( not ( = ?auto_14912 ?auto_14900 ) ) ( not ( = ?auto_14907 ?auto_14905 ) ) ( not ( = ?auto_14907 ?auto_14911 ) ) ( not ( = ?auto_14885 ?auto_14889 ) ) ( not ( = ?auto_14885 ?auto_14904 ) ) ( not ( = ?auto_14886 ?auto_14889 ) ) ( not ( = ?auto_14886 ?auto_14904 ) ) ( not ( = ?auto_14887 ?auto_14889 ) ) ( not ( = ?auto_14887 ?auto_14904 ) ) ( not ( = ?auto_14889 ?auto_14907 ) ) ( not ( = ?auto_14889 ?auto_14905 ) ) ( not ( = ?auto_14889 ?auto_14911 ) ) ( not ( = ?auto_14904 ?auto_14907 ) ) ( not ( = ?auto_14904 ?auto_14905 ) ) ( not ( = ?auto_14904 ?auto_14911 ) ) ( not ( = ?auto_14885 ?auto_14890 ) ) ( not ( = ?auto_14885 ?auto_14901 ) ) ( not ( = ?auto_14886 ?auto_14890 ) ) ( not ( = ?auto_14886 ?auto_14901 ) ) ( not ( = ?auto_14887 ?auto_14890 ) ) ( not ( = ?auto_14887 ?auto_14901 ) ) ( not ( = ?auto_14888 ?auto_14890 ) ) ( not ( = ?auto_14888 ?auto_14901 ) ) ( not ( = ?auto_14890 ?auto_14904 ) ) ( not ( = ?auto_14890 ?auto_14907 ) ) ( not ( = ?auto_14890 ?auto_14905 ) ) ( not ( = ?auto_14890 ?auto_14911 ) ) ( not ( = ?auto_14906 ?auto_14909 ) ) ( not ( = ?auto_14906 ?auto_14903 ) ) ( not ( = ?auto_14906 ?auto_14899 ) ) ( not ( = ?auto_14902 ?auto_14900 ) ) ( not ( = ?auto_14902 ?auto_14912 ) ) ( not ( = ?auto_14902 ?auto_14908 ) ) ( not ( = ?auto_14901 ?auto_14904 ) ) ( not ( = ?auto_14901 ?auto_14907 ) ) ( not ( = ?auto_14901 ?auto_14905 ) ) ( not ( = ?auto_14901 ?auto_14911 ) ) ( not ( = ?auto_14885 ?auto_14891 ) ) ( not ( = ?auto_14885 ?auto_14910 ) ) ( not ( = ?auto_14886 ?auto_14891 ) ) ( not ( = ?auto_14886 ?auto_14910 ) ) ( not ( = ?auto_14887 ?auto_14891 ) ) ( not ( = ?auto_14887 ?auto_14910 ) ) ( not ( = ?auto_14888 ?auto_14891 ) ) ( not ( = ?auto_14888 ?auto_14910 ) ) ( not ( = ?auto_14889 ?auto_14891 ) ) ( not ( = ?auto_14889 ?auto_14910 ) ) ( not ( = ?auto_14891 ?auto_14901 ) ) ( not ( = ?auto_14891 ?auto_14904 ) ) ( not ( = ?auto_14891 ?auto_14907 ) ) ( not ( = ?auto_14891 ?auto_14905 ) ) ( not ( = ?auto_14891 ?auto_14911 ) ) ( not ( = ?auto_14910 ?auto_14901 ) ) ( not ( = ?auto_14910 ?auto_14904 ) ) ( not ( = ?auto_14910 ?auto_14907 ) ) ( not ( = ?auto_14910 ?auto_14905 ) ) ( not ( = ?auto_14910 ?auto_14911 ) ) ( not ( = ?auto_14885 ?auto_14892 ) ) ( not ( = ?auto_14885 ?auto_14897 ) ) ( not ( = ?auto_14886 ?auto_14892 ) ) ( not ( = ?auto_14886 ?auto_14897 ) ) ( not ( = ?auto_14887 ?auto_14892 ) ) ( not ( = ?auto_14887 ?auto_14897 ) ) ( not ( = ?auto_14888 ?auto_14892 ) ) ( not ( = ?auto_14888 ?auto_14897 ) ) ( not ( = ?auto_14889 ?auto_14892 ) ) ( not ( = ?auto_14889 ?auto_14897 ) ) ( not ( = ?auto_14890 ?auto_14892 ) ) ( not ( = ?auto_14890 ?auto_14897 ) ) ( not ( = ?auto_14892 ?auto_14910 ) ) ( not ( = ?auto_14892 ?auto_14901 ) ) ( not ( = ?auto_14892 ?auto_14904 ) ) ( not ( = ?auto_14892 ?auto_14907 ) ) ( not ( = ?auto_14892 ?auto_14905 ) ) ( not ( = ?auto_14892 ?auto_14911 ) ) ( not ( = ?auto_14894 ?auto_14909 ) ) ( not ( = ?auto_14894 ?auto_14906 ) ) ( not ( = ?auto_14894 ?auto_14903 ) ) ( not ( = ?auto_14894 ?auto_14899 ) ) ( not ( = ?auto_14893 ?auto_14900 ) ) ( not ( = ?auto_14893 ?auto_14902 ) ) ( not ( = ?auto_14893 ?auto_14912 ) ) ( not ( = ?auto_14893 ?auto_14908 ) ) ( not ( = ?auto_14897 ?auto_14910 ) ) ( not ( = ?auto_14897 ?auto_14901 ) ) ( not ( = ?auto_14897 ?auto_14904 ) ) ( not ( = ?auto_14897 ?auto_14907 ) ) ( not ( = ?auto_14897 ?auto_14905 ) ) ( not ( = ?auto_14897 ?auto_14911 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_14885 ?auto_14886 ?auto_14887 ?auto_14888 ?auto_14889 ?auto_14890 ?auto_14891 )
      ( MAKE-1CRATE ?auto_14891 ?auto_14892 )
      ( MAKE-7CRATE-VERIFY ?auto_14885 ?auto_14886 ?auto_14887 ?auto_14888 ?auto_14889 ?auto_14890 ?auto_14891 ?auto_14892 ) )
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
      ?auto_14939 - SURFACE
      ?auto_14940 - SURFACE
    )
    :vars
    (
      ?auto_14945 - HOIST
      ?auto_14944 - PLACE
      ?auto_14946 - PLACE
      ?auto_14942 - HOIST
      ?auto_14941 - SURFACE
      ?auto_14953 - PLACE
      ?auto_14948 - HOIST
      ?auto_14947 - SURFACE
      ?auto_14956 - PLACE
      ?auto_14954 - HOIST
      ?auto_14959 - SURFACE
      ?auto_14957 - PLACE
      ?auto_14960 - HOIST
      ?auto_14951 - SURFACE
      ?auto_14950 - SURFACE
      ?auto_14961 - SURFACE
      ?auto_14958 - PLACE
      ?auto_14955 - HOIST
      ?auto_14952 - SURFACE
      ?auto_14949 - SURFACE
      ?auto_14943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14945 ?auto_14944 ) ( IS-CRATE ?auto_14940 ) ( not ( = ?auto_14946 ?auto_14944 ) ) ( HOIST-AT ?auto_14942 ?auto_14946 ) ( SURFACE-AT ?auto_14940 ?auto_14946 ) ( ON ?auto_14940 ?auto_14941 ) ( CLEAR ?auto_14940 ) ( not ( = ?auto_14939 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14945 ?auto_14942 ) ) ( IS-CRATE ?auto_14939 ) ( not ( = ?auto_14953 ?auto_14944 ) ) ( HOIST-AT ?auto_14948 ?auto_14953 ) ( AVAILABLE ?auto_14948 ) ( SURFACE-AT ?auto_14939 ?auto_14953 ) ( ON ?auto_14939 ?auto_14947 ) ( CLEAR ?auto_14939 ) ( not ( = ?auto_14938 ?auto_14939 ) ) ( not ( = ?auto_14938 ?auto_14947 ) ) ( not ( = ?auto_14939 ?auto_14947 ) ) ( not ( = ?auto_14945 ?auto_14948 ) ) ( IS-CRATE ?auto_14938 ) ( not ( = ?auto_14956 ?auto_14944 ) ) ( HOIST-AT ?auto_14954 ?auto_14956 ) ( SURFACE-AT ?auto_14938 ?auto_14956 ) ( ON ?auto_14938 ?auto_14959 ) ( CLEAR ?auto_14938 ) ( not ( = ?auto_14937 ?auto_14938 ) ) ( not ( = ?auto_14937 ?auto_14959 ) ) ( not ( = ?auto_14938 ?auto_14959 ) ) ( not ( = ?auto_14945 ?auto_14954 ) ) ( IS-CRATE ?auto_14937 ) ( not ( = ?auto_14957 ?auto_14944 ) ) ( HOIST-AT ?auto_14960 ?auto_14957 ) ( AVAILABLE ?auto_14960 ) ( SURFACE-AT ?auto_14937 ?auto_14957 ) ( ON ?auto_14937 ?auto_14951 ) ( CLEAR ?auto_14937 ) ( not ( = ?auto_14936 ?auto_14937 ) ) ( not ( = ?auto_14936 ?auto_14951 ) ) ( not ( = ?auto_14937 ?auto_14951 ) ) ( not ( = ?auto_14945 ?auto_14960 ) ) ( IS-CRATE ?auto_14936 ) ( SURFACE-AT ?auto_14936 ?auto_14956 ) ( ON ?auto_14936 ?auto_14950 ) ( CLEAR ?auto_14936 ) ( not ( = ?auto_14935 ?auto_14936 ) ) ( not ( = ?auto_14935 ?auto_14950 ) ) ( not ( = ?auto_14936 ?auto_14950 ) ) ( IS-CRATE ?auto_14935 ) ( AVAILABLE ?auto_14942 ) ( SURFACE-AT ?auto_14935 ?auto_14946 ) ( ON ?auto_14935 ?auto_14961 ) ( CLEAR ?auto_14935 ) ( not ( = ?auto_14934 ?auto_14935 ) ) ( not ( = ?auto_14934 ?auto_14961 ) ) ( not ( = ?auto_14935 ?auto_14961 ) ) ( IS-CRATE ?auto_14934 ) ( not ( = ?auto_14958 ?auto_14944 ) ) ( HOIST-AT ?auto_14955 ?auto_14958 ) ( AVAILABLE ?auto_14955 ) ( SURFACE-AT ?auto_14934 ?auto_14958 ) ( ON ?auto_14934 ?auto_14952 ) ( CLEAR ?auto_14934 ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( not ( = ?auto_14933 ?auto_14952 ) ) ( not ( = ?auto_14934 ?auto_14952 ) ) ( not ( = ?auto_14945 ?auto_14955 ) ) ( SURFACE-AT ?auto_14932 ?auto_14944 ) ( CLEAR ?auto_14932 ) ( IS-CRATE ?auto_14933 ) ( AVAILABLE ?auto_14945 ) ( AVAILABLE ?auto_14954 ) ( SURFACE-AT ?auto_14933 ?auto_14956 ) ( ON ?auto_14933 ?auto_14949 ) ( CLEAR ?auto_14933 ) ( TRUCK-AT ?auto_14943 ?auto_14944 ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14949 ) ) ( not ( = ?auto_14933 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14952 ) ) ( not ( = ?auto_14934 ?auto_14949 ) ) ( not ( = ?auto_14958 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14954 ) ) ( not ( = ?auto_14952 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14935 ) ) ( not ( = ?auto_14932 ?auto_14961 ) ) ( not ( = ?auto_14933 ?auto_14935 ) ) ( not ( = ?auto_14933 ?auto_14961 ) ) ( not ( = ?auto_14935 ?auto_14952 ) ) ( not ( = ?auto_14935 ?auto_14949 ) ) ( not ( = ?auto_14946 ?auto_14958 ) ) ( not ( = ?auto_14946 ?auto_14956 ) ) ( not ( = ?auto_14942 ?auto_14955 ) ) ( not ( = ?auto_14942 ?auto_14954 ) ) ( not ( = ?auto_14961 ?auto_14952 ) ) ( not ( = ?auto_14961 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14936 ) ) ( not ( = ?auto_14932 ?auto_14950 ) ) ( not ( = ?auto_14933 ?auto_14936 ) ) ( not ( = ?auto_14933 ?auto_14950 ) ) ( not ( = ?auto_14934 ?auto_14936 ) ) ( not ( = ?auto_14934 ?auto_14950 ) ) ( not ( = ?auto_14936 ?auto_14961 ) ) ( not ( = ?auto_14936 ?auto_14952 ) ) ( not ( = ?auto_14936 ?auto_14949 ) ) ( not ( = ?auto_14950 ?auto_14961 ) ) ( not ( = ?auto_14950 ?auto_14952 ) ) ( not ( = ?auto_14950 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14937 ) ) ( not ( = ?auto_14932 ?auto_14951 ) ) ( not ( = ?auto_14933 ?auto_14937 ) ) ( not ( = ?auto_14933 ?auto_14951 ) ) ( not ( = ?auto_14934 ?auto_14937 ) ) ( not ( = ?auto_14934 ?auto_14951 ) ) ( not ( = ?auto_14935 ?auto_14937 ) ) ( not ( = ?auto_14935 ?auto_14951 ) ) ( not ( = ?auto_14937 ?auto_14950 ) ) ( not ( = ?auto_14937 ?auto_14961 ) ) ( not ( = ?auto_14937 ?auto_14952 ) ) ( not ( = ?auto_14937 ?auto_14949 ) ) ( not ( = ?auto_14957 ?auto_14956 ) ) ( not ( = ?auto_14957 ?auto_14946 ) ) ( not ( = ?auto_14957 ?auto_14958 ) ) ( not ( = ?auto_14960 ?auto_14954 ) ) ( not ( = ?auto_14960 ?auto_14942 ) ) ( not ( = ?auto_14960 ?auto_14955 ) ) ( not ( = ?auto_14951 ?auto_14950 ) ) ( not ( = ?auto_14951 ?auto_14961 ) ) ( not ( = ?auto_14951 ?auto_14952 ) ) ( not ( = ?auto_14951 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14938 ) ) ( not ( = ?auto_14932 ?auto_14959 ) ) ( not ( = ?auto_14933 ?auto_14938 ) ) ( not ( = ?auto_14933 ?auto_14959 ) ) ( not ( = ?auto_14934 ?auto_14938 ) ) ( not ( = ?auto_14934 ?auto_14959 ) ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( not ( = ?auto_14935 ?auto_14959 ) ) ( not ( = ?auto_14936 ?auto_14938 ) ) ( not ( = ?auto_14936 ?auto_14959 ) ) ( not ( = ?auto_14938 ?auto_14951 ) ) ( not ( = ?auto_14938 ?auto_14950 ) ) ( not ( = ?auto_14938 ?auto_14961 ) ) ( not ( = ?auto_14938 ?auto_14952 ) ) ( not ( = ?auto_14938 ?auto_14949 ) ) ( not ( = ?auto_14959 ?auto_14951 ) ) ( not ( = ?auto_14959 ?auto_14950 ) ) ( not ( = ?auto_14959 ?auto_14961 ) ) ( not ( = ?auto_14959 ?auto_14952 ) ) ( not ( = ?auto_14959 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14939 ) ) ( not ( = ?auto_14932 ?auto_14947 ) ) ( not ( = ?auto_14933 ?auto_14939 ) ) ( not ( = ?auto_14933 ?auto_14947 ) ) ( not ( = ?auto_14934 ?auto_14939 ) ) ( not ( = ?auto_14934 ?auto_14947 ) ) ( not ( = ?auto_14935 ?auto_14939 ) ) ( not ( = ?auto_14935 ?auto_14947 ) ) ( not ( = ?auto_14936 ?auto_14939 ) ) ( not ( = ?auto_14936 ?auto_14947 ) ) ( not ( = ?auto_14937 ?auto_14939 ) ) ( not ( = ?auto_14937 ?auto_14947 ) ) ( not ( = ?auto_14939 ?auto_14959 ) ) ( not ( = ?auto_14939 ?auto_14951 ) ) ( not ( = ?auto_14939 ?auto_14950 ) ) ( not ( = ?auto_14939 ?auto_14961 ) ) ( not ( = ?auto_14939 ?auto_14952 ) ) ( not ( = ?auto_14939 ?auto_14949 ) ) ( not ( = ?auto_14953 ?auto_14956 ) ) ( not ( = ?auto_14953 ?auto_14957 ) ) ( not ( = ?auto_14953 ?auto_14946 ) ) ( not ( = ?auto_14953 ?auto_14958 ) ) ( not ( = ?auto_14948 ?auto_14954 ) ) ( not ( = ?auto_14948 ?auto_14960 ) ) ( not ( = ?auto_14948 ?auto_14942 ) ) ( not ( = ?auto_14948 ?auto_14955 ) ) ( not ( = ?auto_14947 ?auto_14959 ) ) ( not ( = ?auto_14947 ?auto_14951 ) ) ( not ( = ?auto_14947 ?auto_14950 ) ) ( not ( = ?auto_14947 ?auto_14961 ) ) ( not ( = ?auto_14947 ?auto_14952 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14932 ?auto_14940 ) ) ( not ( = ?auto_14932 ?auto_14941 ) ) ( not ( = ?auto_14933 ?auto_14940 ) ) ( not ( = ?auto_14933 ?auto_14941 ) ) ( not ( = ?auto_14934 ?auto_14940 ) ) ( not ( = ?auto_14934 ?auto_14941 ) ) ( not ( = ?auto_14935 ?auto_14940 ) ) ( not ( = ?auto_14935 ?auto_14941 ) ) ( not ( = ?auto_14936 ?auto_14940 ) ) ( not ( = ?auto_14936 ?auto_14941 ) ) ( not ( = ?auto_14937 ?auto_14940 ) ) ( not ( = ?auto_14937 ?auto_14941 ) ) ( not ( = ?auto_14938 ?auto_14940 ) ) ( not ( = ?auto_14938 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14947 ) ) ( not ( = ?auto_14940 ?auto_14959 ) ) ( not ( = ?auto_14940 ?auto_14951 ) ) ( not ( = ?auto_14940 ?auto_14950 ) ) ( not ( = ?auto_14940 ?auto_14961 ) ) ( not ( = ?auto_14940 ?auto_14952 ) ) ( not ( = ?auto_14940 ?auto_14949 ) ) ( not ( = ?auto_14941 ?auto_14947 ) ) ( not ( = ?auto_14941 ?auto_14959 ) ) ( not ( = ?auto_14941 ?auto_14951 ) ) ( not ( = ?auto_14941 ?auto_14950 ) ) ( not ( = ?auto_14941 ?auto_14961 ) ) ( not ( = ?auto_14941 ?auto_14952 ) ) ( not ( = ?auto_14941 ?auto_14949 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ?auto_14938 ?auto_14939 )
      ( MAKE-1CRATE ?auto_14939 ?auto_14940 )
      ( MAKE-8CRATE-VERIFY ?auto_14932 ?auto_14933 ?auto_14934 ?auto_14935 ?auto_14936 ?auto_14937 ?auto_14938 ?auto_14939 ?auto_14940 ) )
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
      ?auto_14989 - SURFACE
      ?auto_14990 - SURFACE
      ?auto_14991 - SURFACE
    )
    :vars
    (
      ?auto_14993 - HOIST
      ?auto_14992 - PLACE
      ?auto_14995 - PLACE
      ?auto_14996 - HOIST
      ?auto_14997 - SURFACE
      ?auto_15010 - PLACE
      ?auto_15008 - HOIST
      ?auto_15009 - SURFACE
      ?auto_15013 - PLACE
      ?auto_14998 - HOIST
      ?auto_15003 - SURFACE
      ?auto_15001 - PLACE
      ?auto_15005 - HOIST
      ?auto_15011 - SURFACE
      ?auto_14999 - SURFACE
      ?auto_15007 - SURFACE
      ?auto_15002 - SURFACE
      ?auto_15012 - PLACE
      ?auto_15004 - HOIST
      ?auto_15000 - SURFACE
      ?auto_15006 - SURFACE
      ?auto_14994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14993 ?auto_14992 ) ( IS-CRATE ?auto_14991 ) ( not ( = ?auto_14995 ?auto_14992 ) ) ( HOIST-AT ?auto_14996 ?auto_14995 ) ( SURFACE-AT ?auto_14991 ?auto_14995 ) ( ON ?auto_14991 ?auto_14997 ) ( CLEAR ?auto_14991 ) ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14990 ?auto_14997 ) ) ( not ( = ?auto_14991 ?auto_14997 ) ) ( not ( = ?auto_14993 ?auto_14996 ) ) ( IS-CRATE ?auto_14990 ) ( not ( = ?auto_15010 ?auto_14992 ) ) ( HOIST-AT ?auto_15008 ?auto_15010 ) ( SURFACE-AT ?auto_14990 ?auto_15010 ) ( ON ?auto_14990 ?auto_15009 ) ( CLEAR ?auto_14990 ) ( not ( = ?auto_14989 ?auto_14990 ) ) ( not ( = ?auto_14989 ?auto_15009 ) ) ( not ( = ?auto_14990 ?auto_15009 ) ) ( not ( = ?auto_14993 ?auto_15008 ) ) ( IS-CRATE ?auto_14989 ) ( not ( = ?auto_15013 ?auto_14992 ) ) ( HOIST-AT ?auto_14998 ?auto_15013 ) ( AVAILABLE ?auto_14998 ) ( SURFACE-AT ?auto_14989 ?auto_15013 ) ( ON ?auto_14989 ?auto_15003 ) ( CLEAR ?auto_14989 ) ( not ( = ?auto_14988 ?auto_14989 ) ) ( not ( = ?auto_14988 ?auto_15003 ) ) ( not ( = ?auto_14989 ?auto_15003 ) ) ( not ( = ?auto_14993 ?auto_14998 ) ) ( IS-CRATE ?auto_14988 ) ( not ( = ?auto_15001 ?auto_14992 ) ) ( HOIST-AT ?auto_15005 ?auto_15001 ) ( SURFACE-AT ?auto_14988 ?auto_15001 ) ( ON ?auto_14988 ?auto_15011 ) ( CLEAR ?auto_14988 ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( not ( = ?auto_14987 ?auto_15011 ) ) ( not ( = ?auto_14988 ?auto_15011 ) ) ( not ( = ?auto_14993 ?auto_15005 ) ) ( IS-CRATE ?auto_14987 ) ( AVAILABLE ?auto_14996 ) ( SURFACE-AT ?auto_14987 ?auto_14995 ) ( ON ?auto_14987 ?auto_14999 ) ( CLEAR ?auto_14987 ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_14999 ) ) ( not ( = ?auto_14987 ?auto_14999 ) ) ( IS-CRATE ?auto_14986 ) ( SURFACE-AT ?auto_14986 ?auto_15001 ) ( ON ?auto_14986 ?auto_15007 ) ( CLEAR ?auto_14986 ) ( not ( = ?auto_14985 ?auto_14986 ) ) ( not ( = ?auto_14985 ?auto_15007 ) ) ( not ( = ?auto_14986 ?auto_15007 ) ) ( IS-CRATE ?auto_14985 ) ( AVAILABLE ?auto_15008 ) ( SURFACE-AT ?auto_14985 ?auto_15010 ) ( ON ?auto_14985 ?auto_15002 ) ( CLEAR ?auto_14985 ) ( not ( = ?auto_14984 ?auto_14985 ) ) ( not ( = ?auto_14984 ?auto_15002 ) ) ( not ( = ?auto_14985 ?auto_15002 ) ) ( IS-CRATE ?auto_14984 ) ( not ( = ?auto_15012 ?auto_14992 ) ) ( HOIST-AT ?auto_15004 ?auto_15012 ) ( AVAILABLE ?auto_15004 ) ( SURFACE-AT ?auto_14984 ?auto_15012 ) ( ON ?auto_14984 ?auto_15000 ) ( CLEAR ?auto_14984 ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_15000 ) ) ( not ( = ?auto_14984 ?auto_15000 ) ) ( not ( = ?auto_14993 ?auto_15004 ) ) ( SURFACE-AT ?auto_14982 ?auto_14992 ) ( CLEAR ?auto_14982 ) ( IS-CRATE ?auto_14983 ) ( AVAILABLE ?auto_14993 ) ( AVAILABLE ?auto_15005 ) ( SURFACE-AT ?auto_14983 ?auto_15001 ) ( ON ?auto_14983 ?auto_15006 ) ( CLEAR ?auto_14983 ) ( TRUCK-AT ?auto_14994 ?auto_14992 ) ( not ( = ?auto_14982 ?auto_14983 ) ) ( not ( = ?auto_14982 ?auto_15006 ) ) ( not ( = ?auto_14983 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14984 ) ) ( not ( = ?auto_14982 ?auto_15000 ) ) ( not ( = ?auto_14984 ?auto_15006 ) ) ( not ( = ?auto_15012 ?auto_15001 ) ) ( not ( = ?auto_15004 ?auto_15005 ) ) ( not ( = ?auto_15000 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14985 ) ) ( not ( = ?auto_14982 ?auto_15002 ) ) ( not ( = ?auto_14983 ?auto_14985 ) ) ( not ( = ?auto_14983 ?auto_15002 ) ) ( not ( = ?auto_14985 ?auto_15000 ) ) ( not ( = ?auto_14985 ?auto_15006 ) ) ( not ( = ?auto_15010 ?auto_15012 ) ) ( not ( = ?auto_15010 ?auto_15001 ) ) ( not ( = ?auto_15008 ?auto_15004 ) ) ( not ( = ?auto_15008 ?auto_15005 ) ) ( not ( = ?auto_15002 ?auto_15000 ) ) ( not ( = ?auto_15002 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14986 ) ) ( not ( = ?auto_14982 ?auto_15007 ) ) ( not ( = ?auto_14983 ?auto_14986 ) ) ( not ( = ?auto_14983 ?auto_15007 ) ) ( not ( = ?auto_14984 ?auto_14986 ) ) ( not ( = ?auto_14984 ?auto_15007 ) ) ( not ( = ?auto_14986 ?auto_15002 ) ) ( not ( = ?auto_14986 ?auto_15000 ) ) ( not ( = ?auto_14986 ?auto_15006 ) ) ( not ( = ?auto_15007 ?auto_15002 ) ) ( not ( = ?auto_15007 ?auto_15000 ) ) ( not ( = ?auto_15007 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14987 ) ) ( not ( = ?auto_14982 ?auto_14999 ) ) ( not ( = ?auto_14983 ?auto_14987 ) ) ( not ( = ?auto_14983 ?auto_14999 ) ) ( not ( = ?auto_14984 ?auto_14987 ) ) ( not ( = ?auto_14984 ?auto_14999 ) ) ( not ( = ?auto_14985 ?auto_14987 ) ) ( not ( = ?auto_14985 ?auto_14999 ) ) ( not ( = ?auto_14987 ?auto_15007 ) ) ( not ( = ?auto_14987 ?auto_15002 ) ) ( not ( = ?auto_14987 ?auto_15000 ) ) ( not ( = ?auto_14987 ?auto_15006 ) ) ( not ( = ?auto_14995 ?auto_15001 ) ) ( not ( = ?auto_14995 ?auto_15010 ) ) ( not ( = ?auto_14995 ?auto_15012 ) ) ( not ( = ?auto_14996 ?auto_15005 ) ) ( not ( = ?auto_14996 ?auto_15008 ) ) ( not ( = ?auto_14996 ?auto_15004 ) ) ( not ( = ?auto_14999 ?auto_15007 ) ) ( not ( = ?auto_14999 ?auto_15002 ) ) ( not ( = ?auto_14999 ?auto_15000 ) ) ( not ( = ?auto_14999 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14988 ) ) ( not ( = ?auto_14982 ?auto_15011 ) ) ( not ( = ?auto_14983 ?auto_14988 ) ) ( not ( = ?auto_14983 ?auto_15011 ) ) ( not ( = ?auto_14984 ?auto_14988 ) ) ( not ( = ?auto_14984 ?auto_15011 ) ) ( not ( = ?auto_14985 ?auto_14988 ) ) ( not ( = ?auto_14985 ?auto_15011 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_15011 ) ) ( not ( = ?auto_14988 ?auto_14999 ) ) ( not ( = ?auto_14988 ?auto_15007 ) ) ( not ( = ?auto_14988 ?auto_15002 ) ) ( not ( = ?auto_14988 ?auto_15000 ) ) ( not ( = ?auto_14988 ?auto_15006 ) ) ( not ( = ?auto_15011 ?auto_14999 ) ) ( not ( = ?auto_15011 ?auto_15007 ) ) ( not ( = ?auto_15011 ?auto_15002 ) ) ( not ( = ?auto_15011 ?auto_15000 ) ) ( not ( = ?auto_15011 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14989 ) ) ( not ( = ?auto_14982 ?auto_15003 ) ) ( not ( = ?auto_14983 ?auto_14989 ) ) ( not ( = ?auto_14983 ?auto_15003 ) ) ( not ( = ?auto_14984 ?auto_14989 ) ) ( not ( = ?auto_14984 ?auto_15003 ) ) ( not ( = ?auto_14985 ?auto_14989 ) ) ( not ( = ?auto_14985 ?auto_15003 ) ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14986 ?auto_15003 ) ) ( not ( = ?auto_14987 ?auto_14989 ) ) ( not ( = ?auto_14987 ?auto_15003 ) ) ( not ( = ?auto_14989 ?auto_15011 ) ) ( not ( = ?auto_14989 ?auto_14999 ) ) ( not ( = ?auto_14989 ?auto_15007 ) ) ( not ( = ?auto_14989 ?auto_15002 ) ) ( not ( = ?auto_14989 ?auto_15000 ) ) ( not ( = ?auto_14989 ?auto_15006 ) ) ( not ( = ?auto_15013 ?auto_15001 ) ) ( not ( = ?auto_15013 ?auto_14995 ) ) ( not ( = ?auto_15013 ?auto_15010 ) ) ( not ( = ?auto_15013 ?auto_15012 ) ) ( not ( = ?auto_14998 ?auto_15005 ) ) ( not ( = ?auto_14998 ?auto_14996 ) ) ( not ( = ?auto_14998 ?auto_15008 ) ) ( not ( = ?auto_14998 ?auto_15004 ) ) ( not ( = ?auto_15003 ?auto_15011 ) ) ( not ( = ?auto_15003 ?auto_14999 ) ) ( not ( = ?auto_15003 ?auto_15007 ) ) ( not ( = ?auto_15003 ?auto_15002 ) ) ( not ( = ?auto_15003 ?auto_15000 ) ) ( not ( = ?auto_15003 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14990 ) ) ( not ( = ?auto_14982 ?auto_15009 ) ) ( not ( = ?auto_14983 ?auto_14990 ) ) ( not ( = ?auto_14983 ?auto_15009 ) ) ( not ( = ?auto_14984 ?auto_14990 ) ) ( not ( = ?auto_14984 ?auto_15009 ) ) ( not ( = ?auto_14985 ?auto_14990 ) ) ( not ( = ?auto_14985 ?auto_15009 ) ) ( not ( = ?auto_14986 ?auto_14990 ) ) ( not ( = ?auto_14986 ?auto_15009 ) ) ( not ( = ?auto_14987 ?auto_14990 ) ) ( not ( = ?auto_14987 ?auto_15009 ) ) ( not ( = ?auto_14988 ?auto_14990 ) ) ( not ( = ?auto_14988 ?auto_15009 ) ) ( not ( = ?auto_14990 ?auto_15003 ) ) ( not ( = ?auto_14990 ?auto_15011 ) ) ( not ( = ?auto_14990 ?auto_14999 ) ) ( not ( = ?auto_14990 ?auto_15007 ) ) ( not ( = ?auto_14990 ?auto_15002 ) ) ( not ( = ?auto_14990 ?auto_15000 ) ) ( not ( = ?auto_14990 ?auto_15006 ) ) ( not ( = ?auto_15009 ?auto_15003 ) ) ( not ( = ?auto_15009 ?auto_15011 ) ) ( not ( = ?auto_15009 ?auto_14999 ) ) ( not ( = ?auto_15009 ?auto_15007 ) ) ( not ( = ?auto_15009 ?auto_15002 ) ) ( not ( = ?auto_15009 ?auto_15000 ) ) ( not ( = ?auto_15009 ?auto_15006 ) ) ( not ( = ?auto_14982 ?auto_14991 ) ) ( not ( = ?auto_14982 ?auto_14997 ) ) ( not ( = ?auto_14983 ?auto_14991 ) ) ( not ( = ?auto_14983 ?auto_14997 ) ) ( not ( = ?auto_14984 ?auto_14991 ) ) ( not ( = ?auto_14984 ?auto_14997 ) ) ( not ( = ?auto_14985 ?auto_14991 ) ) ( not ( = ?auto_14985 ?auto_14997 ) ) ( not ( = ?auto_14986 ?auto_14991 ) ) ( not ( = ?auto_14986 ?auto_14997 ) ) ( not ( = ?auto_14987 ?auto_14991 ) ) ( not ( = ?auto_14987 ?auto_14997 ) ) ( not ( = ?auto_14988 ?auto_14991 ) ) ( not ( = ?auto_14988 ?auto_14997 ) ) ( not ( = ?auto_14989 ?auto_14991 ) ) ( not ( = ?auto_14989 ?auto_14997 ) ) ( not ( = ?auto_14991 ?auto_15009 ) ) ( not ( = ?auto_14991 ?auto_15003 ) ) ( not ( = ?auto_14991 ?auto_15011 ) ) ( not ( = ?auto_14991 ?auto_14999 ) ) ( not ( = ?auto_14991 ?auto_15007 ) ) ( not ( = ?auto_14991 ?auto_15002 ) ) ( not ( = ?auto_14991 ?auto_15000 ) ) ( not ( = ?auto_14991 ?auto_15006 ) ) ( not ( = ?auto_14997 ?auto_15009 ) ) ( not ( = ?auto_14997 ?auto_15003 ) ) ( not ( = ?auto_14997 ?auto_15011 ) ) ( not ( = ?auto_14997 ?auto_14999 ) ) ( not ( = ?auto_14997 ?auto_15007 ) ) ( not ( = ?auto_14997 ?auto_15002 ) ) ( not ( = ?auto_14997 ?auto_15000 ) ) ( not ( = ?auto_14997 ?auto_15006 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_14982 ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14989 ?auto_14990 )
      ( MAKE-1CRATE ?auto_14990 ?auto_14991 )
      ( MAKE-9CRATE-VERIFY ?auto_14982 ?auto_14983 ?auto_14984 ?auto_14985 ?auto_14986 ?auto_14987 ?auto_14988 ?auto_14989 ?auto_14990 ?auto_14991 ) )
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
      ?auto_15042 - SURFACE
      ?auto_15043 - SURFACE
      ?auto_15044 - SURFACE
      ?auto_15045 - SURFACE
    )
    :vars
    (
      ?auto_15046 - HOIST
      ?auto_15050 - PLACE
      ?auto_15051 - PLACE
      ?auto_15048 - HOIST
      ?auto_15049 - SURFACE
      ?auto_15063 - PLACE
      ?auto_15056 - HOIST
      ?auto_15052 - SURFACE
      ?auto_15068 - PLACE
      ?auto_15059 - HOIST
      ?auto_15057 - SURFACE
      ?auto_15055 - PLACE
      ?auto_15062 - HOIST
      ?auto_15058 - SURFACE
      ?auto_15053 - SURFACE
      ?auto_15066 - SURFACE
      ?auto_15054 - SURFACE
      ?auto_15061 - SURFACE
      ?auto_15064 - PLACE
      ?auto_15065 - HOIST
      ?auto_15060 - SURFACE
      ?auto_15067 - SURFACE
      ?auto_15047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15046 ?auto_15050 ) ( IS-CRATE ?auto_15045 ) ( not ( = ?auto_15051 ?auto_15050 ) ) ( HOIST-AT ?auto_15048 ?auto_15051 ) ( SURFACE-AT ?auto_15045 ?auto_15051 ) ( ON ?auto_15045 ?auto_15049 ) ( CLEAR ?auto_15045 ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15049 ) ) ( not ( = ?auto_15046 ?auto_15048 ) ) ( IS-CRATE ?auto_15044 ) ( not ( = ?auto_15063 ?auto_15050 ) ) ( HOIST-AT ?auto_15056 ?auto_15063 ) ( SURFACE-AT ?auto_15044 ?auto_15063 ) ( ON ?auto_15044 ?auto_15052 ) ( CLEAR ?auto_15044 ) ( not ( = ?auto_15043 ?auto_15044 ) ) ( not ( = ?auto_15043 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15052 ) ) ( not ( = ?auto_15046 ?auto_15056 ) ) ( IS-CRATE ?auto_15043 ) ( not ( = ?auto_15068 ?auto_15050 ) ) ( HOIST-AT ?auto_15059 ?auto_15068 ) ( SURFACE-AT ?auto_15043 ?auto_15068 ) ( ON ?auto_15043 ?auto_15057 ) ( CLEAR ?auto_15043 ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15057 ) ) ( not ( = ?auto_15043 ?auto_15057 ) ) ( not ( = ?auto_15046 ?auto_15059 ) ) ( IS-CRATE ?auto_15042 ) ( not ( = ?auto_15055 ?auto_15050 ) ) ( HOIST-AT ?auto_15062 ?auto_15055 ) ( AVAILABLE ?auto_15062 ) ( SURFACE-AT ?auto_15042 ?auto_15055 ) ( ON ?auto_15042 ?auto_15058 ) ( CLEAR ?auto_15042 ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15058 ) ) ( not ( = ?auto_15042 ?auto_15058 ) ) ( not ( = ?auto_15046 ?auto_15062 ) ) ( IS-CRATE ?auto_15041 ) ( SURFACE-AT ?auto_15041 ?auto_15051 ) ( ON ?auto_15041 ?auto_15053 ) ( CLEAR ?auto_15041 ) ( not ( = ?auto_15040 ?auto_15041 ) ) ( not ( = ?auto_15040 ?auto_15053 ) ) ( not ( = ?auto_15041 ?auto_15053 ) ) ( IS-CRATE ?auto_15040 ) ( AVAILABLE ?auto_15056 ) ( SURFACE-AT ?auto_15040 ?auto_15063 ) ( ON ?auto_15040 ?auto_15066 ) ( CLEAR ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( not ( = ?auto_15039 ?auto_15066 ) ) ( not ( = ?auto_15040 ?auto_15066 ) ) ( IS-CRATE ?auto_15039 ) ( SURFACE-AT ?auto_15039 ?auto_15051 ) ( ON ?auto_15039 ?auto_15054 ) ( CLEAR ?auto_15039 ) ( not ( = ?auto_15038 ?auto_15039 ) ) ( not ( = ?auto_15038 ?auto_15054 ) ) ( not ( = ?auto_15039 ?auto_15054 ) ) ( IS-CRATE ?auto_15038 ) ( AVAILABLE ?auto_15059 ) ( SURFACE-AT ?auto_15038 ?auto_15068 ) ( ON ?auto_15038 ?auto_15061 ) ( CLEAR ?auto_15038 ) ( not ( = ?auto_15037 ?auto_15038 ) ) ( not ( = ?auto_15037 ?auto_15061 ) ) ( not ( = ?auto_15038 ?auto_15061 ) ) ( IS-CRATE ?auto_15037 ) ( not ( = ?auto_15064 ?auto_15050 ) ) ( HOIST-AT ?auto_15065 ?auto_15064 ) ( AVAILABLE ?auto_15065 ) ( SURFACE-AT ?auto_15037 ?auto_15064 ) ( ON ?auto_15037 ?auto_15060 ) ( CLEAR ?auto_15037 ) ( not ( = ?auto_15036 ?auto_15037 ) ) ( not ( = ?auto_15036 ?auto_15060 ) ) ( not ( = ?auto_15037 ?auto_15060 ) ) ( not ( = ?auto_15046 ?auto_15065 ) ) ( SURFACE-AT ?auto_15035 ?auto_15050 ) ( CLEAR ?auto_15035 ) ( IS-CRATE ?auto_15036 ) ( AVAILABLE ?auto_15046 ) ( AVAILABLE ?auto_15048 ) ( SURFACE-AT ?auto_15036 ?auto_15051 ) ( ON ?auto_15036 ?auto_15067 ) ( CLEAR ?auto_15036 ) ( TRUCK-AT ?auto_15047 ?auto_15050 ) ( not ( = ?auto_15035 ?auto_15036 ) ) ( not ( = ?auto_15035 ?auto_15067 ) ) ( not ( = ?auto_15036 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15037 ) ) ( not ( = ?auto_15035 ?auto_15060 ) ) ( not ( = ?auto_15037 ?auto_15067 ) ) ( not ( = ?auto_15064 ?auto_15051 ) ) ( not ( = ?auto_15065 ?auto_15048 ) ) ( not ( = ?auto_15060 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15038 ) ) ( not ( = ?auto_15035 ?auto_15061 ) ) ( not ( = ?auto_15036 ?auto_15038 ) ) ( not ( = ?auto_15036 ?auto_15061 ) ) ( not ( = ?auto_15038 ?auto_15060 ) ) ( not ( = ?auto_15038 ?auto_15067 ) ) ( not ( = ?auto_15068 ?auto_15064 ) ) ( not ( = ?auto_15068 ?auto_15051 ) ) ( not ( = ?auto_15059 ?auto_15065 ) ) ( not ( = ?auto_15059 ?auto_15048 ) ) ( not ( = ?auto_15061 ?auto_15060 ) ) ( not ( = ?auto_15061 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15039 ) ) ( not ( = ?auto_15035 ?auto_15054 ) ) ( not ( = ?auto_15036 ?auto_15039 ) ) ( not ( = ?auto_15036 ?auto_15054 ) ) ( not ( = ?auto_15037 ?auto_15039 ) ) ( not ( = ?auto_15037 ?auto_15054 ) ) ( not ( = ?auto_15039 ?auto_15061 ) ) ( not ( = ?auto_15039 ?auto_15060 ) ) ( not ( = ?auto_15039 ?auto_15067 ) ) ( not ( = ?auto_15054 ?auto_15061 ) ) ( not ( = ?auto_15054 ?auto_15060 ) ) ( not ( = ?auto_15054 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15040 ) ) ( not ( = ?auto_15035 ?auto_15066 ) ) ( not ( = ?auto_15036 ?auto_15040 ) ) ( not ( = ?auto_15036 ?auto_15066 ) ) ( not ( = ?auto_15037 ?auto_15040 ) ) ( not ( = ?auto_15037 ?auto_15066 ) ) ( not ( = ?auto_15038 ?auto_15040 ) ) ( not ( = ?auto_15038 ?auto_15066 ) ) ( not ( = ?auto_15040 ?auto_15054 ) ) ( not ( = ?auto_15040 ?auto_15061 ) ) ( not ( = ?auto_15040 ?auto_15060 ) ) ( not ( = ?auto_15040 ?auto_15067 ) ) ( not ( = ?auto_15063 ?auto_15051 ) ) ( not ( = ?auto_15063 ?auto_15068 ) ) ( not ( = ?auto_15063 ?auto_15064 ) ) ( not ( = ?auto_15056 ?auto_15048 ) ) ( not ( = ?auto_15056 ?auto_15059 ) ) ( not ( = ?auto_15056 ?auto_15065 ) ) ( not ( = ?auto_15066 ?auto_15054 ) ) ( not ( = ?auto_15066 ?auto_15061 ) ) ( not ( = ?auto_15066 ?auto_15060 ) ) ( not ( = ?auto_15066 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15041 ) ) ( not ( = ?auto_15035 ?auto_15053 ) ) ( not ( = ?auto_15036 ?auto_15041 ) ) ( not ( = ?auto_15036 ?auto_15053 ) ) ( not ( = ?auto_15037 ?auto_15041 ) ) ( not ( = ?auto_15037 ?auto_15053 ) ) ( not ( = ?auto_15038 ?auto_15041 ) ) ( not ( = ?auto_15038 ?auto_15053 ) ) ( not ( = ?auto_15039 ?auto_15041 ) ) ( not ( = ?auto_15039 ?auto_15053 ) ) ( not ( = ?auto_15041 ?auto_15066 ) ) ( not ( = ?auto_15041 ?auto_15054 ) ) ( not ( = ?auto_15041 ?auto_15061 ) ) ( not ( = ?auto_15041 ?auto_15060 ) ) ( not ( = ?auto_15041 ?auto_15067 ) ) ( not ( = ?auto_15053 ?auto_15066 ) ) ( not ( = ?auto_15053 ?auto_15054 ) ) ( not ( = ?auto_15053 ?auto_15061 ) ) ( not ( = ?auto_15053 ?auto_15060 ) ) ( not ( = ?auto_15053 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15042 ) ) ( not ( = ?auto_15035 ?auto_15058 ) ) ( not ( = ?auto_15036 ?auto_15042 ) ) ( not ( = ?auto_15036 ?auto_15058 ) ) ( not ( = ?auto_15037 ?auto_15042 ) ) ( not ( = ?auto_15037 ?auto_15058 ) ) ( not ( = ?auto_15038 ?auto_15042 ) ) ( not ( = ?auto_15038 ?auto_15058 ) ) ( not ( = ?auto_15039 ?auto_15042 ) ) ( not ( = ?auto_15039 ?auto_15058 ) ) ( not ( = ?auto_15040 ?auto_15042 ) ) ( not ( = ?auto_15040 ?auto_15058 ) ) ( not ( = ?auto_15042 ?auto_15053 ) ) ( not ( = ?auto_15042 ?auto_15066 ) ) ( not ( = ?auto_15042 ?auto_15054 ) ) ( not ( = ?auto_15042 ?auto_15061 ) ) ( not ( = ?auto_15042 ?auto_15060 ) ) ( not ( = ?auto_15042 ?auto_15067 ) ) ( not ( = ?auto_15055 ?auto_15051 ) ) ( not ( = ?auto_15055 ?auto_15063 ) ) ( not ( = ?auto_15055 ?auto_15068 ) ) ( not ( = ?auto_15055 ?auto_15064 ) ) ( not ( = ?auto_15062 ?auto_15048 ) ) ( not ( = ?auto_15062 ?auto_15056 ) ) ( not ( = ?auto_15062 ?auto_15059 ) ) ( not ( = ?auto_15062 ?auto_15065 ) ) ( not ( = ?auto_15058 ?auto_15053 ) ) ( not ( = ?auto_15058 ?auto_15066 ) ) ( not ( = ?auto_15058 ?auto_15054 ) ) ( not ( = ?auto_15058 ?auto_15061 ) ) ( not ( = ?auto_15058 ?auto_15060 ) ) ( not ( = ?auto_15058 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15043 ) ) ( not ( = ?auto_15035 ?auto_15057 ) ) ( not ( = ?auto_15036 ?auto_15043 ) ) ( not ( = ?auto_15036 ?auto_15057 ) ) ( not ( = ?auto_15037 ?auto_15043 ) ) ( not ( = ?auto_15037 ?auto_15057 ) ) ( not ( = ?auto_15038 ?auto_15043 ) ) ( not ( = ?auto_15038 ?auto_15057 ) ) ( not ( = ?auto_15039 ?auto_15043 ) ) ( not ( = ?auto_15039 ?auto_15057 ) ) ( not ( = ?auto_15040 ?auto_15043 ) ) ( not ( = ?auto_15040 ?auto_15057 ) ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( not ( = ?auto_15041 ?auto_15057 ) ) ( not ( = ?auto_15043 ?auto_15058 ) ) ( not ( = ?auto_15043 ?auto_15053 ) ) ( not ( = ?auto_15043 ?auto_15066 ) ) ( not ( = ?auto_15043 ?auto_15054 ) ) ( not ( = ?auto_15043 ?auto_15061 ) ) ( not ( = ?auto_15043 ?auto_15060 ) ) ( not ( = ?auto_15043 ?auto_15067 ) ) ( not ( = ?auto_15057 ?auto_15058 ) ) ( not ( = ?auto_15057 ?auto_15053 ) ) ( not ( = ?auto_15057 ?auto_15066 ) ) ( not ( = ?auto_15057 ?auto_15054 ) ) ( not ( = ?auto_15057 ?auto_15061 ) ) ( not ( = ?auto_15057 ?auto_15060 ) ) ( not ( = ?auto_15057 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15044 ) ) ( not ( = ?auto_15035 ?auto_15052 ) ) ( not ( = ?auto_15036 ?auto_15044 ) ) ( not ( = ?auto_15036 ?auto_15052 ) ) ( not ( = ?auto_15037 ?auto_15044 ) ) ( not ( = ?auto_15037 ?auto_15052 ) ) ( not ( = ?auto_15038 ?auto_15044 ) ) ( not ( = ?auto_15038 ?auto_15052 ) ) ( not ( = ?auto_15039 ?auto_15044 ) ) ( not ( = ?auto_15039 ?auto_15052 ) ) ( not ( = ?auto_15040 ?auto_15044 ) ) ( not ( = ?auto_15040 ?auto_15052 ) ) ( not ( = ?auto_15041 ?auto_15044 ) ) ( not ( = ?auto_15041 ?auto_15052 ) ) ( not ( = ?auto_15042 ?auto_15044 ) ) ( not ( = ?auto_15042 ?auto_15052 ) ) ( not ( = ?auto_15044 ?auto_15057 ) ) ( not ( = ?auto_15044 ?auto_15058 ) ) ( not ( = ?auto_15044 ?auto_15053 ) ) ( not ( = ?auto_15044 ?auto_15066 ) ) ( not ( = ?auto_15044 ?auto_15054 ) ) ( not ( = ?auto_15044 ?auto_15061 ) ) ( not ( = ?auto_15044 ?auto_15060 ) ) ( not ( = ?auto_15044 ?auto_15067 ) ) ( not ( = ?auto_15052 ?auto_15057 ) ) ( not ( = ?auto_15052 ?auto_15058 ) ) ( not ( = ?auto_15052 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15066 ) ) ( not ( = ?auto_15052 ?auto_15054 ) ) ( not ( = ?auto_15052 ?auto_15061 ) ) ( not ( = ?auto_15052 ?auto_15060 ) ) ( not ( = ?auto_15052 ?auto_15067 ) ) ( not ( = ?auto_15035 ?auto_15045 ) ) ( not ( = ?auto_15035 ?auto_15049 ) ) ( not ( = ?auto_15036 ?auto_15045 ) ) ( not ( = ?auto_15036 ?auto_15049 ) ) ( not ( = ?auto_15037 ?auto_15045 ) ) ( not ( = ?auto_15037 ?auto_15049 ) ) ( not ( = ?auto_15038 ?auto_15045 ) ) ( not ( = ?auto_15038 ?auto_15049 ) ) ( not ( = ?auto_15039 ?auto_15045 ) ) ( not ( = ?auto_15039 ?auto_15049 ) ) ( not ( = ?auto_15040 ?auto_15045 ) ) ( not ( = ?auto_15040 ?auto_15049 ) ) ( not ( = ?auto_15041 ?auto_15045 ) ) ( not ( = ?auto_15041 ?auto_15049 ) ) ( not ( = ?auto_15042 ?auto_15045 ) ) ( not ( = ?auto_15042 ?auto_15049 ) ) ( not ( = ?auto_15043 ?auto_15045 ) ) ( not ( = ?auto_15043 ?auto_15049 ) ) ( not ( = ?auto_15045 ?auto_15052 ) ) ( not ( = ?auto_15045 ?auto_15057 ) ) ( not ( = ?auto_15045 ?auto_15058 ) ) ( not ( = ?auto_15045 ?auto_15053 ) ) ( not ( = ?auto_15045 ?auto_15066 ) ) ( not ( = ?auto_15045 ?auto_15054 ) ) ( not ( = ?auto_15045 ?auto_15061 ) ) ( not ( = ?auto_15045 ?auto_15060 ) ) ( not ( = ?auto_15045 ?auto_15067 ) ) ( not ( = ?auto_15049 ?auto_15052 ) ) ( not ( = ?auto_15049 ?auto_15057 ) ) ( not ( = ?auto_15049 ?auto_15058 ) ) ( not ( = ?auto_15049 ?auto_15053 ) ) ( not ( = ?auto_15049 ?auto_15066 ) ) ( not ( = ?auto_15049 ?auto_15054 ) ) ( not ( = ?auto_15049 ?auto_15061 ) ) ( not ( = ?auto_15049 ?auto_15060 ) ) ( not ( = ?auto_15049 ?auto_15067 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_15035 ?auto_15036 ?auto_15037 ?auto_15038 ?auto_15039 ?auto_15040 ?auto_15041 ?auto_15042 ?auto_15043 ?auto_15044 )
      ( MAKE-1CRATE ?auto_15044 ?auto_15045 )
      ( MAKE-10CRATE-VERIFY ?auto_15035 ?auto_15036 ?auto_15037 ?auto_15038 ?auto_15039 ?auto_15040 ?auto_15041 ?auto_15042 ?auto_15043 ?auto_15044 ?auto_15045 ) )
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
      ?auto_15098 - SURFACE
      ?auto_15099 - SURFACE
      ?auto_15100 - SURFACE
      ?auto_15101 - SURFACE
      ?auto_15102 - SURFACE
    )
    :vars
    (
      ?auto_15103 - HOIST
      ?auto_15105 - PLACE
      ?auto_15108 - PLACE
      ?auto_15106 - HOIST
      ?auto_15104 - SURFACE
      ?auto_15120 - SURFACE
      ?auto_15114 - PLACE
      ?auto_15126 - HOIST
      ?auto_15119 - SURFACE
      ?auto_15121 - PLACE
      ?auto_15113 - HOIST
      ?auto_15118 - SURFACE
      ?auto_15109 - PLACE
      ?auto_15116 - HOIST
      ?auto_15124 - SURFACE
      ?auto_15112 - SURFACE
      ?auto_15111 - SURFACE
      ?auto_15115 - SURFACE
      ?auto_15125 - SURFACE
      ?auto_15122 - PLACE
      ?auto_15117 - HOIST
      ?auto_15110 - SURFACE
      ?auto_15123 - SURFACE
      ?auto_15107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15103 ?auto_15105 ) ( IS-CRATE ?auto_15102 ) ( not ( = ?auto_15108 ?auto_15105 ) ) ( HOIST-AT ?auto_15106 ?auto_15108 ) ( SURFACE-AT ?auto_15102 ?auto_15108 ) ( ON ?auto_15102 ?auto_15104 ) ( CLEAR ?auto_15102 ) ( not ( = ?auto_15101 ?auto_15102 ) ) ( not ( = ?auto_15101 ?auto_15104 ) ) ( not ( = ?auto_15102 ?auto_15104 ) ) ( not ( = ?auto_15103 ?auto_15106 ) ) ( IS-CRATE ?auto_15101 ) ( SURFACE-AT ?auto_15101 ?auto_15108 ) ( ON ?auto_15101 ?auto_15120 ) ( CLEAR ?auto_15101 ) ( not ( = ?auto_15100 ?auto_15101 ) ) ( not ( = ?auto_15100 ?auto_15120 ) ) ( not ( = ?auto_15101 ?auto_15120 ) ) ( IS-CRATE ?auto_15100 ) ( not ( = ?auto_15114 ?auto_15105 ) ) ( HOIST-AT ?auto_15126 ?auto_15114 ) ( SURFACE-AT ?auto_15100 ?auto_15114 ) ( ON ?auto_15100 ?auto_15119 ) ( CLEAR ?auto_15100 ) ( not ( = ?auto_15099 ?auto_15100 ) ) ( not ( = ?auto_15099 ?auto_15119 ) ) ( not ( = ?auto_15100 ?auto_15119 ) ) ( not ( = ?auto_15103 ?auto_15126 ) ) ( IS-CRATE ?auto_15099 ) ( not ( = ?auto_15121 ?auto_15105 ) ) ( HOIST-AT ?auto_15113 ?auto_15121 ) ( SURFACE-AT ?auto_15099 ?auto_15121 ) ( ON ?auto_15099 ?auto_15118 ) ( CLEAR ?auto_15099 ) ( not ( = ?auto_15098 ?auto_15099 ) ) ( not ( = ?auto_15098 ?auto_15118 ) ) ( not ( = ?auto_15099 ?auto_15118 ) ) ( not ( = ?auto_15103 ?auto_15113 ) ) ( IS-CRATE ?auto_15098 ) ( not ( = ?auto_15109 ?auto_15105 ) ) ( HOIST-AT ?auto_15116 ?auto_15109 ) ( AVAILABLE ?auto_15116 ) ( SURFACE-AT ?auto_15098 ?auto_15109 ) ( ON ?auto_15098 ?auto_15124 ) ( CLEAR ?auto_15098 ) ( not ( = ?auto_15097 ?auto_15098 ) ) ( not ( = ?auto_15097 ?auto_15124 ) ) ( not ( = ?auto_15098 ?auto_15124 ) ) ( not ( = ?auto_15103 ?auto_15116 ) ) ( IS-CRATE ?auto_15097 ) ( SURFACE-AT ?auto_15097 ?auto_15108 ) ( ON ?auto_15097 ?auto_15112 ) ( CLEAR ?auto_15097 ) ( not ( = ?auto_15096 ?auto_15097 ) ) ( not ( = ?auto_15096 ?auto_15112 ) ) ( not ( = ?auto_15097 ?auto_15112 ) ) ( IS-CRATE ?auto_15096 ) ( AVAILABLE ?auto_15126 ) ( SURFACE-AT ?auto_15096 ?auto_15114 ) ( ON ?auto_15096 ?auto_15111 ) ( CLEAR ?auto_15096 ) ( not ( = ?auto_15095 ?auto_15096 ) ) ( not ( = ?auto_15095 ?auto_15111 ) ) ( not ( = ?auto_15096 ?auto_15111 ) ) ( IS-CRATE ?auto_15095 ) ( SURFACE-AT ?auto_15095 ?auto_15108 ) ( ON ?auto_15095 ?auto_15115 ) ( CLEAR ?auto_15095 ) ( not ( = ?auto_15094 ?auto_15095 ) ) ( not ( = ?auto_15094 ?auto_15115 ) ) ( not ( = ?auto_15095 ?auto_15115 ) ) ( IS-CRATE ?auto_15094 ) ( AVAILABLE ?auto_15113 ) ( SURFACE-AT ?auto_15094 ?auto_15121 ) ( ON ?auto_15094 ?auto_15125 ) ( CLEAR ?auto_15094 ) ( not ( = ?auto_15093 ?auto_15094 ) ) ( not ( = ?auto_15093 ?auto_15125 ) ) ( not ( = ?auto_15094 ?auto_15125 ) ) ( IS-CRATE ?auto_15093 ) ( not ( = ?auto_15122 ?auto_15105 ) ) ( HOIST-AT ?auto_15117 ?auto_15122 ) ( AVAILABLE ?auto_15117 ) ( SURFACE-AT ?auto_15093 ?auto_15122 ) ( ON ?auto_15093 ?auto_15110 ) ( CLEAR ?auto_15093 ) ( not ( = ?auto_15092 ?auto_15093 ) ) ( not ( = ?auto_15092 ?auto_15110 ) ) ( not ( = ?auto_15093 ?auto_15110 ) ) ( not ( = ?auto_15103 ?auto_15117 ) ) ( SURFACE-AT ?auto_15091 ?auto_15105 ) ( CLEAR ?auto_15091 ) ( IS-CRATE ?auto_15092 ) ( AVAILABLE ?auto_15103 ) ( AVAILABLE ?auto_15106 ) ( SURFACE-AT ?auto_15092 ?auto_15108 ) ( ON ?auto_15092 ?auto_15123 ) ( CLEAR ?auto_15092 ) ( TRUCK-AT ?auto_15107 ?auto_15105 ) ( not ( = ?auto_15091 ?auto_15092 ) ) ( not ( = ?auto_15091 ?auto_15123 ) ) ( not ( = ?auto_15092 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15093 ) ) ( not ( = ?auto_15091 ?auto_15110 ) ) ( not ( = ?auto_15093 ?auto_15123 ) ) ( not ( = ?auto_15122 ?auto_15108 ) ) ( not ( = ?auto_15117 ?auto_15106 ) ) ( not ( = ?auto_15110 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15094 ) ) ( not ( = ?auto_15091 ?auto_15125 ) ) ( not ( = ?auto_15092 ?auto_15094 ) ) ( not ( = ?auto_15092 ?auto_15125 ) ) ( not ( = ?auto_15094 ?auto_15110 ) ) ( not ( = ?auto_15094 ?auto_15123 ) ) ( not ( = ?auto_15121 ?auto_15122 ) ) ( not ( = ?auto_15121 ?auto_15108 ) ) ( not ( = ?auto_15113 ?auto_15117 ) ) ( not ( = ?auto_15113 ?auto_15106 ) ) ( not ( = ?auto_15125 ?auto_15110 ) ) ( not ( = ?auto_15125 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15095 ) ) ( not ( = ?auto_15091 ?auto_15115 ) ) ( not ( = ?auto_15092 ?auto_15095 ) ) ( not ( = ?auto_15092 ?auto_15115 ) ) ( not ( = ?auto_15093 ?auto_15095 ) ) ( not ( = ?auto_15093 ?auto_15115 ) ) ( not ( = ?auto_15095 ?auto_15125 ) ) ( not ( = ?auto_15095 ?auto_15110 ) ) ( not ( = ?auto_15095 ?auto_15123 ) ) ( not ( = ?auto_15115 ?auto_15125 ) ) ( not ( = ?auto_15115 ?auto_15110 ) ) ( not ( = ?auto_15115 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15096 ) ) ( not ( = ?auto_15091 ?auto_15111 ) ) ( not ( = ?auto_15092 ?auto_15096 ) ) ( not ( = ?auto_15092 ?auto_15111 ) ) ( not ( = ?auto_15093 ?auto_15096 ) ) ( not ( = ?auto_15093 ?auto_15111 ) ) ( not ( = ?auto_15094 ?auto_15096 ) ) ( not ( = ?auto_15094 ?auto_15111 ) ) ( not ( = ?auto_15096 ?auto_15115 ) ) ( not ( = ?auto_15096 ?auto_15125 ) ) ( not ( = ?auto_15096 ?auto_15110 ) ) ( not ( = ?auto_15096 ?auto_15123 ) ) ( not ( = ?auto_15114 ?auto_15108 ) ) ( not ( = ?auto_15114 ?auto_15121 ) ) ( not ( = ?auto_15114 ?auto_15122 ) ) ( not ( = ?auto_15126 ?auto_15106 ) ) ( not ( = ?auto_15126 ?auto_15113 ) ) ( not ( = ?auto_15126 ?auto_15117 ) ) ( not ( = ?auto_15111 ?auto_15115 ) ) ( not ( = ?auto_15111 ?auto_15125 ) ) ( not ( = ?auto_15111 ?auto_15110 ) ) ( not ( = ?auto_15111 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15097 ) ) ( not ( = ?auto_15091 ?auto_15112 ) ) ( not ( = ?auto_15092 ?auto_15097 ) ) ( not ( = ?auto_15092 ?auto_15112 ) ) ( not ( = ?auto_15093 ?auto_15097 ) ) ( not ( = ?auto_15093 ?auto_15112 ) ) ( not ( = ?auto_15094 ?auto_15097 ) ) ( not ( = ?auto_15094 ?auto_15112 ) ) ( not ( = ?auto_15095 ?auto_15097 ) ) ( not ( = ?auto_15095 ?auto_15112 ) ) ( not ( = ?auto_15097 ?auto_15111 ) ) ( not ( = ?auto_15097 ?auto_15115 ) ) ( not ( = ?auto_15097 ?auto_15125 ) ) ( not ( = ?auto_15097 ?auto_15110 ) ) ( not ( = ?auto_15097 ?auto_15123 ) ) ( not ( = ?auto_15112 ?auto_15111 ) ) ( not ( = ?auto_15112 ?auto_15115 ) ) ( not ( = ?auto_15112 ?auto_15125 ) ) ( not ( = ?auto_15112 ?auto_15110 ) ) ( not ( = ?auto_15112 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15098 ) ) ( not ( = ?auto_15091 ?auto_15124 ) ) ( not ( = ?auto_15092 ?auto_15098 ) ) ( not ( = ?auto_15092 ?auto_15124 ) ) ( not ( = ?auto_15093 ?auto_15098 ) ) ( not ( = ?auto_15093 ?auto_15124 ) ) ( not ( = ?auto_15094 ?auto_15098 ) ) ( not ( = ?auto_15094 ?auto_15124 ) ) ( not ( = ?auto_15095 ?auto_15098 ) ) ( not ( = ?auto_15095 ?auto_15124 ) ) ( not ( = ?auto_15096 ?auto_15098 ) ) ( not ( = ?auto_15096 ?auto_15124 ) ) ( not ( = ?auto_15098 ?auto_15112 ) ) ( not ( = ?auto_15098 ?auto_15111 ) ) ( not ( = ?auto_15098 ?auto_15115 ) ) ( not ( = ?auto_15098 ?auto_15125 ) ) ( not ( = ?auto_15098 ?auto_15110 ) ) ( not ( = ?auto_15098 ?auto_15123 ) ) ( not ( = ?auto_15109 ?auto_15108 ) ) ( not ( = ?auto_15109 ?auto_15114 ) ) ( not ( = ?auto_15109 ?auto_15121 ) ) ( not ( = ?auto_15109 ?auto_15122 ) ) ( not ( = ?auto_15116 ?auto_15106 ) ) ( not ( = ?auto_15116 ?auto_15126 ) ) ( not ( = ?auto_15116 ?auto_15113 ) ) ( not ( = ?auto_15116 ?auto_15117 ) ) ( not ( = ?auto_15124 ?auto_15112 ) ) ( not ( = ?auto_15124 ?auto_15111 ) ) ( not ( = ?auto_15124 ?auto_15115 ) ) ( not ( = ?auto_15124 ?auto_15125 ) ) ( not ( = ?auto_15124 ?auto_15110 ) ) ( not ( = ?auto_15124 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15099 ) ) ( not ( = ?auto_15091 ?auto_15118 ) ) ( not ( = ?auto_15092 ?auto_15099 ) ) ( not ( = ?auto_15092 ?auto_15118 ) ) ( not ( = ?auto_15093 ?auto_15099 ) ) ( not ( = ?auto_15093 ?auto_15118 ) ) ( not ( = ?auto_15094 ?auto_15099 ) ) ( not ( = ?auto_15094 ?auto_15118 ) ) ( not ( = ?auto_15095 ?auto_15099 ) ) ( not ( = ?auto_15095 ?auto_15118 ) ) ( not ( = ?auto_15096 ?auto_15099 ) ) ( not ( = ?auto_15096 ?auto_15118 ) ) ( not ( = ?auto_15097 ?auto_15099 ) ) ( not ( = ?auto_15097 ?auto_15118 ) ) ( not ( = ?auto_15099 ?auto_15124 ) ) ( not ( = ?auto_15099 ?auto_15112 ) ) ( not ( = ?auto_15099 ?auto_15111 ) ) ( not ( = ?auto_15099 ?auto_15115 ) ) ( not ( = ?auto_15099 ?auto_15125 ) ) ( not ( = ?auto_15099 ?auto_15110 ) ) ( not ( = ?auto_15099 ?auto_15123 ) ) ( not ( = ?auto_15118 ?auto_15124 ) ) ( not ( = ?auto_15118 ?auto_15112 ) ) ( not ( = ?auto_15118 ?auto_15111 ) ) ( not ( = ?auto_15118 ?auto_15115 ) ) ( not ( = ?auto_15118 ?auto_15125 ) ) ( not ( = ?auto_15118 ?auto_15110 ) ) ( not ( = ?auto_15118 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15100 ) ) ( not ( = ?auto_15091 ?auto_15119 ) ) ( not ( = ?auto_15092 ?auto_15100 ) ) ( not ( = ?auto_15092 ?auto_15119 ) ) ( not ( = ?auto_15093 ?auto_15100 ) ) ( not ( = ?auto_15093 ?auto_15119 ) ) ( not ( = ?auto_15094 ?auto_15100 ) ) ( not ( = ?auto_15094 ?auto_15119 ) ) ( not ( = ?auto_15095 ?auto_15100 ) ) ( not ( = ?auto_15095 ?auto_15119 ) ) ( not ( = ?auto_15096 ?auto_15100 ) ) ( not ( = ?auto_15096 ?auto_15119 ) ) ( not ( = ?auto_15097 ?auto_15100 ) ) ( not ( = ?auto_15097 ?auto_15119 ) ) ( not ( = ?auto_15098 ?auto_15100 ) ) ( not ( = ?auto_15098 ?auto_15119 ) ) ( not ( = ?auto_15100 ?auto_15118 ) ) ( not ( = ?auto_15100 ?auto_15124 ) ) ( not ( = ?auto_15100 ?auto_15112 ) ) ( not ( = ?auto_15100 ?auto_15111 ) ) ( not ( = ?auto_15100 ?auto_15115 ) ) ( not ( = ?auto_15100 ?auto_15125 ) ) ( not ( = ?auto_15100 ?auto_15110 ) ) ( not ( = ?auto_15100 ?auto_15123 ) ) ( not ( = ?auto_15119 ?auto_15118 ) ) ( not ( = ?auto_15119 ?auto_15124 ) ) ( not ( = ?auto_15119 ?auto_15112 ) ) ( not ( = ?auto_15119 ?auto_15111 ) ) ( not ( = ?auto_15119 ?auto_15115 ) ) ( not ( = ?auto_15119 ?auto_15125 ) ) ( not ( = ?auto_15119 ?auto_15110 ) ) ( not ( = ?auto_15119 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15101 ) ) ( not ( = ?auto_15091 ?auto_15120 ) ) ( not ( = ?auto_15092 ?auto_15101 ) ) ( not ( = ?auto_15092 ?auto_15120 ) ) ( not ( = ?auto_15093 ?auto_15101 ) ) ( not ( = ?auto_15093 ?auto_15120 ) ) ( not ( = ?auto_15094 ?auto_15101 ) ) ( not ( = ?auto_15094 ?auto_15120 ) ) ( not ( = ?auto_15095 ?auto_15101 ) ) ( not ( = ?auto_15095 ?auto_15120 ) ) ( not ( = ?auto_15096 ?auto_15101 ) ) ( not ( = ?auto_15096 ?auto_15120 ) ) ( not ( = ?auto_15097 ?auto_15101 ) ) ( not ( = ?auto_15097 ?auto_15120 ) ) ( not ( = ?auto_15098 ?auto_15101 ) ) ( not ( = ?auto_15098 ?auto_15120 ) ) ( not ( = ?auto_15099 ?auto_15101 ) ) ( not ( = ?auto_15099 ?auto_15120 ) ) ( not ( = ?auto_15101 ?auto_15119 ) ) ( not ( = ?auto_15101 ?auto_15118 ) ) ( not ( = ?auto_15101 ?auto_15124 ) ) ( not ( = ?auto_15101 ?auto_15112 ) ) ( not ( = ?auto_15101 ?auto_15111 ) ) ( not ( = ?auto_15101 ?auto_15115 ) ) ( not ( = ?auto_15101 ?auto_15125 ) ) ( not ( = ?auto_15101 ?auto_15110 ) ) ( not ( = ?auto_15101 ?auto_15123 ) ) ( not ( = ?auto_15120 ?auto_15119 ) ) ( not ( = ?auto_15120 ?auto_15118 ) ) ( not ( = ?auto_15120 ?auto_15124 ) ) ( not ( = ?auto_15120 ?auto_15112 ) ) ( not ( = ?auto_15120 ?auto_15111 ) ) ( not ( = ?auto_15120 ?auto_15115 ) ) ( not ( = ?auto_15120 ?auto_15125 ) ) ( not ( = ?auto_15120 ?auto_15110 ) ) ( not ( = ?auto_15120 ?auto_15123 ) ) ( not ( = ?auto_15091 ?auto_15102 ) ) ( not ( = ?auto_15091 ?auto_15104 ) ) ( not ( = ?auto_15092 ?auto_15102 ) ) ( not ( = ?auto_15092 ?auto_15104 ) ) ( not ( = ?auto_15093 ?auto_15102 ) ) ( not ( = ?auto_15093 ?auto_15104 ) ) ( not ( = ?auto_15094 ?auto_15102 ) ) ( not ( = ?auto_15094 ?auto_15104 ) ) ( not ( = ?auto_15095 ?auto_15102 ) ) ( not ( = ?auto_15095 ?auto_15104 ) ) ( not ( = ?auto_15096 ?auto_15102 ) ) ( not ( = ?auto_15096 ?auto_15104 ) ) ( not ( = ?auto_15097 ?auto_15102 ) ) ( not ( = ?auto_15097 ?auto_15104 ) ) ( not ( = ?auto_15098 ?auto_15102 ) ) ( not ( = ?auto_15098 ?auto_15104 ) ) ( not ( = ?auto_15099 ?auto_15102 ) ) ( not ( = ?auto_15099 ?auto_15104 ) ) ( not ( = ?auto_15100 ?auto_15102 ) ) ( not ( = ?auto_15100 ?auto_15104 ) ) ( not ( = ?auto_15102 ?auto_15120 ) ) ( not ( = ?auto_15102 ?auto_15119 ) ) ( not ( = ?auto_15102 ?auto_15118 ) ) ( not ( = ?auto_15102 ?auto_15124 ) ) ( not ( = ?auto_15102 ?auto_15112 ) ) ( not ( = ?auto_15102 ?auto_15111 ) ) ( not ( = ?auto_15102 ?auto_15115 ) ) ( not ( = ?auto_15102 ?auto_15125 ) ) ( not ( = ?auto_15102 ?auto_15110 ) ) ( not ( = ?auto_15102 ?auto_15123 ) ) ( not ( = ?auto_15104 ?auto_15120 ) ) ( not ( = ?auto_15104 ?auto_15119 ) ) ( not ( = ?auto_15104 ?auto_15118 ) ) ( not ( = ?auto_15104 ?auto_15124 ) ) ( not ( = ?auto_15104 ?auto_15112 ) ) ( not ( = ?auto_15104 ?auto_15111 ) ) ( not ( = ?auto_15104 ?auto_15115 ) ) ( not ( = ?auto_15104 ?auto_15125 ) ) ( not ( = ?auto_15104 ?auto_15110 ) ) ( not ( = ?auto_15104 ?auto_15123 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_15091 ?auto_15092 ?auto_15093 ?auto_15094 ?auto_15095 ?auto_15096 ?auto_15097 ?auto_15098 ?auto_15099 ?auto_15100 ?auto_15101 )
      ( MAKE-1CRATE ?auto_15101 ?auto_15102 )
      ( MAKE-11CRATE-VERIFY ?auto_15091 ?auto_15092 ?auto_15093 ?auto_15094 ?auto_15095 ?auto_15096 ?auto_15097 ?auto_15098 ?auto_15099 ?auto_15100 ?auto_15101 ?auto_15102 ) )
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
      ?auto_15157 - SURFACE
      ?auto_15158 - SURFACE
      ?auto_15159 - SURFACE
      ?auto_15160 - SURFACE
      ?auto_15161 - SURFACE
      ?auto_15162 - SURFACE
    )
    :vars
    (
      ?auto_15163 - HOIST
      ?auto_15166 - PLACE
      ?auto_15168 - PLACE
      ?auto_15164 - HOIST
      ?auto_15167 - SURFACE
      ?auto_15177 - PLACE
      ?auto_15186 - HOIST
      ?auto_15170 - SURFACE
      ?auto_15171 - SURFACE
      ?auto_15187 - PLACE
      ?auto_15174 - HOIST
      ?auto_15179 - SURFACE
      ?auto_15169 - PLACE
      ?auto_15184 - HOIST
      ?auto_15178 - SURFACE
      ?auto_15182 - PLACE
      ?auto_15176 - HOIST
      ?auto_15188 - SURFACE
      ?auto_15181 - SURFACE
      ?auto_15180 - SURFACE
      ?auto_15173 - SURFACE
      ?auto_15172 - SURFACE
      ?auto_15183 - PLACE
      ?auto_15185 - HOIST
      ?auto_15189 - SURFACE
      ?auto_15175 - SURFACE
      ?auto_15165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15163 ?auto_15166 ) ( IS-CRATE ?auto_15162 ) ( not ( = ?auto_15168 ?auto_15166 ) ) ( HOIST-AT ?auto_15164 ?auto_15168 ) ( AVAILABLE ?auto_15164 ) ( SURFACE-AT ?auto_15162 ?auto_15168 ) ( ON ?auto_15162 ?auto_15167 ) ( CLEAR ?auto_15162 ) ( not ( = ?auto_15161 ?auto_15162 ) ) ( not ( = ?auto_15161 ?auto_15167 ) ) ( not ( = ?auto_15162 ?auto_15167 ) ) ( not ( = ?auto_15163 ?auto_15164 ) ) ( IS-CRATE ?auto_15161 ) ( not ( = ?auto_15177 ?auto_15166 ) ) ( HOIST-AT ?auto_15186 ?auto_15177 ) ( SURFACE-AT ?auto_15161 ?auto_15177 ) ( ON ?auto_15161 ?auto_15170 ) ( CLEAR ?auto_15161 ) ( not ( = ?auto_15160 ?auto_15161 ) ) ( not ( = ?auto_15160 ?auto_15170 ) ) ( not ( = ?auto_15161 ?auto_15170 ) ) ( not ( = ?auto_15163 ?auto_15186 ) ) ( IS-CRATE ?auto_15160 ) ( SURFACE-AT ?auto_15160 ?auto_15177 ) ( ON ?auto_15160 ?auto_15171 ) ( CLEAR ?auto_15160 ) ( not ( = ?auto_15159 ?auto_15160 ) ) ( not ( = ?auto_15159 ?auto_15171 ) ) ( not ( = ?auto_15160 ?auto_15171 ) ) ( IS-CRATE ?auto_15159 ) ( not ( = ?auto_15187 ?auto_15166 ) ) ( HOIST-AT ?auto_15174 ?auto_15187 ) ( SURFACE-AT ?auto_15159 ?auto_15187 ) ( ON ?auto_15159 ?auto_15179 ) ( CLEAR ?auto_15159 ) ( not ( = ?auto_15158 ?auto_15159 ) ) ( not ( = ?auto_15158 ?auto_15179 ) ) ( not ( = ?auto_15159 ?auto_15179 ) ) ( not ( = ?auto_15163 ?auto_15174 ) ) ( IS-CRATE ?auto_15158 ) ( not ( = ?auto_15169 ?auto_15166 ) ) ( HOIST-AT ?auto_15184 ?auto_15169 ) ( SURFACE-AT ?auto_15158 ?auto_15169 ) ( ON ?auto_15158 ?auto_15178 ) ( CLEAR ?auto_15158 ) ( not ( = ?auto_15157 ?auto_15158 ) ) ( not ( = ?auto_15157 ?auto_15178 ) ) ( not ( = ?auto_15158 ?auto_15178 ) ) ( not ( = ?auto_15163 ?auto_15184 ) ) ( IS-CRATE ?auto_15157 ) ( not ( = ?auto_15182 ?auto_15166 ) ) ( HOIST-AT ?auto_15176 ?auto_15182 ) ( AVAILABLE ?auto_15176 ) ( SURFACE-AT ?auto_15157 ?auto_15182 ) ( ON ?auto_15157 ?auto_15188 ) ( CLEAR ?auto_15157 ) ( not ( = ?auto_15156 ?auto_15157 ) ) ( not ( = ?auto_15156 ?auto_15188 ) ) ( not ( = ?auto_15157 ?auto_15188 ) ) ( not ( = ?auto_15163 ?auto_15176 ) ) ( IS-CRATE ?auto_15156 ) ( SURFACE-AT ?auto_15156 ?auto_15177 ) ( ON ?auto_15156 ?auto_15181 ) ( CLEAR ?auto_15156 ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15155 ?auto_15181 ) ) ( not ( = ?auto_15156 ?auto_15181 ) ) ( IS-CRATE ?auto_15155 ) ( AVAILABLE ?auto_15174 ) ( SURFACE-AT ?auto_15155 ?auto_15187 ) ( ON ?auto_15155 ?auto_15180 ) ( CLEAR ?auto_15155 ) ( not ( = ?auto_15154 ?auto_15155 ) ) ( not ( = ?auto_15154 ?auto_15180 ) ) ( not ( = ?auto_15155 ?auto_15180 ) ) ( IS-CRATE ?auto_15154 ) ( SURFACE-AT ?auto_15154 ?auto_15177 ) ( ON ?auto_15154 ?auto_15173 ) ( CLEAR ?auto_15154 ) ( not ( = ?auto_15153 ?auto_15154 ) ) ( not ( = ?auto_15153 ?auto_15173 ) ) ( not ( = ?auto_15154 ?auto_15173 ) ) ( IS-CRATE ?auto_15153 ) ( AVAILABLE ?auto_15184 ) ( SURFACE-AT ?auto_15153 ?auto_15169 ) ( ON ?auto_15153 ?auto_15172 ) ( CLEAR ?auto_15153 ) ( not ( = ?auto_15152 ?auto_15153 ) ) ( not ( = ?auto_15152 ?auto_15172 ) ) ( not ( = ?auto_15153 ?auto_15172 ) ) ( IS-CRATE ?auto_15152 ) ( not ( = ?auto_15183 ?auto_15166 ) ) ( HOIST-AT ?auto_15185 ?auto_15183 ) ( AVAILABLE ?auto_15185 ) ( SURFACE-AT ?auto_15152 ?auto_15183 ) ( ON ?auto_15152 ?auto_15189 ) ( CLEAR ?auto_15152 ) ( not ( = ?auto_15151 ?auto_15152 ) ) ( not ( = ?auto_15151 ?auto_15189 ) ) ( not ( = ?auto_15152 ?auto_15189 ) ) ( not ( = ?auto_15163 ?auto_15185 ) ) ( SURFACE-AT ?auto_15150 ?auto_15166 ) ( CLEAR ?auto_15150 ) ( IS-CRATE ?auto_15151 ) ( AVAILABLE ?auto_15163 ) ( AVAILABLE ?auto_15186 ) ( SURFACE-AT ?auto_15151 ?auto_15177 ) ( ON ?auto_15151 ?auto_15175 ) ( CLEAR ?auto_15151 ) ( TRUCK-AT ?auto_15165 ?auto_15166 ) ( not ( = ?auto_15150 ?auto_15151 ) ) ( not ( = ?auto_15150 ?auto_15175 ) ) ( not ( = ?auto_15151 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15152 ) ) ( not ( = ?auto_15150 ?auto_15189 ) ) ( not ( = ?auto_15152 ?auto_15175 ) ) ( not ( = ?auto_15183 ?auto_15177 ) ) ( not ( = ?auto_15185 ?auto_15186 ) ) ( not ( = ?auto_15189 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15153 ) ) ( not ( = ?auto_15150 ?auto_15172 ) ) ( not ( = ?auto_15151 ?auto_15153 ) ) ( not ( = ?auto_15151 ?auto_15172 ) ) ( not ( = ?auto_15153 ?auto_15189 ) ) ( not ( = ?auto_15153 ?auto_15175 ) ) ( not ( = ?auto_15169 ?auto_15183 ) ) ( not ( = ?auto_15169 ?auto_15177 ) ) ( not ( = ?auto_15184 ?auto_15185 ) ) ( not ( = ?auto_15184 ?auto_15186 ) ) ( not ( = ?auto_15172 ?auto_15189 ) ) ( not ( = ?auto_15172 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15154 ) ) ( not ( = ?auto_15150 ?auto_15173 ) ) ( not ( = ?auto_15151 ?auto_15154 ) ) ( not ( = ?auto_15151 ?auto_15173 ) ) ( not ( = ?auto_15152 ?auto_15154 ) ) ( not ( = ?auto_15152 ?auto_15173 ) ) ( not ( = ?auto_15154 ?auto_15172 ) ) ( not ( = ?auto_15154 ?auto_15189 ) ) ( not ( = ?auto_15154 ?auto_15175 ) ) ( not ( = ?auto_15173 ?auto_15172 ) ) ( not ( = ?auto_15173 ?auto_15189 ) ) ( not ( = ?auto_15173 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15155 ) ) ( not ( = ?auto_15150 ?auto_15180 ) ) ( not ( = ?auto_15151 ?auto_15155 ) ) ( not ( = ?auto_15151 ?auto_15180 ) ) ( not ( = ?auto_15152 ?auto_15155 ) ) ( not ( = ?auto_15152 ?auto_15180 ) ) ( not ( = ?auto_15153 ?auto_15155 ) ) ( not ( = ?auto_15153 ?auto_15180 ) ) ( not ( = ?auto_15155 ?auto_15173 ) ) ( not ( = ?auto_15155 ?auto_15172 ) ) ( not ( = ?auto_15155 ?auto_15189 ) ) ( not ( = ?auto_15155 ?auto_15175 ) ) ( not ( = ?auto_15187 ?auto_15177 ) ) ( not ( = ?auto_15187 ?auto_15169 ) ) ( not ( = ?auto_15187 ?auto_15183 ) ) ( not ( = ?auto_15174 ?auto_15186 ) ) ( not ( = ?auto_15174 ?auto_15184 ) ) ( not ( = ?auto_15174 ?auto_15185 ) ) ( not ( = ?auto_15180 ?auto_15173 ) ) ( not ( = ?auto_15180 ?auto_15172 ) ) ( not ( = ?auto_15180 ?auto_15189 ) ) ( not ( = ?auto_15180 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15156 ) ) ( not ( = ?auto_15150 ?auto_15181 ) ) ( not ( = ?auto_15151 ?auto_15156 ) ) ( not ( = ?auto_15151 ?auto_15181 ) ) ( not ( = ?auto_15152 ?auto_15156 ) ) ( not ( = ?auto_15152 ?auto_15181 ) ) ( not ( = ?auto_15153 ?auto_15156 ) ) ( not ( = ?auto_15153 ?auto_15181 ) ) ( not ( = ?auto_15154 ?auto_15156 ) ) ( not ( = ?auto_15154 ?auto_15181 ) ) ( not ( = ?auto_15156 ?auto_15180 ) ) ( not ( = ?auto_15156 ?auto_15173 ) ) ( not ( = ?auto_15156 ?auto_15172 ) ) ( not ( = ?auto_15156 ?auto_15189 ) ) ( not ( = ?auto_15156 ?auto_15175 ) ) ( not ( = ?auto_15181 ?auto_15180 ) ) ( not ( = ?auto_15181 ?auto_15173 ) ) ( not ( = ?auto_15181 ?auto_15172 ) ) ( not ( = ?auto_15181 ?auto_15189 ) ) ( not ( = ?auto_15181 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15157 ) ) ( not ( = ?auto_15150 ?auto_15188 ) ) ( not ( = ?auto_15151 ?auto_15157 ) ) ( not ( = ?auto_15151 ?auto_15188 ) ) ( not ( = ?auto_15152 ?auto_15157 ) ) ( not ( = ?auto_15152 ?auto_15188 ) ) ( not ( = ?auto_15153 ?auto_15157 ) ) ( not ( = ?auto_15153 ?auto_15188 ) ) ( not ( = ?auto_15154 ?auto_15157 ) ) ( not ( = ?auto_15154 ?auto_15188 ) ) ( not ( = ?auto_15155 ?auto_15157 ) ) ( not ( = ?auto_15155 ?auto_15188 ) ) ( not ( = ?auto_15157 ?auto_15181 ) ) ( not ( = ?auto_15157 ?auto_15180 ) ) ( not ( = ?auto_15157 ?auto_15173 ) ) ( not ( = ?auto_15157 ?auto_15172 ) ) ( not ( = ?auto_15157 ?auto_15189 ) ) ( not ( = ?auto_15157 ?auto_15175 ) ) ( not ( = ?auto_15182 ?auto_15177 ) ) ( not ( = ?auto_15182 ?auto_15187 ) ) ( not ( = ?auto_15182 ?auto_15169 ) ) ( not ( = ?auto_15182 ?auto_15183 ) ) ( not ( = ?auto_15176 ?auto_15186 ) ) ( not ( = ?auto_15176 ?auto_15174 ) ) ( not ( = ?auto_15176 ?auto_15184 ) ) ( not ( = ?auto_15176 ?auto_15185 ) ) ( not ( = ?auto_15188 ?auto_15181 ) ) ( not ( = ?auto_15188 ?auto_15180 ) ) ( not ( = ?auto_15188 ?auto_15173 ) ) ( not ( = ?auto_15188 ?auto_15172 ) ) ( not ( = ?auto_15188 ?auto_15189 ) ) ( not ( = ?auto_15188 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15158 ) ) ( not ( = ?auto_15150 ?auto_15178 ) ) ( not ( = ?auto_15151 ?auto_15158 ) ) ( not ( = ?auto_15151 ?auto_15178 ) ) ( not ( = ?auto_15152 ?auto_15158 ) ) ( not ( = ?auto_15152 ?auto_15178 ) ) ( not ( = ?auto_15153 ?auto_15158 ) ) ( not ( = ?auto_15153 ?auto_15178 ) ) ( not ( = ?auto_15154 ?auto_15158 ) ) ( not ( = ?auto_15154 ?auto_15178 ) ) ( not ( = ?auto_15155 ?auto_15158 ) ) ( not ( = ?auto_15155 ?auto_15178 ) ) ( not ( = ?auto_15156 ?auto_15158 ) ) ( not ( = ?auto_15156 ?auto_15178 ) ) ( not ( = ?auto_15158 ?auto_15188 ) ) ( not ( = ?auto_15158 ?auto_15181 ) ) ( not ( = ?auto_15158 ?auto_15180 ) ) ( not ( = ?auto_15158 ?auto_15173 ) ) ( not ( = ?auto_15158 ?auto_15172 ) ) ( not ( = ?auto_15158 ?auto_15189 ) ) ( not ( = ?auto_15158 ?auto_15175 ) ) ( not ( = ?auto_15178 ?auto_15188 ) ) ( not ( = ?auto_15178 ?auto_15181 ) ) ( not ( = ?auto_15178 ?auto_15180 ) ) ( not ( = ?auto_15178 ?auto_15173 ) ) ( not ( = ?auto_15178 ?auto_15172 ) ) ( not ( = ?auto_15178 ?auto_15189 ) ) ( not ( = ?auto_15178 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15159 ) ) ( not ( = ?auto_15150 ?auto_15179 ) ) ( not ( = ?auto_15151 ?auto_15159 ) ) ( not ( = ?auto_15151 ?auto_15179 ) ) ( not ( = ?auto_15152 ?auto_15159 ) ) ( not ( = ?auto_15152 ?auto_15179 ) ) ( not ( = ?auto_15153 ?auto_15159 ) ) ( not ( = ?auto_15153 ?auto_15179 ) ) ( not ( = ?auto_15154 ?auto_15159 ) ) ( not ( = ?auto_15154 ?auto_15179 ) ) ( not ( = ?auto_15155 ?auto_15159 ) ) ( not ( = ?auto_15155 ?auto_15179 ) ) ( not ( = ?auto_15156 ?auto_15159 ) ) ( not ( = ?auto_15156 ?auto_15179 ) ) ( not ( = ?auto_15157 ?auto_15159 ) ) ( not ( = ?auto_15157 ?auto_15179 ) ) ( not ( = ?auto_15159 ?auto_15178 ) ) ( not ( = ?auto_15159 ?auto_15188 ) ) ( not ( = ?auto_15159 ?auto_15181 ) ) ( not ( = ?auto_15159 ?auto_15180 ) ) ( not ( = ?auto_15159 ?auto_15173 ) ) ( not ( = ?auto_15159 ?auto_15172 ) ) ( not ( = ?auto_15159 ?auto_15189 ) ) ( not ( = ?auto_15159 ?auto_15175 ) ) ( not ( = ?auto_15179 ?auto_15178 ) ) ( not ( = ?auto_15179 ?auto_15188 ) ) ( not ( = ?auto_15179 ?auto_15181 ) ) ( not ( = ?auto_15179 ?auto_15180 ) ) ( not ( = ?auto_15179 ?auto_15173 ) ) ( not ( = ?auto_15179 ?auto_15172 ) ) ( not ( = ?auto_15179 ?auto_15189 ) ) ( not ( = ?auto_15179 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15160 ) ) ( not ( = ?auto_15150 ?auto_15171 ) ) ( not ( = ?auto_15151 ?auto_15160 ) ) ( not ( = ?auto_15151 ?auto_15171 ) ) ( not ( = ?auto_15152 ?auto_15160 ) ) ( not ( = ?auto_15152 ?auto_15171 ) ) ( not ( = ?auto_15153 ?auto_15160 ) ) ( not ( = ?auto_15153 ?auto_15171 ) ) ( not ( = ?auto_15154 ?auto_15160 ) ) ( not ( = ?auto_15154 ?auto_15171 ) ) ( not ( = ?auto_15155 ?auto_15160 ) ) ( not ( = ?auto_15155 ?auto_15171 ) ) ( not ( = ?auto_15156 ?auto_15160 ) ) ( not ( = ?auto_15156 ?auto_15171 ) ) ( not ( = ?auto_15157 ?auto_15160 ) ) ( not ( = ?auto_15157 ?auto_15171 ) ) ( not ( = ?auto_15158 ?auto_15160 ) ) ( not ( = ?auto_15158 ?auto_15171 ) ) ( not ( = ?auto_15160 ?auto_15179 ) ) ( not ( = ?auto_15160 ?auto_15178 ) ) ( not ( = ?auto_15160 ?auto_15188 ) ) ( not ( = ?auto_15160 ?auto_15181 ) ) ( not ( = ?auto_15160 ?auto_15180 ) ) ( not ( = ?auto_15160 ?auto_15173 ) ) ( not ( = ?auto_15160 ?auto_15172 ) ) ( not ( = ?auto_15160 ?auto_15189 ) ) ( not ( = ?auto_15160 ?auto_15175 ) ) ( not ( = ?auto_15171 ?auto_15179 ) ) ( not ( = ?auto_15171 ?auto_15178 ) ) ( not ( = ?auto_15171 ?auto_15188 ) ) ( not ( = ?auto_15171 ?auto_15181 ) ) ( not ( = ?auto_15171 ?auto_15180 ) ) ( not ( = ?auto_15171 ?auto_15173 ) ) ( not ( = ?auto_15171 ?auto_15172 ) ) ( not ( = ?auto_15171 ?auto_15189 ) ) ( not ( = ?auto_15171 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15161 ) ) ( not ( = ?auto_15150 ?auto_15170 ) ) ( not ( = ?auto_15151 ?auto_15161 ) ) ( not ( = ?auto_15151 ?auto_15170 ) ) ( not ( = ?auto_15152 ?auto_15161 ) ) ( not ( = ?auto_15152 ?auto_15170 ) ) ( not ( = ?auto_15153 ?auto_15161 ) ) ( not ( = ?auto_15153 ?auto_15170 ) ) ( not ( = ?auto_15154 ?auto_15161 ) ) ( not ( = ?auto_15154 ?auto_15170 ) ) ( not ( = ?auto_15155 ?auto_15161 ) ) ( not ( = ?auto_15155 ?auto_15170 ) ) ( not ( = ?auto_15156 ?auto_15161 ) ) ( not ( = ?auto_15156 ?auto_15170 ) ) ( not ( = ?auto_15157 ?auto_15161 ) ) ( not ( = ?auto_15157 ?auto_15170 ) ) ( not ( = ?auto_15158 ?auto_15161 ) ) ( not ( = ?auto_15158 ?auto_15170 ) ) ( not ( = ?auto_15159 ?auto_15161 ) ) ( not ( = ?auto_15159 ?auto_15170 ) ) ( not ( = ?auto_15161 ?auto_15171 ) ) ( not ( = ?auto_15161 ?auto_15179 ) ) ( not ( = ?auto_15161 ?auto_15178 ) ) ( not ( = ?auto_15161 ?auto_15188 ) ) ( not ( = ?auto_15161 ?auto_15181 ) ) ( not ( = ?auto_15161 ?auto_15180 ) ) ( not ( = ?auto_15161 ?auto_15173 ) ) ( not ( = ?auto_15161 ?auto_15172 ) ) ( not ( = ?auto_15161 ?auto_15189 ) ) ( not ( = ?auto_15161 ?auto_15175 ) ) ( not ( = ?auto_15170 ?auto_15171 ) ) ( not ( = ?auto_15170 ?auto_15179 ) ) ( not ( = ?auto_15170 ?auto_15178 ) ) ( not ( = ?auto_15170 ?auto_15188 ) ) ( not ( = ?auto_15170 ?auto_15181 ) ) ( not ( = ?auto_15170 ?auto_15180 ) ) ( not ( = ?auto_15170 ?auto_15173 ) ) ( not ( = ?auto_15170 ?auto_15172 ) ) ( not ( = ?auto_15170 ?auto_15189 ) ) ( not ( = ?auto_15170 ?auto_15175 ) ) ( not ( = ?auto_15150 ?auto_15162 ) ) ( not ( = ?auto_15150 ?auto_15167 ) ) ( not ( = ?auto_15151 ?auto_15162 ) ) ( not ( = ?auto_15151 ?auto_15167 ) ) ( not ( = ?auto_15152 ?auto_15162 ) ) ( not ( = ?auto_15152 ?auto_15167 ) ) ( not ( = ?auto_15153 ?auto_15162 ) ) ( not ( = ?auto_15153 ?auto_15167 ) ) ( not ( = ?auto_15154 ?auto_15162 ) ) ( not ( = ?auto_15154 ?auto_15167 ) ) ( not ( = ?auto_15155 ?auto_15162 ) ) ( not ( = ?auto_15155 ?auto_15167 ) ) ( not ( = ?auto_15156 ?auto_15162 ) ) ( not ( = ?auto_15156 ?auto_15167 ) ) ( not ( = ?auto_15157 ?auto_15162 ) ) ( not ( = ?auto_15157 ?auto_15167 ) ) ( not ( = ?auto_15158 ?auto_15162 ) ) ( not ( = ?auto_15158 ?auto_15167 ) ) ( not ( = ?auto_15159 ?auto_15162 ) ) ( not ( = ?auto_15159 ?auto_15167 ) ) ( not ( = ?auto_15160 ?auto_15162 ) ) ( not ( = ?auto_15160 ?auto_15167 ) ) ( not ( = ?auto_15162 ?auto_15170 ) ) ( not ( = ?auto_15162 ?auto_15171 ) ) ( not ( = ?auto_15162 ?auto_15179 ) ) ( not ( = ?auto_15162 ?auto_15178 ) ) ( not ( = ?auto_15162 ?auto_15188 ) ) ( not ( = ?auto_15162 ?auto_15181 ) ) ( not ( = ?auto_15162 ?auto_15180 ) ) ( not ( = ?auto_15162 ?auto_15173 ) ) ( not ( = ?auto_15162 ?auto_15172 ) ) ( not ( = ?auto_15162 ?auto_15189 ) ) ( not ( = ?auto_15162 ?auto_15175 ) ) ( not ( = ?auto_15168 ?auto_15177 ) ) ( not ( = ?auto_15168 ?auto_15187 ) ) ( not ( = ?auto_15168 ?auto_15169 ) ) ( not ( = ?auto_15168 ?auto_15182 ) ) ( not ( = ?auto_15168 ?auto_15183 ) ) ( not ( = ?auto_15164 ?auto_15186 ) ) ( not ( = ?auto_15164 ?auto_15174 ) ) ( not ( = ?auto_15164 ?auto_15184 ) ) ( not ( = ?auto_15164 ?auto_15176 ) ) ( not ( = ?auto_15164 ?auto_15185 ) ) ( not ( = ?auto_15167 ?auto_15170 ) ) ( not ( = ?auto_15167 ?auto_15171 ) ) ( not ( = ?auto_15167 ?auto_15179 ) ) ( not ( = ?auto_15167 ?auto_15178 ) ) ( not ( = ?auto_15167 ?auto_15188 ) ) ( not ( = ?auto_15167 ?auto_15181 ) ) ( not ( = ?auto_15167 ?auto_15180 ) ) ( not ( = ?auto_15167 ?auto_15173 ) ) ( not ( = ?auto_15167 ?auto_15172 ) ) ( not ( = ?auto_15167 ?auto_15189 ) ) ( not ( = ?auto_15167 ?auto_15175 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_15150 ?auto_15151 ?auto_15152 ?auto_15153 ?auto_15154 ?auto_15155 ?auto_15156 ?auto_15157 ?auto_15158 ?auto_15159 ?auto_15160 ?auto_15161 )
      ( MAKE-1CRATE ?auto_15161 ?auto_15162 )
      ( MAKE-12CRATE-VERIFY ?auto_15150 ?auto_15151 ?auto_15152 ?auto_15153 ?auto_15154 ?auto_15155 ?auto_15156 ?auto_15157 ?auto_15158 ?auto_15159 ?auto_15160 ?auto_15161 ?auto_15162 ) )
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
      ?auto_15221 - SURFACE
      ?auto_15222 - SURFACE
      ?auto_15223 - SURFACE
      ?auto_15224 - SURFACE
      ?auto_15225 - SURFACE
      ?auto_15226 - SURFACE
      ?auto_15227 - SURFACE
    )
    :vars
    (
      ?auto_15230 - HOIST
      ?auto_15228 - PLACE
      ?auto_15232 - PLACE
      ?auto_15229 - HOIST
      ?auto_15233 - SURFACE
      ?auto_15250 - PLACE
      ?auto_15244 - HOIST
      ?auto_15236 - SURFACE
      ?auto_15247 - PLACE
      ?auto_15254 - HOIST
      ?auto_15240 - SURFACE
      ?auto_15234 - SURFACE
      ?auto_15249 - SURFACE
      ?auto_15251 - PLACE
      ?auto_15246 - HOIST
      ?auto_15237 - SURFACE
      ?auto_15238 - PLACE
      ?auto_15239 - HOIST
      ?auto_15242 - SURFACE
      ?auto_15235 - SURFACE
      ?auto_15248 - SURFACE
      ?auto_15245 - SURFACE
      ?auto_15252 - SURFACE
      ?auto_15253 - PLACE
      ?auto_15243 - HOIST
      ?auto_15241 - SURFACE
      ?auto_15255 - SURFACE
      ?auto_15231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15230 ?auto_15228 ) ( IS-CRATE ?auto_15227 ) ( not ( = ?auto_15232 ?auto_15228 ) ) ( HOIST-AT ?auto_15229 ?auto_15232 ) ( SURFACE-AT ?auto_15227 ?auto_15232 ) ( ON ?auto_15227 ?auto_15233 ) ( CLEAR ?auto_15227 ) ( not ( = ?auto_15226 ?auto_15227 ) ) ( not ( = ?auto_15226 ?auto_15233 ) ) ( not ( = ?auto_15227 ?auto_15233 ) ) ( not ( = ?auto_15230 ?auto_15229 ) ) ( IS-CRATE ?auto_15226 ) ( not ( = ?auto_15250 ?auto_15228 ) ) ( HOIST-AT ?auto_15244 ?auto_15250 ) ( AVAILABLE ?auto_15244 ) ( SURFACE-AT ?auto_15226 ?auto_15250 ) ( ON ?auto_15226 ?auto_15236 ) ( CLEAR ?auto_15226 ) ( not ( = ?auto_15225 ?auto_15226 ) ) ( not ( = ?auto_15225 ?auto_15236 ) ) ( not ( = ?auto_15226 ?auto_15236 ) ) ( not ( = ?auto_15230 ?auto_15244 ) ) ( IS-CRATE ?auto_15225 ) ( not ( = ?auto_15247 ?auto_15228 ) ) ( HOIST-AT ?auto_15254 ?auto_15247 ) ( SURFACE-AT ?auto_15225 ?auto_15247 ) ( ON ?auto_15225 ?auto_15240 ) ( CLEAR ?auto_15225 ) ( not ( = ?auto_15224 ?auto_15225 ) ) ( not ( = ?auto_15224 ?auto_15240 ) ) ( not ( = ?auto_15225 ?auto_15240 ) ) ( not ( = ?auto_15230 ?auto_15254 ) ) ( IS-CRATE ?auto_15224 ) ( SURFACE-AT ?auto_15224 ?auto_15247 ) ( ON ?auto_15224 ?auto_15234 ) ( CLEAR ?auto_15224 ) ( not ( = ?auto_15223 ?auto_15224 ) ) ( not ( = ?auto_15223 ?auto_15234 ) ) ( not ( = ?auto_15224 ?auto_15234 ) ) ( IS-CRATE ?auto_15223 ) ( SURFACE-AT ?auto_15223 ?auto_15232 ) ( ON ?auto_15223 ?auto_15249 ) ( CLEAR ?auto_15223 ) ( not ( = ?auto_15222 ?auto_15223 ) ) ( not ( = ?auto_15222 ?auto_15249 ) ) ( not ( = ?auto_15223 ?auto_15249 ) ) ( IS-CRATE ?auto_15222 ) ( not ( = ?auto_15251 ?auto_15228 ) ) ( HOIST-AT ?auto_15246 ?auto_15251 ) ( SURFACE-AT ?auto_15222 ?auto_15251 ) ( ON ?auto_15222 ?auto_15237 ) ( CLEAR ?auto_15222 ) ( not ( = ?auto_15221 ?auto_15222 ) ) ( not ( = ?auto_15221 ?auto_15237 ) ) ( not ( = ?auto_15222 ?auto_15237 ) ) ( not ( = ?auto_15230 ?auto_15246 ) ) ( IS-CRATE ?auto_15221 ) ( not ( = ?auto_15238 ?auto_15228 ) ) ( HOIST-AT ?auto_15239 ?auto_15238 ) ( AVAILABLE ?auto_15239 ) ( SURFACE-AT ?auto_15221 ?auto_15238 ) ( ON ?auto_15221 ?auto_15242 ) ( CLEAR ?auto_15221 ) ( not ( = ?auto_15220 ?auto_15221 ) ) ( not ( = ?auto_15220 ?auto_15242 ) ) ( not ( = ?auto_15221 ?auto_15242 ) ) ( not ( = ?auto_15230 ?auto_15239 ) ) ( IS-CRATE ?auto_15220 ) ( SURFACE-AT ?auto_15220 ?auto_15247 ) ( ON ?auto_15220 ?auto_15235 ) ( CLEAR ?auto_15220 ) ( not ( = ?auto_15219 ?auto_15220 ) ) ( not ( = ?auto_15219 ?auto_15235 ) ) ( not ( = ?auto_15220 ?auto_15235 ) ) ( IS-CRATE ?auto_15219 ) ( AVAILABLE ?auto_15229 ) ( SURFACE-AT ?auto_15219 ?auto_15232 ) ( ON ?auto_15219 ?auto_15248 ) ( CLEAR ?auto_15219 ) ( not ( = ?auto_15218 ?auto_15219 ) ) ( not ( = ?auto_15218 ?auto_15248 ) ) ( not ( = ?auto_15219 ?auto_15248 ) ) ( IS-CRATE ?auto_15218 ) ( SURFACE-AT ?auto_15218 ?auto_15247 ) ( ON ?auto_15218 ?auto_15245 ) ( CLEAR ?auto_15218 ) ( not ( = ?auto_15217 ?auto_15218 ) ) ( not ( = ?auto_15217 ?auto_15245 ) ) ( not ( = ?auto_15218 ?auto_15245 ) ) ( IS-CRATE ?auto_15217 ) ( AVAILABLE ?auto_15246 ) ( SURFACE-AT ?auto_15217 ?auto_15251 ) ( ON ?auto_15217 ?auto_15252 ) ( CLEAR ?auto_15217 ) ( not ( = ?auto_15216 ?auto_15217 ) ) ( not ( = ?auto_15216 ?auto_15252 ) ) ( not ( = ?auto_15217 ?auto_15252 ) ) ( IS-CRATE ?auto_15216 ) ( not ( = ?auto_15253 ?auto_15228 ) ) ( HOIST-AT ?auto_15243 ?auto_15253 ) ( AVAILABLE ?auto_15243 ) ( SURFACE-AT ?auto_15216 ?auto_15253 ) ( ON ?auto_15216 ?auto_15241 ) ( CLEAR ?auto_15216 ) ( not ( = ?auto_15215 ?auto_15216 ) ) ( not ( = ?auto_15215 ?auto_15241 ) ) ( not ( = ?auto_15216 ?auto_15241 ) ) ( not ( = ?auto_15230 ?auto_15243 ) ) ( SURFACE-AT ?auto_15214 ?auto_15228 ) ( CLEAR ?auto_15214 ) ( IS-CRATE ?auto_15215 ) ( AVAILABLE ?auto_15230 ) ( AVAILABLE ?auto_15254 ) ( SURFACE-AT ?auto_15215 ?auto_15247 ) ( ON ?auto_15215 ?auto_15255 ) ( CLEAR ?auto_15215 ) ( TRUCK-AT ?auto_15231 ?auto_15228 ) ( not ( = ?auto_15214 ?auto_15215 ) ) ( not ( = ?auto_15214 ?auto_15255 ) ) ( not ( = ?auto_15215 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15216 ) ) ( not ( = ?auto_15214 ?auto_15241 ) ) ( not ( = ?auto_15216 ?auto_15255 ) ) ( not ( = ?auto_15253 ?auto_15247 ) ) ( not ( = ?auto_15243 ?auto_15254 ) ) ( not ( = ?auto_15241 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15217 ) ) ( not ( = ?auto_15214 ?auto_15252 ) ) ( not ( = ?auto_15215 ?auto_15217 ) ) ( not ( = ?auto_15215 ?auto_15252 ) ) ( not ( = ?auto_15217 ?auto_15241 ) ) ( not ( = ?auto_15217 ?auto_15255 ) ) ( not ( = ?auto_15251 ?auto_15253 ) ) ( not ( = ?auto_15251 ?auto_15247 ) ) ( not ( = ?auto_15246 ?auto_15243 ) ) ( not ( = ?auto_15246 ?auto_15254 ) ) ( not ( = ?auto_15252 ?auto_15241 ) ) ( not ( = ?auto_15252 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15218 ) ) ( not ( = ?auto_15214 ?auto_15245 ) ) ( not ( = ?auto_15215 ?auto_15218 ) ) ( not ( = ?auto_15215 ?auto_15245 ) ) ( not ( = ?auto_15216 ?auto_15218 ) ) ( not ( = ?auto_15216 ?auto_15245 ) ) ( not ( = ?auto_15218 ?auto_15252 ) ) ( not ( = ?auto_15218 ?auto_15241 ) ) ( not ( = ?auto_15218 ?auto_15255 ) ) ( not ( = ?auto_15245 ?auto_15252 ) ) ( not ( = ?auto_15245 ?auto_15241 ) ) ( not ( = ?auto_15245 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15219 ) ) ( not ( = ?auto_15214 ?auto_15248 ) ) ( not ( = ?auto_15215 ?auto_15219 ) ) ( not ( = ?auto_15215 ?auto_15248 ) ) ( not ( = ?auto_15216 ?auto_15219 ) ) ( not ( = ?auto_15216 ?auto_15248 ) ) ( not ( = ?auto_15217 ?auto_15219 ) ) ( not ( = ?auto_15217 ?auto_15248 ) ) ( not ( = ?auto_15219 ?auto_15245 ) ) ( not ( = ?auto_15219 ?auto_15252 ) ) ( not ( = ?auto_15219 ?auto_15241 ) ) ( not ( = ?auto_15219 ?auto_15255 ) ) ( not ( = ?auto_15232 ?auto_15247 ) ) ( not ( = ?auto_15232 ?auto_15251 ) ) ( not ( = ?auto_15232 ?auto_15253 ) ) ( not ( = ?auto_15229 ?auto_15254 ) ) ( not ( = ?auto_15229 ?auto_15246 ) ) ( not ( = ?auto_15229 ?auto_15243 ) ) ( not ( = ?auto_15248 ?auto_15245 ) ) ( not ( = ?auto_15248 ?auto_15252 ) ) ( not ( = ?auto_15248 ?auto_15241 ) ) ( not ( = ?auto_15248 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15220 ) ) ( not ( = ?auto_15214 ?auto_15235 ) ) ( not ( = ?auto_15215 ?auto_15220 ) ) ( not ( = ?auto_15215 ?auto_15235 ) ) ( not ( = ?auto_15216 ?auto_15220 ) ) ( not ( = ?auto_15216 ?auto_15235 ) ) ( not ( = ?auto_15217 ?auto_15220 ) ) ( not ( = ?auto_15217 ?auto_15235 ) ) ( not ( = ?auto_15218 ?auto_15220 ) ) ( not ( = ?auto_15218 ?auto_15235 ) ) ( not ( = ?auto_15220 ?auto_15248 ) ) ( not ( = ?auto_15220 ?auto_15245 ) ) ( not ( = ?auto_15220 ?auto_15252 ) ) ( not ( = ?auto_15220 ?auto_15241 ) ) ( not ( = ?auto_15220 ?auto_15255 ) ) ( not ( = ?auto_15235 ?auto_15248 ) ) ( not ( = ?auto_15235 ?auto_15245 ) ) ( not ( = ?auto_15235 ?auto_15252 ) ) ( not ( = ?auto_15235 ?auto_15241 ) ) ( not ( = ?auto_15235 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15221 ) ) ( not ( = ?auto_15214 ?auto_15242 ) ) ( not ( = ?auto_15215 ?auto_15221 ) ) ( not ( = ?auto_15215 ?auto_15242 ) ) ( not ( = ?auto_15216 ?auto_15221 ) ) ( not ( = ?auto_15216 ?auto_15242 ) ) ( not ( = ?auto_15217 ?auto_15221 ) ) ( not ( = ?auto_15217 ?auto_15242 ) ) ( not ( = ?auto_15218 ?auto_15221 ) ) ( not ( = ?auto_15218 ?auto_15242 ) ) ( not ( = ?auto_15219 ?auto_15221 ) ) ( not ( = ?auto_15219 ?auto_15242 ) ) ( not ( = ?auto_15221 ?auto_15235 ) ) ( not ( = ?auto_15221 ?auto_15248 ) ) ( not ( = ?auto_15221 ?auto_15245 ) ) ( not ( = ?auto_15221 ?auto_15252 ) ) ( not ( = ?auto_15221 ?auto_15241 ) ) ( not ( = ?auto_15221 ?auto_15255 ) ) ( not ( = ?auto_15238 ?auto_15247 ) ) ( not ( = ?auto_15238 ?auto_15232 ) ) ( not ( = ?auto_15238 ?auto_15251 ) ) ( not ( = ?auto_15238 ?auto_15253 ) ) ( not ( = ?auto_15239 ?auto_15254 ) ) ( not ( = ?auto_15239 ?auto_15229 ) ) ( not ( = ?auto_15239 ?auto_15246 ) ) ( not ( = ?auto_15239 ?auto_15243 ) ) ( not ( = ?auto_15242 ?auto_15235 ) ) ( not ( = ?auto_15242 ?auto_15248 ) ) ( not ( = ?auto_15242 ?auto_15245 ) ) ( not ( = ?auto_15242 ?auto_15252 ) ) ( not ( = ?auto_15242 ?auto_15241 ) ) ( not ( = ?auto_15242 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15222 ) ) ( not ( = ?auto_15214 ?auto_15237 ) ) ( not ( = ?auto_15215 ?auto_15222 ) ) ( not ( = ?auto_15215 ?auto_15237 ) ) ( not ( = ?auto_15216 ?auto_15222 ) ) ( not ( = ?auto_15216 ?auto_15237 ) ) ( not ( = ?auto_15217 ?auto_15222 ) ) ( not ( = ?auto_15217 ?auto_15237 ) ) ( not ( = ?auto_15218 ?auto_15222 ) ) ( not ( = ?auto_15218 ?auto_15237 ) ) ( not ( = ?auto_15219 ?auto_15222 ) ) ( not ( = ?auto_15219 ?auto_15237 ) ) ( not ( = ?auto_15220 ?auto_15222 ) ) ( not ( = ?auto_15220 ?auto_15237 ) ) ( not ( = ?auto_15222 ?auto_15242 ) ) ( not ( = ?auto_15222 ?auto_15235 ) ) ( not ( = ?auto_15222 ?auto_15248 ) ) ( not ( = ?auto_15222 ?auto_15245 ) ) ( not ( = ?auto_15222 ?auto_15252 ) ) ( not ( = ?auto_15222 ?auto_15241 ) ) ( not ( = ?auto_15222 ?auto_15255 ) ) ( not ( = ?auto_15237 ?auto_15242 ) ) ( not ( = ?auto_15237 ?auto_15235 ) ) ( not ( = ?auto_15237 ?auto_15248 ) ) ( not ( = ?auto_15237 ?auto_15245 ) ) ( not ( = ?auto_15237 ?auto_15252 ) ) ( not ( = ?auto_15237 ?auto_15241 ) ) ( not ( = ?auto_15237 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15223 ) ) ( not ( = ?auto_15214 ?auto_15249 ) ) ( not ( = ?auto_15215 ?auto_15223 ) ) ( not ( = ?auto_15215 ?auto_15249 ) ) ( not ( = ?auto_15216 ?auto_15223 ) ) ( not ( = ?auto_15216 ?auto_15249 ) ) ( not ( = ?auto_15217 ?auto_15223 ) ) ( not ( = ?auto_15217 ?auto_15249 ) ) ( not ( = ?auto_15218 ?auto_15223 ) ) ( not ( = ?auto_15218 ?auto_15249 ) ) ( not ( = ?auto_15219 ?auto_15223 ) ) ( not ( = ?auto_15219 ?auto_15249 ) ) ( not ( = ?auto_15220 ?auto_15223 ) ) ( not ( = ?auto_15220 ?auto_15249 ) ) ( not ( = ?auto_15221 ?auto_15223 ) ) ( not ( = ?auto_15221 ?auto_15249 ) ) ( not ( = ?auto_15223 ?auto_15237 ) ) ( not ( = ?auto_15223 ?auto_15242 ) ) ( not ( = ?auto_15223 ?auto_15235 ) ) ( not ( = ?auto_15223 ?auto_15248 ) ) ( not ( = ?auto_15223 ?auto_15245 ) ) ( not ( = ?auto_15223 ?auto_15252 ) ) ( not ( = ?auto_15223 ?auto_15241 ) ) ( not ( = ?auto_15223 ?auto_15255 ) ) ( not ( = ?auto_15249 ?auto_15237 ) ) ( not ( = ?auto_15249 ?auto_15242 ) ) ( not ( = ?auto_15249 ?auto_15235 ) ) ( not ( = ?auto_15249 ?auto_15248 ) ) ( not ( = ?auto_15249 ?auto_15245 ) ) ( not ( = ?auto_15249 ?auto_15252 ) ) ( not ( = ?auto_15249 ?auto_15241 ) ) ( not ( = ?auto_15249 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15224 ) ) ( not ( = ?auto_15214 ?auto_15234 ) ) ( not ( = ?auto_15215 ?auto_15224 ) ) ( not ( = ?auto_15215 ?auto_15234 ) ) ( not ( = ?auto_15216 ?auto_15224 ) ) ( not ( = ?auto_15216 ?auto_15234 ) ) ( not ( = ?auto_15217 ?auto_15224 ) ) ( not ( = ?auto_15217 ?auto_15234 ) ) ( not ( = ?auto_15218 ?auto_15224 ) ) ( not ( = ?auto_15218 ?auto_15234 ) ) ( not ( = ?auto_15219 ?auto_15224 ) ) ( not ( = ?auto_15219 ?auto_15234 ) ) ( not ( = ?auto_15220 ?auto_15224 ) ) ( not ( = ?auto_15220 ?auto_15234 ) ) ( not ( = ?auto_15221 ?auto_15224 ) ) ( not ( = ?auto_15221 ?auto_15234 ) ) ( not ( = ?auto_15222 ?auto_15224 ) ) ( not ( = ?auto_15222 ?auto_15234 ) ) ( not ( = ?auto_15224 ?auto_15249 ) ) ( not ( = ?auto_15224 ?auto_15237 ) ) ( not ( = ?auto_15224 ?auto_15242 ) ) ( not ( = ?auto_15224 ?auto_15235 ) ) ( not ( = ?auto_15224 ?auto_15248 ) ) ( not ( = ?auto_15224 ?auto_15245 ) ) ( not ( = ?auto_15224 ?auto_15252 ) ) ( not ( = ?auto_15224 ?auto_15241 ) ) ( not ( = ?auto_15224 ?auto_15255 ) ) ( not ( = ?auto_15234 ?auto_15249 ) ) ( not ( = ?auto_15234 ?auto_15237 ) ) ( not ( = ?auto_15234 ?auto_15242 ) ) ( not ( = ?auto_15234 ?auto_15235 ) ) ( not ( = ?auto_15234 ?auto_15248 ) ) ( not ( = ?auto_15234 ?auto_15245 ) ) ( not ( = ?auto_15234 ?auto_15252 ) ) ( not ( = ?auto_15234 ?auto_15241 ) ) ( not ( = ?auto_15234 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15225 ) ) ( not ( = ?auto_15214 ?auto_15240 ) ) ( not ( = ?auto_15215 ?auto_15225 ) ) ( not ( = ?auto_15215 ?auto_15240 ) ) ( not ( = ?auto_15216 ?auto_15225 ) ) ( not ( = ?auto_15216 ?auto_15240 ) ) ( not ( = ?auto_15217 ?auto_15225 ) ) ( not ( = ?auto_15217 ?auto_15240 ) ) ( not ( = ?auto_15218 ?auto_15225 ) ) ( not ( = ?auto_15218 ?auto_15240 ) ) ( not ( = ?auto_15219 ?auto_15225 ) ) ( not ( = ?auto_15219 ?auto_15240 ) ) ( not ( = ?auto_15220 ?auto_15225 ) ) ( not ( = ?auto_15220 ?auto_15240 ) ) ( not ( = ?auto_15221 ?auto_15225 ) ) ( not ( = ?auto_15221 ?auto_15240 ) ) ( not ( = ?auto_15222 ?auto_15225 ) ) ( not ( = ?auto_15222 ?auto_15240 ) ) ( not ( = ?auto_15223 ?auto_15225 ) ) ( not ( = ?auto_15223 ?auto_15240 ) ) ( not ( = ?auto_15225 ?auto_15234 ) ) ( not ( = ?auto_15225 ?auto_15249 ) ) ( not ( = ?auto_15225 ?auto_15237 ) ) ( not ( = ?auto_15225 ?auto_15242 ) ) ( not ( = ?auto_15225 ?auto_15235 ) ) ( not ( = ?auto_15225 ?auto_15248 ) ) ( not ( = ?auto_15225 ?auto_15245 ) ) ( not ( = ?auto_15225 ?auto_15252 ) ) ( not ( = ?auto_15225 ?auto_15241 ) ) ( not ( = ?auto_15225 ?auto_15255 ) ) ( not ( = ?auto_15240 ?auto_15234 ) ) ( not ( = ?auto_15240 ?auto_15249 ) ) ( not ( = ?auto_15240 ?auto_15237 ) ) ( not ( = ?auto_15240 ?auto_15242 ) ) ( not ( = ?auto_15240 ?auto_15235 ) ) ( not ( = ?auto_15240 ?auto_15248 ) ) ( not ( = ?auto_15240 ?auto_15245 ) ) ( not ( = ?auto_15240 ?auto_15252 ) ) ( not ( = ?auto_15240 ?auto_15241 ) ) ( not ( = ?auto_15240 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15226 ) ) ( not ( = ?auto_15214 ?auto_15236 ) ) ( not ( = ?auto_15215 ?auto_15226 ) ) ( not ( = ?auto_15215 ?auto_15236 ) ) ( not ( = ?auto_15216 ?auto_15226 ) ) ( not ( = ?auto_15216 ?auto_15236 ) ) ( not ( = ?auto_15217 ?auto_15226 ) ) ( not ( = ?auto_15217 ?auto_15236 ) ) ( not ( = ?auto_15218 ?auto_15226 ) ) ( not ( = ?auto_15218 ?auto_15236 ) ) ( not ( = ?auto_15219 ?auto_15226 ) ) ( not ( = ?auto_15219 ?auto_15236 ) ) ( not ( = ?auto_15220 ?auto_15226 ) ) ( not ( = ?auto_15220 ?auto_15236 ) ) ( not ( = ?auto_15221 ?auto_15226 ) ) ( not ( = ?auto_15221 ?auto_15236 ) ) ( not ( = ?auto_15222 ?auto_15226 ) ) ( not ( = ?auto_15222 ?auto_15236 ) ) ( not ( = ?auto_15223 ?auto_15226 ) ) ( not ( = ?auto_15223 ?auto_15236 ) ) ( not ( = ?auto_15224 ?auto_15226 ) ) ( not ( = ?auto_15224 ?auto_15236 ) ) ( not ( = ?auto_15226 ?auto_15240 ) ) ( not ( = ?auto_15226 ?auto_15234 ) ) ( not ( = ?auto_15226 ?auto_15249 ) ) ( not ( = ?auto_15226 ?auto_15237 ) ) ( not ( = ?auto_15226 ?auto_15242 ) ) ( not ( = ?auto_15226 ?auto_15235 ) ) ( not ( = ?auto_15226 ?auto_15248 ) ) ( not ( = ?auto_15226 ?auto_15245 ) ) ( not ( = ?auto_15226 ?auto_15252 ) ) ( not ( = ?auto_15226 ?auto_15241 ) ) ( not ( = ?auto_15226 ?auto_15255 ) ) ( not ( = ?auto_15250 ?auto_15247 ) ) ( not ( = ?auto_15250 ?auto_15232 ) ) ( not ( = ?auto_15250 ?auto_15251 ) ) ( not ( = ?auto_15250 ?auto_15238 ) ) ( not ( = ?auto_15250 ?auto_15253 ) ) ( not ( = ?auto_15244 ?auto_15254 ) ) ( not ( = ?auto_15244 ?auto_15229 ) ) ( not ( = ?auto_15244 ?auto_15246 ) ) ( not ( = ?auto_15244 ?auto_15239 ) ) ( not ( = ?auto_15244 ?auto_15243 ) ) ( not ( = ?auto_15236 ?auto_15240 ) ) ( not ( = ?auto_15236 ?auto_15234 ) ) ( not ( = ?auto_15236 ?auto_15249 ) ) ( not ( = ?auto_15236 ?auto_15237 ) ) ( not ( = ?auto_15236 ?auto_15242 ) ) ( not ( = ?auto_15236 ?auto_15235 ) ) ( not ( = ?auto_15236 ?auto_15248 ) ) ( not ( = ?auto_15236 ?auto_15245 ) ) ( not ( = ?auto_15236 ?auto_15252 ) ) ( not ( = ?auto_15236 ?auto_15241 ) ) ( not ( = ?auto_15236 ?auto_15255 ) ) ( not ( = ?auto_15214 ?auto_15227 ) ) ( not ( = ?auto_15214 ?auto_15233 ) ) ( not ( = ?auto_15215 ?auto_15227 ) ) ( not ( = ?auto_15215 ?auto_15233 ) ) ( not ( = ?auto_15216 ?auto_15227 ) ) ( not ( = ?auto_15216 ?auto_15233 ) ) ( not ( = ?auto_15217 ?auto_15227 ) ) ( not ( = ?auto_15217 ?auto_15233 ) ) ( not ( = ?auto_15218 ?auto_15227 ) ) ( not ( = ?auto_15218 ?auto_15233 ) ) ( not ( = ?auto_15219 ?auto_15227 ) ) ( not ( = ?auto_15219 ?auto_15233 ) ) ( not ( = ?auto_15220 ?auto_15227 ) ) ( not ( = ?auto_15220 ?auto_15233 ) ) ( not ( = ?auto_15221 ?auto_15227 ) ) ( not ( = ?auto_15221 ?auto_15233 ) ) ( not ( = ?auto_15222 ?auto_15227 ) ) ( not ( = ?auto_15222 ?auto_15233 ) ) ( not ( = ?auto_15223 ?auto_15227 ) ) ( not ( = ?auto_15223 ?auto_15233 ) ) ( not ( = ?auto_15224 ?auto_15227 ) ) ( not ( = ?auto_15224 ?auto_15233 ) ) ( not ( = ?auto_15225 ?auto_15227 ) ) ( not ( = ?auto_15225 ?auto_15233 ) ) ( not ( = ?auto_15227 ?auto_15236 ) ) ( not ( = ?auto_15227 ?auto_15240 ) ) ( not ( = ?auto_15227 ?auto_15234 ) ) ( not ( = ?auto_15227 ?auto_15249 ) ) ( not ( = ?auto_15227 ?auto_15237 ) ) ( not ( = ?auto_15227 ?auto_15242 ) ) ( not ( = ?auto_15227 ?auto_15235 ) ) ( not ( = ?auto_15227 ?auto_15248 ) ) ( not ( = ?auto_15227 ?auto_15245 ) ) ( not ( = ?auto_15227 ?auto_15252 ) ) ( not ( = ?auto_15227 ?auto_15241 ) ) ( not ( = ?auto_15227 ?auto_15255 ) ) ( not ( = ?auto_15233 ?auto_15236 ) ) ( not ( = ?auto_15233 ?auto_15240 ) ) ( not ( = ?auto_15233 ?auto_15234 ) ) ( not ( = ?auto_15233 ?auto_15249 ) ) ( not ( = ?auto_15233 ?auto_15237 ) ) ( not ( = ?auto_15233 ?auto_15242 ) ) ( not ( = ?auto_15233 ?auto_15235 ) ) ( not ( = ?auto_15233 ?auto_15248 ) ) ( not ( = ?auto_15233 ?auto_15245 ) ) ( not ( = ?auto_15233 ?auto_15252 ) ) ( not ( = ?auto_15233 ?auto_15241 ) ) ( not ( = ?auto_15233 ?auto_15255 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_15214 ?auto_15215 ?auto_15216 ?auto_15217 ?auto_15218 ?auto_15219 ?auto_15220 ?auto_15221 ?auto_15222 ?auto_15223 ?auto_15224 ?auto_15225 ?auto_15226 )
      ( MAKE-1CRATE ?auto_15226 ?auto_15227 )
      ( MAKE-13CRATE-VERIFY ?auto_15214 ?auto_15215 ?auto_15216 ?auto_15217 ?auto_15218 ?auto_15219 ?auto_15220 ?auto_15221 ?auto_15222 ?auto_15223 ?auto_15224 ?auto_15225 ?auto_15226 ?auto_15227 ) )
  )

)

