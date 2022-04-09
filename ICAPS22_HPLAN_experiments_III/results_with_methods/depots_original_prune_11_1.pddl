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
      ?auto_440696 - SURFACE
      ?auto_440697 - SURFACE
    )
    :vars
    (
      ?auto_440698 - HOIST
      ?auto_440699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440698 ?auto_440699 ) ( SURFACE-AT ?auto_440696 ?auto_440699 ) ( CLEAR ?auto_440696 ) ( LIFTING ?auto_440698 ?auto_440697 ) ( IS-CRATE ?auto_440697 ) ( not ( = ?auto_440696 ?auto_440697 ) ) )
    :subtasks
    ( ( !DROP ?auto_440698 ?auto_440697 ?auto_440696 ?auto_440699 )
      ( MAKE-1CRATE-VERIFY ?auto_440696 ?auto_440697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440700 - SURFACE
      ?auto_440701 - SURFACE
    )
    :vars
    (
      ?auto_440702 - HOIST
      ?auto_440703 - PLACE
      ?auto_440704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440702 ?auto_440703 ) ( SURFACE-AT ?auto_440700 ?auto_440703 ) ( CLEAR ?auto_440700 ) ( IS-CRATE ?auto_440701 ) ( not ( = ?auto_440700 ?auto_440701 ) ) ( TRUCK-AT ?auto_440704 ?auto_440703 ) ( AVAILABLE ?auto_440702 ) ( IN ?auto_440701 ?auto_440704 ) )
    :subtasks
    ( ( !UNLOAD ?auto_440702 ?auto_440701 ?auto_440704 ?auto_440703 )
      ( MAKE-1CRATE ?auto_440700 ?auto_440701 )
      ( MAKE-1CRATE-VERIFY ?auto_440700 ?auto_440701 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440705 - SURFACE
      ?auto_440706 - SURFACE
    )
    :vars
    (
      ?auto_440708 - HOIST
      ?auto_440707 - PLACE
      ?auto_440709 - TRUCK
      ?auto_440710 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440708 ?auto_440707 ) ( SURFACE-AT ?auto_440705 ?auto_440707 ) ( CLEAR ?auto_440705 ) ( IS-CRATE ?auto_440706 ) ( not ( = ?auto_440705 ?auto_440706 ) ) ( AVAILABLE ?auto_440708 ) ( IN ?auto_440706 ?auto_440709 ) ( TRUCK-AT ?auto_440709 ?auto_440710 ) ( not ( = ?auto_440710 ?auto_440707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_440709 ?auto_440710 ?auto_440707 )
      ( MAKE-1CRATE ?auto_440705 ?auto_440706 )
      ( MAKE-1CRATE-VERIFY ?auto_440705 ?auto_440706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440711 - SURFACE
      ?auto_440712 - SURFACE
    )
    :vars
    (
      ?auto_440714 - HOIST
      ?auto_440713 - PLACE
      ?auto_440716 - TRUCK
      ?auto_440715 - PLACE
      ?auto_440717 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_440714 ?auto_440713 ) ( SURFACE-AT ?auto_440711 ?auto_440713 ) ( CLEAR ?auto_440711 ) ( IS-CRATE ?auto_440712 ) ( not ( = ?auto_440711 ?auto_440712 ) ) ( AVAILABLE ?auto_440714 ) ( TRUCK-AT ?auto_440716 ?auto_440715 ) ( not ( = ?auto_440715 ?auto_440713 ) ) ( HOIST-AT ?auto_440717 ?auto_440715 ) ( LIFTING ?auto_440717 ?auto_440712 ) ( not ( = ?auto_440714 ?auto_440717 ) ) )
    :subtasks
    ( ( !LOAD ?auto_440717 ?auto_440712 ?auto_440716 ?auto_440715 )
      ( MAKE-1CRATE ?auto_440711 ?auto_440712 )
      ( MAKE-1CRATE-VERIFY ?auto_440711 ?auto_440712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440718 - SURFACE
      ?auto_440719 - SURFACE
    )
    :vars
    (
      ?auto_440720 - HOIST
      ?auto_440723 - PLACE
      ?auto_440722 - TRUCK
      ?auto_440724 - PLACE
      ?auto_440721 - HOIST
      ?auto_440725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440720 ?auto_440723 ) ( SURFACE-AT ?auto_440718 ?auto_440723 ) ( CLEAR ?auto_440718 ) ( IS-CRATE ?auto_440719 ) ( not ( = ?auto_440718 ?auto_440719 ) ) ( AVAILABLE ?auto_440720 ) ( TRUCK-AT ?auto_440722 ?auto_440724 ) ( not ( = ?auto_440724 ?auto_440723 ) ) ( HOIST-AT ?auto_440721 ?auto_440724 ) ( not ( = ?auto_440720 ?auto_440721 ) ) ( AVAILABLE ?auto_440721 ) ( SURFACE-AT ?auto_440719 ?auto_440724 ) ( ON ?auto_440719 ?auto_440725 ) ( CLEAR ?auto_440719 ) ( not ( = ?auto_440718 ?auto_440725 ) ) ( not ( = ?auto_440719 ?auto_440725 ) ) )
    :subtasks
    ( ( !LIFT ?auto_440721 ?auto_440719 ?auto_440725 ?auto_440724 )
      ( MAKE-1CRATE ?auto_440718 ?auto_440719 )
      ( MAKE-1CRATE-VERIFY ?auto_440718 ?auto_440719 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440726 - SURFACE
      ?auto_440727 - SURFACE
    )
    :vars
    (
      ?auto_440733 - HOIST
      ?auto_440728 - PLACE
      ?auto_440732 - PLACE
      ?auto_440730 - HOIST
      ?auto_440731 - SURFACE
      ?auto_440729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440733 ?auto_440728 ) ( SURFACE-AT ?auto_440726 ?auto_440728 ) ( CLEAR ?auto_440726 ) ( IS-CRATE ?auto_440727 ) ( not ( = ?auto_440726 ?auto_440727 ) ) ( AVAILABLE ?auto_440733 ) ( not ( = ?auto_440732 ?auto_440728 ) ) ( HOIST-AT ?auto_440730 ?auto_440732 ) ( not ( = ?auto_440733 ?auto_440730 ) ) ( AVAILABLE ?auto_440730 ) ( SURFACE-AT ?auto_440727 ?auto_440732 ) ( ON ?auto_440727 ?auto_440731 ) ( CLEAR ?auto_440727 ) ( not ( = ?auto_440726 ?auto_440731 ) ) ( not ( = ?auto_440727 ?auto_440731 ) ) ( TRUCK-AT ?auto_440729 ?auto_440728 ) )
    :subtasks
    ( ( !DRIVE ?auto_440729 ?auto_440728 ?auto_440732 )
      ( MAKE-1CRATE ?auto_440726 ?auto_440727 )
      ( MAKE-1CRATE-VERIFY ?auto_440726 ?auto_440727 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440743 - SURFACE
      ?auto_440744 - SURFACE
      ?auto_440745 - SURFACE
    )
    :vars
    (
      ?auto_440747 - HOIST
      ?auto_440746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440747 ?auto_440746 ) ( SURFACE-AT ?auto_440744 ?auto_440746 ) ( CLEAR ?auto_440744 ) ( LIFTING ?auto_440747 ?auto_440745 ) ( IS-CRATE ?auto_440745 ) ( not ( = ?auto_440744 ?auto_440745 ) ) ( ON ?auto_440744 ?auto_440743 ) ( not ( = ?auto_440743 ?auto_440744 ) ) ( not ( = ?auto_440743 ?auto_440745 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440744 ?auto_440745 )
      ( MAKE-2CRATE-VERIFY ?auto_440743 ?auto_440744 ?auto_440745 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440753 - SURFACE
      ?auto_440754 - SURFACE
      ?auto_440755 - SURFACE
    )
    :vars
    (
      ?auto_440756 - HOIST
      ?auto_440758 - PLACE
      ?auto_440757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440756 ?auto_440758 ) ( SURFACE-AT ?auto_440754 ?auto_440758 ) ( CLEAR ?auto_440754 ) ( IS-CRATE ?auto_440755 ) ( not ( = ?auto_440754 ?auto_440755 ) ) ( TRUCK-AT ?auto_440757 ?auto_440758 ) ( AVAILABLE ?auto_440756 ) ( IN ?auto_440755 ?auto_440757 ) ( ON ?auto_440754 ?auto_440753 ) ( not ( = ?auto_440753 ?auto_440754 ) ) ( not ( = ?auto_440753 ?auto_440755 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440754 ?auto_440755 )
      ( MAKE-2CRATE-VERIFY ?auto_440753 ?auto_440754 ?auto_440755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440759 - SURFACE
      ?auto_440760 - SURFACE
    )
    :vars
    (
      ?auto_440761 - HOIST
      ?auto_440763 - PLACE
      ?auto_440762 - TRUCK
      ?auto_440764 - SURFACE
      ?auto_440765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440761 ?auto_440763 ) ( SURFACE-AT ?auto_440759 ?auto_440763 ) ( CLEAR ?auto_440759 ) ( IS-CRATE ?auto_440760 ) ( not ( = ?auto_440759 ?auto_440760 ) ) ( AVAILABLE ?auto_440761 ) ( IN ?auto_440760 ?auto_440762 ) ( ON ?auto_440759 ?auto_440764 ) ( not ( = ?auto_440764 ?auto_440759 ) ) ( not ( = ?auto_440764 ?auto_440760 ) ) ( TRUCK-AT ?auto_440762 ?auto_440765 ) ( not ( = ?auto_440765 ?auto_440763 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_440762 ?auto_440765 ?auto_440763 )
      ( MAKE-2CRATE ?auto_440764 ?auto_440759 ?auto_440760 )
      ( MAKE-1CRATE-VERIFY ?auto_440759 ?auto_440760 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440766 - SURFACE
      ?auto_440767 - SURFACE
      ?auto_440768 - SURFACE
    )
    :vars
    (
      ?auto_440772 - HOIST
      ?auto_440769 - PLACE
      ?auto_440770 - TRUCK
      ?auto_440771 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440772 ?auto_440769 ) ( SURFACE-AT ?auto_440767 ?auto_440769 ) ( CLEAR ?auto_440767 ) ( IS-CRATE ?auto_440768 ) ( not ( = ?auto_440767 ?auto_440768 ) ) ( AVAILABLE ?auto_440772 ) ( IN ?auto_440768 ?auto_440770 ) ( ON ?auto_440767 ?auto_440766 ) ( not ( = ?auto_440766 ?auto_440767 ) ) ( not ( = ?auto_440766 ?auto_440768 ) ) ( TRUCK-AT ?auto_440770 ?auto_440771 ) ( not ( = ?auto_440771 ?auto_440769 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440767 ?auto_440768 )
      ( MAKE-2CRATE-VERIFY ?auto_440766 ?auto_440767 ?auto_440768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440773 - SURFACE
      ?auto_440774 - SURFACE
    )
    :vars
    (
      ?auto_440776 - HOIST
      ?auto_440778 - PLACE
      ?auto_440779 - SURFACE
      ?auto_440775 - TRUCK
      ?auto_440777 - PLACE
      ?auto_440780 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_440776 ?auto_440778 ) ( SURFACE-AT ?auto_440773 ?auto_440778 ) ( CLEAR ?auto_440773 ) ( IS-CRATE ?auto_440774 ) ( not ( = ?auto_440773 ?auto_440774 ) ) ( AVAILABLE ?auto_440776 ) ( ON ?auto_440773 ?auto_440779 ) ( not ( = ?auto_440779 ?auto_440773 ) ) ( not ( = ?auto_440779 ?auto_440774 ) ) ( TRUCK-AT ?auto_440775 ?auto_440777 ) ( not ( = ?auto_440777 ?auto_440778 ) ) ( HOIST-AT ?auto_440780 ?auto_440777 ) ( LIFTING ?auto_440780 ?auto_440774 ) ( not ( = ?auto_440776 ?auto_440780 ) ) )
    :subtasks
    ( ( !LOAD ?auto_440780 ?auto_440774 ?auto_440775 ?auto_440777 )
      ( MAKE-2CRATE ?auto_440779 ?auto_440773 ?auto_440774 )
      ( MAKE-1CRATE-VERIFY ?auto_440773 ?auto_440774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440781 - SURFACE
      ?auto_440782 - SURFACE
      ?auto_440783 - SURFACE
    )
    :vars
    (
      ?auto_440788 - HOIST
      ?auto_440786 - PLACE
      ?auto_440785 - TRUCK
      ?auto_440784 - PLACE
      ?auto_440787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_440788 ?auto_440786 ) ( SURFACE-AT ?auto_440782 ?auto_440786 ) ( CLEAR ?auto_440782 ) ( IS-CRATE ?auto_440783 ) ( not ( = ?auto_440782 ?auto_440783 ) ) ( AVAILABLE ?auto_440788 ) ( ON ?auto_440782 ?auto_440781 ) ( not ( = ?auto_440781 ?auto_440782 ) ) ( not ( = ?auto_440781 ?auto_440783 ) ) ( TRUCK-AT ?auto_440785 ?auto_440784 ) ( not ( = ?auto_440784 ?auto_440786 ) ) ( HOIST-AT ?auto_440787 ?auto_440784 ) ( LIFTING ?auto_440787 ?auto_440783 ) ( not ( = ?auto_440788 ?auto_440787 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440782 ?auto_440783 )
      ( MAKE-2CRATE-VERIFY ?auto_440781 ?auto_440782 ?auto_440783 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440789 - SURFACE
      ?auto_440790 - SURFACE
    )
    :vars
    (
      ?auto_440796 - HOIST
      ?auto_440791 - PLACE
      ?auto_440794 - SURFACE
      ?auto_440793 - TRUCK
      ?auto_440792 - PLACE
      ?auto_440795 - HOIST
      ?auto_440797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440796 ?auto_440791 ) ( SURFACE-AT ?auto_440789 ?auto_440791 ) ( CLEAR ?auto_440789 ) ( IS-CRATE ?auto_440790 ) ( not ( = ?auto_440789 ?auto_440790 ) ) ( AVAILABLE ?auto_440796 ) ( ON ?auto_440789 ?auto_440794 ) ( not ( = ?auto_440794 ?auto_440789 ) ) ( not ( = ?auto_440794 ?auto_440790 ) ) ( TRUCK-AT ?auto_440793 ?auto_440792 ) ( not ( = ?auto_440792 ?auto_440791 ) ) ( HOIST-AT ?auto_440795 ?auto_440792 ) ( not ( = ?auto_440796 ?auto_440795 ) ) ( AVAILABLE ?auto_440795 ) ( SURFACE-AT ?auto_440790 ?auto_440792 ) ( ON ?auto_440790 ?auto_440797 ) ( CLEAR ?auto_440790 ) ( not ( = ?auto_440789 ?auto_440797 ) ) ( not ( = ?auto_440790 ?auto_440797 ) ) ( not ( = ?auto_440794 ?auto_440797 ) ) )
    :subtasks
    ( ( !LIFT ?auto_440795 ?auto_440790 ?auto_440797 ?auto_440792 )
      ( MAKE-2CRATE ?auto_440794 ?auto_440789 ?auto_440790 )
      ( MAKE-1CRATE-VERIFY ?auto_440789 ?auto_440790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440798 - SURFACE
      ?auto_440799 - SURFACE
      ?auto_440800 - SURFACE
    )
    :vars
    (
      ?auto_440803 - HOIST
      ?auto_440806 - PLACE
      ?auto_440802 - TRUCK
      ?auto_440804 - PLACE
      ?auto_440805 - HOIST
      ?auto_440801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440803 ?auto_440806 ) ( SURFACE-AT ?auto_440799 ?auto_440806 ) ( CLEAR ?auto_440799 ) ( IS-CRATE ?auto_440800 ) ( not ( = ?auto_440799 ?auto_440800 ) ) ( AVAILABLE ?auto_440803 ) ( ON ?auto_440799 ?auto_440798 ) ( not ( = ?auto_440798 ?auto_440799 ) ) ( not ( = ?auto_440798 ?auto_440800 ) ) ( TRUCK-AT ?auto_440802 ?auto_440804 ) ( not ( = ?auto_440804 ?auto_440806 ) ) ( HOIST-AT ?auto_440805 ?auto_440804 ) ( not ( = ?auto_440803 ?auto_440805 ) ) ( AVAILABLE ?auto_440805 ) ( SURFACE-AT ?auto_440800 ?auto_440804 ) ( ON ?auto_440800 ?auto_440801 ) ( CLEAR ?auto_440800 ) ( not ( = ?auto_440799 ?auto_440801 ) ) ( not ( = ?auto_440800 ?auto_440801 ) ) ( not ( = ?auto_440798 ?auto_440801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440799 ?auto_440800 )
      ( MAKE-2CRATE-VERIFY ?auto_440798 ?auto_440799 ?auto_440800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440807 - SURFACE
      ?auto_440808 - SURFACE
    )
    :vars
    (
      ?auto_440811 - HOIST
      ?auto_440815 - PLACE
      ?auto_440809 - SURFACE
      ?auto_440810 - PLACE
      ?auto_440814 - HOIST
      ?auto_440812 - SURFACE
      ?auto_440813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440811 ?auto_440815 ) ( SURFACE-AT ?auto_440807 ?auto_440815 ) ( CLEAR ?auto_440807 ) ( IS-CRATE ?auto_440808 ) ( not ( = ?auto_440807 ?auto_440808 ) ) ( AVAILABLE ?auto_440811 ) ( ON ?auto_440807 ?auto_440809 ) ( not ( = ?auto_440809 ?auto_440807 ) ) ( not ( = ?auto_440809 ?auto_440808 ) ) ( not ( = ?auto_440810 ?auto_440815 ) ) ( HOIST-AT ?auto_440814 ?auto_440810 ) ( not ( = ?auto_440811 ?auto_440814 ) ) ( AVAILABLE ?auto_440814 ) ( SURFACE-AT ?auto_440808 ?auto_440810 ) ( ON ?auto_440808 ?auto_440812 ) ( CLEAR ?auto_440808 ) ( not ( = ?auto_440807 ?auto_440812 ) ) ( not ( = ?auto_440808 ?auto_440812 ) ) ( not ( = ?auto_440809 ?auto_440812 ) ) ( TRUCK-AT ?auto_440813 ?auto_440815 ) )
    :subtasks
    ( ( !DRIVE ?auto_440813 ?auto_440815 ?auto_440810 )
      ( MAKE-2CRATE ?auto_440809 ?auto_440807 ?auto_440808 )
      ( MAKE-1CRATE-VERIFY ?auto_440807 ?auto_440808 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440816 - SURFACE
      ?auto_440817 - SURFACE
      ?auto_440818 - SURFACE
    )
    :vars
    (
      ?auto_440824 - HOIST
      ?auto_440822 - PLACE
      ?auto_440819 - PLACE
      ?auto_440821 - HOIST
      ?auto_440820 - SURFACE
      ?auto_440823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440824 ?auto_440822 ) ( SURFACE-AT ?auto_440817 ?auto_440822 ) ( CLEAR ?auto_440817 ) ( IS-CRATE ?auto_440818 ) ( not ( = ?auto_440817 ?auto_440818 ) ) ( AVAILABLE ?auto_440824 ) ( ON ?auto_440817 ?auto_440816 ) ( not ( = ?auto_440816 ?auto_440817 ) ) ( not ( = ?auto_440816 ?auto_440818 ) ) ( not ( = ?auto_440819 ?auto_440822 ) ) ( HOIST-AT ?auto_440821 ?auto_440819 ) ( not ( = ?auto_440824 ?auto_440821 ) ) ( AVAILABLE ?auto_440821 ) ( SURFACE-AT ?auto_440818 ?auto_440819 ) ( ON ?auto_440818 ?auto_440820 ) ( CLEAR ?auto_440818 ) ( not ( = ?auto_440817 ?auto_440820 ) ) ( not ( = ?auto_440818 ?auto_440820 ) ) ( not ( = ?auto_440816 ?auto_440820 ) ) ( TRUCK-AT ?auto_440823 ?auto_440822 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440817 ?auto_440818 )
      ( MAKE-2CRATE-VERIFY ?auto_440816 ?auto_440817 ?auto_440818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440825 - SURFACE
      ?auto_440826 - SURFACE
    )
    :vars
    (
      ?auto_440830 - HOIST
      ?auto_440829 - PLACE
      ?auto_440828 - SURFACE
      ?auto_440832 - PLACE
      ?auto_440831 - HOIST
      ?auto_440827 - SURFACE
      ?auto_440833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440830 ?auto_440829 ) ( IS-CRATE ?auto_440826 ) ( not ( = ?auto_440825 ?auto_440826 ) ) ( not ( = ?auto_440828 ?auto_440825 ) ) ( not ( = ?auto_440828 ?auto_440826 ) ) ( not ( = ?auto_440832 ?auto_440829 ) ) ( HOIST-AT ?auto_440831 ?auto_440832 ) ( not ( = ?auto_440830 ?auto_440831 ) ) ( AVAILABLE ?auto_440831 ) ( SURFACE-AT ?auto_440826 ?auto_440832 ) ( ON ?auto_440826 ?auto_440827 ) ( CLEAR ?auto_440826 ) ( not ( = ?auto_440825 ?auto_440827 ) ) ( not ( = ?auto_440826 ?auto_440827 ) ) ( not ( = ?auto_440828 ?auto_440827 ) ) ( TRUCK-AT ?auto_440833 ?auto_440829 ) ( SURFACE-AT ?auto_440828 ?auto_440829 ) ( CLEAR ?auto_440828 ) ( LIFTING ?auto_440830 ?auto_440825 ) ( IS-CRATE ?auto_440825 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440828 ?auto_440825 )
      ( MAKE-2CRATE ?auto_440828 ?auto_440825 ?auto_440826 )
      ( MAKE-1CRATE-VERIFY ?auto_440825 ?auto_440826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440834 - SURFACE
      ?auto_440835 - SURFACE
      ?auto_440836 - SURFACE
    )
    :vars
    (
      ?auto_440838 - HOIST
      ?auto_440837 - PLACE
      ?auto_440841 - PLACE
      ?auto_440839 - HOIST
      ?auto_440840 - SURFACE
      ?auto_440842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440838 ?auto_440837 ) ( IS-CRATE ?auto_440836 ) ( not ( = ?auto_440835 ?auto_440836 ) ) ( not ( = ?auto_440834 ?auto_440835 ) ) ( not ( = ?auto_440834 ?auto_440836 ) ) ( not ( = ?auto_440841 ?auto_440837 ) ) ( HOIST-AT ?auto_440839 ?auto_440841 ) ( not ( = ?auto_440838 ?auto_440839 ) ) ( AVAILABLE ?auto_440839 ) ( SURFACE-AT ?auto_440836 ?auto_440841 ) ( ON ?auto_440836 ?auto_440840 ) ( CLEAR ?auto_440836 ) ( not ( = ?auto_440835 ?auto_440840 ) ) ( not ( = ?auto_440836 ?auto_440840 ) ) ( not ( = ?auto_440834 ?auto_440840 ) ) ( TRUCK-AT ?auto_440842 ?auto_440837 ) ( SURFACE-AT ?auto_440834 ?auto_440837 ) ( CLEAR ?auto_440834 ) ( LIFTING ?auto_440838 ?auto_440835 ) ( IS-CRATE ?auto_440835 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440835 ?auto_440836 )
      ( MAKE-2CRATE-VERIFY ?auto_440834 ?auto_440835 ?auto_440836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440843 - SURFACE
      ?auto_440844 - SURFACE
    )
    :vars
    (
      ?auto_440848 - HOIST
      ?auto_440849 - PLACE
      ?auto_440847 - SURFACE
      ?auto_440846 - PLACE
      ?auto_440851 - HOIST
      ?auto_440850 - SURFACE
      ?auto_440845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440848 ?auto_440849 ) ( IS-CRATE ?auto_440844 ) ( not ( = ?auto_440843 ?auto_440844 ) ) ( not ( = ?auto_440847 ?auto_440843 ) ) ( not ( = ?auto_440847 ?auto_440844 ) ) ( not ( = ?auto_440846 ?auto_440849 ) ) ( HOIST-AT ?auto_440851 ?auto_440846 ) ( not ( = ?auto_440848 ?auto_440851 ) ) ( AVAILABLE ?auto_440851 ) ( SURFACE-AT ?auto_440844 ?auto_440846 ) ( ON ?auto_440844 ?auto_440850 ) ( CLEAR ?auto_440844 ) ( not ( = ?auto_440843 ?auto_440850 ) ) ( not ( = ?auto_440844 ?auto_440850 ) ) ( not ( = ?auto_440847 ?auto_440850 ) ) ( TRUCK-AT ?auto_440845 ?auto_440849 ) ( SURFACE-AT ?auto_440847 ?auto_440849 ) ( CLEAR ?auto_440847 ) ( IS-CRATE ?auto_440843 ) ( AVAILABLE ?auto_440848 ) ( IN ?auto_440843 ?auto_440845 ) )
    :subtasks
    ( ( !UNLOAD ?auto_440848 ?auto_440843 ?auto_440845 ?auto_440849 )
      ( MAKE-2CRATE ?auto_440847 ?auto_440843 ?auto_440844 )
      ( MAKE-1CRATE-VERIFY ?auto_440843 ?auto_440844 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440852 - SURFACE
      ?auto_440853 - SURFACE
      ?auto_440854 - SURFACE
    )
    :vars
    (
      ?auto_440855 - HOIST
      ?auto_440857 - PLACE
      ?auto_440856 - PLACE
      ?auto_440858 - HOIST
      ?auto_440859 - SURFACE
      ?auto_440860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440855 ?auto_440857 ) ( IS-CRATE ?auto_440854 ) ( not ( = ?auto_440853 ?auto_440854 ) ) ( not ( = ?auto_440852 ?auto_440853 ) ) ( not ( = ?auto_440852 ?auto_440854 ) ) ( not ( = ?auto_440856 ?auto_440857 ) ) ( HOIST-AT ?auto_440858 ?auto_440856 ) ( not ( = ?auto_440855 ?auto_440858 ) ) ( AVAILABLE ?auto_440858 ) ( SURFACE-AT ?auto_440854 ?auto_440856 ) ( ON ?auto_440854 ?auto_440859 ) ( CLEAR ?auto_440854 ) ( not ( = ?auto_440853 ?auto_440859 ) ) ( not ( = ?auto_440854 ?auto_440859 ) ) ( not ( = ?auto_440852 ?auto_440859 ) ) ( TRUCK-AT ?auto_440860 ?auto_440857 ) ( SURFACE-AT ?auto_440852 ?auto_440857 ) ( CLEAR ?auto_440852 ) ( IS-CRATE ?auto_440853 ) ( AVAILABLE ?auto_440855 ) ( IN ?auto_440853 ?auto_440860 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440853 ?auto_440854 )
      ( MAKE-2CRATE-VERIFY ?auto_440852 ?auto_440853 ?auto_440854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_440897 - SURFACE
      ?auto_440898 - SURFACE
    )
    :vars
    (
      ?auto_440904 - HOIST
      ?auto_440903 - PLACE
      ?auto_440901 - SURFACE
      ?auto_440900 - PLACE
      ?auto_440902 - HOIST
      ?auto_440899 - SURFACE
      ?auto_440905 - TRUCK
      ?auto_440906 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440904 ?auto_440903 ) ( SURFACE-AT ?auto_440897 ?auto_440903 ) ( CLEAR ?auto_440897 ) ( IS-CRATE ?auto_440898 ) ( not ( = ?auto_440897 ?auto_440898 ) ) ( AVAILABLE ?auto_440904 ) ( ON ?auto_440897 ?auto_440901 ) ( not ( = ?auto_440901 ?auto_440897 ) ) ( not ( = ?auto_440901 ?auto_440898 ) ) ( not ( = ?auto_440900 ?auto_440903 ) ) ( HOIST-AT ?auto_440902 ?auto_440900 ) ( not ( = ?auto_440904 ?auto_440902 ) ) ( AVAILABLE ?auto_440902 ) ( SURFACE-AT ?auto_440898 ?auto_440900 ) ( ON ?auto_440898 ?auto_440899 ) ( CLEAR ?auto_440898 ) ( not ( = ?auto_440897 ?auto_440899 ) ) ( not ( = ?auto_440898 ?auto_440899 ) ) ( not ( = ?auto_440901 ?auto_440899 ) ) ( TRUCK-AT ?auto_440905 ?auto_440906 ) ( not ( = ?auto_440906 ?auto_440903 ) ) ( not ( = ?auto_440900 ?auto_440906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_440905 ?auto_440906 ?auto_440903 )
      ( MAKE-1CRATE ?auto_440897 ?auto_440898 )
      ( MAKE-1CRATE-VERIFY ?auto_440897 ?auto_440898 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_440936 - SURFACE
      ?auto_440937 - SURFACE
      ?auto_440938 - SURFACE
      ?auto_440939 - SURFACE
    )
    :vars
    (
      ?auto_440941 - HOIST
      ?auto_440940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440941 ?auto_440940 ) ( SURFACE-AT ?auto_440938 ?auto_440940 ) ( CLEAR ?auto_440938 ) ( LIFTING ?auto_440941 ?auto_440939 ) ( IS-CRATE ?auto_440939 ) ( not ( = ?auto_440938 ?auto_440939 ) ) ( ON ?auto_440937 ?auto_440936 ) ( ON ?auto_440938 ?auto_440937 ) ( not ( = ?auto_440936 ?auto_440937 ) ) ( not ( = ?auto_440936 ?auto_440938 ) ) ( not ( = ?auto_440936 ?auto_440939 ) ) ( not ( = ?auto_440937 ?auto_440938 ) ) ( not ( = ?auto_440937 ?auto_440939 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440938 ?auto_440939 )
      ( MAKE-3CRATE-VERIFY ?auto_440936 ?auto_440937 ?auto_440938 ?auto_440939 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_440953 - SURFACE
      ?auto_440954 - SURFACE
      ?auto_440955 - SURFACE
      ?auto_440956 - SURFACE
    )
    :vars
    (
      ?auto_440958 - HOIST
      ?auto_440959 - PLACE
      ?auto_440957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_440958 ?auto_440959 ) ( SURFACE-AT ?auto_440955 ?auto_440959 ) ( CLEAR ?auto_440955 ) ( IS-CRATE ?auto_440956 ) ( not ( = ?auto_440955 ?auto_440956 ) ) ( TRUCK-AT ?auto_440957 ?auto_440959 ) ( AVAILABLE ?auto_440958 ) ( IN ?auto_440956 ?auto_440957 ) ( ON ?auto_440955 ?auto_440954 ) ( not ( = ?auto_440954 ?auto_440955 ) ) ( not ( = ?auto_440954 ?auto_440956 ) ) ( ON ?auto_440954 ?auto_440953 ) ( not ( = ?auto_440953 ?auto_440954 ) ) ( not ( = ?auto_440953 ?auto_440955 ) ) ( not ( = ?auto_440953 ?auto_440956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_440954 ?auto_440955 ?auto_440956 )
      ( MAKE-3CRATE-VERIFY ?auto_440953 ?auto_440954 ?auto_440955 ?auto_440956 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_440974 - SURFACE
      ?auto_440975 - SURFACE
      ?auto_440976 - SURFACE
      ?auto_440977 - SURFACE
    )
    :vars
    (
      ?auto_440979 - HOIST
      ?auto_440981 - PLACE
      ?auto_440980 - TRUCK
      ?auto_440978 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_440979 ?auto_440981 ) ( SURFACE-AT ?auto_440976 ?auto_440981 ) ( CLEAR ?auto_440976 ) ( IS-CRATE ?auto_440977 ) ( not ( = ?auto_440976 ?auto_440977 ) ) ( AVAILABLE ?auto_440979 ) ( IN ?auto_440977 ?auto_440980 ) ( ON ?auto_440976 ?auto_440975 ) ( not ( = ?auto_440975 ?auto_440976 ) ) ( not ( = ?auto_440975 ?auto_440977 ) ) ( TRUCK-AT ?auto_440980 ?auto_440978 ) ( not ( = ?auto_440978 ?auto_440981 ) ) ( ON ?auto_440975 ?auto_440974 ) ( not ( = ?auto_440974 ?auto_440975 ) ) ( not ( = ?auto_440974 ?auto_440976 ) ) ( not ( = ?auto_440974 ?auto_440977 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_440975 ?auto_440976 ?auto_440977 )
      ( MAKE-3CRATE-VERIFY ?auto_440974 ?auto_440975 ?auto_440976 ?auto_440977 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_440998 - SURFACE
      ?auto_440999 - SURFACE
      ?auto_441000 - SURFACE
      ?auto_441001 - SURFACE
    )
    :vars
    (
      ?auto_441005 - HOIST
      ?auto_441002 - PLACE
      ?auto_441006 - TRUCK
      ?auto_441003 - PLACE
      ?auto_441004 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441005 ?auto_441002 ) ( SURFACE-AT ?auto_441000 ?auto_441002 ) ( CLEAR ?auto_441000 ) ( IS-CRATE ?auto_441001 ) ( not ( = ?auto_441000 ?auto_441001 ) ) ( AVAILABLE ?auto_441005 ) ( ON ?auto_441000 ?auto_440999 ) ( not ( = ?auto_440999 ?auto_441000 ) ) ( not ( = ?auto_440999 ?auto_441001 ) ) ( TRUCK-AT ?auto_441006 ?auto_441003 ) ( not ( = ?auto_441003 ?auto_441002 ) ) ( HOIST-AT ?auto_441004 ?auto_441003 ) ( LIFTING ?auto_441004 ?auto_441001 ) ( not ( = ?auto_441005 ?auto_441004 ) ) ( ON ?auto_440999 ?auto_440998 ) ( not ( = ?auto_440998 ?auto_440999 ) ) ( not ( = ?auto_440998 ?auto_441000 ) ) ( not ( = ?auto_440998 ?auto_441001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_440999 ?auto_441000 ?auto_441001 )
      ( MAKE-3CRATE-VERIFY ?auto_440998 ?auto_440999 ?auto_441000 ?auto_441001 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441025 - SURFACE
      ?auto_441026 - SURFACE
      ?auto_441027 - SURFACE
      ?auto_441028 - SURFACE
    )
    :vars
    (
      ?auto_441030 - HOIST
      ?auto_441034 - PLACE
      ?auto_441031 - TRUCK
      ?auto_441029 - PLACE
      ?auto_441032 - HOIST
      ?auto_441033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441030 ?auto_441034 ) ( SURFACE-AT ?auto_441027 ?auto_441034 ) ( CLEAR ?auto_441027 ) ( IS-CRATE ?auto_441028 ) ( not ( = ?auto_441027 ?auto_441028 ) ) ( AVAILABLE ?auto_441030 ) ( ON ?auto_441027 ?auto_441026 ) ( not ( = ?auto_441026 ?auto_441027 ) ) ( not ( = ?auto_441026 ?auto_441028 ) ) ( TRUCK-AT ?auto_441031 ?auto_441029 ) ( not ( = ?auto_441029 ?auto_441034 ) ) ( HOIST-AT ?auto_441032 ?auto_441029 ) ( not ( = ?auto_441030 ?auto_441032 ) ) ( AVAILABLE ?auto_441032 ) ( SURFACE-AT ?auto_441028 ?auto_441029 ) ( ON ?auto_441028 ?auto_441033 ) ( CLEAR ?auto_441028 ) ( not ( = ?auto_441027 ?auto_441033 ) ) ( not ( = ?auto_441028 ?auto_441033 ) ) ( not ( = ?auto_441026 ?auto_441033 ) ) ( ON ?auto_441026 ?auto_441025 ) ( not ( = ?auto_441025 ?auto_441026 ) ) ( not ( = ?auto_441025 ?auto_441027 ) ) ( not ( = ?auto_441025 ?auto_441028 ) ) ( not ( = ?auto_441025 ?auto_441033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441026 ?auto_441027 ?auto_441028 )
      ( MAKE-3CRATE-VERIFY ?auto_441025 ?auto_441026 ?auto_441027 ?auto_441028 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441053 - SURFACE
      ?auto_441054 - SURFACE
      ?auto_441055 - SURFACE
      ?auto_441056 - SURFACE
    )
    :vars
    (
      ?auto_441061 - HOIST
      ?auto_441060 - PLACE
      ?auto_441059 - PLACE
      ?auto_441057 - HOIST
      ?auto_441058 - SURFACE
      ?auto_441062 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441061 ?auto_441060 ) ( SURFACE-AT ?auto_441055 ?auto_441060 ) ( CLEAR ?auto_441055 ) ( IS-CRATE ?auto_441056 ) ( not ( = ?auto_441055 ?auto_441056 ) ) ( AVAILABLE ?auto_441061 ) ( ON ?auto_441055 ?auto_441054 ) ( not ( = ?auto_441054 ?auto_441055 ) ) ( not ( = ?auto_441054 ?auto_441056 ) ) ( not ( = ?auto_441059 ?auto_441060 ) ) ( HOIST-AT ?auto_441057 ?auto_441059 ) ( not ( = ?auto_441061 ?auto_441057 ) ) ( AVAILABLE ?auto_441057 ) ( SURFACE-AT ?auto_441056 ?auto_441059 ) ( ON ?auto_441056 ?auto_441058 ) ( CLEAR ?auto_441056 ) ( not ( = ?auto_441055 ?auto_441058 ) ) ( not ( = ?auto_441056 ?auto_441058 ) ) ( not ( = ?auto_441054 ?auto_441058 ) ) ( TRUCK-AT ?auto_441062 ?auto_441060 ) ( ON ?auto_441054 ?auto_441053 ) ( not ( = ?auto_441053 ?auto_441054 ) ) ( not ( = ?auto_441053 ?auto_441055 ) ) ( not ( = ?auto_441053 ?auto_441056 ) ) ( not ( = ?auto_441053 ?auto_441058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441054 ?auto_441055 ?auto_441056 )
      ( MAKE-3CRATE-VERIFY ?auto_441053 ?auto_441054 ?auto_441055 ?auto_441056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441081 - SURFACE
      ?auto_441082 - SURFACE
      ?auto_441083 - SURFACE
      ?auto_441084 - SURFACE
    )
    :vars
    (
      ?auto_441090 - HOIST
      ?auto_441086 - PLACE
      ?auto_441088 - PLACE
      ?auto_441089 - HOIST
      ?auto_441085 - SURFACE
      ?auto_441087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441090 ?auto_441086 ) ( IS-CRATE ?auto_441084 ) ( not ( = ?auto_441083 ?auto_441084 ) ) ( not ( = ?auto_441082 ?auto_441083 ) ) ( not ( = ?auto_441082 ?auto_441084 ) ) ( not ( = ?auto_441088 ?auto_441086 ) ) ( HOIST-AT ?auto_441089 ?auto_441088 ) ( not ( = ?auto_441090 ?auto_441089 ) ) ( AVAILABLE ?auto_441089 ) ( SURFACE-AT ?auto_441084 ?auto_441088 ) ( ON ?auto_441084 ?auto_441085 ) ( CLEAR ?auto_441084 ) ( not ( = ?auto_441083 ?auto_441085 ) ) ( not ( = ?auto_441084 ?auto_441085 ) ) ( not ( = ?auto_441082 ?auto_441085 ) ) ( TRUCK-AT ?auto_441087 ?auto_441086 ) ( SURFACE-AT ?auto_441082 ?auto_441086 ) ( CLEAR ?auto_441082 ) ( LIFTING ?auto_441090 ?auto_441083 ) ( IS-CRATE ?auto_441083 ) ( ON ?auto_441082 ?auto_441081 ) ( not ( = ?auto_441081 ?auto_441082 ) ) ( not ( = ?auto_441081 ?auto_441083 ) ) ( not ( = ?auto_441081 ?auto_441084 ) ) ( not ( = ?auto_441081 ?auto_441085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441082 ?auto_441083 ?auto_441084 )
      ( MAKE-3CRATE-VERIFY ?auto_441081 ?auto_441082 ?auto_441083 ?auto_441084 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_441109 - SURFACE
      ?auto_441110 - SURFACE
      ?auto_441111 - SURFACE
      ?auto_441112 - SURFACE
    )
    :vars
    (
      ?auto_441114 - HOIST
      ?auto_441113 - PLACE
      ?auto_441115 - PLACE
      ?auto_441116 - HOIST
      ?auto_441118 - SURFACE
      ?auto_441117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441114 ?auto_441113 ) ( IS-CRATE ?auto_441112 ) ( not ( = ?auto_441111 ?auto_441112 ) ) ( not ( = ?auto_441110 ?auto_441111 ) ) ( not ( = ?auto_441110 ?auto_441112 ) ) ( not ( = ?auto_441115 ?auto_441113 ) ) ( HOIST-AT ?auto_441116 ?auto_441115 ) ( not ( = ?auto_441114 ?auto_441116 ) ) ( AVAILABLE ?auto_441116 ) ( SURFACE-AT ?auto_441112 ?auto_441115 ) ( ON ?auto_441112 ?auto_441118 ) ( CLEAR ?auto_441112 ) ( not ( = ?auto_441111 ?auto_441118 ) ) ( not ( = ?auto_441112 ?auto_441118 ) ) ( not ( = ?auto_441110 ?auto_441118 ) ) ( TRUCK-AT ?auto_441117 ?auto_441113 ) ( SURFACE-AT ?auto_441110 ?auto_441113 ) ( CLEAR ?auto_441110 ) ( IS-CRATE ?auto_441111 ) ( AVAILABLE ?auto_441114 ) ( IN ?auto_441111 ?auto_441117 ) ( ON ?auto_441110 ?auto_441109 ) ( not ( = ?auto_441109 ?auto_441110 ) ) ( not ( = ?auto_441109 ?auto_441111 ) ) ( not ( = ?auto_441109 ?auto_441112 ) ) ( not ( = ?auto_441109 ?auto_441118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441110 ?auto_441111 ?auto_441112 )
      ( MAKE-3CRATE-VERIFY ?auto_441109 ?auto_441110 ?auto_441111 ?auto_441112 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441400 - SURFACE
      ?auto_441401 - SURFACE
      ?auto_441402 - SURFACE
      ?auto_441404 - SURFACE
      ?auto_441403 - SURFACE
    )
    :vars
    (
      ?auto_441405 - HOIST
      ?auto_441406 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441405 ?auto_441406 ) ( SURFACE-AT ?auto_441404 ?auto_441406 ) ( CLEAR ?auto_441404 ) ( LIFTING ?auto_441405 ?auto_441403 ) ( IS-CRATE ?auto_441403 ) ( not ( = ?auto_441404 ?auto_441403 ) ) ( ON ?auto_441401 ?auto_441400 ) ( ON ?auto_441402 ?auto_441401 ) ( ON ?auto_441404 ?auto_441402 ) ( not ( = ?auto_441400 ?auto_441401 ) ) ( not ( = ?auto_441400 ?auto_441402 ) ) ( not ( = ?auto_441400 ?auto_441404 ) ) ( not ( = ?auto_441400 ?auto_441403 ) ) ( not ( = ?auto_441401 ?auto_441402 ) ) ( not ( = ?auto_441401 ?auto_441404 ) ) ( not ( = ?auto_441401 ?auto_441403 ) ) ( not ( = ?auto_441402 ?auto_441404 ) ) ( not ( = ?auto_441402 ?auto_441403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_441404 ?auto_441403 )
      ( MAKE-4CRATE-VERIFY ?auto_441400 ?auto_441401 ?auto_441402 ?auto_441404 ?auto_441403 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441425 - SURFACE
      ?auto_441426 - SURFACE
      ?auto_441427 - SURFACE
      ?auto_441429 - SURFACE
      ?auto_441428 - SURFACE
    )
    :vars
    (
      ?auto_441430 - HOIST
      ?auto_441431 - PLACE
      ?auto_441432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441430 ?auto_441431 ) ( SURFACE-AT ?auto_441429 ?auto_441431 ) ( CLEAR ?auto_441429 ) ( IS-CRATE ?auto_441428 ) ( not ( = ?auto_441429 ?auto_441428 ) ) ( TRUCK-AT ?auto_441432 ?auto_441431 ) ( AVAILABLE ?auto_441430 ) ( IN ?auto_441428 ?auto_441432 ) ( ON ?auto_441429 ?auto_441427 ) ( not ( = ?auto_441427 ?auto_441429 ) ) ( not ( = ?auto_441427 ?auto_441428 ) ) ( ON ?auto_441426 ?auto_441425 ) ( ON ?auto_441427 ?auto_441426 ) ( not ( = ?auto_441425 ?auto_441426 ) ) ( not ( = ?auto_441425 ?auto_441427 ) ) ( not ( = ?auto_441425 ?auto_441429 ) ) ( not ( = ?auto_441425 ?auto_441428 ) ) ( not ( = ?auto_441426 ?auto_441427 ) ) ( not ( = ?auto_441426 ?auto_441429 ) ) ( not ( = ?auto_441426 ?auto_441428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441427 ?auto_441429 ?auto_441428 )
      ( MAKE-4CRATE-VERIFY ?auto_441425 ?auto_441426 ?auto_441427 ?auto_441429 ?auto_441428 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441455 - SURFACE
      ?auto_441456 - SURFACE
      ?auto_441457 - SURFACE
      ?auto_441459 - SURFACE
      ?auto_441458 - SURFACE
    )
    :vars
    (
      ?auto_441463 - HOIST
      ?auto_441461 - PLACE
      ?auto_441460 - TRUCK
      ?auto_441462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441463 ?auto_441461 ) ( SURFACE-AT ?auto_441459 ?auto_441461 ) ( CLEAR ?auto_441459 ) ( IS-CRATE ?auto_441458 ) ( not ( = ?auto_441459 ?auto_441458 ) ) ( AVAILABLE ?auto_441463 ) ( IN ?auto_441458 ?auto_441460 ) ( ON ?auto_441459 ?auto_441457 ) ( not ( = ?auto_441457 ?auto_441459 ) ) ( not ( = ?auto_441457 ?auto_441458 ) ) ( TRUCK-AT ?auto_441460 ?auto_441462 ) ( not ( = ?auto_441462 ?auto_441461 ) ) ( ON ?auto_441456 ?auto_441455 ) ( ON ?auto_441457 ?auto_441456 ) ( not ( = ?auto_441455 ?auto_441456 ) ) ( not ( = ?auto_441455 ?auto_441457 ) ) ( not ( = ?auto_441455 ?auto_441459 ) ) ( not ( = ?auto_441455 ?auto_441458 ) ) ( not ( = ?auto_441456 ?auto_441457 ) ) ( not ( = ?auto_441456 ?auto_441459 ) ) ( not ( = ?auto_441456 ?auto_441458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441457 ?auto_441459 ?auto_441458 )
      ( MAKE-4CRATE-VERIFY ?auto_441455 ?auto_441456 ?auto_441457 ?auto_441459 ?auto_441458 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441489 - SURFACE
      ?auto_441490 - SURFACE
      ?auto_441491 - SURFACE
      ?auto_441493 - SURFACE
      ?auto_441492 - SURFACE
    )
    :vars
    (
      ?auto_441498 - HOIST
      ?auto_441494 - PLACE
      ?auto_441495 - TRUCK
      ?auto_441497 - PLACE
      ?auto_441496 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_441498 ?auto_441494 ) ( SURFACE-AT ?auto_441493 ?auto_441494 ) ( CLEAR ?auto_441493 ) ( IS-CRATE ?auto_441492 ) ( not ( = ?auto_441493 ?auto_441492 ) ) ( AVAILABLE ?auto_441498 ) ( ON ?auto_441493 ?auto_441491 ) ( not ( = ?auto_441491 ?auto_441493 ) ) ( not ( = ?auto_441491 ?auto_441492 ) ) ( TRUCK-AT ?auto_441495 ?auto_441497 ) ( not ( = ?auto_441497 ?auto_441494 ) ) ( HOIST-AT ?auto_441496 ?auto_441497 ) ( LIFTING ?auto_441496 ?auto_441492 ) ( not ( = ?auto_441498 ?auto_441496 ) ) ( ON ?auto_441490 ?auto_441489 ) ( ON ?auto_441491 ?auto_441490 ) ( not ( = ?auto_441489 ?auto_441490 ) ) ( not ( = ?auto_441489 ?auto_441491 ) ) ( not ( = ?auto_441489 ?auto_441493 ) ) ( not ( = ?auto_441489 ?auto_441492 ) ) ( not ( = ?auto_441490 ?auto_441491 ) ) ( not ( = ?auto_441490 ?auto_441493 ) ) ( not ( = ?auto_441490 ?auto_441492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441491 ?auto_441493 ?auto_441492 )
      ( MAKE-4CRATE-VERIFY ?auto_441489 ?auto_441490 ?auto_441491 ?auto_441493 ?auto_441492 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441527 - SURFACE
      ?auto_441528 - SURFACE
      ?auto_441529 - SURFACE
      ?auto_441531 - SURFACE
      ?auto_441530 - SURFACE
    )
    :vars
    (
      ?auto_441535 - HOIST
      ?auto_441532 - PLACE
      ?auto_441536 - TRUCK
      ?auto_441534 - PLACE
      ?auto_441537 - HOIST
      ?auto_441533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_441535 ?auto_441532 ) ( SURFACE-AT ?auto_441531 ?auto_441532 ) ( CLEAR ?auto_441531 ) ( IS-CRATE ?auto_441530 ) ( not ( = ?auto_441531 ?auto_441530 ) ) ( AVAILABLE ?auto_441535 ) ( ON ?auto_441531 ?auto_441529 ) ( not ( = ?auto_441529 ?auto_441531 ) ) ( not ( = ?auto_441529 ?auto_441530 ) ) ( TRUCK-AT ?auto_441536 ?auto_441534 ) ( not ( = ?auto_441534 ?auto_441532 ) ) ( HOIST-AT ?auto_441537 ?auto_441534 ) ( not ( = ?auto_441535 ?auto_441537 ) ) ( AVAILABLE ?auto_441537 ) ( SURFACE-AT ?auto_441530 ?auto_441534 ) ( ON ?auto_441530 ?auto_441533 ) ( CLEAR ?auto_441530 ) ( not ( = ?auto_441531 ?auto_441533 ) ) ( not ( = ?auto_441530 ?auto_441533 ) ) ( not ( = ?auto_441529 ?auto_441533 ) ) ( ON ?auto_441528 ?auto_441527 ) ( ON ?auto_441529 ?auto_441528 ) ( not ( = ?auto_441527 ?auto_441528 ) ) ( not ( = ?auto_441527 ?auto_441529 ) ) ( not ( = ?auto_441527 ?auto_441531 ) ) ( not ( = ?auto_441527 ?auto_441530 ) ) ( not ( = ?auto_441527 ?auto_441533 ) ) ( not ( = ?auto_441528 ?auto_441529 ) ) ( not ( = ?auto_441528 ?auto_441531 ) ) ( not ( = ?auto_441528 ?auto_441530 ) ) ( not ( = ?auto_441528 ?auto_441533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441529 ?auto_441531 ?auto_441530 )
      ( MAKE-4CRATE-VERIFY ?auto_441527 ?auto_441528 ?auto_441529 ?auto_441531 ?auto_441530 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441566 - SURFACE
      ?auto_441567 - SURFACE
      ?auto_441568 - SURFACE
      ?auto_441570 - SURFACE
      ?auto_441569 - SURFACE
    )
    :vars
    (
      ?auto_441574 - HOIST
      ?auto_441576 - PLACE
      ?auto_441572 - PLACE
      ?auto_441573 - HOIST
      ?auto_441575 - SURFACE
      ?auto_441571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441574 ?auto_441576 ) ( SURFACE-AT ?auto_441570 ?auto_441576 ) ( CLEAR ?auto_441570 ) ( IS-CRATE ?auto_441569 ) ( not ( = ?auto_441570 ?auto_441569 ) ) ( AVAILABLE ?auto_441574 ) ( ON ?auto_441570 ?auto_441568 ) ( not ( = ?auto_441568 ?auto_441570 ) ) ( not ( = ?auto_441568 ?auto_441569 ) ) ( not ( = ?auto_441572 ?auto_441576 ) ) ( HOIST-AT ?auto_441573 ?auto_441572 ) ( not ( = ?auto_441574 ?auto_441573 ) ) ( AVAILABLE ?auto_441573 ) ( SURFACE-AT ?auto_441569 ?auto_441572 ) ( ON ?auto_441569 ?auto_441575 ) ( CLEAR ?auto_441569 ) ( not ( = ?auto_441570 ?auto_441575 ) ) ( not ( = ?auto_441569 ?auto_441575 ) ) ( not ( = ?auto_441568 ?auto_441575 ) ) ( TRUCK-AT ?auto_441571 ?auto_441576 ) ( ON ?auto_441567 ?auto_441566 ) ( ON ?auto_441568 ?auto_441567 ) ( not ( = ?auto_441566 ?auto_441567 ) ) ( not ( = ?auto_441566 ?auto_441568 ) ) ( not ( = ?auto_441566 ?auto_441570 ) ) ( not ( = ?auto_441566 ?auto_441569 ) ) ( not ( = ?auto_441566 ?auto_441575 ) ) ( not ( = ?auto_441567 ?auto_441568 ) ) ( not ( = ?auto_441567 ?auto_441570 ) ) ( not ( = ?auto_441567 ?auto_441569 ) ) ( not ( = ?auto_441567 ?auto_441575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441568 ?auto_441570 ?auto_441569 )
      ( MAKE-4CRATE-VERIFY ?auto_441566 ?auto_441567 ?auto_441568 ?auto_441570 ?auto_441569 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441605 - SURFACE
      ?auto_441606 - SURFACE
      ?auto_441607 - SURFACE
      ?auto_441609 - SURFACE
      ?auto_441608 - SURFACE
    )
    :vars
    (
      ?auto_441614 - HOIST
      ?auto_441615 - PLACE
      ?auto_441611 - PLACE
      ?auto_441610 - HOIST
      ?auto_441612 - SURFACE
      ?auto_441613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441614 ?auto_441615 ) ( IS-CRATE ?auto_441608 ) ( not ( = ?auto_441609 ?auto_441608 ) ) ( not ( = ?auto_441607 ?auto_441609 ) ) ( not ( = ?auto_441607 ?auto_441608 ) ) ( not ( = ?auto_441611 ?auto_441615 ) ) ( HOIST-AT ?auto_441610 ?auto_441611 ) ( not ( = ?auto_441614 ?auto_441610 ) ) ( AVAILABLE ?auto_441610 ) ( SURFACE-AT ?auto_441608 ?auto_441611 ) ( ON ?auto_441608 ?auto_441612 ) ( CLEAR ?auto_441608 ) ( not ( = ?auto_441609 ?auto_441612 ) ) ( not ( = ?auto_441608 ?auto_441612 ) ) ( not ( = ?auto_441607 ?auto_441612 ) ) ( TRUCK-AT ?auto_441613 ?auto_441615 ) ( SURFACE-AT ?auto_441607 ?auto_441615 ) ( CLEAR ?auto_441607 ) ( LIFTING ?auto_441614 ?auto_441609 ) ( IS-CRATE ?auto_441609 ) ( ON ?auto_441606 ?auto_441605 ) ( ON ?auto_441607 ?auto_441606 ) ( not ( = ?auto_441605 ?auto_441606 ) ) ( not ( = ?auto_441605 ?auto_441607 ) ) ( not ( = ?auto_441605 ?auto_441609 ) ) ( not ( = ?auto_441605 ?auto_441608 ) ) ( not ( = ?auto_441605 ?auto_441612 ) ) ( not ( = ?auto_441606 ?auto_441607 ) ) ( not ( = ?auto_441606 ?auto_441609 ) ) ( not ( = ?auto_441606 ?auto_441608 ) ) ( not ( = ?auto_441606 ?auto_441612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441607 ?auto_441609 ?auto_441608 )
      ( MAKE-4CRATE-VERIFY ?auto_441605 ?auto_441606 ?auto_441607 ?auto_441609 ?auto_441608 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_441644 - SURFACE
      ?auto_441645 - SURFACE
      ?auto_441646 - SURFACE
      ?auto_441648 - SURFACE
      ?auto_441647 - SURFACE
    )
    :vars
    (
      ?auto_441653 - HOIST
      ?auto_441649 - PLACE
      ?auto_441654 - PLACE
      ?auto_441652 - HOIST
      ?auto_441650 - SURFACE
      ?auto_441651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_441653 ?auto_441649 ) ( IS-CRATE ?auto_441647 ) ( not ( = ?auto_441648 ?auto_441647 ) ) ( not ( = ?auto_441646 ?auto_441648 ) ) ( not ( = ?auto_441646 ?auto_441647 ) ) ( not ( = ?auto_441654 ?auto_441649 ) ) ( HOIST-AT ?auto_441652 ?auto_441654 ) ( not ( = ?auto_441653 ?auto_441652 ) ) ( AVAILABLE ?auto_441652 ) ( SURFACE-AT ?auto_441647 ?auto_441654 ) ( ON ?auto_441647 ?auto_441650 ) ( CLEAR ?auto_441647 ) ( not ( = ?auto_441648 ?auto_441650 ) ) ( not ( = ?auto_441647 ?auto_441650 ) ) ( not ( = ?auto_441646 ?auto_441650 ) ) ( TRUCK-AT ?auto_441651 ?auto_441649 ) ( SURFACE-AT ?auto_441646 ?auto_441649 ) ( CLEAR ?auto_441646 ) ( IS-CRATE ?auto_441648 ) ( AVAILABLE ?auto_441653 ) ( IN ?auto_441648 ?auto_441651 ) ( ON ?auto_441645 ?auto_441644 ) ( ON ?auto_441646 ?auto_441645 ) ( not ( = ?auto_441644 ?auto_441645 ) ) ( not ( = ?auto_441644 ?auto_441646 ) ) ( not ( = ?auto_441644 ?auto_441648 ) ) ( not ( = ?auto_441644 ?auto_441647 ) ) ( not ( = ?auto_441644 ?auto_441650 ) ) ( not ( = ?auto_441645 ?auto_441646 ) ) ( not ( = ?auto_441645 ?auto_441648 ) ) ( not ( = ?auto_441645 ?auto_441647 ) ) ( not ( = ?auto_441645 ?auto_441650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_441646 ?auto_441648 ?auto_441647 )
      ( MAKE-4CRATE-VERIFY ?auto_441644 ?auto_441645 ?auto_441646 ?auto_441648 ?auto_441647 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442304 - SURFACE
      ?auto_442305 - SURFACE
      ?auto_442306 - SURFACE
      ?auto_442308 - SURFACE
      ?auto_442307 - SURFACE
      ?auto_442309 - SURFACE
    )
    :vars
    (
      ?auto_442310 - HOIST
      ?auto_442311 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442310 ?auto_442311 ) ( SURFACE-AT ?auto_442307 ?auto_442311 ) ( CLEAR ?auto_442307 ) ( LIFTING ?auto_442310 ?auto_442309 ) ( IS-CRATE ?auto_442309 ) ( not ( = ?auto_442307 ?auto_442309 ) ) ( ON ?auto_442305 ?auto_442304 ) ( ON ?auto_442306 ?auto_442305 ) ( ON ?auto_442308 ?auto_442306 ) ( ON ?auto_442307 ?auto_442308 ) ( not ( = ?auto_442304 ?auto_442305 ) ) ( not ( = ?auto_442304 ?auto_442306 ) ) ( not ( = ?auto_442304 ?auto_442308 ) ) ( not ( = ?auto_442304 ?auto_442307 ) ) ( not ( = ?auto_442304 ?auto_442309 ) ) ( not ( = ?auto_442305 ?auto_442306 ) ) ( not ( = ?auto_442305 ?auto_442308 ) ) ( not ( = ?auto_442305 ?auto_442307 ) ) ( not ( = ?auto_442305 ?auto_442309 ) ) ( not ( = ?auto_442306 ?auto_442308 ) ) ( not ( = ?auto_442306 ?auto_442307 ) ) ( not ( = ?auto_442306 ?auto_442309 ) ) ( not ( = ?auto_442308 ?auto_442307 ) ) ( not ( = ?auto_442308 ?auto_442309 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_442307 ?auto_442309 )
      ( MAKE-5CRATE-VERIFY ?auto_442304 ?auto_442305 ?auto_442306 ?auto_442308 ?auto_442307 ?auto_442309 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442338 - SURFACE
      ?auto_442339 - SURFACE
      ?auto_442340 - SURFACE
      ?auto_442342 - SURFACE
      ?auto_442341 - SURFACE
      ?auto_442343 - SURFACE
    )
    :vars
    (
      ?auto_442345 - HOIST
      ?auto_442344 - PLACE
      ?auto_442346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442345 ?auto_442344 ) ( SURFACE-AT ?auto_442341 ?auto_442344 ) ( CLEAR ?auto_442341 ) ( IS-CRATE ?auto_442343 ) ( not ( = ?auto_442341 ?auto_442343 ) ) ( TRUCK-AT ?auto_442346 ?auto_442344 ) ( AVAILABLE ?auto_442345 ) ( IN ?auto_442343 ?auto_442346 ) ( ON ?auto_442341 ?auto_442342 ) ( not ( = ?auto_442342 ?auto_442341 ) ) ( not ( = ?auto_442342 ?auto_442343 ) ) ( ON ?auto_442339 ?auto_442338 ) ( ON ?auto_442340 ?auto_442339 ) ( ON ?auto_442342 ?auto_442340 ) ( not ( = ?auto_442338 ?auto_442339 ) ) ( not ( = ?auto_442338 ?auto_442340 ) ) ( not ( = ?auto_442338 ?auto_442342 ) ) ( not ( = ?auto_442338 ?auto_442341 ) ) ( not ( = ?auto_442338 ?auto_442343 ) ) ( not ( = ?auto_442339 ?auto_442340 ) ) ( not ( = ?auto_442339 ?auto_442342 ) ) ( not ( = ?auto_442339 ?auto_442341 ) ) ( not ( = ?auto_442339 ?auto_442343 ) ) ( not ( = ?auto_442340 ?auto_442342 ) ) ( not ( = ?auto_442340 ?auto_442341 ) ) ( not ( = ?auto_442340 ?auto_442343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442342 ?auto_442341 ?auto_442343 )
      ( MAKE-5CRATE-VERIFY ?auto_442338 ?auto_442339 ?auto_442340 ?auto_442342 ?auto_442341 ?auto_442343 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442378 - SURFACE
      ?auto_442379 - SURFACE
      ?auto_442380 - SURFACE
      ?auto_442382 - SURFACE
      ?auto_442381 - SURFACE
      ?auto_442383 - SURFACE
    )
    :vars
    (
      ?auto_442384 - HOIST
      ?auto_442385 - PLACE
      ?auto_442387 - TRUCK
      ?auto_442386 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442384 ?auto_442385 ) ( SURFACE-AT ?auto_442381 ?auto_442385 ) ( CLEAR ?auto_442381 ) ( IS-CRATE ?auto_442383 ) ( not ( = ?auto_442381 ?auto_442383 ) ) ( AVAILABLE ?auto_442384 ) ( IN ?auto_442383 ?auto_442387 ) ( ON ?auto_442381 ?auto_442382 ) ( not ( = ?auto_442382 ?auto_442381 ) ) ( not ( = ?auto_442382 ?auto_442383 ) ) ( TRUCK-AT ?auto_442387 ?auto_442386 ) ( not ( = ?auto_442386 ?auto_442385 ) ) ( ON ?auto_442379 ?auto_442378 ) ( ON ?auto_442380 ?auto_442379 ) ( ON ?auto_442382 ?auto_442380 ) ( not ( = ?auto_442378 ?auto_442379 ) ) ( not ( = ?auto_442378 ?auto_442380 ) ) ( not ( = ?auto_442378 ?auto_442382 ) ) ( not ( = ?auto_442378 ?auto_442381 ) ) ( not ( = ?auto_442378 ?auto_442383 ) ) ( not ( = ?auto_442379 ?auto_442380 ) ) ( not ( = ?auto_442379 ?auto_442382 ) ) ( not ( = ?auto_442379 ?auto_442381 ) ) ( not ( = ?auto_442379 ?auto_442383 ) ) ( not ( = ?auto_442380 ?auto_442382 ) ) ( not ( = ?auto_442380 ?auto_442381 ) ) ( not ( = ?auto_442380 ?auto_442383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442382 ?auto_442381 ?auto_442383 )
      ( MAKE-5CRATE-VERIFY ?auto_442378 ?auto_442379 ?auto_442380 ?auto_442382 ?auto_442381 ?auto_442383 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442423 - SURFACE
      ?auto_442424 - SURFACE
      ?auto_442425 - SURFACE
      ?auto_442427 - SURFACE
      ?auto_442426 - SURFACE
      ?auto_442428 - SURFACE
    )
    :vars
    (
      ?auto_442429 - HOIST
      ?auto_442432 - PLACE
      ?auto_442431 - TRUCK
      ?auto_442433 - PLACE
      ?auto_442430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_442429 ?auto_442432 ) ( SURFACE-AT ?auto_442426 ?auto_442432 ) ( CLEAR ?auto_442426 ) ( IS-CRATE ?auto_442428 ) ( not ( = ?auto_442426 ?auto_442428 ) ) ( AVAILABLE ?auto_442429 ) ( ON ?auto_442426 ?auto_442427 ) ( not ( = ?auto_442427 ?auto_442426 ) ) ( not ( = ?auto_442427 ?auto_442428 ) ) ( TRUCK-AT ?auto_442431 ?auto_442433 ) ( not ( = ?auto_442433 ?auto_442432 ) ) ( HOIST-AT ?auto_442430 ?auto_442433 ) ( LIFTING ?auto_442430 ?auto_442428 ) ( not ( = ?auto_442429 ?auto_442430 ) ) ( ON ?auto_442424 ?auto_442423 ) ( ON ?auto_442425 ?auto_442424 ) ( ON ?auto_442427 ?auto_442425 ) ( not ( = ?auto_442423 ?auto_442424 ) ) ( not ( = ?auto_442423 ?auto_442425 ) ) ( not ( = ?auto_442423 ?auto_442427 ) ) ( not ( = ?auto_442423 ?auto_442426 ) ) ( not ( = ?auto_442423 ?auto_442428 ) ) ( not ( = ?auto_442424 ?auto_442425 ) ) ( not ( = ?auto_442424 ?auto_442427 ) ) ( not ( = ?auto_442424 ?auto_442426 ) ) ( not ( = ?auto_442424 ?auto_442428 ) ) ( not ( = ?auto_442425 ?auto_442427 ) ) ( not ( = ?auto_442425 ?auto_442426 ) ) ( not ( = ?auto_442425 ?auto_442428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442427 ?auto_442426 ?auto_442428 )
      ( MAKE-5CRATE-VERIFY ?auto_442423 ?auto_442424 ?auto_442425 ?auto_442427 ?auto_442426 ?auto_442428 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442473 - SURFACE
      ?auto_442474 - SURFACE
      ?auto_442475 - SURFACE
      ?auto_442477 - SURFACE
      ?auto_442476 - SURFACE
      ?auto_442478 - SURFACE
    )
    :vars
    (
      ?auto_442484 - HOIST
      ?auto_442481 - PLACE
      ?auto_442479 - TRUCK
      ?auto_442483 - PLACE
      ?auto_442480 - HOIST
      ?auto_442482 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_442484 ?auto_442481 ) ( SURFACE-AT ?auto_442476 ?auto_442481 ) ( CLEAR ?auto_442476 ) ( IS-CRATE ?auto_442478 ) ( not ( = ?auto_442476 ?auto_442478 ) ) ( AVAILABLE ?auto_442484 ) ( ON ?auto_442476 ?auto_442477 ) ( not ( = ?auto_442477 ?auto_442476 ) ) ( not ( = ?auto_442477 ?auto_442478 ) ) ( TRUCK-AT ?auto_442479 ?auto_442483 ) ( not ( = ?auto_442483 ?auto_442481 ) ) ( HOIST-AT ?auto_442480 ?auto_442483 ) ( not ( = ?auto_442484 ?auto_442480 ) ) ( AVAILABLE ?auto_442480 ) ( SURFACE-AT ?auto_442478 ?auto_442483 ) ( ON ?auto_442478 ?auto_442482 ) ( CLEAR ?auto_442478 ) ( not ( = ?auto_442476 ?auto_442482 ) ) ( not ( = ?auto_442478 ?auto_442482 ) ) ( not ( = ?auto_442477 ?auto_442482 ) ) ( ON ?auto_442474 ?auto_442473 ) ( ON ?auto_442475 ?auto_442474 ) ( ON ?auto_442477 ?auto_442475 ) ( not ( = ?auto_442473 ?auto_442474 ) ) ( not ( = ?auto_442473 ?auto_442475 ) ) ( not ( = ?auto_442473 ?auto_442477 ) ) ( not ( = ?auto_442473 ?auto_442476 ) ) ( not ( = ?auto_442473 ?auto_442478 ) ) ( not ( = ?auto_442473 ?auto_442482 ) ) ( not ( = ?auto_442474 ?auto_442475 ) ) ( not ( = ?auto_442474 ?auto_442477 ) ) ( not ( = ?auto_442474 ?auto_442476 ) ) ( not ( = ?auto_442474 ?auto_442478 ) ) ( not ( = ?auto_442474 ?auto_442482 ) ) ( not ( = ?auto_442475 ?auto_442477 ) ) ( not ( = ?auto_442475 ?auto_442476 ) ) ( not ( = ?auto_442475 ?auto_442478 ) ) ( not ( = ?auto_442475 ?auto_442482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442477 ?auto_442476 ?auto_442478 )
      ( MAKE-5CRATE-VERIFY ?auto_442473 ?auto_442474 ?auto_442475 ?auto_442477 ?auto_442476 ?auto_442478 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442524 - SURFACE
      ?auto_442525 - SURFACE
      ?auto_442526 - SURFACE
      ?auto_442528 - SURFACE
      ?auto_442527 - SURFACE
      ?auto_442529 - SURFACE
    )
    :vars
    (
      ?auto_442532 - HOIST
      ?auto_442531 - PLACE
      ?auto_442530 - PLACE
      ?auto_442533 - HOIST
      ?auto_442534 - SURFACE
      ?auto_442535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442532 ?auto_442531 ) ( SURFACE-AT ?auto_442527 ?auto_442531 ) ( CLEAR ?auto_442527 ) ( IS-CRATE ?auto_442529 ) ( not ( = ?auto_442527 ?auto_442529 ) ) ( AVAILABLE ?auto_442532 ) ( ON ?auto_442527 ?auto_442528 ) ( not ( = ?auto_442528 ?auto_442527 ) ) ( not ( = ?auto_442528 ?auto_442529 ) ) ( not ( = ?auto_442530 ?auto_442531 ) ) ( HOIST-AT ?auto_442533 ?auto_442530 ) ( not ( = ?auto_442532 ?auto_442533 ) ) ( AVAILABLE ?auto_442533 ) ( SURFACE-AT ?auto_442529 ?auto_442530 ) ( ON ?auto_442529 ?auto_442534 ) ( CLEAR ?auto_442529 ) ( not ( = ?auto_442527 ?auto_442534 ) ) ( not ( = ?auto_442529 ?auto_442534 ) ) ( not ( = ?auto_442528 ?auto_442534 ) ) ( TRUCK-AT ?auto_442535 ?auto_442531 ) ( ON ?auto_442525 ?auto_442524 ) ( ON ?auto_442526 ?auto_442525 ) ( ON ?auto_442528 ?auto_442526 ) ( not ( = ?auto_442524 ?auto_442525 ) ) ( not ( = ?auto_442524 ?auto_442526 ) ) ( not ( = ?auto_442524 ?auto_442528 ) ) ( not ( = ?auto_442524 ?auto_442527 ) ) ( not ( = ?auto_442524 ?auto_442529 ) ) ( not ( = ?auto_442524 ?auto_442534 ) ) ( not ( = ?auto_442525 ?auto_442526 ) ) ( not ( = ?auto_442525 ?auto_442528 ) ) ( not ( = ?auto_442525 ?auto_442527 ) ) ( not ( = ?auto_442525 ?auto_442529 ) ) ( not ( = ?auto_442525 ?auto_442534 ) ) ( not ( = ?auto_442526 ?auto_442528 ) ) ( not ( = ?auto_442526 ?auto_442527 ) ) ( not ( = ?auto_442526 ?auto_442529 ) ) ( not ( = ?auto_442526 ?auto_442534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442528 ?auto_442527 ?auto_442529 )
      ( MAKE-5CRATE-VERIFY ?auto_442524 ?auto_442525 ?auto_442526 ?auto_442528 ?auto_442527 ?auto_442529 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442575 - SURFACE
      ?auto_442576 - SURFACE
      ?auto_442577 - SURFACE
      ?auto_442579 - SURFACE
      ?auto_442578 - SURFACE
      ?auto_442580 - SURFACE
    )
    :vars
    (
      ?auto_442585 - HOIST
      ?auto_442584 - PLACE
      ?auto_442581 - PLACE
      ?auto_442582 - HOIST
      ?auto_442583 - SURFACE
      ?auto_442586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442585 ?auto_442584 ) ( IS-CRATE ?auto_442580 ) ( not ( = ?auto_442578 ?auto_442580 ) ) ( not ( = ?auto_442579 ?auto_442578 ) ) ( not ( = ?auto_442579 ?auto_442580 ) ) ( not ( = ?auto_442581 ?auto_442584 ) ) ( HOIST-AT ?auto_442582 ?auto_442581 ) ( not ( = ?auto_442585 ?auto_442582 ) ) ( AVAILABLE ?auto_442582 ) ( SURFACE-AT ?auto_442580 ?auto_442581 ) ( ON ?auto_442580 ?auto_442583 ) ( CLEAR ?auto_442580 ) ( not ( = ?auto_442578 ?auto_442583 ) ) ( not ( = ?auto_442580 ?auto_442583 ) ) ( not ( = ?auto_442579 ?auto_442583 ) ) ( TRUCK-AT ?auto_442586 ?auto_442584 ) ( SURFACE-AT ?auto_442579 ?auto_442584 ) ( CLEAR ?auto_442579 ) ( LIFTING ?auto_442585 ?auto_442578 ) ( IS-CRATE ?auto_442578 ) ( ON ?auto_442576 ?auto_442575 ) ( ON ?auto_442577 ?auto_442576 ) ( ON ?auto_442579 ?auto_442577 ) ( not ( = ?auto_442575 ?auto_442576 ) ) ( not ( = ?auto_442575 ?auto_442577 ) ) ( not ( = ?auto_442575 ?auto_442579 ) ) ( not ( = ?auto_442575 ?auto_442578 ) ) ( not ( = ?auto_442575 ?auto_442580 ) ) ( not ( = ?auto_442575 ?auto_442583 ) ) ( not ( = ?auto_442576 ?auto_442577 ) ) ( not ( = ?auto_442576 ?auto_442579 ) ) ( not ( = ?auto_442576 ?auto_442578 ) ) ( not ( = ?auto_442576 ?auto_442580 ) ) ( not ( = ?auto_442576 ?auto_442583 ) ) ( not ( = ?auto_442577 ?auto_442579 ) ) ( not ( = ?auto_442577 ?auto_442578 ) ) ( not ( = ?auto_442577 ?auto_442580 ) ) ( not ( = ?auto_442577 ?auto_442583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442579 ?auto_442578 ?auto_442580 )
      ( MAKE-5CRATE-VERIFY ?auto_442575 ?auto_442576 ?auto_442577 ?auto_442579 ?auto_442578 ?auto_442580 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_442626 - SURFACE
      ?auto_442627 - SURFACE
      ?auto_442628 - SURFACE
      ?auto_442630 - SURFACE
      ?auto_442629 - SURFACE
      ?auto_442631 - SURFACE
    )
    :vars
    (
      ?auto_442637 - HOIST
      ?auto_442635 - PLACE
      ?auto_442636 - PLACE
      ?auto_442633 - HOIST
      ?auto_442632 - SURFACE
      ?auto_442634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_442637 ?auto_442635 ) ( IS-CRATE ?auto_442631 ) ( not ( = ?auto_442629 ?auto_442631 ) ) ( not ( = ?auto_442630 ?auto_442629 ) ) ( not ( = ?auto_442630 ?auto_442631 ) ) ( not ( = ?auto_442636 ?auto_442635 ) ) ( HOIST-AT ?auto_442633 ?auto_442636 ) ( not ( = ?auto_442637 ?auto_442633 ) ) ( AVAILABLE ?auto_442633 ) ( SURFACE-AT ?auto_442631 ?auto_442636 ) ( ON ?auto_442631 ?auto_442632 ) ( CLEAR ?auto_442631 ) ( not ( = ?auto_442629 ?auto_442632 ) ) ( not ( = ?auto_442631 ?auto_442632 ) ) ( not ( = ?auto_442630 ?auto_442632 ) ) ( TRUCK-AT ?auto_442634 ?auto_442635 ) ( SURFACE-AT ?auto_442630 ?auto_442635 ) ( CLEAR ?auto_442630 ) ( IS-CRATE ?auto_442629 ) ( AVAILABLE ?auto_442637 ) ( IN ?auto_442629 ?auto_442634 ) ( ON ?auto_442627 ?auto_442626 ) ( ON ?auto_442628 ?auto_442627 ) ( ON ?auto_442630 ?auto_442628 ) ( not ( = ?auto_442626 ?auto_442627 ) ) ( not ( = ?auto_442626 ?auto_442628 ) ) ( not ( = ?auto_442626 ?auto_442630 ) ) ( not ( = ?auto_442626 ?auto_442629 ) ) ( not ( = ?auto_442626 ?auto_442631 ) ) ( not ( = ?auto_442626 ?auto_442632 ) ) ( not ( = ?auto_442627 ?auto_442628 ) ) ( not ( = ?auto_442627 ?auto_442630 ) ) ( not ( = ?auto_442627 ?auto_442629 ) ) ( not ( = ?auto_442627 ?auto_442631 ) ) ( not ( = ?auto_442627 ?auto_442632 ) ) ( not ( = ?auto_442628 ?auto_442630 ) ) ( not ( = ?auto_442628 ?auto_442629 ) ) ( not ( = ?auto_442628 ?auto_442631 ) ) ( not ( = ?auto_442628 ?auto_442632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_442630 ?auto_442629 ?auto_442631 )
      ( MAKE-5CRATE-VERIFY ?auto_442626 ?auto_442627 ?auto_442628 ?auto_442630 ?auto_442629 ?auto_442631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_442994 - SURFACE
      ?auto_442995 - SURFACE
    )
    :vars
    (
      ?auto_443000 - HOIST
      ?auto_442999 - PLACE
      ?auto_442997 - SURFACE
      ?auto_443002 - TRUCK
      ?auto_442998 - PLACE
      ?auto_443001 - HOIST
      ?auto_442996 - SURFACE
      ?auto_443003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443000 ?auto_442999 ) ( SURFACE-AT ?auto_442994 ?auto_442999 ) ( CLEAR ?auto_442994 ) ( IS-CRATE ?auto_442995 ) ( not ( = ?auto_442994 ?auto_442995 ) ) ( AVAILABLE ?auto_443000 ) ( ON ?auto_442994 ?auto_442997 ) ( not ( = ?auto_442997 ?auto_442994 ) ) ( not ( = ?auto_442997 ?auto_442995 ) ) ( TRUCK-AT ?auto_443002 ?auto_442998 ) ( not ( = ?auto_442998 ?auto_442999 ) ) ( HOIST-AT ?auto_443001 ?auto_442998 ) ( not ( = ?auto_443000 ?auto_443001 ) ) ( SURFACE-AT ?auto_442995 ?auto_442998 ) ( ON ?auto_442995 ?auto_442996 ) ( CLEAR ?auto_442995 ) ( not ( = ?auto_442994 ?auto_442996 ) ) ( not ( = ?auto_442995 ?auto_442996 ) ) ( not ( = ?auto_442997 ?auto_442996 ) ) ( LIFTING ?auto_443001 ?auto_443003 ) ( IS-CRATE ?auto_443003 ) ( not ( = ?auto_442994 ?auto_443003 ) ) ( not ( = ?auto_442995 ?auto_443003 ) ) ( not ( = ?auto_442997 ?auto_443003 ) ) ( not ( = ?auto_442996 ?auto_443003 ) ) )
    :subtasks
    ( ( !LOAD ?auto_443001 ?auto_443003 ?auto_443002 ?auto_442998 )
      ( MAKE-1CRATE ?auto_442994 ?auto_442995 )
      ( MAKE-1CRATE-VERIFY ?auto_442994 ?auto_442995 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_443831 - SURFACE
      ?auto_443832 - SURFACE
      ?auto_443833 - SURFACE
      ?auto_443835 - SURFACE
      ?auto_443834 - SURFACE
      ?auto_443836 - SURFACE
      ?auto_443837 - SURFACE
    )
    :vars
    (
      ?auto_443839 - HOIST
      ?auto_443838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443839 ?auto_443838 ) ( SURFACE-AT ?auto_443836 ?auto_443838 ) ( CLEAR ?auto_443836 ) ( LIFTING ?auto_443839 ?auto_443837 ) ( IS-CRATE ?auto_443837 ) ( not ( = ?auto_443836 ?auto_443837 ) ) ( ON ?auto_443832 ?auto_443831 ) ( ON ?auto_443833 ?auto_443832 ) ( ON ?auto_443835 ?auto_443833 ) ( ON ?auto_443834 ?auto_443835 ) ( ON ?auto_443836 ?auto_443834 ) ( not ( = ?auto_443831 ?auto_443832 ) ) ( not ( = ?auto_443831 ?auto_443833 ) ) ( not ( = ?auto_443831 ?auto_443835 ) ) ( not ( = ?auto_443831 ?auto_443834 ) ) ( not ( = ?auto_443831 ?auto_443836 ) ) ( not ( = ?auto_443831 ?auto_443837 ) ) ( not ( = ?auto_443832 ?auto_443833 ) ) ( not ( = ?auto_443832 ?auto_443835 ) ) ( not ( = ?auto_443832 ?auto_443834 ) ) ( not ( = ?auto_443832 ?auto_443836 ) ) ( not ( = ?auto_443832 ?auto_443837 ) ) ( not ( = ?auto_443833 ?auto_443835 ) ) ( not ( = ?auto_443833 ?auto_443834 ) ) ( not ( = ?auto_443833 ?auto_443836 ) ) ( not ( = ?auto_443833 ?auto_443837 ) ) ( not ( = ?auto_443835 ?auto_443834 ) ) ( not ( = ?auto_443835 ?auto_443836 ) ) ( not ( = ?auto_443835 ?auto_443837 ) ) ( not ( = ?auto_443834 ?auto_443836 ) ) ( not ( = ?auto_443834 ?auto_443837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_443836 ?auto_443837 )
      ( MAKE-6CRATE-VERIFY ?auto_443831 ?auto_443832 ?auto_443833 ?auto_443835 ?auto_443834 ?auto_443836 ?auto_443837 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_443875 - SURFACE
      ?auto_443876 - SURFACE
      ?auto_443877 - SURFACE
      ?auto_443879 - SURFACE
      ?auto_443878 - SURFACE
      ?auto_443880 - SURFACE
      ?auto_443881 - SURFACE
    )
    :vars
    (
      ?auto_443884 - HOIST
      ?auto_443883 - PLACE
      ?auto_443882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_443884 ?auto_443883 ) ( SURFACE-AT ?auto_443880 ?auto_443883 ) ( CLEAR ?auto_443880 ) ( IS-CRATE ?auto_443881 ) ( not ( = ?auto_443880 ?auto_443881 ) ) ( TRUCK-AT ?auto_443882 ?auto_443883 ) ( AVAILABLE ?auto_443884 ) ( IN ?auto_443881 ?auto_443882 ) ( ON ?auto_443880 ?auto_443878 ) ( not ( = ?auto_443878 ?auto_443880 ) ) ( not ( = ?auto_443878 ?auto_443881 ) ) ( ON ?auto_443876 ?auto_443875 ) ( ON ?auto_443877 ?auto_443876 ) ( ON ?auto_443879 ?auto_443877 ) ( ON ?auto_443878 ?auto_443879 ) ( not ( = ?auto_443875 ?auto_443876 ) ) ( not ( = ?auto_443875 ?auto_443877 ) ) ( not ( = ?auto_443875 ?auto_443879 ) ) ( not ( = ?auto_443875 ?auto_443878 ) ) ( not ( = ?auto_443875 ?auto_443880 ) ) ( not ( = ?auto_443875 ?auto_443881 ) ) ( not ( = ?auto_443876 ?auto_443877 ) ) ( not ( = ?auto_443876 ?auto_443879 ) ) ( not ( = ?auto_443876 ?auto_443878 ) ) ( not ( = ?auto_443876 ?auto_443880 ) ) ( not ( = ?auto_443876 ?auto_443881 ) ) ( not ( = ?auto_443877 ?auto_443879 ) ) ( not ( = ?auto_443877 ?auto_443878 ) ) ( not ( = ?auto_443877 ?auto_443880 ) ) ( not ( = ?auto_443877 ?auto_443881 ) ) ( not ( = ?auto_443879 ?auto_443878 ) ) ( not ( = ?auto_443879 ?auto_443880 ) ) ( not ( = ?auto_443879 ?auto_443881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443878 ?auto_443880 ?auto_443881 )
      ( MAKE-6CRATE-VERIFY ?auto_443875 ?auto_443876 ?auto_443877 ?auto_443879 ?auto_443878 ?auto_443880 ?auto_443881 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_443926 - SURFACE
      ?auto_443927 - SURFACE
      ?auto_443928 - SURFACE
      ?auto_443930 - SURFACE
      ?auto_443929 - SURFACE
      ?auto_443931 - SURFACE
      ?auto_443932 - SURFACE
    )
    :vars
    (
      ?auto_443933 - HOIST
      ?auto_443936 - PLACE
      ?auto_443934 - TRUCK
      ?auto_443935 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_443933 ?auto_443936 ) ( SURFACE-AT ?auto_443931 ?auto_443936 ) ( CLEAR ?auto_443931 ) ( IS-CRATE ?auto_443932 ) ( not ( = ?auto_443931 ?auto_443932 ) ) ( AVAILABLE ?auto_443933 ) ( IN ?auto_443932 ?auto_443934 ) ( ON ?auto_443931 ?auto_443929 ) ( not ( = ?auto_443929 ?auto_443931 ) ) ( not ( = ?auto_443929 ?auto_443932 ) ) ( TRUCK-AT ?auto_443934 ?auto_443935 ) ( not ( = ?auto_443935 ?auto_443936 ) ) ( ON ?auto_443927 ?auto_443926 ) ( ON ?auto_443928 ?auto_443927 ) ( ON ?auto_443930 ?auto_443928 ) ( ON ?auto_443929 ?auto_443930 ) ( not ( = ?auto_443926 ?auto_443927 ) ) ( not ( = ?auto_443926 ?auto_443928 ) ) ( not ( = ?auto_443926 ?auto_443930 ) ) ( not ( = ?auto_443926 ?auto_443929 ) ) ( not ( = ?auto_443926 ?auto_443931 ) ) ( not ( = ?auto_443926 ?auto_443932 ) ) ( not ( = ?auto_443927 ?auto_443928 ) ) ( not ( = ?auto_443927 ?auto_443930 ) ) ( not ( = ?auto_443927 ?auto_443929 ) ) ( not ( = ?auto_443927 ?auto_443931 ) ) ( not ( = ?auto_443927 ?auto_443932 ) ) ( not ( = ?auto_443928 ?auto_443930 ) ) ( not ( = ?auto_443928 ?auto_443929 ) ) ( not ( = ?auto_443928 ?auto_443931 ) ) ( not ( = ?auto_443928 ?auto_443932 ) ) ( not ( = ?auto_443930 ?auto_443929 ) ) ( not ( = ?auto_443930 ?auto_443931 ) ) ( not ( = ?auto_443930 ?auto_443932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443929 ?auto_443931 ?auto_443932 )
      ( MAKE-6CRATE-VERIFY ?auto_443926 ?auto_443927 ?auto_443928 ?auto_443930 ?auto_443929 ?auto_443931 ?auto_443932 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_443983 - SURFACE
      ?auto_443984 - SURFACE
      ?auto_443985 - SURFACE
      ?auto_443987 - SURFACE
      ?auto_443986 - SURFACE
      ?auto_443988 - SURFACE
      ?auto_443989 - SURFACE
    )
    :vars
    (
      ?auto_443993 - HOIST
      ?auto_443991 - PLACE
      ?auto_443994 - TRUCK
      ?auto_443990 - PLACE
      ?auto_443992 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_443993 ?auto_443991 ) ( SURFACE-AT ?auto_443988 ?auto_443991 ) ( CLEAR ?auto_443988 ) ( IS-CRATE ?auto_443989 ) ( not ( = ?auto_443988 ?auto_443989 ) ) ( AVAILABLE ?auto_443993 ) ( ON ?auto_443988 ?auto_443986 ) ( not ( = ?auto_443986 ?auto_443988 ) ) ( not ( = ?auto_443986 ?auto_443989 ) ) ( TRUCK-AT ?auto_443994 ?auto_443990 ) ( not ( = ?auto_443990 ?auto_443991 ) ) ( HOIST-AT ?auto_443992 ?auto_443990 ) ( LIFTING ?auto_443992 ?auto_443989 ) ( not ( = ?auto_443993 ?auto_443992 ) ) ( ON ?auto_443984 ?auto_443983 ) ( ON ?auto_443985 ?auto_443984 ) ( ON ?auto_443987 ?auto_443985 ) ( ON ?auto_443986 ?auto_443987 ) ( not ( = ?auto_443983 ?auto_443984 ) ) ( not ( = ?auto_443983 ?auto_443985 ) ) ( not ( = ?auto_443983 ?auto_443987 ) ) ( not ( = ?auto_443983 ?auto_443986 ) ) ( not ( = ?auto_443983 ?auto_443988 ) ) ( not ( = ?auto_443983 ?auto_443989 ) ) ( not ( = ?auto_443984 ?auto_443985 ) ) ( not ( = ?auto_443984 ?auto_443987 ) ) ( not ( = ?auto_443984 ?auto_443986 ) ) ( not ( = ?auto_443984 ?auto_443988 ) ) ( not ( = ?auto_443984 ?auto_443989 ) ) ( not ( = ?auto_443985 ?auto_443987 ) ) ( not ( = ?auto_443985 ?auto_443986 ) ) ( not ( = ?auto_443985 ?auto_443988 ) ) ( not ( = ?auto_443985 ?auto_443989 ) ) ( not ( = ?auto_443987 ?auto_443986 ) ) ( not ( = ?auto_443987 ?auto_443988 ) ) ( not ( = ?auto_443987 ?auto_443989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_443986 ?auto_443988 ?auto_443989 )
      ( MAKE-6CRATE-VERIFY ?auto_443983 ?auto_443984 ?auto_443985 ?auto_443987 ?auto_443986 ?auto_443988 ?auto_443989 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444046 - SURFACE
      ?auto_444047 - SURFACE
      ?auto_444048 - SURFACE
      ?auto_444050 - SURFACE
      ?auto_444049 - SURFACE
      ?auto_444051 - SURFACE
      ?auto_444052 - SURFACE
    )
    :vars
    (
      ?auto_444055 - HOIST
      ?auto_444056 - PLACE
      ?auto_444054 - TRUCK
      ?auto_444058 - PLACE
      ?auto_444057 - HOIST
      ?auto_444053 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_444055 ?auto_444056 ) ( SURFACE-AT ?auto_444051 ?auto_444056 ) ( CLEAR ?auto_444051 ) ( IS-CRATE ?auto_444052 ) ( not ( = ?auto_444051 ?auto_444052 ) ) ( AVAILABLE ?auto_444055 ) ( ON ?auto_444051 ?auto_444049 ) ( not ( = ?auto_444049 ?auto_444051 ) ) ( not ( = ?auto_444049 ?auto_444052 ) ) ( TRUCK-AT ?auto_444054 ?auto_444058 ) ( not ( = ?auto_444058 ?auto_444056 ) ) ( HOIST-AT ?auto_444057 ?auto_444058 ) ( not ( = ?auto_444055 ?auto_444057 ) ) ( AVAILABLE ?auto_444057 ) ( SURFACE-AT ?auto_444052 ?auto_444058 ) ( ON ?auto_444052 ?auto_444053 ) ( CLEAR ?auto_444052 ) ( not ( = ?auto_444051 ?auto_444053 ) ) ( not ( = ?auto_444052 ?auto_444053 ) ) ( not ( = ?auto_444049 ?auto_444053 ) ) ( ON ?auto_444047 ?auto_444046 ) ( ON ?auto_444048 ?auto_444047 ) ( ON ?auto_444050 ?auto_444048 ) ( ON ?auto_444049 ?auto_444050 ) ( not ( = ?auto_444046 ?auto_444047 ) ) ( not ( = ?auto_444046 ?auto_444048 ) ) ( not ( = ?auto_444046 ?auto_444050 ) ) ( not ( = ?auto_444046 ?auto_444049 ) ) ( not ( = ?auto_444046 ?auto_444051 ) ) ( not ( = ?auto_444046 ?auto_444052 ) ) ( not ( = ?auto_444046 ?auto_444053 ) ) ( not ( = ?auto_444047 ?auto_444048 ) ) ( not ( = ?auto_444047 ?auto_444050 ) ) ( not ( = ?auto_444047 ?auto_444049 ) ) ( not ( = ?auto_444047 ?auto_444051 ) ) ( not ( = ?auto_444047 ?auto_444052 ) ) ( not ( = ?auto_444047 ?auto_444053 ) ) ( not ( = ?auto_444048 ?auto_444050 ) ) ( not ( = ?auto_444048 ?auto_444049 ) ) ( not ( = ?auto_444048 ?auto_444051 ) ) ( not ( = ?auto_444048 ?auto_444052 ) ) ( not ( = ?auto_444048 ?auto_444053 ) ) ( not ( = ?auto_444050 ?auto_444049 ) ) ( not ( = ?auto_444050 ?auto_444051 ) ) ( not ( = ?auto_444050 ?auto_444052 ) ) ( not ( = ?auto_444050 ?auto_444053 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444049 ?auto_444051 ?auto_444052 )
      ( MAKE-6CRATE-VERIFY ?auto_444046 ?auto_444047 ?auto_444048 ?auto_444050 ?auto_444049 ?auto_444051 ?auto_444052 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444110 - SURFACE
      ?auto_444111 - SURFACE
      ?auto_444112 - SURFACE
      ?auto_444114 - SURFACE
      ?auto_444113 - SURFACE
      ?auto_444115 - SURFACE
      ?auto_444116 - SURFACE
    )
    :vars
    (
      ?auto_444121 - HOIST
      ?auto_444118 - PLACE
      ?auto_444117 - PLACE
      ?auto_444120 - HOIST
      ?auto_444119 - SURFACE
      ?auto_444122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444121 ?auto_444118 ) ( SURFACE-AT ?auto_444115 ?auto_444118 ) ( CLEAR ?auto_444115 ) ( IS-CRATE ?auto_444116 ) ( not ( = ?auto_444115 ?auto_444116 ) ) ( AVAILABLE ?auto_444121 ) ( ON ?auto_444115 ?auto_444113 ) ( not ( = ?auto_444113 ?auto_444115 ) ) ( not ( = ?auto_444113 ?auto_444116 ) ) ( not ( = ?auto_444117 ?auto_444118 ) ) ( HOIST-AT ?auto_444120 ?auto_444117 ) ( not ( = ?auto_444121 ?auto_444120 ) ) ( AVAILABLE ?auto_444120 ) ( SURFACE-AT ?auto_444116 ?auto_444117 ) ( ON ?auto_444116 ?auto_444119 ) ( CLEAR ?auto_444116 ) ( not ( = ?auto_444115 ?auto_444119 ) ) ( not ( = ?auto_444116 ?auto_444119 ) ) ( not ( = ?auto_444113 ?auto_444119 ) ) ( TRUCK-AT ?auto_444122 ?auto_444118 ) ( ON ?auto_444111 ?auto_444110 ) ( ON ?auto_444112 ?auto_444111 ) ( ON ?auto_444114 ?auto_444112 ) ( ON ?auto_444113 ?auto_444114 ) ( not ( = ?auto_444110 ?auto_444111 ) ) ( not ( = ?auto_444110 ?auto_444112 ) ) ( not ( = ?auto_444110 ?auto_444114 ) ) ( not ( = ?auto_444110 ?auto_444113 ) ) ( not ( = ?auto_444110 ?auto_444115 ) ) ( not ( = ?auto_444110 ?auto_444116 ) ) ( not ( = ?auto_444110 ?auto_444119 ) ) ( not ( = ?auto_444111 ?auto_444112 ) ) ( not ( = ?auto_444111 ?auto_444114 ) ) ( not ( = ?auto_444111 ?auto_444113 ) ) ( not ( = ?auto_444111 ?auto_444115 ) ) ( not ( = ?auto_444111 ?auto_444116 ) ) ( not ( = ?auto_444111 ?auto_444119 ) ) ( not ( = ?auto_444112 ?auto_444114 ) ) ( not ( = ?auto_444112 ?auto_444113 ) ) ( not ( = ?auto_444112 ?auto_444115 ) ) ( not ( = ?auto_444112 ?auto_444116 ) ) ( not ( = ?auto_444112 ?auto_444119 ) ) ( not ( = ?auto_444114 ?auto_444113 ) ) ( not ( = ?auto_444114 ?auto_444115 ) ) ( not ( = ?auto_444114 ?auto_444116 ) ) ( not ( = ?auto_444114 ?auto_444119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444113 ?auto_444115 ?auto_444116 )
      ( MAKE-6CRATE-VERIFY ?auto_444110 ?auto_444111 ?auto_444112 ?auto_444114 ?auto_444113 ?auto_444115 ?auto_444116 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444174 - SURFACE
      ?auto_444175 - SURFACE
      ?auto_444176 - SURFACE
      ?auto_444178 - SURFACE
      ?auto_444177 - SURFACE
      ?auto_444179 - SURFACE
      ?auto_444180 - SURFACE
    )
    :vars
    (
      ?auto_444183 - HOIST
      ?auto_444184 - PLACE
      ?auto_444182 - PLACE
      ?auto_444185 - HOIST
      ?auto_444186 - SURFACE
      ?auto_444181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444183 ?auto_444184 ) ( IS-CRATE ?auto_444180 ) ( not ( = ?auto_444179 ?auto_444180 ) ) ( not ( = ?auto_444177 ?auto_444179 ) ) ( not ( = ?auto_444177 ?auto_444180 ) ) ( not ( = ?auto_444182 ?auto_444184 ) ) ( HOIST-AT ?auto_444185 ?auto_444182 ) ( not ( = ?auto_444183 ?auto_444185 ) ) ( AVAILABLE ?auto_444185 ) ( SURFACE-AT ?auto_444180 ?auto_444182 ) ( ON ?auto_444180 ?auto_444186 ) ( CLEAR ?auto_444180 ) ( not ( = ?auto_444179 ?auto_444186 ) ) ( not ( = ?auto_444180 ?auto_444186 ) ) ( not ( = ?auto_444177 ?auto_444186 ) ) ( TRUCK-AT ?auto_444181 ?auto_444184 ) ( SURFACE-AT ?auto_444177 ?auto_444184 ) ( CLEAR ?auto_444177 ) ( LIFTING ?auto_444183 ?auto_444179 ) ( IS-CRATE ?auto_444179 ) ( ON ?auto_444175 ?auto_444174 ) ( ON ?auto_444176 ?auto_444175 ) ( ON ?auto_444178 ?auto_444176 ) ( ON ?auto_444177 ?auto_444178 ) ( not ( = ?auto_444174 ?auto_444175 ) ) ( not ( = ?auto_444174 ?auto_444176 ) ) ( not ( = ?auto_444174 ?auto_444178 ) ) ( not ( = ?auto_444174 ?auto_444177 ) ) ( not ( = ?auto_444174 ?auto_444179 ) ) ( not ( = ?auto_444174 ?auto_444180 ) ) ( not ( = ?auto_444174 ?auto_444186 ) ) ( not ( = ?auto_444175 ?auto_444176 ) ) ( not ( = ?auto_444175 ?auto_444178 ) ) ( not ( = ?auto_444175 ?auto_444177 ) ) ( not ( = ?auto_444175 ?auto_444179 ) ) ( not ( = ?auto_444175 ?auto_444180 ) ) ( not ( = ?auto_444175 ?auto_444186 ) ) ( not ( = ?auto_444176 ?auto_444178 ) ) ( not ( = ?auto_444176 ?auto_444177 ) ) ( not ( = ?auto_444176 ?auto_444179 ) ) ( not ( = ?auto_444176 ?auto_444180 ) ) ( not ( = ?auto_444176 ?auto_444186 ) ) ( not ( = ?auto_444178 ?auto_444177 ) ) ( not ( = ?auto_444178 ?auto_444179 ) ) ( not ( = ?auto_444178 ?auto_444180 ) ) ( not ( = ?auto_444178 ?auto_444186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444177 ?auto_444179 ?auto_444180 )
      ( MAKE-6CRATE-VERIFY ?auto_444174 ?auto_444175 ?auto_444176 ?auto_444178 ?auto_444177 ?auto_444179 ?auto_444180 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_444238 - SURFACE
      ?auto_444239 - SURFACE
      ?auto_444240 - SURFACE
      ?auto_444242 - SURFACE
      ?auto_444241 - SURFACE
      ?auto_444243 - SURFACE
      ?auto_444244 - SURFACE
    )
    :vars
    (
      ?auto_444246 - HOIST
      ?auto_444245 - PLACE
      ?auto_444247 - PLACE
      ?auto_444249 - HOIST
      ?auto_444248 - SURFACE
      ?auto_444250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_444246 ?auto_444245 ) ( IS-CRATE ?auto_444244 ) ( not ( = ?auto_444243 ?auto_444244 ) ) ( not ( = ?auto_444241 ?auto_444243 ) ) ( not ( = ?auto_444241 ?auto_444244 ) ) ( not ( = ?auto_444247 ?auto_444245 ) ) ( HOIST-AT ?auto_444249 ?auto_444247 ) ( not ( = ?auto_444246 ?auto_444249 ) ) ( AVAILABLE ?auto_444249 ) ( SURFACE-AT ?auto_444244 ?auto_444247 ) ( ON ?auto_444244 ?auto_444248 ) ( CLEAR ?auto_444244 ) ( not ( = ?auto_444243 ?auto_444248 ) ) ( not ( = ?auto_444244 ?auto_444248 ) ) ( not ( = ?auto_444241 ?auto_444248 ) ) ( TRUCK-AT ?auto_444250 ?auto_444245 ) ( SURFACE-AT ?auto_444241 ?auto_444245 ) ( CLEAR ?auto_444241 ) ( IS-CRATE ?auto_444243 ) ( AVAILABLE ?auto_444246 ) ( IN ?auto_444243 ?auto_444250 ) ( ON ?auto_444239 ?auto_444238 ) ( ON ?auto_444240 ?auto_444239 ) ( ON ?auto_444242 ?auto_444240 ) ( ON ?auto_444241 ?auto_444242 ) ( not ( = ?auto_444238 ?auto_444239 ) ) ( not ( = ?auto_444238 ?auto_444240 ) ) ( not ( = ?auto_444238 ?auto_444242 ) ) ( not ( = ?auto_444238 ?auto_444241 ) ) ( not ( = ?auto_444238 ?auto_444243 ) ) ( not ( = ?auto_444238 ?auto_444244 ) ) ( not ( = ?auto_444238 ?auto_444248 ) ) ( not ( = ?auto_444239 ?auto_444240 ) ) ( not ( = ?auto_444239 ?auto_444242 ) ) ( not ( = ?auto_444239 ?auto_444241 ) ) ( not ( = ?auto_444239 ?auto_444243 ) ) ( not ( = ?auto_444239 ?auto_444244 ) ) ( not ( = ?auto_444239 ?auto_444248 ) ) ( not ( = ?auto_444240 ?auto_444242 ) ) ( not ( = ?auto_444240 ?auto_444241 ) ) ( not ( = ?auto_444240 ?auto_444243 ) ) ( not ( = ?auto_444240 ?auto_444244 ) ) ( not ( = ?auto_444240 ?auto_444248 ) ) ( not ( = ?auto_444242 ?auto_444241 ) ) ( not ( = ?auto_444242 ?auto_444243 ) ) ( not ( = ?auto_444242 ?auto_444244 ) ) ( not ( = ?auto_444242 ?auto_444248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_444241 ?auto_444243 ?auto_444244 )
      ( MAKE-6CRATE-VERIFY ?auto_444238 ?auto_444239 ?auto_444240 ?auto_444242 ?auto_444241 ?auto_444243 ?auto_444244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_445110 - SURFACE
      ?auto_445111 - SURFACE
    )
    :vars
    (
      ?auto_445115 - HOIST
      ?auto_445114 - PLACE
      ?auto_445118 - SURFACE
      ?auto_445112 - PLACE
      ?auto_445117 - HOIST
      ?auto_445116 - SURFACE
      ?auto_445113 - TRUCK
      ?auto_445119 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_445115 ?auto_445114 ) ( SURFACE-AT ?auto_445110 ?auto_445114 ) ( CLEAR ?auto_445110 ) ( IS-CRATE ?auto_445111 ) ( not ( = ?auto_445110 ?auto_445111 ) ) ( ON ?auto_445110 ?auto_445118 ) ( not ( = ?auto_445118 ?auto_445110 ) ) ( not ( = ?auto_445118 ?auto_445111 ) ) ( not ( = ?auto_445112 ?auto_445114 ) ) ( HOIST-AT ?auto_445117 ?auto_445112 ) ( not ( = ?auto_445115 ?auto_445117 ) ) ( AVAILABLE ?auto_445117 ) ( SURFACE-AT ?auto_445111 ?auto_445112 ) ( ON ?auto_445111 ?auto_445116 ) ( CLEAR ?auto_445111 ) ( not ( = ?auto_445110 ?auto_445116 ) ) ( not ( = ?auto_445111 ?auto_445116 ) ) ( not ( = ?auto_445118 ?auto_445116 ) ) ( TRUCK-AT ?auto_445113 ?auto_445114 ) ( LIFTING ?auto_445115 ?auto_445119 ) ( IS-CRATE ?auto_445119 ) ( not ( = ?auto_445110 ?auto_445119 ) ) ( not ( = ?auto_445111 ?auto_445119 ) ) ( not ( = ?auto_445118 ?auto_445119 ) ) ( not ( = ?auto_445116 ?auto_445119 ) ) )
    :subtasks
    ( ( !LOAD ?auto_445115 ?auto_445119 ?auto_445113 ?auto_445114 )
      ( MAKE-1CRATE ?auto_445110 ?auto_445111 )
      ( MAKE-1CRATE-VERIFY ?auto_445110 ?auto_445111 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446176 - SURFACE
      ?auto_446177 - SURFACE
      ?auto_446178 - SURFACE
      ?auto_446180 - SURFACE
      ?auto_446179 - SURFACE
      ?auto_446181 - SURFACE
      ?auto_446182 - SURFACE
      ?auto_446183 - SURFACE
    )
    :vars
    (
      ?auto_446184 - HOIST
      ?auto_446185 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_446184 ?auto_446185 ) ( SURFACE-AT ?auto_446182 ?auto_446185 ) ( CLEAR ?auto_446182 ) ( LIFTING ?auto_446184 ?auto_446183 ) ( IS-CRATE ?auto_446183 ) ( not ( = ?auto_446182 ?auto_446183 ) ) ( ON ?auto_446177 ?auto_446176 ) ( ON ?auto_446178 ?auto_446177 ) ( ON ?auto_446180 ?auto_446178 ) ( ON ?auto_446179 ?auto_446180 ) ( ON ?auto_446181 ?auto_446179 ) ( ON ?auto_446182 ?auto_446181 ) ( not ( = ?auto_446176 ?auto_446177 ) ) ( not ( = ?auto_446176 ?auto_446178 ) ) ( not ( = ?auto_446176 ?auto_446180 ) ) ( not ( = ?auto_446176 ?auto_446179 ) ) ( not ( = ?auto_446176 ?auto_446181 ) ) ( not ( = ?auto_446176 ?auto_446182 ) ) ( not ( = ?auto_446176 ?auto_446183 ) ) ( not ( = ?auto_446177 ?auto_446178 ) ) ( not ( = ?auto_446177 ?auto_446180 ) ) ( not ( = ?auto_446177 ?auto_446179 ) ) ( not ( = ?auto_446177 ?auto_446181 ) ) ( not ( = ?auto_446177 ?auto_446182 ) ) ( not ( = ?auto_446177 ?auto_446183 ) ) ( not ( = ?auto_446178 ?auto_446180 ) ) ( not ( = ?auto_446178 ?auto_446179 ) ) ( not ( = ?auto_446178 ?auto_446181 ) ) ( not ( = ?auto_446178 ?auto_446182 ) ) ( not ( = ?auto_446178 ?auto_446183 ) ) ( not ( = ?auto_446180 ?auto_446179 ) ) ( not ( = ?auto_446180 ?auto_446181 ) ) ( not ( = ?auto_446180 ?auto_446182 ) ) ( not ( = ?auto_446180 ?auto_446183 ) ) ( not ( = ?auto_446179 ?auto_446181 ) ) ( not ( = ?auto_446179 ?auto_446182 ) ) ( not ( = ?auto_446179 ?auto_446183 ) ) ( not ( = ?auto_446181 ?auto_446182 ) ) ( not ( = ?auto_446181 ?auto_446183 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_446182 ?auto_446183 )
      ( MAKE-7CRATE-VERIFY ?auto_446176 ?auto_446177 ?auto_446178 ?auto_446180 ?auto_446179 ?auto_446181 ?auto_446182 ?auto_446183 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446231 - SURFACE
      ?auto_446232 - SURFACE
      ?auto_446233 - SURFACE
      ?auto_446235 - SURFACE
      ?auto_446234 - SURFACE
      ?auto_446236 - SURFACE
      ?auto_446237 - SURFACE
      ?auto_446238 - SURFACE
    )
    :vars
    (
      ?auto_446241 - HOIST
      ?auto_446240 - PLACE
      ?auto_446239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_446241 ?auto_446240 ) ( SURFACE-AT ?auto_446237 ?auto_446240 ) ( CLEAR ?auto_446237 ) ( IS-CRATE ?auto_446238 ) ( not ( = ?auto_446237 ?auto_446238 ) ) ( TRUCK-AT ?auto_446239 ?auto_446240 ) ( AVAILABLE ?auto_446241 ) ( IN ?auto_446238 ?auto_446239 ) ( ON ?auto_446237 ?auto_446236 ) ( not ( = ?auto_446236 ?auto_446237 ) ) ( not ( = ?auto_446236 ?auto_446238 ) ) ( ON ?auto_446232 ?auto_446231 ) ( ON ?auto_446233 ?auto_446232 ) ( ON ?auto_446235 ?auto_446233 ) ( ON ?auto_446234 ?auto_446235 ) ( ON ?auto_446236 ?auto_446234 ) ( not ( = ?auto_446231 ?auto_446232 ) ) ( not ( = ?auto_446231 ?auto_446233 ) ) ( not ( = ?auto_446231 ?auto_446235 ) ) ( not ( = ?auto_446231 ?auto_446234 ) ) ( not ( = ?auto_446231 ?auto_446236 ) ) ( not ( = ?auto_446231 ?auto_446237 ) ) ( not ( = ?auto_446231 ?auto_446238 ) ) ( not ( = ?auto_446232 ?auto_446233 ) ) ( not ( = ?auto_446232 ?auto_446235 ) ) ( not ( = ?auto_446232 ?auto_446234 ) ) ( not ( = ?auto_446232 ?auto_446236 ) ) ( not ( = ?auto_446232 ?auto_446237 ) ) ( not ( = ?auto_446232 ?auto_446238 ) ) ( not ( = ?auto_446233 ?auto_446235 ) ) ( not ( = ?auto_446233 ?auto_446234 ) ) ( not ( = ?auto_446233 ?auto_446236 ) ) ( not ( = ?auto_446233 ?auto_446237 ) ) ( not ( = ?auto_446233 ?auto_446238 ) ) ( not ( = ?auto_446235 ?auto_446234 ) ) ( not ( = ?auto_446235 ?auto_446236 ) ) ( not ( = ?auto_446235 ?auto_446237 ) ) ( not ( = ?auto_446235 ?auto_446238 ) ) ( not ( = ?auto_446234 ?auto_446236 ) ) ( not ( = ?auto_446234 ?auto_446237 ) ) ( not ( = ?auto_446234 ?auto_446238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446236 ?auto_446237 ?auto_446238 )
      ( MAKE-7CRATE-VERIFY ?auto_446231 ?auto_446232 ?auto_446233 ?auto_446235 ?auto_446234 ?auto_446236 ?auto_446237 ?auto_446238 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446294 - SURFACE
      ?auto_446295 - SURFACE
      ?auto_446296 - SURFACE
      ?auto_446298 - SURFACE
      ?auto_446297 - SURFACE
      ?auto_446299 - SURFACE
      ?auto_446300 - SURFACE
      ?auto_446301 - SURFACE
    )
    :vars
    (
      ?auto_446304 - HOIST
      ?auto_446305 - PLACE
      ?auto_446303 - TRUCK
      ?auto_446302 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_446304 ?auto_446305 ) ( SURFACE-AT ?auto_446300 ?auto_446305 ) ( CLEAR ?auto_446300 ) ( IS-CRATE ?auto_446301 ) ( not ( = ?auto_446300 ?auto_446301 ) ) ( AVAILABLE ?auto_446304 ) ( IN ?auto_446301 ?auto_446303 ) ( ON ?auto_446300 ?auto_446299 ) ( not ( = ?auto_446299 ?auto_446300 ) ) ( not ( = ?auto_446299 ?auto_446301 ) ) ( TRUCK-AT ?auto_446303 ?auto_446302 ) ( not ( = ?auto_446302 ?auto_446305 ) ) ( ON ?auto_446295 ?auto_446294 ) ( ON ?auto_446296 ?auto_446295 ) ( ON ?auto_446298 ?auto_446296 ) ( ON ?auto_446297 ?auto_446298 ) ( ON ?auto_446299 ?auto_446297 ) ( not ( = ?auto_446294 ?auto_446295 ) ) ( not ( = ?auto_446294 ?auto_446296 ) ) ( not ( = ?auto_446294 ?auto_446298 ) ) ( not ( = ?auto_446294 ?auto_446297 ) ) ( not ( = ?auto_446294 ?auto_446299 ) ) ( not ( = ?auto_446294 ?auto_446300 ) ) ( not ( = ?auto_446294 ?auto_446301 ) ) ( not ( = ?auto_446295 ?auto_446296 ) ) ( not ( = ?auto_446295 ?auto_446298 ) ) ( not ( = ?auto_446295 ?auto_446297 ) ) ( not ( = ?auto_446295 ?auto_446299 ) ) ( not ( = ?auto_446295 ?auto_446300 ) ) ( not ( = ?auto_446295 ?auto_446301 ) ) ( not ( = ?auto_446296 ?auto_446298 ) ) ( not ( = ?auto_446296 ?auto_446297 ) ) ( not ( = ?auto_446296 ?auto_446299 ) ) ( not ( = ?auto_446296 ?auto_446300 ) ) ( not ( = ?auto_446296 ?auto_446301 ) ) ( not ( = ?auto_446298 ?auto_446297 ) ) ( not ( = ?auto_446298 ?auto_446299 ) ) ( not ( = ?auto_446298 ?auto_446300 ) ) ( not ( = ?auto_446298 ?auto_446301 ) ) ( not ( = ?auto_446297 ?auto_446299 ) ) ( not ( = ?auto_446297 ?auto_446300 ) ) ( not ( = ?auto_446297 ?auto_446301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446299 ?auto_446300 ?auto_446301 )
      ( MAKE-7CRATE-VERIFY ?auto_446294 ?auto_446295 ?auto_446296 ?auto_446298 ?auto_446297 ?auto_446299 ?auto_446300 ?auto_446301 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446364 - SURFACE
      ?auto_446365 - SURFACE
      ?auto_446366 - SURFACE
      ?auto_446368 - SURFACE
      ?auto_446367 - SURFACE
      ?auto_446369 - SURFACE
      ?auto_446370 - SURFACE
      ?auto_446371 - SURFACE
    )
    :vars
    (
      ?auto_446376 - HOIST
      ?auto_446374 - PLACE
      ?auto_446373 - TRUCK
      ?auto_446372 - PLACE
      ?auto_446375 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_446376 ?auto_446374 ) ( SURFACE-AT ?auto_446370 ?auto_446374 ) ( CLEAR ?auto_446370 ) ( IS-CRATE ?auto_446371 ) ( not ( = ?auto_446370 ?auto_446371 ) ) ( AVAILABLE ?auto_446376 ) ( ON ?auto_446370 ?auto_446369 ) ( not ( = ?auto_446369 ?auto_446370 ) ) ( not ( = ?auto_446369 ?auto_446371 ) ) ( TRUCK-AT ?auto_446373 ?auto_446372 ) ( not ( = ?auto_446372 ?auto_446374 ) ) ( HOIST-AT ?auto_446375 ?auto_446372 ) ( LIFTING ?auto_446375 ?auto_446371 ) ( not ( = ?auto_446376 ?auto_446375 ) ) ( ON ?auto_446365 ?auto_446364 ) ( ON ?auto_446366 ?auto_446365 ) ( ON ?auto_446368 ?auto_446366 ) ( ON ?auto_446367 ?auto_446368 ) ( ON ?auto_446369 ?auto_446367 ) ( not ( = ?auto_446364 ?auto_446365 ) ) ( not ( = ?auto_446364 ?auto_446366 ) ) ( not ( = ?auto_446364 ?auto_446368 ) ) ( not ( = ?auto_446364 ?auto_446367 ) ) ( not ( = ?auto_446364 ?auto_446369 ) ) ( not ( = ?auto_446364 ?auto_446370 ) ) ( not ( = ?auto_446364 ?auto_446371 ) ) ( not ( = ?auto_446365 ?auto_446366 ) ) ( not ( = ?auto_446365 ?auto_446368 ) ) ( not ( = ?auto_446365 ?auto_446367 ) ) ( not ( = ?auto_446365 ?auto_446369 ) ) ( not ( = ?auto_446365 ?auto_446370 ) ) ( not ( = ?auto_446365 ?auto_446371 ) ) ( not ( = ?auto_446366 ?auto_446368 ) ) ( not ( = ?auto_446366 ?auto_446367 ) ) ( not ( = ?auto_446366 ?auto_446369 ) ) ( not ( = ?auto_446366 ?auto_446370 ) ) ( not ( = ?auto_446366 ?auto_446371 ) ) ( not ( = ?auto_446368 ?auto_446367 ) ) ( not ( = ?auto_446368 ?auto_446369 ) ) ( not ( = ?auto_446368 ?auto_446370 ) ) ( not ( = ?auto_446368 ?auto_446371 ) ) ( not ( = ?auto_446367 ?auto_446369 ) ) ( not ( = ?auto_446367 ?auto_446370 ) ) ( not ( = ?auto_446367 ?auto_446371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446369 ?auto_446370 ?auto_446371 )
      ( MAKE-7CRATE-VERIFY ?auto_446364 ?auto_446365 ?auto_446366 ?auto_446368 ?auto_446367 ?auto_446369 ?auto_446370 ?auto_446371 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446441 - SURFACE
      ?auto_446442 - SURFACE
      ?auto_446443 - SURFACE
      ?auto_446445 - SURFACE
      ?auto_446444 - SURFACE
      ?auto_446446 - SURFACE
      ?auto_446447 - SURFACE
      ?auto_446448 - SURFACE
    )
    :vars
    (
      ?auto_446452 - HOIST
      ?auto_446449 - PLACE
      ?auto_446453 - TRUCK
      ?auto_446450 - PLACE
      ?auto_446454 - HOIST
      ?auto_446451 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_446452 ?auto_446449 ) ( SURFACE-AT ?auto_446447 ?auto_446449 ) ( CLEAR ?auto_446447 ) ( IS-CRATE ?auto_446448 ) ( not ( = ?auto_446447 ?auto_446448 ) ) ( AVAILABLE ?auto_446452 ) ( ON ?auto_446447 ?auto_446446 ) ( not ( = ?auto_446446 ?auto_446447 ) ) ( not ( = ?auto_446446 ?auto_446448 ) ) ( TRUCK-AT ?auto_446453 ?auto_446450 ) ( not ( = ?auto_446450 ?auto_446449 ) ) ( HOIST-AT ?auto_446454 ?auto_446450 ) ( not ( = ?auto_446452 ?auto_446454 ) ) ( AVAILABLE ?auto_446454 ) ( SURFACE-AT ?auto_446448 ?auto_446450 ) ( ON ?auto_446448 ?auto_446451 ) ( CLEAR ?auto_446448 ) ( not ( = ?auto_446447 ?auto_446451 ) ) ( not ( = ?auto_446448 ?auto_446451 ) ) ( not ( = ?auto_446446 ?auto_446451 ) ) ( ON ?auto_446442 ?auto_446441 ) ( ON ?auto_446443 ?auto_446442 ) ( ON ?auto_446445 ?auto_446443 ) ( ON ?auto_446444 ?auto_446445 ) ( ON ?auto_446446 ?auto_446444 ) ( not ( = ?auto_446441 ?auto_446442 ) ) ( not ( = ?auto_446441 ?auto_446443 ) ) ( not ( = ?auto_446441 ?auto_446445 ) ) ( not ( = ?auto_446441 ?auto_446444 ) ) ( not ( = ?auto_446441 ?auto_446446 ) ) ( not ( = ?auto_446441 ?auto_446447 ) ) ( not ( = ?auto_446441 ?auto_446448 ) ) ( not ( = ?auto_446441 ?auto_446451 ) ) ( not ( = ?auto_446442 ?auto_446443 ) ) ( not ( = ?auto_446442 ?auto_446445 ) ) ( not ( = ?auto_446442 ?auto_446444 ) ) ( not ( = ?auto_446442 ?auto_446446 ) ) ( not ( = ?auto_446442 ?auto_446447 ) ) ( not ( = ?auto_446442 ?auto_446448 ) ) ( not ( = ?auto_446442 ?auto_446451 ) ) ( not ( = ?auto_446443 ?auto_446445 ) ) ( not ( = ?auto_446443 ?auto_446444 ) ) ( not ( = ?auto_446443 ?auto_446446 ) ) ( not ( = ?auto_446443 ?auto_446447 ) ) ( not ( = ?auto_446443 ?auto_446448 ) ) ( not ( = ?auto_446443 ?auto_446451 ) ) ( not ( = ?auto_446445 ?auto_446444 ) ) ( not ( = ?auto_446445 ?auto_446446 ) ) ( not ( = ?auto_446445 ?auto_446447 ) ) ( not ( = ?auto_446445 ?auto_446448 ) ) ( not ( = ?auto_446445 ?auto_446451 ) ) ( not ( = ?auto_446444 ?auto_446446 ) ) ( not ( = ?auto_446444 ?auto_446447 ) ) ( not ( = ?auto_446444 ?auto_446448 ) ) ( not ( = ?auto_446444 ?auto_446451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446446 ?auto_446447 ?auto_446448 )
      ( MAKE-7CRATE-VERIFY ?auto_446441 ?auto_446442 ?auto_446443 ?auto_446445 ?auto_446444 ?auto_446446 ?auto_446447 ?auto_446448 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446519 - SURFACE
      ?auto_446520 - SURFACE
      ?auto_446521 - SURFACE
      ?auto_446523 - SURFACE
      ?auto_446522 - SURFACE
      ?auto_446524 - SURFACE
      ?auto_446525 - SURFACE
      ?auto_446526 - SURFACE
    )
    :vars
    (
      ?auto_446531 - HOIST
      ?auto_446530 - PLACE
      ?auto_446529 - PLACE
      ?auto_446527 - HOIST
      ?auto_446532 - SURFACE
      ?auto_446528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_446531 ?auto_446530 ) ( SURFACE-AT ?auto_446525 ?auto_446530 ) ( CLEAR ?auto_446525 ) ( IS-CRATE ?auto_446526 ) ( not ( = ?auto_446525 ?auto_446526 ) ) ( AVAILABLE ?auto_446531 ) ( ON ?auto_446525 ?auto_446524 ) ( not ( = ?auto_446524 ?auto_446525 ) ) ( not ( = ?auto_446524 ?auto_446526 ) ) ( not ( = ?auto_446529 ?auto_446530 ) ) ( HOIST-AT ?auto_446527 ?auto_446529 ) ( not ( = ?auto_446531 ?auto_446527 ) ) ( AVAILABLE ?auto_446527 ) ( SURFACE-AT ?auto_446526 ?auto_446529 ) ( ON ?auto_446526 ?auto_446532 ) ( CLEAR ?auto_446526 ) ( not ( = ?auto_446525 ?auto_446532 ) ) ( not ( = ?auto_446526 ?auto_446532 ) ) ( not ( = ?auto_446524 ?auto_446532 ) ) ( TRUCK-AT ?auto_446528 ?auto_446530 ) ( ON ?auto_446520 ?auto_446519 ) ( ON ?auto_446521 ?auto_446520 ) ( ON ?auto_446523 ?auto_446521 ) ( ON ?auto_446522 ?auto_446523 ) ( ON ?auto_446524 ?auto_446522 ) ( not ( = ?auto_446519 ?auto_446520 ) ) ( not ( = ?auto_446519 ?auto_446521 ) ) ( not ( = ?auto_446519 ?auto_446523 ) ) ( not ( = ?auto_446519 ?auto_446522 ) ) ( not ( = ?auto_446519 ?auto_446524 ) ) ( not ( = ?auto_446519 ?auto_446525 ) ) ( not ( = ?auto_446519 ?auto_446526 ) ) ( not ( = ?auto_446519 ?auto_446532 ) ) ( not ( = ?auto_446520 ?auto_446521 ) ) ( not ( = ?auto_446520 ?auto_446523 ) ) ( not ( = ?auto_446520 ?auto_446522 ) ) ( not ( = ?auto_446520 ?auto_446524 ) ) ( not ( = ?auto_446520 ?auto_446525 ) ) ( not ( = ?auto_446520 ?auto_446526 ) ) ( not ( = ?auto_446520 ?auto_446532 ) ) ( not ( = ?auto_446521 ?auto_446523 ) ) ( not ( = ?auto_446521 ?auto_446522 ) ) ( not ( = ?auto_446521 ?auto_446524 ) ) ( not ( = ?auto_446521 ?auto_446525 ) ) ( not ( = ?auto_446521 ?auto_446526 ) ) ( not ( = ?auto_446521 ?auto_446532 ) ) ( not ( = ?auto_446523 ?auto_446522 ) ) ( not ( = ?auto_446523 ?auto_446524 ) ) ( not ( = ?auto_446523 ?auto_446525 ) ) ( not ( = ?auto_446523 ?auto_446526 ) ) ( not ( = ?auto_446523 ?auto_446532 ) ) ( not ( = ?auto_446522 ?auto_446524 ) ) ( not ( = ?auto_446522 ?auto_446525 ) ) ( not ( = ?auto_446522 ?auto_446526 ) ) ( not ( = ?auto_446522 ?auto_446532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446524 ?auto_446525 ?auto_446526 )
      ( MAKE-7CRATE-VERIFY ?auto_446519 ?auto_446520 ?auto_446521 ?auto_446523 ?auto_446522 ?auto_446524 ?auto_446525 ?auto_446526 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446597 - SURFACE
      ?auto_446598 - SURFACE
      ?auto_446599 - SURFACE
      ?auto_446601 - SURFACE
      ?auto_446600 - SURFACE
      ?auto_446602 - SURFACE
      ?auto_446603 - SURFACE
      ?auto_446604 - SURFACE
    )
    :vars
    (
      ?auto_446605 - HOIST
      ?auto_446610 - PLACE
      ?auto_446608 - PLACE
      ?auto_446609 - HOIST
      ?auto_446606 - SURFACE
      ?auto_446607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_446605 ?auto_446610 ) ( IS-CRATE ?auto_446604 ) ( not ( = ?auto_446603 ?auto_446604 ) ) ( not ( = ?auto_446602 ?auto_446603 ) ) ( not ( = ?auto_446602 ?auto_446604 ) ) ( not ( = ?auto_446608 ?auto_446610 ) ) ( HOIST-AT ?auto_446609 ?auto_446608 ) ( not ( = ?auto_446605 ?auto_446609 ) ) ( AVAILABLE ?auto_446609 ) ( SURFACE-AT ?auto_446604 ?auto_446608 ) ( ON ?auto_446604 ?auto_446606 ) ( CLEAR ?auto_446604 ) ( not ( = ?auto_446603 ?auto_446606 ) ) ( not ( = ?auto_446604 ?auto_446606 ) ) ( not ( = ?auto_446602 ?auto_446606 ) ) ( TRUCK-AT ?auto_446607 ?auto_446610 ) ( SURFACE-AT ?auto_446602 ?auto_446610 ) ( CLEAR ?auto_446602 ) ( LIFTING ?auto_446605 ?auto_446603 ) ( IS-CRATE ?auto_446603 ) ( ON ?auto_446598 ?auto_446597 ) ( ON ?auto_446599 ?auto_446598 ) ( ON ?auto_446601 ?auto_446599 ) ( ON ?auto_446600 ?auto_446601 ) ( ON ?auto_446602 ?auto_446600 ) ( not ( = ?auto_446597 ?auto_446598 ) ) ( not ( = ?auto_446597 ?auto_446599 ) ) ( not ( = ?auto_446597 ?auto_446601 ) ) ( not ( = ?auto_446597 ?auto_446600 ) ) ( not ( = ?auto_446597 ?auto_446602 ) ) ( not ( = ?auto_446597 ?auto_446603 ) ) ( not ( = ?auto_446597 ?auto_446604 ) ) ( not ( = ?auto_446597 ?auto_446606 ) ) ( not ( = ?auto_446598 ?auto_446599 ) ) ( not ( = ?auto_446598 ?auto_446601 ) ) ( not ( = ?auto_446598 ?auto_446600 ) ) ( not ( = ?auto_446598 ?auto_446602 ) ) ( not ( = ?auto_446598 ?auto_446603 ) ) ( not ( = ?auto_446598 ?auto_446604 ) ) ( not ( = ?auto_446598 ?auto_446606 ) ) ( not ( = ?auto_446599 ?auto_446601 ) ) ( not ( = ?auto_446599 ?auto_446600 ) ) ( not ( = ?auto_446599 ?auto_446602 ) ) ( not ( = ?auto_446599 ?auto_446603 ) ) ( not ( = ?auto_446599 ?auto_446604 ) ) ( not ( = ?auto_446599 ?auto_446606 ) ) ( not ( = ?auto_446601 ?auto_446600 ) ) ( not ( = ?auto_446601 ?auto_446602 ) ) ( not ( = ?auto_446601 ?auto_446603 ) ) ( not ( = ?auto_446601 ?auto_446604 ) ) ( not ( = ?auto_446601 ?auto_446606 ) ) ( not ( = ?auto_446600 ?auto_446602 ) ) ( not ( = ?auto_446600 ?auto_446603 ) ) ( not ( = ?auto_446600 ?auto_446604 ) ) ( not ( = ?auto_446600 ?auto_446606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446602 ?auto_446603 ?auto_446604 )
      ( MAKE-7CRATE-VERIFY ?auto_446597 ?auto_446598 ?auto_446599 ?auto_446601 ?auto_446600 ?auto_446602 ?auto_446603 ?auto_446604 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_446675 - SURFACE
      ?auto_446676 - SURFACE
      ?auto_446677 - SURFACE
      ?auto_446679 - SURFACE
      ?auto_446678 - SURFACE
      ?auto_446680 - SURFACE
      ?auto_446681 - SURFACE
      ?auto_446682 - SURFACE
    )
    :vars
    (
      ?auto_446686 - HOIST
      ?auto_446688 - PLACE
      ?auto_446683 - PLACE
      ?auto_446685 - HOIST
      ?auto_446684 - SURFACE
      ?auto_446687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_446686 ?auto_446688 ) ( IS-CRATE ?auto_446682 ) ( not ( = ?auto_446681 ?auto_446682 ) ) ( not ( = ?auto_446680 ?auto_446681 ) ) ( not ( = ?auto_446680 ?auto_446682 ) ) ( not ( = ?auto_446683 ?auto_446688 ) ) ( HOIST-AT ?auto_446685 ?auto_446683 ) ( not ( = ?auto_446686 ?auto_446685 ) ) ( AVAILABLE ?auto_446685 ) ( SURFACE-AT ?auto_446682 ?auto_446683 ) ( ON ?auto_446682 ?auto_446684 ) ( CLEAR ?auto_446682 ) ( not ( = ?auto_446681 ?auto_446684 ) ) ( not ( = ?auto_446682 ?auto_446684 ) ) ( not ( = ?auto_446680 ?auto_446684 ) ) ( TRUCK-AT ?auto_446687 ?auto_446688 ) ( SURFACE-AT ?auto_446680 ?auto_446688 ) ( CLEAR ?auto_446680 ) ( IS-CRATE ?auto_446681 ) ( AVAILABLE ?auto_446686 ) ( IN ?auto_446681 ?auto_446687 ) ( ON ?auto_446676 ?auto_446675 ) ( ON ?auto_446677 ?auto_446676 ) ( ON ?auto_446679 ?auto_446677 ) ( ON ?auto_446678 ?auto_446679 ) ( ON ?auto_446680 ?auto_446678 ) ( not ( = ?auto_446675 ?auto_446676 ) ) ( not ( = ?auto_446675 ?auto_446677 ) ) ( not ( = ?auto_446675 ?auto_446679 ) ) ( not ( = ?auto_446675 ?auto_446678 ) ) ( not ( = ?auto_446675 ?auto_446680 ) ) ( not ( = ?auto_446675 ?auto_446681 ) ) ( not ( = ?auto_446675 ?auto_446682 ) ) ( not ( = ?auto_446675 ?auto_446684 ) ) ( not ( = ?auto_446676 ?auto_446677 ) ) ( not ( = ?auto_446676 ?auto_446679 ) ) ( not ( = ?auto_446676 ?auto_446678 ) ) ( not ( = ?auto_446676 ?auto_446680 ) ) ( not ( = ?auto_446676 ?auto_446681 ) ) ( not ( = ?auto_446676 ?auto_446682 ) ) ( not ( = ?auto_446676 ?auto_446684 ) ) ( not ( = ?auto_446677 ?auto_446679 ) ) ( not ( = ?auto_446677 ?auto_446678 ) ) ( not ( = ?auto_446677 ?auto_446680 ) ) ( not ( = ?auto_446677 ?auto_446681 ) ) ( not ( = ?auto_446677 ?auto_446682 ) ) ( not ( = ?auto_446677 ?auto_446684 ) ) ( not ( = ?auto_446679 ?auto_446678 ) ) ( not ( = ?auto_446679 ?auto_446680 ) ) ( not ( = ?auto_446679 ?auto_446681 ) ) ( not ( = ?auto_446679 ?auto_446682 ) ) ( not ( = ?auto_446679 ?auto_446684 ) ) ( not ( = ?auto_446678 ?auto_446680 ) ) ( not ( = ?auto_446678 ?auto_446681 ) ) ( not ( = ?auto_446678 ?auto_446682 ) ) ( not ( = ?auto_446678 ?auto_446684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_446680 ?auto_446681 ?auto_446682 )
      ( MAKE-7CRATE-VERIFY ?auto_446675 ?auto_446676 ?auto_446677 ?auto_446679 ?auto_446678 ?auto_446680 ?auto_446681 ?auto_446682 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_449571 - SURFACE
      ?auto_449572 - SURFACE
      ?auto_449573 - SURFACE
      ?auto_449575 - SURFACE
      ?auto_449574 - SURFACE
      ?auto_449576 - SURFACE
      ?auto_449577 - SURFACE
      ?auto_449578 - SURFACE
      ?auto_449579 - SURFACE
    )
    :vars
    (
      ?auto_449580 - HOIST
      ?auto_449581 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_449580 ?auto_449581 ) ( SURFACE-AT ?auto_449578 ?auto_449581 ) ( CLEAR ?auto_449578 ) ( LIFTING ?auto_449580 ?auto_449579 ) ( IS-CRATE ?auto_449579 ) ( not ( = ?auto_449578 ?auto_449579 ) ) ( ON ?auto_449572 ?auto_449571 ) ( ON ?auto_449573 ?auto_449572 ) ( ON ?auto_449575 ?auto_449573 ) ( ON ?auto_449574 ?auto_449575 ) ( ON ?auto_449576 ?auto_449574 ) ( ON ?auto_449577 ?auto_449576 ) ( ON ?auto_449578 ?auto_449577 ) ( not ( = ?auto_449571 ?auto_449572 ) ) ( not ( = ?auto_449571 ?auto_449573 ) ) ( not ( = ?auto_449571 ?auto_449575 ) ) ( not ( = ?auto_449571 ?auto_449574 ) ) ( not ( = ?auto_449571 ?auto_449576 ) ) ( not ( = ?auto_449571 ?auto_449577 ) ) ( not ( = ?auto_449571 ?auto_449578 ) ) ( not ( = ?auto_449571 ?auto_449579 ) ) ( not ( = ?auto_449572 ?auto_449573 ) ) ( not ( = ?auto_449572 ?auto_449575 ) ) ( not ( = ?auto_449572 ?auto_449574 ) ) ( not ( = ?auto_449572 ?auto_449576 ) ) ( not ( = ?auto_449572 ?auto_449577 ) ) ( not ( = ?auto_449572 ?auto_449578 ) ) ( not ( = ?auto_449572 ?auto_449579 ) ) ( not ( = ?auto_449573 ?auto_449575 ) ) ( not ( = ?auto_449573 ?auto_449574 ) ) ( not ( = ?auto_449573 ?auto_449576 ) ) ( not ( = ?auto_449573 ?auto_449577 ) ) ( not ( = ?auto_449573 ?auto_449578 ) ) ( not ( = ?auto_449573 ?auto_449579 ) ) ( not ( = ?auto_449575 ?auto_449574 ) ) ( not ( = ?auto_449575 ?auto_449576 ) ) ( not ( = ?auto_449575 ?auto_449577 ) ) ( not ( = ?auto_449575 ?auto_449578 ) ) ( not ( = ?auto_449575 ?auto_449579 ) ) ( not ( = ?auto_449574 ?auto_449576 ) ) ( not ( = ?auto_449574 ?auto_449577 ) ) ( not ( = ?auto_449574 ?auto_449578 ) ) ( not ( = ?auto_449574 ?auto_449579 ) ) ( not ( = ?auto_449576 ?auto_449577 ) ) ( not ( = ?auto_449576 ?auto_449578 ) ) ( not ( = ?auto_449576 ?auto_449579 ) ) ( not ( = ?auto_449577 ?auto_449578 ) ) ( not ( = ?auto_449577 ?auto_449579 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_449578 ?auto_449579 )
      ( MAKE-8CRATE-VERIFY ?auto_449571 ?auto_449572 ?auto_449573 ?auto_449575 ?auto_449574 ?auto_449576 ?auto_449577 ?auto_449578 ?auto_449579 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_449638 - SURFACE
      ?auto_449639 - SURFACE
      ?auto_449640 - SURFACE
      ?auto_449642 - SURFACE
      ?auto_449641 - SURFACE
      ?auto_449643 - SURFACE
      ?auto_449644 - SURFACE
      ?auto_449645 - SURFACE
      ?auto_449646 - SURFACE
    )
    :vars
    (
      ?auto_449647 - HOIST
      ?auto_449648 - PLACE
      ?auto_449649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_449647 ?auto_449648 ) ( SURFACE-AT ?auto_449645 ?auto_449648 ) ( CLEAR ?auto_449645 ) ( IS-CRATE ?auto_449646 ) ( not ( = ?auto_449645 ?auto_449646 ) ) ( TRUCK-AT ?auto_449649 ?auto_449648 ) ( AVAILABLE ?auto_449647 ) ( IN ?auto_449646 ?auto_449649 ) ( ON ?auto_449645 ?auto_449644 ) ( not ( = ?auto_449644 ?auto_449645 ) ) ( not ( = ?auto_449644 ?auto_449646 ) ) ( ON ?auto_449639 ?auto_449638 ) ( ON ?auto_449640 ?auto_449639 ) ( ON ?auto_449642 ?auto_449640 ) ( ON ?auto_449641 ?auto_449642 ) ( ON ?auto_449643 ?auto_449641 ) ( ON ?auto_449644 ?auto_449643 ) ( not ( = ?auto_449638 ?auto_449639 ) ) ( not ( = ?auto_449638 ?auto_449640 ) ) ( not ( = ?auto_449638 ?auto_449642 ) ) ( not ( = ?auto_449638 ?auto_449641 ) ) ( not ( = ?auto_449638 ?auto_449643 ) ) ( not ( = ?auto_449638 ?auto_449644 ) ) ( not ( = ?auto_449638 ?auto_449645 ) ) ( not ( = ?auto_449638 ?auto_449646 ) ) ( not ( = ?auto_449639 ?auto_449640 ) ) ( not ( = ?auto_449639 ?auto_449642 ) ) ( not ( = ?auto_449639 ?auto_449641 ) ) ( not ( = ?auto_449639 ?auto_449643 ) ) ( not ( = ?auto_449639 ?auto_449644 ) ) ( not ( = ?auto_449639 ?auto_449645 ) ) ( not ( = ?auto_449639 ?auto_449646 ) ) ( not ( = ?auto_449640 ?auto_449642 ) ) ( not ( = ?auto_449640 ?auto_449641 ) ) ( not ( = ?auto_449640 ?auto_449643 ) ) ( not ( = ?auto_449640 ?auto_449644 ) ) ( not ( = ?auto_449640 ?auto_449645 ) ) ( not ( = ?auto_449640 ?auto_449646 ) ) ( not ( = ?auto_449642 ?auto_449641 ) ) ( not ( = ?auto_449642 ?auto_449643 ) ) ( not ( = ?auto_449642 ?auto_449644 ) ) ( not ( = ?auto_449642 ?auto_449645 ) ) ( not ( = ?auto_449642 ?auto_449646 ) ) ( not ( = ?auto_449641 ?auto_449643 ) ) ( not ( = ?auto_449641 ?auto_449644 ) ) ( not ( = ?auto_449641 ?auto_449645 ) ) ( not ( = ?auto_449641 ?auto_449646 ) ) ( not ( = ?auto_449643 ?auto_449644 ) ) ( not ( = ?auto_449643 ?auto_449645 ) ) ( not ( = ?auto_449643 ?auto_449646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_449644 ?auto_449645 ?auto_449646 )
      ( MAKE-8CRATE-VERIFY ?auto_449638 ?auto_449639 ?auto_449640 ?auto_449642 ?auto_449641 ?auto_449643 ?auto_449644 ?auto_449645 ?auto_449646 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_449714 - SURFACE
      ?auto_449715 - SURFACE
      ?auto_449716 - SURFACE
      ?auto_449718 - SURFACE
      ?auto_449717 - SURFACE
      ?auto_449719 - SURFACE
      ?auto_449720 - SURFACE
      ?auto_449721 - SURFACE
      ?auto_449722 - SURFACE
    )
    :vars
    (
      ?auto_449724 - HOIST
      ?auto_449725 - PLACE
      ?auto_449723 - TRUCK
      ?auto_449726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_449724 ?auto_449725 ) ( SURFACE-AT ?auto_449721 ?auto_449725 ) ( CLEAR ?auto_449721 ) ( IS-CRATE ?auto_449722 ) ( not ( = ?auto_449721 ?auto_449722 ) ) ( AVAILABLE ?auto_449724 ) ( IN ?auto_449722 ?auto_449723 ) ( ON ?auto_449721 ?auto_449720 ) ( not ( = ?auto_449720 ?auto_449721 ) ) ( not ( = ?auto_449720 ?auto_449722 ) ) ( TRUCK-AT ?auto_449723 ?auto_449726 ) ( not ( = ?auto_449726 ?auto_449725 ) ) ( ON ?auto_449715 ?auto_449714 ) ( ON ?auto_449716 ?auto_449715 ) ( ON ?auto_449718 ?auto_449716 ) ( ON ?auto_449717 ?auto_449718 ) ( ON ?auto_449719 ?auto_449717 ) ( ON ?auto_449720 ?auto_449719 ) ( not ( = ?auto_449714 ?auto_449715 ) ) ( not ( = ?auto_449714 ?auto_449716 ) ) ( not ( = ?auto_449714 ?auto_449718 ) ) ( not ( = ?auto_449714 ?auto_449717 ) ) ( not ( = ?auto_449714 ?auto_449719 ) ) ( not ( = ?auto_449714 ?auto_449720 ) ) ( not ( = ?auto_449714 ?auto_449721 ) ) ( not ( = ?auto_449714 ?auto_449722 ) ) ( not ( = ?auto_449715 ?auto_449716 ) ) ( not ( = ?auto_449715 ?auto_449718 ) ) ( not ( = ?auto_449715 ?auto_449717 ) ) ( not ( = ?auto_449715 ?auto_449719 ) ) ( not ( = ?auto_449715 ?auto_449720 ) ) ( not ( = ?auto_449715 ?auto_449721 ) ) ( not ( = ?auto_449715 ?auto_449722 ) ) ( not ( = ?auto_449716 ?auto_449718 ) ) ( not ( = ?auto_449716 ?auto_449717 ) ) ( not ( = ?auto_449716 ?auto_449719 ) ) ( not ( = ?auto_449716 ?auto_449720 ) ) ( not ( = ?auto_449716 ?auto_449721 ) ) ( not ( = ?auto_449716 ?auto_449722 ) ) ( not ( = ?auto_449718 ?auto_449717 ) ) ( not ( = ?auto_449718 ?auto_449719 ) ) ( not ( = ?auto_449718 ?auto_449720 ) ) ( not ( = ?auto_449718 ?auto_449721 ) ) ( not ( = ?auto_449718 ?auto_449722 ) ) ( not ( = ?auto_449717 ?auto_449719 ) ) ( not ( = ?auto_449717 ?auto_449720 ) ) ( not ( = ?auto_449717 ?auto_449721 ) ) ( not ( = ?auto_449717 ?auto_449722 ) ) ( not ( = ?auto_449719 ?auto_449720 ) ) ( not ( = ?auto_449719 ?auto_449721 ) ) ( not ( = ?auto_449719 ?auto_449722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_449720 ?auto_449721 ?auto_449722 )
      ( MAKE-8CRATE-VERIFY ?auto_449714 ?auto_449715 ?auto_449716 ?auto_449718 ?auto_449717 ?auto_449719 ?auto_449720 ?auto_449721 ?auto_449722 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_449798 - SURFACE
      ?auto_449799 - SURFACE
      ?auto_449800 - SURFACE
      ?auto_449802 - SURFACE
      ?auto_449801 - SURFACE
      ?auto_449803 - SURFACE
      ?auto_449804 - SURFACE
      ?auto_449805 - SURFACE
      ?auto_449806 - SURFACE
    )
    :vars
    (
      ?auto_449811 - HOIST
      ?auto_449808 - PLACE
      ?auto_449810 - TRUCK
      ?auto_449807 - PLACE
      ?auto_449809 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_449811 ?auto_449808 ) ( SURFACE-AT ?auto_449805 ?auto_449808 ) ( CLEAR ?auto_449805 ) ( IS-CRATE ?auto_449806 ) ( not ( = ?auto_449805 ?auto_449806 ) ) ( AVAILABLE ?auto_449811 ) ( ON ?auto_449805 ?auto_449804 ) ( not ( = ?auto_449804 ?auto_449805 ) ) ( not ( = ?auto_449804 ?auto_449806 ) ) ( TRUCK-AT ?auto_449810 ?auto_449807 ) ( not ( = ?auto_449807 ?auto_449808 ) ) ( HOIST-AT ?auto_449809 ?auto_449807 ) ( LIFTING ?auto_449809 ?auto_449806 ) ( not ( = ?auto_449811 ?auto_449809 ) ) ( ON ?auto_449799 ?auto_449798 ) ( ON ?auto_449800 ?auto_449799 ) ( ON ?auto_449802 ?auto_449800 ) ( ON ?auto_449801 ?auto_449802 ) ( ON ?auto_449803 ?auto_449801 ) ( ON ?auto_449804 ?auto_449803 ) ( not ( = ?auto_449798 ?auto_449799 ) ) ( not ( = ?auto_449798 ?auto_449800 ) ) ( not ( = ?auto_449798 ?auto_449802 ) ) ( not ( = ?auto_449798 ?auto_449801 ) ) ( not ( = ?auto_449798 ?auto_449803 ) ) ( not ( = ?auto_449798 ?auto_449804 ) ) ( not ( = ?auto_449798 ?auto_449805 ) ) ( not ( = ?auto_449798 ?auto_449806 ) ) ( not ( = ?auto_449799 ?auto_449800 ) ) ( not ( = ?auto_449799 ?auto_449802 ) ) ( not ( = ?auto_449799 ?auto_449801 ) ) ( not ( = ?auto_449799 ?auto_449803 ) ) ( not ( = ?auto_449799 ?auto_449804 ) ) ( not ( = ?auto_449799 ?auto_449805 ) ) ( not ( = ?auto_449799 ?auto_449806 ) ) ( not ( = ?auto_449800 ?auto_449802 ) ) ( not ( = ?auto_449800 ?auto_449801 ) ) ( not ( = ?auto_449800 ?auto_449803 ) ) ( not ( = ?auto_449800 ?auto_449804 ) ) ( not ( = ?auto_449800 ?auto_449805 ) ) ( not ( = ?auto_449800 ?auto_449806 ) ) ( not ( = ?auto_449802 ?auto_449801 ) ) ( not ( = ?auto_449802 ?auto_449803 ) ) ( not ( = ?auto_449802 ?auto_449804 ) ) ( not ( = ?auto_449802 ?auto_449805 ) ) ( not ( = ?auto_449802 ?auto_449806 ) ) ( not ( = ?auto_449801 ?auto_449803 ) ) ( not ( = ?auto_449801 ?auto_449804 ) ) ( not ( = ?auto_449801 ?auto_449805 ) ) ( not ( = ?auto_449801 ?auto_449806 ) ) ( not ( = ?auto_449803 ?auto_449804 ) ) ( not ( = ?auto_449803 ?auto_449805 ) ) ( not ( = ?auto_449803 ?auto_449806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_449804 ?auto_449805 ?auto_449806 )
      ( MAKE-8CRATE-VERIFY ?auto_449798 ?auto_449799 ?auto_449800 ?auto_449802 ?auto_449801 ?auto_449803 ?auto_449804 ?auto_449805 ?auto_449806 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_449890 - SURFACE
      ?auto_449891 - SURFACE
      ?auto_449892 - SURFACE
      ?auto_449894 - SURFACE
      ?auto_449893 - SURFACE
      ?auto_449895 - SURFACE
      ?auto_449896 - SURFACE
      ?auto_449897 - SURFACE
      ?auto_449898 - SURFACE
    )
    :vars
    (
      ?auto_449904 - HOIST
      ?auto_449900 - PLACE
      ?auto_449901 - TRUCK
      ?auto_449899 - PLACE
      ?auto_449903 - HOIST
      ?auto_449902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_449904 ?auto_449900 ) ( SURFACE-AT ?auto_449897 ?auto_449900 ) ( CLEAR ?auto_449897 ) ( IS-CRATE ?auto_449898 ) ( not ( = ?auto_449897 ?auto_449898 ) ) ( AVAILABLE ?auto_449904 ) ( ON ?auto_449897 ?auto_449896 ) ( not ( = ?auto_449896 ?auto_449897 ) ) ( not ( = ?auto_449896 ?auto_449898 ) ) ( TRUCK-AT ?auto_449901 ?auto_449899 ) ( not ( = ?auto_449899 ?auto_449900 ) ) ( HOIST-AT ?auto_449903 ?auto_449899 ) ( not ( = ?auto_449904 ?auto_449903 ) ) ( AVAILABLE ?auto_449903 ) ( SURFACE-AT ?auto_449898 ?auto_449899 ) ( ON ?auto_449898 ?auto_449902 ) ( CLEAR ?auto_449898 ) ( not ( = ?auto_449897 ?auto_449902 ) ) ( not ( = ?auto_449898 ?auto_449902 ) ) ( not ( = ?auto_449896 ?auto_449902 ) ) ( ON ?auto_449891 ?auto_449890 ) ( ON ?auto_449892 ?auto_449891 ) ( ON ?auto_449894 ?auto_449892 ) ( ON ?auto_449893 ?auto_449894 ) ( ON ?auto_449895 ?auto_449893 ) ( ON ?auto_449896 ?auto_449895 ) ( not ( = ?auto_449890 ?auto_449891 ) ) ( not ( = ?auto_449890 ?auto_449892 ) ) ( not ( = ?auto_449890 ?auto_449894 ) ) ( not ( = ?auto_449890 ?auto_449893 ) ) ( not ( = ?auto_449890 ?auto_449895 ) ) ( not ( = ?auto_449890 ?auto_449896 ) ) ( not ( = ?auto_449890 ?auto_449897 ) ) ( not ( = ?auto_449890 ?auto_449898 ) ) ( not ( = ?auto_449890 ?auto_449902 ) ) ( not ( = ?auto_449891 ?auto_449892 ) ) ( not ( = ?auto_449891 ?auto_449894 ) ) ( not ( = ?auto_449891 ?auto_449893 ) ) ( not ( = ?auto_449891 ?auto_449895 ) ) ( not ( = ?auto_449891 ?auto_449896 ) ) ( not ( = ?auto_449891 ?auto_449897 ) ) ( not ( = ?auto_449891 ?auto_449898 ) ) ( not ( = ?auto_449891 ?auto_449902 ) ) ( not ( = ?auto_449892 ?auto_449894 ) ) ( not ( = ?auto_449892 ?auto_449893 ) ) ( not ( = ?auto_449892 ?auto_449895 ) ) ( not ( = ?auto_449892 ?auto_449896 ) ) ( not ( = ?auto_449892 ?auto_449897 ) ) ( not ( = ?auto_449892 ?auto_449898 ) ) ( not ( = ?auto_449892 ?auto_449902 ) ) ( not ( = ?auto_449894 ?auto_449893 ) ) ( not ( = ?auto_449894 ?auto_449895 ) ) ( not ( = ?auto_449894 ?auto_449896 ) ) ( not ( = ?auto_449894 ?auto_449897 ) ) ( not ( = ?auto_449894 ?auto_449898 ) ) ( not ( = ?auto_449894 ?auto_449902 ) ) ( not ( = ?auto_449893 ?auto_449895 ) ) ( not ( = ?auto_449893 ?auto_449896 ) ) ( not ( = ?auto_449893 ?auto_449897 ) ) ( not ( = ?auto_449893 ?auto_449898 ) ) ( not ( = ?auto_449893 ?auto_449902 ) ) ( not ( = ?auto_449895 ?auto_449896 ) ) ( not ( = ?auto_449895 ?auto_449897 ) ) ( not ( = ?auto_449895 ?auto_449898 ) ) ( not ( = ?auto_449895 ?auto_449902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_449896 ?auto_449897 ?auto_449898 )
      ( MAKE-8CRATE-VERIFY ?auto_449890 ?auto_449891 ?auto_449892 ?auto_449894 ?auto_449893 ?auto_449895 ?auto_449896 ?auto_449897 ?auto_449898 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_449983 - SURFACE
      ?auto_449984 - SURFACE
      ?auto_449985 - SURFACE
      ?auto_449987 - SURFACE
      ?auto_449986 - SURFACE
      ?auto_449988 - SURFACE
      ?auto_449989 - SURFACE
      ?auto_449990 - SURFACE
      ?auto_449991 - SURFACE
    )
    :vars
    (
      ?auto_449993 - HOIST
      ?auto_449996 - PLACE
      ?auto_449997 - PLACE
      ?auto_449995 - HOIST
      ?auto_449994 - SURFACE
      ?auto_449992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_449993 ?auto_449996 ) ( SURFACE-AT ?auto_449990 ?auto_449996 ) ( CLEAR ?auto_449990 ) ( IS-CRATE ?auto_449991 ) ( not ( = ?auto_449990 ?auto_449991 ) ) ( AVAILABLE ?auto_449993 ) ( ON ?auto_449990 ?auto_449989 ) ( not ( = ?auto_449989 ?auto_449990 ) ) ( not ( = ?auto_449989 ?auto_449991 ) ) ( not ( = ?auto_449997 ?auto_449996 ) ) ( HOIST-AT ?auto_449995 ?auto_449997 ) ( not ( = ?auto_449993 ?auto_449995 ) ) ( AVAILABLE ?auto_449995 ) ( SURFACE-AT ?auto_449991 ?auto_449997 ) ( ON ?auto_449991 ?auto_449994 ) ( CLEAR ?auto_449991 ) ( not ( = ?auto_449990 ?auto_449994 ) ) ( not ( = ?auto_449991 ?auto_449994 ) ) ( not ( = ?auto_449989 ?auto_449994 ) ) ( TRUCK-AT ?auto_449992 ?auto_449996 ) ( ON ?auto_449984 ?auto_449983 ) ( ON ?auto_449985 ?auto_449984 ) ( ON ?auto_449987 ?auto_449985 ) ( ON ?auto_449986 ?auto_449987 ) ( ON ?auto_449988 ?auto_449986 ) ( ON ?auto_449989 ?auto_449988 ) ( not ( = ?auto_449983 ?auto_449984 ) ) ( not ( = ?auto_449983 ?auto_449985 ) ) ( not ( = ?auto_449983 ?auto_449987 ) ) ( not ( = ?auto_449983 ?auto_449986 ) ) ( not ( = ?auto_449983 ?auto_449988 ) ) ( not ( = ?auto_449983 ?auto_449989 ) ) ( not ( = ?auto_449983 ?auto_449990 ) ) ( not ( = ?auto_449983 ?auto_449991 ) ) ( not ( = ?auto_449983 ?auto_449994 ) ) ( not ( = ?auto_449984 ?auto_449985 ) ) ( not ( = ?auto_449984 ?auto_449987 ) ) ( not ( = ?auto_449984 ?auto_449986 ) ) ( not ( = ?auto_449984 ?auto_449988 ) ) ( not ( = ?auto_449984 ?auto_449989 ) ) ( not ( = ?auto_449984 ?auto_449990 ) ) ( not ( = ?auto_449984 ?auto_449991 ) ) ( not ( = ?auto_449984 ?auto_449994 ) ) ( not ( = ?auto_449985 ?auto_449987 ) ) ( not ( = ?auto_449985 ?auto_449986 ) ) ( not ( = ?auto_449985 ?auto_449988 ) ) ( not ( = ?auto_449985 ?auto_449989 ) ) ( not ( = ?auto_449985 ?auto_449990 ) ) ( not ( = ?auto_449985 ?auto_449991 ) ) ( not ( = ?auto_449985 ?auto_449994 ) ) ( not ( = ?auto_449987 ?auto_449986 ) ) ( not ( = ?auto_449987 ?auto_449988 ) ) ( not ( = ?auto_449987 ?auto_449989 ) ) ( not ( = ?auto_449987 ?auto_449990 ) ) ( not ( = ?auto_449987 ?auto_449991 ) ) ( not ( = ?auto_449987 ?auto_449994 ) ) ( not ( = ?auto_449986 ?auto_449988 ) ) ( not ( = ?auto_449986 ?auto_449989 ) ) ( not ( = ?auto_449986 ?auto_449990 ) ) ( not ( = ?auto_449986 ?auto_449991 ) ) ( not ( = ?auto_449986 ?auto_449994 ) ) ( not ( = ?auto_449988 ?auto_449989 ) ) ( not ( = ?auto_449988 ?auto_449990 ) ) ( not ( = ?auto_449988 ?auto_449991 ) ) ( not ( = ?auto_449988 ?auto_449994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_449989 ?auto_449990 ?auto_449991 )
      ( MAKE-8CRATE-VERIFY ?auto_449983 ?auto_449984 ?auto_449985 ?auto_449987 ?auto_449986 ?auto_449988 ?auto_449989 ?auto_449990 ?auto_449991 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450076 - SURFACE
      ?auto_450077 - SURFACE
      ?auto_450078 - SURFACE
      ?auto_450080 - SURFACE
      ?auto_450079 - SURFACE
      ?auto_450081 - SURFACE
      ?auto_450082 - SURFACE
      ?auto_450083 - SURFACE
      ?auto_450084 - SURFACE
    )
    :vars
    (
      ?auto_450089 - HOIST
      ?auto_450088 - PLACE
      ?auto_450087 - PLACE
      ?auto_450085 - HOIST
      ?auto_450090 - SURFACE
      ?auto_450086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450089 ?auto_450088 ) ( IS-CRATE ?auto_450084 ) ( not ( = ?auto_450083 ?auto_450084 ) ) ( not ( = ?auto_450082 ?auto_450083 ) ) ( not ( = ?auto_450082 ?auto_450084 ) ) ( not ( = ?auto_450087 ?auto_450088 ) ) ( HOIST-AT ?auto_450085 ?auto_450087 ) ( not ( = ?auto_450089 ?auto_450085 ) ) ( AVAILABLE ?auto_450085 ) ( SURFACE-AT ?auto_450084 ?auto_450087 ) ( ON ?auto_450084 ?auto_450090 ) ( CLEAR ?auto_450084 ) ( not ( = ?auto_450083 ?auto_450090 ) ) ( not ( = ?auto_450084 ?auto_450090 ) ) ( not ( = ?auto_450082 ?auto_450090 ) ) ( TRUCK-AT ?auto_450086 ?auto_450088 ) ( SURFACE-AT ?auto_450082 ?auto_450088 ) ( CLEAR ?auto_450082 ) ( LIFTING ?auto_450089 ?auto_450083 ) ( IS-CRATE ?auto_450083 ) ( ON ?auto_450077 ?auto_450076 ) ( ON ?auto_450078 ?auto_450077 ) ( ON ?auto_450080 ?auto_450078 ) ( ON ?auto_450079 ?auto_450080 ) ( ON ?auto_450081 ?auto_450079 ) ( ON ?auto_450082 ?auto_450081 ) ( not ( = ?auto_450076 ?auto_450077 ) ) ( not ( = ?auto_450076 ?auto_450078 ) ) ( not ( = ?auto_450076 ?auto_450080 ) ) ( not ( = ?auto_450076 ?auto_450079 ) ) ( not ( = ?auto_450076 ?auto_450081 ) ) ( not ( = ?auto_450076 ?auto_450082 ) ) ( not ( = ?auto_450076 ?auto_450083 ) ) ( not ( = ?auto_450076 ?auto_450084 ) ) ( not ( = ?auto_450076 ?auto_450090 ) ) ( not ( = ?auto_450077 ?auto_450078 ) ) ( not ( = ?auto_450077 ?auto_450080 ) ) ( not ( = ?auto_450077 ?auto_450079 ) ) ( not ( = ?auto_450077 ?auto_450081 ) ) ( not ( = ?auto_450077 ?auto_450082 ) ) ( not ( = ?auto_450077 ?auto_450083 ) ) ( not ( = ?auto_450077 ?auto_450084 ) ) ( not ( = ?auto_450077 ?auto_450090 ) ) ( not ( = ?auto_450078 ?auto_450080 ) ) ( not ( = ?auto_450078 ?auto_450079 ) ) ( not ( = ?auto_450078 ?auto_450081 ) ) ( not ( = ?auto_450078 ?auto_450082 ) ) ( not ( = ?auto_450078 ?auto_450083 ) ) ( not ( = ?auto_450078 ?auto_450084 ) ) ( not ( = ?auto_450078 ?auto_450090 ) ) ( not ( = ?auto_450080 ?auto_450079 ) ) ( not ( = ?auto_450080 ?auto_450081 ) ) ( not ( = ?auto_450080 ?auto_450082 ) ) ( not ( = ?auto_450080 ?auto_450083 ) ) ( not ( = ?auto_450080 ?auto_450084 ) ) ( not ( = ?auto_450080 ?auto_450090 ) ) ( not ( = ?auto_450079 ?auto_450081 ) ) ( not ( = ?auto_450079 ?auto_450082 ) ) ( not ( = ?auto_450079 ?auto_450083 ) ) ( not ( = ?auto_450079 ?auto_450084 ) ) ( not ( = ?auto_450079 ?auto_450090 ) ) ( not ( = ?auto_450081 ?auto_450082 ) ) ( not ( = ?auto_450081 ?auto_450083 ) ) ( not ( = ?auto_450081 ?auto_450084 ) ) ( not ( = ?auto_450081 ?auto_450090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450082 ?auto_450083 ?auto_450084 )
      ( MAKE-8CRATE-VERIFY ?auto_450076 ?auto_450077 ?auto_450078 ?auto_450080 ?auto_450079 ?auto_450081 ?auto_450082 ?auto_450083 ?auto_450084 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_450169 - SURFACE
      ?auto_450170 - SURFACE
      ?auto_450171 - SURFACE
      ?auto_450173 - SURFACE
      ?auto_450172 - SURFACE
      ?auto_450174 - SURFACE
      ?auto_450175 - SURFACE
      ?auto_450176 - SURFACE
      ?auto_450177 - SURFACE
    )
    :vars
    (
      ?auto_450179 - HOIST
      ?auto_450181 - PLACE
      ?auto_450178 - PLACE
      ?auto_450182 - HOIST
      ?auto_450183 - SURFACE
      ?auto_450180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450179 ?auto_450181 ) ( IS-CRATE ?auto_450177 ) ( not ( = ?auto_450176 ?auto_450177 ) ) ( not ( = ?auto_450175 ?auto_450176 ) ) ( not ( = ?auto_450175 ?auto_450177 ) ) ( not ( = ?auto_450178 ?auto_450181 ) ) ( HOIST-AT ?auto_450182 ?auto_450178 ) ( not ( = ?auto_450179 ?auto_450182 ) ) ( AVAILABLE ?auto_450182 ) ( SURFACE-AT ?auto_450177 ?auto_450178 ) ( ON ?auto_450177 ?auto_450183 ) ( CLEAR ?auto_450177 ) ( not ( = ?auto_450176 ?auto_450183 ) ) ( not ( = ?auto_450177 ?auto_450183 ) ) ( not ( = ?auto_450175 ?auto_450183 ) ) ( TRUCK-AT ?auto_450180 ?auto_450181 ) ( SURFACE-AT ?auto_450175 ?auto_450181 ) ( CLEAR ?auto_450175 ) ( IS-CRATE ?auto_450176 ) ( AVAILABLE ?auto_450179 ) ( IN ?auto_450176 ?auto_450180 ) ( ON ?auto_450170 ?auto_450169 ) ( ON ?auto_450171 ?auto_450170 ) ( ON ?auto_450173 ?auto_450171 ) ( ON ?auto_450172 ?auto_450173 ) ( ON ?auto_450174 ?auto_450172 ) ( ON ?auto_450175 ?auto_450174 ) ( not ( = ?auto_450169 ?auto_450170 ) ) ( not ( = ?auto_450169 ?auto_450171 ) ) ( not ( = ?auto_450169 ?auto_450173 ) ) ( not ( = ?auto_450169 ?auto_450172 ) ) ( not ( = ?auto_450169 ?auto_450174 ) ) ( not ( = ?auto_450169 ?auto_450175 ) ) ( not ( = ?auto_450169 ?auto_450176 ) ) ( not ( = ?auto_450169 ?auto_450177 ) ) ( not ( = ?auto_450169 ?auto_450183 ) ) ( not ( = ?auto_450170 ?auto_450171 ) ) ( not ( = ?auto_450170 ?auto_450173 ) ) ( not ( = ?auto_450170 ?auto_450172 ) ) ( not ( = ?auto_450170 ?auto_450174 ) ) ( not ( = ?auto_450170 ?auto_450175 ) ) ( not ( = ?auto_450170 ?auto_450176 ) ) ( not ( = ?auto_450170 ?auto_450177 ) ) ( not ( = ?auto_450170 ?auto_450183 ) ) ( not ( = ?auto_450171 ?auto_450173 ) ) ( not ( = ?auto_450171 ?auto_450172 ) ) ( not ( = ?auto_450171 ?auto_450174 ) ) ( not ( = ?auto_450171 ?auto_450175 ) ) ( not ( = ?auto_450171 ?auto_450176 ) ) ( not ( = ?auto_450171 ?auto_450177 ) ) ( not ( = ?auto_450171 ?auto_450183 ) ) ( not ( = ?auto_450173 ?auto_450172 ) ) ( not ( = ?auto_450173 ?auto_450174 ) ) ( not ( = ?auto_450173 ?auto_450175 ) ) ( not ( = ?auto_450173 ?auto_450176 ) ) ( not ( = ?auto_450173 ?auto_450177 ) ) ( not ( = ?auto_450173 ?auto_450183 ) ) ( not ( = ?auto_450172 ?auto_450174 ) ) ( not ( = ?auto_450172 ?auto_450175 ) ) ( not ( = ?auto_450172 ?auto_450176 ) ) ( not ( = ?auto_450172 ?auto_450177 ) ) ( not ( = ?auto_450172 ?auto_450183 ) ) ( not ( = ?auto_450174 ?auto_450175 ) ) ( not ( = ?auto_450174 ?auto_450176 ) ) ( not ( = ?auto_450174 ?auto_450177 ) ) ( not ( = ?auto_450174 ?auto_450183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_450175 ?auto_450176 ?auto_450177 )
      ( MAKE-8CRATE-VERIFY ?auto_450169 ?auto_450170 ?auto_450171 ?auto_450173 ?auto_450172 ?auto_450174 ?auto_450175 ?auto_450176 ?auto_450177 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454274 - SURFACE
      ?auto_454275 - SURFACE
      ?auto_454276 - SURFACE
      ?auto_454278 - SURFACE
      ?auto_454277 - SURFACE
      ?auto_454279 - SURFACE
      ?auto_454280 - SURFACE
      ?auto_454281 - SURFACE
      ?auto_454282 - SURFACE
      ?auto_454283 - SURFACE
    )
    :vars
    (
      ?auto_454284 - HOIST
      ?auto_454285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_454284 ?auto_454285 ) ( SURFACE-AT ?auto_454282 ?auto_454285 ) ( CLEAR ?auto_454282 ) ( LIFTING ?auto_454284 ?auto_454283 ) ( IS-CRATE ?auto_454283 ) ( not ( = ?auto_454282 ?auto_454283 ) ) ( ON ?auto_454275 ?auto_454274 ) ( ON ?auto_454276 ?auto_454275 ) ( ON ?auto_454278 ?auto_454276 ) ( ON ?auto_454277 ?auto_454278 ) ( ON ?auto_454279 ?auto_454277 ) ( ON ?auto_454280 ?auto_454279 ) ( ON ?auto_454281 ?auto_454280 ) ( ON ?auto_454282 ?auto_454281 ) ( not ( = ?auto_454274 ?auto_454275 ) ) ( not ( = ?auto_454274 ?auto_454276 ) ) ( not ( = ?auto_454274 ?auto_454278 ) ) ( not ( = ?auto_454274 ?auto_454277 ) ) ( not ( = ?auto_454274 ?auto_454279 ) ) ( not ( = ?auto_454274 ?auto_454280 ) ) ( not ( = ?auto_454274 ?auto_454281 ) ) ( not ( = ?auto_454274 ?auto_454282 ) ) ( not ( = ?auto_454274 ?auto_454283 ) ) ( not ( = ?auto_454275 ?auto_454276 ) ) ( not ( = ?auto_454275 ?auto_454278 ) ) ( not ( = ?auto_454275 ?auto_454277 ) ) ( not ( = ?auto_454275 ?auto_454279 ) ) ( not ( = ?auto_454275 ?auto_454280 ) ) ( not ( = ?auto_454275 ?auto_454281 ) ) ( not ( = ?auto_454275 ?auto_454282 ) ) ( not ( = ?auto_454275 ?auto_454283 ) ) ( not ( = ?auto_454276 ?auto_454278 ) ) ( not ( = ?auto_454276 ?auto_454277 ) ) ( not ( = ?auto_454276 ?auto_454279 ) ) ( not ( = ?auto_454276 ?auto_454280 ) ) ( not ( = ?auto_454276 ?auto_454281 ) ) ( not ( = ?auto_454276 ?auto_454282 ) ) ( not ( = ?auto_454276 ?auto_454283 ) ) ( not ( = ?auto_454278 ?auto_454277 ) ) ( not ( = ?auto_454278 ?auto_454279 ) ) ( not ( = ?auto_454278 ?auto_454280 ) ) ( not ( = ?auto_454278 ?auto_454281 ) ) ( not ( = ?auto_454278 ?auto_454282 ) ) ( not ( = ?auto_454278 ?auto_454283 ) ) ( not ( = ?auto_454277 ?auto_454279 ) ) ( not ( = ?auto_454277 ?auto_454280 ) ) ( not ( = ?auto_454277 ?auto_454281 ) ) ( not ( = ?auto_454277 ?auto_454282 ) ) ( not ( = ?auto_454277 ?auto_454283 ) ) ( not ( = ?auto_454279 ?auto_454280 ) ) ( not ( = ?auto_454279 ?auto_454281 ) ) ( not ( = ?auto_454279 ?auto_454282 ) ) ( not ( = ?auto_454279 ?auto_454283 ) ) ( not ( = ?auto_454280 ?auto_454281 ) ) ( not ( = ?auto_454280 ?auto_454282 ) ) ( not ( = ?auto_454280 ?auto_454283 ) ) ( not ( = ?auto_454281 ?auto_454282 ) ) ( not ( = ?auto_454281 ?auto_454283 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_454282 ?auto_454283 )
      ( MAKE-9CRATE-VERIFY ?auto_454274 ?auto_454275 ?auto_454276 ?auto_454278 ?auto_454277 ?auto_454279 ?auto_454280 ?auto_454281 ?auto_454282 ?auto_454283 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454354 - SURFACE
      ?auto_454355 - SURFACE
      ?auto_454356 - SURFACE
      ?auto_454358 - SURFACE
      ?auto_454357 - SURFACE
      ?auto_454359 - SURFACE
      ?auto_454360 - SURFACE
      ?auto_454361 - SURFACE
      ?auto_454362 - SURFACE
      ?auto_454363 - SURFACE
    )
    :vars
    (
      ?auto_454364 - HOIST
      ?auto_454365 - PLACE
      ?auto_454366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454364 ?auto_454365 ) ( SURFACE-AT ?auto_454362 ?auto_454365 ) ( CLEAR ?auto_454362 ) ( IS-CRATE ?auto_454363 ) ( not ( = ?auto_454362 ?auto_454363 ) ) ( TRUCK-AT ?auto_454366 ?auto_454365 ) ( AVAILABLE ?auto_454364 ) ( IN ?auto_454363 ?auto_454366 ) ( ON ?auto_454362 ?auto_454361 ) ( not ( = ?auto_454361 ?auto_454362 ) ) ( not ( = ?auto_454361 ?auto_454363 ) ) ( ON ?auto_454355 ?auto_454354 ) ( ON ?auto_454356 ?auto_454355 ) ( ON ?auto_454358 ?auto_454356 ) ( ON ?auto_454357 ?auto_454358 ) ( ON ?auto_454359 ?auto_454357 ) ( ON ?auto_454360 ?auto_454359 ) ( ON ?auto_454361 ?auto_454360 ) ( not ( = ?auto_454354 ?auto_454355 ) ) ( not ( = ?auto_454354 ?auto_454356 ) ) ( not ( = ?auto_454354 ?auto_454358 ) ) ( not ( = ?auto_454354 ?auto_454357 ) ) ( not ( = ?auto_454354 ?auto_454359 ) ) ( not ( = ?auto_454354 ?auto_454360 ) ) ( not ( = ?auto_454354 ?auto_454361 ) ) ( not ( = ?auto_454354 ?auto_454362 ) ) ( not ( = ?auto_454354 ?auto_454363 ) ) ( not ( = ?auto_454355 ?auto_454356 ) ) ( not ( = ?auto_454355 ?auto_454358 ) ) ( not ( = ?auto_454355 ?auto_454357 ) ) ( not ( = ?auto_454355 ?auto_454359 ) ) ( not ( = ?auto_454355 ?auto_454360 ) ) ( not ( = ?auto_454355 ?auto_454361 ) ) ( not ( = ?auto_454355 ?auto_454362 ) ) ( not ( = ?auto_454355 ?auto_454363 ) ) ( not ( = ?auto_454356 ?auto_454358 ) ) ( not ( = ?auto_454356 ?auto_454357 ) ) ( not ( = ?auto_454356 ?auto_454359 ) ) ( not ( = ?auto_454356 ?auto_454360 ) ) ( not ( = ?auto_454356 ?auto_454361 ) ) ( not ( = ?auto_454356 ?auto_454362 ) ) ( not ( = ?auto_454356 ?auto_454363 ) ) ( not ( = ?auto_454358 ?auto_454357 ) ) ( not ( = ?auto_454358 ?auto_454359 ) ) ( not ( = ?auto_454358 ?auto_454360 ) ) ( not ( = ?auto_454358 ?auto_454361 ) ) ( not ( = ?auto_454358 ?auto_454362 ) ) ( not ( = ?auto_454358 ?auto_454363 ) ) ( not ( = ?auto_454357 ?auto_454359 ) ) ( not ( = ?auto_454357 ?auto_454360 ) ) ( not ( = ?auto_454357 ?auto_454361 ) ) ( not ( = ?auto_454357 ?auto_454362 ) ) ( not ( = ?auto_454357 ?auto_454363 ) ) ( not ( = ?auto_454359 ?auto_454360 ) ) ( not ( = ?auto_454359 ?auto_454361 ) ) ( not ( = ?auto_454359 ?auto_454362 ) ) ( not ( = ?auto_454359 ?auto_454363 ) ) ( not ( = ?auto_454360 ?auto_454361 ) ) ( not ( = ?auto_454360 ?auto_454362 ) ) ( not ( = ?auto_454360 ?auto_454363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454361 ?auto_454362 ?auto_454363 )
      ( MAKE-9CRATE-VERIFY ?auto_454354 ?auto_454355 ?auto_454356 ?auto_454358 ?auto_454357 ?auto_454359 ?auto_454360 ?auto_454361 ?auto_454362 ?auto_454363 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454444 - SURFACE
      ?auto_454445 - SURFACE
      ?auto_454446 - SURFACE
      ?auto_454448 - SURFACE
      ?auto_454447 - SURFACE
      ?auto_454449 - SURFACE
      ?auto_454450 - SURFACE
      ?auto_454451 - SURFACE
      ?auto_454452 - SURFACE
      ?auto_454453 - SURFACE
    )
    :vars
    (
      ?auto_454455 - HOIST
      ?auto_454456 - PLACE
      ?auto_454454 - TRUCK
      ?auto_454457 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_454455 ?auto_454456 ) ( SURFACE-AT ?auto_454452 ?auto_454456 ) ( CLEAR ?auto_454452 ) ( IS-CRATE ?auto_454453 ) ( not ( = ?auto_454452 ?auto_454453 ) ) ( AVAILABLE ?auto_454455 ) ( IN ?auto_454453 ?auto_454454 ) ( ON ?auto_454452 ?auto_454451 ) ( not ( = ?auto_454451 ?auto_454452 ) ) ( not ( = ?auto_454451 ?auto_454453 ) ) ( TRUCK-AT ?auto_454454 ?auto_454457 ) ( not ( = ?auto_454457 ?auto_454456 ) ) ( ON ?auto_454445 ?auto_454444 ) ( ON ?auto_454446 ?auto_454445 ) ( ON ?auto_454448 ?auto_454446 ) ( ON ?auto_454447 ?auto_454448 ) ( ON ?auto_454449 ?auto_454447 ) ( ON ?auto_454450 ?auto_454449 ) ( ON ?auto_454451 ?auto_454450 ) ( not ( = ?auto_454444 ?auto_454445 ) ) ( not ( = ?auto_454444 ?auto_454446 ) ) ( not ( = ?auto_454444 ?auto_454448 ) ) ( not ( = ?auto_454444 ?auto_454447 ) ) ( not ( = ?auto_454444 ?auto_454449 ) ) ( not ( = ?auto_454444 ?auto_454450 ) ) ( not ( = ?auto_454444 ?auto_454451 ) ) ( not ( = ?auto_454444 ?auto_454452 ) ) ( not ( = ?auto_454444 ?auto_454453 ) ) ( not ( = ?auto_454445 ?auto_454446 ) ) ( not ( = ?auto_454445 ?auto_454448 ) ) ( not ( = ?auto_454445 ?auto_454447 ) ) ( not ( = ?auto_454445 ?auto_454449 ) ) ( not ( = ?auto_454445 ?auto_454450 ) ) ( not ( = ?auto_454445 ?auto_454451 ) ) ( not ( = ?auto_454445 ?auto_454452 ) ) ( not ( = ?auto_454445 ?auto_454453 ) ) ( not ( = ?auto_454446 ?auto_454448 ) ) ( not ( = ?auto_454446 ?auto_454447 ) ) ( not ( = ?auto_454446 ?auto_454449 ) ) ( not ( = ?auto_454446 ?auto_454450 ) ) ( not ( = ?auto_454446 ?auto_454451 ) ) ( not ( = ?auto_454446 ?auto_454452 ) ) ( not ( = ?auto_454446 ?auto_454453 ) ) ( not ( = ?auto_454448 ?auto_454447 ) ) ( not ( = ?auto_454448 ?auto_454449 ) ) ( not ( = ?auto_454448 ?auto_454450 ) ) ( not ( = ?auto_454448 ?auto_454451 ) ) ( not ( = ?auto_454448 ?auto_454452 ) ) ( not ( = ?auto_454448 ?auto_454453 ) ) ( not ( = ?auto_454447 ?auto_454449 ) ) ( not ( = ?auto_454447 ?auto_454450 ) ) ( not ( = ?auto_454447 ?auto_454451 ) ) ( not ( = ?auto_454447 ?auto_454452 ) ) ( not ( = ?auto_454447 ?auto_454453 ) ) ( not ( = ?auto_454449 ?auto_454450 ) ) ( not ( = ?auto_454449 ?auto_454451 ) ) ( not ( = ?auto_454449 ?auto_454452 ) ) ( not ( = ?auto_454449 ?auto_454453 ) ) ( not ( = ?auto_454450 ?auto_454451 ) ) ( not ( = ?auto_454450 ?auto_454452 ) ) ( not ( = ?auto_454450 ?auto_454453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454451 ?auto_454452 ?auto_454453 )
      ( MAKE-9CRATE-VERIFY ?auto_454444 ?auto_454445 ?auto_454446 ?auto_454448 ?auto_454447 ?auto_454449 ?auto_454450 ?auto_454451 ?auto_454452 ?auto_454453 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454543 - SURFACE
      ?auto_454544 - SURFACE
      ?auto_454545 - SURFACE
      ?auto_454547 - SURFACE
      ?auto_454546 - SURFACE
      ?auto_454548 - SURFACE
      ?auto_454549 - SURFACE
      ?auto_454550 - SURFACE
      ?auto_454551 - SURFACE
      ?auto_454552 - SURFACE
    )
    :vars
    (
      ?auto_454557 - HOIST
      ?auto_454556 - PLACE
      ?auto_454553 - TRUCK
      ?auto_454555 - PLACE
      ?auto_454554 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_454557 ?auto_454556 ) ( SURFACE-AT ?auto_454551 ?auto_454556 ) ( CLEAR ?auto_454551 ) ( IS-CRATE ?auto_454552 ) ( not ( = ?auto_454551 ?auto_454552 ) ) ( AVAILABLE ?auto_454557 ) ( ON ?auto_454551 ?auto_454550 ) ( not ( = ?auto_454550 ?auto_454551 ) ) ( not ( = ?auto_454550 ?auto_454552 ) ) ( TRUCK-AT ?auto_454553 ?auto_454555 ) ( not ( = ?auto_454555 ?auto_454556 ) ) ( HOIST-AT ?auto_454554 ?auto_454555 ) ( LIFTING ?auto_454554 ?auto_454552 ) ( not ( = ?auto_454557 ?auto_454554 ) ) ( ON ?auto_454544 ?auto_454543 ) ( ON ?auto_454545 ?auto_454544 ) ( ON ?auto_454547 ?auto_454545 ) ( ON ?auto_454546 ?auto_454547 ) ( ON ?auto_454548 ?auto_454546 ) ( ON ?auto_454549 ?auto_454548 ) ( ON ?auto_454550 ?auto_454549 ) ( not ( = ?auto_454543 ?auto_454544 ) ) ( not ( = ?auto_454543 ?auto_454545 ) ) ( not ( = ?auto_454543 ?auto_454547 ) ) ( not ( = ?auto_454543 ?auto_454546 ) ) ( not ( = ?auto_454543 ?auto_454548 ) ) ( not ( = ?auto_454543 ?auto_454549 ) ) ( not ( = ?auto_454543 ?auto_454550 ) ) ( not ( = ?auto_454543 ?auto_454551 ) ) ( not ( = ?auto_454543 ?auto_454552 ) ) ( not ( = ?auto_454544 ?auto_454545 ) ) ( not ( = ?auto_454544 ?auto_454547 ) ) ( not ( = ?auto_454544 ?auto_454546 ) ) ( not ( = ?auto_454544 ?auto_454548 ) ) ( not ( = ?auto_454544 ?auto_454549 ) ) ( not ( = ?auto_454544 ?auto_454550 ) ) ( not ( = ?auto_454544 ?auto_454551 ) ) ( not ( = ?auto_454544 ?auto_454552 ) ) ( not ( = ?auto_454545 ?auto_454547 ) ) ( not ( = ?auto_454545 ?auto_454546 ) ) ( not ( = ?auto_454545 ?auto_454548 ) ) ( not ( = ?auto_454545 ?auto_454549 ) ) ( not ( = ?auto_454545 ?auto_454550 ) ) ( not ( = ?auto_454545 ?auto_454551 ) ) ( not ( = ?auto_454545 ?auto_454552 ) ) ( not ( = ?auto_454547 ?auto_454546 ) ) ( not ( = ?auto_454547 ?auto_454548 ) ) ( not ( = ?auto_454547 ?auto_454549 ) ) ( not ( = ?auto_454547 ?auto_454550 ) ) ( not ( = ?auto_454547 ?auto_454551 ) ) ( not ( = ?auto_454547 ?auto_454552 ) ) ( not ( = ?auto_454546 ?auto_454548 ) ) ( not ( = ?auto_454546 ?auto_454549 ) ) ( not ( = ?auto_454546 ?auto_454550 ) ) ( not ( = ?auto_454546 ?auto_454551 ) ) ( not ( = ?auto_454546 ?auto_454552 ) ) ( not ( = ?auto_454548 ?auto_454549 ) ) ( not ( = ?auto_454548 ?auto_454550 ) ) ( not ( = ?auto_454548 ?auto_454551 ) ) ( not ( = ?auto_454548 ?auto_454552 ) ) ( not ( = ?auto_454549 ?auto_454550 ) ) ( not ( = ?auto_454549 ?auto_454551 ) ) ( not ( = ?auto_454549 ?auto_454552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454550 ?auto_454551 ?auto_454552 )
      ( MAKE-9CRATE-VERIFY ?auto_454543 ?auto_454544 ?auto_454545 ?auto_454547 ?auto_454546 ?auto_454548 ?auto_454549 ?auto_454550 ?auto_454551 ?auto_454552 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454651 - SURFACE
      ?auto_454652 - SURFACE
      ?auto_454653 - SURFACE
      ?auto_454655 - SURFACE
      ?auto_454654 - SURFACE
      ?auto_454656 - SURFACE
      ?auto_454657 - SURFACE
      ?auto_454658 - SURFACE
      ?auto_454659 - SURFACE
      ?auto_454660 - SURFACE
    )
    :vars
    (
      ?auto_454662 - HOIST
      ?auto_454663 - PLACE
      ?auto_454666 - TRUCK
      ?auto_454661 - PLACE
      ?auto_454665 - HOIST
      ?auto_454664 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_454662 ?auto_454663 ) ( SURFACE-AT ?auto_454659 ?auto_454663 ) ( CLEAR ?auto_454659 ) ( IS-CRATE ?auto_454660 ) ( not ( = ?auto_454659 ?auto_454660 ) ) ( AVAILABLE ?auto_454662 ) ( ON ?auto_454659 ?auto_454658 ) ( not ( = ?auto_454658 ?auto_454659 ) ) ( not ( = ?auto_454658 ?auto_454660 ) ) ( TRUCK-AT ?auto_454666 ?auto_454661 ) ( not ( = ?auto_454661 ?auto_454663 ) ) ( HOIST-AT ?auto_454665 ?auto_454661 ) ( not ( = ?auto_454662 ?auto_454665 ) ) ( AVAILABLE ?auto_454665 ) ( SURFACE-AT ?auto_454660 ?auto_454661 ) ( ON ?auto_454660 ?auto_454664 ) ( CLEAR ?auto_454660 ) ( not ( = ?auto_454659 ?auto_454664 ) ) ( not ( = ?auto_454660 ?auto_454664 ) ) ( not ( = ?auto_454658 ?auto_454664 ) ) ( ON ?auto_454652 ?auto_454651 ) ( ON ?auto_454653 ?auto_454652 ) ( ON ?auto_454655 ?auto_454653 ) ( ON ?auto_454654 ?auto_454655 ) ( ON ?auto_454656 ?auto_454654 ) ( ON ?auto_454657 ?auto_454656 ) ( ON ?auto_454658 ?auto_454657 ) ( not ( = ?auto_454651 ?auto_454652 ) ) ( not ( = ?auto_454651 ?auto_454653 ) ) ( not ( = ?auto_454651 ?auto_454655 ) ) ( not ( = ?auto_454651 ?auto_454654 ) ) ( not ( = ?auto_454651 ?auto_454656 ) ) ( not ( = ?auto_454651 ?auto_454657 ) ) ( not ( = ?auto_454651 ?auto_454658 ) ) ( not ( = ?auto_454651 ?auto_454659 ) ) ( not ( = ?auto_454651 ?auto_454660 ) ) ( not ( = ?auto_454651 ?auto_454664 ) ) ( not ( = ?auto_454652 ?auto_454653 ) ) ( not ( = ?auto_454652 ?auto_454655 ) ) ( not ( = ?auto_454652 ?auto_454654 ) ) ( not ( = ?auto_454652 ?auto_454656 ) ) ( not ( = ?auto_454652 ?auto_454657 ) ) ( not ( = ?auto_454652 ?auto_454658 ) ) ( not ( = ?auto_454652 ?auto_454659 ) ) ( not ( = ?auto_454652 ?auto_454660 ) ) ( not ( = ?auto_454652 ?auto_454664 ) ) ( not ( = ?auto_454653 ?auto_454655 ) ) ( not ( = ?auto_454653 ?auto_454654 ) ) ( not ( = ?auto_454653 ?auto_454656 ) ) ( not ( = ?auto_454653 ?auto_454657 ) ) ( not ( = ?auto_454653 ?auto_454658 ) ) ( not ( = ?auto_454653 ?auto_454659 ) ) ( not ( = ?auto_454653 ?auto_454660 ) ) ( not ( = ?auto_454653 ?auto_454664 ) ) ( not ( = ?auto_454655 ?auto_454654 ) ) ( not ( = ?auto_454655 ?auto_454656 ) ) ( not ( = ?auto_454655 ?auto_454657 ) ) ( not ( = ?auto_454655 ?auto_454658 ) ) ( not ( = ?auto_454655 ?auto_454659 ) ) ( not ( = ?auto_454655 ?auto_454660 ) ) ( not ( = ?auto_454655 ?auto_454664 ) ) ( not ( = ?auto_454654 ?auto_454656 ) ) ( not ( = ?auto_454654 ?auto_454657 ) ) ( not ( = ?auto_454654 ?auto_454658 ) ) ( not ( = ?auto_454654 ?auto_454659 ) ) ( not ( = ?auto_454654 ?auto_454660 ) ) ( not ( = ?auto_454654 ?auto_454664 ) ) ( not ( = ?auto_454656 ?auto_454657 ) ) ( not ( = ?auto_454656 ?auto_454658 ) ) ( not ( = ?auto_454656 ?auto_454659 ) ) ( not ( = ?auto_454656 ?auto_454660 ) ) ( not ( = ?auto_454656 ?auto_454664 ) ) ( not ( = ?auto_454657 ?auto_454658 ) ) ( not ( = ?auto_454657 ?auto_454659 ) ) ( not ( = ?auto_454657 ?auto_454660 ) ) ( not ( = ?auto_454657 ?auto_454664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454658 ?auto_454659 ?auto_454660 )
      ( MAKE-9CRATE-VERIFY ?auto_454651 ?auto_454652 ?auto_454653 ?auto_454655 ?auto_454654 ?auto_454656 ?auto_454657 ?auto_454658 ?auto_454659 ?auto_454660 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454760 - SURFACE
      ?auto_454761 - SURFACE
      ?auto_454762 - SURFACE
      ?auto_454764 - SURFACE
      ?auto_454763 - SURFACE
      ?auto_454765 - SURFACE
      ?auto_454766 - SURFACE
      ?auto_454767 - SURFACE
      ?auto_454768 - SURFACE
      ?auto_454769 - SURFACE
    )
    :vars
    (
      ?auto_454775 - HOIST
      ?auto_454774 - PLACE
      ?auto_454770 - PLACE
      ?auto_454772 - HOIST
      ?auto_454771 - SURFACE
      ?auto_454773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454775 ?auto_454774 ) ( SURFACE-AT ?auto_454768 ?auto_454774 ) ( CLEAR ?auto_454768 ) ( IS-CRATE ?auto_454769 ) ( not ( = ?auto_454768 ?auto_454769 ) ) ( AVAILABLE ?auto_454775 ) ( ON ?auto_454768 ?auto_454767 ) ( not ( = ?auto_454767 ?auto_454768 ) ) ( not ( = ?auto_454767 ?auto_454769 ) ) ( not ( = ?auto_454770 ?auto_454774 ) ) ( HOIST-AT ?auto_454772 ?auto_454770 ) ( not ( = ?auto_454775 ?auto_454772 ) ) ( AVAILABLE ?auto_454772 ) ( SURFACE-AT ?auto_454769 ?auto_454770 ) ( ON ?auto_454769 ?auto_454771 ) ( CLEAR ?auto_454769 ) ( not ( = ?auto_454768 ?auto_454771 ) ) ( not ( = ?auto_454769 ?auto_454771 ) ) ( not ( = ?auto_454767 ?auto_454771 ) ) ( TRUCK-AT ?auto_454773 ?auto_454774 ) ( ON ?auto_454761 ?auto_454760 ) ( ON ?auto_454762 ?auto_454761 ) ( ON ?auto_454764 ?auto_454762 ) ( ON ?auto_454763 ?auto_454764 ) ( ON ?auto_454765 ?auto_454763 ) ( ON ?auto_454766 ?auto_454765 ) ( ON ?auto_454767 ?auto_454766 ) ( not ( = ?auto_454760 ?auto_454761 ) ) ( not ( = ?auto_454760 ?auto_454762 ) ) ( not ( = ?auto_454760 ?auto_454764 ) ) ( not ( = ?auto_454760 ?auto_454763 ) ) ( not ( = ?auto_454760 ?auto_454765 ) ) ( not ( = ?auto_454760 ?auto_454766 ) ) ( not ( = ?auto_454760 ?auto_454767 ) ) ( not ( = ?auto_454760 ?auto_454768 ) ) ( not ( = ?auto_454760 ?auto_454769 ) ) ( not ( = ?auto_454760 ?auto_454771 ) ) ( not ( = ?auto_454761 ?auto_454762 ) ) ( not ( = ?auto_454761 ?auto_454764 ) ) ( not ( = ?auto_454761 ?auto_454763 ) ) ( not ( = ?auto_454761 ?auto_454765 ) ) ( not ( = ?auto_454761 ?auto_454766 ) ) ( not ( = ?auto_454761 ?auto_454767 ) ) ( not ( = ?auto_454761 ?auto_454768 ) ) ( not ( = ?auto_454761 ?auto_454769 ) ) ( not ( = ?auto_454761 ?auto_454771 ) ) ( not ( = ?auto_454762 ?auto_454764 ) ) ( not ( = ?auto_454762 ?auto_454763 ) ) ( not ( = ?auto_454762 ?auto_454765 ) ) ( not ( = ?auto_454762 ?auto_454766 ) ) ( not ( = ?auto_454762 ?auto_454767 ) ) ( not ( = ?auto_454762 ?auto_454768 ) ) ( not ( = ?auto_454762 ?auto_454769 ) ) ( not ( = ?auto_454762 ?auto_454771 ) ) ( not ( = ?auto_454764 ?auto_454763 ) ) ( not ( = ?auto_454764 ?auto_454765 ) ) ( not ( = ?auto_454764 ?auto_454766 ) ) ( not ( = ?auto_454764 ?auto_454767 ) ) ( not ( = ?auto_454764 ?auto_454768 ) ) ( not ( = ?auto_454764 ?auto_454769 ) ) ( not ( = ?auto_454764 ?auto_454771 ) ) ( not ( = ?auto_454763 ?auto_454765 ) ) ( not ( = ?auto_454763 ?auto_454766 ) ) ( not ( = ?auto_454763 ?auto_454767 ) ) ( not ( = ?auto_454763 ?auto_454768 ) ) ( not ( = ?auto_454763 ?auto_454769 ) ) ( not ( = ?auto_454763 ?auto_454771 ) ) ( not ( = ?auto_454765 ?auto_454766 ) ) ( not ( = ?auto_454765 ?auto_454767 ) ) ( not ( = ?auto_454765 ?auto_454768 ) ) ( not ( = ?auto_454765 ?auto_454769 ) ) ( not ( = ?auto_454765 ?auto_454771 ) ) ( not ( = ?auto_454766 ?auto_454767 ) ) ( not ( = ?auto_454766 ?auto_454768 ) ) ( not ( = ?auto_454766 ?auto_454769 ) ) ( not ( = ?auto_454766 ?auto_454771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454767 ?auto_454768 ?auto_454769 )
      ( MAKE-9CRATE-VERIFY ?auto_454760 ?auto_454761 ?auto_454762 ?auto_454764 ?auto_454763 ?auto_454765 ?auto_454766 ?auto_454767 ?auto_454768 ?auto_454769 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454869 - SURFACE
      ?auto_454870 - SURFACE
      ?auto_454871 - SURFACE
      ?auto_454873 - SURFACE
      ?auto_454872 - SURFACE
      ?auto_454874 - SURFACE
      ?auto_454875 - SURFACE
      ?auto_454876 - SURFACE
      ?auto_454877 - SURFACE
      ?auto_454878 - SURFACE
    )
    :vars
    (
      ?auto_454884 - HOIST
      ?auto_454879 - PLACE
      ?auto_454881 - PLACE
      ?auto_454880 - HOIST
      ?auto_454883 - SURFACE
      ?auto_454882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454884 ?auto_454879 ) ( IS-CRATE ?auto_454878 ) ( not ( = ?auto_454877 ?auto_454878 ) ) ( not ( = ?auto_454876 ?auto_454877 ) ) ( not ( = ?auto_454876 ?auto_454878 ) ) ( not ( = ?auto_454881 ?auto_454879 ) ) ( HOIST-AT ?auto_454880 ?auto_454881 ) ( not ( = ?auto_454884 ?auto_454880 ) ) ( AVAILABLE ?auto_454880 ) ( SURFACE-AT ?auto_454878 ?auto_454881 ) ( ON ?auto_454878 ?auto_454883 ) ( CLEAR ?auto_454878 ) ( not ( = ?auto_454877 ?auto_454883 ) ) ( not ( = ?auto_454878 ?auto_454883 ) ) ( not ( = ?auto_454876 ?auto_454883 ) ) ( TRUCK-AT ?auto_454882 ?auto_454879 ) ( SURFACE-AT ?auto_454876 ?auto_454879 ) ( CLEAR ?auto_454876 ) ( LIFTING ?auto_454884 ?auto_454877 ) ( IS-CRATE ?auto_454877 ) ( ON ?auto_454870 ?auto_454869 ) ( ON ?auto_454871 ?auto_454870 ) ( ON ?auto_454873 ?auto_454871 ) ( ON ?auto_454872 ?auto_454873 ) ( ON ?auto_454874 ?auto_454872 ) ( ON ?auto_454875 ?auto_454874 ) ( ON ?auto_454876 ?auto_454875 ) ( not ( = ?auto_454869 ?auto_454870 ) ) ( not ( = ?auto_454869 ?auto_454871 ) ) ( not ( = ?auto_454869 ?auto_454873 ) ) ( not ( = ?auto_454869 ?auto_454872 ) ) ( not ( = ?auto_454869 ?auto_454874 ) ) ( not ( = ?auto_454869 ?auto_454875 ) ) ( not ( = ?auto_454869 ?auto_454876 ) ) ( not ( = ?auto_454869 ?auto_454877 ) ) ( not ( = ?auto_454869 ?auto_454878 ) ) ( not ( = ?auto_454869 ?auto_454883 ) ) ( not ( = ?auto_454870 ?auto_454871 ) ) ( not ( = ?auto_454870 ?auto_454873 ) ) ( not ( = ?auto_454870 ?auto_454872 ) ) ( not ( = ?auto_454870 ?auto_454874 ) ) ( not ( = ?auto_454870 ?auto_454875 ) ) ( not ( = ?auto_454870 ?auto_454876 ) ) ( not ( = ?auto_454870 ?auto_454877 ) ) ( not ( = ?auto_454870 ?auto_454878 ) ) ( not ( = ?auto_454870 ?auto_454883 ) ) ( not ( = ?auto_454871 ?auto_454873 ) ) ( not ( = ?auto_454871 ?auto_454872 ) ) ( not ( = ?auto_454871 ?auto_454874 ) ) ( not ( = ?auto_454871 ?auto_454875 ) ) ( not ( = ?auto_454871 ?auto_454876 ) ) ( not ( = ?auto_454871 ?auto_454877 ) ) ( not ( = ?auto_454871 ?auto_454878 ) ) ( not ( = ?auto_454871 ?auto_454883 ) ) ( not ( = ?auto_454873 ?auto_454872 ) ) ( not ( = ?auto_454873 ?auto_454874 ) ) ( not ( = ?auto_454873 ?auto_454875 ) ) ( not ( = ?auto_454873 ?auto_454876 ) ) ( not ( = ?auto_454873 ?auto_454877 ) ) ( not ( = ?auto_454873 ?auto_454878 ) ) ( not ( = ?auto_454873 ?auto_454883 ) ) ( not ( = ?auto_454872 ?auto_454874 ) ) ( not ( = ?auto_454872 ?auto_454875 ) ) ( not ( = ?auto_454872 ?auto_454876 ) ) ( not ( = ?auto_454872 ?auto_454877 ) ) ( not ( = ?auto_454872 ?auto_454878 ) ) ( not ( = ?auto_454872 ?auto_454883 ) ) ( not ( = ?auto_454874 ?auto_454875 ) ) ( not ( = ?auto_454874 ?auto_454876 ) ) ( not ( = ?auto_454874 ?auto_454877 ) ) ( not ( = ?auto_454874 ?auto_454878 ) ) ( not ( = ?auto_454874 ?auto_454883 ) ) ( not ( = ?auto_454875 ?auto_454876 ) ) ( not ( = ?auto_454875 ?auto_454877 ) ) ( not ( = ?auto_454875 ?auto_454878 ) ) ( not ( = ?auto_454875 ?auto_454883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454876 ?auto_454877 ?auto_454878 )
      ( MAKE-9CRATE-VERIFY ?auto_454869 ?auto_454870 ?auto_454871 ?auto_454873 ?auto_454872 ?auto_454874 ?auto_454875 ?auto_454876 ?auto_454877 ?auto_454878 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_454978 - SURFACE
      ?auto_454979 - SURFACE
      ?auto_454980 - SURFACE
      ?auto_454982 - SURFACE
      ?auto_454981 - SURFACE
      ?auto_454983 - SURFACE
      ?auto_454984 - SURFACE
      ?auto_454985 - SURFACE
      ?auto_454986 - SURFACE
      ?auto_454987 - SURFACE
    )
    :vars
    (
      ?auto_454990 - HOIST
      ?auto_454988 - PLACE
      ?auto_454991 - PLACE
      ?auto_454992 - HOIST
      ?auto_454989 - SURFACE
      ?auto_454993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_454990 ?auto_454988 ) ( IS-CRATE ?auto_454987 ) ( not ( = ?auto_454986 ?auto_454987 ) ) ( not ( = ?auto_454985 ?auto_454986 ) ) ( not ( = ?auto_454985 ?auto_454987 ) ) ( not ( = ?auto_454991 ?auto_454988 ) ) ( HOIST-AT ?auto_454992 ?auto_454991 ) ( not ( = ?auto_454990 ?auto_454992 ) ) ( AVAILABLE ?auto_454992 ) ( SURFACE-AT ?auto_454987 ?auto_454991 ) ( ON ?auto_454987 ?auto_454989 ) ( CLEAR ?auto_454987 ) ( not ( = ?auto_454986 ?auto_454989 ) ) ( not ( = ?auto_454987 ?auto_454989 ) ) ( not ( = ?auto_454985 ?auto_454989 ) ) ( TRUCK-AT ?auto_454993 ?auto_454988 ) ( SURFACE-AT ?auto_454985 ?auto_454988 ) ( CLEAR ?auto_454985 ) ( IS-CRATE ?auto_454986 ) ( AVAILABLE ?auto_454990 ) ( IN ?auto_454986 ?auto_454993 ) ( ON ?auto_454979 ?auto_454978 ) ( ON ?auto_454980 ?auto_454979 ) ( ON ?auto_454982 ?auto_454980 ) ( ON ?auto_454981 ?auto_454982 ) ( ON ?auto_454983 ?auto_454981 ) ( ON ?auto_454984 ?auto_454983 ) ( ON ?auto_454985 ?auto_454984 ) ( not ( = ?auto_454978 ?auto_454979 ) ) ( not ( = ?auto_454978 ?auto_454980 ) ) ( not ( = ?auto_454978 ?auto_454982 ) ) ( not ( = ?auto_454978 ?auto_454981 ) ) ( not ( = ?auto_454978 ?auto_454983 ) ) ( not ( = ?auto_454978 ?auto_454984 ) ) ( not ( = ?auto_454978 ?auto_454985 ) ) ( not ( = ?auto_454978 ?auto_454986 ) ) ( not ( = ?auto_454978 ?auto_454987 ) ) ( not ( = ?auto_454978 ?auto_454989 ) ) ( not ( = ?auto_454979 ?auto_454980 ) ) ( not ( = ?auto_454979 ?auto_454982 ) ) ( not ( = ?auto_454979 ?auto_454981 ) ) ( not ( = ?auto_454979 ?auto_454983 ) ) ( not ( = ?auto_454979 ?auto_454984 ) ) ( not ( = ?auto_454979 ?auto_454985 ) ) ( not ( = ?auto_454979 ?auto_454986 ) ) ( not ( = ?auto_454979 ?auto_454987 ) ) ( not ( = ?auto_454979 ?auto_454989 ) ) ( not ( = ?auto_454980 ?auto_454982 ) ) ( not ( = ?auto_454980 ?auto_454981 ) ) ( not ( = ?auto_454980 ?auto_454983 ) ) ( not ( = ?auto_454980 ?auto_454984 ) ) ( not ( = ?auto_454980 ?auto_454985 ) ) ( not ( = ?auto_454980 ?auto_454986 ) ) ( not ( = ?auto_454980 ?auto_454987 ) ) ( not ( = ?auto_454980 ?auto_454989 ) ) ( not ( = ?auto_454982 ?auto_454981 ) ) ( not ( = ?auto_454982 ?auto_454983 ) ) ( not ( = ?auto_454982 ?auto_454984 ) ) ( not ( = ?auto_454982 ?auto_454985 ) ) ( not ( = ?auto_454982 ?auto_454986 ) ) ( not ( = ?auto_454982 ?auto_454987 ) ) ( not ( = ?auto_454982 ?auto_454989 ) ) ( not ( = ?auto_454981 ?auto_454983 ) ) ( not ( = ?auto_454981 ?auto_454984 ) ) ( not ( = ?auto_454981 ?auto_454985 ) ) ( not ( = ?auto_454981 ?auto_454986 ) ) ( not ( = ?auto_454981 ?auto_454987 ) ) ( not ( = ?auto_454981 ?auto_454989 ) ) ( not ( = ?auto_454983 ?auto_454984 ) ) ( not ( = ?auto_454983 ?auto_454985 ) ) ( not ( = ?auto_454983 ?auto_454986 ) ) ( not ( = ?auto_454983 ?auto_454987 ) ) ( not ( = ?auto_454983 ?auto_454989 ) ) ( not ( = ?auto_454984 ?auto_454985 ) ) ( not ( = ?auto_454984 ?auto_454986 ) ) ( not ( = ?auto_454984 ?auto_454987 ) ) ( not ( = ?auto_454984 ?auto_454989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_454985 ?auto_454986 ?auto_454987 )
      ( MAKE-9CRATE-VERIFY ?auto_454978 ?auto_454979 ?auto_454980 ?auto_454982 ?auto_454981 ?auto_454983 ?auto_454984 ?auto_454985 ?auto_454986 ?auto_454987 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_460543 - SURFACE
      ?auto_460544 - SURFACE
      ?auto_460545 - SURFACE
      ?auto_460547 - SURFACE
      ?auto_460546 - SURFACE
      ?auto_460548 - SURFACE
      ?auto_460549 - SURFACE
      ?auto_460550 - SURFACE
      ?auto_460551 - SURFACE
      ?auto_460552 - SURFACE
      ?auto_460553 - SURFACE
    )
    :vars
    (
      ?auto_460555 - HOIST
      ?auto_460554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_460555 ?auto_460554 ) ( SURFACE-AT ?auto_460552 ?auto_460554 ) ( CLEAR ?auto_460552 ) ( LIFTING ?auto_460555 ?auto_460553 ) ( IS-CRATE ?auto_460553 ) ( not ( = ?auto_460552 ?auto_460553 ) ) ( ON ?auto_460544 ?auto_460543 ) ( ON ?auto_460545 ?auto_460544 ) ( ON ?auto_460547 ?auto_460545 ) ( ON ?auto_460546 ?auto_460547 ) ( ON ?auto_460548 ?auto_460546 ) ( ON ?auto_460549 ?auto_460548 ) ( ON ?auto_460550 ?auto_460549 ) ( ON ?auto_460551 ?auto_460550 ) ( ON ?auto_460552 ?auto_460551 ) ( not ( = ?auto_460543 ?auto_460544 ) ) ( not ( = ?auto_460543 ?auto_460545 ) ) ( not ( = ?auto_460543 ?auto_460547 ) ) ( not ( = ?auto_460543 ?auto_460546 ) ) ( not ( = ?auto_460543 ?auto_460548 ) ) ( not ( = ?auto_460543 ?auto_460549 ) ) ( not ( = ?auto_460543 ?auto_460550 ) ) ( not ( = ?auto_460543 ?auto_460551 ) ) ( not ( = ?auto_460543 ?auto_460552 ) ) ( not ( = ?auto_460543 ?auto_460553 ) ) ( not ( = ?auto_460544 ?auto_460545 ) ) ( not ( = ?auto_460544 ?auto_460547 ) ) ( not ( = ?auto_460544 ?auto_460546 ) ) ( not ( = ?auto_460544 ?auto_460548 ) ) ( not ( = ?auto_460544 ?auto_460549 ) ) ( not ( = ?auto_460544 ?auto_460550 ) ) ( not ( = ?auto_460544 ?auto_460551 ) ) ( not ( = ?auto_460544 ?auto_460552 ) ) ( not ( = ?auto_460544 ?auto_460553 ) ) ( not ( = ?auto_460545 ?auto_460547 ) ) ( not ( = ?auto_460545 ?auto_460546 ) ) ( not ( = ?auto_460545 ?auto_460548 ) ) ( not ( = ?auto_460545 ?auto_460549 ) ) ( not ( = ?auto_460545 ?auto_460550 ) ) ( not ( = ?auto_460545 ?auto_460551 ) ) ( not ( = ?auto_460545 ?auto_460552 ) ) ( not ( = ?auto_460545 ?auto_460553 ) ) ( not ( = ?auto_460547 ?auto_460546 ) ) ( not ( = ?auto_460547 ?auto_460548 ) ) ( not ( = ?auto_460547 ?auto_460549 ) ) ( not ( = ?auto_460547 ?auto_460550 ) ) ( not ( = ?auto_460547 ?auto_460551 ) ) ( not ( = ?auto_460547 ?auto_460552 ) ) ( not ( = ?auto_460547 ?auto_460553 ) ) ( not ( = ?auto_460546 ?auto_460548 ) ) ( not ( = ?auto_460546 ?auto_460549 ) ) ( not ( = ?auto_460546 ?auto_460550 ) ) ( not ( = ?auto_460546 ?auto_460551 ) ) ( not ( = ?auto_460546 ?auto_460552 ) ) ( not ( = ?auto_460546 ?auto_460553 ) ) ( not ( = ?auto_460548 ?auto_460549 ) ) ( not ( = ?auto_460548 ?auto_460550 ) ) ( not ( = ?auto_460548 ?auto_460551 ) ) ( not ( = ?auto_460548 ?auto_460552 ) ) ( not ( = ?auto_460548 ?auto_460553 ) ) ( not ( = ?auto_460549 ?auto_460550 ) ) ( not ( = ?auto_460549 ?auto_460551 ) ) ( not ( = ?auto_460549 ?auto_460552 ) ) ( not ( = ?auto_460549 ?auto_460553 ) ) ( not ( = ?auto_460550 ?auto_460551 ) ) ( not ( = ?auto_460550 ?auto_460552 ) ) ( not ( = ?auto_460550 ?auto_460553 ) ) ( not ( = ?auto_460551 ?auto_460552 ) ) ( not ( = ?auto_460551 ?auto_460553 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_460552 ?auto_460553 )
      ( MAKE-10CRATE-VERIFY ?auto_460543 ?auto_460544 ?auto_460545 ?auto_460547 ?auto_460546 ?auto_460548 ?auto_460549 ?auto_460550 ?auto_460551 ?auto_460552 ?auto_460553 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_460637 - SURFACE
      ?auto_460638 - SURFACE
      ?auto_460639 - SURFACE
      ?auto_460641 - SURFACE
      ?auto_460640 - SURFACE
      ?auto_460642 - SURFACE
      ?auto_460643 - SURFACE
      ?auto_460644 - SURFACE
      ?auto_460645 - SURFACE
      ?auto_460646 - SURFACE
      ?auto_460647 - SURFACE
    )
    :vars
    (
      ?auto_460650 - HOIST
      ?auto_460649 - PLACE
      ?auto_460648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_460650 ?auto_460649 ) ( SURFACE-AT ?auto_460646 ?auto_460649 ) ( CLEAR ?auto_460646 ) ( IS-CRATE ?auto_460647 ) ( not ( = ?auto_460646 ?auto_460647 ) ) ( TRUCK-AT ?auto_460648 ?auto_460649 ) ( AVAILABLE ?auto_460650 ) ( IN ?auto_460647 ?auto_460648 ) ( ON ?auto_460646 ?auto_460645 ) ( not ( = ?auto_460645 ?auto_460646 ) ) ( not ( = ?auto_460645 ?auto_460647 ) ) ( ON ?auto_460638 ?auto_460637 ) ( ON ?auto_460639 ?auto_460638 ) ( ON ?auto_460641 ?auto_460639 ) ( ON ?auto_460640 ?auto_460641 ) ( ON ?auto_460642 ?auto_460640 ) ( ON ?auto_460643 ?auto_460642 ) ( ON ?auto_460644 ?auto_460643 ) ( ON ?auto_460645 ?auto_460644 ) ( not ( = ?auto_460637 ?auto_460638 ) ) ( not ( = ?auto_460637 ?auto_460639 ) ) ( not ( = ?auto_460637 ?auto_460641 ) ) ( not ( = ?auto_460637 ?auto_460640 ) ) ( not ( = ?auto_460637 ?auto_460642 ) ) ( not ( = ?auto_460637 ?auto_460643 ) ) ( not ( = ?auto_460637 ?auto_460644 ) ) ( not ( = ?auto_460637 ?auto_460645 ) ) ( not ( = ?auto_460637 ?auto_460646 ) ) ( not ( = ?auto_460637 ?auto_460647 ) ) ( not ( = ?auto_460638 ?auto_460639 ) ) ( not ( = ?auto_460638 ?auto_460641 ) ) ( not ( = ?auto_460638 ?auto_460640 ) ) ( not ( = ?auto_460638 ?auto_460642 ) ) ( not ( = ?auto_460638 ?auto_460643 ) ) ( not ( = ?auto_460638 ?auto_460644 ) ) ( not ( = ?auto_460638 ?auto_460645 ) ) ( not ( = ?auto_460638 ?auto_460646 ) ) ( not ( = ?auto_460638 ?auto_460647 ) ) ( not ( = ?auto_460639 ?auto_460641 ) ) ( not ( = ?auto_460639 ?auto_460640 ) ) ( not ( = ?auto_460639 ?auto_460642 ) ) ( not ( = ?auto_460639 ?auto_460643 ) ) ( not ( = ?auto_460639 ?auto_460644 ) ) ( not ( = ?auto_460639 ?auto_460645 ) ) ( not ( = ?auto_460639 ?auto_460646 ) ) ( not ( = ?auto_460639 ?auto_460647 ) ) ( not ( = ?auto_460641 ?auto_460640 ) ) ( not ( = ?auto_460641 ?auto_460642 ) ) ( not ( = ?auto_460641 ?auto_460643 ) ) ( not ( = ?auto_460641 ?auto_460644 ) ) ( not ( = ?auto_460641 ?auto_460645 ) ) ( not ( = ?auto_460641 ?auto_460646 ) ) ( not ( = ?auto_460641 ?auto_460647 ) ) ( not ( = ?auto_460640 ?auto_460642 ) ) ( not ( = ?auto_460640 ?auto_460643 ) ) ( not ( = ?auto_460640 ?auto_460644 ) ) ( not ( = ?auto_460640 ?auto_460645 ) ) ( not ( = ?auto_460640 ?auto_460646 ) ) ( not ( = ?auto_460640 ?auto_460647 ) ) ( not ( = ?auto_460642 ?auto_460643 ) ) ( not ( = ?auto_460642 ?auto_460644 ) ) ( not ( = ?auto_460642 ?auto_460645 ) ) ( not ( = ?auto_460642 ?auto_460646 ) ) ( not ( = ?auto_460642 ?auto_460647 ) ) ( not ( = ?auto_460643 ?auto_460644 ) ) ( not ( = ?auto_460643 ?auto_460645 ) ) ( not ( = ?auto_460643 ?auto_460646 ) ) ( not ( = ?auto_460643 ?auto_460647 ) ) ( not ( = ?auto_460644 ?auto_460645 ) ) ( not ( = ?auto_460644 ?auto_460646 ) ) ( not ( = ?auto_460644 ?auto_460647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_460645 ?auto_460646 ?auto_460647 )
      ( MAKE-10CRATE-VERIFY ?auto_460637 ?auto_460638 ?auto_460639 ?auto_460641 ?auto_460640 ?auto_460642 ?auto_460643 ?auto_460644 ?auto_460645 ?auto_460646 ?auto_460647 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_460742 - SURFACE
      ?auto_460743 - SURFACE
      ?auto_460744 - SURFACE
      ?auto_460746 - SURFACE
      ?auto_460745 - SURFACE
      ?auto_460747 - SURFACE
      ?auto_460748 - SURFACE
      ?auto_460749 - SURFACE
      ?auto_460750 - SURFACE
      ?auto_460751 - SURFACE
      ?auto_460752 - SURFACE
    )
    :vars
    (
      ?auto_460755 - HOIST
      ?auto_460754 - PLACE
      ?auto_460753 - TRUCK
      ?auto_460756 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_460755 ?auto_460754 ) ( SURFACE-AT ?auto_460751 ?auto_460754 ) ( CLEAR ?auto_460751 ) ( IS-CRATE ?auto_460752 ) ( not ( = ?auto_460751 ?auto_460752 ) ) ( AVAILABLE ?auto_460755 ) ( IN ?auto_460752 ?auto_460753 ) ( ON ?auto_460751 ?auto_460750 ) ( not ( = ?auto_460750 ?auto_460751 ) ) ( not ( = ?auto_460750 ?auto_460752 ) ) ( TRUCK-AT ?auto_460753 ?auto_460756 ) ( not ( = ?auto_460756 ?auto_460754 ) ) ( ON ?auto_460743 ?auto_460742 ) ( ON ?auto_460744 ?auto_460743 ) ( ON ?auto_460746 ?auto_460744 ) ( ON ?auto_460745 ?auto_460746 ) ( ON ?auto_460747 ?auto_460745 ) ( ON ?auto_460748 ?auto_460747 ) ( ON ?auto_460749 ?auto_460748 ) ( ON ?auto_460750 ?auto_460749 ) ( not ( = ?auto_460742 ?auto_460743 ) ) ( not ( = ?auto_460742 ?auto_460744 ) ) ( not ( = ?auto_460742 ?auto_460746 ) ) ( not ( = ?auto_460742 ?auto_460745 ) ) ( not ( = ?auto_460742 ?auto_460747 ) ) ( not ( = ?auto_460742 ?auto_460748 ) ) ( not ( = ?auto_460742 ?auto_460749 ) ) ( not ( = ?auto_460742 ?auto_460750 ) ) ( not ( = ?auto_460742 ?auto_460751 ) ) ( not ( = ?auto_460742 ?auto_460752 ) ) ( not ( = ?auto_460743 ?auto_460744 ) ) ( not ( = ?auto_460743 ?auto_460746 ) ) ( not ( = ?auto_460743 ?auto_460745 ) ) ( not ( = ?auto_460743 ?auto_460747 ) ) ( not ( = ?auto_460743 ?auto_460748 ) ) ( not ( = ?auto_460743 ?auto_460749 ) ) ( not ( = ?auto_460743 ?auto_460750 ) ) ( not ( = ?auto_460743 ?auto_460751 ) ) ( not ( = ?auto_460743 ?auto_460752 ) ) ( not ( = ?auto_460744 ?auto_460746 ) ) ( not ( = ?auto_460744 ?auto_460745 ) ) ( not ( = ?auto_460744 ?auto_460747 ) ) ( not ( = ?auto_460744 ?auto_460748 ) ) ( not ( = ?auto_460744 ?auto_460749 ) ) ( not ( = ?auto_460744 ?auto_460750 ) ) ( not ( = ?auto_460744 ?auto_460751 ) ) ( not ( = ?auto_460744 ?auto_460752 ) ) ( not ( = ?auto_460746 ?auto_460745 ) ) ( not ( = ?auto_460746 ?auto_460747 ) ) ( not ( = ?auto_460746 ?auto_460748 ) ) ( not ( = ?auto_460746 ?auto_460749 ) ) ( not ( = ?auto_460746 ?auto_460750 ) ) ( not ( = ?auto_460746 ?auto_460751 ) ) ( not ( = ?auto_460746 ?auto_460752 ) ) ( not ( = ?auto_460745 ?auto_460747 ) ) ( not ( = ?auto_460745 ?auto_460748 ) ) ( not ( = ?auto_460745 ?auto_460749 ) ) ( not ( = ?auto_460745 ?auto_460750 ) ) ( not ( = ?auto_460745 ?auto_460751 ) ) ( not ( = ?auto_460745 ?auto_460752 ) ) ( not ( = ?auto_460747 ?auto_460748 ) ) ( not ( = ?auto_460747 ?auto_460749 ) ) ( not ( = ?auto_460747 ?auto_460750 ) ) ( not ( = ?auto_460747 ?auto_460751 ) ) ( not ( = ?auto_460747 ?auto_460752 ) ) ( not ( = ?auto_460748 ?auto_460749 ) ) ( not ( = ?auto_460748 ?auto_460750 ) ) ( not ( = ?auto_460748 ?auto_460751 ) ) ( not ( = ?auto_460748 ?auto_460752 ) ) ( not ( = ?auto_460749 ?auto_460750 ) ) ( not ( = ?auto_460749 ?auto_460751 ) ) ( not ( = ?auto_460749 ?auto_460752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_460750 ?auto_460751 ?auto_460752 )
      ( MAKE-10CRATE-VERIFY ?auto_460742 ?auto_460743 ?auto_460744 ?auto_460746 ?auto_460745 ?auto_460747 ?auto_460748 ?auto_460749 ?auto_460750 ?auto_460751 ?auto_460752 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_460857 - SURFACE
      ?auto_460858 - SURFACE
      ?auto_460859 - SURFACE
      ?auto_460861 - SURFACE
      ?auto_460860 - SURFACE
      ?auto_460862 - SURFACE
      ?auto_460863 - SURFACE
      ?auto_460864 - SURFACE
      ?auto_460865 - SURFACE
      ?auto_460866 - SURFACE
      ?auto_460867 - SURFACE
    )
    :vars
    (
      ?auto_460870 - HOIST
      ?auto_460869 - PLACE
      ?auto_460868 - TRUCK
      ?auto_460872 - PLACE
      ?auto_460871 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_460870 ?auto_460869 ) ( SURFACE-AT ?auto_460866 ?auto_460869 ) ( CLEAR ?auto_460866 ) ( IS-CRATE ?auto_460867 ) ( not ( = ?auto_460866 ?auto_460867 ) ) ( AVAILABLE ?auto_460870 ) ( ON ?auto_460866 ?auto_460865 ) ( not ( = ?auto_460865 ?auto_460866 ) ) ( not ( = ?auto_460865 ?auto_460867 ) ) ( TRUCK-AT ?auto_460868 ?auto_460872 ) ( not ( = ?auto_460872 ?auto_460869 ) ) ( HOIST-AT ?auto_460871 ?auto_460872 ) ( LIFTING ?auto_460871 ?auto_460867 ) ( not ( = ?auto_460870 ?auto_460871 ) ) ( ON ?auto_460858 ?auto_460857 ) ( ON ?auto_460859 ?auto_460858 ) ( ON ?auto_460861 ?auto_460859 ) ( ON ?auto_460860 ?auto_460861 ) ( ON ?auto_460862 ?auto_460860 ) ( ON ?auto_460863 ?auto_460862 ) ( ON ?auto_460864 ?auto_460863 ) ( ON ?auto_460865 ?auto_460864 ) ( not ( = ?auto_460857 ?auto_460858 ) ) ( not ( = ?auto_460857 ?auto_460859 ) ) ( not ( = ?auto_460857 ?auto_460861 ) ) ( not ( = ?auto_460857 ?auto_460860 ) ) ( not ( = ?auto_460857 ?auto_460862 ) ) ( not ( = ?auto_460857 ?auto_460863 ) ) ( not ( = ?auto_460857 ?auto_460864 ) ) ( not ( = ?auto_460857 ?auto_460865 ) ) ( not ( = ?auto_460857 ?auto_460866 ) ) ( not ( = ?auto_460857 ?auto_460867 ) ) ( not ( = ?auto_460858 ?auto_460859 ) ) ( not ( = ?auto_460858 ?auto_460861 ) ) ( not ( = ?auto_460858 ?auto_460860 ) ) ( not ( = ?auto_460858 ?auto_460862 ) ) ( not ( = ?auto_460858 ?auto_460863 ) ) ( not ( = ?auto_460858 ?auto_460864 ) ) ( not ( = ?auto_460858 ?auto_460865 ) ) ( not ( = ?auto_460858 ?auto_460866 ) ) ( not ( = ?auto_460858 ?auto_460867 ) ) ( not ( = ?auto_460859 ?auto_460861 ) ) ( not ( = ?auto_460859 ?auto_460860 ) ) ( not ( = ?auto_460859 ?auto_460862 ) ) ( not ( = ?auto_460859 ?auto_460863 ) ) ( not ( = ?auto_460859 ?auto_460864 ) ) ( not ( = ?auto_460859 ?auto_460865 ) ) ( not ( = ?auto_460859 ?auto_460866 ) ) ( not ( = ?auto_460859 ?auto_460867 ) ) ( not ( = ?auto_460861 ?auto_460860 ) ) ( not ( = ?auto_460861 ?auto_460862 ) ) ( not ( = ?auto_460861 ?auto_460863 ) ) ( not ( = ?auto_460861 ?auto_460864 ) ) ( not ( = ?auto_460861 ?auto_460865 ) ) ( not ( = ?auto_460861 ?auto_460866 ) ) ( not ( = ?auto_460861 ?auto_460867 ) ) ( not ( = ?auto_460860 ?auto_460862 ) ) ( not ( = ?auto_460860 ?auto_460863 ) ) ( not ( = ?auto_460860 ?auto_460864 ) ) ( not ( = ?auto_460860 ?auto_460865 ) ) ( not ( = ?auto_460860 ?auto_460866 ) ) ( not ( = ?auto_460860 ?auto_460867 ) ) ( not ( = ?auto_460862 ?auto_460863 ) ) ( not ( = ?auto_460862 ?auto_460864 ) ) ( not ( = ?auto_460862 ?auto_460865 ) ) ( not ( = ?auto_460862 ?auto_460866 ) ) ( not ( = ?auto_460862 ?auto_460867 ) ) ( not ( = ?auto_460863 ?auto_460864 ) ) ( not ( = ?auto_460863 ?auto_460865 ) ) ( not ( = ?auto_460863 ?auto_460866 ) ) ( not ( = ?auto_460863 ?auto_460867 ) ) ( not ( = ?auto_460864 ?auto_460865 ) ) ( not ( = ?auto_460864 ?auto_460866 ) ) ( not ( = ?auto_460864 ?auto_460867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_460865 ?auto_460866 ?auto_460867 )
      ( MAKE-10CRATE-VERIFY ?auto_460857 ?auto_460858 ?auto_460859 ?auto_460861 ?auto_460860 ?auto_460862 ?auto_460863 ?auto_460864 ?auto_460865 ?auto_460866 ?auto_460867 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_460982 - SURFACE
      ?auto_460983 - SURFACE
      ?auto_460984 - SURFACE
      ?auto_460986 - SURFACE
      ?auto_460985 - SURFACE
      ?auto_460987 - SURFACE
      ?auto_460988 - SURFACE
      ?auto_460989 - SURFACE
      ?auto_460990 - SURFACE
      ?auto_460991 - SURFACE
      ?auto_460992 - SURFACE
    )
    :vars
    (
      ?auto_460994 - HOIST
      ?auto_460996 - PLACE
      ?auto_460995 - TRUCK
      ?auto_460997 - PLACE
      ?auto_460998 - HOIST
      ?auto_460993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_460994 ?auto_460996 ) ( SURFACE-AT ?auto_460991 ?auto_460996 ) ( CLEAR ?auto_460991 ) ( IS-CRATE ?auto_460992 ) ( not ( = ?auto_460991 ?auto_460992 ) ) ( AVAILABLE ?auto_460994 ) ( ON ?auto_460991 ?auto_460990 ) ( not ( = ?auto_460990 ?auto_460991 ) ) ( not ( = ?auto_460990 ?auto_460992 ) ) ( TRUCK-AT ?auto_460995 ?auto_460997 ) ( not ( = ?auto_460997 ?auto_460996 ) ) ( HOIST-AT ?auto_460998 ?auto_460997 ) ( not ( = ?auto_460994 ?auto_460998 ) ) ( AVAILABLE ?auto_460998 ) ( SURFACE-AT ?auto_460992 ?auto_460997 ) ( ON ?auto_460992 ?auto_460993 ) ( CLEAR ?auto_460992 ) ( not ( = ?auto_460991 ?auto_460993 ) ) ( not ( = ?auto_460992 ?auto_460993 ) ) ( not ( = ?auto_460990 ?auto_460993 ) ) ( ON ?auto_460983 ?auto_460982 ) ( ON ?auto_460984 ?auto_460983 ) ( ON ?auto_460986 ?auto_460984 ) ( ON ?auto_460985 ?auto_460986 ) ( ON ?auto_460987 ?auto_460985 ) ( ON ?auto_460988 ?auto_460987 ) ( ON ?auto_460989 ?auto_460988 ) ( ON ?auto_460990 ?auto_460989 ) ( not ( = ?auto_460982 ?auto_460983 ) ) ( not ( = ?auto_460982 ?auto_460984 ) ) ( not ( = ?auto_460982 ?auto_460986 ) ) ( not ( = ?auto_460982 ?auto_460985 ) ) ( not ( = ?auto_460982 ?auto_460987 ) ) ( not ( = ?auto_460982 ?auto_460988 ) ) ( not ( = ?auto_460982 ?auto_460989 ) ) ( not ( = ?auto_460982 ?auto_460990 ) ) ( not ( = ?auto_460982 ?auto_460991 ) ) ( not ( = ?auto_460982 ?auto_460992 ) ) ( not ( = ?auto_460982 ?auto_460993 ) ) ( not ( = ?auto_460983 ?auto_460984 ) ) ( not ( = ?auto_460983 ?auto_460986 ) ) ( not ( = ?auto_460983 ?auto_460985 ) ) ( not ( = ?auto_460983 ?auto_460987 ) ) ( not ( = ?auto_460983 ?auto_460988 ) ) ( not ( = ?auto_460983 ?auto_460989 ) ) ( not ( = ?auto_460983 ?auto_460990 ) ) ( not ( = ?auto_460983 ?auto_460991 ) ) ( not ( = ?auto_460983 ?auto_460992 ) ) ( not ( = ?auto_460983 ?auto_460993 ) ) ( not ( = ?auto_460984 ?auto_460986 ) ) ( not ( = ?auto_460984 ?auto_460985 ) ) ( not ( = ?auto_460984 ?auto_460987 ) ) ( not ( = ?auto_460984 ?auto_460988 ) ) ( not ( = ?auto_460984 ?auto_460989 ) ) ( not ( = ?auto_460984 ?auto_460990 ) ) ( not ( = ?auto_460984 ?auto_460991 ) ) ( not ( = ?auto_460984 ?auto_460992 ) ) ( not ( = ?auto_460984 ?auto_460993 ) ) ( not ( = ?auto_460986 ?auto_460985 ) ) ( not ( = ?auto_460986 ?auto_460987 ) ) ( not ( = ?auto_460986 ?auto_460988 ) ) ( not ( = ?auto_460986 ?auto_460989 ) ) ( not ( = ?auto_460986 ?auto_460990 ) ) ( not ( = ?auto_460986 ?auto_460991 ) ) ( not ( = ?auto_460986 ?auto_460992 ) ) ( not ( = ?auto_460986 ?auto_460993 ) ) ( not ( = ?auto_460985 ?auto_460987 ) ) ( not ( = ?auto_460985 ?auto_460988 ) ) ( not ( = ?auto_460985 ?auto_460989 ) ) ( not ( = ?auto_460985 ?auto_460990 ) ) ( not ( = ?auto_460985 ?auto_460991 ) ) ( not ( = ?auto_460985 ?auto_460992 ) ) ( not ( = ?auto_460985 ?auto_460993 ) ) ( not ( = ?auto_460987 ?auto_460988 ) ) ( not ( = ?auto_460987 ?auto_460989 ) ) ( not ( = ?auto_460987 ?auto_460990 ) ) ( not ( = ?auto_460987 ?auto_460991 ) ) ( not ( = ?auto_460987 ?auto_460992 ) ) ( not ( = ?auto_460987 ?auto_460993 ) ) ( not ( = ?auto_460988 ?auto_460989 ) ) ( not ( = ?auto_460988 ?auto_460990 ) ) ( not ( = ?auto_460988 ?auto_460991 ) ) ( not ( = ?auto_460988 ?auto_460992 ) ) ( not ( = ?auto_460988 ?auto_460993 ) ) ( not ( = ?auto_460989 ?auto_460990 ) ) ( not ( = ?auto_460989 ?auto_460991 ) ) ( not ( = ?auto_460989 ?auto_460992 ) ) ( not ( = ?auto_460989 ?auto_460993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_460990 ?auto_460991 ?auto_460992 )
      ( MAKE-10CRATE-VERIFY ?auto_460982 ?auto_460983 ?auto_460984 ?auto_460986 ?auto_460985 ?auto_460987 ?auto_460988 ?auto_460989 ?auto_460990 ?auto_460991 ?auto_460992 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461108 - SURFACE
      ?auto_461109 - SURFACE
      ?auto_461110 - SURFACE
      ?auto_461112 - SURFACE
      ?auto_461111 - SURFACE
      ?auto_461113 - SURFACE
      ?auto_461114 - SURFACE
      ?auto_461115 - SURFACE
      ?auto_461116 - SURFACE
      ?auto_461117 - SURFACE
      ?auto_461118 - SURFACE
    )
    :vars
    (
      ?auto_461124 - HOIST
      ?auto_461123 - PLACE
      ?auto_461119 - PLACE
      ?auto_461120 - HOIST
      ?auto_461121 - SURFACE
      ?auto_461122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461124 ?auto_461123 ) ( SURFACE-AT ?auto_461117 ?auto_461123 ) ( CLEAR ?auto_461117 ) ( IS-CRATE ?auto_461118 ) ( not ( = ?auto_461117 ?auto_461118 ) ) ( AVAILABLE ?auto_461124 ) ( ON ?auto_461117 ?auto_461116 ) ( not ( = ?auto_461116 ?auto_461117 ) ) ( not ( = ?auto_461116 ?auto_461118 ) ) ( not ( = ?auto_461119 ?auto_461123 ) ) ( HOIST-AT ?auto_461120 ?auto_461119 ) ( not ( = ?auto_461124 ?auto_461120 ) ) ( AVAILABLE ?auto_461120 ) ( SURFACE-AT ?auto_461118 ?auto_461119 ) ( ON ?auto_461118 ?auto_461121 ) ( CLEAR ?auto_461118 ) ( not ( = ?auto_461117 ?auto_461121 ) ) ( not ( = ?auto_461118 ?auto_461121 ) ) ( not ( = ?auto_461116 ?auto_461121 ) ) ( TRUCK-AT ?auto_461122 ?auto_461123 ) ( ON ?auto_461109 ?auto_461108 ) ( ON ?auto_461110 ?auto_461109 ) ( ON ?auto_461112 ?auto_461110 ) ( ON ?auto_461111 ?auto_461112 ) ( ON ?auto_461113 ?auto_461111 ) ( ON ?auto_461114 ?auto_461113 ) ( ON ?auto_461115 ?auto_461114 ) ( ON ?auto_461116 ?auto_461115 ) ( not ( = ?auto_461108 ?auto_461109 ) ) ( not ( = ?auto_461108 ?auto_461110 ) ) ( not ( = ?auto_461108 ?auto_461112 ) ) ( not ( = ?auto_461108 ?auto_461111 ) ) ( not ( = ?auto_461108 ?auto_461113 ) ) ( not ( = ?auto_461108 ?auto_461114 ) ) ( not ( = ?auto_461108 ?auto_461115 ) ) ( not ( = ?auto_461108 ?auto_461116 ) ) ( not ( = ?auto_461108 ?auto_461117 ) ) ( not ( = ?auto_461108 ?auto_461118 ) ) ( not ( = ?auto_461108 ?auto_461121 ) ) ( not ( = ?auto_461109 ?auto_461110 ) ) ( not ( = ?auto_461109 ?auto_461112 ) ) ( not ( = ?auto_461109 ?auto_461111 ) ) ( not ( = ?auto_461109 ?auto_461113 ) ) ( not ( = ?auto_461109 ?auto_461114 ) ) ( not ( = ?auto_461109 ?auto_461115 ) ) ( not ( = ?auto_461109 ?auto_461116 ) ) ( not ( = ?auto_461109 ?auto_461117 ) ) ( not ( = ?auto_461109 ?auto_461118 ) ) ( not ( = ?auto_461109 ?auto_461121 ) ) ( not ( = ?auto_461110 ?auto_461112 ) ) ( not ( = ?auto_461110 ?auto_461111 ) ) ( not ( = ?auto_461110 ?auto_461113 ) ) ( not ( = ?auto_461110 ?auto_461114 ) ) ( not ( = ?auto_461110 ?auto_461115 ) ) ( not ( = ?auto_461110 ?auto_461116 ) ) ( not ( = ?auto_461110 ?auto_461117 ) ) ( not ( = ?auto_461110 ?auto_461118 ) ) ( not ( = ?auto_461110 ?auto_461121 ) ) ( not ( = ?auto_461112 ?auto_461111 ) ) ( not ( = ?auto_461112 ?auto_461113 ) ) ( not ( = ?auto_461112 ?auto_461114 ) ) ( not ( = ?auto_461112 ?auto_461115 ) ) ( not ( = ?auto_461112 ?auto_461116 ) ) ( not ( = ?auto_461112 ?auto_461117 ) ) ( not ( = ?auto_461112 ?auto_461118 ) ) ( not ( = ?auto_461112 ?auto_461121 ) ) ( not ( = ?auto_461111 ?auto_461113 ) ) ( not ( = ?auto_461111 ?auto_461114 ) ) ( not ( = ?auto_461111 ?auto_461115 ) ) ( not ( = ?auto_461111 ?auto_461116 ) ) ( not ( = ?auto_461111 ?auto_461117 ) ) ( not ( = ?auto_461111 ?auto_461118 ) ) ( not ( = ?auto_461111 ?auto_461121 ) ) ( not ( = ?auto_461113 ?auto_461114 ) ) ( not ( = ?auto_461113 ?auto_461115 ) ) ( not ( = ?auto_461113 ?auto_461116 ) ) ( not ( = ?auto_461113 ?auto_461117 ) ) ( not ( = ?auto_461113 ?auto_461118 ) ) ( not ( = ?auto_461113 ?auto_461121 ) ) ( not ( = ?auto_461114 ?auto_461115 ) ) ( not ( = ?auto_461114 ?auto_461116 ) ) ( not ( = ?auto_461114 ?auto_461117 ) ) ( not ( = ?auto_461114 ?auto_461118 ) ) ( not ( = ?auto_461114 ?auto_461121 ) ) ( not ( = ?auto_461115 ?auto_461116 ) ) ( not ( = ?auto_461115 ?auto_461117 ) ) ( not ( = ?auto_461115 ?auto_461118 ) ) ( not ( = ?auto_461115 ?auto_461121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461116 ?auto_461117 ?auto_461118 )
      ( MAKE-10CRATE-VERIFY ?auto_461108 ?auto_461109 ?auto_461110 ?auto_461112 ?auto_461111 ?auto_461113 ?auto_461114 ?auto_461115 ?auto_461116 ?auto_461117 ?auto_461118 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461234 - SURFACE
      ?auto_461235 - SURFACE
      ?auto_461236 - SURFACE
      ?auto_461238 - SURFACE
      ?auto_461237 - SURFACE
      ?auto_461239 - SURFACE
      ?auto_461240 - SURFACE
      ?auto_461241 - SURFACE
      ?auto_461242 - SURFACE
      ?auto_461243 - SURFACE
      ?auto_461244 - SURFACE
    )
    :vars
    (
      ?auto_461246 - HOIST
      ?auto_461248 - PLACE
      ?auto_461247 - PLACE
      ?auto_461249 - HOIST
      ?auto_461250 - SURFACE
      ?auto_461245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461246 ?auto_461248 ) ( IS-CRATE ?auto_461244 ) ( not ( = ?auto_461243 ?auto_461244 ) ) ( not ( = ?auto_461242 ?auto_461243 ) ) ( not ( = ?auto_461242 ?auto_461244 ) ) ( not ( = ?auto_461247 ?auto_461248 ) ) ( HOIST-AT ?auto_461249 ?auto_461247 ) ( not ( = ?auto_461246 ?auto_461249 ) ) ( AVAILABLE ?auto_461249 ) ( SURFACE-AT ?auto_461244 ?auto_461247 ) ( ON ?auto_461244 ?auto_461250 ) ( CLEAR ?auto_461244 ) ( not ( = ?auto_461243 ?auto_461250 ) ) ( not ( = ?auto_461244 ?auto_461250 ) ) ( not ( = ?auto_461242 ?auto_461250 ) ) ( TRUCK-AT ?auto_461245 ?auto_461248 ) ( SURFACE-AT ?auto_461242 ?auto_461248 ) ( CLEAR ?auto_461242 ) ( LIFTING ?auto_461246 ?auto_461243 ) ( IS-CRATE ?auto_461243 ) ( ON ?auto_461235 ?auto_461234 ) ( ON ?auto_461236 ?auto_461235 ) ( ON ?auto_461238 ?auto_461236 ) ( ON ?auto_461237 ?auto_461238 ) ( ON ?auto_461239 ?auto_461237 ) ( ON ?auto_461240 ?auto_461239 ) ( ON ?auto_461241 ?auto_461240 ) ( ON ?auto_461242 ?auto_461241 ) ( not ( = ?auto_461234 ?auto_461235 ) ) ( not ( = ?auto_461234 ?auto_461236 ) ) ( not ( = ?auto_461234 ?auto_461238 ) ) ( not ( = ?auto_461234 ?auto_461237 ) ) ( not ( = ?auto_461234 ?auto_461239 ) ) ( not ( = ?auto_461234 ?auto_461240 ) ) ( not ( = ?auto_461234 ?auto_461241 ) ) ( not ( = ?auto_461234 ?auto_461242 ) ) ( not ( = ?auto_461234 ?auto_461243 ) ) ( not ( = ?auto_461234 ?auto_461244 ) ) ( not ( = ?auto_461234 ?auto_461250 ) ) ( not ( = ?auto_461235 ?auto_461236 ) ) ( not ( = ?auto_461235 ?auto_461238 ) ) ( not ( = ?auto_461235 ?auto_461237 ) ) ( not ( = ?auto_461235 ?auto_461239 ) ) ( not ( = ?auto_461235 ?auto_461240 ) ) ( not ( = ?auto_461235 ?auto_461241 ) ) ( not ( = ?auto_461235 ?auto_461242 ) ) ( not ( = ?auto_461235 ?auto_461243 ) ) ( not ( = ?auto_461235 ?auto_461244 ) ) ( not ( = ?auto_461235 ?auto_461250 ) ) ( not ( = ?auto_461236 ?auto_461238 ) ) ( not ( = ?auto_461236 ?auto_461237 ) ) ( not ( = ?auto_461236 ?auto_461239 ) ) ( not ( = ?auto_461236 ?auto_461240 ) ) ( not ( = ?auto_461236 ?auto_461241 ) ) ( not ( = ?auto_461236 ?auto_461242 ) ) ( not ( = ?auto_461236 ?auto_461243 ) ) ( not ( = ?auto_461236 ?auto_461244 ) ) ( not ( = ?auto_461236 ?auto_461250 ) ) ( not ( = ?auto_461238 ?auto_461237 ) ) ( not ( = ?auto_461238 ?auto_461239 ) ) ( not ( = ?auto_461238 ?auto_461240 ) ) ( not ( = ?auto_461238 ?auto_461241 ) ) ( not ( = ?auto_461238 ?auto_461242 ) ) ( not ( = ?auto_461238 ?auto_461243 ) ) ( not ( = ?auto_461238 ?auto_461244 ) ) ( not ( = ?auto_461238 ?auto_461250 ) ) ( not ( = ?auto_461237 ?auto_461239 ) ) ( not ( = ?auto_461237 ?auto_461240 ) ) ( not ( = ?auto_461237 ?auto_461241 ) ) ( not ( = ?auto_461237 ?auto_461242 ) ) ( not ( = ?auto_461237 ?auto_461243 ) ) ( not ( = ?auto_461237 ?auto_461244 ) ) ( not ( = ?auto_461237 ?auto_461250 ) ) ( not ( = ?auto_461239 ?auto_461240 ) ) ( not ( = ?auto_461239 ?auto_461241 ) ) ( not ( = ?auto_461239 ?auto_461242 ) ) ( not ( = ?auto_461239 ?auto_461243 ) ) ( not ( = ?auto_461239 ?auto_461244 ) ) ( not ( = ?auto_461239 ?auto_461250 ) ) ( not ( = ?auto_461240 ?auto_461241 ) ) ( not ( = ?auto_461240 ?auto_461242 ) ) ( not ( = ?auto_461240 ?auto_461243 ) ) ( not ( = ?auto_461240 ?auto_461244 ) ) ( not ( = ?auto_461240 ?auto_461250 ) ) ( not ( = ?auto_461241 ?auto_461242 ) ) ( not ( = ?auto_461241 ?auto_461243 ) ) ( not ( = ?auto_461241 ?auto_461244 ) ) ( not ( = ?auto_461241 ?auto_461250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461242 ?auto_461243 ?auto_461244 )
      ( MAKE-10CRATE-VERIFY ?auto_461234 ?auto_461235 ?auto_461236 ?auto_461238 ?auto_461237 ?auto_461239 ?auto_461240 ?auto_461241 ?auto_461242 ?auto_461243 ?auto_461244 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_461360 - SURFACE
      ?auto_461361 - SURFACE
      ?auto_461362 - SURFACE
      ?auto_461364 - SURFACE
      ?auto_461363 - SURFACE
      ?auto_461365 - SURFACE
      ?auto_461366 - SURFACE
      ?auto_461367 - SURFACE
      ?auto_461368 - SURFACE
      ?auto_461369 - SURFACE
      ?auto_461370 - SURFACE
    )
    :vars
    (
      ?auto_461376 - HOIST
      ?auto_461374 - PLACE
      ?auto_461375 - PLACE
      ?auto_461371 - HOIST
      ?auto_461372 - SURFACE
      ?auto_461373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_461376 ?auto_461374 ) ( IS-CRATE ?auto_461370 ) ( not ( = ?auto_461369 ?auto_461370 ) ) ( not ( = ?auto_461368 ?auto_461369 ) ) ( not ( = ?auto_461368 ?auto_461370 ) ) ( not ( = ?auto_461375 ?auto_461374 ) ) ( HOIST-AT ?auto_461371 ?auto_461375 ) ( not ( = ?auto_461376 ?auto_461371 ) ) ( AVAILABLE ?auto_461371 ) ( SURFACE-AT ?auto_461370 ?auto_461375 ) ( ON ?auto_461370 ?auto_461372 ) ( CLEAR ?auto_461370 ) ( not ( = ?auto_461369 ?auto_461372 ) ) ( not ( = ?auto_461370 ?auto_461372 ) ) ( not ( = ?auto_461368 ?auto_461372 ) ) ( TRUCK-AT ?auto_461373 ?auto_461374 ) ( SURFACE-AT ?auto_461368 ?auto_461374 ) ( CLEAR ?auto_461368 ) ( IS-CRATE ?auto_461369 ) ( AVAILABLE ?auto_461376 ) ( IN ?auto_461369 ?auto_461373 ) ( ON ?auto_461361 ?auto_461360 ) ( ON ?auto_461362 ?auto_461361 ) ( ON ?auto_461364 ?auto_461362 ) ( ON ?auto_461363 ?auto_461364 ) ( ON ?auto_461365 ?auto_461363 ) ( ON ?auto_461366 ?auto_461365 ) ( ON ?auto_461367 ?auto_461366 ) ( ON ?auto_461368 ?auto_461367 ) ( not ( = ?auto_461360 ?auto_461361 ) ) ( not ( = ?auto_461360 ?auto_461362 ) ) ( not ( = ?auto_461360 ?auto_461364 ) ) ( not ( = ?auto_461360 ?auto_461363 ) ) ( not ( = ?auto_461360 ?auto_461365 ) ) ( not ( = ?auto_461360 ?auto_461366 ) ) ( not ( = ?auto_461360 ?auto_461367 ) ) ( not ( = ?auto_461360 ?auto_461368 ) ) ( not ( = ?auto_461360 ?auto_461369 ) ) ( not ( = ?auto_461360 ?auto_461370 ) ) ( not ( = ?auto_461360 ?auto_461372 ) ) ( not ( = ?auto_461361 ?auto_461362 ) ) ( not ( = ?auto_461361 ?auto_461364 ) ) ( not ( = ?auto_461361 ?auto_461363 ) ) ( not ( = ?auto_461361 ?auto_461365 ) ) ( not ( = ?auto_461361 ?auto_461366 ) ) ( not ( = ?auto_461361 ?auto_461367 ) ) ( not ( = ?auto_461361 ?auto_461368 ) ) ( not ( = ?auto_461361 ?auto_461369 ) ) ( not ( = ?auto_461361 ?auto_461370 ) ) ( not ( = ?auto_461361 ?auto_461372 ) ) ( not ( = ?auto_461362 ?auto_461364 ) ) ( not ( = ?auto_461362 ?auto_461363 ) ) ( not ( = ?auto_461362 ?auto_461365 ) ) ( not ( = ?auto_461362 ?auto_461366 ) ) ( not ( = ?auto_461362 ?auto_461367 ) ) ( not ( = ?auto_461362 ?auto_461368 ) ) ( not ( = ?auto_461362 ?auto_461369 ) ) ( not ( = ?auto_461362 ?auto_461370 ) ) ( not ( = ?auto_461362 ?auto_461372 ) ) ( not ( = ?auto_461364 ?auto_461363 ) ) ( not ( = ?auto_461364 ?auto_461365 ) ) ( not ( = ?auto_461364 ?auto_461366 ) ) ( not ( = ?auto_461364 ?auto_461367 ) ) ( not ( = ?auto_461364 ?auto_461368 ) ) ( not ( = ?auto_461364 ?auto_461369 ) ) ( not ( = ?auto_461364 ?auto_461370 ) ) ( not ( = ?auto_461364 ?auto_461372 ) ) ( not ( = ?auto_461363 ?auto_461365 ) ) ( not ( = ?auto_461363 ?auto_461366 ) ) ( not ( = ?auto_461363 ?auto_461367 ) ) ( not ( = ?auto_461363 ?auto_461368 ) ) ( not ( = ?auto_461363 ?auto_461369 ) ) ( not ( = ?auto_461363 ?auto_461370 ) ) ( not ( = ?auto_461363 ?auto_461372 ) ) ( not ( = ?auto_461365 ?auto_461366 ) ) ( not ( = ?auto_461365 ?auto_461367 ) ) ( not ( = ?auto_461365 ?auto_461368 ) ) ( not ( = ?auto_461365 ?auto_461369 ) ) ( not ( = ?auto_461365 ?auto_461370 ) ) ( not ( = ?auto_461365 ?auto_461372 ) ) ( not ( = ?auto_461366 ?auto_461367 ) ) ( not ( = ?auto_461366 ?auto_461368 ) ) ( not ( = ?auto_461366 ?auto_461369 ) ) ( not ( = ?auto_461366 ?auto_461370 ) ) ( not ( = ?auto_461366 ?auto_461372 ) ) ( not ( = ?auto_461367 ?auto_461368 ) ) ( not ( = ?auto_461367 ?auto_461369 ) ) ( not ( = ?auto_461367 ?auto_461370 ) ) ( not ( = ?auto_461367 ?auto_461372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_461368 ?auto_461369 ?auto_461370 )
      ( MAKE-10CRATE-VERIFY ?auto_461360 ?auto_461361 ?auto_461362 ?auto_461364 ?auto_461363 ?auto_461365 ?auto_461366 ?auto_461367 ?auto_461368 ?auto_461369 ?auto_461370 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_468606 - SURFACE
      ?auto_468607 - SURFACE
      ?auto_468608 - SURFACE
      ?auto_468610 - SURFACE
      ?auto_468609 - SURFACE
      ?auto_468611 - SURFACE
      ?auto_468612 - SURFACE
      ?auto_468613 - SURFACE
      ?auto_468614 - SURFACE
      ?auto_468615 - SURFACE
      ?auto_468616 - SURFACE
      ?auto_468617 - SURFACE
    )
    :vars
    (
      ?auto_468619 - HOIST
      ?auto_468618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_468619 ?auto_468618 ) ( SURFACE-AT ?auto_468616 ?auto_468618 ) ( CLEAR ?auto_468616 ) ( LIFTING ?auto_468619 ?auto_468617 ) ( IS-CRATE ?auto_468617 ) ( not ( = ?auto_468616 ?auto_468617 ) ) ( ON ?auto_468607 ?auto_468606 ) ( ON ?auto_468608 ?auto_468607 ) ( ON ?auto_468610 ?auto_468608 ) ( ON ?auto_468609 ?auto_468610 ) ( ON ?auto_468611 ?auto_468609 ) ( ON ?auto_468612 ?auto_468611 ) ( ON ?auto_468613 ?auto_468612 ) ( ON ?auto_468614 ?auto_468613 ) ( ON ?auto_468615 ?auto_468614 ) ( ON ?auto_468616 ?auto_468615 ) ( not ( = ?auto_468606 ?auto_468607 ) ) ( not ( = ?auto_468606 ?auto_468608 ) ) ( not ( = ?auto_468606 ?auto_468610 ) ) ( not ( = ?auto_468606 ?auto_468609 ) ) ( not ( = ?auto_468606 ?auto_468611 ) ) ( not ( = ?auto_468606 ?auto_468612 ) ) ( not ( = ?auto_468606 ?auto_468613 ) ) ( not ( = ?auto_468606 ?auto_468614 ) ) ( not ( = ?auto_468606 ?auto_468615 ) ) ( not ( = ?auto_468606 ?auto_468616 ) ) ( not ( = ?auto_468606 ?auto_468617 ) ) ( not ( = ?auto_468607 ?auto_468608 ) ) ( not ( = ?auto_468607 ?auto_468610 ) ) ( not ( = ?auto_468607 ?auto_468609 ) ) ( not ( = ?auto_468607 ?auto_468611 ) ) ( not ( = ?auto_468607 ?auto_468612 ) ) ( not ( = ?auto_468607 ?auto_468613 ) ) ( not ( = ?auto_468607 ?auto_468614 ) ) ( not ( = ?auto_468607 ?auto_468615 ) ) ( not ( = ?auto_468607 ?auto_468616 ) ) ( not ( = ?auto_468607 ?auto_468617 ) ) ( not ( = ?auto_468608 ?auto_468610 ) ) ( not ( = ?auto_468608 ?auto_468609 ) ) ( not ( = ?auto_468608 ?auto_468611 ) ) ( not ( = ?auto_468608 ?auto_468612 ) ) ( not ( = ?auto_468608 ?auto_468613 ) ) ( not ( = ?auto_468608 ?auto_468614 ) ) ( not ( = ?auto_468608 ?auto_468615 ) ) ( not ( = ?auto_468608 ?auto_468616 ) ) ( not ( = ?auto_468608 ?auto_468617 ) ) ( not ( = ?auto_468610 ?auto_468609 ) ) ( not ( = ?auto_468610 ?auto_468611 ) ) ( not ( = ?auto_468610 ?auto_468612 ) ) ( not ( = ?auto_468610 ?auto_468613 ) ) ( not ( = ?auto_468610 ?auto_468614 ) ) ( not ( = ?auto_468610 ?auto_468615 ) ) ( not ( = ?auto_468610 ?auto_468616 ) ) ( not ( = ?auto_468610 ?auto_468617 ) ) ( not ( = ?auto_468609 ?auto_468611 ) ) ( not ( = ?auto_468609 ?auto_468612 ) ) ( not ( = ?auto_468609 ?auto_468613 ) ) ( not ( = ?auto_468609 ?auto_468614 ) ) ( not ( = ?auto_468609 ?auto_468615 ) ) ( not ( = ?auto_468609 ?auto_468616 ) ) ( not ( = ?auto_468609 ?auto_468617 ) ) ( not ( = ?auto_468611 ?auto_468612 ) ) ( not ( = ?auto_468611 ?auto_468613 ) ) ( not ( = ?auto_468611 ?auto_468614 ) ) ( not ( = ?auto_468611 ?auto_468615 ) ) ( not ( = ?auto_468611 ?auto_468616 ) ) ( not ( = ?auto_468611 ?auto_468617 ) ) ( not ( = ?auto_468612 ?auto_468613 ) ) ( not ( = ?auto_468612 ?auto_468614 ) ) ( not ( = ?auto_468612 ?auto_468615 ) ) ( not ( = ?auto_468612 ?auto_468616 ) ) ( not ( = ?auto_468612 ?auto_468617 ) ) ( not ( = ?auto_468613 ?auto_468614 ) ) ( not ( = ?auto_468613 ?auto_468615 ) ) ( not ( = ?auto_468613 ?auto_468616 ) ) ( not ( = ?auto_468613 ?auto_468617 ) ) ( not ( = ?auto_468614 ?auto_468615 ) ) ( not ( = ?auto_468614 ?auto_468616 ) ) ( not ( = ?auto_468614 ?auto_468617 ) ) ( not ( = ?auto_468615 ?auto_468616 ) ) ( not ( = ?auto_468615 ?auto_468617 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_468616 ?auto_468617 )
      ( MAKE-11CRATE-VERIFY ?auto_468606 ?auto_468607 ?auto_468608 ?auto_468610 ?auto_468609 ?auto_468611 ?auto_468612 ?auto_468613 ?auto_468614 ?auto_468615 ?auto_468616 ?auto_468617 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_468715 - SURFACE
      ?auto_468716 - SURFACE
      ?auto_468717 - SURFACE
      ?auto_468719 - SURFACE
      ?auto_468718 - SURFACE
      ?auto_468720 - SURFACE
      ?auto_468721 - SURFACE
      ?auto_468722 - SURFACE
      ?auto_468723 - SURFACE
      ?auto_468724 - SURFACE
      ?auto_468725 - SURFACE
      ?auto_468726 - SURFACE
    )
    :vars
    (
      ?auto_468727 - HOIST
      ?auto_468729 - PLACE
      ?auto_468728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_468727 ?auto_468729 ) ( SURFACE-AT ?auto_468725 ?auto_468729 ) ( CLEAR ?auto_468725 ) ( IS-CRATE ?auto_468726 ) ( not ( = ?auto_468725 ?auto_468726 ) ) ( TRUCK-AT ?auto_468728 ?auto_468729 ) ( AVAILABLE ?auto_468727 ) ( IN ?auto_468726 ?auto_468728 ) ( ON ?auto_468725 ?auto_468724 ) ( not ( = ?auto_468724 ?auto_468725 ) ) ( not ( = ?auto_468724 ?auto_468726 ) ) ( ON ?auto_468716 ?auto_468715 ) ( ON ?auto_468717 ?auto_468716 ) ( ON ?auto_468719 ?auto_468717 ) ( ON ?auto_468718 ?auto_468719 ) ( ON ?auto_468720 ?auto_468718 ) ( ON ?auto_468721 ?auto_468720 ) ( ON ?auto_468722 ?auto_468721 ) ( ON ?auto_468723 ?auto_468722 ) ( ON ?auto_468724 ?auto_468723 ) ( not ( = ?auto_468715 ?auto_468716 ) ) ( not ( = ?auto_468715 ?auto_468717 ) ) ( not ( = ?auto_468715 ?auto_468719 ) ) ( not ( = ?auto_468715 ?auto_468718 ) ) ( not ( = ?auto_468715 ?auto_468720 ) ) ( not ( = ?auto_468715 ?auto_468721 ) ) ( not ( = ?auto_468715 ?auto_468722 ) ) ( not ( = ?auto_468715 ?auto_468723 ) ) ( not ( = ?auto_468715 ?auto_468724 ) ) ( not ( = ?auto_468715 ?auto_468725 ) ) ( not ( = ?auto_468715 ?auto_468726 ) ) ( not ( = ?auto_468716 ?auto_468717 ) ) ( not ( = ?auto_468716 ?auto_468719 ) ) ( not ( = ?auto_468716 ?auto_468718 ) ) ( not ( = ?auto_468716 ?auto_468720 ) ) ( not ( = ?auto_468716 ?auto_468721 ) ) ( not ( = ?auto_468716 ?auto_468722 ) ) ( not ( = ?auto_468716 ?auto_468723 ) ) ( not ( = ?auto_468716 ?auto_468724 ) ) ( not ( = ?auto_468716 ?auto_468725 ) ) ( not ( = ?auto_468716 ?auto_468726 ) ) ( not ( = ?auto_468717 ?auto_468719 ) ) ( not ( = ?auto_468717 ?auto_468718 ) ) ( not ( = ?auto_468717 ?auto_468720 ) ) ( not ( = ?auto_468717 ?auto_468721 ) ) ( not ( = ?auto_468717 ?auto_468722 ) ) ( not ( = ?auto_468717 ?auto_468723 ) ) ( not ( = ?auto_468717 ?auto_468724 ) ) ( not ( = ?auto_468717 ?auto_468725 ) ) ( not ( = ?auto_468717 ?auto_468726 ) ) ( not ( = ?auto_468719 ?auto_468718 ) ) ( not ( = ?auto_468719 ?auto_468720 ) ) ( not ( = ?auto_468719 ?auto_468721 ) ) ( not ( = ?auto_468719 ?auto_468722 ) ) ( not ( = ?auto_468719 ?auto_468723 ) ) ( not ( = ?auto_468719 ?auto_468724 ) ) ( not ( = ?auto_468719 ?auto_468725 ) ) ( not ( = ?auto_468719 ?auto_468726 ) ) ( not ( = ?auto_468718 ?auto_468720 ) ) ( not ( = ?auto_468718 ?auto_468721 ) ) ( not ( = ?auto_468718 ?auto_468722 ) ) ( not ( = ?auto_468718 ?auto_468723 ) ) ( not ( = ?auto_468718 ?auto_468724 ) ) ( not ( = ?auto_468718 ?auto_468725 ) ) ( not ( = ?auto_468718 ?auto_468726 ) ) ( not ( = ?auto_468720 ?auto_468721 ) ) ( not ( = ?auto_468720 ?auto_468722 ) ) ( not ( = ?auto_468720 ?auto_468723 ) ) ( not ( = ?auto_468720 ?auto_468724 ) ) ( not ( = ?auto_468720 ?auto_468725 ) ) ( not ( = ?auto_468720 ?auto_468726 ) ) ( not ( = ?auto_468721 ?auto_468722 ) ) ( not ( = ?auto_468721 ?auto_468723 ) ) ( not ( = ?auto_468721 ?auto_468724 ) ) ( not ( = ?auto_468721 ?auto_468725 ) ) ( not ( = ?auto_468721 ?auto_468726 ) ) ( not ( = ?auto_468722 ?auto_468723 ) ) ( not ( = ?auto_468722 ?auto_468724 ) ) ( not ( = ?auto_468722 ?auto_468725 ) ) ( not ( = ?auto_468722 ?auto_468726 ) ) ( not ( = ?auto_468723 ?auto_468724 ) ) ( not ( = ?auto_468723 ?auto_468725 ) ) ( not ( = ?auto_468723 ?auto_468726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_468724 ?auto_468725 ?auto_468726 )
      ( MAKE-11CRATE-VERIFY ?auto_468715 ?auto_468716 ?auto_468717 ?auto_468719 ?auto_468718 ?auto_468720 ?auto_468721 ?auto_468722 ?auto_468723 ?auto_468724 ?auto_468725 ?auto_468726 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_468836 - SURFACE
      ?auto_468837 - SURFACE
      ?auto_468838 - SURFACE
      ?auto_468840 - SURFACE
      ?auto_468839 - SURFACE
      ?auto_468841 - SURFACE
      ?auto_468842 - SURFACE
      ?auto_468843 - SURFACE
      ?auto_468844 - SURFACE
      ?auto_468845 - SURFACE
      ?auto_468846 - SURFACE
      ?auto_468847 - SURFACE
    )
    :vars
    (
      ?auto_468851 - HOIST
      ?auto_468850 - PLACE
      ?auto_468849 - TRUCK
      ?auto_468848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_468851 ?auto_468850 ) ( SURFACE-AT ?auto_468846 ?auto_468850 ) ( CLEAR ?auto_468846 ) ( IS-CRATE ?auto_468847 ) ( not ( = ?auto_468846 ?auto_468847 ) ) ( AVAILABLE ?auto_468851 ) ( IN ?auto_468847 ?auto_468849 ) ( ON ?auto_468846 ?auto_468845 ) ( not ( = ?auto_468845 ?auto_468846 ) ) ( not ( = ?auto_468845 ?auto_468847 ) ) ( TRUCK-AT ?auto_468849 ?auto_468848 ) ( not ( = ?auto_468848 ?auto_468850 ) ) ( ON ?auto_468837 ?auto_468836 ) ( ON ?auto_468838 ?auto_468837 ) ( ON ?auto_468840 ?auto_468838 ) ( ON ?auto_468839 ?auto_468840 ) ( ON ?auto_468841 ?auto_468839 ) ( ON ?auto_468842 ?auto_468841 ) ( ON ?auto_468843 ?auto_468842 ) ( ON ?auto_468844 ?auto_468843 ) ( ON ?auto_468845 ?auto_468844 ) ( not ( = ?auto_468836 ?auto_468837 ) ) ( not ( = ?auto_468836 ?auto_468838 ) ) ( not ( = ?auto_468836 ?auto_468840 ) ) ( not ( = ?auto_468836 ?auto_468839 ) ) ( not ( = ?auto_468836 ?auto_468841 ) ) ( not ( = ?auto_468836 ?auto_468842 ) ) ( not ( = ?auto_468836 ?auto_468843 ) ) ( not ( = ?auto_468836 ?auto_468844 ) ) ( not ( = ?auto_468836 ?auto_468845 ) ) ( not ( = ?auto_468836 ?auto_468846 ) ) ( not ( = ?auto_468836 ?auto_468847 ) ) ( not ( = ?auto_468837 ?auto_468838 ) ) ( not ( = ?auto_468837 ?auto_468840 ) ) ( not ( = ?auto_468837 ?auto_468839 ) ) ( not ( = ?auto_468837 ?auto_468841 ) ) ( not ( = ?auto_468837 ?auto_468842 ) ) ( not ( = ?auto_468837 ?auto_468843 ) ) ( not ( = ?auto_468837 ?auto_468844 ) ) ( not ( = ?auto_468837 ?auto_468845 ) ) ( not ( = ?auto_468837 ?auto_468846 ) ) ( not ( = ?auto_468837 ?auto_468847 ) ) ( not ( = ?auto_468838 ?auto_468840 ) ) ( not ( = ?auto_468838 ?auto_468839 ) ) ( not ( = ?auto_468838 ?auto_468841 ) ) ( not ( = ?auto_468838 ?auto_468842 ) ) ( not ( = ?auto_468838 ?auto_468843 ) ) ( not ( = ?auto_468838 ?auto_468844 ) ) ( not ( = ?auto_468838 ?auto_468845 ) ) ( not ( = ?auto_468838 ?auto_468846 ) ) ( not ( = ?auto_468838 ?auto_468847 ) ) ( not ( = ?auto_468840 ?auto_468839 ) ) ( not ( = ?auto_468840 ?auto_468841 ) ) ( not ( = ?auto_468840 ?auto_468842 ) ) ( not ( = ?auto_468840 ?auto_468843 ) ) ( not ( = ?auto_468840 ?auto_468844 ) ) ( not ( = ?auto_468840 ?auto_468845 ) ) ( not ( = ?auto_468840 ?auto_468846 ) ) ( not ( = ?auto_468840 ?auto_468847 ) ) ( not ( = ?auto_468839 ?auto_468841 ) ) ( not ( = ?auto_468839 ?auto_468842 ) ) ( not ( = ?auto_468839 ?auto_468843 ) ) ( not ( = ?auto_468839 ?auto_468844 ) ) ( not ( = ?auto_468839 ?auto_468845 ) ) ( not ( = ?auto_468839 ?auto_468846 ) ) ( not ( = ?auto_468839 ?auto_468847 ) ) ( not ( = ?auto_468841 ?auto_468842 ) ) ( not ( = ?auto_468841 ?auto_468843 ) ) ( not ( = ?auto_468841 ?auto_468844 ) ) ( not ( = ?auto_468841 ?auto_468845 ) ) ( not ( = ?auto_468841 ?auto_468846 ) ) ( not ( = ?auto_468841 ?auto_468847 ) ) ( not ( = ?auto_468842 ?auto_468843 ) ) ( not ( = ?auto_468842 ?auto_468844 ) ) ( not ( = ?auto_468842 ?auto_468845 ) ) ( not ( = ?auto_468842 ?auto_468846 ) ) ( not ( = ?auto_468842 ?auto_468847 ) ) ( not ( = ?auto_468843 ?auto_468844 ) ) ( not ( = ?auto_468843 ?auto_468845 ) ) ( not ( = ?auto_468843 ?auto_468846 ) ) ( not ( = ?auto_468843 ?auto_468847 ) ) ( not ( = ?auto_468844 ?auto_468845 ) ) ( not ( = ?auto_468844 ?auto_468846 ) ) ( not ( = ?auto_468844 ?auto_468847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_468845 ?auto_468846 ?auto_468847 )
      ( MAKE-11CRATE-VERIFY ?auto_468836 ?auto_468837 ?auto_468838 ?auto_468840 ?auto_468839 ?auto_468841 ?auto_468842 ?auto_468843 ?auto_468844 ?auto_468845 ?auto_468846 ?auto_468847 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_468968 - SURFACE
      ?auto_468969 - SURFACE
      ?auto_468970 - SURFACE
      ?auto_468972 - SURFACE
      ?auto_468971 - SURFACE
      ?auto_468973 - SURFACE
      ?auto_468974 - SURFACE
      ?auto_468975 - SURFACE
      ?auto_468976 - SURFACE
      ?auto_468977 - SURFACE
      ?auto_468978 - SURFACE
      ?auto_468979 - SURFACE
    )
    :vars
    (
      ?auto_468980 - HOIST
      ?auto_468982 - PLACE
      ?auto_468983 - TRUCK
      ?auto_468984 - PLACE
      ?auto_468981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_468980 ?auto_468982 ) ( SURFACE-AT ?auto_468978 ?auto_468982 ) ( CLEAR ?auto_468978 ) ( IS-CRATE ?auto_468979 ) ( not ( = ?auto_468978 ?auto_468979 ) ) ( AVAILABLE ?auto_468980 ) ( ON ?auto_468978 ?auto_468977 ) ( not ( = ?auto_468977 ?auto_468978 ) ) ( not ( = ?auto_468977 ?auto_468979 ) ) ( TRUCK-AT ?auto_468983 ?auto_468984 ) ( not ( = ?auto_468984 ?auto_468982 ) ) ( HOIST-AT ?auto_468981 ?auto_468984 ) ( LIFTING ?auto_468981 ?auto_468979 ) ( not ( = ?auto_468980 ?auto_468981 ) ) ( ON ?auto_468969 ?auto_468968 ) ( ON ?auto_468970 ?auto_468969 ) ( ON ?auto_468972 ?auto_468970 ) ( ON ?auto_468971 ?auto_468972 ) ( ON ?auto_468973 ?auto_468971 ) ( ON ?auto_468974 ?auto_468973 ) ( ON ?auto_468975 ?auto_468974 ) ( ON ?auto_468976 ?auto_468975 ) ( ON ?auto_468977 ?auto_468976 ) ( not ( = ?auto_468968 ?auto_468969 ) ) ( not ( = ?auto_468968 ?auto_468970 ) ) ( not ( = ?auto_468968 ?auto_468972 ) ) ( not ( = ?auto_468968 ?auto_468971 ) ) ( not ( = ?auto_468968 ?auto_468973 ) ) ( not ( = ?auto_468968 ?auto_468974 ) ) ( not ( = ?auto_468968 ?auto_468975 ) ) ( not ( = ?auto_468968 ?auto_468976 ) ) ( not ( = ?auto_468968 ?auto_468977 ) ) ( not ( = ?auto_468968 ?auto_468978 ) ) ( not ( = ?auto_468968 ?auto_468979 ) ) ( not ( = ?auto_468969 ?auto_468970 ) ) ( not ( = ?auto_468969 ?auto_468972 ) ) ( not ( = ?auto_468969 ?auto_468971 ) ) ( not ( = ?auto_468969 ?auto_468973 ) ) ( not ( = ?auto_468969 ?auto_468974 ) ) ( not ( = ?auto_468969 ?auto_468975 ) ) ( not ( = ?auto_468969 ?auto_468976 ) ) ( not ( = ?auto_468969 ?auto_468977 ) ) ( not ( = ?auto_468969 ?auto_468978 ) ) ( not ( = ?auto_468969 ?auto_468979 ) ) ( not ( = ?auto_468970 ?auto_468972 ) ) ( not ( = ?auto_468970 ?auto_468971 ) ) ( not ( = ?auto_468970 ?auto_468973 ) ) ( not ( = ?auto_468970 ?auto_468974 ) ) ( not ( = ?auto_468970 ?auto_468975 ) ) ( not ( = ?auto_468970 ?auto_468976 ) ) ( not ( = ?auto_468970 ?auto_468977 ) ) ( not ( = ?auto_468970 ?auto_468978 ) ) ( not ( = ?auto_468970 ?auto_468979 ) ) ( not ( = ?auto_468972 ?auto_468971 ) ) ( not ( = ?auto_468972 ?auto_468973 ) ) ( not ( = ?auto_468972 ?auto_468974 ) ) ( not ( = ?auto_468972 ?auto_468975 ) ) ( not ( = ?auto_468972 ?auto_468976 ) ) ( not ( = ?auto_468972 ?auto_468977 ) ) ( not ( = ?auto_468972 ?auto_468978 ) ) ( not ( = ?auto_468972 ?auto_468979 ) ) ( not ( = ?auto_468971 ?auto_468973 ) ) ( not ( = ?auto_468971 ?auto_468974 ) ) ( not ( = ?auto_468971 ?auto_468975 ) ) ( not ( = ?auto_468971 ?auto_468976 ) ) ( not ( = ?auto_468971 ?auto_468977 ) ) ( not ( = ?auto_468971 ?auto_468978 ) ) ( not ( = ?auto_468971 ?auto_468979 ) ) ( not ( = ?auto_468973 ?auto_468974 ) ) ( not ( = ?auto_468973 ?auto_468975 ) ) ( not ( = ?auto_468973 ?auto_468976 ) ) ( not ( = ?auto_468973 ?auto_468977 ) ) ( not ( = ?auto_468973 ?auto_468978 ) ) ( not ( = ?auto_468973 ?auto_468979 ) ) ( not ( = ?auto_468974 ?auto_468975 ) ) ( not ( = ?auto_468974 ?auto_468976 ) ) ( not ( = ?auto_468974 ?auto_468977 ) ) ( not ( = ?auto_468974 ?auto_468978 ) ) ( not ( = ?auto_468974 ?auto_468979 ) ) ( not ( = ?auto_468975 ?auto_468976 ) ) ( not ( = ?auto_468975 ?auto_468977 ) ) ( not ( = ?auto_468975 ?auto_468978 ) ) ( not ( = ?auto_468975 ?auto_468979 ) ) ( not ( = ?auto_468976 ?auto_468977 ) ) ( not ( = ?auto_468976 ?auto_468978 ) ) ( not ( = ?auto_468976 ?auto_468979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_468977 ?auto_468978 ?auto_468979 )
      ( MAKE-11CRATE-VERIFY ?auto_468968 ?auto_468969 ?auto_468970 ?auto_468972 ?auto_468971 ?auto_468973 ?auto_468974 ?auto_468975 ?auto_468976 ?auto_468977 ?auto_468978 ?auto_468979 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469111 - SURFACE
      ?auto_469112 - SURFACE
      ?auto_469113 - SURFACE
      ?auto_469115 - SURFACE
      ?auto_469114 - SURFACE
      ?auto_469116 - SURFACE
      ?auto_469117 - SURFACE
      ?auto_469118 - SURFACE
      ?auto_469119 - SURFACE
      ?auto_469120 - SURFACE
      ?auto_469121 - SURFACE
      ?auto_469122 - SURFACE
    )
    :vars
    (
      ?auto_469128 - HOIST
      ?auto_469125 - PLACE
      ?auto_469126 - TRUCK
      ?auto_469127 - PLACE
      ?auto_469123 - HOIST
      ?auto_469124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_469128 ?auto_469125 ) ( SURFACE-AT ?auto_469121 ?auto_469125 ) ( CLEAR ?auto_469121 ) ( IS-CRATE ?auto_469122 ) ( not ( = ?auto_469121 ?auto_469122 ) ) ( AVAILABLE ?auto_469128 ) ( ON ?auto_469121 ?auto_469120 ) ( not ( = ?auto_469120 ?auto_469121 ) ) ( not ( = ?auto_469120 ?auto_469122 ) ) ( TRUCK-AT ?auto_469126 ?auto_469127 ) ( not ( = ?auto_469127 ?auto_469125 ) ) ( HOIST-AT ?auto_469123 ?auto_469127 ) ( not ( = ?auto_469128 ?auto_469123 ) ) ( AVAILABLE ?auto_469123 ) ( SURFACE-AT ?auto_469122 ?auto_469127 ) ( ON ?auto_469122 ?auto_469124 ) ( CLEAR ?auto_469122 ) ( not ( = ?auto_469121 ?auto_469124 ) ) ( not ( = ?auto_469122 ?auto_469124 ) ) ( not ( = ?auto_469120 ?auto_469124 ) ) ( ON ?auto_469112 ?auto_469111 ) ( ON ?auto_469113 ?auto_469112 ) ( ON ?auto_469115 ?auto_469113 ) ( ON ?auto_469114 ?auto_469115 ) ( ON ?auto_469116 ?auto_469114 ) ( ON ?auto_469117 ?auto_469116 ) ( ON ?auto_469118 ?auto_469117 ) ( ON ?auto_469119 ?auto_469118 ) ( ON ?auto_469120 ?auto_469119 ) ( not ( = ?auto_469111 ?auto_469112 ) ) ( not ( = ?auto_469111 ?auto_469113 ) ) ( not ( = ?auto_469111 ?auto_469115 ) ) ( not ( = ?auto_469111 ?auto_469114 ) ) ( not ( = ?auto_469111 ?auto_469116 ) ) ( not ( = ?auto_469111 ?auto_469117 ) ) ( not ( = ?auto_469111 ?auto_469118 ) ) ( not ( = ?auto_469111 ?auto_469119 ) ) ( not ( = ?auto_469111 ?auto_469120 ) ) ( not ( = ?auto_469111 ?auto_469121 ) ) ( not ( = ?auto_469111 ?auto_469122 ) ) ( not ( = ?auto_469111 ?auto_469124 ) ) ( not ( = ?auto_469112 ?auto_469113 ) ) ( not ( = ?auto_469112 ?auto_469115 ) ) ( not ( = ?auto_469112 ?auto_469114 ) ) ( not ( = ?auto_469112 ?auto_469116 ) ) ( not ( = ?auto_469112 ?auto_469117 ) ) ( not ( = ?auto_469112 ?auto_469118 ) ) ( not ( = ?auto_469112 ?auto_469119 ) ) ( not ( = ?auto_469112 ?auto_469120 ) ) ( not ( = ?auto_469112 ?auto_469121 ) ) ( not ( = ?auto_469112 ?auto_469122 ) ) ( not ( = ?auto_469112 ?auto_469124 ) ) ( not ( = ?auto_469113 ?auto_469115 ) ) ( not ( = ?auto_469113 ?auto_469114 ) ) ( not ( = ?auto_469113 ?auto_469116 ) ) ( not ( = ?auto_469113 ?auto_469117 ) ) ( not ( = ?auto_469113 ?auto_469118 ) ) ( not ( = ?auto_469113 ?auto_469119 ) ) ( not ( = ?auto_469113 ?auto_469120 ) ) ( not ( = ?auto_469113 ?auto_469121 ) ) ( not ( = ?auto_469113 ?auto_469122 ) ) ( not ( = ?auto_469113 ?auto_469124 ) ) ( not ( = ?auto_469115 ?auto_469114 ) ) ( not ( = ?auto_469115 ?auto_469116 ) ) ( not ( = ?auto_469115 ?auto_469117 ) ) ( not ( = ?auto_469115 ?auto_469118 ) ) ( not ( = ?auto_469115 ?auto_469119 ) ) ( not ( = ?auto_469115 ?auto_469120 ) ) ( not ( = ?auto_469115 ?auto_469121 ) ) ( not ( = ?auto_469115 ?auto_469122 ) ) ( not ( = ?auto_469115 ?auto_469124 ) ) ( not ( = ?auto_469114 ?auto_469116 ) ) ( not ( = ?auto_469114 ?auto_469117 ) ) ( not ( = ?auto_469114 ?auto_469118 ) ) ( not ( = ?auto_469114 ?auto_469119 ) ) ( not ( = ?auto_469114 ?auto_469120 ) ) ( not ( = ?auto_469114 ?auto_469121 ) ) ( not ( = ?auto_469114 ?auto_469122 ) ) ( not ( = ?auto_469114 ?auto_469124 ) ) ( not ( = ?auto_469116 ?auto_469117 ) ) ( not ( = ?auto_469116 ?auto_469118 ) ) ( not ( = ?auto_469116 ?auto_469119 ) ) ( not ( = ?auto_469116 ?auto_469120 ) ) ( not ( = ?auto_469116 ?auto_469121 ) ) ( not ( = ?auto_469116 ?auto_469122 ) ) ( not ( = ?auto_469116 ?auto_469124 ) ) ( not ( = ?auto_469117 ?auto_469118 ) ) ( not ( = ?auto_469117 ?auto_469119 ) ) ( not ( = ?auto_469117 ?auto_469120 ) ) ( not ( = ?auto_469117 ?auto_469121 ) ) ( not ( = ?auto_469117 ?auto_469122 ) ) ( not ( = ?auto_469117 ?auto_469124 ) ) ( not ( = ?auto_469118 ?auto_469119 ) ) ( not ( = ?auto_469118 ?auto_469120 ) ) ( not ( = ?auto_469118 ?auto_469121 ) ) ( not ( = ?auto_469118 ?auto_469122 ) ) ( not ( = ?auto_469118 ?auto_469124 ) ) ( not ( = ?auto_469119 ?auto_469120 ) ) ( not ( = ?auto_469119 ?auto_469121 ) ) ( not ( = ?auto_469119 ?auto_469122 ) ) ( not ( = ?auto_469119 ?auto_469124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469120 ?auto_469121 ?auto_469122 )
      ( MAKE-11CRATE-VERIFY ?auto_469111 ?auto_469112 ?auto_469113 ?auto_469115 ?auto_469114 ?auto_469116 ?auto_469117 ?auto_469118 ?auto_469119 ?auto_469120 ?auto_469121 ?auto_469122 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469255 - SURFACE
      ?auto_469256 - SURFACE
      ?auto_469257 - SURFACE
      ?auto_469259 - SURFACE
      ?auto_469258 - SURFACE
      ?auto_469260 - SURFACE
      ?auto_469261 - SURFACE
      ?auto_469262 - SURFACE
      ?auto_469263 - SURFACE
      ?auto_469264 - SURFACE
      ?auto_469265 - SURFACE
      ?auto_469266 - SURFACE
    )
    :vars
    (
      ?auto_469268 - HOIST
      ?auto_469272 - PLACE
      ?auto_469269 - PLACE
      ?auto_469267 - HOIST
      ?auto_469271 - SURFACE
      ?auto_469270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469268 ?auto_469272 ) ( SURFACE-AT ?auto_469265 ?auto_469272 ) ( CLEAR ?auto_469265 ) ( IS-CRATE ?auto_469266 ) ( not ( = ?auto_469265 ?auto_469266 ) ) ( AVAILABLE ?auto_469268 ) ( ON ?auto_469265 ?auto_469264 ) ( not ( = ?auto_469264 ?auto_469265 ) ) ( not ( = ?auto_469264 ?auto_469266 ) ) ( not ( = ?auto_469269 ?auto_469272 ) ) ( HOIST-AT ?auto_469267 ?auto_469269 ) ( not ( = ?auto_469268 ?auto_469267 ) ) ( AVAILABLE ?auto_469267 ) ( SURFACE-AT ?auto_469266 ?auto_469269 ) ( ON ?auto_469266 ?auto_469271 ) ( CLEAR ?auto_469266 ) ( not ( = ?auto_469265 ?auto_469271 ) ) ( not ( = ?auto_469266 ?auto_469271 ) ) ( not ( = ?auto_469264 ?auto_469271 ) ) ( TRUCK-AT ?auto_469270 ?auto_469272 ) ( ON ?auto_469256 ?auto_469255 ) ( ON ?auto_469257 ?auto_469256 ) ( ON ?auto_469259 ?auto_469257 ) ( ON ?auto_469258 ?auto_469259 ) ( ON ?auto_469260 ?auto_469258 ) ( ON ?auto_469261 ?auto_469260 ) ( ON ?auto_469262 ?auto_469261 ) ( ON ?auto_469263 ?auto_469262 ) ( ON ?auto_469264 ?auto_469263 ) ( not ( = ?auto_469255 ?auto_469256 ) ) ( not ( = ?auto_469255 ?auto_469257 ) ) ( not ( = ?auto_469255 ?auto_469259 ) ) ( not ( = ?auto_469255 ?auto_469258 ) ) ( not ( = ?auto_469255 ?auto_469260 ) ) ( not ( = ?auto_469255 ?auto_469261 ) ) ( not ( = ?auto_469255 ?auto_469262 ) ) ( not ( = ?auto_469255 ?auto_469263 ) ) ( not ( = ?auto_469255 ?auto_469264 ) ) ( not ( = ?auto_469255 ?auto_469265 ) ) ( not ( = ?auto_469255 ?auto_469266 ) ) ( not ( = ?auto_469255 ?auto_469271 ) ) ( not ( = ?auto_469256 ?auto_469257 ) ) ( not ( = ?auto_469256 ?auto_469259 ) ) ( not ( = ?auto_469256 ?auto_469258 ) ) ( not ( = ?auto_469256 ?auto_469260 ) ) ( not ( = ?auto_469256 ?auto_469261 ) ) ( not ( = ?auto_469256 ?auto_469262 ) ) ( not ( = ?auto_469256 ?auto_469263 ) ) ( not ( = ?auto_469256 ?auto_469264 ) ) ( not ( = ?auto_469256 ?auto_469265 ) ) ( not ( = ?auto_469256 ?auto_469266 ) ) ( not ( = ?auto_469256 ?auto_469271 ) ) ( not ( = ?auto_469257 ?auto_469259 ) ) ( not ( = ?auto_469257 ?auto_469258 ) ) ( not ( = ?auto_469257 ?auto_469260 ) ) ( not ( = ?auto_469257 ?auto_469261 ) ) ( not ( = ?auto_469257 ?auto_469262 ) ) ( not ( = ?auto_469257 ?auto_469263 ) ) ( not ( = ?auto_469257 ?auto_469264 ) ) ( not ( = ?auto_469257 ?auto_469265 ) ) ( not ( = ?auto_469257 ?auto_469266 ) ) ( not ( = ?auto_469257 ?auto_469271 ) ) ( not ( = ?auto_469259 ?auto_469258 ) ) ( not ( = ?auto_469259 ?auto_469260 ) ) ( not ( = ?auto_469259 ?auto_469261 ) ) ( not ( = ?auto_469259 ?auto_469262 ) ) ( not ( = ?auto_469259 ?auto_469263 ) ) ( not ( = ?auto_469259 ?auto_469264 ) ) ( not ( = ?auto_469259 ?auto_469265 ) ) ( not ( = ?auto_469259 ?auto_469266 ) ) ( not ( = ?auto_469259 ?auto_469271 ) ) ( not ( = ?auto_469258 ?auto_469260 ) ) ( not ( = ?auto_469258 ?auto_469261 ) ) ( not ( = ?auto_469258 ?auto_469262 ) ) ( not ( = ?auto_469258 ?auto_469263 ) ) ( not ( = ?auto_469258 ?auto_469264 ) ) ( not ( = ?auto_469258 ?auto_469265 ) ) ( not ( = ?auto_469258 ?auto_469266 ) ) ( not ( = ?auto_469258 ?auto_469271 ) ) ( not ( = ?auto_469260 ?auto_469261 ) ) ( not ( = ?auto_469260 ?auto_469262 ) ) ( not ( = ?auto_469260 ?auto_469263 ) ) ( not ( = ?auto_469260 ?auto_469264 ) ) ( not ( = ?auto_469260 ?auto_469265 ) ) ( not ( = ?auto_469260 ?auto_469266 ) ) ( not ( = ?auto_469260 ?auto_469271 ) ) ( not ( = ?auto_469261 ?auto_469262 ) ) ( not ( = ?auto_469261 ?auto_469263 ) ) ( not ( = ?auto_469261 ?auto_469264 ) ) ( not ( = ?auto_469261 ?auto_469265 ) ) ( not ( = ?auto_469261 ?auto_469266 ) ) ( not ( = ?auto_469261 ?auto_469271 ) ) ( not ( = ?auto_469262 ?auto_469263 ) ) ( not ( = ?auto_469262 ?auto_469264 ) ) ( not ( = ?auto_469262 ?auto_469265 ) ) ( not ( = ?auto_469262 ?auto_469266 ) ) ( not ( = ?auto_469262 ?auto_469271 ) ) ( not ( = ?auto_469263 ?auto_469264 ) ) ( not ( = ?auto_469263 ?auto_469265 ) ) ( not ( = ?auto_469263 ?auto_469266 ) ) ( not ( = ?auto_469263 ?auto_469271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469264 ?auto_469265 ?auto_469266 )
      ( MAKE-11CRATE-VERIFY ?auto_469255 ?auto_469256 ?auto_469257 ?auto_469259 ?auto_469258 ?auto_469260 ?auto_469261 ?auto_469262 ?auto_469263 ?auto_469264 ?auto_469265 ?auto_469266 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469399 - SURFACE
      ?auto_469400 - SURFACE
      ?auto_469401 - SURFACE
      ?auto_469403 - SURFACE
      ?auto_469402 - SURFACE
      ?auto_469404 - SURFACE
      ?auto_469405 - SURFACE
      ?auto_469406 - SURFACE
      ?auto_469407 - SURFACE
      ?auto_469408 - SURFACE
      ?auto_469409 - SURFACE
      ?auto_469410 - SURFACE
    )
    :vars
    (
      ?auto_469414 - HOIST
      ?auto_469415 - PLACE
      ?auto_469411 - PLACE
      ?auto_469412 - HOIST
      ?auto_469416 - SURFACE
      ?auto_469413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469414 ?auto_469415 ) ( IS-CRATE ?auto_469410 ) ( not ( = ?auto_469409 ?auto_469410 ) ) ( not ( = ?auto_469408 ?auto_469409 ) ) ( not ( = ?auto_469408 ?auto_469410 ) ) ( not ( = ?auto_469411 ?auto_469415 ) ) ( HOIST-AT ?auto_469412 ?auto_469411 ) ( not ( = ?auto_469414 ?auto_469412 ) ) ( AVAILABLE ?auto_469412 ) ( SURFACE-AT ?auto_469410 ?auto_469411 ) ( ON ?auto_469410 ?auto_469416 ) ( CLEAR ?auto_469410 ) ( not ( = ?auto_469409 ?auto_469416 ) ) ( not ( = ?auto_469410 ?auto_469416 ) ) ( not ( = ?auto_469408 ?auto_469416 ) ) ( TRUCK-AT ?auto_469413 ?auto_469415 ) ( SURFACE-AT ?auto_469408 ?auto_469415 ) ( CLEAR ?auto_469408 ) ( LIFTING ?auto_469414 ?auto_469409 ) ( IS-CRATE ?auto_469409 ) ( ON ?auto_469400 ?auto_469399 ) ( ON ?auto_469401 ?auto_469400 ) ( ON ?auto_469403 ?auto_469401 ) ( ON ?auto_469402 ?auto_469403 ) ( ON ?auto_469404 ?auto_469402 ) ( ON ?auto_469405 ?auto_469404 ) ( ON ?auto_469406 ?auto_469405 ) ( ON ?auto_469407 ?auto_469406 ) ( ON ?auto_469408 ?auto_469407 ) ( not ( = ?auto_469399 ?auto_469400 ) ) ( not ( = ?auto_469399 ?auto_469401 ) ) ( not ( = ?auto_469399 ?auto_469403 ) ) ( not ( = ?auto_469399 ?auto_469402 ) ) ( not ( = ?auto_469399 ?auto_469404 ) ) ( not ( = ?auto_469399 ?auto_469405 ) ) ( not ( = ?auto_469399 ?auto_469406 ) ) ( not ( = ?auto_469399 ?auto_469407 ) ) ( not ( = ?auto_469399 ?auto_469408 ) ) ( not ( = ?auto_469399 ?auto_469409 ) ) ( not ( = ?auto_469399 ?auto_469410 ) ) ( not ( = ?auto_469399 ?auto_469416 ) ) ( not ( = ?auto_469400 ?auto_469401 ) ) ( not ( = ?auto_469400 ?auto_469403 ) ) ( not ( = ?auto_469400 ?auto_469402 ) ) ( not ( = ?auto_469400 ?auto_469404 ) ) ( not ( = ?auto_469400 ?auto_469405 ) ) ( not ( = ?auto_469400 ?auto_469406 ) ) ( not ( = ?auto_469400 ?auto_469407 ) ) ( not ( = ?auto_469400 ?auto_469408 ) ) ( not ( = ?auto_469400 ?auto_469409 ) ) ( not ( = ?auto_469400 ?auto_469410 ) ) ( not ( = ?auto_469400 ?auto_469416 ) ) ( not ( = ?auto_469401 ?auto_469403 ) ) ( not ( = ?auto_469401 ?auto_469402 ) ) ( not ( = ?auto_469401 ?auto_469404 ) ) ( not ( = ?auto_469401 ?auto_469405 ) ) ( not ( = ?auto_469401 ?auto_469406 ) ) ( not ( = ?auto_469401 ?auto_469407 ) ) ( not ( = ?auto_469401 ?auto_469408 ) ) ( not ( = ?auto_469401 ?auto_469409 ) ) ( not ( = ?auto_469401 ?auto_469410 ) ) ( not ( = ?auto_469401 ?auto_469416 ) ) ( not ( = ?auto_469403 ?auto_469402 ) ) ( not ( = ?auto_469403 ?auto_469404 ) ) ( not ( = ?auto_469403 ?auto_469405 ) ) ( not ( = ?auto_469403 ?auto_469406 ) ) ( not ( = ?auto_469403 ?auto_469407 ) ) ( not ( = ?auto_469403 ?auto_469408 ) ) ( not ( = ?auto_469403 ?auto_469409 ) ) ( not ( = ?auto_469403 ?auto_469410 ) ) ( not ( = ?auto_469403 ?auto_469416 ) ) ( not ( = ?auto_469402 ?auto_469404 ) ) ( not ( = ?auto_469402 ?auto_469405 ) ) ( not ( = ?auto_469402 ?auto_469406 ) ) ( not ( = ?auto_469402 ?auto_469407 ) ) ( not ( = ?auto_469402 ?auto_469408 ) ) ( not ( = ?auto_469402 ?auto_469409 ) ) ( not ( = ?auto_469402 ?auto_469410 ) ) ( not ( = ?auto_469402 ?auto_469416 ) ) ( not ( = ?auto_469404 ?auto_469405 ) ) ( not ( = ?auto_469404 ?auto_469406 ) ) ( not ( = ?auto_469404 ?auto_469407 ) ) ( not ( = ?auto_469404 ?auto_469408 ) ) ( not ( = ?auto_469404 ?auto_469409 ) ) ( not ( = ?auto_469404 ?auto_469410 ) ) ( not ( = ?auto_469404 ?auto_469416 ) ) ( not ( = ?auto_469405 ?auto_469406 ) ) ( not ( = ?auto_469405 ?auto_469407 ) ) ( not ( = ?auto_469405 ?auto_469408 ) ) ( not ( = ?auto_469405 ?auto_469409 ) ) ( not ( = ?auto_469405 ?auto_469410 ) ) ( not ( = ?auto_469405 ?auto_469416 ) ) ( not ( = ?auto_469406 ?auto_469407 ) ) ( not ( = ?auto_469406 ?auto_469408 ) ) ( not ( = ?auto_469406 ?auto_469409 ) ) ( not ( = ?auto_469406 ?auto_469410 ) ) ( not ( = ?auto_469406 ?auto_469416 ) ) ( not ( = ?auto_469407 ?auto_469408 ) ) ( not ( = ?auto_469407 ?auto_469409 ) ) ( not ( = ?auto_469407 ?auto_469410 ) ) ( not ( = ?auto_469407 ?auto_469416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469408 ?auto_469409 ?auto_469410 )
      ( MAKE-11CRATE-VERIFY ?auto_469399 ?auto_469400 ?auto_469401 ?auto_469403 ?auto_469402 ?auto_469404 ?auto_469405 ?auto_469406 ?auto_469407 ?auto_469408 ?auto_469409 ?auto_469410 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_469543 - SURFACE
      ?auto_469544 - SURFACE
      ?auto_469545 - SURFACE
      ?auto_469547 - SURFACE
      ?auto_469546 - SURFACE
      ?auto_469548 - SURFACE
      ?auto_469549 - SURFACE
      ?auto_469550 - SURFACE
      ?auto_469551 - SURFACE
      ?auto_469552 - SURFACE
      ?auto_469553 - SURFACE
      ?auto_469554 - SURFACE
    )
    :vars
    (
      ?auto_469555 - HOIST
      ?auto_469559 - PLACE
      ?auto_469556 - PLACE
      ?auto_469560 - HOIST
      ?auto_469558 - SURFACE
      ?auto_469557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_469555 ?auto_469559 ) ( IS-CRATE ?auto_469554 ) ( not ( = ?auto_469553 ?auto_469554 ) ) ( not ( = ?auto_469552 ?auto_469553 ) ) ( not ( = ?auto_469552 ?auto_469554 ) ) ( not ( = ?auto_469556 ?auto_469559 ) ) ( HOIST-AT ?auto_469560 ?auto_469556 ) ( not ( = ?auto_469555 ?auto_469560 ) ) ( AVAILABLE ?auto_469560 ) ( SURFACE-AT ?auto_469554 ?auto_469556 ) ( ON ?auto_469554 ?auto_469558 ) ( CLEAR ?auto_469554 ) ( not ( = ?auto_469553 ?auto_469558 ) ) ( not ( = ?auto_469554 ?auto_469558 ) ) ( not ( = ?auto_469552 ?auto_469558 ) ) ( TRUCK-AT ?auto_469557 ?auto_469559 ) ( SURFACE-AT ?auto_469552 ?auto_469559 ) ( CLEAR ?auto_469552 ) ( IS-CRATE ?auto_469553 ) ( AVAILABLE ?auto_469555 ) ( IN ?auto_469553 ?auto_469557 ) ( ON ?auto_469544 ?auto_469543 ) ( ON ?auto_469545 ?auto_469544 ) ( ON ?auto_469547 ?auto_469545 ) ( ON ?auto_469546 ?auto_469547 ) ( ON ?auto_469548 ?auto_469546 ) ( ON ?auto_469549 ?auto_469548 ) ( ON ?auto_469550 ?auto_469549 ) ( ON ?auto_469551 ?auto_469550 ) ( ON ?auto_469552 ?auto_469551 ) ( not ( = ?auto_469543 ?auto_469544 ) ) ( not ( = ?auto_469543 ?auto_469545 ) ) ( not ( = ?auto_469543 ?auto_469547 ) ) ( not ( = ?auto_469543 ?auto_469546 ) ) ( not ( = ?auto_469543 ?auto_469548 ) ) ( not ( = ?auto_469543 ?auto_469549 ) ) ( not ( = ?auto_469543 ?auto_469550 ) ) ( not ( = ?auto_469543 ?auto_469551 ) ) ( not ( = ?auto_469543 ?auto_469552 ) ) ( not ( = ?auto_469543 ?auto_469553 ) ) ( not ( = ?auto_469543 ?auto_469554 ) ) ( not ( = ?auto_469543 ?auto_469558 ) ) ( not ( = ?auto_469544 ?auto_469545 ) ) ( not ( = ?auto_469544 ?auto_469547 ) ) ( not ( = ?auto_469544 ?auto_469546 ) ) ( not ( = ?auto_469544 ?auto_469548 ) ) ( not ( = ?auto_469544 ?auto_469549 ) ) ( not ( = ?auto_469544 ?auto_469550 ) ) ( not ( = ?auto_469544 ?auto_469551 ) ) ( not ( = ?auto_469544 ?auto_469552 ) ) ( not ( = ?auto_469544 ?auto_469553 ) ) ( not ( = ?auto_469544 ?auto_469554 ) ) ( not ( = ?auto_469544 ?auto_469558 ) ) ( not ( = ?auto_469545 ?auto_469547 ) ) ( not ( = ?auto_469545 ?auto_469546 ) ) ( not ( = ?auto_469545 ?auto_469548 ) ) ( not ( = ?auto_469545 ?auto_469549 ) ) ( not ( = ?auto_469545 ?auto_469550 ) ) ( not ( = ?auto_469545 ?auto_469551 ) ) ( not ( = ?auto_469545 ?auto_469552 ) ) ( not ( = ?auto_469545 ?auto_469553 ) ) ( not ( = ?auto_469545 ?auto_469554 ) ) ( not ( = ?auto_469545 ?auto_469558 ) ) ( not ( = ?auto_469547 ?auto_469546 ) ) ( not ( = ?auto_469547 ?auto_469548 ) ) ( not ( = ?auto_469547 ?auto_469549 ) ) ( not ( = ?auto_469547 ?auto_469550 ) ) ( not ( = ?auto_469547 ?auto_469551 ) ) ( not ( = ?auto_469547 ?auto_469552 ) ) ( not ( = ?auto_469547 ?auto_469553 ) ) ( not ( = ?auto_469547 ?auto_469554 ) ) ( not ( = ?auto_469547 ?auto_469558 ) ) ( not ( = ?auto_469546 ?auto_469548 ) ) ( not ( = ?auto_469546 ?auto_469549 ) ) ( not ( = ?auto_469546 ?auto_469550 ) ) ( not ( = ?auto_469546 ?auto_469551 ) ) ( not ( = ?auto_469546 ?auto_469552 ) ) ( not ( = ?auto_469546 ?auto_469553 ) ) ( not ( = ?auto_469546 ?auto_469554 ) ) ( not ( = ?auto_469546 ?auto_469558 ) ) ( not ( = ?auto_469548 ?auto_469549 ) ) ( not ( = ?auto_469548 ?auto_469550 ) ) ( not ( = ?auto_469548 ?auto_469551 ) ) ( not ( = ?auto_469548 ?auto_469552 ) ) ( not ( = ?auto_469548 ?auto_469553 ) ) ( not ( = ?auto_469548 ?auto_469554 ) ) ( not ( = ?auto_469548 ?auto_469558 ) ) ( not ( = ?auto_469549 ?auto_469550 ) ) ( not ( = ?auto_469549 ?auto_469551 ) ) ( not ( = ?auto_469549 ?auto_469552 ) ) ( not ( = ?auto_469549 ?auto_469553 ) ) ( not ( = ?auto_469549 ?auto_469554 ) ) ( not ( = ?auto_469549 ?auto_469558 ) ) ( not ( = ?auto_469550 ?auto_469551 ) ) ( not ( = ?auto_469550 ?auto_469552 ) ) ( not ( = ?auto_469550 ?auto_469553 ) ) ( not ( = ?auto_469550 ?auto_469554 ) ) ( not ( = ?auto_469550 ?auto_469558 ) ) ( not ( = ?auto_469551 ?auto_469552 ) ) ( not ( = ?auto_469551 ?auto_469553 ) ) ( not ( = ?auto_469551 ?auto_469554 ) ) ( not ( = ?auto_469551 ?auto_469558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_469552 ?auto_469553 ?auto_469554 )
      ( MAKE-11CRATE-VERIFY ?auto_469543 ?auto_469544 ?auto_469545 ?auto_469547 ?auto_469546 ?auto_469548 ?auto_469549 ?auto_469550 ?auto_469551 ?auto_469552 ?auto_469553 ?auto_469554 ) )
  )

)

