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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319693 - SURFACE
      ?auto_319694 - SURFACE
    )
    :vars
    (
      ?auto_319695 - HOIST
      ?auto_319696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319695 ?auto_319696 ) ( SURFACE-AT ?auto_319693 ?auto_319696 ) ( CLEAR ?auto_319693 ) ( LIFTING ?auto_319695 ?auto_319694 ) ( IS-CRATE ?auto_319694 ) ( not ( = ?auto_319693 ?auto_319694 ) ) )
    :subtasks
    ( ( !DROP ?auto_319695 ?auto_319694 ?auto_319693 ?auto_319696 )
      ( MAKE-1CRATE-VERIFY ?auto_319693 ?auto_319694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319697 - SURFACE
      ?auto_319698 - SURFACE
    )
    :vars
    (
      ?auto_319699 - HOIST
      ?auto_319700 - PLACE
      ?auto_319701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319699 ?auto_319700 ) ( SURFACE-AT ?auto_319697 ?auto_319700 ) ( CLEAR ?auto_319697 ) ( IS-CRATE ?auto_319698 ) ( not ( = ?auto_319697 ?auto_319698 ) ) ( TRUCK-AT ?auto_319701 ?auto_319700 ) ( AVAILABLE ?auto_319699 ) ( IN ?auto_319698 ?auto_319701 ) )
    :subtasks
    ( ( !UNLOAD ?auto_319699 ?auto_319698 ?auto_319701 ?auto_319700 )
      ( MAKE-1CRATE ?auto_319697 ?auto_319698 )
      ( MAKE-1CRATE-VERIFY ?auto_319697 ?auto_319698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319702 - SURFACE
      ?auto_319703 - SURFACE
    )
    :vars
    (
      ?auto_319706 - HOIST
      ?auto_319705 - PLACE
      ?auto_319704 - TRUCK
      ?auto_319707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319706 ?auto_319705 ) ( SURFACE-AT ?auto_319702 ?auto_319705 ) ( CLEAR ?auto_319702 ) ( IS-CRATE ?auto_319703 ) ( not ( = ?auto_319702 ?auto_319703 ) ) ( AVAILABLE ?auto_319706 ) ( IN ?auto_319703 ?auto_319704 ) ( TRUCK-AT ?auto_319704 ?auto_319707 ) ( not ( = ?auto_319707 ?auto_319705 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_319704 ?auto_319707 ?auto_319705 )
      ( MAKE-1CRATE ?auto_319702 ?auto_319703 )
      ( MAKE-1CRATE-VERIFY ?auto_319702 ?auto_319703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319708 - SURFACE
      ?auto_319709 - SURFACE
    )
    :vars
    (
      ?auto_319712 - HOIST
      ?auto_319710 - PLACE
      ?auto_319711 - TRUCK
      ?auto_319713 - PLACE
      ?auto_319714 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_319712 ?auto_319710 ) ( SURFACE-AT ?auto_319708 ?auto_319710 ) ( CLEAR ?auto_319708 ) ( IS-CRATE ?auto_319709 ) ( not ( = ?auto_319708 ?auto_319709 ) ) ( AVAILABLE ?auto_319712 ) ( TRUCK-AT ?auto_319711 ?auto_319713 ) ( not ( = ?auto_319713 ?auto_319710 ) ) ( HOIST-AT ?auto_319714 ?auto_319713 ) ( LIFTING ?auto_319714 ?auto_319709 ) ( not ( = ?auto_319712 ?auto_319714 ) ) )
    :subtasks
    ( ( !LOAD ?auto_319714 ?auto_319709 ?auto_319711 ?auto_319713 )
      ( MAKE-1CRATE ?auto_319708 ?auto_319709 )
      ( MAKE-1CRATE-VERIFY ?auto_319708 ?auto_319709 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319715 - SURFACE
      ?auto_319716 - SURFACE
    )
    :vars
    (
      ?auto_319721 - HOIST
      ?auto_319719 - PLACE
      ?auto_319718 - TRUCK
      ?auto_319717 - PLACE
      ?auto_319720 - HOIST
      ?auto_319722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319721 ?auto_319719 ) ( SURFACE-AT ?auto_319715 ?auto_319719 ) ( CLEAR ?auto_319715 ) ( IS-CRATE ?auto_319716 ) ( not ( = ?auto_319715 ?auto_319716 ) ) ( AVAILABLE ?auto_319721 ) ( TRUCK-AT ?auto_319718 ?auto_319717 ) ( not ( = ?auto_319717 ?auto_319719 ) ) ( HOIST-AT ?auto_319720 ?auto_319717 ) ( not ( = ?auto_319721 ?auto_319720 ) ) ( AVAILABLE ?auto_319720 ) ( SURFACE-AT ?auto_319716 ?auto_319717 ) ( ON ?auto_319716 ?auto_319722 ) ( CLEAR ?auto_319716 ) ( not ( = ?auto_319715 ?auto_319722 ) ) ( not ( = ?auto_319716 ?auto_319722 ) ) )
    :subtasks
    ( ( !LIFT ?auto_319720 ?auto_319716 ?auto_319722 ?auto_319717 )
      ( MAKE-1CRATE ?auto_319715 ?auto_319716 )
      ( MAKE-1CRATE-VERIFY ?auto_319715 ?auto_319716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319723 - SURFACE
      ?auto_319724 - SURFACE
    )
    :vars
    (
      ?auto_319727 - HOIST
      ?auto_319730 - PLACE
      ?auto_319726 - PLACE
      ?auto_319725 - HOIST
      ?auto_319729 - SURFACE
      ?auto_319728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319727 ?auto_319730 ) ( SURFACE-AT ?auto_319723 ?auto_319730 ) ( CLEAR ?auto_319723 ) ( IS-CRATE ?auto_319724 ) ( not ( = ?auto_319723 ?auto_319724 ) ) ( AVAILABLE ?auto_319727 ) ( not ( = ?auto_319726 ?auto_319730 ) ) ( HOIST-AT ?auto_319725 ?auto_319726 ) ( not ( = ?auto_319727 ?auto_319725 ) ) ( AVAILABLE ?auto_319725 ) ( SURFACE-AT ?auto_319724 ?auto_319726 ) ( ON ?auto_319724 ?auto_319729 ) ( CLEAR ?auto_319724 ) ( not ( = ?auto_319723 ?auto_319729 ) ) ( not ( = ?auto_319724 ?auto_319729 ) ) ( TRUCK-AT ?auto_319728 ?auto_319730 ) )
    :subtasks
    ( ( !DRIVE ?auto_319728 ?auto_319730 ?auto_319726 )
      ( MAKE-1CRATE ?auto_319723 ?auto_319724 )
      ( MAKE-1CRATE-VERIFY ?auto_319723 ?auto_319724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319740 - SURFACE
      ?auto_319741 - SURFACE
      ?auto_319742 - SURFACE
    )
    :vars
    (
      ?auto_319744 - HOIST
      ?auto_319743 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319744 ?auto_319743 ) ( SURFACE-AT ?auto_319741 ?auto_319743 ) ( CLEAR ?auto_319741 ) ( LIFTING ?auto_319744 ?auto_319742 ) ( IS-CRATE ?auto_319742 ) ( not ( = ?auto_319741 ?auto_319742 ) ) ( ON ?auto_319741 ?auto_319740 ) ( not ( = ?auto_319740 ?auto_319741 ) ) ( not ( = ?auto_319740 ?auto_319742 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319741 ?auto_319742 )
      ( MAKE-2CRATE-VERIFY ?auto_319740 ?auto_319741 ?auto_319742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319750 - SURFACE
      ?auto_319751 - SURFACE
      ?auto_319752 - SURFACE
    )
    :vars
    (
      ?auto_319755 - HOIST
      ?auto_319754 - PLACE
      ?auto_319753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319755 ?auto_319754 ) ( SURFACE-AT ?auto_319751 ?auto_319754 ) ( CLEAR ?auto_319751 ) ( IS-CRATE ?auto_319752 ) ( not ( = ?auto_319751 ?auto_319752 ) ) ( TRUCK-AT ?auto_319753 ?auto_319754 ) ( AVAILABLE ?auto_319755 ) ( IN ?auto_319752 ?auto_319753 ) ( ON ?auto_319751 ?auto_319750 ) ( not ( = ?auto_319750 ?auto_319751 ) ) ( not ( = ?auto_319750 ?auto_319752 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319751 ?auto_319752 )
      ( MAKE-2CRATE-VERIFY ?auto_319750 ?auto_319751 ?auto_319752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319756 - SURFACE
      ?auto_319757 - SURFACE
    )
    :vars
    (
      ?auto_319761 - HOIST
      ?auto_319760 - PLACE
      ?auto_319759 - TRUCK
      ?auto_319758 - SURFACE
      ?auto_319762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319761 ?auto_319760 ) ( SURFACE-AT ?auto_319756 ?auto_319760 ) ( CLEAR ?auto_319756 ) ( IS-CRATE ?auto_319757 ) ( not ( = ?auto_319756 ?auto_319757 ) ) ( AVAILABLE ?auto_319761 ) ( IN ?auto_319757 ?auto_319759 ) ( ON ?auto_319756 ?auto_319758 ) ( not ( = ?auto_319758 ?auto_319756 ) ) ( not ( = ?auto_319758 ?auto_319757 ) ) ( TRUCK-AT ?auto_319759 ?auto_319762 ) ( not ( = ?auto_319762 ?auto_319760 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_319759 ?auto_319762 ?auto_319760 )
      ( MAKE-2CRATE ?auto_319758 ?auto_319756 ?auto_319757 )
      ( MAKE-1CRATE-VERIFY ?auto_319756 ?auto_319757 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319763 - SURFACE
      ?auto_319764 - SURFACE
      ?auto_319765 - SURFACE
    )
    :vars
    (
      ?auto_319769 - HOIST
      ?auto_319766 - PLACE
      ?auto_319768 - TRUCK
      ?auto_319767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319769 ?auto_319766 ) ( SURFACE-AT ?auto_319764 ?auto_319766 ) ( CLEAR ?auto_319764 ) ( IS-CRATE ?auto_319765 ) ( not ( = ?auto_319764 ?auto_319765 ) ) ( AVAILABLE ?auto_319769 ) ( IN ?auto_319765 ?auto_319768 ) ( ON ?auto_319764 ?auto_319763 ) ( not ( = ?auto_319763 ?auto_319764 ) ) ( not ( = ?auto_319763 ?auto_319765 ) ) ( TRUCK-AT ?auto_319768 ?auto_319767 ) ( not ( = ?auto_319767 ?auto_319766 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319764 ?auto_319765 )
      ( MAKE-2CRATE-VERIFY ?auto_319763 ?auto_319764 ?auto_319765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319770 - SURFACE
      ?auto_319771 - SURFACE
    )
    :vars
    (
      ?auto_319772 - HOIST
      ?auto_319774 - PLACE
      ?auto_319773 - SURFACE
      ?auto_319775 - TRUCK
      ?auto_319776 - PLACE
      ?auto_319777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_319772 ?auto_319774 ) ( SURFACE-AT ?auto_319770 ?auto_319774 ) ( CLEAR ?auto_319770 ) ( IS-CRATE ?auto_319771 ) ( not ( = ?auto_319770 ?auto_319771 ) ) ( AVAILABLE ?auto_319772 ) ( ON ?auto_319770 ?auto_319773 ) ( not ( = ?auto_319773 ?auto_319770 ) ) ( not ( = ?auto_319773 ?auto_319771 ) ) ( TRUCK-AT ?auto_319775 ?auto_319776 ) ( not ( = ?auto_319776 ?auto_319774 ) ) ( HOIST-AT ?auto_319777 ?auto_319776 ) ( LIFTING ?auto_319777 ?auto_319771 ) ( not ( = ?auto_319772 ?auto_319777 ) ) )
    :subtasks
    ( ( !LOAD ?auto_319777 ?auto_319771 ?auto_319775 ?auto_319776 )
      ( MAKE-2CRATE ?auto_319773 ?auto_319770 ?auto_319771 )
      ( MAKE-1CRATE-VERIFY ?auto_319770 ?auto_319771 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319778 - SURFACE
      ?auto_319779 - SURFACE
      ?auto_319780 - SURFACE
    )
    :vars
    (
      ?auto_319783 - HOIST
      ?auto_319785 - PLACE
      ?auto_319784 - TRUCK
      ?auto_319781 - PLACE
      ?auto_319782 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_319783 ?auto_319785 ) ( SURFACE-AT ?auto_319779 ?auto_319785 ) ( CLEAR ?auto_319779 ) ( IS-CRATE ?auto_319780 ) ( not ( = ?auto_319779 ?auto_319780 ) ) ( AVAILABLE ?auto_319783 ) ( ON ?auto_319779 ?auto_319778 ) ( not ( = ?auto_319778 ?auto_319779 ) ) ( not ( = ?auto_319778 ?auto_319780 ) ) ( TRUCK-AT ?auto_319784 ?auto_319781 ) ( not ( = ?auto_319781 ?auto_319785 ) ) ( HOIST-AT ?auto_319782 ?auto_319781 ) ( LIFTING ?auto_319782 ?auto_319780 ) ( not ( = ?auto_319783 ?auto_319782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319779 ?auto_319780 )
      ( MAKE-2CRATE-VERIFY ?auto_319778 ?auto_319779 ?auto_319780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319786 - SURFACE
      ?auto_319787 - SURFACE
    )
    :vars
    (
      ?auto_319788 - HOIST
      ?auto_319792 - PLACE
      ?auto_319789 - SURFACE
      ?auto_319791 - TRUCK
      ?auto_319790 - PLACE
      ?auto_319793 - HOIST
      ?auto_319794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319788 ?auto_319792 ) ( SURFACE-AT ?auto_319786 ?auto_319792 ) ( CLEAR ?auto_319786 ) ( IS-CRATE ?auto_319787 ) ( not ( = ?auto_319786 ?auto_319787 ) ) ( AVAILABLE ?auto_319788 ) ( ON ?auto_319786 ?auto_319789 ) ( not ( = ?auto_319789 ?auto_319786 ) ) ( not ( = ?auto_319789 ?auto_319787 ) ) ( TRUCK-AT ?auto_319791 ?auto_319790 ) ( not ( = ?auto_319790 ?auto_319792 ) ) ( HOIST-AT ?auto_319793 ?auto_319790 ) ( not ( = ?auto_319788 ?auto_319793 ) ) ( AVAILABLE ?auto_319793 ) ( SURFACE-AT ?auto_319787 ?auto_319790 ) ( ON ?auto_319787 ?auto_319794 ) ( CLEAR ?auto_319787 ) ( not ( = ?auto_319786 ?auto_319794 ) ) ( not ( = ?auto_319787 ?auto_319794 ) ) ( not ( = ?auto_319789 ?auto_319794 ) ) )
    :subtasks
    ( ( !LIFT ?auto_319793 ?auto_319787 ?auto_319794 ?auto_319790 )
      ( MAKE-2CRATE ?auto_319789 ?auto_319786 ?auto_319787 )
      ( MAKE-1CRATE-VERIFY ?auto_319786 ?auto_319787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319795 - SURFACE
      ?auto_319796 - SURFACE
      ?auto_319797 - SURFACE
    )
    :vars
    (
      ?auto_319802 - HOIST
      ?auto_319801 - PLACE
      ?auto_319803 - TRUCK
      ?auto_319800 - PLACE
      ?auto_319798 - HOIST
      ?auto_319799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319802 ?auto_319801 ) ( SURFACE-AT ?auto_319796 ?auto_319801 ) ( CLEAR ?auto_319796 ) ( IS-CRATE ?auto_319797 ) ( not ( = ?auto_319796 ?auto_319797 ) ) ( AVAILABLE ?auto_319802 ) ( ON ?auto_319796 ?auto_319795 ) ( not ( = ?auto_319795 ?auto_319796 ) ) ( not ( = ?auto_319795 ?auto_319797 ) ) ( TRUCK-AT ?auto_319803 ?auto_319800 ) ( not ( = ?auto_319800 ?auto_319801 ) ) ( HOIST-AT ?auto_319798 ?auto_319800 ) ( not ( = ?auto_319802 ?auto_319798 ) ) ( AVAILABLE ?auto_319798 ) ( SURFACE-AT ?auto_319797 ?auto_319800 ) ( ON ?auto_319797 ?auto_319799 ) ( CLEAR ?auto_319797 ) ( not ( = ?auto_319796 ?auto_319799 ) ) ( not ( = ?auto_319797 ?auto_319799 ) ) ( not ( = ?auto_319795 ?auto_319799 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319796 ?auto_319797 )
      ( MAKE-2CRATE-VERIFY ?auto_319795 ?auto_319796 ?auto_319797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319804 - SURFACE
      ?auto_319805 - SURFACE
    )
    :vars
    (
      ?auto_319810 - HOIST
      ?auto_319806 - PLACE
      ?auto_319809 - SURFACE
      ?auto_319807 - PLACE
      ?auto_319808 - HOIST
      ?auto_319812 - SURFACE
      ?auto_319811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319810 ?auto_319806 ) ( SURFACE-AT ?auto_319804 ?auto_319806 ) ( CLEAR ?auto_319804 ) ( IS-CRATE ?auto_319805 ) ( not ( = ?auto_319804 ?auto_319805 ) ) ( AVAILABLE ?auto_319810 ) ( ON ?auto_319804 ?auto_319809 ) ( not ( = ?auto_319809 ?auto_319804 ) ) ( not ( = ?auto_319809 ?auto_319805 ) ) ( not ( = ?auto_319807 ?auto_319806 ) ) ( HOIST-AT ?auto_319808 ?auto_319807 ) ( not ( = ?auto_319810 ?auto_319808 ) ) ( AVAILABLE ?auto_319808 ) ( SURFACE-AT ?auto_319805 ?auto_319807 ) ( ON ?auto_319805 ?auto_319812 ) ( CLEAR ?auto_319805 ) ( not ( = ?auto_319804 ?auto_319812 ) ) ( not ( = ?auto_319805 ?auto_319812 ) ) ( not ( = ?auto_319809 ?auto_319812 ) ) ( TRUCK-AT ?auto_319811 ?auto_319806 ) )
    :subtasks
    ( ( !DRIVE ?auto_319811 ?auto_319806 ?auto_319807 )
      ( MAKE-2CRATE ?auto_319809 ?auto_319804 ?auto_319805 )
      ( MAKE-1CRATE-VERIFY ?auto_319804 ?auto_319805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319813 - SURFACE
      ?auto_319814 - SURFACE
      ?auto_319815 - SURFACE
    )
    :vars
    (
      ?auto_319817 - HOIST
      ?auto_319816 - PLACE
      ?auto_319821 - PLACE
      ?auto_319820 - HOIST
      ?auto_319819 - SURFACE
      ?auto_319818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319817 ?auto_319816 ) ( SURFACE-AT ?auto_319814 ?auto_319816 ) ( CLEAR ?auto_319814 ) ( IS-CRATE ?auto_319815 ) ( not ( = ?auto_319814 ?auto_319815 ) ) ( AVAILABLE ?auto_319817 ) ( ON ?auto_319814 ?auto_319813 ) ( not ( = ?auto_319813 ?auto_319814 ) ) ( not ( = ?auto_319813 ?auto_319815 ) ) ( not ( = ?auto_319821 ?auto_319816 ) ) ( HOIST-AT ?auto_319820 ?auto_319821 ) ( not ( = ?auto_319817 ?auto_319820 ) ) ( AVAILABLE ?auto_319820 ) ( SURFACE-AT ?auto_319815 ?auto_319821 ) ( ON ?auto_319815 ?auto_319819 ) ( CLEAR ?auto_319815 ) ( not ( = ?auto_319814 ?auto_319819 ) ) ( not ( = ?auto_319815 ?auto_319819 ) ) ( not ( = ?auto_319813 ?auto_319819 ) ) ( TRUCK-AT ?auto_319818 ?auto_319816 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319814 ?auto_319815 )
      ( MAKE-2CRATE-VERIFY ?auto_319813 ?auto_319814 ?auto_319815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319822 - SURFACE
      ?auto_319823 - SURFACE
    )
    :vars
    (
      ?auto_319825 - HOIST
      ?auto_319826 - PLACE
      ?auto_319830 - SURFACE
      ?auto_319827 - PLACE
      ?auto_319824 - HOIST
      ?auto_319829 - SURFACE
      ?auto_319828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319825 ?auto_319826 ) ( IS-CRATE ?auto_319823 ) ( not ( = ?auto_319822 ?auto_319823 ) ) ( not ( = ?auto_319830 ?auto_319822 ) ) ( not ( = ?auto_319830 ?auto_319823 ) ) ( not ( = ?auto_319827 ?auto_319826 ) ) ( HOIST-AT ?auto_319824 ?auto_319827 ) ( not ( = ?auto_319825 ?auto_319824 ) ) ( AVAILABLE ?auto_319824 ) ( SURFACE-AT ?auto_319823 ?auto_319827 ) ( ON ?auto_319823 ?auto_319829 ) ( CLEAR ?auto_319823 ) ( not ( = ?auto_319822 ?auto_319829 ) ) ( not ( = ?auto_319823 ?auto_319829 ) ) ( not ( = ?auto_319830 ?auto_319829 ) ) ( TRUCK-AT ?auto_319828 ?auto_319826 ) ( SURFACE-AT ?auto_319830 ?auto_319826 ) ( CLEAR ?auto_319830 ) ( LIFTING ?auto_319825 ?auto_319822 ) ( IS-CRATE ?auto_319822 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319830 ?auto_319822 )
      ( MAKE-2CRATE ?auto_319830 ?auto_319822 ?auto_319823 )
      ( MAKE-1CRATE-VERIFY ?auto_319822 ?auto_319823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319831 - SURFACE
      ?auto_319832 - SURFACE
      ?auto_319833 - SURFACE
    )
    :vars
    (
      ?auto_319837 - HOIST
      ?auto_319838 - PLACE
      ?auto_319834 - PLACE
      ?auto_319835 - HOIST
      ?auto_319839 - SURFACE
      ?auto_319836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319837 ?auto_319838 ) ( IS-CRATE ?auto_319833 ) ( not ( = ?auto_319832 ?auto_319833 ) ) ( not ( = ?auto_319831 ?auto_319832 ) ) ( not ( = ?auto_319831 ?auto_319833 ) ) ( not ( = ?auto_319834 ?auto_319838 ) ) ( HOIST-AT ?auto_319835 ?auto_319834 ) ( not ( = ?auto_319837 ?auto_319835 ) ) ( AVAILABLE ?auto_319835 ) ( SURFACE-AT ?auto_319833 ?auto_319834 ) ( ON ?auto_319833 ?auto_319839 ) ( CLEAR ?auto_319833 ) ( not ( = ?auto_319832 ?auto_319839 ) ) ( not ( = ?auto_319833 ?auto_319839 ) ) ( not ( = ?auto_319831 ?auto_319839 ) ) ( TRUCK-AT ?auto_319836 ?auto_319838 ) ( SURFACE-AT ?auto_319831 ?auto_319838 ) ( CLEAR ?auto_319831 ) ( LIFTING ?auto_319837 ?auto_319832 ) ( IS-CRATE ?auto_319832 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319832 ?auto_319833 )
      ( MAKE-2CRATE-VERIFY ?auto_319831 ?auto_319832 ?auto_319833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319840 - SURFACE
      ?auto_319841 - SURFACE
    )
    :vars
    (
      ?auto_319848 - HOIST
      ?auto_319842 - PLACE
      ?auto_319847 - SURFACE
      ?auto_319844 - PLACE
      ?auto_319846 - HOIST
      ?auto_319845 - SURFACE
      ?auto_319843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319848 ?auto_319842 ) ( IS-CRATE ?auto_319841 ) ( not ( = ?auto_319840 ?auto_319841 ) ) ( not ( = ?auto_319847 ?auto_319840 ) ) ( not ( = ?auto_319847 ?auto_319841 ) ) ( not ( = ?auto_319844 ?auto_319842 ) ) ( HOIST-AT ?auto_319846 ?auto_319844 ) ( not ( = ?auto_319848 ?auto_319846 ) ) ( AVAILABLE ?auto_319846 ) ( SURFACE-AT ?auto_319841 ?auto_319844 ) ( ON ?auto_319841 ?auto_319845 ) ( CLEAR ?auto_319841 ) ( not ( = ?auto_319840 ?auto_319845 ) ) ( not ( = ?auto_319841 ?auto_319845 ) ) ( not ( = ?auto_319847 ?auto_319845 ) ) ( TRUCK-AT ?auto_319843 ?auto_319842 ) ( SURFACE-AT ?auto_319847 ?auto_319842 ) ( CLEAR ?auto_319847 ) ( IS-CRATE ?auto_319840 ) ( AVAILABLE ?auto_319848 ) ( IN ?auto_319840 ?auto_319843 ) )
    :subtasks
    ( ( !UNLOAD ?auto_319848 ?auto_319840 ?auto_319843 ?auto_319842 )
      ( MAKE-2CRATE ?auto_319847 ?auto_319840 ?auto_319841 )
      ( MAKE-1CRATE-VERIFY ?auto_319840 ?auto_319841 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319849 - SURFACE
      ?auto_319850 - SURFACE
      ?auto_319851 - SURFACE
    )
    :vars
    (
      ?auto_319852 - HOIST
      ?auto_319853 - PLACE
      ?auto_319857 - PLACE
      ?auto_319855 - HOIST
      ?auto_319856 - SURFACE
      ?auto_319854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319852 ?auto_319853 ) ( IS-CRATE ?auto_319851 ) ( not ( = ?auto_319850 ?auto_319851 ) ) ( not ( = ?auto_319849 ?auto_319850 ) ) ( not ( = ?auto_319849 ?auto_319851 ) ) ( not ( = ?auto_319857 ?auto_319853 ) ) ( HOIST-AT ?auto_319855 ?auto_319857 ) ( not ( = ?auto_319852 ?auto_319855 ) ) ( AVAILABLE ?auto_319855 ) ( SURFACE-AT ?auto_319851 ?auto_319857 ) ( ON ?auto_319851 ?auto_319856 ) ( CLEAR ?auto_319851 ) ( not ( = ?auto_319850 ?auto_319856 ) ) ( not ( = ?auto_319851 ?auto_319856 ) ) ( not ( = ?auto_319849 ?auto_319856 ) ) ( TRUCK-AT ?auto_319854 ?auto_319853 ) ( SURFACE-AT ?auto_319849 ?auto_319853 ) ( CLEAR ?auto_319849 ) ( IS-CRATE ?auto_319850 ) ( AVAILABLE ?auto_319852 ) ( IN ?auto_319850 ?auto_319854 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319850 ?auto_319851 )
      ( MAKE-2CRATE-VERIFY ?auto_319849 ?auto_319850 ?auto_319851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319858 - SURFACE
      ?auto_319859 - SURFACE
    )
    :vars
    (
      ?auto_319865 - HOIST
      ?auto_319861 - PLACE
      ?auto_319860 - SURFACE
      ?auto_319866 - PLACE
      ?auto_319864 - HOIST
      ?auto_319863 - SURFACE
      ?auto_319862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319865 ?auto_319861 ) ( IS-CRATE ?auto_319859 ) ( not ( = ?auto_319858 ?auto_319859 ) ) ( not ( = ?auto_319860 ?auto_319858 ) ) ( not ( = ?auto_319860 ?auto_319859 ) ) ( not ( = ?auto_319866 ?auto_319861 ) ) ( HOIST-AT ?auto_319864 ?auto_319866 ) ( not ( = ?auto_319865 ?auto_319864 ) ) ( AVAILABLE ?auto_319864 ) ( SURFACE-AT ?auto_319859 ?auto_319866 ) ( ON ?auto_319859 ?auto_319863 ) ( CLEAR ?auto_319859 ) ( not ( = ?auto_319858 ?auto_319863 ) ) ( not ( = ?auto_319859 ?auto_319863 ) ) ( not ( = ?auto_319860 ?auto_319863 ) ) ( SURFACE-AT ?auto_319860 ?auto_319861 ) ( CLEAR ?auto_319860 ) ( IS-CRATE ?auto_319858 ) ( AVAILABLE ?auto_319865 ) ( IN ?auto_319858 ?auto_319862 ) ( TRUCK-AT ?auto_319862 ?auto_319866 ) )
    :subtasks
    ( ( !DRIVE ?auto_319862 ?auto_319866 ?auto_319861 )
      ( MAKE-2CRATE ?auto_319860 ?auto_319858 ?auto_319859 )
      ( MAKE-1CRATE-VERIFY ?auto_319858 ?auto_319859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319867 - SURFACE
      ?auto_319868 - SURFACE
      ?auto_319869 - SURFACE
    )
    :vars
    (
      ?auto_319874 - HOIST
      ?auto_319871 - PLACE
      ?auto_319873 - PLACE
      ?auto_319870 - HOIST
      ?auto_319875 - SURFACE
      ?auto_319872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319874 ?auto_319871 ) ( IS-CRATE ?auto_319869 ) ( not ( = ?auto_319868 ?auto_319869 ) ) ( not ( = ?auto_319867 ?auto_319868 ) ) ( not ( = ?auto_319867 ?auto_319869 ) ) ( not ( = ?auto_319873 ?auto_319871 ) ) ( HOIST-AT ?auto_319870 ?auto_319873 ) ( not ( = ?auto_319874 ?auto_319870 ) ) ( AVAILABLE ?auto_319870 ) ( SURFACE-AT ?auto_319869 ?auto_319873 ) ( ON ?auto_319869 ?auto_319875 ) ( CLEAR ?auto_319869 ) ( not ( = ?auto_319868 ?auto_319875 ) ) ( not ( = ?auto_319869 ?auto_319875 ) ) ( not ( = ?auto_319867 ?auto_319875 ) ) ( SURFACE-AT ?auto_319867 ?auto_319871 ) ( CLEAR ?auto_319867 ) ( IS-CRATE ?auto_319868 ) ( AVAILABLE ?auto_319874 ) ( IN ?auto_319868 ?auto_319872 ) ( TRUCK-AT ?auto_319872 ?auto_319873 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319868 ?auto_319869 )
      ( MAKE-2CRATE-VERIFY ?auto_319867 ?auto_319868 ?auto_319869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319876 - SURFACE
      ?auto_319877 - SURFACE
    )
    :vars
    (
      ?auto_319880 - HOIST
      ?auto_319884 - PLACE
      ?auto_319882 - SURFACE
      ?auto_319878 - PLACE
      ?auto_319881 - HOIST
      ?auto_319883 - SURFACE
      ?auto_319879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319880 ?auto_319884 ) ( IS-CRATE ?auto_319877 ) ( not ( = ?auto_319876 ?auto_319877 ) ) ( not ( = ?auto_319882 ?auto_319876 ) ) ( not ( = ?auto_319882 ?auto_319877 ) ) ( not ( = ?auto_319878 ?auto_319884 ) ) ( HOIST-AT ?auto_319881 ?auto_319878 ) ( not ( = ?auto_319880 ?auto_319881 ) ) ( SURFACE-AT ?auto_319877 ?auto_319878 ) ( ON ?auto_319877 ?auto_319883 ) ( CLEAR ?auto_319877 ) ( not ( = ?auto_319876 ?auto_319883 ) ) ( not ( = ?auto_319877 ?auto_319883 ) ) ( not ( = ?auto_319882 ?auto_319883 ) ) ( SURFACE-AT ?auto_319882 ?auto_319884 ) ( CLEAR ?auto_319882 ) ( IS-CRATE ?auto_319876 ) ( AVAILABLE ?auto_319880 ) ( TRUCK-AT ?auto_319879 ?auto_319878 ) ( LIFTING ?auto_319881 ?auto_319876 ) )
    :subtasks
    ( ( !LOAD ?auto_319881 ?auto_319876 ?auto_319879 ?auto_319878 )
      ( MAKE-2CRATE ?auto_319882 ?auto_319876 ?auto_319877 )
      ( MAKE-1CRATE-VERIFY ?auto_319876 ?auto_319877 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319885 - SURFACE
      ?auto_319886 - SURFACE
      ?auto_319887 - SURFACE
    )
    :vars
    (
      ?auto_319893 - HOIST
      ?auto_319890 - PLACE
      ?auto_319891 - PLACE
      ?auto_319888 - HOIST
      ?auto_319889 - SURFACE
      ?auto_319892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319893 ?auto_319890 ) ( IS-CRATE ?auto_319887 ) ( not ( = ?auto_319886 ?auto_319887 ) ) ( not ( = ?auto_319885 ?auto_319886 ) ) ( not ( = ?auto_319885 ?auto_319887 ) ) ( not ( = ?auto_319891 ?auto_319890 ) ) ( HOIST-AT ?auto_319888 ?auto_319891 ) ( not ( = ?auto_319893 ?auto_319888 ) ) ( SURFACE-AT ?auto_319887 ?auto_319891 ) ( ON ?auto_319887 ?auto_319889 ) ( CLEAR ?auto_319887 ) ( not ( = ?auto_319886 ?auto_319889 ) ) ( not ( = ?auto_319887 ?auto_319889 ) ) ( not ( = ?auto_319885 ?auto_319889 ) ) ( SURFACE-AT ?auto_319885 ?auto_319890 ) ( CLEAR ?auto_319885 ) ( IS-CRATE ?auto_319886 ) ( AVAILABLE ?auto_319893 ) ( TRUCK-AT ?auto_319892 ?auto_319891 ) ( LIFTING ?auto_319888 ?auto_319886 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319886 ?auto_319887 )
      ( MAKE-2CRATE-VERIFY ?auto_319885 ?auto_319886 ?auto_319887 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319894 - SURFACE
      ?auto_319895 - SURFACE
    )
    :vars
    (
      ?auto_319896 - HOIST
      ?auto_319898 - PLACE
      ?auto_319902 - SURFACE
      ?auto_319901 - PLACE
      ?auto_319899 - HOIST
      ?auto_319900 - SURFACE
      ?auto_319897 - TRUCK
      ?auto_319903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319896 ?auto_319898 ) ( IS-CRATE ?auto_319895 ) ( not ( = ?auto_319894 ?auto_319895 ) ) ( not ( = ?auto_319902 ?auto_319894 ) ) ( not ( = ?auto_319902 ?auto_319895 ) ) ( not ( = ?auto_319901 ?auto_319898 ) ) ( HOIST-AT ?auto_319899 ?auto_319901 ) ( not ( = ?auto_319896 ?auto_319899 ) ) ( SURFACE-AT ?auto_319895 ?auto_319901 ) ( ON ?auto_319895 ?auto_319900 ) ( CLEAR ?auto_319895 ) ( not ( = ?auto_319894 ?auto_319900 ) ) ( not ( = ?auto_319895 ?auto_319900 ) ) ( not ( = ?auto_319902 ?auto_319900 ) ) ( SURFACE-AT ?auto_319902 ?auto_319898 ) ( CLEAR ?auto_319902 ) ( IS-CRATE ?auto_319894 ) ( AVAILABLE ?auto_319896 ) ( TRUCK-AT ?auto_319897 ?auto_319901 ) ( AVAILABLE ?auto_319899 ) ( SURFACE-AT ?auto_319894 ?auto_319901 ) ( ON ?auto_319894 ?auto_319903 ) ( CLEAR ?auto_319894 ) ( not ( = ?auto_319894 ?auto_319903 ) ) ( not ( = ?auto_319895 ?auto_319903 ) ) ( not ( = ?auto_319902 ?auto_319903 ) ) ( not ( = ?auto_319900 ?auto_319903 ) ) )
    :subtasks
    ( ( !LIFT ?auto_319899 ?auto_319894 ?auto_319903 ?auto_319901 )
      ( MAKE-2CRATE ?auto_319902 ?auto_319894 ?auto_319895 )
      ( MAKE-1CRATE-VERIFY ?auto_319894 ?auto_319895 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319904 - SURFACE
      ?auto_319905 - SURFACE
      ?auto_319906 - SURFACE
    )
    :vars
    (
      ?auto_319913 - HOIST
      ?auto_319911 - PLACE
      ?auto_319910 - PLACE
      ?auto_319912 - HOIST
      ?auto_319907 - SURFACE
      ?auto_319909 - TRUCK
      ?auto_319908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319913 ?auto_319911 ) ( IS-CRATE ?auto_319906 ) ( not ( = ?auto_319905 ?auto_319906 ) ) ( not ( = ?auto_319904 ?auto_319905 ) ) ( not ( = ?auto_319904 ?auto_319906 ) ) ( not ( = ?auto_319910 ?auto_319911 ) ) ( HOIST-AT ?auto_319912 ?auto_319910 ) ( not ( = ?auto_319913 ?auto_319912 ) ) ( SURFACE-AT ?auto_319906 ?auto_319910 ) ( ON ?auto_319906 ?auto_319907 ) ( CLEAR ?auto_319906 ) ( not ( = ?auto_319905 ?auto_319907 ) ) ( not ( = ?auto_319906 ?auto_319907 ) ) ( not ( = ?auto_319904 ?auto_319907 ) ) ( SURFACE-AT ?auto_319904 ?auto_319911 ) ( CLEAR ?auto_319904 ) ( IS-CRATE ?auto_319905 ) ( AVAILABLE ?auto_319913 ) ( TRUCK-AT ?auto_319909 ?auto_319910 ) ( AVAILABLE ?auto_319912 ) ( SURFACE-AT ?auto_319905 ?auto_319910 ) ( ON ?auto_319905 ?auto_319908 ) ( CLEAR ?auto_319905 ) ( not ( = ?auto_319905 ?auto_319908 ) ) ( not ( = ?auto_319906 ?auto_319908 ) ) ( not ( = ?auto_319904 ?auto_319908 ) ) ( not ( = ?auto_319907 ?auto_319908 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319905 ?auto_319906 )
      ( MAKE-2CRATE-VERIFY ?auto_319904 ?auto_319905 ?auto_319906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_319914 - SURFACE
      ?auto_319915 - SURFACE
    )
    :vars
    (
      ?auto_319920 - HOIST
      ?auto_319919 - PLACE
      ?auto_319922 - SURFACE
      ?auto_319923 - PLACE
      ?auto_319918 - HOIST
      ?auto_319917 - SURFACE
      ?auto_319921 - SURFACE
      ?auto_319916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319920 ?auto_319919 ) ( IS-CRATE ?auto_319915 ) ( not ( = ?auto_319914 ?auto_319915 ) ) ( not ( = ?auto_319922 ?auto_319914 ) ) ( not ( = ?auto_319922 ?auto_319915 ) ) ( not ( = ?auto_319923 ?auto_319919 ) ) ( HOIST-AT ?auto_319918 ?auto_319923 ) ( not ( = ?auto_319920 ?auto_319918 ) ) ( SURFACE-AT ?auto_319915 ?auto_319923 ) ( ON ?auto_319915 ?auto_319917 ) ( CLEAR ?auto_319915 ) ( not ( = ?auto_319914 ?auto_319917 ) ) ( not ( = ?auto_319915 ?auto_319917 ) ) ( not ( = ?auto_319922 ?auto_319917 ) ) ( SURFACE-AT ?auto_319922 ?auto_319919 ) ( CLEAR ?auto_319922 ) ( IS-CRATE ?auto_319914 ) ( AVAILABLE ?auto_319920 ) ( AVAILABLE ?auto_319918 ) ( SURFACE-AT ?auto_319914 ?auto_319923 ) ( ON ?auto_319914 ?auto_319921 ) ( CLEAR ?auto_319914 ) ( not ( = ?auto_319914 ?auto_319921 ) ) ( not ( = ?auto_319915 ?auto_319921 ) ) ( not ( = ?auto_319922 ?auto_319921 ) ) ( not ( = ?auto_319917 ?auto_319921 ) ) ( TRUCK-AT ?auto_319916 ?auto_319919 ) )
    :subtasks
    ( ( !DRIVE ?auto_319916 ?auto_319919 ?auto_319923 )
      ( MAKE-2CRATE ?auto_319922 ?auto_319914 ?auto_319915 )
      ( MAKE-1CRATE-VERIFY ?auto_319914 ?auto_319915 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_319924 - SURFACE
      ?auto_319925 - SURFACE
      ?auto_319926 - SURFACE
    )
    :vars
    (
      ?auto_319931 - HOIST
      ?auto_319930 - PLACE
      ?auto_319928 - PLACE
      ?auto_319929 - HOIST
      ?auto_319932 - SURFACE
      ?auto_319927 - SURFACE
      ?auto_319933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319931 ?auto_319930 ) ( IS-CRATE ?auto_319926 ) ( not ( = ?auto_319925 ?auto_319926 ) ) ( not ( = ?auto_319924 ?auto_319925 ) ) ( not ( = ?auto_319924 ?auto_319926 ) ) ( not ( = ?auto_319928 ?auto_319930 ) ) ( HOIST-AT ?auto_319929 ?auto_319928 ) ( not ( = ?auto_319931 ?auto_319929 ) ) ( SURFACE-AT ?auto_319926 ?auto_319928 ) ( ON ?auto_319926 ?auto_319932 ) ( CLEAR ?auto_319926 ) ( not ( = ?auto_319925 ?auto_319932 ) ) ( not ( = ?auto_319926 ?auto_319932 ) ) ( not ( = ?auto_319924 ?auto_319932 ) ) ( SURFACE-AT ?auto_319924 ?auto_319930 ) ( CLEAR ?auto_319924 ) ( IS-CRATE ?auto_319925 ) ( AVAILABLE ?auto_319931 ) ( AVAILABLE ?auto_319929 ) ( SURFACE-AT ?auto_319925 ?auto_319928 ) ( ON ?auto_319925 ?auto_319927 ) ( CLEAR ?auto_319925 ) ( not ( = ?auto_319925 ?auto_319927 ) ) ( not ( = ?auto_319926 ?auto_319927 ) ) ( not ( = ?auto_319924 ?auto_319927 ) ) ( not ( = ?auto_319932 ?auto_319927 ) ) ( TRUCK-AT ?auto_319933 ?auto_319930 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319925 ?auto_319926 )
      ( MAKE-2CRATE-VERIFY ?auto_319924 ?auto_319925 ?auto_319926 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_319952 - SURFACE
      ?auto_319953 - SURFACE
      ?auto_319954 - SURFACE
      ?auto_319955 - SURFACE
    )
    :vars
    (
      ?auto_319957 - HOIST
      ?auto_319956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319957 ?auto_319956 ) ( SURFACE-AT ?auto_319954 ?auto_319956 ) ( CLEAR ?auto_319954 ) ( LIFTING ?auto_319957 ?auto_319955 ) ( IS-CRATE ?auto_319955 ) ( not ( = ?auto_319954 ?auto_319955 ) ) ( ON ?auto_319953 ?auto_319952 ) ( ON ?auto_319954 ?auto_319953 ) ( not ( = ?auto_319952 ?auto_319953 ) ) ( not ( = ?auto_319952 ?auto_319954 ) ) ( not ( = ?auto_319952 ?auto_319955 ) ) ( not ( = ?auto_319953 ?auto_319954 ) ) ( not ( = ?auto_319953 ?auto_319955 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_319954 ?auto_319955 )
      ( MAKE-3CRATE-VERIFY ?auto_319952 ?auto_319953 ?auto_319954 ?auto_319955 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_319969 - SURFACE
      ?auto_319970 - SURFACE
      ?auto_319971 - SURFACE
      ?auto_319972 - SURFACE
    )
    :vars
    (
      ?auto_319973 - HOIST
      ?auto_319974 - PLACE
      ?auto_319975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_319973 ?auto_319974 ) ( SURFACE-AT ?auto_319971 ?auto_319974 ) ( CLEAR ?auto_319971 ) ( IS-CRATE ?auto_319972 ) ( not ( = ?auto_319971 ?auto_319972 ) ) ( TRUCK-AT ?auto_319975 ?auto_319974 ) ( AVAILABLE ?auto_319973 ) ( IN ?auto_319972 ?auto_319975 ) ( ON ?auto_319971 ?auto_319970 ) ( not ( = ?auto_319970 ?auto_319971 ) ) ( not ( = ?auto_319970 ?auto_319972 ) ) ( ON ?auto_319970 ?auto_319969 ) ( not ( = ?auto_319969 ?auto_319970 ) ) ( not ( = ?auto_319969 ?auto_319971 ) ) ( not ( = ?auto_319969 ?auto_319972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_319970 ?auto_319971 ?auto_319972 )
      ( MAKE-3CRATE-VERIFY ?auto_319969 ?auto_319970 ?auto_319971 ?auto_319972 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_319990 - SURFACE
      ?auto_319991 - SURFACE
      ?auto_319992 - SURFACE
      ?auto_319993 - SURFACE
    )
    :vars
    (
      ?auto_319997 - HOIST
      ?auto_319994 - PLACE
      ?auto_319995 - TRUCK
      ?auto_319996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_319997 ?auto_319994 ) ( SURFACE-AT ?auto_319992 ?auto_319994 ) ( CLEAR ?auto_319992 ) ( IS-CRATE ?auto_319993 ) ( not ( = ?auto_319992 ?auto_319993 ) ) ( AVAILABLE ?auto_319997 ) ( IN ?auto_319993 ?auto_319995 ) ( ON ?auto_319992 ?auto_319991 ) ( not ( = ?auto_319991 ?auto_319992 ) ) ( not ( = ?auto_319991 ?auto_319993 ) ) ( TRUCK-AT ?auto_319995 ?auto_319996 ) ( not ( = ?auto_319996 ?auto_319994 ) ) ( ON ?auto_319991 ?auto_319990 ) ( not ( = ?auto_319990 ?auto_319991 ) ) ( not ( = ?auto_319990 ?auto_319992 ) ) ( not ( = ?auto_319990 ?auto_319993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_319991 ?auto_319992 ?auto_319993 )
      ( MAKE-3CRATE-VERIFY ?auto_319990 ?auto_319991 ?auto_319992 ?auto_319993 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320014 - SURFACE
      ?auto_320015 - SURFACE
      ?auto_320016 - SURFACE
      ?auto_320017 - SURFACE
    )
    :vars
    (
      ?auto_320021 - HOIST
      ?auto_320020 - PLACE
      ?auto_320022 - TRUCK
      ?auto_320018 - PLACE
      ?auto_320019 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320021 ?auto_320020 ) ( SURFACE-AT ?auto_320016 ?auto_320020 ) ( CLEAR ?auto_320016 ) ( IS-CRATE ?auto_320017 ) ( not ( = ?auto_320016 ?auto_320017 ) ) ( AVAILABLE ?auto_320021 ) ( ON ?auto_320016 ?auto_320015 ) ( not ( = ?auto_320015 ?auto_320016 ) ) ( not ( = ?auto_320015 ?auto_320017 ) ) ( TRUCK-AT ?auto_320022 ?auto_320018 ) ( not ( = ?auto_320018 ?auto_320020 ) ) ( HOIST-AT ?auto_320019 ?auto_320018 ) ( LIFTING ?auto_320019 ?auto_320017 ) ( not ( = ?auto_320021 ?auto_320019 ) ) ( ON ?auto_320015 ?auto_320014 ) ( not ( = ?auto_320014 ?auto_320015 ) ) ( not ( = ?auto_320014 ?auto_320016 ) ) ( not ( = ?auto_320014 ?auto_320017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320015 ?auto_320016 ?auto_320017 )
      ( MAKE-3CRATE-VERIFY ?auto_320014 ?auto_320015 ?auto_320016 ?auto_320017 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320041 - SURFACE
      ?auto_320042 - SURFACE
      ?auto_320043 - SURFACE
      ?auto_320044 - SURFACE
    )
    :vars
    (
      ?auto_320048 - HOIST
      ?auto_320049 - PLACE
      ?auto_320050 - TRUCK
      ?auto_320045 - PLACE
      ?auto_320046 - HOIST
      ?auto_320047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320048 ?auto_320049 ) ( SURFACE-AT ?auto_320043 ?auto_320049 ) ( CLEAR ?auto_320043 ) ( IS-CRATE ?auto_320044 ) ( not ( = ?auto_320043 ?auto_320044 ) ) ( AVAILABLE ?auto_320048 ) ( ON ?auto_320043 ?auto_320042 ) ( not ( = ?auto_320042 ?auto_320043 ) ) ( not ( = ?auto_320042 ?auto_320044 ) ) ( TRUCK-AT ?auto_320050 ?auto_320045 ) ( not ( = ?auto_320045 ?auto_320049 ) ) ( HOIST-AT ?auto_320046 ?auto_320045 ) ( not ( = ?auto_320048 ?auto_320046 ) ) ( AVAILABLE ?auto_320046 ) ( SURFACE-AT ?auto_320044 ?auto_320045 ) ( ON ?auto_320044 ?auto_320047 ) ( CLEAR ?auto_320044 ) ( not ( = ?auto_320043 ?auto_320047 ) ) ( not ( = ?auto_320044 ?auto_320047 ) ) ( not ( = ?auto_320042 ?auto_320047 ) ) ( ON ?auto_320042 ?auto_320041 ) ( not ( = ?auto_320041 ?auto_320042 ) ) ( not ( = ?auto_320041 ?auto_320043 ) ) ( not ( = ?auto_320041 ?auto_320044 ) ) ( not ( = ?auto_320041 ?auto_320047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320042 ?auto_320043 ?auto_320044 )
      ( MAKE-3CRATE-VERIFY ?auto_320041 ?auto_320042 ?auto_320043 ?auto_320044 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320069 - SURFACE
      ?auto_320070 - SURFACE
      ?auto_320071 - SURFACE
      ?auto_320072 - SURFACE
    )
    :vars
    (
      ?auto_320076 - HOIST
      ?auto_320078 - PLACE
      ?auto_320074 - PLACE
      ?auto_320077 - HOIST
      ?auto_320073 - SURFACE
      ?auto_320075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320076 ?auto_320078 ) ( SURFACE-AT ?auto_320071 ?auto_320078 ) ( CLEAR ?auto_320071 ) ( IS-CRATE ?auto_320072 ) ( not ( = ?auto_320071 ?auto_320072 ) ) ( AVAILABLE ?auto_320076 ) ( ON ?auto_320071 ?auto_320070 ) ( not ( = ?auto_320070 ?auto_320071 ) ) ( not ( = ?auto_320070 ?auto_320072 ) ) ( not ( = ?auto_320074 ?auto_320078 ) ) ( HOIST-AT ?auto_320077 ?auto_320074 ) ( not ( = ?auto_320076 ?auto_320077 ) ) ( AVAILABLE ?auto_320077 ) ( SURFACE-AT ?auto_320072 ?auto_320074 ) ( ON ?auto_320072 ?auto_320073 ) ( CLEAR ?auto_320072 ) ( not ( = ?auto_320071 ?auto_320073 ) ) ( not ( = ?auto_320072 ?auto_320073 ) ) ( not ( = ?auto_320070 ?auto_320073 ) ) ( TRUCK-AT ?auto_320075 ?auto_320078 ) ( ON ?auto_320070 ?auto_320069 ) ( not ( = ?auto_320069 ?auto_320070 ) ) ( not ( = ?auto_320069 ?auto_320071 ) ) ( not ( = ?auto_320069 ?auto_320072 ) ) ( not ( = ?auto_320069 ?auto_320073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320070 ?auto_320071 ?auto_320072 )
      ( MAKE-3CRATE-VERIFY ?auto_320069 ?auto_320070 ?auto_320071 ?auto_320072 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320097 - SURFACE
      ?auto_320098 - SURFACE
      ?auto_320099 - SURFACE
      ?auto_320100 - SURFACE
    )
    :vars
    (
      ?auto_320103 - HOIST
      ?auto_320104 - PLACE
      ?auto_320105 - PLACE
      ?auto_320102 - HOIST
      ?auto_320101 - SURFACE
      ?auto_320106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320103 ?auto_320104 ) ( IS-CRATE ?auto_320100 ) ( not ( = ?auto_320099 ?auto_320100 ) ) ( not ( = ?auto_320098 ?auto_320099 ) ) ( not ( = ?auto_320098 ?auto_320100 ) ) ( not ( = ?auto_320105 ?auto_320104 ) ) ( HOIST-AT ?auto_320102 ?auto_320105 ) ( not ( = ?auto_320103 ?auto_320102 ) ) ( AVAILABLE ?auto_320102 ) ( SURFACE-AT ?auto_320100 ?auto_320105 ) ( ON ?auto_320100 ?auto_320101 ) ( CLEAR ?auto_320100 ) ( not ( = ?auto_320099 ?auto_320101 ) ) ( not ( = ?auto_320100 ?auto_320101 ) ) ( not ( = ?auto_320098 ?auto_320101 ) ) ( TRUCK-AT ?auto_320106 ?auto_320104 ) ( SURFACE-AT ?auto_320098 ?auto_320104 ) ( CLEAR ?auto_320098 ) ( LIFTING ?auto_320103 ?auto_320099 ) ( IS-CRATE ?auto_320099 ) ( ON ?auto_320098 ?auto_320097 ) ( not ( = ?auto_320097 ?auto_320098 ) ) ( not ( = ?auto_320097 ?auto_320099 ) ) ( not ( = ?auto_320097 ?auto_320100 ) ) ( not ( = ?auto_320097 ?auto_320101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320098 ?auto_320099 ?auto_320100 )
      ( MAKE-3CRATE-VERIFY ?auto_320097 ?auto_320098 ?auto_320099 ?auto_320100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320125 - SURFACE
      ?auto_320126 - SURFACE
      ?auto_320127 - SURFACE
      ?auto_320128 - SURFACE
    )
    :vars
    (
      ?auto_320130 - HOIST
      ?auto_320133 - PLACE
      ?auto_320134 - PLACE
      ?auto_320131 - HOIST
      ?auto_320129 - SURFACE
      ?auto_320132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320130 ?auto_320133 ) ( IS-CRATE ?auto_320128 ) ( not ( = ?auto_320127 ?auto_320128 ) ) ( not ( = ?auto_320126 ?auto_320127 ) ) ( not ( = ?auto_320126 ?auto_320128 ) ) ( not ( = ?auto_320134 ?auto_320133 ) ) ( HOIST-AT ?auto_320131 ?auto_320134 ) ( not ( = ?auto_320130 ?auto_320131 ) ) ( AVAILABLE ?auto_320131 ) ( SURFACE-AT ?auto_320128 ?auto_320134 ) ( ON ?auto_320128 ?auto_320129 ) ( CLEAR ?auto_320128 ) ( not ( = ?auto_320127 ?auto_320129 ) ) ( not ( = ?auto_320128 ?auto_320129 ) ) ( not ( = ?auto_320126 ?auto_320129 ) ) ( TRUCK-AT ?auto_320132 ?auto_320133 ) ( SURFACE-AT ?auto_320126 ?auto_320133 ) ( CLEAR ?auto_320126 ) ( IS-CRATE ?auto_320127 ) ( AVAILABLE ?auto_320130 ) ( IN ?auto_320127 ?auto_320132 ) ( ON ?auto_320126 ?auto_320125 ) ( not ( = ?auto_320125 ?auto_320126 ) ) ( not ( = ?auto_320125 ?auto_320127 ) ) ( not ( = ?auto_320125 ?auto_320128 ) ) ( not ( = ?auto_320125 ?auto_320129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320126 ?auto_320127 ?auto_320128 )
      ( MAKE-3CRATE-VERIFY ?auto_320125 ?auto_320126 ?auto_320127 ?auto_320128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320204 - SURFACE
      ?auto_320205 - SURFACE
    )
    :vars
    (
      ?auto_320207 - HOIST
      ?auto_320208 - PLACE
      ?auto_320206 - SURFACE
      ?auto_320209 - PLACE
      ?auto_320210 - HOIST
      ?auto_320211 - SURFACE
      ?auto_320212 - TRUCK
      ?auto_320213 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320207 ?auto_320208 ) ( SURFACE-AT ?auto_320204 ?auto_320208 ) ( CLEAR ?auto_320204 ) ( IS-CRATE ?auto_320205 ) ( not ( = ?auto_320204 ?auto_320205 ) ) ( AVAILABLE ?auto_320207 ) ( ON ?auto_320204 ?auto_320206 ) ( not ( = ?auto_320206 ?auto_320204 ) ) ( not ( = ?auto_320206 ?auto_320205 ) ) ( not ( = ?auto_320209 ?auto_320208 ) ) ( HOIST-AT ?auto_320210 ?auto_320209 ) ( not ( = ?auto_320207 ?auto_320210 ) ) ( AVAILABLE ?auto_320210 ) ( SURFACE-AT ?auto_320205 ?auto_320209 ) ( ON ?auto_320205 ?auto_320211 ) ( CLEAR ?auto_320205 ) ( not ( = ?auto_320204 ?auto_320211 ) ) ( not ( = ?auto_320205 ?auto_320211 ) ) ( not ( = ?auto_320206 ?auto_320211 ) ) ( TRUCK-AT ?auto_320212 ?auto_320213 ) ( not ( = ?auto_320213 ?auto_320208 ) ) ( not ( = ?auto_320209 ?auto_320213 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_320212 ?auto_320213 ?auto_320208 )
      ( MAKE-1CRATE ?auto_320204 ?auto_320205 )
      ( MAKE-1CRATE-VERIFY ?auto_320204 ?auto_320205 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320310 - SURFACE
      ?auto_320311 - SURFACE
    )
    :vars
    (
      ?auto_320316 - HOIST
      ?auto_320313 - PLACE
      ?auto_320314 - SURFACE
      ?auto_320317 - PLACE
      ?auto_320312 - HOIST
      ?auto_320318 - SURFACE
      ?auto_320315 - TRUCK
      ?auto_320319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320316 ?auto_320313 ) ( SURFACE-AT ?auto_320310 ?auto_320313 ) ( CLEAR ?auto_320310 ) ( IS-CRATE ?auto_320311 ) ( not ( = ?auto_320310 ?auto_320311 ) ) ( ON ?auto_320310 ?auto_320314 ) ( not ( = ?auto_320314 ?auto_320310 ) ) ( not ( = ?auto_320314 ?auto_320311 ) ) ( not ( = ?auto_320317 ?auto_320313 ) ) ( HOIST-AT ?auto_320312 ?auto_320317 ) ( not ( = ?auto_320316 ?auto_320312 ) ) ( AVAILABLE ?auto_320312 ) ( SURFACE-AT ?auto_320311 ?auto_320317 ) ( ON ?auto_320311 ?auto_320318 ) ( CLEAR ?auto_320311 ) ( not ( = ?auto_320310 ?auto_320318 ) ) ( not ( = ?auto_320311 ?auto_320318 ) ) ( not ( = ?auto_320314 ?auto_320318 ) ) ( TRUCK-AT ?auto_320315 ?auto_320313 ) ( LIFTING ?auto_320316 ?auto_320319 ) ( IS-CRATE ?auto_320319 ) ( not ( = ?auto_320310 ?auto_320319 ) ) ( not ( = ?auto_320311 ?auto_320319 ) ) ( not ( = ?auto_320314 ?auto_320319 ) ) ( not ( = ?auto_320318 ?auto_320319 ) ) )
    :subtasks
    ( ( !LOAD ?auto_320316 ?auto_320319 ?auto_320315 ?auto_320313 )
      ( MAKE-1CRATE ?auto_320310 ?auto_320311 )
      ( MAKE-1CRATE-VERIFY ?auto_320310 ?auto_320311 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320418 - SURFACE
      ?auto_320419 - SURFACE
      ?auto_320420 - SURFACE
      ?auto_320422 - SURFACE
      ?auto_320421 - SURFACE
    )
    :vars
    (
      ?auto_320423 - HOIST
      ?auto_320424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320423 ?auto_320424 ) ( SURFACE-AT ?auto_320422 ?auto_320424 ) ( CLEAR ?auto_320422 ) ( LIFTING ?auto_320423 ?auto_320421 ) ( IS-CRATE ?auto_320421 ) ( not ( = ?auto_320422 ?auto_320421 ) ) ( ON ?auto_320419 ?auto_320418 ) ( ON ?auto_320420 ?auto_320419 ) ( ON ?auto_320422 ?auto_320420 ) ( not ( = ?auto_320418 ?auto_320419 ) ) ( not ( = ?auto_320418 ?auto_320420 ) ) ( not ( = ?auto_320418 ?auto_320422 ) ) ( not ( = ?auto_320418 ?auto_320421 ) ) ( not ( = ?auto_320419 ?auto_320420 ) ) ( not ( = ?auto_320419 ?auto_320422 ) ) ( not ( = ?auto_320419 ?auto_320421 ) ) ( not ( = ?auto_320420 ?auto_320422 ) ) ( not ( = ?auto_320420 ?auto_320421 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320422 ?auto_320421 )
      ( MAKE-4CRATE-VERIFY ?auto_320418 ?auto_320419 ?auto_320420 ?auto_320422 ?auto_320421 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320443 - SURFACE
      ?auto_320444 - SURFACE
      ?auto_320445 - SURFACE
      ?auto_320447 - SURFACE
      ?auto_320446 - SURFACE
    )
    :vars
    (
      ?auto_320449 - HOIST
      ?auto_320448 - PLACE
      ?auto_320450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320449 ?auto_320448 ) ( SURFACE-AT ?auto_320447 ?auto_320448 ) ( CLEAR ?auto_320447 ) ( IS-CRATE ?auto_320446 ) ( not ( = ?auto_320447 ?auto_320446 ) ) ( TRUCK-AT ?auto_320450 ?auto_320448 ) ( AVAILABLE ?auto_320449 ) ( IN ?auto_320446 ?auto_320450 ) ( ON ?auto_320447 ?auto_320445 ) ( not ( = ?auto_320445 ?auto_320447 ) ) ( not ( = ?auto_320445 ?auto_320446 ) ) ( ON ?auto_320444 ?auto_320443 ) ( ON ?auto_320445 ?auto_320444 ) ( not ( = ?auto_320443 ?auto_320444 ) ) ( not ( = ?auto_320443 ?auto_320445 ) ) ( not ( = ?auto_320443 ?auto_320447 ) ) ( not ( = ?auto_320443 ?auto_320446 ) ) ( not ( = ?auto_320444 ?auto_320445 ) ) ( not ( = ?auto_320444 ?auto_320447 ) ) ( not ( = ?auto_320444 ?auto_320446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320445 ?auto_320447 ?auto_320446 )
      ( MAKE-4CRATE-VERIFY ?auto_320443 ?auto_320444 ?auto_320445 ?auto_320447 ?auto_320446 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320473 - SURFACE
      ?auto_320474 - SURFACE
      ?auto_320475 - SURFACE
      ?auto_320477 - SURFACE
      ?auto_320476 - SURFACE
    )
    :vars
    (
      ?auto_320479 - HOIST
      ?auto_320480 - PLACE
      ?auto_320481 - TRUCK
      ?auto_320478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320479 ?auto_320480 ) ( SURFACE-AT ?auto_320477 ?auto_320480 ) ( CLEAR ?auto_320477 ) ( IS-CRATE ?auto_320476 ) ( not ( = ?auto_320477 ?auto_320476 ) ) ( AVAILABLE ?auto_320479 ) ( IN ?auto_320476 ?auto_320481 ) ( ON ?auto_320477 ?auto_320475 ) ( not ( = ?auto_320475 ?auto_320477 ) ) ( not ( = ?auto_320475 ?auto_320476 ) ) ( TRUCK-AT ?auto_320481 ?auto_320478 ) ( not ( = ?auto_320478 ?auto_320480 ) ) ( ON ?auto_320474 ?auto_320473 ) ( ON ?auto_320475 ?auto_320474 ) ( not ( = ?auto_320473 ?auto_320474 ) ) ( not ( = ?auto_320473 ?auto_320475 ) ) ( not ( = ?auto_320473 ?auto_320477 ) ) ( not ( = ?auto_320473 ?auto_320476 ) ) ( not ( = ?auto_320474 ?auto_320475 ) ) ( not ( = ?auto_320474 ?auto_320477 ) ) ( not ( = ?auto_320474 ?auto_320476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320475 ?auto_320477 ?auto_320476 )
      ( MAKE-4CRATE-VERIFY ?auto_320473 ?auto_320474 ?auto_320475 ?auto_320477 ?auto_320476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320507 - SURFACE
      ?auto_320508 - SURFACE
      ?auto_320509 - SURFACE
      ?auto_320511 - SURFACE
      ?auto_320510 - SURFACE
    )
    :vars
    (
      ?auto_320513 - HOIST
      ?auto_320514 - PLACE
      ?auto_320516 - TRUCK
      ?auto_320512 - PLACE
      ?auto_320515 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_320513 ?auto_320514 ) ( SURFACE-AT ?auto_320511 ?auto_320514 ) ( CLEAR ?auto_320511 ) ( IS-CRATE ?auto_320510 ) ( not ( = ?auto_320511 ?auto_320510 ) ) ( AVAILABLE ?auto_320513 ) ( ON ?auto_320511 ?auto_320509 ) ( not ( = ?auto_320509 ?auto_320511 ) ) ( not ( = ?auto_320509 ?auto_320510 ) ) ( TRUCK-AT ?auto_320516 ?auto_320512 ) ( not ( = ?auto_320512 ?auto_320514 ) ) ( HOIST-AT ?auto_320515 ?auto_320512 ) ( LIFTING ?auto_320515 ?auto_320510 ) ( not ( = ?auto_320513 ?auto_320515 ) ) ( ON ?auto_320508 ?auto_320507 ) ( ON ?auto_320509 ?auto_320508 ) ( not ( = ?auto_320507 ?auto_320508 ) ) ( not ( = ?auto_320507 ?auto_320509 ) ) ( not ( = ?auto_320507 ?auto_320511 ) ) ( not ( = ?auto_320507 ?auto_320510 ) ) ( not ( = ?auto_320508 ?auto_320509 ) ) ( not ( = ?auto_320508 ?auto_320511 ) ) ( not ( = ?auto_320508 ?auto_320510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320509 ?auto_320511 ?auto_320510 )
      ( MAKE-4CRATE-VERIFY ?auto_320507 ?auto_320508 ?auto_320509 ?auto_320511 ?auto_320510 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320545 - SURFACE
      ?auto_320546 - SURFACE
      ?auto_320547 - SURFACE
      ?auto_320549 - SURFACE
      ?auto_320548 - SURFACE
    )
    :vars
    (
      ?auto_320555 - HOIST
      ?auto_320551 - PLACE
      ?auto_320553 - TRUCK
      ?auto_320552 - PLACE
      ?auto_320554 - HOIST
      ?auto_320550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320555 ?auto_320551 ) ( SURFACE-AT ?auto_320549 ?auto_320551 ) ( CLEAR ?auto_320549 ) ( IS-CRATE ?auto_320548 ) ( not ( = ?auto_320549 ?auto_320548 ) ) ( AVAILABLE ?auto_320555 ) ( ON ?auto_320549 ?auto_320547 ) ( not ( = ?auto_320547 ?auto_320549 ) ) ( not ( = ?auto_320547 ?auto_320548 ) ) ( TRUCK-AT ?auto_320553 ?auto_320552 ) ( not ( = ?auto_320552 ?auto_320551 ) ) ( HOIST-AT ?auto_320554 ?auto_320552 ) ( not ( = ?auto_320555 ?auto_320554 ) ) ( AVAILABLE ?auto_320554 ) ( SURFACE-AT ?auto_320548 ?auto_320552 ) ( ON ?auto_320548 ?auto_320550 ) ( CLEAR ?auto_320548 ) ( not ( = ?auto_320549 ?auto_320550 ) ) ( not ( = ?auto_320548 ?auto_320550 ) ) ( not ( = ?auto_320547 ?auto_320550 ) ) ( ON ?auto_320546 ?auto_320545 ) ( ON ?auto_320547 ?auto_320546 ) ( not ( = ?auto_320545 ?auto_320546 ) ) ( not ( = ?auto_320545 ?auto_320547 ) ) ( not ( = ?auto_320545 ?auto_320549 ) ) ( not ( = ?auto_320545 ?auto_320548 ) ) ( not ( = ?auto_320545 ?auto_320550 ) ) ( not ( = ?auto_320546 ?auto_320547 ) ) ( not ( = ?auto_320546 ?auto_320549 ) ) ( not ( = ?auto_320546 ?auto_320548 ) ) ( not ( = ?auto_320546 ?auto_320550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320547 ?auto_320549 ?auto_320548 )
      ( MAKE-4CRATE-VERIFY ?auto_320545 ?auto_320546 ?auto_320547 ?auto_320549 ?auto_320548 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320584 - SURFACE
      ?auto_320585 - SURFACE
      ?auto_320586 - SURFACE
      ?auto_320588 - SURFACE
      ?auto_320587 - SURFACE
    )
    :vars
    (
      ?auto_320592 - HOIST
      ?auto_320594 - PLACE
      ?auto_320591 - PLACE
      ?auto_320589 - HOIST
      ?auto_320593 - SURFACE
      ?auto_320590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320592 ?auto_320594 ) ( SURFACE-AT ?auto_320588 ?auto_320594 ) ( CLEAR ?auto_320588 ) ( IS-CRATE ?auto_320587 ) ( not ( = ?auto_320588 ?auto_320587 ) ) ( AVAILABLE ?auto_320592 ) ( ON ?auto_320588 ?auto_320586 ) ( not ( = ?auto_320586 ?auto_320588 ) ) ( not ( = ?auto_320586 ?auto_320587 ) ) ( not ( = ?auto_320591 ?auto_320594 ) ) ( HOIST-AT ?auto_320589 ?auto_320591 ) ( not ( = ?auto_320592 ?auto_320589 ) ) ( AVAILABLE ?auto_320589 ) ( SURFACE-AT ?auto_320587 ?auto_320591 ) ( ON ?auto_320587 ?auto_320593 ) ( CLEAR ?auto_320587 ) ( not ( = ?auto_320588 ?auto_320593 ) ) ( not ( = ?auto_320587 ?auto_320593 ) ) ( not ( = ?auto_320586 ?auto_320593 ) ) ( TRUCK-AT ?auto_320590 ?auto_320594 ) ( ON ?auto_320585 ?auto_320584 ) ( ON ?auto_320586 ?auto_320585 ) ( not ( = ?auto_320584 ?auto_320585 ) ) ( not ( = ?auto_320584 ?auto_320586 ) ) ( not ( = ?auto_320584 ?auto_320588 ) ) ( not ( = ?auto_320584 ?auto_320587 ) ) ( not ( = ?auto_320584 ?auto_320593 ) ) ( not ( = ?auto_320585 ?auto_320586 ) ) ( not ( = ?auto_320585 ?auto_320588 ) ) ( not ( = ?auto_320585 ?auto_320587 ) ) ( not ( = ?auto_320585 ?auto_320593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320586 ?auto_320588 ?auto_320587 )
      ( MAKE-4CRATE-VERIFY ?auto_320584 ?auto_320585 ?auto_320586 ?auto_320588 ?auto_320587 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320623 - SURFACE
      ?auto_320624 - SURFACE
      ?auto_320625 - SURFACE
      ?auto_320627 - SURFACE
      ?auto_320626 - SURFACE
    )
    :vars
    (
      ?auto_320632 - HOIST
      ?auto_320628 - PLACE
      ?auto_320633 - PLACE
      ?auto_320631 - HOIST
      ?auto_320629 - SURFACE
      ?auto_320630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320632 ?auto_320628 ) ( IS-CRATE ?auto_320626 ) ( not ( = ?auto_320627 ?auto_320626 ) ) ( not ( = ?auto_320625 ?auto_320627 ) ) ( not ( = ?auto_320625 ?auto_320626 ) ) ( not ( = ?auto_320633 ?auto_320628 ) ) ( HOIST-AT ?auto_320631 ?auto_320633 ) ( not ( = ?auto_320632 ?auto_320631 ) ) ( AVAILABLE ?auto_320631 ) ( SURFACE-AT ?auto_320626 ?auto_320633 ) ( ON ?auto_320626 ?auto_320629 ) ( CLEAR ?auto_320626 ) ( not ( = ?auto_320627 ?auto_320629 ) ) ( not ( = ?auto_320626 ?auto_320629 ) ) ( not ( = ?auto_320625 ?auto_320629 ) ) ( TRUCK-AT ?auto_320630 ?auto_320628 ) ( SURFACE-AT ?auto_320625 ?auto_320628 ) ( CLEAR ?auto_320625 ) ( LIFTING ?auto_320632 ?auto_320627 ) ( IS-CRATE ?auto_320627 ) ( ON ?auto_320624 ?auto_320623 ) ( ON ?auto_320625 ?auto_320624 ) ( not ( = ?auto_320623 ?auto_320624 ) ) ( not ( = ?auto_320623 ?auto_320625 ) ) ( not ( = ?auto_320623 ?auto_320627 ) ) ( not ( = ?auto_320623 ?auto_320626 ) ) ( not ( = ?auto_320623 ?auto_320629 ) ) ( not ( = ?auto_320624 ?auto_320625 ) ) ( not ( = ?auto_320624 ?auto_320627 ) ) ( not ( = ?auto_320624 ?auto_320626 ) ) ( not ( = ?auto_320624 ?auto_320629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320625 ?auto_320627 ?auto_320626 )
      ( MAKE-4CRATE-VERIFY ?auto_320623 ?auto_320624 ?auto_320625 ?auto_320627 ?auto_320626 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320662 - SURFACE
      ?auto_320663 - SURFACE
      ?auto_320664 - SURFACE
      ?auto_320666 - SURFACE
      ?auto_320665 - SURFACE
    )
    :vars
    (
      ?auto_320668 - HOIST
      ?auto_320669 - PLACE
      ?auto_320667 - PLACE
      ?auto_320671 - HOIST
      ?auto_320670 - SURFACE
      ?auto_320672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320668 ?auto_320669 ) ( IS-CRATE ?auto_320665 ) ( not ( = ?auto_320666 ?auto_320665 ) ) ( not ( = ?auto_320664 ?auto_320666 ) ) ( not ( = ?auto_320664 ?auto_320665 ) ) ( not ( = ?auto_320667 ?auto_320669 ) ) ( HOIST-AT ?auto_320671 ?auto_320667 ) ( not ( = ?auto_320668 ?auto_320671 ) ) ( AVAILABLE ?auto_320671 ) ( SURFACE-AT ?auto_320665 ?auto_320667 ) ( ON ?auto_320665 ?auto_320670 ) ( CLEAR ?auto_320665 ) ( not ( = ?auto_320666 ?auto_320670 ) ) ( not ( = ?auto_320665 ?auto_320670 ) ) ( not ( = ?auto_320664 ?auto_320670 ) ) ( TRUCK-AT ?auto_320672 ?auto_320669 ) ( SURFACE-AT ?auto_320664 ?auto_320669 ) ( CLEAR ?auto_320664 ) ( IS-CRATE ?auto_320666 ) ( AVAILABLE ?auto_320668 ) ( IN ?auto_320666 ?auto_320672 ) ( ON ?auto_320663 ?auto_320662 ) ( ON ?auto_320664 ?auto_320663 ) ( not ( = ?auto_320662 ?auto_320663 ) ) ( not ( = ?auto_320662 ?auto_320664 ) ) ( not ( = ?auto_320662 ?auto_320666 ) ) ( not ( = ?auto_320662 ?auto_320665 ) ) ( not ( = ?auto_320662 ?auto_320670 ) ) ( not ( = ?auto_320663 ?auto_320664 ) ) ( not ( = ?auto_320663 ?auto_320666 ) ) ( not ( = ?auto_320663 ?auto_320665 ) ) ( not ( = ?auto_320663 ?auto_320670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320664 ?auto_320666 ?auto_320665 )
      ( MAKE-4CRATE-VERIFY ?auto_320662 ?auto_320663 ?auto_320664 ?auto_320666 ?auto_320665 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320691 - SURFACE
      ?auto_320692 - SURFACE
      ?auto_320693 - SURFACE
      ?auto_320694 - SURFACE
    )
    :vars
    (
      ?auto_320696 - HOIST
      ?auto_320695 - PLACE
      ?auto_320700 - PLACE
      ?auto_320699 - HOIST
      ?auto_320698 - SURFACE
      ?auto_320697 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320696 ?auto_320695 ) ( IS-CRATE ?auto_320694 ) ( not ( = ?auto_320693 ?auto_320694 ) ) ( not ( = ?auto_320692 ?auto_320693 ) ) ( not ( = ?auto_320692 ?auto_320694 ) ) ( not ( = ?auto_320700 ?auto_320695 ) ) ( HOIST-AT ?auto_320699 ?auto_320700 ) ( not ( = ?auto_320696 ?auto_320699 ) ) ( AVAILABLE ?auto_320699 ) ( SURFACE-AT ?auto_320694 ?auto_320700 ) ( ON ?auto_320694 ?auto_320698 ) ( CLEAR ?auto_320694 ) ( not ( = ?auto_320693 ?auto_320698 ) ) ( not ( = ?auto_320694 ?auto_320698 ) ) ( not ( = ?auto_320692 ?auto_320698 ) ) ( SURFACE-AT ?auto_320692 ?auto_320695 ) ( CLEAR ?auto_320692 ) ( IS-CRATE ?auto_320693 ) ( AVAILABLE ?auto_320696 ) ( IN ?auto_320693 ?auto_320697 ) ( TRUCK-AT ?auto_320697 ?auto_320700 ) ( ON ?auto_320692 ?auto_320691 ) ( not ( = ?auto_320691 ?auto_320692 ) ) ( not ( = ?auto_320691 ?auto_320693 ) ) ( not ( = ?auto_320691 ?auto_320694 ) ) ( not ( = ?auto_320691 ?auto_320698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320692 ?auto_320693 ?auto_320694 )
      ( MAKE-3CRATE-VERIFY ?auto_320691 ?auto_320692 ?auto_320693 ?auto_320694 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320701 - SURFACE
      ?auto_320702 - SURFACE
      ?auto_320703 - SURFACE
      ?auto_320705 - SURFACE
      ?auto_320704 - SURFACE
    )
    :vars
    (
      ?auto_320707 - HOIST
      ?auto_320706 - PLACE
      ?auto_320711 - PLACE
      ?auto_320710 - HOIST
      ?auto_320709 - SURFACE
      ?auto_320708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320707 ?auto_320706 ) ( IS-CRATE ?auto_320704 ) ( not ( = ?auto_320705 ?auto_320704 ) ) ( not ( = ?auto_320703 ?auto_320705 ) ) ( not ( = ?auto_320703 ?auto_320704 ) ) ( not ( = ?auto_320711 ?auto_320706 ) ) ( HOIST-AT ?auto_320710 ?auto_320711 ) ( not ( = ?auto_320707 ?auto_320710 ) ) ( AVAILABLE ?auto_320710 ) ( SURFACE-AT ?auto_320704 ?auto_320711 ) ( ON ?auto_320704 ?auto_320709 ) ( CLEAR ?auto_320704 ) ( not ( = ?auto_320705 ?auto_320709 ) ) ( not ( = ?auto_320704 ?auto_320709 ) ) ( not ( = ?auto_320703 ?auto_320709 ) ) ( SURFACE-AT ?auto_320703 ?auto_320706 ) ( CLEAR ?auto_320703 ) ( IS-CRATE ?auto_320705 ) ( AVAILABLE ?auto_320707 ) ( IN ?auto_320705 ?auto_320708 ) ( TRUCK-AT ?auto_320708 ?auto_320711 ) ( ON ?auto_320702 ?auto_320701 ) ( ON ?auto_320703 ?auto_320702 ) ( not ( = ?auto_320701 ?auto_320702 ) ) ( not ( = ?auto_320701 ?auto_320703 ) ) ( not ( = ?auto_320701 ?auto_320705 ) ) ( not ( = ?auto_320701 ?auto_320704 ) ) ( not ( = ?auto_320701 ?auto_320709 ) ) ( not ( = ?auto_320702 ?auto_320703 ) ) ( not ( = ?auto_320702 ?auto_320705 ) ) ( not ( = ?auto_320702 ?auto_320704 ) ) ( not ( = ?auto_320702 ?auto_320709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320703 ?auto_320705 ?auto_320704 )
      ( MAKE-4CRATE-VERIFY ?auto_320701 ?auto_320702 ?auto_320703 ?auto_320705 ?auto_320704 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320730 - SURFACE
      ?auto_320731 - SURFACE
      ?auto_320732 - SURFACE
      ?auto_320733 - SURFACE
    )
    :vars
    (
      ?auto_320739 - HOIST
      ?auto_320735 - PLACE
      ?auto_320737 - PLACE
      ?auto_320734 - HOIST
      ?auto_320738 - SURFACE
      ?auto_320736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320739 ?auto_320735 ) ( IS-CRATE ?auto_320733 ) ( not ( = ?auto_320732 ?auto_320733 ) ) ( not ( = ?auto_320731 ?auto_320732 ) ) ( not ( = ?auto_320731 ?auto_320733 ) ) ( not ( = ?auto_320737 ?auto_320735 ) ) ( HOIST-AT ?auto_320734 ?auto_320737 ) ( not ( = ?auto_320739 ?auto_320734 ) ) ( SURFACE-AT ?auto_320733 ?auto_320737 ) ( ON ?auto_320733 ?auto_320738 ) ( CLEAR ?auto_320733 ) ( not ( = ?auto_320732 ?auto_320738 ) ) ( not ( = ?auto_320733 ?auto_320738 ) ) ( not ( = ?auto_320731 ?auto_320738 ) ) ( SURFACE-AT ?auto_320731 ?auto_320735 ) ( CLEAR ?auto_320731 ) ( IS-CRATE ?auto_320732 ) ( AVAILABLE ?auto_320739 ) ( TRUCK-AT ?auto_320736 ?auto_320737 ) ( LIFTING ?auto_320734 ?auto_320732 ) ( ON ?auto_320731 ?auto_320730 ) ( not ( = ?auto_320730 ?auto_320731 ) ) ( not ( = ?auto_320730 ?auto_320732 ) ) ( not ( = ?auto_320730 ?auto_320733 ) ) ( not ( = ?auto_320730 ?auto_320738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320731 ?auto_320732 ?auto_320733 )
      ( MAKE-3CRATE-VERIFY ?auto_320730 ?auto_320731 ?auto_320732 ?auto_320733 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320740 - SURFACE
      ?auto_320741 - SURFACE
      ?auto_320742 - SURFACE
      ?auto_320744 - SURFACE
      ?auto_320743 - SURFACE
    )
    :vars
    (
      ?auto_320750 - HOIST
      ?auto_320746 - PLACE
      ?auto_320748 - PLACE
      ?auto_320745 - HOIST
      ?auto_320749 - SURFACE
      ?auto_320747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320750 ?auto_320746 ) ( IS-CRATE ?auto_320743 ) ( not ( = ?auto_320744 ?auto_320743 ) ) ( not ( = ?auto_320742 ?auto_320744 ) ) ( not ( = ?auto_320742 ?auto_320743 ) ) ( not ( = ?auto_320748 ?auto_320746 ) ) ( HOIST-AT ?auto_320745 ?auto_320748 ) ( not ( = ?auto_320750 ?auto_320745 ) ) ( SURFACE-AT ?auto_320743 ?auto_320748 ) ( ON ?auto_320743 ?auto_320749 ) ( CLEAR ?auto_320743 ) ( not ( = ?auto_320744 ?auto_320749 ) ) ( not ( = ?auto_320743 ?auto_320749 ) ) ( not ( = ?auto_320742 ?auto_320749 ) ) ( SURFACE-AT ?auto_320742 ?auto_320746 ) ( CLEAR ?auto_320742 ) ( IS-CRATE ?auto_320744 ) ( AVAILABLE ?auto_320750 ) ( TRUCK-AT ?auto_320747 ?auto_320748 ) ( LIFTING ?auto_320745 ?auto_320744 ) ( ON ?auto_320741 ?auto_320740 ) ( ON ?auto_320742 ?auto_320741 ) ( not ( = ?auto_320740 ?auto_320741 ) ) ( not ( = ?auto_320740 ?auto_320742 ) ) ( not ( = ?auto_320740 ?auto_320744 ) ) ( not ( = ?auto_320740 ?auto_320743 ) ) ( not ( = ?auto_320740 ?auto_320749 ) ) ( not ( = ?auto_320741 ?auto_320742 ) ) ( not ( = ?auto_320741 ?auto_320744 ) ) ( not ( = ?auto_320741 ?auto_320743 ) ) ( not ( = ?auto_320741 ?auto_320749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320742 ?auto_320744 ?auto_320743 )
      ( MAKE-4CRATE-VERIFY ?auto_320740 ?auto_320741 ?auto_320742 ?auto_320744 ?auto_320743 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320771 - SURFACE
      ?auto_320772 - SURFACE
      ?auto_320773 - SURFACE
      ?auto_320774 - SURFACE
    )
    :vars
    (
      ?auto_320781 - HOIST
      ?auto_320779 - PLACE
      ?auto_320776 - PLACE
      ?auto_320778 - HOIST
      ?auto_320777 - SURFACE
      ?auto_320775 - TRUCK
      ?auto_320780 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320781 ?auto_320779 ) ( IS-CRATE ?auto_320774 ) ( not ( = ?auto_320773 ?auto_320774 ) ) ( not ( = ?auto_320772 ?auto_320773 ) ) ( not ( = ?auto_320772 ?auto_320774 ) ) ( not ( = ?auto_320776 ?auto_320779 ) ) ( HOIST-AT ?auto_320778 ?auto_320776 ) ( not ( = ?auto_320781 ?auto_320778 ) ) ( SURFACE-AT ?auto_320774 ?auto_320776 ) ( ON ?auto_320774 ?auto_320777 ) ( CLEAR ?auto_320774 ) ( not ( = ?auto_320773 ?auto_320777 ) ) ( not ( = ?auto_320774 ?auto_320777 ) ) ( not ( = ?auto_320772 ?auto_320777 ) ) ( SURFACE-AT ?auto_320772 ?auto_320779 ) ( CLEAR ?auto_320772 ) ( IS-CRATE ?auto_320773 ) ( AVAILABLE ?auto_320781 ) ( TRUCK-AT ?auto_320775 ?auto_320776 ) ( AVAILABLE ?auto_320778 ) ( SURFACE-AT ?auto_320773 ?auto_320776 ) ( ON ?auto_320773 ?auto_320780 ) ( CLEAR ?auto_320773 ) ( not ( = ?auto_320773 ?auto_320780 ) ) ( not ( = ?auto_320774 ?auto_320780 ) ) ( not ( = ?auto_320772 ?auto_320780 ) ) ( not ( = ?auto_320777 ?auto_320780 ) ) ( ON ?auto_320772 ?auto_320771 ) ( not ( = ?auto_320771 ?auto_320772 ) ) ( not ( = ?auto_320771 ?auto_320773 ) ) ( not ( = ?auto_320771 ?auto_320774 ) ) ( not ( = ?auto_320771 ?auto_320777 ) ) ( not ( = ?auto_320771 ?auto_320780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320772 ?auto_320773 ?auto_320774 )
      ( MAKE-3CRATE-VERIFY ?auto_320771 ?auto_320772 ?auto_320773 ?auto_320774 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320782 - SURFACE
      ?auto_320783 - SURFACE
      ?auto_320784 - SURFACE
      ?auto_320786 - SURFACE
      ?auto_320785 - SURFACE
    )
    :vars
    (
      ?auto_320793 - HOIST
      ?auto_320791 - PLACE
      ?auto_320788 - PLACE
      ?auto_320790 - HOIST
      ?auto_320789 - SURFACE
      ?auto_320787 - TRUCK
      ?auto_320792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320793 ?auto_320791 ) ( IS-CRATE ?auto_320785 ) ( not ( = ?auto_320786 ?auto_320785 ) ) ( not ( = ?auto_320784 ?auto_320786 ) ) ( not ( = ?auto_320784 ?auto_320785 ) ) ( not ( = ?auto_320788 ?auto_320791 ) ) ( HOIST-AT ?auto_320790 ?auto_320788 ) ( not ( = ?auto_320793 ?auto_320790 ) ) ( SURFACE-AT ?auto_320785 ?auto_320788 ) ( ON ?auto_320785 ?auto_320789 ) ( CLEAR ?auto_320785 ) ( not ( = ?auto_320786 ?auto_320789 ) ) ( not ( = ?auto_320785 ?auto_320789 ) ) ( not ( = ?auto_320784 ?auto_320789 ) ) ( SURFACE-AT ?auto_320784 ?auto_320791 ) ( CLEAR ?auto_320784 ) ( IS-CRATE ?auto_320786 ) ( AVAILABLE ?auto_320793 ) ( TRUCK-AT ?auto_320787 ?auto_320788 ) ( AVAILABLE ?auto_320790 ) ( SURFACE-AT ?auto_320786 ?auto_320788 ) ( ON ?auto_320786 ?auto_320792 ) ( CLEAR ?auto_320786 ) ( not ( = ?auto_320786 ?auto_320792 ) ) ( not ( = ?auto_320785 ?auto_320792 ) ) ( not ( = ?auto_320784 ?auto_320792 ) ) ( not ( = ?auto_320789 ?auto_320792 ) ) ( ON ?auto_320783 ?auto_320782 ) ( ON ?auto_320784 ?auto_320783 ) ( not ( = ?auto_320782 ?auto_320783 ) ) ( not ( = ?auto_320782 ?auto_320784 ) ) ( not ( = ?auto_320782 ?auto_320786 ) ) ( not ( = ?auto_320782 ?auto_320785 ) ) ( not ( = ?auto_320782 ?auto_320789 ) ) ( not ( = ?auto_320782 ?auto_320792 ) ) ( not ( = ?auto_320783 ?auto_320784 ) ) ( not ( = ?auto_320783 ?auto_320786 ) ) ( not ( = ?auto_320783 ?auto_320785 ) ) ( not ( = ?auto_320783 ?auto_320789 ) ) ( not ( = ?auto_320783 ?auto_320792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320784 ?auto_320786 ?auto_320785 )
      ( MAKE-4CRATE-VERIFY ?auto_320782 ?auto_320783 ?auto_320784 ?auto_320786 ?auto_320785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320814 - SURFACE
      ?auto_320815 - SURFACE
      ?auto_320816 - SURFACE
      ?auto_320817 - SURFACE
    )
    :vars
    (
      ?auto_320823 - HOIST
      ?auto_320822 - PLACE
      ?auto_320818 - PLACE
      ?auto_320821 - HOIST
      ?auto_320820 - SURFACE
      ?auto_320819 - SURFACE
      ?auto_320824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320823 ?auto_320822 ) ( IS-CRATE ?auto_320817 ) ( not ( = ?auto_320816 ?auto_320817 ) ) ( not ( = ?auto_320815 ?auto_320816 ) ) ( not ( = ?auto_320815 ?auto_320817 ) ) ( not ( = ?auto_320818 ?auto_320822 ) ) ( HOIST-AT ?auto_320821 ?auto_320818 ) ( not ( = ?auto_320823 ?auto_320821 ) ) ( SURFACE-AT ?auto_320817 ?auto_320818 ) ( ON ?auto_320817 ?auto_320820 ) ( CLEAR ?auto_320817 ) ( not ( = ?auto_320816 ?auto_320820 ) ) ( not ( = ?auto_320817 ?auto_320820 ) ) ( not ( = ?auto_320815 ?auto_320820 ) ) ( SURFACE-AT ?auto_320815 ?auto_320822 ) ( CLEAR ?auto_320815 ) ( IS-CRATE ?auto_320816 ) ( AVAILABLE ?auto_320823 ) ( AVAILABLE ?auto_320821 ) ( SURFACE-AT ?auto_320816 ?auto_320818 ) ( ON ?auto_320816 ?auto_320819 ) ( CLEAR ?auto_320816 ) ( not ( = ?auto_320816 ?auto_320819 ) ) ( not ( = ?auto_320817 ?auto_320819 ) ) ( not ( = ?auto_320815 ?auto_320819 ) ) ( not ( = ?auto_320820 ?auto_320819 ) ) ( TRUCK-AT ?auto_320824 ?auto_320822 ) ( ON ?auto_320815 ?auto_320814 ) ( not ( = ?auto_320814 ?auto_320815 ) ) ( not ( = ?auto_320814 ?auto_320816 ) ) ( not ( = ?auto_320814 ?auto_320817 ) ) ( not ( = ?auto_320814 ?auto_320820 ) ) ( not ( = ?auto_320814 ?auto_320819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320815 ?auto_320816 ?auto_320817 )
      ( MAKE-3CRATE-VERIFY ?auto_320814 ?auto_320815 ?auto_320816 ?auto_320817 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320825 - SURFACE
      ?auto_320826 - SURFACE
      ?auto_320827 - SURFACE
      ?auto_320829 - SURFACE
      ?auto_320828 - SURFACE
    )
    :vars
    (
      ?auto_320835 - HOIST
      ?auto_320834 - PLACE
      ?auto_320830 - PLACE
      ?auto_320833 - HOIST
      ?auto_320832 - SURFACE
      ?auto_320831 - SURFACE
      ?auto_320836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320835 ?auto_320834 ) ( IS-CRATE ?auto_320828 ) ( not ( = ?auto_320829 ?auto_320828 ) ) ( not ( = ?auto_320827 ?auto_320829 ) ) ( not ( = ?auto_320827 ?auto_320828 ) ) ( not ( = ?auto_320830 ?auto_320834 ) ) ( HOIST-AT ?auto_320833 ?auto_320830 ) ( not ( = ?auto_320835 ?auto_320833 ) ) ( SURFACE-AT ?auto_320828 ?auto_320830 ) ( ON ?auto_320828 ?auto_320832 ) ( CLEAR ?auto_320828 ) ( not ( = ?auto_320829 ?auto_320832 ) ) ( not ( = ?auto_320828 ?auto_320832 ) ) ( not ( = ?auto_320827 ?auto_320832 ) ) ( SURFACE-AT ?auto_320827 ?auto_320834 ) ( CLEAR ?auto_320827 ) ( IS-CRATE ?auto_320829 ) ( AVAILABLE ?auto_320835 ) ( AVAILABLE ?auto_320833 ) ( SURFACE-AT ?auto_320829 ?auto_320830 ) ( ON ?auto_320829 ?auto_320831 ) ( CLEAR ?auto_320829 ) ( not ( = ?auto_320829 ?auto_320831 ) ) ( not ( = ?auto_320828 ?auto_320831 ) ) ( not ( = ?auto_320827 ?auto_320831 ) ) ( not ( = ?auto_320832 ?auto_320831 ) ) ( TRUCK-AT ?auto_320836 ?auto_320834 ) ( ON ?auto_320826 ?auto_320825 ) ( ON ?auto_320827 ?auto_320826 ) ( not ( = ?auto_320825 ?auto_320826 ) ) ( not ( = ?auto_320825 ?auto_320827 ) ) ( not ( = ?auto_320825 ?auto_320829 ) ) ( not ( = ?auto_320825 ?auto_320828 ) ) ( not ( = ?auto_320825 ?auto_320832 ) ) ( not ( = ?auto_320825 ?auto_320831 ) ) ( not ( = ?auto_320826 ?auto_320827 ) ) ( not ( = ?auto_320826 ?auto_320829 ) ) ( not ( = ?auto_320826 ?auto_320828 ) ) ( not ( = ?auto_320826 ?auto_320832 ) ) ( not ( = ?auto_320826 ?auto_320831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320827 ?auto_320829 ?auto_320828 )
      ( MAKE-4CRATE-VERIFY ?auto_320825 ?auto_320826 ?auto_320827 ?auto_320829 ?auto_320828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_320837 - SURFACE
      ?auto_320838 - SURFACE
    )
    :vars
    (
      ?auto_320845 - HOIST
      ?auto_320844 - PLACE
      ?auto_320843 - SURFACE
      ?auto_320839 - PLACE
      ?auto_320842 - HOIST
      ?auto_320841 - SURFACE
      ?auto_320840 - SURFACE
      ?auto_320846 - TRUCK
      ?auto_320847 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320845 ?auto_320844 ) ( IS-CRATE ?auto_320838 ) ( not ( = ?auto_320837 ?auto_320838 ) ) ( not ( = ?auto_320843 ?auto_320837 ) ) ( not ( = ?auto_320843 ?auto_320838 ) ) ( not ( = ?auto_320839 ?auto_320844 ) ) ( HOIST-AT ?auto_320842 ?auto_320839 ) ( not ( = ?auto_320845 ?auto_320842 ) ) ( SURFACE-AT ?auto_320838 ?auto_320839 ) ( ON ?auto_320838 ?auto_320841 ) ( CLEAR ?auto_320838 ) ( not ( = ?auto_320837 ?auto_320841 ) ) ( not ( = ?auto_320838 ?auto_320841 ) ) ( not ( = ?auto_320843 ?auto_320841 ) ) ( IS-CRATE ?auto_320837 ) ( AVAILABLE ?auto_320842 ) ( SURFACE-AT ?auto_320837 ?auto_320839 ) ( ON ?auto_320837 ?auto_320840 ) ( CLEAR ?auto_320837 ) ( not ( = ?auto_320837 ?auto_320840 ) ) ( not ( = ?auto_320838 ?auto_320840 ) ) ( not ( = ?auto_320843 ?auto_320840 ) ) ( not ( = ?auto_320841 ?auto_320840 ) ) ( TRUCK-AT ?auto_320846 ?auto_320844 ) ( SURFACE-AT ?auto_320847 ?auto_320844 ) ( CLEAR ?auto_320847 ) ( LIFTING ?auto_320845 ?auto_320843 ) ( IS-CRATE ?auto_320843 ) ( not ( = ?auto_320847 ?auto_320843 ) ) ( not ( = ?auto_320837 ?auto_320847 ) ) ( not ( = ?auto_320838 ?auto_320847 ) ) ( not ( = ?auto_320841 ?auto_320847 ) ) ( not ( = ?auto_320840 ?auto_320847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320847 ?auto_320843 )
      ( MAKE-2CRATE ?auto_320843 ?auto_320837 ?auto_320838 )
      ( MAKE-1CRATE-VERIFY ?auto_320837 ?auto_320838 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_320848 - SURFACE
      ?auto_320849 - SURFACE
      ?auto_320850 - SURFACE
    )
    :vars
    (
      ?auto_320856 - HOIST
      ?auto_320855 - PLACE
      ?auto_320857 - PLACE
      ?auto_320854 - HOIST
      ?auto_320851 - SURFACE
      ?auto_320852 - SURFACE
      ?auto_320858 - TRUCK
      ?auto_320853 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_320856 ?auto_320855 ) ( IS-CRATE ?auto_320850 ) ( not ( = ?auto_320849 ?auto_320850 ) ) ( not ( = ?auto_320848 ?auto_320849 ) ) ( not ( = ?auto_320848 ?auto_320850 ) ) ( not ( = ?auto_320857 ?auto_320855 ) ) ( HOIST-AT ?auto_320854 ?auto_320857 ) ( not ( = ?auto_320856 ?auto_320854 ) ) ( SURFACE-AT ?auto_320850 ?auto_320857 ) ( ON ?auto_320850 ?auto_320851 ) ( CLEAR ?auto_320850 ) ( not ( = ?auto_320849 ?auto_320851 ) ) ( not ( = ?auto_320850 ?auto_320851 ) ) ( not ( = ?auto_320848 ?auto_320851 ) ) ( IS-CRATE ?auto_320849 ) ( AVAILABLE ?auto_320854 ) ( SURFACE-AT ?auto_320849 ?auto_320857 ) ( ON ?auto_320849 ?auto_320852 ) ( CLEAR ?auto_320849 ) ( not ( = ?auto_320849 ?auto_320852 ) ) ( not ( = ?auto_320850 ?auto_320852 ) ) ( not ( = ?auto_320848 ?auto_320852 ) ) ( not ( = ?auto_320851 ?auto_320852 ) ) ( TRUCK-AT ?auto_320858 ?auto_320855 ) ( SURFACE-AT ?auto_320853 ?auto_320855 ) ( CLEAR ?auto_320853 ) ( LIFTING ?auto_320856 ?auto_320848 ) ( IS-CRATE ?auto_320848 ) ( not ( = ?auto_320853 ?auto_320848 ) ) ( not ( = ?auto_320849 ?auto_320853 ) ) ( not ( = ?auto_320850 ?auto_320853 ) ) ( not ( = ?auto_320851 ?auto_320853 ) ) ( not ( = ?auto_320852 ?auto_320853 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_320849 ?auto_320850 )
      ( MAKE-2CRATE-VERIFY ?auto_320848 ?auto_320849 ?auto_320850 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_320859 - SURFACE
      ?auto_320860 - SURFACE
      ?auto_320861 - SURFACE
      ?auto_320862 - SURFACE
    )
    :vars
    (
      ?auto_320866 - HOIST
      ?auto_320863 - PLACE
      ?auto_320865 - PLACE
      ?auto_320868 - HOIST
      ?auto_320867 - SURFACE
      ?auto_320869 - SURFACE
      ?auto_320864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320866 ?auto_320863 ) ( IS-CRATE ?auto_320862 ) ( not ( = ?auto_320861 ?auto_320862 ) ) ( not ( = ?auto_320860 ?auto_320861 ) ) ( not ( = ?auto_320860 ?auto_320862 ) ) ( not ( = ?auto_320865 ?auto_320863 ) ) ( HOIST-AT ?auto_320868 ?auto_320865 ) ( not ( = ?auto_320866 ?auto_320868 ) ) ( SURFACE-AT ?auto_320862 ?auto_320865 ) ( ON ?auto_320862 ?auto_320867 ) ( CLEAR ?auto_320862 ) ( not ( = ?auto_320861 ?auto_320867 ) ) ( not ( = ?auto_320862 ?auto_320867 ) ) ( not ( = ?auto_320860 ?auto_320867 ) ) ( IS-CRATE ?auto_320861 ) ( AVAILABLE ?auto_320868 ) ( SURFACE-AT ?auto_320861 ?auto_320865 ) ( ON ?auto_320861 ?auto_320869 ) ( CLEAR ?auto_320861 ) ( not ( = ?auto_320861 ?auto_320869 ) ) ( not ( = ?auto_320862 ?auto_320869 ) ) ( not ( = ?auto_320860 ?auto_320869 ) ) ( not ( = ?auto_320867 ?auto_320869 ) ) ( TRUCK-AT ?auto_320864 ?auto_320863 ) ( SURFACE-AT ?auto_320859 ?auto_320863 ) ( CLEAR ?auto_320859 ) ( LIFTING ?auto_320866 ?auto_320860 ) ( IS-CRATE ?auto_320860 ) ( not ( = ?auto_320859 ?auto_320860 ) ) ( not ( = ?auto_320861 ?auto_320859 ) ) ( not ( = ?auto_320862 ?auto_320859 ) ) ( not ( = ?auto_320867 ?auto_320859 ) ) ( not ( = ?auto_320869 ?auto_320859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320860 ?auto_320861 ?auto_320862 )
      ( MAKE-3CRATE-VERIFY ?auto_320859 ?auto_320860 ?auto_320861 ?auto_320862 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_320870 - SURFACE
      ?auto_320871 - SURFACE
      ?auto_320872 - SURFACE
      ?auto_320874 - SURFACE
      ?auto_320873 - SURFACE
    )
    :vars
    (
      ?auto_320878 - HOIST
      ?auto_320875 - PLACE
      ?auto_320877 - PLACE
      ?auto_320880 - HOIST
      ?auto_320879 - SURFACE
      ?auto_320881 - SURFACE
      ?auto_320876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_320878 ?auto_320875 ) ( IS-CRATE ?auto_320873 ) ( not ( = ?auto_320874 ?auto_320873 ) ) ( not ( = ?auto_320872 ?auto_320874 ) ) ( not ( = ?auto_320872 ?auto_320873 ) ) ( not ( = ?auto_320877 ?auto_320875 ) ) ( HOIST-AT ?auto_320880 ?auto_320877 ) ( not ( = ?auto_320878 ?auto_320880 ) ) ( SURFACE-AT ?auto_320873 ?auto_320877 ) ( ON ?auto_320873 ?auto_320879 ) ( CLEAR ?auto_320873 ) ( not ( = ?auto_320874 ?auto_320879 ) ) ( not ( = ?auto_320873 ?auto_320879 ) ) ( not ( = ?auto_320872 ?auto_320879 ) ) ( IS-CRATE ?auto_320874 ) ( AVAILABLE ?auto_320880 ) ( SURFACE-AT ?auto_320874 ?auto_320877 ) ( ON ?auto_320874 ?auto_320881 ) ( CLEAR ?auto_320874 ) ( not ( = ?auto_320874 ?auto_320881 ) ) ( not ( = ?auto_320873 ?auto_320881 ) ) ( not ( = ?auto_320872 ?auto_320881 ) ) ( not ( = ?auto_320879 ?auto_320881 ) ) ( TRUCK-AT ?auto_320876 ?auto_320875 ) ( SURFACE-AT ?auto_320871 ?auto_320875 ) ( CLEAR ?auto_320871 ) ( LIFTING ?auto_320878 ?auto_320872 ) ( IS-CRATE ?auto_320872 ) ( not ( = ?auto_320871 ?auto_320872 ) ) ( not ( = ?auto_320874 ?auto_320871 ) ) ( not ( = ?auto_320873 ?auto_320871 ) ) ( not ( = ?auto_320879 ?auto_320871 ) ) ( not ( = ?auto_320881 ?auto_320871 ) ) ( ON ?auto_320871 ?auto_320870 ) ( not ( = ?auto_320870 ?auto_320871 ) ) ( not ( = ?auto_320870 ?auto_320872 ) ) ( not ( = ?auto_320870 ?auto_320874 ) ) ( not ( = ?auto_320870 ?auto_320873 ) ) ( not ( = ?auto_320870 ?auto_320879 ) ) ( not ( = ?auto_320870 ?auto_320881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_320872 ?auto_320874 ?auto_320873 )
      ( MAKE-4CRATE-VERIFY ?auto_320870 ?auto_320871 ?auto_320872 ?auto_320874 ?auto_320873 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321299 - SURFACE
      ?auto_321300 - SURFACE
      ?auto_321301 - SURFACE
      ?auto_321303 - SURFACE
      ?auto_321302 - SURFACE
      ?auto_321304 - SURFACE
    )
    :vars
    (
      ?auto_321305 - HOIST
      ?auto_321306 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321305 ?auto_321306 ) ( SURFACE-AT ?auto_321302 ?auto_321306 ) ( CLEAR ?auto_321302 ) ( LIFTING ?auto_321305 ?auto_321304 ) ( IS-CRATE ?auto_321304 ) ( not ( = ?auto_321302 ?auto_321304 ) ) ( ON ?auto_321300 ?auto_321299 ) ( ON ?auto_321301 ?auto_321300 ) ( ON ?auto_321303 ?auto_321301 ) ( ON ?auto_321302 ?auto_321303 ) ( not ( = ?auto_321299 ?auto_321300 ) ) ( not ( = ?auto_321299 ?auto_321301 ) ) ( not ( = ?auto_321299 ?auto_321303 ) ) ( not ( = ?auto_321299 ?auto_321302 ) ) ( not ( = ?auto_321299 ?auto_321304 ) ) ( not ( = ?auto_321300 ?auto_321301 ) ) ( not ( = ?auto_321300 ?auto_321303 ) ) ( not ( = ?auto_321300 ?auto_321302 ) ) ( not ( = ?auto_321300 ?auto_321304 ) ) ( not ( = ?auto_321301 ?auto_321303 ) ) ( not ( = ?auto_321301 ?auto_321302 ) ) ( not ( = ?auto_321301 ?auto_321304 ) ) ( not ( = ?auto_321303 ?auto_321302 ) ) ( not ( = ?auto_321303 ?auto_321304 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_321302 ?auto_321304 )
      ( MAKE-5CRATE-VERIFY ?auto_321299 ?auto_321300 ?auto_321301 ?auto_321303 ?auto_321302 ?auto_321304 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321333 - SURFACE
      ?auto_321334 - SURFACE
      ?auto_321335 - SURFACE
      ?auto_321337 - SURFACE
      ?auto_321336 - SURFACE
      ?auto_321338 - SURFACE
    )
    :vars
    (
      ?auto_321340 - HOIST
      ?auto_321339 - PLACE
      ?auto_321341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321340 ?auto_321339 ) ( SURFACE-AT ?auto_321336 ?auto_321339 ) ( CLEAR ?auto_321336 ) ( IS-CRATE ?auto_321338 ) ( not ( = ?auto_321336 ?auto_321338 ) ) ( TRUCK-AT ?auto_321341 ?auto_321339 ) ( AVAILABLE ?auto_321340 ) ( IN ?auto_321338 ?auto_321341 ) ( ON ?auto_321336 ?auto_321337 ) ( not ( = ?auto_321337 ?auto_321336 ) ) ( not ( = ?auto_321337 ?auto_321338 ) ) ( ON ?auto_321334 ?auto_321333 ) ( ON ?auto_321335 ?auto_321334 ) ( ON ?auto_321337 ?auto_321335 ) ( not ( = ?auto_321333 ?auto_321334 ) ) ( not ( = ?auto_321333 ?auto_321335 ) ) ( not ( = ?auto_321333 ?auto_321337 ) ) ( not ( = ?auto_321333 ?auto_321336 ) ) ( not ( = ?auto_321333 ?auto_321338 ) ) ( not ( = ?auto_321334 ?auto_321335 ) ) ( not ( = ?auto_321334 ?auto_321337 ) ) ( not ( = ?auto_321334 ?auto_321336 ) ) ( not ( = ?auto_321334 ?auto_321338 ) ) ( not ( = ?auto_321335 ?auto_321337 ) ) ( not ( = ?auto_321335 ?auto_321336 ) ) ( not ( = ?auto_321335 ?auto_321338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321337 ?auto_321336 ?auto_321338 )
      ( MAKE-5CRATE-VERIFY ?auto_321333 ?auto_321334 ?auto_321335 ?auto_321337 ?auto_321336 ?auto_321338 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321373 - SURFACE
      ?auto_321374 - SURFACE
      ?auto_321375 - SURFACE
      ?auto_321377 - SURFACE
      ?auto_321376 - SURFACE
      ?auto_321378 - SURFACE
    )
    :vars
    (
      ?auto_321380 - HOIST
      ?auto_321382 - PLACE
      ?auto_321379 - TRUCK
      ?auto_321381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321380 ?auto_321382 ) ( SURFACE-AT ?auto_321376 ?auto_321382 ) ( CLEAR ?auto_321376 ) ( IS-CRATE ?auto_321378 ) ( not ( = ?auto_321376 ?auto_321378 ) ) ( AVAILABLE ?auto_321380 ) ( IN ?auto_321378 ?auto_321379 ) ( ON ?auto_321376 ?auto_321377 ) ( not ( = ?auto_321377 ?auto_321376 ) ) ( not ( = ?auto_321377 ?auto_321378 ) ) ( TRUCK-AT ?auto_321379 ?auto_321381 ) ( not ( = ?auto_321381 ?auto_321382 ) ) ( ON ?auto_321374 ?auto_321373 ) ( ON ?auto_321375 ?auto_321374 ) ( ON ?auto_321377 ?auto_321375 ) ( not ( = ?auto_321373 ?auto_321374 ) ) ( not ( = ?auto_321373 ?auto_321375 ) ) ( not ( = ?auto_321373 ?auto_321377 ) ) ( not ( = ?auto_321373 ?auto_321376 ) ) ( not ( = ?auto_321373 ?auto_321378 ) ) ( not ( = ?auto_321374 ?auto_321375 ) ) ( not ( = ?auto_321374 ?auto_321377 ) ) ( not ( = ?auto_321374 ?auto_321376 ) ) ( not ( = ?auto_321374 ?auto_321378 ) ) ( not ( = ?auto_321375 ?auto_321377 ) ) ( not ( = ?auto_321375 ?auto_321376 ) ) ( not ( = ?auto_321375 ?auto_321378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321377 ?auto_321376 ?auto_321378 )
      ( MAKE-5CRATE-VERIFY ?auto_321373 ?auto_321374 ?auto_321375 ?auto_321377 ?auto_321376 ?auto_321378 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321418 - SURFACE
      ?auto_321419 - SURFACE
      ?auto_321420 - SURFACE
      ?auto_321422 - SURFACE
      ?auto_321421 - SURFACE
      ?auto_321423 - SURFACE
    )
    :vars
    (
      ?auto_321425 - HOIST
      ?auto_321428 - PLACE
      ?auto_321424 - TRUCK
      ?auto_321427 - PLACE
      ?auto_321426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_321425 ?auto_321428 ) ( SURFACE-AT ?auto_321421 ?auto_321428 ) ( CLEAR ?auto_321421 ) ( IS-CRATE ?auto_321423 ) ( not ( = ?auto_321421 ?auto_321423 ) ) ( AVAILABLE ?auto_321425 ) ( ON ?auto_321421 ?auto_321422 ) ( not ( = ?auto_321422 ?auto_321421 ) ) ( not ( = ?auto_321422 ?auto_321423 ) ) ( TRUCK-AT ?auto_321424 ?auto_321427 ) ( not ( = ?auto_321427 ?auto_321428 ) ) ( HOIST-AT ?auto_321426 ?auto_321427 ) ( LIFTING ?auto_321426 ?auto_321423 ) ( not ( = ?auto_321425 ?auto_321426 ) ) ( ON ?auto_321419 ?auto_321418 ) ( ON ?auto_321420 ?auto_321419 ) ( ON ?auto_321422 ?auto_321420 ) ( not ( = ?auto_321418 ?auto_321419 ) ) ( not ( = ?auto_321418 ?auto_321420 ) ) ( not ( = ?auto_321418 ?auto_321422 ) ) ( not ( = ?auto_321418 ?auto_321421 ) ) ( not ( = ?auto_321418 ?auto_321423 ) ) ( not ( = ?auto_321419 ?auto_321420 ) ) ( not ( = ?auto_321419 ?auto_321422 ) ) ( not ( = ?auto_321419 ?auto_321421 ) ) ( not ( = ?auto_321419 ?auto_321423 ) ) ( not ( = ?auto_321420 ?auto_321422 ) ) ( not ( = ?auto_321420 ?auto_321421 ) ) ( not ( = ?auto_321420 ?auto_321423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321422 ?auto_321421 ?auto_321423 )
      ( MAKE-5CRATE-VERIFY ?auto_321418 ?auto_321419 ?auto_321420 ?auto_321422 ?auto_321421 ?auto_321423 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321468 - SURFACE
      ?auto_321469 - SURFACE
      ?auto_321470 - SURFACE
      ?auto_321472 - SURFACE
      ?auto_321471 - SURFACE
      ?auto_321473 - SURFACE
    )
    :vars
    (
      ?auto_321479 - HOIST
      ?auto_321475 - PLACE
      ?auto_321478 - TRUCK
      ?auto_321476 - PLACE
      ?auto_321477 - HOIST
      ?auto_321474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_321479 ?auto_321475 ) ( SURFACE-AT ?auto_321471 ?auto_321475 ) ( CLEAR ?auto_321471 ) ( IS-CRATE ?auto_321473 ) ( not ( = ?auto_321471 ?auto_321473 ) ) ( AVAILABLE ?auto_321479 ) ( ON ?auto_321471 ?auto_321472 ) ( not ( = ?auto_321472 ?auto_321471 ) ) ( not ( = ?auto_321472 ?auto_321473 ) ) ( TRUCK-AT ?auto_321478 ?auto_321476 ) ( not ( = ?auto_321476 ?auto_321475 ) ) ( HOIST-AT ?auto_321477 ?auto_321476 ) ( not ( = ?auto_321479 ?auto_321477 ) ) ( AVAILABLE ?auto_321477 ) ( SURFACE-AT ?auto_321473 ?auto_321476 ) ( ON ?auto_321473 ?auto_321474 ) ( CLEAR ?auto_321473 ) ( not ( = ?auto_321471 ?auto_321474 ) ) ( not ( = ?auto_321473 ?auto_321474 ) ) ( not ( = ?auto_321472 ?auto_321474 ) ) ( ON ?auto_321469 ?auto_321468 ) ( ON ?auto_321470 ?auto_321469 ) ( ON ?auto_321472 ?auto_321470 ) ( not ( = ?auto_321468 ?auto_321469 ) ) ( not ( = ?auto_321468 ?auto_321470 ) ) ( not ( = ?auto_321468 ?auto_321472 ) ) ( not ( = ?auto_321468 ?auto_321471 ) ) ( not ( = ?auto_321468 ?auto_321473 ) ) ( not ( = ?auto_321468 ?auto_321474 ) ) ( not ( = ?auto_321469 ?auto_321470 ) ) ( not ( = ?auto_321469 ?auto_321472 ) ) ( not ( = ?auto_321469 ?auto_321471 ) ) ( not ( = ?auto_321469 ?auto_321473 ) ) ( not ( = ?auto_321469 ?auto_321474 ) ) ( not ( = ?auto_321470 ?auto_321472 ) ) ( not ( = ?auto_321470 ?auto_321471 ) ) ( not ( = ?auto_321470 ?auto_321473 ) ) ( not ( = ?auto_321470 ?auto_321474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321472 ?auto_321471 ?auto_321473 )
      ( MAKE-5CRATE-VERIFY ?auto_321468 ?auto_321469 ?auto_321470 ?auto_321472 ?auto_321471 ?auto_321473 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321519 - SURFACE
      ?auto_321520 - SURFACE
      ?auto_321521 - SURFACE
      ?auto_321523 - SURFACE
      ?auto_321522 - SURFACE
      ?auto_321524 - SURFACE
    )
    :vars
    (
      ?auto_321526 - HOIST
      ?auto_321525 - PLACE
      ?auto_321527 - PLACE
      ?auto_321528 - HOIST
      ?auto_321529 - SURFACE
      ?auto_321530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321526 ?auto_321525 ) ( SURFACE-AT ?auto_321522 ?auto_321525 ) ( CLEAR ?auto_321522 ) ( IS-CRATE ?auto_321524 ) ( not ( = ?auto_321522 ?auto_321524 ) ) ( AVAILABLE ?auto_321526 ) ( ON ?auto_321522 ?auto_321523 ) ( not ( = ?auto_321523 ?auto_321522 ) ) ( not ( = ?auto_321523 ?auto_321524 ) ) ( not ( = ?auto_321527 ?auto_321525 ) ) ( HOIST-AT ?auto_321528 ?auto_321527 ) ( not ( = ?auto_321526 ?auto_321528 ) ) ( AVAILABLE ?auto_321528 ) ( SURFACE-AT ?auto_321524 ?auto_321527 ) ( ON ?auto_321524 ?auto_321529 ) ( CLEAR ?auto_321524 ) ( not ( = ?auto_321522 ?auto_321529 ) ) ( not ( = ?auto_321524 ?auto_321529 ) ) ( not ( = ?auto_321523 ?auto_321529 ) ) ( TRUCK-AT ?auto_321530 ?auto_321525 ) ( ON ?auto_321520 ?auto_321519 ) ( ON ?auto_321521 ?auto_321520 ) ( ON ?auto_321523 ?auto_321521 ) ( not ( = ?auto_321519 ?auto_321520 ) ) ( not ( = ?auto_321519 ?auto_321521 ) ) ( not ( = ?auto_321519 ?auto_321523 ) ) ( not ( = ?auto_321519 ?auto_321522 ) ) ( not ( = ?auto_321519 ?auto_321524 ) ) ( not ( = ?auto_321519 ?auto_321529 ) ) ( not ( = ?auto_321520 ?auto_321521 ) ) ( not ( = ?auto_321520 ?auto_321523 ) ) ( not ( = ?auto_321520 ?auto_321522 ) ) ( not ( = ?auto_321520 ?auto_321524 ) ) ( not ( = ?auto_321520 ?auto_321529 ) ) ( not ( = ?auto_321521 ?auto_321523 ) ) ( not ( = ?auto_321521 ?auto_321522 ) ) ( not ( = ?auto_321521 ?auto_321524 ) ) ( not ( = ?auto_321521 ?auto_321529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321523 ?auto_321522 ?auto_321524 )
      ( MAKE-5CRATE-VERIFY ?auto_321519 ?auto_321520 ?auto_321521 ?auto_321523 ?auto_321522 ?auto_321524 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321570 - SURFACE
      ?auto_321571 - SURFACE
      ?auto_321572 - SURFACE
      ?auto_321574 - SURFACE
      ?auto_321573 - SURFACE
      ?auto_321575 - SURFACE
    )
    :vars
    (
      ?auto_321580 - HOIST
      ?auto_321581 - PLACE
      ?auto_321577 - PLACE
      ?auto_321579 - HOIST
      ?auto_321576 - SURFACE
      ?auto_321578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321580 ?auto_321581 ) ( IS-CRATE ?auto_321575 ) ( not ( = ?auto_321573 ?auto_321575 ) ) ( not ( = ?auto_321574 ?auto_321573 ) ) ( not ( = ?auto_321574 ?auto_321575 ) ) ( not ( = ?auto_321577 ?auto_321581 ) ) ( HOIST-AT ?auto_321579 ?auto_321577 ) ( not ( = ?auto_321580 ?auto_321579 ) ) ( AVAILABLE ?auto_321579 ) ( SURFACE-AT ?auto_321575 ?auto_321577 ) ( ON ?auto_321575 ?auto_321576 ) ( CLEAR ?auto_321575 ) ( not ( = ?auto_321573 ?auto_321576 ) ) ( not ( = ?auto_321575 ?auto_321576 ) ) ( not ( = ?auto_321574 ?auto_321576 ) ) ( TRUCK-AT ?auto_321578 ?auto_321581 ) ( SURFACE-AT ?auto_321574 ?auto_321581 ) ( CLEAR ?auto_321574 ) ( LIFTING ?auto_321580 ?auto_321573 ) ( IS-CRATE ?auto_321573 ) ( ON ?auto_321571 ?auto_321570 ) ( ON ?auto_321572 ?auto_321571 ) ( ON ?auto_321574 ?auto_321572 ) ( not ( = ?auto_321570 ?auto_321571 ) ) ( not ( = ?auto_321570 ?auto_321572 ) ) ( not ( = ?auto_321570 ?auto_321574 ) ) ( not ( = ?auto_321570 ?auto_321573 ) ) ( not ( = ?auto_321570 ?auto_321575 ) ) ( not ( = ?auto_321570 ?auto_321576 ) ) ( not ( = ?auto_321571 ?auto_321572 ) ) ( not ( = ?auto_321571 ?auto_321574 ) ) ( not ( = ?auto_321571 ?auto_321573 ) ) ( not ( = ?auto_321571 ?auto_321575 ) ) ( not ( = ?auto_321571 ?auto_321576 ) ) ( not ( = ?auto_321572 ?auto_321574 ) ) ( not ( = ?auto_321572 ?auto_321573 ) ) ( not ( = ?auto_321572 ?auto_321575 ) ) ( not ( = ?auto_321572 ?auto_321576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321574 ?auto_321573 ?auto_321575 )
      ( MAKE-5CRATE-VERIFY ?auto_321570 ?auto_321571 ?auto_321572 ?auto_321574 ?auto_321573 ?auto_321575 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_321621 - SURFACE
      ?auto_321622 - SURFACE
      ?auto_321623 - SURFACE
      ?auto_321625 - SURFACE
      ?auto_321624 - SURFACE
      ?auto_321626 - SURFACE
    )
    :vars
    (
      ?auto_321631 - HOIST
      ?auto_321630 - PLACE
      ?auto_321632 - PLACE
      ?auto_321628 - HOIST
      ?auto_321629 - SURFACE
      ?auto_321627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_321631 ?auto_321630 ) ( IS-CRATE ?auto_321626 ) ( not ( = ?auto_321624 ?auto_321626 ) ) ( not ( = ?auto_321625 ?auto_321624 ) ) ( not ( = ?auto_321625 ?auto_321626 ) ) ( not ( = ?auto_321632 ?auto_321630 ) ) ( HOIST-AT ?auto_321628 ?auto_321632 ) ( not ( = ?auto_321631 ?auto_321628 ) ) ( AVAILABLE ?auto_321628 ) ( SURFACE-AT ?auto_321626 ?auto_321632 ) ( ON ?auto_321626 ?auto_321629 ) ( CLEAR ?auto_321626 ) ( not ( = ?auto_321624 ?auto_321629 ) ) ( not ( = ?auto_321626 ?auto_321629 ) ) ( not ( = ?auto_321625 ?auto_321629 ) ) ( TRUCK-AT ?auto_321627 ?auto_321630 ) ( SURFACE-AT ?auto_321625 ?auto_321630 ) ( CLEAR ?auto_321625 ) ( IS-CRATE ?auto_321624 ) ( AVAILABLE ?auto_321631 ) ( IN ?auto_321624 ?auto_321627 ) ( ON ?auto_321622 ?auto_321621 ) ( ON ?auto_321623 ?auto_321622 ) ( ON ?auto_321625 ?auto_321623 ) ( not ( = ?auto_321621 ?auto_321622 ) ) ( not ( = ?auto_321621 ?auto_321623 ) ) ( not ( = ?auto_321621 ?auto_321625 ) ) ( not ( = ?auto_321621 ?auto_321624 ) ) ( not ( = ?auto_321621 ?auto_321626 ) ) ( not ( = ?auto_321621 ?auto_321629 ) ) ( not ( = ?auto_321622 ?auto_321623 ) ) ( not ( = ?auto_321622 ?auto_321625 ) ) ( not ( = ?auto_321622 ?auto_321624 ) ) ( not ( = ?auto_321622 ?auto_321626 ) ) ( not ( = ?auto_321622 ?auto_321629 ) ) ( not ( = ?auto_321623 ?auto_321625 ) ) ( not ( = ?auto_321623 ?auto_321624 ) ) ( not ( = ?auto_321623 ?auto_321626 ) ) ( not ( = ?auto_321623 ?auto_321629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_321625 ?auto_321624 ?auto_321626 )
      ( MAKE-5CRATE-VERIFY ?auto_321621 ?auto_321622 ?auto_321623 ?auto_321625 ?auto_321624 ?auto_321626 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_322826 - SURFACE
      ?auto_322827 - SURFACE
      ?auto_322828 - SURFACE
      ?auto_322830 - SURFACE
      ?auto_322829 - SURFACE
      ?auto_322831 - SURFACE
      ?auto_322832 - SURFACE
    )
    :vars
    (
      ?auto_322834 - HOIST
      ?auto_322833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322834 ?auto_322833 ) ( SURFACE-AT ?auto_322831 ?auto_322833 ) ( CLEAR ?auto_322831 ) ( LIFTING ?auto_322834 ?auto_322832 ) ( IS-CRATE ?auto_322832 ) ( not ( = ?auto_322831 ?auto_322832 ) ) ( ON ?auto_322827 ?auto_322826 ) ( ON ?auto_322828 ?auto_322827 ) ( ON ?auto_322830 ?auto_322828 ) ( ON ?auto_322829 ?auto_322830 ) ( ON ?auto_322831 ?auto_322829 ) ( not ( = ?auto_322826 ?auto_322827 ) ) ( not ( = ?auto_322826 ?auto_322828 ) ) ( not ( = ?auto_322826 ?auto_322830 ) ) ( not ( = ?auto_322826 ?auto_322829 ) ) ( not ( = ?auto_322826 ?auto_322831 ) ) ( not ( = ?auto_322826 ?auto_322832 ) ) ( not ( = ?auto_322827 ?auto_322828 ) ) ( not ( = ?auto_322827 ?auto_322830 ) ) ( not ( = ?auto_322827 ?auto_322829 ) ) ( not ( = ?auto_322827 ?auto_322831 ) ) ( not ( = ?auto_322827 ?auto_322832 ) ) ( not ( = ?auto_322828 ?auto_322830 ) ) ( not ( = ?auto_322828 ?auto_322829 ) ) ( not ( = ?auto_322828 ?auto_322831 ) ) ( not ( = ?auto_322828 ?auto_322832 ) ) ( not ( = ?auto_322830 ?auto_322829 ) ) ( not ( = ?auto_322830 ?auto_322831 ) ) ( not ( = ?auto_322830 ?auto_322832 ) ) ( not ( = ?auto_322829 ?auto_322831 ) ) ( not ( = ?auto_322829 ?auto_322832 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_322831 ?auto_322832 )
      ( MAKE-6CRATE-VERIFY ?auto_322826 ?auto_322827 ?auto_322828 ?auto_322830 ?auto_322829 ?auto_322831 ?auto_322832 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_322870 - SURFACE
      ?auto_322871 - SURFACE
      ?auto_322872 - SURFACE
      ?auto_322874 - SURFACE
      ?auto_322873 - SURFACE
      ?auto_322875 - SURFACE
      ?auto_322876 - SURFACE
    )
    :vars
    (
      ?auto_322877 - HOIST
      ?auto_322879 - PLACE
      ?auto_322878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322877 ?auto_322879 ) ( SURFACE-AT ?auto_322875 ?auto_322879 ) ( CLEAR ?auto_322875 ) ( IS-CRATE ?auto_322876 ) ( not ( = ?auto_322875 ?auto_322876 ) ) ( TRUCK-AT ?auto_322878 ?auto_322879 ) ( AVAILABLE ?auto_322877 ) ( IN ?auto_322876 ?auto_322878 ) ( ON ?auto_322875 ?auto_322873 ) ( not ( = ?auto_322873 ?auto_322875 ) ) ( not ( = ?auto_322873 ?auto_322876 ) ) ( ON ?auto_322871 ?auto_322870 ) ( ON ?auto_322872 ?auto_322871 ) ( ON ?auto_322874 ?auto_322872 ) ( ON ?auto_322873 ?auto_322874 ) ( not ( = ?auto_322870 ?auto_322871 ) ) ( not ( = ?auto_322870 ?auto_322872 ) ) ( not ( = ?auto_322870 ?auto_322874 ) ) ( not ( = ?auto_322870 ?auto_322873 ) ) ( not ( = ?auto_322870 ?auto_322875 ) ) ( not ( = ?auto_322870 ?auto_322876 ) ) ( not ( = ?auto_322871 ?auto_322872 ) ) ( not ( = ?auto_322871 ?auto_322874 ) ) ( not ( = ?auto_322871 ?auto_322873 ) ) ( not ( = ?auto_322871 ?auto_322875 ) ) ( not ( = ?auto_322871 ?auto_322876 ) ) ( not ( = ?auto_322872 ?auto_322874 ) ) ( not ( = ?auto_322872 ?auto_322873 ) ) ( not ( = ?auto_322872 ?auto_322875 ) ) ( not ( = ?auto_322872 ?auto_322876 ) ) ( not ( = ?auto_322874 ?auto_322873 ) ) ( not ( = ?auto_322874 ?auto_322875 ) ) ( not ( = ?auto_322874 ?auto_322876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322873 ?auto_322875 ?auto_322876 )
      ( MAKE-6CRATE-VERIFY ?auto_322870 ?auto_322871 ?auto_322872 ?auto_322874 ?auto_322873 ?auto_322875 ?auto_322876 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_322921 - SURFACE
      ?auto_322922 - SURFACE
      ?auto_322923 - SURFACE
      ?auto_322925 - SURFACE
      ?auto_322924 - SURFACE
      ?auto_322926 - SURFACE
      ?auto_322927 - SURFACE
    )
    :vars
    (
      ?auto_322930 - HOIST
      ?auto_322931 - PLACE
      ?auto_322928 - TRUCK
      ?auto_322929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_322930 ?auto_322931 ) ( SURFACE-AT ?auto_322926 ?auto_322931 ) ( CLEAR ?auto_322926 ) ( IS-CRATE ?auto_322927 ) ( not ( = ?auto_322926 ?auto_322927 ) ) ( AVAILABLE ?auto_322930 ) ( IN ?auto_322927 ?auto_322928 ) ( ON ?auto_322926 ?auto_322924 ) ( not ( = ?auto_322924 ?auto_322926 ) ) ( not ( = ?auto_322924 ?auto_322927 ) ) ( TRUCK-AT ?auto_322928 ?auto_322929 ) ( not ( = ?auto_322929 ?auto_322931 ) ) ( ON ?auto_322922 ?auto_322921 ) ( ON ?auto_322923 ?auto_322922 ) ( ON ?auto_322925 ?auto_322923 ) ( ON ?auto_322924 ?auto_322925 ) ( not ( = ?auto_322921 ?auto_322922 ) ) ( not ( = ?auto_322921 ?auto_322923 ) ) ( not ( = ?auto_322921 ?auto_322925 ) ) ( not ( = ?auto_322921 ?auto_322924 ) ) ( not ( = ?auto_322921 ?auto_322926 ) ) ( not ( = ?auto_322921 ?auto_322927 ) ) ( not ( = ?auto_322922 ?auto_322923 ) ) ( not ( = ?auto_322922 ?auto_322925 ) ) ( not ( = ?auto_322922 ?auto_322924 ) ) ( not ( = ?auto_322922 ?auto_322926 ) ) ( not ( = ?auto_322922 ?auto_322927 ) ) ( not ( = ?auto_322923 ?auto_322925 ) ) ( not ( = ?auto_322923 ?auto_322924 ) ) ( not ( = ?auto_322923 ?auto_322926 ) ) ( not ( = ?auto_322923 ?auto_322927 ) ) ( not ( = ?auto_322925 ?auto_322924 ) ) ( not ( = ?auto_322925 ?auto_322926 ) ) ( not ( = ?auto_322925 ?auto_322927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322924 ?auto_322926 ?auto_322927 )
      ( MAKE-6CRATE-VERIFY ?auto_322921 ?auto_322922 ?auto_322923 ?auto_322925 ?auto_322924 ?auto_322926 ?auto_322927 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_322978 - SURFACE
      ?auto_322979 - SURFACE
      ?auto_322980 - SURFACE
      ?auto_322982 - SURFACE
      ?auto_322981 - SURFACE
      ?auto_322983 - SURFACE
      ?auto_322984 - SURFACE
    )
    :vars
    (
      ?auto_322985 - HOIST
      ?auto_322987 - PLACE
      ?auto_322986 - TRUCK
      ?auto_322988 - PLACE
      ?auto_322989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_322985 ?auto_322987 ) ( SURFACE-AT ?auto_322983 ?auto_322987 ) ( CLEAR ?auto_322983 ) ( IS-CRATE ?auto_322984 ) ( not ( = ?auto_322983 ?auto_322984 ) ) ( AVAILABLE ?auto_322985 ) ( ON ?auto_322983 ?auto_322981 ) ( not ( = ?auto_322981 ?auto_322983 ) ) ( not ( = ?auto_322981 ?auto_322984 ) ) ( TRUCK-AT ?auto_322986 ?auto_322988 ) ( not ( = ?auto_322988 ?auto_322987 ) ) ( HOIST-AT ?auto_322989 ?auto_322988 ) ( LIFTING ?auto_322989 ?auto_322984 ) ( not ( = ?auto_322985 ?auto_322989 ) ) ( ON ?auto_322979 ?auto_322978 ) ( ON ?auto_322980 ?auto_322979 ) ( ON ?auto_322982 ?auto_322980 ) ( ON ?auto_322981 ?auto_322982 ) ( not ( = ?auto_322978 ?auto_322979 ) ) ( not ( = ?auto_322978 ?auto_322980 ) ) ( not ( = ?auto_322978 ?auto_322982 ) ) ( not ( = ?auto_322978 ?auto_322981 ) ) ( not ( = ?auto_322978 ?auto_322983 ) ) ( not ( = ?auto_322978 ?auto_322984 ) ) ( not ( = ?auto_322979 ?auto_322980 ) ) ( not ( = ?auto_322979 ?auto_322982 ) ) ( not ( = ?auto_322979 ?auto_322981 ) ) ( not ( = ?auto_322979 ?auto_322983 ) ) ( not ( = ?auto_322979 ?auto_322984 ) ) ( not ( = ?auto_322980 ?auto_322982 ) ) ( not ( = ?auto_322980 ?auto_322981 ) ) ( not ( = ?auto_322980 ?auto_322983 ) ) ( not ( = ?auto_322980 ?auto_322984 ) ) ( not ( = ?auto_322982 ?auto_322981 ) ) ( not ( = ?auto_322982 ?auto_322983 ) ) ( not ( = ?auto_322982 ?auto_322984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_322981 ?auto_322983 ?auto_322984 )
      ( MAKE-6CRATE-VERIFY ?auto_322978 ?auto_322979 ?auto_322980 ?auto_322982 ?auto_322981 ?auto_322983 ?auto_322984 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323041 - SURFACE
      ?auto_323042 - SURFACE
      ?auto_323043 - SURFACE
      ?auto_323045 - SURFACE
      ?auto_323044 - SURFACE
      ?auto_323046 - SURFACE
      ?auto_323047 - SURFACE
    )
    :vars
    (
      ?auto_323052 - HOIST
      ?auto_323048 - PLACE
      ?auto_323053 - TRUCK
      ?auto_323051 - PLACE
      ?auto_323049 - HOIST
      ?auto_323050 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_323052 ?auto_323048 ) ( SURFACE-AT ?auto_323046 ?auto_323048 ) ( CLEAR ?auto_323046 ) ( IS-CRATE ?auto_323047 ) ( not ( = ?auto_323046 ?auto_323047 ) ) ( AVAILABLE ?auto_323052 ) ( ON ?auto_323046 ?auto_323044 ) ( not ( = ?auto_323044 ?auto_323046 ) ) ( not ( = ?auto_323044 ?auto_323047 ) ) ( TRUCK-AT ?auto_323053 ?auto_323051 ) ( not ( = ?auto_323051 ?auto_323048 ) ) ( HOIST-AT ?auto_323049 ?auto_323051 ) ( not ( = ?auto_323052 ?auto_323049 ) ) ( AVAILABLE ?auto_323049 ) ( SURFACE-AT ?auto_323047 ?auto_323051 ) ( ON ?auto_323047 ?auto_323050 ) ( CLEAR ?auto_323047 ) ( not ( = ?auto_323046 ?auto_323050 ) ) ( not ( = ?auto_323047 ?auto_323050 ) ) ( not ( = ?auto_323044 ?auto_323050 ) ) ( ON ?auto_323042 ?auto_323041 ) ( ON ?auto_323043 ?auto_323042 ) ( ON ?auto_323045 ?auto_323043 ) ( ON ?auto_323044 ?auto_323045 ) ( not ( = ?auto_323041 ?auto_323042 ) ) ( not ( = ?auto_323041 ?auto_323043 ) ) ( not ( = ?auto_323041 ?auto_323045 ) ) ( not ( = ?auto_323041 ?auto_323044 ) ) ( not ( = ?auto_323041 ?auto_323046 ) ) ( not ( = ?auto_323041 ?auto_323047 ) ) ( not ( = ?auto_323041 ?auto_323050 ) ) ( not ( = ?auto_323042 ?auto_323043 ) ) ( not ( = ?auto_323042 ?auto_323045 ) ) ( not ( = ?auto_323042 ?auto_323044 ) ) ( not ( = ?auto_323042 ?auto_323046 ) ) ( not ( = ?auto_323042 ?auto_323047 ) ) ( not ( = ?auto_323042 ?auto_323050 ) ) ( not ( = ?auto_323043 ?auto_323045 ) ) ( not ( = ?auto_323043 ?auto_323044 ) ) ( not ( = ?auto_323043 ?auto_323046 ) ) ( not ( = ?auto_323043 ?auto_323047 ) ) ( not ( = ?auto_323043 ?auto_323050 ) ) ( not ( = ?auto_323045 ?auto_323044 ) ) ( not ( = ?auto_323045 ?auto_323046 ) ) ( not ( = ?auto_323045 ?auto_323047 ) ) ( not ( = ?auto_323045 ?auto_323050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323044 ?auto_323046 ?auto_323047 )
      ( MAKE-6CRATE-VERIFY ?auto_323041 ?auto_323042 ?auto_323043 ?auto_323045 ?auto_323044 ?auto_323046 ?auto_323047 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323105 - SURFACE
      ?auto_323106 - SURFACE
      ?auto_323107 - SURFACE
      ?auto_323109 - SURFACE
      ?auto_323108 - SURFACE
      ?auto_323110 - SURFACE
      ?auto_323111 - SURFACE
    )
    :vars
    (
      ?auto_323114 - HOIST
      ?auto_323116 - PLACE
      ?auto_323112 - PLACE
      ?auto_323117 - HOIST
      ?auto_323115 - SURFACE
      ?auto_323113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323114 ?auto_323116 ) ( SURFACE-AT ?auto_323110 ?auto_323116 ) ( CLEAR ?auto_323110 ) ( IS-CRATE ?auto_323111 ) ( not ( = ?auto_323110 ?auto_323111 ) ) ( AVAILABLE ?auto_323114 ) ( ON ?auto_323110 ?auto_323108 ) ( not ( = ?auto_323108 ?auto_323110 ) ) ( not ( = ?auto_323108 ?auto_323111 ) ) ( not ( = ?auto_323112 ?auto_323116 ) ) ( HOIST-AT ?auto_323117 ?auto_323112 ) ( not ( = ?auto_323114 ?auto_323117 ) ) ( AVAILABLE ?auto_323117 ) ( SURFACE-AT ?auto_323111 ?auto_323112 ) ( ON ?auto_323111 ?auto_323115 ) ( CLEAR ?auto_323111 ) ( not ( = ?auto_323110 ?auto_323115 ) ) ( not ( = ?auto_323111 ?auto_323115 ) ) ( not ( = ?auto_323108 ?auto_323115 ) ) ( TRUCK-AT ?auto_323113 ?auto_323116 ) ( ON ?auto_323106 ?auto_323105 ) ( ON ?auto_323107 ?auto_323106 ) ( ON ?auto_323109 ?auto_323107 ) ( ON ?auto_323108 ?auto_323109 ) ( not ( = ?auto_323105 ?auto_323106 ) ) ( not ( = ?auto_323105 ?auto_323107 ) ) ( not ( = ?auto_323105 ?auto_323109 ) ) ( not ( = ?auto_323105 ?auto_323108 ) ) ( not ( = ?auto_323105 ?auto_323110 ) ) ( not ( = ?auto_323105 ?auto_323111 ) ) ( not ( = ?auto_323105 ?auto_323115 ) ) ( not ( = ?auto_323106 ?auto_323107 ) ) ( not ( = ?auto_323106 ?auto_323109 ) ) ( not ( = ?auto_323106 ?auto_323108 ) ) ( not ( = ?auto_323106 ?auto_323110 ) ) ( not ( = ?auto_323106 ?auto_323111 ) ) ( not ( = ?auto_323106 ?auto_323115 ) ) ( not ( = ?auto_323107 ?auto_323109 ) ) ( not ( = ?auto_323107 ?auto_323108 ) ) ( not ( = ?auto_323107 ?auto_323110 ) ) ( not ( = ?auto_323107 ?auto_323111 ) ) ( not ( = ?auto_323107 ?auto_323115 ) ) ( not ( = ?auto_323109 ?auto_323108 ) ) ( not ( = ?auto_323109 ?auto_323110 ) ) ( not ( = ?auto_323109 ?auto_323111 ) ) ( not ( = ?auto_323109 ?auto_323115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323108 ?auto_323110 ?auto_323111 )
      ( MAKE-6CRATE-VERIFY ?auto_323105 ?auto_323106 ?auto_323107 ?auto_323109 ?auto_323108 ?auto_323110 ?auto_323111 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323169 - SURFACE
      ?auto_323170 - SURFACE
      ?auto_323171 - SURFACE
      ?auto_323173 - SURFACE
      ?auto_323172 - SURFACE
      ?auto_323174 - SURFACE
      ?auto_323175 - SURFACE
    )
    :vars
    (
      ?auto_323176 - HOIST
      ?auto_323179 - PLACE
      ?auto_323177 - PLACE
      ?auto_323178 - HOIST
      ?auto_323181 - SURFACE
      ?auto_323180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323176 ?auto_323179 ) ( IS-CRATE ?auto_323175 ) ( not ( = ?auto_323174 ?auto_323175 ) ) ( not ( = ?auto_323172 ?auto_323174 ) ) ( not ( = ?auto_323172 ?auto_323175 ) ) ( not ( = ?auto_323177 ?auto_323179 ) ) ( HOIST-AT ?auto_323178 ?auto_323177 ) ( not ( = ?auto_323176 ?auto_323178 ) ) ( AVAILABLE ?auto_323178 ) ( SURFACE-AT ?auto_323175 ?auto_323177 ) ( ON ?auto_323175 ?auto_323181 ) ( CLEAR ?auto_323175 ) ( not ( = ?auto_323174 ?auto_323181 ) ) ( not ( = ?auto_323175 ?auto_323181 ) ) ( not ( = ?auto_323172 ?auto_323181 ) ) ( TRUCK-AT ?auto_323180 ?auto_323179 ) ( SURFACE-AT ?auto_323172 ?auto_323179 ) ( CLEAR ?auto_323172 ) ( LIFTING ?auto_323176 ?auto_323174 ) ( IS-CRATE ?auto_323174 ) ( ON ?auto_323170 ?auto_323169 ) ( ON ?auto_323171 ?auto_323170 ) ( ON ?auto_323173 ?auto_323171 ) ( ON ?auto_323172 ?auto_323173 ) ( not ( = ?auto_323169 ?auto_323170 ) ) ( not ( = ?auto_323169 ?auto_323171 ) ) ( not ( = ?auto_323169 ?auto_323173 ) ) ( not ( = ?auto_323169 ?auto_323172 ) ) ( not ( = ?auto_323169 ?auto_323174 ) ) ( not ( = ?auto_323169 ?auto_323175 ) ) ( not ( = ?auto_323169 ?auto_323181 ) ) ( not ( = ?auto_323170 ?auto_323171 ) ) ( not ( = ?auto_323170 ?auto_323173 ) ) ( not ( = ?auto_323170 ?auto_323172 ) ) ( not ( = ?auto_323170 ?auto_323174 ) ) ( not ( = ?auto_323170 ?auto_323175 ) ) ( not ( = ?auto_323170 ?auto_323181 ) ) ( not ( = ?auto_323171 ?auto_323173 ) ) ( not ( = ?auto_323171 ?auto_323172 ) ) ( not ( = ?auto_323171 ?auto_323174 ) ) ( not ( = ?auto_323171 ?auto_323175 ) ) ( not ( = ?auto_323171 ?auto_323181 ) ) ( not ( = ?auto_323173 ?auto_323172 ) ) ( not ( = ?auto_323173 ?auto_323174 ) ) ( not ( = ?auto_323173 ?auto_323175 ) ) ( not ( = ?auto_323173 ?auto_323181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323172 ?auto_323174 ?auto_323175 )
      ( MAKE-6CRATE-VERIFY ?auto_323169 ?auto_323170 ?auto_323171 ?auto_323173 ?auto_323172 ?auto_323174 ?auto_323175 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_323233 - SURFACE
      ?auto_323234 - SURFACE
      ?auto_323235 - SURFACE
      ?auto_323237 - SURFACE
      ?auto_323236 - SURFACE
      ?auto_323238 - SURFACE
      ?auto_323239 - SURFACE
    )
    :vars
    (
      ?auto_323244 - HOIST
      ?auto_323245 - PLACE
      ?auto_323241 - PLACE
      ?auto_323240 - HOIST
      ?auto_323243 - SURFACE
      ?auto_323242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_323244 ?auto_323245 ) ( IS-CRATE ?auto_323239 ) ( not ( = ?auto_323238 ?auto_323239 ) ) ( not ( = ?auto_323236 ?auto_323238 ) ) ( not ( = ?auto_323236 ?auto_323239 ) ) ( not ( = ?auto_323241 ?auto_323245 ) ) ( HOIST-AT ?auto_323240 ?auto_323241 ) ( not ( = ?auto_323244 ?auto_323240 ) ) ( AVAILABLE ?auto_323240 ) ( SURFACE-AT ?auto_323239 ?auto_323241 ) ( ON ?auto_323239 ?auto_323243 ) ( CLEAR ?auto_323239 ) ( not ( = ?auto_323238 ?auto_323243 ) ) ( not ( = ?auto_323239 ?auto_323243 ) ) ( not ( = ?auto_323236 ?auto_323243 ) ) ( TRUCK-AT ?auto_323242 ?auto_323245 ) ( SURFACE-AT ?auto_323236 ?auto_323245 ) ( CLEAR ?auto_323236 ) ( IS-CRATE ?auto_323238 ) ( AVAILABLE ?auto_323244 ) ( IN ?auto_323238 ?auto_323242 ) ( ON ?auto_323234 ?auto_323233 ) ( ON ?auto_323235 ?auto_323234 ) ( ON ?auto_323237 ?auto_323235 ) ( ON ?auto_323236 ?auto_323237 ) ( not ( = ?auto_323233 ?auto_323234 ) ) ( not ( = ?auto_323233 ?auto_323235 ) ) ( not ( = ?auto_323233 ?auto_323237 ) ) ( not ( = ?auto_323233 ?auto_323236 ) ) ( not ( = ?auto_323233 ?auto_323238 ) ) ( not ( = ?auto_323233 ?auto_323239 ) ) ( not ( = ?auto_323233 ?auto_323243 ) ) ( not ( = ?auto_323234 ?auto_323235 ) ) ( not ( = ?auto_323234 ?auto_323237 ) ) ( not ( = ?auto_323234 ?auto_323236 ) ) ( not ( = ?auto_323234 ?auto_323238 ) ) ( not ( = ?auto_323234 ?auto_323239 ) ) ( not ( = ?auto_323234 ?auto_323243 ) ) ( not ( = ?auto_323235 ?auto_323237 ) ) ( not ( = ?auto_323235 ?auto_323236 ) ) ( not ( = ?auto_323235 ?auto_323238 ) ) ( not ( = ?auto_323235 ?auto_323239 ) ) ( not ( = ?auto_323235 ?auto_323243 ) ) ( not ( = ?auto_323237 ?auto_323236 ) ) ( not ( = ?auto_323237 ?auto_323238 ) ) ( not ( = ?auto_323237 ?auto_323239 ) ) ( not ( = ?auto_323237 ?auto_323243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_323236 ?auto_323238 ?auto_323239 )
      ( MAKE-6CRATE-VERIFY ?auto_323233 ?auto_323234 ?auto_323235 ?auto_323237 ?auto_323236 ?auto_323238 ?auto_323239 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_324507 - SURFACE
      ?auto_324508 - SURFACE
    )
    :vars
    (
      ?auto_324512 - HOIST
      ?auto_324510 - PLACE
      ?auto_324509 - SURFACE
      ?auto_324514 - TRUCK
      ?auto_324511 - PLACE
      ?auto_324515 - HOIST
      ?auto_324513 - SURFACE
      ?auto_324516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_324512 ?auto_324510 ) ( SURFACE-AT ?auto_324507 ?auto_324510 ) ( CLEAR ?auto_324507 ) ( IS-CRATE ?auto_324508 ) ( not ( = ?auto_324507 ?auto_324508 ) ) ( AVAILABLE ?auto_324512 ) ( ON ?auto_324507 ?auto_324509 ) ( not ( = ?auto_324509 ?auto_324507 ) ) ( not ( = ?auto_324509 ?auto_324508 ) ) ( TRUCK-AT ?auto_324514 ?auto_324511 ) ( not ( = ?auto_324511 ?auto_324510 ) ) ( HOIST-AT ?auto_324515 ?auto_324511 ) ( not ( = ?auto_324512 ?auto_324515 ) ) ( SURFACE-AT ?auto_324508 ?auto_324511 ) ( ON ?auto_324508 ?auto_324513 ) ( CLEAR ?auto_324508 ) ( not ( = ?auto_324507 ?auto_324513 ) ) ( not ( = ?auto_324508 ?auto_324513 ) ) ( not ( = ?auto_324509 ?auto_324513 ) ) ( LIFTING ?auto_324515 ?auto_324516 ) ( IS-CRATE ?auto_324516 ) ( not ( = ?auto_324507 ?auto_324516 ) ) ( not ( = ?auto_324508 ?auto_324516 ) ) ( not ( = ?auto_324509 ?auto_324516 ) ) ( not ( = ?auto_324513 ?auto_324516 ) ) )
    :subtasks
    ( ( !LOAD ?auto_324515 ?auto_324516 ?auto_324514 ?auto_324511 )
      ( MAKE-1CRATE ?auto_324507 ?auto_324508 )
      ( MAKE-1CRATE-VERIFY ?auto_324507 ?auto_324508 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325172 - SURFACE
      ?auto_325173 - SURFACE
      ?auto_325174 - SURFACE
      ?auto_325176 - SURFACE
      ?auto_325175 - SURFACE
      ?auto_325177 - SURFACE
      ?auto_325178 - SURFACE
      ?auto_325179 - SURFACE
    )
    :vars
    (
      ?auto_325181 - HOIST
      ?auto_325180 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325181 ?auto_325180 ) ( SURFACE-AT ?auto_325178 ?auto_325180 ) ( CLEAR ?auto_325178 ) ( LIFTING ?auto_325181 ?auto_325179 ) ( IS-CRATE ?auto_325179 ) ( not ( = ?auto_325178 ?auto_325179 ) ) ( ON ?auto_325173 ?auto_325172 ) ( ON ?auto_325174 ?auto_325173 ) ( ON ?auto_325176 ?auto_325174 ) ( ON ?auto_325175 ?auto_325176 ) ( ON ?auto_325177 ?auto_325175 ) ( ON ?auto_325178 ?auto_325177 ) ( not ( = ?auto_325172 ?auto_325173 ) ) ( not ( = ?auto_325172 ?auto_325174 ) ) ( not ( = ?auto_325172 ?auto_325176 ) ) ( not ( = ?auto_325172 ?auto_325175 ) ) ( not ( = ?auto_325172 ?auto_325177 ) ) ( not ( = ?auto_325172 ?auto_325178 ) ) ( not ( = ?auto_325172 ?auto_325179 ) ) ( not ( = ?auto_325173 ?auto_325174 ) ) ( not ( = ?auto_325173 ?auto_325176 ) ) ( not ( = ?auto_325173 ?auto_325175 ) ) ( not ( = ?auto_325173 ?auto_325177 ) ) ( not ( = ?auto_325173 ?auto_325178 ) ) ( not ( = ?auto_325173 ?auto_325179 ) ) ( not ( = ?auto_325174 ?auto_325176 ) ) ( not ( = ?auto_325174 ?auto_325175 ) ) ( not ( = ?auto_325174 ?auto_325177 ) ) ( not ( = ?auto_325174 ?auto_325178 ) ) ( not ( = ?auto_325174 ?auto_325179 ) ) ( not ( = ?auto_325176 ?auto_325175 ) ) ( not ( = ?auto_325176 ?auto_325177 ) ) ( not ( = ?auto_325176 ?auto_325178 ) ) ( not ( = ?auto_325176 ?auto_325179 ) ) ( not ( = ?auto_325175 ?auto_325177 ) ) ( not ( = ?auto_325175 ?auto_325178 ) ) ( not ( = ?auto_325175 ?auto_325179 ) ) ( not ( = ?auto_325177 ?auto_325178 ) ) ( not ( = ?auto_325177 ?auto_325179 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_325178 ?auto_325179 )
      ( MAKE-7CRATE-VERIFY ?auto_325172 ?auto_325173 ?auto_325174 ?auto_325176 ?auto_325175 ?auto_325177 ?auto_325178 ?auto_325179 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325227 - SURFACE
      ?auto_325228 - SURFACE
      ?auto_325229 - SURFACE
      ?auto_325231 - SURFACE
      ?auto_325230 - SURFACE
      ?auto_325232 - SURFACE
      ?auto_325233 - SURFACE
      ?auto_325234 - SURFACE
    )
    :vars
    (
      ?auto_325237 - HOIST
      ?auto_325236 - PLACE
      ?auto_325235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325237 ?auto_325236 ) ( SURFACE-AT ?auto_325233 ?auto_325236 ) ( CLEAR ?auto_325233 ) ( IS-CRATE ?auto_325234 ) ( not ( = ?auto_325233 ?auto_325234 ) ) ( TRUCK-AT ?auto_325235 ?auto_325236 ) ( AVAILABLE ?auto_325237 ) ( IN ?auto_325234 ?auto_325235 ) ( ON ?auto_325233 ?auto_325232 ) ( not ( = ?auto_325232 ?auto_325233 ) ) ( not ( = ?auto_325232 ?auto_325234 ) ) ( ON ?auto_325228 ?auto_325227 ) ( ON ?auto_325229 ?auto_325228 ) ( ON ?auto_325231 ?auto_325229 ) ( ON ?auto_325230 ?auto_325231 ) ( ON ?auto_325232 ?auto_325230 ) ( not ( = ?auto_325227 ?auto_325228 ) ) ( not ( = ?auto_325227 ?auto_325229 ) ) ( not ( = ?auto_325227 ?auto_325231 ) ) ( not ( = ?auto_325227 ?auto_325230 ) ) ( not ( = ?auto_325227 ?auto_325232 ) ) ( not ( = ?auto_325227 ?auto_325233 ) ) ( not ( = ?auto_325227 ?auto_325234 ) ) ( not ( = ?auto_325228 ?auto_325229 ) ) ( not ( = ?auto_325228 ?auto_325231 ) ) ( not ( = ?auto_325228 ?auto_325230 ) ) ( not ( = ?auto_325228 ?auto_325232 ) ) ( not ( = ?auto_325228 ?auto_325233 ) ) ( not ( = ?auto_325228 ?auto_325234 ) ) ( not ( = ?auto_325229 ?auto_325231 ) ) ( not ( = ?auto_325229 ?auto_325230 ) ) ( not ( = ?auto_325229 ?auto_325232 ) ) ( not ( = ?auto_325229 ?auto_325233 ) ) ( not ( = ?auto_325229 ?auto_325234 ) ) ( not ( = ?auto_325231 ?auto_325230 ) ) ( not ( = ?auto_325231 ?auto_325232 ) ) ( not ( = ?auto_325231 ?auto_325233 ) ) ( not ( = ?auto_325231 ?auto_325234 ) ) ( not ( = ?auto_325230 ?auto_325232 ) ) ( not ( = ?auto_325230 ?auto_325233 ) ) ( not ( = ?auto_325230 ?auto_325234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325232 ?auto_325233 ?auto_325234 )
      ( MAKE-7CRATE-VERIFY ?auto_325227 ?auto_325228 ?auto_325229 ?auto_325231 ?auto_325230 ?auto_325232 ?auto_325233 ?auto_325234 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325290 - SURFACE
      ?auto_325291 - SURFACE
      ?auto_325292 - SURFACE
      ?auto_325294 - SURFACE
      ?auto_325293 - SURFACE
      ?auto_325295 - SURFACE
      ?auto_325296 - SURFACE
      ?auto_325297 - SURFACE
    )
    :vars
    (
      ?auto_325298 - HOIST
      ?auto_325301 - PLACE
      ?auto_325300 - TRUCK
      ?auto_325299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325298 ?auto_325301 ) ( SURFACE-AT ?auto_325296 ?auto_325301 ) ( CLEAR ?auto_325296 ) ( IS-CRATE ?auto_325297 ) ( not ( = ?auto_325296 ?auto_325297 ) ) ( AVAILABLE ?auto_325298 ) ( IN ?auto_325297 ?auto_325300 ) ( ON ?auto_325296 ?auto_325295 ) ( not ( = ?auto_325295 ?auto_325296 ) ) ( not ( = ?auto_325295 ?auto_325297 ) ) ( TRUCK-AT ?auto_325300 ?auto_325299 ) ( not ( = ?auto_325299 ?auto_325301 ) ) ( ON ?auto_325291 ?auto_325290 ) ( ON ?auto_325292 ?auto_325291 ) ( ON ?auto_325294 ?auto_325292 ) ( ON ?auto_325293 ?auto_325294 ) ( ON ?auto_325295 ?auto_325293 ) ( not ( = ?auto_325290 ?auto_325291 ) ) ( not ( = ?auto_325290 ?auto_325292 ) ) ( not ( = ?auto_325290 ?auto_325294 ) ) ( not ( = ?auto_325290 ?auto_325293 ) ) ( not ( = ?auto_325290 ?auto_325295 ) ) ( not ( = ?auto_325290 ?auto_325296 ) ) ( not ( = ?auto_325290 ?auto_325297 ) ) ( not ( = ?auto_325291 ?auto_325292 ) ) ( not ( = ?auto_325291 ?auto_325294 ) ) ( not ( = ?auto_325291 ?auto_325293 ) ) ( not ( = ?auto_325291 ?auto_325295 ) ) ( not ( = ?auto_325291 ?auto_325296 ) ) ( not ( = ?auto_325291 ?auto_325297 ) ) ( not ( = ?auto_325292 ?auto_325294 ) ) ( not ( = ?auto_325292 ?auto_325293 ) ) ( not ( = ?auto_325292 ?auto_325295 ) ) ( not ( = ?auto_325292 ?auto_325296 ) ) ( not ( = ?auto_325292 ?auto_325297 ) ) ( not ( = ?auto_325294 ?auto_325293 ) ) ( not ( = ?auto_325294 ?auto_325295 ) ) ( not ( = ?auto_325294 ?auto_325296 ) ) ( not ( = ?auto_325294 ?auto_325297 ) ) ( not ( = ?auto_325293 ?auto_325295 ) ) ( not ( = ?auto_325293 ?auto_325296 ) ) ( not ( = ?auto_325293 ?auto_325297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325295 ?auto_325296 ?auto_325297 )
      ( MAKE-7CRATE-VERIFY ?auto_325290 ?auto_325291 ?auto_325292 ?auto_325294 ?auto_325293 ?auto_325295 ?auto_325296 ?auto_325297 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325360 - SURFACE
      ?auto_325361 - SURFACE
      ?auto_325362 - SURFACE
      ?auto_325364 - SURFACE
      ?auto_325363 - SURFACE
      ?auto_325365 - SURFACE
      ?auto_325366 - SURFACE
      ?auto_325367 - SURFACE
    )
    :vars
    (
      ?auto_325369 - HOIST
      ?auto_325371 - PLACE
      ?auto_325368 - TRUCK
      ?auto_325370 - PLACE
      ?auto_325372 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_325369 ?auto_325371 ) ( SURFACE-AT ?auto_325366 ?auto_325371 ) ( CLEAR ?auto_325366 ) ( IS-CRATE ?auto_325367 ) ( not ( = ?auto_325366 ?auto_325367 ) ) ( AVAILABLE ?auto_325369 ) ( ON ?auto_325366 ?auto_325365 ) ( not ( = ?auto_325365 ?auto_325366 ) ) ( not ( = ?auto_325365 ?auto_325367 ) ) ( TRUCK-AT ?auto_325368 ?auto_325370 ) ( not ( = ?auto_325370 ?auto_325371 ) ) ( HOIST-AT ?auto_325372 ?auto_325370 ) ( LIFTING ?auto_325372 ?auto_325367 ) ( not ( = ?auto_325369 ?auto_325372 ) ) ( ON ?auto_325361 ?auto_325360 ) ( ON ?auto_325362 ?auto_325361 ) ( ON ?auto_325364 ?auto_325362 ) ( ON ?auto_325363 ?auto_325364 ) ( ON ?auto_325365 ?auto_325363 ) ( not ( = ?auto_325360 ?auto_325361 ) ) ( not ( = ?auto_325360 ?auto_325362 ) ) ( not ( = ?auto_325360 ?auto_325364 ) ) ( not ( = ?auto_325360 ?auto_325363 ) ) ( not ( = ?auto_325360 ?auto_325365 ) ) ( not ( = ?auto_325360 ?auto_325366 ) ) ( not ( = ?auto_325360 ?auto_325367 ) ) ( not ( = ?auto_325361 ?auto_325362 ) ) ( not ( = ?auto_325361 ?auto_325364 ) ) ( not ( = ?auto_325361 ?auto_325363 ) ) ( not ( = ?auto_325361 ?auto_325365 ) ) ( not ( = ?auto_325361 ?auto_325366 ) ) ( not ( = ?auto_325361 ?auto_325367 ) ) ( not ( = ?auto_325362 ?auto_325364 ) ) ( not ( = ?auto_325362 ?auto_325363 ) ) ( not ( = ?auto_325362 ?auto_325365 ) ) ( not ( = ?auto_325362 ?auto_325366 ) ) ( not ( = ?auto_325362 ?auto_325367 ) ) ( not ( = ?auto_325364 ?auto_325363 ) ) ( not ( = ?auto_325364 ?auto_325365 ) ) ( not ( = ?auto_325364 ?auto_325366 ) ) ( not ( = ?auto_325364 ?auto_325367 ) ) ( not ( = ?auto_325363 ?auto_325365 ) ) ( not ( = ?auto_325363 ?auto_325366 ) ) ( not ( = ?auto_325363 ?auto_325367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325365 ?auto_325366 ?auto_325367 )
      ( MAKE-7CRATE-VERIFY ?auto_325360 ?auto_325361 ?auto_325362 ?auto_325364 ?auto_325363 ?auto_325365 ?auto_325366 ?auto_325367 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325437 - SURFACE
      ?auto_325438 - SURFACE
      ?auto_325439 - SURFACE
      ?auto_325441 - SURFACE
      ?auto_325440 - SURFACE
      ?auto_325442 - SURFACE
      ?auto_325443 - SURFACE
      ?auto_325444 - SURFACE
    )
    :vars
    (
      ?auto_325445 - HOIST
      ?auto_325446 - PLACE
      ?auto_325448 - TRUCK
      ?auto_325450 - PLACE
      ?auto_325447 - HOIST
      ?auto_325449 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_325445 ?auto_325446 ) ( SURFACE-AT ?auto_325443 ?auto_325446 ) ( CLEAR ?auto_325443 ) ( IS-CRATE ?auto_325444 ) ( not ( = ?auto_325443 ?auto_325444 ) ) ( AVAILABLE ?auto_325445 ) ( ON ?auto_325443 ?auto_325442 ) ( not ( = ?auto_325442 ?auto_325443 ) ) ( not ( = ?auto_325442 ?auto_325444 ) ) ( TRUCK-AT ?auto_325448 ?auto_325450 ) ( not ( = ?auto_325450 ?auto_325446 ) ) ( HOIST-AT ?auto_325447 ?auto_325450 ) ( not ( = ?auto_325445 ?auto_325447 ) ) ( AVAILABLE ?auto_325447 ) ( SURFACE-AT ?auto_325444 ?auto_325450 ) ( ON ?auto_325444 ?auto_325449 ) ( CLEAR ?auto_325444 ) ( not ( = ?auto_325443 ?auto_325449 ) ) ( not ( = ?auto_325444 ?auto_325449 ) ) ( not ( = ?auto_325442 ?auto_325449 ) ) ( ON ?auto_325438 ?auto_325437 ) ( ON ?auto_325439 ?auto_325438 ) ( ON ?auto_325441 ?auto_325439 ) ( ON ?auto_325440 ?auto_325441 ) ( ON ?auto_325442 ?auto_325440 ) ( not ( = ?auto_325437 ?auto_325438 ) ) ( not ( = ?auto_325437 ?auto_325439 ) ) ( not ( = ?auto_325437 ?auto_325441 ) ) ( not ( = ?auto_325437 ?auto_325440 ) ) ( not ( = ?auto_325437 ?auto_325442 ) ) ( not ( = ?auto_325437 ?auto_325443 ) ) ( not ( = ?auto_325437 ?auto_325444 ) ) ( not ( = ?auto_325437 ?auto_325449 ) ) ( not ( = ?auto_325438 ?auto_325439 ) ) ( not ( = ?auto_325438 ?auto_325441 ) ) ( not ( = ?auto_325438 ?auto_325440 ) ) ( not ( = ?auto_325438 ?auto_325442 ) ) ( not ( = ?auto_325438 ?auto_325443 ) ) ( not ( = ?auto_325438 ?auto_325444 ) ) ( not ( = ?auto_325438 ?auto_325449 ) ) ( not ( = ?auto_325439 ?auto_325441 ) ) ( not ( = ?auto_325439 ?auto_325440 ) ) ( not ( = ?auto_325439 ?auto_325442 ) ) ( not ( = ?auto_325439 ?auto_325443 ) ) ( not ( = ?auto_325439 ?auto_325444 ) ) ( not ( = ?auto_325439 ?auto_325449 ) ) ( not ( = ?auto_325441 ?auto_325440 ) ) ( not ( = ?auto_325441 ?auto_325442 ) ) ( not ( = ?auto_325441 ?auto_325443 ) ) ( not ( = ?auto_325441 ?auto_325444 ) ) ( not ( = ?auto_325441 ?auto_325449 ) ) ( not ( = ?auto_325440 ?auto_325442 ) ) ( not ( = ?auto_325440 ?auto_325443 ) ) ( not ( = ?auto_325440 ?auto_325444 ) ) ( not ( = ?auto_325440 ?auto_325449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325442 ?auto_325443 ?auto_325444 )
      ( MAKE-7CRATE-VERIFY ?auto_325437 ?auto_325438 ?auto_325439 ?auto_325441 ?auto_325440 ?auto_325442 ?auto_325443 ?auto_325444 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325515 - SURFACE
      ?auto_325516 - SURFACE
      ?auto_325517 - SURFACE
      ?auto_325519 - SURFACE
      ?auto_325518 - SURFACE
      ?auto_325520 - SURFACE
      ?auto_325521 - SURFACE
      ?auto_325522 - SURFACE
    )
    :vars
    (
      ?auto_325528 - HOIST
      ?auto_325523 - PLACE
      ?auto_325527 - PLACE
      ?auto_325524 - HOIST
      ?auto_325526 - SURFACE
      ?auto_325525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325528 ?auto_325523 ) ( SURFACE-AT ?auto_325521 ?auto_325523 ) ( CLEAR ?auto_325521 ) ( IS-CRATE ?auto_325522 ) ( not ( = ?auto_325521 ?auto_325522 ) ) ( AVAILABLE ?auto_325528 ) ( ON ?auto_325521 ?auto_325520 ) ( not ( = ?auto_325520 ?auto_325521 ) ) ( not ( = ?auto_325520 ?auto_325522 ) ) ( not ( = ?auto_325527 ?auto_325523 ) ) ( HOIST-AT ?auto_325524 ?auto_325527 ) ( not ( = ?auto_325528 ?auto_325524 ) ) ( AVAILABLE ?auto_325524 ) ( SURFACE-AT ?auto_325522 ?auto_325527 ) ( ON ?auto_325522 ?auto_325526 ) ( CLEAR ?auto_325522 ) ( not ( = ?auto_325521 ?auto_325526 ) ) ( not ( = ?auto_325522 ?auto_325526 ) ) ( not ( = ?auto_325520 ?auto_325526 ) ) ( TRUCK-AT ?auto_325525 ?auto_325523 ) ( ON ?auto_325516 ?auto_325515 ) ( ON ?auto_325517 ?auto_325516 ) ( ON ?auto_325519 ?auto_325517 ) ( ON ?auto_325518 ?auto_325519 ) ( ON ?auto_325520 ?auto_325518 ) ( not ( = ?auto_325515 ?auto_325516 ) ) ( not ( = ?auto_325515 ?auto_325517 ) ) ( not ( = ?auto_325515 ?auto_325519 ) ) ( not ( = ?auto_325515 ?auto_325518 ) ) ( not ( = ?auto_325515 ?auto_325520 ) ) ( not ( = ?auto_325515 ?auto_325521 ) ) ( not ( = ?auto_325515 ?auto_325522 ) ) ( not ( = ?auto_325515 ?auto_325526 ) ) ( not ( = ?auto_325516 ?auto_325517 ) ) ( not ( = ?auto_325516 ?auto_325519 ) ) ( not ( = ?auto_325516 ?auto_325518 ) ) ( not ( = ?auto_325516 ?auto_325520 ) ) ( not ( = ?auto_325516 ?auto_325521 ) ) ( not ( = ?auto_325516 ?auto_325522 ) ) ( not ( = ?auto_325516 ?auto_325526 ) ) ( not ( = ?auto_325517 ?auto_325519 ) ) ( not ( = ?auto_325517 ?auto_325518 ) ) ( not ( = ?auto_325517 ?auto_325520 ) ) ( not ( = ?auto_325517 ?auto_325521 ) ) ( not ( = ?auto_325517 ?auto_325522 ) ) ( not ( = ?auto_325517 ?auto_325526 ) ) ( not ( = ?auto_325519 ?auto_325518 ) ) ( not ( = ?auto_325519 ?auto_325520 ) ) ( not ( = ?auto_325519 ?auto_325521 ) ) ( not ( = ?auto_325519 ?auto_325522 ) ) ( not ( = ?auto_325519 ?auto_325526 ) ) ( not ( = ?auto_325518 ?auto_325520 ) ) ( not ( = ?auto_325518 ?auto_325521 ) ) ( not ( = ?auto_325518 ?auto_325522 ) ) ( not ( = ?auto_325518 ?auto_325526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325520 ?auto_325521 ?auto_325522 )
      ( MAKE-7CRATE-VERIFY ?auto_325515 ?auto_325516 ?auto_325517 ?auto_325519 ?auto_325518 ?auto_325520 ?auto_325521 ?auto_325522 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325593 - SURFACE
      ?auto_325594 - SURFACE
      ?auto_325595 - SURFACE
      ?auto_325597 - SURFACE
      ?auto_325596 - SURFACE
      ?auto_325598 - SURFACE
      ?auto_325599 - SURFACE
      ?auto_325600 - SURFACE
    )
    :vars
    (
      ?auto_325606 - HOIST
      ?auto_325604 - PLACE
      ?auto_325601 - PLACE
      ?auto_325603 - HOIST
      ?auto_325605 - SURFACE
      ?auto_325602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325606 ?auto_325604 ) ( IS-CRATE ?auto_325600 ) ( not ( = ?auto_325599 ?auto_325600 ) ) ( not ( = ?auto_325598 ?auto_325599 ) ) ( not ( = ?auto_325598 ?auto_325600 ) ) ( not ( = ?auto_325601 ?auto_325604 ) ) ( HOIST-AT ?auto_325603 ?auto_325601 ) ( not ( = ?auto_325606 ?auto_325603 ) ) ( AVAILABLE ?auto_325603 ) ( SURFACE-AT ?auto_325600 ?auto_325601 ) ( ON ?auto_325600 ?auto_325605 ) ( CLEAR ?auto_325600 ) ( not ( = ?auto_325599 ?auto_325605 ) ) ( not ( = ?auto_325600 ?auto_325605 ) ) ( not ( = ?auto_325598 ?auto_325605 ) ) ( TRUCK-AT ?auto_325602 ?auto_325604 ) ( SURFACE-AT ?auto_325598 ?auto_325604 ) ( CLEAR ?auto_325598 ) ( LIFTING ?auto_325606 ?auto_325599 ) ( IS-CRATE ?auto_325599 ) ( ON ?auto_325594 ?auto_325593 ) ( ON ?auto_325595 ?auto_325594 ) ( ON ?auto_325597 ?auto_325595 ) ( ON ?auto_325596 ?auto_325597 ) ( ON ?auto_325598 ?auto_325596 ) ( not ( = ?auto_325593 ?auto_325594 ) ) ( not ( = ?auto_325593 ?auto_325595 ) ) ( not ( = ?auto_325593 ?auto_325597 ) ) ( not ( = ?auto_325593 ?auto_325596 ) ) ( not ( = ?auto_325593 ?auto_325598 ) ) ( not ( = ?auto_325593 ?auto_325599 ) ) ( not ( = ?auto_325593 ?auto_325600 ) ) ( not ( = ?auto_325593 ?auto_325605 ) ) ( not ( = ?auto_325594 ?auto_325595 ) ) ( not ( = ?auto_325594 ?auto_325597 ) ) ( not ( = ?auto_325594 ?auto_325596 ) ) ( not ( = ?auto_325594 ?auto_325598 ) ) ( not ( = ?auto_325594 ?auto_325599 ) ) ( not ( = ?auto_325594 ?auto_325600 ) ) ( not ( = ?auto_325594 ?auto_325605 ) ) ( not ( = ?auto_325595 ?auto_325597 ) ) ( not ( = ?auto_325595 ?auto_325596 ) ) ( not ( = ?auto_325595 ?auto_325598 ) ) ( not ( = ?auto_325595 ?auto_325599 ) ) ( not ( = ?auto_325595 ?auto_325600 ) ) ( not ( = ?auto_325595 ?auto_325605 ) ) ( not ( = ?auto_325597 ?auto_325596 ) ) ( not ( = ?auto_325597 ?auto_325598 ) ) ( not ( = ?auto_325597 ?auto_325599 ) ) ( not ( = ?auto_325597 ?auto_325600 ) ) ( not ( = ?auto_325597 ?auto_325605 ) ) ( not ( = ?auto_325596 ?auto_325598 ) ) ( not ( = ?auto_325596 ?auto_325599 ) ) ( not ( = ?auto_325596 ?auto_325600 ) ) ( not ( = ?auto_325596 ?auto_325605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325598 ?auto_325599 ?auto_325600 )
      ( MAKE-7CRATE-VERIFY ?auto_325593 ?auto_325594 ?auto_325595 ?auto_325597 ?auto_325596 ?auto_325598 ?auto_325599 ?auto_325600 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_325671 - SURFACE
      ?auto_325672 - SURFACE
      ?auto_325673 - SURFACE
      ?auto_325675 - SURFACE
      ?auto_325674 - SURFACE
      ?auto_325676 - SURFACE
      ?auto_325677 - SURFACE
      ?auto_325678 - SURFACE
    )
    :vars
    (
      ?auto_325682 - HOIST
      ?auto_325680 - PLACE
      ?auto_325679 - PLACE
      ?auto_325681 - HOIST
      ?auto_325683 - SURFACE
      ?auto_325684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325682 ?auto_325680 ) ( IS-CRATE ?auto_325678 ) ( not ( = ?auto_325677 ?auto_325678 ) ) ( not ( = ?auto_325676 ?auto_325677 ) ) ( not ( = ?auto_325676 ?auto_325678 ) ) ( not ( = ?auto_325679 ?auto_325680 ) ) ( HOIST-AT ?auto_325681 ?auto_325679 ) ( not ( = ?auto_325682 ?auto_325681 ) ) ( AVAILABLE ?auto_325681 ) ( SURFACE-AT ?auto_325678 ?auto_325679 ) ( ON ?auto_325678 ?auto_325683 ) ( CLEAR ?auto_325678 ) ( not ( = ?auto_325677 ?auto_325683 ) ) ( not ( = ?auto_325678 ?auto_325683 ) ) ( not ( = ?auto_325676 ?auto_325683 ) ) ( TRUCK-AT ?auto_325684 ?auto_325680 ) ( SURFACE-AT ?auto_325676 ?auto_325680 ) ( CLEAR ?auto_325676 ) ( IS-CRATE ?auto_325677 ) ( AVAILABLE ?auto_325682 ) ( IN ?auto_325677 ?auto_325684 ) ( ON ?auto_325672 ?auto_325671 ) ( ON ?auto_325673 ?auto_325672 ) ( ON ?auto_325675 ?auto_325673 ) ( ON ?auto_325674 ?auto_325675 ) ( ON ?auto_325676 ?auto_325674 ) ( not ( = ?auto_325671 ?auto_325672 ) ) ( not ( = ?auto_325671 ?auto_325673 ) ) ( not ( = ?auto_325671 ?auto_325675 ) ) ( not ( = ?auto_325671 ?auto_325674 ) ) ( not ( = ?auto_325671 ?auto_325676 ) ) ( not ( = ?auto_325671 ?auto_325677 ) ) ( not ( = ?auto_325671 ?auto_325678 ) ) ( not ( = ?auto_325671 ?auto_325683 ) ) ( not ( = ?auto_325672 ?auto_325673 ) ) ( not ( = ?auto_325672 ?auto_325675 ) ) ( not ( = ?auto_325672 ?auto_325674 ) ) ( not ( = ?auto_325672 ?auto_325676 ) ) ( not ( = ?auto_325672 ?auto_325677 ) ) ( not ( = ?auto_325672 ?auto_325678 ) ) ( not ( = ?auto_325672 ?auto_325683 ) ) ( not ( = ?auto_325673 ?auto_325675 ) ) ( not ( = ?auto_325673 ?auto_325674 ) ) ( not ( = ?auto_325673 ?auto_325676 ) ) ( not ( = ?auto_325673 ?auto_325677 ) ) ( not ( = ?auto_325673 ?auto_325678 ) ) ( not ( = ?auto_325673 ?auto_325683 ) ) ( not ( = ?auto_325675 ?auto_325674 ) ) ( not ( = ?auto_325675 ?auto_325676 ) ) ( not ( = ?auto_325675 ?auto_325677 ) ) ( not ( = ?auto_325675 ?auto_325678 ) ) ( not ( = ?auto_325675 ?auto_325683 ) ) ( not ( = ?auto_325674 ?auto_325676 ) ) ( not ( = ?auto_325674 ?auto_325677 ) ) ( not ( = ?auto_325674 ?auto_325678 ) ) ( not ( = ?auto_325674 ?auto_325683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_325676 ?auto_325677 ?auto_325678 )
      ( MAKE-7CRATE-VERIFY ?auto_325671 ?auto_325672 ?auto_325673 ?auto_325675 ?auto_325674 ?auto_325676 ?auto_325677 ?auto_325678 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328561 - SURFACE
      ?auto_328562 - SURFACE
      ?auto_328563 - SURFACE
      ?auto_328565 - SURFACE
      ?auto_328564 - SURFACE
      ?auto_328566 - SURFACE
      ?auto_328567 - SURFACE
      ?auto_328568 - SURFACE
      ?auto_328569 - SURFACE
    )
    :vars
    (
      ?auto_328570 - HOIST
      ?auto_328571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_328570 ?auto_328571 ) ( SURFACE-AT ?auto_328568 ?auto_328571 ) ( CLEAR ?auto_328568 ) ( LIFTING ?auto_328570 ?auto_328569 ) ( IS-CRATE ?auto_328569 ) ( not ( = ?auto_328568 ?auto_328569 ) ) ( ON ?auto_328562 ?auto_328561 ) ( ON ?auto_328563 ?auto_328562 ) ( ON ?auto_328565 ?auto_328563 ) ( ON ?auto_328564 ?auto_328565 ) ( ON ?auto_328566 ?auto_328564 ) ( ON ?auto_328567 ?auto_328566 ) ( ON ?auto_328568 ?auto_328567 ) ( not ( = ?auto_328561 ?auto_328562 ) ) ( not ( = ?auto_328561 ?auto_328563 ) ) ( not ( = ?auto_328561 ?auto_328565 ) ) ( not ( = ?auto_328561 ?auto_328564 ) ) ( not ( = ?auto_328561 ?auto_328566 ) ) ( not ( = ?auto_328561 ?auto_328567 ) ) ( not ( = ?auto_328561 ?auto_328568 ) ) ( not ( = ?auto_328561 ?auto_328569 ) ) ( not ( = ?auto_328562 ?auto_328563 ) ) ( not ( = ?auto_328562 ?auto_328565 ) ) ( not ( = ?auto_328562 ?auto_328564 ) ) ( not ( = ?auto_328562 ?auto_328566 ) ) ( not ( = ?auto_328562 ?auto_328567 ) ) ( not ( = ?auto_328562 ?auto_328568 ) ) ( not ( = ?auto_328562 ?auto_328569 ) ) ( not ( = ?auto_328563 ?auto_328565 ) ) ( not ( = ?auto_328563 ?auto_328564 ) ) ( not ( = ?auto_328563 ?auto_328566 ) ) ( not ( = ?auto_328563 ?auto_328567 ) ) ( not ( = ?auto_328563 ?auto_328568 ) ) ( not ( = ?auto_328563 ?auto_328569 ) ) ( not ( = ?auto_328565 ?auto_328564 ) ) ( not ( = ?auto_328565 ?auto_328566 ) ) ( not ( = ?auto_328565 ?auto_328567 ) ) ( not ( = ?auto_328565 ?auto_328568 ) ) ( not ( = ?auto_328565 ?auto_328569 ) ) ( not ( = ?auto_328564 ?auto_328566 ) ) ( not ( = ?auto_328564 ?auto_328567 ) ) ( not ( = ?auto_328564 ?auto_328568 ) ) ( not ( = ?auto_328564 ?auto_328569 ) ) ( not ( = ?auto_328566 ?auto_328567 ) ) ( not ( = ?auto_328566 ?auto_328568 ) ) ( not ( = ?auto_328566 ?auto_328569 ) ) ( not ( = ?auto_328567 ?auto_328568 ) ) ( not ( = ?auto_328567 ?auto_328569 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_328568 ?auto_328569 )
      ( MAKE-8CRATE-VERIFY ?auto_328561 ?auto_328562 ?auto_328563 ?auto_328565 ?auto_328564 ?auto_328566 ?auto_328567 ?auto_328568 ?auto_328569 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328628 - SURFACE
      ?auto_328629 - SURFACE
      ?auto_328630 - SURFACE
      ?auto_328632 - SURFACE
      ?auto_328631 - SURFACE
      ?auto_328633 - SURFACE
      ?auto_328634 - SURFACE
      ?auto_328635 - SURFACE
      ?auto_328636 - SURFACE
    )
    :vars
    (
      ?auto_328637 - HOIST
      ?auto_328639 - PLACE
      ?auto_328638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_328637 ?auto_328639 ) ( SURFACE-AT ?auto_328635 ?auto_328639 ) ( CLEAR ?auto_328635 ) ( IS-CRATE ?auto_328636 ) ( not ( = ?auto_328635 ?auto_328636 ) ) ( TRUCK-AT ?auto_328638 ?auto_328639 ) ( AVAILABLE ?auto_328637 ) ( IN ?auto_328636 ?auto_328638 ) ( ON ?auto_328635 ?auto_328634 ) ( not ( = ?auto_328634 ?auto_328635 ) ) ( not ( = ?auto_328634 ?auto_328636 ) ) ( ON ?auto_328629 ?auto_328628 ) ( ON ?auto_328630 ?auto_328629 ) ( ON ?auto_328632 ?auto_328630 ) ( ON ?auto_328631 ?auto_328632 ) ( ON ?auto_328633 ?auto_328631 ) ( ON ?auto_328634 ?auto_328633 ) ( not ( = ?auto_328628 ?auto_328629 ) ) ( not ( = ?auto_328628 ?auto_328630 ) ) ( not ( = ?auto_328628 ?auto_328632 ) ) ( not ( = ?auto_328628 ?auto_328631 ) ) ( not ( = ?auto_328628 ?auto_328633 ) ) ( not ( = ?auto_328628 ?auto_328634 ) ) ( not ( = ?auto_328628 ?auto_328635 ) ) ( not ( = ?auto_328628 ?auto_328636 ) ) ( not ( = ?auto_328629 ?auto_328630 ) ) ( not ( = ?auto_328629 ?auto_328632 ) ) ( not ( = ?auto_328629 ?auto_328631 ) ) ( not ( = ?auto_328629 ?auto_328633 ) ) ( not ( = ?auto_328629 ?auto_328634 ) ) ( not ( = ?auto_328629 ?auto_328635 ) ) ( not ( = ?auto_328629 ?auto_328636 ) ) ( not ( = ?auto_328630 ?auto_328632 ) ) ( not ( = ?auto_328630 ?auto_328631 ) ) ( not ( = ?auto_328630 ?auto_328633 ) ) ( not ( = ?auto_328630 ?auto_328634 ) ) ( not ( = ?auto_328630 ?auto_328635 ) ) ( not ( = ?auto_328630 ?auto_328636 ) ) ( not ( = ?auto_328632 ?auto_328631 ) ) ( not ( = ?auto_328632 ?auto_328633 ) ) ( not ( = ?auto_328632 ?auto_328634 ) ) ( not ( = ?auto_328632 ?auto_328635 ) ) ( not ( = ?auto_328632 ?auto_328636 ) ) ( not ( = ?auto_328631 ?auto_328633 ) ) ( not ( = ?auto_328631 ?auto_328634 ) ) ( not ( = ?auto_328631 ?auto_328635 ) ) ( not ( = ?auto_328631 ?auto_328636 ) ) ( not ( = ?auto_328633 ?auto_328634 ) ) ( not ( = ?auto_328633 ?auto_328635 ) ) ( not ( = ?auto_328633 ?auto_328636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_328634 ?auto_328635 ?auto_328636 )
      ( MAKE-8CRATE-VERIFY ?auto_328628 ?auto_328629 ?auto_328630 ?auto_328632 ?auto_328631 ?auto_328633 ?auto_328634 ?auto_328635 ?auto_328636 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328704 - SURFACE
      ?auto_328705 - SURFACE
      ?auto_328706 - SURFACE
      ?auto_328708 - SURFACE
      ?auto_328707 - SURFACE
      ?auto_328709 - SURFACE
      ?auto_328710 - SURFACE
      ?auto_328711 - SURFACE
      ?auto_328712 - SURFACE
    )
    :vars
    (
      ?auto_328716 - HOIST
      ?auto_328714 - PLACE
      ?auto_328713 - TRUCK
      ?auto_328715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_328716 ?auto_328714 ) ( SURFACE-AT ?auto_328711 ?auto_328714 ) ( CLEAR ?auto_328711 ) ( IS-CRATE ?auto_328712 ) ( not ( = ?auto_328711 ?auto_328712 ) ) ( AVAILABLE ?auto_328716 ) ( IN ?auto_328712 ?auto_328713 ) ( ON ?auto_328711 ?auto_328710 ) ( not ( = ?auto_328710 ?auto_328711 ) ) ( not ( = ?auto_328710 ?auto_328712 ) ) ( TRUCK-AT ?auto_328713 ?auto_328715 ) ( not ( = ?auto_328715 ?auto_328714 ) ) ( ON ?auto_328705 ?auto_328704 ) ( ON ?auto_328706 ?auto_328705 ) ( ON ?auto_328708 ?auto_328706 ) ( ON ?auto_328707 ?auto_328708 ) ( ON ?auto_328709 ?auto_328707 ) ( ON ?auto_328710 ?auto_328709 ) ( not ( = ?auto_328704 ?auto_328705 ) ) ( not ( = ?auto_328704 ?auto_328706 ) ) ( not ( = ?auto_328704 ?auto_328708 ) ) ( not ( = ?auto_328704 ?auto_328707 ) ) ( not ( = ?auto_328704 ?auto_328709 ) ) ( not ( = ?auto_328704 ?auto_328710 ) ) ( not ( = ?auto_328704 ?auto_328711 ) ) ( not ( = ?auto_328704 ?auto_328712 ) ) ( not ( = ?auto_328705 ?auto_328706 ) ) ( not ( = ?auto_328705 ?auto_328708 ) ) ( not ( = ?auto_328705 ?auto_328707 ) ) ( not ( = ?auto_328705 ?auto_328709 ) ) ( not ( = ?auto_328705 ?auto_328710 ) ) ( not ( = ?auto_328705 ?auto_328711 ) ) ( not ( = ?auto_328705 ?auto_328712 ) ) ( not ( = ?auto_328706 ?auto_328708 ) ) ( not ( = ?auto_328706 ?auto_328707 ) ) ( not ( = ?auto_328706 ?auto_328709 ) ) ( not ( = ?auto_328706 ?auto_328710 ) ) ( not ( = ?auto_328706 ?auto_328711 ) ) ( not ( = ?auto_328706 ?auto_328712 ) ) ( not ( = ?auto_328708 ?auto_328707 ) ) ( not ( = ?auto_328708 ?auto_328709 ) ) ( not ( = ?auto_328708 ?auto_328710 ) ) ( not ( = ?auto_328708 ?auto_328711 ) ) ( not ( = ?auto_328708 ?auto_328712 ) ) ( not ( = ?auto_328707 ?auto_328709 ) ) ( not ( = ?auto_328707 ?auto_328710 ) ) ( not ( = ?auto_328707 ?auto_328711 ) ) ( not ( = ?auto_328707 ?auto_328712 ) ) ( not ( = ?auto_328709 ?auto_328710 ) ) ( not ( = ?auto_328709 ?auto_328711 ) ) ( not ( = ?auto_328709 ?auto_328712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_328710 ?auto_328711 ?auto_328712 )
      ( MAKE-8CRATE-VERIFY ?auto_328704 ?auto_328705 ?auto_328706 ?auto_328708 ?auto_328707 ?auto_328709 ?auto_328710 ?auto_328711 ?auto_328712 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328788 - SURFACE
      ?auto_328789 - SURFACE
      ?auto_328790 - SURFACE
      ?auto_328792 - SURFACE
      ?auto_328791 - SURFACE
      ?auto_328793 - SURFACE
      ?auto_328794 - SURFACE
      ?auto_328795 - SURFACE
      ?auto_328796 - SURFACE
    )
    :vars
    (
      ?auto_328798 - HOIST
      ?auto_328799 - PLACE
      ?auto_328801 - TRUCK
      ?auto_328800 - PLACE
      ?auto_328797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_328798 ?auto_328799 ) ( SURFACE-AT ?auto_328795 ?auto_328799 ) ( CLEAR ?auto_328795 ) ( IS-CRATE ?auto_328796 ) ( not ( = ?auto_328795 ?auto_328796 ) ) ( AVAILABLE ?auto_328798 ) ( ON ?auto_328795 ?auto_328794 ) ( not ( = ?auto_328794 ?auto_328795 ) ) ( not ( = ?auto_328794 ?auto_328796 ) ) ( TRUCK-AT ?auto_328801 ?auto_328800 ) ( not ( = ?auto_328800 ?auto_328799 ) ) ( HOIST-AT ?auto_328797 ?auto_328800 ) ( LIFTING ?auto_328797 ?auto_328796 ) ( not ( = ?auto_328798 ?auto_328797 ) ) ( ON ?auto_328789 ?auto_328788 ) ( ON ?auto_328790 ?auto_328789 ) ( ON ?auto_328792 ?auto_328790 ) ( ON ?auto_328791 ?auto_328792 ) ( ON ?auto_328793 ?auto_328791 ) ( ON ?auto_328794 ?auto_328793 ) ( not ( = ?auto_328788 ?auto_328789 ) ) ( not ( = ?auto_328788 ?auto_328790 ) ) ( not ( = ?auto_328788 ?auto_328792 ) ) ( not ( = ?auto_328788 ?auto_328791 ) ) ( not ( = ?auto_328788 ?auto_328793 ) ) ( not ( = ?auto_328788 ?auto_328794 ) ) ( not ( = ?auto_328788 ?auto_328795 ) ) ( not ( = ?auto_328788 ?auto_328796 ) ) ( not ( = ?auto_328789 ?auto_328790 ) ) ( not ( = ?auto_328789 ?auto_328792 ) ) ( not ( = ?auto_328789 ?auto_328791 ) ) ( not ( = ?auto_328789 ?auto_328793 ) ) ( not ( = ?auto_328789 ?auto_328794 ) ) ( not ( = ?auto_328789 ?auto_328795 ) ) ( not ( = ?auto_328789 ?auto_328796 ) ) ( not ( = ?auto_328790 ?auto_328792 ) ) ( not ( = ?auto_328790 ?auto_328791 ) ) ( not ( = ?auto_328790 ?auto_328793 ) ) ( not ( = ?auto_328790 ?auto_328794 ) ) ( not ( = ?auto_328790 ?auto_328795 ) ) ( not ( = ?auto_328790 ?auto_328796 ) ) ( not ( = ?auto_328792 ?auto_328791 ) ) ( not ( = ?auto_328792 ?auto_328793 ) ) ( not ( = ?auto_328792 ?auto_328794 ) ) ( not ( = ?auto_328792 ?auto_328795 ) ) ( not ( = ?auto_328792 ?auto_328796 ) ) ( not ( = ?auto_328791 ?auto_328793 ) ) ( not ( = ?auto_328791 ?auto_328794 ) ) ( not ( = ?auto_328791 ?auto_328795 ) ) ( not ( = ?auto_328791 ?auto_328796 ) ) ( not ( = ?auto_328793 ?auto_328794 ) ) ( not ( = ?auto_328793 ?auto_328795 ) ) ( not ( = ?auto_328793 ?auto_328796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_328794 ?auto_328795 ?auto_328796 )
      ( MAKE-8CRATE-VERIFY ?auto_328788 ?auto_328789 ?auto_328790 ?auto_328792 ?auto_328791 ?auto_328793 ?auto_328794 ?auto_328795 ?auto_328796 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328880 - SURFACE
      ?auto_328881 - SURFACE
      ?auto_328882 - SURFACE
      ?auto_328884 - SURFACE
      ?auto_328883 - SURFACE
      ?auto_328885 - SURFACE
      ?auto_328886 - SURFACE
      ?auto_328887 - SURFACE
      ?auto_328888 - SURFACE
    )
    :vars
    (
      ?auto_328893 - HOIST
      ?auto_328891 - PLACE
      ?auto_328890 - TRUCK
      ?auto_328894 - PLACE
      ?auto_328889 - HOIST
      ?auto_328892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_328893 ?auto_328891 ) ( SURFACE-AT ?auto_328887 ?auto_328891 ) ( CLEAR ?auto_328887 ) ( IS-CRATE ?auto_328888 ) ( not ( = ?auto_328887 ?auto_328888 ) ) ( AVAILABLE ?auto_328893 ) ( ON ?auto_328887 ?auto_328886 ) ( not ( = ?auto_328886 ?auto_328887 ) ) ( not ( = ?auto_328886 ?auto_328888 ) ) ( TRUCK-AT ?auto_328890 ?auto_328894 ) ( not ( = ?auto_328894 ?auto_328891 ) ) ( HOIST-AT ?auto_328889 ?auto_328894 ) ( not ( = ?auto_328893 ?auto_328889 ) ) ( AVAILABLE ?auto_328889 ) ( SURFACE-AT ?auto_328888 ?auto_328894 ) ( ON ?auto_328888 ?auto_328892 ) ( CLEAR ?auto_328888 ) ( not ( = ?auto_328887 ?auto_328892 ) ) ( not ( = ?auto_328888 ?auto_328892 ) ) ( not ( = ?auto_328886 ?auto_328892 ) ) ( ON ?auto_328881 ?auto_328880 ) ( ON ?auto_328882 ?auto_328881 ) ( ON ?auto_328884 ?auto_328882 ) ( ON ?auto_328883 ?auto_328884 ) ( ON ?auto_328885 ?auto_328883 ) ( ON ?auto_328886 ?auto_328885 ) ( not ( = ?auto_328880 ?auto_328881 ) ) ( not ( = ?auto_328880 ?auto_328882 ) ) ( not ( = ?auto_328880 ?auto_328884 ) ) ( not ( = ?auto_328880 ?auto_328883 ) ) ( not ( = ?auto_328880 ?auto_328885 ) ) ( not ( = ?auto_328880 ?auto_328886 ) ) ( not ( = ?auto_328880 ?auto_328887 ) ) ( not ( = ?auto_328880 ?auto_328888 ) ) ( not ( = ?auto_328880 ?auto_328892 ) ) ( not ( = ?auto_328881 ?auto_328882 ) ) ( not ( = ?auto_328881 ?auto_328884 ) ) ( not ( = ?auto_328881 ?auto_328883 ) ) ( not ( = ?auto_328881 ?auto_328885 ) ) ( not ( = ?auto_328881 ?auto_328886 ) ) ( not ( = ?auto_328881 ?auto_328887 ) ) ( not ( = ?auto_328881 ?auto_328888 ) ) ( not ( = ?auto_328881 ?auto_328892 ) ) ( not ( = ?auto_328882 ?auto_328884 ) ) ( not ( = ?auto_328882 ?auto_328883 ) ) ( not ( = ?auto_328882 ?auto_328885 ) ) ( not ( = ?auto_328882 ?auto_328886 ) ) ( not ( = ?auto_328882 ?auto_328887 ) ) ( not ( = ?auto_328882 ?auto_328888 ) ) ( not ( = ?auto_328882 ?auto_328892 ) ) ( not ( = ?auto_328884 ?auto_328883 ) ) ( not ( = ?auto_328884 ?auto_328885 ) ) ( not ( = ?auto_328884 ?auto_328886 ) ) ( not ( = ?auto_328884 ?auto_328887 ) ) ( not ( = ?auto_328884 ?auto_328888 ) ) ( not ( = ?auto_328884 ?auto_328892 ) ) ( not ( = ?auto_328883 ?auto_328885 ) ) ( not ( = ?auto_328883 ?auto_328886 ) ) ( not ( = ?auto_328883 ?auto_328887 ) ) ( not ( = ?auto_328883 ?auto_328888 ) ) ( not ( = ?auto_328883 ?auto_328892 ) ) ( not ( = ?auto_328885 ?auto_328886 ) ) ( not ( = ?auto_328885 ?auto_328887 ) ) ( not ( = ?auto_328885 ?auto_328888 ) ) ( not ( = ?auto_328885 ?auto_328892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_328886 ?auto_328887 ?auto_328888 )
      ( MAKE-8CRATE-VERIFY ?auto_328880 ?auto_328881 ?auto_328882 ?auto_328884 ?auto_328883 ?auto_328885 ?auto_328886 ?auto_328887 ?auto_328888 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_328973 - SURFACE
      ?auto_328974 - SURFACE
      ?auto_328975 - SURFACE
      ?auto_328977 - SURFACE
      ?auto_328976 - SURFACE
      ?auto_328978 - SURFACE
      ?auto_328979 - SURFACE
      ?auto_328980 - SURFACE
      ?auto_328981 - SURFACE
    )
    :vars
    (
      ?auto_328987 - HOIST
      ?auto_328982 - PLACE
      ?auto_328984 - PLACE
      ?auto_328983 - HOIST
      ?auto_328986 - SURFACE
      ?auto_328985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_328987 ?auto_328982 ) ( SURFACE-AT ?auto_328980 ?auto_328982 ) ( CLEAR ?auto_328980 ) ( IS-CRATE ?auto_328981 ) ( not ( = ?auto_328980 ?auto_328981 ) ) ( AVAILABLE ?auto_328987 ) ( ON ?auto_328980 ?auto_328979 ) ( not ( = ?auto_328979 ?auto_328980 ) ) ( not ( = ?auto_328979 ?auto_328981 ) ) ( not ( = ?auto_328984 ?auto_328982 ) ) ( HOIST-AT ?auto_328983 ?auto_328984 ) ( not ( = ?auto_328987 ?auto_328983 ) ) ( AVAILABLE ?auto_328983 ) ( SURFACE-AT ?auto_328981 ?auto_328984 ) ( ON ?auto_328981 ?auto_328986 ) ( CLEAR ?auto_328981 ) ( not ( = ?auto_328980 ?auto_328986 ) ) ( not ( = ?auto_328981 ?auto_328986 ) ) ( not ( = ?auto_328979 ?auto_328986 ) ) ( TRUCK-AT ?auto_328985 ?auto_328982 ) ( ON ?auto_328974 ?auto_328973 ) ( ON ?auto_328975 ?auto_328974 ) ( ON ?auto_328977 ?auto_328975 ) ( ON ?auto_328976 ?auto_328977 ) ( ON ?auto_328978 ?auto_328976 ) ( ON ?auto_328979 ?auto_328978 ) ( not ( = ?auto_328973 ?auto_328974 ) ) ( not ( = ?auto_328973 ?auto_328975 ) ) ( not ( = ?auto_328973 ?auto_328977 ) ) ( not ( = ?auto_328973 ?auto_328976 ) ) ( not ( = ?auto_328973 ?auto_328978 ) ) ( not ( = ?auto_328973 ?auto_328979 ) ) ( not ( = ?auto_328973 ?auto_328980 ) ) ( not ( = ?auto_328973 ?auto_328981 ) ) ( not ( = ?auto_328973 ?auto_328986 ) ) ( not ( = ?auto_328974 ?auto_328975 ) ) ( not ( = ?auto_328974 ?auto_328977 ) ) ( not ( = ?auto_328974 ?auto_328976 ) ) ( not ( = ?auto_328974 ?auto_328978 ) ) ( not ( = ?auto_328974 ?auto_328979 ) ) ( not ( = ?auto_328974 ?auto_328980 ) ) ( not ( = ?auto_328974 ?auto_328981 ) ) ( not ( = ?auto_328974 ?auto_328986 ) ) ( not ( = ?auto_328975 ?auto_328977 ) ) ( not ( = ?auto_328975 ?auto_328976 ) ) ( not ( = ?auto_328975 ?auto_328978 ) ) ( not ( = ?auto_328975 ?auto_328979 ) ) ( not ( = ?auto_328975 ?auto_328980 ) ) ( not ( = ?auto_328975 ?auto_328981 ) ) ( not ( = ?auto_328975 ?auto_328986 ) ) ( not ( = ?auto_328977 ?auto_328976 ) ) ( not ( = ?auto_328977 ?auto_328978 ) ) ( not ( = ?auto_328977 ?auto_328979 ) ) ( not ( = ?auto_328977 ?auto_328980 ) ) ( not ( = ?auto_328977 ?auto_328981 ) ) ( not ( = ?auto_328977 ?auto_328986 ) ) ( not ( = ?auto_328976 ?auto_328978 ) ) ( not ( = ?auto_328976 ?auto_328979 ) ) ( not ( = ?auto_328976 ?auto_328980 ) ) ( not ( = ?auto_328976 ?auto_328981 ) ) ( not ( = ?auto_328976 ?auto_328986 ) ) ( not ( = ?auto_328978 ?auto_328979 ) ) ( not ( = ?auto_328978 ?auto_328980 ) ) ( not ( = ?auto_328978 ?auto_328981 ) ) ( not ( = ?auto_328978 ?auto_328986 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_328979 ?auto_328980 ?auto_328981 )
      ( MAKE-8CRATE-VERIFY ?auto_328973 ?auto_328974 ?auto_328975 ?auto_328977 ?auto_328976 ?auto_328978 ?auto_328979 ?auto_328980 ?auto_328981 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329066 - SURFACE
      ?auto_329067 - SURFACE
      ?auto_329068 - SURFACE
      ?auto_329070 - SURFACE
      ?auto_329069 - SURFACE
      ?auto_329071 - SURFACE
      ?auto_329072 - SURFACE
      ?auto_329073 - SURFACE
      ?auto_329074 - SURFACE
    )
    :vars
    (
      ?auto_329079 - HOIST
      ?auto_329078 - PLACE
      ?auto_329075 - PLACE
      ?auto_329076 - HOIST
      ?auto_329080 - SURFACE
      ?auto_329077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329079 ?auto_329078 ) ( IS-CRATE ?auto_329074 ) ( not ( = ?auto_329073 ?auto_329074 ) ) ( not ( = ?auto_329072 ?auto_329073 ) ) ( not ( = ?auto_329072 ?auto_329074 ) ) ( not ( = ?auto_329075 ?auto_329078 ) ) ( HOIST-AT ?auto_329076 ?auto_329075 ) ( not ( = ?auto_329079 ?auto_329076 ) ) ( AVAILABLE ?auto_329076 ) ( SURFACE-AT ?auto_329074 ?auto_329075 ) ( ON ?auto_329074 ?auto_329080 ) ( CLEAR ?auto_329074 ) ( not ( = ?auto_329073 ?auto_329080 ) ) ( not ( = ?auto_329074 ?auto_329080 ) ) ( not ( = ?auto_329072 ?auto_329080 ) ) ( TRUCK-AT ?auto_329077 ?auto_329078 ) ( SURFACE-AT ?auto_329072 ?auto_329078 ) ( CLEAR ?auto_329072 ) ( LIFTING ?auto_329079 ?auto_329073 ) ( IS-CRATE ?auto_329073 ) ( ON ?auto_329067 ?auto_329066 ) ( ON ?auto_329068 ?auto_329067 ) ( ON ?auto_329070 ?auto_329068 ) ( ON ?auto_329069 ?auto_329070 ) ( ON ?auto_329071 ?auto_329069 ) ( ON ?auto_329072 ?auto_329071 ) ( not ( = ?auto_329066 ?auto_329067 ) ) ( not ( = ?auto_329066 ?auto_329068 ) ) ( not ( = ?auto_329066 ?auto_329070 ) ) ( not ( = ?auto_329066 ?auto_329069 ) ) ( not ( = ?auto_329066 ?auto_329071 ) ) ( not ( = ?auto_329066 ?auto_329072 ) ) ( not ( = ?auto_329066 ?auto_329073 ) ) ( not ( = ?auto_329066 ?auto_329074 ) ) ( not ( = ?auto_329066 ?auto_329080 ) ) ( not ( = ?auto_329067 ?auto_329068 ) ) ( not ( = ?auto_329067 ?auto_329070 ) ) ( not ( = ?auto_329067 ?auto_329069 ) ) ( not ( = ?auto_329067 ?auto_329071 ) ) ( not ( = ?auto_329067 ?auto_329072 ) ) ( not ( = ?auto_329067 ?auto_329073 ) ) ( not ( = ?auto_329067 ?auto_329074 ) ) ( not ( = ?auto_329067 ?auto_329080 ) ) ( not ( = ?auto_329068 ?auto_329070 ) ) ( not ( = ?auto_329068 ?auto_329069 ) ) ( not ( = ?auto_329068 ?auto_329071 ) ) ( not ( = ?auto_329068 ?auto_329072 ) ) ( not ( = ?auto_329068 ?auto_329073 ) ) ( not ( = ?auto_329068 ?auto_329074 ) ) ( not ( = ?auto_329068 ?auto_329080 ) ) ( not ( = ?auto_329070 ?auto_329069 ) ) ( not ( = ?auto_329070 ?auto_329071 ) ) ( not ( = ?auto_329070 ?auto_329072 ) ) ( not ( = ?auto_329070 ?auto_329073 ) ) ( not ( = ?auto_329070 ?auto_329074 ) ) ( not ( = ?auto_329070 ?auto_329080 ) ) ( not ( = ?auto_329069 ?auto_329071 ) ) ( not ( = ?auto_329069 ?auto_329072 ) ) ( not ( = ?auto_329069 ?auto_329073 ) ) ( not ( = ?auto_329069 ?auto_329074 ) ) ( not ( = ?auto_329069 ?auto_329080 ) ) ( not ( = ?auto_329071 ?auto_329072 ) ) ( not ( = ?auto_329071 ?auto_329073 ) ) ( not ( = ?auto_329071 ?auto_329074 ) ) ( not ( = ?auto_329071 ?auto_329080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329072 ?auto_329073 ?auto_329074 )
      ( MAKE-8CRATE-VERIFY ?auto_329066 ?auto_329067 ?auto_329068 ?auto_329070 ?auto_329069 ?auto_329071 ?auto_329072 ?auto_329073 ?auto_329074 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_329159 - SURFACE
      ?auto_329160 - SURFACE
      ?auto_329161 - SURFACE
      ?auto_329163 - SURFACE
      ?auto_329162 - SURFACE
      ?auto_329164 - SURFACE
      ?auto_329165 - SURFACE
      ?auto_329166 - SURFACE
      ?auto_329167 - SURFACE
    )
    :vars
    (
      ?auto_329170 - HOIST
      ?auto_329173 - PLACE
      ?auto_329171 - PLACE
      ?auto_329169 - HOIST
      ?auto_329172 - SURFACE
      ?auto_329168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_329170 ?auto_329173 ) ( IS-CRATE ?auto_329167 ) ( not ( = ?auto_329166 ?auto_329167 ) ) ( not ( = ?auto_329165 ?auto_329166 ) ) ( not ( = ?auto_329165 ?auto_329167 ) ) ( not ( = ?auto_329171 ?auto_329173 ) ) ( HOIST-AT ?auto_329169 ?auto_329171 ) ( not ( = ?auto_329170 ?auto_329169 ) ) ( AVAILABLE ?auto_329169 ) ( SURFACE-AT ?auto_329167 ?auto_329171 ) ( ON ?auto_329167 ?auto_329172 ) ( CLEAR ?auto_329167 ) ( not ( = ?auto_329166 ?auto_329172 ) ) ( not ( = ?auto_329167 ?auto_329172 ) ) ( not ( = ?auto_329165 ?auto_329172 ) ) ( TRUCK-AT ?auto_329168 ?auto_329173 ) ( SURFACE-AT ?auto_329165 ?auto_329173 ) ( CLEAR ?auto_329165 ) ( IS-CRATE ?auto_329166 ) ( AVAILABLE ?auto_329170 ) ( IN ?auto_329166 ?auto_329168 ) ( ON ?auto_329160 ?auto_329159 ) ( ON ?auto_329161 ?auto_329160 ) ( ON ?auto_329163 ?auto_329161 ) ( ON ?auto_329162 ?auto_329163 ) ( ON ?auto_329164 ?auto_329162 ) ( ON ?auto_329165 ?auto_329164 ) ( not ( = ?auto_329159 ?auto_329160 ) ) ( not ( = ?auto_329159 ?auto_329161 ) ) ( not ( = ?auto_329159 ?auto_329163 ) ) ( not ( = ?auto_329159 ?auto_329162 ) ) ( not ( = ?auto_329159 ?auto_329164 ) ) ( not ( = ?auto_329159 ?auto_329165 ) ) ( not ( = ?auto_329159 ?auto_329166 ) ) ( not ( = ?auto_329159 ?auto_329167 ) ) ( not ( = ?auto_329159 ?auto_329172 ) ) ( not ( = ?auto_329160 ?auto_329161 ) ) ( not ( = ?auto_329160 ?auto_329163 ) ) ( not ( = ?auto_329160 ?auto_329162 ) ) ( not ( = ?auto_329160 ?auto_329164 ) ) ( not ( = ?auto_329160 ?auto_329165 ) ) ( not ( = ?auto_329160 ?auto_329166 ) ) ( not ( = ?auto_329160 ?auto_329167 ) ) ( not ( = ?auto_329160 ?auto_329172 ) ) ( not ( = ?auto_329161 ?auto_329163 ) ) ( not ( = ?auto_329161 ?auto_329162 ) ) ( not ( = ?auto_329161 ?auto_329164 ) ) ( not ( = ?auto_329161 ?auto_329165 ) ) ( not ( = ?auto_329161 ?auto_329166 ) ) ( not ( = ?auto_329161 ?auto_329167 ) ) ( not ( = ?auto_329161 ?auto_329172 ) ) ( not ( = ?auto_329163 ?auto_329162 ) ) ( not ( = ?auto_329163 ?auto_329164 ) ) ( not ( = ?auto_329163 ?auto_329165 ) ) ( not ( = ?auto_329163 ?auto_329166 ) ) ( not ( = ?auto_329163 ?auto_329167 ) ) ( not ( = ?auto_329163 ?auto_329172 ) ) ( not ( = ?auto_329162 ?auto_329164 ) ) ( not ( = ?auto_329162 ?auto_329165 ) ) ( not ( = ?auto_329162 ?auto_329166 ) ) ( not ( = ?auto_329162 ?auto_329167 ) ) ( not ( = ?auto_329162 ?auto_329172 ) ) ( not ( = ?auto_329164 ?auto_329165 ) ) ( not ( = ?auto_329164 ?auto_329166 ) ) ( not ( = ?auto_329164 ?auto_329167 ) ) ( not ( = ?auto_329164 ?auto_329172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_329165 ?auto_329166 ?auto_329167 )
      ( MAKE-8CRATE-VERIFY ?auto_329159 ?auto_329160 ?auto_329161 ?auto_329163 ?auto_329162 ?auto_329164 ?auto_329165 ?auto_329166 ?auto_329167 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333275 - SURFACE
      ?auto_333276 - SURFACE
      ?auto_333277 - SURFACE
      ?auto_333279 - SURFACE
      ?auto_333278 - SURFACE
      ?auto_333280 - SURFACE
      ?auto_333281 - SURFACE
      ?auto_333282 - SURFACE
      ?auto_333283 - SURFACE
      ?auto_333284 - SURFACE
    )
    :vars
    (
      ?auto_333286 - HOIST
      ?auto_333285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333286 ?auto_333285 ) ( SURFACE-AT ?auto_333283 ?auto_333285 ) ( CLEAR ?auto_333283 ) ( LIFTING ?auto_333286 ?auto_333284 ) ( IS-CRATE ?auto_333284 ) ( not ( = ?auto_333283 ?auto_333284 ) ) ( ON ?auto_333276 ?auto_333275 ) ( ON ?auto_333277 ?auto_333276 ) ( ON ?auto_333279 ?auto_333277 ) ( ON ?auto_333278 ?auto_333279 ) ( ON ?auto_333280 ?auto_333278 ) ( ON ?auto_333281 ?auto_333280 ) ( ON ?auto_333282 ?auto_333281 ) ( ON ?auto_333283 ?auto_333282 ) ( not ( = ?auto_333275 ?auto_333276 ) ) ( not ( = ?auto_333275 ?auto_333277 ) ) ( not ( = ?auto_333275 ?auto_333279 ) ) ( not ( = ?auto_333275 ?auto_333278 ) ) ( not ( = ?auto_333275 ?auto_333280 ) ) ( not ( = ?auto_333275 ?auto_333281 ) ) ( not ( = ?auto_333275 ?auto_333282 ) ) ( not ( = ?auto_333275 ?auto_333283 ) ) ( not ( = ?auto_333275 ?auto_333284 ) ) ( not ( = ?auto_333276 ?auto_333277 ) ) ( not ( = ?auto_333276 ?auto_333279 ) ) ( not ( = ?auto_333276 ?auto_333278 ) ) ( not ( = ?auto_333276 ?auto_333280 ) ) ( not ( = ?auto_333276 ?auto_333281 ) ) ( not ( = ?auto_333276 ?auto_333282 ) ) ( not ( = ?auto_333276 ?auto_333283 ) ) ( not ( = ?auto_333276 ?auto_333284 ) ) ( not ( = ?auto_333277 ?auto_333279 ) ) ( not ( = ?auto_333277 ?auto_333278 ) ) ( not ( = ?auto_333277 ?auto_333280 ) ) ( not ( = ?auto_333277 ?auto_333281 ) ) ( not ( = ?auto_333277 ?auto_333282 ) ) ( not ( = ?auto_333277 ?auto_333283 ) ) ( not ( = ?auto_333277 ?auto_333284 ) ) ( not ( = ?auto_333279 ?auto_333278 ) ) ( not ( = ?auto_333279 ?auto_333280 ) ) ( not ( = ?auto_333279 ?auto_333281 ) ) ( not ( = ?auto_333279 ?auto_333282 ) ) ( not ( = ?auto_333279 ?auto_333283 ) ) ( not ( = ?auto_333279 ?auto_333284 ) ) ( not ( = ?auto_333278 ?auto_333280 ) ) ( not ( = ?auto_333278 ?auto_333281 ) ) ( not ( = ?auto_333278 ?auto_333282 ) ) ( not ( = ?auto_333278 ?auto_333283 ) ) ( not ( = ?auto_333278 ?auto_333284 ) ) ( not ( = ?auto_333280 ?auto_333281 ) ) ( not ( = ?auto_333280 ?auto_333282 ) ) ( not ( = ?auto_333280 ?auto_333283 ) ) ( not ( = ?auto_333280 ?auto_333284 ) ) ( not ( = ?auto_333281 ?auto_333282 ) ) ( not ( = ?auto_333281 ?auto_333283 ) ) ( not ( = ?auto_333281 ?auto_333284 ) ) ( not ( = ?auto_333282 ?auto_333283 ) ) ( not ( = ?auto_333282 ?auto_333284 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_333283 ?auto_333284 )
      ( MAKE-9CRATE-VERIFY ?auto_333275 ?auto_333276 ?auto_333277 ?auto_333279 ?auto_333278 ?auto_333280 ?auto_333281 ?auto_333282 ?auto_333283 ?auto_333284 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333355 - SURFACE
      ?auto_333356 - SURFACE
      ?auto_333357 - SURFACE
      ?auto_333359 - SURFACE
      ?auto_333358 - SURFACE
      ?auto_333360 - SURFACE
      ?auto_333361 - SURFACE
      ?auto_333362 - SURFACE
      ?auto_333363 - SURFACE
      ?auto_333364 - SURFACE
    )
    :vars
    (
      ?auto_333367 - HOIST
      ?auto_333366 - PLACE
      ?auto_333365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_333367 ?auto_333366 ) ( SURFACE-AT ?auto_333363 ?auto_333366 ) ( CLEAR ?auto_333363 ) ( IS-CRATE ?auto_333364 ) ( not ( = ?auto_333363 ?auto_333364 ) ) ( TRUCK-AT ?auto_333365 ?auto_333366 ) ( AVAILABLE ?auto_333367 ) ( IN ?auto_333364 ?auto_333365 ) ( ON ?auto_333363 ?auto_333362 ) ( not ( = ?auto_333362 ?auto_333363 ) ) ( not ( = ?auto_333362 ?auto_333364 ) ) ( ON ?auto_333356 ?auto_333355 ) ( ON ?auto_333357 ?auto_333356 ) ( ON ?auto_333359 ?auto_333357 ) ( ON ?auto_333358 ?auto_333359 ) ( ON ?auto_333360 ?auto_333358 ) ( ON ?auto_333361 ?auto_333360 ) ( ON ?auto_333362 ?auto_333361 ) ( not ( = ?auto_333355 ?auto_333356 ) ) ( not ( = ?auto_333355 ?auto_333357 ) ) ( not ( = ?auto_333355 ?auto_333359 ) ) ( not ( = ?auto_333355 ?auto_333358 ) ) ( not ( = ?auto_333355 ?auto_333360 ) ) ( not ( = ?auto_333355 ?auto_333361 ) ) ( not ( = ?auto_333355 ?auto_333362 ) ) ( not ( = ?auto_333355 ?auto_333363 ) ) ( not ( = ?auto_333355 ?auto_333364 ) ) ( not ( = ?auto_333356 ?auto_333357 ) ) ( not ( = ?auto_333356 ?auto_333359 ) ) ( not ( = ?auto_333356 ?auto_333358 ) ) ( not ( = ?auto_333356 ?auto_333360 ) ) ( not ( = ?auto_333356 ?auto_333361 ) ) ( not ( = ?auto_333356 ?auto_333362 ) ) ( not ( = ?auto_333356 ?auto_333363 ) ) ( not ( = ?auto_333356 ?auto_333364 ) ) ( not ( = ?auto_333357 ?auto_333359 ) ) ( not ( = ?auto_333357 ?auto_333358 ) ) ( not ( = ?auto_333357 ?auto_333360 ) ) ( not ( = ?auto_333357 ?auto_333361 ) ) ( not ( = ?auto_333357 ?auto_333362 ) ) ( not ( = ?auto_333357 ?auto_333363 ) ) ( not ( = ?auto_333357 ?auto_333364 ) ) ( not ( = ?auto_333359 ?auto_333358 ) ) ( not ( = ?auto_333359 ?auto_333360 ) ) ( not ( = ?auto_333359 ?auto_333361 ) ) ( not ( = ?auto_333359 ?auto_333362 ) ) ( not ( = ?auto_333359 ?auto_333363 ) ) ( not ( = ?auto_333359 ?auto_333364 ) ) ( not ( = ?auto_333358 ?auto_333360 ) ) ( not ( = ?auto_333358 ?auto_333361 ) ) ( not ( = ?auto_333358 ?auto_333362 ) ) ( not ( = ?auto_333358 ?auto_333363 ) ) ( not ( = ?auto_333358 ?auto_333364 ) ) ( not ( = ?auto_333360 ?auto_333361 ) ) ( not ( = ?auto_333360 ?auto_333362 ) ) ( not ( = ?auto_333360 ?auto_333363 ) ) ( not ( = ?auto_333360 ?auto_333364 ) ) ( not ( = ?auto_333361 ?auto_333362 ) ) ( not ( = ?auto_333361 ?auto_333363 ) ) ( not ( = ?auto_333361 ?auto_333364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333362 ?auto_333363 ?auto_333364 )
      ( MAKE-9CRATE-VERIFY ?auto_333355 ?auto_333356 ?auto_333357 ?auto_333359 ?auto_333358 ?auto_333360 ?auto_333361 ?auto_333362 ?auto_333363 ?auto_333364 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333445 - SURFACE
      ?auto_333446 - SURFACE
      ?auto_333447 - SURFACE
      ?auto_333449 - SURFACE
      ?auto_333448 - SURFACE
      ?auto_333450 - SURFACE
      ?auto_333451 - SURFACE
      ?auto_333452 - SURFACE
      ?auto_333453 - SURFACE
      ?auto_333454 - SURFACE
    )
    :vars
    (
      ?auto_333455 - HOIST
      ?auto_333458 - PLACE
      ?auto_333456 - TRUCK
      ?auto_333457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333455 ?auto_333458 ) ( SURFACE-AT ?auto_333453 ?auto_333458 ) ( CLEAR ?auto_333453 ) ( IS-CRATE ?auto_333454 ) ( not ( = ?auto_333453 ?auto_333454 ) ) ( AVAILABLE ?auto_333455 ) ( IN ?auto_333454 ?auto_333456 ) ( ON ?auto_333453 ?auto_333452 ) ( not ( = ?auto_333452 ?auto_333453 ) ) ( not ( = ?auto_333452 ?auto_333454 ) ) ( TRUCK-AT ?auto_333456 ?auto_333457 ) ( not ( = ?auto_333457 ?auto_333458 ) ) ( ON ?auto_333446 ?auto_333445 ) ( ON ?auto_333447 ?auto_333446 ) ( ON ?auto_333449 ?auto_333447 ) ( ON ?auto_333448 ?auto_333449 ) ( ON ?auto_333450 ?auto_333448 ) ( ON ?auto_333451 ?auto_333450 ) ( ON ?auto_333452 ?auto_333451 ) ( not ( = ?auto_333445 ?auto_333446 ) ) ( not ( = ?auto_333445 ?auto_333447 ) ) ( not ( = ?auto_333445 ?auto_333449 ) ) ( not ( = ?auto_333445 ?auto_333448 ) ) ( not ( = ?auto_333445 ?auto_333450 ) ) ( not ( = ?auto_333445 ?auto_333451 ) ) ( not ( = ?auto_333445 ?auto_333452 ) ) ( not ( = ?auto_333445 ?auto_333453 ) ) ( not ( = ?auto_333445 ?auto_333454 ) ) ( not ( = ?auto_333446 ?auto_333447 ) ) ( not ( = ?auto_333446 ?auto_333449 ) ) ( not ( = ?auto_333446 ?auto_333448 ) ) ( not ( = ?auto_333446 ?auto_333450 ) ) ( not ( = ?auto_333446 ?auto_333451 ) ) ( not ( = ?auto_333446 ?auto_333452 ) ) ( not ( = ?auto_333446 ?auto_333453 ) ) ( not ( = ?auto_333446 ?auto_333454 ) ) ( not ( = ?auto_333447 ?auto_333449 ) ) ( not ( = ?auto_333447 ?auto_333448 ) ) ( not ( = ?auto_333447 ?auto_333450 ) ) ( not ( = ?auto_333447 ?auto_333451 ) ) ( not ( = ?auto_333447 ?auto_333452 ) ) ( not ( = ?auto_333447 ?auto_333453 ) ) ( not ( = ?auto_333447 ?auto_333454 ) ) ( not ( = ?auto_333449 ?auto_333448 ) ) ( not ( = ?auto_333449 ?auto_333450 ) ) ( not ( = ?auto_333449 ?auto_333451 ) ) ( not ( = ?auto_333449 ?auto_333452 ) ) ( not ( = ?auto_333449 ?auto_333453 ) ) ( not ( = ?auto_333449 ?auto_333454 ) ) ( not ( = ?auto_333448 ?auto_333450 ) ) ( not ( = ?auto_333448 ?auto_333451 ) ) ( not ( = ?auto_333448 ?auto_333452 ) ) ( not ( = ?auto_333448 ?auto_333453 ) ) ( not ( = ?auto_333448 ?auto_333454 ) ) ( not ( = ?auto_333450 ?auto_333451 ) ) ( not ( = ?auto_333450 ?auto_333452 ) ) ( not ( = ?auto_333450 ?auto_333453 ) ) ( not ( = ?auto_333450 ?auto_333454 ) ) ( not ( = ?auto_333451 ?auto_333452 ) ) ( not ( = ?auto_333451 ?auto_333453 ) ) ( not ( = ?auto_333451 ?auto_333454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333452 ?auto_333453 ?auto_333454 )
      ( MAKE-9CRATE-VERIFY ?auto_333445 ?auto_333446 ?auto_333447 ?auto_333449 ?auto_333448 ?auto_333450 ?auto_333451 ?auto_333452 ?auto_333453 ?auto_333454 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333544 - SURFACE
      ?auto_333545 - SURFACE
      ?auto_333546 - SURFACE
      ?auto_333548 - SURFACE
      ?auto_333547 - SURFACE
      ?auto_333549 - SURFACE
      ?auto_333550 - SURFACE
      ?auto_333551 - SURFACE
      ?auto_333552 - SURFACE
      ?auto_333553 - SURFACE
    )
    :vars
    (
      ?auto_333558 - HOIST
      ?auto_333557 - PLACE
      ?auto_333556 - TRUCK
      ?auto_333554 - PLACE
      ?auto_333555 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_333558 ?auto_333557 ) ( SURFACE-AT ?auto_333552 ?auto_333557 ) ( CLEAR ?auto_333552 ) ( IS-CRATE ?auto_333553 ) ( not ( = ?auto_333552 ?auto_333553 ) ) ( AVAILABLE ?auto_333558 ) ( ON ?auto_333552 ?auto_333551 ) ( not ( = ?auto_333551 ?auto_333552 ) ) ( not ( = ?auto_333551 ?auto_333553 ) ) ( TRUCK-AT ?auto_333556 ?auto_333554 ) ( not ( = ?auto_333554 ?auto_333557 ) ) ( HOIST-AT ?auto_333555 ?auto_333554 ) ( LIFTING ?auto_333555 ?auto_333553 ) ( not ( = ?auto_333558 ?auto_333555 ) ) ( ON ?auto_333545 ?auto_333544 ) ( ON ?auto_333546 ?auto_333545 ) ( ON ?auto_333548 ?auto_333546 ) ( ON ?auto_333547 ?auto_333548 ) ( ON ?auto_333549 ?auto_333547 ) ( ON ?auto_333550 ?auto_333549 ) ( ON ?auto_333551 ?auto_333550 ) ( not ( = ?auto_333544 ?auto_333545 ) ) ( not ( = ?auto_333544 ?auto_333546 ) ) ( not ( = ?auto_333544 ?auto_333548 ) ) ( not ( = ?auto_333544 ?auto_333547 ) ) ( not ( = ?auto_333544 ?auto_333549 ) ) ( not ( = ?auto_333544 ?auto_333550 ) ) ( not ( = ?auto_333544 ?auto_333551 ) ) ( not ( = ?auto_333544 ?auto_333552 ) ) ( not ( = ?auto_333544 ?auto_333553 ) ) ( not ( = ?auto_333545 ?auto_333546 ) ) ( not ( = ?auto_333545 ?auto_333548 ) ) ( not ( = ?auto_333545 ?auto_333547 ) ) ( not ( = ?auto_333545 ?auto_333549 ) ) ( not ( = ?auto_333545 ?auto_333550 ) ) ( not ( = ?auto_333545 ?auto_333551 ) ) ( not ( = ?auto_333545 ?auto_333552 ) ) ( not ( = ?auto_333545 ?auto_333553 ) ) ( not ( = ?auto_333546 ?auto_333548 ) ) ( not ( = ?auto_333546 ?auto_333547 ) ) ( not ( = ?auto_333546 ?auto_333549 ) ) ( not ( = ?auto_333546 ?auto_333550 ) ) ( not ( = ?auto_333546 ?auto_333551 ) ) ( not ( = ?auto_333546 ?auto_333552 ) ) ( not ( = ?auto_333546 ?auto_333553 ) ) ( not ( = ?auto_333548 ?auto_333547 ) ) ( not ( = ?auto_333548 ?auto_333549 ) ) ( not ( = ?auto_333548 ?auto_333550 ) ) ( not ( = ?auto_333548 ?auto_333551 ) ) ( not ( = ?auto_333548 ?auto_333552 ) ) ( not ( = ?auto_333548 ?auto_333553 ) ) ( not ( = ?auto_333547 ?auto_333549 ) ) ( not ( = ?auto_333547 ?auto_333550 ) ) ( not ( = ?auto_333547 ?auto_333551 ) ) ( not ( = ?auto_333547 ?auto_333552 ) ) ( not ( = ?auto_333547 ?auto_333553 ) ) ( not ( = ?auto_333549 ?auto_333550 ) ) ( not ( = ?auto_333549 ?auto_333551 ) ) ( not ( = ?auto_333549 ?auto_333552 ) ) ( not ( = ?auto_333549 ?auto_333553 ) ) ( not ( = ?auto_333550 ?auto_333551 ) ) ( not ( = ?auto_333550 ?auto_333552 ) ) ( not ( = ?auto_333550 ?auto_333553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333551 ?auto_333552 ?auto_333553 )
      ( MAKE-9CRATE-VERIFY ?auto_333544 ?auto_333545 ?auto_333546 ?auto_333548 ?auto_333547 ?auto_333549 ?auto_333550 ?auto_333551 ?auto_333552 ?auto_333553 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333652 - SURFACE
      ?auto_333653 - SURFACE
      ?auto_333654 - SURFACE
      ?auto_333656 - SURFACE
      ?auto_333655 - SURFACE
      ?auto_333657 - SURFACE
      ?auto_333658 - SURFACE
      ?auto_333659 - SURFACE
      ?auto_333660 - SURFACE
      ?auto_333661 - SURFACE
    )
    :vars
    (
      ?auto_333663 - HOIST
      ?auto_333667 - PLACE
      ?auto_333664 - TRUCK
      ?auto_333662 - PLACE
      ?auto_333665 - HOIST
      ?auto_333666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_333663 ?auto_333667 ) ( SURFACE-AT ?auto_333660 ?auto_333667 ) ( CLEAR ?auto_333660 ) ( IS-CRATE ?auto_333661 ) ( not ( = ?auto_333660 ?auto_333661 ) ) ( AVAILABLE ?auto_333663 ) ( ON ?auto_333660 ?auto_333659 ) ( not ( = ?auto_333659 ?auto_333660 ) ) ( not ( = ?auto_333659 ?auto_333661 ) ) ( TRUCK-AT ?auto_333664 ?auto_333662 ) ( not ( = ?auto_333662 ?auto_333667 ) ) ( HOIST-AT ?auto_333665 ?auto_333662 ) ( not ( = ?auto_333663 ?auto_333665 ) ) ( AVAILABLE ?auto_333665 ) ( SURFACE-AT ?auto_333661 ?auto_333662 ) ( ON ?auto_333661 ?auto_333666 ) ( CLEAR ?auto_333661 ) ( not ( = ?auto_333660 ?auto_333666 ) ) ( not ( = ?auto_333661 ?auto_333666 ) ) ( not ( = ?auto_333659 ?auto_333666 ) ) ( ON ?auto_333653 ?auto_333652 ) ( ON ?auto_333654 ?auto_333653 ) ( ON ?auto_333656 ?auto_333654 ) ( ON ?auto_333655 ?auto_333656 ) ( ON ?auto_333657 ?auto_333655 ) ( ON ?auto_333658 ?auto_333657 ) ( ON ?auto_333659 ?auto_333658 ) ( not ( = ?auto_333652 ?auto_333653 ) ) ( not ( = ?auto_333652 ?auto_333654 ) ) ( not ( = ?auto_333652 ?auto_333656 ) ) ( not ( = ?auto_333652 ?auto_333655 ) ) ( not ( = ?auto_333652 ?auto_333657 ) ) ( not ( = ?auto_333652 ?auto_333658 ) ) ( not ( = ?auto_333652 ?auto_333659 ) ) ( not ( = ?auto_333652 ?auto_333660 ) ) ( not ( = ?auto_333652 ?auto_333661 ) ) ( not ( = ?auto_333652 ?auto_333666 ) ) ( not ( = ?auto_333653 ?auto_333654 ) ) ( not ( = ?auto_333653 ?auto_333656 ) ) ( not ( = ?auto_333653 ?auto_333655 ) ) ( not ( = ?auto_333653 ?auto_333657 ) ) ( not ( = ?auto_333653 ?auto_333658 ) ) ( not ( = ?auto_333653 ?auto_333659 ) ) ( not ( = ?auto_333653 ?auto_333660 ) ) ( not ( = ?auto_333653 ?auto_333661 ) ) ( not ( = ?auto_333653 ?auto_333666 ) ) ( not ( = ?auto_333654 ?auto_333656 ) ) ( not ( = ?auto_333654 ?auto_333655 ) ) ( not ( = ?auto_333654 ?auto_333657 ) ) ( not ( = ?auto_333654 ?auto_333658 ) ) ( not ( = ?auto_333654 ?auto_333659 ) ) ( not ( = ?auto_333654 ?auto_333660 ) ) ( not ( = ?auto_333654 ?auto_333661 ) ) ( not ( = ?auto_333654 ?auto_333666 ) ) ( not ( = ?auto_333656 ?auto_333655 ) ) ( not ( = ?auto_333656 ?auto_333657 ) ) ( not ( = ?auto_333656 ?auto_333658 ) ) ( not ( = ?auto_333656 ?auto_333659 ) ) ( not ( = ?auto_333656 ?auto_333660 ) ) ( not ( = ?auto_333656 ?auto_333661 ) ) ( not ( = ?auto_333656 ?auto_333666 ) ) ( not ( = ?auto_333655 ?auto_333657 ) ) ( not ( = ?auto_333655 ?auto_333658 ) ) ( not ( = ?auto_333655 ?auto_333659 ) ) ( not ( = ?auto_333655 ?auto_333660 ) ) ( not ( = ?auto_333655 ?auto_333661 ) ) ( not ( = ?auto_333655 ?auto_333666 ) ) ( not ( = ?auto_333657 ?auto_333658 ) ) ( not ( = ?auto_333657 ?auto_333659 ) ) ( not ( = ?auto_333657 ?auto_333660 ) ) ( not ( = ?auto_333657 ?auto_333661 ) ) ( not ( = ?auto_333657 ?auto_333666 ) ) ( not ( = ?auto_333658 ?auto_333659 ) ) ( not ( = ?auto_333658 ?auto_333660 ) ) ( not ( = ?auto_333658 ?auto_333661 ) ) ( not ( = ?auto_333658 ?auto_333666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333659 ?auto_333660 ?auto_333661 )
      ( MAKE-9CRATE-VERIFY ?auto_333652 ?auto_333653 ?auto_333654 ?auto_333656 ?auto_333655 ?auto_333657 ?auto_333658 ?auto_333659 ?auto_333660 ?auto_333661 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333761 - SURFACE
      ?auto_333762 - SURFACE
      ?auto_333763 - SURFACE
      ?auto_333765 - SURFACE
      ?auto_333764 - SURFACE
      ?auto_333766 - SURFACE
      ?auto_333767 - SURFACE
      ?auto_333768 - SURFACE
      ?auto_333769 - SURFACE
      ?auto_333770 - SURFACE
    )
    :vars
    (
      ?auto_333771 - HOIST
      ?auto_333774 - PLACE
      ?auto_333775 - PLACE
      ?auto_333773 - HOIST
      ?auto_333772 - SURFACE
      ?auto_333776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_333771 ?auto_333774 ) ( SURFACE-AT ?auto_333769 ?auto_333774 ) ( CLEAR ?auto_333769 ) ( IS-CRATE ?auto_333770 ) ( not ( = ?auto_333769 ?auto_333770 ) ) ( AVAILABLE ?auto_333771 ) ( ON ?auto_333769 ?auto_333768 ) ( not ( = ?auto_333768 ?auto_333769 ) ) ( not ( = ?auto_333768 ?auto_333770 ) ) ( not ( = ?auto_333775 ?auto_333774 ) ) ( HOIST-AT ?auto_333773 ?auto_333775 ) ( not ( = ?auto_333771 ?auto_333773 ) ) ( AVAILABLE ?auto_333773 ) ( SURFACE-AT ?auto_333770 ?auto_333775 ) ( ON ?auto_333770 ?auto_333772 ) ( CLEAR ?auto_333770 ) ( not ( = ?auto_333769 ?auto_333772 ) ) ( not ( = ?auto_333770 ?auto_333772 ) ) ( not ( = ?auto_333768 ?auto_333772 ) ) ( TRUCK-AT ?auto_333776 ?auto_333774 ) ( ON ?auto_333762 ?auto_333761 ) ( ON ?auto_333763 ?auto_333762 ) ( ON ?auto_333765 ?auto_333763 ) ( ON ?auto_333764 ?auto_333765 ) ( ON ?auto_333766 ?auto_333764 ) ( ON ?auto_333767 ?auto_333766 ) ( ON ?auto_333768 ?auto_333767 ) ( not ( = ?auto_333761 ?auto_333762 ) ) ( not ( = ?auto_333761 ?auto_333763 ) ) ( not ( = ?auto_333761 ?auto_333765 ) ) ( not ( = ?auto_333761 ?auto_333764 ) ) ( not ( = ?auto_333761 ?auto_333766 ) ) ( not ( = ?auto_333761 ?auto_333767 ) ) ( not ( = ?auto_333761 ?auto_333768 ) ) ( not ( = ?auto_333761 ?auto_333769 ) ) ( not ( = ?auto_333761 ?auto_333770 ) ) ( not ( = ?auto_333761 ?auto_333772 ) ) ( not ( = ?auto_333762 ?auto_333763 ) ) ( not ( = ?auto_333762 ?auto_333765 ) ) ( not ( = ?auto_333762 ?auto_333764 ) ) ( not ( = ?auto_333762 ?auto_333766 ) ) ( not ( = ?auto_333762 ?auto_333767 ) ) ( not ( = ?auto_333762 ?auto_333768 ) ) ( not ( = ?auto_333762 ?auto_333769 ) ) ( not ( = ?auto_333762 ?auto_333770 ) ) ( not ( = ?auto_333762 ?auto_333772 ) ) ( not ( = ?auto_333763 ?auto_333765 ) ) ( not ( = ?auto_333763 ?auto_333764 ) ) ( not ( = ?auto_333763 ?auto_333766 ) ) ( not ( = ?auto_333763 ?auto_333767 ) ) ( not ( = ?auto_333763 ?auto_333768 ) ) ( not ( = ?auto_333763 ?auto_333769 ) ) ( not ( = ?auto_333763 ?auto_333770 ) ) ( not ( = ?auto_333763 ?auto_333772 ) ) ( not ( = ?auto_333765 ?auto_333764 ) ) ( not ( = ?auto_333765 ?auto_333766 ) ) ( not ( = ?auto_333765 ?auto_333767 ) ) ( not ( = ?auto_333765 ?auto_333768 ) ) ( not ( = ?auto_333765 ?auto_333769 ) ) ( not ( = ?auto_333765 ?auto_333770 ) ) ( not ( = ?auto_333765 ?auto_333772 ) ) ( not ( = ?auto_333764 ?auto_333766 ) ) ( not ( = ?auto_333764 ?auto_333767 ) ) ( not ( = ?auto_333764 ?auto_333768 ) ) ( not ( = ?auto_333764 ?auto_333769 ) ) ( not ( = ?auto_333764 ?auto_333770 ) ) ( not ( = ?auto_333764 ?auto_333772 ) ) ( not ( = ?auto_333766 ?auto_333767 ) ) ( not ( = ?auto_333766 ?auto_333768 ) ) ( not ( = ?auto_333766 ?auto_333769 ) ) ( not ( = ?auto_333766 ?auto_333770 ) ) ( not ( = ?auto_333766 ?auto_333772 ) ) ( not ( = ?auto_333767 ?auto_333768 ) ) ( not ( = ?auto_333767 ?auto_333769 ) ) ( not ( = ?auto_333767 ?auto_333770 ) ) ( not ( = ?auto_333767 ?auto_333772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333768 ?auto_333769 ?auto_333770 )
      ( MAKE-9CRATE-VERIFY ?auto_333761 ?auto_333762 ?auto_333763 ?auto_333765 ?auto_333764 ?auto_333766 ?auto_333767 ?auto_333768 ?auto_333769 ?auto_333770 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333870 - SURFACE
      ?auto_333871 - SURFACE
      ?auto_333872 - SURFACE
      ?auto_333874 - SURFACE
      ?auto_333873 - SURFACE
      ?auto_333875 - SURFACE
      ?auto_333876 - SURFACE
      ?auto_333877 - SURFACE
      ?auto_333878 - SURFACE
      ?auto_333879 - SURFACE
    )
    :vars
    (
      ?auto_333881 - HOIST
      ?auto_333883 - PLACE
      ?auto_333882 - PLACE
      ?auto_333884 - HOIST
      ?auto_333880 - SURFACE
      ?auto_333885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_333881 ?auto_333883 ) ( IS-CRATE ?auto_333879 ) ( not ( = ?auto_333878 ?auto_333879 ) ) ( not ( = ?auto_333877 ?auto_333878 ) ) ( not ( = ?auto_333877 ?auto_333879 ) ) ( not ( = ?auto_333882 ?auto_333883 ) ) ( HOIST-AT ?auto_333884 ?auto_333882 ) ( not ( = ?auto_333881 ?auto_333884 ) ) ( AVAILABLE ?auto_333884 ) ( SURFACE-AT ?auto_333879 ?auto_333882 ) ( ON ?auto_333879 ?auto_333880 ) ( CLEAR ?auto_333879 ) ( not ( = ?auto_333878 ?auto_333880 ) ) ( not ( = ?auto_333879 ?auto_333880 ) ) ( not ( = ?auto_333877 ?auto_333880 ) ) ( TRUCK-AT ?auto_333885 ?auto_333883 ) ( SURFACE-AT ?auto_333877 ?auto_333883 ) ( CLEAR ?auto_333877 ) ( LIFTING ?auto_333881 ?auto_333878 ) ( IS-CRATE ?auto_333878 ) ( ON ?auto_333871 ?auto_333870 ) ( ON ?auto_333872 ?auto_333871 ) ( ON ?auto_333874 ?auto_333872 ) ( ON ?auto_333873 ?auto_333874 ) ( ON ?auto_333875 ?auto_333873 ) ( ON ?auto_333876 ?auto_333875 ) ( ON ?auto_333877 ?auto_333876 ) ( not ( = ?auto_333870 ?auto_333871 ) ) ( not ( = ?auto_333870 ?auto_333872 ) ) ( not ( = ?auto_333870 ?auto_333874 ) ) ( not ( = ?auto_333870 ?auto_333873 ) ) ( not ( = ?auto_333870 ?auto_333875 ) ) ( not ( = ?auto_333870 ?auto_333876 ) ) ( not ( = ?auto_333870 ?auto_333877 ) ) ( not ( = ?auto_333870 ?auto_333878 ) ) ( not ( = ?auto_333870 ?auto_333879 ) ) ( not ( = ?auto_333870 ?auto_333880 ) ) ( not ( = ?auto_333871 ?auto_333872 ) ) ( not ( = ?auto_333871 ?auto_333874 ) ) ( not ( = ?auto_333871 ?auto_333873 ) ) ( not ( = ?auto_333871 ?auto_333875 ) ) ( not ( = ?auto_333871 ?auto_333876 ) ) ( not ( = ?auto_333871 ?auto_333877 ) ) ( not ( = ?auto_333871 ?auto_333878 ) ) ( not ( = ?auto_333871 ?auto_333879 ) ) ( not ( = ?auto_333871 ?auto_333880 ) ) ( not ( = ?auto_333872 ?auto_333874 ) ) ( not ( = ?auto_333872 ?auto_333873 ) ) ( not ( = ?auto_333872 ?auto_333875 ) ) ( not ( = ?auto_333872 ?auto_333876 ) ) ( not ( = ?auto_333872 ?auto_333877 ) ) ( not ( = ?auto_333872 ?auto_333878 ) ) ( not ( = ?auto_333872 ?auto_333879 ) ) ( not ( = ?auto_333872 ?auto_333880 ) ) ( not ( = ?auto_333874 ?auto_333873 ) ) ( not ( = ?auto_333874 ?auto_333875 ) ) ( not ( = ?auto_333874 ?auto_333876 ) ) ( not ( = ?auto_333874 ?auto_333877 ) ) ( not ( = ?auto_333874 ?auto_333878 ) ) ( not ( = ?auto_333874 ?auto_333879 ) ) ( not ( = ?auto_333874 ?auto_333880 ) ) ( not ( = ?auto_333873 ?auto_333875 ) ) ( not ( = ?auto_333873 ?auto_333876 ) ) ( not ( = ?auto_333873 ?auto_333877 ) ) ( not ( = ?auto_333873 ?auto_333878 ) ) ( not ( = ?auto_333873 ?auto_333879 ) ) ( not ( = ?auto_333873 ?auto_333880 ) ) ( not ( = ?auto_333875 ?auto_333876 ) ) ( not ( = ?auto_333875 ?auto_333877 ) ) ( not ( = ?auto_333875 ?auto_333878 ) ) ( not ( = ?auto_333875 ?auto_333879 ) ) ( not ( = ?auto_333875 ?auto_333880 ) ) ( not ( = ?auto_333876 ?auto_333877 ) ) ( not ( = ?auto_333876 ?auto_333878 ) ) ( not ( = ?auto_333876 ?auto_333879 ) ) ( not ( = ?auto_333876 ?auto_333880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333877 ?auto_333878 ?auto_333879 )
      ( MAKE-9CRATE-VERIFY ?auto_333870 ?auto_333871 ?auto_333872 ?auto_333874 ?auto_333873 ?auto_333875 ?auto_333876 ?auto_333877 ?auto_333878 ?auto_333879 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_333979 - SURFACE
      ?auto_333980 - SURFACE
      ?auto_333981 - SURFACE
      ?auto_333983 - SURFACE
      ?auto_333982 - SURFACE
      ?auto_333984 - SURFACE
      ?auto_333985 - SURFACE
      ?auto_333986 - SURFACE
      ?auto_333987 - SURFACE
      ?auto_333988 - SURFACE
    )
    :vars
    (
      ?auto_333989 - HOIST
      ?auto_333991 - PLACE
      ?auto_333990 - PLACE
      ?auto_333994 - HOIST
      ?auto_333992 - SURFACE
      ?auto_333993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_333989 ?auto_333991 ) ( IS-CRATE ?auto_333988 ) ( not ( = ?auto_333987 ?auto_333988 ) ) ( not ( = ?auto_333986 ?auto_333987 ) ) ( not ( = ?auto_333986 ?auto_333988 ) ) ( not ( = ?auto_333990 ?auto_333991 ) ) ( HOIST-AT ?auto_333994 ?auto_333990 ) ( not ( = ?auto_333989 ?auto_333994 ) ) ( AVAILABLE ?auto_333994 ) ( SURFACE-AT ?auto_333988 ?auto_333990 ) ( ON ?auto_333988 ?auto_333992 ) ( CLEAR ?auto_333988 ) ( not ( = ?auto_333987 ?auto_333992 ) ) ( not ( = ?auto_333988 ?auto_333992 ) ) ( not ( = ?auto_333986 ?auto_333992 ) ) ( TRUCK-AT ?auto_333993 ?auto_333991 ) ( SURFACE-AT ?auto_333986 ?auto_333991 ) ( CLEAR ?auto_333986 ) ( IS-CRATE ?auto_333987 ) ( AVAILABLE ?auto_333989 ) ( IN ?auto_333987 ?auto_333993 ) ( ON ?auto_333980 ?auto_333979 ) ( ON ?auto_333981 ?auto_333980 ) ( ON ?auto_333983 ?auto_333981 ) ( ON ?auto_333982 ?auto_333983 ) ( ON ?auto_333984 ?auto_333982 ) ( ON ?auto_333985 ?auto_333984 ) ( ON ?auto_333986 ?auto_333985 ) ( not ( = ?auto_333979 ?auto_333980 ) ) ( not ( = ?auto_333979 ?auto_333981 ) ) ( not ( = ?auto_333979 ?auto_333983 ) ) ( not ( = ?auto_333979 ?auto_333982 ) ) ( not ( = ?auto_333979 ?auto_333984 ) ) ( not ( = ?auto_333979 ?auto_333985 ) ) ( not ( = ?auto_333979 ?auto_333986 ) ) ( not ( = ?auto_333979 ?auto_333987 ) ) ( not ( = ?auto_333979 ?auto_333988 ) ) ( not ( = ?auto_333979 ?auto_333992 ) ) ( not ( = ?auto_333980 ?auto_333981 ) ) ( not ( = ?auto_333980 ?auto_333983 ) ) ( not ( = ?auto_333980 ?auto_333982 ) ) ( not ( = ?auto_333980 ?auto_333984 ) ) ( not ( = ?auto_333980 ?auto_333985 ) ) ( not ( = ?auto_333980 ?auto_333986 ) ) ( not ( = ?auto_333980 ?auto_333987 ) ) ( not ( = ?auto_333980 ?auto_333988 ) ) ( not ( = ?auto_333980 ?auto_333992 ) ) ( not ( = ?auto_333981 ?auto_333983 ) ) ( not ( = ?auto_333981 ?auto_333982 ) ) ( not ( = ?auto_333981 ?auto_333984 ) ) ( not ( = ?auto_333981 ?auto_333985 ) ) ( not ( = ?auto_333981 ?auto_333986 ) ) ( not ( = ?auto_333981 ?auto_333987 ) ) ( not ( = ?auto_333981 ?auto_333988 ) ) ( not ( = ?auto_333981 ?auto_333992 ) ) ( not ( = ?auto_333983 ?auto_333982 ) ) ( not ( = ?auto_333983 ?auto_333984 ) ) ( not ( = ?auto_333983 ?auto_333985 ) ) ( not ( = ?auto_333983 ?auto_333986 ) ) ( not ( = ?auto_333983 ?auto_333987 ) ) ( not ( = ?auto_333983 ?auto_333988 ) ) ( not ( = ?auto_333983 ?auto_333992 ) ) ( not ( = ?auto_333982 ?auto_333984 ) ) ( not ( = ?auto_333982 ?auto_333985 ) ) ( not ( = ?auto_333982 ?auto_333986 ) ) ( not ( = ?auto_333982 ?auto_333987 ) ) ( not ( = ?auto_333982 ?auto_333988 ) ) ( not ( = ?auto_333982 ?auto_333992 ) ) ( not ( = ?auto_333984 ?auto_333985 ) ) ( not ( = ?auto_333984 ?auto_333986 ) ) ( not ( = ?auto_333984 ?auto_333987 ) ) ( not ( = ?auto_333984 ?auto_333988 ) ) ( not ( = ?auto_333984 ?auto_333992 ) ) ( not ( = ?auto_333985 ?auto_333986 ) ) ( not ( = ?auto_333985 ?auto_333987 ) ) ( not ( = ?auto_333985 ?auto_333988 ) ) ( not ( = ?auto_333985 ?auto_333992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_333986 ?auto_333987 ?auto_333988 )
      ( MAKE-9CRATE-VERIFY ?auto_333979 ?auto_333980 ?auto_333981 ?auto_333983 ?auto_333982 ?auto_333984 ?auto_333985 ?auto_333986 ?auto_333987 ?auto_333988 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339492 - SURFACE
      ?auto_339493 - SURFACE
      ?auto_339494 - SURFACE
      ?auto_339496 - SURFACE
      ?auto_339495 - SURFACE
      ?auto_339497 - SURFACE
      ?auto_339498 - SURFACE
      ?auto_339499 - SURFACE
      ?auto_339500 - SURFACE
      ?auto_339501 - SURFACE
      ?auto_339502 - SURFACE
    )
    :vars
    (
      ?auto_339504 - HOIST
      ?auto_339503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_339504 ?auto_339503 ) ( SURFACE-AT ?auto_339501 ?auto_339503 ) ( CLEAR ?auto_339501 ) ( LIFTING ?auto_339504 ?auto_339502 ) ( IS-CRATE ?auto_339502 ) ( not ( = ?auto_339501 ?auto_339502 ) ) ( ON ?auto_339493 ?auto_339492 ) ( ON ?auto_339494 ?auto_339493 ) ( ON ?auto_339496 ?auto_339494 ) ( ON ?auto_339495 ?auto_339496 ) ( ON ?auto_339497 ?auto_339495 ) ( ON ?auto_339498 ?auto_339497 ) ( ON ?auto_339499 ?auto_339498 ) ( ON ?auto_339500 ?auto_339499 ) ( ON ?auto_339501 ?auto_339500 ) ( not ( = ?auto_339492 ?auto_339493 ) ) ( not ( = ?auto_339492 ?auto_339494 ) ) ( not ( = ?auto_339492 ?auto_339496 ) ) ( not ( = ?auto_339492 ?auto_339495 ) ) ( not ( = ?auto_339492 ?auto_339497 ) ) ( not ( = ?auto_339492 ?auto_339498 ) ) ( not ( = ?auto_339492 ?auto_339499 ) ) ( not ( = ?auto_339492 ?auto_339500 ) ) ( not ( = ?auto_339492 ?auto_339501 ) ) ( not ( = ?auto_339492 ?auto_339502 ) ) ( not ( = ?auto_339493 ?auto_339494 ) ) ( not ( = ?auto_339493 ?auto_339496 ) ) ( not ( = ?auto_339493 ?auto_339495 ) ) ( not ( = ?auto_339493 ?auto_339497 ) ) ( not ( = ?auto_339493 ?auto_339498 ) ) ( not ( = ?auto_339493 ?auto_339499 ) ) ( not ( = ?auto_339493 ?auto_339500 ) ) ( not ( = ?auto_339493 ?auto_339501 ) ) ( not ( = ?auto_339493 ?auto_339502 ) ) ( not ( = ?auto_339494 ?auto_339496 ) ) ( not ( = ?auto_339494 ?auto_339495 ) ) ( not ( = ?auto_339494 ?auto_339497 ) ) ( not ( = ?auto_339494 ?auto_339498 ) ) ( not ( = ?auto_339494 ?auto_339499 ) ) ( not ( = ?auto_339494 ?auto_339500 ) ) ( not ( = ?auto_339494 ?auto_339501 ) ) ( not ( = ?auto_339494 ?auto_339502 ) ) ( not ( = ?auto_339496 ?auto_339495 ) ) ( not ( = ?auto_339496 ?auto_339497 ) ) ( not ( = ?auto_339496 ?auto_339498 ) ) ( not ( = ?auto_339496 ?auto_339499 ) ) ( not ( = ?auto_339496 ?auto_339500 ) ) ( not ( = ?auto_339496 ?auto_339501 ) ) ( not ( = ?auto_339496 ?auto_339502 ) ) ( not ( = ?auto_339495 ?auto_339497 ) ) ( not ( = ?auto_339495 ?auto_339498 ) ) ( not ( = ?auto_339495 ?auto_339499 ) ) ( not ( = ?auto_339495 ?auto_339500 ) ) ( not ( = ?auto_339495 ?auto_339501 ) ) ( not ( = ?auto_339495 ?auto_339502 ) ) ( not ( = ?auto_339497 ?auto_339498 ) ) ( not ( = ?auto_339497 ?auto_339499 ) ) ( not ( = ?auto_339497 ?auto_339500 ) ) ( not ( = ?auto_339497 ?auto_339501 ) ) ( not ( = ?auto_339497 ?auto_339502 ) ) ( not ( = ?auto_339498 ?auto_339499 ) ) ( not ( = ?auto_339498 ?auto_339500 ) ) ( not ( = ?auto_339498 ?auto_339501 ) ) ( not ( = ?auto_339498 ?auto_339502 ) ) ( not ( = ?auto_339499 ?auto_339500 ) ) ( not ( = ?auto_339499 ?auto_339501 ) ) ( not ( = ?auto_339499 ?auto_339502 ) ) ( not ( = ?auto_339500 ?auto_339501 ) ) ( not ( = ?auto_339500 ?auto_339502 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_339501 ?auto_339502 )
      ( MAKE-10CRATE-VERIFY ?auto_339492 ?auto_339493 ?auto_339494 ?auto_339496 ?auto_339495 ?auto_339497 ?auto_339498 ?auto_339499 ?auto_339500 ?auto_339501 ?auto_339502 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339586 - SURFACE
      ?auto_339587 - SURFACE
      ?auto_339588 - SURFACE
      ?auto_339590 - SURFACE
      ?auto_339589 - SURFACE
      ?auto_339591 - SURFACE
      ?auto_339592 - SURFACE
      ?auto_339593 - SURFACE
      ?auto_339594 - SURFACE
      ?auto_339595 - SURFACE
      ?auto_339596 - SURFACE
    )
    :vars
    (
      ?auto_339597 - HOIST
      ?auto_339598 - PLACE
      ?auto_339599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_339597 ?auto_339598 ) ( SURFACE-AT ?auto_339595 ?auto_339598 ) ( CLEAR ?auto_339595 ) ( IS-CRATE ?auto_339596 ) ( not ( = ?auto_339595 ?auto_339596 ) ) ( TRUCK-AT ?auto_339599 ?auto_339598 ) ( AVAILABLE ?auto_339597 ) ( IN ?auto_339596 ?auto_339599 ) ( ON ?auto_339595 ?auto_339594 ) ( not ( = ?auto_339594 ?auto_339595 ) ) ( not ( = ?auto_339594 ?auto_339596 ) ) ( ON ?auto_339587 ?auto_339586 ) ( ON ?auto_339588 ?auto_339587 ) ( ON ?auto_339590 ?auto_339588 ) ( ON ?auto_339589 ?auto_339590 ) ( ON ?auto_339591 ?auto_339589 ) ( ON ?auto_339592 ?auto_339591 ) ( ON ?auto_339593 ?auto_339592 ) ( ON ?auto_339594 ?auto_339593 ) ( not ( = ?auto_339586 ?auto_339587 ) ) ( not ( = ?auto_339586 ?auto_339588 ) ) ( not ( = ?auto_339586 ?auto_339590 ) ) ( not ( = ?auto_339586 ?auto_339589 ) ) ( not ( = ?auto_339586 ?auto_339591 ) ) ( not ( = ?auto_339586 ?auto_339592 ) ) ( not ( = ?auto_339586 ?auto_339593 ) ) ( not ( = ?auto_339586 ?auto_339594 ) ) ( not ( = ?auto_339586 ?auto_339595 ) ) ( not ( = ?auto_339586 ?auto_339596 ) ) ( not ( = ?auto_339587 ?auto_339588 ) ) ( not ( = ?auto_339587 ?auto_339590 ) ) ( not ( = ?auto_339587 ?auto_339589 ) ) ( not ( = ?auto_339587 ?auto_339591 ) ) ( not ( = ?auto_339587 ?auto_339592 ) ) ( not ( = ?auto_339587 ?auto_339593 ) ) ( not ( = ?auto_339587 ?auto_339594 ) ) ( not ( = ?auto_339587 ?auto_339595 ) ) ( not ( = ?auto_339587 ?auto_339596 ) ) ( not ( = ?auto_339588 ?auto_339590 ) ) ( not ( = ?auto_339588 ?auto_339589 ) ) ( not ( = ?auto_339588 ?auto_339591 ) ) ( not ( = ?auto_339588 ?auto_339592 ) ) ( not ( = ?auto_339588 ?auto_339593 ) ) ( not ( = ?auto_339588 ?auto_339594 ) ) ( not ( = ?auto_339588 ?auto_339595 ) ) ( not ( = ?auto_339588 ?auto_339596 ) ) ( not ( = ?auto_339590 ?auto_339589 ) ) ( not ( = ?auto_339590 ?auto_339591 ) ) ( not ( = ?auto_339590 ?auto_339592 ) ) ( not ( = ?auto_339590 ?auto_339593 ) ) ( not ( = ?auto_339590 ?auto_339594 ) ) ( not ( = ?auto_339590 ?auto_339595 ) ) ( not ( = ?auto_339590 ?auto_339596 ) ) ( not ( = ?auto_339589 ?auto_339591 ) ) ( not ( = ?auto_339589 ?auto_339592 ) ) ( not ( = ?auto_339589 ?auto_339593 ) ) ( not ( = ?auto_339589 ?auto_339594 ) ) ( not ( = ?auto_339589 ?auto_339595 ) ) ( not ( = ?auto_339589 ?auto_339596 ) ) ( not ( = ?auto_339591 ?auto_339592 ) ) ( not ( = ?auto_339591 ?auto_339593 ) ) ( not ( = ?auto_339591 ?auto_339594 ) ) ( not ( = ?auto_339591 ?auto_339595 ) ) ( not ( = ?auto_339591 ?auto_339596 ) ) ( not ( = ?auto_339592 ?auto_339593 ) ) ( not ( = ?auto_339592 ?auto_339594 ) ) ( not ( = ?auto_339592 ?auto_339595 ) ) ( not ( = ?auto_339592 ?auto_339596 ) ) ( not ( = ?auto_339593 ?auto_339594 ) ) ( not ( = ?auto_339593 ?auto_339595 ) ) ( not ( = ?auto_339593 ?auto_339596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_339594 ?auto_339595 ?auto_339596 )
      ( MAKE-10CRATE-VERIFY ?auto_339586 ?auto_339587 ?auto_339588 ?auto_339590 ?auto_339589 ?auto_339591 ?auto_339592 ?auto_339593 ?auto_339594 ?auto_339595 ?auto_339596 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339691 - SURFACE
      ?auto_339692 - SURFACE
      ?auto_339693 - SURFACE
      ?auto_339695 - SURFACE
      ?auto_339694 - SURFACE
      ?auto_339696 - SURFACE
      ?auto_339697 - SURFACE
      ?auto_339698 - SURFACE
      ?auto_339699 - SURFACE
      ?auto_339700 - SURFACE
      ?auto_339701 - SURFACE
    )
    :vars
    (
      ?auto_339702 - HOIST
      ?auto_339704 - PLACE
      ?auto_339705 - TRUCK
      ?auto_339703 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_339702 ?auto_339704 ) ( SURFACE-AT ?auto_339700 ?auto_339704 ) ( CLEAR ?auto_339700 ) ( IS-CRATE ?auto_339701 ) ( not ( = ?auto_339700 ?auto_339701 ) ) ( AVAILABLE ?auto_339702 ) ( IN ?auto_339701 ?auto_339705 ) ( ON ?auto_339700 ?auto_339699 ) ( not ( = ?auto_339699 ?auto_339700 ) ) ( not ( = ?auto_339699 ?auto_339701 ) ) ( TRUCK-AT ?auto_339705 ?auto_339703 ) ( not ( = ?auto_339703 ?auto_339704 ) ) ( ON ?auto_339692 ?auto_339691 ) ( ON ?auto_339693 ?auto_339692 ) ( ON ?auto_339695 ?auto_339693 ) ( ON ?auto_339694 ?auto_339695 ) ( ON ?auto_339696 ?auto_339694 ) ( ON ?auto_339697 ?auto_339696 ) ( ON ?auto_339698 ?auto_339697 ) ( ON ?auto_339699 ?auto_339698 ) ( not ( = ?auto_339691 ?auto_339692 ) ) ( not ( = ?auto_339691 ?auto_339693 ) ) ( not ( = ?auto_339691 ?auto_339695 ) ) ( not ( = ?auto_339691 ?auto_339694 ) ) ( not ( = ?auto_339691 ?auto_339696 ) ) ( not ( = ?auto_339691 ?auto_339697 ) ) ( not ( = ?auto_339691 ?auto_339698 ) ) ( not ( = ?auto_339691 ?auto_339699 ) ) ( not ( = ?auto_339691 ?auto_339700 ) ) ( not ( = ?auto_339691 ?auto_339701 ) ) ( not ( = ?auto_339692 ?auto_339693 ) ) ( not ( = ?auto_339692 ?auto_339695 ) ) ( not ( = ?auto_339692 ?auto_339694 ) ) ( not ( = ?auto_339692 ?auto_339696 ) ) ( not ( = ?auto_339692 ?auto_339697 ) ) ( not ( = ?auto_339692 ?auto_339698 ) ) ( not ( = ?auto_339692 ?auto_339699 ) ) ( not ( = ?auto_339692 ?auto_339700 ) ) ( not ( = ?auto_339692 ?auto_339701 ) ) ( not ( = ?auto_339693 ?auto_339695 ) ) ( not ( = ?auto_339693 ?auto_339694 ) ) ( not ( = ?auto_339693 ?auto_339696 ) ) ( not ( = ?auto_339693 ?auto_339697 ) ) ( not ( = ?auto_339693 ?auto_339698 ) ) ( not ( = ?auto_339693 ?auto_339699 ) ) ( not ( = ?auto_339693 ?auto_339700 ) ) ( not ( = ?auto_339693 ?auto_339701 ) ) ( not ( = ?auto_339695 ?auto_339694 ) ) ( not ( = ?auto_339695 ?auto_339696 ) ) ( not ( = ?auto_339695 ?auto_339697 ) ) ( not ( = ?auto_339695 ?auto_339698 ) ) ( not ( = ?auto_339695 ?auto_339699 ) ) ( not ( = ?auto_339695 ?auto_339700 ) ) ( not ( = ?auto_339695 ?auto_339701 ) ) ( not ( = ?auto_339694 ?auto_339696 ) ) ( not ( = ?auto_339694 ?auto_339697 ) ) ( not ( = ?auto_339694 ?auto_339698 ) ) ( not ( = ?auto_339694 ?auto_339699 ) ) ( not ( = ?auto_339694 ?auto_339700 ) ) ( not ( = ?auto_339694 ?auto_339701 ) ) ( not ( = ?auto_339696 ?auto_339697 ) ) ( not ( = ?auto_339696 ?auto_339698 ) ) ( not ( = ?auto_339696 ?auto_339699 ) ) ( not ( = ?auto_339696 ?auto_339700 ) ) ( not ( = ?auto_339696 ?auto_339701 ) ) ( not ( = ?auto_339697 ?auto_339698 ) ) ( not ( = ?auto_339697 ?auto_339699 ) ) ( not ( = ?auto_339697 ?auto_339700 ) ) ( not ( = ?auto_339697 ?auto_339701 ) ) ( not ( = ?auto_339698 ?auto_339699 ) ) ( not ( = ?auto_339698 ?auto_339700 ) ) ( not ( = ?auto_339698 ?auto_339701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_339699 ?auto_339700 ?auto_339701 )
      ( MAKE-10CRATE-VERIFY ?auto_339691 ?auto_339692 ?auto_339693 ?auto_339695 ?auto_339694 ?auto_339696 ?auto_339697 ?auto_339698 ?auto_339699 ?auto_339700 ?auto_339701 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339806 - SURFACE
      ?auto_339807 - SURFACE
      ?auto_339808 - SURFACE
      ?auto_339810 - SURFACE
      ?auto_339809 - SURFACE
      ?auto_339811 - SURFACE
      ?auto_339812 - SURFACE
      ?auto_339813 - SURFACE
      ?auto_339814 - SURFACE
      ?auto_339815 - SURFACE
      ?auto_339816 - SURFACE
    )
    :vars
    (
      ?auto_339820 - HOIST
      ?auto_339819 - PLACE
      ?auto_339821 - TRUCK
      ?auto_339817 - PLACE
      ?auto_339818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_339820 ?auto_339819 ) ( SURFACE-AT ?auto_339815 ?auto_339819 ) ( CLEAR ?auto_339815 ) ( IS-CRATE ?auto_339816 ) ( not ( = ?auto_339815 ?auto_339816 ) ) ( AVAILABLE ?auto_339820 ) ( ON ?auto_339815 ?auto_339814 ) ( not ( = ?auto_339814 ?auto_339815 ) ) ( not ( = ?auto_339814 ?auto_339816 ) ) ( TRUCK-AT ?auto_339821 ?auto_339817 ) ( not ( = ?auto_339817 ?auto_339819 ) ) ( HOIST-AT ?auto_339818 ?auto_339817 ) ( LIFTING ?auto_339818 ?auto_339816 ) ( not ( = ?auto_339820 ?auto_339818 ) ) ( ON ?auto_339807 ?auto_339806 ) ( ON ?auto_339808 ?auto_339807 ) ( ON ?auto_339810 ?auto_339808 ) ( ON ?auto_339809 ?auto_339810 ) ( ON ?auto_339811 ?auto_339809 ) ( ON ?auto_339812 ?auto_339811 ) ( ON ?auto_339813 ?auto_339812 ) ( ON ?auto_339814 ?auto_339813 ) ( not ( = ?auto_339806 ?auto_339807 ) ) ( not ( = ?auto_339806 ?auto_339808 ) ) ( not ( = ?auto_339806 ?auto_339810 ) ) ( not ( = ?auto_339806 ?auto_339809 ) ) ( not ( = ?auto_339806 ?auto_339811 ) ) ( not ( = ?auto_339806 ?auto_339812 ) ) ( not ( = ?auto_339806 ?auto_339813 ) ) ( not ( = ?auto_339806 ?auto_339814 ) ) ( not ( = ?auto_339806 ?auto_339815 ) ) ( not ( = ?auto_339806 ?auto_339816 ) ) ( not ( = ?auto_339807 ?auto_339808 ) ) ( not ( = ?auto_339807 ?auto_339810 ) ) ( not ( = ?auto_339807 ?auto_339809 ) ) ( not ( = ?auto_339807 ?auto_339811 ) ) ( not ( = ?auto_339807 ?auto_339812 ) ) ( not ( = ?auto_339807 ?auto_339813 ) ) ( not ( = ?auto_339807 ?auto_339814 ) ) ( not ( = ?auto_339807 ?auto_339815 ) ) ( not ( = ?auto_339807 ?auto_339816 ) ) ( not ( = ?auto_339808 ?auto_339810 ) ) ( not ( = ?auto_339808 ?auto_339809 ) ) ( not ( = ?auto_339808 ?auto_339811 ) ) ( not ( = ?auto_339808 ?auto_339812 ) ) ( not ( = ?auto_339808 ?auto_339813 ) ) ( not ( = ?auto_339808 ?auto_339814 ) ) ( not ( = ?auto_339808 ?auto_339815 ) ) ( not ( = ?auto_339808 ?auto_339816 ) ) ( not ( = ?auto_339810 ?auto_339809 ) ) ( not ( = ?auto_339810 ?auto_339811 ) ) ( not ( = ?auto_339810 ?auto_339812 ) ) ( not ( = ?auto_339810 ?auto_339813 ) ) ( not ( = ?auto_339810 ?auto_339814 ) ) ( not ( = ?auto_339810 ?auto_339815 ) ) ( not ( = ?auto_339810 ?auto_339816 ) ) ( not ( = ?auto_339809 ?auto_339811 ) ) ( not ( = ?auto_339809 ?auto_339812 ) ) ( not ( = ?auto_339809 ?auto_339813 ) ) ( not ( = ?auto_339809 ?auto_339814 ) ) ( not ( = ?auto_339809 ?auto_339815 ) ) ( not ( = ?auto_339809 ?auto_339816 ) ) ( not ( = ?auto_339811 ?auto_339812 ) ) ( not ( = ?auto_339811 ?auto_339813 ) ) ( not ( = ?auto_339811 ?auto_339814 ) ) ( not ( = ?auto_339811 ?auto_339815 ) ) ( not ( = ?auto_339811 ?auto_339816 ) ) ( not ( = ?auto_339812 ?auto_339813 ) ) ( not ( = ?auto_339812 ?auto_339814 ) ) ( not ( = ?auto_339812 ?auto_339815 ) ) ( not ( = ?auto_339812 ?auto_339816 ) ) ( not ( = ?auto_339813 ?auto_339814 ) ) ( not ( = ?auto_339813 ?auto_339815 ) ) ( not ( = ?auto_339813 ?auto_339816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_339814 ?auto_339815 ?auto_339816 )
      ( MAKE-10CRATE-VERIFY ?auto_339806 ?auto_339807 ?auto_339808 ?auto_339810 ?auto_339809 ?auto_339811 ?auto_339812 ?auto_339813 ?auto_339814 ?auto_339815 ?auto_339816 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_339931 - SURFACE
      ?auto_339932 - SURFACE
      ?auto_339933 - SURFACE
      ?auto_339935 - SURFACE
      ?auto_339934 - SURFACE
      ?auto_339936 - SURFACE
      ?auto_339937 - SURFACE
      ?auto_339938 - SURFACE
      ?auto_339939 - SURFACE
      ?auto_339940 - SURFACE
      ?auto_339941 - SURFACE
    )
    :vars
    (
      ?auto_339945 - HOIST
      ?auto_339946 - PLACE
      ?auto_339943 - TRUCK
      ?auto_339947 - PLACE
      ?auto_339944 - HOIST
      ?auto_339942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_339945 ?auto_339946 ) ( SURFACE-AT ?auto_339940 ?auto_339946 ) ( CLEAR ?auto_339940 ) ( IS-CRATE ?auto_339941 ) ( not ( = ?auto_339940 ?auto_339941 ) ) ( AVAILABLE ?auto_339945 ) ( ON ?auto_339940 ?auto_339939 ) ( not ( = ?auto_339939 ?auto_339940 ) ) ( not ( = ?auto_339939 ?auto_339941 ) ) ( TRUCK-AT ?auto_339943 ?auto_339947 ) ( not ( = ?auto_339947 ?auto_339946 ) ) ( HOIST-AT ?auto_339944 ?auto_339947 ) ( not ( = ?auto_339945 ?auto_339944 ) ) ( AVAILABLE ?auto_339944 ) ( SURFACE-AT ?auto_339941 ?auto_339947 ) ( ON ?auto_339941 ?auto_339942 ) ( CLEAR ?auto_339941 ) ( not ( = ?auto_339940 ?auto_339942 ) ) ( not ( = ?auto_339941 ?auto_339942 ) ) ( not ( = ?auto_339939 ?auto_339942 ) ) ( ON ?auto_339932 ?auto_339931 ) ( ON ?auto_339933 ?auto_339932 ) ( ON ?auto_339935 ?auto_339933 ) ( ON ?auto_339934 ?auto_339935 ) ( ON ?auto_339936 ?auto_339934 ) ( ON ?auto_339937 ?auto_339936 ) ( ON ?auto_339938 ?auto_339937 ) ( ON ?auto_339939 ?auto_339938 ) ( not ( = ?auto_339931 ?auto_339932 ) ) ( not ( = ?auto_339931 ?auto_339933 ) ) ( not ( = ?auto_339931 ?auto_339935 ) ) ( not ( = ?auto_339931 ?auto_339934 ) ) ( not ( = ?auto_339931 ?auto_339936 ) ) ( not ( = ?auto_339931 ?auto_339937 ) ) ( not ( = ?auto_339931 ?auto_339938 ) ) ( not ( = ?auto_339931 ?auto_339939 ) ) ( not ( = ?auto_339931 ?auto_339940 ) ) ( not ( = ?auto_339931 ?auto_339941 ) ) ( not ( = ?auto_339931 ?auto_339942 ) ) ( not ( = ?auto_339932 ?auto_339933 ) ) ( not ( = ?auto_339932 ?auto_339935 ) ) ( not ( = ?auto_339932 ?auto_339934 ) ) ( not ( = ?auto_339932 ?auto_339936 ) ) ( not ( = ?auto_339932 ?auto_339937 ) ) ( not ( = ?auto_339932 ?auto_339938 ) ) ( not ( = ?auto_339932 ?auto_339939 ) ) ( not ( = ?auto_339932 ?auto_339940 ) ) ( not ( = ?auto_339932 ?auto_339941 ) ) ( not ( = ?auto_339932 ?auto_339942 ) ) ( not ( = ?auto_339933 ?auto_339935 ) ) ( not ( = ?auto_339933 ?auto_339934 ) ) ( not ( = ?auto_339933 ?auto_339936 ) ) ( not ( = ?auto_339933 ?auto_339937 ) ) ( not ( = ?auto_339933 ?auto_339938 ) ) ( not ( = ?auto_339933 ?auto_339939 ) ) ( not ( = ?auto_339933 ?auto_339940 ) ) ( not ( = ?auto_339933 ?auto_339941 ) ) ( not ( = ?auto_339933 ?auto_339942 ) ) ( not ( = ?auto_339935 ?auto_339934 ) ) ( not ( = ?auto_339935 ?auto_339936 ) ) ( not ( = ?auto_339935 ?auto_339937 ) ) ( not ( = ?auto_339935 ?auto_339938 ) ) ( not ( = ?auto_339935 ?auto_339939 ) ) ( not ( = ?auto_339935 ?auto_339940 ) ) ( not ( = ?auto_339935 ?auto_339941 ) ) ( not ( = ?auto_339935 ?auto_339942 ) ) ( not ( = ?auto_339934 ?auto_339936 ) ) ( not ( = ?auto_339934 ?auto_339937 ) ) ( not ( = ?auto_339934 ?auto_339938 ) ) ( not ( = ?auto_339934 ?auto_339939 ) ) ( not ( = ?auto_339934 ?auto_339940 ) ) ( not ( = ?auto_339934 ?auto_339941 ) ) ( not ( = ?auto_339934 ?auto_339942 ) ) ( not ( = ?auto_339936 ?auto_339937 ) ) ( not ( = ?auto_339936 ?auto_339938 ) ) ( not ( = ?auto_339936 ?auto_339939 ) ) ( not ( = ?auto_339936 ?auto_339940 ) ) ( not ( = ?auto_339936 ?auto_339941 ) ) ( not ( = ?auto_339936 ?auto_339942 ) ) ( not ( = ?auto_339937 ?auto_339938 ) ) ( not ( = ?auto_339937 ?auto_339939 ) ) ( not ( = ?auto_339937 ?auto_339940 ) ) ( not ( = ?auto_339937 ?auto_339941 ) ) ( not ( = ?auto_339937 ?auto_339942 ) ) ( not ( = ?auto_339938 ?auto_339939 ) ) ( not ( = ?auto_339938 ?auto_339940 ) ) ( not ( = ?auto_339938 ?auto_339941 ) ) ( not ( = ?auto_339938 ?auto_339942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_339939 ?auto_339940 ?auto_339941 )
      ( MAKE-10CRATE-VERIFY ?auto_339931 ?auto_339932 ?auto_339933 ?auto_339935 ?auto_339934 ?auto_339936 ?auto_339937 ?auto_339938 ?auto_339939 ?auto_339940 ?auto_339941 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340057 - SURFACE
      ?auto_340058 - SURFACE
      ?auto_340059 - SURFACE
      ?auto_340061 - SURFACE
      ?auto_340060 - SURFACE
      ?auto_340062 - SURFACE
      ?auto_340063 - SURFACE
      ?auto_340064 - SURFACE
      ?auto_340065 - SURFACE
      ?auto_340066 - SURFACE
      ?auto_340067 - SURFACE
    )
    :vars
    (
      ?auto_340071 - HOIST
      ?auto_340073 - PLACE
      ?auto_340072 - PLACE
      ?auto_340070 - HOIST
      ?auto_340068 - SURFACE
      ?auto_340069 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340071 ?auto_340073 ) ( SURFACE-AT ?auto_340066 ?auto_340073 ) ( CLEAR ?auto_340066 ) ( IS-CRATE ?auto_340067 ) ( not ( = ?auto_340066 ?auto_340067 ) ) ( AVAILABLE ?auto_340071 ) ( ON ?auto_340066 ?auto_340065 ) ( not ( = ?auto_340065 ?auto_340066 ) ) ( not ( = ?auto_340065 ?auto_340067 ) ) ( not ( = ?auto_340072 ?auto_340073 ) ) ( HOIST-AT ?auto_340070 ?auto_340072 ) ( not ( = ?auto_340071 ?auto_340070 ) ) ( AVAILABLE ?auto_340070 ) ( SURFACE-AT ?auto_340067 ?auto_340072 ) ( ON ?auto_340067 ?auto_340068 ) ( CLEAR ?auto_340067 ) ( not ( = ?auto_340066 ?auto_340068 ) ) ( not ( = ?auto_340067 ?auto_340068 ) ) ( not ( = ?auto_340065 ?auto_340068 ) ) ( TRUCK-AT ?auto_340069 ?auto_340073 ) ( ON ?auto_340058 ?auto_340057 ) ( ON ?auto_340059 ?auto_340058 ) ( ON ?auto_340061 ?auto_340059 ) ( ON ?auto_340060 ?auto_340061 ) ( ON ?auto_340062 ?auto_340060 ) ( ON ?auto_340063 ?auto_340062 ) ( ON ?auto_340064 ?auto_340063 ) ( ON ?auto_340065 ?auto_340064 ) ( not ( = ?auto_340057 ?auto_340058 ) ) ( not ( = ?auto_340057 ?auto_340059 ) ) ( not ( = ?auto_340057 ?auto_340061 ) ) ( not ( = ?auto_340057 ?auto_340060 ) ) ( not ( = ?auto_340057 ?auto_340062 ) ) ( not ( = ?auto_340057 ?auto_340063 ) ) ( not ( = ?auto_340057 ?auto_340064 ) ) ( not ( = ?auto_340057 ?auto_340065 ) ) ( not ( = ?auto_340057 ?auto_340066 ) ) ( not ( = ?auto_340057 ?auto_340067 ) ) ( not ( = ?auto_340057 ?auto_340068 ) ) ( not ( = ?auto_340058 ?auto_340059 ) ) ( not ( = ?auto_340058 ?auto_340061 ) ) ( not ( = ?auto_340058 ?auto_340060 ) ) ( not ( = ?auto_340058 ?auto_340062 ) ) ( not ( = ?auto_340058 ?auto_340063 ) ) ( not ( = ?auto_340058 ?auto_340064 ) ) ( not ( = ?auto_340058 ?auto_340065 ) ) ( not ( = ?auto_340058 ?auto_340066 ) ) ( not ( = ?auto_340058 ?auto_340067 ) ) ( not ( = ?auto_340058 ?auto_340068 ) ) ( not ( = ?auto_340059 ?auto_340061 ) ) ( not ( = ?auto_340059 ?auto_340060 ) ) ( not ( = ?auto_340059 ?auto_340062 ) ) ( not ( = ?auto_340059 ?auto_340063 ) ) ( not ( = ?auto_340059 ?auto_340064 ) ) ( not ( = ?auto_340059 ?auto_340065 ) ) ( not ( = ?auto_340059 ?auto_340066 ) ) ( not ( = ?auto_340059 ?auto_340067 ) ) ( not ( = ?auto_340059 ?auto_340068 ) ) ( not ( = ?auto_340061 ?auto_340060 ) ) ( not ( = ?auto_340061 ?auto_340062 ) ) ( not ( = ?auto_340061 ?auto_340063 ) ) ( not ( = ?auto_340061 ?auto_340064 ) ) ( not ( = ?auto_340061 ?auto_340065 ) ) ( not ( = ?auto_340061 ?auto_340066 ) ) ( not ( = ?auto_340061 ?auto_340067 ) ) ( not ( = ?auto_340061 ?auto_340068 ) ) ( not ( = ?auto_340060 ?auto_340062 ) ) ( not ( = ?auto_340060 ?auto_340063 ) ) ( not ( = ?auto_340060 ?auto_340064 ) ) ( not ( = ?auto_340060 ?auto_340065 ) ) ( not ( = ?auto_340060 ?auto_340066 ) ) ( not ( = ?auto_340060 ?auto_340067 ) ) ( not ( = ?auto_340060 ?auto_340068 ) ) ( not ( = ?auto_340062 ?auto_340063 ) ) ( not ( = ?auto_340062 ?auto_340064 ) ) ( not ( = ?auto_340062 ?auto_340065 ) ) ( not ( = ?auto_340062 ?auto_340066 ) ) ( not ( = ?auto_340062 ?auto_340067 ) ) ( not ( = ?auto_340062 ?auto_340068 ) ) ( not ( = ?auto_340063 ?auto_340064 ) ) ( not ( = ?auto_340063 ?auto_340065 ) ) ( not ( = ?auto_340063 ?auto_340066 ) ) ( not ( = ?auto_340063 ?auto_340067 ) ) ( not ( = ?auto_340063 ?auto_340068 ) ) ( not ( = ?auto_340064 ?auto_340065 ) ) ( not ( = ?auto_340064 ?auto_340066 ) ) ( not ( = ?auto_340064 ?auto_340067 ) ) ( not ( = ?auto_340064 ?auto_340068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340065 ?auto_340066 ?auto_340067 )
      ( MAKE-10CRATE-VERIFY ?auto_340057 ?auto_340058 ?auto_340059 ?auto_340061 ?auto_340060 ?auto_340062 ?auto_340063 ?auto_340064 ?auto_340065 ?auto_340066 ?auto_340067 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340183 - SURFACE
      ?auto_340184 - SURFACE
      ?auto_340185 - SURFACE
      ?auto_340187 - SURFACE
      ?auto_340186 - SURFACE
      ?auto_340188 - SURFACE
      ?auto_340189 - SURFACE
      ?auto_340190 - SURFACE
      ?auto_340191 - SURFACE
      ?auto_340192 - SURFACE
      ?auto_340193 - SURFACE
    )
    :vars
    (
      ?auto_340195 - HOIST
      ?auto_340197 - PLACE
      ?auto_340194 - PLACE
      ?auto_340198 - HOIST
      ?auto_340196 - SURFACE
      ?auto_340199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340195 ?auto_340197 ) ( IS-CRATE ?auto_340193 ) ( not ( = ?auto_340192 ?auto_340193 ) ) ( not ( = ?auto_340191 ?auto_340192 ) ) ( not ( = ?auto_340191 ?auto_340193 ) ) ( not ( = ?auto_340194 ?auto_340197 ) ) ( HOIST-AT ?auto_340198 ?auto_340194 ) ( not ( = ?auto_340195 ?auto_340198 ) ) ( AVAILABLE ?auto_340198 ) ( SURFACE-AT ?auto_340193 ?auto_340194 ) ( ON ?auto_340193 ?auto_340196 ) ( CLEAR ?auto_340193 ) ( not ( = ?auto_340192 ?auto_340196 ) ) ( not ( = ?auto_340193 ?auto_340196 ) ) ( not ( = ?auto_340191 ?auto_340196 ) ) ( TRUCK-AT ?auto_340199 ?auto_340197 ) ( SURFACE-AT ?auto_340191 ?auto_340197 ) ( CLEAR ?auto_340191 ) ( LIFTING ?auto_340195 ?auto_340192 ) ( IS-CRATE ?auto_340192 ) ( ON ?auto_340184 ?auto_340183 ) ( ON ?auto_340185 ?auto_340184 ) ( ON ?auto_340187 ?auto_340185 ) ( ON ?auto_340186 ?auto_340187 ) ( ON ?auto_340188 ?auto_340186 ) ( ON ?auto_340189 ?auto_340188 ) ( ON ?auto_340190 ?auto_340189 ) ( ON ?auto_340191 ?auto_340190 ) ( not ( = ?auto_340183 ?auto_340184 ) ) ( not ( = ?auto_340183 ?auto_340185 ) ) ( not ( = ?auto_340183 ?auto_340187 ) ) ( not ( = ?auto_340183 ?auto_340186 ) ) ( not ( = ?auto_340183 ?auto_340188 ) ) ( not ( = ?auto_340183 ?auto_340189 ) ) ( not ( = ?auto_340183 ?auto_340190 ) ) ( not ( = ?auto_340183 ?auto_340191 ) ) ( not ( = ?auto_340183 ?auto_340192 ) ) ( not ( = ?auto_340183 ?auto_340193 ) ) ( not ( = ?auto_340183 ?auto_340196 ) ) ( not ( = ?auto_340184 ?auto_340185 ) ) ( not ( = ?auto_340184 ?auto_340187 ) ) ( not ( = ?auto_340184 ?auto_340186 ) ) ( not ( = ?auto_340184 ?auto_340188 ) ) ( not ( = ?auto_340184 ?auto_340189 ) ) ( not ( = ?auto_340184 ?auto_340190 ) ) ( not ( = ?auto_340184 ?auto_340191 ) ) ( not ( = ?auto_340184 ?auto_340192 ) ) ( not ( = ?auto_340184 ?auto_340193 ) ) ( not ( = ?auto_340184 ?auto_340196 ) ) ( not ( = ?auto_340185 ?auto_340187 ) ) ( not ( = ?auto_340185 ?auto_340186 ) ) ( not ( = ?auto_340185 ?auto_340188 ) ) ( not ( = ?auto_340185 ?auto_340189 ) ) ( not ( = ?auto_340185 ?auto_340190 ) ) ( not ( = ?auto_340185 ?auto_340191 ) ) ( not ( = ?auto_340185 ?auto_340192 ) ) ( not ( = ?auto_340185 ?auto_340193 ) ) ( not ( = ?auto_340185 ?auto_340196 ) ) ( not ( = ?auto_340187 ?auto_340186 ) ) ( not ( = ?auto_340187 ?auto_340188 ) ) ( not ( = ?auto_340187 ?auto_340189 ) ) ( not ( = ?auto_340187 ?auto_340190 ) ) ( not ( = ?auto_340187 ?auto_340191 ) ) ( not ( = ?auto_340187 ?auto_340192 ) ) ( not ( = ?auto_340187 ?auto_340193 ) ) ( not ( = ?auto_340187 ?auto_340196 ) ) ( not ( = ?auto_340186 ?auto_340188 ) ) ( not ( = ?auto_340186 ?auto_340189 ) ) ( not ( = ?auto_340186 ?auto_340190 ) ) ( not ( = ?auto_340186 ?auto_340191 ) ) ( not ( = ?auto_340186 ?auto_340192 ) ) ( not ( = ?auto_340186 ?auto_340193 ) ) ( not ( = ?auto_340186 ?auto_340196 ) ) ( not ( = ?auto_340188 ?auto_340189 ) ) ( not ( = ?auto_340188 ?auto_340190 ) ) ( not ( = ?auto_340188 ?auto_340191 ) ) ( not ( = ?auto_340188 ?auto_340192 ) ) ( not ( = ?auto_340188 ?auto_340193 ) ) ( not ( = ?auto_340188 ?auto_340196 ) ) ( not ( = ?auto_340189 ?auto_340190 ) ) ( not ( = ?auto_340189 ?auto_340191 ) ) ( not ( = ?auto_340189 ?auto_340192 ) ) ( not ( = ?auto_340189 ?auto_340193 ) ) ( not ( = ?auto_340189 ?auto_340196 ) ) ( not ( = ?auto_340190 ?auto_340191 ) ) ( not ( = ?auto_340190 ?auto_340192 ) ) ( not ( = ?auto_340190 ?auto_340193 ) ) ( not ( = ?auto_340190 ?auto_340196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340191 ?auto_340192 ?auto_340193 )
      ( MAKE-10CRATE-VERIFY ?auto_340183 ?auto_340184 ?auto_340185 ?auto_340187 ?auto_340186 ?auto_340188 ?auto_340189 ?auto_340190 ?auto_340191 ?auto_340192 ?auto_340193 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_340309 - SURFACE
      ?auto_340310 - SURFACE
      ?auto_340311 - SURFACE
      ?auto_340313 - SURFACE
      ?auto_340312 - SURFACE
      ?auto_340314 - SURFACE
      ?auto_340315 - SURFACE
      ?auto_340316 - SURFACE
      ?auto_340317 - SURFACE
      ?auto_340318 - SURFACE
      ?auto_340319 - SURFACE
    )
    :vars
    (
      ?auto_340321 - HOIST
      ?auto_340323 - PLACE
      ?auto_340324 - PLACE
      ?auto_340325 - HOIST
      ?auto_340320 - SURFACE
      ?auto_340322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_340321 ?auto_340323 ) ( IS-CRATE ?auto_340319 ) ( not ( = ?auto_340318 ?auto_340319 ) ) ( not ( = ?auto_340317 ?auto_340318 ) ) ( not ( = ?auto_340317 ?auto_340319 ) ) ( not ( = ?auto_340324 ?auto_340323 ) ) ( HOIST-AT ?auto_340325 ?auto_340324 ) ( not ( = ?auto_340321 ?auto_340325 ) ) ( AVAILABLE ?auto_340325 ) ( SURFACE-AT ?auto_340319 ?auto_340324 ) ( ON ?auto_340319 ?auto_340320 ) ( CLEAR ?auto_340319 ) ( not ( = ?auto_340318 ?auto_340320 ) ) ( not ( = ?auto_340319 ?auto_340320 ) ) ( not ( = ?auto_340317 ?auto_340320 ) ) ( TRUCK-AT ?auto_340322 ?auto_340323 ) ( SURFACE-AT ?auto_340317 ?auto_340323 ) ( CLEAR ?auto_340317 ) ( IS-CRATE ?auto_340318 ) ( AVAILABLE ?auto_340321 ) ( IN ?auto_340318 ?auto_340322 ) ( ON ?auto_340310 ?auto_340309 ) ( ON ?auto_340311 ?auto_340310 ) ( ON ?auto_340313 ?auto_340311 ) ( ON ?auto_340312 ?auto_340313 ) ( ON ?auto_340314 ?auto_340312 ) ( ON ?auto_340315 ?auto_340314 ) ( ON ?auto_340316 ?auto_340315 ) ( ON ?auto_340317 ?auto_340316 ) ( not ( = ?auto_340309 ?auto_340310 ) ) ( not ( = ?auto_340309 ?auto_340311 ) ) ( not ( = ?auto_340309 ?auto_340313 ) ) ( not ( = ?auto_340309 ?auto_340312 ) ) ( not ( = ?auto_340309 ?auto_340314 ) ) ( not ( = ?auto_340309 ?auto_340315 ) ) ( not ( = ?auto_340309 ?auto_340316 ) ) ( not ( = ?auto_340309 ?auto_340317 ) ) ( not ( = ?auto_340309 ?auto_340318 ) ) ( not ( = ?auto_340309 ?auto_340319 ) ) ( not ( = ?auto_340309 ?auto_340320 ) ) ( not ( = ?auto_340310 ?auto_340311 ) ) ( not ( = ?auto_340310 ?auto_340313 ) ) ( not ( = ?auto_340310 ?auto_340312 ) ) ( not ( = ?auto_340310 ?auto_340314 ) ) ( not ( = ?auto_340310 ?auto_340315 ) ) ( not ( = ?auto_340310 ?auto_340316 ) ) ( not ( = ?auto_340310 ?auto_340317 ) ) ( not ( = ?auto_340310 ?auto_340318 ) ) ( not ( = ?auto_340310 ?auto_340319 ) ) ( not ( = ?auto_340310 ?auto_340320 ) ) ( not ( = ?auto_340311 ?auto_340313 ) ) ( not ( = ?auto_340311 ?auto_340312 ) ) ( not ( = ?auto_340311 ?auto_340314 ) ) ( not ( = ?auto_340311 ?auto_340315 ) ) ( not ( = ?auto_340311 ?auto_340316 ) ) ( not ( = ?auto_340311 ?auto_340317 ) ) ( not ( = ?auto_340311 ?auto_340318 ) ) ( not ( = ?auto_340311 ?auto_340319 ) ) ( not ( = ?auto_340311 ?auto_340320 ) ) ( not ( = ?auto_340313 ?auto_340312 ) ) ( not ( = ?auto_340313 ?auto_340314 ) ) ( not ( = ?auto_340313 ?auto_340315 ) ) ( not ( = ?auto_340313 ?auto_340316 ) ) ( not ( = ?auto_340313 ?auto_340317 ) ) ( not ( = ?auto_340313 ?auto_340318 ) ) ( not ( = ?auto_340313 ?auto_340319 ) ) ( not ( = ?auto_340313 ?auto_340320 ) ) ( not ( = ?auto_340312 ?auto_340314 ) ) ( not ( = ?auto_340312 ?auto_340315 ) ) ( not ( = ?auto_340312 ?auto_340316 ) ) ( not ( = ?auto_340312 ?auto_340317 ) ) ( not ( = ?auto_340312 ?auto_340318 ) ) ( not ( = ?auto_340312 ?auto_340319 ) ) ( not ( = ?auto_340312 ?auto_340320 ) ) ( not ( = ?auto_340314 ?auto_340315 ) ) ( not ( = ?auto_340314 ?auto_340316 ) ) ( not ( = ?auto_340314 ?auto_340317 ) ) ( not ( = ?auto_340314 ?auto_340318 ) ) ( not ( = ?auto_340314 ?auto_340319 ) ) ( not ( = ?auto_340314 ?auto_340320 ) ) ( not ( = ?auto_340315 ?auto_340316 ) ) ( not ( = ?auto_340315 ?auto_340317 ) ) ( not ( = ?auto_340315 ?auto_340318 ) ) ( not ( = ?auto_340315 ?auto_340319 ) ) ( not ( = ?auto_340315 ?auto_340320 ) ) ( not ( = ?auto_340316 ?auto_340317 ) ) ( not ( = ?auto_340316 ?auto_340318 ) ) ( not ( = ?auto_340316 ?auto_340319 ) ) ( not ( = ?auto_340316 ?auto_340320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_340317 ?auto_340318 ?auto_340319 )
      ( MAKE-10CRATE-VERIFY ?auto_340309 ?auto_340310 ?auto_340311 ?auto_340313 ?auto_340312 ?auto_340314 ?auto_340315 ?auto_340316 ?auto_340317 ?auto_340318 ?auto_340319 ) )
  )

)

