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
      ?auto_63680 - SURFACE
      ?auto_63681 - SURFACE
    )
    :vars
    (
      ?auto_63682 - HOIST
      ?auto_63683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63682 ?auto_63683 ) ( SURFACE-AT ?auto_63680 ?auto_63683 ) ( CLEAR ?auto_63680 ) ( LIFTING ?auto_63682 ?auto_63681 ) ( IS-CRATE ?auto_63681 ) ( not ( = ?auto_63680 ?auto_63681 ) ) )
    :subtasks
    ( ( !DROP ?auto_63682 ?auto_63681 ?auto_63680 ?auto_63683 )
      ( MAKE-1CRATE-VERIFY ?auto_63680 ?auto_63681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63684 - SURFACE
      ?auto_63685 - SURFACE
    )
    :vars
    (
      ?auto_63687 - HOIST
      ?auto_63686 - PLACE
      ?auto_63688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63687 ?auto_63686 ) ( SURFACE-AT ?auto_63684 ?auto_63686 ) ( CLEAR ?auto_63684 ) ( IS-CRATE ?auto_63685 ) ( not ( = ?auto_63684 ?auto_63685 ) ) ( TRUCK-AT ?auto_63688 ?auto_63686 ) ( AVAILABLE ?auto_63687 ) ( IN ?auto_63685 ?auto_63688 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63687 ?auto_63685 ?auto_63688 ?auto_63686 )
      ( MAKE-1CRATE ?auto_63684 ?auto_63685 )
      ( MAKE-1CRATE-VERIFY ?auto_63684 ?auto_63685 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63689 - SURFACE
      ?auto_63690 - SURFACE
    )
    :vars
    (
      ?auto_63692 - HOIST
      ?auto_63691 - PLACE
      ?auto_63693 - TRUCK
      ?auto_63694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63692 ?auto_63691 ) ( SURFACE-AT ?auto_63689 ?auto_63691 ) ( CLEAR ?auto_63689 ) ( IS-CRATE ?auto_63690 ) ( not ( = ?auto_63689 ?auto_63690 ) ) ( AVAILABLE ?auto_63692 ) ( IN ?auto_63690 ?auto_63693 ) ( TRUCK-AT ?auto_63693 ?auto_63694 ) ( not ( = ?auto_63694 ?auto_63691 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63693 ?auto_63694 ?auto_63691 )
      ( MAKE-1CRATE ?auto_63689 ?auto_63690 )
      ( MAKE-1CRATE-VERIFY ?auto_63689 ?auto_63690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63695 - SURFACE
      ?auto_63696 - SURFACE
    )
    :vars
    (
      ?auto_63699 - HOIST
      ?auto_63697 - PLACE
      ?auto_63698 - TRUCK
      ?auto_63700 - PLACE
      ?auto_63701 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63699 ?auto_63697 ) ( SURFACE-AT ?auto_63695 ?auto_63697 ) ( CLEAR ?auto_63695 ) ( IS-CRATE ?auto_63696 ) ( not ( = ?auto_63695 ?auto_63696 ) ) ( AVAILABLE ?auto_63699 ) ( TRUCK-AT ?auto_63698 ?auto_63700 ) ( not ( = ?auto_63700 ?auto_63697 ) ) ( HOIST-AT ?auto_63701 ?auto_63700 ) ( LIFTING ?auto_63701 ?auto_63696 ) ( not ( = ?auto_63699 ?auto_63701 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63701 ?auto_63696 ?auto_63698 ?auto_63700 )
      ( MAKE-1CRATE ?auto_63695 ?auto_63696 )
      ( MAKE-1CRATE-VERIFY ?auto_63695 ?auto_63696 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63702 - SURFACE
      ?auto_63703 - SURFACE
    )
    :vars
    (
      ?auto_63706 - HOIST
      ?auto_63708 - PLACE
      ?auto_63705 - TRUCK
      ?auto_63707 - PLACE
      ?auto_63704 - HOIST
      ?auto_63709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63706 ?auto_63708 ) ( SURFACE-AT ?auto_63702 ?auto_63708 ) ( CLEAR ?auto_63702 ) ( IS-CRATE ?auto_63703 ) ( not ( = ?auto_63702 ?auto_63703 ) ) ( AVAILABLE ?auto_63706 ) ( TRUCK-AT ?auto_63705 ?auto_63707 ) ( not ( = ?auto_63707 ?auto_63708 ) ) ( HOIST-AT ?auto_63704 ?auto_63707 ) ( not ( = ?auto_63706 ?auto_63704 ) ) ( AVAILABLE ?auto_63704 ) ( SURFACE-AT ?auto_63703 ?auto_63707 ) ( ON ?auto_63703 ?auto_63709 ) ( CLEAR ?auto_63703 ) ( not ( = ?auto_63702 ?auto_63709 ) ) ( not ( = ?auto_63703 ?auto_63709 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63704 ?auto_63703 ?auto_63709 ?auto_63707 )
      ( MAKE-1CRATE ?auto_63702 ?auto_63703 )
      ( MAKE-1CRATE-VERIFY ?auto_63702 ?auto_63703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63710 - SURFACE
      ?auto_63711 - SURFACE
    )
    :vars
    (
      ?auto_63715 - HOIST
      ?auto_63712 - PLACE
      ?auto_63714 - PLACE
      ?auto_63717 - HOIST
      ?auto_63713 - SURFACE
      ?auto_63716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63715 ?auto_63712 ) ( SURFACE-AT ?auto_63710 ?auto_63712 ) ( CLEAR ?auto_63710 ) ( IS-CRATE ?auto_63711 ) ( not ( = ?auto_63710 ?auto_63711 ) ) ( AVAILABLE ?auto_63715 ) ( not ( = ?auto_63714 ?auto_63712 ) ) ( HOIST-AT ?auto_63717 ?auto_63714 ) ( not ( = ?auto_63715 ?auto_63717 ) ) ( AVAILABLE ?auto_63717 ) ( SURFACE-AT ?auto_63711 ?auto_63714 ) ( ON ?auto_63711 ?auto_63713 ) ( CLEAR ?auto_63711 ) ( not ( = ?auto_63710 ?auto_63713 ) ) ( not ( = ?auto_63711 ?auto_63713 ) ) ( TRUCK-AT ?auto_63716 ?auto_63712 ) )
    :subtasks
    ( ( !DRIVE ?auto_63716 ?auto_63712 ?auto_63714 )
      ( MAKE-1CRATE ?auto_63710 ?auto_63711 )
      ( MAKE-1CRATE-VERIFY ?auto_63710 ?auto_63711 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63727 - SURFACE
      ?auto_63728 - SURFACE
      ?auto_63729 - SURFACE
    )
    :vars
    (
      ?auto_63730 - HOIST
      ?auto_63731 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63730 ?auto_63731 ) ( SURFACE-AT ?auto_63728 ?auto_63731 ) ( CLEAR ?auto_63728 ) ( LIFTING ?auto_63730 ?auto_63729 ) ( IS-CRATE ?auto_63729 ) ( not ( = ?auto_63728 ?auto_63729 ) ) ( ON ?auto_63728 ?auto_63727 ) ( not ( = ?auto_63727 ?auto_63728 ) ) ( not ( = ?auto_63727 ?auto_63729 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63728 ?auto_63729 )
      ( MAKE-2CRATE-VERIFY ?auto_63727 ?auto_63728 ?auto_63729 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63737 - SURFACE
      ?auto_63738 - SURFACE
      ?auto_63739 - SURFACE
    )
    :vars
    (
      ?auto_63741 - HOIST
      ?auto_63742 - PLACE
      ?auto_63740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63741 ?auto_63742 ) ( SURFACE-AT ?auto_63738 ?auto_63742 ) ( CLEAR ?auto_63738 ) ( IS-CRATE ?auto_63739 ) ( not ( = ?auto_63738 ?auto_63739 ) ) ( TRUCK-AT ?auto_63740 ?auto_63742 ) ( AVAILABLE ?auto_63741 ) ( IN ?auto_63739 ?auto_63740 ) ( ON ?auto_63738 ?auto_63737 ) ( not ( = ?auto_63737 ?auto_63738 ) ) ( not ( = ?auto_63737 ?auto_63739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63738 ?auto_63739 )
      ( MAKE-2CRATE-VERIFY ?auto_63737 ?auto_63738 ?auto_63739 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63743 - SURFACE
      ?auto_63744 - SURFACE
    )
    :vars
    (
      ?auto_63746 - HOIST
      ?auto_63748 - PLACE
      ?auto_63747 - TRUCK
      ?auto_63745 - SURFACE
      ?auto_63749 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63746 ?auto_63748 ) ( SURFACE-AT ?auto_63743 ?auto_63748 ) ( CLEAR ?auto_63743 ) ( IS-CRATE ?auto_63744 ) ( not ( = ?auto_63743 ?auto_63744 ) ) ( AVAILABLE ?auto_63746 ) ( IN ?auto_63744 ?auto_63747 ) ( ON ?auto_63743 ?auto_63745 ) ( not ( = ?auto_63745 ?auto_63743 ) ) ( not ( = ?auto_63745 ?auto_63744 ) ) ( TRUCK-AT ?auto_63747 ?auto_63749 ) ( not ( = ?auto_63749 ?auto_63748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63747 ?auto_63749 ?auto_63748 )
      ( MAKE-2CRATE ?auto_63745 ?auto_63743 ?auto_63744 )
      ( MAKE-1CRATE-VERIFY ?auto_63743 ?auto_63744 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63750 - SURFACE
      ?auto_63751 - SURFACE
      ?auto_63752 - SURFACE
    )
    :vars
    (
      ?auto_63755 - HOIST
      ?auto_63756 - PLACE
      ?auto_63754 - TRUCK
      ?auto_63753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63755 ?auto_63756 ) ( SURFACE-AT ?auto_63751 ?auto_63756 ) ( CLEAR ?auto_63751 ) ( IS-CRATE ?auto_63752 ) ( not ( = ?auto_63751 ?auto_63752 ) ) ( AVAILABLE ?auto_63755 ) ( IN ?auto_63752 ?auto_63754 ) ( ON ?auto_63751 ?auto_63750 ) ( not ( = ?auto_63750 ?auto_63751 ) ) ( not ( = ?auto_63750 ?auto_63752 ) ) ( TRUCK-AT ?auto_63754 ?auto_63753 ) ( not ( = ?auto_63753 ?auto_63756 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63751 ?auto_63752 )
      ( MAKE-2CRATE-VERIFY ?auto_63750 ?auto_63751 ?auto_63752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63757 - SURFACE
      ?auto_63758 - SURFACE
    )
    :vars
    (
      ?auto_63760 - HOIST
      ?auto_63762 - PLACE
      ?auto_63761 - SURFACE
      ?auto_63759 - TRUCK
      ?auto_63763 - PLACE
      ?auto_63764 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63760 ?auto_63762 ) ( SURFACE-AT ?auto_63757 ?auto_63762 ) ( CLEAR ?auto_63757 ) ( IS-CRATE ?auto_63758 ) ( not ( = ?auto_63757 ?auto_63758 ) ) ( AVAILABLE ?auto_63760 ) ( ON ?auto_63757 ?auto_63761 ) ( not ( = ?auto_63761 ?auto_63757 ) ) ( not ( = ?auto_63761 ?auto_63758 ) ) ( TRUCK-AT ?auto_63759 ?auto_63763 ) ( not ( = ?auto_63763 ?auto_63762 ) ) ( HOIST-AT ?auto_63764 ?auto_63763 ) ( LIFTING ?auto_63764 ?auto_63758 ) ( not ( = ?auto_63760 ?auto_63764 ) ) )
    :subtasks
    ( ( !LOAD ?auto_63764 ?auto_63758 ?auto_63759 ?auto_63763 )
      ( MAKE-2CRATE ?auto_63761 ?auto_63757 ?auto_63758 )
      ( MAKE-1CRATE-VERIFY ?auto_63757 ?auto_63758 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63765 - SURFACE
      ?auto_63766 - SURFACE
      ?auto_63767 - SURFACE
    )
    :vars
    (
      ?auto_63771 - HOIST
      ?auto_63772 - PLACE
      ?auto_63769 - TRUCK
      ?auto_63770 - PLACE
      ?auto_63768 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63771 ?auto_63772 ) ( SURFACE-AT ?auto_63766 ?auto_63772 ) ( CLEAR ?auto_63766 ) ( IS-CRATE ?auto_63767 ) ( not ( = ?auto_63766 ?auto_63767 ) ) ( AVAILABLE ?auto_63771 ) ( ON ?auto_63766 ?auto_63765 ) ( not ( = ?auto_63765 ?auto_63766 ) ) ( not ( = ?auto_63765 ?auto_63767 ) ) ( TRUCK-AT ?auto_63769 ?auto_63770 ) ( not ( = ?auto_63770 ?auto_63772 ) ) ( HOIST-AT ?auto_63768 ?auto_63770 ) ( LIFTING ?auto_63768 ?auto_63767 ) ( not ( = ?auto_63771 ?auto_63768 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63766 ?auto_63767 )
      ( MAKE-2CRATE-VERIFY ?auto_63765 ?auto_63766 ?auto_63767 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63773 - SURFACE
      ?auto_63774 - SURFACE
    )
    :vars
    (
      ?auto_63777 - HOIST
      ?auto_63780 - PLACE
      ?auto_63778 - SURFACE
      ?auto_63776 - TRUCK
      ?auto_63775 - PLACE
      ?auto_63779 - HOIST
      ?auto_63781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63777 ?auto_63780 ) ( SURFACE-AT ?auto_63773 ?auto_63780 ) ( CLEAR ?auto_63773 ) ( IS-CRATE ?auto_63774 ) ( not ( = ?auto_63773 ?auto_63774 ) ) ( AVAILABLE ?auto_63777 ) ( ON ?auto_63773 ?auto_63778 ) ( not ( = ?auto_63778 ?auto_63773 ) ) ( not ( = ?auto_63778 ?auto_63774 ) ) ( TRUCK-AT ?auto_63776 ?auto_63775 ) ( not ( = ?auto_63775 ?auto_63780 ) ) ( HOIST-AT ?auto_63779 ?auto_63775 ) ( not ( = ?auto_63777 ?auto_63779 ) ) ( AVAILABLE ?auto_63779 ) ( SURFACE-AT ?auto_63774 ?auto_63775 ) ( ON ?auto_63774 ?auto_63781 ) ( CLEAR ?auto_63774 ) ( not ( = ?auto_63773 ?auto_63781 ) ) ( not ( = ?auto_63774 ?auto_63781 ) ) ( not ( = ?auto_63778 ?auto_63781 ) ) )
    :subtasks
    ( ( !LIFT ?auto_63779 ?auto_63774 ?auto_63781 ?auto_63775 )
      ( MAKE-2CRATE ?auto_63778 ?auto_63773 ?auto_63774 )
      ( MAKE-1CRATE-VERIFY ?auto_63773 ?auto_63774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63782 - SURFACE
      ?auto_63783 - SURFACE
      ?auto_63784 - SURFACE
    )
    :vars
    (
      ?auto_63787 - HOIST
      ?auto_63788 - PLACE
      ?auto_63789 - TRUCK
      ?auto_63786 - PLACE
      ?auto_63785 - HOIST
      ?auto_63790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63787 ?auto_63788 ) ( SURFACE-AT ?auto_63783 ?auto_63788 ) ( CLEAR ?auto_63783 ) ( IS-CRATE ?auto_63784 ) ( not ( = ?auto_63783 ?auto_63784 ) ) ( AVAILABLE ?auto_63787 ) ( ON ?auto_63783 ?auto_63782 ) ( not ( = ?auto_63782 ?auto_63783 ) ) ( not ( = ?auto_63782 ?auto_63784 ) ) ( TRUCK-AT ?auto_63789 ?auto_63786 ) ( not ( = ?auto_63786 ?auto_63788 ) ) ( HOIST-AT ?auto_63785 ?auto_63786 ) ( not ( = ?auto_63787 ?auto_63785 ) ) ( AVAILABLE ?auto_63785 ) ( SURFACE-AT ?auto_63784 ?auto_63786 ) ( ON ?auto_63784 ?auto_63790 ) ( CLEAR ?auto_63784 ) ( not ( = ?auto_63783 ?auto_63790 ) ) ( not ( = ?auto_63784 ?auto_63790 ) ) ( not ( = ?auto_63782 ?auto_63790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63783 ?auto_63784 )
      ( MAKE-2CRATE-VERIFY ?auto_63782 ?auto_63783 ?auto_63784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63791 - SURFACE
      ?auto_63792 - SURFACE
    )
    :vars
    (
      ?auto_63798 - HOIST
      ?auto_63795 - PLACE
      ?auto_63797 - SURFACE
      ?auto_63796 - PLACE
      ?auto_63794 - HOIST
      ?auto_63793 - SURFACE
      ?auto_63799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63798 ?auto_63795 ) ( SURFACE-AT ?auto_63791 ?auto_63795 ) ( CLEAR ?auto_63791 ) ( IS-CRATE ?auto_63792 ) ( not ( = ?auto_63791 ?auto_63792 ) ) ( AVAILABLE ?auto_63798 ) ( ON ?auto_63791 ?auto_63797 ) ( not ( = ?auto_63797 ?auto_63791 ) ) ( not ( = ?auto_63797 ?auto_63792 ) ) ( not ( = ?auto_63796 ?auto_63795 ) ) ( HOIST-AT ?auto_63794 ?auto_63796 ) ( not ( = ?auto_63798 ?auto_63794 ) ) ( AVAILABLE ?auto_63794 ) ( SURFACE-AT ?auto_63792 ?auto_63796 ) ( ON ?auto_63792 ?auto_63793 ) ( CLEAR ?auto_63792 ) ( not ( = ?auto_63791 ?auto_63793 ) ) ( not ( = ?auto_63792 ?auto_63793 ) ) ( not ( = ?auto_63797 ?auto_63793 ) ) ( TRUCK-AT ?auto_63799 ?auto_63795 ) )
    :subtasks
    ( ( !DRIVE ?auto_63799 ?auto_63795 ?auto_63796 )
      ( MAKE-2CRATE ?auto_63797 ?auto_63791 ?auto_63792 )
      ( MAKE-1CRATE-VERIFY ?auto_63791 ?auto_63792 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63800 - SURFACE
      ?auto_63801 - SURFACE
      ?auto_63802 - SURFACE
    )
    :vars
    (
      ?auto_63806 - HOIST
      ?auto_63805 - PLACE
      ?auto_63808 - PLACE
      ?auto_63804 - HOIST
      ?auto_63803 - SURFACE
      ?auto_63807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63806 ?auto_63805 ) ( SURFACE-AT ?auto_63801 ?auto_63805 ) ( CLEAR ?auto_63801 ) ( IS-CRATE ?auto_63802 ) ( not ( = ?auto_63801 ?auto_63802 ) ) ( AVAILABLE ?auto_63806 ) ( ON ?auto_63801 ?auto_63800 ) ( not ( = ?auto_63800 ?auto_63801 ) ) ( not ( = ?auto_63800 ?auto_63802 ) ) ( not ( = ?auto_63808 ?auto_63805 ) ) ( HOIST-AT ?auto_63804 ?auto_63808 ) ( not ( = ?auto_63806 ?auto_63804 ) ) ( AVAILABLE ?auto_63804 ) ( SURFACE-AT ?auto_63802 ?auto_63808 ) ( ON ?auto_63802 ?auto_63803 ) ( CLEAR ?auto_63802 ) ( not ( = ?auto_63801 ?auto_63803 ) ) ( not ( = ?auto_63802 ?auto_63803 ) ) ( not ( = ?auto_63800 ?auto_63803 ) ) ( TRUCK-AT ?auto_63807 ?auto_63805 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63801 ?auto_63802 )
      ( MAKE-2CRATE-VERIFY ?auto_63800 ?auto_63801 ?auto_63802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63809 - SURFACE
      ?auto_63810 - SURFACE
    )
    :vars
    (
      ?auto_63817 - HOIST
      ?auto_63811 - PLACE
      ?auto_63815 - SURFACE
      ?auto_63812 - PLACE
      ?auto_63813 - HOIST
      ?auto_63816 - SURFACE
      ?auto_63814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63817 ?auto_63811 ) ( IS-CRATE ?auto_63810 ) ( not ( = ?auto_63809 ?auto_63810 ) ) ( not ( = ?auto_63815 ?auto_63809 ) ) ( not ( = ?auto_63815 ?auto_63810 ) ) ( not ( = ?auto_63812 ?auto_63811 ) ) ( HOIST-AT ?auto_63813 ?auto_63812 ) ( not ( = ?auto_63817 ?auto_63813 ) ) ( AVAILABLE ?auto_63813 ) ( SURFACE-AT ?auto_63810 ?auto_63812 ) ( ON ?auto_63810 ?auto_63816 ) ( CLEAR ?auto_63810 ) ( not ( = ?auto_63809 ?auto_63816 ) ) ( not ( = ?auto_63810 ?auto_63816 ) ) ( not ( = ?auto_63815 ?auto_63816 ) ) ( TRUCK-AT ?auto_63814 ?auto_63811 ) ( SURFACE-AT ?auto_63815 ?auto_63811 ) ( CLEAR ?auto_63815 ) ( LIFTING ?auto_63817 ?auto_63809 ) ( IS-CRATE ?auto_63809 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63815 ?auto_63809 )
      ( MAKE-2CRATE ?auto_63815 ?auto_63809 ?auto_63810 )
      ( MAKE-1CRATE-VERIFY ?auto_63809 ?auto_63810 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63818 - SURFACE
      ?auto_63819 - SURFACE
      ?auto_63820 - SURFACE
    )
    :vars
    (
      ?auto_63826 - HOIST
      ?auto_63825 - PLACE
      ?auto_63821 - PLACE
      ?auto_63822 - HOIST
      ?auto_63824 - SURFACE
      ?auto_63823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63826 ?auto_63825 ) ( IS-CRATE ?auto_63820 ) ( not ( = ?auto_63819 ?auto_63820 ) ) ( not ( = ?auto_63818 ?auto_63819 ) ) ( not ( = ?auto_63818 ?auto_63820 ) ) ( not ( = ?auto_63821 ?auto_63825 ) ) ( HOIST-AT ?auto_63822 ?auto_63821 ) ( not ( = ?auto_63826 ?auto_63822 ) ) ( AVAILABLE ?auto_63822 ) ( SURFACE-AT ?auto_63820 ?auto_63821 ) ( ON ?auto_63820 ?auto_63824 ) ( CLEAR ?auto_63820 ) ( not ( = ?auto_63819 ?auto_63824 ) ) ( not ( = ?auto_63820 ?auto_63824 ) ) ( not ( = ?auto_63818 ?auto_63824 ) ) ( TRUCK-AT ?auto_63823 ?auto_63825 ) ( SURFACE-AT ?auto_63818 ?auto_63825 ) ( CLEAR ?auto_63818 ) ( LIFTING ?auto_63826 ?auto_63819 ) ( IS-CRATE ?auto_63819 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63819 ?auto_63820 )
      ( MAKE-2CRATE-VERIFY ?auto_63818 ?auto_63819 ?auto_63820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63827 - SURFACE
      ?auto_63828 - SURFACE
    )
    :vars
    (
      ?auto_63833 - HOIST
      ?auto_63835 - PLACE
      ?auto_63830 - SURFACE
      ?auto_63832 - PLACE
      ?auto_63831 - HOIST
      ?auto_63834 - SURFACE
      ?auto_63829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63833 ?auto_63835 ) ( IS-CRATE ?auto_63828 ) ( not ( = ?auto_63827 ?auto_63828 ) ) ( not ( = ?auto_63830 ?auto_63827 ) ) ( not ( = ?auto_63830 ?auto_63828 ) ) ( not ( = ?auto_63832 ?auto_63835 ) ) ( HOIST-AT ?auto_63831 ?auto_63832 ) ( not ( = ?auto_63833 ?auto_63831 ) ) ( AVAILABLE ?auto_63831 ) ( SURFACE-AT ?auto_63828 ?auto_63832 ) ( ON ?auto_63828 ?auto_63834 ) ( CLEAR ?auto_63828 ) ( not ( = ?auto_63827 ?auto_63834 ) ) ( not ( = ?auto_63828 ?auto_63834 ) ) ( not ( = ?auto_63830 ?auto_63834 ) ) ( TRUCK-AT ?auto_63829 ?auto_63835 ) ( SURFACE-AT ?auto_63830 ?auto_63835 ) ( CLEAR ?auto_63830 ) ( IS-CRATE ?auto_63827 ) ( AVAILABLE ?auto_63833 ) ( IN ?auto_63827 ?auto_63829 ) )
    :subtasks
    ( ( !UNLOAD ?auto_63833 ?auto_63827 ?auto_63829 ?auto_63835 )
      ( MAKE-2CRATE ?auto_63830 ?auto_63827 ?auto_63828 )
      ( MAKE-1CRATE-VERIFY ?auto_63827 ?auto_63828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_63836 - SURFACE
      ?auto_63837 - SURFACE
      ?auto_63838 - SURFACE
    )
    :vars
    (
      ?auto_63839 - HOIST
      ?auto_63840 - PLACE
      ?auto_63841 - PLACE
      ?auto_63844 - HOIST
      ?auto_63842 - SURFACE
      ?auto_63843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63839 ?auto_63840 ) ( IS-CRATE ?auto_63838 ) ( not ( = ?auto_63837 ?auto_63838 ) ) ( not ( = ?auto_63836 ?auto_63837 ) ) ( not ( = ?auto_63836 ?auto_63838 ) ) ( not ( = ?auto_63841 ?auto_63840 ) ) ( HOIST-AT ?auto_63844 ?auto_63841 ) ( not ( = ?auto_63839 ?auto_63844 ) ) ( AVAILABLE ?auto_63844 ) ( SURFACE-AT ?auto_63838 ?auto_63841 ) ( ON ?auto_63838 ?auto_63842 ) ( CLEAR ?auto_63838 ) ( not ( = ?auto_63837 ?auto_63842 ) ) ( not ( = ?auto_63838 ?auto_63842 ) ) ( not ( = ?auto_63836 ?auto_63842 ) ) ( TRUCK-AT ?auto_63843 ?auto_63840 ) ( SURFACE-AT ?auto_63836 ?auto_63840 ) ( CLEAR ?auto_63836 ) ( IS-CRATE ?auto_63837 ) ( AVAILABLE ?auto_63839 ) ( IN ?auto_63837 ?auto_63843 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63837 ?auto_63838 )
      ( MAKE-2CRATE-VERIFY ?auto_63836 ?auto_63837 ?auto_63838 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_63881 - SURFACE
      ?auto_63882 - SURFACE
    )
    :vars
    (
      ?auto_63888 - HOIST
      ?auto_63884 - PLACE
      ?auto_63887 - SURFACE
      ?auto_63889 - PLACE
      ?auto_63886 - HOIST
      ?auto_63885 - SURFACE
      ?auto_63883 - TRUCK
      ?auto_63890 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63888 ?auto_63884 ) ( SURFACE-AT ?auto_63881 ?auto_63884 ) ( CLEAR ?auto_63881 ) ( IS-CRATE ?auto_63882 ) ( not ( = ?auto_63881 ?auto_63882 ) ) ( AVAILABLE ?auto_63888 ) ( ON ?auto_63881 ?auto_63887 ) ( not ( = ?auto_63887 ?auto_63881 ) ) ( not ( = ?auto_63887 ?auto_63882 ) ) ( not ( = ?auto_63889 ?auto_63884 ) ) ( HOIST-AT ?auto_63886 ?auto_63889 ) ( not ( = ?auto_63888 ?auto_63886 ) ) ( AVAILABLE ?auto_63886 ) ( SURFACE-AT ?auto_63882 ?auto_63889 ) ( ON ?auto_63882 ?auto_63885 ) ( CLEAR ?auto_63882 ) ( not ( = ?auto_63881 ?auto_63885 ) ) ( not ( = ?auto_63882 ?auto_63885 ) ) ( not ( = ?auto_63887 ?auto_63885 ) ) ( TRUCK-AT ?auto_63883 ?auto_63890 ) ( not ( = ?auto_63890 ?auto_63884 ) ) ( not ( = ?auto_63889 ?auto_63890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_63883 ?auto_63890 ?auto_63884 )
      ( MAKE-1CRATE ?auto_63881 ?auto_63882 )
      ( MAKE-1CRATE-VERIFY ?auto_63881 ?auto_63882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63920 - SURFACE
      ?auto_63921 - SURFACE
      ?auto_63922 - SURFACE
      ?auto_63923 - SURFACE
    )
    :vars
    (
      ?auto_63925 - HOIST
      ?auto_63924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63925 ?auto_63924 ) ( SURFACE-AT ?auto_63922 ?auto_63924 ) ( CLEAR ?auto_63922 ) ( LIFTING ?auto_63925 ?auto_63923 ) ( IS-CRATE ?auto_63923 ) ( not ( = ?auto_63922 ?auto_63923 ) ) ( ON ?auto_63921 ?auto_63920 ) ( ON ?auto_63922 ?auto_63921 ) ( not ( = ?auto_63920 ?auto_63921 ) ) ( not ( = ?auto_63920 ?auto_63922 ) ) ( not ( = ?auto_63920 ?auto_63923 ) ) ( not ( = ?auto_63921 ?auto_63922 ) ) ( not ( = ?auto_63921 ?auto_63923 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_63922 ?auto_63923 )
      ( MAKE-3CRATE-VERIFY ?auto_63920 ?auto_63921 ?auto_63922 ?auto_63923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63937 - SURFACE
      ?auto_63938 - SURFACE
      ?auto_63939 - SURFACE
      ?auto_63940 - SURFACE
    )
    :vars
    (
      ?auto_63942 - HOIST
      ?auto_63941 - PLACE
      ?auto_63943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_63942 ?auto_63941 ) ( SURFACE-AT ?auto_63939 ?auto_63941 ) ( CLEAR ?auto_63939 ) ( IS-CRATE ?auto_63940 ) ( not ( = ?auto_63939 ?auto_63940 ) ) ( TRUCK-AT ?auto_63943 ?auto_63941 ) ( AVAILABLE ?auto_63942 ) ( IN ?auto_63940 ?auto_63943 ) ( ON ?auto_63939 ?auto_63938 ) ( not ( = ?auto_63938 ?auto_63939 ) ) ( not ( = ?auto_63938 ?auto_63940 ) ) ( ON ?auto_63938 ?auto_63937 ) ( not ( = ?auto_63937 ?auto_63938 ) ) ( not ( = ?auto_63937 ?auto_63939 ) ) ( not ( = ?auto_63937 ?auto_63940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63938 ?auto_63939 ?auto_63940 )
      ( MAKE-3CRATE-VERIFY ?auto_63937 ?auto_63938 ?auto_63939 ?auto_63940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63958 - SURFACE
      ?auto_63959 - SURFACE
      ?auto_63960 - SURFACE
      ?auto_63961 - SURFACE
    )
    :vars
    (
      ?auto_63965 - HOIST
      ?auto_63964 - PLACE
      ?auto_63963 - TRUCK
      ?auto_63962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_63965 ?auto_63964 ) ( SURFACE-AT ?auto_63960 ?auto_63964 ) ( CLEAR ?auto_63960 ) ( IS-CRATE ?auto_63961 ) ( not ( = ?auto_63960 ?auto_63961 ) ) ( AVAILABLE ?auto_63965 ) ( IN ?auto_63961 ?auto_63963 ) ( ON ?auto_63960 ?auto_63959 ) ( not ( = ?auto_63959 ?auto_63960 ) ) ( not ( = ?auto_63959 ?auto_63961 ) ) ( TRUCK-AT ?auto_63963 ?auto_63962 ) ( not ( = ?auto_63962 ?auto_63964 ) ) ( ON ?auto_63959 ?auto_63958 ) ( not ( = ?auto_63958 ?auto_63959 ) ) ( not ( = ?auto_63958 ?auto_63960 ) ) ( not ( = ?auto_63958 ?auto_63961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63959 ?auto_63960 ?auto_63961 )
      ( MAKE-3CRATE-VERIFY ?auto_63958 ?auto_63959 ?auto_63960 ?auto_63961 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_63982 - SURFACE
      ?auto_63983 - SURFACE
      ?auto_63984 - SURFACE
      ?auto_63985 - SURFACE
    )
    :vars
    (
      ?auto_63989 - HOIST
      ?auto_63986 - PLACE
      ?auto_63988 - TRUCK
      ?auto_63990 - PLACE
      ?auto_63987 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_63989 ?auto_63986 ) ( SURFACE-AT ?auto_63984 ?auto_63986 ) ( CLEAR ?auto_63984 ) ( IS-CRATE ?auto_63985 ) ( not ( = ?auto_63984 ?auto_63985 ) ) ( AVAILABLE ?auto_63989 ) ( ON ?auto_63984 ?auto_63983 ) ( not ( = ?auto_63983 ?auto_63984 ) ) ( not ( = ?auto_63983 ?auto_63985 ) ) ( TRUCK-AT ?auto_63988 ?auto_63990 ) ( not ( = ?auto_63990 ?auto_63986 ) ) ( HOIST-AT ?auto_63987 ?auto_63990 ) ( LIFTING ?auto_63987 ?auto_63985 ) ( not ( = ?auto_63989 ?auto_63987 ) ) ( ON ?auto_63983 ?auto_63982 ) ( not ( = ?auto_63982 ?auto_63983 ) ) ( not ( = ?auto_63982 ?auto_63984 ) ) ( not ( = ?auto_63982 ?auto_63985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_63983 ?auto_63984 ?auto_63985 )
      ( MAKE-3CRATE-VERIFY ?auto_63982 ?auto_63983 ?auto_63984 ?auto_63985 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64009 - SURFACE
      ?auto_64010 - SURFACE
      ?auto_64011 - SURFACE
      ?auto_64012 - SURFACE
    )
    :vars
    (
      ?auto_64014 - HOIST
      ?auto_64017 - PLACE
      ?auto_64015 - TRUCK
      ?auto_64013 - PLACE
      ?auto_64016 - HOIST
      ?auto_64018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64014 ?auto_64017 ) ( SURFACE-AT ?auto_64011 ?auto_64017 ) ( CLEAR ?auto_64011 ) ( IS-CRATE ?auto_64012 ) ( not ( = ?auto_64011 ?auto_64012 ) ) ( AVAILABLE ?auto_64014 ) ( ON ?auto_64011 ?auto_64010 ) ( not ( = ?auto_64010 ?auto_64011 ) ) ( not ( = ?auto_64010 ?auto_64012 ) ) ( TRUCK-AT ?auto_64015 ?auto_64013 ) ( not ( = ?auto_64013 ?auto_64017 ) ) ( HOIST-AT ?auto_64016 ?auto_64013 ) ( not ( = ?auto_64014 ?auto_64016 ) ) ( AVAILABLE ?auto_64016 ) ( SURFACE-AT ?auto_64012 ?auto_64013 ) ( ON ?auto_64012 ?auto_64018 ) ( CLEAR ?auto_64012 ) ( not ( = ?auto_64011 ?auto_64018 ) ) ( not ( = ?auto_64012 ?auto_64018 ) ) ( not ( = ?auto_64010 ?auto_64018 ) ) ( ON ?auto_64010 ?auto_64009 ) ( not ( = ?auto_64009 ?auto_64010 ) ) ( not ( = ?auto_64009 ?auto_64011 ) ) ( not ( = ?auto_64009 ?auto_64012 ) ) ( not ( = ?auto_64009 ?auto_64018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64010 ?auto_64011 ?auto_64012 )
      ( MAKE-3CRATE-VERIFY ?auto_64009 ?auto_64010 ?auto_64011 ?auto_64012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64037 - SURFACE
      ?auto_64038 - SURFACE
      ?auto_64039 - SURFACE
      ?auto_64040 - SURFACE
    )
    :vars
    (
      ?auto_64045 - HOIST
      ?auto_64044 - PLACE
      ?auto_64041 - PLACE
      ?auto_64043 - HOIST
      ?auto_64042 - SURFACE
      ?auto_64046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64045 ?auto_64044 ) ( SURFACE-AT ?auto_64039 ?auto_64044 ) ( CLEAR ?auto_64039 ) ( IS-CRATE ?auto_64040 ) ( not ( = ?auto_64039 ?auto_64040 ) ) ( AVAILABLE ?auto_64045 ) ( ON ?auto_64039 ?auto_64038 ) ( not ( = ?auto_64038 ?auto_64039 ) ) ( not ( = ?auto_64038 ?auto_64040 ) ) ( not ( = ?auto_64041 ?auto_64044 ) ) ( HOIST-AT ?auto_64043 ?auto_64041 ) ( not ( = ?auto_64045 ?auto_64043 ) ) ( AVAILABLE ?auto_64043 ) ( SURFACE-AT ?auto_64040 ?auto_64041 ) ( ON ?auto_64040 ?auto_64042 ) ( CLEAR ?auto_64040 ) ( not ( = ?auto_64039 ?auto_64042 ) ) ( not ( = ?auto_64040 ?auto_64042 ) ) ( not ( = ?auto_64038 ?auto_64042 ) ) ( TRUCK-AT ?auto_64046 ?auto_64044 ) ( ON ?auto_64038 ?auto_64037 ) ( not ( = ?auto_64037 ?auto_64038 ) ) ( not ( = ?auto_64037 ?auto_64039 ) ) ( not ( = ?auto_64037 ?auto_64040 ) ) ( not ( = ?auto_64037 ?auto_64042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64038 ?auto_64039 ?auto_64040 )
      ( MAKE-3CRATE-VERIFY ?auto_64037 ?auto_64038 ?auto_64039 ?auto_64040 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64065 - SURFACE
      ?auto_64066 - SURFACE
      ?auto_64067 - SURFACE
      ?auto_64068 - SURFACE
    )
    :vars
    (
      ?auto_64070 - HOIST
      ?auto_64072 - PLACE
      ?auto_64074 - PLACE
      ?auto_64069 - HOIST
      ?auto_64071 - SURFACE
      ?auto_64073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64070 ?auto_64072 ) ( IS-CRATE ?auto_64068 ) ( not ( = ?auto_64067 ?auto_64068 ) ) ( not ( = ?auto_64066 ?auto_64067 ) ) ( not ( = ?auto_64066 ?auto_64068 ) ) ( not ( = ?auto_64074 ?auto_64072 ) ) ( HOIST-AT ?auto_64069 ?auto_64074 ) ( not ( = ?auto_64070 ?auto_64069 ) ) ( AVAILABLE ?auto_64069 ) ( SURFACE-AT ?auto_64068 ?auto_64074 ) ( ON ?auto_64068 ?auto_64071 ) ( CLEAR ?auto_64068 ) ( not ( = ?auto_64067 ?auto_64071 ) ) ( not ( = ?auto_64068 ?auto_64071 ) ) ( not ( = ?auto_64066 ?auto_64071 ) ) ( TRUCK-AT ?auto_64073 ?auto_64072 ) ( SURFACE-AT ?auto_64066 ?auto_64072 ) ( CLEAR ?auto_64066 ) ( LIFTING ?auto_64070 ?auto_64067 ) ( IS-CRATE ?auto_64067 ) ( ON ?auto_64066 ?auto_64065 ) ( not ( = ?auto_64065 ?auto_64066 ) ) ( not ( = ?auto_64065 ?auto_64067 ) ) ( not ( = ?auto_64065 ?auto_64068 ) ) ( not ( = ?auto_64065 ?auto_64071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64066 ?auto_64067 ?auto_64068 )
      ( MAKE-3CRATE-VERIFY ?auto_64065 ?auto_64066 ?auto_64067 ?auto_64068 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_64093 - SURFACE
      ?auto_64094 - SURFACE
      ?auto_64095 - SURFACE
      ?auto_64096 - SURFACE
    )
    :vars
    (
      ?auto_64100 - HOIST
      ?auto_64101 - PLACE
      ?auto_64099 - PLACE
      ?auto_64102 - HOIST
      ?auto_64098 - SURFACE
      ?auto_64097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64100 ?auto_64101 ) ( IS-CRATE ?auto_64096 ) ( not ( = ?auto_64095 ?auto_64096 ) ) ( not ( = ?auto_64094 ?auto_64095 ) ) ( not ( = ?auto_64094 ?auto_64096 ) ) ( not ( = ?auto_64099 ?auto_64101 ) ) ( HOIST-AT ?auto_64102 ?auto_64099 ) ( not ( = ?auto_64100 ?auto_64102 ) ) ( AVAILABLE ?auto_64102 ) ( SURFACE-AT ?auto_64096 ?auto_64099 ) ( ON ?auto_64096 ?auto_64098 ) ( CLEAR ?auto_64096 ) ( not ( = ?auto_64095 ?auto_64098 ) ) ( not ( = ?auto_64096 ?auto_64098 ) ) ( not ( = ?auto_64094 ?auto_64098 ) ) ( TRUCK-AT ?auto_64097 ?auto_64101 ) ( SURFACE-AT ?auto_64094 ?auto_64101 ) ( CLEAR ?auto_64094 ) ( IS-CRATE ?auto_64095 ) ( AVAILABLE ?auto_64100 ) ( IN ?auto_64095 ?auto_64097 ) ( ON ?auto_64094 ?auto_64093 ) ( not ( = ?auto_64093 ?auto_64094 ) ) ( not ( = ?auto_64093 ?auto_64095 ) ) ( not ( = ?auto_64093 ?auto_64096 ) ) ( not ( = ?auto_64093 ?auto_64098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64094 ?auto_64095 ?auto_64096 )
      ( MAKE-3CRATE-VERIFY ?auto_64093 ?auto_64094 ?auto_64095 ?auto_64096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64384 - SURFACE
      ?auto_64385 - SURFACE
      ?auto_64386 - SURFACE
      ?auto_64388 - SURFACE
      ?auto_64387 - SURFACE
    )
    :vars
    (
      ?auto_64390 - HOIST
      ?auto_64389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64390 ?auto_64389 ) ( SURFACE-AT ?auto_64388 ?auto_64389 ) ( CLEAR ?auto_64388 ) ( LIFTING ?auto_64390 ?auto_64387 ) ( IS-CRATE ?auto_64387 ) ( not ( = ?auto_64388 ?auto_64387 ) ) ( ON ?auto_64385 ?auto_64384 ) ( ON ?auto_64386 ?auto_64385 ) ( ON ?auto_64388 ?auto_64386 ) ( not ( = ?auto_64384 ?auto_64385 ) ) ( not ( = ?auto_64384 ?auto_64386 ) ) ( not ( = ?auto_64384 ?auto_64388 ) ) ( not ( = ?auto_64384 ?auto_64387 ) ) ( not ( = ?auto_64385 ?auto_64386 ) ) ( not ( = ?auto_64385 ?auto_64388 ) ) ( not ( = ?auto_64385 ?auto_64387 ) ) ( not ( = ?auto_64386 ?auto_64388 ) ) ( not ( = ?auto_64386 ?auto_64387 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_64388 ?auto_64387 )
      ( MAKE-4CRATE-VERIFY ?auto_64384 ?auto_64385 ?auto_64386 ?auto_64388 ?auto_64387 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64409 - SURFACE
      ?auto_64410 - SURFACE
      ?auto_64411 - SURFACE
      ?auto_64413 - SURFACE
      ?auto_64412 - SURFACE
    )
    :vars
    (
      ?auto_64414 - HOIST
      ?auto_64416 - PLACE
      ?auto_64415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64414 ?auto_64416 ) ( SURFACE-AT ?auto_64413 ?auto_64416 ) ( CLEAR ?auto_64413 ) ( IS-CRATE ?auto_64412 ) ( not ( = ?auto_64413 ?auto_64412 ) ) ( TRUCK-AT ?auto_64415 ?auto_64416 ) ( AVAILABLE ?auto_64414 ) ( IN ?auto_64412 ?auto_64415 ) ( ON ?auto_64413 ?auto_64411 ) ( not ( = ?auto_64411 ?auto_64413 ) ) ( not ( = ?auto_64411 ?auto_64412 ) ) ( ON ?auto_64410 ?auto_64409 ) ( ON ?auto_64411 ?auto_64410 ) ( not ( = ?auto_64409 ?auto_64410 ) ) ( not ( = ?auto_64409 ?auto_64411 ) ) ( not ( = ?auto_64409 ?auto_64413 ) ) ( not ( = ?auto_64409 ?auto_64412 ) ) ( not ( = ?auto_64410 ?auto_64411 ) ) ( not ( = ?auto_64410 ?auto_64413 ) ) ( not ( = ?auto_64410 ?auto_64412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64411 ?auto_64413 ?auto_64412 )
      ( MAKE-4CRATE-VERIFY ?auto_64409 ?auto_64410 ?auto_64411 ?auto_64413 ?auto_64412 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64439 - SURFACE
      ?auto_64440 - SURFACE
      ?auto_64441 - SURFACE
      ?auto_64443 - SURFACE
      ?auto_64442 - SURFACE
    )
    :vars
    (
      ?auto_64447 - HOIST
      ?auto_64444 - PLACE
      ?auto_64445 - TRUCK
      ?auto_64446 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64447 ?auto_64444 ) ( SURFACE-AT ?auto_64443 ?auto_64444 ) ( CLEAR ?auto_64443 ) ( IS-CRATE ?auto_64442 ) ( not ( = ?auto_64443 ?auto_64442 ) ) ( AVAILABLE ?auto_64447 ) ( IN ?auto_64442 ?auto_64445 ) ( ON ?auto_64443 ?auto_64441 ) ( not ( = ?auto_64441 ?auto_64443 ) ) ( not ( = ?auto_64441 ?auto_64442 ) ) ( TRUCK-AT ?auto_64445 ?auto_64446 ) ( not ( = ?auto_64446 ?auto_64444 ) ) ( ON ?auto_64440 ?auto_64439 ) ( ON ?auto_64441 ?auto_64440 ) ( not ( = ?auto_64439 ?auto_64440 ) ) ( not ( = ?auto_64439 ?auto_64441 ) ) ( not ( = ?auto_64439 ?auto_64443 ) ) ( not ( = ?auto_64439 ?auto_64442 ) ) ( not ( = ?auto_64440 ?auto_64441 ) ) ( not ( = ?auto_64440 ?auto_64443 ) ) ( not ( = ?auto_64440 ?auto_64442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64441 ?auto_64443 ?auto_64442 )
      ( MAKE-4CRATE-VERIFY ?auto_64439 ?auto_64440 ?auto_64441 ?auto_64443 ?auto_64442 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64473 - SURFACE
      ?auto_64474 - SURFACE
      ?auto_64475 - SURFACE
      ?auto_64477 - SURFACE
      ?auto_64476 - SURFACE
    )
    :vars
    (
      ?auto_64482 - HOIST
      ?auto_64481 - PLACE
      ?auto_64478 - TRUCK
      ?auto_64479 - PLACE
      ?auto_64480 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_64482 ?auto_64481 ) ( SURFACE-AT ?auto_64477 ?auto_64481 ) ( CLEAR ?auto_64477 ) ( IS-CRATE ?auto_64476 ) ( not ( = ?auto_64477 ?auto_64476 ) ) ( AVAILABLE ?auto_64482 ) ( ON ?auto_64477 ?auto_64475 ) ( not ( = ?auto_64475 ?auto_64477 ) ) ( not ( = ?auto_64475 ?auto_64476 ) ) ( TRUCK-AT ?auto_64478 ?auto_64479 ) ( not ( = ?auto_64479 ?auto_64481 ) ) ( HOIST-AT ?auto_64480 ?auto_64479 ) ( LIFTING ?auto_64480 ?auto_64476 ) ( not ( = ?auto_64482 ?auto_64480 ) ) ( ON ?auto_64474 ?auto_64473 ) ( ON ?auto_64475 ?auto_64474 ) ( not ( = ?auto_64473 ?auto_64474 ) ) ( not ( = ?auto_64473 ?auto_64475 ) ) ( not ( = ?auto_64473 ?auto_64477 ) ) ( not ( = ?auto_64473 ?auto_64476 ) ) ( not ( = ?auto_64474 ?auto_64475 ) ) ( not ( = ?auto_64474 ?auto_64477 ) ) ( not ( = ?auto_64474 ?auto_64476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64475 ?auto_64477 ?auto_64476 )
      ( MAKE-4CRATE-VERIFY ?auto_64473 ?auto_64474 ?auto_64475 ?auto_64477 ?auto_64476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64511 - SURFACE
      ?auto_64512 - SURFACE
      ?auto_64513 - SURFACE
      ?auto_64515 - SURFACE
      ?auto_64514 - SURFACE
    )
    :vars
    (
      ?auto_64520 - HOIST
      ?auto_64518 - PLACE
      ?auto_64519 - TRUCK
      ?auto_64517 - PLACE
      ?auto_64521 - HOIST
      ?auto_64516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64520 ?auto_64518 ) ( SURFACE-AT ?auto_64515 ?auto_64518 ) ( CLEAR ?auto_64515 ) ( IS-CRATE ?auto_64514 ) ( not ( = ?auto_64515 ?auto_64514 ) ) ( AVAILABLE ?auto_64520 ) ( ON ?auto_64515 ?auto_64513 ) ( not ( = ?auto_64513 ?auto_64515 ) ) ( not ( = ?auto_64513 ?auto_64514 ) ) ( TRUCK-AT ?auto_64519 ?auto_64517 ) ( not ( = ?auto_64517 ?auto_64518 ) ) ( HOIST-AT ?auto_64521 ?auto_64517 ) ( not ( = ?auto_64520 ?auto_64521 ) ) ( AVAILABLE ?auto_64521 ) ( SURFACE-AT ?auto_64514 ?auto_64517 ) ( ON ?auto_64514 ?auto_64516 ) ( CLEAR ?auto_64514 ) ( not ( = ?auto_64515 ?auto_64516 ) ) ( not ( = ?auto_64514 ?auto_64516 ) ) ( not ( = ?auto_64513 ?auto_64516 ) ) ( ON ?auto_64512 ?auto_64511 ) ( ON ?auto_64513 ?auto_64512 ) ( not ( = ?auto_64511 ?auto_64512 ) ) ( not ( = ?auto_64511 ?auto_64513 ) ) ( not ( = ?auto_64511 ?auto_64515 ) ) ( not ( = ?auto_64511 ?auto_64514 ) ) ( not ( = ?auto_64511 ?auto_64516 ) ) ( not ( = ?auto_64512 ?auto_64513 ) ) ( not ( = ?auto_64512 ?auto_64515 ) ) ( not ( = ?auto_64512 ?auto_64514 ) ) ( not ( = ?auto_64512 ?auto_64516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64513 ?auto_64515 ?auto_64514 )
      ( MAKE-4CRATE-VERIFY ?auto_64511 ?auto_64512 ?auto_64513 ?auto_64515 ?auto_64514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64550 - SURFACE
      ?auto_64551 - SURFACE
      ?auto_64552 - SURFACE
      ?auto_64554 - SURFACE
      ?auto_64553 - SURFACE
    )
    :vars
    (
      ?auto_64556 - HOIST
      ?auto_64557 - PLACE
      ?auto_64559 - PLACE
      ?auto_64560 - HOIST
      ?auto_64558 - SURFACE
      ?auto_64555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64556 ?auto_64557 ) ( SURFACE-AT ?auto_64554 ?auto_64557 ) ( CLEAR ?auto_64554 ) ( IS-CRATE ?auto_64553 ) ( not ( = ?auto_64554 ?auto_64553 ) ) ( AVAILABLE ?auto_64556 ) ( ON ?auto_64554 ?auto_64552 ) ( not ( = ?auto_64552 ?auto_64554 ) ) ( not ( = ?auto_64552 ?auto_64553 ) ) ( not ( = ?auto_64559 ?auto_64557 ) ) ( HOIST-AT ?auto_64560 ?auto_64559 ) ( not ( = ?auto_64556 ?auto_64560 ) ) ( AVAILABLE ?auto_64560 ) ( SURFACE-AT ?auto_64553 ?auto_64559 ) ( ON ?auto_64553 ?auto_64558 ) ( CLEAR ?auto_64553 ) ( not ( = ?auto_64554 ?auto_64558 ) ) ( not ( = ?auto_64553 ?auto_64558 ) ) ( not ( = ?auto_64552 ?auto_64558 ) ) ( TRUCK-AT ?auto_64555 ?auto_64557 ) ( ON ?auto_64551 ?auto_64550 ) ( ON ?auto_64552 ?auto_64551 ) ( not ( = ?auto_64550 ?auto_64551 ) ) ( not ( = ?auto_64550 ?auto_64552 ) ) ( not ( = ?auto_64550 ?auto_64554 ) ) ( not ( = ?auto_64550 ?auto_64553 ) ) ( not ( = ?auto_64550 ?auto_64558 ) ) ( not ( = ?auto_64551 ?auto_64552 ) ) ( not ( = ?auto_64551 ?auto_64554 ) ) ( not ( = ?auto_64551 ?auto_64553 ) ) ( not ( = ?auto_64551 ?auto_64558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64552 ?auto_64554 ?auto_64553 )
      ( MAKE-4CRATE-VERIFY ?auto_64550 ?auto_64551 ?auto_64552 ?auto_64554 ?auto_64553 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64589 - SURFACE
      ?auto_64590 - SURFACE
      ?auto_64591 - SURFACE
      ?auto_64593 - SURFACE
      ?auto_64592 - SURFACE
    )
    :vars
    (
      ?auto_64597 - HOIST
      ?auto_64599 - PLACE
      ?auto_64598 - PLACE
      ?auto_64594 - HOIST
      ?auto_64595 - SURFACE
      ?auto_64596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64597 ?auto_64599 ) ( IS-CRATE ?auto_64592 ) ( not ( = ?auto_64593 ?auto_64592 ) ) ( not ( = ?auto_64591 ?auto_64593 ) ) ( not ( = ?auto_64591 ?auto_64592 ) ) ( not ( = ?auto_64598 ?auto_64599 ) ) ( HOIST-AT ?auto_64594 ?auto_64598 ) ( not ( = ?auto_64597 ?auto_64594 ) ) ( AVAILABLE ?auto_64594 ) ( SURFACE-AT ?auto_64592 ?auto_64598 ) ( ON ?auto_64592 ?auto_64595 ) ( CLEAR ?auto_64592 ) ( not ( = ?auto_64593 ?auto_64595 ) ) ( not ( = ?auto_64592 ?auto_64595 ) ) ( not ( = ?auto_64591 ?auto_64595 ) ) ( TRUCK-AT ?auto_64596 ?auto_64599 ) ( SURFACE-AT ?auto_64591 ?auto_64599 ) ( CLEAR ?auto_64591 ) ( LIFTING ?auto_64597 ?auto_64593 ) ( IS-CRATE ?auto_64593 ) ( ON ?auto_64590 ?auto_64589 ) ( ON ?auto_64591 ?auto_64590 ) ( not ( = ?auto_64589 ?auto_64590 ) ) ( not ( = ?auto_64589 ?auto_64591 ) ) ( not ( = ?auto_64589 ?auto_64593 ) ) ( not ( = ?auto_64589 ?auto_64592 ) ) ( not ( = ?auto_64589 ?auto_64595 ) ) ( not ( = ?auto_64590 ?auto_64591 ) ) ( not ( = ?auto_64590 ?auto_64593 ) ) ( not ( = ?auto_64590 ?auto_64592 ) ) ( not ( = ?auto_64590 ?auto_64595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64591 ?auto_64593 ?auto_64592 )
      ( MAKE-4CRATE-VERIFY ?auto_64589 ?auto_64590 ?auto_64591 ?auto_64593 ?auto_64592 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_64628 - SURFACE
      ?auto_64629 - SURFACE
      ?auto_64630 - SURFACE
      ?auto_64632 - SURFACE
      ?auto_64631 - SURFACE
    )
    :vars
    (
      ?auto_64633 - HOIST
      ?auto_64634 - PLACE
      ?auto_64636 - PLACE
      ?auto_64635 - HOIST
      ?auto_64638 - SURFACE
      ?auto_64637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_64633 ?auto_64634 ) ( IS-CRATE ?auto_64631 ) ( not ( = ?auto_64632 ?auto_64631 ) ) ( not ( = ?auto_64630 ?auto_64632 ) ) ( not ( = ?auto_64630 ?auto_64631 ) ) ( not ( = ?auto_64636 ?auto_64634 ) ) ( HOIST-AT ?auto_64635 ?auto_64636 ) ( not ( = ?auto_64633 ?auto_64635 ) ) ( AVAILABLE ?auto_64635 ) ( SURFACE-AT ?auto_64631 ?auto_64636 ) ( ON ?auto_64631 ?auto_64638 ) ( CLEAR ?auto_64631 ) ( not ( = ?auto_64632 ?auto_64638 ) ) ( not ( = ?auto_64631 ?auto_64638 ) ) ( not ( = ?auto_64630 ?auto_64638 ) ) ( TRUCK-AT ?auto_64637 ?auto_64634 ) ( SURFACE-AT ?auto_64630 ?auto_64634 ) ( CLEAR ?auto_64630 ) ( IS-CRATE ?auto_64632 ) ( AVAILABLE ?auto_64633 ) ( IN ?auto_64632 ?auto_64637 ) ( ON ?auto_64629 ?auto_64628 ) ( ON ?auto_64630 ?auto_64629 ) ( not ( = ?auto_64628 ?auto_64629 ) ) ( not ( = ?auto_64628 ?auto_64630 ) ) ( not ( = ?auto_64628 ?auto_64632 ) ) ( not ( = ?auto_64628 ?auto_64631 ) ) ( not ( = ?auto_64628 ?auto_64638 ) ) ( not ( = ?auto_64629 ?auto_64630 ) ) ( not ( = ?auto_64629 ?auto_64632 ) ) ( not ( = ?auto_64629 ?auto_64631 ) ) ( not ( = ?auto_64629 ?auto_64638 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_64630 ?auto_64632 ?auto_64631 )
      ( MAKE-4CRATE-VERIFY ?auto_64628 ?auto_64629 ?auto_64630 ?auto_64632 ?auto_64631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_64901 - SURFACE
      ?auto_64902 - SURFACE
    )
    :vars
    (
      ?auto_64906 - HOIST
      ?auto_64908 - PLACE
      ?auto_64909 - SURFACE
      ?auto_64907 - TRUCK
      ?auto_64905 - PLACE
      ?auto_64904 - HOIST
      ?auto_64903 - SURFACE
      ?auto_64910 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_64906 ?auto_64908 ) ( SURFACE-AT ?auto_64901 ?auto_64908 ) ( CLEAR ?auto_64901 ) ( IS-CRATE ?auto_64902 ) ( not ( = ?auto_64901 ?auto_64902 ) ) ( AVAILABLE ?auto_64906 ) ( ON ?auto_64901 ?auto_64909 ) ( not ( = ?auto_64909 ?auto_64901 ) ) ( not ( = ?auto_64909 ?auto_64902 ) ) ( TRUCK-AT ?auto_64907 ?auto_64905 ) ( not ( = ?auto_64905 ?auto_64908 ) ) ( HOIST-AT ?auto_64904 ?auto_64905 ) ( not ( = ?auto_64906 ?auto_64904 ) ) ( SURFACE-AT ?auto_64902 ?auto_64905 ) ( ON ?auto_64902 ?auto_64903 ) ( CLEAR ?auto_64902 ) ( not ( = ?auto_64901 ?auto_64903 ) ) ( not ( = ?auto_64902 ?auto_64903 ) ) ( not ( = ?auto_64909 ?auto_64903 ) ) ( LIFTING ?auto_64904 ?auto_64910 ) ( IS-CRATE ?auto_64910 ) ( not ( = ?auto_64901 ?auto_64910 ) ) ( not ( = ?auto_64902 ?auto_64910 ) ) ( not ( = ?auto_64909 ?auto_64910 ) ) ( not ( = ?auto_64903 ?auto_64910 ) ) )
    :subtasks
    ( ( !LOAD ?auto_64904 ?auto_64910 ?auto_64907 ?auto_64905 )
      ( MAKE-1CRATE ?auto_64901 ?auto_64902 )
      ( MAKE-1CRATE-VERIFY ?auto_64901 ?auto_64902 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65287 - SURFACE
      ?auto_65288 - SURFACE
      ?auto_65289 - SURFACE
      ?auto_65291 - SURFACE
      ?auto_65290 - SURFACE
      ?auto_65292 - SURFACE
    )
    :vars
    (
      ?auto_65294 - HOIST
      ?auto_65293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65294 ?auto_65293 ) ( SURFACE-AT ?auto_65290 ?auto_65293 ) ( CLEAR ?auto_65290 ) ( LIFTING ?auto_65294 ?auto_65292 ) ( IS-CRATE ?auto_65292 ) ( not ( = ?auto_65290 ?auto_65292 ) ) ( ON ?auto_65288 ?auto_65287 ) ( ON ?auto_65289 ?auto_65288 ) ( ON ?auto_65291 ?auto_65289 ) ( ON ?auto_65290 ?auto_65291 ) ( not ( = ?auto_65287 ?auto_65288 ) ) ( not ( = ?auto_65287 ?auto_65289 ) ) ( not ( = ?auto_65287 ?auto_65291 ) ) ( not ( = ?auto_65287 ?auto_65290 ) ) ( not ( = ?auto_65287 ?auto_65292 ) ) ( not ( = ?auto_65288 ?auto_65289 ) ) ( not ( = ?auto_65288 ?auto_65291 ) ) ( not ( = ?auto_65288 ?auto_65290 ) ) ( not ( = ?auto_65288 ?auto_65292 ) ) ( not ( = ?auto_65289 ?auto_65291 ) ) ( not ( = ?auto_65289 ?auto_65290 ) ) ( not ( = ?auto_65289 ?auto_65292 ) ) ( not ( = ?auto_65291 ?auto_65290 ) ) ( not ( = ?auto_65291 ?auto_65292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_65290 ?auto_65292 )
      ( MAKE-5CRATE-VERIFY ?auto_65287 ?auto_65288 ?auto_65289 ?auto_65291 ?auto_65290 ?auto_65292 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65321 - SURFACE
      ?auto_65322 - SURFACE
      ?auto_65323 - SURFACE
      ?auto_65325 - SURFACE
      ?auto_65324 - SURFACE
      ?auto_65326 - SURFACE
    )
    :vars
    (
      ?auto_65328 - HOIST
      ?auto_65329 - PLACE
      ?auto_65327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65328 ?auto_65329 ) ( SURFACE-AT ?auto_65324 ?auto_65329 ) ( CLEAR ?auto_65324 ) ( IS-CRATE ?auto_65326 ) ( not ( = ?auto_65324 ?auto_65326 ) ) ( TRUCK-AT ?auto_65327 ?auto_65329 ) ( AVAILABLE ?auto_65328 ) ( IN ?auto_65326 ?auto_65327 ) ( ON ?auto_65324 ?auto_65325 ) ( not ( = ?auto_65325 ?auto_65324 ) ) ( not ( = ?auto_65325 ?auto_65326 ) ) ( ON ?auto_65322 ?auto_65321 ) ( ON ?auto_65323 ?auto_65322 ) ( ON ?auto_65325 ?auto_65323 ) ( not ( = ?auto_65321 ?auto_65322 ) ) ( not ( = ?auto_65321 ?auto_65323 ) ) ( not ( = ?auto_65321 ?auto_65325 ) ) ( not ( = ?auto_65321 ?auto_65324 ) ) ( not ( = ?auto_65321 ?auto_65326 ) ) ( not ( = ?auto_65322 ?auto_65323 ) ) ( not ( = ?auto_65322 ?auto_65325 ) ) ( not ( = ?auto_65322 ?auto_65324 ) ) ( not ( = ?auto_65322 ?auto_65326 ) ) ( not ( = ?auto_65323 ?auto_65325 ) ) ( not ( = ?auto_65323 ?auto_65324 ) ) ( not ( = ?auto_65323 ?auto_65326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65325 ?auto_65324 ?auto_65326 )
      ( MAKE-5CRATE-VERIFY ?auto_65321 ?auto_65322 ?auto_65323 ?auto_65325 ?auto_65324 ?auto_65326 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65361 - SURFACE
      ?auto_65362 - SURFACE
      ?auto_65363 - SURFACE
      ?auto_65365 - SURFACE
      ?auto_65364 - SURFACE
      ?auto_65366 - SURFACE
    )
    :vars
    (
      ?auto_65368 - HOIST
      ?auto_65369 - PLACE
      ?auto_65367 - TRUCK
      ?auto_65370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65368 ?auto_65369 ) ( SURFACE-AT ?auto_65364 ?auto_65369 ) ( CLEAR ?auto_65364 ) ( IS-CRATE ?auto_65366 ) ( not ( = ?auto_65364 ?auto_65366 ) ) ( AVAILABLE ?auto_65368 ) ( IN ?auto_65366 ?auto_65367 ) ( ON ?auto_65364 ?auto_65365 ) ( not ( = ?auto_65365 ?auto_65364 ) ) ( not ( = ?auto_65365 ?auto_65366 ) ) ( TRUCK-AT ?auto_65367 ?auto_65370 ) ( not ( = ?auto_65370 ?auto_65369 ) ) ( ON ?auto_65362 ?auto_65361 ) ( ON ?auto_65363 ?auto_65362 ) ( ON ?auto_65365 ?auto_65363 ) ( not ( = ?auto_65361 ?auto_65362 ) ) ( not ( = ?auto_65361 ?auto_65363 ) ) ( not ( = ?auto_65361 ?auto_65365 ) ) ( not ( = ?auto_65361 ?auto_65364 ) ) ( not ( = ?auto_65361 ?auto_65366 ) ) ( not ( = ?auto_65362 ?auto_65363 ) ) ( not ( = ?auto_65362 ?auto_65365 ) ) ( not ( = ?auto_65362 ?auto_65364 ) ) ( not ( = ?auto_65362 ?auto_65366 ) ) ( not ( = ?auto_65363 ?auto_65365 ) ) ( not ( = ?auto_65363 ?auto_65364 ) ) ( not ( = ?auto_65363 ?auto_65366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65365 ?auto_65364 ?auto_65366 )
      ( MAKE-5CRATE-VERIFY ?auto_65361 ?auto_65362 ?auto_65363 ?auto_65365 ?auto_65364 ?auto_65366 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65406 - SURFACE
      ?auto_65407 - SURFACE
      ?auto_65408 - SURFACE
      ?auto_65410 - SURFACE
      ?auto_65409 - SURFACE
      ?auto_65411 - SURFACE
    )
    :vars
    (
      ?auto_65412 - HOIST
      ?auto_65414 - PLACE
      ?auto_65413 - TRUCK
      ?auto_65416 - PLACE
      ?auto_65415 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_65412 ?auto_65414 ) ( SURFACE-AT ?auto_65409 ?auto_65414 ) ( CLEAR ?auto_65409 ) ( IS-CRATE ?auto_65411 ) ( not ( = ?auto_65409 ?auto_65411 ) ) ( AVAILABLE ?auto_65412 ) ( ON ?auto_65409 ?auto_65410 ) ( not ( = ?auto_65410 ?auto_65409 ) ) ( not ( = ?auto_65410 ?auto_65411 ) ) ( TRUCK-AT ?auto_65413 ?auto_65416 ) ( not ( = ?auto_65416 ?auto_65414 ) ) ( HOIST-AT ?auto_65415 ?auto_65416 ) ( LIFTING ?auto_65415 ?auto_65411 ) ( not ( = ?auto_65412 ?auto_65415 ) ) ( ON ?auto_65407 ?auto_65406 ) ( ON ?auto_65408 ?auto_65407 ) ( ON ?auto_65410 ?auto_65408 ) ( not ( = ?auto_65406 ?auto_65407 ) ) ( not ( = ?auto_65406 ?auto_65408 ) ) ( not ( = ?auto_65406 ?auto_65410 ) ) ( not ( = ?auto_65406 ?auto_65409 ) ) ( not ( = ?auto_65406 ?auto_65411 ) ) ( not ( = ?auto_65407 ?auto_65408 ) ) ( not ( = ?auto_65407 ?auto_65410 ) ) ( not ( = ?auto_65407 ?auto_65409 ) ) ( not ( = ?auto_65407 ?auto_65411 ) ) ( not ( = ?auto_65408 ?auto_65410 ) ) ( not ( = ?auto_65408 ?auto_65409 ) ) ( not ( = ?auto_65408 ?auto_65411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65410 ?auto_65409 ?auto_65411 )
      ( MAKE-5CRATE-VERIFY ?auto_65406 ?auto_65407 ?auto_65408 ?auto_65410 ?auto_65409 ?auto_65411 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65456 - SURFACE
      ?auto_65457 - SURFACE
      ?auto_65458 - SURFACE
      ?auto_65460 - SURFACE
      ?auto_65459 - SURFACE
      ?auto_65461 - SURFACE
    )
    :vars
    (
      ?auto_65464 - HOIST
      ?auto_65462 - PLACE
      ?auto_65463 - TRUCK
      ?auto_65465 - PLACE
      ?auto_65467 - HOIST
      ?auto_65466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_65464 ?auto_65462 ) ( SURFACE-AT ?auto_65459 ?auto_65462 ) ( CLEAR ?auto_65459 ) ( IS-CRATE ?auto_65461 ) ( not ( = ?auto_65459 ?auto_65461 ) ) ( AVAILABLE ?auto_65464 ) ( ON ?auto_65459 ?auto_65460 ) ( not ( = ?auto_65460 ?auto_65459 ) ) ( not ( = ?auto_65460 ?auto_65461 ) ) ( TRUCK-AT ?auto_65463 ?auto_65465 ) ( not ( = ?auto_65465 ?auto_65462 ) ) ( HOIST-AT ?auto_65467 ?auto_65465 ) ( not ( = ?auto_65464 ?auto_65467 ) ) ( AVAILABLE ?auto_65467 ) ( SURFACE-AT ?auto_65461 ?auto_65465 ) ( ON ?auto_65461 ?auto_65466 ) ( CLEAR ?auto_65461 ) ( not ( = ?auto_65459 ?auto_65466 ) ) ( not ( = ?auto_65461 ?auto_65466 ) ) ( not ( = ?auto_65460 ?auto_65466 ) ) ( ON ?auto_65457 ?auto_65456 ) ( ON ?auto_65458 ?auto_65457 ) ( ON ?auto_65460 ?auto_65458 ) ( not ( = ?auto_65456 ?auto_65457 ) ) ( not ( = ?auto_65456 ?auto_65458 ) ) ( not ( = ?auto_65456 ?auto_65460 ) ) ( not ( = ?auto_65456 ?auto_65459 ) ) ( not ( = ?auto_65456 ?auto_65461 ) ) ( not ( = ?auto_65456 ?auto_65466 ) ) ( not ( = ?auto_65457 ?auto_65458 ) ) ( not ( = ?auto_65457 ?auto_65460 ) ) ( not ( = ?auto_65457 ?auto_65459 ) ) ( not ( = ?auto_65457 ?auto_65461 ) ) ( not ( = ?auto_65457 ?auto_65466 ) ) ( not ( = ?auto_65458 ?auto_65460 ) ) ( not ( = ?auto_65458 ?auto_65459 ) ) ( not ( = ?auto_65458 ?auto_65461 ) ) ( not ( = ?auto_65458 ?auto_65466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65460 ?auto_65459 ?auto_65461 )
      ( MAKE-5CRATE-VERIFY ?auto_65456 ?auto_65457 ?auto_65458 ?auto_65460 ?auto_65459 ?auto_65461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65507 - SURFACE
      ?auto_65508 - SURFACE
      ?auto_65509 - SURFACE
      ?auto_65511 - SURFACE
      ?auto_65510 - SURFACE
      ?auto_65512 - SURFACE
    )
    :vars
    (
      ?auto_65517 - HOIST
      ?auto_65516 - PLACE
      ?auto_65514 - PLACE
      ?auto_65513 - HOIST
      ?auto_65518 - SURFACE
      ?auto_65515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65517 ?auto_65516 ) ( SURFACE-AT ?auto_65510 ?auto_65516 ) ( CLEAR ?auto_65510 ) ( IS-CRATE ?auto_65512 ) ( not ( = ?auto_65510 ?auto_65512 ) ) ( AVAILABLE ?auto_65517 ) ( ON ?auto_65510 ?auto_65511 ) ( not ( = ?auto_65511 ?auto_65510 ) ) ( not ( = ?auto_65511 ?auto_65512 ) ) ( not ( = ?auto_65514 ?auto_65516 ) ) ( HOIST-AT ?auto_65513 ?auto_65514 ) ( not ( = ?auto_65517 ?auto_65513 ) ) ( AVAILABLE ?auto_65513 ) ( SURFACE-AT ?auto_65512 ?auto_65514 ) ( ON ?auto_65512 ?auto_65518 ) ( CLEAR ?auto_65512 ) ( not ( = ?auto_65510 ?auto_65518 ) ) ( not ( = ?auto_65512 ?auto_65518 ) ) ( not ( = ?auto_65511 ?auto_65518 ) ) ( TRUCK-AT ?auto_65515 ?auto_65516 ) ( ON ?auto_65508 ?auto_65507 ) ( ON ?auto_65509 ?auto_65508 ) ( ON ?auto_65511 ?auto_65509 ) ( not ( = ?auto_65507 ?auto_65508 ) ) ( not ( = ?auto_65507 ?auto_65509 ) ) ( not ( = ?auto_65507 ?auto_65511 ) ) ( not ( = ?auto_65507 ?auto_65510 ) ) ( not ( = ?auto_65507 ?auto_65512 ) ) ( not ( = ?auto_65507 ?auto_65518 ) ) ( not ( = ?auto_65508 ?auto_65509 ) ) ( not ( = ?auto_65508 ?auto_65511 ) ) ( not ( = ?auto_65508 ?auto_65510 ) ) ( not ( = ?auto_65508 ?auto_65512 ) ) ( not ( = ?auto_65508 ?auto_65518 ) ) ( not ( = ?auto_65509 ?auto_65511 ) ) ( not ( = ?auto_65509 ?auto_65510 ) ) ( not ( = ?auto_65509 ?auto_65512 ) ) ( not ( = ?auto_65509 ?auto_65518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65511 ?auto_65510 ?auto_65512 )
      ( MAKE-5CRATE-VERIFY ?auto_65507 ?auto_65508 ?auto_65509 ?auto_65511 ?auto_65510 ?auto_65512 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65558 - SURFACE
      ?auto_65559 - SURFACE
      ?auto_65560 - SURFACE
      ?auto_65562 - SURFACE
      ?auto_65561 - SURFACE
      ?auto_65563 - SURFACE
    )
    :vars
    (
      ?auto_65567 - HOIST
      ?auto_65565 - PLACE
      ?auto_65566 - PLACE
      ?auto_65564 - HOIST
      ?auto_65568 - SURFACE
      ?auto_65569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65567 ?auto_65565 ) ( IS-CRATE ?auto_65563 ) ( not ( = ?auto_65561 ?auto_65563 ) ) ( not ( = ?auto_65562 ?auto_65561 ) ) ( not ( = ?auto_65562 ?auto_65563 ) ) ( not ( = ?auto_65566 ?auto_65565 ) ) ( HOIST-AT ?auto_65564 ?auto_65566 ) ( not ( = ?auto_65567 ?auto_65564 ) ) ( AVAILABLE ?auto_65564 ) ( SURFACE-AT ?auto_65563 ?auto_65566 ) ( ON ?auto_65563 ?auto_65568 ) ( CLEAR ?auto_65563 ) ( not ( = ?auto_65561 ?auto_65568 ) ) ( not ( = ?auto_65563 ?auto_65568 ) ) ( not ( = ?auto_65562 ?auto_65568 ) ) ( TRUCK-AT ?auto_65569 ?auto_65565 ) ( SURFACE-AT ?auto_65562 ?auto_65565 ) ( CLEAR ?auto_65562 ) ( LIFTING ?auto_65567 ?auto_65561 ) ( IS-CRATE ?auto_65561 ) ( ON ?auto_65559 ?auto_65558 ) ( ON ?auto_65560 ?auto_65559 ) ( ON ?auto_65562 ?auto_65560 ) ( not ( = ?auto_65558 ?auto_65559 ) ) ( not ( = ?auto_65558 ?auto_65560 ) ) ( not ( = ?auto_65558 ?auto_65562 ) ) ( not ( = ?auto_65558 ?auto_65561 ) ) ( not ( = ?auto_65558 ?auto_65563 ) ) ( not ( = ?auto_65558 ?auto_65568 ) ) ( not ( = ?auto_65559 ?auto_65560 ) ) ( not ( = ?auto_65559 ?auto_65562 ) ) ( not ( = ?auto_65559 ?auto_65561 ) ) ( not ( = ?auto_65559 ?auto_65563 ) ) ( not ( = ?auto_65559 ?auto_65568 ) ) ( not ( = ?auto_65560 ?auto_65562 ) ) ( not ( = ?auto_65560 ?auto_65561 ) ) ( not ( = ?auto_65560 ?auto_65563 ) ) ( not ( = ?auto_65560 ?auto_65568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65562 ?auto_65561 ?auto_65563 )
      ( MAKE-5CRATE-VERIFY ?auto_65558 ?auto_65559 ?auto_65560 ?auto_65562 ?auto_65561 ?auto_65563 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_65609 - SURFACE
      ?auto_65610 - SURFACE
      ?auto_65611 - SURFACE
      ?auto_65613 - SURFACE
      ?auto_65612 - SURFACE
      ?auto_65614 - SURFACE
    )
    :vars
    (
      ?auto_65619 - HOIST
      ?auto_65618 - PLACE
      ?auto_65620 - PLACE
      ?auto_65615 - HOIST
      ?auto_65617 - SURFACE
      ?auto_65616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_65619 ?auto_65618 ) ( IS-CRATE ?auto_65614 ) ( not ( = ?auto_65612 ?auto_65614 ) ) ( not ( = ?auto_65613 ?auto_65612 ) ) ( not ( = ?auto_65613 ?auto_65614 ) ) ( not ( = ?auto_65620 ?auto_65618 ) ) ( HOIST-AT ?auto_65615 ?auto_65620 ) ( not ( = ?auto_65619 ?auto_65615 ) ) ( AVAILABLE ?auto_65615 ) ( SURFACE-AT ?auto_65614 ?auto_65620 ) ( ON ?auto_65614 ?auto_65617 ) ( CLEAR ?auto_65614 ) ( not ( = ?auto_65612 ?auto_65617 ) ) ( not ( = ?auto_65614 ?auto_65617 ) ) ( not ( = ?auto_65613 ?auto_65617 ) ) ( TRUCK-AT ?auto_65616 ?auto_65618 ) ( SURFACE-AT ?auto_65613 ?auto_65618 ) ( CLEAR ?auto_65613 ) ( IS-CRATE ?auto_65612 ) ( AVAILABLE ?auto_65619 ) ( IN ?auto_65612 ?auto_65616 ) ( ON ?auto_65610 ?auto_65609 ) ( ON ?auto_65611 ?auto_65610 ) ( ON ?auto_65613 ?auto_65611 ) ( not ( = ?auto_65609 ?auto_65610 ) ) ( not ( = ?auto_65609 ?auto_65611 ) ) ( not ( = ?auto_65609 ?auto_65613 ) ) ( not ( = ?auto_65609 ?auto_65612 ) ) ( not ( = ?auto_65609 ?auto_65614 ) ) ( not ( = ?auto_65609 ?auto_65617 ) ) ( not ( = ?auto_65610 ?auto_65611 ) ) ( not ( = ?auto_65610 ?auto_65613 ) ) ( not ( = ?auto_65610 ?auto_65612 ) ) ( not ( = ?auto_65610 ?auto_65614 ) ) ( not ( = ?auto_65610 ?auto_65617 ) ) ( not ( = ?auto_65611 ?auto_65613 ) ) ( not ( = ?auto_65611 ?auto_65612 ) ) ( not ( = ?auto_65611 ?auto_65614 ) ) ( not ( = ?auto_65611 ?auto_65617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_65613 ?auto_65612 ?auto_65614 )
      ( MAKE-5CRATE-VERIFY ?auto_65609 ?auto_65610 ?auto_65611 ?auto_65613 ?auto_65612 ?auto_65614 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_66289 - SURFACE
      ?auto_66290 - SURFACE
    )
    :vars
    (
      ?auto_66297 - HOIST
      ?auto_66291 - PLACE
      ?auto_66293 - SURFACE
      ?auto_66295 - PLACE
      ?auto_66296 - HOIST
      ?auto_66294 - SURFACE
      ?auto_66292 - TRUCK
      ?auto_66298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66297 ?auto_66291 ) ( SURFACE-AT ?auto_66289 ?auto_66291 ) ( CLEAR ?auto_66289 ) ( IS-CRATE ?auto_66290 ) ( not ( = ?auto_66289 ?auto_66290 ) ) ( ON ?auto_66289 ?auto_66293 ) ( not ( = ?auto_66293 ?auto_66289 ) ) ( not ( = ?auto_66293 ?auto_66290 ) ) ( not ( = ?auto_66295 ?auto_66291 ) ) ( HOIST-AT ?auto_66296 ?auto_66295 ) ( not ( = ?auto_66297 ?auto_66296 ) ) ( AVAILABLE ?auto_66296 ) ( SURFACE-AT ?auto_66290 ?auto_66295 ) ( ON ?auto_66290 ?auto_66294 ) ( CLEAR ?auto_66290 ) ( not ( = ?auto_66289 ?auto_66294 ) ) ( not ( = ?auto_66290 ?auto_66294 ) ) ( not ( = ?auto_66293 ?auto_66294 ) ) ( TRUCK-AT ?auto_66292 ?auto_66291 ) ( LIFTING ?auto_66297 ?auto_66298 ) ( IS-CRATE ?auto_66298 ) ( not ( = ?auto_66289 ?auto_66298 ) ) ( not ( = ?auto_66290 ?auto_66298 ) ) ( not ( = ?auto_66293 ?auto_66298 ) ) ( not ( = ?auto_66294 ?auto_66298 ) ) )
    :subtasks
    ( ( !LOAD ?auto_66297 ?auto_66298 ?auto_66292 ?auto_66291 )
      ( MAKE-1CRATE ?auto_66289 ?auto_66290 )
      ( MAKE-1CRATE-VERIFY ?auto_66289 ?auto_66290 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66805 - SURFACE
      ?auto_66806 - SURFACE
      ?auto_66807 - SURFACE
      ?auto_66809 - SURFACE
      ?auto_66808 - SURFACE
      ?auto_66810 - SURFACE
      ?auto_66811 - SURFACE
    )
    :vars
    (
      ?auto_66813 - HOIST
      ?auto_66812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66813 ?auto_66812 ) ( SURFACE-AT ?auto_66810 ?auto_66812 ) ( CLEAR ?auto_66810 ) ( LIFTING ?auto_66813 ?auto_66811 ) ( IS-CRATE ?auto_66811 ) ( not ( = ?auto_66810 ?auto_66811 ) ) ( ON ?auto_66806 ?auto_66805 ) ( ON ?auto_66807 ?auto_66806 ) ( ON ?auto_66809 ?auto_66807 ) ( ON ?auto_66808 ?auto_66809 ) ( ON ?auto_66810 ?auto_66808 ) ( not ( = ?auto_66805 ?auto_66806 ) ) ( not ( = ?auto_66805 ?auto_66807 ) ) ( not ( = ?auto_66805 ?auto_66809 ) ) ( not ( = ?auto_66805 ?auto_66808 ) ) ( not ( = ?auto_66805 ?auto_66810 ) ) ( not ( = ?auto_66805 ?auto_66811 ) ) ( not ( = ?auto_66806 ?auto_66807 ) ) ( not ( = ?auto_66806 ?auto_66809 ) ) ( not ( = ?auto_66806 ?auto_66808 ) ) ( not ( = ?auto_66806 ?auto_66810 ) ) ( not ( = ?auto_66806 ?auto_66811 ) ) ( not ( = ?auto_66807 ?auto_66809 ) ) ( not ( = ?auto_66807 ?auto_66808 ) ) ( not ( = ?auto_66807 ?auto_66810 ) ) ( not ( = ?auto_66807 ?auto_66811 ) ) ( not ( = ?auto_66809 ?auto_66808 ) ) ( not ( = ?auto_66809 ?auto_66810 ) ) ( not ( = ?auto_66809 ?auto_66811 ) ) ( not ( = ?auto_66808 ?auto_66810 ) ) ( not ( = ?auto_66808 ?auto_66811 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_66810 ?auto_66811 )
      ( MAKE-6CRATE-VERIFY ?auto_66805 ?auto_66806 ?auto_66807 ?auto_66809 ?auto_66808 ?auto_66810 ?auto_66811 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66849 - SURFACE
      ?auto_66850 - SURFACE
      ?auto_66851 - SURFACE
      ?auto_66853 - SURFACE
      ?auto_66852 - SURFACE
      ?auto_66854 - SURFACE
      ?auto_66855 - SURFACE
    )
    :vars
    (
      ?auto_66858 - HOIST
      ?auto_66857 - PLACE
      ?auto_66856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_66858 ?auto_66857 ) ( SURFACE-AT ?auto_66854 ?auto_66857 ) ( CLEAR ?auto_66854 ) ( IS-CRATE ?auto_66855 ) ( not ( = ?auto_66854 ?auto_66855 ) ) ( TRUCK-AT ?auto_66856 ?auto_66857 ) ( AVAILABLE ?auto_66858 ) ( IN ?auto_66855 ?auto_66856 ) ( ON ?auto_66854 ?auto_66852 ) ( not ( = ?auto_66852 ?auto_66854 ) ) ( not ( = ?auto_66852 ?auto_66855 ) ) ( ON ?auto_66850 ?auto_66849 ) ( ON ?auto_66851 ?auto_66850 ) ( ON ?auto_66853 ?auto_66851 ) ( ON ?auto_66852 ?auto_66853 ) ( not ( = ?auto_66849 ?auto_66850 ) ) ( not ( = ?auto_66849 ?auto_66851 ) ) ( not ( = ?auto_66849 ?auto_66853 ) ) ( not ( = ?auto_66849 ?auto_66852 ) ) ( not ( = ?auto_66849 ?auto_66854 ) ) ( not ( = ?auto_66849 ?auto_66855 ) ) ( not ( = ?auto_66850 ?auto_66851 ) ) ( not ( = ?auto_66850 ?auto_66853 ) ) ( not ( = ?auto_66850 ?auto_66852 ) ) ( not ( = ?auto_66850 ?auto_66854 ) ) ( not ( = ?auto_66850 ?auto_66855 ) ) ( not ( = ?auto_66851 ?auto_66853 ) ) ( not ( = ?auto_66851 ?auto_66852 ) ) ( not ( = ?auto_66851 ?auto_66854 ) ) ( not ( = ?auto_66851 ?auto_66855 ) ) ( not ( = ?auto_66853 ?auto_66852 ) ) ( not ( = ?auto_66853 ?auto_66854 ) ) ( not ( = ?auto_66853 ?auto_66855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66852 ?auto_66854 ?auto_66855 )
      ( MAKE-6CRATE-VERIFY ?auto_66849 ?auto_66850 ?auto_66851 ?auto_66853 ?auto_66852 ?auto_66854 ?auto_66855 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66900 - SURFACE
      ?auto_66901 - SURFACE
      ?auto_66902 - SURFACE
      ?auto_66904 - SURFACE
      ?auto_66903 - SURFACE
      ?auto_66905 - SURFACE
      ?auto_66906 - SURFACE
    )
    :vars
    (
      ?auto_66907 - HOIST
      ?auto_66908 - PLACE
      ?auto_66909 - TRUCK
      ?auto_66910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_66907 ?auto_66908 ) ( SURFACE-AT ?auto_66905 ?auto_66908 ) ( CLEAR ?auto_66905 ) ( IS-CRATE ?auto_66906 ) ( not ( = ?auto_66905 ?auto_66906 ) ) ( AVAILABLE ?auto_66907 ) ( IN ?auto_66906 ?auto_66909 ) ( ON ?auto_66905 ?auto_66903 ) ( not ( = ?auto_66903 ?auto_66905 ) ) ( not ( = ?auto_66903 ?auto_66906 ) ) ( TRUCK-AT ?auto_66909 ?auto_66910 ) ( not ( = ?auto_66910 ?auto_66908 ) ) ( ON ?auto_66901 ?auto_66900 ) ( ON ?auto_66902 ?auto_66901 ) ( ON ?auto_66904 ?auto_66902 ) ( ON ?auto_66903 ?auto_66904 ) ( not ( = ?auto_66900 ?auto_66901 ) ) ( not ( = ?auto_66900 ?auto_66902 ) ) ( not ( = ?auto_66900 ?auto_66904 ) ) ( not ( = ?auto_66900 ?auto_66903 ) ) ( not ( = ?auto_66900 ?auto_66905 ) ) ( not ( = ?auto_66900 ?auto_66906 ) ) ( not ( = ?auto_66901 ?auto_66902 ) ) ( not ( = ?auto_66901 ?auto_66904 ) ) ( not ( = ?auto_66901 ?auto_66903 ) ) ( not ( = ?auto_66901 ?auto_66905 ) ) ( not ( = ?auto_66901 ?auto_66906 ) ) ( not ( = ?auto_66902 ?auto_66904 ) ) ( not ( = ?auto_66902 ?auto_66903 ) ) ( not ( = ?auto_66902 ?auto_66905 ) ) ( not ( = ?auto_66902 ?auto_66906 ) ) ( not ( = ?auto_66904 ?auto_66903 ) ) ( not ( = ?auto_66904 ?auto_66905 ) ) ( not ( = ?auto_66904 ?auto_66906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66903 ?auto_66905 ?auto_66906 )
      ( MAKE-6CRATE-VERIFY ?auto_66900 ?auto_66901 ?auto_66902 ?auto_66904 ?auto_66903 ?auto_66905 ?auto_66906 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_66957 - SURFACE
      ?auto_66958 - SURFACE
      ?auto_66959 - SURFACE
      ?auto_66961 - SURFACE
      ?auto_66960 - SURFACE
      ?auto_66962 - SURFACE
      ?auto_66963 - SURFACE
    )
    :vars
    (
      ?auto_66966 - HOIST
      ?auto_66968 - PLACE
      ?auto_66967 - TRUCK
      ?auto_66964 - PLACE
      ?auto_66965 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_66966 ?auto_66968 ) ( SURFACE-AT ?auto_66962 ?auto_66968 ) ( CLEAR ?auto_66962 ) ( IS-CRATE ?auto_66963 ) ( not ( = ?auto_66962 ?auto_66963 ) ) ( AVAILABLE ?auto_66966 ) ( ON ?auto_66962 ?auto_66960 ) ( not ( = ?auto_66960 ?auto_66962 ) ) ( not ( = ?auto_66960 ?auto_66963 ) ) ( TRUCK-AT ?auto_66967 ?auto_66964 ) ( not ( = ?auto_66964 ?auto_66968 ) ) ( HOIST-AT ?auto_66965 ?auto_66964 ) ( LIFTING ?auto_66965 ?auto_66963 ) ( not ( = ?auto_66966 ?auto_66965 ) ) ( ON ?auto_66958 ?auto_66957 ) ( ON ?auto_66959 ?auto_66958 ) ( ON ?auto_66961 ?auto_66959 ) ( ON ?auto_66960 ?auto_66961 ) ( not ( = ?auto_66957 ?auto_66958 ) ) ( not ( = ?auto_66957 ?auto_66959 ) ) ( not ( = ?auto_66957 ?auto_66961 ) ) ( not ( = ?auto_66957 ?auto_66960 ) ) ( not ( = ?auto_66957 ?auto_66962 ) ) ( not ( = ?auto_66957 ?auto_66963 ) ) ( not ( = ?auto_66958 ?auto_66959 ) ) ( not ( = ?auto_66958 ?auto_66961 ) ) ( not ( = ?auto_66958 ?auto_66960 ) ) ( not ( = ?auto_66958 ?auto_66962 ) ) ( not ( = ?auto_66958 ?auto_66963 ) ) ( not ( = ?auto_66959 ?auto_66961 ) ) ( not ( = ?auto_66959 ?auto_66960 ) ) ( not ( = ?auto_66959 ?auto_66962 ) ) ( not ( = ?auto_66959 ?auto_66963 ) ) ( not ( = ?auto_66961 ?auto_66960 ) ) ( not ( = ?auto_66961 ?auto_66962 ) ) ( not ( = ?auto_66961 ?auto_66963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_66960 ?auto_66962 ?auto_66963 )
      ( MAKE-6CRATE-VERIFY ?auto_66957 ?auto_66958 ?auto_66959 ?auto_66961 ?auto_66960 ?auto_66962 ?auto_66963 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67020 - SURFACE
      ?auto_67021 - SURFACE
      ?auto_67022 - SURFACE
      ?auto_67024 - SURFACE
      ?auto_67023 - SURFACE
      ?auto_67025 - SURFACE
      ?auto_67026 - SURFACE
    )
    :vars
    (
      ?auto_67029 - HOIST
      ?auto_67028 - PLACE
      ?auto_67027 - TRUCK
      ?auto_67032 - PLACE
      ?auto_67031 - HOIST
      ?auto_67030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67029 ?auto_67028 ) ( SURFACE-AT ?auto_67025 ?auto_67028 ) ( CLEAR ?auto_67025 ) ( IS-CRATE ?auto_67026 ) ( not ( = ?auto_67025 ?auto_67026 ) ) ( AVAILABLE ?auto_67029 ) ( ON ?auto_67025 ?auto_67023 ) ( not ( = ?auto_67023 ?auto_67025 ) ) ( not ( = ?auto_67023 ?auto_67026 ) ) ( TRUCK-AT ?auto_67027 ?auto_67032 ) ( not ( = ?auto_67032 ?auto_67028 ) ) ( HOIST-AT ?auto_67031 ?auto_67032 ) ( not ( = ?auto_67029 ?auto_67031 ) ) ( AVAILABLE ?auto_67031 ) ( SURFACE-AT ?auto_67026 ?auto_67032 ) ( ON ?auto_67026 ?auto_67030 ) ( CLEAR ?auto_67026 ) ( not ( = ?auto_67025 ?auto_67030 ) ) ( not ( = ?auto_67026 ?auto_67030 ) ) ( not ( = ?auto_67023 ?auto_67030 ) ) ( ON ?auto_67021 ?auto_67020 ) ( ON ?auto_67022 ?auto_67021 ) ( ON ?auto_67024 ?auto_67022 ) ( ON ?auto_67023 ?auto_67024 ) ( not ( = ?auto_67020 ?auto_67021 ) ) ( not ( = ?auto_67020 ?auto_67022 ) ) ( not ( = ?auto_67020 ?auto_67024 ) ) ( not ( = ?auto_67020 ?auto_67023 ) ) ( not ( = ?auto_67020 ?auto_67025 ) ) ( not ( = ?auto_67020 ?auto_67026 ) ) ( not ( = ?auto_67020 ?auto_67030 ) ) ( not ( = ?auto_67021 ?auto_67022 ) ) ( not ( = ?auto_67021 ?auto_67024 ) ) ( not ( = ?auto_67021 ?auto_67023 ) ) ( not ( = ?auto_67021 ?auto_67025 ) ) ( not ( = ?auto_67021 ?auto_67026 ) ) ( not ( = ?auto_67021 ?auto_67030 ) ) ( not ( = ?auto_67022 ?auto_67024 ) ) ( not ( = ?auto_67022 ?auto_67023 ) ) ( not ( = ?auto_67022 ?auto_67025 ) ) ( not ( = ?auto_67022 ?auto_67026 ) ) ( not ( = ?auto_67022 ?auto_67030 ) ) ( not ( = ?auto_67024 ?auto_67023 ) ) ( not ( = ?auto_67024 ?auto_67025 ) ) ( not ( = ?auto_67024 ?auto_67026 ) ) ( not ( = ?auto_67024 ?auto_67030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67023 ?auto_67025 ?auto_67026 )
      ( MAKE-6CRATE-VERIFY ?auto_67020 ?auto_67021 ?auto_67022 ?auto_67024 ?auto_67023 ?auto_67025 ?auto_67026 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67084 - SURFACE
      ?auto_67085 - SURFACE
      ?auto_67086 - SURFACE
      ?auto_67088 - SURFACE
      ?auto_67087 - SURFACE
      ?auto_67089 - SURFACE
      ?auto_67090 - SURFACE
    )
    :vars
    (
      ?auto_67092 - HOIST
      ?auto_67096 - PLACE
      ?auto_67093 - PLACE
      ?auto_67091 - HOIST
      ?auto_67095 - SURFACE
      ?auto_67094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67092 ?auto_67096 ) ( SURFACE-AT ?auto_67089 ?auto_67096 ) ( CLEAR ?auto_67089 ) ( IS-CRATE ?auto_67090 ) ( not ( = ?auto_67089 ?auto_67090 ) ) ( AVAILABLE ?auto_67092 ) ( ON ?auto_67089 ?auto_67087 ) ( not ( = ?auto_67087 ?auto_67089 ) ) ( not ( = ?auto_67087 ?auto_67090 ) ) ( not ( = ?auto_67093 ?auto_67096 ) ) ( HOIST-AT ?auto_67091 ?auto_67093 ) ( not ( = ?auto_67092 ?auto_67091 ) ) ( AVAILABLE ?auto_67091 ) ( SURFACE-AT ?auto_67090 ?auto_67093 ) ( ON ?auto_67090 ?auto_67095 ) ( CLEAR ?auto_67090 ) ( not ( = ?auto_67089 ?auto_67095 ) ) ( not ( = ?auto_67090 ?auto_67095 ) ) ( not ( = ?auto_67087 ?auto_67095 ) ) ( TRUCK-AT ?auto_67094 ?auto_67096 ) ( ON ?auto_67085 ?auto_67084 ) ( ON ?auto_67086 ?auto_67085 ) ( ON ?auto_67088 ?auto_67086 ) ( ON ?auto_67087 ?auto_67088 ) ( not ( = ?auto_67084 ?auto_67085 ) ) ( not ( = ?auto_67084 ?auto_67086 ) ) ( not ( = ?auto_67084 ?auto_67088 ) ) ( not ( = ?auto_67084 ?auto_67087 ) ) ( not ( = ?auto_67084 ?auto_67089 ) ) ( not ( = ?auto_67084 ?auto_67090 ) ) ( not ( = ?auto_67084 ?auto_67095 ) ) ( not ( = ?auto_67085 ?auto_67086 ) ) ( not ( = ?auto_67085 ?auto_67088 ) ) ( not ( = ?auto_67085 ?auto_67087 ) ) ( not ( = ?auto_67085 ?auto_67089 ) ) ( not ( = ?auto_67085 ?auto_67090 ) ) ( not ( = ?auto_67085 ?auto_67095 ) ) ( not ( = ?auto_67086 ?auto_67088 ) ) ( not ( = ?auto_67086 ?auto_67087 ) ) ( not ( = ?auto_67086 ?auto_67089 ) ) ( not ( = ?auto_67086 ?auto_67090 ) ) ( not ( = ?auto_67086 ?auto_67095 ) ) ( not ( = ?auto_67088 ?auto_67087 ) ) ( not ( = ?auto_67088 ?auto_67089 ) ) ( not ( = ?auto_67088 ?auto_67090 ) ) ( not ( = ?auto_67088 ?auto_67095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67087 ?auto_67089 ?auto_67090 )
      ( MAKE-6CRATE-VERIFY ?auto_67084 ?auto_67085 ?auto_67086 ?auto_67088 ?auto_67087 ?auto_67089 ?auto_67090 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67148 - SURFACE
      ?auto_67149 - SURFACE
      ?auto_67150 - SURFACE
      ?auto_67152 - SURFACE
      ?auto_67151 - SURFACE
      ?auto_67153 - SURFACE
      ?auto_67154 - SURFACE
    )
    :vars
    (
      ?auto_67158 - HOIST
      ?auto_67155 - PLACE
      ?auto_67160 - PLACE
      ?auto_67157 - HOIST
      ?auto_67159 - SURFACE
      ?auto_67156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67158 ?auto_67155 ) ( IS-CRATE ?auto_67154 ) ( not ( = ?auto_67153 ?auto_67154 ) ) ( not ( = ?auto_67151 ?auto_67153 ) ) ( not ( = ?auto_67151 ?auto_67154 ) ) ( not ( = ?auto_67160 ?auto_67155 ) ) ( HOIST-AT ?auto_67157 ?auto_67160 ) ( not ( = ?auto_67158 ?auto_67157 ) ) ( AVAILABLE ?auto_67157 ) ( SURFACE-AT ?auto_67154 ?auto_67160 ) ( ON ?auto_67154 ?auto_67159 ) ( CLEAR ?auto_67154 ) ( not ( = ?auto_67153 ?auto_67159 ) ) ( not ( = ?auto_67154 ?auto_67159 ) ) ( not ( = ?auto_67151 ?auto_67159 ) ) ( TRUCK-AT ?auto_67156 ?auto_67155 ) ( SURFACE-AT ?auto_67151 ?auto_67155 ) ( CLEAR ?auto_67151 ) ( LIFTING ?auto_67158 ?auto_67153 ) ( IS-CRATE ?auto_67153 ) ( ON ?auto_67149 ?auto_67148 ) ( ON ?auto_67150 ?auto_67149 ) ( ON ?auto_67152 ?auto_67150 ) ( ON ?auto_67151 ?auto_67152 ) ( not ( = ?auto_67148 ?auto_67149 ) ) ( not ( = ?auto_67148 ?auto_67150 ) ) ( not ( = ?auto_67148 ?auto_67152 ) ) ( not ( = ?auto_67148 ?auto_67151 ) ) ( not ( = ?auto_67148 ?auto_67153 ) ) ( not ( = ?auto_67148 ?auto_67154 ) ) ( not ( = ?auto_67148 ?auto_67159 ) ) ( not ( = ?auto_67149 ?auto_67150 ) ) ( not ( = ?auto_67149 ?auto_67152 ) ) ( not ( = ?auto_67149 ?auto_67151 ) ) ( not ( = ?auto_67149 ?auto_67153 ) ) ( not ( = ?auto_67149 ?auto_67154 ) ) ( not ( = ?auto_67149 ?auto_67159 ) ) ( not ( = ?auto_67150 ?auto_67152 ) ) ( not ( = ?auto_67150 ?auto_67151 ) ) ( not ( = ?auto_67150 ?auto_67153 ) ) ( not ( = ?auto_67150 ?auto_67154 ) ) ( not ( = ?auto_67150 ?auto_67159 ) ) ( not ( = ?auto_67152 ?auto_67151 ) ) ( not ( = ?auto_67152 ?auto_67153 ) ) ( not ( = ?auto_67152 ?auto_67154 ) ) ( not ( = ?auto_67152 ?auto_67159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67151 ?auto_67153 ?auto_67154 )
      ( MAKE-6CRATE-VERIFY ?auto_67148 ?auto_67149 ?auto_67150 ?auto_67152 ?auto_67151 ?auto_67153 ?auto_67154 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67212 - SURFACE
      ?auto_67213 - SURFACE
      ?auto_67214 - SURFACE
      ?auto_67216 - SURFACE
      ?auto_67215 - SURFACE
      ?auto_67217 - SURFACE
      ?auto_67218 - SURFACE
    )
    :vars
    (
      ?auto_67222 - HOIST
      ?auto_67221 - PLACE
      ?auto_67220 - PLACE
      ?auto_67219 - HOIST
      ?auto_67223 - SURFACE
      ?auto_67224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67222 ?auto_67221 ) ( IS-CRATE ?auto_67218 ) ( not ( = ?auto_67217 ?auto_67218 ) ) ( not ( = ?auto_67215 ?auto_67217 ) ) ( not ( = ?auto_67215 ?auto_67218 ) ) ( not ( = ?auto_67220 ?auto_67221 ) ) ( HOIST-AT ?auto_67219 ?auto_67220 ) ( not ( = ?auto_67222 ?auto_67219 ) ) ( AVAILABLE ?auto_67219 ) ( SURFACE-AT ?auto_67218 ?auto_67220 ) ( ON ?auto_67218 ?auto_67223 ) ( CLEAR ?auto_67218 ) ( not ( = ?auto_67217 ?auto_67223 ) ) ( not ( = ?auto_67218 ?auto_67223 ) ) ( not ( = ?auto_67215 ?auto_67223 ) ) ( TRUCK-AT ?auto_67224 ?auto_67221 ) ( SURFACE-AT ?auto_67215 ?auto_67221 ) ( CLEAR ?auto_67215 ) ( IS-CRATE ?auto_67217 ) ( AVAILABLE ?auto_67222 ) ( IN ?auto_67217 ?auto_67224 ) ( ON ?auto_67213 ?auto_67212 ) ( ON ?auto_67214 ?auto_67213 ) ( ON ?auto_67216 ?auto_67214 ) ( ON ?auto_67215 ?auto_67216 ) ( not ( = ?auto_67212 ?auto_67213 ) ) ( not ( = ?auto_67212 ?auto_67214 ) ) ( not ( = ?auto_67212 ?auto_67216 ) ) ( not ( = ?auto_67212 ?auto_67215 ) ) ( not ( = ?auto_67212 ?auto_67217 ) ) ( not ( = ?auto_67212 ?auto_67218 ) ) ( not ( = ?auto_67212 ?auto_67223 ) ) ( not ( = ?auto_67213 ?auto_67214 ) ) ( not ( = ?auto_67213 ?auto_67216 ) ) ( not ( = ?auto_67213 ?auto_67215 ) ) ( not ( = ?auto_67213 ?auto_67217 ) ) ( not ( = ?auto_67213 ?auto_67218 ) ) ( not ( = ?auto_67213 ?auto_67223 ) ) ( not ( = ?auto_67214 ?auto_67216 ) ) ( not ( = ?auto_67214 ?auto_67215 ) ) ( not ( = ?auto_67214 ?auto_67217 ) ) ( not ( = ?auto_67214 ?auto_67218 ) ) ( not ( = ?auto_67214 ?auto_67223 ) ) ( not ( = ?auto_67216 ?auto_67215 ) ) ( not ( = ?auto_67216 ?auto_67217 ) ) ( not ( = ?auto_67216 ?auto_67218 ) ) ( not ( = ?auto_67216 ?auto_67223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67215 ?auto_67217 ?auto_67218 )
      ( MAKE-6CRATE-VERIFY ?auto_67212 ?auto_67213 ?auto_67214 ?auto_67216 ?auto_67215 ?auto_67217 ?auto_67218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_67225 - SURFACE
      ?auto_67226 - SURFACE
    )
    :vars
    (
      ?auto_67230 - HOIST
      ?auto_67229 - PLACE
      ?auto_67233 - SURFACE
      ?auto_67228 - PLACE
      ?auto_67227 - HOIST
      ?auto_67231 - SURFACE
      ?auto_67232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67230 ?auto_67229 ) ( IS-CRATE ?auto_67226 ) ( not ( = ?auto_67225 ?auto_67226 ) ) ( not ( = ?auto_67233 ?auto_67225 ) ) ( not ( = ?auto_67233 ?auto_67226 ) ) ( not ( = ?auto_67228 ?auto_67229 ) ) ( HOIST-AT ?auto_67227 ?auto_67228 ) ( not ( = ?auto_67230 ?auto_67227 ) ) ( AVAILABLE ?auto_67227 ) ( SURFACE-AT ?auto_67226 ?auto_67228 ) ( ON ?auto_67226 ?auto_67231 ) ( CLEAR ?auto_67226 ) ( not ( = ?auto_67225 ?auto_67231 ) ) ( not ( = ?auto_67226 ?auto_67231 ) ) ( not ( = ?auto_67233 ?auto_67231 ) ) ( SURFACE-AT ?auto_67233 ?auto_67229 ) ( CLEAR ?auto_67233 ) ( IS-CRATE ?auto_67225 ) ( AVAILABLE ?auto_67230 ) ( IN ?auto_67225 ?auto_67232 ) ( TRUCK-AT ?auto_67232 ?auto_67228 ) )
    :subtasks
    ( ( !DRIVE ?auto_67232 ?auto_67228 ?auto_67229 )
      ( MAKE-2CRATE ?auto_67233 ?auto_67225 ?auto_67226 )
      ( MAKE-1CRATE-VERIFY ?auto_67225 ?auto_67226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_67234 - SURFACE
      ?auto_67235 - SURFACE
      ?auto_67236 - SURFACE
    )
    :vars
    (
      ?auto_67240 - HOIST
      ?auto_67238 - PLACE
      ?auto_67237 - PLACE
      ?auto_67241 - HOIST
      ?auto_67239 - SURFACE
      ?auto_67242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67240 ?auto_67238 ) ( IS-CRATE ?auto_67236 ) ( not ( = ?auto_67235 ?auto_67236 ) ) ( not ( = ?auto_67234 ?auto_67235 ) ) ( not ( = ?auto_67234 ?auto_67236 ) ) ( not ( = ?auto_67237 ?auto_67238 ) ) ( HOIST-AT ?auto_67241 ?auto_67237 ) ( not ( = ?auto_67240 ?auto_67241 ) ) ( AVAILABLE ?auto_67241 ) ( SURFACE-AT ?auto_67236 ?auto_67237 ) ( ON ?auto_67236 ?auto_67239 ) ( CLEAR ?auto_67236 ) ( not ( = ?auto_67235 ?auto_67239 ) ) ( not ( = ?auto_67236 ?auto_67239 ) ) ( not ( = ?auto_67234 ?auto_67239 ) ) ( SURFACE-AT ?auto_67234 ?auto_67238 ) ( CLEAR ?auto_67234 ) ( IS-CRATE ?auto_67235 ) ( AVAILABLE ?auto_67240 ) ( IN ?auto_67235 ?auto_67242 ) ( TRUCK-AT ?auto_67242 ?auto_67237 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_67235 ?auto_67236 )
      ( MAKE-2CRATE-VERIFY ?auto_67234 ?auto_67235 ?auto_67236 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_67243 - SURFACE
      ?auto_67244 - SURFACE
      ?auto_67245 - SURFACE
      ?auto_67246 - SURFACE
    )
    :vars
    (
      ?auto_67250 - HOIST
      ?auto_67248 - PLACE
      ?auto_67251 - PLACE
      ?auto_67247 - HOIST
      ?auto_67252 - SURFACE
      ?auto_67249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67250 ?auto_67248 ) ( IS-CRATE ?auto_67246 ) ( not ( = ?auto_67245 ?auto_67246 ) ) ( not ( = ?auto_67244 ?auto_67245 ) ) ( not ( = ?auto_67244 ?auto_67246 ) ) ( not ( = ?auto_67251 ?auto_67248 ) ) ( HOIST-AT ?auto_67247 ?auto_67251 ) ( not ( = ?auto_67250 ?auto_67247 ) ) ( AVAILABLE ?auto_67247 ) ( SURFACE-AT ?auto_67246 ?auto_67251 ) ( ON ?auto_67246 ?auto_67252 ) ( CLEAR ?auto_67246 ) ( not ( = ?auto_67245 ?auto_67252 ) ) ( not ( = ?auto_67246 ?auto_67252 ) ) ( not ( = ?auto_67244 ?auto_67252 ) ) ( SURFACE-AT ?auto_67244 ?auto_67248 ) ( CLEAR ?auto_67244 ) ( IS-CRATE ?auto_67245 ) ( AVAILABLE ?auto_67250 ) ( IN ?auto_67245 ?auto_67249 ) ( TRUCK-AT ?auto_67249 ?auto_67251 ) ( ON ?auto_67244 ?auto_67243 ) ( not ( = ?auto_67243 ?auto_67244 ) ) ( not ( = ?auto_67243 ?auto_67245 ) ) ( not ( = ?auto_67243 ?auto_67246 ) ) ( not ( = ?auto_67243 ?auto_67252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67244 ?auto_67245 ?auto_67246 )
      ( MAKE-3CRATE-VERIFY ?auto_67243 ?auto_67244 ?auto_67245 ?auto_67246 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_67253 - SURFACE
      ?auto_67254 - SURFACE
      ?auto_67255 - SURFACE
      ?auto_67257 - SURFACE
      ?auto_67256 - SURFACE
    )
    :vars
    (
      ?auto_67261 - HOIST
      ?auto_67259 - PLACE
      ?auto_67262 - PLACE
      ?auto_67258 - HOIST
      ?auto_67263 - SURFACE
      ?auto_67260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67261 ?auto_67259 ) ( IS-CRATE ?auto_67256 ) ( not ( = ?auto_67257 ?auto_67256 ) ) ( not ( = ?auto_67255 ?auto_67257 ) ) ( not ( = ?auto_67255 ?auto_67256 ) ) ( not ( = ?auto_67262 ?auto_67259 ) ) ( HOIST-AT ?auto_67258 ?auto_67262 ) ( not ( = ?auto_67261 ?auto_67258 ) ) ( AVAILABLE ?auto_67258 ) ( SURFACE-AT ?auto_67256 ?auto_67262 ) ( ON ?auto_67256 ?auto_67263 ) ( CLEAR ?auto_67256 ) ( not ( = ?auto_67257 ?auto_67263 ) ) ( not ( = ?auto_67256 ?auto_67263 ) ) ( not ( = ?auto_67255 ?auto_67263 ) ) ( SURFACE-AT ?auto_67255 ?auto_67259 ) ( CLEAR ?auto_67255 ) ( IS-CRATE ?auto_67257 ) ( AVAILABLE ?auto_67261 ) ( IN ?auto_67257 ?auto_67260 ) ( TRUCK-AT ?auto_67260 ?auto_67262 ) ( ON ?auto_67254 ?auto_67253 ) ( ON ?auto_67255 ?auto_67254 ) ( not ( = ?auto_67253 ?auto_67254 ) ) ( not ( = ?auto_67253 ?auto_67255 ) ) ( not ( = ?auto_67253 ?auto_67257 ) ) ( not ( = ?auto_67253 ?auto_67256 ) ) ( not ( = ?auto_67253 ?auto_67263 ) ) ( not ( = ?auto_67254 ?auto_67255 ) ) ( not ( = ?auto_67254 ?auto_67257 ) ) ( not ( = ?auto_67254 ?auto_67256 ) ) ( not ( = ?auto_67254 ?auto_67263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67255 ?auto_67257 ?auto_67256 )
      ( MAKE-4CRATE-VERIFY ?auto_67253 ?auto_67254 ?auto_67255 ?auto_67257 ?auto_67256 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_67264 - SURFACE
      ?auto_67265 - SURFACE
      ?auto_67266 - SURFACE
      ?auto_67268 - SURFACE
      ?auto_67267 - SURFACE
      ?auto_67269 - SURFACE
    )
    :vars
    (
      ?auto_67273 - HOIST
      ?auto_67271 - PLACE
      ?auto_67274 - PLACE
      ?auto_67270 - HOIST
      ?auto_67275 - SURFACE
      ?auto_67272 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67273 ?auto_67271 ) ( IS-CRATE ?auto_67269 ) ( not ( = ?auto_67267 ?auto_67269 ) ) ( not ( = ?auto_67268 ?auto_67267 ) ) ( not ( = ?auto_67268 ?auto_67269 ) ) ( not ( = ?auto_67274 ?auto_67271 ) ) ( HOIST-AT ?auto_67270 ?auto_67274 ) ( not ( = ?auto_67273 ?auto_67270 ) ) ( AVAILABLE ?auto_67270 ) ( SURFACE-AT ?auto_67269 ?auto_67274 ) ( ON ?auto_67269 ?auto_67275 ) ( CLEAR ?auto_67269 ) ( not ( = ?auto_67267 ?auto_67275 ) ) ( not ( = ?auto_67269 ?auto_67275 ) ) ( not ( = ?auto_67268 ?auto_67275 ) ) ( SURFACE-AT ?auto_67268 ?auto_67271 ) ( CLEAR ?auto_67268 ) ( IS-CRATE ?auto_67267 ) ( AVAILABLE ?auto_67273 ) ( IN ?auto_67267 ?auto_67272 ) ( TRUCK-AT ?auto_67272 ?auto_67274 ) ( ON ?auto_67265 ?auto_67264 ) ( ON ?auto_67266 ?auto_67265 ) ( ON ?auto_67268 ?auto_67266 ) ( not ( = ?auto_67264 ?auto_67265 ) ) ( not ( = ?auto_67264 ?auto_67266 ) ) ( not ( = ?auto_67264 ?auto_67268 ) ) ( not ( = ?auto_67264 ?auto_67267 ) ) ( not ( = ?auto_67264 ?auto_67269 ) ) ( not ( = ?auto_67264 ?auto_67275 ) ) ( not ( = ?auto_67265 ?auto_67266 ) ) ( not ( = ?auto_67265 ?auto_67268 ) ) ( not ( = ?auto_67265 ?auto_67267 ) ) ( not ( = ?auto_67265 ?auto_67269 ) ) ( not ( = ?auto_67265 ?auto_67275 ) ) ( not ( = ?auto_67266 ?auto_67268 ) ) ( not ( = ?auto_67266 ?auto_67267 ) ) ( not ( = ?auto_67266 ?auto_67269 ) ) ( not ( = ?auto_67266 ?auto_67275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67268 ?auto_67267 ?auto_67269 )
      ( MAKE-5CRATE-VERIFY ?auto_67264 ?auto_67265 ?auto_67266 ?auto_67268 ?auto_67267 ?auto_67269 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67276 - SURFACE
      ?auto_67277 - SURFACE
      ?auto_67278 - SURFACE
      ?auto_67280 - SURFACE
      ?auto_67279 - SURFACE
      ?auto_67281 - SURFACE
      ?auto_67282 - SURFACE
    )
    :vars
    (
      ?auto_67286 - HOIST
      ?auto_67284 - PLACE
      ?auto_67287 - PLACE
      ?auto_67283 - HOIST
      ?auto_67288 - SURFACE
      ?auto_67285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67286 ?auto_67284 ) ( IS-CRATE ?auto_67282 ) ( not ( = ?auto_67281 ?auto_67282 ) ) ( not ( = ?auto_67279 ?auto_67281 ) ) ( not ( = ?auto_67279 ?auto_67282 ) ) ( not ( = ?auto_67287 ?auto_67284 ) ) ( HOIST-AT ?auto_67283 ?auto_67287 ) ( not ( = ?auto_67286 ?auto_67283 ) ) ( AVAILABLE ?auto_67283 ) ( SURFACE-AT ?auto_67282 ?auto_67287 ) ( ON ?auto_67282 ?auto_67288 ) ( CLEAR ?auto_67282 ) ( not ( = ?auto_67281 ?auto_67288 ) ) ( not ( = ?auto_67282 ?auto_67288 ) ) ( not ( = ?auto_67279 ?auto_67288 ) ) ( SURFACE-AT ?auto_67279 ?auto_67284 ) ( CLEAR ?auto_67279 ) ( IS-CRATE ?auto_67281 ) ( AVAILABLE ?auto_67286 ) ( IN ?auto_67281 ?auto_67285 ) ( TRUCK-AT ?auto_67285 ?auto_67287 ) ( ON ?auto_67277 ?auto_67276 ) ( ON ?auto_67278 ?auto_67277 ) ( ON ?auto_67280 ?auto_67278 ) ( ON ?auto_67279 ?auto_67280 ) ( not ( = ?auto_67276 ?auto_67277 ) ) ( not ( = ?auto_67276 ?auto_67278 ) ) ( not ( = ?auto_67276 ?auto_67280 ) ) ( not ( = ?auto_67276 ?auto_67279 ) ) ( not ( = ?auto_67276 ?auto_67281 ) ) ( not ( = ?auto_67276 ?auto_67282 ) ) ( not ( = ?auto_67276 ?auto_67288 ) ) ( not ( = ?auto_67277 ?auto_67278 ) ) ( not ( = ?auto_67277 ?auto_67280 ) ) ( not ( = ?auto_67277 ?auto_67279 ) ) ( not ( = ?auto_67277 ?auto_67281 ) ) ( not ( = ?auto_67277 ?auto_67282 ) ) ( not ( = ?auto_67277 ?auto_67288 ) ) ( not ( = ?auto_67278 ?auto_67280 ) ) ( not ( = ?auto_67278 ?auto_67279 ) ) ( not ( = ?auto_67278 ?auto_67281 ) ) ( not ( = ?auto_67278 ?auto_67282 ) ) ( not ( = ?auto_67278 ?auto_67288 ) ) ( not ( = ?auto_67280 ?auto_67279 ) ) ( not ( = ?auto_67280 ?auto_67281 ) ) ( not ( = ?auto_67280 ?auto_67282 ) ) ( not ( = ?auto_67280 ?auto_67288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67279 ?auto_67281 ?auto_67282 )
      ( MAKE-6CRATE-VERIFY ?auto_67276 ?auto_67277 ?auto_67278 ?auto_67280 ?auto_67279 ?auto_67281 ?auto_67282 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_67289 - SURFACE
      ?auto_67290 - SURFACE
    )
    :vars
    (
      ?auto_67295 - HOIST
      ?auto_67292 - PLACE
      ?auto_67293 - SURFACE
      ?auto_67296 - PLACE
      ?auto_67291 - HOIST
      ?auto_67297 - SURFACE
      ?auto_67294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67295 ?auto_67292 ) ( IS-CRATE ?auto_67290 ) ( not ( = ?auto_67289 ?auto_67290 ) ) ( not ( = ?auto_67293 ?auto_67289 ) ) ( not ( = ?auto_67293 ?auto_67290 ) ) ( not ( = ?auto_67296 ?auto_67292 ) ) ( HOIST-AT ?auto_67291 ?auto_67296 ) ( not ( = ?auto_67295 ?auto_67291 ) ) ( SURFACE-AT ?auto_67290 ?auto_67296 ) ( ON ?auto_67290 ?auto_67297 ) ( CLEAR ?auto_67290 ) ( not ( = ?auto_67289 ?auto_67297 ) ) ( not ( = ?auto_67290 ?auto_67297 ) ) ( not ( = ?auto_67293 ?auto_67297 ) ) ( SURFACE-AT ?auto_67293 ?auto_67292 ) ( CLEAR ?auto_67293 ) ( IS-CRATE ?auto_67289 ) ( AVAILABLE ?auto_67295 ) ( TRUCK-AT ?auto_67294 ?auto_67296 ) ( LIFTING ?auto_67291 ?auto_67289 ) )
    :subtasks
    ( ( !LOAD ?auto_67291 ?auto_67289 ?auto_67294 ?auto_67296 )
      ( MAKE-2CRATE ?auto_67293 ?auto_67289 ?auto_67290 )
      ( MAKE-1CRATE-VERIFY ?auto_67289 ?auto_67290 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_67298 - SURFACE
      ?auto_67299 - SURFACE
      ?auto_67300 - SURFACE
    )
    :vars
    (
      ?auto_67301 - HOIST
      ?auto_67305 - PLACE
      ?auto_67304 - PLACE
      ?auto_67306 - HOIST
      ?auto_67302 - SURFACE
      ?auto_67303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67301 ?auto_67305 ) ( IS-CRATE ?auto_67300 ) ( not ( = ?auto_67299 ?auto_67300 ) ) ( not ( = ?auto_67298 ?auto_67299 ) ) ( not ( = ?auto_67298 ?auto_67300 ) ) ( not ( = ?auto_67304 ?auto_67305 ) ) ( HOIST-AT ?auto_67306 ?auto_67304 ) ( not ( = ?auto_67301 ?auto_67306 ) ) ( SURFACE-AT ?auto_67300 ?auto_67304 ) ( ON ?auto_67300 ?auto_67302 ) ( CLEAR ?auto_67300 ) ( not ( = ?auto_67299 ?auto_67302 ) ) ( not ( = ?auto_67300 ?auto_67302 ) ) ( not ( = ?auto_67298 ?auto_67302 ) ) ( SURFACE-AT ?auto_67298 ?auto_67305 ) ( CLEAR ?auto_67298 ) ( IS-CRATE ?auto_67299 ) ( AVAILABLE ?auto_67301 ) ( TRUCK-AT ?auto_67303 ?auto_67304 ) ( LIFTING ?auto_67306 ?auto_67299 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_67299 ?auto_67300 )
      ( MAKE-2CRATE-VERIFY ?auto_67298 ?auto_67299 ?auto_67300 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_67307 - SURFACE
      ?auto_67308 - SURFACE
      ?auto_67309 - SURFACE
      ?auto_67310 - SURFACE
    )
    :vars
    (
      ?auto_67312 - HOIST
      ?auto_67315 - PLACE
      ?auto_67313 - PLACE
      ?auto_67311 - HOIST
      ?auto_67316 - SURFACE
      ?auto_67314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67312 ?auto_67315 ) ( IS-CRATE ?auto_67310 ) ( not ( = ?auto_67309 ?auto_67310 ) ) ( not ( = ?auto_67308 ?auto_67309 ) ) ( not ( = ?auto_67308 ?auto_67310 ) ) ( not ( = ?auto_67313 ?auto_67315 ) ) ( HOIST-AT ?auto_67311 ?auto_67313 ) ( not ( = ?auto_67312 ?auto_67311 ) ) ( SURFACE-AT ?auto_67310 ?auto_67313 ) ( ON ?auto_67310 ?auto_67316 ) ( CLEAR ?auto_67310 ) ( not ( = ?auto_67309 ?auto_67316 ) ) ( not ( = ?auto_67310 ?auto_67316 ) ) ( not ( = ?auto_67308 ?auto_67316 ) ) ( SURFACE-AT ?auto_67308 ?auto_67315 ) ( CLEAR ?auto_67308 ) ( IS-CRATE ?auto_67309 ) ( AVAILABLE ?auto_67312 ) ( TRUCK-AT ?auto_67314 ?auto_67313 ) ( LIFTING ?auto_67311 ?auto_67309 ) ( ON ?auto_67308 ?auto_67307 ) ( not ( = ?auto_67307 ?auto_67308 ) ) ( not ( = ?auto_67307 ?auto_67309 ) ) ( not ( = ?auto_67307 ?auto_67310 ) ) ( not ( = ?auto_67307 ?auto_67316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67308 ?auto_67309 ?auto_67310 )
      ( MAKE-3CRATE-VERIFY ?auto_67307 ?auto_67308 ?auto_67309 ?auto_67310 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_67317 - SURFACE
      ?auto_67318 - SURFACE
      ?auto_67319 - SURFACE
      ?auto_67321 - SURFACE
      ?auto_67320 - SURFACE
    )
    :vars
    (
      ?auto_67323 - HOIST
      ?auto_67326 - PLACE
      ?auto_67324 - PLACE
      ?auto_67322 - HOIST
      ?auto_67327 - SURFACE
      ?auto_67325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67323 ?auto_67326 ) ( IS-CRATE ?auto_67320 ) ( not ( = ?auto_67321 ?auto_67320 ) ) ( not ( = ?auto_67319 ?auto_67321 ) ) ( not ( = ?auto_67319 ?auto_67320 ) ) ( not ( = ?auto_67324 ?auto_67326 ) ) ( HOIST-AT ?auto_67322 ?auto_67324 ) ( not ( = ?auto_67323 ?auto_67322 ) ) ( SURFACE-AT ?auto_67320 ?auto_67324 ) ( ON ?auto_67320 ?auto_67327 ) ( CLEAR ?auto_67320 ) ( not ( = ?auto_67321 ?auto_67327 ) ) ( not ( = ?auto_67320 ?auto_67327 ) ) ( not ( = ?auto_67319 ?auto_67327 ) ) ( SURFACE-AT ?auto_67319 ?auto_67326 ) ( CLEAR ?auto_67319 ) ( IS-CRATE ?auto_67321 ) ( AVAILABLE ?auto_67323 ) ( TRUCK-AT ?auto_67325 ?auto_67324 ) ( LIFTING ?auto_67322 ?auto_67321 ) ( ON ?auto_67318 ?auto_67317 ) ( ON ?auto_67319 ?auto_67318 ) ( not ( = ?auto_67317 ?auto_67318 ) ) ( not ( = ?auto_67317 ?auto_67319 ) ) ( not ( = ?auto_67317 ?auto_67321 ) ) ( not ( = ?auto_67317 ?auto_67320 ) ) ( not ( = ?auto_67317 ?auto_67327 ) ) ( not ( = ?auto_67318 ?auto_67319 ) ) ( not ( = ?auto_67318 ?auto_67321 ) ) ( not ( = ?auto_67318 ?auto_67320 ) ) ( not ( = ?auto_67318 ?auto_67327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67319 ?auto_67321 ?auto_67320 )
      ( MAKE-4CRATE-VERIFY ?auto_67317 ?auto_67318 ?auto_67319 ?auto_67321 ?auto_67320 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_67328 - SURFACE
      ?auto_67329 - SURFACE
      ?auto_67330 - SURFACE
      ?auto_67332 - SURFACE
      ?auto_67331 - SURFACE
      ?auto_67333 - SURFACE
    )
    :vars
    (
      ?auto_67335 - HOIST
      ?auto_67338 - PLACE
      ?auto_67336 - PLACE
      ?auto_67334 - HOIST
      ?auto_67339 - SURFACE
      ?auto_67337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67335 ?auto_67338 ) ( IS-CRATE ?auto_67333 ) ( not ( = ?auto_67331 ?auto_67333 ) ) ( not ( = ?auto_67332 ?auto_67331 ) ) ( not ( = ?auto_67332 ?auto_67333 ) ) ( not ( = ?auto_67336 ?auto_67338 ) ) ( HOIST-AT ?auto_67334 ?auto_67336 ) ( not ( = ?auto_67335 ?auto_67334 ) ) ( SURFACE-AT ?auto_67333 ?auto_67336 ) ( ON ?auto_67333 ?auto_67339 ) ( CLEAR ?auto_67333 ) ( not ( = ?auto_67331 ?auto_67339 ) ) ( not ( = ?auto_67333 ?auto_67339 ) ) ( not ( = ?auto_67332 ?auto_67339 ) ) ( SURFACE-AT ?auto_67332 ?auto_67338 ) ( CLEAR ?auto_67332 ) ( IS-CRATE ?auto_67331 ) ( AVAILABLE ?auto_67335 ) ( TRUCK-AT ?auto_67337 ?auto_67336 ) ( LIFTING ?auto_67334 ?auto_67331 ) ( ON ?auto_67329 ?auto_67328 ) ( ON ?auto_67330 ?auto_67329 ) ( ON ?auto_67332 ?auto_67330 ) ( not ( = ?auto_67328 ?auto_67329 ) ) ( not ( = ?auto_67328 ?auto_67330 ) ) ( not ( = ?auto_67328 ?auto_67332 ) ) ( not ( = ?auto_67328 ?auto_67331 ) ) ( not ( = ?auto_67328 ?auto_67333 ) ) ( not ( = ?auto_67328 ?auto_67339 ) ) ( not ( = ?auto_67329 ?auto_67330 ) ) ( not ( = ?auto_67329 ?auto_67332 ) ) ( not ( = ?auto_67329 ?auto_67331 ) ) ( not ( = ?auto_67329 ?auto_67333 ) ) ( not ( = ?auto_67329 ?auto_67339 ) ) ( not ( = ?auto_67330 ?auto_67332 ) ) ( not ( = ?auto_67330 ?auto_67331 ) ) ( not ( = ?auto_67330 ?auto_67333 ) ) ( not ( = ?auto_67330 ?auto_67339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67332 ?auto_67331 ?auto_67333 )
      ( MAKE-5CRATE-VERIFY ?auto_67328 ?auto_67329 ?auto_67330 ?auto_67332 ?auto_67331 ?auto_67333 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67340 - SURFACE
      ?auto_67341 - SURFACE
      ?auto_67342 - SURFACE
      ?auto_67344 - SURFACE
      ?auto_67343 - SURFACE
      ?auto_67345 - SURFACE
      ?auto_67346 - SURFACE
    )
    :vars
    (
      ?auto_67348 - HOIST
      ?auto_67351 - PLACE
      ?auto_67349 - PLACE
      ?auto_67347 - HOIST
      ?auto_67352 - SURFACE
      ?auto_67350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67348 ?auto_67351 ) ( IS-CRATE ?auto_67346 ) ( not ( = ?auto_67345 ?auto_67346 ) ) ( not ( = ?auto_67343 ?auto_67345 ) ) ( not ( = ?auto_67343 ?auto_67346 ) ) ( not ( = ?auto_67349 ?auto_67351 ) ) ( HOIST-AT ?auto_67347 ?auto_67349 ) ( not ( = ?auto_67348 ?auto_67347 ) ) ( SURFACE-AT ?auto_67346 ?auto_67349 ) ( ON ?auto_67346 ?auto_67352 ) ( CLEAR ?auto_67346 ) ( not ( = ?auto_67345 ?auto_67352 ) ) ( not ( = ?auto_67346 ?auto_67352 ) ) ( not ( = ?auto_67343 ?auto_67352 ) ) ( SURFACE-AT ?auto_67343 ?auto_67351 ) ( CLEAR ?auto_67343 ) ( IS-CRATE ?auto_67345 ) ( AVAILABLE ?auto_67348 ) ( TRUCK-AT ?auto_67350 ?auto_67349 ) ( LIFTING ?auto_67347 ?auto_67345 ) ( ON ?auto_67341 ?auto_67340 ) ( ON ?auto_67342 ?auto_67341 ) ( ON ?auto_67344 ?auto_67342 ) ( ON ?auto_67343 ?auto_67344 ) ( not ( = ?auto_67340 ?auto_67341 ) ) ( not ( = ?auto_67340 ?auto_67342 ) ) ( not ( = ?auto_67340 ?auto_67344 ) ) ( not ( = ?auto_67340 ?auto_67343 ) ) ( not ( = ?auto_67340 ?auto_67345 ) ) ( not ( = ?auto_67340 ?auto_67346 ) ) ( not ( = ?auto_67340 ?auto_67352 ) ) ( not ( = ?auto_67341 ?auto_67342 ) ) ( not ( = ?auto_67341 ?auto_67344 ) ) ( not ( = ?auto_67341 ?auto_67343 ) ) ( not ( = ?auto_67341 ?auto_67345 ) ) ( not ( = ?auto_67341 ?auto_67346 ) ) ( not ( = ?auto_67341 ?auto_67352 ) ) ( not ( = ?auto_67342 ?auto_67344 ) ) ( not ( = ?auto_67342 ?auto_67343 ) ) ( not ( = ?auto_67342 ?auto_67345 ) ) ( not ( = ?auto_67342 ?auto_67346 ) ) ( not ( = ?auto_67342 ?auto_67352 ) ) ( not ( = ?auto_67344 ?auto_67343 ) ) ( not ( = ?auto_67344 ?auto_67345 ) ) ( not ( = ?auto_67344 ?auto_67346 ) ) ( not ( = ?auto_67344 ?auto_67352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67343 ?auto_67345 ?auto_67346 )
      ( MAKE-6CRATE-VERIFY ?auto_67340 ?auto_67341 ?auto_67342 ?auto_67344 ?auto_67343 ?auto_67345 ?auto_67346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_67353 - SURFACE
      ?auto_67354 - SURFACE
    )
    :vars
    (
      ?auto_67356 - HOIST
      ?auto_67359 - PLACE
      ?auto_67361 - SURFACE
      ?auto_67357 - PLACE
      ?auto_67355 - HOIST
      ?auto_67360 - SURFACE
      ?auto_67358 - TRUCK
      ?auto_67362 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67356 ?auto_67359 ) ( IS-CRATE ?auto_67354 ) ( not ( = ?auto_67353 ?auto_67354 ) ) ( not ( = ?auto_67361 ?auto_67353 ) ) ( not ( = ?auto_67361 ?auto_67354 ) ) ( not ( = ?auto_67357 ?auto_67359 ) ) ( HOIST-AT ?auto_67355 ?auto_67357 ) ( not ( = ?auto_67356 ?auto_67355 ) ) ( SURFACE-AT ?auto_67354 ?auto_67357 ) ( ON ?auto_67354 ?auto_67360 ) ( CLEAR ?auto_67354 ) ( not ( = ?auto_67353 ?auto_67360 ) ) ( not ( = ?auto_67354 ?auto_67360 ) ) ( not ( = ?auto_67361 ?auto_67360 ) ) ( SURFACE-AT ?auto_67361 ?auto_67359 ) ( CLEAR ?auto_67361 ) ( IS-CRATE ?auto_67353 ) ( AVAILABLE ?auto_67356 ) ( TRUCK-AT ?auto_67358 ?auto_67357 ) ( AVAILABLE ?auto_67355 ) ( SURFACE-AT ?auto_67353 ?auto_67357 ) ( ON ?auto_67353 ?auto_67362 ) ( CLEAR ?auto_67353 ) ( not ( = ?auto_67353 ?auto_67362 ) ) ( not ( = ?auto_67354 ?auto_67362 ) ) ( not ( = ?auto_67361 ?auto_67362 ) ) ( not ( = ?auto_67360 ?auto_67362 ) ) )
    :subtasks
    ( ( !LIFT ?auto_67355 ?auto_67353 ?auto_67362 ?auto_67357 )
      ( MAKE-2CRATE ?auto_67361 ?auto_67353 ?auto_67354 )
      ( MAKE-1CRATE-VERIFY ?auto_67353 ?auto_67354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_67363 - SURFACE
      ?auto_67364 - SURFACE
      ?auto_67365 - SURFACE
    )
    :vars
    (
      ?auto_67368 - HOIST
      ?auto_67372 - PLACE
      ?auto_67370 - PLACE
      ?auto_67371 - HOIST
      ?auto_67366 - SURFACE
      ?auto_67369 - TRUCK
      ?auto_67367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67368 ?auto_67372 ) ( IS-CRATE ?auto_67365 ) ( not ( = ?auto_67364 ?auto_67365 ) ) ( not ( = ?auto_67363 ?auto_67364 ) ) ( not ( = ?auto_67363 ?auto_67365 ) ) ( not ( = ?auto_67370 ?auto_67372 ) ) ( HOIST-AT ?auto_67371 ?auto_67370 ) ( not ( = ?auto_67368 ?auto_67371 ) ) ( SURFACE-AT ?auto_67365 ?auto_67370 ) ( ON ?auto_67365 ?auto_67366 ) ( CLEAR ?auto_67365 ) ( not ( = ?auto_67364 ?auto_67366 ) ) ( not ( = ?auto_67365 ?auto_67366 ) ) ( not ( = ?auto_67363 ?auto_67366 ) ) ( SURFACE-AT ?auto_67363 ?auto_67372 ) ( CLEAR ?auto_67363 ) ( IS-CRATE ?auto_67364 ) ( AVAILABLE ?auto_67368 ) ( TRUCK-AT ?auto_67369 ?auto_67370 ) ( AVAILABLE ?auto_67371 ) ( SURFACE-AT ?auto_67364 ?auto_67370 ) ( ON ?auto_67364 ?auto_67367 ) ( CLEAR ?auto_67364 ) ( not ( = ?auto_67364 ?auto_67367 ) ) ( not ( = ?auto_67365 ?auto_67367 ) ) ( not ( = ?auto_67363 ?auto_67367 ) ) ( not ( = ?auto_67366 ?auto_67367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_67364 ?auto_67365 )
      ( MAKE-2CRATE-VERIFY ?auto_67363 ?auto_67364 ?auto_67365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_67373 - SURFACE
      ?auto_67374 - SURFACE
      ?auto_67375 - SURFACE
      ?auto_67376 - SURFACE
    )
    :vars
    (
      ?auto_67383 - HOIST
      ?auto_67380 - PLACE
      ?auto_67377 - PLACE
      ?auto_67378 - HOIST
      ?auto_67382 - SURFACE
      ?auto_67379 - TRUCK
      ?auto_67381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67383 ?auto_67380 ) ( IS-CRATE ?auto_67376 ) ( not ( = ?auto_67375 ?auto_67376 ) ) ( not ( = ?auto_67374 ?auto_67375 ) ) ( not ( = ?auto_67374 ?auto_67376 ) ) ( not ( = ?auto_67377 ?auto_67380 ) ) ( HOIST-AT ?auto_67378 ?auto_67377 ) ( not ( = ?auto_67383 ?auto_67378 ) ) ( SURFACE-AT ?auto_67376 ?auto_67377 ) ( ON ?auto_67376 ?auto_67382 ) ( CLEAR ?auto_67376 ) ( not ( = ?auto_67375 ?auto_67382 ) ) ( not ( = ?auto_67376 ?auto_67382 ) ) ( not ( = ?auto_67374 ?auto_67382 ) ) ( SURFACE-AT ?auto_67374 ?auto_67380 ) ( CLEAR ?auto_67374 ) ( IS-CRATE ?auto_67375 ) ( AVAILABLE ?auto_67383 ) ( TRUCK-AT ?auto_67379 ?auto_67377 ) ( AVAILABLE ?auto_67378 ) ( SURFACE-AT ?auto_67375 ?auto_67377 ) ( ON ?auto_67375 ?auto_67381 ) ( CLEAR ?auto_67375 ) ( not ( = ?auto_67375 ?auto_67381 ) ) ( not ( = ?auto_67376 ?auto_67381 ) ) ( not ( = ?auto_67374 ?auto_67381 ) ) ( not ( = ?auto_67382 ?auto_67381 ) ) ( ON ?auto_67374 ?auto_67373 ) ( not ( = ?auto_67373 ?auto_67374 ) ) ( not ( = ?auto_67373 ?auto_67375 ) ) ( not ( = ?auto_67373 ?auto_67376 ) ) ( not ( = ?auto_67373 ?auto_67382 ) ) ( not ( = ?auto_67373 ?auto_67381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67374 ?auto_67375 ?auto_67376 )
      ( MAKE-3CRATE-VERIFY ?auto_67373 ?auto_67374 ?auto_67375 ?auto_67376 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_67384 - SURFACE
      ?auto_67385 - SURFACE
      ?auto_67386 - SURFACE
      ?auto_67388 - SURFACE
      ?auto_67387 - SURFACE
    )
    :vars
    (
      ?auto_67395 - HOIST
      ?auto_67392 - PLACE
      ?auto_67389 - PLACE
      ?auto_67390 - HOIST
      ?auto_67394 - SURFACE
      ?auto_67391 - TRUCK
      ?auto_67393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67395 ?auto_67392 ) ( IS-CRATE ?auto_67387 ) ( not ( = ?auto_67388 ?auto_67387 ) ) ( not ( = ?auto_67386 ?auto_67388 ) ) ( not ( = ?auto_67386 ?auto_67387 ) ) ( not ( = ?auto_67389 ?auto_67392 ) ) ( HOIST-AT ?auto_67390 ?auto_67389 ) ( not ( = ?auto_67395 ?auto_67390 ) ) ( SURFACE-AT ?auto_67387 ?auto_67389 ) ( ON ?auto_67387 ?auto_67394 ) ( CLEAR ?auto_67387 ) ( not ( = ?auto_67388 ?auto_67394 ) ) ( not ( = ?auto_67387 ?auto_67394 ) ) ( not ( = ?auto_67386 ?auto_67394 ) ) ( SURFACE-AT ?auto_67386 ?auto_67392 ) ( CLEAR ?auto_67386 ) ( IS-CRATE ?auto_67388 ) ( AVAILABLE ?auto_67395 ) ( TRUCK-AT ?auto_67391 ?auto_67389 ) ( AVAILABLE ?auto_67390 ) ( SURFACE-AT ?auto_67388 ?auto_67389 ) ( ON ?auto_67388 ?auto_67393 ) ( CLEAR ?auto_67388 ) ( not ( = ?auto_67388 ?auto_67393 ) ) ( not ( = ?auto_67387 ?auto_67393 ) ) ( not ( = ?auto_67386 ?auto_67393 ) ) ( not ( = ?auto_67394 ?auto_67393 ) ) ( ON ?auto_67385 ?auto_67384 ) ( ON ?auto_67386 ?auto_67385 ) ( not ( = ?auto_67384 ?auto_67385 ) ) ( not ( = ?auto_67384 ?auto_67386 ) ) ( not ( = ?auto_67384 ?auto_67388 ) ) ( not ( = ?auto_67384 ?auto_67387 ) ) ( not ( = ?auto_67384 ?auto_67394 ) ) ( not ( = ?auto_67384 ?auto_67393 ) ) ( not ( = ?auto_67385 ?auto_67386 ) ) ( not ( = ?auto_67385 ?auto_67388 ) ) ( not ( = ?auto_67385 ?auto_67387 ) ) ( not ( = ?auto_67385 ?auto_67394 ) ) ( not ( = ?auto_67385 ?auto_67393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67386 ?auto_67388 ?auto_67387 )
      ( MAKE-4CRATE-VERIFY ?auto_67384 ?auto_67385 ?auto_67386 ?auto_67388 ?auto_67387 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_67396 - SURFACE
      ?auto_67397 - SURFACE
      ?auto_67398 - SURFACE
      ?auto_67400 - SURFACE
      ?auto_67399 - SURFACE
      ?auto_67401 - SURFACE
    )
    :vars
    (
      ?auto_67408 - HOIST
      ?auto_67405 - PLACE
      ?auto_67402 - PLACE
      ?auto_67403 - HOIST
      ?auto_67407 - SURFACE
      ?auto_67404 - TRUCK
      ?auto_67406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67408 ?auto_67405 ) ( IS-CRATE ?auto_67401 ) ( not ( = ?auto_67399 ?auto_67401 ) ) ( not ( = ?auto_67400 ?auto_67399 ) ) ( not ( = ?auto_67400 ?auto_67401 ) ) ( not ( = ?auto_67402 ?auto_67405 ) ) ( HOIST-AT ?auto_67403 ?auto_67402 ) ( not ( = ?auto_67408 ?auto_67403 ) ) ( SURFACE-AT ?auto_67401 ?auto_67402 ) ( ON ?auto_67401 ?auto_67407 ) ( CLEAR ?auto_67401 ) ( not ( = ?auto_67399 ?auto_67407 ) ) ( not ( = ?auto_67401 ?auto_67407 ) ) ( not ( = ?auto_67400 ?auto_67407 ) ) ( SURFACE-AT ?auto_67400 ?auto_67405 ) ( CLEAR ?auto_67400 ) ( IS-CRATE ?auto_67399 ) ( AVAILABLE ?auto_67408 ) ( TRUCK-AT ?auto_67404 ?auto_67402 ) ( AVAILABLE ?auto_67403 ) ( SURFACE-AT ?auto_67399 ?auto_67402 ) ( ON ?auto_67399 ?auto_67406 ) ( CLEAR ?auto_67399 ) ( not ( = ?auto_67399 ?auto_67406 ) ) ( not ( = ?auto_67401 ?auto_67406 ) ) ( not ( = ?auto_67400 ?auto_67406 ) ) ( not ( = ?auto_67407 ?auto_67406 ) ) ( ON ?auto_67397 ?auto_67396 ) ( ON ?auto_67398 ?auto_67397 ) ( ON ?auto_67400 ?auto_67398 ) ( not ( = ?auto_67396 ?auto_67397 ) ) ( not ( = ?auto_67396 ?auto_67398 ) ) ( not ( = ?auto_67396 ?auto_67400 ) ) ( not ( = ?auto_67396 ?auto_67399 ) ) ( not ( = ?auto_67396 ?auto_67401 ) ) ( not ( = ?auto_67396 ?auto_67407 ) ) ( not ( = ?auto_67396 ?auto_67406 ) ) ( not ( = ?auto_67397 ?auto_67398 ) ) ( not ( = ?auto_67397 ?auto_67400 ) ) ( not ( = ?auto_67397 ?auto_67399 ) ) ( not ( = ?auto_67397 ?auto_67401 ) ) ( not ( = ?auto_67397 ?auto_67407 ) ) ( not ( = ?auto_67397 ?auto_67406 ) ) ( not ( = ?auto_67398 ?auto_67400 ) ) ( not ( = ?auto_67398 ?auto_67399 ) ) ( not ( = ?auto_67398 ?auto_67401 ) ) ( not ( = ?auto_67398 ?auto_67407 ) ) ( not ( = ?auto_67398 ?auto_67406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67400 ?auto_67399 ?auto_67401 )
      ( MAKE-5CRATE-VERIFY ?auto_67396 ?auto_67397 ?auto_67398 ?auto_67400 ?auto_67399 ?auto_67401 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67409 - SURFACE
      ?auto_67410 - SURFACE
      ?auto_67411 - SURFACE
      ?auto_67413 - SURFACE
      ?auto_67412 - SURFACE
      ?auto_67414 - SURFACE
      ?auto_67415 - SURFACE
    )
    :vars
    (
      ?auto_67422 - HOIST
      ?auto_67419 - PLACE
      ?auto_67416 - PLACE
      ?auto_67417 - HOIST
      ?auto_67421 - SURFACE
      ?auto_67418 - TRUCK
      ?auto_67420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67422 ?auto_67419 ) ( IS-CRATE ?auto_67415 ) ( not ( = ?auto_67414 ?auto_67415 ) ) ( not ( = ?auto_67412 ?auto_67414 ) ) ( not ( = ?auto_67412 ?auto_67415 ) ) ( not ( = ?auto_67416 ?auto_67419 ) ) ( HOIST-AT ?auto_67417 ?auto_67416 ) ( not ( = ?auto_67422 ?auto_67417 ) ) ( SURFACE-AT ?auto_67415 ?auto_67416 ) ( ON ?auto_67415 ?auto_67421 ) ( CLEAR ?auto_67415 ) ( not ( = ?auto_67414 ?auto_67421 ) ) ( not ( = ?auto_67415 ?auto_67421 ) ) ( not ( = ?auto_67412 ?auto_67421 ) ) ( SURFACE-AT ?auto_67412 ?auto_67419 ) ( CLEAR ?auto_67412 ) ( IS-CRATE ?auto_67414 ) ( AVAILABLE ?auto_67422 ) ( TRUCK-AT ?auto_67418 ?auto_67416 ) ( AVAILABLE ?auto_67417 ) ( SURFACE-AT ?auto_67414 ?auto_67416 ) ( ON ?auto_67414 ?auto_67420 ) ( CLEAR ?auto_67414 ) ( not ( = ?auto_67414 ?auto_67420 ) ) ( not ( = ?auto_67415 ?auto_67420 ) ) ( not ( = ?auto_67412 ?auto_67420 ) ) ( not ( = ?auto_67421 ?auto_67420 ) ) ( ON ?auto_67410 ?auto_67409 ) ( ON ?auto_67411 ?auto_67410 ) ( ON ?auto_67413 ?auto_67411 ) ( ON ?auto_67412 ?auto_67413 ) ( not ( = ?auto_67409 ?auto_67410 ) ) ( not ( = ?auto_67409 ?auto_67411 ) ) ( not ( = ?auto_67409 ?auto_67413 ) ) ( not ( = ?auto_67409 ?auto_67412 ) ) ( not ( = ?auto_67409 ?auto_67414 ) ) ( not ( = ?auto_67409 ?auto_67415 ) ) ( not ( = ?auto_67409 ?auto_67421 ) ) ( not ( = ?auto_67409 ?auto_67420 ) ) ( not ( = ?auto_67410 ?auto_67411 ) ) ( not ( = ?auto_67410 ?auto_67413 ) ) ( not ( = ?auto_67410 ?auto_67412 ) ) ( not ( = ?auto_67410 ?auto_67414 ) ) ( not ( = ?auto_67410 ?auto_67415 ) ) ( not ( = ?auto_67410 ?auto_67421 ) ) ( not ( = ?auto_67410 ?auto_67420 ) ) ( not ( = ?auto_67411 ?auto_67413 ) ) ( not ( = ?auto_67411 ?auto_67412 ) ) ( not ( = ?auto_67411 ?auto_67414 ) ) ( not ( = ?auto_67411 ?auto_67415 ) ) ( not ( = ?auto_67411 ?auto_67421 ) ) ( not ( = ?auto_67411 ?auto_67420 ) ) ( not ( = ?auto_67413 ?auto_67412 ) ) ( not ( = ?auto_67413 ?auto_67414 ) ) ( not ( = ?auto_67413 ?auto_67415 ) ) ( not ( = ?auto_67413 ?auto_67421 ) ) ( not ( = ?auto_67413 ?auto_67420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67412 ?auto_67414 ?auto_67415 )
      ( MAKE-6CRATE-VERIFY ?auto_67409 ?auto_67410 ?auto_67411 ?auto_67413 ?auto_67412 ?auto_67414 ?auto_67415 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_67423 - SURFACE
      ?auto_67424 - SURFACE
    )
    :vars
    (
      ?auto_67432 - HOIST
      ?auto_67428 - PLACE
      ?auto_67431 - SURFACE
      ?auto_67425 - PLACE
      ?auto_67426 - HOIST
      ?auto_67430 - SURFACE
      ?auto_67429 - SURFACE
      ?auto_67427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67432 ?auto_67428 ) ( IS-CRATE ?auto_67424 ) ( not ( = ?auto_67423 ?auto_67424 ) ) ( not ( = ?auto_67431 ?auto_67423 ) ) ( not ( = ?auto_67431 ?auto_67424 ) ) ( not ( = ?auto_67425 ?auto_67428 ) ) ( HOIST-AT ?auto_67426 ?auto_67425 ) ( not ( = ?auto_67432 ?auto_67426 ) ) ( SURFACE-AT ?auto_67424 ?auto_67425 ) ( ON ?auto_67424 ?auto_67430 ) ( CLEAR ?auto_67424 ) ( not ( = ?auto_67423 ?auto_67430 ) ) ( not ( = ?auto_67424 ?auto_67430 ) ) ( not ( = ?auto_67431 ?auto_67430 ) ) ( SURFACE-AT ?auto_67431 ?auto_67428 ) ( CLEAR ?auto_67431 ) ( IS-CRATE ?auto_67423 ) ( AVAILABLE ?auto_67432 ) ( AVAILABLE ?auto_67426 ) ( SURFACE-AT ?auto_67423 ?auto_67425 ) ( ON ?auto_67423 ?auto_67429 ) ( CLEAR ?auto_67423 ) ( not ( = ?auto_67423 ?auto_67429 ) ) ( not ( = ?auto_67424 ?auto_67429 ) ) ( not ( = ?auto_67431 ?auto_67429 ) ) ( not ( = ?auto_67430 ?auto_67429 ) ) ( TRUCK-AT ?auto_67427 ?auto_67428 ) )
    :subtasks
    ( ( !DRIVE ?auto_67427 ?auto_67428 ?auto_67425 )
      ( MAKE-2CRATE ?auto_67431 ?auto_67423 ?auto_67424 )
      ( MAKE-1CRATE-VERIFY ?auto_67423 ?auto_67424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_67433 - SURFACE
      ?auto_67434 - SURFACE
      ?auto_67435 - SURFACE
    )
    :vars
    (
      ?auto_67437 - HOIST
      ?auto_67439 - PLACE
      ?auto_67441 - PLACE
      ?auto_67436 - HOIST
      ?auto_67442 - SURFACE
      ?auto_67440 - SURFACE
      ?auto_67438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67437 ?auto_67439 ) ( IS-CRATE ?auto_67435 ) ( not ( = ?auto_67434 ?auto_67435 ) ) ( not ( = ?auto_67433 ?auto_67434 ) ) ( not ( = ?auto_67433 ?auto_67435 ) ) ( not ( = ?auto_67441 ?auto_67439 ) ) ( HOIST-AT ?auto_67436 ?auto_67441 ) ( not ( = ?auto_67437 ?auto_67436 ) ) ( SURFACE-AT ?auto_67435 ?auto_67441 ) ( ON ?auto_67435 ?auto_67442 ) ( CLEAR ?auto_67435 ) ( not ( = ?auto_67434 ?auto_67442 ) ) ( not ( = ?auto_67435 ?auto_67442 ) ) ( not ( = ?auto_67433 ?auto_67442 ) ) ( SURFACE-AT ?auto_67433 ?auto_67439 ) ( CLEAR ?auto_67433 ) ( IS-CRATE ?auto_67434 ) ( AVAILABLE ?auto_67437 ) ( AVAILABLE ?auto_67436 ) ( SURFACE-AT ?auto_67434 ?auto_67441 ) ( ON ?auto_67434 ?auto_67440 ) ( CLEAR ?auto_67434 ) ( not ( = ?auto_67434 ?auto_67440 ) ) ( not ( = ?auto_67435 ?auto_67440 ) ) ( not ( = ?auto_67433 ?auto_67440 ) ) ( not ( = ?auto_67442 ?auto_67440 ) ) ( TRUCK-AT ?auto_67438 ?auto_67439 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_67434 ?auto_67435 )
      ( MAKE-2CRATE-VERIFY ?auto_67433 ?auto_67434 ?auto_67435 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_67443 - SURFACE
      ?auto_67444 - SURFACE
      ?auto_67445 - SURFACE
      ?auto_67446 - SURFACE
    )
    :vars
    (
      ?auto_67453 - HOIST
      ?auto_67447 - PLACE
      ?auto_67451 - PLACE
      ?auto_67449 - HOIST
      ?auto_67450 - SURFACE
      ?auto_67452 - SURFACE
      ?auto_67448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67453 ?auto_67447 ) ( IS-CRATE ?auto_67446 ) ( not ( = ?auto_67445 ?auto_67446 ) ) ( not ( = ?auto_67444 ?auto_67445 ) ) ( not ( = ?auto_67444 ?auto_67446 ) ) ( not ( = ?auto_67451 ?auto_67447 ) ) ( HOIST-AT ?auto_67449 ?auto_67451 ) ( not ( = ?auto_67453 ?auto_67449 ) ) ( SURFACE-AT ?auto_67446 ?auto_67451 ) ( ON ?auto_67446 ?auto_67450 ) ( CLEAR ?auto_67446 ) ( not ( = ?auto_67445 ?auto_67450 ) ) ( not ( = ?auto_67446 ?auto_67450 ) ) ( not ( = ?auto_67444 ?auto_67450 ) ) ( SURFACE-AT ?auto_67444 ?auto_67447 ) ( CLEAR ?auto_67444 ) ( IS-CRATE ?auto_67445 ) ( AVAILABLE ?auto_67453 ) ( AVAILABLE ?auto_67449 ) ( SURFACE-AT ?auto_67445 ?auto_67451 ) ( ON ?auto_67445 ?auto_67452 ) ( CLEAR ?auto_67445 ) ( not ( = ?auto_67445 ?auto_67452 ) ) ( not ( = ?auto_67446 ?auto_67452 ) ) ( not ( = ?auto_67444 ?auto_67452 ) ) ( not ( = ?auto_67450 ?auto_67452 ) ) ( TRUCK-AT ?auto_67448 ?auto_67447 ) ( ON ?auto_67444 ?auto_67443 ) ( not ( = ?auto_67443 ?auto_67444 ) ) ( not ( = ?auto_67443 ?auto_67445 ) ) ( not ( = ?auto_67443 ?auto_67446 ) ) ( not ( = ?auto_67443 ?auto_67450 ) ) ( not ( = ?auto_67443 ?auto_67452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67444 ?auto_67445 ?auto_67446 )
      ( MAKE-3CRATE-VERIFY ?auto_67443 ?auto_67444 ?auto_67445 ?auto_67446 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_67454 - SURFACE
      ?auto_67455 - SURFACE
      ?auto_67456 - SURFACE
      ?auto_67458 - SURFACE
      ?auto_67457 - SURFACE
    )
    :vars
    (
      ?auto_67465 - HOIST
      ?auto_67459 - PLACE
      ?auto_67463 - PLACE
      ?auto_67461 - HOIST
      ?auto_67462 - SURFACE
      ?auto_67464 - SURFACE
      ?auto_67460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67465 ?auto_67459 ) ( IS-CRATE ?auto_67457 ) ( not ( = ?auto_67458 ?auto_67457 ) ) ( not ( = ?auto_67456 ?auto_67458 ) ) ( not ( = ?auto_67456 ?auto_67457 ) ) ( not ( = ?auto_67463 ?auto_67459 ) ) ( HOIST-AT ?auto_67461 ?auto_67463 ) ( not ( = ?auto_67465 ?auto_67461 ) ) ( SURFACE-AT ?auto_67457 ?auto_67463 ) ( ON ?auto_67457 ?auto_67462 ) ( CLEAR ?auto_67457 ) ( not ( = ?auto_67458 ?auto_67462 ) ) ( not ( = ?auto_67457 ?auto_67462 ) ) ( not ( = ?auto_67456 ?auto_67462 ) ) ( SURFACE-AT ?auto_67456 ?auto_67459 ) ( CLEAR ?auto_67456 ) ( IS-CRATE ?auto_67458 ) ( AVAILABLE ?auto_67465 ) ( AVAILABLE ?auto_67461 ) ( SURFACE-AT ?auto_67458 ?auto_67463 ) ( ON ?auto_67458 ?auto_67464 ) ( CLEAR ?auto_67458 ) ( not ( = ?auto_67458 ?auto_67464 ) ) ( not ( = ?auto_67457 ?auto_67464 ) ) ( not ( = ?auto_67456 ?auto_67464 ) ) ( not ( = ?auto_67462 ?auto_67464 ) ) ( TRUCK-AT ?auto_67460 ?auto_67459 ) ( ON ?auto_67455 ?auto_67454 ) ( ON ?auto_67456 ?auto_67455 ) ( not ( = ?auto_67454 ?auto_67455 ) ) ( not ( = ?auto_67454 ?auto_67456 ) ) ( not ( = ?auto_67454 ?auto_67458 ) ) ( not ( = ?auto_67454 ?auto_67457 ) ) ( not ( = ?auto_67454 ?auto_67462 ) ) ( not ( = ?auto_67454 ?auto_67464 ) ) ( not ( = ?auto_67455 ?auto_67456 ) ) ( not ( = ?auto_67455 ?auto_67458 ) ) ( not ( = ?auto_67455 ?auto_67457 ) ) ( not ( = ?auto_67455 ?auto_67462 ) ) ( not ( = ?auto_67455 ?auto_67464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67456 ?auto_67458 ?auto_67457 )
      ( MAKE-4CRATE-VERIFY ?auto_67454 ?auto_67455 ?auto_67456 ?auto_67458 ?auto_67457 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_67466 - SURFACE
      ?auto_67467 - SURFACE
      ?auto_67468 - SURFACE
      ?auto_67470 - SURFACE
      ?auto_67469 - SURFACE
      ?auto_67471 - SURFACE
    )
    :vars
    (
      ?auto_67478 - HOIST
      ?auto_67472 - PLACE
      ?auto_67476 - PLACE
      ?auto_67474 - HOIST
      ?auto_67475 - SURFACE
      ?auto_67477 - SURFACE
      ?auto_67473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67478 ?auto_67472 ) ( IS-CRATE ?auto_67471 ) ( not ( = ?auto_67469 ?auto_67471 ) ) ( not ( = ?auto_67470 ?auto_67469 ) ) ( not ( = ?auto_67470 ?auto_67471 ) ) ( not ( = ?auto_67476 ?auto_67472 ) ) ( HOIST-AT ?auto_67474 ?auto_67476 ) ( not ( = ?auto_67478 ?auto_67474 ) ) ( SURFACE-AT ?auto_67471 ?auto_67476 ) ( ON ?auto_67471 ?auto_67475 ) ( CLEAR ?auto_67471 ) ( not ( = ?auto_67469 ?auto_67475 ) ) ( not ( = ?auto_67471 ?auto_67475 ) ) ( not ( = ?auto_67470 ?auto_67475 ) ) ( SURFACE-AT ?auto_67470 ?auto_67472 ) ( CLEAR ?auto_67470 ) ( IS-CRATE ?auto_67469 ) ( AVAILABLE ?auto_67478 ) ( AVAILABLE ?auto_67474 ) ( SURFACE-AT ?auto_67469 ?auto_67476 ) ( ON ?auto_67469 ?auto_67477 ) ( CLEAR ?auto_67469 ) ( not ( = ?auto_67469 ?auto_67477 ) ) ( not ( = ?auto_67471 ?auto_67477 ) ) ( not ( = ?auto_67470 ?auto_67477 ) ) ( not ( = ?auto_67475 ?auto_67477 ) ) ( TRUCK-AT ?auto_67473 ?auto_67472 ) ( ON ?auto_67467 ?auto_67466 ) ( ON ?auto_67468 ?auto_67467 ) ( ON ?auto_67470 ?auto_67468 ) ( not ( = ?auto_67466 ?auto_67467 ) ) ( not ( = ?auto_67466 ?auto_67468 ) ) ( not ( = ?auto_67466 ?auto_67470 ) ) ( not ( = ?auto_67466 ?auto_67469 ) ) ( not ( = ?auto_67466 ?auto_67471 ) ) ( not ( = ?auto_67466 ?auto_67475 ) ) ( not ( = ?auto_67466 ?auto_67477 ) ) ( not ( = ?auto_67467 ?auto_67468 ) ) ( not ( = ?auto_67467 ?auto_67470 ) ) ( not ( = ?auto_67467 ?auto_67469 ) ) ( not ( = ?auto_67467 ?auto_67471 ) ) ( not ( = ?auto_67467 ?auto_67475 ) ) ( not ( = ?auto_67467 ?auto_67477 ) ) ( not ( = ?auto_67468 ?auto_67470 ) ) ( not ( = ?auto_67468 ?auto_67469 ) ) ( not ( = ?auto_67468 ?auto_67471 ) ) ( not ( = ?auto_67468 ?auto_67475 ) ) ( not ( = ?auto_67468 ?auto_67477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67470 ?auto_67469 ?auto_67471 )
      ( MAKE-5CRATE-VERIFY ?auto_67466 ?auto_67467 ?auto_67468 ?auto_67470 ?auto_67469 ?auto_67471 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67479 - SURFACE
      ?auto_67480 - SURFACE
      ?auto_67481 - SURFACE
      ?auto_67483 - SURFACE
      ?auto_67482 - SURFACE
      ?auto_67484 - SURFACE
      ?auto_67485 - SURFACE
    )
    :vars
    (
      ?auto_67492 - HOIST
      ?auto_67486 - PLACE
      ?auto_67490 - PLACE
      ?auto_67488 - HOIST
      ?auto_67489 - SURFACE
      ?auto_67491 - SURFACE
      ?auto_67487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67492 ?auto_67486 ) ( IS-CRATE ?auto_67485 ) ( not ( = ?auto_67484 ?auto_67485 ) ) ( not ( = ?auto_67482 ?auto_67484 ) ) ( not ( = ?auto_67482 ?auto_67485 ) ) ( not ( = ?auto_67490 ?auto_67486 ) ) ( HOIST-AT ?auto_67488 ?auto_67490 ) ( not ( = ?auto_67492 ?auto_67488 ) ) ( SURFACE-AT ?auto_67485 ?auto_67490 ) ( ON ?auto_67485 ?auto_67489 ) ( CLEAR ?auto_67485 ) ( not ( = ?auto_67484 ?auto_67489 ) ) ( not ( = ?auto_67485 ?auto_67489 ) ) ( not ( = ?auto_67482 ?auto_67489 ) ) ( SURFACE-AT ?auto_67482 ?auto_67486 ) ( CLEAR ?auto_67482 ) ( IS-CRATE ?auto_67484 ) ( AVAILABLE ?auto_67492 ) ( AVAILABLE ?auto_67488 ) ( SURFACE-AT ?auto_67484 ?auto_67490 ) ( ON ?auto_67484 ?auto_67491 ) ( CLEAR ?auto_67484 ) ( not ( = ?auto_67484 ?auto_67491 ) ) ( not ( = ?auto_67485 ?auto_67491 ) ) ( not ( = ?auto_67482 ?auto_67491 ) ) ( not ( = ?auto_67489 ?auto_67491 ) ) ( TRUCK-AT ?auto_67487 ?auto_67486 ) ( ON ?auto_67480 ?auto_67479 ) ( ON ?auto_67481 ?auto_67480 ) ( ON ?auto_67483 ?auto_67481 ) ( ON ?auto_67482 ?auto_67483 ) ( not ( = ?auto_67479 ?auto_67480 ) ) ( not ( = ?auto_67479 ?auto_67481 ) ) ( not ( = ?auto_67479 ?auto_67483 ) ) ( not ( = ?auto_67479 ?auto_67482 ) ) ( not ( = ?auto_67479 ?auto_67484 ) ) ( not ( = ?auto_67479 ?auto_67485 ) ) ( not ( = ?auto_67479 ?auto_67489 ) ) ( not ( = ?auto_67479 ?auto_67491 ) ) ( not ( = ?auto_67480 ?auto_67481 ) ) ( not ( = ?auto_67480 ?auto_67483 ) ) ( not ( = ?auto_67480 ?auto_67482 ) ) ( not ( = ?auto_67480 ?auto_67484 ) ) ( not ( = ?auto_67480 ?auto_67485 ) ) ( not ( = ?auto_67480 ?auto_67489 ) ) ( not ( = ?auto_67480 ?auto_67491 ) ) ( not ( = ?auto_67481 ?auto_67483 ) ) ( not ( = ?auto_67481 ?auto_67482 ) ) ( not ( = ?auto_67481 ?auto_67484 ) ) ( not ( = ?auto_67481 ?auto_67485 ) ) ( not ( = ?auto_67481 ?auto_67489 ) ) ( not ( = ?auto_67481 ?auto_67491 ) ) ( not ( = ?auto_67483 ?auto_67482 ) ) ( not ( = ?auto_67483 ?auto_67484 ) ) ( not ( = ?auto_67483 ?auto_67485 ) ) ( not ( = ?auto_67483 ?auto_67489 ) ) ( not ( = ?auto_67483 ?auto_67491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67482 ?auto_67484 ?auto_67485 )
      ( MAKE-6CRATE-VERIFY ?auto_67479 ?auto_67480 ?auto_67481 ?auto_67483 ?auto_67482 ?auto_67484 ?auto_67485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_67493 - SURFACE
      ?auto_67494 - SURFACE
    )
    :vars
    (
      ?auto_67502 - HOIST
      ?auto_67495 - PLACE
      ?auto_67501 - SURFACE
      ?auto_67499 - PLACE
      ?auto_67497 - HOIST
      ?auto_67498 - SURFACE
      ?auto_67500 - SURFACE
      ?auto_67496 - TRUCK
      ?auto_67503 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67502 ?auto_67495 ) ( IS-CRATE ?auto_67494 ) ( not ( = ?auto_67493 ?auto_67494 ) ) ( not ( = ?auto_67501 ?auto_67493 ) ) ( not ( = ?auto_67501 ?auto_67494 ) ) ( not ( = ?auto_67499 ?auto_67495 ) ) ( HOIST-AT ?auto_67497 ?auto_67499 ) ( not ( = ?auto_67502 ?auto_67497 ) ) ( SURFACE-AT ?auto_67494 ?auto_67499 ) ( ON ?auto_67494 ?auto_67498 ) ( CLEAR ?auto_67494 ) ( not ( = ?auto_67493 ?auto_67498 ) ) ( not ( = ?auto_67494 ?auto_67498 ) ) ( not ( = ?auto_67501 ?auto_67498 ) ) ( IS-CRATE ?auto_67493 ) ( AVAILABLE ?auto_67497 ) ( SURFACE-AT ?auto_67493 ?auto_67499 ) ( ON ?auto_67493 ?auto_67500 ) ( CLEAR ?auto_67493 ) ( not ( = ?auto_67493 ?auto_67500 ) ) ( not ( = ?auto_67494 ?auto_67500 ) ) ( not ( = ?auto_67501 ?auto_67500 ) ) ( not ( = ?auto_67498 ?auto_67500 ) ) ( TRUCK-AT ?auto_67496 ?auto_67495 ) ( SURFACE-AT ?auto_67503 ?auto_67495 ) ( CLEAR ?auto_67503 ) ( LIFTING ?auto_67502 ?auto_67501 ) ( IS-CRATE ?auto_67501 ) ( not ( = ?auto_67503 ?auto_67501 ) ) ( not ( = ?auto_67493 ?auto_67503 ) ) ( not ( = ?auto_67494 ?auto_67503 ) ) ( not ( = ?auto_67498 ?auto_67503 ) ) ( not ( = ?auto_67500 ?auto_67503 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_67503 ?auto_67501 )
      ( MAKE-2CRATE ?auto_67501 ?auto_67493 ?auto_67494 )
      ( MAKE-1CRATE-VERIFY ?auto_67493 ?auto_67494 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_67504 - SURFACE
      ?auto_67505 - SURFACE
      ?auto_67506 - SURFACE
    )
    :vars
    (
      ?auto_67508 - HOIST
      ?auto_67514 - PLACE
      ?auto_67510 - PLACE
      ?auto_67512 - HOIST
      ?auto_67511 - SURFACE
      ?auto_67507 - SURFACE
      ?auto_67513 - TRUCK
      ?auto_67509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_67508 ?auto_67514 ) ( IS-CRATE ?auto_67506 ) ( not ( = ?auto_67505 ?auto_67506 ) ) ( not ( = ?auto_67504 ?auto_67505 ) ) ( not ( = ?auto_67504 ?auto_67506 ) ) ( not ( = ?auto_67510 ?auto_67514 ) ) ( HOIST-AT ?auto_67512 ?auto_67510 ) ( not ( = ?auto_67508 ?auto_67512 ) ) ( SURFACE-AT ?auto_67506 ?auto_67510 ) ( ON ?auto_67506 ?auto_67511 ) ( CLEAR ?auto_67506 ) ( not ( = ?auto_67505 ?auto_67511 ) ) ( not ( = ?auto_67506 ?auto_67511 ) ) ( not ( = ?auto_67504 ?auto_67511 ) ) ( IS-CRATE ?auto_67505 ) ( AVAILABLE ?auto_67512 ) ( SURFACE-AT ?auto_67505 ?auto_67510 ) ( ON ?auto_67505 ?auto_67507 ) ( CLEAR ?auto_67505 ) ( not ( = ?auto_67505 ?auto_67507 ) ) ( not ( = ?auto_67506 ?auto_67507 ) ) ( not ( = ?auto_67504 ?auto_67507 ) ) ( not ( = ?auto_67511 ?auto_67507 ) ) ( TRUCK-AT ?auto_67513 ?auto_67514 ) ( SURFACE-AT ?auto_67509 ?auto_67514 ) ( CLEAR ?auto_67509 ) ( LIFTING ?auto_67508 ?auto_67504 ) ( IS-CRATE ?auto_67504 ) ( not ( = ?auto_67509 ?auto_67504 ) ) ( not ( = ?auto_67505 ?auto_67509 ) ) ( not ( = ?auto_67506 ?auto_67509 ) ) ( not ( = ?auto_67511 ?auto_67509 ) ) ( not ( = ?auto_67507 ?auto_67509 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_67505 ?auto_67506 )
      ( MAKE-2CRATE-VERIFY ?auto_67504 ?auto_67505 ?auto_67506 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_67515 - SURFACE
      ?auto_67516 - SURFACE
      ?auto_67517 - SURFACE
      ?auto_67518 - SURFACE
    )
    :vars
    (
      ?auto_67521 - HOIST
      ?auto_67523 - PLACE
      ?auto_67519 - PLACE
      ?auto_67525 - HOIST
      ?auto_67524 - SURFACE
      ?auto_67520 - SURFACE
      ?auto_67522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67521 ?auto_67523 ) ( IS-CRATE ?auto_67518 ) ( not ( = ?auto_67517 ?auto_67518 ) ) ( not ( = ?auto_67516 ?auto_67517 ) ) ( not ( = ?auto_67516 ?auto_67518 ) ) ( not ( = ?auto_67519 ?auto_67523 ) ) ( HOIST-AT ?auto_67525 ?auto_67519 ) ( not ( = ?auto_67521 ?auto_67525 ) ) ( SURFACE-AT ?auto_67518 ?auto_67519 ) ( ON ?auto_67518 ?auto_67524 ) ( CLEAR ?auto_67518 ) ( not ( = ?auto_67517 ?auto_67524 ) ) ( not ( = ?auto_67518 ?auto_67524 ) ) ( not ( = ?auto_67516 ?auto_67524 ) ) ( IS-CRATE ?auto_67517 ) ( AVAILABLE ?auto_67525 ) ( SURFACE-AT ?auto_67517 ?auto_67519 ) ( ON ?auto_67517 ?auto_67520 ) ( CLEAR ?auto_67517 ) ( not ( = ?auto_67517 ?auto_67520 ) ) ( not ( = ?auto_67518 ?auto_67520 ) ) ( not ( = ?auto_67516 ?auto_67520 ) ) ( not ( = ?auto_67524 ?auto_67520 ) ) ( TRUCK-AT ?auto_67522 ?auto_67523 ) ( SURFACE-AT ?auto_67515 ?auto_67523 ) ( CLEAR ?auto_67515 ) ( LIFTING ?auto_67521 ?auto_67516 ) ( IS-CRATE ?auto_67516 ) ( not ( = ?auto_67515 ?auto_67516 ) ) ( not ( = ?auto_67517 ?auto_67515 ) ) ( not ( = ?auto_67518 ?auto_67515 ) ) ( not ( = ?auto_67524 ?auto_67515 ) ) ( not ( = ?auto_67520 ?auto_67515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67516 ?auto_67517 ?auto_67518 )
      ( MAKE-3CRATE-VERIFY ?auto_67515 ?auto_67516 ?auto_67517 ?auto_67518 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_67526 - SURFACE
      ?auto_67527 - SURFACE
      ?auto_67528 - SURFACE
      ?auto_67530 - SURFACE
      ?auto_67529 - SURFACE
    )
    :vars
    (
      ?auto_67533 - HOIST
      ?auto_67535 - PLACE
      ?auto_67531 - PLACE
      ?auto_67537 - HOIST
      ?auto_67536 - SURFACE
      ?auto_67532 - SURFACE
      ?auto_67534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67533 ?auto_67535 ) ( IS-CRATE ?auto_67529 ) ( not ( = ?auto_67530 ?auto_67529 ) ) ( not ( = ?auto_67528 ?auto_67530 ) ) ( not ( = ?auto_67528 ?auto_67529 ) ) ( not ( = ?auto_67531 ?auto_67535 ) ) ( HOIST-AT ?auto_67537 ?auto_67531 ) ( not ( = ?auto_67533 ?auto_67537 ) ) ( SURFACE-AT ?auto_67529 ?auto_67531 ) ( ON ?auto_67529 ?auto_67536 ) ( CLEAR ?auto_67529 ) ( not ( = ?auto_67530 ?auto_67536 ) ) ( not ( = ?auto_67529 ?auto_67536 ) ) ( not ( = ?auto_67528 ?auto_67536 ) ) ( IS-CRATE ?auto_67530 ) ( AVAILABLE ?auto_67537 ) ( SURFACE-AT ?auto_67530 ?auto_67531 ) ( ON ?auto_67530 ?auto_67532 ) ( CLEAR ?auto_67530 ) ( not ( = ?auto_67530 ?auto_67532 ) ) ( not ( = ?auto_67529 ?auto_67532 ) ) ( not ( = ?auto_67528 ?auto_67532 ) ) ( not ( = ?auto_67536 ?auto_67532 ) ) ( TRUCK-AT ?auto_67534 ?auto_67535 ) ( SURFACE-AT ?auto_67527 ?auto_67535 ) ( CLEAR ?auto_67527 ) ( LIFTING ?auto_67533 ?auto_67528 ) ( IS-CRATE ?auto_67528 ) ( not ( = ?auto_67527 ?auto_67528 ) ) ( not ( = ?auto_67530 ?auto_67527 ) ) ( not ( = ?auto_67529 ?auto_67527 ) ) ( not ( = ?auto_67536 ?auto_67527 ) ) ( not ( = ?auto_67532 ?auto_67527 ) ) ( ON ?auto_67527 ?auto_67526 ) ( not ( = ?auto_67526 ?auto_67527 ) ) ( not ( = ?auto_67526 ?auto_67528 ) ) ( not ( = ?auto_67526 ?auto_67530 ) ) ( not ( = ?auto_67526 ?auto_67529 ) ) ( not ( = ?auto_67526 ?auto_67536 ) ) ( not ( = ?auto_67526 ?auto_67532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67528 ?auto_67530 ?auto_67529 )
      ( MAKE-4CRATE-VERIFY ?auto_67526 ?auto_67527 ?auto_67528 ?auto_67530 ?auto_67529 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_67538 - SURFACE
      ?auto_67539 - SURFACE
      ?auto_67540 - SURFACE
      ?auto_67542 - SURFACE
      ?auto_67541 - SURFACE
      ?auto_67543 - SURFACE
    )
    :vars
    (
      ?auto_67546 - HOIST
      ?auto_67548 - PLACE
      ?auto_67544 - PLACE
      ?auto_67550 - HOIST
      ?auto_67549 - SURFACE
      ?auto_67545 - SURFACE
      ?auto_67547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67546 ?auto_67548 ) ( IS-CRATE ?auto_67543 ) ( not ( = ?auto_67541 ?auto_67543 ) ) ( not ( = ?auto_67542 ?auto_67541 ) ) ( not ( = ?auto_67542 ?auto_67543 ) ) ( not ( = ?auto_67544 ?auto_67548 ) ) ( HOIST-AT ?auto_67550 ?auto_67544 ) ( not ( = ?auto_67546 ?auto_67550 ) ) ( SURFACE-AT ?auto_67543 ?auto_67544 ) ( ON ?auto_67543 ?auto_67549 ) ( CLEAR ?auto_67543 ) ( not ( = ?auto_67541 ?auto_67549 ) ) ( not ( = ?auto_67543 ?auto_67549 ) ) ( not ( = ?auto_67542 ?auto_67549 ) ) ( IS-CRATE ?auto_67541 ) ( AVAILABLE ?auto_67550 ) ( SURFACE-AT ?auto_67541 ?auto_67544 ) ( ON ?auto_67541 ?auto_67545 ) ( CLEAR ?auto_67541 ) ( not ( = ?auto_67541 ?auto_67545 ) ) ( not ( = ?auto_67543 ?auto_67545 ) ) ( not ( = ?auto_67542 ?auto_67545 ) ) ( not ( = ?auto_67549 ?auto_67545 ) ) ( TRUCK-AT ?auto_67547 ?auto_67548 ) ( SURFACE-AT ?auto_67540 ?auto_67548 ) ( CLEAR ?auto_67540 ) ( LIFTING ?auto_67546 ?auto_67542 ) ( IS-CRATE ?auto_67542 ) ( not ( = ?auto_67540 ?auto_67542 ) ) ( not ( = ?auto_67541 ?auto_67540 ) ) ( not ( = ?auto_67543 ?auto_67540 ) ) ( not ( = ?auto_67549 ?auto_67540 ) ) ( not ( = ?auto_67545 ?auto_67540 ) ) ( ON ?auto_67539 ?auto_67538 ) ( ON ?auto_67540 ?auto_67539 ) ( not ( = ?auto_67538 ?auto_67539 ) ) ( not ( = ?auto_67538 ?auto_67540 ) ) ( not ( = ?auto_67538 ?auto_67542 ) ) ( not ( = ?auto_67538 ?auto_67541 ) ) ( not ( = ?auto_67538 ?auto_67543 ) ) ( not ( = ?auto_67538 ?auto_67549 ) ) ( not ( = ?auto_67538 ?auto_67545 ) ) ( not ( = ?auto_67539 ?auto_67540 ) ) ( not ( = ?auto_67539 ?auto_67542 ) ) ( not ( = ?auto_67539 ?auto_67541 ) ) ( not ( = ?auto_67539 ?auto_67543 ) ) ( not ( = ?auto_67539 ?auto_67549 ) ) ( not ( = ?auto_67539 ?auto_67545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67542 ?auto_67541 ?auto_67543 )
      ( MAKE-5CRATE-VERIFY ?auto_67538 ?auto_67539 ?auto_67540 ?auto_67542 ?auto_67541 ?auto_67543 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_67551 - SURFACE
      ?auto_67552 - SURFACE
      ?auto_67553 - SURFACE
      ?auto_67555 - SURFACE
      ?auto_67554 - SURFACE
      ?auto_67556 - SURFACE
      ?auto_67557 - SURFACE
    )
    :vars
    (
      ?auto_67560 - HOIST
      ?auto_67562 - PLACE
      ?auto_67558 - PLACE
      ?auto_67564 - HOIST
      ?auto_67563 - SURFACE
      ?auto_67559 - SURFACE
      ?auto_67561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_67560 ?auto_67562 ) ( IS-CRATE ?auto_67557 ) ( not ( = ?auto_67556 ?auto_67557 ) ) ( not ( = ?auto_67554 ?auto_67556 ) ) ( not ( = ?auto_67554 ?auto_67557 ) ) ( not ( = ?auto_67558 ?auto_67562 ) ) ( HOIST-AT ?auto_67564 ?auto_67558 ) ( not ( = ?auto_67560 ?auto_67564 ) ) ( SURFACE-AT ?auto_67557 ?auto_67558 ) ( ON ?auto_67557 ?auto_67563 ) ( CLEAR ?auto_67557 ) ( not ( = ?auto_67556 ?auto_67563 ) ) ( not ( = ?auto_67557 ?auto_67563 ) ) ( not ( = ?auto_67554 ?auto_67563 ) ) ( IS-CRATE ?auto_67556 ) ( AVAILABLE ?auto_67564 ) ( SURFACE-AT ?auto_67556 ?auto_67558 ) ( ON ?auto_67556 ?auto_67559 ) ( CLEAR ?auto_67556 ) ( not ( = ?auto_67556 ?auto_67559 ) ) ( not ( = ?auto_67557 ?auto_67559 ) ) ( not ( = ?auto_67554 ?auto_67559 ) ) ( not ( = ?auto_67563 ?auto_67559 ) ) ( TRUCK-AT ?auto_67561 ?auto_67562 ) ( SURFACE-AT ?auto_67555 ?auto_67562 ) ( CLEAR ?auto_67555 ) ( LIFTING ?auto_67560 ?auto_67554 ) ( IS-CRATE ?auto_67554 ) ( not ( = ?auto_67555 ?auto_67554 ) ) ( not ( = ?auto_67556 ?auto_67555 ) ) ( not ( = ?auto_67557 ?auto_67555 ) ) ( not ( = ?auto_67563 ?auto_67555 ) ) ( not ( = ?auto_67559 ?auto_67555 ) ) ( ON ?auto_67552 ?auto_67551 ) ( ON ?auto_67553 ?auto_67552 ) ( ON ?auto_67555 ?auto_67553 ) ( not ( = ?auto_67551 ?auto_67552 ) ) ( not ( = ?auto_67551 ?auto_67553 ) ) ( not ( = ?auto_67551 ?auto_67555 ) ) ( not ( = ?auto_67551 ?auto_67554 ) ) ( not ( = ?auto_67551 ?auto_67556 ) ) ( not ( = ?auto_67551 ?auto_67557 ) ) ( not ( = ?auto_67551 ?auto_67563 ) ) ( not ( = ?auto_67551 ?auto_67559 ) ) ( not ( = ?auto_67552 ?auto_67553 ) ) ( not ( = ?auto_67552 ?auto_67555 ) ) ( not ( = ?auto_67552 ?auto_67554 ) ) ( not ( = ?auto_67552 ?auto_67556 ) ) ( not ( = ?auto_67552 ?auto_67557 ) ) ( not ( = ?auto_67552 ?auto_67563 ) ) ( not ( = ?auto_67552 ?auto_67559 ) ) ( not ( = ?auto_67553 ?auto_67555 ) ) ( not ( = ?auto_67553 ?auto_67554 ) ) ( not ( = ?auto_67553 ?auto_67556 ) ) ( not ( = ?auto_67553 ?auto_67557 ) ) ( not ( = ?auto_67553 ?auto_67563 ) ) ( not ( = ?auto_67553 ?auto_67559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_67554 ?auto_67556 ?auto_67557 )
      ( MAKE-6CRATE-VERIFY ?auto_67551 ?auto_67552 ?auto_67553 ?auto_67555 ?auto_67554 ?auto_67556 ?auto_67557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_68829 - SURFACE
      ?auto_68830 - SURFACE
    )
    :vars
    (
      ?auto_68832 - HOIST
      ?auto_68833 - PLACE
      ?auto_68831 - SURFACE
      ?auto_68836 - PLACE
      ?auto_68834 - HOIST
      ?auto_68838 - SURFACE
      ?auto_68835 - TRUCK
      ?auto_68837 - SURFACE
      ?auto_68839 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68832 ?auto_68833 ) ( IS-CRATE ?auto_68830 ) ( not ( = ?auto_68829 ?auto_68830 ) ) ( not ( = ?auto_68831 ?auto_68829 ) ) ( not ( = ?auto_68831 ?auto_68830 ) ) ( not ( = ?auto_68836 ?auto_68833 ) ) ( HOIST-AT ?auto_68834 ?auto_68836 ) ( not ( = ?auto_68832 ?auto_68834 ) ) ( SURFACE-AT ?auto_68830 ?auto_68836 ) ( ON ?auto_68830 ?auto_68838 ) ( CLEAR ?auto_68830 ) ( not ( = ?auto_68829 ?auto_68838 ) ) ( not ( = ?auto_68830 ?auto_68838 ) ) ( not ( = ?auto_68831 ?auto_68838 ) ) ( SURFACE-AT ?auto_68831 ?auto_68833 ) ( CLEAR ?auto_68831 ) ( IS-CRATE ?auto_68829 ) ( AVAILABLE ?auto_68832 ) ( TRUCK-AT ?auto_68835 ?auto_68836 ) ( SURFACE-AT ?auto_68829 ?auto_68836 ) ( ON ?auto_68829 ?auto_68837 ) ( CLEAR ?auto_68829 ) ( not ( = ?auto_68829 ?auto_68837 ) ) ( not ( = ?auto_68830 ?auto_68837 ) ) ( not ( = ?auto_68831 ?auto_68837 ) ) ( not ( = ?auto_68838 ?auto_68837 ) ) ( LIFTING ?auto_68834 ?auto_68839 ) ( IS-CRATE ?auto_68839 ) ( not ( = ?auto_68829 ?auto_68839 ) ) ( not ( = ?auto_68830 ?auto_68839 ) ) ( not ( = ?auto_68831 ?auto_68839 ) ) ( not ( = ?auto_68838 ?auto_68839 ) ) ( not ( = ?auto_68837 ?auto_68839 ) ) )
    :subtasks
    ( ( !LOAD ?auto_68834 ?auto_68839 ?auto_68835 ?auto_68836 )
      ( MAKE-2CRATE ?auto_68831 ?auto_68829 ?auto_68830 )
      ( MAKE-1CRATE-VERIFY ?auto_68829 ?auto_68830 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_68840 - SURFACE
      ?auto_68841 - SURFACE
      ?auto_68842 - SURFACE
    )
    :vars
    (
      ?auto_68846 - HOIST
      ?auto_68844 - PLACE
      ?auto_68845 - PLACE
      ?auto_68849 - HOIST
      ?auto_68843 - SURFACE
      ?auto_68850 - TRUCK
      ?auto_68848 - SURFACE
      ?auto_68847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_68846 ?auto_68844 ) ( IS-CRATE ?auto_68842 ) ( not ( = ?auto_68841 ?auto_68842 ) ) ( not ( = ?auto_68840 ?auto_68841 ) ) ( not ( = ?auto_68840 ?auto_68842 ) ) ( not ( = ?auto_68845 ?auto_68844 ) ) ( HOIST-AT ?auto_68849 ?auto_68845 ) ( not ( = ?auto_68846 ?auto_68849 ) ) ( SURFACE-AT ?auto_68842 ?auto_68845 ) ( ON ?auto_68842 ?auto_68843 ) ( CLEAR ?auto_68842 ) ( not ( = ?auto_68841 ?auto_68843 ) ) ( not ( = ?auto_68842 ?auto_68843 ) ) ( not ( = ?auto_68840 ?auto_68843 ) ) ( SURFACE-AT ?auto_68840 ?auto_68844 ) ( CLEAR ?auto_68840 ) ( IS-CRATE ?auto_68841 ) ( AVAILABLE ?auto_68846 ) ( TRUCK-AT ?auto_68850 ?auto_68845 ) ( SURFACE-AT ?auto_68841 ?auto_68845 ) ( ON ?auto_68841 ?auto_68848 ) ( CLEAR ?auto_68841 ) ( not ( = ?auto_68841 ?auto_68848 ) ) ( not ( = ?auto_68842 ?auto_68848 ) ) ( not ( = ?auto_68840 ?auto_68848 ) ) ( not ( = ?auto_68843 ?auto_68848 ) ) ( LIFTING ?auto_68849 ?auto_68847 ) ( IS-CRATE ?auto_68847 ) ( not ( = ?auto_68841 ?auto_68847 ) ) ( not ( = ?auto_68842 ?auto_68847 ) ) ( not ( = ?auto_68840 ?auto_68847 ) ) ( not ( = ?auto_68843 ?auto_68847 ) ) ( not ( = ?auto_68848 ?auto_68847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_68841 ?auto_68842 )
      ( MAKE-2CRATE-VERIFY ?auto_68840 ?auto_68841 ?auto_68842 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69098 - SURFACE
      ?auto_69099 - SURFACE
      ?auto_69100 - SURFACE
      ?auto_69102 - SURFACE
      ?auto_69101 - SURFACE
      ?auto_69103 - SURFACE
      ?auto_69104 - SURFACE
      ?auto_69105 - SURFACE
    )
    :vars
    (
      ?auto_69107 - HOIST
      ?auto_69106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69107 ?auto_69106 ) ( SURFACE-AT ?auto_69104 ?auto_69106 ) ( CLEAR ?auto_69104 ) ( LIFTING ?auto_69107 ?auto_69105 ) ( IS-CRATE ?auto_69105 ) ( not ( = ?auto_69104 ?auto_69105 ) ) ( ON ?auto_69099 ?auto_69098 ) ( ON ?auto_69100 ?auto_69099 ) ( ON ?auto_69102 ?auto_69100 ) ( ON ?auto_69101 ?auto_69102 ) ( ON ?auto_69103 ?auto_69101 ) ( ON ?auto_69104 ?auto_69103 ) ( not ( = ?auto_69098 ?auto_69099 ) ) ( not ( = ?auto_69098 ?auto_69100 ) ) ( not ( = ?auto_69098 ?auto_69102 ) ) ( not ( = ?auto_69098 ?auto_69101 ) ) ( not ( = ?auto_69098 ?auto_69103 ) ) ( not ( = ?auto_69098 ?auto_69104 ) ) ( not ( = ?auto_69098 ?auto_69105 ) ) ( not ( = ?auto_69099 ?auto_69100 ) ) ( not ( = ?auto_69099 ?auto_69102 ) ) ( not ( = ?auto_69099 ?auto_69101 ) ) ( not ( = ?auto_69099 ?auto_69103 ) ) ( not ( = ?auto_69099 ?auto_69104 ) ) ( not ( = ?auto_69099 ?auto_69105 ) ) ( not ( = ?auto_69100 ?auto_69102 ) ) ( not ( = ?auto_69100 ?auto_69101 ) ) ( not ( = ?auto_69100 ?auto_69103 ) ) ( not ( = ?auto_69100 ?auto_69104 ) ) ( not ( = ?auto_69100 ?auto_69105 ) ) ( not ( = ?auto_69102 ?auto_69101 ) ) ( not ( = ?auto_69102 ?auto_69103 ) ) ( not ( = ?auto_69102 ?auto_69104 ) ) ( not ( = ?auto_69102 ?auto_69105 ) ) ( not ( = ?auto_69101 ?auto_69103 ) ) ( not ( = ?auto_69101 ?auto_69104 ) ) ( not ( = ?auto_69101 ?auto_69105 ) ) ( not ( = ?auto_69103 ?auto_69104 ) ) ( not ( = ?auto_69103 ?auto_69105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_69104 ?auto_69105 )
      ( MAKE-7CRATE-VERIFY ?auto_69098 ?auto_69099 ?auto_69100 ?auto_69102 ?auto_69101 ?auto_69103 ?auto_69104 ?auto_69105 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69153 - SURFACE
      ?auto_69154 - SURFACE
      ?auto_69155 - SURFACE
      ?auto_69157 - SURFACE
      ?auto_69156 - SURFACE
      ?auto_69158 - SURFACE
      ?auto_69159 - SURFACE
      ?auto_69160 - SURFACE
    )
    :vars
    (
      ?auto_69163 - HOIST
      ?auto_69162 - PLACE
      ?auto_69161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69163 ?auto_69162 ) ( SURFACE-AT ?auto_69159 ?auto_69162 ) ( CLEAR ?auto_69159 ) ( IS-CRATE ?auto_69160 ) ( not ( = ?auto_69159 ?auto_69160 ) ) ( TRUCK-AT ?auto_69161 ?auto_69162 ) ( AVAILABLE ?auto_69163 ) ( IN ?auto_69160 ?auto_69161 ) ( ON ?auto_69159 ?auto_69158 ) ( not ( = ?auto_69158 ?auto_69159 ) ) ( not ( = ?auto_69158 ?auto_69160 ) ) ( ON ?auto_69154 ?auto_69153 ) ( ON ?auto_69155 ?auto_69154 ) ( ON ?auto_69157 ?auto_69155 ) ( ON ?auto_69156 ?auto_69157 ) ( ON ?auto_69158 ?auto_69156 ) ( not ( = ?auto_69153 ?auto_69154 ) ) ( not ( = ?auto_69153 ?auto_69155 ) ) ( not ( = ?auto_69153 ?auto_69157 ) ) ( not ( = ?auto_69153 ?auto_69156 ) ) ( not ( = ?auto_69153 ?auto_69158 ) ) ( not ( = ?auto_69153 ?auto_69159 ) ) ( not ( = ?auto_69153 ?auto_69160 ) ) ( not ( = ?auto_69154 ?auto_69155 ) ) ( not ( = ?auto_69154 ?auto_69157 ) ) ( not ( = ?auto_69154 ?auto_69156 ) ) ( not ( = ?auto_69154 ?auto_69158 ) ) ( not ( = ?auto_69154 ?auto_69159 ) ) ( not ( = ?auto_69154 ?auto_69160 ) ) ( not ( = ?auto_69155 ?auto_69157 ) ) ( not ( = ?auto_69155 ?auto_69156 ) ) ( not ( = ?auto_69155 ?auto_69158 ) ) ( not ( = ?auto_69155 ?auto_69159 ) ) ( not ( = ?auto_69155 ?auto_69160 ) ) ( not ( = ?auto_69157 ?auto_69156 ) ) ( not ( = ?auto_69157 ?auto_69158 ) ) ( not ( = ?auto_69157 ?auto_69159 ) ) ( not ( = ?auto_69157 ?auto_69160 ) ) ( not ( = ?auto_69156 ?auto_69158 ) ) ( not ( = ?auto_69156 ?auto_69159 ) ) ( not ( = ?auto_69156 ?auto_69160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69158 ?auto_69159 ?auto_69160 )
      ( MAKE-7CRATE-VERIFY ?auto_69153 ?auto_69154 ?auto_69155 ?auto_69157 ?auto_69156 ?auto_69158 ?auto_69159 ?auto_69160 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69216 - SURFACE
      ?auto_69217 - SURFACE
      ?auto_69218 - SURFACE
      ?auto_69220 - SURFACE
      ?auto_69219 - SURFACE
      ?auto_69221 - SURFACE
      ?auto_69222 - SURFACE
      ?auto_69223 - SURFACE
    )
    :vars
    (
      ?auto_69226 - HOIST
      ?auto_69224 - PLACE
      ?auto_69227 - TRUCK
      ?auto_69225 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69226 ?auto_69224 ) ( SURFACE-AT ?auto_69222 ?auto_69224 ) ( CLEAR ?auto_69222 ) ( IS-CRATE ?auto_69223 ) ( not ( = ?auto_69222 ?auto_69223 ) ) ( AVAILABLE ?auto_69226 ) ( IN ?auto_69223 ?auto_69227 ) ( ON ?auto_69222 ?auto_69221 ) ( not ( = ?auto_69221 ?auto_69222 ) ) ( not ( = ?auto_69221 ?auto_69223 ) ) ( TRUCK-AT ?auto_69227 ?auto_69225 ) ( not ( = ?auto_69225 ?auto_69224 ) ) ( ON ?auto_69217 ?auto_69216 ) ( ON ?auto_69218 ?auto_69217 ) ( ON ?auto_69220 ?auto_69218 ) ( ON ?auto_69219 ?auto_69220 ) ( ON ?auto_69221 ?auto_69219 ) ( not ( = ?auto_69216 ?auto_69217 ) ) ( not ( = ?auto_69216 ?auto_69218 ) ) ( not ( = ?auto_69216 ?auto_69220 ) ) ( not ( = ?auto_69216 ?auto_69219 ) ) ( not ( = ?auto_69216 ?auto_69221 ) ) ( not ( = ?auto_69216 ?auto_69222 ) ) ( not ( = ?auto_69216 ?auto_69223 ) ) ( not ( = ?auto_69217 ?auto_69218 ) ) ( not ( = ?auto_69217 ?auto_69220 ) ) ( not ( = ?auto_69217 ?auto_69219 ) ) ( not ( = ?auto_69217 ?auto_69221 ) ) ( not ( = ?auto_69217 ?auto_69222 ) ) ( not ( = ?auto_69217 ?auto_69223 ) ) ( not ( = ?auto_69218 ?auto_69220 ) ) ( not ( = ?auto_69218 ?auto_69219 ) ) ( not ( = ?auto_69218 ?auto_69221 ) ) ( not ( = ?auto_69218 ?auto_69222 ) ) ( not ( = ?auto_69218 ?auto_69223 ) ) ( not ( = ?auto_69220 ?auto_69219 ) ) ( not ( = ?auto_69220 ?auto_69221 ) ) ( not ( = ?auto_69220 ?auto_69222 ) ) ( not ( = ?auto_69220 ?auto_69223 ) ) ( not ( = ?auto_69219 ?auto_69221 ) ) ( not ( = ?auto_69219 ?auto_69222 ) ) ( not ( = ?auto_69219 ?auto_69223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69221 ?auto_69222 ?auto_69223 )
      ( MAKE-7CRATE-VERIFY ?auto_69216 ?auto_69217 ?auto_69218 ?auto_69220 ?auto_69219 ?auto_69221 ?auto_69222 ?auto_69223 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69286 - SURFACE
      ?auto_69287 - SURFACE
      ?auto_69288 - SURFACE
      ?auto_69290 - SURFACE
      ?auto_69289 - SURFACE
      ?auto_69291 - SURFACE
      ?auto_69292 - SURFACE
      ?auto_69293 - SURFACE
    )
    :vars
    (
      ?auto_69297 - HOIST
      ?auto_69296 - PLACE
      ?auto_69294 - TRUCK
      ?auto_69295 - PLACE
      ?auto_69298 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_69297 ?auto_69296 ) ( SURFACE-AT ?auto_69292 ?auto_69296 ) ( CLEAR ?auto_69292 ) ( IS-CRATE ?auto_69293 ) ( not ( = ?auto_69292 ?auto_69293 ) ) ( AVAILABLE ?auto_69297 ) ( ON ?auto_69292 ?auto_69291 ) ( not ( = ?auto_69291 ?auto_69292 ) ) ( not ( = ?auto_69291 ?auto_69293 ) ) ( TRUCK-AT ?auto_69294 ?auto_69295 ) ( not ( = ?auto_69295 ?auto_69296 ) ) ( HOIST-AT ?auto_69298 ?auto_69295 ) ( LIFTING ?auto_69298 ?auto_69293 ) ( not ( = ?auto_69297 ?auto_69298 ) ) ( ON ?auto_69287 ?auto_69286 ) ( ON ?auto_69288 ?auto_69287 ) ( ON ?auto_69290 ?auto_69288 ) ( ON ?auto_69289 ?auto_69290 ) ( ON ?auto_69291 ?auto_69289 ) ( not ( = ?auto_69286 ?auto_69287 ) ) ( not ( = ?auto_69286 ?auto_69288 ) ) ( not ( = ?auto_69286 ?auto_69290 ) ) ( not ( = ?auto_69286 ?auto_69289 ) ) ( not ( = ?auto_69286 ?auto_69291 ) ) ( not ( = ?auto_69286 ?auto_69292 ) ) ( not ( = ?auto_69286 ?auto_69293 ) ) ( not ( = ?auto_69287 ?auto_69288 ) ) ( not ( = ?auto_69287 ?auto_69290 ) ) ( not ( = ?auto_69287 ?auto_69289 ) ) ( not ( = ?auto_69287 ?auto_69291 ) ) ( not ( = ?auto_69287 ?auto_69292 ) ) ( not ( = ?auto_69287 ?auto_69293 ) ) ( not ( = ?auto_69288 ?auto_69290 ) ) ( not ( = ?auto_69288 ?auto_69289 ) ) ( not ( = ?auto_69288 ?auto_69291 ) ) ( not ( = ?auto_69288 ?auto_69292 ) ) ( not ( = ?auto_69288 ?auto_69293 ) ) ( not ( = ?auto_69290 ?auto_69289 ) ) ( not ( = ?auto_69290 ?auto_69291 ) ) ( not ( = ?auto_69290 ?auto_69292 ) ) ( not ( = ?auto_69290 ?auto_69293 ) ) ( not ( = ?auto_69289 ?auto_69291 ) ) ( not ( = ?auto_69289 ?auto_69292 ) ) ( not ( = ?auto_69289 ?auto_69293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69291 ?auto_69292 ?auto_69293 )
      ( MAKE-7CRATE-VERIFY ?auto_69286 ?auto_69287 ?auto_69288 ?auto_69290 ?auto_69289 ?auto_69291 ?auto_69292 ?auto_69293 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69363 - SURFACE
      ?auto_69364 - SURFACE
      ?auto_69365 - SURFACE
      ?auto_69367 - SURFACE
      ?auto_69366 - SURFACE
      ?auto_69368 - SURFACE
      ?auto_69369 - SURFACE
      ?auto_69370 - SURFACE
    )
    :vars
    (
      ?auto_69374 - HOIST
      ?auto_69376 - PLACE
      ?auto_69371 - TRUCK
      ?auto_69372 - PLACE
      ?auto_69373 - HOIST
      ?auto_69375 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_69374 ?auto_69376 ) ( SURFACE-AT ?auto_69369 ?auto_69376 ) ( CLEAR ?auto_69369 ) ( IS-CRATE ?auto_69370 ) ( not ( = ?auto_69369 ?auto_69370 ) ) ( AVAILABLE ?auto_69374 ) ( ON ?auto_69369 ?auto_69368 ) ( not ( = ?auto_69368 ?auto_69369 ) ) ( not ( = ?auto_69368 ?auto_69370 ) ) ( TRUCK-AT ?auto_69371 ?auto_69372 ) ( not ( = ?auto_69372 ?auto_69376 ) ) ( HOIST-AT ?auto_69373 ?auto_69372 ) ( not ( = ?auto_69374 ?auto_69373 ) ) ( AVAILABLE ?auto_69373 ) ( SURFACE-AT ?auto_69370 ?auto_69372 ) ( ON ?auto_69370 ?auto_69375 ) ( CLEAR ?auto_69370 ) ( not ( = ?auto_69369 ?auto_69375 ) ) ( not ( = ?auto_69370 ?auto_69375 ) ) ( not ( = ?auto_69368 ?auto_69375 ) ) ( ON ?auto_69364 ?auto_69363 ) ( ON ?auto_69365 ?auto_69364 ) ( ON ?auto_69367 ?auto_69365 ) ( ON ?auto_69366 ?auto_69367 ) ( ON ?auto_69368 ?auto_69366 ) ( not ( = ?auto_69363 ?auto_69364 ) ) ( not ( = ?auto_69363 ?auto_69365 ) ) ( not ( = ?auto_69363 ?auto_69367 ) ) ( not ( = ?auto_69363 ?auto_69366 ) ) ( not ( = ?auto_69363 ?auto_69368 ) ) ( not ( = ?auto_69363 ?auto_69369 ) ) ( not ( = ?auto_69363 ?auto_69370 ) ) ( not ( = ?auto_69363 ?auto_69375 ) ) ( not ( = ?auto_69364 ?auto_69365 ) ) ( not ( = ?auto_69364 ?auto_69367 ) ) ( not ( = ?auto_69364 ?auto_69366 ) ) ( not ( = ?auto_69364 ?auto_69368 ) ) ( not ( = ?auto_69364 ?auto_69369 ) ) ( not ( = ?auto_69364 ?auto_69370 ) ) ( not ( = ?auto_69364 ?auto_69375 ) ) ( not ( = ?auto_69365 ?auto_69367 ) ) ( not ( = ?auto_69365 ?auto_69366 ) ) ( not ( = ?auto_69365 ?auto_69368 ) ) ( not ( = ?auto_69365 ?auto_69369 ) ) ( not ( = ?auto_69365 ?auto_69370 ) ) ( not ( = ?auto_69365 ?auto_69375 ) ) ( not ( = ?auto_69367 ?auto_69366 ) ) ( not ( = ?auto_69367 ?auto_69368 ) ) ( not ( = ?auto_69367 ?auto_69369 ) ) ( not ( = ?auto_69367 ?auto_69370 ) ) ( not ( = ?auto_69367 ?auto_69375 ) ) ( not ( = ?auto_69366 ?auto_69368 ) ) ( not ( = ?auto_69366 ?auto_69369 ) ) ( not ( = ?auto_69366 ?auto_69370 ) ) ( not ( = ?auto_69366 ?auto_69375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69368 ?auto_69369 ?auto_69370 )
      ( MAKE-7CRATE-VERIFY ?auto_69363 ?auto_69364 ?auto_69365 ?auto_69367 ?auto_69366 ?auto_69368 ?auto_69369 ?auto_69370 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69441 - SURFACE
      ?auto_69442 - SURFACE
      ?auto_69443 - SURFACE
      ?auto_69445 - SURFACE
      ?auto_69444 - SURFACE
      ?auto_69446 - SURFACE
      ?auto_69447 - SURFACE
      ?auto_69448 - SURFACE
    )
    :vars
    (
      ?auto_69453 - HOIST
      ?auto_69450 - PLACE
      ?auto_69454 - PLACE
      ?auto_69452 - HOIST
      ?auto_69451 - SURFACE
      ?auto_69449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69453 ?auto_69450 ) ( SURFACE-AT ?auto_69447 ?auto_69450 ) ( CLEAR ?auto_69447 ) ( IS-CRATE ?auto_69448 ) ( not ( = ?auto_69447 ?auto_69448 ) ) ( AVAILABLE ?auto_69453 ) ( ON ?auto_69447 ?auto_69446 ) ( not ( = ?auto_69446 ?auto_69447 ) ) ( not ( = ?auto_69446 ?auto_69448 ) ) ( not ( = ?auto_69454 ?auto_69450 ) ) ( HOIST-AT ?auto_69452 ?auto_69454 ) ( not ( = ?auto_69453 ?auto_69452 ) ) ( AVAILABLE ?auto_69452 ) ( SURFACE-AT ?auto_69448 ?auto_69454 ) ( ON ?auto_69448 ?auto_69451 ) ( CLEAR ?auto_69448 ) ( not ( = ?auto_69447 ?auto_69451 ) ) ( not ( = ?auto_69448 ?auto_69451 ) ) ( not ( = ?auto_69446 ?auto_69451 ) ) ( TRUCK-AT ?auto_69449 ?auto_69450 ) ( ON ?auto_69442 ?auto_69441 ) ( ON ?auto_69443 ?auto_69442 ) ( ON ?auto_69445 ?auto_69443 ) ( ON ?auto_69444 ?auto_69445 ) ( ON ?auto_69446 ?auto_69444 ) ( not ( = ?auto_69441 ?auto_69442 ) ) ( not ( = ?auto_69441 ?auto_69443 ) ) ( not ( = ?auto_69441 ?auto_69445 ) ) ( not ( = ?auto_69441 ?auto_69444 ) ) ( not ( = ?auto_69441 ?auto_69446 ) ) ( not ( = ?auto_69441 ?auto_69447 ) ) ( not ( = ?auto_69441 ?auto_69448 ) ) ( not ( = ?auto_69441 ?auto_69451 ) ) ( not ( = ?auto_69442 ?auto_69443 ) ) ( not ( = ?auto_69442 ?auto_69445 ) ) ( not ( = ?auto_69442 ?auto_69444 ) ) ( not ( = ?auto_69442 ?auto_69446 ) ) ( not ( = ?auto_69442 ?auto_69447 ) ) ( not ( = ?auto_69442 ?auto_69448 ) ) ( not ( = ?auto_69442 ?auto_69451 ) ) ( not ( = ?auto_69443 ?auto_69445 ) ) ( not ( = ?auto_69443 ?auto_69444 ) ) ( not ( = ?auto_69443 ?auto_69446 ) ) ( not ( = ?auto_69443 ?auto_69447 ) ) ( not ( = ?auto_69443 ?auto_69448 ) ) ( not ( = ?auto_69443 ?auto_69451 ) ) ( not ( = ?auto_69445 ?auto_69444 ) ) ( not ( = ?auto_69445 ?auto_69446 ) ) ( not ( = ?auto_69445 ?auto_69447 ) ) ( not ( = ?auto_69445 ?auto_69448 ) ) ( not ( = ?auto_69445 ?auto_69451 ) ) ( not ( = ?auto_69444 ?auto_69446 ) ) ( not ( = ?auto_69444 ?auto_69447 ) ) ( not ( = ?auto_69444 ?auto_69448 ) ) ( not ( = ?auto_69444 ?auto_69451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69446 ?auto_69447 ?auto_69448 )
      ( MAKE-7CRATE-VERIFY ?auto_69441 ?auto_69442 ?auto_69443 ?auto_69445 ?auto_69444 ?auto_69446 ?auto_69447 ?auto_69448 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69519 - SURFACE
      ?auto_69520 - SURFACE
      ?auto_69521 - SURFACE
      ?auto_69523 - SURFACE
      ?auto_69522 - SURFACE
      ?auto_69524 - SURFACE
      ?auto_69525 - SURFACE
      ?auto_69526 - SURFACE
    )
    :vars
    (
      ?auto_69527 - HOIST
      ?auto_69530 - PLACE
      ?auto_69532 - PLACE
      ?auto_69529 - HOIST
      ?auto_69531 - SURFACE
      ?auto_69528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69527 ?auto_69530 ) ( IS-CRATE ?auto_69526 ) ( not ( = ?auto_69525 ?auto_69526 ) ) ( not ( = ?auto_69524 ?auto_69525 ) ) ( not ( = ?auto_69524 ?auto_69526 ) ) ( not ( = ?auto_69532 ?auto_69530 ) ) ( HOIST-AT ?auto_69529 ?auto_69532 ) ( not ( = ?auto_69527 ?auto_69529 ) ) ( AVAILABLE ?auto_69529 ) ( SURFACE-AT ?auto_69526 ?auto_69532 ) ( ON ?auto_69526 ?auto_69531 ) ( CLEAR ?auto_69526 ) ( not ( = ?auto_69525 ?auto_69531 ) ) ( not ( = ?auto_69526 ?auto_69531 ) ) ( not ( = ?auto_69524 ?auto_69531 ) ) ( TRUCK-AT ?auto_69528 ?auto_69530 ) ( SURFACE-AT ?auto_69524 ?auto_69530 ) ( CLEAR ?auto_69524 ) ( LIFTING ?auto_69527 ?auto_69525 ) ( IS-CRATE ?auto_69525 ) ( ON ?auto_69520 ?auto_69519 ) ( ON ?auto_69521 ?auto_69520 ) ( ON ?auto_69523 ?auto_69521 ) ( ON ?auto_69522 ?auto_69523 ) ( ON ?auto_69524 ?auto_69522 ) ( not ( = ?auto_69519 ?auto_69520 ) ) ( not ( = ?auto_69519 ?auto_69521 ) ) ( not ( = ?auto_69519 ?auto_69523 ) ) ( not ( = ?auto_69519 ?auto_69522 ) ) ( not ( = ?auto_69519 ?auto_69524 ) ) ( not ( = ?auto_69519 ?auto_69525 ) ) ( not ( = ?auto_69519 ?auto_69526 ) ) ( not ( = ?auto_69519 ?auto_69531 ) ) ( not ( = ?auto_69520 ?auto_69521 ) ) ( not ( = ?auto_69520 ?auto_69523 ) ) ( not ( = ?auto_69520 ?auto_69522 ) ) ( not ( = ?auto_69520 ?auto_69524 ) ) ( not ( = ?auto_69520 ?auto_69525 ) ) ( not ( = ?auto_69520 ?auto_69526 ) ) ( not ( = ?auto_69520 ?auto_69531 ) ) ( not ( = ?auto_69521 ?auto_69523 ) ) ( not ( = ?auto_69521 ?auto_69522 ) ) ( not ( = ?auto_69521 ?auto_69524 ) ) ( not ( = ?auto_69521 ?auto_69525 ) ) ( not ( = ?auto_69521 ?auto_69526 ) ) ( not ( = ?auto_69521 ?auto_69531 ) ) ( not ( = ?auto_69523 ?auto_69522 ) ) ( not ( = ?auto_69523 ?auto_69524 ) ) ( not ( = ?auto_69523 ?auto_69525 ) ) ( not ( = ?auto_69523 ?auto_69526 ) ) ( not ( = ?auto_69523 ?auto_69531 ) ) ( not ( = ?auto_69522 ?auto_69524 ) ) ( not ( = ?auto_69522 ?auto_69525 ) ) ( not ( = ?auto_69522 ?auto_69526 ) ) ( not ( = ?auto_69522 ?auto_69531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69524 ?auto_69525 ?auto_69526 )
      ( MAKE-7CRATE-VERIFY ?auto_69519 ?auto_69520 ?auto_69521 ?auto_69523 ?auto_69522 ?auto_69524 ?auto_69525 ?auto_69526 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_69597 - SURFACE
      ?auto_69598 - SURFACE
      ?auto_69599 - SURFACE
      ?auto_69601 - SURFACE
      ?auto_69600 - SURFACE
      ?auto_69602 - SURFACE
      ?auto_69603 - SURFACE
      ?auto_69604 - SURFACE
    )
    :vars
    (
      ?auto_69609 - HOIST
      ?auto_69607 - PLACE
      ?auto_69610 - PLACE
      ?auto_69605 - HOIST
      ?auto_69608 - SURFACE
      ?auto_69606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_69609 ?auto_69607 ) ( IS-CRATE ?auto_69604 ) ( not ( = ?auto_69603 ?auto_69604 ) ) ( not ( = ?auto_69602 ?auto_69603 ) ) ( not ( = ?auto_69602 ?auto_69604 ) ) ( not ( = ?auto_69610 ?auto_69607 ) ) ( HOIST-AT ?auto_69605 ?auto_69610 ) ( not ( = ?auto_69609 ?auto_69605 ) ) ( AVAILABLE ?auto_69605 ) ( SURFACE-AT ?auto_69604 ?auto_69610 ) ( ON ?auto_69604 ?auto_69608 ) ( CLEAR ?auto_69604 ) ( not ( = ?auto_69603 ?auto_69608 ) ) ( not ( = ?auto_69604 ?auto_69608 ) ) ( not ( = ?auto_69602 ?auto_69608 ) ) ( TRUCK-AT ?auto_69606 ?auto_69607 ) ( SURFACE-AT ?auto_69602 ?auto_69607 ) ( CLEAR ?auto_69602 ) ( IS-CRATE ?auto_69603 ) ( AVAILABLE ?auto_69609 ) ( IN ?auto_69603 ?auto_69606 ) ( ON ?auto_69598 ?auto_69597 ) ( ON ?auto_69599 ?auto_69598 ) ( ON ?auto_69601 ?auto_69599 ) ( ON ?auto_69600 ?auto_69601 ) ( ON ?auto_69602 ?auto_69600 ) ( not ( = ?auto_69597 ?auto_69598 ) ) ( not ( = ?auto_69597 ?auto_69599 ) ) ( not ( = ?auto_69597 ?auto_69601 ) ) ( not ( = ?auto_69597 ?auto_69600 ) ) ( not ( = ?auto_69597 ?auto_69602 ) ) ( not ( = ?auto_69597 ?auto_69603 ) ) ( not ( = ?auto_69597 ?auto_69604 ) ) ( not ( = ?auto_69597 ?auto_69608 ) ) ( not ( = ?auto_69598 ?auto_69599 ) ) ( not ( = ?auto_69598 ?auto_69601 ) ) ( not ( = ?auto_69598 ?auto_69600 ) ) ( not ( = ?auto_69598 ?auto_69602 ) ) ( not ( = ?auto_69598 ?auto_69603 ) ) ( not ( = ?auto_69598 ?auto_69604 ) ) ( not ( = ?auto_69598 ?auto_69608 ) ) ( not ( = ?auto_69599 ?auto_69601 ) ) ( not ( = ?auto_69599 ?auto_69600 ) ) ( not ( = ?auto_69599 ?auto_69602 ) ) ( not ( = ?auto_69599 ?auto_69603 ) ) ( not ( = ?auto_69599 ?auto_69604 ) ) ( not ( = ?auto_69599 ?auto_69608 ) ) ( not ( = ?auto_69601 ?auto_69600 ) ) ( not ( = ?auto_69601 ?auto_69602 ) ) ( not ( = ?auto_69601 ?auto_69603 ) ) ( not ( = ?auto_69601 ?auto_69604 ) ) ( not ( = ?auto_69601 ?auto_69608 ) ) ( not ( = ?auto_69600 ?auto_69602 ) ) ( not ( = ?auto_69600 ?auto_69603 ) ) ( not ( = ?auto_69600 ?auto_69604 ) ) ( not ( = ?auto_69600 ?auto_69608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_69602 ?auto_69603 ?auto_69604 )
      ( MAKE-7CRATE-VERIFY ?auto_69597 ?auto_69598 ?auto_69599 ?auto_69601 ?auto_69600 ?auto_69602 ?auto_69603 ?auto_69604 ) )
  )

)

