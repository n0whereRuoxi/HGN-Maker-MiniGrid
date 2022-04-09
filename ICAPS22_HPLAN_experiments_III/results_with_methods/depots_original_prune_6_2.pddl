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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38690 - SURFACE
      ?auto_38691 - SURFACE
    )
    :vars
    (
      ?auto_38692 - HOIST
      ?auto_38693 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38692 ?auto_38693 ) ( SURFACE-AT ?auto_38690 ?auto_38693 ) ( CLEAR ?auto_38690 ) ( LIFTING ?auto_38692 ?auto_38691 ) ( IS-CRATE ?auto_38691 ) ( not ( = ?auto_38690 ?auto_38691 ) ) )
    :subtasks
    ( ( !DROP ?auto_38692 ?auto_38691 ?auto_38690 ?auto_38693 )
      ( MAKE-1CRATE-VERIFY ?auto_38690 ?auto_38691 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38694 - SURFACE
      ?auto_38695 - SURFACE
    )
    :vars
    (
      ?auto_38697 - HOIST
      ?auto_38696 - PLACE
      ?auto_38698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38697 ?auto_38696 ) ( SURFACE-AT ?auto_38694 ?auto_38696 ) ( CLEAR ?auto_38694 ) ( IS-CRATE ?auto_38695 ) ( not ( = ?auto_38694 ?auto_38695 ) ) ( TRUCK-AT ?auto_38698 ?auto_38696 ) ( AVAILABLE ?auto_38697 ) ( IN ?auto_38695 ?auto_38698 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38697 ?auto_38695 ?auto_38698 ?auto_38696 )
      ( MAKE-1CRATE ?auto_38694 ?auto_38695 )
      ( MAKE-1CRATE-VERIFY ?auto_38694 ?auto_38695 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38699 - SURFACE
      ?auto_38700 - SURFACE
    )
    :vars
    (
      ?auto_38702 - HOIST
      ?auto_38701 - PLACE
      ?auto_38703 - TRUCK
      ?auto_38704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38702 ?auto_38701 ) ( SURFACE-AT ?auto_38699 ?auto_38701 ) ( CLEAR ?auto_38699 ) ( IS-CRATE ?auto_38700 ) ( not ( = ?auto_38699 ?auto_38700 ) ) ( AVAILABLE ?auto_38702 ) ( IN ?auto_38700 ?auto_38703 ) ( TRUCK-AT ?auto_38703 ?auto_38704 ) ( not ( = ?auto_38704 ?auto_38701 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38703 ?auto_38704 ?auto_38701 )
      ( MAKE-1CRATE ?auto_38699 ?auto_38700 )
      ( MAKE-1CRATE-VERIFY ?auto_38699 ?auto_38700 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38705 - SURFACE
      ?auto_38706 - SURFACE
    )
    :vars
    (
      ?auto_38710 - HOIST
      ?auto_38708 - PLACE
      ?auto_38707 - TRUCK
      ?auto_38709 - PLACE
      ?auto_38711 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38710 ?auto_38708 ) ( SURFACE-AT ?auto_38705 ?auto_38708 ) ( CLEAR ?auto_38705 ) ( IS-CRATE ?auto_38706 ) ( not ( = ?auto_38705 ?auto_38706 ) ) ( AVAILABLE ?auto_38710 ) ( TRUCK-AT ?auto_38707 ?auto_38709 ) ( not ( = ?auto_38709 ?auto_38708 ) ) ( HOIST-AT ?auto_38711 ?auto_38709 ) ( LIFTING ?auto_38711 ?auto_38706 ) ( not ( = ?auto_38710 ?auto_38711 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38711 ?auto_38706 ?auto_38707 ?auto_38709 )
      ( MAKE-1CRATE ?auto_38705 ?auto_38706 )
      ( MAKE-1CRATE-VERIFY ?auto_38705 ?auto_38706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38712 - SURFACE
      ?auto_38713 - SURFACE
    )
    :vars
    (
      ?auto_38714 - HOIST
      ?auto_38717 - PLACE
      ?auto_38715 - TRUCK
      ?auto_38716 - PLACE
      ?auto_38718 - HOIST
      ?auto_38719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38714 ?auto_38717 ) ( SURFACE-AT ?auto_38712 ?auto_38717 ) ( CLEAR ?auto_38712 ) ( IS-CRATE ?auto_38713 ) ( not ( = ?auto_38712 ?auto_38713 ) ) ( AVAILABLE ?auto_38714 ) ( TRUCK-AT ?auto_38715 ?auto_38716 ) ( not ( = ?auto_38716 ?auto_38717 ) ) ( HOIST-AT ?auto_38718 ?auto_38716 ) ( not ( = ?auto_38714 ?auto_38718 ) ) ( AVAILABLE ?auto_38718 ) ( SURFACE-AT ?auto_38713 ?auto_38716 ) ( ON ?auto_38713 ?auto_38719 ) ( CLEAR ?auto_38713 ) ( not ( = ?auto_38712 ?auto_38719 ) ) ( not ( = ?auto_38713 ?auto_38719 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38718 ?auto_38713 ?auto_38719 ?auto_38716 )
      ( MAKE-1CRATE ?auto_38712 ?auto_38713 )
      ( MAKE-1CRATE-VERIFY ?auto_38712 ?auto_38713 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38720 - SURFACE
      ?auto_38721 - SURFACE
    )
    :vars
    (
      ?auto_38723 - HOIST
      ?auto_38725 - PLACE
      ?auto_38726 - PLACE
      ?auto_38722 - HOIST
      ?auto_38724 - SURFACE
      ?auto_38727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38723 ?auto_38725 ) ( SURFACE-AT ?auto_38720 ?auto_38725 ) ( CLEAR ?auto_38720 ) ( IS-CRATE ?auto_38721 ) ( not ( = ?auto_38720 ?auto_38721 ) ) ( AVAILABLE ?auto_38723 ) ( not ( = ?auto_38726 ?auto_38725 ) ) ( HOIST-AT ?auto_38722 ?auto_38726 ) ( not ( = ?auto_38723 ?auto_38722 ) ) ( AVAILABLE ?auto_38722 ) ( SURFACE-AT ?auto_38721 ?auto_38726 ) ( ON ?auto_38721 ?auto_38724 ) ( CLEAR ?auto_38721 ) ( not ( = ?auto_38720 ?auto_38724 ) ) ( not ( = ?auto_38721 ?auto_38724 ) ) ( TRUCK-AT ?auto_38727 ?auto_38725 ) )
    :subtasks
    ( ( !DRIVE ?auto_38727 ?auto_38725 ?auto_38726 )
      ( MAKE-1CRATE ?auto_38720 ?auto_38721 )
      ( MAKE-1CRATE-VERIFY ?auto_38720 ?auto_38721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38737 - SURFACE
      ?auto_38738 - SURFACE
      ?auto_38739 - SURFACE
    )
    :vars
    (
      ?auto_38740 - HOIST
      ?auto_38741 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38740 ?auto_38741 ) ( SURFACE-AT ?auto_38738 ?auto_38741 ) ( CLEAR ?auto_38738 ) ( LIFTING ?auto_38740 ?auto_38739 ) ( IS-CRATE ?auto_38739 ) ( not ( = ?auto_38738 ?auto_38739 ) ) ( ON ?auto_38738 ?auto_38737 ) ( not ( = ?auto_38737 ?auto_38738 ) ) ( not ( = ?auto_38737 ?auto_38739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38738 ?auto_38739 )
      ( MAKE-2CRATE-VERIFY ?auto_38737 ?auto_38738 ?auto_38739 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38747 - SURFACE
      ?auto_38748 - SURFACE
      ?auto_38749 - SURFACE
    )
    :vars
    (
      ?auto_38751 - HOIST
      ?auto_38752 - PLACE
      ?auto_38750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38751 ?auto_38752 ) ( SURFACE-AT ?auto_38748 ?auto_38752 ) ( CLEAR ?auto_38748 ) ( IS-CRATE ?auto_38749 ) ( not ( = ?auto_38748 ?auto_38749 ) ) ( TRUCK-AT ?auto_38750 ?auto_38752 ) ( AVAILABLE ?auto_38751 ) ( IN ?auto_38749 ?auto_38750 ) ( ON ?auto_38748 ?auto_38747 ) ( not ( = ?auto_38747 ?auto_38748 ) ) ( not ( = ?auto_38747 ?auto_38749 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38748 ?auto_38749 )
      ( MAKE-2CRATE-VERIFY ?auto_38747 ?auto_38748 ?auto_38749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38753 - SURFACE
      ?auto_38754 - SURFACE
    )
    :vars
    (
      ?auto_38757 - HOIST
      ?auto_38755 - PLACE
      ?auto_38756 - TRUCK
      ?auto_38758 - SURFACE
      ?auto_38759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38757 ?auto_38755 ) ( SURFACE-AT ?auto_38753 ?auto_38755 ) ( CLEAR ?auto_38753 ) ( IS-CRATE ?auto_38754 ) ( not ( = ?auto_38753 ?auto_38754 ) ) ( AVAILABLE ?auto_38757 ) ( IN ?auto_38754 ?auto_38756 ) ( ON ?auto_38753 ?auto_38758 ) ( not ( = ?auto_38758 ?auto_38753 ) ) ( not ( = ?auto_38758 ?auto_38754 ) ) ( TRUCK-AT ?auto_38756 ?auto_38759 ) ( not ( = ?auto_38759 ?auto_38755 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38756 ?auto_38759 ?auto_38755 )
      ( MAKE-2CRATE ?auto_38758 ?auto_38753 ?auto_38754 )
      ( MAKE-1CRATE-VERIFY ?auto_38753 ?auto_38754 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38760 - SURFACE
      ?auto_38761 - SURFACE
      ?auto_38762 - SURFACE
    )
    :vars
    (
      ?auto_38763 - HOIST
      ?auto_38764 - PLACE
      ?auto_38765 - TRUCK
      ?auto_38766 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38763 ?auto_38764 ) ( SURFACE-AT ?auto_38761 ?auto_38764 ) ( CLEAR ?auto_38761 ) ( IS-CRATE ?auto_38762 ) ( not ( = ?auto_38761 ?auto_38762 ) ) ( AVAILABLE ?auto_38763 ) ( IN ?auto_38762 ?auto_38765 ) ( ON ?auto_38761 ?auto_38760 ) ( not ( = ?auto_38760 ?auto_38761 ) ) ( not ( = ?auto_38760 ?auto_38762 ) ) ( TRUCK-AT ?auto_38765 ?auto_38766 ) ( not ( = ?auto_38766 ?auto_38764 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38761 ?auto_38762 )
      ( MAKE-2CRATE-VERIFY ?auto_38760 ?auto_38761 ?auto_38762 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38767 - SURFACE
      ?auto_38768 - SURFACE
    )
    :vars
    (
      ?auto_38771 - HOIST
      ?auto_38770 - PLACE
      ?auto_38773 - SURFACE
      ?auto_38772 - TRUCK
      ?auto_38769 - PLACE
      ?auto_38774 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38771 ?auto_38770 ) ( SURFACE-AT ?auto_38767 ?auto_38770 ) ( CLEAR ?auto_38767 ) ( IS-CRATE ?auto_38768 ) ( not ( = ?auto_38767 ?auto_38768 ) ) ( AVAILABLE ?auto_38771 ) ( ON ?auto_38767 ?auto_38773 ) ( not ( = ?auto_38773 ?auto_38767 ) ) ( not ( = ?auto_38773 ?auto_38768 ) ) ( TRUCK-AT ?auto_38772 ?auto_38769 ) ( not ( = ?auto_38769 ?auto_38770 ) ) ( HOIST-AT ?auto_38774 ?auto_38769 ) ( LIFTING ?auto_38774 ?auto_38768 ) ( not ( = ?auto_38771 ?auto_38774 ) ) )
    :subtasks
    ( ( !LOAD ?auto_38774 ?auto_38768 ?auto_38772 ?auto_38769 )
      ( MAKE-2CRATE ?auto_38773 ?auto_38767 ?auto_38768 )
      ( MAKE-1CRATE-VERIFY ?auto_38767 ?auto_38768 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38775 - SURFACE
      ?auto_38776 - SURFACE
      ?auto_38777 - SURFACE
    )
    :vars
    (
      ?auto_38779 - HOIST
      ?auto_38782 - PLACE
      ?auto_38780 - TRUCK
      ?auto_38778 - PLACE
      ?auto_38781 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38779 ?auto_38782 ) ( SURFACE-AT ?auto_38776 ?auto_38782 ) ( CLEAR ?auto_38776 ) ( IS-CRATE ?auto_38777 ) ( not ( = ?auto_38776 ?auto_38777 ) ) ( AVAILABLE ?auto_38779 ) ( ON ?auto_38776 ?auto_38775 ) ( not ( = ?auto_38775 ?auto_38776 ) ) ( not ( = ?auto_38775 ?auto_38777 ) ) ( TRUCK-AT ?auto_38780 ?auto_38778 ) ( not ( = ?auto_38778 ?auto_38782 ) ) ( HOIST-AT ?auto_38781 ?auto_38778 ) ( LIFTING ?auto_38781 ?auto_38777 ) ( not ( = ?auto_38779 ?auto_38781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38776 ?auto_38777 )
      ( MAKE-2CRATE-VERIFY ?auto_38775 ?auto_38776 ?auto_38777 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38783 - SURFACE
      ?auto_38784 - SURFACE
    )
    :vars
    (
      ?auto_38786 - HOIST
      ?auto_38789 - PLACE
      ?auto_38785 - SURFACE
      ?auto_38787 - TRUCK
      ?auto_38788 - PLACE
      ?auto_38790 - HOIST
      ?auto_38791 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38786 ?auto_38789 ) ( SURFACE-AT ?auto_38783 ?auto_38789 ) ( CLEAR ?auto_38783 ) ( IS-CRATE ?auto_38784 ) ( not ( = ?auto_38783 ?auto_38784 ) ) ( AVAILABLE ?auto_38786 ) ( ON ?auto_38783 ?auto_38785 ) ( not ( = ?auto_38785 ?auto_38783 ) ) ( not ( = ?auto_38785 ?auto_38784 ) ) ( TRUCK-AT ?auto_38787 ?auto_38788 ) ( not ( = ?auto_38788 ?auto_38789 ) ) ( HOIST-AT ?auto_38790 ?auto_38788 ) ( not ( = ?auto_38786 ?auto_38790 ) ) ( AVAILABLE ?auto_38790 ) ( SURFACE-AT ?auto_38784 ?auto_38788 ) ( ON ?auto_38784 ?auto_38791 ) ( CLEAR ?auto_38784 ) ( not ( = ?auto_38783 ?auto_38791 ) ) ( not ( = ?auto_38784 ?auto_38791 ) ) ( not ( = ?auto_38785 ?auto_38791 ) ) )
    :subtasks
    ( ( !LIFT ?auto_38790 ?auto_38784 ?auto_38791 ?auto_38788 )
      ( MAKE-2CRATE ?auto_38785 ?auto_38783 ?auto_38784 )
      ( MAKE-1CRATE-VERIFY ?auto_38783 ?auto_38784 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38792 - SURFACE
      ?auto_38793 - SURFACE
      ?auto_38794 - SURFACE
    )
    :vars
    (
      ?auto_38799 - HOIST
      ?auto_38797 - PLACE
      ?auto_38796 - TRUCK
      ?auto_38795 - PLACE
      ?auto_38800 - HOIST
      ?auto_38798 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38799 ?auto_38797 ) ( SURFACE-AT ?auto_38793 ?auto_38797 ) ( CLEAR ?auto_38793 ) ( IS-CRATE ?auto_38794 ) ( not ( = ?auto_38793 ?auto_38794 ) ) ( AVAILABLE ?auto_38799 ) ( ON ?auto_38793 ?auto_38792 ) ( not ( = ?auto_38792 ?auto_38793 ) ) ( not ( = ?auto_38792 ?auto_38794 ) ) ( TRUCK-AT ?auto_38796 ?auto_38795 ) ( not ( = ?auto_38795 ?auto_38797 ) ) ( HOIST-AT ?auto_38800 ?auto_38795 ) ( not ( = ?auto_38799 ?auto_38800 ) ) ( AVAILABLE ?auto_38800 ) ( SURFACE-AT ?auto_38794 ?auto_38795 ) ( ON ?auto_38794 ?auto_38798 ) ( CLEAR ?auto_38794 ) ( not ( = ?auto_38793 ?auto_38798 ) ) ( not ( = ?auto_38794 ?auto_38798 ) ) ( not ( = ?auto_38792 ?auto_38798 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38793 ?auto_38794 )
      ( MAKE-2CRATE-VERIFY ?auto_38792 ?auto_38793 ?auto_38794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38801 - SURFACE
      ?auto_38802 - SURFACE
    )
    :vars
    (
      ?auto_38807 - HOIST
      ?auto_38805 - PLACE
      ?auto_38808 - SURFACE
      ?auto_38806 - PLACE
      ?auto_38803 - HOIST
      ?auto_38809 - SURFACE
      ?auto_38804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38807 ?auto_38805 ) ( SURFACE-AT ?auto_38801 ?auto_38805 ) ( CLEAR ?auto_38801 ) ( IS-CRATE ?auto_38802 ) ( not ( = ?auto_38801 ?auto_38802 ) ) ( AVAILABLE ?auto_38807 ) ( ON ?auto_38801 ?auto_38808 ) ( not ( = ?auto_38808 ?auto_38801 ) ) ( not ( = ?auto_38808 ?auto_38802 ) ) ( not ( = ?auto_38806 ?auto_38805 ) ) ( HOIST-AT ?auto_38803 ?auto_38806 ) ( not ( = ?auto_38807 ?auto_38803 ) ) ( AVAILABLE ?auto_38803 ) ( SURFACE-AT ?auto_38802 ?auto_38806 ) ( ON ?auto_38802 ?auto_38809 ) ( CLEAR ?auto_38802 ) ( not ( = ?auto_38801 ?auto_38809 ) ) ( not ( = ?auto_38802 ?auto_38809 ) ) ( not ( = ?auto_38808 ?auto_38809 ) ) ( TRUCK-AT ?auto_38804 ?auto_38805 ) )
    :subtasks
    ( ( !DRIVE ?auto_38804 ?auto_38805 ?auto_38806 )
      ( MAKE-2CRATE ?auto_38808 ?auto_38801 ?auto_38802 )
      ( MAKE-1CRATE-VERIFY ?auto_38801 ?auto_38802 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38810 - SURFACE
      ?auto_38811 - SURFACE
      ?auto_38812 - SURFACE
    )
    :vars
    (
      ?auto_38815 - HOIST
      ?auto_38813 - PLACE
      ?auto_38817 - PLACE
      ?auto_38816 - HOIST
      ?auto_38818 - SURFACE
      ?auto_38814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38815 ?auto_38813 ) ( SURFACE-AT ?auto_38811 ?auto_38813 ) ( CLEAR ?auto_38811 ) ( IS-CRATE ?auto_38812 ) ( not ( = ?auto_38811 ?auto_38812 ) ) ( AVAILABLE ?auto_38815 ) ( ON ?auto_38811 ?auto_38810 ) ( not ( = ?auto_38810 ?auto_38811 ) ) ( not ( = ?auto_38810 ?auto_38812 ) ) ( not ( = ?auto_38817 ?auto_38813 ) ) ( HOIST-AT ?auto_38816 ?auto_38817 ) ( not ( = ?auto_38815 ?auto_38816 ) ) ( AVAILABLE ?auto_38816 ) ( SURFACE-AT ?auto_38812 ?auto_38817 ) ( ON ?auto_38812 ?auto_38818 ) ( CLEAR ?auto_38812 ) ( not ( = ?auto_38811 ?auto_38818 ) ) ( not ( = ?auto_38812 ?auto_38818 ) ) ( not ( = ?auto_38810 ?auto_38818 ) ) ( TRUCK-AT ?auto_38814 ?auto_38813 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38811 ?auto_38812 )
      ( MAKE-2CRATE-VERIFY ?auto_38810 ?auto_38811 ?auto_38812 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38819 - SURFACE
      ?auto_38820 - SURFACE
    )
    :vars
    (
      ?auto_38821 - HOIST
      ?auto_38822 - PLACE
      ?auto_38824 - SURFACE
      ?auto_38825 - PLACE
      ?auto_38823 - HOIST
      ?auto_38826 - SURFACE
      ?auto_38827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38821 ?auto_38822 ) ( IS-CRATE ?auto_38820 ) ( not ( = ?auto_38819 ?auto_38820 ) ) ( not ( = ?auto_38824 ?auto_38819 ) ) ( not ( = ?auto_38824 ?auto_38820 ) ) ( not ( = ?auto_38825 ?auto_38822 ) ) ( HOIST-AT ?auto_38823 ?auto_38825 ) ( not ( = ?auto_38821 ?auto_38823 ) ) ( AVAILABLE ?auto_38823 ) ( SURFACE-AT ?auto_38820 ?auto_38825 ) ( ON ?auto_38820 ?auto_38826 ) ( CLEAR ?auto_38820 ) ( not ( = ?auto_38819 ?auto_38826 ) ) ( not ( = ?auto_38820 ?auto_38826 ) ) ( not ( = ?auto_38824 ?auto_38826 ) ) ( TRUCK-AT ?auto_38827 ?auto_38822 ) ( SURFACE-AT ?auto_38824 ?auto_38822 ) ( CLEAR ?auto_38824 ) ( LIFTING ?auto_38821 ?auto_38819 ) ( IS-CRATE ?auto_38819 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38824 ?auto_38819 )
      ( MAKE-2CRATE ?auto_38824 ?auto_38819 ?auto_38820 )
      ( MAKE-1CRATE-VERIFY ?auto_38819 ?auto_38820 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38828 - SURFACE
      ?auto_38829 - SURFACE
      ?auto_38830 - SURFACE
    )
    :vars
    (
      ?auto_38836 - HOIST
      ?auto_38835 - PLACE
      ?auto_38834 - PLACE
      ?auto_38832 - HOIST
      ?auto_38833 - SURFACE
      ?auto_38831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38836 ?auto_38835 ) ( IS-CRATE ?auto_38830 ) ( not ( = ?auto_38829 ?auto_38830 ) ) ( not ( = ?auto_38828 ?auto_38829 ) ) ( not ( = ?auto_38828 ?auto_38830 ) ) ( not ( = ?auto_38834 ?auto_38835 ) ) ( HOIST-AT ?auto_38832 ?auto_38834 ) ( not ( = ?auto_38836 ?auto_38832 ) ) ( AVAILABLE ?auto_38832 ) ( SURFACE-AT ?auto_38830 ?auto_38834 ) ( ON ?auto_38830 ?auto_38833 ) ( CLEAR ?auto_38830 ) ( not ( = ?auto_38829 ?auto_38833 ) ) ( not ( = ?auto_38830 ?auto_38833 ) ) ( not ( = ?auto_38828 ?auto_38833 ) ) ( TRUCK-AT ?auto_38831 ?auto_38835 ) ( SURFACE-AT ?auto_38828 ?auto_38835 ) ( CLEAR ?auto_38828 ) ( LIFTING ?auto_38836 ?auto_38829 ) ( IS-CRATE ?auto_38829 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38829 ?auto_38830 )
      ( MAKE-2CRATE-VERIFY ?auto_38828 ?auto_38829 ?auto_38830 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38837 - SURFACE
      ?auto_38838 - SURFACE
    )
    :vars
    (
      ?auto_38840 - HOIST
      ?auto_38843 - PLACE
      ?auto_38841 - SURFACE
      ?auto_38839 - PLACE
      ?auto_38844 - HOIST
      ?auto_38845 - SURFACE
      ?auto_38842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38840 ?auto_38843 ) ( IS-CRATE ?auto_38838 ) ( not ( = ?auto_38837 ?auto_38838 ) ) ( not ( = ?auto_38841 ?auto_38837 ) ) ( not ( = ?auto_38841 ?auto_38838 ) ) ( not ( = ?auto_38839 ?auto_38843 ) ) ( HOIST-AT ?auto_38844 ?auto_38839 ) ( not ( = ?auto_38840 ?auto_38844 ) ) ( AVAILABLE ?auto_38844 ) ( SURFACE-AT ?auto_38838 ?auto_38839 ) ( ON ?auto_38838 ?auto_38845 ) ( CLEAR ?auto_38838 ) ( not ( = ?auto_38837 ?auto_38845 ) ) ( not ( = ?auto_38838 ?auto_38845 ) ) ( not ( = ?auto_38841 ?auto_38845 ) ) ( TRUCK-AT ?auto_38842 ?auto_38843 ) ( SURFACE-AT ?auto_38841 ?auto_38843 ) ( CLEAR ?auto_38841 ) ( IS-CRATE ?auto_38837 ) ( AVAILABLE ?auto_38840 ) ( IN ?auto_38837 ?auto_38842 ) )
    :subtasks
    ( ( !UNLOAD ?auto_38840 ?auto_38837 ?auto_38842 ?auto_38843 )
      ( MAKE-2CRATE ?auto_38841 ?auto_38837 ?auto_38838 )
      ( MAKE-1CRATE-VERIFY ?auto_38837 ?auto_38838 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_38846 - SURFACE
      ?auto_38847 - SURFACE
      ?auto_38848 - SURFACE
    )
    :vars
    (
      ?auto_38852 - HOIST
      ?auto_38854 - PLACE
      ?auto_38851 - PLACE
      ?auto_38850 - HOIST
      ?auto_38853 - SURFACE
      ?auto_38849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38852 ?auto_38854 ) ( IS-CRATE ?auto_38848 ) ( not ( = ?auto_38847 ?auto_38848 ) ) ( not ( = ?auto_38846 ?auto_38847 ) ) ( not ( = ?auto_38846 ?auto_38848 ) ) ( not ( = ?auto_38851 ?auto_38854 ) ) ( HOIST-AT ?auto_38850 ?auto_38851 ) ( not ( = ?auto_38852 ?auto_38850 ) ) ( AVAILABLE ?auto_38850 ) ( SURFACE-AT ?auto_38848 ?auto_38851 ) ( ON ?auto_38848 ?auto_38853 ) ( CLEAR ?auto_38848 ) ( not ( = ?auto_38847 ?auto_38853 ) ) ( not ( = ?auto_38848 ?auto_38853 ) ) ( not ( = ?auto_38846 ?auto_38853 ) ) ( TRUCK-AT ?auto_38849 ?auto_38854 ) ( SURFACE-AT ?auto_38846 ?auto_38854 ) ( CLEAR ?auto_38846 ) ( IS-CRATE ?auto_38847 ) ( AVAILABLE ?auto_38852 ) ( IN ?auto_38847 ?auto_38849 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38847 ?auto_38848 )
      ( MAKE-2CRATE-VERIFY ?auto_38846 ?auto_38847 ?auto_38848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_38891 - SURFACE
      ?auto_38892 - SURFACE
    )
    :vars
    (
      ?auto_38894 - HOIST
      ?auto_38893 - PLACE
      ?auto_38899 - SURFACE
      ?auto_38897 - PLACE
      ?auto_38896 - HOIST
      ?auto_38898 - SURFACE
      ?auto_38895 - TRUCK
      ?auto_38900 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38894 ?auto_38893 ) ( SURFACE-AT ?auto_38891 ?auto_38893 ) ( CLEAR ?auto_38891 ) ( IS-CRATE ?auto_38892 ) ( not ( = ?auto_38891 ?auto_38892 ) ) ( AVAILABLE ?auto_38894 ) ( ON ?auto_38891 ?auto_38899 ) ( not ( = ?auto_38899 ?auto_38891 ) ) ( not ( = ?auto_38899 ?auto_38892 ) ) ( not ( = ?auto_38897 ?auto_38893 ) ) ( HOIST-AT ?auto_38896 ?auto_38897 ) ( not ( = ?auto_38894 ?auto_38896 ) ) ( AVAILABLE ?auto_38896 ) ( SURFACE-AT ?auto_38892 ?auto_38897 ) ( ON ?auto_38892 ?auto_38898 ) ( CLEAR ?auto_38892 ) ( not ( = ?auto_38891 ?auto_38898 ) ) ( not ( = ?auto_38892 ?auto_38898 ) ) ( not ( = ?auto_38899 ?auto_38898 ) ) ( TRUCK-AT ?auto_38895 ?auto_38900 ) ( not ( = ?auto_38900 ?auto_38893 ) ) ( not ( = ?auto_38897 ?auto_38900 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_38895 ?auto_38900 ?auto_38893 )
      ( MAKE-1CRATE ?auto_38891 ?auto_38892 )
      ( MAKE-1CRATE-VERIFY ?auto_38891 ?auto_38892 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38930 - SURFACE
      ?auto_38931 - SURFACE
      ?auto_38932 - SURFACE
      ?auto_38933 - SURFACE
    )
    :vars
    (
      ?auto_38935 - HOIST
      ?auto_38934 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38935 ?auto_38934 ) ( SURFACE-AT ?auto_38932 ?auto_38934 ) ( CLEAR ?auto_38932 ) ( LIFTING ?auto_38935 ?auto_38933 ) ( IS-CRATE ?auto_38933 ) ( not ( = ?auto_38932 ?auto_38933 ) ) ( ON ?auto_38931 ?auto_38930 ) ( ON ?auto_38932 ?auto_38931 ) ( not ( = ?auto_38930 ?auto_38931 ) ) ( not ( = ?auto_38930 ?auto_38932 ) ) ( not ( = ?auto_38930 ?auto_38933 ) ) ( not ( = ?auto_38931 ?auto_38932 ) ) ( not ( = ?auto_38931 ?auto_38933 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_38932 ?auto_38933 )
      ( MAKE-3CRATE-VERIFY ?auto_38930 ?auto_38931 ?auto_38932 ?auto_38933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38947 - SURFACE
      ?auto_38948 - SURFACE
      ?auto_38949 - SURFACE
      ?auto_38950 - SURFACE
    )
    :vars
    (
      ?auto_38951 - HOIST
      ?auto_38953 - PLACE
      ?auto_38952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_38951 ?auto_38953 ) ( SURFACE-AT ?auto_38949 ?auto_38953 ) ( CLEAR ?auto_38949 ) ( IS-CRATE ?auto_38950 ) ( not ( = ?auto_38949 ?auto_38950 ) ) ( TRUCK-AT ?auto_38952 ?auto_38953 ) ( AVAILABLE ?auto_38951 ) ( IN ?auto_38950 ?auto_38952 ) ( ON ?auto_38949 ?auto_38948 ) ( not ( = ?auto_38948 ?auto_38949 ) ) ( not ( = ?auto_38948 ?auto_38950 ) ) ( ON ?auto_38948 ?auto_38947 ) ( not ( = ?auto_38947 ?auto_38948 ) ) ( not ( = ?auto_38947 ?auto_38949 ) ) ( not ( = ?auto_38947 ?auto_38950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38948 ?auto_38949 ?auto_38950 )
      ( MAKE-3CRATE-VERIFY ?auto_38947 ?auto_38948 ?auto_38949 ?auto_38950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38968 - SURFACE
      ?auto_38969 - SURFACE
      ?auto_38970 - SURFACE
      ?auto_38971 - SURFACE
    )
    :vars
    (
      ?auto_38972 - HOIST
      ?auto_38973 - PLACE
      ?auto_38974 - TRUCK
      ?auto_38975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_38972 ?auto_38973 ) ( SURFACE-AT ?auto_38970 ?auto_38973 ) ( CLEAR ?auto_38970 ) ( IS-CRATE ?auto_38971 ) ( not ( = ?auto_38970 ?auto_38971 ) ) ( AVAILABLE ?auto_38972 ) ( IN ?auto_38971 ?auto_38974 ) ( ON ?auto_38970 ?auto_38969 ) ( not ( = ?auto_38969 ?auto_38970 ) ) ( not ( = ?auto_38969 ?auto_38971 ) ) ( TRUCK-AT ?auto_38974 ?auto_38975 ) ( not ( = ?auto_38975 ?auto_38973 ) ) ( ON ?auto_38969 ?auto_38968 ) ( not ( = ?auto_38968 ?auto_38969 ) ) ( not ( = ?auto_38968 ?auto_38970 ) ) ( not ( = ?auto_38968 ?auto_38971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38969 ?auto_38970 ?auto_38971 )
      ( MAKE-3CRATE-VERIFY ?auto_38968 ?auto_38969 ?auto_38970 ?auto_38971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_38992 - SURFACE
      ?auto_38993 - SURFACE
      ?auto_38994 - SURFACE
      ?auto_38995 - SURFACE
    )
    :vars
    (
      ?auto_38998 - HOIST
      ?auto_38999 - PLACE
      ?auto_38996 - TRUCK
      ?auto_39000 - PLACE
      ?auto_38997 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_38998 ?auto_38999 ) ( SURFACE-AT ?auto_38994 ?auto_38999 ) ( CLEAR ?auto_38994 ) ( IS-CRATE ?auto_38995 ) ( not ( = ?auto_38994 ?auto_38995 ) ) ( AVAILABLE ?auto_38998 ) ( ON ?auto_38994 ?auto_38993 ) ( not ( = ?auto_38993 ?auto_38994 ) ) ( not ( = ?auto_38993 ?auto_38995 ) ) ( TRUCK-AT ?auto_38996 ?auto_39000 ) ( not ( = ?auto_39000 ?auto_38999 ) ) ( HOIST-AT ?auto_38997 ?auto_39000 ) ( LIFTING ?auto_38997 ?auto_38995 ) ( not ( = ?auto_38998 ?auto_38997 ) ) ( ON ?auto_38993 ?auto_38992 ) ( not ( = ?auto_38992 ?auto_38993 ) ) ( not ( = ?auto_38992 ?auto_38994 ) ) ( not ( = ?auto_38992 ?auto_38995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_38993 ?auto_38994 ?auto_38995 )
      ( MAKE-3CRATE-VERIFY ?auto_38992 ?auto_38993 ?auto_38994 ?auto_38995 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39019 - SURFACE
      ?auto_39020 - SURFACE
      ?auto_39021 - SURFACE
      ?auto_39022 - SURFACE
    )
    :vars
    (
      ?auto_39027 - HOIST
      ?auto_39024 - PLACE
      ?auto_39025 - TRUCK
      ?auto_39026 - PLACE
      ?auto_39023 - HOIST
      ?auto_39028 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39027 ?auto_39024 ) ( SURFACE-AT ?auto_39021 ?auto_39024 ) ( CLEAR ?auto_39021 ) ( IS-CRATE ?auto_39022 ) ( not ( = ?auto_39021 ?auto_39022 ) ) ( AVAILABLE ?auto_39027 ) ( ON ?auto_39021 ?auto_39020 ) ( not ( = ?auto_39020 ?auto_39021 ) ) ( not ( = ?auto_39020 ?auto_39022 ) ) ( TRUCK-AT ?auto_39025 ?auto_39026 ) ( not ( = ?auto_39026 ?auto_39024 ) ) ( HOIST-AT ?auto_39023 ?auto_39026 ) ( not ( = ?auto_39027 ?auto_39023 ) ) ( AVAILABLE ?auto_39023 ) ( SURFACE-AT ?auto_39022 ?auto_39026 ) ( ON ?auto_39022 ?auto_39028 ) ( CLEAR ?auto_39022 ) ( not ( = ?auto_39021 ?auto_39028 ) ) ( not ( = ?auto_39022 ?auto_39028 ) ) ( not ( = ?auto_39020 ?auto_39028 ) ) ( ON ?auto_39020 ?auto_39019 ) ( not ( = ?auto_39019 ?auto_39020 ) ) ( not ( = ?auto_39019 ?auto_39021 ) ) ( not ( = ?auto_39019 ?auto_39022 ) ) ( not ( = ?auto_39019 ?auto_39028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39020 ?auto_39021 ?auto_39022 )
      ( MAKE-3CRATE-VERIFY ?auto_39019 ?auto_39020 ?auto_39021 ?auto_39022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39047 - SURFACE
      ?auto_39048 - SURFACE
      ?auto_39049 - SURFACE
      ?auto_39050 - SURFACE
    )
    :vars
    (
      ?auto_39055 - HOIST
      ?auto_39052 - PLACE
      ?auto_39053 - PLACE
      ?auto_39054 - HOIST
      ?auto_39056 - SURFACE
      ?auto_39051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39055 ?auto_39052 ) ( SURFACE-AT ?auto_39049 ?auto_39052 ) ( CLEAR ?auto_39049 ) ( IS-CRATE ?auto_39050 ) ( not ( = ?auto_39049 ?auto_39050 ) ) ( AVAILABLE ?auto_39055 ) ( ON ?auto_39049 ?auto_39048 ) ( not ( = ?auto_39048 ?auto_39049 ) ) ( not ( = ?auto_39048 ?auto_39050 ) ) ( not ( = ?auto_39053 ?auto_39052 ) ) ( HOIST-AT ?auto_39054 ?auto_39053 ) ( not ( = ?auto_39055 ?auto_39054 ) ) ( AVAILABLE ?auto_39054 ) ( SURFACE-AT ?auto_39050 ?auto_39053 ) ( ON ?auto_39050 ?auto_39056 ) ( CLEAR ?auto_39050 ) ( not ( = ?auto_39049 ?auto_39056 ) ) ( not ( = ?auto_39050 ?auto_39056 ) ) ( not ( = ?auto_39048 ?auto_39056 ) ) ( TRUCK-AT ?auto_39051 ?auto_39052 ) ( ON ?auto_39048 ?auto_39047 ) ( not ( = ?auto_39047 ?auto_39048 ) ) ( not ( = ?auto_39047 ?auto_39049 ) ) ( not ( = ?auto_39047 ?auto_39050 ) ) ( not ( = ?auto_39047 ?auto_39056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39048 ?auto_39049 ?auto_39050 )
      ( MAKE-3CRATE-VERIFY ?auto_39047 ?auto_39048 ?auto_39049 ?auto_39050 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39075 - SURFACE
      ?auto_39076 - SURFACE
      ?auto_39077 - SURFACE
      ?auto_39078 - SURFACE
    )
    :vars
    (
      ?auto_39081 - HOIST
      ?auto_39083 - PLACE
      ?auto_39082 - PLACE
      ?auto_39079 - HOIST
      ?auto_39084 - SURFACE
      ?auto_39080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39081 ?auto_39083 ) ( IS-CRATE ?auto_39078 ) ( not ( = ?auto_39077 ?auto_39078 ) ) ( not ( = ?auto_39076 ?auto_39077 ) ) ( not ( = ?auto_39076 ?auto_39078 ) ) ( not ( = ?auto_39082 ?auto_39083 ) ) ( HOIST-AT ?auto_39079 ?auto_39082 ) ( not ( = ?auto_39081 ?auto_39079 ) ) ( AVAILABLE ?auto_39079 ) ( SURFACE-AT ?auto_39078 ?auto_39082 ) ( ON ?auto_39078 ?auto_39084 ) ( CLEAR ?auto_39078 ) ( not ( = ?auto_39077 ?auto_39084 ) ) ( not ( = ?auto_39078 ?auto_39084 ) ) ( not ( = ?auto_39076 ?auto_39084 ) ) ( TRUCK-AT ?auto_39080 ?auto_39083 ) ( SURFACE-AT ?auto_39076 ?auto_39083 ) ( CLEAR ?auto_39076 ) ( LIFTING ?auto_39081 ?auto_39077 ) ( IS-CRATE ?auto_39077 ) ( ON ?auto_39076 ?auto_39075 ) ( not ( = ?auto_39075 ?auto_39076 ) ) ( not ( = ?auto_39075 ?auto_39077 ) ) ( not ( = ?auto_39075 ?auto_39078 ) ) ( not ( = ?auto_39075 ?auto_39084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39076 ?auto_39077 ?auto_39078 )
      ( MAKE-3CRATE-VERIFY ?auto_39075 ?auto_39076 ?auto_39077 ?auto_39078 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_39103 - SURFACE
      ?auto_39104 - SURFACE
      ?auto_39105 - SURFACE
      ?auto_39106 - SURFACE
    )
    :vars
    (
      ?auto_39109 - HOIST
      ?auto_39112 - PLACE
      ?auto_39108 - PLACE
      ?auto_39107 - HOIST
      ?auto_39110 - SURFACE
      ?auto_39111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39109 ?auto_39112 ) ( IS-CRATE ?auto_39106 ) ( not ( = ?auto_39105 ?auto_39106 ) ) ( not ( = ?auto_39104 ?auto_39105 ) ) ( not ( = ?auto_39104 ?auto_39106 ) ) ( not ( = ?auto_39108 ?auto_39112 ) ) ( HOIST-AT ?auto_39107 ?auto_39108 ) ( not ( = ?auto_39109 ?auto_39107 ) ) ( AVAILABLE ?auto_39107 ) ( SURFACE-AT ?auto_39106 ?auto_39108 ) ( ON ?auto_39106 ?auto_39110 ) ( CLEAR ?auto_39106 ) ( not ( = ?auto_39105 ?auto_39110 ) ) ( not ( = ?auto_39106 ?auto_39110 ) ) ( not ( = ?auto_39104 ?auto_39110 ) ) ( TRUCK-AT ?auto_39111 ?auto_39112 ) ( SURFACE-AT ?auto_39104 ?auto_39112 ) ( CLEAR ?auto_39104 ) ( IS-CRATE ?auto_39105 ) ( AVAILABLE ?auto_39109 ) ( IN ?auto_39105 ?auto_39111 ) ( ON ?auto_39104 ?auto_39103 ) ( not ( = ?auto_39103 ?auto_39104 ) ) ( not ( = ?auto_39103 ?auto_39105 ) ) ( not ( = ?auto_39103 ?auto_39106 ) ) ( not ( = ?auto_39103 ?auto_39110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39104 ?auto_39105 ?auto_39106 )
      ( MAKE-3CRATE-VERIFY ?auto_39103 ?auto_39104 ?auto_39105 ?auto_39106 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39394 - SURFACE
      ?auto_39395 - SURFACE
      ?auto_39396 - SURFACE
      ?auto_39397 - SURFACE
      ?auto_39398 - SURFACE
    )
    :vars
    (
      ?auto_39400 - HOIST
      ?auto_39399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39400 ?auto_39399 ) ( SURFACE-AT ?auto_39397 ?auto_39399 ) ( CLEAR ?auto_39397 ) ( LIFTING ?auto_39400 ?auto_39398 ) ( IS-CRATE ?auto_39398 ) ( not ( = ?auto_39397 ?auto_39398 ) ) ( ON ?auto_39395 ?auto_39394 ) ( ON ?auto_39396 ?auto_39395 ) ( ON ?auto_39397 ?auto_39396 ) ( not ( = ?auto_39394 ?auto_39395 ) ) ( not ( = ?auto_39394 ?auto_39396 ) ) ( not ( = ?auto_39394 ?auto_39397 ) ) ( not ( = ?auto_39394 ?auto_39398 ) ) ( not ( = ?auto_39395 ?auto_39396 ) ) ( not ( = ?auto_39395 ?auto_39397 ) ) ( not ( = ?auto_39395 ?auto_39398 ) ) ( not ( = ?auto_39396 ?auto_39397 ) ) ( not ( = ?auto_39396 ?auto_39398 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_39397 ?auto_39398 )
      ( MAKE-4CRATE-VERIFY ?auto_39394 ?auto_39395 ?auto_39396 ?auto_39397 ?auto_39398 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39419 - SURFACE
      ?auto_39420 - SURFACE
      ?auto_39421 - SURFACE
      ?auto_39422 - SURFACE
      ?auto_39423 - SURFACE
    )
    :vars
    (
      ?auto_39426 - HOIST
      ?auto_39425 - PLACE
      ?auto_39424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39426 ?auto_39425 ) ( SURFACE-AT ?auto_39422 ?auto_39425 ) ( CLEAR ?auto_39422 ) ( IS-CRATE ?auto_39423 ) ( not ( = ?auto_39422 ?auto_39423 ) ) ( TRUCK-AT ?auto_39424 ?auto_39425 ) ( AVAILABLE ?auto_39426 ) ( IN ?auto_39423 ?auto_39424 ) ( ON ?auto_39422 ?auto_39421 ) ( not ( = ?auto_39421 ?auto_39422 ) ) ( not ( = ?auto_39421 ?auto_39423 ) ) ( ON ?auto_39420 ?auto_39419 ) ( ON ?auto_39421 ?auto_39420 ) ( not ( = ?auto_39419 ?auto_39420 ) ) ( not ( = ?auto_39419 ?auto_39421 ) ) ( not ( = ?auto_39419 ?auto_39422 ) ) ( not ( = ?auto_39419 ?auto_39423 ) ) ( not ( = ?auto_39420 ?auto_39421 ) ) ( not ( = ?auto_39420 ?auto_39422 ) ) ( not ( = ?auto_39420 ?auto_39423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39421 ?auto_39422 ?auto_39423 )
      ( MAKE-4CRATE-VERIFY ?auto_39419 ?auto_39420 ?auto_39421 ?auto_39422 ?auto_39423 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39449 - SURFACE
      ?auto_39450 - SURFACE
      ?auto_39451 - SURFACE
      ?auto_39452 - SURFACE
      ?auto_39453 - SURFACE
    )
    :vars
    (
      ?auto_39457 - HOIST
      ?auto_39456 - PLACE
      ?auto_39455 - TRUCK
      ?auto_39454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39457 ?auto_39456 ) ( SURFACE-AT ?auto_39452 ?auto_39456 ) ( CLEAR ?auto_39452 ) ( IS-CRATE ?auto_39453 ) ( not ( = ?auto_39452 ?auto_39453 ) ) ( AVAILABLE ?auto_39457 ) ( IN ?auto_39453 ?auto_39455 ) ( ON ?auto_39452 ?auto_39451 ) ( not ( = ?auto_39451 ?auto_39452 ) ) ( not ( = ?auto_39451 ?auto_39453 ) ) ( TRUCK-AT ?auto_39455 ?auto_39454 ) ( not ( = ?auto_39454 ?auto_39456 ) ) ( ON ?auto_39450 ?auto_39449 ) ( ON ?auto_39451 ?auto_39450 ) ( not ( = ?auto_39449 ?auto_39450 ) ) ( not ( = ?auto_39449 ?auto_39451 ) ) ( not ( = ?auto_39449 ?auto_39452 ) ) ( not ( = ?auto_39449 ?auto_39453 ) ) ( not ( = ?auto_39450 ?auto_39451 ) ) ( not ( = ?auto_39450 ?auto_39452 ) ) ( not ( = ?auto_39450 ?auto_39453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39451 ?auto_39452 ?auto_39453 )
      ( MAKE-4CRATE-VERIFY ?auto_39449 ?auto_39450 ?auto_39451 ?auto_39452 ?auto_39453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39483 - SURFACE
      ?auto_39484 - SURFACE
      ?auto_39485 - SURFACE
      ?auto_39486 - SURFACE
      ?auto_39487 - SURFACE
    )
    :vars
    (
      ?auto_39489 - HOIST
      ?auto_39492 - PLACE
      ?auto_39488 - TRUCK
      ?auto_39490 - PLACE
      ?auto_39491 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_39489 ?auto_39492 ) ( SURFACE-AT ?auto_39486 ?auto_39492 ) ( CLEAR ?auto_39486 ) ( IS-CRATE ?auto_39487 ) ( not ( = ?auto_39486 ?auto_39487 ) ) ( AVAILABLE ?auto_39489 ) ( ON ?auto_39486 ?auto_39485 ) ( not ( = ?auto_39485 ?auto_39486 ) ) ( not ( = ?auto_39485 ?auto_39487 ) ) ( TRUCK-AT ?auto_39488 ?auto_39490 ) ( not ( = ?auto_39490 ?auto_39492 ) ) ( HOIST-AT ?auto_39491 ?auto_39490 ) ( LIFTING ?auto_39491 ?auto_39487 ) ( not ( = ?auto_39489 ?auto_39491 ) ) ( ON ?auto_39484 ?auto_39483 ) ( ON ?auto_39485 ?auto_39484 ) ( not ( = ?auto_39483 ?auto_39484 ) ) ( not ( = ?auto_39483 ?auto_39485 ) ) ( not ( = ?auto_39483 ?auto_39486 ) ) ( not ( = ?auto_39483 ?auto_39487 ) ) ( not ( = ?auto_39484 ?auto_39485 ) ) ( not ( = ?auto_39484 ?auto_39486 ) ) ( not ( = ?auto_39484 ?auto_39487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39485 ?auto_39486 ?auto_39487 )
      ( MAKE-4CRATE-VERIFY ?auto_39483 ?auto_39484 ?auto_39485 ?auto_39486 ?auto_39487 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39521 - SURFACE
      ?auto_39522 - SURFACE
      ?auto_39523 - SURFACE
      ?auto_39524 - SURFACE
      ?auto_39525 - SURFACE
    )
    :vars
    (
      ?auto_39530 - HOIST
      ?auto_39526 - PLACE
      ?auto_39528 - TRUCK
      ?auto_39531 - PLACE
      ?auto_39529 - HOIST
      ?auto_39527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_39530 ?auto_39526 ) ( SURFACE-AT ?auto_39524 ?auto_39526 ) ( CLEAR ?auto_39524 ) ( IS-CRATE ?auto_39525 ) ( not ( = ?auto_39524 ?auto_39525 ) ) ( AVAILABLE ?auto_39530 ) ( ON ?auto_39524 ?auto_39523 ) ( not ( = ?auto_39523 ?auto_39524 ) ) ( not ( = ?auto_39523 ?auto_39525 ) ) ( TRUCK-AT ?auto_39528 ?auto_39531 ) ( not ( = ?auto_39531 ?auto_39526 ) ) ( HOIST-AT ?auto_39529 ?auto_39531 ) ( not ( = ?auto_39530 ?auto_39529 ) ) ( AVAILABLE ?auto_39529 ) ( SURFACE-AT ?auto_39525 ?auto_39531 ) ( ON ?auto_39525 ?auto_39527 ) ( CLEAR ?auto_39525 ) ( not ( = ?auto_39524 ?auto_39527 ) ) ( not ( = ?auto_39525 ?auto_39527 ) ) ( not ( = ?auto_39523 ?auto_39527 ) ) ( ON ?auto_39522 ?auto_39521 ) ( ON ?auto_39523 ?auto_39522 ) ( not ( = ?auto_39521 ?auto_39522 ) ) ( not ( = ?auto_39521 ?auto_39523 ) ) ( not ( = ?auto_39521 ?auto_39524 ) ) ( not ( = ?auto_39521 ?auto_39525 ) ) ( not ( = ?auto_39521 ?auto_39527 ) ) ( not ( = ?auto_39522 ?auto_39523 ) ) ( not ( = ?auto_39522 ?auto_39524 ) ) ( not ( = ?auto_39522 ?auto_39525 ) ) ( not ( = ?auto_39522 ?auto_39527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39523 ?auto_39524 ?auto_39525 )
      ( MAKE-4CRATE-VERIFY ?auto_39521 ?auto_39522 ?auto_39523 ?auto_39524 ?auto_39525 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39560 - SURFACE
      ?auto_39561 - SURFACE
      ?auto_39562 - SURFACE
      ?auto_39563 - SURFACE
      ?auto_39564 - SURFACE
    )
    :vars
    (
      ?auto_39569 - HOIST
      ?auto_39567 - PLACE
      ?auto_39566 - PLACE
      ?auto_39565 - HOIST
      ?auto_39570 - SURFACE
      ?auto_39568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39569 ?auto_39567 ) ( SURFACE-AT ?auto_39563 ?auto_39567 ) ( CLEAR ?auto_39563 ) ( IS-CRATE ?auto_39564 ) ( not ( = ?auto_39563 ?auto_39564 ) ) ( AVAILABLE ?auto_39569 ) ( ON ?auto_39563 ?auto_39562 ) ( not ( = ?auto_39562 ?auto_39563 ) ) ( not ( = ?auto_39562 ?auto_39564 ) ) ( not ( = ?auto_39566 ?auto_39567 ) ) ( HOIST-AT ?auto_39565 ?auto_39566 ) ( not ( = ?auto_39569 ?auto_39565 ) ) ( AVAILABLE ?auto_39565 ) ( SURFACE-AT ?auto_39564 ?auto_39566 ) ( ON ?auto_39564 ?auto_39570 ) ( CLEAR ?auto_39564 ) ( not ( = ?auto_39563 ?auto_39570 ) ) ( not ( = ?auto_39564 ?auto_39570 ) ) ( not ( = ?auto_39562 ?auto_39570 ) ) ( TRUCK-AT ?auto_39568 ?auto_39567 ) ( ON ?auto_39561 ?auto_39560 ) ( ON ?auto_39562 ?auto_39561 ) ( not ( = ?auto_39560 ?auto_39561 ) ) ( not ( = ?auto_39560 ?auto_39562 ) ) ( not ( = ?auto_39560 ?auto_39563 ) ) ( not ( = ?auto_39560 ?auto_39564 ) ) ( not ( = ?auto_39560 ?auto_39570 ) ) ( not ( = ?auto_39561 ?auto_39562 ) ) ( not ( = ?auto_39561 ?auto_39563 ) ) ( not ( = ?auto_39561 ?auto_39564 ) ) ( not ( = ?auto_39561 ?auto_39570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39562 ?auto_39563 ?auto_39564 )
      ( MAKE-4CRATE-VERIFY ?auto_39560 ?auto_39561 ?auto_39562 ?auto_39563 ?auto_39564 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39599 - SURFACE
      ?auto_39600 - SURFACE
      ?auto_39601 - SURFACE
      ?auto_39602 - SURFACE
      ?auto_39603 - SURFACE
    )
    :vars
    (
      ?auto_39604 - HOIST
      ?auto_39606 - PLACE
      ?auto_39607 - PLACE
      ?auto_39609 - HOIST
      ?auto_39605 - SURFACE
      ?auto_39608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39604 ?auto_39606 ) ( IS-CRATE ?auto_39603 ) ( not ( = ?auto_39602 ?auto_39603 ) ) ( not ( = ?auto_39601 ?auto_39602 ) ) ( not ( = ?auto_39601 ?auto_39603 ) ) ( not ( = ?auto_39607 ?auto_39606 ) ) ( HOIST-AT ?auto_39609 ?auto_39607 ) ( not ( = ?auto_39604 ?auto_39609 ) ) ( AVAILABLE ?auto_39609 ) ( SURFACE-AT ?auto_39603 ?auto_39607 ) ( ON ?auto_39603 ?auto_39605 ) ( CLEAR ?auto_39603 ) ( not ( = ?auto_39602 ?auto_39605 ) ) ( not ( = ?auto_39603 ?auto_39605 ) ) ( not ( = ?auto_39601 ?auto_39605 ) ) ( TRUCK-AT ?auto_39608 ?auto_39606 ) ( SURFACE-AT ?auto_39601 ?auto_39606 ) ( CLEAR ?auto_39601 ) ( LIFTING ?auto_39604 ?auto_39602 ) ( IS-CRATE ?auto_39602 ) ( ON ?auto_39600 ?auto_39599 ) ( ON ?auto_39601 ?auto_39600 ) ( not ( = ?auto_39599 ?auto_39600 ) ) ( not ( = ?auto_39599 ?auto_39601 ) ) ( not ( = ?auto_39599 ?auto_39602 ) ) ( not ( = ?auto_39599 ?auto_39603 ) ) ( not ( = ?auto_39599 ?auto_39605 ) ) ( not ( = ?auto_39600 ?auto_39601 ) ) ( not ( = ?auto_39600 ?auto_39602 ) ) ( not ( = ?auto_39600 ?auto_39603 ) ) ( not ( = ?auto_39600 ?auto_39605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39601 ?auto_39602 ?auto_39603 )
      ( MAKE-4CRATE-VERIFY ?auto_39599 ?auto_39600 ?auto_39601 ?auto_39602 ?auto_39603 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_39638 - SURFACE
      ?auto_39639 - SURFACE
      ?auto_39640 - SURFACE
      ?auto_39641 - SURFACE
      ?auto_39642 - SURFACE
    )
    :vars
    (
      ?auto_39644 - HOIST
      ?auto_39643 - PLACE
      ?auto_39648 - PLACE
      ?auto_39645 - HOIST
      ?auto_39646 - SURFACE
      ?auto_39647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_39644 ?auto_39643 ) ( IS-CRATE ?auto_39642 ) ( not ( = ?auto_39641 ?auto_39642 ) ) ( not ( = ?auto_39640 ?auto_39641 ) ) ( not ( = ?auto_39640 ?auto_39642 ) ) ( not ( = ?auto_39648 ?auto_39643 ) ) ( HOIST-AT ?auto_39645 ?auto_39648 ) ( not ( = ?auto_39644 ?auto_39645 ) ) ( AVAILABLE ?auto_39645 ) ( SURFACE-AT ?auto_39642 ?auto_39648 ) ( ON ?auto_39642 ?auto_39646 ) ( CLEAR ?auto_39642 ) ( not ( = ?auto_39641 ?auto_39646 ) ) ( not ( = ?auto_39642 ?auto_39646 ) ) ( not ( = ?auto_39640 ?auto_39646 ) ) ( TRUCK-AT ?auto_39647 ?auto_39643 ) ( SURFACE-AT ?auto_39640 ?auto_39643 ) ( CLEAR ?auto_39640 ) ( IS-CRATE ?auto_39641 ) ( AVAILABLE ?auto_39644 ) ( IN ?auto_39641 ?auto_39647 ) ( ON ?auto_39639 ?auto_39638 ) ( ON ?auto_39640 ?auto_39639 ) ( not ( = ?auto_39638 ?auto_39639 ) ) ( not ( = ?auto_39638 ?auto_39640 ) ) ( not ( = ?auto_39638 ?auto_39641 ) ) ( not ( = ?auto_39638 ?auto_39642 ) ) ( not ( = ?auto_39638 ?auto_39646 ) ) ( not ( = ?auto_39639 ?auto_39640 ) ) ( not ( = ?auto_39639 ?auto_39641 ) ) ( not ( = ?auto_39639 ?auto_39642 ) ) ( not ( = ?auto_39639 ?auto_39646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_39640 ?auto_39641 ?auto_39642 )
      ( MAKE-4CRATE-VERIFY ?auto_39638 ?auto_39639 ?auto_39640 ?auto_39641 ?auto_39642 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40298 - SURFACE
      ?auto_40299 - SURFACE
      ?auto_40300 - SURFACE
      ?auto_40301 - SURFACE
      ?auto_40302 - SURFACE
      ?auto_40303 - SURFACE
    )
    :vars
    (
      ?auto_40305 - HOIST
      ?auto_40304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40305 ?auto_40304 ) ( SURFACE-AT ?auto_40302 ?auto_40304 ) ( CLEAR ?auto_40302 ) ( LIFTING ?auto_40305 ?auto_40303 ) ( IS-CRATE ?auto_40303 ) ( not ( = ?auto_40302 ?auto_40303 ) ) ( ON ?auto_40299 ?auto_40298 ) ( ON ?auto_40300 ?auto_40299 ) ( ON ?auto_40301 ?auto_40300 ) ( ON ?auto_40302 ?auto_40301 ) ( not ( = ?auto_40298 ?auto_40299 ) ) ( not ( = ?auto_40298 ?auto_40300 ) ) ( not ( = ?auto_40298 ?auto_40301 ) ) ( not ( = ?auto_40298 ?auto_40302 ) ) ( not ( = ?auto_40298 ?auto_40303 ) ) ( not ( = ?auto_40299 ?auto_40300 ) ) ( not ( = ?auto_40299 ?auto_40301 ) ) ( not ( = ?auto_40299 ?auto_40302 ) ) ( not ( = ?auto_40299 ?auto_40303 ) ) ( not ( = ?auto_40300 ?auto_40301 ) ) ( not ( = ?auto_40300 ?auto_40302 ) ) ( not ( = ?auto_40300 ?auto_40303 ) ) ( not ( = ?auto_40301 ?auto_40302 ) ) ( not ( = ?auto_40301 ?auto_40303 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_40302 ?auto_40303 )
      ( MAKE-5CRATE-VERIFY ?auto_40298 ?auto_40299 ?auto_40300 ?auto_40301 ?auto_40302 ?auto_40303 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40332 - SURFACE
      ?auto_40333 - SURFACE
      ?auto_40334 - SURFACE
      ?auto_40335 - SURFACE
      ?auto_40336 - SURFACE
      ?auto_40337 - SURFACE
    )
    :vars
    (
      ?auto_40338 - HOIST
      ?auto_40340 - PLACE
      ?auto_40339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40338 ?auto_40340 ) ( SURFACE-AT ?auto_40336 ?auto_40340 ) ( CLEAR ?auto_40336 ) ( IS-CRATE ?auto_40337 ) ( not ( = ?auto_40336 ?auto_40337 ) ) ( TRUCK-AT ?auto_40339 ?auto_40340 ) ( AVAILABLE ?auto_40338 ) ( IN ?auto_40337 ?auto_40339 ) ( ON ?auto_40336 ?auto_40335 ) ( not ( = ?auto_40335 ?auto_40336 ) ) ( not ( = ?auto_40335 ?auto_40337 ) ) ( ON ?auto_40333 ?auto_40332 ) ( ON ?auto_40334 ?auto_40333 ) ( ON ?auto_40335 ?auto_40334 ) ( not ( = ?auto_40332 ?auto_40333 ) ) ( not ( = ?auto_40332 ?auto_40334 ) ) ( not ( = ?auto_40332 ?auto_40335 ) ) ( not ( = ?auto_40332 ?auto_40336 ) ) ( not ( = ?auto_40332 ?auto_40337 ) ) ( not ( = ?auto_40333 ?auto_40334 ) ) ( not ( = ?auto_40333 ?auto_40335 ) ) ( not ( = ?auto_40333 ?auto_40336 ) ) ( not ( = ?auto_40333 ?auto_40337 ) ) ( not ( = ?auto_40334 ?auto_40335 ) ) ( not ( = ?auto_40334 ?auto_40336 ) ) ( not ( = ?auto_40334 ?auto_40337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40335 ?auto_40336 ?auto_40337 )
      ( MAKE-5CRATE-VERIFY ?auto_40332 ?auto_40333 ?auto_40334 ?auto_40335 ?auto_40336 ?auto_40337 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40372 - SURFACE
      ?auto_40373 - SURFACE
      ?auto_40374 - SURFACE
      ?auto_40375 - SURFACE
      ?auto_40376 - SURFACE
      ?auto_40377 - SURFACE
    )
    :vars
    (
      ?auto_40378 - HOIST
      ?auto_40380 - PLACE
      ?auto_40379 - TRUCK
      ?auto_40381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40378 ?auto_40380 ) ( SURFACE-AT ?auto_40376 ?auto_40380 ) ( CLEAR ?auto_40376 ) ( IS-CRATE ?auto_40377 ) ( not ( = ?auto_40376 ?auto_40377 ) ) ( AVAILABLE ?auto_40378 ) ( IN ?auto_40377 ?auto_40379 ) ( ON ?auto_40376 ?auto_40375 ) ( not ( = ?auto_40375 ?auto_40376 ) ) ( not ( = ?auto_40375 ?auto_40377 ) ) ( TRUCK-AT ?auto_40379 ?auto_40381 ) ( not ( = ?auto_40381 ?auto_40380 ) ) ( ON ?auto_40373 ?auto_40372 ) ( ON ?auto_40374 ?auto_40373 ) ( ON ?auto_40375 ?auto_40374 ) ( not ( = ?auto_40372 ?auto_40373 ) ) ( not ( = ?auto_40372 ?auto_40374 ) ) ( not ( = ?auto_40372 ?auto_40375 ) ) ( not ( = ?auto_40372 ?auto_40376 ) ) ( not ( = ?auto_40372 ?auto_40377 ) ) ( not ( = ?auto_40373 ?auto_40374 ) ) ( not ( = ?auto_40373 ?auto_40375 ) ) ( not ( = ?auto_40373 ?auto_40376 ) ) ( not ( = ?auto_40373 ?auto_40377 ) ) ( not ( = ?auto_40374 ?auto_40375 ) ) ( not ( = ?auto_40374 ?auto_40376 ) ) ( not ( = ?auto_40374 ?auto_40377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40375 ?auto_40376 ?auto_40377 )
      ( MAKE-5CRATE-VERIFY ?auto_40372 ?auto_40373 ?auto_40374 ?auto_40375 ?auto_40376 ?auto_40377 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40417 - SURFACE
      ?auto_40418 - SURFACE
      ?auto_40419 - SURFACE
      ?auto_40420 - SURFACE
      ?auto_40421 - SURFACE
      ?auto_40422 - SURFACE
    )
    :vars
    (
      ?auto_40426 - HOIST
      ?auto_40425 - PLACE
      ?auto_40424 - TRUCK
      ?auto_40427 - PLACE
      ?auto_40423 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_40426 ?auto_40425 ) ( SURFACE-AT ?auto_40421 ?auto_40425 ) ( CLEAR ?auto_40421 ) ( IS-CRATE ?auto_40422 ) ( not ( = ?auto_40421 ?auto_40422 ) ) ( AVAILABLE ?auto_40426 ) ( ON ?auto_40421 ?auto_40420 ) ( not ( = ?auto_40420 ?auto_40421 ) ) ( not ( = ?auto_40420 ?auto_40422 ) ) ( TRUCK-AT ?auto_40424 ?auto_40427 ) ( not ( = ?auto_40427 ?auto_40425 ) ) ( HOIST-AT ?auto_40423 ?auto_40427 ) ( LIFTING ?auto_40423 ?auto_40422 ) ( not ( = ?auto_40426 ?auto_40423 ) ) ( ON ?auto_40418 ?auto_40417 ) ( ON ?auto_40419 ?auto_40418 ) ( ON ?auto_40420 ?auto_40419 ) ( not ( = ?auto_40417 ?auto_40418 ) ) ( not ( = ?auto_40417 ?auto_40419 ) ) ( not ( = ?auto_40417 ?auto_40420 ) ) ( not ( = ?auto_40417 ?auto_40421 ) ) ( not ( = ?auto_40417 ?auto_40422 ) ) ( not ( = ?auto_40418 ?auto_40419 ) ) ( not ( = ?auto_40418 ?auto_40420 ) ) ( not ( = ?auto_40418 ?auto_40421 ) ) ( not ( = ?auto_40418 ?auto_40422 ) ) ( not ( = ?auto_40419 ?auto_40420 ) ) ( not ( = ?auto_40419 ?auto_40421 ) ) ( not ( = ?auto_40419 ?auto_40422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40420 ?auto_40421 ?auto_40422 )
      ( MAKE-5CRATE-VERIFY ?auto_40417 ?auto_40418 ?auto_40419 ?auto_40420 ?auto_40421 ?auto_40422 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40467 - SURFACE
      ?auto_40468 - SURFACE
      ?auto_40469 - SURFACE
      ?auto_40470 - SURFACE
      ?auto_40471 - SURFACE
      ?auto_40472 - SURFACE
    )
    :vars
    (
      ?auto_40477 - HOIST
      ?auto_40478 - PLACE
      ?auto_40474 - TRUCK
      ?auto_40473 - PLACE
      ?auto_40475 - HOIST
      ?auto_40476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40477 ?auto_40478 ) ( SURFACE-AT ?auto_40471 ?auto_40478 ) ( CLEAR ?auto_40471 ) ( IS-CRATE ?auto_40472 ) ( not ( = ?auto_40471 ?auto_40472 ) ) ( AVAILABLE ?auto_40477 ) ( ON ?auto_40471 ?auto_40470 ) ( not ( = ?auto_40470 ?auto_40471 ) ) ( not ( = ?auto_40470 ?auto_40472 ) ) ( TRUCK-AT ?auto_40474 ?auto_40473 ) ( not ( = ?auto_40473 ?auto_40478 ) ) ( HOIST-AT ?auto_40475 ?auto_40473 ) ( not ( = ?auto_40477 ?auto_40475 ) ) ( AVAILABLE ?auto_40475 ) ( SURFACE-AT ?auto_40472 ?auto_40473 ) ( ON ?auto_40472 ?auto_40476 ) ( CLEAR ?auto_40472 ) ( not ( = ?auto_40471 ?auto_40476 ) ) ( not ( = ?auto_40472 ?auto_40476 ) ) ( not ( = ?auto_40470 ?auto_40476 ) ) ( ON ?auto_40468 ?auto_40467 ) ( ON ?auto_40469 ?auto_40468 ) ( ON ?auto_40470 ?auto_40469 ) ( not ( = ?auto_40467 ?auto_40468 ) ) ( not ( = ?auto_40467 ?auto_40469 ) ) ( not ( = ?auto_40467 ?auto_40470 ) ) ( not ( = ?auto_40467 ?auto_40471 ) ) ( not ( = ?auto_40467 ?auto_40472 ) ) ( not ( = ?auto_40467 ?auto_40476 ) ) ( not ( = ?auto_40468 ?auto_40469 ) ) ( not ( = ?auto_40468 ?auto_40470 ) ) ( not ( = ?auto_40468 ?auto_40471 ) ) ( not ( = ?auto_40468 ?auto_40472 ) ) ( not ( = ?auto_40468 ?auto_40476 ) ) ( not ( = ?auto_40469 ?auto_40470 ) ) ( not ( = ?auto_40469 ?auto_40471 ) ) ( not ( = ?auto_40469 ?auto_40472 ) ) ( not ( = ?auto_40469 ?auto_40476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40470 ?auto_40471 ?auto_40472 )
      ( MAKE-5CRATE-VERIFY ?auto_40467 ?auto_40468 ?auto_40469 ?auto_40470 ?auto_40471 ?auto_40472 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40518 - SURFACE
      ?auto_40519 - SURFACE
      ?auto_40520 - SURFACE
      ?auto_40521 - SURFACE
      ?auto_40522 - SURFACE
      ?auto_40523 - SURFACE
    )
    :vars
    (
      ?auto_40528 - HOIST
      ?auto_40529 - PLACE
      ?auto_40524 - PLACE
      ?auto_40526 - HOIST
      ?auto_40525 - SURFACE
      ?auto_40527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40528 ?auto_40529 ) ( SURFACE-AT ?auto_40522 ?auto_40529 ) ( CLEAR ?auto_40522 ) ( IS-CRATE ?auto_40523 ) ( not ( = ?auto_40522 ?auto_40523 ) ) ( AVAILABLE ?auto_40528 ) ( ON ?auto_40522 ?auto_40521 ) ( not ( = ?auto_40521 ?auto_40522 ) ) ( not ( = ?auto_40521 ?auto_40523 ) ) ( not ( = ?auto_40524 ?auto_40529 ) ) ( HOIST-AT ?auto_40526 ?auto_40524 ) ( not ( = ?auto_40528 ?auto_40526 ) ) ( AVAILABLE ?auto_40526 ) ( SURFACE-AT ?auto_40523 ?auto_40524 ) ( ON ?auto_40523 ?auto_40525 ) ( CLEAR ?auto_40523 ) ( not ( = ?auto_40522 ?auto_40525 ) ) ( not ( = ?auto_40523 ?auto_40525 ) ) ( not ( = ?auto_40521 ?auto_40525 ) ) ( TRUCK-AT ?auto_40527 ?auto_40529 ) ( ON ?auto_40519 ?auto_40518 ) ( ON ?auto_40520 ?auto_40519 ) ( ON ?auto_40521 ?auto_40520 ) ( not ( = ?auto_40518 ?auto_40519 ) ) ( not ( = ?auto_40518 ?auto_40520 ) ) ( not ( = ?auto_40518 ?auto_40521 ) ) ( not ( = ?auto_40518 ?auto_40522 ) ) ( not ( = ?auto_40518 ?auto_40523 ) ) ( not ( = ?auto_40518 ?auto_40525 ) ) ( not ( = ?auto_40519 ?auto_40520 ) ) ( not ( = ?auto_40519 ?auto_40521 ) ) ( not ( = ?auto_40519 ?auto_40522 ) ) ( not ( = ?auto_40519 ?auto_40523 ) ) ( not ( = ?auto_40519 ?auto_40525 ) ) ( not ( = ?auto_40520 ?auto_40521 ) ) ( not ( = ?auto_40520 ?auto_40522 ) ) ( not ( = ?auto_40520 ?auto_40523 ) ) ( not ( = ?auto_40520 ?auto_40525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40521 ?auto_40522 ?auto_40523 )
      ( MAKE-5CRATE-VERIFY ?auto_40518 ?auto_40519 ?auto_40520 ?auto_40521 ?auto_40522 ?auto_40523 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40569 - SURFACE
      ?auto_40570 - SURFACE
      ?auto_40571 - SURFACE
      ?auto_40572 - SURFACE
      ?auto_40573 - SURFACE
      ?auto_40574 - SURFACE
    )
    :vars
    (
      ?auto_40575 - HOIST
      ?auto_40578 - PLACE
      ?auto_40577 - PLACE
      ?auto_40576 - HOIST
      ?auto_40580 - SURFACE
      ?auto_40579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40575 ?auto_40578 ) ( IS-CRATE ?auto_40574 ) ( not ( = ?auto_40573 ?auto_40574 ) ) ( not ( = ?auto_40572 ?auto_40573 ) ) ( not ( = ?auto_40572 ?auto_40574 ) ) ( not ( = ?auto_40577 ?auto_40578 ) ) ( HOIST-AT ?auto_40576 ?auto_40577 ) ( not ( = ?auto_40575 ?auto_40576 ) ) ( AVAILABLE ?auto_40576 ) ( SURFACE-AT ?auto_40574 ?auto_40577 ) ( ON ?auto_40574 ?auto_40580 ) ( CLEAR ?auto_40574 ) ( not ( = ?auto_40573 ?auto_40580 ) ) ( not ( = ?auto_40574 ?auto_40580 ) ) ( not ( = ?auto_40572 ?auto_40580 ) ) ( TRUCK-AT ?auto_40579 ?auto_40578 ) ( SURFACE-AT ?auto_40572 ?auto_40578 ) ( CLEAR ?auto_40572 ) ( LIFTING ?auto_40575 ?auto_40573 ) ( IS-CRATE ?auto_40573 ) ( ON ?auto_40570 ?auto_40569 ) ( ON ?auto_40571 ?auto_40570 ) ( ON ?auto_40572 ?auto_40571 ) ( not ( = ?auto_40569 ?auto_40570 ) ) ( not ( = ?auto_40569 ?auto_40571 ) ) ( not ( = ?auto_40569 ?auto_40572 ) ) ( not ( = ?auto_40569 ?auto_40573 ) ) ( not ( = ?auto_40569 ?auto_40574 ) ) ( not ( = ?auto_40569 ?auto_40580 ) ) ( not ( = ?auto_40570 ?auto_40571 ) ) ( not ( = ?auto_40570 ?auto_40572 ) ) ( not ( = ?auto_40570 ?auto_40573 ) ) ( not ( = ?auto_40570 ?auto_40574 ) ) ( not ( = ?auto_40570 ?auto_40580 ) ) ( not ( = ?auto_40571 ?auto_40572 ) ) ( not ( = ?auto_40571 ?auto_40573 ) ) ( not ( = ?auto_40571 ?auto_40574 ) ) ( not ( = ?auto_40571 ?auto_40580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40572 ?auto_40573 ?auto_40574 )
      ( MAKE-5CRATE-VERIFY ?auto_40569 ?auto_40570 ?auto_40571 ?auto_40572 ?auto_40573 ?auto_40574 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_40620 - SURFACE
      ?auto_40621 - SURFACE
      ?auto_40622 - SURFACE
      ?auto_40623 - SURFACE
      ?auto_40624 - SURFACE
      ?auto_40625 - SURFACE
    )
    :vars
    (
      ?auto_40627 - HOIST
      ?auto_40626 - PLACE
      ?auto_40631 - PLACE
      ?auto_40629 - HOIST
      ?auto_40630 - SURFACE
      ?auto_40628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_40627 ?auto_40626 ) ( IS-CRATE ?auto_40625 ) ( not ( = ?auto_40624 ?auto_40625 ) ) ( not ( = ?auto_40623 ?auto_40624 ) ) ( not ( = ?auto_40623 ?auto_40625 ) ) ( not ( = ?auto_40631 ?auto_40626 ) ) ( HOIST-AT ?auto_40629 ?auto_40631 ) ( not ( = ?auto_40627 ?auto_40629 ) ) ( AVAILABLE ?auto_40629 ) ( SURFACE-AT ?auto_40625 ?auto_40631 ) ( ON ?auto_40625 ?auto_40630 ) ( CLEAR ?auto_40625 ) ( not ( = ?auto_40624 ?auto_40630 ) ) ( not ( = ?auto_40625 ?auto_40630 ) ) ( not ( = ?auto_40623 ?auto_40630 ) ) ( TRUCK-AT ?auto_40628 ?auto_40626 ) ( SURFACE-AT ?auto_40623 ?auto_40626 ) ( CLEAR ?auto_40623 ) ( IS-CRATE ?auto_40624 ) ( AVAILABLE ?auto_40627 ) ( IN ?auto_40624 ?auto_40628 ) ( ON ?auto_40621 ?auto_40620 ) ( ON ?auto_40622 ?auto_40621 ) ( ON ?auto_40623 ?auto_40622 ) ( not ( = ?auto_40620 ?auto_40621 ) ) ( not ( = ?auto_40620 ?auto_40622 ) ) ( not ( = ?auto_40620 ?auto_40623 ) ) ( not ( = ?auto_40620 ?auto_40624 ) ) ( not ( = ?auto_40620 ?auto_40625 ) ) ( not ( = ?auto_40620 ?auto_40630 ) ) ( not ( = ?auto_40621 ?auto_40622 ) ) ( not ( = ?auto_40621 ?auto_40623 ) ) ( not ( = ?auto_40621 ?auto_40624 ) ) ( not ( = ?auto_40621 ?auto_40625 ) ) ( not ( = ?auto_40621 ?auto_40630 ) ) ( not ( = ?auto_40622 ?auto_40623 ) ) ( not ( = ?auto_40622 ?auto_40624 ) ) ( not ( = ?auto_40622 ?auto_40625 ) ) ( not ( = ?auto_40622 ?auto_40630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_40623 ?auto_40624 ?auto_40625 )
      ( MAKE-5CRATE-VERIFY ?auto_40620 ?auto_40621 ?auto_40622 ?auto_40623 ?auto_40624 ?auto_40625 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_40988 - SURFACE
      ?auto_40989 - SURFACE
    )
    :vars
    (
      ?auto_40992 - HOIST
      ?auto_40994 - PLACE
      ?auto_40995 - SURFACE
      ?auto_40993 - TRUCK
      ?auto_40996 - PLACE
      ?auto_40991 - HOIST
      ?auto_40990 - SURFACE
      ?auto_40997 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_40992 ?auto_40994 ) ( SURFACE-AT ?auto_40988 ?auto_40994 ) ( CLEAR ?auto_40988 ) ( IS-CRATE ?auto_40989 ) ( not ( = ?auto_40988 ?auto_40989 ) ) ( AVAILABLE ?auto_40992 ) ( ON ?auto_40988 ?auto_40995 ) ( not ( = ?auto_40995 ?auto_40988 ) ) ( not ( = ?auto_40995 ?auto_40989 ) ) ( TRUCK-AT ?auto_40993 ?auto_40996 ) ( not ( = ?auto_40996 ?auto_40994 ) ) ( HOIST-AT ?auto_40991 ?auto_40996 ) ( not ( = ?auto_40992 ?auto_40991 ) ) ( SURFACE-AT ?auto_40989 ?auto_40996 ) ( ON ?auto_40989 ?auto_40990 ) ( CLEAR ?auto_40989 ) ( not ( = ?auto_40988 ?auto_40990 ) ) ( not ( = ?auto_40989 ?auto_40990 ) ) ( not ( = ?auto_40995 ?auto_40990 ) ) ( LIFTING ?auto_40991 ?auto_40997 ) ( IS-CRATE ?auto_40997 ) ( not ( = ?auto_40988 ?auto_40997 ) ) ( not ( = ?auto_40989 ?auto_40997 ) ) ( not ( = ?auto_40995 ?auto_40997 ) ) ( not ( = ?auto_40990 ?auto_40997 ) ) )
    :subtasks
    ( ( !LOAD ?auto_40991 ?auto_40997 ?auto_40993 ?auto_40996 )
      ( MAKE-1CRATE ?auto_40988 ?auto_40989 )
      ( MAKE-1CRATE-VERIFY ?auto_40988 ?auto_40989 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41825 - SURFACE
      ?auto_41826 - SURFACE
      ?auto_41827 - SURFACE
      ?auto_41828 - SURFACE
      ?auto_41829 - SURFACE
      ?auto_41830 - SURFACE
      ?auto_41831 - SURFACE
    )
    :vars
    (
      ?auto_41833 - HOIST
      ?auto_41832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41833 ?auto_41832 ) ( SURFACE-AT ?auto_41830 ?auto_41832 ) ( CLEAR ?auto_41830 ) ( LIFTING ?auto_41833 ?auto_41831 ) ( IS-CRATE ?auto_41831 ) ( not ( = ?auto_41830 ?auto_41831 ) ) ( ON ?auto_41826 ?auto_41825 ) ( ON ?auto_41827 ?auto_41826 ) ( ON ?auto_41828 ?auto_41827 ) ( ON ?auto_41829 ?auto_41828 ) ( ON ?auto_41830 ?auto_41829 ) ( not ( = ?auto_41825 ?auto_41826 ) ) ( not ( = ?auto_41825 ?auto_41827 ) ) ( not ( = ?auto_41825 ?auto_41828 ) ) ( not ( = ?auto_41825 ?auto_41829 ) ) ( not ( = ?auto_41825 ?auto_41830 ) ) ( not ( = ?auto_41825 ?auto_41831 ) ) ( not ( = ?auto_41826 ?auto_41827 ) ) ( not ( = ?auto_41826 ?auto_41828 ) ) ( not ( = ?auto_41826 ?auto_41829 ) ) ( not ( = ?auto_41826 ?auto_41830 ) ) ( not ( = ?auto_41826 ?auto_41831 ) ) ( not ( = ?auto_41827 ?auto_41828 ) ) ( not ( = ?auto_41827 ?auto_41829 ) ) ( not ( = ?auto_41827 ?auto_41830 ) ) ( not ( = ?auto_41827 ?auto_41831 ) ) ( not ( = ?auto_41828 ?auto_41829 ) ) ( not ( = ?auto_41828 ?auto_41830 ) ) ( not ( = ?auto_41828 ?auto_41831 ) ) ( not ( = ?auto_41829 ?auto_41830 ) ) ( not ( = ?auto_41829 ?auto_41831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_41830 ?auto_41831 )
      ( MAKE-6CRATE-VERIFY ?auto_41825 ?auto_41826 ?auto_41827 ?auto_41828 ?auto_41829 ?auto_41830 ?auto_41831 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41869 - SURFACE
      ?auto_41870 - SURFACE
      ?auto_41871 - SURFACE
      ?auto_41872 - SURFACE
      ?auto_41873 - SURFACE
      ?auto_41874 - SURFACE
      ?auto_41875 - SURFACE
    )
    :vars
    (
      ?auto_41877 - HOIST
      ?auto_41876 - PLACE
      ?auto_41878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_41877 ?auto_41876 ) ( SURFACE-AT ?auto_41874 ?auto_41876 ) ( CLEAR ?auto_41874 ) ( IS-CRATE ?auto_41875 ) ( not ( = ?auto_41874 ?auto_41875 ) ) ( TRUCK-AT ?auto_41878 ?auto_41876 ) ( AVAILABLE ?auto_41877 ) ( IN ?auto_41875 ?auto_41878 ) ( ON ?auto_41874 ?auto_41873 ) ( not ( = ?auto_41873 ?auto_41874 ) ) ( not ( = ?auto_41873 ?auto_41875 ) ) ( ON ?auto_41870 ?auto_41869 ) ( ON ?auto_41871 ?auto_41870 ) ( ON ?auto_41872 ?auto_41871 ) ( ON ?auto_41873 ?auto_41872 ) ( not ( = ?auto_41869 ?auto_41870 ) ) ( not ( = ?auto_41869 ?auto_41871 ) ) ( not ( = ?auto_41869 ?auto_41872 ) ) ( not ( = ?auto_41869 ?auto_41873 ) ) ( not ( = ?auto_41869 ?auto_41874 ) ) ( not ( = ?auto_41869 ?auto_41875 ) ) ( not ( = ?auto_41870 ?auto_41871 ) ) ( not ( = ?auto_41870 ?auto_41872 ) ) ( not ( = ?auto_41870 ?auto_41873 ) ) ( not ( = ?auto_41870 ?auto_41874 ) ) ( not ( = ?auto_41870 ?auto_41875 ) ) ( not ( = ?auto_41871 ?auto_41872 ) ) ( not ( = ?auto_41871 ?auto_41873 ) ) ( not ( = ?auto_41871 ?auto_41874 ) ) ( not ( = ?auto_41871 ?auto_41875 ) ) ( not ( = ?auto_41872 ?auto_41873 ) ) ( not ( = ?auto_41872 ?auto_41874 ) ) ( not ( = ?auto_41872 ?auto_41875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41873 ?auto_41874 ?auto_41875 )
      ( MAKE-6CRATE-VERIFY ?auto_41869 ?auto_41870 ?auto_41871 ?auto_41872 ?auto_41873 ?auto_41874 ?auto_41875 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41920 - SURFACE
      ?auto_41921 - SURFACE
      ?auto_41922 - SURFACE
      ?auto_41923 - SURFACE
      ?auto_41924 - SURFACE
      ?auto_41925 - SURFACE
      ?auto_41926 - SURFACE
    )
    :vars
    (
      ?auto_41928 - HOIST
      ?auto_41927 - PLACE
      ?auto_41930 - TRUCK
      ?auto_41929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_41928 ?auto_41927 ) ( SURFACE-AT ?auto_41925 ?auto_41927 ) ( CLEAR ?auto_41925 ) ( IS-CRATE ?auto_41926 ) ( not ( = ?auto_41925 ?auto_41926 ) ) ( AVAILABLE ?auto_41928 ) ( IN ?auto_41926 ?auto_41930 ) ( ON ?auto_41925 ?auto_41924 ) ( not ( = ?auto_41924 ?auto_41925 ) ) ( not ( = ?auto_41924 ?auto_41926 ) ) ( TRUCK-AT ?auto_41930 ?auto_41929 ) ( not ( = ?auto_41929 ?auto_41927 ) ) ( ON ?auto_41921 ?auto_41920 ) ( ON ?auto_41922 ?auto_41921 ) ( ON ?auto_41923 ?auto_41922 ) ( ON ?auto_41924 ?auto_41923 ) ( not ( = ?auto_41920 ?auto_41921 ) ) ( not ( = ?auto_41920 ?auto_41922 ) ) ( not ( = ?auto_41920 ?auto_41923 ) ) ( not ( = ?auto_41920 ?auto_41924 ) ) ( not ( = ?auto_41920 ?auto_41925 ) ) ( not ( = ?auto_41920 ?auto_41926 ) ) ( not ( = ?auto_41921 ?auto_41922 ) ) ( not ( = ?auto_41921 ?auto_41923 ) ) ( not ( = ?auto_41921 ?auto_41924 ) ) ( not ( = ?auto_41921 ?auto_41925 ) ) ( not ( = ?auto_41921 ?auto_41926 ) ) ( not ( = ?auto_41922 ?auto_41923 ) ) ( not ( = ?auto_41922 ?auto_41924 ) ) ( not ( = ?auto_41922 ?auto_41925 ) ) ( not ( = ?auto_41922 ?auto_41926 ) ) ( not ( = ?auto_41923 ?auto_41924 ) ) ( not ( = ?auto_41923 ?auto_41925 ) ) ( not ( = ?auto_41923 ?auto_41926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41924 ?auto_41925 ?auto_41926 )
      ( MAKE-6CRATE-VERIFY ?auto_41920 ?auto_41921 ?auto_41922 ?auto_41923 ?auto_41924 ?auto_41925 ?auto_41926 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_41977 - SURFACE
      ?auto_41978 - SURFACE
      ?auto_41979 - SURFACE
      ?auto_41980 - SURFACE
      ?auto_41981 - SURFACE
      ?auto_41982 - SURFACE
      ?auto_41983 - SURFACE
    )
    :vars
    (
      ?auto_41988 - HOIST
      ?auto_41985 - PLACE
      ?auto_41986 - TRUCK
      ?auto_41984 - PLACE
      ?auto_41987 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_41988 ?auto_41985 ) ( SURFACE-AT ?auto_41982 ?auto_41985 ) ( CLEAR ?auto_41982 ) ( IS-CRATE ?auto_41983 ) ( not ( = ?auto_41982 ?auto_41983 ) ) ( AVAILABLE ?auto_41988 ) ( ON ?auto_41982 ?auto_41981 ) ( not ( = ?auto_41981 ?auto_41982 ) ) ( not ( = ?auto_41981 ?auto_41983 ) ) ( TRUCK-AT ?auto_41986 ?auto_41984 ) ( not ( = ?auto_41984 ?auto_41985 ) ) ( HOIST-AT ?auto_41987 ?auto_41984 ) ( LIFTING ?auto_41987 ?auto_41983 ) ( not ( = ?auto_41988 ?auto_41987 ) ) ( ON ?auto_41978 ?auto_41977 ) ( ON ?auto_41979 ?auto_41978 ) ( ON ?auto_41980 ?auto_41979 ) ( ON ?auto_41981 ?auto_41980 ) ( not ( = ?auto_41977 ?auto_41978 ) ) ( not ( = ?auto_41977 ?auto_41979 ) ) ( not ( = ?auto_41977 ?auto_41980 ) ) ( not ( = ?auto_41977 ?auto_41981 ) ) ( not ( = ?auto_41977 ?auto_41982 ) ) ( not ( = ?auto_41977 ?auto_41983 ) ) ( not ( = ?auto_41978 ?auto_41979 ) ) ( not ( = ?auto_41978 ?auto_41980 ) ) ( not ( = ?auto_41978 ?auto_41981 ) ) ( not ( = ?auto_41978 ?auto_41982 ) ) ( not ( = ?auto_41978 ?auto_41983 ) ) ( not ( = ?auto_41979 ?auto_41980 ) ) ( not ( = ?auto_41979 ?auto_41981 ) ) ( not ( = ?auto_41979 ?auto_41982 ) ) ( not ( = ?auto_41979 ?auto_41983 ) ) ( not ( = ?auto_41980 ?auto_41981 ) ) ( not ( = ?auto_41980 ?auto_41982 ) ) ( not ( = ?auto_41980 ?auto_41983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_41981 ?auto_41982 ?auto_41983 )
      ( MAKE-6CRATE-VERIFY ?auto_41977 ?auto_41978 ?auto_41979 ?auto_41980 ?auto_41981 ?auto_41982 ?auto_41983 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42040 - SURFACE
      ?auto_42041 - SURFACE
      ?auto_42042 - SURFACE
      ?auto_42043 - SURFACE
      ?auto_42044 - SURFACE
      ?auto_42045 - SURFACE
      ?auto_42046 - SURFACE
    )
    :vars
    (
      ?auto_42047 - HOIST
      ?auto_42050 - PLACE
      ?auto_42049 - TRUCK
      ?auto_42052 - PLACE
      ?auto_42051 - HOIST
      ?auto_42048 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_42047 ?auto_42050 ) ( SURFACE-AT ?auto_42045 ?auto_42050 ) ( CLEAR ?auto_42045 ) ( IS-CRATE ?auto_42046 ) ( not ( = ?auto_42045 ?auto_42046 ) ) ( AVAILABLE ?auto_42047 ) ( ON ?auto_42045 ?auto_42044 ) ( not ( = ?auto_42044 ?auto_42045 ) ) ( not ( = ?auto_42044 ?auto_42046 ) ) ( TRUCK-AT ?auto_42049 ?auto_42052 ) ( not ( = ?auto_42052 ?auto_42050 ) ) ( HOIST-AT ?auto_42051 ?auto_42052 ) ( not ( = ?auto_42047 ?auto_42051 ) ) ( AVAILABLE ?auto_42051 ) ( SURFACE-AT ?auto_42046 ?auto_42052 ) ( ON ?auto_42046 ?auto_42048 ) ( CLEAR ?auto_42046 ) ( not ( = ?auto_42045 ?auto_42048 ) ) ( not ( = ?auto_42046 ?auto_42048 ) ) ( not ( = ?auto_42044 ?auto_42048 ) ) ( ON ?auto_42041 ?auto_42040 ) ( ON ?auto_42042 ?auto_42041 ) ( ON ?auto_42043 ?auto_42042 ) ( ON ?auto_42044 ?auto_42043 ) ( not ( = ?auto_42040 ?auto_42041 ) ) ( not ( = ?auto_42040 ?auto_42042 ) ) ( not ( = ?auto_42040 ?auto_42043 ) ) ( not ( = ?auto_42040 ?auto_42044 ) ) ( not ( = ?auto_42040 ?auto_42045 ) ) ( not ( = ?auto_42040 ?auto_42046 ) ) ( not ( = ?auto_42040 ?auto_42048 ) ) ( not ( = ?auto_42041 ?auto_42042 ) ) ( not ( = ?auto_42041 ?auto_42043 ) ) ( not ( = ?auto_42041 ?auto_42044 ) ) ( not ( = ?auto_42041 ?auto_42045 ) ) ( not ( = ?auto_42041 ?auto_42046 ) ) ( not ( = ?auto_42041 ?auto_42048 ) ) ( not ( = ?auto_42042 ?auto_42043 ) ) ( not ( = ?auto_42042 ?auto_42044 ) ) ( not ( = ?auto_42042 ?auto_42045 ) ) ( not ( = ?auto_42042 ?auto_42046 ) ) ( not ( = ?auto_42042 ?auto_42048 ) ) ( not ( = ?auto_42043 ?auto_42044 ) ) ( not ( = ?auto_42043 ?auto_42045 ) ) ( not ( = ?auto_42043 ?auto_42046 ) ) ( not ( = ?auto_42043 ?auto_42048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42044 ?auto_42045 ?auto_42046 )
      ( MAKE-6CRATE-VERIFY ?auto_42040 ?auto_42041 ?auto_42042 ?auto_42043 ?auto_42044 ?auto_42045 ?auto_42046 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42104 - SURFACE
      ?auto_42105 - SURFACE
      ?auto_42106 - SURFACE
      ?auto_42107 - SURFACE
      ?auto_42108 - SURFACE
      ?auto_42109 - SURFACE
      ?auto_42110 - SURFACE
    )
    :vars
    (
      ?auto_42112 - HOIST
      ?auto_42116 - PLACE
      ?auto_42115 - PLACE
      ?auto_42111 - HOIST
      ?auto_42113 - SURFACE
      ?auto_42114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42112 ?auto_42116 ) ( SURFACE-AT ?auto_42109 ?auto_42116 ) ( CLEAR ?auto_42109 ) ( IS-CRATE ?auto_42110 ) ( not ( = ?auto_42109 ?auto_42110 ) ) ( AVAILABLE ?auto_42112 ) ( ON ?auto_42109 ?auto_42108 ) ( not ( = ?auto_42108 ?auto_42109 ) ) ( not ( = ?auto_42108 ?auto_42110 ) ) ( not ( = ?auto_42115 ?auto_42116 ) ) ( HOIST-AT ?auto_42111 ?auto_42115 ) ( not ( = ?auto_42112 ?auto_42111 ) ) ( AVAILABLE ?auto_42111 ) ( SURFACE-AT ?auto_42110 ?auto_42115 ) ( ON ?auto_42110 ?auto_42113 ) ( CLEAR ?auto_42110 ) ( not ( = ?auto_42109 ?auto_42113 ) ) ( not ( = ?auto_42110 ?auto_42113 ) ) ( not ( = ?auto_42108 ?auto_42113 ) ) ( TRUCK-AT ?auto_42114 ?auto_42116 ) ( ON ?auto_42105 ?auto_42104 ) ( ON ?auto_42106 ?auto_42105 ) ( ON ?auto_42107 ?auto_42106 ) ( ON ?auto_42108 ?auto_42107 ) ( not ( = ?auto_42104 ?auto_42105 ) ) ( not ( = ?auto_42104 ?auto_42106 ) ) ( not ( = ?auto_42104 ?auto_42107 ) ) ( not ( = ?auto_42104 ?auto_42108 ) ) ( not ( = ?auto_42104 ?auto_42109 ) ) ( not ( = ?auto_42104 ?auto_42110 ) ) ( not ( = ?auto_42104 ?auto_42113 ) ) ( not ( = ?auto_42105 ?auto_42106 ) ) ( not ( = ?auto_42105 ?auto_42107 ) ) ( not ( = ?auto_42105 ?auto_42108 ) ) ( not ( = ?auto_42105 ?auto_42109 ) ) ( not ( = ?auto_42105 ?auto_42110 ) ) ( not ( = ?auto_42105 ?auto_42113 ) ) ( not ( = ?auto_42106 ?auto_42107 ) ) ( not ( = ?auto_42106 ?auto_42108 ) ) ( not ( = ?auto_42106 ?auto_42109 ) ) ( not ( = ?auto_42106 ?auto_42110 ) ) ( not ( = ?auto_42106 ?auto_42113 ) ) ( not ( = ?auto_42107 ?auto_42108 ) ) ( not ( = ?auto_42107 ?auto_42109 ) ) ( not ( = ?auto_42107 ?auto_42110 ) ) ( not ( = ?auto_42107 ?auto_42113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42108 ?auto_42109 ?auto_42110 )
      ( MAKE-6CRATE-VERIFY ?auto_42104 ?auto_42105 ?auto_42106 ?auto_42107 ?auto_42108 ?auto_42109 ?auto_42110 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42168 - SURFACE
      ?auto_42169 - SURFACE
      ?auto_42170 - SURFACE
      ?auto_42171 - SURFACE
      ?auto_42172 - SURFACE
      ?auto_42173 - SURFACE
      ?auto_42174 - SURFACE
    )
    :vars
    (
      ?auto_42175 - HOIST
      ?auto_42176 - PLACE
      ?auto_42179 - PLACE
      ?auto_42177 - HOIST
      ?auto_42180 - SURFACE
      ?auto_42178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42175 ?auto_42176 ) ( IS-CRATE ?auto_42174 ) ( not ( = ?auto_42173 ?auto_42174 ) ) ( not ( = ?auto_42172 ?auto_42173 ) ) ( not ( = ?auto_42172 ?auto_42174 ) ) ( not ( = ?auto_42179 ?auto_42176 ) ) ( HOIST-AT ?auto_42177 ?auto_42179 ) ( not ( = ?auto_42175 ?auto_42177 ) ) ( AVAILABLE ?auto_42177 ) ( SURFACE-AT ?auto_42174 ?auto_42179 ) ( ON ?auto_42174 ?auto_42180 ) ( CLEAR ?auto_42174 ) ( not ( = ?auto_42173 ?auto_42180 ) ) ( not ( = ?auto_42174 ?auto_42180 ) ) ( not ( = ?auto_42172 ?auto_42180 ) ) ( TRUCK-AT ?auto_42178 ?auto_42176 ) ( SURFACE-AT ?auto_42172 ?auto_42176 ) ( CLEAR ?auto_42172 ) ( LIFTING ?auto_42175 ?auto_42173 ) ( IS-CRATE ?auto_42173 ) ( ON ?auto_42169 ?auto_42168 ) ( ON ?auto_42170 ?auto_42169 ) ( ON ?auto_42171 ?auto_42170 ) ( ON ?auto_42172 ?auto_42171 ) ( not ( = ?auto_42168 ?auto_42169 ) ) ( not ( = ?auto_42168 ?auto_42170 ) ) ( not ( = ?auto_42168 ?auto_42171 ) ) ( not ( = ?auto_42168 ?auto_42172 ) ) ( not ( = ?auto_42168 ?auto_42173 ) ) ( not ( = ?auto_42168 ?auto_42174 ) ) ( not ( = ?auto_42168 ?auto_42180 ) ) ( not ( = ?auto_42169 ?auto_42170 ) ) ( not ( = ?auto_42169 ?auto_42171 ) ) ( not ( = ?auto_42169 ?auto_42172 ) ) ( not ( = ?auto_42169 ?auto_42173 ) ) ( not ( = ?auto_42169 ?auto_42174 ) ) ( not ( = ?auto_42169 ?auto_42180 ) ) ( not ( = ?auto_42170 ?auto_42171 ) ) ( not ( = ?auto_42170 ?auto_42172 ) ) ( not ( = ?auto_42170 ?auto_42173 ) ) ( not ( = ?auto_42170 ?auto_42174 ) ) ( not ( = ?auto_42170 ?auto_42180 ) ) ( not ( = ?auto_42171 ?auto_42172 ) ) ( not ( = ?auto_42171 ?auto_42173 ) ) ( not ( = ?auto_42171 ?auto_42174 ) ) ( not ( = ?auto_42171 ?auto_42180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42172 ?auto_42173 ?auto_42174 )
      ( MAKE-6CRATE-VERIFY ?auto_42168 ?auto_42169 ?auto_42170 ?auto_42171 ?auto_42172 ?auto_42173 ?auto_42174 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_42232 - SURFACE
      ?auto_42233 - SURFACE
      ?auto_42234 - SURFACE
      ?auto_42235 - SURFACE
      ?auto_42236 - SURFACE
      ?auto_42237 - SURFACE
      ?auto_42238 - SURFACE
    )
    :vars
    (
      ?auto_42244 - HOIST
      ?auto_42241 - PLACE
      ?auto_42243 - PLACE
      ?auto_42242 - HOIST
      ?auto_42239 - SURFACE
      ?auto_42240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_42244 ?auto_42241 ) ( IS-CRATE ?auto_42238 ) ( not ( = ?auto_42237 ?auto_42238 ) ) ( not ( = ?auto_42236 ?auto_42237 ) ) ( not ( = ?auto_42236 ?auto_42238 ) ) ( not ( = ?auto_42243 ?auto_42241 ) ) ( HOIST-AT ?auto_42242 ?auto_42243 ) ( not ( = ?auto_42244 ?auto_42242 ) ) ( AVAILABLE ?auto_42242 ) ( SURFACE-AT ?auto_42238 ?auto_42243 ) ( ON ?auto_42238 ?auto_42239 ) ( CLEAR ?auto_42238 ) ( not ( = ?auto_42237 ?auto_42239 ) ) ( not ( = ?auto_42238 ?auto_42239 ) ) ( not ( = ?auto_42236 ?auto_42239 ) ) ( TRUCK-AT ?auto_42240 ?auto_42241 ) ( SURFACE-AT ?auto_42236 ?auto_42241 ) ( CLEAR ?auto_42236 ) ( IS-CRATE ?auto_42237 ) ( AVAILABLE ?auto_42244 ) ( IN ?auto_42237 ?auto_42240 ) ( ON ?auto_42233 ?auto_42232 ) ( ON ?auto_42234 ?auto_42233 ) ( ON ?auto_42235 ?auto_42234 ) ( ON ?auto_42236 ?auto_42235 ) ( not ( = ?auto_42232 ?auto_42233 ) ) ( not ( = ?auto_42232 ?auto_42234 ) ) ( not ( = ?auto_42232 ?auto_42235 ) ) ( not ( = ?auto_42232 ?auto_42236 ) ) ( not ( = ?auto_42232 ?auto_42237 ) ) ( not ( = ?auto_42232 ?auto_42238 ) ) ( not ( = ?auto_42232 ?auto_42239 ) ) ( not ( = ?auto_42233 ?auto_42234 ) ) ( not ( = ?auto_42233 ?auto_42235 ) ) ( not ( = ?auto_42233 ?auto_42236 ) ) ( not ( = ?auto_42233 ?auto_42237 ) ) ( not ( = ?auto_42233 ?auto_42238 ) ) ( not ( = ?auto_42233 ?auto_42239 ) ) ( not ( = ?auto_42234 ?auto_42235 ) ) ( not ( = ?auto_42234 ?auto_42236 ) ) ( not ( = ?auto_42234 ?auto_42237 ) ) ( not ( = ?auto_42234 ?auto_42238 ) ) ( not ( = ?auto_42234 ?auto_42239 ) ) ( not ( = ?auto_42235 ?auto_42236 ) ) ( not ( = ?auto_42235 ?auto_42237 ) ) ( not ( = ?auto_42235 ?auto_42238 ) ) ( not ( = ?auto_42235 ?auto_42239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_42236 ?auto_42237 ?auto_42238 )
      ( MAKE-6CRATE-VERIFY ?auto_42232 ?auto_42233 ?auto_42234 ?auto_42235 ?auto_42236 ?auto_42237 ?auto_42238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_43104 - SURFACE
      ?auto_43105 - SURFACE
    )
    :vars
    (
      ?auto_43107 - HOIST
      ?auto_43110 - PLACE
      ?auto_43106 - SURFACE
      ?auto_43109 - PLACE
      ?auto_43108 - HOIST
      ?auto_43112 - SURFACE
      ?auto_43111 - TRUCK
      ?auto_43113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43107 ?auto_43110 ) ( SURFACE-AT ?auto_43104 ?auto_43110 ) ( CLEAR ?auto_43104 ) ( IS-CRATE ?auto_43105 ) ( not ( = ?auto_43104 ?auto_43105 ) ) ( ON ?auto_43104 ?auto_43106 ) ( not ( = ?auto_43106 ?auto_43104 ) ) ( not ( = ?auto_43106 ?auto_43105 ) ) ( not ( = ?auto_43109 ?auto_43110 ) ) ( HOIST-AT ?auto_43108 ?auto_43109 ) ( not ( = ?auto_43107 ?auto_43108 ) ) ( AVAILABLE ?auto_43108 ) ( SURFACE-AT ?auto_43105 ?auto_43109 ) ( ON ?auto_43105 ?auto_43112 ) ( CLEAR ?auto_43105 ) ( not ( = ?auto_43104 ?auto_43112 ) ) ( not ( = ?auto_43105 ?auto_43112 ) ) ( not ( = ?auto_43106 ?auto_43112 ) ) ( TRUCK-AT ?auto_43111 ?auto_43110 ) ( LIFTING ?auto_43107 ?auto_43113 ) ( IS-CRATE ?auto_43113 ) ( not ( = ?auto_43104 ?auto_43113 ) ) ( not ( = ?auto_43105 ?auto_43113 ) ) ( not ( = ?auto_43106 ?auto_43113 ) ) ( not ( = ?auto_43112 ?auto_43113 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43107 ?auto_43113 ?auto_43111 ?auto_43110 )
      ( MAKE-1CRATE ?auto_43104 ?auto_43105 )
      ( MAKE-1CRATE-VERIFY ?auto_43104 ?auto_43105 ) )
  )

)

