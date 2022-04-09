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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63689 - SURFACE
      ?auto_63690 - SURFACE
    )
    :vars
    (
      ?auto_63691 - HOIST
      ?auto_63692 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63691 ?auto_63692 ) ( SURFACE-AT ?auto_63689 ?auto_63692 ) ( CLEAR ?auto_63689 ) ( LIFTING ?auto_63691 ?auto_63690 ) ( IS-CRATE ?auto_63690 ) ( not ( = ?auto_63689 ?auto_63690 ) ) )
    :subtasks
    ( ( !DROP ?auto_63691 ?auto_63690 ?auto_63689 ?auto_63692 )
      ( MAKE-1CRATE-VERIFY ?auto_63689 ?auto_63690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63693 - SURFACE
      ?auto_63694 - SURFACE
    )
    :vars
    (
      ?auto_63696 - HOIST
      ?auto_63695 - PLACE
      ?auto_63697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63696 ?auto_63695 ) ( SURFACE-AT ?auto_63693 ?auto_63695 ) ( CLEAR ?auto_63693 ) ( IS-CRATE ?auto_63694 ) ( not ( = ?auto_63693 ?auto_63694 ) ) ( TRUCK-AT ?auto_63697 ?auto_63695 ) ( AVAILABLE ?auto_63696 ) ( IN ?auto_63694 ?auto_63697 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63696 ?auto_63694 ?auto_63697 ?auto_63695 )
      ( MAKE-1CRATE ?auto_63693 ?auto_63694 )
      ( MAKE-1CRATE-VERIFY ?auto_63693 ?auto_63694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63698 - SURFACE
      ?auto_63699 - SURFACE
    )
    :vars
    (
      ?auto_63701 - HOIST
      ?auto_63700 - PLACE
      ?auto_63702 - TRUCK
      ?auto_63703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63701 ?auto_63700 ) ( SURFACE-AT ?auto_63698 ?auto_63700 ) ( CLEAR ?auto_63698 ) ( IS-CRATE ?auto_63699 ) ( not ( = ?auto_63698 ?auto_63699 ) ) ( AVAILABLE ?auto_63701 ) ( IN ?auto_63699 ?auto_63702 ) ( TRUCK-AT ?auto_63702 ?auto_63703 ) ( not ( = ?auto_63703 ?auto_63700 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63702 ?auto_63703 ?auto_63700 )
      ( MAKE-1CRATE ?auto_63698 ?auto_63699 )
      ( MAKE-1CRATE-VERIFY ?auto_63698 ?auto_63699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63704 - SURFACE
      ?auto_63705 - SURFACE
    )
    :vars
    (
      ?auto_63709 - HOIST
      ?auto_63707 - PLACE
      ?auto_63708 - TRUCK
      ?auto_63706 - PLACE
      ?auto_63710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63709 ?auto_63707 ) ( SURFACE-AT ?auto_63704 ?auto_63707 ) ( CLEAR ?auto_63704 ) ( IS-CRATE ?auto_63705 ) ( not ( = ?auto_63704 ?auto_63705 ) ) ( AVAILABLE ?auto_63709 ) ( TRUCK-AT ?auto_63708 ?auto_63706 ) ( not ( = ?auto_63706 ?auto_63707 ) ) ( HOIST-AT ?auto_63710 ?auto_63706 ) ( LIFTING ?auto_63710 ?auto_63705 ) ( not ( = ?auto_63709 ?auto_63710 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63710 ?auto_63705 ?auto_63708 ?auto_63706 )
      ( MAKE-1CRATE ?auto_63704 ?auto_63705 )
      ( MAKE-1CRATE-VERIFY ?auto_63704 ?auto_63705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63711 - SURFACE
      ?auto_63712 - SURFACE
    )
    :vars
    (
      ?auto_63715 - HOIST
      ?auto_63716 - PLACE
      ?auto_63714 - TRUCK
      ?auto_63713 - PLACE
      ?auto_63717 - HOIST
      ?auto_63718 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63715 ?auto_63716 ) ( SURFACE-AT ?auto_63711 ?auto_63716 ) ( CLEAR ?auto_63711 ) ( IS-CRATE ?auto_63712 ) ( not ( = ?auto_63711 ?auto_63712 ) ) ( AVAILABLE ?auto_63715 ) ( TRUCK-AT ?auto_63714 ?auto_63713 ) ( not ( = ?auto_63713 ?auto_63716 ) ) ( HOIST-AT ?auto_63717 ?auto_63713 ) ( not ( = ?auto_63715 ?auto_63717 ) ) ( AVAILABLE ?auto_63717 ) ( SURFACE-AT ?auto_63712 ?auto_63713 ) ( ON ?auto_63712 ?auto_63718 ) ( CLEAR ?auto_63712 ) ( not ( = ?auto_63711 ?auto_63718 ) ) ( not ( = ?auto_63712 ?auto_63718 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63717 ?auto_63712 ?auto_63718 ?auto_63713 )
      ( MAKE-1CRATE ?auto_63711 ?auto_63712 )
      ( MAKE-1CRATE-VERIFY ?auto_63711 ?auto_63712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63719 - SURFACE
      ?auto_63720 - SURFACE
    )
    :vars
    (
      ?auto_63725 - HOIST
      ?auto_63726 - PLACE
      ?auto_63723 - PLACE
      ?auto_63721 - HOIST
      ?auto_63724 - SURFACE
      ?auto_63722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63725 ?auto_63726 ) ( SURFACE-AT ?auto_63719 ?auto_63726 ) ( CLEAR ?auto_63719 ) ( IS-CRATE ?auto_63720 ) ( not ( = ?auto_63719 ?auto_63720 ) ) ( AVAILABLE ?auto_63725 ) ( not ( = ?auto_63723 ?auto_63726 ) ) ( HOIST-AT ?auto_63721 ?auto_63723 ) ( not ( = ?auto_63725 ?auto_63721 ) ) ( AVAILABLE ?auto_63721 ) ( SURFACE-AT ?auto_63720 ?auto_63723 ) ( ON ?auto_63720 ?auto_63724 ) ( CLEAR ?auto_63720 ) ( not ( = ?auto_63719 ?auto_63724 ) ) ( not ( = ?auto_63720 ?auto_63724 ) ) ( TRUCK-AT ?auto_63722 ?auto_63726 ) )
    :subtasks
    ( ( !DRIVE ?auto_63722 ?auto_63726 ?auto_63723 )
      ( MAKE-1CRATE ?auto_63719 ?auto_63720 )
      ( MAKE-1CRATE-VERIFY ?auto_63719 ?auto_63720 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63736 - SURFACE
      ?auto_63737 - SURFACE
      ?auto_63738 - SURFACE
    )
    :vars
    (
      ?auto_63740 - HOIST
      ?auto_63739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63740 ?auto_63739 ) ( SURFACE-AT ?auto_63737 ?auto_63739 ) ( CLEAR ?auto_63737 ) ( LIFTING ?auto_63740 ?auto_63738 ) ( IS-CRATE ?auto_63738 ) ( not ( = ?auto_63737 ?auto_63738 ) ) ( ON ?auto_63737 ?auto_63736 ) ( not ( = ?auto_63736 ?auto_63737 ) ) ( not ( = ?auto_63736 ?auto_63738 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63737 ?auto_63738 )
      ( MAKE-2CRATE-VERIFY ?auto_63736 ?auto_63737 ?auto_63738 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63746 - SURFACE
      ?auto_63747 - SURFACE
      ?auto_63748 - SURFACE
    )
    :vars
    (
      ?auto_63750 - HOIST
      ?auto_63751 - PLACE
      ?auto_63749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63750 ?auto_63751 ) ( SURFACE-AT ?auto_63747 ?auto_63751 ) ( CLEAR ?auto_63747 ) ( IS-CRATE ?auto_63748 ) ( not ( = ?auto_63747 ?auto_63748 ) ) ( TRUCK-AT ?auto_63749 ?auto_63751 ) ( AVAILABLE ?auto_63750 ) ( IN ?auto_63748 ?auto_63749 ) ( ON ?auto_63747 ?auto_63746 ) ( not ( = ?auto_63746 ?auto_63747 ) ) ( not ( = ?auto_63746 ?auto_63748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63747 ?auto_63748 )
      ( MAKE-2CRATE-VERIFY ?auto_63746 ?auto_63747 ?auto_63748 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63752 - SURFACE
      ?auto_63753 - SURFACE
    )
    :vars
    (
      ?auto_63756 - HOIST
      ?auto_63757 - PLACE
      ?auto_63755 - TRUCK
      ?auto_63754 - SURFACE
      ?auto_63758 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63756 ?auto_63757 ) ( SURFACE-AT ?auto_63752 ?auto_63757 ) ( CLEAR ?auto_63752 ) ( IS-CRATE ?auto_63753 ) ( not ( = ?auto_63752 ?auto_63753 ) ) ( AVAILABLE ?auto_63756 ) ( IN ?auto_63753 ?auto_63755 ) ( ON ?auto_63752 ?auto_63754 ) ( not ( = ?auto_63754 ?auto_63752 ) ) ( not ( = ?auto_63754 ?auto_63753 ) ) ( TRUCK-AT ?auto_63755 ?auto_63758 ) ( not ( = ?auto_63758 ?auto_63757 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63755 ?auto_63758 ?auto_63757 )
      ( MAKE-2CRATE ?auto_63754 ?auto_63752 ?auto_63753 )
      ( MAKE-1CRATE-VERIFY ?auto_63752 ?auto_63753 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63759 - SURFACE
      ?auto_63760 - SURFACE
      ?auto_63761 - SURFACE
    )
    :vars
    (
      ?auto_63765 - HOIST
      ?auto_63762 - PLACE
      ?auto_63764 - TRUCK
      ?auto_63763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63765 ?auto_63762 ) ( SURFACE-AT ?auto_63760 ?auto_63762 ) ( CLEAR ?auto_63760 ) ( IS-CRATE ?auto_63761 ) ( not ( = ?auto_63760 ?auto_63761 ) ) ( AVAILABLE ?auto_63765 ) ( IN ?auto_63761 ?auto_63764 ) ( ON ?auto_63760 ?auto_63759 ) ( not ( = ?auto_63759 ?auto_63760 ) ) ( not ( = ?auto_63759 ?auto_63761 ) ) ( TRUCK-AT ?auto_63764 ?auto_63763 ) ( not ( = ?auto_63763 ?auto_63762 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63760 ?auto_63761 )
      ( MAKE-2CRATE-VERIFY ?auto_63759 ?auto_63760 ?auto_63761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63766 - SURFACE
      ?auto_63767 - SURFACE
    )
    :vars
    (
      ?auto_63771 - HOIST
      ?auto_63770 - PLACE
      ?auto_63772 - SURFACE
      ?auto_63768 - TRUCK
      ?auto_63769 - PLACE
      ?auto_63773 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63771 ?auto_63770 ) ( SURFACE-AT ?auto_63766 ?auto_63770 ) ( CLEAR ?auto_63766 ) ( IS-CRATE ?auto_63767 ) ( not ( = ?auto_63766 ?auto_63767 ) ) ( AVAILABLE ?auto_63771 ) ( ON ?auto_63766 ?auto_63772 ) ( not ( = ?auto_63772 ?auto_63766 ) ) ( not ( = ?auto_63772 ?auto_63767 ) ) ( TRUCK-AT ?auto_63768 ?auto_63769 ) ( not ( = ?auto_63769 ?auto_63770 ) ) ( HOIST-AT ?auto_63773 ?auto_63769 ) ( LIFTING ?auto_63773 ?auto_63767 ) ( not ( = ?auto_63771 ?auto_63773 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63773 ?auto_63767 ?auto_63768 ?auto_63769 )
      ( MAKE-2CRATE ?auto_63772 ?auto_63766 ?auto_63767 )
      ( MAKE-1CRATE-VERIFY ?auto_63766 ?auto_63767 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63774 - SURFACE
      ?auto_63775 - SURFACE
      ?auto_63776 - SURFACE
    )
    :vars
    (
      ?auto_63781 - HOIST
      ?auto_63780 - PLACE
      ?auto_63778 - TRUCK
      ?auto_63779 - PLACE
      ?auto_63777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63781 ?auto_63780 ) ( SURFACE-AT ?auto_63775 ?auto_63780 ) ( CLEAR ?auto_63775 ) ( IS-CRATE ?auto_63776 ) ( not ( = ?auto_63775 ?auto_63776 ) ) ( AVAILABLE ?auto_63781 ) ( ON ?auto_63775 ?auto_63774 ) ( not ( = ?auto_63774 ?auto_63775 ) ) ( not ( = ?auto_63774 ?auto_63776 ) ) ( TRUCK-AT ?auto_63778 ?auto_63779 ) ( not ( = ?auto_63779 ?auto_63780 ) ) ( HOIST-AT ?auto_63777 ?auto_63779 ) ( LIFTING ?auto_63777 ?auto_63776 ) ( not ( = ?auto_63781 ?auto_63777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63775 ?auto_63776 )
      ( MAKE-2CRATE-VERIFY ?auto_63774 ?auto_63775 ?auto_63776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63782 - SURFACE
      ?auto_63783 - SURFACE
    )
    :vars
    (
      ?auto_63787 - HOIST
      ?auto_63784 - PLACE
      ?auto_63788 - SURFACE
      ?auto_63786 - TRUCK
      ?auto_63789 - PLACE
      ?auto_63785 - HOIST
      ?auto_63790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63787 ?auto_63784 ) ( SURFACE-AT ?auto_63782 ?auto_63784 ) ( CLEAR ?auto_63782 ) ( IS-CRATE ?auto_63783 ) ( not ( = ?auto_63782 ?auto_63783 ) ) ( AVAILABLE ?auto_63787 ) ( ON ?auto_63782 ?auto_63788 ) ( not ( = ?auto_63788 ?auto_63782 ) ) ( not ( = ?auto_63788 ?auto_63783 ) ) ( TRUCK-AT ?auto_63786 ?auto_63789 ) ( not ( = ?auto_63789 ?auto_63784 ) ) ( HOIST-AT ?auto_63785 ?auto_63789 ) ( not ( = ?auto_63787 ?auto_63785 ) ) ( AVAILABLE ?auto_63785 ) ( SURFACE-AT ?auto_63783 ?auto_63789 ) ( ON ?auto_63783 ?auto_63790 ) ( CLEAR ?auto_63783 ) ( not ( = ?auto_63782 ?auto_63790 ) ) ( not ( = ?auto_63783 ?auto_63790 ) ) ( not ( = ?auto_63788 ?auto_63790 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63785 ?auto_63783 ?auto_63790 ?auto_63789 )
      ( MAKE-2CRATE ?auto_63788 ?auto_63782 ?auto_63783 )
      ( MAKE-1CRATE-VERIFY ?auto_63782 ?auto_63783 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63791 - SURFACE
      ?auto_63792 - SURFACE
      ?auto_63793 - SURFACE
    )
    :vars
    (
      ?auto_63795 - HOIST
      ?auto_63799 - PLACE
      ?auto_63794 - TRUCK
      ?auto_63798 - PLACE
      ?auto_63796 - HOIST
      ?auto_63797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63795 ?auto_63799 ) ( SURFACE-AT ?auto_63792 ?auto_63799 ) ( CLEAR ?auto_63792 ) ( IS-CRATE ?auto_63793 ) ( not ( = ?auto_63792 ?auto_63793 ) ) ( AVAILABLE ?auto_63795 ) ( ON ?auto_63792 ?auto_63791 ) ( not ( = ?auto_63791 ?auto_63792 ) ) ( not ( = ?auto_63791 ?auto_63793 ) ) ( TRUCK-AT ?auto_63794 ?auto_63798 ) ( not ( = ?auto_63798 ?auto_63799 ) ) ( HOIST-AT ?auto_63796 ?auto_63798 ) ( not ( = ?auto_63795 ?auto_63796 ) ) ( AVAILABLE ?auto_63796 ) ( SURFACE-AT ?auto_63793 ?auto_63798 ) ( ON ?auto_63793 ?auto_63797 ) ( CLEAR ?auto_63793 ) ( not ( = ?auto_63792 ?auto_63797 ) ) ( not ( = ?auto_63793 ?auto_63797 ) ) ( not ( = ?auto_63791 ?auto_63797 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63792 ?auto_63793 )
      ( MAKE-2CRATE-VERIFY ?auto_63791 ?auto_63792 ?auto_63793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63800 - SURFACE
      ?auto_63801 - SURFACE
    )
    :vars
    (
      ?auto_63802 - HOIST
      ?auto_63805 - PLACE
      ?auto_63807 - SURFACE
      ?auto_63803 - PLACE
      ?auto_63808 - HOIST
      ?auto_63806 - SURFACE
      ?auto_63804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63802 ?auto_63805 ) ( SURFACE-AT ?auto_63800 ?auto_63805 ) ( CLEAR ?auto_63800 ) ( IS-CRATE ?auto_63801 ) ( not ( = ?auto_63800 ?auto_63801 ) ) ( AVAILABLE ?auto_63802 ) ( ON ?auto_63800 ?auto_63807 ) ( not ( = ?auto_63807 ?auto_63800 ) ) ( not ( = ?auto_63807 ?auto_63801 ) ) ( not ( = ?auto_63803 ?auto_63805 ) ) ( HOIST-AT ?auto_63808 ?auto_63803 ) ( not ( = ?auto_63802 ?auto_63808 ) ) ( AVAILABLE ?auto_63808 ) ( SURFACE-AT ?auto_63801 ?auto_63803 ) ( ON ?auto_63801 ?auto_63806 ) ( CLEAR ?auto_63801 ) ( not ( = ?auto_63800 ?auto_63806 ) ) ( not ( = ?auto_63801 ?auto_63806 ) ) ( not ( = ?auto_63807 ?auto_63806 ) ) ( TRUCK-AT ?auto_63804 ?auto_63805 ) )
    :subtasks
    ( ( !DRIVE ?auto_63804 ?auto_63805 ?auto_63803 )
      ( MAKE-2CRATE ?auto_63807 ?auto_63800 ?auto_63801 )
      ( MAKE-1CRATE-VERIFY ?auto_63800 ?auto_63801 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63809 - SURFACE
      ?auto_63810 - SURFACE
      ?auto_63811 - SURFACE
    )
    :vars
    (
      ?auto_63813 - HOIST
      ?auto_63816 - PLACE
      ?auto_63815 - PLACE
      ?auto_63812 - HOIST
      ?auto_63817 - SURFACE
      ?auto_63814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63813 ?auto_63816 ) ( SURFACE-AT ?auto_63810 ?auto_63816 ) ( CLEAR ?auto_63810 ) ( IS-CRATE ?auto_63811 ) ( not ( = ?auto_63810 ?auto_63811 ) ) ( AVAILABLE ?auto_63813 ) ( ON ?auto_63810 ?auto_63809 ) ( not ( = ?auto_63809 ?auto_63810 ) ) ( not ( = ?auto_63809 ?auto_63811 ) ) ( not ( = ?auto_63815 ?auto_63816 ) ) ( HOIST-AT ?auto_63812 ?auto_63815 ) ( not ( = ?auto_63813 ?auto_63812 ) ) ( AVAILABLE ?auto_63812 ) ( SURFACE-AT ?auto_63811 ?auto_63815 ) ( ON ?auto_63811 ?auto_63817 ) ( CLEAR ?auto_63811 ) ( not ( = ?auto_63810 ?auto_63817 ) ) ( not ( = ?auto_63811 ?auto_63817 ) ) ( not ( = ?auto_63809 ?auto_63817 ) ) ( TRUCK-AT ?auto_63814 ?auto_63816 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63810 ?auto_63811 )
      ( MAKE-2CRATE-VERIFY ?auto_63809 ?auto_63810 ?auto_63811 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63818 - SURFACE
      ?auto_63819 - SURFACE
    )
    :vars
    (
      ?auto_63825 - HOIST
      ?auto_63823 - PLACE
      ?auto_63826 - SURFACE
      ?auto_63824 - PLACE
      ?auto_63820 - HOIST
      ?auto_63822 - SURFACE
      ?auto_63821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63825 ?auto_63823 ) ( IS-CRATE ?auto_63819 ) ( not ( = ?auto_63818 ?auto_63819 ) ) ( not ( = ?auto_63826 ?auto_63818 ) ) ( not ( = ?auto_63826 ?auto_63819 ) ) ( not ( = ?auto_63824 ?auto_63823 ) ) ( HOIST-AT ?auto_63820 ?auto_63824 ) ( not ( = ?auto_63825 ?auto_63820 ) ) ( AVAILABLE ?auto_63820 ) ( SURFACE-AT ?auto_63819 ?auto_63824 ) ( ON ?auto_63819 ?auto_63822 ) ( CLEAR ?auto_63819 ) ( not ( = ?auto_63818 ?auto_63822 ) ) ( not ( = ?auto_63819 ?auto_63822 ) ) ( not ( = ?auto_63826 ?auto_63822 ) ) ( TRUCK-AT ?auto_63821 ?auto_63823 ) ( SURFACE-AT ?auto_63826 ?auto_63823 ) ( CLEAR ?auto_63826 ) ( LIFTING ?auto_63825 ?auto_63818 ) ( IS-CRATE ?auto_63818 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63826 ?auto_63818 )
      ( MAKE-2CRATE ?auto_63826 ?auto_63818 ?auto_63819 )
      ( MAKE-1CRATE-VERIFY ?auto_63818 ?auto_63819 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63827 - SURFACE
      ?auto_63828 - SURFACE
      ?auto_63829 - SURFACE
    )
    :vars
    (
      ?auto_63835 - HOIST
      ?auto_63833 - PLACE
      ?auto_63830 - PLACE
      ?auto_63834 - HOIST
      ?auto_63831 - SURFACE
      ?auto_63832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63835 ?auto_63833 ) ( IS-CRATE ?auto_63829 ) ( not ( = ?auto_63828 ?auto_63829 ) ) ( not ( = ?auto_63827 ?auto_63828 ) ) ( not ( = ?auto_63827 ?auto_63829 ) ) ( not ( = ?auto_63830 ?auto_63833 ) ) ( HOIST-AT ?auto_63834 ?auto_63830 ) ( not ( = ?auto_63835 ?auto_63834 ) ) ( AVAILABLE ?auto_63834 ) ( SURFACE-AT ?auto_63829 ?auto_63830 ) ( ON ?auto_63829 ?auto_63831 ) ( CLEAR ?auto_63829 ) ( not ( = ?auto_63828 ?auto_63831 ) ) ( not ( = ?auto_63829 ?auto_63831 ) ) ( not ( = ?auto_63827 ?auto_63831 ) ) ( TRUCK-AT ?auto_63832 ?auto_63833 ) ( SURFACE-AT ?auto_63827 ?auto_63833 ) ( CLEAR ?auto_63827 ) ( LIFTING ?auto_63835 ?auto_63828 ) ( IS-CRATE ?auto_63828 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63828 ?auto_63829 )
      ( MAKE-2CRATE-VERIFY ?auto_63827 ?auto_63828 ?auto_63829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63836 - SURFACE
      ?auto_63837 - SURFACE
    )
    :vars
    (
      ?auto_63841 - HOIST
      ?auto_63840 - PLACE
      ?auto_63844 - SURFACE
      ?auto_63842 - PLACE
      ?auto_63843 - HOIST
      ?auto_63839 - SURFACE
      ?auto_63838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63841 ?auto_63840 ) ( IS-CRATE ?auto_63837 ) ( not ( = ?auto_63836 ?auto_63837 ) ) ( not ( = ?auto_63844 ?auto_63836 ) ) ( not ( = ?auto_63844 ?auto_63837 ) ) ( not ( = ?auto_63842 ?auto_63840 ) ) ( HOIST-AT ?auto_63843 ?auto_63842 ) ( not ( = ?auto_63841 ?auto_63843 ) ) ( AVAILABLE ?auto_63843 ) ( SURFACE-AT ?auto_63837 ?auto_63842 ) ( ON ?auto_63837 ?auto_63839 ) ( CLEAR ?auto_63837 ) ( not ( = ?auto_63836 ?auto_63839 ) ) ( not ( = ?auto_63837 ?auto_63839 ) ) ( not ( = ?auto_63844 ?auto_63839 ) ) ( TRUCK-AT ?auto_63838 ?auto_63840 ) ( SURFACE-AT ?auto_63844 ?auto_63840 ) ( CLEAR ?auto_63844 ) ( IS-CRATE ?auto_63836 ) ( AVAILABLE ?auto_63841 ) ( IN ?auto_63836 ?auto_63838 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63841 ?auto_63836 ?auto_63838 ?auto_63840 )
      ( MAKE-2CRATE ?auto_63844 ?auto_63836 ?auto_63837 )
      ( MAKE-1CRATE-VERIFY ?auto_63836 ?auto_63837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63845 - SURFACE
      ?auto_63846 - SURFACE
      ?auto_63847 - SURFACE
    )
    :vars
    (
      ?auto_63848 - HOIST
      ?auto_63851 - PLACE
      ?auto_63852 - PLACE
      ?auto_63850 - HOIST
      ?auto_63849 - SURFACE
      ?auto_63853 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63848 ?auto_63851 ) ( IS-CRATE ?auto_63847 ) ( not ( = ?auto_63846 ?auto_63847 ) ) ( not ( = ?auto_63845 ?auto_63846 ) ) ( not ( = ?auto_63845 ?auto_63847 ) ) ( not ( = ?auto_63852 ?auto_63851 ) ) ( HOIST-AT ?auto_63850 ?auto_63852 ) ( not ( = ?auto_63848 ?auto_63850 ) ) ( AVAILABLE ?auto_63850 ) ( SURFACE-AT ?auto_63847 ?auto_63852 ) ( ON ?auto_63847 ?auto_63849 ) ( CLEAR ?auto_63847 ) ( not ( = ?auto_63846 ?auto_63849 ) ) ( not ( = ?auto_63847 ?auto_63849 ) ) ( not ( = ?auto_63845 ?auto_63849 ) ) ( TRUCK-AT ?auto_63853 ?auto_63851 ) ( SURFACE-AT ?auto_63845 ?auto_63851 ) ( CLEAR ?auto_63845 ) ( IS-CRATE ?auto_63846 ) ( AVAILABLE ?auto_63848 ) ( IN ?auto_63846 ?auto_63853 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63846 ?auto_63847 )
      ( MAKE-2CRATE-VERIFY ?auto_63845 ?auto_63846 ?auto_63847 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63890 - SURFACE
      ?auto_63891 - SURFACE
    )
    :vars
    (
      ?auto_63896 - HOIST
      ?auto_63893 - PLACE
      ?auto_63898 - SURFACE
      ?auto_63895 - PLACE
      ?auto_63892 - HOIST
      ?auto_63894 - SURFACE
      ?auto_63897 - TRUCK
      ?auto_63899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63896 ?auto_63893 ) ( SURFACE-AT ?auto_63890 ?auto_63893 ) ( CLEAR ?auto_63890 ) ( IS-CRATE ?auto_63891 ) ( not ( = ?auto_63890 ?auto_63891 ) ) ( AVAILABLE ?auto_63896 ) ( ON ?auto_63890 ?auto_63898 ) ( not ( = ?auto_63898 ?auto_63890 ) ) ( not ( = ?auto_63898 ?auto_63891 ) ) ( not ( = ?auto_63895 ?auto_63893 ) ) ( HOIST-AT ?auto_63892 ?auto_63895 ) ( not ( = ?auto_63896 ?auto_63892 ) ) ( AVAILABLE ?auto_63892 ) ( SURFACE-AT ?auto_63891 ?auto_63895 ) ( ON ?auto_63891 ?auto_63894 ) ( CLEAR ?auto_63891 ) ( not ( = ?auto_63890 ?auto_63894 ) ) ( not ( = ?auto_63891 ?auto_63894 ) ) ( not ( = ?auto_63898 ?auto_63894 ) ) ( TRUCK-AT ?auto_63897 ?auto_63899 ) ( not ( = ?auto_63899 ?auto_63893 ) ) ( not ( = ?auto_63895 ?auto_63899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63897 ?auto_63899 ?auto_63893 )
      ( MAKE-1CRATE ?auto_63890 ?auto_63891 )
      ( MAKE-1CRATE-VERIFY ?auto_63890 ?auto_63891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63929 - SURFACE
      ?auto_63930 - SURFACE
      ?auto_63931 - SURFACE
      ?auto_63932 - SURFACE
    )
    :vars
    (
      ?auto_63934 - HOIST
      ?auto_63933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63934 ?auto_63933 ) ( SURFACE-AT ?auto_63931 ?auto_63933 ) ( CLEAR ?auto_63931 ) ( LIFTING ?auto_63934 ?auto_63932 ) ( IS-CRATE ?auto_63932 ) ( not ( = ?auto_63931 ?auto_63932 ) ) ( ON ?auto_63930 ?auto_63929 ) ( ON ?auto_63931 ?auto_63930 ) ( not ( = ?auto_63929 ?auto_63930 ) ) ( not ( = ?auto_63929 ?auto_63931 ) ) ( not ( = ?auto_63929 ?auto_63932 ) ) ( not ( = ?auto_63930 ?auto_63931 ) ) ( not ( = ?auto_63930 ?auto_63932 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63931 ?auto_63932 )
      ( MAKE-3CRATE-VERIFY ?auto_63929 ?auto_63930 ?auto_63931 ?auto_63932 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63946 - SURFACE
      ?auto_63947 - SURFACE
      ?auto_63948 - SURFACE
      ?auto_63949 - SURFACE
    )
    :vars
    (
      ?auto_63950 - HOIST
      ?auto_63952 - PLACE
      ?auto_63951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63950 ?auto_63952 ) ( SURFACE-AT ?auto_63948 ?auto_63952 ) ( CLEAR ?auto_63948 ) ( IS-CRATE ?auto_63949 ) ( not ( = ?auto_63948 ?auto_63949 ) ) ( TRUCK-AT ?auto_63951 ?auto_63952 ) ( AVAILABLE ?auto_63950 ) ( IN ?auto_63949 ?auto_63951 ) ( ON ?auto_63948 ?auto_63947 ) ( not ( = ?auto_63947 ?auto_63948 ) ) ( not ( = ?auto_63947 ?auto_63949 ) ) ( ON ?auto_63947 ?auto_63946 ) ( not ( = ?auto_63946 ?auto_63947 ) ) ( not ( = ?auto_63946 ?auto_63948 ) ) ( not ( = ?auto_63946 ?auto_63949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63947 ?auto_63948 ?auto_63949 )
      ( MAKE-3CRATE-VERIFY ?auto_63946 ?auto_63947 ?auto_63948 ?auto_63949 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63967 - SURFACE
      ?auto_63968 - SURFACE
      ?auto_63969 - SURFACE
      ?auto_63970 - SURFACE
    )
    :vars
    (
      ?auto_63972 - HOIST
      ?auto_63971 - PLACE
      ?auto_63974 - TRUCK
      ?auto_63973 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63972 ?auto_63971 ) ( SURFACE-AT ?auto_63969 ?auto_63971 ) ( CLEAR ?auto_63969 ) ( IS-CRATE ?auto_63970 ) ( not ( = ?auto_63969 ?auto_63970 ) ) ( AVAILABLE ?auto_63972 ) ( IN ?auto_63970 ?auto_63974 ) ( ON ?auto_63969 ?auto_63968 ) ( not ( = ?auto_63968 ?auto_63969 ) ) ( not ( = ?auto_63968 ?auto_63970 ) ) ( TRUCK-AT ?auto_63974 ?auto_63973 ) ( not ( = ?auto_63973 ?auto_63971 ) ) ( ON ?auto_63968 ?auto_63967 ) ( not ( = ?auto_63967 ?auto_63968 ) ) ( not ( = ?auto_63967 ?auto_63969 ) ) ( not ( = ?auto_63967 ?auto_63970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63968 ?auto_63969 ?auto_63970 )
      ( MAKE-3CRATE-VERIFY ?auto_63967 ?auto_63968 ?auto_63969 ?auto_63970 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63991 - SURFACE
      ?auto_63992 - SURFACE
      ?auto_63993 - SURFACE
      ?auto_63994 - SURFACE
    )
    :vars
    (
      ?auto_63997 - HOIST
      ?auto_63998 - PLACE
      ?auto_63996 - TRUCK
      ?auto_63995 - PLACE
      ?auto_63999 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63997 ?auto_63998 ) ( SURFACE-AT ?auto_63993 ?auto_63998 ) ( CLEAR ?auto_63993 ) ( IS-CRATE ?auto_63994 ) ( not ( = ?auto_63993 ?auto_63994 ) ) ( AVAILABLE ?auto_63997 ) ( ON ?auto_63993 ?auto_63992 ) ( not ( = ?auto_63992 ?auto_63993 ) ) ( not ( = ?auto_63992 ?auto_63994 ) ) ( TRUCK-AT ?auto_63996 ?auto_63995 ) ( not ( = ?auto_63995 ?auto_63998 ) ) ( HOIST-AT ?auto_63999 ?auto_63995 ) ( LIFTING ?auto_63999 ?auto_63994 ) ( not ( = ?auto_63997 ?auto_63999 ) ) ( ON ?auto_63992 ?auto_63991 ) ( not ( = ?auto_63991 ?auto_63992 ) ) ( not ( = ?auto_63991 ?auto_63993 ) ) ( not ( = ?auto_63991 ?auto_63994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63992 ?auto_63993 ?auto_63994 )
      ( MAKE-3CRATE-VERIFY ?auto_63991 ?auto_63992 ?auto_63993 ?auto_63994 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64018 - SURFACE
      ?auto_64019 - SURFACE
      ?auto_64020 - SURFACE
      ?auto_64021 - SURFACE
    )
    :vars
    (
      ?auto_64026 - HOIST
      ?auto_64023 - PLACE
      ?auto_64024 - TRUCK
      ?auto_64027 - PLACE
      ?auto_64025 - HOIST
      ?auto_64022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64026 ?auto_64023 ) ( SURFACE-AT ?auto_64020 ?auto_64023 ) ( CLEAR ?auto_64020 ) ( IS-CRATE ?auto_64021 ) ( not ( = ?auto_64020 ?auto_64021 ) ) ( AVAILABLE ?auto_64026 ) ( ON ?auto_64020 ?auto_64019 ) ( not ( = ?auto_64019 ?auto_64020 ) ) ( not ( = ?auto_64019 ?auto_64021 ) ) ( TRUCK-AT ?auto_64024 ?auto_64027 ) ( not ( = ?auto_64027 ?auto_64023 ) ) ( HOIST-AT ?auto_64025 ?auto_64027 ) ( not ( = ?auto_64026 ?auto_64025 ) ) ( AVAILABLE ?auto_64025 ) ( SURFACE-AT ?auto_64021 ?auto_64027 ) ( ON ?auto_64021 ?auto_64022 ) ( CLEAR ?auto_64021 ) ( not ( = ?auto_64020 ?auto_64022 ) ) ( not ( = ?auto_64021 ?auto_64022 ) ) ( not ( = ?auto_64019 ?auto_64022 ) ) ( ON ?auto_64019 ?auto_64018 ) ( not ( = ?auto_64018 ?auto_64019 ) ) ( not ( = ?auto_64018 ?auto_64020 ) ) ( not ( = ?auto_64018 ?auto_64021 ) ) ( not ( = ?auto_64018 ?auto_64022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64019 ?auto_64020 ?auto_64021 )
      ( MAKE-3CRATE-VERIFY ?auto_64018 ?auto_64019 ?auto_64020 ?auto_64021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64046 - SURFACE
      ?auto_64047 - SURFACE
      ?auto_64048 - SURFACE
      ?auto_64049 - SURFACE
    )
    :vars
    (
      ?auto_64051 - HOIST
      ?auto_64050 - PLACE
      ?auto_64053 - PLACE
      ?auto_64054 - HOIST
      ?auto_64055 - SURFACE
      ?auto_64052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64051 ?auto_64050 ) ( SURFACE-AT ?auto_64048 ?auto_64050 ) ( CLEAR ?auto_64048 ) ( IS-CRATE ?auto_64049 ) ( not ( = ?auto_64048 ?auto_64049 ) ) ( AVAILABLE ?auto_64051 ) ( ON ?auto_64048 ?auto_64047 ) ( not ( = ?auto_64047 ?auto_64048 ) ) ( not ( = ?auto_64047 ?auto_64049 ) ) ( not ( = ?auto_64053 ?auto_64050 ) ) ( HOIST-AT ?auto_64054 ?auto_64053 ) ( not ( = ?auto_64051 ?auto_64054 ) ) ( AVAILABLE ?auto_64054 ) ( SURFACE-AT ?auto_64049 ?auto_64053 ) ( ON ?auto_64049 ?auto_64055 ) ( CLEAR ?auto_64049 ) ( not ( = ?auto_64048 ?auto_64055 ) ) ( not ( = ?auto_64049 ?auto_64055 ) ) ( not ( = ?auto_64047 ?auto_64055 ) ) ( TRUCK-AT ?auto_64052 ?auto_64050 ) ( ON ?auto_64047 ?auto_64046 ) ( not ( = ?auto_64046 ?auto_64047 ) ) ( not ( = ?auto_64046 ?auto_64048 ) ) ( not ( = ?auto_64046 ?auto_64049 ) ) ( not ( = ?auto_64046 ?auto_64055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64047 ?auto_64048 ?auto_64049 )
      ( MAKE-3CRATE-VERIFY ?auto_64046 ?auto_64047 ?auto_64048 ?auto_64049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64074 - SURFACE
      ?auto_64075 - SURFACE
      ?auto_64076 - SURFACE
      ?auto_64077 - SURFACE
    )
    :vars
    (
      ?auto_64083 - HOIST
      ?auto_64078 - PLACE
      ?auto_64079 - PLACE
      ?auto_64080 - HOIST
      ?auto_64082 - SURFACE
      ?auto_64081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64083 ?auto_64078 ) ( IS-CRATE ?auto_64077 ) ( not ( = ?auto_64076 ?auto_64077 ) ) ( not ( = ?auto_64075 ?auto_64076 ) ) ( not ( = ?auto_64075 ?auto_64077 ) ) ( not ( = ?auto_64079 ?auto_64078 ) ) ( HOIST-AT ?auto_64080 ?auto_64079 ) ( not ( = ?auto_64083 ?auto_64080 ) ) ( AVAILABLE ?auto_64080 ) ( SURFACE-AT ?auto_64077 ?auto_64079 ) ( ON ?auto_64077 ?auto_64082 ) ( CLEAR ?auto_64077 ) ( not ( = ?auto_64076 ?auto_64082 ) ) ( not ( = ?auto_64077 ?auto_64082 ) ) ( not ( = ?auto_64075 ?auto_64082 ) ) ( TRUCK-AT ?auto_64081 ?auto_64078 ) ( SURFACE-AT ?auto_64075 ?auto_64078 ) ( CLEAR ?auto_64075 ) ( LIFTING ?auto_64083 ?auto_64076 ) ( IS-CRATE ?auto_64076 ) ( ON ?auto_64075 ?auto_64074 ) ( not ( = ?auto_64074 ?auto_64075 ) ) ( not ( = ?auto_64074 ?auto_64076 ) ) ( not ( = ?auto_64074 ?auto_64077 ) ) ( not ( = ?auto_64074 ?auto_64082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64075 ?auto_64076 ?auto_64077 )
      ( MAKE-3CRATE-VERIFY ?auto_64074 ?auto_64075 ?auto_64076 ?auto_64077 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64102 - SURFACE
      ?auto_64103 - SURFACE
      ?auto_64104 - SURFACE
      ?auto_64105 - SURFACE
    )
    :vars
    (
      ?auto_64110 - HOIST
      ?auto_64108 - PLACE
      ?auto_64106 - PLACE
      ?auto_64109 - HOIST
      ?auto_64111 - SURFACE
      ?auto_64107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64110 ?auto_64108 ) ( IS-CRATE ?auto_64105 ) ( not ( = ?auto_64104 ?auto_64105 ) ) ( not ( = ?auto_64103 ?auto_64104 ) ) ( not ( = ?auto_64103 ?auto_64105 ) ) ( not ( = ?auto_64106 ?auto_64108 ) ) ( HOIST-AT ?auto_64109 ?auto_64106 ) ( not ( = ?auto_64110 ?auto_64109 ) ) ( AVAILABLE ?auto_64109 ) ( SURFACE-AT ?auto_64105 ?auto_64106 ) ( ON ?auto_64105 ?auto_64111 ) ( CLEAR ?auto_64105 ) ( not ( = ?auto_64104 ?auto_64111 ) ) ( not ( = ?auto_64105 ?auto_64111 ) ) ( not ( = ?auto_64103 ?auto_64111 ) ) ( TRUCK-AT ?auto_64107 ?auto_64108 ) ( SURFACE-AT ?auto_64103 ?auto_64108 ) ( CLEAR ?auto_64103 ) ( IS-CRATE ?auto_64104 ) ( AVAILABLE ?auto_64110 ) ( IN ?auto_64104 ?auto_64107 ) ( ON ?auto_64103 ?auto_64102 ) ( not ( = ?auto_64102 ?auto_64103 ) ) ( not ( = ?auto_64102 ?auto_64104 ) ) ( not ( = ?auto_64102 ?auto_64105 ) ) ( not ( = ?auto_64102 ?auto_64111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64103 ?auto_64104 ?auto_64105 )
      ( MAKE-3CRATE-VERIFY ?auto_64102 ?auto_64103 ?auto_64104 ?auto_64105 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64393 - SURFACE
      ?auto_64394 - SURFACE
      ?auto_64395 - SURFACE
      ?auto_64396 - SURFACE
      ?auto_64397 - SURFACE
    )
    :vars
    (
      ?auto_64399 - HOIST
      ?auto_64398 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64399 ?auto_64398 ) ( SURFACE-AT ?auto_64396 ?auto_64398 ) ( CLEAR ?auto_64396 ) ( LIFTING ?auto_64399 ?auto_64397 ) ( IS-CRATE ?auto_64397 ) ( not ( = ?auto_64396 ?auto_64397 ) ) ( ON ?auto_64394 ?auto_64393 ) ( ON ?auto_64395 ?auto_64394 ) ( ON ?auto_64396 ?auto_64395 ) ( not ( = ?auto_64393 ?auto_64394 ) ) ( not ( = ?auto_64393 ?auto_64395 ) ) ( not ( = ?auto_64393 ?auto_64396 ) ) ( not ( = ?auto_64393 ?auto_64397 ) ) ( not ( = ?auto_64394 ?auto_64395 ) ) ( not ( = ?auto_64394 ?auto_64396 ) ) ( not ( = ?auto_64394 ?auto_64397 ) ) ( not ( = ?auto_64395 ?auto_64396 ) ) ( not ( = ?auto_64395 ?auto_64397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_64396 ?auto_64397 )
      ( MAKE-4CRATE-VERIFY ?auto_64393 ?auto_64394 ?auto_64395 ?auto_64396 ?auto_64397 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64418 - SURFACE
      ?auto_64419 - SURFACE
      ?auto_64420 - SURFACE
      ?auto_64421 - SURFACE
      ?auto_64422 - SURFACE
    )
    :vars
    (
      ?auto_64424 - HOIST
      ?auto_64425 - PLACE
      ?auto_64423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64424 ?auto_64425 ) ( SURFACE-AT ?auto_64421 ?auto_64425 ) ( CLEAR ?auto_64421 ) ( IS-CRATE ?auto_64422 ) ( not ( = ?auto_64421 ?auto_64422 ) ) ( TRUCK-AT ?auto_64423 ?auto_64425 ) ( AVAILABLE ?auto_64424 ) ( IN ?auto_64422 ?auto_64423 ) ( ON ?auto_64421 ?auto_64420 ) ( not ( = ?auto_64420 ?auto_64421 ) ) ( not ( = ?auto_64420 ?auto_64422 ) ) ( ON ?auto_64419 ?auto_64418 ) ( ON ?auto_64420 ?auto_64419 ) ( not ( = ?auto_64418 ?auto_64419 ) ) ( not ( = ?auto_64418 ?auto_64420 ) ) ( not ( = ?auto_64418 ?auto_64421 ) ) ( not ( = ?auto_64418 ?auto_64422 ) ) ( not ( = ?auto_64419 ?auto_64420 ) ) ( not ( = ?auto_64419 ?auto_64421 ) ) ( not ( = ?auto_64419 ?auto_64422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64420 ?auto_64421 ?auto_64422 )
      ( MAKE-4CRATE-VERIFY ?auto_64418 ?auto_64419 ?auto_64420 ?auto_64421 ?auto_64422 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64448 - SURFACE
      ?auto_64449 - SURFACE
      ?auto_64450 - SURFACE
      ?auto_64451 - SURFACE
      ?auto_64452 - SURFACE
    )
    :vars
    (
      ?auto_64454 - HOIST
      ?auto_64455 - PLACE
      ?auto_64456 - TRUCK
      ?auto_64453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64454 ?auto_64455 ) ( SURFACE-AT ?auto_64451 ?auto_64455 ) ( CLEAR ?auto_64451 ) ( IS-CRATE ?auto_64452 ) ( not ( = ?auto_64451 ?auto_64452 ) ) ( AVAILABLE ?auto_64454 ) ( IN ?auto_64452 ?auto_64456 ) ( ON ?auto_64451 ?auto_64450 ) ( not ( = ?auto_64450 ?auto_64451 ) ) ( not ( = ?auto_64450 ?auto_64452 ) ) ( TRUCK-AT ?auto_64456 ?auto_64453 ) ( not ( = ?auto_64453 ?auto_64455 ) ) ( ON ?auto_64449 ?auto_64448 ) ( ON ?auto_64450 ?auto_64449 ) ( not ( = ?auto_64448 ?auto_64449 ) ) ( not ( = ?auto_64448 ?auto_64450 ) ) ( not ( = ?auto_64448 ?auto_64451 ) ) ( not ( = ?auto_64448 ?auto_64452 ) ) ( not ( = ?auto_64449 ?auto_64450 ) ) ( not ( = ?auto_64449 ?auto_64451 ) ) ( not ( = ?auto_64449 ?auto_64452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64450 ?auto_64451 ?auto_64452 )
      ( MAKE-4CRATE-VERIFY ?auto_64448 ?auto_64449 ?auto_64450 ?auto_64451 ?auto_64452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64482 - SURFACE
      ?auto_64483 - SURFACE
      ?auto_64484 - SURFACE
      ?auto_64485 - SURFACE
      ?auto_64486 - SURFACE
    )
    :vars
    (
      ?auto_64487 - HOIST
      ?auto_64491 - PLACE
      ?auto_64490 - TRUCK
      ?auto_64489 - PLACE
      ?auto_64488 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64487 ?auto_64491 ) ( SURFACE-AT ?auto_64485 ?auto_64491 ) ( CLEAR ?auto_64485 ) ( IS-CRATE ?auto_64486 ) ( not ( = ?auto_64485 ?auto_64486 ) ) ( AVAILABLE ?auto_64487 ) ( ON ?auto_64485 ?auto_64484 ) ( not ( = ?auto_64484 ?auto_64485 ) ) ( not ( = ?auto_64484 ?auto_64486 ) ) ( TRUCK-AT ?auto_64490 ?auto_64489 ) ( not ( = ?auto_64489 ?auto_64491 ) ) ( HOIST-AT ?auto_64488 ?auto_64489 ) ( LIFTING ?auto_64488 ?auto_64486 ) ( not ( = ?auto_64487 ?auto_64488 ) ) ( ON ?auto_64483 ?auto_64482 ) ( ON ?auto_64484 ?auto_64483 ) ( not ( = ?auto_64482 ?auto_64483 ) ) ( not ( = ?auto_64482 ?auto_64484 ) ) ( not ( = ?auto_64482 ?auto_64485 ) ) ( not ( = ?auto_64482 ?auto_64486 ) ) ( not ( = ?auto_64483 ?auto_64484 ) ) ( not ( = ?auto_64483 ?auto_64485 ) ) ( not ( = ?auto_64483 ?auto_64486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64484 ?auto_64485 ?auto_64486 )
      ( MAKE-4CRATE-VERIFY ?auto_64482 ?auto_64483 ?auto_64484 ?auto_64485 ?auto_64486 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64520 - SURFACE
      ?auto_64521 - SURFACE
      ?auto_64522 - SURFACE
      ?auto_64523 - SURFACE
      ?auto_64524 - SURFACE
    )
    :vars
    (
      ?auto_64528 - HOIST
      ?auto_64529 - PLACE
      ?auto_64530 - TRUCK
      ?auto_64526 - PLACE
      ?auto_64527 - HOIST
      ?auto_64525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64528 ?auto_64529 ) ( SURFACE-AT ?auto_64523 ?auto_64529 ) ( CLEAR ?auto_64523 ) ( IS-CRATE ?auto_64524 ) ( not ( = ?auto_64523 ?auto_64524 ) ) ( AVAILABLE ?auto_64528 ) ( ON ?auto_64523 ?auto_64522 ) ( not ( = ?auto_64522 ?auto_64523 ) ) ( not ( = ?auto_64522 ?auto_64524 ) ) ( TRUCK-AT ?auto_64530 ?auto_64526 ) ( not ( = ?auto_64526 ?auto_64529 ) ) ( HOIST-AT ?auto_64527 ?auto_64526 ) ( not ( = ?auto_64528 ?auto_64527 ) ) ( AVAILABLE ?auto_64527 ) ( SURFACE-AT ?auto_64524 ?auto_64526 ) ( ON ?auto_64524 ?auto_64525 ) ( CLEAR ?auto_64524 ) ( not ( = ?auto_64523 ?auto_64525 ) ) ( not ( = ?auto_64524 ?auto_64525 ) ) ( not ( = ?auto_64522 ?auto_64525 ) ) ( ON ?auto_64521 ?auto_64520 ) ( ON ?auto_64522 ?auto_64521 ) ( not ( = ?auto_64520 ?auto_64521 ) ) ( not ( = ?auto_64520 ?auto_64522 ) ) ( not ( = ?auto_64520 ?auto_64523 ) ) ( not ( = ?auto_64520 ?auto_64524 ) ) ( not ( = ?auto_64520 ?auto_64525 ) ) ( not ( = ?auto_64521 ?auto_64522 ) ) ( not ( = ?auto_64521 ?auto_64523 ) ) ( not ( = ?auto_64521 ?auto_64524 ) ) ( not ( = ?auto_64521 ?auto_64525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64522 ?auto_64523 ?auto_64524 )
      ( MAKE-4CRATE-VERIFY ?auto_64520 ?auto_64521 ?auto_64522 ?auto_64523 ?auto_64524 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64559 - SURFACE
      ?auto_64560 - SURFACE
      ?auto_64561 - SURFACE
      ?auto_64562 - SURFACE
      ?auto_64563 - SURFACE
    )
    :vars
    (
      ?auto_64568 - HOIST
      ?auto_64567 - PLACE
      ?auto_64566 - PLACE
      ?auto_64569 - HOIST
      ?auto_64565 - SURFACE
      ?auto_64564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64568 ?auto_64567 ) ( SURFACE-AT ?auto_64562 ?auto_64567 ) ( CLEAR ?auto_64562 ) ( IS-CRATE ?auto_64563 ) ( not ( = ?auto_64562 ?auto_64563 ) ) ( AVAILABLE ?auto_64568 ) ( ON ?auto_64562 ?auto_64561 ) ( not ( = ?auto_64561 ?auto_64562 ) ) ( not ( = ?auto_64561 ?auto_64563 ) ) ( not ( = ?auto_64566 ?auto_64567 ) ) ( HOIST-AT ?auto_64569 ?auto_64566 ) ( not ( = ?auto_64568 ?auto_64569 ) ) ( AVAILABLE ?auto_64569 ) ( SURFACE-AT ?auto_64563 ?auto_64566 ) ( ON ?auto_64563 ?auto_64565 ) ( CLEAR ?auto_64563 ) ( not ( = ?auto_64562 ?auto_64565 ) ) ( not ( = ?auto_64563 ?auto_64565 ) ) ( not ( = ?auto_64561 ?auto_64565 ) ) ( TRUCK-AT ?auto_64564 ?auto_64567 ) ( ON ?auto_64560 ?auto_64559 ) ( ON ?auto_64561 ?auto_64560 ) ( not ( = ?auto_64559 ?auto_64560 ) ) ( not ( = ?auto_64559 ?auto_64561 ) ) ( not ( = ?auto_64559 ?auto_64562 ) ) ( not ( = ?auto_64559 ?auto_64563 ) ) ( not ( = ?auto_64559 ?auto_64565 ) ) ( not ( = ?auto_64560 ?auto_64561 ) ) ( not ( = ?auto_64560 ?auto_64562 ) ) ( not ( = ?auto_64560 ?auto_64563 ) ) ( not ( = ?auto_64560 ?auto_64565 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64561 ?auto_64562 ?auto_64563 )
      ( MAKE-4CRATE-VERIFY ?auto_64559 ?auto_64560 ?auto_64561 ?auto_64562 ?auto_64563 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64598 - SURFACE
      ?auto_64599 - SURFACE
      ?auto_64600 - SURFACE
      ?auto_64601 - SURFACE
      ?auto_64602 - SURFACE
    )
    :vars
    (
      ?auto_64606 - HOIST
      ?auto_64605 - PLACE
      ?auto_64607 - PLACE
      ?auto_64603 - HOIST
      ?auto_64604 - SURFACE
      ?auto_64608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64606 ?auto_64605 ) ( IS-CRATE ?auto_64602 ) ( not ( = ?auto_64601 ?auto_64602 ) ) ( not ( = ?auto_64600 ?auto_64601 ) ) ( not ( = ?auto_64600 ?auto_64602 ) ) ( not ( = ?auto_64607 ?auto_64605 ) ) ( HOIST-AT ?auto_64603 ?auto_64607 ) ( not ( = ?auto_64606 ?auto_64603 ) ) ( AVAILABLE ?auto_64603 ) ( SURFACE-AT ?auto_64602 ?auto_64607 ) ( ON ?auto_64602 ?auto_64604 ) ( CLEAR ?auto_64602 ) ( not ( = ?auto_64601 ?auto_64604 ) ) ( not ( = ?auto_64602 ?auto_64604 ) ) ( not ( = ?auto_64600 ?auto_64604 ) ) ( TRUCK-AT ?auto_64608 ?auto_64605 ) ( SURFACE-AT ?auto_64600 ?auto_64605 ) ( CLEAR ?auto_64600 ) ( LIFTING ?auto_64606 ?auto_64601 ) ( IS-CRATE ?auto_64601 ) ( ON ?auto_64599 ?auto_64598 ) ( ON ?auto_64600 ?auto_64599 ) ( not ( = ?auto_64598 ?auto_64599 ) ) ( not ( = ?auto_64598 ?auto_64600 ) ) ( not ( = ?auto_64598 ?auto_64601 ) ) ( not ( = ?auto_64598 ?auto_64602 ) ) ( not ( = ?auto_64598 ?auto_64604 ) ) ( not ( = ?auto_64599 ?auto_64600 ) ) ( not ( = ?auto_64599 ?auto_64601 ) ) ( not ( = ?auto_64599 ?auto_64602 ) ) ( not ( = ?auto_64599 ?auto_64604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64600 ?auto_64601 ?auto_64602 )
      ( MAKE-4CRATE-VERIFY ?auto_64598 ?auto_64599 ?auto_64600 ?auto_64601 ?auto_64602 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64637 - SURFACE
      ?auto_64638 - SURFACE
      ?auto_64639 - SURFACE
      ?auto_64640 - SURFACE
      ?auto_64641 - SURFACE
    )
    :vars
    (
      ?auto_64647 - HOIST
      ?auto_64646 - PLACE
      ?auto_64645 - PLACE
      ?auto_64643 - HOIST
      ?auto_64644 - SURFACE
      ?auto_64642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64647 ?auto_64646 ) ( IS-CRATE ?auto_64641 ) ( not ( = ?auto_64640 ?auto_64641 ) ) ( not ( = ?auto_64639 ?auto_64640 ) ) ( not ( = ?auto_64639 ?auto_64641 ) ) ( not ( = ?auto_64645 ?auto_64646 ) ) ( HOIST-AT ?auto_64643 ?auto_64645 ) ( not ( = ?auto_64647 ?auto_64643 ) ) ( AVAILABLE ?auto_64643 ) ( SURFACE-AT ?auto_64641 ?auto_64645 ) ( ON ?auto_64641 ?auto_64644 ) ( CLEAR ?auto_64641 ) ( not ( = ?auto_64640 ?auto_64644 ) ) ( not ( = ?auto_64641 ?auto_64644 ) ) ( not ( = ?auto_64639 ?auto_64644 ) ) ( TRUCK-AT ?auto_64642 ?auto_64646 ) ( SURFACE-AT ?auto_64639 ?auto_64646 ) ( CLEAR ?auto_64639 ) ( IS-CRATE ?auto_64640 ) ( AVAILABLE ?auto_64647 ) ( IN ?auto_64640 ?auto_64642 ) ( ON ?auto_64638 ?auto_64637 ) ( ON ?auto_64639 ?auto_64638 ) ( not ( = ?auto_64637 ?auto_64638 ) ) ( not ( = ?auto_64637 ?auto_64639 ) ) ( not ( = ?auto_64637 ?auto_64640 ) ) ( not ( = ?auto_64637 ?auto_64641 ) ) ( not ( = ?auto_64637 ?auto_64644 ) ) ( not ( = ?auto_64638 ?auto_64639 ) ) ( not ( = ?auto_64638 ?auto_64640 ) ) ( not ( = ?auto_64638 ?auto_64641 ) ) ( not ( = ?auto_64638 ?auto_64644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64639 ?auto_64640 ?auto_64641 )
      ( MAKE-4CRATE-VERIFY ?auto_64637 ?auto_64638 ?auto_64639 ?auto_64640 ?auto_64641 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65297 - SURFACE
      ?auto_65298 - SURFACE
      ?auto_65299 - SURFACE
      ?auto_65300 - SURFACE
      ?auto_65301 - SURFACE
      ?auto_65302 - SURFACE
    )
    :vars
    (
      ?auto_65303 - HOIST
      ?auto_65304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65303 ?auto_65304 ) ( SURFACE-AT ?auto_65301 ?auto_65304 ) ( CLEAR ?auto_65301 ) ( LIFTING ?auto_65303 ?auto_65302 ) ( IS-CRATE ?auto_65302 ) ( not ( = ?auto_65301 ?auto_65302 ) ) ( ON ?auto_65298 ?auto_65297 ) ( ON ?auto_65299 ?auto_65298 ) ( ON ?auto_65300 ?auto_65299 ) ( ON ?auto_65301 ?auto_65300 ) ( not ( = ?auto_65297 ?auto_65298 ) ) ( not ( = ?auto_65297 ?auto_65299 ) ) ( not ( = ?auto_65297 ?auto_65300 ) ) ( not ( = ?auto_65297 ?auto_65301 ) ) ( not ( = ?auto_65297 ?auto_65302 ) ) ( not ( = ?auto_65298 ?auto_65299 ) ) ( not ( = ?auto_65298 ?auto_65300 ) ) ( not ( = ?auto_65298 ?auto_65301 ) ) ( not ( = ?auto_65298 ?auto_65302 ) ) ( not ( = ?auto_65299 ?auto_65300 ) ) ( not ( = ?auto_65299 ?auto_65301 ) ) ( not ( = ?auto_65299 ?auto_65302 ) ) ( not ( = ?auto_65300 ?auto_65301 ) ) ( not ( = ?auto_65300 ?auto_65302 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_65301 ?auto_65302 )
      ( MAKE-5CRATE-VERIFY ?auto_65297 ?auto_65298 ?auto_65299 ?auto_65300 ?auto_65301 ?auto_65302 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65331 - SURFACE
      ?auto_65332 - SURFACE
      ?auto_65333 - SURFACE
      ?auto_65334 - SURFACE
      ?auto_65335 - SURFACE
      ?auto_65336 - SURFACE
    )
    :vars
    (
      ?auto_65337 - HOIST
      ?auto_65338 - PLACE
      ?auto_65339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65337 ?auto_65338 ) ( SURFACE-AT ?auto_65335 ?auto_65338 ) ( CLEAR ?auto_65335 ) ( IS-CRATE ?auto_65336 ) ( not ( = ?auto_65335 ?auto_65336 ) ) ( TRUCK-AT ?auto_65339 ?auto_65338 ) ( AVAILABLE ?auto_65337 ) ( IN ?auto_65336 ?auto_65339 ) ( ON ?auto_65335 ?auto_65334 ) ( not ( = ?auto_65334 ?auto_65335 ) ) ( not ( = ?auto_65334 ?auto_65336 ) ) ( ON ?auto_65332 ?auto_65331 ) ( ON ?auto_65333 ?auto_65332 ) ( ON ?auto_65334 ?auto_65333 ) ( not ( = ?auto_65331 ?auto_65332 ) ) ( not ( = ?auto_65331 ?auto_65333 ) ) ( not ( = ?auto_65331 ?auto_65334 ) ) ( not ( = ?auto_65331 ?auto_65335 ) ) ( not ( = ?auto_65331 ?auto_65336 ) ) ( not ( = ?auto_65332 ?auto_65333 ) ) ( not ( = ?auto_65332 ?auto_65334 ) ) ( not ( = ?auto_65332 ?auto_65335 ) ) ( not ( = ?auto_65332 ?auto_65336 ) ) ( not ( = ?auto_65333 ?auto_65334 ) ) ( not ( = ?auto_65333 ?auto_65335 ) ) ( not ( = ?auto_65333 ?auto_65336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65334 ?auto_65335 ?auto_65336 )
      ( MAKE-5CRATE-VERIFY ?auto_65331 ?auto_65332 ?auto_65333 ?auto_65334 ?auto_65335 ?auto_65336 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65371 - SURFACE
      ?auto_65372 - SURFACE
      ?auto_65373 - SURFACE
      ?auto_65374 - SURFACE
      ?auto_65375 - SURFACE
      ?auto_65376 - SURFACE
    )
    :vars
    (
      ?auto_65379 - HOIST
      ?auto_65377 - PLACE
      ?auto_65378 - TRUCK
      ?auto_65380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65379 ?auto_65377 ) ( SURFACE-AT ?auto_65375 ?auto_65377 ) ( CLEAR ?auto_65375 ) ( IS-CRATE ?auto_65376 ) ( not ( = ?auto_65375 ?auto_65376 ) ) ( AVAILABLE ?auto_65379 ) ( IN ?auto_65376 ?auto_65378 ) ( ON ?auto_65375 ?auto_65374 ) ( not ( = ?auto_65374 ?auto_65375 ) ) ( not ( = ?auto_65374 ?auto_65376 ) ) ( TRUCK-AT ?auto_65378 ?auto_65380 ) ( not ( = ?auto_65380 ?auto_65377 ) ) ( ON ?auto_65372 ?auto_65371 ) ( ON ?auto_65373 ?auto_65372 ) ( ON ?auto_65374 ?auto_65373 ) ( not ( = ?auto_65371 ?auto_65372 ) ) ( not ( = ?auto_65371 ?auto_65373 ) ) ( not ( = ?auto_65371 ?auto_65374 ) ) ( not ( = ?auto_65371 ?auto_65375 ) ) ( not ( = ?auto_65371 ?auto_65376 ) ) ( not ( = ?auto_65372 ?auto_65373 ) ) ( not ( = ?auto_65372 ?auto_65374 ) ) ( not ( = ?auto_65372 ?auto_65375 ) ) ( not ( = ?auto_65372 ?auto_65376 ) ) ( not ( = ?auto_65373 ?auto_65374 ) ) ( not ( = ?auto_65373 ?auto_65375 ) ) ( not ( = ?auto_65373 ?auto_65376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65374 ?auto_65375 ?auto_65376 )
      ( MAKE-5CRATE-VERIFY ?auto_65371 ?auto_65372 ?auto_65373 ?auto_65374 ?auto_65375 ?auto_65376 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65416 - SURFACE
      ?auto_65417 - SURFACE
      ?auto_65418 - SURFACE
      ?auto_65419 - SURFACE
      ?auto_65420 - SURFACE
      ?auto_65421 - SURFACE
    )
    :vars
    (
      ?auto_65424 - HOIST
      ?auto_65422 - PLACE
      ?auto_65423 - TRUCK
      ?auto_65425 - PLACE
      ?auto_65426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65424 ?auto_65422 ) ( SURFACE-AT ?auto_65420 ?auto_65422 ) ( CLEAR ?auto_65420 ) ( IS-CRATE ?auto_65421 ) ( not ( = ?auto_65420 ?auto_65421 ) ) ( AVAILABLE ?auto_65424 ) ( ON ?auto_65420 ?auto_65419 ) ( not ( = ?auto_65419 ?auto_65420 ) ) ( not ( = ?auto_65419 ?auto_65421 ) ) ( TRUCK-AT ?auto_65423 ?auto_65425 ) ( not ( = ?auto_65425 ?auto_65422 ) ) ( HOIST-AT ?auto_65426 ?auto_65425 ) ( LIFTING ?auto_65426 ?auto_65421 ) ( not ( = ?auto_65424 ?auto_65426 ) ) ( ON ?auto_65417 ?auto_65416 ) ( ON ?auto_65418 ?auto_65417 ) ( ON ?auto_65419 ?auto_65418 ) ( not ( = ?auto_65416 ?auto_65417 ) ) ( not ( = ?auto_65416 ?auto_65418 ) ) ( not ( = ?auto_65416 ?auto_65419 ) ) ( not ( = ?auto_65416 ?auto_65420 ) ) ( not ( = ?auto_65416 ?auto_65421 ) ) ( not ( = ?auto_65417 ?auto_65418 ) ) ( not ( = ?auto_65417 ?auto_65419 ) ) ( not ( = ?auto_65417 ?auto_65420 ) ) ( not ( = ?auto_65417 ?auto_65421 ) ) ( not ( = ?auto_65418 ?auto_65419 ) ) ( not ( = ?auto_65418 ?auto_65420 ) ) ( not ( = ?auto_65418 ?auto_65421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65419 ?auto_65420 ?auto_65421 )
      ( MAKE-5CRATE-VERIFY ?auto_65416 ?auto_65417 ?auto_65418 ?auto_65419 ?auto_65420 ?auto_65421 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65466 - SURFACE
      ?auto_65467 - SURFACE
      ?auto_65468 - SURFACE
      ?auto_65469 - SURFACE
      ?auto_65470 - SURFACE
      ?auto_65471 - SURFACE
    )
    :vars
    (
      ?auto_65474 - HOIST
      ?auto_65472 - PLACE
      ?auto_65477 - TRUCK
      ?auto_65473 - PLACE
      ?auto_65475 - HOIST
      ?auto_65476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65474 ?auto_65472 ) ( SURFACE-AT ?auto_65470 ?auto_65472 ) ( CLEAR ?auto_65470 ) ( IS-CRATE ?auto_65471 ) ( not ( = ?auto_65470 ?auto_65471 ) ) ( AVAILABLE ?auto_65474 ) ( ON ?auto_65470 ?auto_65469 ) ( not ( = ?auto_65469 ?auto_65470 ) ) ( not ( = ?auto_65469 ?auto_65471 ) ) ( TRUCK-AT ?auto_65477 ?auto_65473 ) ( not ( = ?auto_65473 ?auto_65472 ) ) ( HOIST-AT ?auto_65475 ?auto_65473 ) ( not ( = ?auto_65474 ?auto_65475 ) ) ( AVAILABLE ?auto_65475 ) ( SURFACE-AT ?auto_65471 ?auto_65473 ) ( ON ?auto_65471 ?auto_65476 ) ( CLEAR ?auto_65471 ) ( not ( = ?auto_65470 ?auto_65476 ) ) ( not ( = ?auto_65471 ?auto_65476 ) ) ( not ( = ?auto_65469 ?auto_65476 ) ) ( ON ?auto_65467 ?auto_65466 ) ( ON ?auto_65468 ?auto_65467 ) ( ON ?auto_65469 ?auto_65468 ) ( not ( = ?auto_65466 ?auto_65467 ) ) ( not ( = ?auto_65466 ?auto_65468 ) ) ( not ( = ?auto_65466 ?auto_65469 ) ) ( not ( = ?auto_65466 ?auto_65470 ) ) ( not ( = ?auto_65466 ?auto_65471 ) ) ( not ( = ?auto_65466 ?auto_65476 ) ) ( not ( = ?auto_65467 ?auto_65468 ) ) ( not ( = ?auto_65467 ?auto_65469 ) ) ( not ( = ?auto_65467 ?auto_65470 ) ) ( not ( = ?auto_65467 ?auto_65471 ) ) ( not ( = ?auto_65467 ?auto_65476 ) ) ( not ( = ?auto_65468 ?auto_65469 ) ) ( not ( = ?auto_65468 ?auto_65470 ) ) ( not ( = ?auto_65468 ?auto_65471 ) ) ( not ( = ?auto_65468 ?auto_65476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65469 ?auto_65470 ?auto_65471 )
      ( MAKE-5CRATE-VERIFY ?auto_65466 ?auto_65467 ?auto_65468 ?auto_65469 ?auto_65470 ?auto_65471 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65517 - SURFACE
      ?auto_65518 - SURFACE
      ?auto_65519 - SURFACE
      ?auto_65520 - SURFACE
      ?auto_65521 - SURFACE
      ?auto_65522 - SURFACE
    )
    :vars
    (
      ?auto_65525 - HOIST
      ?auto_65527 - PLACE
      ?auto_65523 - PLACE
      ?auto_65528 - HOIST
      ?auto_65526 - SURFACE
      ?auto_65524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65525 ?auto_65527 ) ( SURFACE-AT ?auto_65521 ?auto_65527 ) ( CLEAR ?auto_65521 ) ( IS-CRATE ?auto_65522 ) ( not ( = ?auto_65521 ?auto_65522 ) ) ( AVAILABLE ?auto_65525 ) ( ON ?auto_65521 ?auto_65520 ) ( not ( = ?auto_65520 ?auto_65521 ) ) ( not ( = ?auto_65520 ?auto_65522 ) ) ( not ( = ?auto_65523 ?auto_65527 ) ) ( HOIST-AT ?auto_65528 ?auto_65523 ) ( not ( = ?auto_65525 ?auto_65528 ) ) ( AVAILABLE ?auto_65528 ) ( SURFACE-AT ?auto_65522 ?auto_65523 ) ( ON ?auto_65522 ?auto_65526 ) ( CLEAR ?auto_65522 ) ( not ( = ?auto_65521 ?auto_65526 ) ) ( not ( = ?auto_65522 ?auto_65526 ) ) ( not ( = ?auto_65520 ?auto_65526 ) ) ( TRUCK-AT ?auto_65524 ?auto_65527 ) ( ON ?auto_65518 ?auto_65517 ) ( ON ?auto_65519 ?auto_65518 ) ( ON ?auto_65520 ?auto_65519 ) ( not ( = ?auto_65517 ?auto_65518 ) ) ( not ( = ?auto_65517 ?auto_65519 ) ) ( not ( = ?auto_65517 ?auto_65520 ) ) ( not ( = ?auto_65517 ?auto_65521 ) ) ( not ( = ?auto_65517 ?auto_65522 ) ) ( not ( = ?auto_65517 ?auto_65526 ) ) ( not ( = ?auto_65518 ?auto_65519 ) ) ( not ( = ?auto_65518 ?auto_65520 ) ) ( not ( = ?auto_65518 ?auto_65521 ) ) ( not ( = ?auto_65518 ?auto_65522 ) ) ( not ( = ?auto_65518 ?auto_65526 ) ) ( not ( = ?auto_65519 ?auto_65520 ) ) ( not ( = ?auto_65519 ?auto_65521 ) ) ( not ( = ?auto_65519 ?auto_65522 ) ) ( not ( = ?auto_65519 ?auto_65526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65520 ?auto_65521 ?auto_65522 )
      ( MAKE-5CRATE-VERIFY ?auto_65517 ?auto_65518 ?auto_65519 ?auto_65520 ?auto_65521 ?auto_65522 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65568 - SURFACE
      ?auto_65569 - SURFACE
      ?auto_65570 - SURFACE
      ?auto_65571 - SURFACE
      ?auto_65572 - SURFACE
      ?auto_65573 - SURFACE
    )
    :vars
    (
      ?auto_65579 - HOIST
      ?auto_65577 - PLACE
      ?auto_65574 - PLACE
      ?auto_65575 - HOIST
      ?auto_65578 - SURFACE
      ?auto_65576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65579 ?auto_65577 ) ( IS-CRATE ?auto_65573 ) ( not ( = ?auto_65572 ?auto_65573 ) ) ( not ( = ?auto_65571 ?auto_65572 ) ) ( not ( = ?auto_65571 ?auto_65573 ) ) ( not ( = ?auto_65574 ?auto_65577 ) ) ( HOIST-AT ?auto_65575 ?auto_65574 ) ( not ( = ?auto_65579 ?auto_65575 ) ) ( AVAILABLE ?auto_65575 ) ( SURFACE-AT ?auto_65573 ?auto_65574 ) ( ON ?auto_65573 ?auto_65578 ) ( CLEAR ?auto_65573 ) ( not ( = ?auto_65572 ?auto_65578 ) ) ( not ( = ?auto_65573 ?auto_65578 ) ) ( not ( = ?auto_65571 ?auto_65578 ) ) ( TRUCK-AT ?auto_65576 ?auto_65577 ) ( SURFACE-AT ?auto_65571 ?auto_65577 ) ( CLEAR ?auto_65571 ) ( LIFTING ?auto_65579 ?auto_65572 ) ( IS-CRATE ?auto_65572 ) ( ON ?auto_65569 ?auto_65568 ) ( ON ?auto_65570 ?auto_65569 ) ( ON ?auto_65571 ?auto_65570 ) ( not ( = ?auto_65568 ?auto_65569 ) ) ( not ( = ?auto_65568 ?auto_65570 ) ) ( not ( = ?auto_65568 ?auto_65571 ) ) ( not ( = ?auto_65568 ?auto_65572 ) ) ( not ( = ?auto_65568 ?auto_65573 ) ) ( not ( = ?auto_65568 ?auto_65578 ) ) ( not ( = ?auto_65569 ?auto_65570 ) ) ( not ( = ?auto_65569 ?auto_65571 ) ) ( not ( = ?auto_65569 ?auto_65572 ) ) ( not ( = ?auto_65569 ?auto_65573 ) ) ( not ( = ?auto_65569 ?auto_65578 ) ) ( not ( = ?auto_65570 ?auto_65571 ) ) ( not ( = ?auto_65570 ?auto_65572 ) ) ( not ( = ?auto_65570 ?auto_65573 ) ) ( not ( = ?auto_65570 ?auto_65578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65571 ?auto_65572 ?auto_65573 )
      ( MAKE-5CRATE-VERIFY ?auto_65568 ?auto_65569 ?auto_65570 ?auto_65571 ?auto_65572 ?auto_65573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65619 - SURFACE
      ?auto_65620 - SURFACE
      ?auto_65621 - SURFACE
      ?auto_65622 - SURFACE
      ?auto_65623 - SURFACE
      ?auto_65624 - SURFACE
    )
    :vars
    (
      ?auto_65626 - HOIST
      ?auto_65625 - PLACE
      ?auto_65628 - PLACE
      ?auto_65627 - HOIST
      ?auto_65630 - SURFACE
      ?auto_65629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65626 ?auto_65625 ) ( IS-CRATE ?auto_65624 ) ( not ( = ?auto_65623 ?auto_65624 ) ) ( not ( = ?auto_65622 ?auto_65623 ) ) ( not ( = ?auto_65622 ?auto_65624 ) ) ( not ( = ?auto_65628 ?auto_65625 ) ) ( HOIST-AT ?auto_65627 ?auto_65628 ) ( not ( = ?auto_65626 ?auto_65627 ) ) ( AVAILABLE ?auto_65627 ) ( SURFACE-AT ?auto_65624 ?auto_65628 ) ( ON ?auto_65624 ?auto_65630 ) ( CLEAR ?auto_65624 ) ( not ( = ?auto_65623 ?auto_65630 ) ) ( not ( = ?auto_65624 ?auto_65630 ) ) ( not ( = ?auto_65622 ?auto_65630 ) ) ( TRUCK-AT ?auto_65629 ?auto_65625 ) ( SURFACE-AT ?auto_65622 ?auto_65625 ) ( CLEAR ?auto_65622 ) ( IS-CRATE ?auto_65623 ) ( AVAILABLE ?auto_65626 ) ( IN ?auto_65623 ?auto_65629 ) ( ON ?auto_65620 ?auto_65619 ) ( ON ?auto_65621 ?auto_65620 ) ( ON ?auto_65622 ?auto_65621 ) ( not ( = ?auto_65619 ?auto_65620 ) ) ( not ( = ?auto_65619 ?auto_65621 ) ) ( not ( = ?auto_65619 ?auto_65622 ) ) ( not ( = ?auto_65619 ?auto_65623 ) ) ( not ( = ?auto_65619 ?auto_65624 ) ) ( not ( = ?auto_65619 ?auto_65630 ) ) ( not ( = ?auto_65620 ?auto_65621 ) ) ( not ( = ?auto_65620 ?auto_65622 ) ) ( not ( = ?auto_65620 ?auto_65623 ) ) ( not ( = ?auto_65620 ?auto_65624 ) ) ( not ( = ?auto_65620 ?auto_65630 ) ) ( not ( = ?auto_65621 ?auto_65622 ) ) ( not ( = ?auto_65621 ?auto_65623 ) ) ( not ( = ?auto_65621 ?auto_65624 ) ) ( not ( = ?auto_65621 ?auto_65630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65622 ?auto_65623 ?auto_65624 )
      ( MAKE-5CRATE-VERIFY ?auto_65619 ?auto_65620 ?auto_65621 ?auto_65622 ?auto_65623 ?auto_65624 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66828 - SURFACE
      ?auto_66829 - SURFACE
      ?auto_66830 - SURFACE
      ?auto_66831 - SURFACE
      ?auto_66832 - SURFACE
      ?auto_66833 - SURFACE
      ?auto_66834 - SURFACE
    )
    :vars
    (
      ?auto_66836 - HOIST
      ?auto_66835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66836 ?auto_66835 ) ( SURFACE-AT ?auto_66833 ?auto_66835 ) ( CLEAR ?auto_66833 ) ( LIFTING ?auto_66836 ?auto_66834 ) ( IS-CRATE ?auto_66834 ) ( not ( = ?auto_66833 ?auto_66834 ) ) ( ON ?auto_66829 ?auto_66828 ) ( ON ?auto_66830 ?auto_66829 ) ( ON ?auto_66831 ?auto_66830 ) ( ON ?auto_66832 ?auto_66831 ) ( ON ?auto_66833 ?auto_66832 ) ( not ( = ?auto_66828 ?auto_66829 ) ) ( not ( = ?auto_66828 ?auto_66830 ) ) ( not ( = ?auto_66828 ?auto_66831 ) ) ( not ( = ?auto_66828 ?auto_66832 ) ) ( not ( = ?auto_66828 ?auto_66833 ) ) ( not ( = ?auto_66828 ?auto_66834 ) ) ( not ( = ?auto_66829 ?auto_66830 ) ) ( not ( = ?auto_66829 ?auto_66831 ) ) ( not ( = ?auto_66829 ?auto_66832 ) ) ( not ( = ?auto_66829 ?auto_66833 ) ) ( not ( = ?auto_66829 ?auto_66834 ) ) ( not ( = ?auto_66830 ?auto_66831 ) ) ( not ( = ?auto_66830 ?auto_66832 ) ) ( not ( = ?auto_66830 ?auto_66833 ) ) ( not ( = ?auto_66830 ?auto_66834 ) ) ( not ( = ?auto_66831 ?auto_66832 ) ) ( not ( = ?auto_66831 ?auto_66833 ) ) ( not ( = ?auto_66831 ?auto_66834 ) ) ( not ( = ?auto_66832 ?auto_66833 ) ) ( not ( = ?auto_66832 ?auto_66834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_66833 ?auto_66834 )
      ( MAKE-6CRATE-VERIFY ?auto_66828 ?auto_66829 ?auto_66830 ?auto_66831 ?auto_66832 ?auto_66833 ?auto_66834 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66872 - SURFACE
      ?auto_66873 - SURFACE
      ?auto_66874 - SURFACE
      ?auto_66875 - SURFACE
      ?auto_66876 - SURFACE
      ?auto_66877 - SURFACE
      ?auto_66878 - SURFACE
    )
    :vars
    (
      ?auto_66881 - HOIST
      ?auto_66880 - PLACE
      ?auto_66879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66881 ?auto_66880 ) ( SURFACE-AT ?auto_66877 ?auto_66880 ) ( CLEAR ?auto_66877 ) ( IS-CRATE ?auto_66878 ) ( not ( = ?auto_66877 ?auto_66878 ) ) ( TRUCK-AT ?auto_66879 ?auto_66880 ) ( AVAILABLE ?auto_66881 ) ( IN ?auto_66878 ?auto_66879 ) ( ON ?auto_66877 ?auto_66876 ) ( not ( = ?auto_66876 ?auto_66877 ) ) ( not ( = ?auto_66876 ?auto_66878 ) ) ( ON ?auto_66873 ?auto_66872 ) ( ON ?auto_66874 ?auto_66873 ) ( ON ?auto_66875 ?auto_66874 ) ( ON ?auto_66876 ?auto_66875 ) ( not ( = ?auto_66872 ?auto_66873 ) ) ( not ( = ?auto_66872 ?auto_66874 ) ) ( not ( = ?auto_66872 ?auto_66875 ) ) ( not ( = ?auto_66872 ?auto_66876 ) ) ( not ( = ?auto_66872 ?auto_66877 ) ) ( not ( = ?auto_66872 ?auto_66878 ) ) ( not ( = ?auto_66873 ?auto_66874 ) ) ( not ( = ?auto_66873 ?auto_66875 ) ) ( not ( = ?auto_66873 ?auto_66876 ) ) ( not ( = ?auto_66873 ?auto_66877 ) ) ( not ( = ?auto_66873 ?auto_66878 ) ) ( not ( = ?auto_66874 ?auto_66875 ) ) ( not ( = ?auto_66874 ?auto_66876 ) ) ( not ( = ?auto_66874 ?auto_66877 ) ) ( not ( = ?auto_66874 ?auto_66878 ) ) ( not ( = ?auto_66875 ?auto_66876 ) ) ( not ( = ?auto_66875 ?auto_66877 ) ) ( not ( = ?auto_66875 ?auto_66878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66876 ?auto_66877 ?auto_66878 )
      ( MAKE-6CRATE-VERIFY ?auto_66872 ?auto_66873 ?auto_66874 ?auto_66875 ?auto_66876 ?auto_66877 ?auto_66878 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66923 - SURFACE
      ?auto_66924 - SURFACE
      ?auto_66925 - SURFACE
      ?auto_66926 - SURFACE
      ?auto_66927 - SURFACE
      ?auto_66928 - SURFACE
      ?auto_66929 - SURFACE
    )
    :vars
    (
      ?auto_66932 - HOIST
      ?auto_66930 - PLACE
      ?auto_66931 - TRUCK
      ?auto_66933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66932 ?auto_66930 ) ( SURFACE-AT ?auto_66928 ?auto_66930 ) ( CLEAR ?auto_66928 ) ( IS-CRATE ?auto_66929 ) ( not ( = ?auto_66928 ?auto_66929 ) ) ( AVAILABLE ?auto_66932 ) ( IN ?auto_66929 ?auto_66931 ) ( ON ?auto_66928 ?auto_66927 ) ( not ( = ?auto_66927 ?auto_66928 ) ) ( not ( = ?auto_66927 ?auto_66929 ) ) ( TRUCK-AT ?auto_66931 ?auto_66933 ) ( not ( = ?auto_66933 ?auto_66930 ) ) ( ON ?auto_66924 ?auto_66923 ) ( ON ?auto_66925 ?auto_66924 ) ( ON ?auto_66926 ?auto_66925 ) ( ON ?auto_66927 ?auto_66926 ) ( not ( = ?auto_66923 ?auto_66924 ) ) ( not ( = ?auto_66923 ?auto_66925 ) ) ( not ( = ?auto_66923 ?auto_66926 ) ) ( not ( = ?auto_66923 ?auto_66927 ) ) ( not ( = ?auto_66923 ?auto_66928 ) ) ( not ( = ?auto_66923 ?auto_66929 ) ) ( not ( = ?auto_66924 ?auto_66925 ) ) ( not ( = ?auto_66924 ?auto_66926 ) ) ( not ( = ?auto_66924 ?auto_66927 ) ) ( not ( = ?auto_66924 ?auto_66928 ) ) ( not ( = ?auto_66924 ?auto_66929 ) ) ( not ( = ?auto_66925 ?auto_66926 ) ) ( not ( = ?auto_66925 ?auto_66927 ) ) ( not ( = ?auto_66925 ?auto_66928 ) ) ( not ( = ?auto_66925 ?auto_66929 ) ) ( not ( = ?auto_66926 ?auto_66927 ) ) ( not ( = ?auto_66926 ?auto_66928 ) ) ( not ( = ?auto_66926 ?auto_66929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66927 ?auto_66928 ?auto_66929 )
      ( MAKE-6CRATE-VERIFY ?auto_66923 ?auto_66924 ?auto_66925 ?auto_66926 ?auto_66927 ?auto_66928 ?auto_66929 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66980 - SURFACE
      ?auto_66981 - SURFACE
      ?auto_66982 - SURFACE
      ?auto_66983 - SURFACE
      ?auto_66984 - SURFACE
      ?auto_66985 - SURFACE
      ?auto_66986 - SURFACE
    )
    :vars
    (
      ?auto_66989 - HOIST
      ?auto_66987 - PLACE
      ?auto_66991 - TRUCK
      ?auto_66990 - PLACE
      ?auto_66988 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66989 ?auto_66987 ) ( SURFACE-AT ?auto_66985 ?auto_66987 ) ( CLEAR ?auto_66985 ) ( IS-CRATE ?auto_66986 ) ( not ( = ?auto_66985 ?auto_66986 ) ) ( AVAILABLE ?auto_66989 ) ( ON ?auto_66985 ?auto_66984 ) ( not ( = ?auto_66984 ?auto_66985 ) ) ( not ( = ?auto_66984 ?auto_66986 ) ) ( TRUCK-AT ?auto_66991 ?auto_66990 ) ( not ( = ?auto_66990 ?auto_66987 ) ) ( HOIST-AT ?auto_66988 ?auto_66990 ) ( LIFTING ?auto_66988 ?auto_66986 ) ( not ( = ?auto_66989 ?auto_66988 ) ) ( ON ?auto_66981 ?auto_66980 ) ( ON ?auto_66982 ?auto_66981 ) ( ON ?auto_66983 ?auto_66982 ) ( ON ?auto_66984 ?auto_66983 ) ( not ( = ?auto_66980 ?auto_66981 ) ) ( not ( = ?auto_66980 ?auto_66982 ) ) ( not ( = ?auto_66980 ?auto_66983 ) ) ( not ( = ?auto_66980 ?auto_66984 ) ) ( not ( = ?auto_66980 ?auto_66985 ) ) ( not ( = ?auto_66980 ?auto_66986 ) ) ( not ( = ?auto_66981 ?auto_66982 ) ) ( not ( = ?auto_66981 ?auto_66983 ) ) ( not ( = ?auto_66981 ?auto_66984 ) ) ( not ( = ?auto_66981 ?auto_66985 ) ) ( not ( = ?auto_66981 ?auto_66986 ) ) ( not ( = ?auto_66982 ?auto_66983 ) ) ( not ( = ?auto_66982 ?auto_66984 ) ) ( not ( = ?auto_66982 ?auto_66985 ) ) ( not ( = ?auto_66982 ?auto_66986 ) ) ( not ( = ?auto_66983 ?auto_66984 ) ) ( not ( = ?auto_66983 ?auto_66985 ) ) ( not ( = ?auto_66983 ?auto_66986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66984 ?auto_66985 ?auto_66986 )
      ( MAKE-6CRATE-VERIFY ?auto_66980 ?auto_66981 ?auto_66982 ?auto_66983 ?auto_66984 ?auto_66985 ?auto_66986 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67043 - SURFACE
      ?auto_67044 - SURFACE
      ?auto_67045 - SURFACE
      ?auto_67046 - SURFACE
      ?auto_67047 - SURFACE
      ?auto_67048 - SURFACE
      ?auto_67049 - SURFACE
    )
    :vars
    (
      ?auto_67051 - HOIST
      ?auto_67053 - PLACE
      ?auto_67055 - TRUCK
      ?auto_67050 - PLACE
      ?auto_67054 - HOIST
      ?auto_67052 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67051 ?auto_67053 ) ( SURFACE-AT ?auto_67048 ?auto_67053 ) ( CLEAR ?auto_67048 ) ( IS-CRATE ?auto_67049 ) ( not ( = ?auto_67048 ?auto_67049 ) ) ( AVAILABLE ?auto_67051 ) ( ON ?auto_67048 ?auto_67047 ) ( not ( = ?auto_67047 ?auto_67048 ) ) ( not ( = ?auto_67047 ?auto_67049 ) ) ( TRUCK-AT ?auto_67055 ?auto_67050 ) ( not ( = ?auto_67050 ?auto_67053 ) ) ( HOIST-AT ?auto_67054 ?auto_67050 ) ( not ( = ?auto_67051 ?auto_67054 ) ) ( AVAILABLE ?auto_67054 ) ( SURFACE-AT ?auto_67049 ?auto_67050 ) ( ON ?auto_67049 ?auto_67052 ) ( CLEAR ?auto_67049 ) ( not ( = ?auto_67048 ?auto_67052 ) ) ( not ( = ?auto_67049 ?auto_67052 ) ) ( not ( = ?auto_67047 ?auto_67052 ) ) ( ON ?auto_67044 ?auto_67043 ) ( ON ?auto_67045 ?auto_67044 ) ( ON ?auto_67046 ?auto_67045 ) ( ON ?auto_67047 ?auto_67046 ) ( not ( = ?auto_67043 ?auto_67044 ) ) ( not ( = ?auto_67043 ?auto_67045 ) ) ( not ( = ?auto_67043 ?auto_67046 ) ) ( not ( = ?auto_67043 ?auto_67047 ) ) ( not ( = ?auto_67043 ?auto_67048 ) ) ( not ( = ?auto_67043 ?auto_67049 ) ) ( not ( = ?auto_67043 ?auto_67052 ) ) ( not ( = ?auto_67044 ?auto_67045 ) ) ( not ( = ?auto_67044 ?auto_67046 ) ) ( not ( = ?auto_67044 ?auto_67047 ) ) ( not ( = ?auto_67044 ?auto_67048 ) ) ( not ( = ?auto_67044 ?auto_67049 ) ) ( not ( = ?auto_67044 ?auto_67052 ) ) ( not ( = ?auto_67045 ?auto_67046 ) ) ( not ( = ?auto_67045 ?auto_67047 ) ) ( not ( = ?auto_67045 ?auto_67048 ) ) ( not ( = ?auto_67045 ?auto_67049 ) ) ( not ( = ?auto_67045 ?auto_67052 ) ) ( not ( = ?auto_67046 ?auto_67047 ) ) ( not ( = ?auto_67046 ?auto_67048 ) ) ( not ( = ?auto_67046 ?auto_67049 ) ) ( not ( = ?auto_67046 ?auto_67052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67047 ?auto_67048 ?auto_67049 )
      ( MAKE-6CRATE-VERIFY ?auto_67043 ?auto_67044 ?auto_67045 ?auto_67046 ?auto_67047 ?auto_67048 ?auto_67049 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67107 - SURFACE
      ?auto_67108 - SURFACE
      ?auto_67109 - SURFACE
      ?auto_67110 - SURFACE
      ?auto_67111 - SURFACE
      ?auto_67112 - SURFACE
      ?auto_67113 - SURFACE
    )
    :vars
    (
      ?auto_67116 - HOIST
      ?auto_67119 - PLACE
      ?auto_67117 - PLACE
      ?auto_67114 - HOIST
      ?auto_67118 - SURFACE
      ?auto_67115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67116 ?auto_67119 ) ( SURFACE-AT ?auto_67112 ?auto_67119 ) ( CLEAR ?auto_67112 ) ( IS-CRATE ?auto_67113 ) ( not ( = ?auto_67112 ?auto_67113 ) ) ( AVAILABLE ?auto_67116 ) ( ON ?auto_67112 ?auto_67111 ) ( not ( = ?auto_67111 ?auto_67112 ) ) ( not ( = ?auto_67111 ?auto_67113 ) ) ( not ( = ?auto_67117 ?auto_67119 ) ) ( HOIST-AT ?auto_67114 ?auto_67117 ) ( not ( = ?auto_67116 ?auto_67114 ) ) ( AVAILABLE ?auto_67114 ) ( SURFACE-AT ?auto_67113 ?auto_67117 ) ( ON ?auto_67113 ?auto_67118 ) ( CLEAR ?auto_67113 ) ( not ( = ?auto_67112 ?auto_67118 ) ) ( not ( = ?auto_67113 ?auto_67118 ) ) ( not ( = ?auto_67111 ?auto_67118 ) ) ( TRUCK-AT ?auto_67115 ?auto_67119 ) ( ON ?auto_67108 ?auto_67107 ) ( ON ?auto_67109 ?auto_67108 ) ( ON ?auto_67110 ?auto_67109 ) ( ON ?auto_67111 ?auto_67110 ) ( not ( = ?auto_67107 ?auto_67108 ) ) ( not ( = ?auto_67107 ?auto_67109 ) ) ( not ( = ?auto_67107 ?auto_67110 ) ) ( not ( = ?auto_67107 ?auto_67111 ) ) ( not ( = ?auto_67107 ?auto_67112 ) ) ( not ( = ?auto_67107 ?auto_67113 ) ) ( not ( = ?auto_67107 ?auto_67118 ) ) ( not ( = ?auto_67108 ?auto_67109 ) ) ( not ( = ?auto_67108 ?auto_67110 ) ) ( not ( = ?auto_67108 ?auto_67111 ) ) ( not ( = ?auto_67108 ?auto_67112 ) ) ( not ( = ?auto_67108 ?auto_67113 ) ) ( not ( = ?auto_67108 ?auto_67118 ) ) ( not ( = ?auto_67109 ?auto_67110 ) ) ( not ( = ?auto_67109 ?auto_67111 ) ) ( not ( = ?auto_67109 ?auto_67112 ) ) ( not ( = ?auto_67109 ?auto_67113 ) ) ( not ( = ?auto_67109 ?auto_67118 ) ) ( not ( = ?auto_67110 ?auto_67111 ) ) ( not ( = ?auto_67110 ?auto_67112 ) ) ( not ( = ?auto_67110 ?auto_67113 ) ) ( not ( = ?auto_67110 ?auto_67118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67111 ?auto_67112 ?auto_67113 )
      ( MAKE-6CRATE-VERIFY ?auto_67107 ?auto_67108 ?auto_67109 ?auto_67110 ?auto_67111 ?auto_67112 ?auto_67113 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67171 - SURFACE
      ?auto_67172 - SURFACE
      ?auto_67173 - SURFACE
      ?auto_67174 - SURFACE
      ?auto_67175 - SURFACE
      ?auto_67176 - SURFACE
      ?auto_67177 - SURFACE
    )
    :vars
    (
      ?auto_67179 - HOIST
      ?auto_67181 - PLACE
      ?auto_67183 - PLACE
      ?auto_67182 - HOIST
      ?auto_67178 - SURFACE
      ?auto_67180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67179 ?auto_67181 ) ( IS-CRATE ?auto_67177 ) ( not ( = ?auto_67176 ?auto_67177 ) ) ( not ( = ?auto_67175 ?auto_67176 ) ) ( not ( = ?auto_67175 ?auto_67177 ) ) ( not ( = ?auto_67183 ?auto_67181 ) ) ( HOIST-AT ?auto_67182 ?auto_67183 ) ( not ( = ?auto_67179 ?auto_67182 ) ) ( AVAILABLE ?auto_67182 ) ( SURFACE-AT ?auto_67177 ?auto_67183 ) ( ON ?auto_67177 ?auto_67178 ) ( CLEAR ?auto_67177 ) ( not ( = ?auto_67176 ?auto_67178 ) ) ( not ( = ?auto_67177 ?auto_67178 ) ) ( not ( = ?auto_67175 ?auto_67178 ) ) ( TRUCK-AT ?auto_67180 ?auto_67181 ) ( SURFACE-AT ?auto_67175 ?auto_67181 ) ( CLEAR ?auto_67175 ) ( LIFTING ?auto_67179 ?auto_67176 ) ( IS-CRATE ?auto_67176 ) ( ON ?auto_67172 ?auto_67171 ) ( ON ?auto_67173 ?auto_67172 ) ( ON ?auto_67174 ?auto_67173 ) ( ON ?auto_67175 ?auto_67174 ) ( not ( = ?auto_67171 ?auto_67172 ) ) ( not ( = ?auto_67171 ?auto_67173 ) ) ( not ( = ?auto_67171 ?auto_67174 ) ) ( not ( = ?auto_67171 ?auto_67175 ) ) ( not ( = ?auto_67171 ?auto_67176 ) ) ( not ( = ?auto_67171 ?auto_67177 ) ) ( not ( = ?auto_67171 ?auto_67178 ) ) ( not ( = ?auto_67172 ?auto_67173 ) ) ( not ( = ?auto_67172 ?auto_67174 ) ) ( not ( = ?auto_67172 ?auto_67175 ) ) ( not ( = ?auto_67172 ?auto_67176 ) ) ( not ( = ?auto_67172 ?auto_67177 ) ) ( not ( = ?auto_67172 ?auto_67178 ) ) ( not ( = ?auto_67173 ?auto_67174 ) ) ( not ( = ?auto_67173 ?auto_67175 ) ) ( not ( = ?auto_67173 ?auto_67176 ) ) ( not ( = ?auto_67173 ?auto_67177 ) ) ( not ( = ?auto_67173 ?auto_67178 ) ) ( not ( = ?auto_67174 ?auto_67175 ) ) ( not ( = ?auto_67174 ?auto_67176 ) ) ( not ( = ?auto_67174 ?auto_67177 ) ) ( not ( = ?auto_67174 ?auto_67178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67175 ?auto_67176 ?auto_67177 )
      ( MAKE-6CRATE-VERIFY ?auto_67171 ?auto_67172 ?auto_67173 ?auto_67174 ?auto_67175 ?auto_67176 ?auto_67177 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67235 - SURFACE
      ?auto_67236 - SURFACE
      ?auto_67237 - SURFACE
      ?auto_67238 - SURFACE
      ?auto_67239 - SURFACE
      ?auto_67240 - SURFACE
      ?auto_67241 - SURFACE
    )
    :vars
    (
      ?auto_67244 - HOIST
      ?auto_67245 - PLACE
      ?auto_67242 - PLACE
      ?auto_67247 - HOIST
      ?auto_67243 - SURFACE
      ?auto_67246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67244 ?auto_67245 ) ( IS-CRATE ?auto_67241 ) ( not ( = ?auto_67240 ?auto_67241 ) ) ( not ( = ?auto_67239 ?auto_67240 ) ) ( not ( = ?auto_67239 ?auto_67241 ) ) ( not ( = ?auto_67242 ?auto_67245 ) ) ( HOIST-AT ?auto_67247 ?auto_67242 ) ( not ( = ?auto_67244 ?auto_67247 ) ) ( AVAILABLE ?auto_67247 ) ( SURFACE-AT ?auto_67241 ?auto_67242 ) ( ON ?auto_67241 ?auto_67243 ) ( CLEAR ?auto_67241 ) ( not ( = ?auto_67240 ?auto_67243 ) ) ( not ( = ?auto_67241 ?auto_67243 ) ) ( not ( = ?auto_67239 ?auto_67243 ) ) ( TRUCK-AT ?auto_67246 ?auto_67245 ) ( SURFACE-AT ?auto_67239 ?auto_67245 ) ( CLEAR ?auto_67239 ) ( IS-CRATE ?auto_67240 ) ( AVAILABLE ?auto_67244 ) ( IN ?auto_67240 ?auto_67246 ) ( ON ?auto_67236 ?auto_67235 ) ( ON ?auto_67237 ?auto_67236 ) ( ON ?auto_67238 ?auto_67237 ) ( ON ?auto_67239 ?auto_67238 ) ( not ( = ?auto_67235 ?auto_67236 ) ) ( not ( = ?auto_67235 ?auto_67237 ) ) ( not ( = ?auto_67235 ?auto_67238 ) ) ( not ( = ?auto_67235 ?auto_67239 ) ) ( not ( = ?auto_67235 ?auto_67240 ) ) ( not ( = ?auto_67235 ?auto_67241 ) ) ( not ( = ?auto_67235 ?auto_67243 ) ) ( not ( = ?auto_67236 ?auto_67237 ) ) ( not ( = ?auto_67236 ?auto_67238 ) ) ( not ( = ?auto_67236 ?auto_67239 ) ) ( not ( = ?auto_67236 ?auto_67240 ) ) ( not ( = ?auto_67236 ?auto_67241 ) ) ( not ( = ?auto_67236 ?auto_67243 ) ) ( not ( = ?auto_67237 ?auto_67238 ) ) ( not ( = ?auto_67237 ?auto_67239 ) ) ( not ( = ?auto_67237 ?auto_67240 ) ) ( not ( = ?auto_67237 ?auto_67241 ) ) ( not ( = ?auto_67237 ?auto_67243 ) ) ( not ( = ?auto_67238 ?auto_67239 ) ) ( not ( = ?auto_67238 ?auto_67240 ) ) ( not ( = ?auto_67238 ?auto_67241 ) ) ( not ( = ?auto_67238 ?auto_67243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67239 ?auto_67240 ?auto_67241 )
      ( MAKE-6CRATE-VERIFY ?auto_67235 ?auto_67236 ?auto_67237 ?auto_67238 ?auto_67239 ?auto_67240 ?auto_67241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_68911 - SURFACE
      ?auto_68912 - SURFACE
    )
    :vars
    (
      ?auto_68918 - HOIST
      ?auto_68919 - PLACE
      ?auto_68915 - SURFACE
      ?auto_68917 - TRUCK
      ?auto_68913 - PLACE
      ?auto_68914 - HOIST
      ?auto_68916 - SURFACE
      ?auto_68920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68918 ?auto_68919 ) ( SURFACE-AT ?auto_68911 ?auto_68919 ) ( CLEAR ?auto_68911 ) ( IS-CRATE ?auto_68912 ) ( not ( = ?auto_68911 ?auto_68912 ) ) ( AVAILABLE ?auto_68918 ) ( ON ?auto_68911 ?auto_68915 ) ( not ( = ?auto_68915 ?auto_68911 ) ) ( not ( = ?auto_68915 ?auto_68912 ) ) ( TRUCK-AT ?auto_68917 ?auto_68913 ) ( not ( = ?auto_68913 ?auto_68919 ) ) ( HOIST-AT ?auto_68914 ?auto_68913 ) ( not ( = ?auto_68918 ?auto_68914 ) ) ( SURFACE-AT ?auto_68912 ?auto_68913 ) ( ON ?auto_68912 ?auto_68916 ) ( CLEAR ?auto_68912 ) ( not ( = ?auto_68911 ?auto_68916 ) ) ( not ( = ?auto_68912 ?auto_68916 ) ) ( not ( = ?auto_68915 ?auto_68916 ) ) ( LIFTING ?auto_68914 ?auto_68920 ) ( IS-CRATE ?auto_68920 ) ( not ( = ?auto_68911 ?auto_68920 ) ) ( not ( = ?auto_68912 ?auto_68920 ) ) ( not ( = ?auto_68915 ?auto_68920 ) ) ( not ( = ?auto_68916 ?auto_68920 ) ) )
    :subtasks
    ( ( !LOAD ?auto_68914 ?auto_68920 ?auto_68917 ?auto_68913 )
      ( MAKE-1CRATE ?auto_68911 ?auto_68912 )
      ( MAKE-1CRATE-VERIFY ?auto_68911 ?auto_68912 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69187 - SURFACE
      ?auto_69188 - SURFACE
      ?auto_69189 - SURFACE
      ?auto_69190 - SURFACE
      ?auto_69191 - SURFACE
      ?auto_69192 - SURFACE
      ?auto_69193 - SURFACE
      ?auto_69194 - SURFACE
    )
    :vars
    (
      ?auto_69196 - HOIST
      ?auto_69195 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69196 ?auto_69195 ) ( SURFACE-AT ?auto_69193 ?auto_69195 ) ( CLEAR ?auto_69193 ) ( LIFTING ?auto_69196 ?auto_69194 ) ( IS-CRATE ?auto_69194 ) ( not ( = ?auto_69193 ?auto_69194 ) ) ( ON ?auto_69188 ?auto_69187 ) ( ON ?auto_69189 ?auto_69188 ) ( ON ?auto_69190 ?auto_69189 ) ( ON ?auto_69191 ?auto_69190 ) ( ON ?auto_69192 ?auto_69191 ) ( ON ?auto_69193 ?auto_69192 ) ( not ( = ?auto_69187 ?auto_69188 ) ) ( not ( = ?auto_69187 ?auto_69189 ) ) ( not ( = ?auto_69187 ?auto_69190 ) ) ( not ( = ?auto_69187 ?auto_69191 ) ) ( not ( = ?auto_69187 ?auto_69192 ) ) ( not ( = ?auto_69187 ?auto_69193 ) ) ( not ( = ?auto_69187 ?auto_69194 ) ) ( not ( = ?auto_69188 ?auto_69189 ) ) ( not ( = ?auto_69188 ?auto_69190 ) ) ( not ( = ?auto_69188 ?auto_69191 ) ) ( not ( = ?auto_69188 ?auto_69192 ) ) ( not ( = ?auto_69188 ?auto_69193 ) ) ( not ( = ?auto_69188 ?auto_69194 ) ) ( not ( = ?auto_69189 ?auto_69190 ) ) ( not ( = ?auto_69189 ?auto_69191 ) ) ( not ( = ?auto_69189 ?auto_69192 ) ) ( not ( = ?auto_69189 ?auto_69193 ) ) ( not ( = ?auto_69189 ?auto_69194 ) ) ( not ( = ?auto_69190 ?auto_69191 ) ) ( not ( = ?auto_69190 ?auto_69192 ) ) ( not ( = ?auto_69190 ?auto_69193 ) ) ( not ( = ?auto_69190 ?auto_69194 ) ) ( not ( = ?auto_69191 ?auto_69192 ) ) ( not ( = ?auto_69191 ?auto_69193 ) ) ( not ( = ?auto_69191 ?auto_69194 ) ) ( not ( = ?auto_69192 ?auto_69193 ) ) ( not ( = ?auto_69192 ?auto_69194 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_69193 ?auto_69194 )
      ( MAKE-7CRATE-VERIFY ?auto_69187 ?auto_69188 ?auto_69189 ?auto_69190 ?auto_69191 ?auto_69192 ?auto_69193 ?auto_69194 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69242 - SURFACE
      ?auto_69243 - SURFACE
      ?auto_69244 - SURFACE
      ?auto_69245 - SURFACE
      ?auto_69246 - SURFACE
      ?auto_69247 - SURFACE
      ?auto_69248 - SURFACE
      ?auto_69249 - SURFACE
    )
    :vars
    (
      ?auto_69251 - HOIST
      ?auto_69252 - PLACE
      ?auto_69250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69251 ?auto_69252 ) ( SURFACE-AT ?auto_69248 ?auto_69252 ) ( CLEAR ?auto_69248 ) ( IS-CRATE ?auto_69249 ) ( not ( = ?auto_69248 ?auto_69249 ) ) ( TRUCK-AT ?auto_69250 ?auto_69252 ) ( AVAILABLE ?auto_69251 ) ( IN ?auto_69249 ?auto_69250 ) ( ON ?auto_69248 ?auto_69247 ) ( not ( = ?auto_69247 ?auto_69248 ) ) ( not ( = ?auto_69247 ?auto_69249 ) ) ( ON ?auto_69243 ?auto_69242 ) ( ON ?auto_69244 ?auto_69243 ) ( ON ?auto_69245 ?auto_69244 ) ( ON ?auto_69246 ?auto_69245 ) ( ON ?auto_69247 ?auto_69246 ) ( not ( = ?auto_69242 ?auto_69243 ) ) ( not ( = ?auto_69242 ?auto_69244 ) ) ( not ( = ?auto_69242 ?auto_69245 ) ) ( not ( = ?auto_69242 ?auto_69246 ) ) ( not ( = ?auto_69242 ?auto_69247 ) ) ( not ( = ?auto_69242 ?auto_69248 ) ) ( not ( = ?auto_69242 ?auto_69249 ) ) ( not ( = ?auto_69243 ?auto_69244 ) ) ( not ( = ?auto_69243 ?auto_69245 ) ) ( not ( = ?auto_69243 ?auto_69246 ) ) ( not ( = ?auto_69243 ?auto_69247 ) ) ( not ( = ?auto_69243 ?auto_69248 ) ) ( not ( = ?auto_69243 ?auto_69249 ) ) ( not ( = ?auto_69244 ?auto_69245 ) ) ( not ( = ?auto_69244 ?auto_69246 ) ) ( not ( = ?auto_69244 ?auto_69247 ) ) ( not ( = ?auto_69244 ?auto_69248 ) ) ( not ( = ?auto_69244 ?auto_69249 ) ) ( not ( = ?auto_69245 ?auto_69246 ) ) ( not ( = ?auto_69245 ?auto_69247 ) ) ( not ( = ?auto_69245 ?auto_69248 ) ) ( not ( = ?auto_69245 ?auto_69249 ) ) ( not ( = ?auto_69246 ?auto_69247 ) ) ( not ( = ?auto_69246 ?auto_69248 ) ) ( not ( = ?auto_69246 ?auto_69249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69247 ?auto_69248 ?auto_69249 )
      ( MAKE-7CRATE-VERIFY ?auto_69242 ?auto_69243 ?auto_69244 ?auto_69245 ?auto_69246 ?auto_69247 ?auto_69248 ?auto_69249 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69305 - SURFACE
      ?auto_69306 - SURFACE
      ?auto_69307 - SURFACE
      ?auto_69308 - SURFACE
      ?auto_69309 - SURFACE
      ?auto_69310 - SURFACE
      ?auto_69311 - SURFACE
      ?auto_69312 - SURFACE
    )
    :vars
    (
      ?auto_69314 - HOIST
      ?auto_69313 - PLACE
      ?auto_69316 - TRUCK
      ?auto_69315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69314 ?auto_69313 ) ( SURFACE-AT ?auto_69311 ?auto_69313 ) ( CLEAR ?auto_69311 ) ( IS-CRATE ?auto_69312 ) ( not ( = ?auto_69311 ?auto_69312 ) ) ( AVAILABLE ?auto_69314 ) ( IN ?auto_69312 ?auto_69316 ) ( ON ?auto_69311 ?auto_69310 ) ( not ( = ?auto_69310 ?auto_69311 ) ) ( not ( = ?auto_69310 ?auto_69312 ) ) ( TRUCK-AT ?auto_69316 ?auto_69315 ) ( not ( = ?auto_69315 ?auto_69313 ) ) ( ON ?auto_69306 ?auto_69305 ) ( ON ?auto_69307 ?auto_69306 ) ( ON ?auto_69308 ?auto_69307 ) ( ON ?auto_69309 ?auto_69308 ) ( ON ?auto_69310 ?auto_69309 ) ( not ( = ?auto_69305 ?auto_69306 ) ) ( not ( = ?auto_69305 ?auto_69307 ) ) ( not ( = ?auto_69305 ?auto_69308 ) ) ( not ( = ?auto_69305 ?auto_69309 ) ) ( not ( = ?auto_69305 ?auto_69310 ) ) ( not ( = ?auto_69305 ?auto_69311 ) ) ( not ( = ?auto_69305 ?auto_69312 ) ) ( not ( = ?auto_69306 ?auto_69307 ) ) ( not ( = ?auto_69306 ?auto_69308 ) ) ( not ( = ?auto_69306 ?auto_69309 ) ) ( not ( = ?auto_69306 ?auto_69310 ) ) ( not ( = ?auto_69306 ?auto_69311 ) ) ( not ( = ?auto_69306 ?auto_69312 ) ) ( not ( = ?auto_69307 ?auto_69308 ) ) ( not ( = ?auto_69307 ?auto_69309 ) ) ( not ( = ?auto_69307 ?auto_69310 ) ) ( not ( = ?auto_69307 ?auto_69311 ) ) ( not ( = ?auto_69307 ?auto_69312 ) ) ( not ( = ?auto_69308 ?auto_69309 ) ) ( not ( = ?auto_69308 ?auto_69310 ) ) ( not ( = ?auto_69308 ?auto_69311 ) ) ( not ( = ?auto_69308 ?auto_69312 ) ) ( not ( = ?auto_69309 ?auto_69310 ) ) ( not ( = ?auto_69309 ?auto_69311 ) ) ( not ( = ?auto_69309 ?auto_69312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69310 ?auto_69311 ?auto_69312 )
      ( MAKE-7CRATE-VERIFY ?auto_69305 ?auto_69306 ?auto_69307 ?auto_69308 ?auto_69309 ?auto_69310 ?auto_69311 ?auto_69312 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69375 - SURFACE
      ?auto_69376 - SURFACE
      ?auto_69377 - SURFACE
      ?auto_69378 - SURFACE
      ?auto_69379 - SURFACE
      ?auto_69380 - SURFACE
      ?auto_69381 - SURFACE
      ?auto_69382 - SURFACE
    )
    :vars
    (
      ?auto_69387 - HOIST
      ?auto_69384 - PLACE
      ?auto_69386 - TRUCK
      ?auto_69385 - PLACE
      ?auto_69383 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_69387 ?auto_69384 ) ( SURFACE-AT ?auto_69381 ?auto_69384 ) ( CLEAR ?auto_69381 ) ( IS-CRATE ?auto_69382 ) ( not ( = ?auto_69381 ?auto_69382 ) ) ( AVAILABLE ?auto_69387 ) ( ON ?auto_69381 ?auto_69380 ) ( not ( = ?auto_69380 ?auto_69381 ) ) ( not ( = ?auto_69380 ?auto_69382 ) ) ( TRUCK-AT ?auto_69386 ?auto_69385 ) ( not ( = ?auto_69385 ?auto_69384 ) ) ( HOIST-AT ?auto_69383 ?auto_69385 ) ( LIFTING ?auto_69383 ?auto_69382 ) ( not ( = ?auto_69387 ?auto_69383 ) ) ( ON ?auto_69376 ?auto_69375 ) ( ON ?auto_69377 ?auto_69376 ) ( ON ?auto_69378 ?auto_69377 ) ( ON ?auto_69379 ?auto_69378 ) ( ON ?auto_69380 ?auto_69379 ) ( not ( = ?auto_69375 ?auto_69376 ) ) ( not ( = ?auto_69375 ?auto_69377 ) ) ( not ( = ?auto_69375 ?auto_69378 ) ) ( not ( = ?auto_69375 ?auto_69379 ) ) ( not ( = ?auto_69375 ?auto_69380 ) ) ( not ( = ?auto_69375 ?auto_69381 ) ) ( not ( = ?auto_69375 ?auto_69382 ) ) ( not ( = ?auto_69376 ?auto_69377 ) ) ( not ( = ?auto_69376 ?auto_69378 ) ) ( not ( = ?auto_69376 ?auto_69379 ) ) ( not ( = ?auto_69376 ?auto_69380 ) ) ( not ( = ?auto_69376 ?auto_69381 ) ) ( not ( = ?auto_69376 ?auto_69382 ) ) ( not ( = ?auto_69377 ?auto_69378 ) ) ( not ( = ?auto_69377 ?auto_69379 ) ) ( not ( = ?auto_69377 ?auto_69380 ) ) ( not ( = ?auto_69377 ?auto_69381 ) ) ( not ( = ?auto_69377 ?auto_69382 ) ) ( not ( = ?auto_69378 ?auto_69379 ) ) ( not ( = ?auto_69378 ?auto_69380 ) ) ( not ( = ?auto_69378 ?auto_69381 ) ) ( not ( = ?auto_69378 ?auto_69382 ) ) ( not ( = ?auto_69379 ?auto_69380 ) ) ( not ( = ?auto_69379 ?auto_69381 ) ) ( not ( = ?auto_69379 ?auto_69382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69380 ?auto_69381 ?auto_69382 )
      ( MAKE-7CRATE-VERIFY ?auto_69375 ?auto_69376 ?auto_69377 ?auto_69378 ?auto_69379 ?auto_69380 ?auto_69381 ?auto_69382 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69452 - SURFACE
      ?auto_69453 - SURFACE
      ?auto_69454 - SURFACE
      ?auto_69455 - SURFACE
      ?auto_69456 - SURFACE
      ?auto_69457 - SURFACE
      ?auto_69458 - SURFACE
      ?auto_69459 - SURFACE
    )
    :vars
    (
      ?auto_69460 - HOIST
      ?auto_69461 - PLACE
      ?auto_69463 - TRUCK
      ?auto_69464 - PLACE
      ?auto_69465 - HOIST
      ?auto_69462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69460 ?auto_69461 ) ( SURFACE-AT ?auto_69458 ?auto_69461 ) ( CLEAR ?auto_69458 ) ( IS-CRATE ?auto_69459 ) ( not ( = ?auto_69458 ?auto_69459 ) ) ( AVAILABLE ?auto_69460 ) ( ON ?auto_69458 ?auto_69457 ) ( not ( = ?auto_69457 ?auto_69458 ) ) ( not ( = ?auto_69457 ?auto_69459 ) ) ( TRUCK-AT ?auto_69463 ?auto_69464 ) ( not ( = ?auto_69464 ?auto_69461 ) ) ( HOIST-AT ?auto_69465 ?auto_69464 ) ( not ( = ?auto_69460 ?auto_69465 ) ) ( AVAILABLE ?auto_69465 ) ( SURFACE-AT ?auto_69459 ?auto_69464 ) ( ON ?auto_69459 ?auto_69462 ) ( CLEAR ?auto_69459 ) ( not ( = ?auto_69458 ?auto_69462 ) ) ( not ( = ?auto_69459 ?auto_69462 ) ) ( not ( = ?auto_69457 ?auto_69462 ) ) ( ON ?auto_69453 ?auto_69452 ) ( ON ?auto_69454 ?auto_69453 ) ( ON ?auto_69455 ?auto_69454 ) ( ON ?auto_69456 ?auto_69455 ) ( ON ?auto_69457 ?auto_69456 ) ( not ( = ?auto_69452 ?auto_69453 ) ) ( not ( = ?auto_69452 ?auto_69454 ) ) ( not ( = ?auto_69452 ?auto_69455 ) ) ( not ( = ?auto_69452 ?auto_69456 ) ) ( not ( = ?auto_69452 ?auto_69457 ) ) ( not ( = ?auto_69452 ?auto_69458 ) ) ( not ( = ?auto_69452 ?auto_69459 ) ) ( not ( = ?auto_69452 ?auto_69462 ) ) ( not ( = ?auto_69453 ?auto_69454 ) ) ( not ( = ?auto_69453 ?auto_69455 ) ) ( not ( = ?auto_69453 ?auto_69456 ) ) ( not ( = ?auto_69453 ?auto_69457 ) ) ( not ( = ?auto_69453 ?auto_69458 ) ) ( not ( = ?auto_69453 ?auto_69459 ) ) ( not ( = ?auto_69453 ?auto_69462 ) ) ( not ( = ?auto_69454 ?auto_69455 ) ) ( not ( = ?auto_69454 ?auto_69456 ) ) ( not ( = ?auto_69454 ?auto_69457 ) ) ( not ( = ?auto_69454 ?auto_69458 ) ) ( not ( = ?auto_69454 ?auto_69459 ) ) ( not ( = ?auto_69454 ?auto_69462 ) ) ( not ( = ?auto_69455 ?auto_69456 ) ) ( not ( = ?auto_69455 ?auto_69457 ) ) ( not ( = ?auto_69455 ?auto_69458 ) ) ( not ( = ?auto_69455 ?auto_69459 ) ) ( not ( = ?auto_69455 ?auto_69462 ) ) ( not ( = ?auto_69456 ?auto_69457 ) ) ( not ( = ?auto_69456 ?auto_69458 ) ) ( not ( = ?auto_69456 ?auto_69459 ) ) ( not ( = ?auto_69456 ?auto_69462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69457 ?auto_69458 ?auto_69459 )
      ( MAKE-7CRATE-VERIFY ?auto_69452 ?auto_69453 ?auto_69454 ?auto_69455 ?auto_69456 ?auto_69457 ?auto_69458 ?auto_69459 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69530 - SURFACE
      ?auto_69531 - SURFACE
      ?auto_69532 - SURFACE
      ?auto_69533 - SURFACE
      ?auto_69534 - SURFACE
      ?auto_69535 - SURFACE
      ?auto_69536 - SURFACE
      ?auto_69537 - SURFACE
    )
    :vars
    (
      ?auto_69543 - HOIST
      ?auto_69540 - PLACE
      ?auto_69538 - PLACE
      ?auto_69542 - HOIST
      ?auto_69541 - SURFACE
      ?auto_69539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69543 ?auto_69540 ) ( SURFACE-AT ?auto_69536 ?auto_69540 ) ( CLEAR ?auto_69536 ) ( IS-CRATE ?auto_69537 ) ( not ( = ?auto_69536 ?auto_69537 ) ) ( AVAILABLE ?auto_69543 ) ( ON ?auto_69536 ?auto_69535 ) ( not ( = ?auto_69535 ?auto_69536 ) ) ( not ( = ?auto_69535 ?auto_69537 ) ) ( not ( = ?auto_69538 ?auto_69540 ) ) ( HOIST-AT ?auto_69542 ?auto_69538 ) ( not ( = ?auto_69543 ?auto_69542 ) ) ( AVAILABLE ?auto_69542 ) ( SURFACE-AT ?auto_69537 ?auto_69538 ) ( ON ?auto_69537 ?auto_69541 ) ( CLEAR ?auto_69537 ) ( not ( = ?auto_69536 ?auto_69541 ) ) ( not ( = ?auto_69537 ?auto_69541 ) ) ( not ( = ?auto_69535 ?auto_69541 ) ) ( TRUCK-AT ?auto_69539 ?auto_69540 ) ( ON ?auto_69531 ?auto_69530 ) ( ON ?auto_69532 ?auto_69531 ) ( ON ?auto_69533 ?auto_69532 ) ( ON ?auto_69534 ?auto_69533 ) ( ON ?auto_69535 ?auto_69534 ) ( not ( = ?auto_69530 ?auto_69531 ) ) ( not ( = ?auto_69530 ?auto_69532 ) ) ( not ( = ?auto_69530 ?auto_69533 ) ) ( not ( = ?auto_69530 ?auto_69534 ) ) ( not ( = ?auto_69530 ?auto_69535 ) ) ( not ( = ?auto_69530 ?auto_69536 ) ) ( not ( = ?auto_69530 ?auto_69537 ) ) ( not ( = ?auto_69530 ?auto_69541 ) ) ( not ( = ?auto_69531 ?auto_69532 ) ) ( not ( = ?auto_69531 ?auto_69533 ) ) ( not ( = ?auto_69531 ?auto_69534 ) ) ( not ( = ?auto_69531 ?auto_69535 ) ) ( not ( = ?auto_69531 ?auto_69536 ) ) ( not ( = ?auto_69531 ?auto_69537 ) ) ( not ( = ?auto_69531 ?auto_69541 ) ) ( not ( = ?auto_69532 ?auto_69533 ) ) ( not ( = ?auto_69532 ?auto_69534 ) ) ( not ( = ?auto_69532 ?auto_69535 ) ) ( not ( = ?auto_69532 ?auto_69536 ) ) ( not ( = ?auto_69532 ?auto_69537 ) ) ( not ( = ?auto_69532 ?auto_69541 ) ) ( not ( = ?auto_69533 ?auto_69534 ) ) ( not ( = ?auto_69533 ?auto_69535 ) ) ( not ( = ?auto_69533 ?auto_69536 ) ) ( not ( = ?auto_69533 ?auto_69537 ) ) ( not ( = ?auto_69533 ?auto_69541 ) ) ( not ( = ?auto_69534 ?auto_69535 ) ) ( not ( = ?auto_69534 ?auto_69536 ) ) ( not ( = ?auto_69534 ?auto_69537 ) ) ( not ( = ?auto_69534 ?auto_69541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69535 ?auto_69536 ?auto_69537 )
      ( MAKE-7CRATE-VERIFY ?auto_69530 ?auto_69531 ?auto_69532 ?auto_69533 ?auto_69534 ?auto_69535 ?auto_69536 ?auto_69537 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69608 - SURFACE
      ?auto_69609 - SURFACE
      ?auto_69610 - SURFACE
      ?auto_69611 - SURFACE
      ?auto_69612 - SURFACE
      ?auto_69613 - SURFACE
      ?auto_69614 - SURFACE
      ?auto_69615 - SURFACE
    )
    :vars
    (
      ?auto_69617 - HOIST
      ?auto_69618 - PLACE
      ?auto_69619 - PLACE
      ?auto_69616 - HOIST
      ?auto_69621 - SURFACE
      ?auto_69620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69617 ?auto_69618 ) ( IS-CRATE ?auto_69615 ) ( not ( = ?auto_69614 ?auto_69615 ) ) ( not ( = ?auto_69613 ?auto_69614 ) ) ( not ( = ?auto_69613 ?auto_69615 ) ) ( not ( = ?auto_69619 ?auto_69618 ) ) ( HOIST-AT ?auto_69616 ?auto_69619 ) ( not ( = ?auto_69617 ?auto_69616 ) ) ( AVAILABLE ?auto_69616 ) ( SURFACE-AT ?auto_69615 ?auto_69619 ) ( ON ?auto_69615 ?auto_69621 ) ( CLEAR ?auto_69615 ) ( not ( = ?auto_69614 ?auto_69621 ) ) ( not ( = ?auto_69615 ?auto_69621 ) ) ( not ( = ?auto_69613 ?auto_69621 ) ) ( TRUCK-AT ?auto_69620 ?auto_69618 ) ( SURFACE-AT ?auto_69613 ?auto_69618 ) ( CLEAR ?auto_69613 ) ( LIFTING ?auto_69617 ?auto_69614 ) ( IS-CRATE ?auto_69614 ) ( ON ?auto_69609 ?auto_69608 ) ( ON ?auto_69610 ?auto_69609 ) ( ON ?auto_69611 ?auto_69610 ) ( ON ?auto_69612 ?auto_69611 ) ( ON ?auto_69613 ?auto_69612 ) ( not ( = ?auto_69608 ?auto_69609 ) ) ( not ( = ?auto_69608 ?auto_69610 ) ) ( not ( = ?auto_69608 ?auto_69611 ) ) ( not ( = ?auto_69608 ?auto_69612 ) ) ( not ( = ?auto_69608 ?auto_69613 ) ) ( not ( = ?auto_69608 ?auto_69614 ) ) ( not ( = ?auto_69608 ?auto_69615 ) ) ( not ( = ?auto_69608 ?auto_69621 ) ) ( not ( = ?auto_69609 ?auto_69610 ) ) ( not ( = ?auto_69609 ?auto_69611 ) ) ( not ( = ?auto_69609 ?auto_69612 ) ) ( not ( = ?auto_69609 ?auto_69613 ) ) ( not ( = ?auto_69609 ?auto_69614 ) ) ( not ( = ?auto_69609 ?auto_69615 ) ) ( not ( = ?auto_69609 ?auto_69621 ) ) ( not ( = ?auto_69610 ?auto_69611 ) ) ( not ( = ?auto_69610 ?auto_69612 ) ) ( not ( = ?auto_69610 ?auto_69613 ) ) ( not ( = ?auto_69610 ?auto_69614 ) ) ( not ( = ?auto_69610 ?auto_69615 ) ) ( not ( = ?auto_69610 ?auto_69621 ) ) ( not ( = ?auto_69611 ?auto_69612 ) ) ( not ( = ?auto_69611 ?auto_69613 ) ) ( not ( = ?auto_69611 ?auto_69614 ) ) ( not ( = ?auto_69611 ?auto_69615 ) ) ( not ( = ?auto_69611 ?auto_69621 ) ) ( not ( = ?auto_69612 ?auto_69613 ) ) ( not ( = ?auto_69612 ?auto_69614 ) ) ( not ( = ?auto_69612 ?auto_69615 ) ) ( not ( = ?auto_69612 ?auto_69621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69613 ?auto_69614 ?auto_69615 )
      ( MAKE-7CRATE-VERIFY ?auto_69608 ?auto_69609 ?auto_69610 ?auto_69611 ?auto_69612 ?auto_69613 ?auto_69614 ?auto_69615 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69686 - SURFACE
      ?auto_69687 - SURFACE
      ?auto_69688 - SURFACE
      ?auto_69689 - SURFACE
      ?auto_69690 - SURFACE
      ?auto_69691 - SURFACE
      ?auto_69692 - SURFACE
      ?auto_69693 - SURFACE
    )
    :vars
    (
      ?auto_69697 - HOIST
      ?auto_69698 - PLACE
      ?auto_69696 - PLACE
      ?auto_69699 - HOIST
      ?auto_69695 - SURFACE
      ?auto_69694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69697 ?auto_69698 ) ( IS-CRATE ?auto_69693 ) ( not ( = ?auto_69692 ?auto_69693 ) ) ( not ( = ?auto_69691 ?auto_69692 ) ) ( not ( = ?auto_69691 ?auto_69693 ) ) ( not ( = ?auto_69696 ?auto_69698 ) ) ( HOIST-AT ?auto_69699 ?auto_69696 ) ( not ( = ?auto_69697 ?auto_69699 ) ) ( AVAILABLE ?auto_69699 ) ( SURFACE-AT ?auto_69693 ?auto_69696 ) ( ON ?auto_69693 ?auto_69695 ) ( CLEAR ?auto_69693 ) ( not ( = ?auto_69692 ?auto_69695 ) ) ( not ( = ?auto_69693 ?auto_69695 ) ) ( not ( = ?auto_69691 ?auto_69695 ) ) ( TRUCK-AT ?auto_69694 ?auto_69698 ) ( SURFACE-AT ?auto_69691 ?auto_69698 ) ( CLEAR ?auto_69691 ) ( IS-CRATE ?auto_69692 ) ( AVAILABLE ?auto_69697 ) ( IN ?auto_69692 ?auto_69694 ) ( ON ?auto_69687 ?auto_69686 ) ( ON ?auto_69688 ?auto_69687 ) ( ON ?auto_69689 ?auto_69688 ) ( ON ?auto_69690 ?auto_69689 ) ( ON ?auto_69691 ?auto_69690 ) ( not ( = ?auto_69686 ?auto_69687 ) ) ( not ( = ?auto_69686 ?auto_69688 ) ) ( not ( = ?auto_69686 ?auto_69689 ) ) ( not ( = ?auto_69686 ?auto_69690 ) ) ( not ( = ?auto_69686 ?auto_69691 ) ) ( not ( = ?auto_69686 ?auto_69692 ) ) ( not ( = ?auto_69686 ?auto_69693 ) ) ( not ( = ?auto_69686 ?auto_69695 ) ) ( not ( = ?auto_69687 ?auto_69688 ) ) ( not ( = ?auto_69687 ?auto_69689 ) ) ( not ( = ?auto_69687 ?auto_69690 ) ) ( not ( = ?auto_69687 ?auto_69691 ) ) ( not ( = ?auto_69687 ?auto_69692 ) ) ( not ( = ?auto_69687 ?auto_69693 ) ) ( not ( = ?auto_69687 ?auto_69695 ) ) ( not ( = ?auto_69688 ?auto_69689 ) ) ( not ( = ?auto_69688 ?auto_69690 ) ) ( not ( = ?auto_69688 ?auto_69691 ) ) ( not ( = ?auto_69688 ?auto_69692 ) ) ( not ( = ?auto_69688 ?auto_69693 ) ) ( not ( = ?auto_69688 ?auto_69695 ) ) ( not ( = ?auto_69689 ?auto_69690 ) ) ( not ( = ?auto_69689 ?auto_69691 ) ) ( not ( = ?auto_69689 ?auto_69692 ) ) ( not ( = ?auto_69689 ?auto_69693 ) ) ( not ( = ?auto_69689 ?auto_69695 ) ) ( not ( = ?auto_69690 ?auto_69691 ) ) ( not ( = ?auto_69690 ?auto_69692 ) ) ( not ( = ?auto_69690 ?auto_69693 ) ) ( not ( = ?auto_69690 ?auto_69695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69691 ?auto_69692 ?auto_69693 )
      ( MAKE-7CRATE-VERIFY ?auto_69686 ?auto_69687 ?auto_69688 ?auto_69689 ?auto_69690 ?auto_69691 ?auto_69692 ?auto_69693 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72257 - SURFACE
      ?auto_72258 - SURFACE
    )
    :vars
    (
      ?auto_72259 - HOIST
      ?auto_72263 - PLACE
      ?auto_72260 - SURFACE
      ?auto_72265 - PLACE
      ?auto_72264 - HOIST
      ?auto_72262 - SURFACE
      ?auto_72261 - TRUCK
      ?auto_72266 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72259 ?auto_72263 ) ( SURFACE-AT ?auto_72257 ?auto_72263 ) ( CLEAR ?auto_72257 ) ( IS-CRATE ?auto_72258 ) ( not ( = ?auto_72257 ?auto_72258 ) ) ( ON ?auto_72257 ?auto_72260 ) ( not ( = ?auto_72260 ?auto_72257 ) ) ( not ( = ?auto_72260 ?auto_72258 ) ) ( not ( = ?auto_72265 ?auto_72263 ) ) ( HOIST-AT ?auto_72264 ?auto_72265 ) ( not ( = ?auto_72259 ?auto_72264 ) ) ( AVAILABLE ?auto_72264 ) ( SURFACE-AT ?auto_72258 ?auto_72265 ) ( ON ?auto_72258 ?auto_72262 ) ( CLEAR ?auto_72258 ) ( not ( = ?auto_72257 ?auto_72262 ) ) ( not ( = ?auto_72258 ?auto_72262 ) ) ( not ( = ?auto_72260 ?auto_72262 ) ) ( TRUCK-AT ?auto_72261 ?auto_72263 ) ( LIFTING ?auto_72259 ?auto_72266 ) ( IS-CRATE ?auto_72266 ) ( not ( = ?auto_72257 ?auto_72266 ) ) ( not ( = ?auto_72258 ?auto_72266 ) ) ( not ( = ?auto_72260 ?auto_72266 ) ) ( not ( = ?auto_72262 ?auto_72266 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72259 ?auto_72266 ?auto_72261 ?auto_72263 )
      ( MAKE-1CRATE ?auto_72257 ?auto_72258 )
      ( MAKE-1CRATE-VERIFY ?auto_72257 ?auto_72258 ) )
  )

)

