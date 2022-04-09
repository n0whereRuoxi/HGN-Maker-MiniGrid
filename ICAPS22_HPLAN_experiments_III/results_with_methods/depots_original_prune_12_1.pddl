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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642750 - SURFACE
      ?auto_642751 - SURFACE
    )
    :vars
    (
      ?auto_642752 - HOIST
      ?auto_642753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642752 ?auto_642753 ) ( SURFACE-AT ?auto_642750 ?auto_642753 ) ( CLEAR ?auto_642750 ) ( LIFTING ?auto_642752 ?auto_642751 ) ( IS-CRATE ?auto_642751 ) ( not ( = ?auto_642750 ?auto_642751 ) ) )
    :subtasks
    ( ( !DROP ?auto_642752 ?auto_642751 ?auto_642750 ?auto_642753 )
      ( MAKE-1CRATE-VERIFY ?auto_642750 ?auto_642751 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642754 - SURFACE
      ?auto_642755 - SURFACE
    )
    :vars
    (
      ?auto_642756 - HOIST
      ?auto_642757 - PLACE
      ?auto_642758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642756 ?auto_642757 ) ( SURFACE-AT ?auto_642754 ?auto_642757 ) ( CLEAR ?auto_642754 ) ( IS-CRATE ?auto_642755 ) ( not ( = ?auto_642754 ?auto_642755 ) ) ( TRUCK-AT ?auto_642758 ?auto_642757 ) ( AVAILABLE ?auto_642756 ) ( IN ?auto_642755 ?auto_642758 ) )
    :subtasks
    ( ( !UNLOAD ?auto_642756 ?auto_642755 ?auto_642758 ?auto_642757 )
      ( MAKE-1CRATE ?auto_642754 ?auto_642755 )
      ( MAKE-1CRATE-VERIFY ?auto_642754 ?auto_642755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642759 - SURFACE
      ?auto_642760 - SURFACE
    )
    :vars
    (
      ?auto_642763 - HOIST
      ?auto_642761 - PLACE
      ?auto_642762 - TRUCK
      ?auto_642764 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642763 ?auto_642761 ) ( SURFACE-AT ?auto_642759 ?auto_642761 ) ( CLEAR ?auto_642759 ) ( IS-CRATE ?auto_642760 ) ( not ( = ?auto_642759 ?auto_642760 ) ) ( AVAILABLE ?auto_642763 ) ( IN ?auto_642760 ?auto_642762 ) ( TRUCK-AT ?auto_642762 ?auto_642764 ) ( not ( = ?auto_642764 ?auto_642761 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_642762 ?auto_642764 ?auto_642761 )
      ( MAKE-1CRATE ?auto_642759 ?auto_642760 )
      ( MAKE-1CRATE-VERIFY ?auto_642759 ?auto_642760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642765 - SURFACE
      ?auto_642766 - SURFACE
    )
    :vars
    (
      ?auto_642767 - HOIST
      ?auto_642769 - PLACE
      ?auto_642768 - TRUCK
      ?auto_642770 - PLACE
      ?auto_642771 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_642767 ?auto_642769 ) ( SURFACE-AT ?auto_642765 ?auto_642769 ) ( CLEAR ?auto_642765 ) ( IS-CRATE ?auto_642766 ) ( not ( = ?auto_642765 ?auto_642766 ) ) ( AVAILABLE ?auto_642767 ) ( TRUCK-AT ?auto_642768 ?auto_642770 ) ( not ( = ?auto_642770 ?auto_642769 ) ) ( HOIST-AT ?auto_642771 ?auto_642770 ) ( LIFTING ?auto_642771 ?auto_642766 ) ( not ( = ?auto_642767 ?auto_642771 ) ) )
    :subtasks
    ( ( !LOAD ?auto_642771 ?auto_642766 ?auto_642768 ?auto_642770 )
      ( MAKE-1CRATE ?auto_642765 ?auto_642766 )
      ( MAKE-1CRATE-VERIFY ?auto_642765 ?auto_642766 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642772 - SURFACE
      ?auto_642773 - SURFACE
    )
    :vars
    (
      ?auto_642778 - HOIST
      ?auto_642776 - PLACE
      ?auto_642774 - TRUCK
      ?auto_642775 - PLACE
      ?auto_642777 - HOIST
      ?auto_642779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642778 ?auto_642776 ) ( SURFACE-AT ?auto_642772 ?auto_642776 ) ( CLEAR ?auto_642772 ) ( IS-CRATE ?auto_642773 ) ( not ( = ?auto_642772 ?auto_642773 ) ) ( AVAILABLE ?auto_642778 ) ( TRUCK-AT ?auto_642774 ?auto_642775 ) ( not ( = ?auto_642775 ?auto_642776 ) ) ( HOIST-AT ?auto_642777 ?auto_642775 ) ( not ( = ?auto_642778 ?auto_642777 ) ) ( AVAILABLE ?auto_642777 ) ( SURFACE-AT ?auto_642773 ?auto_642775 ) ( ON ?auto_642773 ?auto_642779 ) ( CLEAR ?auto_642773 ) ( not ( = ?auto_642772 ?auto_642779 ) ) ( not ( = ?auto_642773 ?auto_642779 ) ) )
    :subtasks
    ( ( !LIFT ?auto_642777 ?auto_642773 ?auto_642779 ?auto_642775 )
      ( MAKE-1CRATE ?auto_642772 ?auto_642773 )
      ( MAKE-1CRATE-VERIFY ?auto_642772 ?auto_642773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642780 - SURFACE
      ?auto_642781 - SURFACE
    )
    :vars
    (
      ?auto_642782 - HOIST
      ?auto_642783 - PLACE
      ?auto_642787 - PLACE
      ?auto_642785 - HOIST
      ?auto_642784 - SURFACE
      ?auto_642786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642782 ?auto_642783 ) ( SURFACE-AT ?auto_642780 ?auto_642783 ) ( CLEAR ?auto_642780 ) ( IS-CRATE ?auto_642781 ) ( not ( = ?auto_642780 ?auto_642781 ) ) ( AVAILABLE ?auto_642782 ) ( not ( = ?auto_642787 ?auto_642783 ) ) ( HOIST-AT ?auto_642785 ?auto_642787 ) ( not ( = ?auto_642782 ?auto_642785 ) ) ( AVAILABLE ?auto_642785 ) ( SURFACE-AT ?auto_642781 ?auto_642787 ) ( ON ?auto_642781 ?auto_642784 ) ( CLEAR ?auto_642781 ) ( not ( = ?auto_642780 ?auto_642784 ) ) ( not ( = ?auto_642781 ?auto_642784 ) ) ( TRUCK-AT ?auto_642786 ?auto_642783 ) )
    :subtasks
    ( ( !DRIVE ?auto_642786 ?auto_642783 ?auto_642787 )
      ( MAKE-1CRATE ?auto_642780 ?auto_642781 )
      ( MAKE-1CRATE-VERIFY ?auto_642780 ?auto_642781 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642797 - SURFACE
      ?auto_642798 - SURFACE
      ?auto_642799 - SURFACE
    )
    :vars
    (
      ?auto_642801 - HOIST
      ?auto_642800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642801 ?auto_642800 ) ( SURFACE-AT ?auto_642798 ?auto_642800 ) ( CLEAR ?auto_642798 ) ( LIFTING ?auto_642801 ?auto_642799 ) ( IS-CRATE ?auto_642799 ) ( not ( = ?auto_642798 ?auto_642799 ) ) ( ON ?auto_642798 ?auto_642797 ) ( not ( = ?auto_642797 ?auto_642798 ) ) ( not ( = ?auto_642797 ?auto_642799 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642798 ?auto_642799 )
      ( MAKE-2CRATE-VERIFY ?auto_642797 ?auto_642798 ?auto_642799 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642807 - SURFACE
      ?auto_642808 - SURFACE
      ?auto_642809 - SURFACE
    )
    :vars
    (
      ?auto_642810 - HOIST
      ?auto_642811 - PLACE
      ?auto_642812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642810 ?auto_642811 ) ( SURFACE-AT ?auto_642808 ?auto_642811 ) ( CLEAR ?auto_642808 ) ( IS-CRATE ?auto_642809 ) ( not ( = ?auto_642808 ?auto_642809 ) ) ( TRUCK-AT ?auto_642812 ?auto_642811 ) ( AVAILABLE ?auto_642810 ) ( IN ?auto_642809 ?auto_642812 ) ( ON ?auto_642808 ?auto_642807 ) ( not ( = ?auto_642807 ?auto_642808 ) ) ( not ( = ?auto_642807 ?auto_642809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642808 ?auto_642809 )
      ( MAKE-2CRATE-VERIFY ?auto_642807 ?auto_642808 ?auto_642809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642813 - SURFACE
      ?auto_642814 - SURFACE
    )
    :vars
    (
      ?auto_642815 - HOIST
      ?auto_642816 - PLACE
      ?auto_642817 - TRUCK
      ?auto_642818 - SURFACE
      ?auto_642819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642815 ?auto_642816 ) ( SURFACE-AT ?auto_642813 ?auto_642816 ) ( CLEAR ?auto_642813 ) ( IS-CRATE ?auto_642814 ) ( not ( = ?auto_642813 ?auto_642814 ) ) ( AVAILABLE ?auto_642815 ) ( IN ?auto_642814 ?auto_642817 ) ( ON ?auto_642813 ?auto_642818 ) ( not ( = ?auto_642818 ?auto_642813 ) ) ( not ( = ?auto_642818 ?auto_642814 ) ) ( TRUCK-AT ?auto_642817 ?auto_642819 ) ( not ( = ?auto_642819 ?auto_642816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_642817 ?auto_642819 ?auto_642816 )
      ( MAKE-2CRATE ?auto_642818 ?auto_642813 ?auto_642814 )
      ( MAKE-1CRATE-VERIFY ?auto_642813 ?auto_642814 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642820 - SURFACE
      ?auto_642821 - SURFACE
      ?auto_642822 - SURFACE
    )
    :vars
    (
      ?auto_642826 - HOIST
      ?auto_642825 - PLACE
      ?auto_642823 - TRUCK
      ?auto_642824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642826 ?auto_642825 ) ( SURFACE-AT ?auto_642821 ?auto_642825 ) ( CLEAR ?auto_642821 ) ( IS-CRATE ?auto_642822 ) ( not ( = ?auto_642821 ?auto_642822 ) ) ( AVAILABLE ?auto_642826 ) ( IN ?auto_642822 ?auto_642823 ) ( ON ?auto_642821 ?auto_642820 ) ( not ( = ?auto_642820 ?auto_642821 ) ) ( not ( = ?auto_642820 ?auto_642822 ) ) ( TRUCK-AT ?auto_642823 ?auto_642824 ) ( not ( = ?auto_642824 ?auto_642825 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642821 ?auto_642822 )
      ( MAKE-2CRATE-VERIFY ?auto_642820 ?auto_642821 ?auto_642822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642827 - SURFACE
      ?auto_642828 - SURFACE
    )
    :vars
    (
      ?auto_642830 - HOIST
      ?auto_642829 - PLACE
      ?auto_642833 - SURFACE
      ?auto_642832 - TRUCK
      ?auto_642831 - PLACE
      ?auto_642834 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_642830 ?auto_642829 ) ( SURFACE-AT ?auto_642827 ?auto_642829 ) ( CLEAR ?auto_642827 ) ( IS-CRATE ?auto_642828 ) ( not ( = ?auto_642827 ?auto_642828 ) ) ( AVAILABLE ?auto_642830 ) ( ON ?auto_642827 ?auto_642833 ) ( not ( = ?auto_642833 ?auto_642827 ) ) ( not ( = ?auto_642833 ?auto_642828 ) ) ( TRUCK-AT ?auto_642832 ?auto_642831 ) ( not ( = ?auto_642831 ?auto_642829 ) ) ( HOIST-AT ?auto_642834 ?auto_642831 ) ( LIFTING ?auto_642834 ?auto_642828 ) ( not ( = ?auto_642830 ?auto_642834 ) ) )
    :subtasks
    ( ( !LOAD ?auto_642834 ?auto_642828 ?auto_642832 ?auto_642831 )
      ( MAKE-2CRATE ?auto_642833 ?auto_642827 ?auto_642828 )
      ( MAKE-1CRATE-VERIFY ?auto_642827 ?auto_642828 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642835 - SURFACE
      ?auto_642836 - SURFACE
      ?auto_642837 - SURFACE
    )
    :vars
    (
      ?auto_642842 - HOIST
      ?auto_642841 - PLACE
      ?auto_642840 - TRUCK
      ?auto_642839 - PLACE
      ?auto_642838 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_642842 ?auto_642841 ) ( SURFACE-AT ?auto_642836 ?auto_642841 ) ( CLEAR ?auto_642836 ) ( IS-CRATE ?auto_642837 ) ( not ( = ?auto_642836 ?auto_642837 ) ) ( AVAILABLE ?auto_642842 ) ( ON ?auto_642836 ?auto_642835 ) ( not ( = ?auto_642835 ?auto_642836 ) ) ( not ( = ?auto_642835 ?auto_642837 ) ) ( TRUCK-AT ?auto_642840 ?auto_642839 ) ( not ( = ?auto_642839 ?auto_642841 ) ) ( HOIST-AT ?auto_642838 ?auto_642839 ) ( LIFTING ?auto_642838 ?auto_642837 ) ( not ( = ?auto_642842 ?auto_642838 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642836 ?auto_642837 )
      ( MAKE-2CRATE-VERIFY ?auto_642835 ?auto_642836 ?auto_642837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642843 - SURFACE
      ?auto_642844 - SURFACE
    )
    :vars
    (
      ?auto_642847 - HOIST
      ?auto_642849 - PLACE
      ?auto_642845 - SURFACE
      ?auto_642848 - TRUCK
      ?auto_642850 - PLACE
      ?auto_642846 - HOIST
      ?auto_642851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642847 ?auto_642849 ) ( SURFACE-AT ?auto_642843 ?auto_642849 ) ( CLEAR ?auto_642843 ) ( IS-CRATE ?auto_642844 ) ( not ( = ?auto_642843 ?auto_642844 ) ) ( AVAILABLE ?auto_642847 ) ( ON ?auto_642843 ?auto_642845 ) ( not ( = ?auto_642845 ?auto_642843 ) ) ( not ( = ?auto_642845 ?auto_642844 ) ) ( TRUCK-AT ?auto_642848 ?auto_642850 ) ( not ( = ?auto_642850 ?auto_642849 ) ) ( HOIST-AT ?auto_642846 ?auto_642850 ) ( not ( = ?auto_642847 ?auto_642846 ) ) ( AVAILABLE ?auto_642846 ) ( SURFACE-AT ?auto_642844 ?auto_642850 ) ( ON ?auto_642844 ?auto_642851 ) ( CLEAR ?auto_642844 ) ( not ( = ?auto_642843 ?auto_642851 ) ) ( not ( = ?auto_642844 ?auto_642851 ) ) ( not ( = ?auto_642845 ?auto_642851 ) ) )
    :subtasks
    ( ( !LIFT ?auto_642846 ?auto_642844 ?auto_642851 ?auto_642850 )
      ( MAKE-2CRATE ?auto_642845 ?auto_642843 ?auto_642844 )
      ( MAKE-1CRATE-VERIFY ?auto_642843 ?auto_642844 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642852 - SURFACE
      ?auto_642853 - SURFACE
      ?auto_642854 - SURFACE
    )
    :vars
    (
      ?auto_642855 - HOIST
      ?auto_642858 - PLACE
      ?auto_642860 - TRUCK
      ?auto_642857 - PLACE
      ?auto_642856 - HOIST
      ?auto_642859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642855 ?auto_642858 ) ( SURFACE-AT ?auto_642853 ?auto_642858 ) ( CLEAR ?auto_642853 ) ( IS-CRATE ?auto_642854 ) ( not ( = ?auto_642853 ?auto_642854 ) ) ( AVAILABLE ?auto_642855 ) ( ON ?auto_642853 ?auto_642852 ) ( not ( = ?auto_642852 ?auto_642853 ) ) ( not ( = ?auto_642852 ?auto_642854 ) ) ( TRUCK-AT ?auto_642860 ?auto_642857 ) ( not ( = ?auto_642857 ?auto_642858 ) ) ( HOIST-AT ?auto_642856 ?auto_642857 ) ( not ( = ?auto_642855 ?auto_642856 ) ) ( AVAILABLE ?auto_642856 ) ( SURFACE-AT ?auto_642854 ?auto_642857 ) ( ON ?auto_642854 ?auto_642859 ) ( CLEAR ?auto_642854 ) ( not ( = ?auto_642853 ?auto_642859 ) ) ( not ( = ?auto_642854 ?auto_642859 ) ) ( not ( = ?auto_642852 ?auto_642859 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642853 ?auto_642854 )
      ( MAKE-2CRATE-VERIFY ?auto_642852 ?auto_642853 ?auto_642854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642861 - SURFACE
      ?auto_642862 - SURFACE
    )
    :vars
    (
      ?auto_642869 - HOIST
      ?auto_642868 - PLACE
      ?auto_642867 - SURFACE
      ?auto_642866 - PLACE
      ?auto_642865 - HOIST
      ?auto_642863 - SURFACE
      ?auto_642864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642869 ?auto_642868 ) ( SURFACE-AT ?auto_642861 ?auto_642868 ) ( CLEAR ?auto_642861 ) ( IS-CRATE ?auto_642862 ) ( not ( = ?auto_642861 ?auto_642862 ) ) ( AVAILABLE ?auto_642869 ) ( ON ?auto_642861 ?auto_642867 ) ( not ( = ?auto_642867 ?auto_642861 ) ) ( not ( = ?auto_642867 ?auto_642862 ) ) ( not ( = ?auto_642866 ?auto_642868 ) ) ( HOIST-AT ?auto_642865 ?auto_642866 ) ( not ( = ?auto_642869 ?auto_642865 ) ) ( AVAILABLE ?auto_642865 ) ( SURFACE-AT ?auto_642862 ?auto_642866 ) ( ON ?auto_642862 ?auto_642863 ) ( CLEAR ?auto_642862 ) ( not ( = ?auto_642861 ?auto_642863 ) ) ( not ( = ?auto_642862 ?auto_642863 ) ) ( not ( = ?auto_642867 ?auto_642863 ) ) ( TRUCK-AT ?auto_642864 ?auto_642868 ) )
    :subtasks
    ( ( !DRIVE ?auto_642864 ?auto_642868 ?auto_642866 )
      ( MAKE-2CRATE ?auto_642867 ?auto_642861 ?auto_642862 )
      ( MAKE-1CRATE-VERIFY ?auto_642861 ?auto_642862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642870 - SURFACE
      ?auto_642871 - SURFACE
      ?auto_642872 - SURFACE
    )
    :vars
    (
      ?auto_642876 - HOIST
      ?auto_642878 - PLACE
      ?auto_642875 - PLACE
      ?auto_642873 - HOIST
      ?auto_642874 - SURFACE
      ?auto_642877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642876 ?auto_642878 ) ( SURFACE-AT ?auto_642871 ?auto_642878 ) ( CLEAR ?auto_642871 ) ( IS-CRATE ?auto_642872 ) ( not ( = ?auto_642871 ?auto_642872 ) ) ( AVAILABLE ?auto_642876 ) ( ON ?auto_642871 ?auto_642870 ) ( not ( = ?auto_642870 ?auto_642871 ) ) ( not ( = ?auto_642870 ?auto_642872 ) ) ( not ( = ?auto_642875 ?auto_642878 ) ) ( HOIST-AT ?auto_642873 ?auto_642875 ) ( not ( = ?auto_642876 ?auto_642873 ) ) ( AVAILABLE ?auto_642873 ) ( SURFACE-AT ?auto_642872 ?auto_642875 ) ( ON ?auto_642872 ?auto_642874 ) ( CLEAR ?auto_642872 ) ( not ( = ?auto_642871 ?auto_642874 ) ) ( not ( = ?auto_642872 ?auto_642874 ) ) ( not ( = ?auto_642870 ?auto_642874 ) ) ( TRUCK-AT ?auto_642877 ?auto_642878 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642871 ?auto_642872 )
      ( MAKE-2CRATE-VERIFY ?auto_642870 ?auto_642871 ?auto_642872 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642879 - SURFACE
      ?auto_642880 - SURFACE
    )
    :vars
    (
      ?auto_642887 - HOIST
      ?auto_642886 - PLACE
      ?auto_642882 - SURFACE
      ?auto_642884 - PLACE
      ?auto_642883 - HOIST
      ?auto_642881 - SURFACE
      ?auto_642885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642887 ?auto_642886 ) ( IS-CRATE ?auto_642880 ) ( not ( = ?auto_642879 ?auto_642880 ) ) ( not ( = ?auto_642882 ?auto_642879 ) ) ( not ( = ?auto_642882 ?auto_642880 ) ) ( not ( = ?auto_642884 ?auto_642886 ) ) ( HOIST-AT ?auto_642883 ?auto_642884 ) ( not ( = ?auto_642887 ?auto_642883 ) ) ( AVAILABLE ?auto_642883 ) ( SURFACE-AT ?auto_642880 ?auto_642884 ) ( ON ?auto_642880 ?auto_642881 ) ( CLEAR ?auto_642880 ) ( not ( = ?auto_642879 ?auto_642881 ) ) ( not ( = ?auto_642880 ?auto_642881 ) ) ( not ( = ?auto_642882 ?auto_642881 ) ) ( TRUCK-AT ?auto_642885 ?auto_642886 ) ( SURFACE-AT ?auto_642882 ?auto_642886 ) ( CLEAR ?auto_642882 ) ( LIFTING ?auto_642887 ?auto_642879 ) ( IS-CRATE ?auto_642879 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642882 ?auto_642879 )
      ( MAKE-2CRATE ?auto_642882 ?auto_642879 ?auto_642880 )
      ( MAKE-1CRATE-VERIFY ?auto_642879 ?auto_642880 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642888 - SURFACE
      ?auto_642889 - SURFACE
      ?auto_642890 - SURFACE
    )
    :vars
    (
      ?auto_642894 - HOIST
      ?auto_642892 - PLACE
      ?auto_642896 - PLACE
      ?auto_642895 - HOIST
      ?auto_642891 - SURFACE
      ?auto_642893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642894 ?auto_642892 ) ( IS-CRATE ?auto_642890 ) ( not ( = ?auto_642889 ?auto_642890 ) ) ( not ( = ?auto_642888 ?auto_642889 ) ) ( not ( = ?auto_642888 ?auto_642890 ) ) ( not ( = ?auto_642896 ?auto_642892 ) ) ( HOIST-AT ?auto_642895 ?auto_642896 ) ( not ( = ?auto_642894 ?auto_642895 ) ) ( AVAILABLE ?auto_642895 ) ( SURFACE-AT ?auto_642890 ?auto_642896 ) ( ON ?auto_642890 ?auto_642891 ) ( CLEAR ?auto_642890 ) ( not ( = ?auto_642889 ?auto_642891 ) ) ( not ( = ?auto_642890 ?auto_642891 ) ) ( not ( = ?auto_642888 ?auto_642891 ) ) ( TRUCK-AT ?auto_642893 ?auto_642892 ) ( SURFACE-AT ?auto_642888 ?auto_642892 ) ( CLEAR ?auto_642888 ) ( LIFTING ?auto_642894 ?auto_642889 ) ( IS-CRATE ?auto_642889 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642889 ?auto_642890 )
      ( MAKE-2CRATE-VERIFY ?auto_642888 ?auto_642889 ?auto_642890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642897 - SURFACE
      ?auto_642898 - SURFACE
    )
    :vars
    (
      ?auto_642900 - HOIST
      ?auto_642904 - PLACE
      ?auto_642905 - SURFACE
      ?auto_642901 - PLACE
      ?auto_642899 - HOIST
      ?auto_642903 - SURFACE
      ?auto_642902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642900 ?auto_642904 ) ( IS-CRATE ?auto_642898 ) ( not ( = ?auto_642897 ?auto_642898 ) ) ( not ( = ?auto_642905 ?auto_642897 ) ) ( not ( = ?auto_642905 ?auto_642898 ) ) ( not ( = ?auto_642901 ?auto_642904 ) ) ( HOIST-AT ?auto_642899 ?auto_642901 ) ( not ( = ?auto_642900 ?auto_642899 ) ) ( AVAILABLE ?auto_642899 ) ( SURFACE-AT ?auto_642898 ?auto_642901 ) ( ON ?auto_642898 ?auto_642903 ) ( CLEAR ?auto_642898 ) ( not ( = ?auto_642897 ?auto_642903 ) ) ( not ( = ?auto_642898 ?auto_642903 ) ) ( not ( = ?auto_642905 ?auto_642903 ) ) ( TRUCK-AT ?auto_642902 ?auto_642904 ) ( SURFACE-AT ?auto_642905 ?auto_642904 ) ( CLEAR ?auto_642905 ) ( IS-CRATE ?auto_642897 ) ( AVAILABLE ?auto_642900 ) ( IN ?auto_642897 ?auto_642902 ) )
    :subtasks
    ( ( !UNLOAD ?auto_642900 ?auto_642897 ?auto_642902 ?auto_642904 )
      ( MAKE-2CRATE ?auto_642905 ?auto_642897 ?auto_642898 )
      ( MAKE-1CRATE-VERIFY ?auto_642897 ?auto_642898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642906 - SURFACE
      ?auto_642907 - SURFACE
      ?auto_642908 - SURFACE
    )
    :vars
    (
      ?auto_642912 - HOIST
      ?auto_642913 - PLACE
      ?auto_642914 - PLACE
      ?auto_642911 - HOIST
      ?auto_642910 - SURFACE
      ?auto_642909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642912 ?auto_642913 ) ( IS-CRATE ?auto_642908 ) ( not ( = ?auto_642907 ?auto_642908 ) ) ( not ( = ?auto_642906 ?auto_642907 ) ) ( not ( = ?auto_642906 ?auto_642908 ) ) ( not ( = ?auto_642914 ?auto_642913 ) ) ( HOIST-AT ?auto_642911 ?auto_642914 ) ( not ( = ?auto_642912 ?auto_642911 ) ) ( AVAILABLE ?auto_642911 ) ( SURFACE-AT ?auto_642908 ?auto_642914 ) ( ON ?auto_642908 ?auto_642910 ) ( CLEAR ?auto_642908 ) ( not ( = ?auto_642907 ?auto_642910 ) ) ( not ( = ?auto_642908 ?auto_642910 ) ) ( not ( = ?auto_642906 ?auto_642910 ) ) ( TRUCK-AT ?auto_642909 ?auto_642913 ) ( SURFACE-AT ?auto_642906 ?auto_642913 ) ( CLEAR ?auto_642906 ) ( IS-CRATE ?auto_642907 ) ( AVAILABLE ?auto_642912 ) ( IN ?auto_642907 ?auto_642909 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642907 ?auto_642908 )
      ( MAKE-2CRATE-VERIFY ?auto_642906 ?auto_642907 ?auto_642908 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642915 - SURFACE
      ?auto_642916 - SURFACE
    )
    :vars
    (
      ?auto_642922 - HOIST
      ?auto_642923 - PLACE
      ?auto_642921 - SURFACE
      ?auto_642918 - PLACE
      ?auto_642920 - HOIST
      ?auto_642919 - SURFACE
      ?auto_642917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642922 ?auto_642923 ) ( IS-CRATE ?auto_642916 ) ( not ( = ?auto_642915 ?auto_642916 ) ) ( not ( = ?auto_642921 ?auto_642915 ) ) ( not ( = ?auto_642921 ?auto_642916 ) ) ( not ( = ?auto_642918 ?auto_642923 ) ) ( HOIST-AT ?auto_642920 ?auto_642918 ) ( not ( = ?auto_642922 ?auto_642920 ) ) ( AVAILABLE ?auto_642920 ) ( SURFACE-AT ?auto_642916 ?auto_642918 ) ( ON ?auto_642916 ?auto_642919 ) ( CLEAR ?auto_642916 ) ( not ( = ?auto_642915 ?auto_642919 ) ) ( not ( = ?auto_642916 ?auto_642919 ) ) ( not ( = ?auto_642921 ?auto_642919 ) ) ( SURFACE-AT ?auto_642921 ?auto_642923 ) ( CLEAR ?auto_642921 ) ( IS-CRATE ?auto_642915 ) ( AVAILABLE ?auto_642922 ) ( IN ?auto_642915 ?auto_642917 ) ( TRUCK-AT ?auto_642917 ?auto_642918 ) )
    :subtasks
    ( ( !DRIVE ?auto_642917 ?auto_642918 ?auto_642923 )
      ( MAKE-2CRATE ?auto_642921 ?auto_642915 ?auto_642916 )
      ( MAKE-1CRATE-VERIFY ?auto_642915 ?auto_642916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642924 - SURFACE
      ?auto_642925 - SURFACE
      ?auto_642926 - SURFACE
    )
    :vars
    (
      ?auto_642928 - HOIST
      ?auto_642929 - PLACE
      ?auto_642931 - PLACE
      ?auto_642932 - HOIST
      ?auto_642930 - SURFACE
      ?auto_642927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642928 ?auto_642929 ) ( IS-CRATE ?auto_642926 ) ( not ( = ?auto_642925 ?auto_642926 ) ) ( not ( = ?auto_642924 ?auto_642925 ) ) ( not ( = ?auto_642924 ?auto_642926 ) ) ( not ( = ?auto_642931 ?auto_642929 ) ) ( HOIST-AT ?auto_642932 ?auto_642931 ) ( not ( = ?auto_642928 ?auto_642932 ) ) ( AVAILABLE ?auto_642932 ) ( SURFACE-AT ?auto_642926 ?auto_642931 ) ( ON ?auto_642926 ?auto_642930 ) ( CLEAR ?auto_642926 ) ( not ( = ?auto_642925 ?auto_642930 ) ) ( not ( = ?auto_642926 ?auto_642930 ) ) ( not ( = ?auto_642924 ?auto_642930 ) ) ( SURFACE-AT ?auto_642924 ?auto_642929 ) ( CLEAR ?auto_642924 ) ( IS-CRATE ?auto_642925 ) ( AVAILABLE ?auto_642928 ) ( IN ?auto_642925 ?auto_642927 ) ( TRUCK-AT ?auto_642927 ?auto_642931 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642925 ?auto_642926 )
      ( MAKE-2CRATE-VERIFY ?auto_642924 ?auto_642925 ?auto_642926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642933 - SURFACE
      ?auto_642934 - SURFACE
    )
    :vars
    (
      ?auto_642939 - HOIST
      ?auto_642936 - PLACE
      ?auto_642938 - SURFACE
      ?auto_642935 - PLACE
      ?auto_642937 - HOIST
      ?auto_642941 - SURFACE
      ?auto_642940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642939 ?auto_642936 ) ( IS-CRATE ?auto_642934 ) ( not ( = ?auto_642933 ?auto_642934 ) ) ( not ( = ?auto_642938 ?auto_642933 ) ) ( not ( = ?auto_642938 ?auto_642934 ) ) ( not ( = ?auto_642935 ?auto_642936 ) ) ( HOIST-AT ?auto_642937 ?auto_642935 ) ( not ( = ?auto_642939 ?auto_642937 ) ) ( SURFACE-AT ?auto_642934 ?auto_642935 ) ( ON ?auto_642934 ?auto_642941 ) ( CLEAR ?auto_642934 ) ( not ( = ?auto_642933 ?auto_642941 ) ) ( not ( = ?auto_642934 ?auto_642941 ) ) ( not ( = ?auto_642938 ?auto_642941 ) ) ( SURFACE-AT ?auto_642938 ?auto_642936 ) ( CLEAR ?auto_642938 ) ( IS-CRATE ?auto_642933 ) ( AVAILABLE ?auto_642939 ) ( TRUCK-AT ?auto_642940 ?auto_642935 ) ( LIFTING ?auto_642937 ?auto_642933 ) )
    :subtasks
    ( ( !LOAD ?auto_642937 ?auto_642933 ?auto_642940 ?auto_642935 )
      ( MAKE-2CRATE ?auto_642938 ?auto_642933 ?auto_642934 )
      ( MAKE-1CRATE-VERIFY ?auto_642933 ?auto_642934 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642942 - SURFACE
      ?auto_642943 - SURFACE
      ?auto_642944 - SURFACE
    )
    :vars
    (
      ?auto_642948 - HOIST
      ?auto_642945 - PLACE
      ?auto_642946 - PLACE
      ?auto_642947 - HOIST
      ?auto_642949 - SURFACE
      ?auto_642950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642948 ?auto_642945 ) ( IS-CRATE ?auto_642944 ) ( not ( = ?auto_642943 ?auto_642944 ) ) ( not ( = ?auto_642942 ?auto_642943 ) ) ( not ( = ?auto_642942 ?auto_642944 ) ) ( not ( = ?auto_642946 ?auto_642945 ) ) ( HOIST-AT ?auto_642947 ?auto_642946 ) ( not ( = ?auto_642948 ?auto_642947 ) ) ( SURFACE-AT ?auto_642944 ?auto_642946 ) ( ON ?auto_642944 ?auto_642949 ) ( CLEAR ?auto_642944 ) ( not ( = ?auto_642943 ?auto_642949 ) ) ( not ( = ?auto_642944 ?auto_642949 ) ) ( not ( = ?auto_642942 ?auto_642949 ) ) ( SURFACE-AT ?auto_642942 ?auto_642945 ) ( CLEAR ?auto_642942 ) ( IS-CRATE ?auto_642943 ) ( AVAILABLE ?auto_642948 ) ( TRUCK-AT ?auto_642950 ?auto_642946 ) ( LIFTING ?auto_642947 ?auto_642943 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642943 ?auto_642944 )
      ( MAKE-2CRATE-VERIFY ?auto_642942 ?auto_642943 ?auto_642944 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642951 - SURFACE
      ?auto_642952 - SURFACE
    )
    :vars
    (
      ?auto_642956 - HOIST
      ?auto_642959 - PLACE
      ?auto_642957 - SURFACE
      ?auto_642955 - PLACE
      ?auto_642958 - HOIST
      ?auto_642954 - SURFACE
      ?auto_642953 - TRUCK
      ?auto_642960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642956 ?auto_642959 ) ( IS-CRATE ?auto_642952 ) ( not ( = ?auto_642951 ?auto_642952 ) ) ( not ( = ?auto_642957 ?auto_642951 ) ) ( not ( = ?auto_642957 ?auto_642952 ) ) ( not ( = ?auto_642955 ?auto_642959 ) ) ( HOIST-AT ?auto_642958 ?auto_642955 ) ( not ( = ?auto_642956 ?auto_642958 ) ) ( SURFACE-AT ?auto_642952 ?auto_642955 ) ( ON ?auto_642952 ?auto_642954 ) ( CLEAR ?auto_642952 ) ( not ( = ?auto_642951 ?auto_642954 ) ) ( not ( = ?auto_642952 ?auto_642954 ) ) ( not ( = ?auto_642957 ?auto_642954 ) ) ( SURFACE-AT ?auto_642957 ?auto_642959 ) ( CLEAR ?auto_642957 ) ( IS-CRATE ?auto_642951 ) ( AVAILABLE ?auto_642956 ) ( TRUCK-AT ?auto_642953 ?auto_642955 ) ( AVAILABLE ?auto_642958 ) ( SURFACE-AT ?auto_642951 ?auto_642955 ) ( ON ?auto_642951 ?auto_642960 ) ( CLEAR ?auto_642951 ) ( not ( = ?auto_642951 ?auto_642960 ) ) ( not ( = ?auto_642952 ?auto_642960 ) ) ( not ( = ?auto_642957 ?auto_642960 ) ) ( not ( = ?auto_642954 ?auto_642960 ) ) )
    :subtasks
    ( ( !LIFT ?auto_642958 ?auto_642951 ?auto_642960 ?auto_642955 )
      ( MAKE-2CRATE ?auto_642957 ?auto_642951 ?auto_642952 )
      ( MAKE-1CRATE-VERIFY ?auto_642951 ?auto_642952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642961 - SURFACE
      ?auto_642962 - SURFACE
      ?auto_642963 - SURFACE
    )
    :vars
    (
      ?auto_642966 - HOIST
      ?auto_642969 - PLACE
      ?auto_642968 - PLACE
      ?auto_642965 - HOIST
      ?auto_642967 - SURFACE
      ?auto_642970 - TRUCK
      ?auto_642964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_642966 ?auto_642969 ) ( IS-CRATE ?auto_642963 ) ( not ( = ?auto_642962 ?auto_642963 ) ) ( not ( = ?auto_642961 ?auto_642962 ) ) ( not ( = ?auto_642961 ?auto_642963 ) ) ( not ( = ?auto_642968 ?auto_642969 ) ) ( HOIST-AT ?auto_642965 ?auto_642968 ) ( not ( = ?auto_642966 ?auto_642965 ) ) ( SURFACE-AT ?auto_642963 ?auto_642968 ) ( ON ?auto_642963 ?auto_642967 ) ( CLEAR ?auto_642963 ) ( not ( = ?auto_642962 ?auto_642967 ) ) ( not ( = ?auto_642963 ?auto_642967 ) ) ( not ( = ?auto_642961 ?auto_642967 ) ) ( SURFACE-AT ?auto_642961 ?auto_642969 ) ( CLEAR ?auto_642961 ) ( IS-CRATE ?auto_642962 ) ( AVAILABLE ?auto_642966 ) ( TRUCK-AT ?auto_642970 ?auto_642968 ) ( AVAILABLE ?auto_642965 ) ( SURFACE-AT ?auto_642962 ?auto_642968 ) ( ON ?auto_642962 ?auto_642964 ) ( CLEAR ?auto_642962 ) ( not ( = ?auto_642962 ?auto_642964 ) ) ( not ( = ?auto_642963 ?auto_642964 ) ) ( not ( = ?auto_642961 ?auto_642964 ) ) ( not ( = ?auto_642967 ?auto_642964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642962 ?auto_642963 )
      ( MAKE-2CRATE-VERIFY ?auto_642961 ?auto_642962 ?auto_642963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_642971 - SURFACE
      ?auto_642972 - SURFACE
    )
    :vars
    (
      ?auto_642975 - HOIST
      ?auto_642978 - PLACE
      ?auto_642973 - SURFACE
      ?auto_642980 - PLACE
      ?auto_642979 - HOIST
      ?auto_642977 - SURFACE
      ?auto_642976 - SURFACE
      ?auto_642974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642975 ?auto_642978 ) ( IS-CRATE ?auto_642972 ) ( not ( = ?auto_642971 ?auto_642972 ) ) ( not ( = ?auto_642973 ?auto_642971 ) ) ( not ( = ?auto_642973 ?auto_642972 ) ) ( not ( = ?auto_642980 ?auto_642978 ) ) ( HOIST-AT ?auto_642979 ?auto_642980 ) ( not ( = ?auto_642975 ?auto_642979 ) ) ( SURFACE-AT ?auto_642972 ?auto_642980 ) ( ON ?auto_642972 ?auto_642977 ) ( CLEAR ?auto_642972 ) ( not ( = ?auto_642971 ?auto_642977 ) ) ( not ( = ?auto_642972 ?auto_642977 ) ) ( not ( = ?auto_642973 ?auto_642977 ) ) ( SURFACE-AT ?auto_642973 ?auto_642978 ) ( CLEAR ?auto_642973 ) ( IS-CRATE ?auto_642971 ) ( AVAILABLE ?auto_642975 ) ( AVAILABLE ?auto_642979 ) ( SURFACE-AT ?auto_642971 ?auto_642980 ) ( ON ?auto_642971 ?auto_642976 ) ( CLEAR ?auto_642971 ) ( not ( = ?auto_642971 ?auto_642976 ) ) ( not ( = ?auto_642972 ?auto_642976 ) ) ( not ( = ?auto_642973 ?auto_642976 ) ) ( not ( = ?auto_642977 ?auto_642976 ) ) ( TRUCK-AT ?auto_642974 ?auto_642978 ) )
    :subtasks
    ( ( !DRIVE ?auto_642974 ?auto_642978 ?auto_642980 )
      ( MAKE-2CRATE ?auto_642973 ?auto_642971 ?auto_642972 )
      ( MAKE-1CRATE-VERIFY ?auto_642971 ?auto_642972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642981 - SURFACE
      ?auto_642982 - SURFACE
      ?auto_642983 - SURFACE
    )
    :vars
    (
      ?auto_642989 - HOIST
      ?auto_642986 - PLACE
      ?auto_642987 - PLACE
      ?auto_642984 - HOIST
      ?auto_642985 - SURFACE
      ?auto_642990 - SURFACE
      ?auto_642988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_642989 ?auto_642986 ) ( IS-CRATE ?auto_642983 ) ( not ( = ?auto_642982 ?auto_642983 ) ) ( not ( = ?auto_642981 ?auto_642982 ) ) ( not ( = ?auto_642981 ?auto_642983 ) ) ( not ( = ?auto_642987 ?auto_642986 ) ) ( HOIST-AT ?auto_642984 ?auto_642987 ) ( not ( = ?auto_642989 ?auto_642984 ) ) ( SURFACE-AT ?auto_642983 ?auto_642987 ) ( ON ?auto_642983 ?auto_642985 ) ( CLEAR ?auto_642983 ) ( not ( = ?auto_642982 ?auto_642985 ) ) ( not ( = ?auto_642983 ?auto_642985 ) ) ( not ( = ?auto_642981 ?auto_642985 ) ) ( SURFACE-AT ?auto_642981 ?auto_642986 ) ( CLEAR ?auto_642981 ) ( IS-CRATE ?auto_642982 ) ( AVAILABLE ?auto_642989 ) ( AVAILABLE ?auto_642984 ) ( SURFACE-AT ?auto_642982 ?auto_642987 ) ( ON ?auto_642982 ?auto_642990 ) ( CLEAR ?auto_642982 ) ( not ( = ?auto_642982 ?auto_642990 ) ) ( not ( = ?auto_642983 ?auto_642990 ) ) ( not ( = ?auto_642981 ?auto_642990 ) ) ( not ( = ?auto_642985 ?auto_642990 ) ) ( TRUCK-AT ?auto_642988 ?auto_642986 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_642982 ?auto_642983 )
      ( MAKE-2CRATE-VERIFY ?auto_642981 ?auto_642982 ?auto_642983 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643009 - SURFACE
      ?auto_643010 - SURFACE
      ?auto_643011 - SURFACE
      ?auto_643012 - SURFACE
    )
    :vars
    (
      ?auto_643013 - HOIST
      ?auto_643014 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643013 ?auto_643014 ) ( SURFACE-AT ?auto_643011 ?auto_643014 ) ( CLEAR ?auto_643011 ) ( LIFTING ?auto_643013 ?auto_643012 ) ( IS-CRATE ?auto_643012 ) ( not ( = ?auto_643011 ?auto_643012 ) ) ( ON ?auto_643010 ?auto_643009 ) ( ON ?auto_643011 ?auto_643010 ) ( not ( = ?auto_643009 ?auto_643010 ) ) ( not ( = ?auto_643009 ?auto_643011 ) ) ( not ( = ?auto_643009 ?auto_643012 ) ) ( not ( = ?auto_643010 ?auto_643011 ) ) ( not ( = ?auto_643010 ?auto_643012 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643011 ?auto_643012 )
      ( MAKE-3CRATE-VERIFY ?auto_643009 ?auto_643010 ?auto_643011 ?auto_643012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643026 - SURFACE
      ?auto_643027 - SURFACE
      ?auto_643028 - SURFACE
      ?auto_643029 - SURFACE
    )
    :vars
    (
      ?auto_643032 - HOIST
      ?auto_643031 - PLACE
      ?auto_643030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643032 ?auto_643031 ) ( SURFACE-AT ?auto_643028 ?auto_643031 ) ( CLEAR ?auto_643028 ) ( IS-CRATE ?auto_643029 ) ( not ( = ?auto_643028 ?auto_643029 ) ) ( TRUCK-AT ?auto_643030 ?auto_643031 ) ( AVAILABLE ?auto_643032 ) ( IN ?auto_643029 ?auto_643030 ) ( ON ?auto_643028 ?auto_643027 ) ( not ( = ?auto_643027 ?auto_643028 ) ) ( not ( = ?auto_643027 ?auto_643029 ) ) ( ON ?auto_643027 ?auto_643026 ) ( not ( = ?auto_643026 ?auto_643027 ) ) ( not ( = ?auto_643026 ?auto_643028 ) ) ( not ( = ?auto_643026 ?auto_643029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643027 ?auto_643028 ?auto_643029 )
      ( MAKE-3CRATE-VERIFY ?auto_643026 ?auto_643027 ?auto_643028 ?auto_643029 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643047 - SURFACE
      ?auto_643048 - SURFACE
      ?auto_643049 - SURFACE
      ?auto_643050 - SURFACE
    )
    :vars
    (
      ?auto_643051 - HOIST
      ?auto_643054 - PLACE
      ?auto_643053 - TRUCK
      ?auto_643052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643051 ?auto_643054 ) ( SURFACE-AT ?auto_643049 ?auto_643054 ) ( CLEAR ?auto_643049 ) ( IS-CRATE ?auto_643050 ) ( not ( = ?auto_643049 ?auto_643050 ) ) ( AVAILABLE ?auto_643051 ) ( IN ?auto_643050 ?auto_643053 ) ( ON ?auto_643049 ?auto_643048 ) ( not ( = ?auto_643048 ?auto_643049 ) ) ( not ( = ?auto_643048 ?auto_643050 ) ) ( TRUCK-AT ?auto_643053 ?auto_643052 ) ( not ( = ?auto_643052 ?auto_643054 ) ) ( ON ?auto_643048 ?auto_643047 ) ( not ( = ?auto_643047 ?auto_643048 ) ) ( not ( = ?auto_643047 ?auto_643049 ) ) ( not ( = ?auto_643047 ?auto_643050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643048 ?auto_643049 ?auto_643050 )
      ( MAKE-3CRATE-VERIFY ?auto_643047 ?auto_643048 ?auto_643049 ?auto_643050 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643071 - SURFACE
      ?auto_643072 - SURFACE
      ?auto_643073 - SURFACE
      ?auto_643074 - SURFACE
    )
    :vars
    (
      ?auto_643077 - HOIST
      ?auto_643076 - PLACE
      ?auto_643079 - TRUCK
      ?auto_643078 - PLACE
      ?auto_643075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643077 ?auto_643076 ) ( SURFACE-AT ?auto_643073 ?auto_643076 ) ( CLEAR ?auto_643073 ) ( IS-CRATE ?auto_643074 ) ( not ( = ?auto_643073 ?auto_643074 ) ) ( AVAILABLE ?auto_643077 ) ( ON ?auto_643073 ?auto_643072 ) ( not ( = ?auto_643072 ?auto_643073 ) ) ( not ( = ?auto_643072 ?auto_643074 ) ) ( TRUCK-AT ?auto_643079 ?auto_643078 ) ( not ( = ?auto_643078 ?auto_643076 ) ) ( HOIST-AT ?auto_643075 ?auto_643078 ) ( LIFTING ?auto_643075 ?auto_643074 ) ( not ( = ?auto_643077 ?auto_643075 ) ) ( ON ?auto_643072 ?auto_643071 ) ( not ( = ?auto_643071 ?auto_643072 ) ) ( not ( = ?auto_643071 ?auto_643073 ) ) ( not ( = ?auto_643071 ?auto_643074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643072 ?auto_643073 ?auto_643074 )
      ( MAKE-3CRATE-VERIFY ?auto_643071 ?auto_643072 ?auto_643073 ?auto_643074 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643098 - SURFACE
      ?auto_643099 - SURFACE
      ?auto_643100 - SURFACE
      ?auto_643101 - SURFACE
    )
    :vars
    (
      ?auto_643103 - HOIST
      ?auto_643102 - PLACE
      ?auto_643104 - TRUCK
      ?auto_643107 - PLACE
      ?auto_643105 - HOIST
      ?auto_643106 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643103 ?auto_643102 ) ( SURFACE-AT ?auto_643100 ?auto_643102 ) ( CLEAR ?auto_643100 ) ( IS-CRATE ?auto_643101 ) ( not ( = ?auto_643100 ?auto_643101 ) ) ( AVAILABLE ?auto_643103 ) ( ON ?auto_643100 ?auto_643099 ) ( not ( = ?auto_643099 ?auto_643100 ) ) ( not ( = ?auto_643099 ?auto_643101 ) ) ( TRUCK-AT ?auto_643104 ?auto_643107 ) ( not ( = ?auto_643107 ?auto_643102 ) ) ( HOIST-AT ?auto_643105 ?auto_643107 ) ( not ( = ?auto_643103 ?auto_643105 ) ) ( AVAILABLE ?auto_643105 ) ( SURFACE-AT ?auto_643101 ?auto_643107 ) ( ON ?auto_643101 ?auto_643106 ) ( CLEAR ?auto_643101 ) ( not ( = ?auto_643100 ?auto_643106 ) ) ( not ( = ?auto_643101 ?auto_643106 ) ) ( not ( = ?auto_643099 ?auto_643106 ) ) ( ON ?auto_643099 ?auto_643098 ) ( not ( = ?auto_643098 ?auto_643099 ) ) ( not ( = ?auto_643098 ?auto_643100 ) ) ( not ( = ?auto_643098 ?auto_643101 ) ) ( not ( = ?auto_643098 ?auto_643106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643099 ?auto_643100 ?auto_643101 )
      ( MAKE-3CRATE-VERIFY ?auto_643098 ?auto_643099 ?auto_643100 ?auto_643101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643126 - SURFACE
      ?auto_643127 - SURFACE
      ?auto_643128 - SURFACE
      ?auto_643129 - SURFACE
    )
    :vars
    (
      ?auto_643135 - HOIST
      ?auto_643133 - PLACE
      ?auto_643134 - PLACE
      ?auto_643131 - HOIST
      ?auto_643132 - SURFACE
      ?auto_643130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643135 ?auto_643133 ) ( SURFACE-AT ?auto_643128 ?auto_643133 ) ( CLEAR ?auto_643128 ) ( IS-CRATE ?auto_643129 ) ( not ( = ?auto_643128 ?auto_643129 ) ) ( AVAILABLE ?auto_643135 ) ( ON ?auto_643128 ?auto_643127 ) ( not ( = ?auto_643127 ?auto_643128 ) ) ( not ( = ?auto_643127 ?auto_643129 ) ) ( not ( = ?auto_643134 ?auto_643133 ) ) ( HOIST-AT ?auto_643131 ?auto_643134 ) ( not ( = ?auto_643135 ?auto_643131 ) ) ( AVAILABLE ?auto_643131 ) ( SURFACE-AT ?auto_643129 ?auto_643134 ) ( ON ?auto_643129 ?auto_643132 ) ( CLEAR ?auto_643129 ) ( not ( = ?auto_643128 ?auto_643132 ) ) ( not ( = ?auto_643129 ?auto_643132 ) ) ( not ( = ?auto_643127 ?auto_643132 ) ) ( TRUCK-AT ?auto_643130 ?auto_643133 ) ( ON ?auto_643127 ?auto_643126 ) ( not ( = ?auto_643126 ?auto_643127 ) ) ( not ( = ?auto_643126 ?auto_643128 ) ) ( not ( = ?auto_643126 ?auto_643129 ) ) ( not ( = ?auto_643126 ?auto_643132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643127 ?auto_643128 ?auto_643129 )
      ( MAKE-3CRATE-VERIFY ?auto_643126 ?auto_643127 ?auto_643128 ?auto_643129 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643154 - SURFACE
      ?auto_643155 - SURFACE
      ?auto_643156 - SURFACE
      ?auto_643157 - SURFACE
    )
    :vars
    (
      ?auto_643161 - HOIST
      ?auto_643159 - PLACE
      ?auto_643158 - PLACE
      ?auto_643162 - HOIST
      ?auto_643160 - SURFACE
      ?auto_643163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643161 ?auto_643159 ) ( IS-CRATE ?auto_643157 ) ( not ( = ?auto_643156 ?auto_643157 ) ) ( not ( = ?auto_643155 ?auto_643156 ) ) ( not ( = ?auto_643155 ?auto_643157 ) ) ( not ( = ?auto_643158 ?auto_643159 ) ) ( HOIST-AT ?auto_643162 ?auto_643158 ) ( not ( = ?auto_643161 ?auto_643162 ) ) ( AVAILABLE ?auto_643162 ) ( SURFACE-AT ?auto_643157 ?auto_643158 ) ( ON ?auto_643157 ?auto_643160 ) ( CLEAR ?auto_643157 ) ( not ( = ?auto_643156 ?auto_643160 ) ) ( not ( = ?auto_643157 ?auto_643160 ) ) ( not ( = ?auto_643155 ?auto_643160 ) ) ( TRUCK-AT ?auto_643163 ?auto_643159 ) ( SURFACE-AT ?auto_643155 ?auto_643159 ) ( CLEAR ?auto_643155 ) ( LIFTING ?auto_643161 ?auto_643156 ) ( IS-CRATE ?auto_643156 ) ( ON ?auto_643155 ?auto_643154 ) ( not ( = ?auto_643154 ?auto_643155 ) ) ( not ( = ?auto_643154 ?auto_643156 ) ) ( not ( = ?auto_643154 ?auto_643157 ) ) ( not ( = ?auto_643154 ?auto_643160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643155 ?auto_643156 ?auto_643157 )
      ( MAKE-3CRATE-VERIFY ?auto_643154 ?auto_643155 ?auto_643156 ?auto_643157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_643182 - SURFACE
      ?auto_643183 - SURFACE
      ?auto_643184 - SURFACE
      ?auto_643185 - SURFACE
    )
    :vars
    (
      ?auto_643187 - HOIST
      ?auto_643188 - PLACE
      ?auto_643189 - PLACE
      ?auto_643186 - HOIST
      ?auto_643191 - SURFACE
      ?auto_643190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643187 ?auto_643188 ) ( IS-CRATE ?auto_643185 ) ( not ( = ?auto_643184 ?auto_643185 ) ) ( not ( = ?auto_643183 ?auto_643184 ) ) ( not ( = ?auto_643183 ?auto_643185 ) ) ( not ( = ?auto_643189 ?auto_643188 ) ) ( HOIST-AT ?auto_643186 ?auto_643189 ) ( not ( = ?auto_643187 ?auto_643186 ) ) ( AVAILABLE ?auto_643186 ) ( SURFACE-AT ?auto_643185 ?auto_643189 ) ( ON ?auto_643185 ?auto_643191 ) ( CLEAR ?auto_643185 ) ( not ( = ?auto_643184 ?auto_643191 ) ) ( not ( = ?auto_643185 ?auto_643191 ) ) ( not ( = ?auto_643183 ?auto_643191 ) ) ( TRUCK-AT ?auto_643190 ?auto_643188 ) ( SURFACE-AT ?auto_643183 ?auto_643188 ) ( CLEAR ?auto_643183 ) ( IS-CRATE ?auto_643184 ) ( AVAILABLE ?auto_643187 ) ( IN ?auto_643184 ?auto_643190 ) ( ON ?auto_643183 ?auto_643182 ) ( not ( = ?auto_643182 ?auto_643183 ) ) ( not ( = ?auto_643182 ?auto_643184 ) ) ( not ( = ?auto_643182 ?auto_643185 ) ) ( not ( = ?auto_643182 ?auto_643191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643183 ?auto_643184 ?auto_643185 )
      ( MAKE-3CRATE-VERIFY ?auto_643182 ?auto_643183 ?auto_643184 ?auto_643185 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643261 - SURFACE
      ?auto_643262 - SURFACE
    )
    :vars
    (
      ?auto_643264 - HOIST
      ?auto_643267 - PLACE
      ?auto_643268 - SURFACE
      ?auto_643266 - PLACE
      ?auto_643263 - HOIST
      ?auto_643269 - SURFACE
      ?auto_643265 - TRUCK
      ?auto_643270 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643264 ?auto_643267 ) ( SURFACE-AT ?auto_643261 ?auto_643267 ) ( CLEAR ?auto_643261 ) ( IS-CRATE ?auto_643262 ) ( not ( = ?auto_643261 ?auto_643262 ) ) ( AVAILABLE ?auto_643264 ) ( ON ?auto_643261 ?auto_643268 ) ( not ( = ?auto_643268 ?auto_643261 ) ) ( not ( = ?auto_643268 ?auto_643262 ) ) ( not ( = ?auto_643266 ?auto_643267 ) ) ( HOIST-AT ?auto_643263 ?auto_643266 ) ( not ( = ?auto_643264 ?auto_643263 ) ) ( AVAILABLE ?auto_643263 ) ( SURFACE-AT ?auto_643262 ?auto_643266 ) ( ON ?auto_643262 ?auto_643269 ) ( CLEAR ?auto_643262 ) ( not ( = ?auto_643261 ?auto_643269 ) ) ( not ( = ?auto_643262 ?auto_643269 ) ) ( not ( = ?auto_643268 ?auto_643269 ) ) ( TRUCK-AT ?auto_643265 ?auto_643270 ) ( not ( = ?auto_643270 ?auto_643267 ) ) ( not ( = ?auto_643266 ?auto_643270 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_643265 ?auto_643270 ?auto_643267 )
      ( MAKE-1CRATE ?auto_643261 ?auto_643262 )
      ( MAKE-1CRATE-VERIFY ?auto_643261 ?auto_643262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_643367 - SURFACE
      ?auto_643368 - SURFACE
    )
    :vars
    (
      ?auto_643372 - HOIST
      ?auto_643369 - PLACE
      ?auto_643374 - SURFACE
      ?auto_643370 - PLACE
      ?auto_643373 - HOIST
      ?auto_643375 - SURFACE
      ?auto_643371 - TRUCK
      ?auto_643376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643372 ?auto_643369 ) ( SURFACE-AT ?auto_643367 ?auto_643369 ) ( CLEAR ?auto_643367 ) ( IS-CRATE ?auto_643368 ) ( not ( = ?auto_643367 ?auto_643368 ) ) ( ON ?auto_643367 ?auto_643374 ) ( not ( = ?auto_643374 ?auto_643367 ) ) ( not ( = ?auto_643374 ?auto_643368 ) ) ( not ( = ?auto_643370 ?auto_643369 ) ) ( HOIST-AT ?auto_643373 ?auto_643370 ) ( not ( = ?auto_643372 ?auto_643373 ) ) ( AVAILABLE ?auto_643373 ) ( SURFACE-AT ?auto_643368 ?auto_643370 ) ( ON ?auto_643368 ?auto_643375 ) ( CLEAR ?auto_643368 ) ( not ( = ?auto_643367 ?auto_643375 ) ) ( not ( = ?auto_643368 ?auto_643375 ) ) ( not ( = ?auto_643374 ?auto_643375 ) ) ( TRUCK-AT ?auto_643371 ?auto_643369 ) ( LIFTING ?auto_643372 ?auto_643376 ) ( IS-CRATE ?auto_643376 ) ( not ( = ?auto_643367 ?auto_643376 ) ) ( not ( = ?auto_643368 ?auto_643376 ) ) ( not ( = ?auto_643374 ?auto_643376 ) ) ( not ( = ?auto_643375 ?auto_643376 ) ) )
    :subtasks
    ( ( !LOAD ?auto_643372 ?auto_643376 ?auto_643371 ?auto_643369 )
      ( MAKE-1CRATE ?auto_643367 ?auto_643368 )
      ( MAKE-1CRATE-VERIFY ?auto_643367 ?auto_643368 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643475 - SURFACE
      ?auto_643476 - SURFACE
      ?auto_643477 - SURFACE
      ?auto_643479 - SURFACE
      ?auto_643478 - SURFACE
    )
    :vars
    (
      ?auto_643480 - HOIST
      ?auto_643481 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643480 ?auto_643481 ) ( SURFACE-AT ?auto_643479 ?auto_643481 ) ( CLEAR ?auto_643479 ) ( LIFTING ?auto_643480 ?auto_643478 ) ( IS-CRATE ?auto_643478 ) ( not ( = ?auto_643479 ?auto_643478 ) ) ( ON ?auto_643476 ?auto_643475 ) ( ON ?auto_643477 ?auto_643476 ) ( ON ?auto_643479 ?auto_643477 ) ( not ( = ?auto_643475 ?auto_643476 ) ) ( not ( = ?auto_643475 ?auto_643477 ) ) ( not ( = ?auto_643475 ?auto_643479 ) ) ( not ( = ?auto_643475 ?auto_643478 ) ) ( not ( = ?auto_643476 ?auto_643477 ) ) ( not ( = ?auto_643476 ?auto_643479 ) ) ( not ( = ?auto_643476 ?auto_643478 ) ) ( not ( = ?auto_643477 ?auto_643479 ) ) ( not ( = ?auto_643477 ?auto_643478 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643479 ?auto_643478 )
      ( MAKE-4CRATE-VERIFY ?auto_643475 ?auto_643476 ?auto_643477 ?auto_643479 ?auto_643478 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643500 - SURFACE
      ?auto_643501 - SURFACE
      ?auto_643502 - SURFACE
      ?auto_643504 - SURFACE
      ?auto_643503 - SURFACE
    )
    :vars
    (
      ?auto_643505 - HOIST
      ?auto_643507 - PLACE
      ?auto_643506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643505 ?auto_643507 ) ( SURFACE-AT ?auto_643504 ?auto_643507 ) ( CLEAR ?auto_643504 ) ( IS-CRATE ?auto_643503 ) ( not ( = ?auto_643504 ?auto_643503 ) ) ( TRUCK-AT ?auto_643506 ?auto_643507 ) ( AVAILABLE ?auto_643505 ) ( IN ?auto_643503 ?auto_643506 ) ( ON ?auto_643504 ?auto_643502 ) ( not ( = ?auto_643502 ?auto_643504 ) ) ( not ( = ?auto_643502 ?auto_643503 ) ) ( ON ?auto_643501 ?auto_643500 ) ( ON ?auto_643502 ?auto_643501 ) ( not ( = ?auto_643500 ?auto_643501 ) ) ( not ( = ?auto_643500 ?auto_643502 ) ) ( not ( = ?auto_643500 ?auto_643504 ) ) ( not ( = ?auto_643500 ?auto_643503 ) ) ( not ( = ?auto_643501 ?auto_643502 ) ) ( not ( = ?auto_643501 ?auto_643504 ) ) ( not ( = ?auto_643501 ?auto_643503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643502 ?auto_643504 ?auto_643503 )
      ( MAKE-4CRATE-VERIFY ?auto_643500 ?auto_643501 ?auto_643502 ?auto_643504 ?auto_643503 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643530 - SURFACE
      ?auto_643531 - SURFACE
      ?auto_643532 - SURFACE
      ?auto_643534 - SURFACE
      ?auto_643533 - SURFACE
    )
    :vars
    (
      ?auto_643535 - HOIST
      ?auto_643538 - PLACE
      ?auto_643537 - TRUCK
      ?auto_643536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643535 ?auto_643538 ) ( SURFACE-AT ?auto_643534 ?auto_643538 ) ( CLEAR ?auto_643534 ) ( IS-CRATE ?auto_643533 ) ( not ( = ?auto_643534 ?auto_643533 ) ) ( AVAILABLE ?auto_643535 ) ( IN ?auto_643533 ?auto_643537 ) ( ON ?auto_643534 ?auto_643532 ) ( not ( = ?auto_643532 ?auto_643534 ) ) ( not ( = ?auto_643532 ?auto_643533 ) ) ( TRUCK-AT ?auto_643537 ?auto_643536 ) ( not ( = ?auto_643536 ?auto_643538 ) ) ( ON ?auto_643531 ?auto_643530 ) ( ON ?auto_643532 ?auto_643531 ) ( not ( = ?auto_643530 ?auto_643531 ) ) ( not ( = ?auto_643530 ?auto_643532 ) ) ( not ( = ?auto_643530 ?auto_643534 ) ) ( not ( = ?auto_643530 ?auto_643533 ) ) ( not ( = ?auto_643531 ?auto_643532 ) ) ( not ( = ?auto_643531 ?auto_643534 ) ) ( not ( = ?auto_643531 ?auto_643533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643532 ?auto_643534 ?auto_643533 )
      ( MAKE-4CRATE-VERIFY ?auto_643530 ?auto_643531 ?auto_643532 ?auto_643534 ?auto_643533 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643564 - SURFACE
      ?auto_643565 - SURFACE
      ?auto_643566 - SURFACE
      ?auto_643568 - SURFACE
      ?auto_643567 - SURFACE
    )
    :vars
    (
      ?auto_643569 - HOIST
      ?auto_643571 - PLACE
      ?auto_643570 - TRUCK
      ?auto_643572 - PLACE
      ?auto_643573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_643569 ?auto_643571 ) ( SURFACE-AT ?auto_643568 ?auto_643571 ) ( CLEAR ?auto_643568 ) ( IS-CRATE ?auto_643567 ) ( not ( = ?auto_643568 ?auto_643567 ) ) ( AVAILABLE ?auto_643569 ) ( ON ?auto_643568 ?auto_643566 ) ( not ( = ?auto_643566 ?auto_643568 ) ) ( not ( = ?auto_643566 ?auto_643567 ) ) ( TRUCK-AT ?auto_643570 ?auto_643572 ) ( not ( = ?auto_643572 ?auto_643571 ) ) ( HOIST-AT ?auto_643573 ?auto_643572 ) ( LIFTING ?auto_643573 ?auto_643567 ) ( not ( = ?auto_643569 ?auto_643573 ) ) ( ON ?auto_643565 ?auto_643564 ) ( ON ?auto_643566 ?auto_643565 ) ( not ( = ?auto_643564 ?auto_643565 ) ) ( not ( = ?auto_643564 ?auto_643566 ) ) ( not ( = ?auto_643564 ?auto_643568 ) ) ( not ( = ?auto_643564 ?auto_643567 ) ) ( not ( = ?auto_643565 ?auto_643566 ) ) ( not ( = ?auto_643565 ?auto_643568 ) ) ( not ( = ?auto_643565 ?auto_643567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643566 ?auto_643568 ?auto_643567 )
      ( MAKE-4CRATE-VERIFY ?auto_643564 ?auto_643565 ?auto_643566 ?auto_643568 ?auto_643567 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643602 - SURFACE
      ?auto_643603 - SURFACE
      ?auto_643604 - SURFACE
      ?auto_643606 - SURFACE
      ?auto_643605 - SURFACE
    )
    :vars
    (
      ?auto_643612 - HOIST
      ?auto_643609 - PLACE
      ?auto_643610 - TRUCK
      ?auto_643608 - PLACE
      ?auto_643607 - HOIST
      ?auto_643611 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643612 ?auto_643609 ) ( SURFACE-AT ?auto_643606 ?auto_643609 ) ( CLEAR ?auto_643606 ) ( IS-CRATE ?auto_643605 ) ( not ( = ?auto_643606 ?auto_643605 ) ) ( AVAILABLE ?auto_643612 ) ( ON ?auto_643606 ?auto_643604 ) ( not ( = ?auto_643604 ?auto_643606 ) ) ( not ( = ?auto_643604 ?auto_643605 ) ) ( TRUCK-AT ?auto_643610 ?auto_643608 ) ( not ( = ?auto_643608 ?auto_643609 ) ) ( HOIST-AT ?auto_643607 ?auto_643608 ) ( not ( = ?auto_643612 ?auto_643607 ) ) ( AVAILABLE ?auto_643607 ) ( SURFACE-AT ?auto_643605 ?auto_643608 ) ( ON ?auto_643605 ?auto_643611 ) ( CLEAR ?auto_643605 ) ( not ( = ?auto_643606 ?auto_643611 ) ) ( not ( = ?auto_643605 ?auto_643611 ) ) ( not ( = ?auto_643604 ?auto_643611 ) ) ( ON ?auto_643603 ?auto_643602 ) ( ON ?auto_643604 ?auto_643603 ) ( not ( = ?auto_643602 ?auto_643603 ) ) ( not ( = ?auto_643602 ?auto_643604 ) ) ( not ( = ?auto_643602 ?auto_643606 ) ) ( not ( = ?auto_643602 ?auto_643605 ) ) ( not ( = ?auto_643602 ?auto_643611 ) ) ( not ( = ?auto_643603 ?auto_643604 ) ) ( not ( = ?auto_643603 ?auto_643606 ) ) ( not ( = ?auto_643603 ?auto_643605 ) ) ( not ( = ?auto_643603 ?auto_643611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643604 ?auto_643606 ?auto_643605 )
      ( MAKE-4CRATE-VERIFY ?auto_643602 ?auto_643603 ?auto_643604 ?auto_643606 ?auto_643605 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643641 - SURFACE
      ?auto_643642 - SURFACE
      ?auto_643643 - SURFACE
      ?auto_643645 - SURFACE
      ?auto_643644 - SURFACE
    )
    :vars
    (
      ?auto_643649 - HOIST
      ?auto_643646 - PLACE
      ?auto_643648 - PLACE
      ?auto_643651 - HOIST
      ?auto_643647 - SURFACE
      ?auto_643650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643649 ?auto_643646 ) ( SURFACE-AT ?auto_643645 ?auto_643646 ) ( CLEAR ?auto_643645 ) ( IS-CRATE ?auto_643644 ) ( not ( = ?auto_643645 ?auto_643644 ) ) ( AVAILABLE ?auto_643649 ) ( ON ?auto_643645 ?auto_643643 ) ( not ( = ?auto_643643 ?auto_643645 ) ) ( not ( = ?auto_643643 ?auto_643644 ) ) ( not ( = ?auto_643648 ?auto_643646 ) ) ( HOIST-AT ?auto_643651 ?auto_643648 ) ( not ( = ?auto_643649 ?auto_643651 ) ) ( AVAILABLE ?auto_643651 ) ( SURFACE-AT ?auto_643644 ?auto_643648 ) ( ON ?auto_643644 ?auto_643647 ) ( CLEAR ?auto_643644 ) ( not ( = ?auto_643645 ?auto_643647 ) ) ( not ( = ?auto_643644 ?auto_643647 ) ) ( not ( = ?auto_643643 ?auto_643647 ) ) ( TRUCK-AT ?auto_643650 ?auto_643646 ) ( ON ?auto_643642 ?auto_643641 ) ( ON ?auto_643643 ?auto_643642 ) ( not ( = ?auto_643641 ?auto_643642 ) ) ( not ( = ?auto_643641 ?auto_643643 ) ) ( not ( = ?auto_643641 ?auto_643645 ) ) ( not ( = ?auto_643641 ?auto_643644 ) ) ( not ( = ?auto_643641 ?auto_643647 ) ) ( not ( = ?auto_643642 ?auto_643643 ) ) ( not ( = ?auto_643642 ?auto_643645 ) ) ( not ( = ?auto_643642 ?auto_643644 ) ) ( not ( = ?auto_643642 ?auto_643647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643643 ?auto_643645 ?auto_643644 )
      ( MAKE-4CRATE-VERIFY ?auto_643641 ?auto_643642 ?auto_643643 ?auto_643645 ?auto_643644 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643680 - SURFACE
      ?auto_643681 - SURFACE
      ?auto_643682 - SURFACE
      ?auto_643684 - SURFACE
      ?auto_643683 - SURFACE
    )
    :vars
    (
      ?auto_643686 - HOIST
      ?auto_643688 - PLACE
      ?auto_643689 - PLACE
      ?auto_643687 - HOIST
      ?auto_643685 - SURFACE
      ?auto_643690 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643686 ?auto_643688 ) ( IS-CRATE ?auto_643683 ) ( not ( = ?auto_643684 ?auto_643683 ) ) ( not ( = ?auto_643682 ?auto_643684 ) ) ( not ( = ?auto_643682 ?auto_643683 ) ) ( not ( = ?auto_643689 ?auto_643688 ) ) ( HOIST-AT ?auto_643687 ?auto_643689 ) ( not ( = ?auto_643686 ?auto_643687 ) ) ( AVAILABLE ?auto_643687 ) ( SURFACE-AT ?auto_643683 ?auto_643689 ) ( ON ?auto_643683 ?auto_643685 ) ( CLEAR ?auto_643683 ) ( not ( = ?auto_643684 ?auto_643685 ) ) ( not ( = ?auto_643683 ?auto_643685 ) ) ( not ( = ?auto_643682 ?auto_643685 ) ) ( TRUCK-AT ?auto_643690 ?auto_643688 ) ( SURFACE-AT ?auto_643682 ?auto_643688 ) ( CLEAR ?auto_643682 ) ( LIFTING ?auto_643686 ?auto_643684 ) ( IS-CRATE ?auto_643684 ) ( ON ?auto_643681 ?auto_643680 ) ( ON ?auto_643682 ?auto_643681 ) ( not ( = ?auto_643680 ?auto_643681 ) ) ( not ( = ?auto_643680 ?auto_643682 ) ) ( not ( = ?auto_643680 ?auto_643684 ) ) ( not ( = ?auto_643680 ?auto_643683 ) ) ( not ( = ?auto_643680 ?auto_643685 ) ) ( not ( = ?auto_643681 ?auto_643682 ) ) ( not ( = ?auto_643681 ?auto_643684 ) ) ( not ( = ?auto_643681 ?auto_643683 ) ) ( not ( = ?auto_643681 ?auto_643685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643682 ?auto_643684 ?auto_643683 )
      ( MAKE-4CRATE-VERIFY ?auto_643680 ?auto_643681 ?auto_643682 ?auto_643684 ?auto_643683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_643719 - SURFACE
      ?auto_643720 - SURFACE
      ?auto_643721 - SURFACE
      ?auto_643723 - SURFACE
      ?auto_643722 - SURFACE
    )
    :vars
    (
      ?auto_643727 - HOIST
      ?auto_643724 - PLACE
      ?auto_643726 - PLACE
      ?auto_643729 - HOIST
      ?auto_643728 - SURFACE
      ?auto_643725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643727 ?auto_643724 ) ( IS-CRATE ?auto_643722 ) ( not ( = ?auto_643723 ?auto_643722 ) ) ( not ( = ?auto_643721 ?auto_643723 ) ) ( not ( = ?auto_643721 ?auto_643722 ) ) ( not ( = ?auto_643726 ?auto_643724 ) ) ( HOIST-AT ?auto_643729 ?auto_643726 ) ( not ( = ?auto_643727 ?auto_643729 ) ) ( AVAILABLE ?auto_643729 ) ( SURFACE-AT ?auto_643722 ?auto_643726 ) ( ON ?auto_643722 ?auto_643728 ) ( CLEAR ?auto_643722 ) ( not ( = ?auto_643723 ?auto_643728 ) ) ( not ( = ?auto_643722 ?auto_643728 ) ) ( not ( = ?auto_643721 ?auto_643728 ) ) ( TRUCK-AT ?auto_643725 ?auto_643724 ) ( SURFACE-AT ?auto_643721 ?auto_643724 ) ( CLEAR ?auto_643721 ) ( IS-CRATE ?auto_643723 ) ( AVAILABLE ?auto_643727 ) ( IN ?auto_643723 ?auto_643725 ) ( ON ?auto_643720 ?auto_643719 ) ( ON ?auto_643721 ?auto_643720 ) ( not ( = ?auto_643719 ?auto_643720 ) ) ( not ( = ?auto_643719 ?auto_643721 ) ) ( not ( = ?auto_643719 ?auto_643723 ) ) ( not ( = ?auto_643719 ?auto_643722 ) ) ( not ( = ?auto_643719 ?auto_643728 ) ) ( not ( = ?auto_643720 ?auto_643721 ) ) ( not ( = ?auto_643720 ?auto_643723 ) ) ( not ( = ?auto_643720 ?auto_643722 ) ) ( not ( = ?auto_643720 ?auto_643728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_643721 ?auto_643723 ?auto_643722 )
      ( MAKE-4CRATE-VERIFY ?auto_643719 ?auto_643720 ?auto_643721 ?auto_643723 ?auto_643722 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644379 - SURFACE
      ?auto_644380 - SURFACE
      ?auto_644381 - SURFACE
      ?auto_644383 - SURFACE
      ?auto_644382 - SURFACE
      ?auto_644384 - SURFACE
    )
    :vars
    (
      ?auto_644386 - HOIST
      ?auto_644385 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644386 ?auto_644385 ) ( SURFACE-AT ?auto_644382 ?auto_644385 ) ( CLEAR ?auto_644382 ) ( LIFTING ?auto_644386 ?auto_644384 ) ( IS-CRATE ?auto_644384 ) ( not ( = ?auto_644382 ?auto_644384 ) ) ( ON ?auto_644380 ?auto_644379 ) ( ON ?auto_644381 ?auto_644380 ) ( ON ?auto_644383 ?auto_644381 ) ( ON ?auto_644382 ?auto_644383 ) ( not ( = ?auto_644379 ?auto_644380 ) ) ( not ( = ?auto_644379 ?auto_644381 ) ) ( not ( = ?auto_644379 ?auto_644383 ) ) ( not ( = ?auto_644379 ?auto_644382 ) ) ( not ( = ?auto_644379 ?auto_644384 ) ) ( not ( = ?auto_644380 ?auto_644381 ) ) ( not ( = ?auto_644380 ?auto_644383 ) ) ( not ( = ?auto_644380 ?auto_644382 ) ) ( not ( = ?auto_644380 ?auto_644384 ) ) ( not ( = ?auto_644381 ?auto_644383 ) ) ( not ( = ?auto_644381 ?auto_644382 ) ) ( not ( = ?auto_644381 ?auto_644384 ) ) ( not ( = ?auto_644383 ?auto_644382 ) ) ( not ( = ?auto_644383 ?auto_644384 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_644382 ?auto_644384 )
      ( MAKE-5CRATE-VERIFY ?auto_644379 ?auto_644380 ?auto_644381 ?auto_644383 ?auto_644382 ?auto_644384 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644413 - SURFACE
      ?auto_644414 - SURFACE
      ?auto_644415 - SURFACE
      ?auto_644417 - SURFACE
      ?auto_644416 - SURFACE
      ?auto_644418 - SURFACE
    )
    :vars
    (
      ?auto_644419 - HOIST
      ?auto_644421 - PLACE
      ?auto_644420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644419 ?auto_644421 ) ( SURFACE-AT ?auto_644416 ?auto_644421 ) ( CLEAR ?auto_644416 ) ( IS-CRATE ?auto_644418 ) ( not ( = ?auto_644416 ?auto_644418 ) ) ( TRUCK-AT ?auto_644420 ?auto_644421 ) ( AVAILABLE ?auto_644419 ) ( IN ?auto_644418 ?auto_644420 ) ( ON ?auto_644416 ?auto_644417 ) ( not ( = ?auto_644417 ?auto_644416 ) ) ( not ( = ?auto_644417 ?auto_644418 ) ) ( ON ?auto_644414 ?auto_644413 ) ( ON ?auto_644415 ?auto_644414 ) ( ON ?auto_644417 ?auto_644415 ) ( not ( = ?auto_644413 ?auto_644414 ) ) ( not ( = ?auto_644413 ?auto_644415 ) ) ( not ( = ?auto_644413 ?auto_644417 ) ) ( not ( = ?auto_644413 ?auto_644416 ) ) ( not ( = ?auto_644413 ?auto_644418 ) ) ( not ( = ?auto_644414 ?auto_644415 ) ) ( not ( = ?auto_644414 ?auto_644417 ) ) ( not ( = ?auto_644414 ?auto_644416 ) ) ( not ( = ?auto_644414 ?auto_644418 ) ) ( not ( = ?auto_644415 ?auto_644417 ) ) ( not ( = ?auto_644415 ?auto_644416 ) ) ( not ( = ?auto_644415 ?auto_644418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644417 ?auto_644416 ?auto_644418 )
      ( MAKE-5CRATE-VERIFY ?auto_644413 ?auto_644414 ?auto_644415 ?auto_644417 ?auto_644416 ?auto_644418 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644453 - SURFACE
      ?auto_644454 - SURFACE
      ?auto_644455 - SURFACE
      ?auto_644457 - SURFACE
      ?auto_644456 - SURFACE
      ?auto_644458 - SURFACE
    )
    :vars
    (
      ?auto_644461 - HOIST
      ?auto_644459 - PLACE
      ?auto_644462 - TRUCK
      ?auto_644460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644461 ?auto_644459 ) ( SURFACE-AT ?auto_644456 ?auto_644459 ) ( CLEAR ?auto_644456 ) ( IS-CRATE ?auto_644458 ) ( not ( = ?auto_644456 ?auto_644458 ) ) ( AVAILABLE ?auto_644461 ) ( IN ?auto_644458 ?auto_644462 ) ( ON ?auto_644456 ?auto_644457 ) ( not ( = ?auto_644457 ?auto_644456 ) ) ( not ( = ?auto_644457 ?auto_644458 ) ) ( TRUCK-AT ?auto_644462 ?auto_644460 ) ( not ( = ?auto_644460 ?auto_644459 ) ) ( ON ?auto_644454 ?auto_644453 ) ( ON ?auto_644455 ?auto_644454 ) ( ON ?auto_644457 ?auto_644455 ) ( not ( = ?auto_644453 ?auto_644454 ) ) ( not ( = ?auto_644453 ?auto_644455 ) ) ( not ( = ?auto_644453 ?auto_644457 ) ) ( not ( = ?auto_644453 ?auto_644456 ) ) ( not ( = ?auto_644453 ?auto_644458 ) ) ( not ( = ?auto_644454 ?auto_644455 ) ) ( not ( = ?auto_644454 ?auto_644457 ) ) ( not ( = ?auto_644454 ?auto_644456 ) ) ( not ( = ?auto_644454 ?auto_644458 ) ) ( not ( = ?auto_644455 ?auto_644457 ) ) ( not ( = ?auto_644455 ?auto_644456 ) ) ( not ( = ?auto_644455 ?auto_644458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644457 ?auto_644456 ?auto_644458 )
      ( MAKE-5CRATE-VERIFY ?auto_644453 ?auto_644454 ?auto_644455 ?auto_644457 ?auto_644456 ?auto_644458 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644498 - SURFACE
      ?auto_644499 - SURFACE
      ?auto_644500 - SURFACE
      ?auto_644502 - SURFACE
      ?auto_644501 - SURFACE
      ?auto_644503 - SURFACE
    )
    :vars
    (
      ?auto_644506 - HOIST
      ?auto_644505 - PLACE
      ?auto_644507 - TRUCK
      ?auto_644504 - PLACE
      ?auto_644508 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_644506 ?auto_644505 ) ( SURFACE-AT ?auto_644501 ?auto_644505 ) ( CLEAR ?auto_644501 ) ( IS-CRATE ?auto_644503 ) ( not ( = ?auto_644501 ?auto_644503 ) ) ( AVAILABLE ?auto_644506 ) ( ON ?auto_644501 ?auto_644502 ) ( not ( = ?auto_644502 ?auto_644501 ) ) ( not ( = ?auto_644502 ?auto_644503 ) ) ( TRUCK-AT ?auto_644507 ?auto_644504 ) ( not ( = ?auto_644504 ?auto_644505 ) ) ( HOIST-AT ?auto_644508 ?auto_644504 ) ( LIFTING ?auto_644508 ?auto_644503 ) ( not ( = ?auto_644506 ?auto_644508 ) ) ( ON ?auto_644499 ?auto_644498 ) ( ON ?auto_644500 ?auto_644499 ) ( ON ?auto_644502 ?auto_644500 ) ( not ( = ?auto_644498 ?auto_644499 ) ) ( not ( = ?auto_644498 ?auto_644500 ) ) ( not ( = ?auto_644498 ?auto_644502 ) ) ( not ( = ?auto_644498 ?auto_644501 ) ) ( not ( = ?auto_644498 ?auto_644503 ) ) ( not ( = ?auto_644499 ?auto_644500 ) ) ( not ( = ?auto_644499 ?auto_644502 ) ) ( not ( = ?auto_644499 ?auto_644501 ) ) ( not ( = ?auto_644499 ?auto_644503 ) ) ( not ( = ?auto_644500 ?auto_644502 ) ) ( not ( = ?auto_644500 ?auto_644501 ) ) ( not ( = ?auto_644500 ?auto_644503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644502 ?auto_644501 ?auto_644503 )
      ( MAKE-5CRATE-VERIFY ?auto_644498 ?auto_644499 ?auto_644500 ?auto_644502 ?auto_644501 ?auto_644503 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644548 - SURFACE
      ?auto_644549 - SURFACE
      ?auto_644550 - SURFACE
      ?auto_644552 - SURFACE
      ?auto_644551 - SURFACE
      ?auto_644553 - SURFACE
    )
    :vars
    (
      ?auto_644557 - HOIST
      ?auto_644556 - PLACE
      ?auto_644558 - TRUCK
      ?auto_644554 - PLACE
      ?auto_644559 - HOIST
      ?auto_644555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_644557 ?auto_644556 ) ( SURFACE-AT ?auto_644551 ?auto_644556 ) ( CLEAR ?auto_644551 ) ( IS-CRATE ?auto_644553 ) ( not ( = ?auto_644551 ?auto_644553 ) ) ( AVAILABLE ?auto_644557 ) ( ON ?auto_644551 ?auto_644552 ) ( not ( = ?auto_644552 ?auto_644551 ) ) ( not ( = ?auto_644552 ?auto_644553 ) ) ( TRUCK-AT ?auto_644558 ?auto_644554 ) ( not ( = ?auto_644554 ?auto_644556 ) ) ( HOIST-AT ?auto_644559 ?auto_644554 ) ( not ( = ?auto_644557 ?auto_644559 ) ) ( AVAILABLE ?auto_644559 ) ( SURFACE-AT ?auto_644553 ?auto_644554 ) ( ON ?auto_644553 ?auto_644555 ) ( CLEAR ?auto_644553 ) ( not ( = ?auto_644551 ?auto_644555 ) ) ( not ( = ?auto_644553 ?auto_644555 ) ) ( not ( = ?auto_644552 ?auto_644555 ) ) ( ON ?auto_644549 ?auto_644548 ) ( ON ?auto_644550 ?auto_644549 ) ( ON ?auto_644552 ?auto_644550 ) ( not ( = ?auto_644548 ?auto_644549 ) ) ( not ( = ?auto_644548 ?auto_644550 ) ) ( not ( = ?auto_644548 ?auto_644552 ) ) ( not ( = ?auto_644548 ?auto_644551 ) ) ( not ( = ?auto_644548 ?auto_644553 ) ) ( not ( = ?auto_644548 ?auto_644555 ) ) ( not ( = ?auto_644549 ?auto_644550 ) ) ( not ( = ?auto_644549 ?auto_644552 ) ) ( not ( = ?auto_644549 ?auto_644551 ) ) ( not ( = ?auto_644549 ?auto_644553 ) ) ( not ( = ?auto_644549 ?auto_644555 ) ) ( not ( = ?auto_644550 ?auto_644552 ) ) ( not ( = ?auto_644550 ?auto_644551 ) ) ( not ( = ?auto_644550 ?auto_644553 ) ) ( not ( = ?auto_644550 ?auto_644555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644552 ?auto_644551 ?auto_644553 )
      ( MAKE-5CRATE-VERIFY ?auto_644548 ?auto_644549 ?auto_644550 ?auto_644552 ?auto_644551 ?auto_644553 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644599 - SURFACE
      ?auto_644600 - SURFACE
      ?auto_644601 - SURFACE
      ?auto_644603 - SURFACE
      ?auto_644602 - SURFACE
      ?auto_644604 - SURFACE
    )
    :vars
    (
      ?auto_644607 - HOIST
      ?auto_644605 - PLACE
      ?auto_644610 - PLACE
      ?auto_644606 - HOIST
      ?auto_644608 - SURFACE
      ?auto_644609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644607 ?auto_644605 ) ( SURFACE-AT ?auto_644602 ?auto_644605 ) ( CLEAR ?auto_644602 ) ( IS-CRATE ?auto_644604 ) ( not ( = ?auto_644602 ?auto_644604 ) ) ( AVAILABLE ?auto_644607 ) ( ON ?auto_644602 ?auto_644603 ) ( not ( = ?auto_644603 ?auto_644602 ) ) ( not ( = ?auto_644603 ?auto_644604 ) ) ( not ( = ?auto_644610 ?auto_644605 ) ) ( HOIST-AT ?auto_644606 ?auto_644610 ) ( not ( = ?auto_644607 ?auto_644606 ) ) ( AVAILABLE ?auto_644606 ) ( SURFACE-AT ?auto_644604 ?auto_644610 ) ( ON ?auto_644604 ?auto_644608 ) ( CLEAR ?auto_644604 ) ( not ( = ?auto_644602 ?auto_644608 ) ) ( not ( = ?auto_644604 ?auto_644608 ) ) ( not ( = ?auto_644603 ?auto_644608 ) ) ( TRUCK-AT ?auto_644609 ?auto_644605 ) ( ON ?auto_644600 ?auto_644599 ) ( ON ?auto_644601 ?auto_644600 ) ( ON ?auto_644603 ?auto_644601 ) ( not ( = ?auto_644599 ?auto_644600 ) ) ( not ( = ?auto_644599 ?auto_644601 ) ) ( not ( = ?auto_644599 ?auto_644603 ) ) ( not ( = ?auto_644599 ?auto_644602 ) ) ( not ( = ?auto_644599 ?auto_644604 ) ) ( not ( = ?auto_644599 ?auto_644608 ) ) ( not ( = ?auto_644600 ?auto_644601 ) ) ( not ( = ?auto_644600 ?auto_644603 ) ) ( not ( = ?auto_644600 ?auto_644602 ) ) ( not ( = ?auto_644600 ?auto_644604 ) ) ( not ( = ?auto_644600 ?auto_644608 ) ) ( not ( = ?auto_644601 ?auto_644603 ) ) ( not ( = ?auto_644601 ?auto_644602 ) ) ( not ( = ?auto_644601 ?auto_644604 ) ) ( not ( = ?auto_644601 ?auto_644608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644603 ?auto_644602 ?auto_644604 )
      ( MAKE-5CRATE-VERIFY ?auto_644599 ?auto_644600 ?auto_644601 ?auto_644603 ?auto_644602 ?auto_644604 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644650 - SURFACE
      ?auto_644651 - SURFACE
      ?auto_644652 - SURFACE
      ?auto_644654 - SURFACE
      ?auto_644653 - SURFACE
      ?auto_644655 - SURFACE
    )
    :vars
    (
      ?auto_644657 - HOIST
      ?auto_644656 - PLACE
      ?auto_644661 - PLACE
      ?auto_644659 - HOIST
      ?auto_644660 - SURFACE
      ?auto_644658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644657 ?auto_644656 ) ( IS-CRATE ?auto_644655 ) ( not ( = ?auto_644653 ?auto_644655 ) ) ( not ( = ?auto_644654 ?auto_644653 ) ) ( not ( = ?auto_644654 ?auto_644655 ) ) ( not ( = ?auto_644661 ?auto_644656 ) ) ( HOIST-AT ?auto_644659 ?auto_644661 ) ( not ( = ?auto_644657 ?auto_644659 ) ) ( AVAILABLE ?auto_644659 ) ( SURFACE-AT ?auto_644655 ?auto_644661 ) ( ON ?auto_644655 ?auto_644660 ) ( CLEAR ?auto_644655 ) ( not ( = ?auto_644653 ?auto_644660 ) ) ( not ( = ?auto_644655 ?auto_644660 ) ) ( not ( = ?auto_644654 ?auto_644660 ) ) ( TRUCK-AT ?auto_644658 ?auto_644656 ) ( SURFACE-AT ?auto_644654 ?auto_644656 ) ( CLEAR ?auto_644654 ) ( LIFTING ?auto_644657 ?auto_644653 ) ( IS-CRATE ?auto_644653 ) ( ON ?auto_644651 ?auto_644650 ) ( ON ?auto_644652 ?auto_644651 ) ( ON ?auto_644654 ?auto_644652 ) ( not ( = ?auto_644650 ?auto_644651 ) ) ( not ( = ?auto_644650 ?auto_644652 ) ) ( not ( = ?auto_644650 ?auto_644654 ) ) ( not ( = ?auto_644650 ?auto_644653 ) ) ( not ( = ?auto_644650 ?auto_644655 ) ) ( not ( = ?auto_644650 ?auto_644660 ) ) ( not ( = ?auto_644651 ?auto_644652 ) ) ( not ( = ?auto_644651 ?auto_644654 ) ) ( not ( = ?auto_644651 ?auto_644653 ) ) ( not ( = ?auto_644651 ?auto_644655 ) ) ( not ( = ?auto_644651 ?auto_644660 ) ) ( not ( = ?auto_644652 ?auto_644654 ) ) ( not ( = ?auto_644652 ?auto_644653 ) ) ( not ( = ?auto_644652 ?auto_644655 ) ) ( not ( = ?auto_644652 ?auto_644660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644654 ?auto_644653 ?auto_644655 )
      ( MAKE-5CRATE-VERIFY ?auto_644650 ?auto_644651 ?auto_644652 ?auto_644654 ?auto_644653 ?auto_644655 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_644701 - SURFACE
      ?auto_644702 - SURFACE
      ?auto_644703 - SURFACE
      ?auto_644705 - SURFACE
      ?auto_644704 - SURFACE
      ?auto_644706 - SURFACE
    )
    :vars
    (
      ?auto_644707 - HOIST
      ?auto_644709 - PLACE
      ?auto_644711 - PLACE
      ?auto_644710 - HOIST
      ?auto_644712 - SURFACE
      ?auto_644708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644707 ?auto_644709 ) ( IS-CRATE ?auto_644706 ) ( not ( = ?auto_644704 ?auto_644706 ) ) ( not ( = ?auto_644705 ?auto_644704 ) ) ( not ( = ?auto_644705 ?auto_644706 ) ) ( not ( = ?auto_644711 ?auto_644709 ) ) ( HOIST-AT ?auto_644710 ?auto_644711 ) ( not ( = ?auto_644707 ?auto_644710 ) ) ( AVAILABLE ?auto_644710 ) ( SURFACE-AT ?auto_644706 ?auto_644711 ) ( ON ?auto_644706 ?auto_644712 ) ( CLEAR ?auto_644706 ) ( not ( = ?auto_644704 ?auto_644712 ) ) ( not ( = ?auto_644706 ?auto_644712 ) ) ( not ( = ?auto_644705 ?auto_644712 ) ) ( TRUCK-AT ?auto_644708 ?auto_644709 ) ( SURFACE-AT ?auto_644705 ?auto_644709 ) ( CLEAR ?auto_644705 ) ( IS-CRATE ?auto_644704 ) ( AVAILABLE ?auto_644707 ) ( IN ?auto_644704 ?auto_644708 ) ( ON ?auto_644702 ?auto_644701 ) ( ON ?auto_644703 ?auto_644702 ) ( ON ?auto_644705 ?auto_644703 ) ( not ( = ?auto_644701 ?auto_644702 ) ) ( not ( = ?auto_644701 ?auto_644703 ) ) ( not ( = ?auto_644701 ?auto_644705 ) ) ( not ( = ?auto_644701 ?auto_644704 ) ) ( not ( = ?auto_644701 ?auto_644706 ) ) ( not ( = ?auto_644701 ?auto_644712 ) ) ( not ( = ?auto_644702 ?auto_644703 ) ) ( not ( = ?auto_644702 ?auto_644705 ) ) ( not ( = ?auto_644702 ?auto_644704 ) ) ( not ( = ?auto_644702 ?auto_644706 ) ) ( not ( = ?auto_644702 ?auto_644712 ) ) ( not ( = ?auto_644703 ?auto_644705 ) ) ( not ( = ?auto_644703 ?auto_644704 ) ) ( not ( = ?auto_644703 ?auto_644706 ) ) ( not ( = ?auto_644703 ?auto_644712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_644705 ?auto_644704 ?auto_644706 )
      ( MAKE-5CRATE-VERIFY ?auto_644701 ?auto_644702 ?auto_644703 ?auto_644705 ?auto_644704 ?auto_644706 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_645910 - SURFACE
      ?auto_645911 - SURFACE
      ?auto_645912 - SURFACE
      ?auto_645914 - SURFACE
      ?auto_645913 - SURFACE
      ?auto_645915 - SURFACE
      ?auto_645916 - SURFACE
    )
    :vars
    (
      ?auto_645917 - HOIST
      ?auto_645918 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_645917 ?auto_645918 ) ( SURFACE-AT ?auto_645915 ?auto_645918 ) ( CLEAR ?auto_645915 ) ( LIFTING ?auto_645917 ?auto_645916 ) ( IS-CRATE ?auto_645916 ) ( not ( = ?auto_645915 ?auto_645916 ) ) ( ON ?auto_645911 ?auto_645910 ) ( ON ?auto_645912 ?auto_645911 ) ( ON ?auto_645914 ?auto_645912 ) ( ON ?auto_645913 ?auto_645914 ) ( ON ?auto_645915 ?auto_645913 ) ( not ( = ?auto_645910 ?auto_645911 ) ) ( not ( = ?auto_645910 ?auto_645912 ) ) ( not ( = ?auto_645910 ?auto_645914 ) ) ( not ( = ?auto_645910 ?auto_645913 ) ) ( not ( = ?auto_645910 ?auto_645915 ) ) ( not ( = ?auto_645910 ?auto_645916 ) ) ( not ( = ?auto_645911 ?auto_645912 ) ) ( not ( = ?auto_645911 ?auto_645914 ) ) ( not ( = ?auto_645911 ?auto_645913 ) ) ( not ( = ?auto_645911 ?auto_645915 ) ) ( not ( = ?auto_645911 ?auto_645916 ) ) ( not ( = ?auto_645912 ?auto_645914 ) ) ( not ( = ?auto_645912 ?auto_645913 ) ) ( not ( = ?auto_645912 ?auto_645915 ) ) ( not ( = ?auto_645912 ?auto_645916 ) ) ( not ( = ?auto_645914 ?auto_645913 ) ) ( not ( = ?auto_645914 ?auto_645915 ) ) ( not ( = ?auto_645914 ?auto_645916 ) ) ( not ( = ?auto_645913 ?auto_645915 ) ) ( not ( = ?auto_645913 ?auto_645916 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_645915 ?auto_645916 )
      ( MAKE-6CRATE-VERIFY ?auto_645910 ?auto_645911 ?auto_645912 ?auto_645914 ?auto_645913 ?auto_645915 ?auto_645916 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_645954 - SURFACE
      ?auto_645955 - SURFACE
      ?auto_645956 - SURFACE
      ?auto_645958 - SURFACE
      ?auto_645957 - SURFACE
      ?auto_645959 - SURFACE
      ?auto_645960 - SURFACE
    )
    :vars
    (
      ?auto_645963 - HOIST
      ?auto_645962 - PLACE
      ?auto_645961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_645963 ?auto_645962 ) ( SURFACE-AT ?auto_645959 ?auto_645962 ) ( CLEAR ?auto_645959 ) ( IS-CRATE ?auto_645960 ) ( not ( = ?auto_645959 ?auto_645960 ) ) ( TRUCK-AT ?auto_645961 ?auto_645962 ) ( AVAILABLE ?auto_645963 ) ( IN ?auto_645960 ?auto_645961 ) ( ON ?auto_645959 ?auto_645957 ) ( not ( = ?auto_645957 ?auto_645959 ) ) ( not ( = ?auto_645957 ?auto_645960 ) ) ( ON ?auto_645955 ?auto_645954 ) ( ON ?auto_645956 ?auto_645955 ) ( ON ?auto_645958 ?auto_645956 ) ( ON ?auto_645957 ?auto_645958 ) ( not ( = ?auto_645954 ?auto_645955 ) ) ( not ( = ?auto_645954 ?auto_645956 ) ) ( not ( = ?auto_645954 ?auto_645958 ) ) ( not ( = ?auto_645954 ?auto_645957 ) ) ( not ( = ?auto_645954 ?auto_645959 ) ) ( not ( = ?auto_645954 ?auto_645960 ) ) ( not ( = ?auto_645955 ?auto_645956 ) ) ( not ( = ?auto_645955 ?auto_645958 ) ) ( not ( = ?auto_645955 ?auto_645957 ) ) ( not ( = ?auto_645955 ?auto_645959 ) ) ( not ( = ?auto_645955 ?auto_645960 ) ) ( not ( = ?auto_645956 ?auto_645958 ) ) ( not ( = ?auto_645956 ?auto_645957 ) ) ( not ( = ?auto_645956 ?auto_645959 ) ) ( not ( = ?auto_645956 ?auto_645960 ) ) ( not ( = ?auto_645958 ?auto_645957 ) ) ( not ( = ?auto_645958 ?auto_645959 ) ) ( not ( = ?auto_645958 ?auto_645960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_645957 ?auto_645959 ?auto_645960 )
      ( MAKE-6CRATE-VERIFY ?auto_645954 ?auto_645955 ?auto_645956 ?auto_645958 ?auto_645957 ?auto_645959 ?auto_645960 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646005 - SURFACE
      ?auto_646006 - SURFACE
      ?auto_646007 - SURFACE
      ?auto_646009 - SURFACE
      ?auto_646008 - SURFACE
      ?auto_646010 - SURFACE
      ?auto_646011 - SURFACE
    )
    :vars
    (
      ?auto_646014 - HOIST
      ?auto_646012 - PLACE
      ?auto_646015 - TRUCK
      ?auto_646013 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646014 ?auto_646012 ) ( SURFACE-AT ?auto_646010 ?auto_646012 ) ( CLEAR ?auto_646010 ) ( IS-CRATE ?auto_646011 ) ( not ( = ?auto_646010 ?auto_646011 ) ) ( AVAILABLE ?auto_646014 ) ( IN ?auto_646011 ?auto_646015 ) ( ON ?auto_646010 ?auto_646008 ) ( not ( = ?auto_646008 ?auto_646010 ) ) ( not ( = ?auto_646008 ?auto_646011 ) ) ( TRUCK-AT ?auto_646015 ?auto_646013 ) ( not ( = ?auto_646013 ?auto_646012 ) ) ( ON ?auto_646006 ?auto_646005 ) ( ON ?auto_646007 ?auto_646006 ) ( ON ?auto_646009 ?auto_646007 ) ( ON ?auto_646008 ?auto_646009 ) ( not ( = ?auto_646005 ?auto_646006 ) ) ( not ( = ?auto_646005 ?auto_646007 ) ) ( not ( = ?auto_646005 ?auto_646009 ) ) ( not ( = ?auto_646005 ?auto_646008 ) ) ( not ( = ?auto_646005 ?auto_646010 ) ) ( not ( = ?auto_646005 ?auto_646011 ) ) ( not ( = ?auto_646006 ?auto_646007 ) ) ( not ( = ?auto_646006 ?auto_646009 ) ) ( not ( = ?auto_646006 ?auto_646008 ) ) ( not ( = ?auto_646006 ?auto_646010 ) ) ( not ( = ?auto_646006 ?auto_646011 ) ) ( not ( = ?auto_646007 ?auto_646009 ) ) ( not ( = ?auto_646007 ?auto_646008 ) ) ( not ( = ?auto_646007 ?auto_646010 ) ) ( not ( = ?auto_646007 ?auto_646011 ) ) ( not ( = ?auto_646009 ?auto_646008 ) ) ( not ( = ?auto_646009 ?auto_646010 ) ) ( not ( = ?auto_646009 ?auto_646011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646008 ?auto_646010 ?auto_646011 )
      ( MAKE-6CRATE-VERIFY ?auto_646005 ?auto_646006 ?auto_646007 ?auto_646009 ?auto_646008 ?auto_646010 ?auto_646011 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646062 - SURFACE
      ?auto_646063 - SURFACE
      ?auto_646064 - SURFACE
      ?auto_646066 - SURFACE
      ?auto_646065 - SURFACE
      ?auto_646067 - SURFACE
      ?auto_646068 - SURFACE
    )
    :vars
    (
      ?auto_646072 - HOIST
      ?auto_646070 - PLACE
      ?auto_646073 - TRUCK
      ?auto_646071 - PLACE
      ?auto_646069 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_646072 ?auto_646070 ) ( SURFACE-AT ?auto_646067 ?auto_646070 ) ( CLEAR ?auto_646067 ) ( IS-CRATE ?auto_646068 ) ( not ( = ?auto_646067 ?auto_646068 ) ) ( AVAILABLE ?auto_646072 ) ( ON ?auto_646067 ?auto_646065 ) ( not ( = ?auto_646065 ?auto_646067 ) ) ( not ( = ?auto_646065 ?auto_646068 ) ) ( TRUCK-AT ?auto_646073 ?auto_646071 ) ( not ( = ?auto_646071 ?auto_646070 ) ) ( HOIST-AT ?auto_646069 ?auto_646071 ) ( LIFTING ?auto_646069 ?auto_646068 ) ( not ( = ?auto_646072 ?auto_646069 ) ) ( ON ?auto_646063 ?auto_646062 ) ( ON ?auto_646064 ?auto_646063 ) ( ON ?auto_646066 ?auto_646064 ) ( ON ?auto_646065 ?auto_646066 ) ( not ( = ?auto_646062 ?auto_646063 ) ) ( not ( = ?auto_646062 ?auto_646064 ) ) ( not ( = ?auto_646062 ?auto_646066 ) ) ( not ( = ?auto_646062 ?auto_646065 ) ) ( not ( = ?auto_646062 ?auto_646067 ) ) ( not ( = ?auto_646062 ?auto_646068 ) ) ( not ( = ?auto_646063 ?auto_646064 ) ) ( not ( = ?auto_646063 ?auto_646066 ) ) ( not ( = ?auto_646063 ?auto_646065 ) ) ( not ( = ?auto_646063 ?auto_646067 ) ) ( not ( = ?auto_646063 ?auto_646068 ) ) ( not ( = ?auto_646064 ?auto_646066 ) ) ( not ( = ?auto_646064 ?auto_646065 ) ) ( not ( = ?auto_646064 ?auto_646067 ) ) ( not ( = ?auto_646064 ?auto_646068 ) ) ( not ( = ?auto_646066 ?auto_646065 ) ) ( not ( = ?auto_646066 ?auto_646067 ) ) ( not ( = ?auto_646066 ?auto_646068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646065 ?auto_646067 ?auto_646068 )
      ( MAKE-6CRATE-VERIFY ?auto_646062 ?auto_646063 ?auto_646064 ?auto_646066 ?auto_646065 ?auto_646067 ?auto_646068 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646125 - SURFACE
      ?auto_646126 - SURFACE
      ?auto_646127 - SURFACE
      ?auto_646129 - SURFACE
      ?auto_646128 - SURFACE
      ?auto_646130 - SURFACE
      ?auto_646131 - SURFACE
    )
    :vars
    (
      ?auto_646133 - HOIST
      ?auto_646136 - PLACE
      ?auto_646132 - TRUCK
      ?auto_646135 - PLACE
      ?auto_646137 - HOIST
      ?auto_646134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_646133 ?auto_646136 ) ( SURFACE-AT ?auto_646130 ?auto_646136 ) ( CLEAR ?auto_646130 ) ( IS-CRATE ?auto_646131 ) ( not ( = ?auto_646130 ?auto_646131 ) ) ( AVAILABLE ?auto_646133 ) ( ON ?auto_646130 ?auto_646128 ) ( not ( = ?auto_646128 ?auto_646130 ) ) ( not ( = ?auto_646128 ?auto_646131 ) ) ( TRUCK-AT ?auto_646132 ?auto_646135 ) ( not ( = ?auto_646135 ?auto_646136 ) ) ( HOIST-AT ?auto_646137 ?auto_646135 ) ( not ( = ?auto_646133 ?auto_646137 ) ) ( AVAILABLE ?auto_646137 ) ( SURFACE-AT ?auto_646131 ?auto_646135 ) ( ON ?auto_646131 ?auto_646134 ) ( CLEAR ?auto_646131 ) ( not ( = ?auto_646130 ?auto_646134 ) ) ( not ( = ?auto_646131 ?auto_646134 ) ) ( not ( = ?auto_646128 ?auto_646134 ) ) ( ON ?auto_646126 ?auto_646125 ) ( ON ?auto_646127 ?auto_646126 ) ( ON ?auto_646129 ?auto_646127 ) ( ON ?auto_646128 ?auto_646129 ) ( not ( = ?auto_646125 ?auto_646126 ) ) ( not ( = ?auto_646125 ?auto_646127 ) ) ( not ( = ?auto_646125 ?auto_646129 ) ) ( not ( = ?auto_646125 ?auto_646128 ) ) ( not ( = ?auto_646125 ?auto_646130 ) ) ( not ( = ?auto_646125 ?auto_646131 ) ) ( not ( = ?auto_646125 ?auto_646134 ) ) ( not ( = ?auto_646126 ?auto_646127 ) ) ( not ( = ?auto_646126 ?auto_646129 ) ) ( not ( = ?auto_646126 ?auto_646128 ) ) ( not ( = ?auto_646126 ?auto_646130 ) ) ( not ( = ?auto_646126 ?auto_646131 ) ) ( not ( = ?auto_646126 ?auto_646134 ) ) ( not ( = ?auto_646127 ?auto_646129 ) ) ( not ( = ?auto_646127 ?auto_646128 ) ) ( not ( = ?auto_646127 ?auto_646130 ) ) ( not ( = ?auto_646127 ?auto_646131 ) ) ( not ( = ?auto_646127 ?auto_646134 ) ) ( not ( = ?auto_646129 ?auto_646128 ) ) ( not ( = ?auto_646129 ?auto_646130 ) ) ( not ( = ?auto_646129 ?auto_646131 ) ) ( not ( = ?auto_646129 ?auto_646134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646128 ?auto_646130 ?auto_646131 )
      ( MAKE-6CRATE-VERIFY ?auto_646125 ?auto_646126 ?auto_646127 ?auto_646129 ?auto_646128 ?auto_646130 ?auto_646131 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646189 - SURFACE
      ?auto_646190 - SURFACE
      ?auto_646191 - SURFACE
      ?auto_646193 - SURFACE
      ?auto_646192 - SURFACE
      ?auto_646194 - SURFACE
      ?auto_646195 - SURFACE
    )
    :vars
    (
      ?auto_646196 - HOIST
      ?auto_646198 - PLACE
      ?auto_646199 - PLACE
      ?auto_646201 - HOIST
      ?auto_646200 - SURFACE
      ?auto_646197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646196 ?auto_646198 ) ( SURFACE-AT ?auto_646194 ?auto_646198 ) ( CLEAR ?auto_646194 ) ( IS-CRATE ?auto_646195 ) ( not ( = ?auto_646194 ?auto_646195 ) ) ( AVAILABLE ?auto_646196 ) ( ON ?auto_646194 ?auto_646192 ) ( not ( = ?auto_646192 ?auto_646194 ) ) ( not ( = ?auto_646192 ?auto_646195 ) ) ( not ( = ?auto_646199 ?auto_646198 ) ) ( HOIST-AT ?auto_646201 ?auto_646199 ) ( not ( = ?auto_646196 ?auto_646201 ) ) ( AVAILABLE ?auto_646201 ) ( SURFACE-AT ?auto_646195 ?auto_646199 ) ( ON ?auto_646195 ?auto_646200 ) ( CLEAR ?auto_646195 ) ( not ( = ?auto_646194 ?auto_646200 ) ) ( not ( = ?auto_646195 ?auto_646200 ) ) ( not ( = ?auto_646192 ?auto_646200 ) ) ( TRUCK-AT ?auto_646197 ?auto_646198 ) ( ON ?auto_646190 ?auto_646189 ) ( ON ?auto_646191 ?auto_646190 ) ( ON ?auto_646193 ?auto_646191 ) ( ON ?auto_646192 ?auto_646193 ) ( not ( = ?auto_646189 ?auto_646190 ) ) ( not ( = ?auto_646189 ?auto_646191 ) ) ( not ( = ?auto_646189 ?auto_646193 ) ) ( not ( = ?auto_646189 ?auto_646192 ) ) ( not ( = ?auto_646189 ?auto_646194 ) ) ( not ( = ?auto_646189 ?auto_646195 ) ) ( not ( = ?auto_646189 ?auto_646200 ) ) ( not ( = ?auto_646190 ?auto_646191 ) ) ( not ( = ?auto_646190 ?auto_646193 ) ) ( not ( = ?auto_646190 ?auto_646192 ) ) ( not ( = ?auto_646190 ?auto_646194 ) ) ( not ( = ?auto_646190 ?auto_646195 ) ) ( not ( = ?auto_646190 ?auto_646200 ) ) ( not ( = ?auto_646191 ?auto_646193 ) ) ( not ( = ?auto_646191 ?auto_646192 ) ) ( not ( = ?auto_646191 ?auto_646194 ) ) ( not ( = ?auto_646191 ?auto_646195 ) ) ( not ( = ?auto_646191 ?auto_646200 ) ) ( not ( = ?auto_646193 ?auto_646192 ) ) ( not ( = ?auto_646193 ?auto_646194 ) ) ( not ( = ?auto_646193 ?auto_646195 ) ) ( not ( = ?auto_646193 ?auto_646200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646192 ?auto_646194 ?auto_646195 )
      ( MAKE-6CRATE-VERIFY ?auto_646189 ?auto_646190 ?auto_646191 ?auto_646193 ?auto_646192 ?auto_646194 ?auto_646195 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646253 - SURFACE
      ?auto_646254 - SURFACE
      ?auto_646255 - SURFACE
      ?auto_646257 - SURFACE
      ?auto_646256 - SURFACE
      ?auto_646258 - SURFACE
      ?auto_646259 - SURFACE
    )
    :vars
    (
      ?auto_646262 - HOIST
      ?auto_646260 - PLACE
      ?auto_646265 - PLACE
      ?auto_646264 - HOIST
      ?auto_646261 - SURFACE
      ?auto_646263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646262 ?auto_646260 ) ( IS-CRATE ?auto_646259 ) ( not ( = ?auto_646258 ?auto_646259 ) ) ( not ( = ?auto_646256 ?auto_646258 ) ) ( not ( = ?auto_646256 ?auto_646259 ) ) ( not ( = ?auto_646265 ?auto_646260 ) ) ( HOIST-AT ?auto_646264 ?auto_646265 ) ( not ( = ?auto_646262 ?auto_646264 ) ) ( AVAILABLE ?auto_646264 ) ( SURFACE-AT ?auto_646259 ?auto_646265 ) ( ON ?auto_646259 ?auto_646261 ) ( CLEAR ?auto_646259 ) ( not ( = ?auto_646258 ?auto_646261 ) ) ( not ( = ?auto_646259 ?auto_646261 ) ) ( not ( = ?auto_646256 ?auto_646261 ) ) ( TRUCK-AT ?auto_646263 ?auto_646260 ) ( SURFACE-AT ?auto_646256 ?auto_646260 ) ( CLEAR ?auto_646256 ) ( LIFTING ?auto_646262 ?auto_646258 ) ( IS-CRATE ?auto_646258 ) ( ON ?auto_646254 ?auto_646253 ) ( ON ?auto_646255 ?auto_646254 ) ( ON ?auto_646257 ?auto_646255 ) ( ON ?auto_646256 ?auto_646257 ) ( not ( = ?auto_646253 ?auto_646254 ) ) ( not ( = ?auto_646253 ?auto_646255 ) ) ( not ( = ?auto_646253 ?auto_646257 ) ) ( not ( = ?auto_646253 ?auto_646256 ) ) ( not ( = ?auto_646253 ?auto_646258 ) ) ( not ( = ?auto_646253 ?auto_646259 ) ) ( not ( = ?auto_646253 ?auto_646261 ) ) ( not ( = ?auto_646254 ?auto_646255 ) ) ( not ( = ?auto_646254 ?auto_646257 ) ) ( not ( = ?auto_646254 ?auto_646256 ) ) ( not ( = ?auto_646254 ?auto_646258 ) ) ( not ( = ?auto_646254 ?auto_646259 ) ) ( not ( = ?auto_646254 ?auto_646261 ) ) ( not ( = ?auto_646255 ?auto_646257 ) ) ( not ( = ?auto_646255 ?auto_646256 ) ) ( not ( = ?auto_646255 ?auto_646258 ) ) ( not ( = ?auto_646255 ?auto_646259 ) ) ( not ( = ?auto_646255 ?auto_646261 ) ) ( not ( = ?auto_646257 ?auto_646256 ) ) ( not ( = ?auto_646257 ?auto_646258 ) ) ( not ( = ?auto_646257 ?auto_646259 ) ) ( not ( = ?auto_646257 ?auto_646261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646256 ?auto_646258 ?auto_646259 )
      ( MAKE-6CRATE-VERIFY ?auto_646253 ?auto_646254 ?auto_646255 ?auto_646257 ?auto_646256 ?auto_646258 ?auto_646259 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_646317 - SURFACE
      ?auto_646318 - SURFACE
      ?auto_646319 - SURFACE
      ?auto_646321 - SURFACE
      ?auto_646320 - SURFACE
      ?auto_646322 - SURFACE
      ?auto_646323 - SURFACE
    )
    :vars
    (
      ?auto_646328 - HOIST
      ?auto_646326 - PLACE
      ?auto_646325 - PLACE
      ?auto_646327 - HOIST
      ?auto_646324 - SURFACE
      ?auto_646329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646328 ?auto_646326 ) ( IS-CRATE ?auto_646323 ) ( not ( = ?auto_646322 ?auto_646323 ) ) ( not ( = ?auto_646320 ?auto_646322 ) ) ( not ( = ?auto_646320 ?auto_646323 ) ) ( not ( = ?auto_646325 ?auto_646326 ) ) ( HOIST-AT ?auto_646327 ?auto_646325 ) ( not ( = ?auto_646328 ?auto_646327 ) ) ( AVAILABLE ?auto_646327 ) ( SURFACE-AT ?auto_646323 ?auto_646325 ) ( ON ?auto_646323 ?auto_646324 ) ( CLEAR ?auto_646323 ) ( not ( = ?auto_646322 ?auto_646324 ) ) ( not ( = ?auto_646323 ?auto_646324 ) ) ( not ( = ?auto_646320 ?auto_646324 ) ) ( TRUCK-AT ?auto_646329 ?auto_646326 ) ( SURFACE-AT ?auto_646320 ?auto_646326 ) ( CLEAR ?auto_646320 ) ( IS-CRATE ?auto_646322 ) ( AVAILABLE ?auto_646328 ) ( IN ?auto_646322 ?auto_646329 ) ( ON ?auto_646318 ?auto_646317 ) ( ON ?auto_646319 ?auto_646318 ) ( ON ?auto_646321 ?auto_646319 ) ( ON ?auto_646320 ?auto_646321 ) ( not ( = ?auto_646317 ?auto_646318 ) ) ( not ( = ?auto_646317 ?auto_646319 ) ) ( not ( = ?auto_646317 ?auto_646321 ) ) ( not ( = ?auto_646317 ?auto_646320 ) ) ( not ( = ?auto_646317 ?auto_646322 ) ) ( not ( = ?auto_646317 ?auto_646323 ) ) ( not ( = ?auto_646317 ?auto_646324 ) ) ( not ( = ?auto_646318 ?auto_646319 ) ) ( not ( = ?auto_646318 ?auto_646321 ) ) ( not ( = ?auto_646318 ?auto_646320 ) ) ( not ( = ?auto_646318 ?auto_646322 ) ) ( not ( = ?auto_646318 ?auto_646323 ) ) ( not ( = ?auto_646318 ?auto_646324 ) ) ( not ( = ?auto_646319 ?auto_646321 ) ) ( not ( = ?auto_646319 ?auto_646320 ) ) ( not ( = ?auto_646319 ?auto_646322 ) ) ( not ( = ?auto_646319 ?auto_646323 ) ) ( not ( = ?auto_646319 ?auto_646324 ) ) ( not ( = ?auto_646321 ?auto_646320 ) ) ( not ( = ?auto_646321 ?auto_646322 ) ) ( not ( = ?auto_646321 ?auto_646323 ) ) ( not ( = ?auto_646321 ?auto_646324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_646320 ?auto_646322 ?auto_646323 )
      ( MAKE-6CRATE-VERIFY ?auto_646317 ?auto_646318 ?auto_646319 ?auto_646321 ?auto_646320 ?auto_646322 ?auto_646323 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648273 - SURFACE
      ?auto_648274 - SURFACE
      ?auto_648275 - SURFACE
      ?auto_648277 - SURFACE
      ?auto_648276 - SURFACE
      ?auto_648278 - SURFACE
      ?auto_648279 - SURFACE
      ?auto_648280 - SURFACE
    )
    :vars
    (
      ?auto_648282 - HOIST
      ?auto_648281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648282 ?auto_648281 ) ( SURFACE-AT ?auto_648279 ?auto_648281 ) ( CLEAR ?auto_648279 ) ( LIFTING ?auto_648282 ?auto_648280 ) ( IS-CRATE ?auto_648280 ) ( not ( = ?auto_648279 ?auto_648280 ) ) ( ON ?auto_648274 ?auto_648273 ) ( ON ?auto_648275 ?auto_648274 ) ( ON ?auto_648277 ?auto_648275 ) ( ON ?auto_648276 ?auto_648277 ) ( ON ?auto_648278 ?auto_648276 ) ( ON ?auto_648279 ?auto_648278 ) ( not ( = ?auto_648273 ?auto_648274 ) ) ( not ( = ?auto_648273 ?auto_648275 ) ) ( not ( = ?auto_648273 ?auto_648277 ) ) ( not ( = ?auto_648273 ?auto_648276 ) ) ( not ( = ?auto_648273 ?auto_648278 ) ) ( not ( = ?auto_648273 ?auto_648279 ) ) ( not ( = ?auto_648273 ?auto_648280 ) ) ( not ( = ?auto_648274 ?auto_648275 ) ) ( not ( = ?auto_648274 ?auto_648277 ) ) ( not ( = ?auto_648274 ?auto_648276 ) ) ( not ( = ?auto_648274 ?auto_648278 ) ) ( not ( = ?auto_648274 ?auto_648279 ) ) ( not ( = ?auto_648274 ?auto_648280 ) ) ( not ( = ?auto_648275 ?auto_648277 ) ) ( not ( = ?auto_648275 ?auto_648276 ) ) ( not ( = ?auto_648275 ?auto_648278 ) ) ( not ( = ?auto_648275 ?auto_648279 ) ) ( not ( = ?auto_648275 ?auto_648280 ) ) ( not ( = ?auto_648277 ?auto_648276 ) ) ( not ( = ?auto_648277 ?auto_648278 ) ) ( not ( = ?auto_648277 ?auto_648279 ) ) ( not ( = ?auto_648277 ?auto_648280 ) ) ( not ( = ?auto_648276 ?auto_648278 ) ) ( not ( = ?auto_648276 ?auto_648279 ) ) ( not ( = ?auto_648276 ?auto_648280 ) ) ( not ( = ?auto_648278 ?auto_648279 ) ) ( not ( = ?auto_648278 ?auto_648280 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_648279 ?auto_648280 )
      ( MAKE-7CRATE-VERIFY ?auto_648273 ?auto_648274 ?auto_648275 ?auto_648277 ?auto_648276 ?auto_648278 ?auto_648279 ?auto_648280 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648328 - SURFACE
      ?auto_648329 - SURFACE
      ?auto_648330 - SURFACE
      ?auto_648332 - SURFACE
      ?auto_648331 - SURFACE
      ?auto_648333 - SURFACE
      ?auto_648334 - SURFACE
      ?auto_648335 - SURFACE
    )
    :vars
    (
      ?auto_648338 - HOIST
      ?auto_648337 - PLACE
      ?auto_648336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648338 ?auto_648337 ) ( SURFACE-AT ?auto_648334 ?auto_648337 ) ( CLEAR ?auto_648334 ) ( IS-CRATE ?auto_648335 ) ( not ( = ?auto_648334 ?auto_648335 ) ) ( TRUCK-AT ?auto_648336 ?auto_648337 ) ( AVAILABLE ?auto_648338 ) ( IN ?auto_648335 ?auto_648336 ) ( ON ?auto_648334 ?auto_648333 ) ( not ( = ?auto_648333 ?auto_648334 ) ) ( not ( = ?auto_648333 ?auto_648335 ) ) ( ON ?auto_648329 ?auto_648328 ) ( ON ?auto_648330 ?auto_648329 ) ( ON ?auto_648332 ?auto_648330 ) ( ON ?auto_648331 ?auto_648332 ) ( ON ?auto_648333 ?auto_648331 ) ( not ( = ?auto_648328 ?auto_648329 ) ) ( not ( = ?auto_648328 ?auto_648330 ) ) ( not ( = ?auto_648328 ?auto_648332 ) ) ( not ( = ?auto_648328 ?auto_648331 ) ) ( not ( = ?auto_648328 ?auto_648333 ) ) ( not ( = ?auto_648328 ?auto_648334 ) ) ( not ( = ?auto_648328 ?auto_648335 ) ) ( not ( = ?auto_648329 ?auto_648330 ) ) ( not ( = ?auto_648329 ?auto_648332 ) ) ( not ( = ?auto_648329 ?auto_648331 ) ) ( not ( = ?auto_648329 ?auto_648333 ) ) ( not ( = ?auto_648329 ?auto_648334 ) ) ( not ( = ?auto_648329 ?auto_648335 ) ) ( not ( = ?auto_648330 ?auto_648332 ) ) ( not ( = ?auto_648330 ?auto_648331 ) ) ( not ( = ?auto_648330 ?auto_648333 ) ) ( not ( = ?auto_648330 ?auto_648334 ) ) ( not ( = ?auto_648330 ?auto_648335 ) ) ( not ( = ?auto_648332 ?auto_648331 ) ) ( not ( = ?auto_648332 ?auto_648333 ) ) ( not ( = ?auto_648332 ?auto_648334 ) ) ( not ( = ?auto_648332 ?auto_648335 ) ) ( not ( = ?auto_648331 ?auto_648333 ) ) ( not ( = ?auto_648331 ?auto_648334 ) ) ( not ( = ?auto_648331 ?auto_648335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648333 ?auto_648334 ?auto_648335 )
      ( MAKE-7CRATE-VERIFY ?auto_648328 ?auto_648329 ?auto_648330 ?auto_648332 ?auto_648331 ?auto_648333 ?auto_648334 ?auto_648335 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648391 - SURFACE
      ?auto_648392 - SURFACE
      ?auto_648393 - SURFACE
      ?auto_648395 - SURFACE
      ?auto_648394 - SURFACE
      ?auto_648396 - SURFACE
      ?auto_648397 - SURFACE
      ?auto_648398 - SURFACE
    )
    :vars
    (
      ?auto_648400 - HOIST
      ?auto_648401 - PLACE
      ?auto_648402 - TRUCK
      ?auto_648399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648400 ?auto_648401 ) ( SURFACE-AT ?auto_648397 ?auto_648401 ) ( CLEAR ?auto_648397 ) ( IS-CRATE ?auto_648398 ) ( not ( = ?auto_648397 ?auto_648398 ) ) ( AVAILABLE ?auto_648400 ) ( IN ?auto_648398 ?auto_648402 ) ( ON ?auto_648397 ?auto_648396 ) ( not ( = ?auto_648396 ?auto_648397 ) ) ( not ( = ?auto_648396 ?auto_648398 ) ) ( TRUCK-AT ?auto_648402 ?auto_648399 ) ( not ( = ?auto_648399 ?auto_648401 ) ) ( ON ?auto_648392 ?auto_648391 ) ( ON ?auto_648393 ?auto_648392 ) ( ON ?auto_648395 ?auto_648393 ) ( ON ?auto_648394 ?auto_648395 ) ( ON ?auto_648396 ?auto_648394 ) ( not ( = ?auto_648391 ?auto_648392 ) ) ( not ( = ?auto_648391 ?auto_648393 ) ) ( not ( = ?auto_648391 ?auto_648395 ) ) ( not ( = ?auto_648391 ?auto_648394 ) ) ( not ( = ?auto_648391 ?auto_648396 ) ) ( not ( = ?auto_648391 ?auto_648397 ) ) ( not ( = ?auto_648391 ?auto_648398 ) ) ( not ( = ?auto_648392 ?auto_648393 ) ) ( not ( = ?auto_648392 ?auto_648395 ) ) ( not ( = ?auto_648392 ?auto_648394 ) ) ( not ( = ?auto_648392 ?auto_648396 ) ) ( not ( = ?auto_648392 ?auto_648397 ) ) ( not ( = ?auto_648392 ?auto_648398 ) ) ( not ( = ?auto_648393 ?auto_648395 ) ) ( not ( = ?auto_648393 ?auto_648394 ) ) ( not ( = ?auto_648393 ?auto_648396 ) ) ( not ( = ?auto_648393 ?auto_648397 ) ) ( not ( = ?auto_648393 ?auto_648398 ) ) ( not ( = ?auto_648395 ?auto_648394 ) ) ( not ( = ?auto_648395 ?auto_648396 ) ) ( not ( = ?auto_648395 ?auto_648397 ) ) ( not ( = ?auto_648395 ?auto_648398 ) ) ( not ( = ?auto_648394 ?auto_648396 ) ) ( not ( = ?auto_648394 ?auto_648397 ) ) ( not ( = ?auto_648394 ?auto_648398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648396 ?auto_648397 ?auto_648398 )
      ( MAKE-7CRATE-VERIFY ?auto_648391 ?auto_648392 ?auto_648393 ?auto_648395 ?auto_648394 ?auto_648396 ?auto_648397 ?auto_648398 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648461 - SURFACE
      ?auto_648462 - SURFACE
      ?auto_648463 - SURFACE
      ?auto_648465 - SURFACE
      ?auto_648464 - SURFACE
      ?auto_648466 - SURFACE
      ?auto_648467 - SURFACE
      ?auto_648468 - SURFACE
    )
    :vars
    (
      ?auto_648470 - HOIST
      ?auto_648469 - PLACE
      ?auto_648473 - TRUCK
      ?auto_648472 - PLACE
      ?auto_648471 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_648470 ?auto_648469 ) ( SURFACE-AT ?auto_648467 ?auto_648469 ) ( CLEAR ?auto_648467 ) ( IS-CRATE ?auto_648468 ) ( not ( = ?auto_648467 ?auto_648468 ) ) ( AVAILABLE ?auto_648470 ) ( ON ?auto_648467 ?auto_648466 ) ( not ( = ?auto_648466 ?auto_648467 ) ) ( not ( = ?auto_648466 ?auto_648468 ) ) ( TRUCK-AT ?auto_648473 ?auto_648472 ) ( not ( = ?auto_648472 ?auto_648469 ) ) ( HOIST-AT ?auto_648471 ?auto_648472 ) ( LIFTING ?auto_648471 ?auto_648468 ) ( not ( = ?auto_648470 ?auto_648471 ) ) ( ON ?auto_648462 ?auto_648461 ) ( ON ?auto_648463 ?auto_648462 ) ( ON ?auto_648465 ?auto_648463 ) ( ON ?auto_648464 ?auto_648465 ) ( ON ?auto_648466 ?auto_648464 ) ( not ( = ?auto_648461 ?auto_648462 ) ) ( not ( = ?auto_648461 ?auto_648463 ) ) ( not ( = ?auto_648461 ?auto_648465 ) ) ( not ( = ?auto_648461 ?auto_648464 ) ) ( not ( = ?auto_648461 ?auto_648466 ) ) ( not ( = ?auto_648461 ?auto_648467 ) ) ( not ( = ?auto_648461 ?auto_648468 ) ) ( not ( = ?auto_648462 ?auto_648463 ) ) ( not ( = ?auto_648462 ?auto_648465 ) ) ( not ( = ?auto_648462 ?auto_648464 ) ) ( not ( = ?auto_648462 ?auto_648466 ) ) ( not ( = ?auto_648462 ?auto_648467 ) ) ( not ( = ?auto_648462 ?auto_648468 ) ) ( not ( = ?auto_648463 ?auto_648465 ) ) ( not ( = ?auto_648463 ?auto_648464 ) ) ( not ( = ?auto_648463 ?auto_648466 ) ) ( not ( = ?auto_648463 ?auto_648467 ) ) ( not ( = ?auto_648463 ?auto_648468 ) ) ( not ( = ?auto_648465 ?auto_648464 ) ) ( not ( = ?auto_648465 ?auto_648466 ) ) ( not ( = ?auto_648465 ?auto_648467 ) ) ( not ( = ?auto_648465 ?auto_648468 ) ) ( not ( = ?auto_648464 ?auto_648466 ) ) ( not ( = ?auto_648464 ?auto_648467 ) ) ( not ( = ?auto_648464 ?auto_648468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648466 ?auto_648467 ?auto_648468 )
      ( MAKE-7CRATE-VERIFY ?auto_648461 ?auto_648462 ?auto_648463 ?auto_648465 ?auto_648464 ?auto_648466 ?auto_648467 ?auto_648468 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648538 - SURFACE
      ?auto_648539 - SURFACE
      ?auto_648540 - SURFACE
      ?auto_648542 - SURFACE
      ?auto_648541 - SURFACE
      ?auto_648543 - SURFACE
      ?auto_648544 - SURFACE
      ?auto_648545 - SURFACE
    )
    :vars
    (
      ?auto_648547 - HOIST
      ?auto_648551 - PLACE
      ?auto_648549 - TRUCK
      ?auto_648546 - PLACE
      ?auto_648548 - HOIST
      ?auto_648550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_648547 ?auto_648551 ) ( SURFACE-AT ?auto_648544 ?auto_648551 ) ( CLEAR ?auto_648544 ) ( IS-CRATE ?auto_648545 ) ( not ( = ?auto_648544 ?auto_648545 ) ) ( AVAILABLE ?auto_648547 ) ( ON ?auto_648544 ?auto_648543 ) ( not ( = ?auto_648543 ?auto_648544 ) ) ( not ( = ?auto_648543 ?auto_648545 ) ) ( TRUCK-AT ?auto_648549 ?auto_648546 ) ( not ( = ?auto_648546 ?auto_648551 ) ) ( HOIST-AT ?auto_648548 ?auto_648546 ) ( not ( = ?auto_648547 ?auto_648548 ) ) ( AVAILABLE ?auto_648548 ) ( SURFACE-AT ?auto_648545 ?auto_648546 ) ( ON ?auto_648545 ?auto_648550 ) ( CLEAR ?auto_648545 ) ( not ( = ?auto_648544 ?auto_648550 ) ) ( not ( = ?auto_648545 ?auto_648550 ) ) ( not ( = ?auto_648543 ?auto_648550 ) ) ( ON ?auto_648539 ?auto_648538 ) ( ON ?auto_648540 ?auto_648539 ) ( ON ?auto_648542 ?auto_648540 ) ( ON ?auto_648541 ?auto_648542 ) ( ON ?auto_648543 ?auto_648541 ) ( not ( = ?auto_648538 ?auto_648539 ) ) ( not ( = ?auto_648538 ?auto_648540 ) ) ( not ( = ?auto_648538 ?auto_648542 ) ) ( not ( = ?auto_648538 ?auto_648541 ) ) ( not ( = ?auto_648538 ?auto_648543 ) ) ( not ( = ?auto_648538 ?auto_648544 ) ) ( not ( = ?auto_648538 ?auto_648545 ) ) ( not ( = ?auto_648538 ?auto_648550 ) ) ( not ( = ?auto_648539 ?auto_648540 ) ) ( not ( = ?auto_648539 ?auto_648542 ) ) ( not ( = ?auto_648539 ?auto_648541 ) ) ( not ( = ?auto_648539 ?auto_648543 ) ) ( not ( = ?auto_648539 ?auto_648544 ) ) ( not ( = ?auto_648539 ?auto_648545 ) ) ( not ( = ?auto_648539 ?auto_648550 ) ) ( not ( = ?auto_648540 ?auto_648542 ) ) ( not ( = ?auto_648540 ?auto_648541 ) ) ( not ( = ?auto_648540 ?auto_648543 ) ) ( not ( = ?auto_648540 ?auto_648544 ) ) ( not ( = ?auto_648540 ?auto_648545 ) ) ( not ( = ?auto_648540 ?auto_648550 ) ) ( not ( = ?auto_648542 ?auto_648541 ) ) ( not ( = ?auto_648542 ?auto_648543 ) ) ( not ( = ?auto_648542 ?auto_648544 ) ) ( not ( = ?auto_648542 ?auto_648545 ) ) ( not ( = ?auto_648542 ?auto_648550 ) ) ( not ( = ?auto_648541 ?auto_648543 ) ) ( not ( = ?auto_648541 ?auto_648544 ) ) ( not ( = ?auto_648541 ?auto_648545 ) ) ( not ( = ?auto_648541 ?auto_648550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648543 ?auto_648544 ?auto_648545 )
      ( MAKE-7CRATE-VERIFY ?auto_648538 ?auto_648539 ?auto_648540 ?auto_648542 ?auto_648541 ?auto_648543 ?auto_648544 ?auto_648545 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648616 - SURFACE
      ?auto_648617 - SURFACE
      ?auto_648618 - SURFACE
      ?auto_648620 - SURFACE
      ?auto_648619 - SURFACE
      ?auto_648621 - SURFACE
      ?auto_648622 - SURFACE
      ?auto_648623 - SURFACE
    )
    :vars
    (
      ?auto_648628 - HOIST
      ?auto_648626 - PLACE
      ?auto_648629 - PLACE
      ?auto_648625 - HOIST
      ?auto_648627 - SURFACE
      ?auto_648624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648628 ?auto_648626 ) ( SURFACE-AT ?auto_648622 ?auto_648626 ) ( CLEAR ?auto_648622 ) ( IS-CRATE ?auto_648623 ) ( not ( = ?auto_648622 ?auto_648623 ) ) ( AVAILABLE ?auto_648628 ) ( ON ?auto_648622 ?auto_648621 ) ( not ( = ?auto_648621 ?auto_648622 ) ) ( not ( = ?auto_648621 ?auto_648623 ) ) ( not ( = ?auto_648629 ?auto_648626 ) ) ( HOIST-AT ?auto_648625 ?auto_648629 ) ( not ( = ?auto_648628 ?auto_648625 ) ) ( AVAILABLE ?auto_648625 ) ( SURFACE-AT ?auto_648623 ?auto_648629 ) ( ON ?auto_648623 ?auto_648627 ) ( CLEAR ?auto_648623 ) ( not ( = ?auto_648622 ?auto_648627 ) ) ( not ( = ?auto_648623 ?auto_648627 ) ) ( not ( = ?auto_648621 ?auto_648627 ) ) ( TRUCK-AT ?auto_648624 ?auto_648626 ) ( ON ?auto_648617 ?auto_648616 ) ( ON ?auto_648618 ?auto_648617 ) ( ON ?auto_648620 ?auto_648618 ) ( ON ?auto_648619 ?auto_648620 ) ( ON ?auto_648621 ?auto_648619 ) ( not ( = ?auto_648616 ?auto_648617 ) ) ( not ( = ?auto_648616 ?auto_648618 ) ) ( not ( = ?auto_648616 ?auto_648620 ) ) ( not ( = ?auto_648616 ?auto_648619 ) ) ( not ( = ?auto_648616 ?auto_648621 ) ) ( not ( = ?auto_648616 ?auto_648622 ) ) ( not ( = ?auto_648616 ?auto_648623 ) ) ( not ( = ?auto_648616 ?auto_648627 ) ) ( not ( = ?auto_648617 ?auto_648618 ) ) ( not ( = ?auto_648617 ?auto_648620 ) ) ( not ( = ?auto_648617 ?auto_648619 ) ) ( not ( = ?auto_648617 ?auto_648621 ) ) ( not ( = ?auto_648617 ?auto_648622 ) ) ( not ( = ?auto_648617 ?auto_648623 ) ) ( not ( = ?auto_648617 ?auto_648627 ) ) ( not ( = ?auto_648618 ?auto_648620 ) ) ( not ( = ?auto_648618 ?auto_648619 ) ) ( not ( = ?auto_648618 ?auto_648621 ) ) ( not ( = ?auto_648618 ?auto_648622 ) ) ( not ( = ?auto_648618 ?auto_648623 ) ) ( not ( = ?auto_648618 ?auto_648627 ) ) ( not ( = ?auto_648620 ?auto_648619 ) ) ( not ( = ?auto_648620 ?auto_648621 ) ) ( not ( = ?auto_648620 ?auto_648622 ) ) ( not ( = ?auto_648620 ?auto_648623 ) ) ( not ( = ?auto_648620 ?auto_648627 ) ) ( not ( = ?auto_648619 ?auto_648621 ) ) ( not ( = ?auto_648619 ?auto_648622 ) ) ( not ( = ?auto_648619 ?auto_648623 ) ) ( not ( = ?auto_648619 ?auto_648627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648621 ?auto_648622 ?auto_648623 )
      ( MAKE-7CRATE-VERIFY ?auto_648616 ?auto_648617 ?auto_648618 ?auto_648620 ?auto_648619 ?auto_648621 ?auto_648622 ?auto_648623 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648694 - SURFACE
      ?auto_648695 - SURFACE
      ?auto_648696 - SURFACE
      ?auto_648698 - SURFACE
      ?auto_648697 - SURFACE
      ?auto_648699 - SURFACE
      ?auto_648700 - SURFACE
      ?auto_648701 - SURFACE
    )
    :vars
    (
      ?auto_648702 - HOIST
      ?auto_648707 - PLACE
      ?auto_648705 - PLACE
      ?auto_648706 - HOIST
      ?auto_648703 - SURFACE
      ?auto_648704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648702 ?auto_648707 ) ( IS-CRATE ?auto_648701 ) ( not ( = ?auto_648700 ?auto_648701 ) ) ( not ( = ?auto_648699 ?auto_648700 ) ) ( not ( = ?auto_648699 ?auto_648701 ) ) ( not ( = ?auto_648705 ?auto_648707 ) ) ( HOIST-AT ?auto_648706 ?auto_648705 ) ( not ( = ?auto_648702 ?auto_648706 ) ) ( AVAILABLE ?auto_648706 ) ( SURFACE-AT ?auto_648701 ?auto_648705 ) ( ON ?auto_648701 ?auto_648703 ) ( CLEAR ?auto_648701 ) ( not ( = ?auto_648700 ?auto_648703 ) ) ( not ( = ?auto_648701 ?auto_648703 ) ) ( not ( = ?auto_648699 ?auto_648703 ) ) ( TRUCK-AT ?auto_648704 ?auto_648707 ) ( SURFACE-AT ?auto_648699 ?auto_648707 ) ( CLEAR ?auto_648699 ) ( LIFTING ?auto_648702 ?auto_648700 ) ( IS-CRATE ?auto_648700 ) ( ON ?auto_648695 ?auto_648694 ) ( ON ?auto_648696 ?auto_648695 ) ( ON ?auto_648698 ?auto_648696 ) ( ON ?auto_648697 ?auto_648698 ) ( ON ?auto_648699 ?auto_648697 ) ( not ( = ?auto_648694 ?auto_648695 ) ) ( not ( = ?auto_648694 ?auto_648696 ) ) ( not ( = ?auto_648694 ?auto_648698 ) ) ( not ( = ?auto_648694 ?auto_648697 ) ) ( not ( = ?auto_648694 ?auto_648699 ) ) ( not ( = ?auto_648694 ?auto_648700 ) ) ( not ( = ?auto_648694 ?auto_648701 ) ) ( not ( = ?auto_648694 ?auto_648703 ) ) ( not ( = ?auto_648695 ?auto_648696 ) ) ( not ( = ?auto_648695 ?auto_648698 ) ) ( not ( = ?auto_648695 ?auto_648697 ) ) ( not ( = ?auto_648695 ?auto_648699 ) ) ( not ( = ?auto_648695 ?auto_648700 ) ) ( not ( = ?auto_648695 ?auto_648701 ) ) ( not ( = ?auto_648695 ?auto_648703 ) ) ( not ( = ?auto_648696 ?auto_648698 ) ) ( not ( = ?auto_648696 ?auto_648697 ) ) ( not ( = ?auto_648696 ?auto_648699 ) ) ( not ( = ?auto_648696 ?auto_648700 ) ) ( not ( = ?auto_648696 ?auto_648701 ) ) ( not ( = ?auto_648696 ?auto_648703 ) ) ( not ( = ?auto_648698 ?auto_648697 ) ) ( not ( = ?auto_648698 ?auto_648699 ) ) ( not ( = ?auto_648698 ?auto_648700 ) ) ( not ( = ?auto_648698 ?auto_648701 ) ) ( not ( = ?auto_648698 ?auto_648703 ) ) ( not ( = ?auto_648697 ?auto_648699 ) ) ( not ( = ?auto_648697 ?auto_648700 ) ) ( not ( = ?auto_648697 ?auto_648701 ) ) ( not ( = ?auto_648697 ?auto_648703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648699 ?auto_648700 ?auto_648701 )
      ( MAKE-7CRATE-VERIFY ?auto_648694 ?auto_648695 ?auto_648696 ?auto_648698 ?auto_648697 ?auto_648699 ?auto_648700 ?auto_648701 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_648772 - SURFACE
      ?auto_648773 - SURFACE
      ?auto_648774 - SURFACE
      ?auto_648776 - SURFACE
      ?auto_648775 - SURFACE
      ?auto_648777 - SURFACE
      ?auto_648778 - SURFACE
      ?auto_648779 - SURFACE
    )
    :vars
    (
      ?auto_648780 - HOIST
      ?auto_648782 - PLACE
      ?auto_648785 - PLACE
      ?auto_648781 - HOIST
      ?auto_648784 - SURFACE
      ?auto_648783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_648780 ?auto_648782 ) ( IS-CRATE ?auto_648779 ) ( not ( = ?auto_648778 ?auto_648779 ) ) ( not ( = ?auto_648777 ?auto_648778 ) ) ( not ( = ?auto_648777 ?auto_648779 ) ) ( not ( = ?auto_648785 ?auto_648782 ) ) ( HOIST-AT ?auto_648781 ?auto_648785 ) ( not ( = ?auto_648780 ?auto_648781 ) ) ( AVAILABLE ?auto_648781 ) ( SURFACE-AT ?auto_648779 ?auto_648785 ) ( ON ?auto_648779 ?auto_648784 ) ( CLEAR ?auto_648779 ) ( not ( = ?auto_648778 ?auto_648784 ) ) ( not ( = ?auto_648779 ?auto_648784 ) ) ( not ( = ?auto_648777 ?auto_648784 ) ) ( TRUCK-AT ?auto_648783 ?auto_648782 ) ( SURFACE-AT ?auto_648777 ?auto_648782 ) ( CLEAR ?auto_648777 ) ( IS-CRATE ?auto_648778 ) ( AVAILABLE ?auto_648780 ) ( IN ?auto_648778 ?auto_648783 ) ( ON ?auto_648773 ?auto_648772 ) ( ON ?auto_648774 ?auto_648773 ) ( ON ?auto_648776 ?auto_648774 ) ( ON ?auto_648775 ?auto_648776 ) ( ON ?auto_648777 ?auto_648775 ) ( not ( = ?auto_648772 ?auto_648773 ) ) ( not ( = ?auto_648772 ?auto_648774 ) ) ( not ( = ?auto_648772 ?auto_648776 ) ) ( not ( = ?auto_648772 ?auto_648775 ) ) ( not ( = ?auto_648772 ?auto_648777 ) ) ( not ( = ?auto_648772 ?auto_648778 ) ) ( not ( = ?auto_648772 ?auto_648779 ) ) ( not ( = ?auto_648772 ?auto_648784 ) ) ( not ( = ?auto_648773 ?auto_648774 ) ) ( not ( = ?auto_648773 ?auto_648776 ) ) ( not ( = ?auto_648773 ?auto_648775 ) ) ( not ( = ?auto_648773 ?auto_648777 ) ) ( not ( = ?auto_648773 ?auto_648778 ) ) ( not ( = ?auto_648773 ?auto_648779 ) ) ( not ( = ?auto_648773 ?auto_648784 ) ) ( not ( = ?auto_648774 ?auto_648776 ) ) ( not ( = ?auto_648774 ?auto_648775 ) ) ( not ( = ?auto_648774 ?auto_648777 ) ) ( not ( = ?auto_648774 ?auto_648778 ) ) ( not ( = ?auto_648774 ?auto_648779 ) ) ( not ( = ?auto_648774 ?auto_648784 ) ) ( not ( = ?auto_648776 ?auto_648775 ) ) ( not ( = ?auto_648776 ?auto_648777 ) ) ( not ( = ?auto_648776 ?auto_648778 ) ) ( not ( = ?auto_648776 ?auto_648779 ) ) ( not ( = ?auto_648776 ?auto_648784 ) ) ( not ( = ?auto_648775 ?auto_648777 ) ) ( not ( = ?auto_648775 ?auto_648778 ) ) ( not ( = ?auto_648775 ?auto_648779 ) ) ( not ( = ?auto_648775 ?auto_648784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_648777 ?auto_648778 ?auto_648779 )
      ( MAKE-7CRATE-VERIFY ?auto_648772 ?auto_648773 ?auto_648774 ?auto_648776 ?auto_648775 ?auto_648777 ?auto_648778 ?auto_648779 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_649351 - SURFACE
      ?auto_649352 - SURFACE
    )
    :vars
    (
      ?auto_649357 - HOIST
      ?auto_649359 - PLACE
      ?auto_649355 - SURFACE
      ?auto_649356 - TRUCK
      ?auto_649353 - PLACE
      ?auto_649354 - HOIST
      ?auto_649358 - SURFACE
      ?auto_649360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_649357 ?auto_649359 ) ( SURFACE-AT ?auto_649351 ?auto_649359 ) ( CLEAR ?auto_649351 ) ( IS-CRATE ?auto_649352 ) ( not ( = ?auto_649351 ?auto_649352 ) ) ( AVAILABLE ?auto_649357 ) ( ON ?auto_649351 ?auto_649355 ) ( not ( = ?auto_649355 ?auto_649351 ) ) ( not ( = ?auto_649355 ?auto_649352 ) ) ( TRUCK-AT ?auto_649356 ?auto_649353 ) ( not ( = ?auto_649353 ?auto_649359 ) ) ( HOIST-AT ?auto_649354 ?auto_649353 ) ( not ( = ?auto_649357 ?auto_649354 ) ) ( SURFACE-AT ?auto_649352 ?auto_649353 ) ( ON ?auto_649352 ?auto_649358 ) ( CLEAR ?auto_649352 ) ( not ( = ?auto_649351 ?auto_649358 ) ) ( not ( = ?auto_649352 ?auto_649358 ) ) ( not ( = ?auto_649355 ?auto_649358 ) ) ( LIFTING ?auto_649354 ?auto_649360 ) ( IS-CRATE ?auto_649360 ) ( not ( = ?auto_649351 ?auto_649360 ) ) ( not ( = ?auto_649352 ?auto_649360 ) ) ( not ( = ?auto_649355 ?auto_649360 ) ) ( not ( = ?auto_649358 ?auto_649360 ) ) )
    :subtasks
    ( ( !LOAD ?auto_649354 ?auto_649360 ?auto_649356 ?auto_649353 )
      ( MAKE-1CRATE ?auto_649351 ?auto_649352 )
      ( MAKE-1CRATE-VERIFY ?auto_649351 ?auto_649352 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_651681 - SURFACE
      ?auto_651682 - SURFACE
      ?auto_651683 - SURFACE
      ?auto_651685 - SURFACE
      ?auto_651684 - SURFACE
      ?auto_651686 - SURFACE
      ?auto_651687 - SURFACE
      ?auto_651688 - SURFACE
      ?auto_651689 - SURFACE
    )
    :vars
    (
      ?auto_651690 - HOIST
      ?auto_651691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_651690 ?auto_651691 ) ( SURFACE-AT ?auto_651688 ?auto_651691 ) ( CLEAR ?auto_651688 ) ( LIFTING ?auto_651690 ?auto_651689 ) ( IS-CRATE ?auto_651689 ) ( not ( = ?auto_651688 ?auto_651689 ) ) ( ON ?auto_651682 ?auto_651681 ) ( ON ?auto_651683 ?auto_651682 ) ( ON ?auto_651685 ?auto_651683 ) ( ON ?auto_651684 ?auto_651685 ) ( ON ?auto_651686 ?auto_651684 ) ( ON ?auto_651687 ?auto_651686 ) ( ON ?auto_651688 ?auto_651687 ) ( not ( = ?auto_651681 ?auto_651682 ) ) ( not ( = ?auto_651681 ?auto_651683 ) ) ( not ( = ?auto_651681 ?auto_651685 ) ) ( not ( = ?auto_651681 ?auto_651684 ) ) ( not ( = ?auto_651681 ?auto_651686 ) ) ( not ( = ?auto_651681 ?auto_651687 ) ) ( not ( = ?auto_651681 ?auto_651688 ) ) ( not ( = ?auto_651681 ?auto_651689 ) ) ( not ( = ?auto_651682 ?auto_651683 ) ) ( not ( = ?auto_651682 ?auto_651685 ) ) ( not ( = ?auto_651682 ?auto_651684 ) ) ( not ( = ?auto_651682 ?auto_651686 ) ) ( not ( = ?auto_651682 ?auto_651687 ) ) ( not ( = ?auto_651682 ?auto_651688 ) ) ( not ( = ?auto_651682 ?auto_651689 ) ) ( not ( = ?auto_651683 ?auto_651685 ) ) ( not ( = ?auto_651683 ?auto_651684 ) ) ( not ( = ?auto_651683 ?auto_651686 ) ) ( not ( = ?auto_651683 ?auto_651687 ) ) ( not ( = ?auto_651683 ?auto_651688 ) ) ( not ( = ?auto_651683 ?auto_651689 ) ) ( not ( = ?auto_651685 ?auto_651684 ) ) ( not ( = ?auto_651685 ?auto_651686 ) ) ( not ( = ?auto_651685 ?auto_651687 ) ) ( not ( = ?auto_651685 ?auto_651688 ) ) ( not ( = ?auto_651685 ?auto_651689 ) ) ( not ( = ?auto_651684 ?auto_651686 ) ) ( not ( = ?auto_651684 ?auto_651687 ) ) ( not ( = ?auto_651684 ?auto_651688 ) ) ( not ( = ?auto_651684 ?auto_651689 ) ) ( not ( = ?auto_651686 ?auto_651687 ) ) ( not ( = ?auto_651686 ?auto_651688 ) ) ( not ( = ?auto_651686 ?auto_651689 ) ) ( not ( = ?auto_651687 ?auto_651688 ) ) ( not ( = ?auto_651687 ?auto_651689 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_651688 ?auto_651689 )
      ( MAKE-8CRATE-VERIFY ?auto_651681 ?auto_651682 ?auto_651683 ?auto_651685 ?auto_651684 ?auto_651686 ?auto_651687 ?auto_651688 ?auto_651689 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_651748 - SURFACE
      ?auto_651749 - SURFACE
      ?auto_651750 - SURFACE
      ?auto_651752 - SURFACE
      ?auto_651751 - SURFACE
      ?auto_651753 - SURFACE
      ?auto_651754 - SURFACE
      ?auto_651755 - SURFACE
      ?auto_651756 - SURFACE
    )
    :vars
    (
      ?auto_651759 - HOIST
      ?auto_651758 - PLACE
      ?auto_651757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_651759 ?auto_651758 ) ( SURFACE-AT ?auto_651755 ?auto_651758 ) ( CLEAR ?auto_651755 ) ( IS-CRATE ?auto_651756 ) ( not ( = ?auto_651755 ?auto_651756 ) ) ( TRUCK-AT ?auto_651757 ?auto_651758 ) ( AVAILABLE ?auto_651759 ) ( IN ?auto_651756 ?auto_651757 ) ( ON ?auto_651755 ?auto_651754 ) ( not ( = ?auto_651754 ?auto_651755 ) ) ( not ( = ?auto_651754 ?auto_651756 ) ) ( ON ?auto_651749 ?auto_651748 ) ( ON ?auto_651750 ?auto_651749 ) ( ON ?auto_651752 ?auto_651750 ) ( ON ?auto_651751 ?auto_651752 ) ( ON ?auto_651753 ?auto_651751 ) ( ON ?auto_651754 ?auto_651753 ) ( not ( = ?auto_651748 ?auto_651749 ) ) ( not ( = ?auto_651748 ?auto_651750 ) ) ( not ( = ?auto_651748 ?auto_651752 ) ) ( not ( = ?auto_651748 ?auto_651751 ) ) ( not ( = ?auto_651748 ?auto_651753 ) ) ( not ( = ?auto_651748 ?auto_651754 ) ) ( not ( = ?auto_651748 ?auto_651755 ) ) ( not ( = ?auto_651748 ?auto_651756 ) ) ( not ( = ?auto_651749 ?auto_651750 ) ) ( not ( = ?auto_651749 ?auto_651752 ) ) ( not ( = ?auto_651749 ?auto_651751 ) ) ( not ( = ?auto_651749 ?auto_651753 ) ) ( not ( = ?auto_651749 ?auto_651754 ) ) ( not ( = ?auto_651749 ?auto_651755 ) ) ( not ( = ?auto_651749 ?auto_651756 ) ) ( not ( = ?auto_651750 ?auto_651752 ) ) ( not ( = ?auto_651750 ?auto_651751 ) ) ( not ( = ?auto_651750 ?auto_651753 ) ) ( not ( = ?auto_651750 ?auto_651754 ) ) ( not ( = ?auto_651750 ?auto_651755 ) ) ( not ( = ?auto_651750 ?auto_651756 ) ) ( not ( = ?auto_651752 ?auto_651751 ) ) ( not ( = ?auto_651752 ?auto_651753 ) ) ( not ( = ?auto_651752 ?auto_651754 ) ) ( not ( = ?auto_651752 ?auto_651755 ) ) ( not ( = ?auto_651752 ?auto_651756 ) ) ( not ( = ?auto_651751 ?auto_651753 ) ) ( not ( = ?auto_651751 ?auto_651754 ) ) ( not ( = ?auto_651751 ?auto_651755 ) ) ( not ( = ?auto_651751 ?auto_651756 ) ) ( not ( = ?auto_651753 ?auto_651754 ) ) ( not ( = ?auto_651753 ?auto_651755 ) ) ( not ( = ?auto_651753 ?auto_651756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_651754 ?auto_651755 ?auto_651756 )
      ( MAKE-8CRATE-VERIFY ?auto_651748 ?auto_651749 ?auto_651750 ?auto_651752 ?auto_651751 ?auto_651753 ?auto_651754 ?auto_651755 ?auto_651756 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_651824 - SURFACE
      ?auto_651825 - SURFACE
      ?auto_651826 - SURFACE
      ?auto_651828 - SURFACE
      ?auto_651827 - SURFACE
      ?auto_651829 - SURFACE
      ?auto_651830 - SURFACE
      ?auto_651831 - SURFACE
      ?auto_651832 - SURFACE
    )
    :vars
    (
      ?auto_651836 - HOIST
      ?auto_651835 - PLACE
      ?auto_651834 - TRUCK
      ?auto_651833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_651836 ?auto_651835 ) ( SURFACE-AT ?auto_651831 ?auto_651835 ) ( CLEAR ?auto_651831 ) ( IS-CRATE ?auto_651832 ) ( not ( = ?auto_651831 ?auto_651832 ) ) ( AVAILABLE ?auto_651836 ) ( IN ?auto_651832 ?auto_651834 ) ( ON ?auto_651831 ?auto_651830 ) ( not ( = ?auto_651830 ?auto_651831 ) ) ( not ( = ?auto_651830 ?auto_651832 ) ) ( TRUCK-AT ?auto_651834 ?auto_651833 ) ( not ( = ?auto_651833 ?auto_651835 ) ) ( ON ?auto_651825 ?auto_651824 ) ( ON ?auto_651826 ?auto_651825 ) ( ON ?auto_651828 ?auto_651826 ) ( ON ?auto_651827 ?auto_651828 ) ( ON ?auto_651829 ?auto_651827 ) ( ON ?auto_651830 ?auto_651829 ) ( not ( = ?auto_651824 ?auto_651825 ) ) ( not ( = ?auto_651824 ?auto_651826 ) ) ( not ( = ?auto_651824 ?auto_651828 ) ) ( not ( = ?auto_651824 ?auto_651827 ) ) ( not ( = ?auto_651824 ?auto_651829 ) ) ( not ( = ?auto_651824 ?auto_651830 ) ) ( not ( = ?auto_651824 ?auto_651831 ) ) ( not ( = ?auto_651824 ?auto_651832 ) ) ( not ( = ?auto_651825 ?auto_651826 ) ) ( not ( = ?auto_651825 ?auto_651828 ) ) ( not ( = ?auto_651825 ?auto_651827 ) ) ( not ( = ?auto_651825 ?auto_651829 ) ) ( not ( = ?auto_651825 ?auto_651830 ) ) ( not ( = ?auto_651825 ?auto_651831 ) ) ( not ( = ?auto_651825 ?auto_651832 ) ) ( not ( = ?auto_651826 ?auto_651828 ) ) ( not ( = ?auto_651826 ?auto_651827 ) ) ( not ( = ?auto_651826 ?auto_651829 ) ) ( not ( = ?auto_651826 ?auto_651830 ) ) ( not ( = ?auto_651826 ?auto_651831 ) ) ( not ( = ?auto_651826 ?auto_651832 ) ) ( not ( = ?auto_651828 ?auto_651827 ) ) ( not ( = ?auto_651828 ?auto_651829 ) ) ( not ( = ?auto_651828 ?auto_651830 ) ) ( not ( = ?auto_651828 ?auto_651831 ) ) ( not ( = ?auto_651828 ?auto_651832 ) ) ( not ( = ?auto_651827 ?auto_651829 ) ) ( not ( = ?auto_651827 ?auto_651830 ) ) ( not ( = ?auto_651827 ?auto_651831 ) ) ( not ( = ?auto_651827 ?auto_651832 ) ) ( not ( = ?auto_651829 ?auto_651830 ) ) ( not ( = ?auto_651829 ?auto_651831 ) ) ( not ( = ?auto_651829 ?auto_651832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_651830 ?auto_651831 ?auto_651832 )
      ( MAKE-8CRATE-VERIFY ?auto_651824 ?auto_651825 ?auto_651826 ?auto_651828 ?auto_651827 ?auto_651829 ?auto_651830 ?auto_651831 ?auto_651832 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_651908 - SURFACE
      ?auto_651909 - SURFACE
      ?auto_651910 - SURFACE
      ?auto_651912 - SURFACE
      ?auto_651911 - SURFACE
      ?auto_651913 - SURFACE
      ?auto_651914 - SURFACE
      ?auto_651915 - SURFACE
      ?auto_651916 - SURFACE
    )
    :vars
    (
      ?auto_651920 - HOIST
      ?auto_651917 - PLACE
      ?auto_651918 - TRUCK
      ?auto_651921 - PLACE
      ?auto_651919 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_651920 ?auto_651917 ) ( SURFACE-AT ?auto_651915 ?auto_651917 ) ( CLEAR ?auto_651915 ) ( IS-CRATE ?auto_651916 ) ( not ( = ?auto_651915 ?auto_651916 ) ) ( AVAILABLE ?auto_651920 ) ( ON ?auto_651915 ?auto_651914 ) ( not ( = ?auto_651914 ?auto_651915 ) ) ( not ( = ?auto_651914 ?auto_651916 ) ) ( TRUCK-AT ?auto_651918 ?auto_651921 ) ( not ( = ?auto_651921 ?auto_651917 ) ) ( HOIST-AT ?auto_651919 ?auto_651921 ) ( LIFTING ?auto_651919 ?auto_651916 ) ( not ( = ?auto_651920 ?auto_651919 ) ) ( ON ?auto_651909 ?auto_651908 ) ( ON ?auto_651910 ?auto_651909 ) ( ON ?auto_651912 ?auto_651910 ) ( ON ?auto_651911 ?auto_651912 ) ( ON ?auto_651913 ?auto_651911 ) ( ON ?auto_651914 ?auto_651913 ) ( not ( = ?auto_651908 ?auto_651909 ) ) ( not ( = ?auto_651908 ?auto_651910 ) ) ( not ( = ?auto_651908 ?auto_651912 ) ) ( not ( = ?auto_651908 ?auto_651911 ) ) ( not ( = ?auto_651908 ?auto_651913 ) ) ( not ( = ?auto_651908 ?auto_651914 ) ) ( not ( = ?auto_651908 ?auto_651915 ) ) ( not ( = ?auto_651908 ?auto_651916 ) ) ( not ( = ?auto_651909 ?auto_651910 ) ) ( not ( = ?auto_651909 ?auto_651912 ) ) ( not ( = ?auto_651909 ?auto_651911 ) ) ( not ( = ?auto_651909 ?auto_651913 ) ) ( not ( = ?auto_651909 ?auto_651914 ) ) ( not ( = ?auto_651909 ?auto_651915 ) ) ( not ( = ?auto_651909 ?auto_651916 ) ) ( not ( = ?auto_651910 ?auto_651912 ) ) ( not ( = ?auto_651910 ?auto_651911 ) ) ( not ( = ?auto_651910 ?auto_651913 ) ) ( not ( = ?auto_651910 ?auto_651914 ) ) ( not ( = ?auto_651910 ?auto_651915 ) ) ( not ( = ?auto_651910 ?auto_651916 ) ) ( not ( = ?auto_651912 ?auto_651911 ) ) ( not ( = ?auto_651912 ?auto_651913 ) ) ( not ( = ?auto_651912 ?auto_651914 ) ) ( not ( = ?auto_651912 ?auto_651915 ) ) ( not ( = ?auto_651912 ?auto_651916 ) ) ( not ( = ?auto_651911 ?auto_651913 ) ) ( not ( = ?auto_651911 ?auto_651914 ) ) ( not ( = ?auto_651911 ?auto_651915 ) ) ( not ( = ?auto_651911 ?auto_651916 ) ) ( not ( = ?auto_651913 ?auto_651914 ) ) ( not ( = ?auto_651913 ?auto_651915 ) ) ( not ( = ?auto_651913 ?auto_651916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_651914 ?auto_651915 ?auto_651916 )
      ( MAKE-8CRATE-VERIFY ?auto_651908 ?auto_651909 ?auto_651910 ?auto_651912 ?auto_651911 ?auto_651913 ?auto_651914 ?auto_651915 ?auto_651916 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652000 - SURFACE
      ?auto_652001 - SURFACE
      ?auto_652002 - SURFACE
      ?auto_652004 - SURFACE
      ?auto_652003 - SURFACE
      ?auto_652005 - SURFACE
      ?auto_652006 - SURFACE
      ?auto_652007 - SURFACE
      ?auto_652008 - SURFACE
    )
    :vars
    (
      ?auto_652009 - HOIST
      ?auto_652010 - PLACE
      ?auto_652013 - TRUCK
      ?auto_652012 - PLACE
      ?auto_652014 - HOIST
      ?auto_652011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_652009 ?auto_652010 ) ( SURFACE-AT ?auto_652007 ?auto_652010 ) ( CLEAR ?auto_652007 ) ( IS-CRATE ?auto_652008 ) ( not ( = ?auto_652007 ?auto_652008 ) ) ( AVAILABLE ?auto_652009 ) ( ON ?auto_652007 ?auto_652006 ) ( not ( = ?auto_652006 ?auto_652007 ) ) ( not ( = ?auto_652006 ?auto_652008 ) ) ( TRUCK-AT ?auto_652013 ?auto_652012 ) ( not ( = ?auto_652012 ?auto_652010 ) ) ( HOIST-AT ?auto_652014 ?auto_652012 ) ( not ( = ?auto_652009 ?auto_652014 ) ) ( AVAILABLE ?auto_652014 ) ( SURFACE-AT ?auto_652008 ?auto_652012 ) ( ON ?auto_652008 ?auto_652011 ) ( CLEAR ?auto_652008 ) ( not ( = ?auto_652007 ?auto_652011 ) ) ( not ( = ?auto_652008 ?auto_652011 ) ) ( not ( = ?auto_652006 ?auto_652011 ) ) ( ON ?auto_652001 ?auto_652000 ) ( ON ?auto_652002 ?auto_652001 ) ( ON ?auto_652004 ?auto_652002 ) ( ON ?auto_652003 ?auto_652004 ) ( ON ?auto_652005 ?auto_652003 ) ( ON ?auto_652006 ?auto_652005 ) ( not ( = ?auto_652000 ?auto_652001 ) ) ( not ( = ?auto_652000 ?auto_652002 ) ) ( not ( = ?auto_652000 ?auto_652004 ) ) ( not ( = ?auto_652000 ?auto_652003 ) ) ( not ( = ?auto_652000 ?auto_652005 ) ) ( not ( = ?auto_652000 ?auto_652006 ) ) ( not ( = ?auto_652000 ?auto_652007 ) ) ( not ( = ?auto_652000 ?auto_652008 ) ) ( not ( = ?auto_652000 ?auto_652011 ) ) ( not ( = ?auto_652001 ?auto_652002 ) ) ( not ( = ?auto_652001 ?auto_652004 ) ) ( not ( = ?auto_652001 ?auto_652003 ) ) ( not ( = ?auto_652001 ?auto_652005 ) ) ( not ( = ?auto_652001 ?auto_652006 ) ) ( not ( = ?auto_652001 ?auto_652007 ) ) ( not ( = ?auto_652001 ?auto_652008 ) ) ( not ( = ?auto_652001 ?auto_652011 ) ) ( not ( = ?auto_652002 ?auto_652004 ) ) ( not ( = ?auto_652002 ?auto_652003 ) ) ( not ( = ?auto_652002 ?auto_652005 ) ) ( not ( = ?auto_652002 ?auto_652006 ) ) ( not ( = ?auto_652002 ?auto_652007 ) ) ( not ( = ?auto_652002 ?auto_652008 ) ) ( not ( = ?auto_652002 ?auto_652011 ) ) ( not ( = ?auto_652004 ?auto_652003 ) ) ( not ( = ?auto_652004 ?auto_652005 ) ) ( not ( = ?auto_652004 ?auto_652006 ) ) ( not ( = ?auto_652004 ?auto_652007 ) ) ( not ( = ?auto_652004 ?auto_652008 ) ) ( not ( = ?auto_652004 ?auto_652011 ) ) ( not ( = ?auto_652003 ?auto_652005 ) ) ( not ( = ?auto_652003 ?auto_652006 ) ) ( not ( = ?auto_652003 ?auto_652007 ) ) ( not ( = ?auto_652003 ?auto_652008 ) ) ( not ( = ?auto_652003 ?auto_652011 ) ) ( not ( = ?auto_652005 ?auto_652006 ) ) ( not ( = ?auto_652005 ?auto_652007 ) ) ( not ( = ?auto_652005 ?auto_652008 ) ) ( not ( = ?auto_652005 ?auto_652011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652006 ?auto_652007 ?auto_652008 )
      ( MAKE-8CRATE-VERIFY ?auto_652000 ?auto_652001 ?auto_652002 ?auto_652004 ?auto_652003 ?auto_652005 ?auto_652006 ?auto_652007 ?auto_652008 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652093 - SURFACE
      ?auto_652094 - SURFACE
      ?auto_652095 - SURFACE
      ?auto_652097 - SURFACE
      ?auto_652096 - SURFACE
      ?auto_652098 - SURFACE
      ?auto_652099 - SURFACE
      ?auto_652100 - SURFACE
      ?auto_652101 - SURFACE
    )
    :vars
    (
      ?auto_652104 - HOIST
      ?auto_652107 - PLACE
      ?auto_652105 - PLACE
      ?auto_652102 - HOIST
      ?auto_652106 - SURFACE
      ?auto_652103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652104 ?auto_652107 ) ( SURFACE-AT ?auto_652100 ?auto_652107 ) ( CLEAR ?auto_652100 ) ( IS-CRATE ?auto_652101 ) ( not ( = ?auto_652100 ?auto_652101 ) ) ( AVAILABLE ?auto_652104 ) ( ON ?auto_652100 ?auto_652099 ) ( not ( = ?auto_652099 ?auto_652100 ) ) ( not ( = ?auto_652099 ?auto_652101 ) ) ( not ( = ?auto_652105 ?auto_652107 ) ) ( HOIST-AT ?auto_652102 ?auto_652105 ) ( not ( = ?auto_652104 ?auto_652102 ) ) ( AVAILABLE ?auto_652102 ) ( SURFACE-AT ?auto_652101 ?auto_652105 ) ( ON ?auto_652101 ?auto_652106 ) ( CLEAR ?auto_652101 ) ( not ( = ?auto_652100 ?auto_652106 ) ) ( not ( = ?auto_652101 ?auto_652106 ) ) ( not ( = ?auto_652099 ?auto_652106 ) ) ( TRUCK-AT ?auto_652103 ?auto_652107 ) ( ON ?auto_652094 ?auto_652093 ) ( ON ?auto_652095 ?auto_652094 ) ( ON ?auto_652097 ?auto_652095 ) ( ON ?auto_652096 ?auto_652097 ) ( ON ?auto_652098 ?auto_652096 ) ( ON ?auto_652099 ?auto_652098 ) ( not ( = ?auto_652093 ?auto_652094 ) ) ( not ( = ?auto_652093 ?auto_652095 ) ) ( not ( = ?auto_652093 ?auto_652097 ) ) ( not ( = ?auto_652093 ?auto_652096 ) ) ( not ( = ?auto_652093 ?auto_652098 ) ) ( not ( = ?auto_652093 ?auto_652099 ) ) ( not ( = ?auto_652093 ?auto_652100 ) ) ( not ( = ?auto_652093 ?auto_652101 ) ) ( not ( = ?auto_652093 ?auto_652106 ) ) ( not ( = ?auto_652094 ?auto_652095 ) ) ( not ( = ?auto_652094 ?auto_652097 ) ) ( not ( = ?auto_652094 ?auto_652096 ) ) ( not ( = ?auto_652094 ?auto_652098 ) ) ( not ( = ?auto_652094 ?auto_652099 ) ) ( not ( = ?auto_652094 ?auto_652100 ) ) ( not ( = ?auto_652094 ?auto_652101 ) ) ( not ( = ?auto_652094 ?auto_652106 ) ) ( not ( = ?auto_652095 ?auto_652097 ) ) ( not ( = ?auto_652095 ?auto_652096 ) ) ( not ( = ?auto_652095 ?auto_652098 ) ) ( not ( = ?auto_652095 ?auto_652099 ) ) ( not ( = ?auto_652095 ?auto_652100 ) ) ( not ( = ?auto_652095 ?auto_652101 ) ) ( not ( = ?auto_652095 ?auto_652106 ) ) ( not ( = ?auto_652097 ?auto_652096 ) ) ( not ( = ?auto_652097 ?auto_652098 ) ) ( not ( = ?auto_652097 ?auto_652099 ) ) ( not ( = ?auto_652097 ?auto_652100 ) ) ( not ( = ?auto_652097 ?auto_652101 ) ) ( not ( = ?auto_652097 ?auto_652106 ) ) ( not ( = ?auto_652096 ?auto_652098 ) ) ( not ( = ?auto_652096 ?auto_652099 ) ) ( not ( = ?auto_652096 ?auto_652100 ) ) ( not ( = ?auto_652096 ?auto_652101 ) ) ( not ( = ?auto_652096 ?auto_652106 ) ) ( not ( = ?auto_652098 ?auto_652099 ) ) ( not ( = ?auto_652098 ?auto_652100 ) ) ( not ( = ?auto_652098 ?auto_652101 ) ) ( not ( = ?auto_652098 ?auto_652106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652099 ?auto_652100 ?auto_652101 )
      ( MAKE-8CRATE-VERIFY ?auto_652093 ?auto_652094 ?auto_652095 ?auto_652097 ?auto_652096 ?auto_652098 ?auto_652099 ?auto_652100 ?auto_652101 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652186 - SURFACE
      ?auto_652187 - SURFACE
      ?auto_652188 - SURFACE
      ?auto_652190 - SURFACE
      ?auto_652189 - SURFACE
      ?auto_652191 - SURFACE
      ?auto_652192 - SURFACE
      ?auto_652193 - SURFACE
      ?auto_652194 - SURFACE
    )
    :vars
    (
      ?auto_652195 - HOIST
      ?auto_652196 - PLACE
      ?auto_652200 - PLACE
      ?auto_652199 - HOIST
      ?auto_652197 - SURFACE
      ?auto_652198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652195 ?auto_652196 ) ( IS-CRATE ?auto_652194 ) ( not ( = ?auto_652193 ?auto_652194 ) ) ( not ( = ?auto_652192 ?auto_652193 ) ) ( not ( = ?auto_652192 ?auto_652194 ) ) ( not ( = ?auto_652200 ?auto_652196 ) ) ( HOIST-AT ?auto_652199 ?auto_652200 ) ( not ( = ?auto_652195 ?auto_652199 ) ) ( AVAILABLE ?auto_652199 ) ( SURFACE-AT ?auto_652194 ?auto_652200 ) ( ON ?auto_652194 ?auto_652197 ) ( CLEAR ?auto_652194 ) ( not ( = ?auto_652193 ?auto_652197 ) ) ( not ( = ?auto_652194 ?auto_652197 ) ) ( not ( = ?auto_652192 ?auto_652197 ) ) ( TRUCK-AT ?auto_652198 ?auto_652196 ) ( SURFACE-AT ?auto_652192 ?auto_652196 ) ( CLEAR ?auto_652192 ) ( LIFTING ?auto_652195 ?auto_652193 ) ( IS-CRATE ?auto_652193 ) ( ON ?auto_652187 ?auto_652186 ) ( ON ?auto_652188 ?auto_652187 ) ( ON ?auto_652190 ?auto_652188 ) ( ON ?auto_652189 ?auto_652190 ) ( ON ?auto_652191 ?auto_652189 ) ( ON ?auto_652192 ?auto_652191 ) ( not ( = ?auto_652186 ?auto_652187 ) ) ( not ( = ?auto_652186 ?auto_652188 ) ) ( not ( = ?auto_652186 ?auto_652190 ) ) ( not ( = ?auto_652186 ?auto_652189 ) ) ( not ( = ?auto_652186 ?auto_652191 ) ) ( not ( = ?auto_652186 ?auto_652192 ) ) ( not ( = ?auto_652186 ?auto_652193 ) ) ( not ( = ?auto_652186 ?auto_652194 ) ) ( not ( = ?auto_652186 ?auto_652197 ) ) ( not ( = ?auto_652187 ?auto_652188 ) ) ( not ( = ?auto_652187 ?auto_652190 ) ) ( not ( = ?auto_652187 ?auto_652189 ) ) ( not ( = ?auto_652187 ?auto_652191 ) ) ( not ( = ?auto_652187 ?auto_652192 ) ) ( not ( = ?auto_652187 ?auto_652193 ) ) ( not ( = ?auto_652187 ?auto_652194 ) ) ( not ( = ?auto_652187 ?auto_652197 ) ) ( not ( = ?auto_652188 ?auto_652190 ) ) ( not ( = ?auto_652188 ?auto_652189 ) ) ( not ( = ?auto_652188 ?auto_652191 ) ) ( not ( = ?auto_652188 ?auto_652192 ) ) ( not ( = ?auto_652188 ?auto_652193 ) ) ( not ( = ?auto_652188 ?auto_652194 ) ) ( not ( = ?auto_652188 ?auto_652197 ) ) ( not ( = ?auto_652190 ?auto_652189 ) ) ( not ( = ?auto_652190 ?auto_652191 ) ) ( not ( = ?auto_652190 ?auto_652192 ) ) ( not ( = ?auto_652190 ?auto_652193 ) ) ( not ( = ?auto_652190 ?auto_652194 ) ) ( not ( = ?auto_652190 ?auto_652197 ) ) ( not ( = ?auto_652189 ?auto_652191 ) ) ( not ( = ?auto_652189 ?auto_652192 ) ) ( not ( = ?auto_652189 ?auto_652193 ) ) ( not ( = ?auto_652189 ?auto_652194 ) ) ( not ( = ?auto_652189 ?auto_652197 ) ) ( not ( = ?auto_652191 ?auto_652192 ) ) ( not ( = ?auto_652191 ?auto_652193 ) ) ( not ( = ?auto_652191 ?auto_652194 ) ) ( not ( = ?auto_652191 ?auto_652197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652192 ?auto_652193 ?auto_652194 )
      ( MAKE-8CRATE-VERIFY ?auto_652186 ?auto_652187 ?auto_652188 ?auto_652190 ?auto_652189 ?auto_652191 ?auto_652192 ?auto_652193 ?auto_652194 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_652279 - SURFACE
      ?auto_652280 - SURFACE
      ?auto_652281 - SURFACE
      ?auto_652283 - SURFACE
      ?auto_652282 - SURFACE
      ?auto_652284 - SURFACE
      ?auto_652285 - SURFACE
      ?auto_652286 - SURFACE
      ?auto_652287 - SURFACE
    )
    :vars
    (
      ?auto_652292 - HOIST
      ?auto_652289 - PLACE
      ?auto_652290 - PLACE
      ?auto_652288 - HOIST
      ?auto_652291 - SURFACE
      ?auto_652293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652292 ?auto_652289 ) ( IS-CRATE ?auto_652287 ) ( not ( = ?auto_652286 ?auto_652287 ) ) ( not ( = ?auto_652285 ?auto_652286 ) ) ( not ( = ?auto_652285 ?auto_652287 ) ) ( not ( = ?auto_652290 ?auto_652289 ) ) ( HOIST-AT ?auto_652288 ?auto_652290 ) ( not ( = ?auto_652292 ?auto_652288 ) ) ( AVAILABLE ?auto_652288 ) ( SURFACE-AT ?auto_652287 ?auto_652290 ) ( ON ?auto_652287 ?auto_652291 ) ( CLEAR ?auto_652287 ) ( not ( = ?auto_652286 ?auto_652291 ) ) ( not ( = ?auto_652287 ?auto_652291 ) ) ( not ( = ?auto_652285 ?auto_652291 ) ) ( TRUCK-AT ?auto_652293 ?auto_652289 ) ( SURFACE-AT ?auto_652285 ?auto_652289 ) ( CLEAR ?auto_652285 ) ( IS-CRATE ?auto_652286 ) ( AVAILABLE ?auto_652292 ) ( IN ?auto_652286 ?auto_652293 ) ( ON ?auto_652280 ?auto_652279 ) ( ON ?auto_652281 ?auto_652280 ) ( ON ?auto_652283 ?auto_652281 ) ( ON ?auto_652282 ?auto_652283 ) ( ON ?auto_652284 ?auto_652282 ) ( ON ?auto_652285 ?auto_652284 ) ( not ( = ?auto_652279 ?auto_652280 ) ) ( not ( = ?auto_652279 ?auto_652281 ) ) ( not ( = ?auto_652279 ?auto_652283 ) ) ( not ( = ?auto_652279 ?auto_652282 ) ) ( not ( = ?auto_652279 ?auto_652284 ) ) ( not ( = ?auto_652279 ?auto_652285 ) ) ( not ( = ?auto_652279 ?auto_652286 ) ) ( not ( = ?auto_652279 ?auto_652287 ) ) ( not ( = ?auto_652279 ?auto_652291 ) ) ( not ( = ?auto_652280 ?auto_652281 ) ) ( not ( = ?auto_652280 ?auto_652283 ) ) ( not ( = ?auto_652280 ?auto_652282 ) ) ( not ( = ?auto_652280 ?auto_652284 ) ) ( not ( = ?auto_652280 ?auto_652285 ) ) ( not ( = ?auto_652280 ?auto_652286 ) ) ( not ( = ?auto_652280 ?auto_652287 ) ) ( not ( = ?auto_652280 ?auto_652291 ) ) ( not ( = ?auto_652281 ?auto_652283 ) ) ( not ( = ?auto_652281 ?auto_652282 ) ) ( not ( = ?auto_652281 ?auto_652284 ) ) ( not ( = ?auto_652281 ?auto_652285 ) ) ( not ( = ?auto_652281 ?auto_652286 ) ) ( not ( = ?auto_652281 ?auto_652287 ) ) ( not ( = ?auto_652281 ?auto_652291 ) ) ( not ( = ?auto_652283 ?auto_652282 ) ) ( not ( = ?auto_652283 ?auto_652284 ) ) ( not ( = ?auto_652283 ?auto_652285 ) ) ( not ( = ?auto_652283 ?auto_652286 ) ) ( not ( = ?auto_652283 ?auto_652287 ) ) ( not ( = ?auto_652283 ?auto_652291 ) ) ( not ( = ?auto_652282 ?auto_652284 ) ) ( not ( = ?auto_652282 ?auto_652285 ) ) ( not ( = ?auto_652282 ?auto_652286 ) ) ( not ( = ?auto_652282 ?auto_652287 ) ) ( not ( = ?auto_652282 ?auto_652291 ) ) ( not ( = ?auto_652284 ?auto_652285 ) ) ( not ( = ?auto_652284 ?auto_652286 ) ) ( not ( = ?auto_652284 ?auto_652287 ) ) ( not ( = ?auto_652284 ?auto_652291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_652285 ?auto_652286 ?auto_652287 )
      ( MAKE-8CRATE-VERIFY ?auto_652279 ?auto_652280 ?auto_652281 ?auto_652283 ?auto_652282 ?auto_652284 ?auto_652285 ?auto_652286 ?auto_652287 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656365 - SURFACE
      ?auto_656366 - SURFACE
      ?auto_656367 - SURFACE
      ?auto_656369 - SURFACE
      ?auto_656368 - SURFACE
      ?auto_656370 - SURFACE
      ?auto_656371 - SURFACE
      ?auto_656372 - SURFACE
      ?auto_656373 - SURFACE
      ?auto_656374 - SURFACE
    )
    :vars
    (
      ?auto_656376 - HOIST
      ?auto_656375 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_656376 ?auto_656375 ) ( SURFACE-AT ?auto_656373 ?auto_656375 ) ( CLEAR ?auto_656373 ) ( LIFTING ?auto_656376 ?auto_656374 ) ( IS-CRATE ?auto_656374 ) ( not ( = ?auto_656373 ?auto_656374 ) ) ( ON ?auto_656366 ?auto_656365 ) ( ON ?auto_656367 ?auto_656366 ) ( ON ?auto_656369 ?auto_656367 ) ( ON ?auto_656368 ?auto_656369 ) ( ON ?auto_656370 ?auto_656368 ) ( ON ?auto_656371 ?auto_656370 ) ( ON ?auto_656372 ?auto_656371 ) ( ON ?auto_656373 ?auto_656372 ) ( not ( = ?auto_656365 ?auto_656366 ) ) ( not ( = ?auto_656365 ?auto_656367 ) ) ( not ( = ?auto_656365 ?auto_656369 ) ) ( not ( = ?auto_656365 ?auto_656368 ) ) ( not ( = ?auto_656365 ?auto_656370 ) ) ( not ( = ?auto_656365 ?auto_656371 ) ) ( not ( = ?auto_656365 ?auto_656372 ) ) ( not ( = ?auto_656365 ?auto_656373 ) ) ( not ( = ?auto_656365 ?auto_656374 ) ) ( not ( = ?auto_656366 ?auto_656367 ) ) ( not ( = ?auto_656366 ?auto_656369 ) ) ( not ( = ?auto_656366 ?auto_656368 ) ) ( not ( = ?auto_656366 ?auto_656370 ) ) ( not ( = ?auto_656366 ?auto_656371 ) ) ( not ( = ?auto_656366 ?auto_656372 ) ) ( not ( = ?auto_656366 ?auto_656373 ) ) ( not ( = ?auto_656366 ?auto_656374 ) ) ( not ( = ?auto_656367 ?auto_656369 ) ) ( not ( = ?auto_656367 ?auto_656368 ) ) ( not ( = ?auto_656367 ?auto_656370 ) ) ( not ( = ?auto_656367 ?auto_656371 ) ) ( not ( = ?auto_656367 ?auto_656372 ) ) ( not ( = ?auto_656367 ?auto_656373 ) ) ( not ( = ?auto_656367 ?auto_656374 ) ) ( not ( = ?auto_656369 ?auto_656368 ) ) ( not ( = ?auto_656369 ?auto_656370 ) ) ( not ( = ?auto_656369 ?auto_656371 ) ) ( not ( = ?auto_656369 ?auto_656372 ) ) ( not ( = ?auto_656369 ?auto_656373 ) ) ( not ( = ?auto_656369 ?auto_656374 ) ) ( not ( = ?auto_656368 ?auto_656370 ) ) ( not ( = ?auto_656368 ?auto_656371 ) ) ( not ( = ?auto_656368 ?auto_656372 ) ) ( not ( = ?auto_656368 ?auto_656373 ) ) ( not ( = ?auto_656368 ?auto_656374 ) ) ( not ( = ?auto_656370 ?auto_656371 ) ) ( not ( = ?auto_656370 ?auto_656372 ) ) ( not ( = ?auto_656370 ?auto_656373 ) ) ( not ( = ?auto_656370 ?auto_656374 ) ) ( not ( = ?auto_656371 ?auto_656372 ) ) ( not ( = ?auto_656371 ?auto_656373 ) ) ( not ( = ?auto_656371 ?auto_656374 ) ) ( not ( = ?auto_656372 ?auto_656373 ) ) ( not ( = ?auto_656372 ?auto_656374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_656373 ?auto_656374 )
      ( MAKE-9CRATE-VERIFY ?auto_656365 ?auto_656366 ?auto_656367 ?auto_656369 ?auto_656368 ?auto_656370 ?auto_656371 ?auto_656372 ?auto_656373 ?auto_656374 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656445 - SURFACE
      ?auto_656446 - SURFACE
      ?auto_656447 - SURFACE
      ?auto_656449 - SURFACE
      ?auto_656448 - SURFACE
      ?auto_656450 - SURFACE
      ?auto_656451 - SURFACE
      ?auto_656452 - SURFACE
      ?auto_656453 - SURFACE
      ?auto_656454 - SURFACE
    )
    :vars
    (
      ?auto_656456 - HOIST
      ?auto_656457 - PLACE
      ?auto_656455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_656456 ?auto_656457 ) ( SURFACE-AT ?auto_656453 ?auto_656457 ) ( CLEAR ?auto_656453 ) ( IS-CRATE ?auto_656454 ) ( not ( = ?auto_656453 ?auto_656454 ) ) ( TRUCK-AT ?auto_656455 ?auto_656457 ) ( AVAILABLE ?auto_656456 ) ( IN ?auto_656454 ?auto_656455 ) ( ON ?auto_656453 ?auto_656452 ) ( not ( = ?auto_656452 ?auto_656453 ) ) ( not ( = ?auto_656452 ?auto_656454 ) ) ( ON ?auto_656446 ?auto_656445 ) ( ON ?auto_656447 ?auto_656446 ) ( ON ?auto_656449 ?auto_656447 ) ( ON ?auto_656448 ?auto_656449 ) ( ON ?auto_656450 ?auto_656448 ) ( ON ?auto_656451 ?auto_656450 ) ( ON ?auto_656452 ?auto_656451 ) ( not ( = ?auto_656445 ?auto_656446 ) ) ( not ( = ?auto_656445 ?auto_656447 ) ) ( not ( = ?auto_656445 ?auto_656449 ) ) ( not ( = ?auto_656445 ?auto_656448 ) ) ( not ( = ?auto_656445 ?auto_656450 ) ) ( not ( = ?auto_656445 ?auto_656451 ) ) ( not ( = ?auto_656445 ?auto_656452 ) ) ( not ( = ?auto_656445 ?auto_656453 ) ) ( not ( = ?auto_656445 ?auto_656454 ) ) ( not ( = ?auto_656446 ?auto_656447 ) ) ( not ( = ?auto_656446 ?auto_656449 ) ) ( not ( = ?auto_656446 ?auto_656448 ) ) ( not ( = ?auto_656446 ?auto_656450 ) ) ( not ( = ?auto_656446 ?auto_656451 ) ) ( not ( = ?auto_656446 ?auto_656452 ) ) ( not ( = ?auto_656446 ?auto_656453 ) ) ( not ( = ?auto_656446 ?auto_656454 ) ) ( not ( = ?auto_656447 ?auto_656449 ) ) ( not ( = ?auto_656447 ?auto_656448 ) ) ( not ( = ?auto_656447 ?auto_656450 ) ) ( not ( = ?auto_656447 ?auto_656451 ) ) ( not ( = ?auto_656447 ?auto_656452 ) ) ( not ( = ?auto_656447 ?auto_656453 ) ) ( not ( = ?auto_656447 ?auto_656454 ) ) ( not ( = ?auto_656449 ?auto_656448 ) ) ( not ( = ?auto_656449 ?auto_656450 ) ) ( not ( = ?auto_656449 ?auto_656451 ) ) ( not ( = ?auto_656449 ?auto_656452 ) ) ( not ( = ?auto_656449 ?auto_656453 ) ) ( not ( = ?auto_656449 ?auto_656454 ) ) ( not ( = ?auto_656448 ?auto_656450 ) ) ( not ( = ?auto_656448 ?auto_656451 ) ) ( not ( = ?auto_656448 ?auto_656452 ) ) ( not ( = ?auto_656448 ?auto_656453 ) ) ( not ( = ?auto_656448 ?auto_656454 ) ) ( not ( = ?auto_656450 ?auto_656451 ) ) ( not ( = ?auto_656450 ?auto_656452 ) ) ( not ( = ?auto_656450 ?auto_656453 ) ) ( not ( = ?auto_656450 ?auto_656454 ) ) ( not ( = ?auto_656451 ?auto_656452 ) ) ( not ( = ?auto_656451 ?auto_656453 ) ) ( not ( = ?auto_656451 ?auto_656454 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656452 ?auto_656453 ?auto_656454 )
      ( MAKE-9CRATE-VERIFY ?auto_656445 ?auto_656446 ?auto_656447 ?auto_656449 ?auto_656448 ?auto_656450 ?auto_656451 ?auto_656452 ?auto_656453 ?auto_656454 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656535 - SURFACE
      ?auto_656536 - SURFACE
      ?auto_656537 - SURFACE
      ?auto_656539 - SURFACE
      ?auto_656538 - SURFACE
      ?auto_656540 - SURFACE
      ?auto_656541 - SURFACE
      ?auto_656542 - SURFACE
      ?auto_656543 - SURFACE
      ?auto_656544 - SURFACE
    )
    :vars
    (
      ?auto_656545 - HOIST
      ?auto_656548 - PLACE
      ?auto_656546 - TRUCK
      ?auto_656547 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_656545 ?auto_656548 ) ( SURFACE-AT ?auto_656543 ?auto_656548 ) ( CLEAR ?auto_656543 ) ( IS-CRATE ?auto_656544 ) ( not ( = ?auto_656543 ?auto_656544 ) ) ( AVAILABLE ?auto_656545 ) ( IN ?auto_656544 ?auto_656546 ) ( ON ?auto_656543 ?auto_656542 ) ( not ( = ?auto_656542 ?auto_656543 ) ) ( not ( = ?auto_656542 ?auto_656544 ) ) ( TRUCK-AT ?auto_656546 ?auto_656547 ) ( not ( = ?auto_656547 ?auto_656548 ) ) ( ON ?auto_656536 ?auto_656535 ) ( ON ?auto_656537 ?auto_656536 ) ( ON ?auto_656539 ?auto_656537 ) ( ON ?auto_656538 ?auto_656539 ) ( ON ?auto_656540 ?auto_656538 ) ( ON ?auto_656541 ?auto_656540 ) ( ON ?auto_656542 ?auto_656541 ) ( not ( = ?auto_656535 ?auto_656536 ) ) ( not ( = ?auto_656535 ?auto_656537 ) ) ( not ( = ?auto_656535 ?auto_656539 ) ) ( not ( = ?auto_656535 ?auto_656538 ) ) ( not ( = ?auto_656535 ?auto_656540 ) ) ( not ( = ?auto_656535 ?auto_656541 ) ) ( not ( = ?auto_656535 ?auto_656542 ) ) ( not ( = ?auto_656535 ?auto_656543 ) ) ( not ( = ?auto_656535 ?auto_656544 ) ) ( not ( = ?auto_656536 ?auto_656537 ) ) ( not ( = ?auto_656536 ?auto_656539 ) ) ( not ( = ?auto_656536 ?auto_656538 ) ) ( not ( = ?auto_656536 ?auto_656540 ) ) ( not ( = ?auto_656536 ?auto_656541 ) ) ( not ( = ?auto_656536 ?auto_656542 ) ) ( not ( = ?auto_656536 ?auto_656543 ) ) ( not ( = ?auto_656536 ?auto_656544 ) ) ( not ( = ?auto_656537 ?auto_656539 ) ) ( not ( = ?auto_656537 ?auto_656538 ) ) ( not ( = ?auto_656537 ?auto_656540 ) ) ( not ( = ?auto_656537 ?auto_656541 ) ) ( not ( = ?auto_656537 ?auto_656542 ) ) ( not ( = ?auto_656537 ?auto_656543 ) ) ( not ( = ?auto_656537 ?auto_656544 ) ) ( not ( = ?auto_656539 ?auto_656538 ) ) ( not ( = ?auto_656539 ?auto_656540 ) ) ( not ( = ?auto_656539 ?auto_656541 ) ) ( not ( = ?auto_656539 ?auto_656542 ) ) ( not ( = ?auto_656539 ?auto_656543 ) ) ( not ( = ?auto_656539 ?auto_656544 ) ) ( not ( = ?auto_656538 ?auto_656540 ) ) ( not ( = ?auto_656538 ?auto_656541 ) ) ( not ( = ?auto_656538 ?auto_656542 ) ) ( not ( = ?auto_656538 ?auto_656543 ) ) ( not ( = ?auto_656538 ?auto_656544 ) ) ( not ( = ?auto_656540 ?auto_656541 ) ) ( not ( = ?auto_656540 ?auto_656542 ) ) ( not ( = ?auto_656540 ?auto_656543 ) ) ( not ( = ?auto_656540 ?auto_656544 ) ) ( not ( = ?auto_656541 ?auto_656542 ) ) ( not ( = ?auto_656541 ?auto_656543 ) ) ( not ( = ?auto_656541 ?auto_656544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656542 ?auto_656543 ?auto_656544 )
      ( MAKE-9CRATE-VERIFY ?auto_656535 ?auto_656536 ?auto_656537 ?auto_656539 ?auto_656538 ?auto_656540 ?auto_656541 ?auto_656542 ?auto_656543 ?auto_656544 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656634 - SURFACE
      ?auto_656635 - SURFACE
      ?auto_656636 - SURFACE
      ?auto_656638 - SURFACE
      ?auto_656637 - SURFACE
      ?auto_656639 - SURFACE
      ?auto_656640 - SURFACE
      ?auto_656641 - SURFACE
      ?auto_656642 - SURFACE
      ?auto_656643 - SURFACE
    )
    :vars
    (
      ?auto_656644 - HOIST
      ?auto_656648 - PLACE
      ?auto_656646 - TRUCK
      ?auto_656647 - PLACE
      ?auto_656645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_656644 ?auto_656648 ) ( SURFACE-AT ?auto_656642 ?auto_656648 ) ( CLEAR ?auto_656642 ) ( IS-CRATE ?auto_656643 ) ( not ( = ?auto_656642 ?auto_656643 ) ) ( AVAILABLE ?auto_656644 ) ( ON ?auto_656642 ?auto_656641 ) ( not ( = ?auto_656641 ?auto_656642 ) ) ( not ( = ?auto_656641 ?auto_656643 ) ) ( TRUCK-AT ?auto_656646 ?auto_656647 ) ( not ( = ?auto_656647 ?auto_656648 ) ) ( HOIST-AT ?auto_656645 ?auto_656647 ) ( LIFTING ?auto_656645 ?auto_656643 ) ( not ( = ?auto_656644 ?auto_656645 ) ) ( ON ?auto_656635 ?auto_656634 ) ( ON ?auto_656636 ?auto_656635 ) ( ON ?auto_656638 ?auto_656636 ) ( ON ?auto_656637 ?auto_656638 ) ( ON ?auto_656639 ?auto_656637 ) ( ON ?auto_656640 ?auto_656639 ) ( ON ?auto_656641 ?auto_656640 ) ( not ( = ?auto_656634 ?auto_656635 ) ) ( not ( = ?auto_656634 ?auto_656636 ) ) ( not ( = ?auto_656634 ?auto_656638 ) ) ( not ( = ?auto_656634 ?auto_656637 ) ) ( not ( = ?auto_656634 ?auto_656639 ) ) ( not ( = ?auto_656634 ?auto_656640 ) ) ( not ( = ?auto_656634 ?auto_656641 ) ) ( not ( = ?auto_656634 ?auto_656642 ) ) ( not ( = ?auto_656634 ?auto_656643 ) ) ( not ( = ?auto_656635 ?auto_656636 ) ) ( not ( = ?auto_656635 ?auto_656638 ) ) ( not ( = ?auto_656635 ?auto_656637 ) ) ( not ( = ?auto_656635 ?auto_656639 ) ) ( not ( = ?auto_656635 ?auto_656640 ) ) ( not ( = ?auto_656635 ?auto_656641 ) ) ( not ( = ?auto_656635 ?auto_656642 ) ) ( not ( = ?auto_656635 ?auto_656643 ) ) ( not ( = ?auto_656636 ?auto_656638 ) ) ( not ( = ?auto_656636 ?auto_656637 ) ) ( not ( = ?auto_656636 ?auto_656639 ) ) ( not ( = ?auto_656636 ?auto_656640 ) ) ( not ( = ?auto_656636 ?auto_656641 ) ) ( not ( = ?auto_656636 ?auto_656642 ) ) ( not ( = ?auto_656636 ?auto_656643 ) ) ( not ( = ?auto_656638 ?auto_656637 ) ) ( not ( = ?auto_656638 ?auto_656639 ) ) ( not ( = ?auto_656638 ?auto_656640 ) ) ( not ( = ?auto_656638 ?auto_656641 ) ) ( not ( = ?auto_656638 ?auto_656642 ) ) ( not ( = ?auto_656638 ?auto_656643 ) ) ( not ( = ?auto_656637 ?auto_656639 ) ) ( not ( = ?auto_656637 ?auto_656640 ) ) ( not ( = ?auto_656637 ?auto_656641 ) ) ( not ( = ?auto_656637 ?auto_656642 ) ) ( not ( = ?auto_656637 ?auto_656643 ) ) ( not ( = ?auto_656639 ?auto_656640 ) ) ( not ( = ?auto_656639 ?auto_656641 ) ) ( not ( = ?auto_656639 ?auto_656642 ) ) ( not ( = ?auto_656639 ?auto_656643 ) ) ( not ( = ?auto_656640 ?auto_656641 ) ) ( not ( = ?auto_656640 ?auto_656642 ) ) ( not ( = ?auto_656640 ?auto_656643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656641 ?auto_656642 ?auto_656643 )
      ( MAKE-9CRATE-VERIFY ?auto_656634 ?auto_656635 ?auto_656636 ?auto_656638 ?auto_656637 ?auto_656639 ?auto_656640 ?auto_656641 ?auto_656642 ?auto_656643 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656742 - SURFACE
      ?auto_656743 - SURFACE
      ?auto_656744 - SURFACE
      ?auto_656746 - SURFACE
      ?auto_656745 - SURFACE
      ?auto_656747 - SURFACE
      ?auto_656748 - SURFACE
      ?auto_656749 - SURFACE
      ?auto_656750 - SURFACE
      ?auto_656751 - SURFACE
    )
    :vars
    (
      ?auto_656752 - HOIST
      ?auto_656753 - PLACE
      ?auto_656756 - TRUCK
      ?auto_656757 - PLACE
      ?auto_656755 - HOIST
      ?auto_656754 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_656752 ?auto_656753 ) ( SURFACE-AT ?auto_656750 ?auto_656753 ) ( CLEAR ?auto_656750 ) ( IS-CRATE ?auto_656751 ) ( not ( = ?auto_656750 ?auto_656751 ) ) ( AVAILABLE ?auto_656752 ) ( ON ?auto_656750 ?auto_656749 ) ( not ( = ?auto_656749 ?auto_656750 ) ) ( not ( = ?auto_656749 ?auto_656751 ) ) ( TRUCK-AT ?auto_656756 ?auto_656757 ) ( not ( = ?auto_656757 ?auto_656753 ) ) ( HOIST-AT ?auto_656755 ?auto_656757 ) ( not ( = ?auto_656752 ?auto_656755 ) ) ( AVAILABLE ?auto_656755 ) ( SURFACE-AT ?auto_656751 ?auto_656757 ) ( ON ?auto_656751 ?auto_656754 ) ( CLEAR ?auto_656751 ) ( not ( = ?auto_656750 ?auto_656754 ) ) ( not ( = ?auto_656751 ?auto_656754 ) ) ( not ( = ?auto_656749 ?auto_656754 ) ) ( ON ?auto_656743 ?auto_656742 ) ( ON ?auto_656744 ?auto_656743 ) ( ON ?auto_656746 ?auto_656744 ) ( ON ?auto_656745 ?auto_656746 ) ( ON ?auto_656747 ?auto_656745 ) ( ON ?auto_656748 ?auto_656747 ) ( ON ?auto_656749 ?auto_656748 ) ( not ( = ?auto_656742 ?auto_656743 ) ) ( not ( = ?auto_656742 ?auto_656744 ) ) ( not ( = ?auto_656742 ?auto_656746 ) ) ( not ( = ?auto_656742 ?auto_656745 ) ) ( not ( = ?auto_656742 ?auto_656747 ) ) ( not ( = ?auto_656742 ?auto_656748 ) ) ( not ( = ?auto_656742 ?auto_656749 ) ) ( not ( = ?auto_656742 ?auto_656750 ) ) ( not ( = ?auto_656742 ?auto_656751 ) ) ( not ( = ?auto_656742 ?auto_656754 ) ) ( not ( = ?auto_656743 ?auto_656744 ) ) ( not ( = ?auto_656743 ?auto_656746 ) ) ( not ( = ?auto_656743 ?auto_656745 ) ) ( not ( = ?auto_656743 ?auto_656747 ) ) ( not ( = ?auto_656743 ?auto_656748 ) ) ( not ( = ?auto_656743 ?auto_656749 ) ) ( not ( = ?auto_656743 ?auto_656750 ) ) ( not ( = ?auto_656743 ?auto_656751 ) ) ( not ( = ?auto_656743 ?auto_656754 ) ) ( not ( = ?auto_656744 ?auto_656746 ) ) ( not ( = ?auto_656744 ?auto_656745 ) ) ( not ( = ?auto_656744 ?auto_656747 ) ) ( not ( = ?auto_656744 ?auto_656748 ) ) ( not ( = ?auto_656744 ?auto_656749 ) ) ( not ( = ?auto_656744 ?auto_656750 ) ) ( not ( = ?auto_656744 ?auto_656751 ) ) ( not ( = ?auto_656744 ?auto_656754 ) ) ( not ( = ?auto_656746 ?auto_656745 ) ) ( not ( = ?auto_656746 ?auto_656747 ) ) ( not ( = ?auto_656746 ?auto_656748 ) ) ( not ( = ?auto_656746 ?auto_656749 ) ) ( not ( = ?auto_656746 ?auto_656750 ) ) ( not ( = ?auto_656746 ?auto_656751 ) ) ( not ( = ?auto_656746 ?auto_656754 ) ) ( not ( = ?auto_656745 ?auto_656747 ) ) ( not ( = ?auto_656745 ?auto_656748 ) ) ( not ( = ?auto_656745 ?auto_656749 ) ) ( not ( = ?auto_656745 ?auto_656750 ) ) ( not ( = ?auto_656745 ?auto_656751 ) ) ( not ( = ?auto_656745 ?auto_656754 ) ) ( not ( = ?auto_656747 ?auto_656748 ) ) ( not ( = ?auto_656747 ?auto_656749 ) ) ( not ( = ?auto_656747 ?auto_656750 ) ) ( not ( = ?auto_656747 ?auto_656751 ) ) ( not ( = ?auto_656747 ?auto_656754 ) ) ( not ( = ?auto_656748 ?auto_656749 ) ) ( not ( = ?auto_656748 ?auto_656750 ) ) ( not ( = ?auto_656748 ?auto_656751 ) ) ( not ( = ?auto_656748 ?auto_656754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656749 ?auto_656750 ?auto_656751 )
      ( MAKE-9CRATE-VERIFY ?auto_656742 ?auto_656743 ?auto_656744 ?auto_656746 ?auto_656745 ?auto_656747 ?auto_656748 ?auto_656749 ?auto_656750 ?auto_656751 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656851 - SURFACE
      ?auto_656852 - SURFACE
      ?auto_656853 - SURFACE
      ?auto_656855 - SURFACE
      ?auto_656854 - SURFACE
      ?auto_656856 - SURFACE
      ?auto_656857 - SURFACE
      ?auto_656858 - SURFACE
      ?auto_656859 - SURFACE
      ?auto_656860 - SURFACE
    )
    :vars
    (
      ?auto_656866 - HOIST
      ?auto_656863 - PLACE
      ?auto_656862 - PLACE
      ?auto_656865 - HOIST
      ?auto_656861 - SURFACE
      ?auto_656864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_656866 ?auto_656863 ) ( SURFACE-AT ?auto_656859 ?auto_656863 ) ( CLEAR ?auto_656859 ) ( IS-CRATE ?auto_656860 ) ( not ( = ?auto_656859 ?auto_656860 ) ) ( AVAILABLE ?auto_656866 ) ( ON ?auto_656859 ?auto_656858 ) ( not ( = ?auto_656858 ?auto_656859 ) ) ( not ( = ?auto_656858 ?auto_656860 ) ) ( not ( = ?auto_656862 ?auto_656863 ) ) ( HOIST-AT ?auto_656865 ?auto_656862 ) ( not ( = ?auto_656866 ?auto_656865 ) ) ( AVAILABLE ?auto_656865 ) ( SURFACE-AT ?auto_656860 ?auto_656862 ) ( ON ?auto_656860 ?auto_656861 ) ( CLEAR ?auto_656860 ) ( not ( = ?auto_656859 ?auto_656861 ) ) ( not ( = ?auto_656860 ?auto_656861 ) ) ( not ( = ?auto_656858 ?auto_656861 ) ) ( TRUCK-AT ?auto_656864 ?auto_656863 ) ( ON ?auto_656852 ?auto_656851 ) ( ON ?auto_656853 ?auto_656852 ) ( ON ?auto_656855 ?auto_656853 ) ( ON ?auto_656854 ?auto_656855 ) ( ON ?auto_656856 ?auto_656854 ) ( ON ?auto_656857 ?auto_656856 ) ( ON ?auto_656858 ?auto_656857 ) ( not ( = ?auto_656851 ?auto_656852 ) ) ( not ( = ?auto_656851 ?auto_656853 ) ) ( not ( = ?auto_656851 ?auto_656855 ) ) ( not ( = ?auto_656851 ?auto_656854 ) ) ( not ( = ?auto_656851 ?auto_656856 ) ) ( not ( = ?auto_656851 ?auto_656857 ) ) ( not ( = ?auto_656851 ?auto_656858 ) ) ( not ( = ?auto_656851 ?auto_656859 ) ) ( not ( = ?auto_656851 ?auto_656860 ) ) ( not ( = ?auto_656851 ?auto_656861 ) ) ( not ( = ?auto_656852 ?auto_656853 ) ) ( not ( = ?auto_656852 ?auto_656855 ) ) ( not ( = ?auto_656852 ?auto_656854 ) ) ( not ( = ?auto_656852 ?auto_656856 ) ) ( not ( = ?auto_656852 ?auto_656857 ) ) ( not ( = ?auto_656852 ?auto_656858 ) ) ( not ( = ?auto_656852 ?auto_656859 ) ) ( not ( = ?auto_656852 ?auto_656860 ) ) ( not ( = ?auto_656852 ?auto_656861 ) ) ( not ( = ?auto_656853 ?auto_656855 ) ) ( not ( = ?auto_656853 ?auto_656854 ) ) ( not ( = ?auto_656853 ?auto_656856 ) ) ( not ( = ?auto_656853 ?auto_656857 ) ) ( not ( = ?auto_656853 ?auto_656858 ) ) ( not ( = ?auto_656853 ?auto_656859 ) ) ( not ( = ?auto_656853 ?auto_656860 ) ) ( not ( = ?auto_656853 ?auto_656861 ) ) ( not ( = ?auto_656855 ?auto_656854 ) ) ( not ( = ?auto_656855 ?auto_656856 ) ) ( not ( = ?auto_656855 ?auto_656857 ) ) ( not ( = ?auto_656855 ?auto_656858 ) ) ( not ( = ?auto_656855 ?auto_656859 ) ) ( not ( = ?auto_656855 ?auto_656860 ) ) ( not ( = ?auto_656855 ?auto_656861 ) ) ( not ( = ?auto_656854 ?auto_656856 ) ) ( not ( = ?auto_656854 ?auto_656857 ) ) ( not ( = ?auto_656854 ?auto_656858 ) ) ( not ( = ?auto_656854 ?auto_656859 ) ) ( not ( = ?auto_656854 ?auto_656860 ) ) ( not ( = ?auto_656854 ?auto_656861 ) ) ( not ( = ?auto_656856 ?auto_656857 ) ) ( not ( = ?auto_656856 ?auto_656858 ) ) ( not ( = ?auto_656856 ?auto_656859 ) ) ( not ( = ?auto_656856 ?auto_656860 ) ) ( not ( = ?auto_656856 ?auto_656861 ) ) ( not ( = ?auto_656857 ?auto_656858 ) ) ( not ( = ?auto_656857 ?auto_656859 ) ) ( not ( = ?auto_656857 ?auto_656860 ) ) ( not ( = ?auto_656857 ?auto_656861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656858 ?auto_656859 ?auto_656860 )
      ( MAKE-9CRATE-VERIFY ?auto_656851 ?auto_656852 ?auto_656853 ?auto_656855 ?auto_656854 ?auto_656856 ?auto_656857 ?auto_656858 ?auto_656859 ?auto_656860 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_656960 - SURFACE
      ?auto_656961 - SURFACE
      ?auto_656962 - SURFACE
      ?auto_656964 - SURFACE
      ?auto_656963 - SURFACE
      ?auto_656965 - SURFACE
      ?auto_656966 - SURFACE
      ?auto_656967 - SURFACE
      ?auto_656968 - SURFACE
      ?auto_656969 - SURFACE
    )
    :vars
    (
      ?auto_656974 - HOIST
      ?auto_656971 - PLACE
      ?auto_656972 - PLACE
      ?auto_656970 - HOIST
      ?auto_656973 - SURFACE
      ?auto_656975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_656974 ?auto_656971 ) ( IS-CRATE ?auto_656969 ) ( not ( = ?auto_656968 ?auto_656969 ) ) ( not ( = ?auto_656967 ?auto_656968 ) ) ( not ( = ?auto_656967 ?auto_656969 ) ) ( not ( = ?auto_656972 ?auto_656971 ) ) ( HOIST-AT ?auto_656970 ?auto_656972 ) ( not ( = ?auto_656974 ?auto_656970 ) ) ( AVAILABLE ?auto_656970 ) ( SURFACE-AT ?auto_656969 ?auto_656972 ) ( ON ?auto_656969 ?auto_656973 ) ( CLEAR ?auto_656969 ) ( not ( = ?auto_656968 ?auto_656973 ) ) ( not ( = ?auto_656969 ?auto_656973 ) ) ( not ( = ?auto_656967 ?auto_656973 ) ) ( TRUCK-AT ?auto_656975 ?auto_656971 ) ( SURFACE-AT ?auto_656967 ?auto_656971 ) ( CLEAR ?auto_656967 ) ( LIFTING ?auto_656974 ?auto_656968 ) ( IS-CRATE ?auto_656968 ) ( ON ?auto_656961 ?auto_656960 ) ( ON ?auto_656962 ?auto_656961 ) ( ON ?auto_656964 ?auto_656962 ) ( ON ?auto_656963 ?auto_656964 ) ( ON ?auto_656965 ?auto_656963 ) ( ON ?auto_656966 ?auto_656965 ) ( ON ?auto_656967 ?auto_656966 ) ( not ( = ?auto_656960 ?auto_656961 ) ) ( not ( = ?auto_656960 ?auto_656962 ) ) ( not ( = ?auto_656960 ?auto_656964 ) ) ( not ( = ?auto_656960 ?auto_656963 ) ) ( not ( = ?auto_656960 ?auto_656965 ) ) ( not ( = ?auto_656960 ?auto_656966 ) ) ( not ( = ?auto_656960 ?auto_656967 ) ) ( not ( = ?auto_656960 ?auto_656968 ) ) ( not ( = ?auto_656960 ?auto_656969 ) ) ( not ( = ?auto_656960 ?auto_656973 ) ) ( not ( = ?auto_656961 ?auto_656962 ) ) ( not ( = ?auto_656961 ?auto_656964 ) ) ( not ( = ?auto_656961 ?auto_656963 ) ) ( not ( = ?auto_656961 ?auto_656965 ) ) ( not ( = ?auto_656961 ?auto_656966 ) ) ( not ( = ?auto_656961 ?auto_656967 ) ) ( not ( = ?auto_656961 ?auto_656968 ) ) ( not ( = ?auto_656961 ?auto_656969 ) ) ( not ( = ?auto_656961 ?auto_656973 ) ) ( not ( = ?auto_656962 ?auto_656964 ) ) ( not ( = ?auto_656962 ?auto_656963 ) ) ( not ( = ?auto_656962 ?auto_656965 ) ) ( not ( = ?auto_656962 ?auto_656966 ) ) ( not ( = ?auto_656962 ?auto_656967 ) ) ( not ( = ?auto_656962 ?auto_656968 ) ) ( not ( = ?auto_656962 ?auto_656969 ) ) ( not ( = ?auto_656962 ?auto_656973 ) ) ( not ( = ?auto_656964 ?auto_656963 ) ) ( not ( = ?auto_656964 ?auto_656965 ) ) ( not ( = ?auto_656964 ?auto_656966 ) ) ( not ( = ?auto_656964 ?auto_656967 ) ) ( not ( = ?auto_656964 ?auto_656968 ) ) ( not ( = ?auto_656964 ?auto_656969 ) ) ( not ( = ?auto_656964 ?auto_656973 ) ) ( not ( = ?auto_656963 ?auto_656965 ) ) ( not ( = ?auto_656963 ?auto_656966 ) ) ( not ( = ?auto_656963 ?auto_656967 ) ) ( not ( = ?auto_656963 ?auto_656968 ) ) ( not ( = ?auto_656963 ?auto_656969 ) ) ( not ( = ?auto_656963 ?auto_656973 ) ) ( not ( = ?auto_656965 ?auto_656966 ) ) ( not ( = ?auto_656965 ?auto_656967 ) ) ( not ( = ?auto_656965 ?auto_656968 ) ) ( not ( = ?auto_656965 ?auto_656969 ) ) ( not ( = ?auto_656965 ?auto_656973 ) ) ( not ( = ?auto_656966 ?auto_656967 ) ) ( not ( = ?auto_656966 ?auto_656968 ) ) ( not ( = ?auto_656966 ?auto_656969 ) ) ( not ( = ?auto_656966 ?auto_656973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_656967 ?auto_656968 ?auto_656969 )
      ( MAKE-9CRATE-VERIFY ?auto_656960 ?auto_656961 ?auto_656962 ?auto_656964 ?auto_656963 ?auto_656965 ?auto_656966 ?auto_656967 ?auto_656968 ?auto_656969 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_657069 - SURFACE
      ?auto_657070 - SURFACE
      ?auto_657071 - SURFACE
      ?auto_657073 - SURFACE
      ?auto_657072 - SURFACE
      ?auto_657074 - SURFACE
      ?auto_657075 - SURFACE
      ?auto_657076 - SURFACE
      ?auto_657077 - SURFACE
      ?auto_657078 - SURFACE
    )
    :vars
    (
      ?auto_657083 - HOIST
      ?auto_657081 - PLACE
      ?auto_657079 - PLACE
      ?auto_657084 - HOIST
      ?auto_657080 - SURFACE
      ?auto_657082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657083 ?auto_657081 ) ( IS-CRATE ?auto_657078 ) ( not ( = ?auto_657077 ?auto_657078 ) ) ( not ( = ?auto_657076 ?auto_657077 ) ) ( not ( = ?auto_657076 ?auto_657078 ) ) ( not ( = ?auto_657079 ?auto_657081 ) ) ( HOIST-AT ?auto_657084 ?auto_657079 ) ( not ( = ?auto_657083 ?auto_657084 ) ) ( AVAILABLE ?auto_657084 ) ( SURFACE-AT ?auto_657078 ?auto_657079 ) ( ON ?auto_657078 ?auto_657080 ) ( CLEAR ?auto_657078 ) ( not ( = ?auto_657077 ?auto_657080 ) ) ( not ( = ?auto_657078 ?auto_657080 ) ) ( not ( = ?auto_657076 ?auto_657080 ) ) ( TRUCK-AT ?auto_657082 ?auto_657081 ) ( SURFACE-AT ?auto_657076 ?auto_657081 ) ( CLEAR ?auto_657076 ) ( IS-CRATE ?auto_657077 ) ( AVAILABLE ?auto_657083 ) ( IN ?auto_657077 ?auto_657082 ) ( ON ?auto_657070 ?auto_657069 ) ( ON ?auto_657071 ?auto_657070 ) ( ON ?auto_657073 ?auto_657071 ) ( ON ?auto_657072 ?auto_657073 ) ( ON ?auto_657074 ?auto_657072 ) ( ON ?auto_657075 ?auto_657074 ) ( ON ?auto_657076 ?auto_657075 ) ( not ( = ?auto_657069 ?auto_657070 ) ) ( not ( = ?auto_657069 ?auto_657071 ) ) ( not ( = ?auto_657069 ?auto_657073 ) ) ( not ( = ?auto_657069 ?auto_657072 ) ) ( not ( = ?auto_657069 ?auto_657074 ) ) ( not ( = ?auto_657069 ?auto_657075 ) ) ( not ( = ?auto_657069 ?auto_657076 ) ) ( not ( = ?auto_657069 ?auto_657077 ) ) ( not ( = ?auto_657069 ?auto_657078 ) ) ( not ( = ?auto_657069 ?auto_657080 ) ) ( not ( = ?auto_657070 ?auto_657071 ) ) ( not ( = ?auto_657070 ?auto_657073 ) ) ( not ( = ?auto_657070 ?auto_657072 ) ) ( not ( = ?auto_657070 ?auto_657074 ) ) ( not ( = ?auto_657070 ?auto_657075 ) ) ( not ( = ?auto_657070 ?auto_657076 ) ) ( not ( = ?auto_657070 ?auto_657077 ) ) ( not ( = ?auto_657070 ?auto_657078 ) ) ( not ( = ?auto_657070 ?auto_657080 ) ) ( not ( = ?auto_657071 ?auto_657073 ) ) ( not ( = ?auto_657071 ?auto_657072 ) ) ( not ( = ?auto_657071 ?auto_657074 ) ) ( not ( = ?auto_657071 ?auto_657075 ) ) ( not ( = ?auto_657071 ?auto_657076 ) ) ( not ( = ?auto_657071 ?auto_657077 ) ) ( not ( = ?auto_657071 ?auto_657078 ) ) ( not ( = ?auto_657071 ?auto_657080 ) ) ( not ( = ?auto_657073 ?auto_657072 ) ) ( not ( = ?auto_657073 ?auto_657074 ) ) ( not ( = ?auto_657073 ?auto_657075 ) ) ( not ( = ?auto_657073 ?auto_657076 ) ) ( not ( = ?auto_657073 ?auto_657077 ) ) ( not ( = ?auto_657073 ?auto_657078 ) ) ( not ( = ?auto_657073 ?auto_657080 ) ) ( not ( = ?auto_657072 ?auto_657074 ) ) ( not ( = ?auto_657072 ?auto_657075 ) ) ( not ( = ?auto_657072 ?auto_657076 ) ) ( not ( = ?auto_657072 ?auto_657077 ) ) ( not ( = ?auto_657072 ?auto_657078 ) ) ( not ( = ?auto_657072 ?auto_657080 ) ) ( not ( = ?auto_657074 ?auto_657075 ) ) ( not ( = ?auto_657074 ?auto_657076 ) ) ( not ( = ?auto_657074 ?auto_657077 ) ) ( not ( = ?auto_657074 ?auto_657078 ) ) ( not ( = ?auto_657074 ?auto_657080 ) ) ( not ( = ?auto_657075 ?auto_657076 ) ) ( not ( = ?auto_657075 ?auto_657077 ) ) ( not ( = ?auto_657075 ?auto_657078 ) ) ( not ( = ?auto_657075 ?auto_657080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_657076 ?auto_657077 ?auto_657078 )
      ( MAKE-9CRATE-VERIFY ?auto_657069 ?auto_657070 ?auto_657071 ?auto_657073 ?auto_657072 ?auto_657074 ?auto_657075 ?auto_657076 ?auto_657077 ?auto_657078 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_662614 - SURFACE
      ?auto_662615 - SURFACE
      ?auto_662616 - SURFACE
      ?auto_662618 - SURFACE
      ?auto_662617 - SURFACE
      ?auto_662619 - SURFACE
      ?auto_662620 - SURFACE
      ?auto_662621 - SURFACE
      ?auto_662622 - SURFACE
      ?auto_662623 - SURFACE
      ?auto_662624 - SURFACE
    )
    :vars
    (
      ?auto_662625 - HOIST
      ?auto_662626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_662625 ?auto_662626 ) ( SURFACE-AT ?auto_662623 ?auto_662626 ) ( CLEAR ?auto_662623 ) ( LIFTING ?auto_662625 ?auto_662624 ) ( IS-CRATE ?auto_662624 ) ( not ( = ?auto_662623 ?auto_662624 ) ) ( ON ?auto_662615 ?auto_662614 ) ( ON ?auto_662616 ?auto_662615 ) ( ON ?auto_662618 ?auto_662616 ) ( ON ?auto_662617 ?auto_662618 ) ( ON ?auto_662619 ?auto_662617 ) ( ON ?auto_662620 ?auto_662619 ) ( ON ?auto_662621 ?auto_662620 ) ( ON ?auto_662622 ?auto_662621 ) ( ON ?auto_662623 ?auto_662622 ) ( not ( = ?auto_662614 ?auto_662615 ) ) ( not ( = ?auto_662614 ?auto_662616 ) ) ( not ( = ?auto_662614 ?auto_662618 ) ) ( not ( = ?auto_662614 ?auto_662617 ) ) ( not ( = ?auto_662614 ?auto_662619 ) ) ( not ( = ?auto_662614 ?auto_662620 ) ) ( not ( = ?auto_662614 ?auto_662621 ) ) ( not ( = ?auto_662614 ?auto_662622 ) ) ( not ( = ?auto_662614 ?auto_662623 ) ) ( not ( = ?auto_662614 ?auto_662624 ) ) ( not ( = ?auto_662615 ?auto_662616 ) ) ( not ( = ?auto_662615 ?auto_662618 ) ) ( not ( = ?auto_662615 ?auto_662617 ) ) ( not ( = ?auto_662615 ?auto_662619 ) ) ( not ( = ?auto_662615 ?auto_662620 ) ) ( not ( = ?auto_662615 ?auto_662621 ) ) ( not ( = ?auto_662615 ?auto_662622 ) ) ( not ( = ?auto_662615 ?auto_662623 ) ) ( not ( = ?auto_662615 ?auto_662624 ) ) ( not ( = ?auto_662616 ?auto_662618 ) ) ( not ( = ?auto_662616 ?auto_662617 ) ) ( not ( = ?auto_662616 ?auto_662619 ) ) ( not ( = ?auto_662616 ?auto_662620 ) ) ( not ( = ?auto_662616 ?auto_662621 ) ) ( not ( = ?auto_662616 ?auto_662622 ) ) ( not ( = ?auto_662616 ?auto_662623 ) ) ( not ( = ?auto_662616 ?auto_662624 ) ) ( not ( = ?auto_662618 ?auto_662617 ) ) ( not ( = ?auto_662618 ?auto_662619 ) ) ( not ( = ?auto_662618 ?auto_662620 ) ) ( not ( = ?auto_662618 ?auto_662621 ) ) ( not ( = ?auto_662618 ?auto_662622 ) ) ( not ( = ?auto_662618 ?auto_662623 ) ) ( not ( = ?auto_662618 ?auto_662624 ) ) ( not ( = ?auto_662617 ?auto_662619 ) ) ( not ( = ?auto_662617 ?auto_662620 ) ) ( not ( = ?auto_662617 ?auto_662621 ) ) ( not ( = ?auto_662617 ?auto_662622 ) ) ( not ( = ?auto_662617 ?auto_662623 ) ) ( not ( = ?auto_662617 ?auto_662624 ) ) ( not ( = ?auto_662619 ?auto_662620 ) ) ( not ( = ?auto_662619 ?auto_662621 ) ) ( not ( = ?auto_662619 ?auto_662622 ) ) ( not ( = ?auto_662619 ?auto_662623 ) ) ( not ( = ?auto_662619 ?auto_662624 ) ) ( not ( = ?auto_662620 ?auto_662621 ) ) ( not ( = ?auto_662620 ?auto_662622 ) ) ( not ( = ?auto_662620 ?auto_662623 ) ) ( not ( = ?auto_662620 ?auto_662624 ) ) ( not ( = ?auto_662621 ?auto_662622 ) ) ( not ( = ?auto_662621 ?auto_662623 ) ) ( not ( = ?auto_662621 ?auto_662624 ) ) ( not ( = ?auto_662622 ?auto_662623 ) ) ( not ( = ?auto_662622 ?auto_662624 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_662623 ?auto_662624 )
      ( MAKE-10CRATE-VERIFY ?auto_662614 ?auto_662615 ?auto_662616 ?auto_662618 ?auto_662617 ?auto_662619 ?auto_662620 ?auto_662621 ?auto_662622 ?auto_662623 ?auto_662624 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_662708 - SURFACE
      ?auto_662709 - SURFACE
      ?auto_662710 - SURFACE
      ?auto_662712 - SURFACE
      ?auto_662711 - SURFACE
      ?auto_662713 - SURFACE
      ?auto_662714 - SURFACE
      ?auto_662715 - SURFACE
      ?auto_662716 - SURFACE
      ?auto_662717 - SURFACE
      ?auto_662718 - SURFACE
    )
    :vars
    (
      ?auto_662720 - HOIST
      ?auto_662719 - PLACE
      ?auto_662721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_662720 ?auto_662719 ) ( SURFACE-AT ?auto_662717 ?auto_662719 ) ( CLEAR ?auto_662717 ) ( IS-CRATE ?auto_662718 ) ( not ( = ?auto_662717 ?auto_662718 ) ) ( TRUCK-AT ?auto_662721 ?auto_662719 ) ( AVAILABLE ?auto_662720 ) ( IN ?auto_662718 ?auto_662721 ) ( ON ?auto_662717 ?auto_662716 ) ( not ( = ?auto_662716 ?auto_662717 ) ) ( not ( = ?auto_662716 ?auto_662718 ) ) ( ON ?auto_662709 ?auto_662708 ) ( ON ?auto_662710 ?auto_662709 ) ( ON ?auto_662712 ?auto_662710 ) ( ON ?auto_662711 ?auto_662712 ) ( ON ?auto_662713 ?auto_662711 ) ( ON ?auto_662714 ?auto_662713 ) ( ON ?auto_662715 ?auto_662714 ) ( ON ?auto_662716 ?auto_662715 ) ( not ( = ?auto_662708 ?auto_662709 ) ) ( not ( = ?auto_662708 ?auto_662710 ) ) ( not ( = ?auto_662708 ?auto_662712 ) ) ( not ( = ?auto_662708 ?auto_662711 ) ) ( not ( = ?auto_662708 ?auto_662713 ) ) ( not ( = ?auto_662708 ?auto_662714 ) ) ( not ( = ?auto_662708 ?auto_662715 ) ) ( not ( = ?auto_662708 ?auto_662716 ) ) ( not ( = ?auto_662708 ?auto_662717 ) ) ( not ( = ?auto_662708 ?auto_662718 ) ) ( not ( = ?auto_662709 ?auto_662710 ) ) ( not ( = ?auto_662709 ?auto_662712 ) ) ( not ( = ?auto_662709 ?auto_662711 ) ) ( not ( = ?auto_662709 ?auto_662713 ) ) ( not ( = ?auto_662709 ?auto_662714 ) ) ( not ( = ?auto_662709 ?auto_662715 ) ) ( not ( = ?auto_662709 ?auto_662716 ) ) ( not ( = ?auto_662709 ?auto_662717 ) ) ( not ( = ?auto_662709 ?auto_662718 ) ) ( not ( = ?auto_662710 ?auto_662712 ) ) ( not ( = ?auto_662710 ?auto_662711 ) ) ( not ( = ?auto_662710 ?auto_662713 ) ) ( not ( = ?auto_662710 ?auto_662714 ) ) ( not ( = ?auto_662710 ?auto_662715 ) ) ( not ( = ?auto_662710 ?auto_662716 ) ) ( not ( = ?auto_662710 ?auto_662717 ) ) ( not ( = ?auto_662710 ?auto_662718 ) ) ( not ( = ?auto_662712 ?auto_662711 ) ) ( not ( = ?auto_662712 ?auto_662713 ) ) ( not ( = ?auto_662712 ?auto_662714 ) ) ( not ( = ?auto_662712 ?auto_662715 ) ) ( not ( = ?auto_662712 ?auto_662716 ) ) ( not ( = ?auto_662712 ?auto_662717 ) ) ( not ( = ?auto_662712 ?auto_662718 ) ) ( not ( = ?auto_662711 ?auto_662713 ) ) ( not ( = ?auto_662711 ?auto_662714 ) ) ( not ( = ?auto_662711 ?auto_662715 ) ) ( not ( = ?auto_662711 ?auto_662716 ) ) ( not ( = ?auto_662711 ?auto_662717 ) ) ( not ( = ?auto_662711 ?auto_662718 ) ) ( not ( = ?auto_662713 ?auto_662714 ) ) ( not ( = ?auto_662713 ?auto_662715 ) ) ( not ( = ?auto_662713 ?auto_662716 ) ) ( not ( = ?auto_662713 ?auto_662717 ) ) ( not ( = ?auto_662713 ?auto_662718 ) ) ( not ( = ?auto_662714 ?auto_662715 ) ) ( not ( = ?auto_662714 ?auto_662716 ) ) ( not ( = ?auto_662714 ?auto_662717 ) ) ( not ( = ?auto_662714 ?auto_662718 ) ) ( not ( = ?auto_662715 ?auto_662716 ) ) ( not ( = ?auto_662715 ?auto_662717 ) ) ( not ( = ?auto_662715 ?auto_662718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_662716 ?auto_662717 ?auto_662718 )
      ( MAKE-10CRATE-VERIFY ?auto_662708 ?auto_662709 ?auto_662710 ?auto_662712 ?auto_662711 ?auto_662713 ?auto_662714 ?auto_662715 ?auto_662716 ?auto_662717 ?auto_662718 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_662813 - SURFACE
      ?auto_662814 - SURFACE
      ?auto_662815 - SURFACE
      ?auto_662817 - SURFACE
      ?auto_662816 - SURFACE
      ?auto_662818 - SURFACE
      ?auto_662819 - SURFACE
      ?auto_662820 - SURFACE
      ?auto_662821 - SURFACE
      ?auto_662822 - SURFACE
      ?auto_662823 - SURFACE
    )
    :vars
    (
      ?auto_662825 - HOIST
      ?auto_662827 - PLACE
      ?auto_662826 - TRUCK
      ?auto_662824 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_662825 ?auto_662827 ) ( SURFACE-AT ?auto_662822 ?auto_662827 ) ( CLEAR ?auto_662822 ) ( IS-CRATE ?auto_662823 ) ( not ( = ?auto_662822 ?auto_662823 ) ) ( AVAILABLE ?auto_662825 ) ( IN ?auto_662823 ?auto_662826 ) ( ON ?auto_662822 ?auto_662821 ) ( not ( = ?auto_662821 ?auto_662822 ) ) ( not ( = ?auto_662821 ?auto_662823 ) ) ( TRUCK-AT ?auto_662826 ?auto_662824 ) ( not ( = ?auto_662824 ?auto_662827 ) ) ( ON ?auto_662814 ?auto_662813 ) ( ON ?auto_662815 ?auto_662814 ) ( ON ?auto_662817 ?auto_662815 ) ( ON ?auto_662816 ?auto_662817 ) ( ON ?auto_662818 ?auto_662816 ) ( ON ?auto_662819 ?auto_662818 ) ( ON ?auto_662820 ?auto_662819 ) ( ON ?auto_662821 ?auto_662820 ) ( not ( = ?auto_662813 ?auto_662814 ) ) ( not ( = ?auto_662813 ?auto_662815 ) ) ( not ( = ?auto_662813 ?auto_662817 ) ) ( not ( = ?auto_662813 ?auto_662816 ) ) ( not ( = ?auto_662813 ?auto_662818 ) ) ( not ( = ?auto_662813 ?auto_662819 ) ) ( not ( = ?auto_662813 ?auto_662820 ) ) ( not ( = ?auto_662813 ?auto_662821 ) ) ( not ( = ?auto_662813 ?auto_662822 ) ) ( not ( = ?auto_662813 ?auto_662823 ) ) ( not ( = ?auto_662814 ?auto_662815 ) ) ( not ( = ?auto_662814 ?auto_662817 ) ) ( not ( = ?auto_662814 ?auto_662816 ) ) ( not ( = ?auto_662814 ?auto_662818 ) ) ( not ( = ?auto_662814 ?auto_662819 ) ) ( not ( = ?auto_662814 ?auto_662820 ) ) ( not ( = ?auto_662814 ?auto_662821 ) ) ( not ( = ?auto_662814 ?auto_662822 ) ) ( not ( = ?auto_662814 ?auto_662823 ) ) ( not ( = ?auto_662815 ?auto_662817 ) ) ( not ( = ?auto_662815 ?auto_662816 ) ) ( not ( = ?auto_662815 ?auto_662818 ) ) ( not ( = ?auto_662815 ?auto_662819 ) ) ( not ( = ?auto_662815 ?auto_662820 ) ) ( not ( = ?auto_662815 ?auto_662821 ) ) ( not ( = ?auto_662815 ?auto_662822 ) ) ( not ( = ?auto_662815 ?auto_662823 ) ) ( not ( = ?auto_662817 ?auto_662816 ) ) ( not ( = ?auto_662817 ?auto_662818 ) ) ( not ( = ?auto_662817 ?auto_662819 ) ) ( not ( = ?auto_662817 ?auto_662820 ) ) ( not ( = ?auto_662817 ?auto_662821 ) ) ( not ( = ?auto_662817 ?auto_662822 ) ) ( not ( = ?auto_662817 ?auto_662823 ) ) ( not ( = ?auto_662816 ?auto_662818 ) ) ( not ( = ?auto_662816 ?auto_662819 ) ) ( not ( = ?auto_662816 ?auto_662820 ) ) ( not ( = ?auto_662816 ?auto_662821 ) ) ( not ( = ?auto_662816 ?auto_662822 ) ) ( not ( = ?auto_662816 ?auto_662823 ) ) ( not ( = ?auto_662818 ?auto_662819 ) ) ( not ( = ?auto_662818 ?auto_662820 ) ) ( not ( = ?auto_662818 ?auto_662821 ) ) ( not ( = ?auto_662818 ?auto_662822 ) ) ( not ( = ?auto_662818 ?auto_662823 ) ) ( not ( = ?auto_662819 ?auto_662820 ) ) ( not ( = ?auto_662819 ?auto_662821 ) ) ( not ( = ?auto_662819 ?auto_662822 ) ) ( not ( = ?auto_662819 ?auto_662823 ) ) ( not ( = ?auto_662820 ?auto_662821 ) ) ( not ( = ?auto_662820 ?auto_662822 ) ) ( not ( = ?auto_662820 ?auto_662823 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_662821 ?auto_662822 ?auto_662823 )
      ( MAKE-10CRATE-VERIFY ?auto_662813 ?auto_662814 ?auto_662815 ?auto_662817 ?auto_662816 ?auto_662818 ?auto_662819 ?auto_662820 ?auto_662821 ?auto_662822 ?auto_662823 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_662928 - SURFACE
      ?auto_662929 - SURFACE
      ?auto_662930 - SURFACE
      ?auto_662932 - SURFACE
      ?auto_662931 - SURFACE
      ?auto_662933 - SURFACE
      ?auto_662934 - SURFACE
      ?auto_662935 - SURFACE
      ?auto_662936 - SURFACE
      ?auto_662937 - SURFACE
      ?auto_662938 - SURFACE
    )
    :vars
    (
      ?auto_662943 - HOIST
      ?auto_662941 - PLACE
      ?auto_662940 - TRUCK
      ?auto_662939 - PLACE
      ?auto_662942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_662943 ?auto_662941 ) ( SURFACE-AT ?auto_662937 ?auto_662941 ) ( CLEAR ?auto_662937 ) ( IS-CRATE ?auto_662938 ) ( not ( = ?auto_662937 ?auto_662938 ) ) ( AVAILABLE ?auto_662943 ) ( ON ?auto_662937 ?auto_662936 ) ( not ( = ?auto_662936 ?auto_662937 ) ) ( not ( = ?auto_662936 ?auto_662938 ) ) ( TRUCK-AT ?auto_662940 ?auto_662939 ) ( not ( = ?auto_662939 ?auto_662941 ) ) ( HOIST-AT ?auto_662942 ?auto_662939 ) ( LIFTING ?auto_662942 ?auto_662938 ) ( not ( = ?auto_662943 ?auto_662942 ) ) ( ON ?auto_662929 ?auto_662928 ) ( ON ?auto_662930 ?auto_662929 ) ( ON ?auto_662932 ?auto_662930 ) ( ON ?auto_662931 ?auto_662932 ) ( ON ?auto_662933 ?auto_662931 ) ( ON ?auto_662934 ?auto_662933 ) ( ON ?auto_662935 ?auto_662934 ) ( ON ?auto_662936 ?auto_662935 ) ( not ( = ?auto_662928 ?auto_662929 ) ) ( not ( = ?auto_662928 ?auto_662930 ) ) ( not ( = ?auto_662928 ?auto_662932 ) ) ( not ( = ?auto_662928 ?auto_662931 ) ) ( not ( = ?auto_662928 ?auto_662933 ) ) ( not ( = ?auto_662928 ?auto_662934 ) ) ( not ( = ?auto_662928 ?auto_662935 ) ) ( not ( = ?auto_662928 ?auto_662936 ) ) ( not ( = ?auto_662928 ?auto_662937 ) ) ( not ( = ?auto_662928 ?auto_662938 ) ) ( not ( = ?auto_662929 ?auto_662930 ) ) ( not ( = ?auto_662929 ?auto_662932 ) ) ( not ( = ?auto_662929 ?auto_662931 ) ) ( not ( = ?auto_662929 ?auto_662933 ) ) ( not ( = ?auto_662929 ?auto_662934 ) ) ( not ( = ?auto_662929 ?auto_662935 ) ) ( not ( = ?auto_662929 ?auto_662936 ) ) ( not ( = ?auto_662929 ?auto_662937 ) ) ( not ( = ?auto_662929 ?auto_662938 ) ) ( not ( = ?auto_662930 ?auto_662932 ) ) ( not ( = ?auto_662930 ?auto_662931 ) ) ( not ( = ?auto_662930 ?auto_662933 ) ) ( not ( = ?auto_662930 ?auto_662934 ) ) ( not ( = ?auto_662930 ?auto_662935 ) ) ( not ( = ?auto_662930 ?auto_662936 ) ) ( not ( = ?auto_662930 ?auto_662937 ) ) ( not ( = ?auto_662930 ?auto_662938 ) ) ( not ( = ?auto_662932 ?auto_662931 ) ) ( not ( = ?auto_662932 ?auto_662933 ) ) ( not ( = ?auto_662932 ?auto_662934 ) ) ( not ( = ?auto_662932 ?auto_662935 ) ) ( not ( = ?auto_662932 ?auto_662936 ) ) ( not ( = ?auto_662932 ?auto_662937 ) ) ( not ( = ?auto_662932 ?auto_662938 ) ) ( not ( = ?auto_662931 ?auto_662933 ) ) ( not ( = ?auto_662931 ?auto_662934 ) ) ( not ( = ?auto_662931 ?auto_662935 ) ) ( not ( = ?auto_662931 ?auto_662936 ) ) ( not ( = ?auto_662931 ?auto_662937 ) ) ( not ( = ?auto_662931 ?auto_662938 ) ) ( not ( = ?auto_662933 ?auto_662934 ) ) ( not ( = ?auto_662933 ?auto_662935 ) ) ( not ( = ?auto_662933 ?auto_662936 ) ) ( not ( = ?auto_662933 ?auto_662937 ) ) ( not ( = ?auto_662933 ?auto_662938 ) ) ( not ( = ?auto_662934 ?auto_662935 ) ) ( not ( = ?auto_662934 ?auto_662936 ) ) ( not ( = ?auto_662934 ?auto_662937 ) ) ( not ( = ?auto_662934 ?auto_662938 ) ) ( not ( = ?auto_662935 ?auto_662936 ) ) ( not ( = ?auto_662935 ?auto_662937 ) ) ( not ( = ?auto_662935 ?auto_662938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_662936 ?auto_662937 ?auto_662938 )
      ( MAKE-10CRATE-VERIFY ?auto_662928 ?auto_662929 ?auto_662930 ?auto_662932 ?auto_662931 ?auto_662933 ?auto_662934 ?auto_662935 ?auto_662936 ?auto_662937 ?auto_662938 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663053 - SURFACE
      ?auto_663054 - SURFACE
      ?auto_663055 - SURFACE
      ?auto_663057 - SURFACE
      ?auto_663056 - SURFACE
      ?auto_663058 - SURFACE
      ?auto_663059 - SURFACE
      ?auto_663060 - SURFACE
      ?auto_663061 - SURFACE
      ?auto_663062 - SURFACE
      ?auto_663063 - SURFACE
    )
    :vars
    (
      ?auto_663064 - HOIST
      ?auto_663065 - PLACE
      ?auto_663066 - TRUCK
      ?auto_663067 - PLACE
      ?auto_663068 - HOIST
      ?auto_663069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663064 ?auto_663065 ) ( SURFACE-AT ?auto_663062 ?auto_663065 ) ( CLEAR ?auto_663062 ) ( IS-CRATE ?auto_663063 ) ( not ( = ?auto_663062 ?auto_663063 ) ) ( AVAILABLE ?auto_663064 ) ( ON ?auto_663062 ?auto_663061 ) ( not ( = ?auto_663061 ?auto_663062 ) ) ( not ( = ?auto_663061 ?auto_663063 ) ) ( TRUCK-AT ?auto_663066 ?auto_663067 ) ( not ( = ?auto_663067 ?auto_663065 ) ) ( HOIST-AT ?auto_663068 ?auto_663067 ) ( not ( = ?auto_663064 ?auto_663068 ) ) ( AVAILABLE ?auto_663068 ) ( SURFACE-AT ?auto_663063 ?auto_663067 ) ( ON ?auto_663063 ?auto_663069 ) ( CLEAR ?auto_663063 ) ( not ( = ?auto_663062 ?auto_663069 ) ) ( not ( = ?auto_663063 ?auto_663069 ) ) ( not ( = ?auto_663061 ?auto_663069 ) ) ( ON ?auto_663054 ?auto_663053 ) ( ON ?auto_663055 ?auto_663054 ) ( ON ?auto_663057 ?auto_663055 ) ( ON ?auto_663056 ?auto_663057 ) ( ON ?auto_663058 ?auto_663056 ) ( ON ?auto_663059 ?auto_663058 ) ( ON ?auto_663060 ?auto_663059 ) ( ON ?auto_663061 ?auto_663060 ) ( not ( = ?auto_663053 ?auto_663054 ) ) ( not ( = ?auto_663053 ?auto_663055 ) ) ( not ( = ?auto_663053 ?auto_663057 ) ) ( not ( = ?auto_663053 ?auto_663056 ) ) ( not ( = ?auto_663053 ?auto_663058 ) ) ( not ( = ?auto_663053 ?auto_663059 ) ) ( not ( = ?auto_663053 ?auto_663060 ) ) ( not ( = ?auto_663053 ?auto_663061 ) ) ( not ( = ?auto_663053 ?auto_663062 ) ) ( not ( = ?auto_663053 ?auto_663063 ) ) ( not ( = ?auto_663053 ?auto_663069 ) ) ( not ( = ?auto_663054 ?auto_663055 ) ) ( not ( = ?auto_663054 ?auto_663057 ) ) ( not ( = ?auto_663054 ?auto_663056 ) ) ( not ( = ?auto_663054 ?auto_663058 ) ) ( not ( = ?auto_663054 ?auto_663059 ) ) ( not ( = ?auto_663054 ?auto_663060 ) ) ( not ( = ?auto_663054 ?auto_663061 ) ) ( not ( = ?auto_663054 ?auto_663062 ) ) ( not ( = ?auto_663054 ?auto_663063 ) ) ( not ( = ?auto_663054 ?auto_663069 ) ) ( not ( = ?auto_663055 ?auto_663057 ) ) ( not ( = ?auto_663055 ?auto_663056 ) ) ( not ( = ?auto_663055 ?auto_663058 ) ) ( not ( = ?auto_663055 ?auto_663059 ) ) ( not ( = ?auto_663055 ?auto_663060 ) ) ( not ( = ?auto_663055 ?auto_663061 ) ) ( not ( = ?auto_663055 ?auto_663062 ) ) ( not ( = ?auto_663055 ?auto_663063 ) ) ( not ( = ?auto_663055 ?auto_663069 ) ) ( not ( = ?auto_663057 ?auto_663056 ) ) ( not ( = ?auto_663057 ?auto_663058 ) ) ( not ( = ?auto_663057 ?auto_663059 ) ) ( not ( = ?auto_663057 ?auto_663060 ) ) ( not ( = ?auto_663057 ?auto_663061 ) ) ( not ( = ?auto_663057 ?auto_663062 ) ) ( not ( = ?auto_663057 ?auto_663063 ) ) ( not ( = ?auto_663057 ?auto_663069 ) ) ( not ( = ?auto_663056 ?auto_663058 ) ) ( not ( = ?auto_663056 ?auto_663059 ) ) ( not ( = ?auto_663056 ?auto_663060 ) ) ( not ( = ?auto_663056 ?auto_663061 ) ) ( not ( = ?auto_663056 ?auto_663062 ) ) ( not ( = ?auto_663056 ?auto_663063 ) ) ( not ( = ?auto_663056 ?auto_663069 ) ) ( not ( = ?auto_663058 ?auto_663059 ) ) ( not ( = ?auto_663058 ?auto_663060 ) ) ( not ( = ?auto_663058 ?auto_663061 ) ) ( not ( = ?auto_663058 ?auto_663062 ) ) ( not ( = ?auto_663058 ?auto_663063 ) ) ( not ( = ?auto_663058 ?auto_663069 ) ) ( not ( = ?auto_663059 ?auto_663060 ) ) ( not ( = ?auto_663059 ?auto_663061 ) ) ( not ( = ?auto_663059 ?auto_663062 ) ) ( not ( = ?auto_663059 ?auto_663063 ) ) ( not ( = ?auto_663059 ?auto_663069 ) ) ( not ( = ?auto_663060 ?auto_663061 ) ) ( not ( = ?auto_663060 ?auto_663062 ) ) ( not ( = ?auto_663060 ?auto_663063 ) ) ( not ( = ?auto_663060 ?auto_663069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663061 ?auto_663062 ?auto_663063 )
      ( MAKE-10CRATE-VERIFY ?auto_663053 ?auto_663054 ?auto_663055 ?auto_663057 ?auto_663056 ?auto_663058 ?auto_663059 ?auto_663060 ?auto_663061 ?auto_663062 ?auto_663063 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663179 - SURFACE
      ?auto_663180 - SURFACE
      ?auto_663181 - SURFACE
      ?auto_663183 - SURFACE
      ?auto_663182 - SURFACE
      ?auto_663184 - SURFACE
      ?auto_663185 - SURFACE
      ?auto_663186 - SURFACE
      ?auto_663187 - SURFACE
      ?auto_663188 - SURFACE
      ?auto_663189 - SURFACE
    )
    :vars
    (
      ?auto_663193 - HOIST
      ?auto_663195 - PLACE
      ?auto_663194 - PLACE
      ?auto_663191 - HOIST
      ?auto_663190 - SURFACE
      ?auto_663192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663193 ?auto_663195 ) ( SURFACE-AT ?auto_663188 ?auto_663195 ) ( CLEAR ?auto_663188 ) ( IS-CRATE ?auto_663189 ) ( not ( = ?auto_663188 ?auto_663189 ) ) ( AVAILABLE ?auto_663193 ) ( ON ?auto_663188 ?auto_663187 ) ( not ( = ?auto_663187 ?auto_663188 ) ) ( not ( = ?auto_663187 ?auto_663189 ) ) ( not ( = ?auto_663194 ?auto_663195 ) ) ( HOIST-AT ?auto_663191 ?auto_663194 ) ( not ( = ?auto_663193 ?auto_663191 ) ) ( AVAILABLE ?auto_663191 ) ( SURFACE-AT ?auto_663189 ?auto_663194 ) ( ON ?auto_663189 ?auto_663190 ) ( CLEAR ?auto_663189 ) ( not ( = ?auto_663188 ?auto_663190 ) ) ( not ( = ?auto_663189 ?auto_663190 ) ) ( not ( = ?auto_663187 ?auto_663190 ) ) ( TRUCK-AT ?auto_663192 ?auto_663195 ) ( ON ?auto_663180 ?auto_663179 ) ( ON ?auto_663181 ?auto_663180 ) ( ON ?auto_663183 ?auto_663181 ) ( ON ?auto_663182 ?auto_663183 ) ( ON ?auto_663184 ?auto_663182 ) ( ON ?auto_663185 ?auto_663184 ) ( ON ?auto_663186 ?auto_663185 ) ( ON ?auto_663187 ?auto_663186 ) ( not ( = ?auto_663179 ?auto_663180 ) ) ( not ( = ?auto_663179 ?auto_663181 ) ) ( not ( = ?auto_663179 ?auto_663183 ) ) ( not ( = ?auto_663179 ?auto_663182 ) ) ( not ( = ?auto_663179 ?auto_663184 ) ) ( not ( = ?auto_663179 ?auto_663185 ) ) ( not ( = ?auto_663179 ?auto_663186 ) ) ( not ( = ?auto_663179 ?auto_663187 ) ) ( not ( = ?auto_663179 ?auto_663188 ) ) ( not ( = ?auto_663179 ?auto_663189 ) ) ( not ( = ?auto_663179 ?auto_663190 ) ) ( not ( = ?auto_663180 ?auto_663181 ) ) ( not ( = ?auto_663180 ?auto_663183 ) ) ( not ( = ?auto_663180 ?auto_663182 ) ) ( not ( = ?auto_663180 ?auto_663184 ) ) ( not ( = ?auto_663180 ?auto_663185 ) ) ( not ( = ?auto_663180 ?auto_663186 ) ) ( not ( = ?auto_663180 ?auto_663187 ) ) ( not ( = ?auto_663180 ?auto_663188 ) ) ( not ( = ?auto_663180 ?auto_663189 ) ) ( not ( = ?auto_663180 ?auto_663190 ) ) ( not ( = ?auto_663181 ?auto_663183 ) ) ( not ( = ?auto_663181 ?auto_663182 ) ) ( not ( = ?auto_663181 ?auto_663184 ) ) ( not ( = ?auto_663181 ?auto_663185 ) ) ( not ( = ?auto_663181 ?auto_663186 ) ) ( not ( = ?auto_663181 ?auto_663187 ) ) ( not ( = ?auto_663181 ?auto_663188 ) ) ( not ( = ?auto_663181 ?auto_663189 ) ) ( not ( = ?auto_663181 ?auto_663190 ) ) ( not ( = ?auto_663183 ?auto_663182 ) ) ( not ( = ?auto_663183 ?auto_663184 ) ) ( not ( = ?auto_663183 ?auto_663185 ) ) ( not ( = ?auto_663183 ?auto_663186 ) ) ( not ( = ?auto_663183 ?auto_663187 ) ) ( not ( = ?auto_663183 ?auto_663188 ) ) ( not ( = ?auto_663183 ?auto_663189 ) ) ( not ( = ?auto_663183 ?auto_663190 ) ) ( not ( = ?auto_663182 ?auto_663184 ) ) ( not ( = ?auto_663182 ?auto_663185 ) ) ( not ( = ?auto_663182 ?auto_663186 ) ) ( not ( = ?auto_663182 ?auto_663187 ) ) ( not ( = ?auto_663182 ?auto_663188 ) ) ( not ( = ?auto_663182 ?auto_663189 ) ) ( not ( = ?auto_663182 ?auto_663190 ) ) ( not ( = ?auto_663184 ?auto_663185 ) ) ( not ( = ?auto_663184 ?auto_663186 ) ) ( not ( = ?auto_663184 ?auto_663187 ) ) ( not ( = ?auto_663184 ?auto_663188 ) ) ( not ( = ?auto_663184 ?auto_663189 ) ) ( not ( = ?auto_663184 ?auto_663190 ) ) ( not ( = ?auto_663185 ?auto_663186 ) ) ( not ( = ?auto_663185 ?auto_663187 ) ) ( not ( = ?auto_663185 ?auto_663188 ) ) ( not ( = ?auto_663185 ?auto_663189 ) ) ( not ( = ?auto_663185 ?auto_663190 ) ) ( not ( = ?auto_663186 ?auto_663187 ) ) ( not ( = ?auto_663186 ?auto_663188 ) ) ( not ( = ?auto_663186 ?auto_663189 ) ) ( not ( = ?auto_663186 ?auto_663190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663187 ?auto_663188 ?auto_663189 )
      ( MAKE-10CRATE-VERIFY ?auto_663179 ?auto_663180 ?auto_663181 ?auto_663183 ?auto_663182 ?auto_663184 ?auto_663185 ?auto_663186 ?auto_663187 ?auto_663188 ?auto_663189 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663305 - SURFACE
      ?auto_663306 - SURFACE
      ?auto_663307 - SURFACE
      ?auto_663309 - SURFACE
      ?auto_663308 - SURFACE
      ?auto_663310 - SURFACE
      ?auto_663311 - SURFACE
      ?auto_663312 - SURFACE
      ?auto_663313 - SURFACE
      ?auto_663314 - SURFACE
      ?auto_663315 - SURFACE
    )
    :vars
    (
      ?auto_663321 - HOIST
      ?auto_663320 - PLACE
      ?auto_663316 - PLACE
      ?auto_663317 - HOIST
      ?auto_663318 - SURFACE
      ?auto_663319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663321 ?auto_663320 ) ( IS-CRATE ?auto_663315 ) ( not ( = ?auto_663314 ?auto_663315 ) ) ( not ( = ?auto_663313 ?auto_663314 ) ) ( not ( = ?auto_663313 ?auto_663315 ) ) ( not ( = ?auto_663316 ?auto_663320 ) ) ( HOIST-AT ?auto_663317 ?auto_663316 ) ( not ( = ?auto_663321 ?auto_663317 ) ) ( AVAILABLE ?auto_663317 ) ( SURFACE-AT ?auto_663315 ?auto_663316 ) ( ON ?auto_663315 ?auto_663318 ) ( CLEAR ?auto_663315 ) ( not ( = ?auto_663314 ?auto_663318 ) ) ( not ( = ?auto_663315 ?auto_663318 ) ) ( not ( = ?auto_663313 ?auto_663318 ) ) ( TRUCK-AT ?auto_663319 ?auto_663320 ) ( SURFACE-AT ?auto_663313 ?auto_663320 ) ( CLEAR ?auto_663313 ) ( LIFTING ?auto_663321 ?auto_663314 ) ( IS-CRATE ?auto_663314 ) ( ON ?auto_663306 ?auto_663305 ) ( ON ?auto_663307 ?auto_663306 ) ( ON ?auto_663309 ?auto_663307 ) ( ON ?auto_663308 ?auto_663309 ) ( ON ?auto_663310 ?auto_663308 ) ( ON ?auto_663311 ?auto_663310 ) ( ON ?auto_663312 ?auto_663311 ) ( ON ?auto_663313 ?auto_663312 ) ( not ( = ?auto_663305 ?auto_663306 ) ) ( not ( = ?auto_663305 ?auto_663307 ) ) ( not ( = ?auto_663305 ?auto_663309 ) ) ( not ( = ?auto_663305 ?auto_663308 ) ) ( not ( = ?auto_663305 ?auto_663310 ) ) ( not ( = ?auto_663305 ?auto_663311 ) ) ( not ( = ?auto_663305 ?auto_663312 ) ) ( not ( = ?auto_663305 ?auto_663313 ) ) ( not ( = ?auto_663305 ?auto_663314 ) ) ( not ( = ?auto_663305 ?auto_663315 ) ) ( not ( = ?auto_663305 ?auto_663318 ) ) ( not ( = ?auto_663306 ?auto_663307 ) ) ( not ( = ?auto_663306 ?auto_663309 ) ) ( not ( = ?auto_663306 ?auto_663308 ) ) ( not ( = ?auto_663306 ?auto_663310 ) ) ( not ( = ?auto_663306 ?auto_663311 ) ) ( not ( = ?auto_663306 ?auto_663312 ) ) ( not ( = ?auto_663306 ?auto_663313 ) ) ( not ( = ?auto_663306 ?auto_663314 ) ) ( not ( = ?auto_663306 ?auto_663315 ) ) ( not ( = ?auto_663306 ?auto_663318 ) ) ( not ( = ?auto_663307 ?auto_663309 ) ) ( not ( = ?auto_663307 ?auto_663308 ) ) ( not ( = ?auto_663307 ?auto_663310 ) ) ( not ( = ?auto_663307 ?auto_663311 ) ) ( not ( = ?auto_663307 ?auto_663312 ) ) ( not ( = ?auto_663307 ?auto_663313 ) ) ( not ( = ?auto_663307 ?auto_663314 ) ) ( not ( = ?auto_663307 ?auto_663315 ) ) ( not ( = ?auto_663307 ?auto_663318 ) ) ( not ( = ?auto_663309 ?auto_663308 ) ) ( not ( = ?auto_663309 ?auto_663310 ) ) ( not ( = ?auto_663309 ?auto_663311 ) ) ( not ( = ?auto_663309 ?auto_663312 ) ) ( not ( = ?auto_663309 ?auto_663313 ) ) ( not ( = ?auto_663309 ?auto_663314 ) ) ( not ( = ?auto_663309 ?auto_663315 ) ) ( not ( = ?auto_663309 ?auto_663318 ) ) ( not ( = ?auto_663308 ?auto_663310 ) ) ( not ( = ?auto_663308 ?auto_663311 ) ) ( not ( = ?auto_663308 ?auto_663312 ) ) ( not ( = ?auto_663308 ?auto_663313 ) ) ( not ( = ?auto_663308 ?auto_663314 ) ) ( not ( = ?auto_663308 ?auto_663315 ) ) ( not ( = ?auto_663308 ?auto_663318 ) ) ( not ( = ?auto_663310 ?auto_663311 ) ) ( not ( = ?auto_663310 ?auto_663312 ) ) ( not ( = ?auto_663310 ?auto_663313 ) ) ( not ( = ?auto_663310 ?auto_663314 ) ) ( not ( = ?auto_663310 ?auto_663315 ) ) ( not ( = ?auto_663310 ?auto_663318 ) ) ( not ( = ?auto_663311 ?auto_663312 ) ) ( not ( = ?auto_663311 ?auto_663313 ) ) ( not ( = ?auto_663311 ?auto_663314 ) ) ( not ( = ?auto_663311 ?auto_663315 ) ) ( not ( = ?auto_663311 ?auto_663318 ) ) ( not ( = ?auto_663312 ?auto_663313 ) ) ( not ( = ?auto_663312 ?auto_663314 ) ) ( not ( = ?auto_663312 ?auto_663315 ) ) ( not ( = ?auto_663312 ?auto_663318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663313 ?auto_663314 ?auto_663315 )
      ( MAKE-10CRATE-VERIFY ?auto_663305 ?auto_663306 ?auto_663307 ?auto_663309 ?auto_663308 ?auto_663310 ?auto_663311 ?auto_663312 ?auto_663313 ?auto_663314 ?auto_663315 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663431 - SURFACE
      ?auto_663432 - SURFACE
      ?auto_663433 - SURFACE
      ?auto_663435 - SURFACE
      ?auto_663434 - SURFACE
      ?auto_663436 - SURFACE
      ?auto_663437 - SURFACE
      ?auto_663438 - SURFACE
      ?auto_663439 - SURFACE
      ?auto_663440 - SURFACE
      ?auto_663441 - SURFACE
    )
    :vars
    (
      ?auto_663442 - HOIST
      ?auto_663446 - PLACE
      ?auto_663443 - PLACE
      ?auto_663444 - HOIST
      ?auto_663447 - SURFACE
      ?auto_663445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663442 ?auto_663446 ) ( IS-CRATE ?auto_663441 ) ( not ( = ?auto_663440 ?auto_663441 ) ) ( not ( = ?auto_663439 ?auto_663440 ) ) ( not ( = ?auto_663439 ?auto_663441 ) ) ( not ( = ?auto_663443 ?auto_663446 ) ) ( HOIST-AT ?auto_663444 ?auto_663443 ) ( not ( = ?auto_663442 ?auto_663444 ) ) ( AVAILABLE ?auto_663444 ) ( SURFACE-AT ?auto_663441 ?auto_663443 ) ( ON ?auto_663441 ?auto_663447 ) ( CLEAR ?auto_663441 ) ( not ( = ?auto_663440 ?auto_663447 ) ) ( not ( = ?auto_663441 ?auto_663447 ) ) ( not ( = ?auto_663439 ?auto_663447 ) ) ( TRUCK-AT ?auto_663445 ?auto_663446 ) ( SURFACE-AT ?auto_663439 ?auto_663446 ) ( CLEAR ?auto_663439 ) ( IS-CRATE ?auto_663440 ) ( AVAILABLE ?auto_663442 ) ( IN ?auto_663440 ?auto_663445 ) ( ON ?auto_663432 ?auto_663431 ) ( ON ?auto_663433 ?auto_663432 ) ( ON ?auto_663435 ?auto_663433 ) ( ON ?auto_663434 ?auto_663435 ) ( ON ?auto_663436 ?auto_663434 ) ( ON ?auto_663437 ?auto_663436 ) ( ON ?auto_663438 ?auto_663437 ) ( ON ?auto_663439 ?auto_663438 ) ( not ( = ?auto_663431 ?auto_663432 ) ) ( not ( = ?auto_663431 ?auto_663433 ) ) ( not ( = ?auto_663431 ?auto_663435 ) ) ( not ( = ?auto_663431 ?auto_663434 ) ) ( not ( = ?auto_663431 ?auto_663436 ) ) ( not ( = ?auto_663431 ?auto_663437 ) ) ( not ( = ?auto_663431 ?auto_663438 ) ) ( not ( = ?auto_663431 ?auto_663439 ) ) ( not ( = ?auto_663431 ?auto_663440 ) ) ( not ( = ?auto_663431 ?auto_663441 ) ) ( not ( = ?auto_663431 ?auto_663447 ) ) ( not ( = ?auto_663432 ?auto_663433 ) ) ( not ( = ?auto_663432 ?auto_663435 ) ) ( not ( = ?auto_663432 ?auto_663434 ) ) ( not ( = ?auto_663432 ?auto_663436 ) ) ( not ( = ?auto_663432 ?auto_663437 ) ) ( not ( = ?auto_663432 ?auto_663438 ) ) ( not ( = ?auto_663432 ?auto_663439 ) ) ( not ( = ?auto_663432 ?auto_663440 ) ) ( not ( = ?auto_663432 ?auto_663441 ) ) ( not ( = ?auto_663432 ?auto_663447 ) ) ( not ( = ?auto_663433 ?auto_663435 ) ) ( not ( = ?auto_663433 ?auto_663434 ) ) ( not ( = ?auto_663433 ?auto_663436 ) ) ( not ( = ?auto_663433 ?auto_663437 ) ) ( not ( = ?auto_663433 ?auto_663438 ) ) ( not ( = ?auto_663433 ?auto_663439 ) ) ( not ( = ?auto_663433 ?auto_663440 ) ) ( not ( = ?auto_663433 ?auto_663441 ) ) ( not ( = ?auto_663433 ?auto_663447 ) ) ( not ( = ?auto_663435 ?auto_663434 ) ) ( not ( = ?auto_663435 ?auto_663436 ) ) ( not ( = ?auto_663435 ?auto_663437 ) ) ( not ( = ?auto_663435 ?auto_663438 ) ) ( not ( = ?auto_663435 ?auto_663439 ) ) ( not ( = ?auto_663435 ?auto_663440 ) ) ( not ( = ?auto_663435 ?auto_663441 ) ) ( not ( = ?auto_663435 ?auto_663447 ) ) ( not ( = ?auto_663434 ?auto_663436 ) ) ( not ( = ?auto_663434 ?auto_663437 ) ) ( not ( = ?auto_663434 ?auto_663438 ) ) ( not ( = ?auto_663434 ?auto_663439 ) ) ( not ( = ?auto_663434 ?auto_663440 ) ) ( not ( = ?auto_663434 ?auto_663441 ) ) ( not ( = ?auto_663434 ?auto_663447 ) ) ( not ( = ?auto_663436 ?auto_663437 ) ) ( not ( = ?auto_663436 ?auto_663438 ) ) ( not ( = ?auto_663436 ?auto_663439 ) ) ( not ( = ?auto_663436 ?auto_663440 ) ) ( not ( = ?auto_663436 ?auto_663441 ) ) ( not ( = ?auto_663436 ?auto_663447 ) ) ( not ( = ?auto_663437 ?auto_663438 ) ) ( not ( = ?auto_663437 ?auto_663439 ) ) ( not ( = ?auto_663437 ?auto_663440 ) ) ( not ( = ?auto_663437 ?auto_663441 ) ) ( not ( = ?auto_663437 ?auto_663447 ) ) ( not ( = ?auto_663438 ?auto_663439 ) ) ( not ( = ?auto_663438 ?auto_663440 ) ) ( not ( = ?auto_663438 ?auto_663441 ) ) ( not ( = ?auto_663438 ?auto_663447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663439 ?auto_663440 ?auto_663441 )
      ( MAKE-10CRATE-VERIFY ?auto_663431 ?auto_663432 ?auto_663433 ?auto_663435 ?auto_663434 ?auto_663436 ?auto_663437 ?auto_663438 ?auto_663439 ?auto_663440 ?auto_663441 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_663466 - SURFACE
      ?auto_663467 - SURFACE
      ?auto_663468 - SURFACE
      ?auto_663469 - SURFACE
    )
    :vars
    (
      ?auto_663475 - HOIST
      ?auto_663472 - PLACE
      ?auto_663474 - PLACE
      ?auto_663470 - HOIST
      ?auto_663473 - SURFACE
      ?auto_663471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663475 ?auto_663472 ) ( IS-CRATE ?auto_663469 ) ( not ( = ?auto_663468 ?auto_663469 ) ) ( not ( = ?auto_663467 ?auto_663468 ) ) ( not ( = ?auto_663467 ?auto_663469 ) ) ( not ( = ?auto_663474 ?auto_663472 ) ) ( HOIST-AT ?auto_663470 ?auto_663474 ) ( not ( = ?auto_663475 ?auto_663470 ) ) ( AVAILABLE ?auto_663470 ) ( SURFACE-AT ?auto_663469 ?auto_663474 ) ( ON ?auto_663469 ?auto_663473 ) ( CLEAR ?auto_663469 ) ( not ( = ?auto_663468 ?auto_663473 ) ) ( not ( = ?auto_663469 ?auto_663473 ) ) ( not ( = ?auto_663467 ?auto_663473 ) ) ( SURFACE-AT ?auto_663467 ?auto_663472 ) ( CLEAR ?auto_663467 ) ( IS-CRATE ?auto_663468 ) ( AVAILABLE ?auto_663475 ) ( IN ?auto_663468 ?auto_663471 ) ( TRUCK-AT ?auto_663471 ?auto_663474 ) ( ON ?auto_663467 ?auto_663466 ) ( not ( = ?auto_663466 ?auto_663467 ) ) ( not ( = ?auto_663466 ?auto_663468 ) ) ( not ( = ?auto_663466 ?auto_663469 ) ) ( not ( = ?auto_663466 ?auto_663473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663467 ?auto_663468 ?auto_663469 )
      ( MAKE-3CRATE-VERIFY ?auto_663466 ?auto_663467 ?auto_663468 ?auto_663469 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_663476 - SURFACE
      ?auto_663477 - SURFACE
      ?auto_663478 - SURFACE
      ?auto_663480 - SURFACE
      ?auto_663479 - SURFACE
    )
    :vars
    (
      ?auto_663486 - HOIST
      ?auto_663483 - PLACE
      ?auto_663485 - PLACE
      ?auto_663481 - HOIST
      ?auto_663484 - SURFACE
      ?auto_663482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663486 ?auto_663483 ) ( IS-CRATE ?auto_663479 ) ( not ( = ?auto_663480 ?auto_663479 ) ) ( not ( = ?auto_663478 ?auto_663480 ) ) ( not ( = ?auto_663478 ?auto_663479 ) ) ( not ( = ?auto_663485 ?auto_663483 ) ) ( HOIST-AT ?auto_663481 ?auto_663485 ) ( not ( = ?auto_663486 ?auto_663481 ) ) ( AVAILABLE ?auto_663481 ) ( SURFACE-AT ?auto_663479 ?auto_663485 ) ( ON ?auto_663479 ?auto_663484 ) ( CLEAR ?auto_663479 ) ( not ( = ?auto_663480 ?auto_663484 ) ) ( not ( = ?auto_663479 ?auto_663484 ) ) ( not ( = ?auto_663478 ?auto_663484 ) ) ( SURFACE-AT ?auto_663478 ?auto_663483 ) ( CLEAR ?auto_663478 ) ( IS-CRATE ?auto_663480 ) ( AVAILABLE ?auto_663486 ) ( IN ?auto_663480 ?auto_663482 ) ( TRUCK-AT ?auto_663482 ?auto_663485 ) ( ON ?auto_663477 ?auto_663476 ) ( ON ?auto_663478 ?auto_663477 ) ( not ( = ?auto_663476 ?auto_663477 ) ) ( not ( = ?auto_663476 ?auto_663478 ) ) ( not ( = ?auto_663476 ?auto_663480 ) ) ( not ( = ?auto_663476 ?auto_663479 ) ) ( not ( = ?auto_663476 ?auto_663484 ) ) ( not ( = ?auto_663477 ?auto_663478 ) ) ( not ( = ?auto_663477 ?auto_663480 ) ) ( not ( = ?auto_663477 ?auto_663479 ) ) ( not ( = ?auto_663477 ?auto_663484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663478 ?auto_663480 ?auto_663479 )
      ( MAKE-4CRATE-VERIFY ?auto_663476 ?auto_663477 ?auto_663478 ?auto_663480 ?auto_663479 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_663487 - SURFACE
      ?auto_663488 - SURFACE
      ?auto_663489 - SURFACE
      ?auto_663491 - SURFACE
      ?auto_663490 - SURFACE
      ?auto_663492 - SURFACE
    )
    :vars
    (
      ?auto_663498 - HOIST
      ?auto_663495 - PLACE
      ?auto_663497 - PLACE
      ?auto_663493 - HOIST
      ?auto_663496 - SURFACE
      ?auto_663494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663498 ?auto_663495 ) ( IS-CRATE ?auto_663492 ) ( not ( = ?auto_663490 ?auto_663492 ) ) ( not ( = ?auto_663491 ?auto_663490 ) ) ( not ( = ?auto_663491 ?auto_663492 ) ) ( not ( = ?auto_663497 ?auto_663495 ) ) ( HOIST-AT ?auto_663493 ?auto_663497 ) ( not ( = ?auto_663498 ?auto_663493 ) ) ( AVAILABLE ?auto_663493 ) ( SURFACE-AT ?auto_663492 ?auto_663497 ) ( ON ?auto_663492 ?auto_663496 ) ( CLEAR ?auto_663492 ) ( not ( = ?auto_663490 ?auto_663496 ) ) ( not ( = ?auto_663492 ?auto_663496 ) ) ( not ( = ?auto_663491 ?auto_663496 ) ) ( SURFACE-AT ?auto_663491 ?auto_663495 ) ( CLEAR ?auto_663491 ) ( IS-CRATE ?auto_663490 ) ( AVAILABLE ?auto_663498 ) ( IN ?auto_663490 ?auto_663494 ) ( TRUCK-AT ?auto_663494 ?auto_663497 ) ( ON ?auto_663488 ?auto_663487 ) ( ON ?auto_663489 ?auto_663488 ) ( ON ?auto_663491 ?auto_663489 ) ( not ( = ?auto_663487 ?auto_663488 ) ) ( not ( = ?auto_663487 ?auto_663489 ) ) ( not ( = ?auto_663487 ?auto_663491 ) ) ( not ( = ?auto_663487 ?auto_663490 ) ) ( not ( = ?auto_663487 ?auto_663492 ) ) ( not ( = ?auto_663487 ?auto_663496 ) ) ( not ( = ?auto_663488 ?auto_663489 ) ) ( not ( = ?auto_663488 ?auto_663491 ) ) ( not ( = ?auto_663488 ?auto_663490 ) ) ( not ( = ?auto_663488 ?auto_663492 ) ) ( not ( = ?auto_663488 ?auto_663496 ) ) ( not ( = ?auto_663489 ?auto_663491 ) ) ( not ( = ?auto_663489 ?auto_663490 ) ) ( not ( = ?auto_663489 ?auto_663492 ) ) ( not ( = ?auto_663489 ?auto_663496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663491 ?auto_663490 ?auto_663492 )
      ( MAKE-5CRATE-VERIFY ?auto_663487 ?auto_663488 ?auto_663489 ?auto_663491 ?auto_663490 ?auto_663492 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_663499 - SURFACE
      ?auto_663500 - SURFACE
      ?auto_663501 - SURFACE
      ?auto_663503 - SURFACE
      ?auto_663502 - SURFACE
      ?auto_663504 - SURFACE
      ?auto_663505 - SURFACE
    )
    :vars
    (
      ?auto_663511 - HOIST
      ?auto_663508 - PLACE
      ?auto_663510 - PLACE
      ?auto_663506 - HOIST
      ?auto_663509 - SURFACE
      ?auto_663507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663511 ?auto_663508 ) ( IS-CRATE ?auto_663505 ) ( not ( = ?auto_663504 ?auto_663505 ) ) ( not ( = ?auto_663502 ?auto_663504 ) ) ( not ( = ?auto_663502 ?auto_663505 ) ) ( not ( = ?auto_663510 ?auto_663508 ) ) ( HOIST-AT ?auto_663506 ?auto_663510 ) ( not ( = ?auto_663511 ?auto_663506 ) ) ( AVAILABLE ?auto_663506 ) ( SURFACE-AT ?auto_663505 ?auto_663510 ) ( ON ?auto_663505 ?auto_663509 ) ( CLEAR ?auto_663505 ) ( not ( = ?auto_663504 ?auto_663509 ) ) ( not ( = ?auto_663505 ?auto_663509 ) ) ( not ( = ?auto_663502 ?auto_663509 ) ) ( SURFACE-AT ?auto_663502 ?auto_663508 ) ( CLEAR ?auto_663502 ) ( IS-CRATE ?auto_663504 ) ( AVAILABLE ?auto_663511 ) ( IN ?auto_663504 ?auto_663507 ) ( TRUCK-AT ?auto_663507 ?auto_663510 ) ( ON ?auto_663500 ?auto_663499 ) ( ON ?auto_663501 ?auto_663500 ) ( ON ?auto_663503 ?auto_663501 ) ( ON ?auto_663502 ?auto_663503 ) ( not ( = ?auto_663499 ?auto_663500 ) ) ( not ( = ?auto_663499 ?auto_663501 ) ) ( not ( = ?auto_663499 ?auto_663503 ) ) ( not ( = ?auto_663499 ?auto_663502 ) ) ( not ( = ?auto_663499 ?auto_663504 ) ) ( not ( = ?auto_663499 ?auto_663505 ) ) ( not ( = ?auto_663499 ?auto_663509 ) ) ( not ( = ?auto_663500 ?auto_663501 ) ) ( not ( = ?auto_663500 ?auto_663503 ) ) ( not ( = ?auto_663500 ?auto_663502 ) ) ( not ( = ?auto_663500 ?auto_663504 ) ) ( not ( = ?auto_663500 ?auto_663505 ) ) ( not ( = ?auto_663500 ?auto_663509 ) ) ( not ( = ?auto_663501 ?auto_663503 ) ) ( not ( = ?auto_663501 ?auto_663502 ) ) ( not ( = ?auto_663501 ?auto_663504 ) ) ( not ( = ?auto_663501 ?auto_663505 ) ) ( not ( = ?auto_663501 ?auto_663509 ) ) ( not ( = ?auto_663503 ?auto_663502 ) ) ( not ( = ?auto_663503 ?auto_663504 ) ) ( not ( = ?auto_663503 ?auto_663505 ) ) ( not ( = ?auto_663503 ?auto_663509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663502 ?auto_663504 ?auto_663505 )
      ( MAKE-6CRATE-VERIFY ?auto_663499 ?auto_663500 ?auto_663501 ?auto_663503 ?auto_663502 ?auto_663504 ?auto_663505 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_663512 - SURFACE
      ?auto_663513 - SURFACE
      ?auto_663514 - SURFACE
      ?auto_663516 - SURFACE
      ?auto_663515 - SURFACE
      ?auto_663517 - SURFACE
      ?auto_663518 - SURFACE
      ?auto_663519 - SURFACE
    )
    :vars
    (
      ?auto_663525 - HOIST
      ?auto_663522 - PLACE
      ?auto_663524 - PLACE
      ?auto_663520 - HOIST
      ?auto_663523 - SURFACE
      ?auto_663521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663525 ?auto_663522 ) ( IS-CRATE ?auto_663519 ) ( not ( = ?auto_663518 ?auto_663519 ) ) ( not ( = ?auto_663517 ?auto_663518 ) ) ( not ( = ?auto_663517 ?auto_663519 ) ) ( not ( = ?auto_663524 ?auto_663522 ) ) ( HOIST-AT ?auto_663520 ?auto_663524 ) ( not ( = ?auto_663525 ?auto_663520 ) ) ( AVAILABLE ?auto_663520 ) ( SURFACE-AT ?auto_663519 ?auto_663524 ) ( ON ?auto_663519 ?auto_663523 ) ( CLEAR ?auto_663519 ) ( not ( = ?auto_663518 ?auto_663523 ) ) ( not ( = ?auto_663519 ?auto_663523 ) ) ( not ( = ?auto_663517 ?auto_663523 ) ) ( SURFACE-AT ?auto_663517 ?auto_663522 ) ( CLEAR ?auto_663517 ) ( IS-CRATE ?auto_663518 ) ( AVAILABLE ?auto_663525 ) ( IN ?auto_663518 ?auto_663521 ) ( TRUCK-AT ?auto_663521 ?auto_663524 ) ( ON ?auto_663513 ?auto_663512 ) ( ON ?auto_663514 ?auto_663513 ) ( ON ?auto_663516 ?auto_663514 ) ( ON ?auto_663515 ?auto_663516 ) ( ON ?auto_663517 ?auto_663515 ) ( not ( = ?auto_663512 ?auto_663513 ) ) ( not ( = ?auto_663512 ?auto_663514 ) ) ( not ( = ?auto_663512 ?auto_663516 ) ) ( not ( = ?auto_663512 ?auto_663515 ) ) ( not ( = ?auto_663512 ?auto_663517 ) ) ( not ( = ?auto_663512 ?auto_663518 ) ) ( not ( = ?auto_663512 ?auto_663519 ) ) ( not ( = ?auto_663512 ?auto_663523 ) ) ( not ( = ?auto_663513 ?auto_663514 ) ) ( not ( = ?auto_663513 ?auto_663516 ) ) ( not ( = ?auto_663513 ?auto_663515 ) ) ( not ( = ?auto_663513 ?auto_663517 ) ) ( not ( = ?auto_663513 ?auto_663518 ) ) ( not ( = ?auto_663513 ?auto_663519 ) ) ( not ( = ?auto_663513 ?auto_663523 ) ) ( not ( = ?auto_663514 ?auto_663516 ) ) ( not ( = ?auto_663514 ?auto_663515 ) ) ( not ( = ?auto_663514 ?auto_663517 ) ) ( not ( = ?auto_663514 ?auto_663518 ) ) ( not ( = ?auto_663514 ?auto_663519 ) ) ( not ( = ?auto_663514 ?auto_663523 ) ) ( not ( = ?auto_663516 ?auto_663515 ) ) ( not ( = ?auto_663516 ?auto_663517 ) ) ( not ( = ?auto_663516 ?auto_663518 ) ) ( not ( = ?auto_663516 ?auto_663519 ) ) ( not ( = ?auto_663516 ?auto_663523 ) ) ( not ( = ?auto_663515 ?auto_663517 ) ) ( not ( = ?auto_663515 ?auto_663518 ) ) ( not ( = ?auto_663515 ?auto_663519 ) ) ( not ( = ?auto_663515 ?auto_663523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663517 ?auto_663518 ?auto_663519 )
      ( MAKE-7CRATE-VERIFY ?auto_663512 ?auto_663513 ?auto_663514 ?auto_663516 ?auto_663515 ?auto_663517 ?auto_663518 ?auto_663519 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_663526 - SURFACE
      ?auto_663527 - SURFACE
      ?auto_663528 - SURFACE
      ?auto_663530 - SURFACE
      ?auto_663529 - SURFACE
      ?auto_663531 - SURFACE
      ?auto_663532 - SURFACE
      ?auto_663533 - SURFACE
      ?auto_663534 - SURFACE
    )
    :vars
    (
      ?auto_663540 - HOIST
      ?auto_663537 - PLACE
      ?auto_663539 - PLACE
      ?auto_663535 - HOIST
      ?auto_663538 - SURFACE
      ?auto_663536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663540 ?auto_663537 ) ( IS-CRATE ?auto_663534 ) ( not ( = ?auto_663533 ?auto_663534 ) ) ( not ( = ?auto_663532 ?auto_663533 ) ) ( not ( = ?auto_663532 ?auto_663534 ) ) ( not ( = ?auto_663539 ?auto_663537 ) ) ( HOIST-AT ?auto_663535 ?auto_663539 ) ( not ( = ?auto_663540 ?auto_663535 ) ) ( AVAILABLE ?auto_663535 ) ( SURFACE-AT ?auto_663534 ?auto_663539 ) ( ON ?auto_663534 ?auto_663538 ) ( CLEAR ?auto_663534 ) ( not ( = ?auto_663533 ?auto_663538 ) ) ( not ( = ?auto_663534 ?auto_663538 ) ) ( not ( = ?auto_663532 ?auto_663538 ) ) ( SURFACE-AT ?auto_663532 ?auto_663537 ) ( CLEAR ?auto_663532 ) ( IS-CRATE ?auto_663533 ) ( AVAILABLE ?auto_663540 ) ( IN ?auto_663533 ?auto_663536 ) ( TRUCK-AT ?auto_663536 ?auto_663539 ) ( ON ?auto_663527 ?auto_663526 ) ( ON ?auto_663528 ?auto_663527 ) ( ON ?auto_663530 ?auto_663528 ) ( ON ?auto_663529 ?auto_663530 ) ( ON ?auto_663531 ?auto_663529 ) ( ON ?auto_663532 ?auto_663531 ) ( not ( = ?auto_663526 ?auto_663527 ) ) ( not ( = ?auto_663526 ?auto_663528 ) ) ( not ( = ?auto_663526 ?auto_663530 ) ) ( not ( = ?auto_663526 ?auto_663529 ) ) ( not ( = ?auto_663526 ?auto_663531 ) ) ( not ( = ?auto_663526 ?auto_663532 ) ) ( not ( = ?auto_663526 ?auto_663533 ) ) ( not ( = ?auto_663526 ?auto_663534 ) ) ( not ( = ?auto_663526 ?auto_663538 ) ) ( not ( = ?auto_663527 ?auto_663528 ) ) ( not ( = ?auto_663527 ?auto_663530 ) ) ( not ( = ?auto_663527 ?auto_663529 ) ) ( not ( = ?auto_663527 ?auto_663531 ) ) ( not ( = ?auto_663527 ?auto_663532 ) ) ( not ( = ?auto_663527 ?auto_663533 ) ) ( not ( = ?auto_663527 ?auto_663534 ) ) ( not ( = ?auto_663527 ?auto_663538 ) ) ( not ( = ?auto_663528 ?auto_663530 ) ) ( not ( = ?auto_663528 ?auto_663529 ) ) ( not ( = ?auto_663528 ?auto_663531 ) ) ( not ( = ?auto_663528 ?auto_663532 ) ) ( not ( = ?auto_663528 ?auto_663533 ) ) ( not ( = ?auto_663528 ?auto_663534 ) ) ( not ( = ?auto_663528 ?auto_663538 ) ) ( not ( = ?auto_663530 ?auto_663529 ) ) ( not ( = ?auto_663530 ?auto_663531 ) ) ( not ( = ?auto_663530 ?auto_663532 ) ) ( not ( = ?auto_663530 ?auto_663533 ) ) ( not ( = ?auto_663530 ?auto_663534 ) ) ( not ( = ?auto_663530 ?auto_663538 ) ) ( not ( = ?auto_663529 ?auto_663531 ) ) ( not ( = ?auto_663529 ?auto_663532 ) ) ( not ( = ?auto_663529 ?auto_663533 ) ) ( not ( = ?auto_663529 ?auto_663534 ) ) ( not ( = ?auto_663529 ?auto_663538 ) ) ( not ( = ?auto_663531 ?auto_663532 ) ) ( not ( = ?auto_663531 ?auto_663533 ) ) ( not ( = ?auto_663531 ?auto_663534 ) ) ( not ( = ?auto_663531 ?auto_663538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663532 ?auto_663533 ?auto_663534 )
      ( MAKE-8CRATE-VERIFY ?auto_663526 ?auto_663527 ?auto_663528 ?auto_663530 ?auto_663529 ?auto_663531 ?auto_663532 ?auto_663533 ?auto_663534 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_663541 - SURFACE
      ?auto_663542 - SURFACE
      ?auto_663543 - SURFACE
      ?auto_663545 - SURFACE
      ?auto_663544 - SURFACE
      ?auto_663546 - SURFACE
      ?auto_663547 - SURFACE
      ?auto_663548 - SURFACE
      ?auto_663549 - SURFACE
      ?auto_663550 - SURFACE
    )
    :vars
    (
      ?auto_663556 - HOIST
      ?auto_663553 - PLACE
      ?auto_663555 - PLACE
      ?auto_663551 - HOIST
      ?auto_663554 - SURFACE
      ?auto_663552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663556 ?auto_663553 ) ( IS-CRATE ?auto_663550 ) ( not ( = ?auto_663549 ?auto_663550 ) ) ( not ( = ?auto_663548 ?auto_663549 ) ) ( not ( = ?auto_663548 ?auto_663550 ) ) ( not ( = ?auto_663555 ?auto_663553 ) ) ( HOIST-AT ?auto_663551 ?auto_663555 ) ( not ( = ?auto_663556 ?auto_663551 ) ) ( AVAILABLE ?auto_663551 ) ( SURFACE-AT ?auto_663550 ?auto_663555 ) ( ON ?auto_663550 ?auto_663554 ) ( CLEAR ?auto_663550 ) ( not ( = ?auto_663549 ?auto_663554 ) ) ( not ( = ?auto_663550 ?auto_663554 ) ) ( not ( = ?auto_663548 ?auto_663554 ) ) ( SURFACE-AT ?auto_663548 ?auto_663553 ) ( CLEAR ?auto_663548 ) ( IS-CRATE ?auto_663549 ) ( AVAILABLE ?auto_663556 ) ( IN ?auto_663549 ?auto_663552 ) ( TRUCK-AT ?auto_663552 ?auto_663555 ) ( ON ?auto_663542 ?auto_663541 ) ( ON ?auto_663543 ?auto_663542 ) ( ON ?auto_663545 ?auto_663543 ) ( ON ?auto_663544 ?auto_663545 ) ( ON ?auto_663546 ?auto_663544 ) ( ON ?auto_663547 ?auto_663546 ) ( ON ?auto_663548 ?auto_663547 ) ( not ( = ?auto_663541 ?auto_663542 ) ) ( not ( = ?auto_663541 ?auto_663543 ) ) ( not ( = ?auto_663541 ?auto_663545 ) ) ( not ( = ?auto_663541 ?auto_663544 ) ) ( not ( = ?auto_663541 ?auto_663546 ) ) ( not ( = ?auto_663541 ?auto_663547 ) ) ( not ( = ?auto_663541 ?auto_663548 ) ) ( not ( = ?auto_663541 ?auto_663549 ) ) ( not ( = ?auto_663541 ?auto_663550 ) ) ( not ( = ?auto_663541 ?auto_663554 ) ) ( not ( = ?auto_663542 ?auto_663543 ) ) ( not ( = ?auto_663542 ?auto_663545 ) ) ( not ( = ?auto_663542 ?auto_663544 ) ) ( not ( = ?auto_663542 ?auto_663546 ) ) ( not ( = ?auto_663542 ?auto_663547 ) ) ( not ( = ?auto_663542 ?auto_663548 ) ) ( not ( = ?auto_663542 ?auto_663549 ) ) ( not ( = ?auto_663542 ?auto_663550 ) ) ( not ( = ?auto_663542 ?auto_663554 ) ) ( not ( = ?auto_663543 ?auto_663545 ) ) ( not ( = ?auto_663543 ?auto_663544 ) ) ( not ( = ?auto_663543 ?auto_663546 ) ) ( not ( = ?auto_663543 ?auto_663547 ) ) ( not ( = ?auto_663543 ?auto_663548 ) ) ( not ( = ?auto_663543 ?auto_663549 ) ) ( not ( = ?auto_663543 ?auto_663550 ) ) ( not ( = ?auto_663543 ?auto_663554 ) ) ( not ( = ?auto_663545 ?auto_663544 ) ) ( not ( = ?auto_663545 ?auto_663546 ) ) ( not ( = ?auto_663545 ?auto_663547 ) ) ( not ( = ?auto_663545 ?auto_663548 ) ) ( not ( = ?auto_663545 ?auto_663549 ) ) ( not ( = ?auto_663545 ?auto_663550 ) ) ( not ( = ?auto_663545 ?auto_663554 ) ) ( not ( = ?auto_663544 ?auto_663546 ) ) ( not ( = ?auto_663544 ?auto_663547 ) ) ( not ( = ?auto_663544 ?auto_663548 ) ) ( not ( = ?auto_663544 ?auto_663549 ) ) ( not ( = ?auto_663544 ?auto_663550 ) ) ( not ( = ?auto_663544 ?auto_663554 ) ) ( not ( = ?auto_663546 ?auto_663547 ) ) ( not ( = ?auto_663546 ?auto_663548 ) ) ( not ( = ?auto_663546 ?auto_663549 ) ) ( not ( = ?auto_663546 ?auto_663550 ) ) ( not ( = ?auto_663546 ?auto_663554 ) ) ( not ( = ?auto_663547 ?auto_663548 ) ) ( not ( = ?auto_663547 ?auto_663549 ) ) ( not ( = ?auto_663547 ?auto_663550 ) ) ( not ( = ?auto_663547 ?auto_663554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663548 ?auto_663549 ?auto_663550 )
      ( MAKE-9CRATE-VERIFY ?auto_663541 ?auto_663542 ?auto_663543 ?auto_663545 ?auto_663544 ?auto_663546 ?auto_663547 ?auto_663548 ?auto_663549 ?auto_663550 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663557 - SURFACE
      ?auto_663558 - SURFACE
      ?auto_663559 - SURFACE
      ?auto_663561 - SURFACE
      ?auto_663560 - SURFACE
      ?auto_663562 - SURFACE
      ?auto_663563 - SURFACE
      ?auto_663564 - SURFACE
      ?auto_663565 - SURFACE
      ?auto_663566 - SURFACE
      ?auto_663567 - SURFACE
    )
    :vars
    (
      ?auto_663573 - HOIST
      ?auto_663570 - PLACE
      ?auto_663572 - PLACE
      ?auto_663568 - HOIST
      ?auto_663571 - SURFACE
      ?auto_663569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663573 ?auto_663570 ) ( IS-CRATE ?auto_663567 ) ( not ( = ?auto_663566 ?auto_663567 ) ) ( not ( = ?auto_663565 ?auto_663566 ) ) ( not ( = ?auto_663565 ?auto_663567 ) ) ( not ( = ?auto_663572 ?auto_663570 ) ) ( HOIST-AT ?auto_663568 ?auto_663572 ) ( not ( = ?auto_663573 ?auto_663568 ) ) ( AVAILABLE ?auto_663568 ) ( SURFACE-AT ?auto_663567 ?auto_663572 ) ( ON ?auto_663567 ?auto_663571 ) ( CLEAR ?auto_663567 ) ( not ( = ?auto_663566 ?auto_663571 ) ) ( not ( = ?auto_663567 ?auto_663571 ) ) ( not ( = ?auto_663565 ?auto_663571 ) ) ( SURFACE-AT ?auto_663565 ?auto_663570 ) ( CLEAR ?auto_663565 ) ( IS-CRATE ?auto_663566 ) ( AVAILABLE ?auto_663573 ) ( IN ?auto_663566 ?auto_663569 ) ( TRUCK-AT ?auto_663569 ?auto_663572 ) ( ON ?auto_663558 ?auto_663557 ) ( ON ?auto_663559 ?auto_663558 ) ( ON ?auto_663561 ?auto_663559 ) ( ON ?auto_663560 ?auto_663561 ) ( ON ?auto_663562 ?auto_663560 ) ( ON ?auto_663563 ?auto_663562 ) ( ON ?auto_663564 ?auto_663563 ) ( ON ?auto_663565 ?auto_663564 ) ( not ( = ?auto_663557 ?auto_663558 ) ) ( not ( = ?auto_663557 ?auto_663559 ) ) ( not ( = ?auto_663557 ?auto_663561 ) ) ( not ( = ?auto_663557 ?auto_663560 ) ) ( not ( = ?auto_663557 ?auto_663562 ) ) ( not ( = ?auto_663557 ?auto_663563 ) ) ( not ( = ?auto_663557 ?auto_663564 ) ) ( not ( = ?auto_663557 ?auto_663565 ) ) ( not ( = ?auto_663557 ?auto_663566 ) ) ( not ( = ?auto_663557 ?auto_663567 ) ) ( not ( = ?auto_663557 ?auto_663571 ) ) ( not ( = ?auto_663558 ?auto_663559 ) ) ( not ( = ?auto_663558 ?auto_663561 ) ) ( not ( = ?auto_663558 ?auto_663560 ) ) ( not ( = ?auto_663558 ?auto_663562 ) ) ( not ( = ?auto_663558 ?auto_663563 ) ) ( not ( = ?auto_663558 ?auto_663564 ) ) ( not ( = ?auto_663558 ?auto_663565 ) ) ( not ( = ?auto_663558 ?auto_663566 ) ) ( not ( = ?auto_663558 ?auto_663567 ) ) ( not ( = ?auto_663558 ?auto_663571 ) ) ( not ( = ?auto_663559 ?auto_663561 ) ) ( not ( = ?auto_663559 ?auto_663560 ) ) ( not ( = ?auto_663559 ?auto_663562 ) ) ( not ( = ?auto_663559 ?auto_663563 ) ) ( not ( = ?auto_663559 ?auto_663564 ) ) ( not ( = ?auto_663559 ?auto_663565 ) ) ( not ( = ?auto_663559 ?auto_663566 ) ) ( not ( = ?auto_663559 ?auto_663567 ) ) ( not ( = ?auto_663559 ?auto_663571 ) ) ( not ( = ?auto_663561 ?auto_663560 ) ) ( not ( = ?auto_663561 ?auto_663562 ) ) ( not ( = ?auto_663561 ?auto_663563 ) ) ( not ( = ?auto_663561 ?auto_663564 ) ) ( not ( = ?auto_663561 ?auto_663565 ) ) ( not ( = ?auto_663561 ?auto_663566 ) ) ( not ( = ?auto_663561 ?auto_663567 ) ) ( not ( = ?auto_663561 ?auto_663571 ) ) ( not ( = ?auto_663560 ?auto_663562 ) ) ( not ( = ?auto_663560 ?auto_663563 ) ) ( not ( = ?auto_663560 ?auto_663564 ) ) ( not ( = ?auto_663560 ?auto_663565 ) ) ( not ( = ?auto_663560 ?auto_663566 ) ) ( not ( = ?auto_663560 ?auto_663567 ) ) ( not ( = ?auto_663560 ?auto_663571 ) ) ( not ( = ?auto_663562 ?auto_663563 ) ) ( not ( = ?auto_663562 ?auto_663564 ) ) ( not ( = ?auto_663562 ?auto_663565 ) ) ( not ( = ?auto_663562 ?auto_663566 ) ) ( not ( = ?auto_663562 ?auto_663567 ) ) ( not ( = ?auto_663562 ?auto_663571 ) ) ( not ( = ?auto_663563 ?auto_663564 ) ) ( not ( = ?auto_663563 ?auto_663565 ) ) ( not ( = ?auto_663563 ?auto_663566 ) ) ( not ( = ?auto_663563 ?auto_663567 ) ) ( not ( = ?auto_663563 ?auto_663571 ) ) ( not ( = ?auto_663564 ?auto_663565 ) ) ( not ( = ?auto_663564 ?auto_663566 ) ) ( not ( = ?auto_663564 ?auto_663567 ) ) ( not ( = ?auto_663564 ?auto_663571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663565 ?auto_663566 ?auto_663567 )
      ( MAKE-10CRATE-VERIFY ?auto_663557 ?auto_663558 ?auto_663559 ?auto_663561 ?auto_663560 ?auto_663562 ?auto_663563 ?auto_663564 ?auto_663565 ?auto_663566 ?auto_663567 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_663592 - SURFACE
      ?auto_663593 - SURFACE
      ?auto_663594 - SURFACE
      ?auto_663595 - SURFACE
    )
    :vars
    (
      ?auto_663598 - HOIST
      ?auto_663599 - PLACE
      ?auto_663601 - PLACE
      ?auto_663596 - HOIST
      ?auto_663600 - SURFACE
      ?auto_663597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663598 ?auto_663599 ) ( IS-CRATE ?auto_663595 ) ( not ( = ?auto_663594 ?auto_663595 ) ) ( not ( = ?auto_663593 ?auto_663594 ) ) ( not ( = ?auto_663593 ?auto_663595 ) ) ( not ( = ?auto_663601 ?auto_663599 ) ) ( HOIST-AT ?auto_663596 ?auto_663601 ) ( not ( = ?auto_663598 ?auto_663596 ) ) ( SURFACE-AT ?auto_663595 ?auto_663601 ) ( ON ?auto_663595 ?auto_663600 ) ( CLEAR ?auto_663595 ) ( not ( = ?auto_663594 ?auto_663600 ) ) ( not ( = ?auto_663595 ?auto_663600 ) ) ( not ( = ?auto_663593 ?auto_663600 ) ) ( SURFACE-AT ?auto_663593 ?auto_663599 ) ( CLEAR ?auto_663593 ) ( IS-CRATE ?auto_663594 ) ( AVAILABLE ?auto_663598 ) ( TRUCK-AT ?auto_663597 ?auto_663601 ) ( LIFTING ?auto_663596 ?auto_663594 ) ( ON ?auto_663593 ?auto_663592 ) ( not ( = ?auto_663592 ?auto_663593 ) ) ( not ( = ?auto_663592 ?auto_663594 ) ) ( not ( = ?auto_663592 ?auto_663595 ) ) ( not ( = ?auto_663592 ?auto_663600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663593 ?auto_663594 ?auto_663595 )
      ( MAKE-3CRATE-VERIFY ?auto_663592 ?auto_663593 ?auto_663594 ?auto_663595 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_663602 - SURFACE
      ?auto_663603 - SURFACE
      ?auto_663604 - SURFACE
      ?auto_663606 - SURFACE
      ?auto_663605 - SURFACE
    )
    :vars
    (
      ?auto_663609 - HOIST
      ?auto_663610 - PLACE
      ?auto_663612 - PLACE
      ?auto_663607 - HOIST
      ?auto_663611 - SURFACE
      ?auto_663608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663609 ?auto_663610 ) ( IS-CRATE ?auto_663605 ) ( not ( = ?auto_663606 ?auto_663605 ) ) ( not ( = ?auto_663604 ?auto_663606 ) ) ( not ( = ?auto_663604 ?auto_663605 ) ) ( not ( = ?auto_663612 ?auto_663610 ) ) ( HOIST-AT ?auto_663607 ?auto_663612 ) ( not ( = ?auto_663609 ?auto_663607 ) ) ( SURFACE-AT ?auto_663605 ?auto_663612 ) ( ON ?auto_663605 ?auto_663611 ) ( CLEAR ?auto_663605 ) ( not ( = ?auto_663606 ?auto_663611 ) ) ( not ( = ?auto_663605 ?auto_663611 ) ) ( not ( = ?auto_663604 ?auto_663611 ) ) ( SURFACE-AT ?auto_663604 ?auto_663610 ) ( CLEAR ?auto_663604 ) ( IS-CRATE ?auto_663606 ) ( AVAILABLE ?auto_663609 ) ( TRUCK-AT ?auto_663608 ?auto_663612 ) ( LIFTING ?auto_663607 ?auto_663606 ) ( ON ?auto_663603 ?auto_663602 ) ( ON ?auto_663604 ?auto_663603 ) ( not ( = ?auto_663602 ?auto_663603 ) ) ( not ( = ?auto_663602 ?auto_663604 ) ) ( not ( = ?auto_663602 ?auto_663606 ) ) ( not ( = ?auto_663602 ?auto_663605 ) ) ( not ( = ?auto_663602 ?auto_663611 ) ) ( not ( = ?auto_663603 ?auto_663604 ) ) ( not ( = ?auto_663603 ?auto_663606 ) ) ( not ( = ?auto_663603 ?auto_663605 ) ) ( not ( = ?auto_663603 ?auto_663611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663604 ?auto_663606 ?auto_663605 )
      ( MAKE-4CRATE-VERIFY ?auto_663602 ?auto_663603 ?auto_663604 ?auto_663606 ?auto_663605 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_663613 - SURFACE
      ?auto_663614 - SURFACE
      ?auto_663615 - SURFACE
      ?auto_663617 - SURFACE
      ?auto_663616 - SURFACE
      ?auto_663618 - SURFACE
    )
    :vars
    (
      ?auto_663621 - HOIST
      ?auto_663622 - PLACE
      ?auto_663624 - PLACE
      ?auto_663619 - HOIST
      ?auto_663623 - SURFACE
      ?auto_663620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663621 ?auto_663622 ) ( IS-CRATE ?auto_663618 ) ( not ( = ?auto_663616 ?auto_663618 ) ) ( not ( = ?auto_663617 ?auto_663616 ) ) ( not ( = ?auto_663617 ?auto_663618 ) ) ( not ( = ?auto_663624 ?auto_663622 ) ) ( HOIST-AT ?auto_663619 ?auto_663624 ) ( not ( = ?auto_663621 ?auto_663619 ) ) ( SURFACE-AT ?auto_663618 ?auto_663624 ) ( ON ?auto_663618 ?auto_663623 ) ( CLEAR ?auto_663618 ) ( not ( = ?auto_663616 ?auto_663623 ) ) ( not ( = ?auto_663618 ?auto_663623 ) ) ( not ( = ?auto_663617 ?auto_663623 ) ) ( SURFACE-AT ?auto_663617 ?auto_663622 ) ( CLEAR ?auto_663617 ) ( IS-CRATE ?auto_663616 ) ( AVAILABLE ?auto_663621 ) ( TRUCK-AT ?auto_663620 ?auto_663624 ) ( LIFTING ?auto_663619 ?auto_663616 ) ( ON ?auto_663614 ?auto_663613 ) ( ON ?auto_663615 ?auto_663614 ) ( ON ?auto_663617 ?auto_663615 ) ( not ( = ?auto_663613 ?auto_663614 ) ) ( not ( = ?auto_663613 ?auto_663615 ) ) ( not ( = ?auto_663613 ?auto_663617 ) ) ( not ( = ?auto_663613 ?auto_663616 ) ) ( not ( = ?auto_663613 ?auto_663618 ) ) ( not ( = ?auto_663613 ?auto_663623 ) ) ( not ( = ?auto_663614 ?auto_663615 ) ) ( not ( = ?auto_663614 ?auto_663617 ) ) ( not ( = ?auto_663614 ?auto_663616 ) ) ( not ( = ?auto_663614 ?auto_663618 ) ) ( not ( = ?auto_663614 ?auto_663623 ) ) ( not ( = ?auto_663615 ?auto_663617 ) ) ( not ( = ?auto_663615 ?auto_663616 ) ) ( not ( = ?auto_663615 ?auto_663618 ) ) ( not ( = ?auto_663615 ?auto_663623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663617 ?auto_663616 ?auto_663618 )
      ( MAKE-5CRATE-VERIFY ?auto_663613 ?auto_663614 ?auto_663615 ?auto_663617 ?auto_663616 ?auto_663618 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_663625 - SURFACE
      ?auto_663626 - SURFACE
      ?auto_663627 - SURFACE
      ?auto_663629 - SURFACE
      ?auto_663628 - SURFACE
      ?auto_663630 - SURFACE
      ?auto_663631 - SURFACE
    )
    :vars
    (
      ?auto_663634 - HOIST
      ?auto_663635 - PLACE
      ?auto_663637 - PLACE
      ?auto_663632 - HOIST
      ?auto_663636 - SURFACE
      ?auto_663633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663634 ?auto_663635 ) ( IS-CRATE ?auto_663631 ) ( not ( = ?auto_663630 ?auto_663631 ) ) ( not ( = ?auto_663628 ?auto_663630 ) ) ( not ( = ?auto_663628 ?auto_663631 ) ) ( not ( = ?auto_663637 ?auto_663635 ) ) ( HOIST-AT ?auto_663632 ?auto_663637 ) ( not ( = ?auto_663634 ?auto_663632 ) ) ( SURFACE-AT ?auto_663631 ?auto_663637 ) ( ON ?auto_663631 ?auto_663636 ) ( CLEAR ?auto_663631 ) ( not ( = ?auto_663630 ?auto_663636 ) ) ( not ( = ?auto_663631 ?auto_663636 ) ) ( not ( = ?auto_663628 ?auto_663636 ) ) ( SURFACE-AT ?auto_663628 ?auto_663635 ) ( CLEAR ?auto_663628 ) ( IS-CRATE ?auto_663630 ) ( AVAILABLE ?auto_663634 ) ( TRUCK-AT ?auto_663633 ?auto_663637 ) ( LIFTING ?auto_663632 ?auto_663630 ) ( ON ?auto_663626 ?auto_663625 ) ( ON ?auto_663627 ?auto_663626 ) ( ON ?auto_663629 ?auto_663627 ) ( ON ?auto_663628 ?auto_663629 ) ( not ( = ?auto_663625 ?auto_663626 ) ) ( not ( = ?auto_663625 ?auto_663627 ) ) ( not ( = ?auto_663625 ?auto_663629 ) ) ( not ( = ?auto_663625 ?auto_663628 ) ) ( not ( = ?auto_663625 ?auto_663630 ) ) ( not ( = ?auto_663625 ?auto_663631 ) ) ( not ( = ?auto_663625 ?auto_663636 ) ) ( not ( = ?auto_663626 ?auto_663627 ) ) ( not ( = ?auto_663626 ?auto_663629 ) ) ( not ( = ?auto_663626 ?auto_663628 ) ) ( not ( = ?auto_663626 ?auto_663630 ) ) ( not ( = ?auto_663626 ?auto_663631 ) ) ( not ( = ?auto_663626 ?auto_663636 ) ) ( not ( = ?auto_663627 ?auto_663629 ) ) ( not ( = ?auto_663627 ?auto_663628 ) ) ( not ( = ?auto_663627 ?auto_663630 ) ) ( not ( = ?auto_663627 ?auto_663631 ) ) ( not ( = ?auto_663627 ?auto_663636 ) ) ( not ( = ?auto_663629 ?auto_663628 ) ) ( not ( = ?auto_663629 ?auto_663630 ) ) ( not ( = ?auto_663629 ?auto_663631 ) ) ( not ( = ?auto_663629 ?auto_663636 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663628 ?auto_663630 ?auto_663631 )
      ( MAKE-6CRATE-VERIFY ?auto_663625 ?auto_663626 ?auto_663627 ?auto_663629 ?auto_663628 ?auto_663630 ?auto_663631 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_663638 - SURFACE
      ?auto_663639 - SURFACE
      ?auto_663640 - SURFACE
      ?auto_663642 - SURFACE
      ?auto_663641 - SURFACE
      ?auto_663643 - SURFACE
      ?auto_663644 - SURFACE
      ?auto_663645 - SURFACE
    )
    :vars
    (
      ?auto_663648 - HOIST
      ?auto_663649 - PLACE
      ?auto_663651 - PLACE
      ?auto_663646 - HOIST
      ?auto_663650 - SURFACE
      ?auto_663647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663648 ?auto_663649 ) ( IS-CRATE ?auto_663645 ) ( not ( = ?auto_663644 ?auto_663645 ) ) ( not ( = ?auto_663643 ?auto_663644 ) ) ( not ( = ?auto_663643 ?auto_663645 ) ) ( not ( = ?auto_663651 ?auto_663649 ) ) ( HOIST-AT ?auto_663646 ?auto_663651 ) ( not ( = ?auto_663648 ?auto_663646 ) ) ( SURFACE-AT ?auto_663645 ?auto_663651 ) ( ON ?auto_663645 ?auto_663650 ) ( CLEAR ?auto_663645 ) ( not ( = ?auto_663644 ?auto_663650 ) ) ( not ( = ?auto_663645 ?auto_663650 ) ) ( not ( = ?auto_663643 ?auto_663650 ) ) ( SURFACE-AT ?auto_663643 ?auto_663649 ) ( CLEAR ?auto_663643 ) ( IS-CRATE ?auto_663644 ) ( AVAILABLE ?auto_663648 ) ( TRUCK-AT ?auto_663647 ?auto_663651 ) ( LIFTING ?auto_663646 ?auto_663644 ) ( ON ?auto_663639 ?auto_663638 ) ( ON ?auto_663640 ?auto_663639 ) ( ON ?auto_663642 ?auto_663640 ) ( ON ?auto_663641 ?auto_663642 ) ( ON ?auto_663643 ?auto_663641 ) ( not ( = ?auto_663638 ?auto_663639 ) ) ( not ( = ?auto_663638 ?auto_663640 ) ) ( not ( = ?auto_663638 ?auto_663642 ) ) ( not ( = ?auto_663638 ?auto_663641 ) ) ( not ( = ?auto_663638 ?auto_663643 ) ) ( not ( = ?auto_663638 ?auto_663644 ) ) ( not ( = ?auto_663638 ?auto_663645 ) ) ( not ( = ?auto_663638 ?auto_663650 ) ) ( not ( = ?auto_663639 ?auto_663640 ) ) ( not ( = ?auto_663639 ?auto_663642 ) ) ( not ( = ?auto_663639 ?auto_663641 ) ) ( not ( = ?auto_663639 ?auto_663643 ) ) ( not ( = ?auto_663639 ?auto_663644 ) ) ( not ( = ?auto_663639 ?auto_663645 ) ) ( not ( = ?auto_663639 ?auto_663650 ) ) ( not ( = ?auto_663640 ?auto_663642 ) ) ( not ( = ?auto_663640 ?auto_663641 ) ) ( not ( = ?auto_663640 ?auto_663643 ) ) ( not ( = ?auto_663640 ?auto_663644 ) ) ( not ( = ?auto_663640 ?auto_663645 ) ) ( not ( = ?auto_663640 ?auto_663650 ) ) ( not ( = ?auto_663642 ?auto_663641 ) ) ( not ( = ?auto_663642 ?auto_663643 ) ) ( not ( = ?auto_663642 ?auto_663644 ) ) ( not ( = ?auto_663642 ?auto_663645 ) ) ( not ( = ?auto_663642 ?auto_663650 ) ) ( not ( = ?auto_663641 ?auto_663643 ) ) ( not ( = ?auto_663641 ?auto_663644 ) ) ( not ( = ?auto_663641 ?auto_663645 ) ) ( not ( = ?auto_663641 ?auto_663650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663643 ?auto_663644 ?auto_663645 )
      ( MAKE-7CRATE-VERIFY ?auto_663638 ?auto_663639 ?auto_663640 ?auto_663642 ?auto_663641 ?auto_663643 ?auto_663644 ?auto_663645 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_663652 - SURFACE
      ?auto_663653 - SURFACE
      ?auto_663654 - SURFACE
      ?auto_663656 - SURFACE
      ?auto_663655 - SURFACE
      ?auto_663657 - SURFACE
      ?auto_663658 - SURFACE
      ?auto_663659 - SURFACE
      ?auto_663660 - SURFACE
    )
    :vars
    (
      ?auto_663663 - HOIST
      ?auto_663664 - PLACE
      ?auto_663666 - PLACE
      ?auto_663661 - HOIST
      ?auto_663665 - SURFACE
      ?auto_663662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663663 ?auto_663664 ) ( IS-CRATE ?auto_663660 ) ( not ( = ?auto_663659 ?auto_663660 ) ) ( not ( = ?auto_663658 ?auto_663659 ) ) ( not ( = ?auto_663658 ?auto_663660 ) ) ( not ( = ?auto_663666 ?auto_663664 ) ) ( HOIST-AT ?auto_663661 ?auto_663666 ) ( not ( = ?auto_663663 ?auto_663661 ) ) ( SURFACE-AT ?auto_663660 ?auto_663666 ) ( ON ?auto_663660 ?auto_663665 ) ( CLEAR ?auto_663660 ) ( not ( = ?auto_663659 ?auto_663665 ) ) ( not ( = ?auto_663660 ?auto_663665 ) ) ( not ( = ?auto_663658 ?auto_663665 ) ) ( SURFACE-AT ?auto_663658 ?auto_663664 ) ( CLEAR ?auto_663658 ) ( IS-CRATE ?auto_663659 ) ( AVAILABLE ?auto_663663 ) ( TRUCK-AT ?auto_663662 ?auto_663666 ) ( LIFTING ?auto_663661 ?auto_663659 ) ( ON ?auto_663653 ?auto_663652 ) ( ON ?auto_663654 ?auto_663653 ) ( ON ?auto_663656 ?auto_663654 ) ( ON ?auto_663655 ?auto_663656 ) ( ON ?auto_663657 ?auto_663655 ) ( ON ?auto_663658 ?auto_663657 ) ( not ( = ?auto_663652 ?auto_663653 ) ) ( not ( = ?auto_663652 ?auto_663654 ) ) ( not ( = ?auto_663652 ?auto_663656 ) ) ( not ( = ?auto_663652 ?auto_663655 ) ) ( not ( = ?auto_663652 ?auto_663657 ) ) ( not ( = ?auto_663652 ?auto_663658 ) ) ( not ( = ?auto_663652 ?auto_663659 ) ) ( not ( = ?auto_663652 ?auto_663660 ) ) ( not ( = ?auto_663652 ?auto_663665 ) ) ( not ( = ?auto_663653 ?auto_663654 ) ) ( not ( = ?auto_663653 ?auto_663656 ) ) ( not ( = ?auto_663653 ?auto_663655 ) ) ( not ( = ?auto_663653 ?auto_663657 ) ) ( not ( = ?auto_663653 ?auto_663658 ) ) ( not ( = ?auto_663653 ?auto_663659 ) ) ( not ( = ?auto_663653 ?auto_663660 ) ) ( not ( = ?auto_663653 ?auto_663665 ) ) ( not ( = ?auto_663654 ?auto_663656 ) ) ( not ( = ?auto_663654 ?auto_663655 ) ) ( not ( = ?auto_663654 ?auto_663657 ) ) ( not ( = ?auto_663654 ?auto_663658 ) ) ( not ( = ?auto_663654 ?auto_663659 ) ) ( not ( = ?auto_663654 ?auto_663660 ) ) ( not ( = ?auto_663654 ?auto_663665 ) ) ( not ( = ?auto_663656 ?auto_663655 ) ) ( not ( = ?auto_663656 ?auto_663657 ) ) ( not ( = ?auto_663656 ?auto_663658 ) ) ( not ( = ?auto_663656 ?auto_663659 ) ) ( not ( = ?auto_663656 ?auto_663660 ) ) ( not ( = ?auto_663656 ?auto_663665 ) ) ( not ( = ?auto_663655 ?auto_663657 ) ) ( not ( = ?auto_663655 ?auto_663658 ) ) ( not ( = ?auto_663655 ?auto_663659 ) ) ( not ( = ?auto_663655 ?auto_663660 ) ) ( not ( = ?auto_663655 ?auto_663665 ) ) ( not ( = ?auto_663657 ?auto_663658 ) ) ( not ( = ?auto_663657 ?auto_663659 ) ) ( not ( = ?auto_663657 ?auto_663660 ) ) ( not ( = ?auto_663657 ?auto_663665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663658 ?auto_663659 ?auto_663660 )
      ( MAKE-8CRATE-VERIFY ?auto_663652 ?auto_663653 ?auto_663654 ?auto_663656 ?auto_663655 ?auto_663657 ?auto_663658 ?auto_663659 ?auto_663660 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_663667 - SURFACE
      ?auto_663668 - SURFACE
      ?auto_663669 - SURFACE
      ?auto_663671 - SURFACE
      ?auto_663670 - SURFACE
      ?auto_663672 - SURFACE
      ?auto_663673 - SURFACE
      ?auto_663674 - SURFACE
      ?auto_663675 - SURFACE
      ?auto_663676 - SURFACE
    )
    :vars
    (
      ?auto_663679 - HOIST
      ?auto_663680 - PLACE
      ?auto_663682 - PLACE
      ?auto_663677 - HOIST
      ?auto_663681 - SURFACE
      ?auto_663678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663679 ?auto_663680 ) ( IS-CRATE ?auto_663676 ) ( not ( = ?auto_663675 ?auto_663676 ) ) ( not ( = ?auto_663674 ?auto_663675 ) ) ( not ( = ?auto_663674 ?auto_663676 ) ) ( not ( = ?auto_663682 ?auto_663680 ) ) ( HOIST-AT ?auto_663677 ?auto_663682 ) ( not ( = ?auto_663679 ?auto_663677 ) ) ( SURFACE-AT ?auto_663676 ?auto_663682 ) ( ON ?auto_663676 ?auto_663681 ) ( CLEAR ?auto_663676 ) ( not ( = ?auto_663675 ?auto_663681 ) ) ( not ( = ?auto_663676 ?auto_663681 ) ) ( not ( = ?auto_663674 ?auto_663681 ) ) ( SURFACE-AT ?auto_663674 ?auto_663680 ) ( CLEAR ?auto_663674 ) ( IS-CRATE ?auto_663675 ) ( AVAILABLE ?auto_663679 ) ( TRUCK-AT ?auto_663678 ?auto_663682 ) ( LIFTING ?auto_663677 ?auto_663675 ) ( ON ?auto_663668 ?auto_663667 ) ( ON ?auto_663669 ?auto_663668 ) ( ON ?auto_663671 ?auto_663669 ) ( ON ?auto_663670 ?auto_663671 ) ( ON ?auto_663672 ?auto_663670 ) ( ON ?auto_663673 ?auto_663672 ) ( ON ?auto_663674 ?auto_663673 ) ( not ( = ?auto_663667 ?auto_663668 ) ) ( not ( = ?auto_663667 ?auto_663669 ) ) ( not ( = ?auto_663667 ?auto_663671 ) ) ( not ( = ?auto_663667 ?auto_663670 ) ) ( not ( = ?auto_663667 ?auto_663672 ) ) ( not ( = ?auto_663667 ?auto_663673 ) ) ( not ( = ?auto_663667 ?auto_663674 ) ) ( not ( = ?auto_663667 ?auto_663675 ) ) ( not ( = ?auto_663667 ?auto_663676 ) ) ( not ( = ?auto_663667 ?auto_663681 ) ) ( not ( = ?auto_663668 ?auto_663669 ) ) ( not ( = ?auto_663668 ?auto_663671 ) ) ( not ( = ?auto_663668 ?auto_663670 ) ) ( not ( = ?auto_663668 ?auto_663672 ) ) ( not ( = ?auto_663668 ?auto_663673 ) ) ( not ( = ?auto_663668 ?auto_663674 ) ) ( not ( = ?auto_663668 ?auto_663675 ) ) ( not ( = ?auto_663668 ?auto_663676 ) ) ( not ( = ?auto_663668 ?auto_663681 ) ) ( not ( = ?auto_663669 ?auto_663671 ) ) ( not ( = ?auto_663669 ?auto_663670 ) ) ( not ( = ?auto_663669 ?auto_663672 ) ) ( not ( = ?auto_663669 ?auto_663673 ) ) ( not ( = ?auto_663669 ?auto_663674 ) ) ( not ( = ?auto_663669 ?auto_663675 ) ) ( not ( = ?auto_663669 ?auto_663676 ) ) ( not ( = ?auto_663669 ?auto_663681 ) ) ( not ( = ?auto_663671 ?auto_663670 ) ) ( not ( = ?auto_663671 ?auto_663672 ) ) ( not ( = ?auto_663671 ?auto_663673 ) ) ( not ( = ?auto_663671 ?auto_663674 ) ) ( not ( = ?auto_663671 ?auto_663675 ) ) ( not ( = ?auto_663671 ?auto_663676 ) ) ( not ( = ?auto_663671 ?auto_663681 ) ) ( not ( = ?auto_663670 ?auto_663672 ) ) ( not ( = ?auto_663670 ?auto_663673 ) ) ( not ( = ?auto_663670 ?auto_663674 ) ) ( not ( = ?auto_663670 ?auto_663675 ) ) ( not ( = ?auto_663670 ?auto_663676 ) ) ( not ( = ?auto_663670 ?auto_663681 ) ) ( not ( = ?auto_663672 ?auto_663673 ) ) ( not ( = ?auto_663672 ?auto_663674 ) ) ( not ( = ?auto_663672 ?auto_663675 ) ) ( not ( = ?auto_663672 ?auto_663676 ) ) ( not ( = ?auto_663672 ?auto_663681 ) ) ( not ( = ?auto_663673 ?auto_663674 ) ) ( not ( = ?auto_663673 ?auto_663675 ) ) ( not ( = ?auto_663673 ?auto_663676 ) ) ( not ( = ?auto_663673 ?auto_663681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663674 ?auto_663675 ?auto_663676 )
      ( MAKE-9CRATE-VERIFY ?auto_663667 ?auto_663668 ?auto_663669 ?auto_663671 ?auto_663670 ?auto_663672 ?auto_663673 ?auto_663674 ?auto_663675 ?auto_663676 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663683 - SURFACE
      ?auto_663684 - SURFACE
      ?auto_663685 - SURFACE
      ?auto_663687 - SURFACE
      ?auto_663686 - SURFACE
      ?auto_663688 - SURFACE
      ?auto_663689 - SURFACE
      ?auto_663690 - SURFACE
      ?auto_663691 - SURFACE
      ?auto_663692 - SURFACE
      ?auto_663693 - SURFACE
    )
    :vars
    (
      ?auto_663696 - HOIST
      ?auto_663697 - PLACE
      ?auto_663699 - PLACE
      ?auto_663694 - HOIST
      ?auto_663698 - SURFACE
      ?auto_663695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663696 ?auto_663697 ) ( IS-CRATE ?auto_663693 ) ( not ( = ?auto_663692 ?auto_663693 ) ) ( not ( = ?auto_663691 ?auto_663692 ) ) ( not ( = ?auto_663691 ?auto_663693 ) ) ( not ( = ?auto_663699 ?auto_663697 ) ) ( HOIST-AT ?auto_663694 ?auto_663699 ) ( not ( = ?auto_663696 ?auto_663694 ) ) ( SURFACE-AT ?auto_663693 ?auto_663699 ) ( ON ?auto_663693 ?auto_663698 ) ( CLEAR ?auto_663693 ) ( not ( = ?auto_663692 ?auto_663698 ) ) ( not ( = ?auto_663693 ?auto_663698 ) ) ( not ( = ?auto_663691 ?auto_663698 ) ) ( SURFACE-AT ?auto_663691 ?auto_663697 ) ( CLEAR ?auto_663691 ) ( IS-CRATE ?auto_663692 ) ( AVAILABLE ?auto_663696 ) ( TRUCK-AT ?auto_663695 ?auto_663699 ) ( LIFTING ?auto_663694 ?auto_663692 ) ( ON ?auto_663684 ?auto_663683 ) ( ON ?auto_663685 ?auto_663684 ) ( ON ?auto_663687 ?auto_663685 ) ( ON ?auto_663686 ?auto_663687 ) ( ON ?auto_663688 ?auto_663686 ) ( ON ?auto_663689 ?auto_663688 ) ( ON ?auto_663690 ?auto_663689 ) ( ON ?auto_663691 ?auto_663690 ) ( not ( = ?auto_663683 ?auto_663684 ) ) ( not ( = ?auto_663683 ?auto_663685 ) ) ( not ( = ?auto_663683 ?auto_663687 ) ) ( not ( = ?auto_663683 ?auto_663686 ) ) ( not ( = ?auto_663683 ?auto_663688 ) ) ( not ( = ?auto_663683 ?auto_663689 ) ) ( not ( = ?auto_663683 ?auto_663690 ) ) ( not ( = ?auto_663683 ?auto_663691 ) ) ( not ( = ?auto_663683 ?auto_663692 ) ) ( not ( = ?auto_663683 ?auto_663693 ) ) ( not ( = ?auto_663683 ?auto_663698 ) ) ( not ( = ?auto_663684 ?auto_663685 ) ) ( not ( = ?auto_663684 ?auto_663687 ) ) ( not ( = ?auto_663684 ?auto_663686 ) ) ( not ( = ?auto_663684 ?auto_663688 ) ) ( not ( = ?auto_663684 ?auto_663689 ) ) ( not ( = ?auto_663684 ?auto_663690 ) ) ( not ( = ?auto_663684 ?auto_663691 ) ) ( not ( = ?auto_663684 ?auto_663692 ) ) ( not ( = ?auto_663684 ?auto_663693 ) ) ( not ( = ?auto_663684 ?auto_663698 ) ) ( not ( = ?auto_663685 ?auto_663687 ) ) ( not ( = ?auto_663685 ?auto_663686 ) ) ( not ( = ?auto_663685 ?auto_663688 ) ) ( not ( = ?auto_663685 ?auto_663689 ) ) ( not ( = ?auto_663685 ?auto_663690 ) ) ( not ( = ?auto_663685 ?auto_663691 ) ) ( not ( = ?auto_663685 ?auto_663692 ) ) ( not ( = ?auto_663685 ?auto_663693 ) ) ( not ( = ?auto_663685 ?auto_663698 ) ) ( not ( = ?auto_663687 ?auto_663686 ) ) ( not ( = ?auto_663687 ?auto_663688 ) ) ( not ( = ?auto_663687 ?auto_663689 ) ) ( not ( = ?auto_663687 ?auto_663690 ) ) ( not ( = ?auto_663687 ?auto_663691 ) ) ( not ( = ?auto_663687 ?auto_663692 ) ) ( not ( = ?auto_663687 ?auto_663693 ) ) ( not ( = ?auto_663687 ?auto_663698 ) ) ( not ( = ?auto_663686 ?auto_663688 ) ) ( not ( = ?auto_663686 ?auto_663689 ) ) ( not ( = ?auto_663686 ?auto_663690 ) ) ( not ( = ?auto_663686 ?auto_663691 ) ) ( not ( = ?auto_663686 ?auto_663692 ) ) ( not ( = ?auto_663686 ?auto_663693 ) ) ( not ( = ?auto_663686 ?auto_663698 ) ) ( not ( = ?auto_663688 ?auto_663689 ) ) ( not ( = ?auto_663688 ?auto_663690 ) ) ( not ( = ?auto_663688 ?auto_663691 ) ) ( not ( = ?auto_663688 ?auto_663692 ) ) ( not ( = ?auto_663688 ?auto_663693 ) ) ( not ( = ?auto_663688 ?auto_663698 ) ) ( not ( = ?auto_663689 ?auto_663690 ) ) ( not ( = ?auto_663689 ?auto_663691 ) ) ( not ( = ?auto_663689 ?auto_663692 ) ) ( not ( = ?auto_663689 ?auto_663693 ) ) ( not ( = ?auto_663689 ?auto_663698 ) ) ( not ( = ?auto_663690 ?auto_663691 ) ) ( not ( = ?auto_663690 ?auto_663692 ) ) ( not ( = ?auto_663690 ?auto_663693 ) ) ( not ( = ?auto_663690 ?auto_663698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663691 ?auto_663692 ?auto_663693 )
      ( MAKE-10CRATE-VERIFY ?auto_663683 ?auto_663684 ?auto_663685 ?auto_663687 ?auto_663686 ?auto_663688 ?auto_663689 ?auto_663690 ?auto_663691 ?auto_663692 ?auto_663693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_663720 - SURFACE
      ?auto_663721 - SURFACE
      ?auto_663722 - SURFACE
      ?auto_663723 - SURFACE
    )
    :vars
    (
      ?auto_663725 - HOIST
      ?auto_663726 - PLACE
      ?auto_663730 - PLACE
      ?auto_663724 - HOIST
      ?auto_663729 - SURFACE
      ?auto_663728 - TRUCK
      ?auto_663727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663725 ?auto_663726 ) ( IS-CRATE ?auto_663723 ) ( not ( = ?auto_663722 ?auto_663723 ) ) ( not ( = ?auto_663721 ?auto_663722 ) ) ( not ( = ?auto_663721 ?auto_663723 ) ) ( not ( = ?auto_663730 ?auto_663726 ) ) ( HOIST-AT ?auto_663724 ?auto_663730 ) ( not ( = ?auto_663725 ?auto_663724 ) ) ( SURFACE-AT ?auto_663723 ?auto_663730 ) ( ON ?auto_663723 ?auto_663729 ) ( CLEAR ?auto_663723 ) ( not ( = ?auto_663722 ?auto_663729 ) ) ( not ( = ?auto_663723 ?auto_663729 ) ) ( not ( = ?auto_663721 ?auto_663729 ) ) ( SURFACE-AT ?auto_663721 ?auto_663726 ) ( CLEAR ?auto_663721 ) ( IS-CRATE ?auto_663722 ) ( AVAILABLE ?auto_663725 ) ( TRUCK-AT ?auto_663728 ?auto_663730 ) ( AVAILABLE ?auto_663724 ) ( SURFACE-AT ?auto_663722 ?auto_663730 ) ( ON ?auto_663722 ?auto_663727 ) ( CLEAR ?auto_663722 ) ( not ( = ?auto_663722 ?auto_663727 ) ) ( not ( = ?auto_663723 ?auto_663727 ) ) ( not ( = ?auto_663721 ?auto_663727 ) ) ( not ( = ?auto_663729 ?auto_663727 ) ) ( ON ?auto_663721 ?auto_663720 ) ( not ( = ?auto_663720 ?auto_663721 ) ) ( not ( = ?auto_663720 ?auto_663722 ) ) ( not ( = ?auto_663720 ?auto_663723 ) ) ( not ( = ?auto_663720 ?auto_663729 ) ) ( not ( = ?auto_663720 ?auto_663727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663721 ?auto_663722 ?auto_663723 )
      ( MAKE-3CRATE-VERIFY ?auto_663720 ?auto_663721 ?auto_663722 ?auto_663723 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_663731 - SURFACE
      ?auto_663732 - SURFACE
      ?auto_663733 - SURFACE
      ?auto_663735 - SURFACE
      ?auto_663734 - SURFACE
    )
    :vars
    (
      ?auto_663737 - HOIST
      ?auto_663738 - PLACE
      ?auto_663742 - PLACE
      ?auto_663736 - HOIST
      ?auto_663741 - SURFACE
      ?auto_663740 - TRUCK
      ?auto_663739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663737 ?auto_663738 ) ( IS-CRATE ?auto_663734 ) ( not ( = ?auto_663735 ?auto_663734 ) ) ( not ( = ?auto_663733 ?auto_663735 ) ) ( not ( = ?auto_663733 ?auto_663734 ) ) ( not ( = ?auto_663742 ?auto_663738 ) ) ( HOIST-AT ?auto_663736 ?auto_663742 ) ( not ( = ?auto_663737 ?auto_663736 ) ) ( SURFACE-AT ?auto_663734 ?auto_663742 ) ( ON ?auto_663734 ?auto_663741 ) ( CLEAR ?auto_663734 ) ( not ( = ?auto_663735 ?auto_663741 ) ) ( not ( = ?auto_663734 ?auto_663741 ) ) ( not ( = ?auto_663733 ?auto_663741 ) ) ( SURFACE-AT ?auto_663733 ?auto_663738 ) ( CLEAR ?auto_663733 ) ( IS-CRATE ?auto_663735 ) ( AVAILABLE ?auto_663737 ) ( TRUCK-AT ?auto_663740 ?auto_663742 ) ( AVAILABLE ?auto_663736 ) ( SURFACE-AT ?auto_663735 ?auto_663742 ) ( ON ?auto_663735 ?auto_663739 ) ( CLEAR ?auto_663735 ) ( not ( = ?auto_663735 ?auto_663739 ) ) ( not ( = ?auto_663734 ?auto_663739 ) ) ( not ( = ?auto_663733 ?auto_663739 ) ) ( not ( = ?auto_663741 ?auto_663739 ) ) ( ON ?auto_663732 ?auto_663731 ) ( ON ?auto_663733 ?auto_663732 ) ( not ( = ?auto_663731 ?auto_663732 ) ) ( not ( = ?auto_663731 ?auto_663733 ) ) ( not ( = ?auto_663731 ?auto_663735 ) ) ( not ( = ?auto_663731 ?auto_663734 ) ) ( not ( = ?auto_663731 ?auto_663741 ) ) ( not ( = ?auto_663731 ?auto_663739 ) ) ( not ( = ?auto_663732 ?auto_663733 ) ) ( not ( = ?auto_663732 ?auto_663735 ) ) ( not ( = ?auto_663732 ?auto_663734 ) ) ( not ( = ?auto_663732 ?auto_663741 ) ) ( not ( = ?auto_663732 ?auto_663739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663733 ?auto_663735 ?auto_663734 )
      ( MAKE-4CRATE-VERIFY ?auto_663731 ?auto_663732 ?auto_663733 ?auto_663735 ?auto_663734 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_663743 - SURFACE
      ?auto_663744 - SURFACE
      ?auto_663745 - SURFACE
      ?auto_663747 - SURFACE
      ?auto_663746 - SURFACE
      ?auto_663748 - SURFACE
    )
    :vars
    (
      ?auto_663750 - HOIST
      ?auto_663751 - PLACE
      ?auto_663755 - PLACE
      ?auto_663749 - HOIST
      ?auto_663754 - SURFACE
      ?auto_663753 - TRUCK
      ?auto_663752 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663750 ?auto_663751 ) ( IS-CRATE ?auto_663748 ) ( not ( = ?auto_663746 ?auto_663748 ) ) ( not ( = ?auto_663747 ?auto_663746 ) ) ( not ( = ?auto_663747 ?auto_663748 ) ) ( not ( = ?auto_663755 ?auto_663751 ) ) ( HOIST-AT ?auto_663749 ?auto_663755 ) ( not ( = ?auto_663750 ?auto_663749 ) ) ( SURFACE-AT ?auto_663748 ?auto_663755 ) ( ON ?auto_663748 ?auto_663754 ) ( CLEAR ?auto_663748 ) ( not ( = ?auto_663746 ?auto_663754 ) ) ( not ( = ?auto_663748 ?auto_663754 ) ) ( not ( = ?auto_663747 ?auto_663754 ) ) ( SURFACE-AT ?auto_663747 ?auto_663751 ) ( CLEAR ?auto_663747 ) ( IS-CRATE ?auto_663746 ) ( AVAILABLE ?auto_663750 ) ( TRUCK-AT ?auto_663753 ?auto_663755 ) ( AVAILABLE ?auto_663749 ) ( SURFACE-AT ?auto_663746 ?auto_663755 ) ( ON ?auto_663746 ?auto_663752 ) ( CLEAR ?auto_663746 ) ( not ( = ?auto_663746 ?auto_663752 ) ) ( not ( = ?auto_663748 ?auto_663752 ) ) ( not ( = ?auto_663747 ?auto_663752 ) ) ( not ( = ?auto_663754 ?auto_663752 ) ) ( ON ?auto_663744 ?auto_663743 ) ( ON ?auto_663745 ?auto_663744 ) ( ON ?auto_663747 ?auto_663745 ) ( not ( = ?auto_663743 ?auto_663744 ) ) ( not ( = ?auto_663743 ?auto_663745 ) ) ( not ( = ?auto_663743 ?auto_663747 ) ) ( not ( = ?auto_663743 ?auto_663746 ) ) ( not ( = ?auto_663743 ?auto_663748 ) ) ( not ( = ?auto_663743 ?auto_663754 ) ) ( not ( = ?auto_663743 ?auto_663752 ) ) ( not ( = ?auto_663744 ?auto_663745 ) ) ( not ( = ?auto_663744 ?auto_663747 ) ) ( not ( = ?auto_663744 ?auto_663746 ) ) ( not ( = ?auto_663744 ?auto_663748 ) ) ( not ( = ?auto_663744 ?auto_663754 ) ) ( not ( = ?auto_663744 ?auto_663752 ) ) ( not ( = ?auto_663745 ?auto_663747 ) ) ( not ( = ?auto_663745 ?auto_663746 ) ) ( not ( = ?auto_663745 ?auto_663748 ) ) ( not ( = ?auto_663745 ?auto_663754 ) ) ( not ( = ?auto_663745 ?auto_663752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663747 ?auto_663746 ?auto_663748 )
      ( MAKE-5CRATE-VERIFY ?auto_663743 ?auto_663744 ?auto_663745 ?auto_663747 ?auto_663746 ?auto_663748 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_663756 - SURFACE
      ?auto_663757 - SURFACE
      ?auto_663758 - SURFACE
      ?auto_663760 - SURFACE
      ?auto_663759 - SURFACE
      ?auto_663761 - SURFACE
      ?auto_663762 - SURFACE
    )
    :vars
    (
      ?auto_663764 - HOIST
      ?auto_663765 - PLACE
      ?auto_663769 - PLACE
      ?auto_663763 - HOIST
      ?auto_663768 - SURFACE
      ?auto_663767 - TRUCK
      ?auto_663766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663764 ?auto_663765 ) ( IS-CRATE ?auto_663762 ) ( not ( = ?auto_663761 ?auto_663762 ) ) ( not ( = ?auto_663759 ?auto_663761 ) ) ( not ( = ?auto_663759 ?auto_663762 ) ) ( not ( = ?auto_663769 ?auto_663765 ) ) ( HOIST-AT ?auto_663763 ?auto_663769 ) ( not ( = ?auto_663764 ?auto_663763 ) ) ( SURFACE-AT ?auto_663762 ?auto_663769 ) ( ON ?auto_663762 ?auto_663768 ) ( CLEAR ?auto_663762 ) ( not ( = ?auto_663761 ?auto_663768 ) ) ( not ( = ?auto_663762 ?auto_663768 ) ) ( not ( = ?auto_663759 ?auto_663768 ) ) ( SURFACE-AT ?auto_663759 ?auto_663765 ) ( CLEAR ?auto_663759 ) ( IS-CRATE ?auto_663761 ) ( AVAILABLE ?auto_663764 ) ( TRUCK-AT ?auto_663767 ?auto_663769 ) ( AVAILABLE ?auto_663763 ) ( SURFACE-AT ?auto_663761 ?auto_663769 ) ( ON ?auto_663761 ?auto_663766 ) ( CLEAR ?auto_663761 ) ( not ( = ?auto_663761 ?auto_663766 ) ) ( not ( = ?auto_663762 ?auto_663766 ) ) ( not ( = ?auto_663759 ?auto_663766 ) ) ( not ( = ?auto_663768 ?auto_663766 ) ) ( ON ?auto_663757 ?auto_663756 ) ( ON ?auto_663758 ?auto_663757 ) ( ON ?auto_663760 ?auto_663758 ) ( ON ?auto_663759 ?auto_663760 ) ( not ( = ?auto_663756 ?auto_663757 ) ) ( not ( = ?auto_663756 ?auto_663758 ) ) ( not ( = ?auto_663756 ?auto_663760 ) ) ( not ( = ?auto_663756 ?auto_663759 ) ) ( not ( = ?auto_663756 ?auto_663761 ) ) ( not ( = ?auto_663756 ?auto_663762 ) ) ( not ( = ?auto_663756 ?auto_663768 ) ) ( not ( = ?auto_663756 ?auto_663766 ) ) ( not ( = ?auto_663757 ?auto_663758 ) ) ( not ( = ?auto_663757 ?auto_663760 ) ) ( not ( = ?auto_663757 ?auto_663759 ) ) ( not ( = ?auto_663757 ?auto_663761 ) ) ( not ( = ?auto_663757 ?auto_663762 ) ) ( not ( = ?auto_663757 ?auto_663768 ) ) ( not ( = ?auto_663757 ?auto_663766 ) ) ( not ( = ?auto_663758 ?auto_663760 ) ) ( not ( = ?auto_663758 ?auto_663759 ) ) ( not ( = ?auto_663758 ?auto_663761 ) ) ( not ( = ?auto_663758 ?auto_663762 ) ) ( not ( = ?auto_663758 ?auto_663768 ) ) ( not ( = ?auto_663758 ?auto_663766 ) ) ( not ( = ?auto_663760 ?auto_663759 ) ) ( not ( = ?auto_663760 ?auto_663761 ) ) ( not ( = ?auto_663760 ?auto_663762 ) ) ( not ( = ?auto_663760 ?auto_663768 ) ) ( not ( = ?auto_663760 ?auto_663766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663759 ?auto_663761 ?auto_663762 )
      ( MAKE-6CRATE-VERIFY ?auto_663756 ?auto_663757 ?auto_663758 ?auto_663760 ?auto_663759 ?auto_663761 ?auto_663762 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_663770 - SURFACE
      ?auto_663771 - SURFACE
      ?auto_663772 - SURFACE
      ?auto_663774 - SURFACE
      ?auto_663773 - SURFACE
      ?auto_663775 - SURFACE
      ?auto_663776 - SURFACE
      ?auto_663777 - SURFACE
    )
    :vars
    (
      ?auto_663779 - HOIST
      ?auto_663780 - PLACE
      ?auto_663784 - PLACE
      ?auto_663778 - HOIST
      ?auto_663783 - SURFACE
      ?auto_663782 - TRUCK
      ?auto_663781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663779 ?auto_663780 ) ( IS-CRATE ?auto_663777 ) ( not ( = ?auto_663776 ?auto_663777 ) ) ( not ( = ?auto_663775 ?auto_663776 ) ) ( not ( = ?auto_663775 ?auto_663777 ) ) ( not ( = ?auto_663784 ?auto_663780 ) ) ( HOIST-AT ?auto_663778 ?auto_663784 ) ( not ( = ?auto_663779 ?auto_663778 ) ) ( SURFACE-AT ?auto_663777 ?auto_663784 ) ( ON ?auto_663777 ?auto_663783 ) ( CLEAR ?auto_663777 ) ( not ( = ?auto_663776 ?auto_663783 ) ) ( not ( = ?auto_663777 ?auto_663783 ) ) ( not ( = ?auto_663775 ?auto_663783 ) ) ( SURFACE-AT ?auto_663775 ?auto_663780 ) ( CLEAR ?auto_663775 ) ( IS-CRATE ?auto_663776 ) ( AVAILABLE ?auto_663779 ) ( TRUCK-AT ?auto_663782 ?auto_663784 ) ( AVAILABLE ?auto_663778 ) ( SURFACE-AT ?auto_663776 ?auto_663784 ) ( ON ?auto_663776 ?auto_663781 ) ( CLEAR ?auto_663776 ) ( not ( = ?auto_663776 ?auto_663781 ) ) ( not ( = ?auto_663777 ?auto_663781 ) ) ( not ( = ?auto_663775 ?auto_663781 ) ) ( not ( = ?auto_663783 ?auto_663781 ) ) ( ON ?auto_663771 ?auto_663770 ) ( ON ?auto_663772 ?auto_663771 ) ( ON ?auto_663774 ?auto_663772 ) ( ON ?auto_663773 ?auto_663774 ) ( ON ?auto_663775 ?auto_663773 ) ( not ( = ?auto_663770 ?auto_663771 ) ) ( not ( = ?auto_663770 ?auto_663772 ) ) ( not ( = ?auto_663770 ?auto_663774 ) ) ( not ( = ?auto_663770 ?auto_663773 ) ) ( not ( = ?auto_663770 ?auto_663775 ) ) ( not ( = ?auto_663770 ?auto_663776 ) ) ( not ( = ?auto_663770 ?auto_663777 ) ) ( not ( = ?auto_663770 ?auto_663783 ) ) ( not ( = ?auto_663770 ?auto_663781 ) ) ( not ( = ?auto_663771 ?auto_663772 ) ) ( not ( = ?auto_663771 ?auto_663774 ) ) ( not ( = ?auto_663771 ?auto_663773 ) ) ( not ( = ?auto_663771 ?auto_663775 ) ) ( not ( = ?auto_663771 ?auto_663776 ) ) ( not ( = ?auto_663771 ?auto_663777 ) ) ( not ( = ?auto_663771 ?auto_663783 ) ) ( not ( = ?auto_663771 ?auto_663781 ) ) ( not ( = ?auto_663772 ?auto_663774 ) ) ( not ( = ?auto_663772 ?auto_663773 ) ) ( not ( = ?auto_663772 ?auto_663775 ) ) ( not ( = ?auto_663772 ?auto_663776 ) ) ( not ( = ?auto_663772 ?auto_663777 ) ) ( not ( = ?auto_663772 ?auto_663783 ) ) ( not ( = ?auto_663772 ?auto_663781 ) ) ( not ( = ?auto_663774 ?auto_663773 ) ) ( not ( = ?auto_663774 ?auto_663775 ) ) ( not ( = ?auto_663774 ?auto_663776 ) ) ( not ( = ?auto_663774 ?auto_663777 ) ) ( not ( = ?auto_663774 ?auto_663783 ) ) ( not ( = ?auto_663774 ?auto_663781 ) ) ( not ( = ?auto_663773 ?auto_663775 ) ) ( not ( = ?auto_663773 ?auto_663776 ) ) ( not ( = ?auto_663773 ?auto_663777 ) ) ( not ( = ?auto_663773 ?auto_663783 ) ) ( not ( = ?auto_663773 ?auto_663781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663775 ?auto_663776 ?auto_663777 )
      ( MAKE-7CRATE-VERIFY ?auto_663770 ?auto_663771 ?auto_663772 ?auto_663774 ?auto_663773 ?auto_663775 ?auto_663776 ?auto_663777 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_663785 - SURFACE
      ?auto_663786 - SURFACE
      ?auto_663787 - SURFACE
      ?auto_663789 - SURFACE
      ?auto_663788 - SURFACE
      ?auto_663790 - SURFACE
      ?auto_663791 - SURFACE
      ?auto_663792 - SURFACE
      ?auto_663793 - SURFACE
    )
    :vars
    (
      ?auto_663795 - HOIST
      ?auto_663796 - PLACE
      ?auto_663800 - PLACE
      ?auto_663794 - HOIST
      ?auto_663799 - SURFACE
      ?auto_663798 - TRUCK
      ?auto_663797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663795 ?auto_663796 ) ( IS-CRATE ?auto_663793 ) ( not ( = ?auto_663792 ?auto_663793 ) ) ( not ( = ?auto_663791 ?auto_663792 ) ) ( not ( = ?auto_663791 ?auto_663793 ) ) ( not ( = ?auto_663800 ?auto_663796 ) ) ( HOIST-AT ?auto_663794 ?auto_663800 ) ( not ( = ?auto_663795 ?auto_663794 ) ) ( SURFACE-AT ?auto_663793 ?auto_663800 ) ( ON ?auto_663793 ?auto_663799 ) ( CLEAR ?auto_663793 ) ( not ( = ?auto_663792 ?auto_663799 ) ) ( not ( = ?auto_663793 ?auto_663799 ) ) ( not ( = ?auto_663791 ?auto_663799 ) ) ( SURFACE-AT ?auto_663791 ?auto_663796 ) ( CLEAR ?auto_663791 ) ( IS-CRATE ?auto_663792 ) ( AVAILABLE ?auto_663795 ) ( TRUCK-AT ?auto_663798 ?auto_663800 ) ( AVAILABLE ?auto_663794 ) ( SURFACE-AT ?auto_663792 ?auto_663800 ) ( ON ?auto_663792 ?auto_663797 ) ( CLEAR ?auto_663792 ) ( not ( = ?auto_663792 ?auto_663797 ) ) ( not ( = ?auto_663793 ?auto_663797 ) ) ( not ( = ?auto_663791 ?auto_663797 ) ) ( not ( = ?auto_663799 ?auto_663797 ) ) ( ON ?auto_663786 ?auto_663785 ) ( ON ?auto_663787 ?auto_663786 ) ( ON ?auto_663789 ?auto_663787 ) ( ON ?auto_663788 ?auto_663789 ) ( ON ?auto_663790 ?auto_663788 ) ( ON ?auto_663791 ?auto_663790 ) ( not ( = ?auto_663785 ?auto_663786 ) ) ( not ( = ?auto_663785 ?auto_663787 ) ) ( not ( = ?auto_663785 ?auto_663789 ) ) ( not ( = ?auto_663785 ?auto_663788 ) ) ( not ( = ?auto_663785 ?auto_663790 ) ) ( not ( = ?auto_663785 ?auto_663791 ) ) ( not ( = ?auto_663785 ?auto_663792 ) ) ( not ( = ?auto_663785 ?auto_663793 ) ) ( not ( = ?auto_663785 ?auto_663799 ) ) ( not ( = ?auto_663785 ?auto_663797 ) ) ( not ( = ?auto_663786 ?auto_663787 ) ) ( not ( = ?auto_663786 ?auto_663789 ) ) ( not ( = ?auto_663786 ?auto_663788 ) ) ( not ( = ?auto_663786 ?auto_663790 ) ) ( not ( = ?auto_663786 ?auto_663791 ) ) ( not ( = ?auto_663786 ?auto_663792 ) ) ( not ( = ?auto_663786 ?auto_663793 ) ) ( not ( = ?auto_663786 ?auto_663799 ) ) ( not ( = ?auto_663786 ?auto_663797 ) ) ( not ( = ?auto_663787 ?auto_663789 ) ) ( not ( = ?auto_663787 ?auto_663788 ) ) ( not ( = ?auto_663787 ?auto_663790 ) ) ( not ( = ?auto_663787 ?auto_663791 ) ) ( not ( = ?auto_663787 ?auto_663792 ) ) ( not ( = ?auto_663787 ?auto_663793 ) ) ( not ( = ?auto_663787 ?auto_663799 ) ) ( not ( = ?auto_663787 ?auto_663797 ) ) ( not ( = ?auto_663789 ?auto_663788 ) ) ( not ( = ?auto_663789 ?auto_663790 ) ) ( not ( = ?auto_663789 ?auto_663791 ) ) ( not ( = ?auto_663789 ?auto_663792 ) ) ( not ( = ?auto_663789 ?auto_663793 ) ) ( not ( = ?auto_663789 ?auto_663799 ) ) ( not ( = ?auto_663789 ?auto_663797 ) ) ( not ( = ?auto_663788 ?auto_663790 ) ) ( not ( = ?auto_663788 ?auto_663791 ) ) ( not ( = ?auto_663788 ?auto_663792 ) ) ( not ( = ?auto_663788 ?auto_663793 ) ) ( not ( = ?auto_663788 ?auto_663799 ) ) ( not ( = ?auto_663788 ?auto_663797 ) ) ( not ( = ?auto_663790 ?auto_663791 ) ) ( not ( = ?auto_663790 ?auto_663792 ) ) ( not ( = ?auto_663790 ?auto_663793 ) ) ( not ( = ?auto_663790 ?auto_663799 ) ) ( not ( = ?auto_663790 ?auto_663797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663791 ?auto_663792 ?auto_663793 )
      ( MAKE-8CRATE-VERIFY ?auto_663785 ?auto_663786 ?auto_663787 ?auto_663789 ?auto_663788 ?auto_663790 ?auto_663791 ?auto_663792 ?auto_663793 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_663801 - SURFACE
      ?auto_663802 - SURFACE
      ?auto_663803 - SURFACE
      ?auto_663805 - SURFACE
      ?auto_663804 - SURFACE
      ?auto_663806 - SURFACE
      ?auto_663807 - SURFACE
      ?auto_663808 - SURFACE
      ?auto_663809 - SURFACE
      ?auto_663810 - SURFACE
    )
    :vars
    (
      ?auto_663812 - HOIST
      ?auto_663813 - PLACE
      ?auto_663817 - PLACE
      ?auto_663811 - HOIST
      ?auto_663816 - SURFACE
      ?auto_663815 - TRUCK
      ?auto_663814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663812 ?auto_663813 ) ( IS-CRATE ?auto_663810 ) ( not ( = ?auto_663809 ?auto_663810 ) ) ( not ( = ?auto_663808 ?auto_663809 ) ) ( not ( = ?auto_663808 ?auto_663810 ) ) ( not ( = ?auto_663817 ?auto_663813 ) ) ( HOIST-AT ?auto_663811 ?auto_663817 ) ( not ( = ?auto_663812 ?auto_663811 ) ) ( SURFACE-AT ?auto_663810 ?auto_663817 ) ( ON ?auto_663810 ?auto_663816 ) ( CLEAR ?auto_663810 ) ( not ( = ?auto_663809 ?auto_663816 ) ) ( not ( = ?auto_663810 ?auto_663816 ) ) ( not ( = ?auto_663808 ?auto_663816 ) ) ( SURFACE-AT ?auto_663808 ?auto_663813 ) ( CLEAR ?auto_663808 ) ( IS-CRATE ?auto_663809 ) ( AVAILABLE ?auto_663812 ) ( TRUCK-AT ?auto_663815 ?auto_663817 ) ( AVAILABLE ?auto_663811 ) ( SURFACE-AT ?auto_663809 ?auto_663817 ) ( ON ?auto_663809 ?auto_663814 ) ( CLEAR ?auto_663809 ) ( not ( = ?auto_663809 ?auto_663814 ) ) ( not ( = ?auto_663810 ?auto_663814 ) ) ( not ( = ?auto_663808 ?auto_663814 ) ) ( not ( = ?auto_663816 ?auto_663814 ) ) ( ON ?auto_663802 ?auto_663801 ) ( ON ?auto_663803 ?auto_663802 ) ( ON ?auto_663805 ?auto_663803 ) ( ON ?auto_663804 ?auto_663805 ) ( ON ?auto_663806 ?auto_663804 ) ( ON ?auto_663807 ?auto_663806 ) ( ON ?auto_663808 ?auto_663807 ) ( not ( = ?auto_663801 ?auto_663802 ) ) ( not ( = ?auto_663801 ?auto_663803 ) ) ( not ( = ?auto_663801 ?auto_663805 ) ) ( not ( = ?auto_663801 ?auto_663804 ) ) ( not ( = ?auto_663801 ?auto_663806 ) ) ( not ( = ?auto_663801 ?auto_663807 ) ) ( not ( = ?auto_663801 ?auto_663808 ) ) ( not ( = ?auto_663801 ?auto_663809 ) ) ( not ( = ?auto_663801 ?auto_663810 ) ) ( not ( = ?auto_663801 ?auto_663816 ) ) ( not ( = ?auto_663801 ?auto_663814 ) ) ( not ( = ?auto_663802 ?auto_663803 ) ) ( not ( = ?auto_663802 ?auto_663805 ) ) ( not ( = ?auto_663802 ?auto_663804 ) ) ( not ( = ?auto_663802 ?auto_663806 ) ) ( not ( = ?auto_663802 ?auto_663807 ) ) ( not ( = ?auto_663802 ?auto_663808 ) ) ( not ( = ?auto_663802 ?auto_663809 ) ) ( not ( = ?auto_663802 ?auto_663810 ) ) ( not ( = ?auto_663802 ?auto_663816 ) ) ( not ( = ?auto_663802 ?auto_663814 ) ) ( not ( = ?auto_663803 ?auto_663805 ) ) ( not ( = ?auto_663803 ?auto_663804 ) ) ( not ( = ?auto_663803 ?auto_663806 ) ) ( not ( = ?auto_663803 ?auto_663807 ) ) ( not ( = ?auto_663803 ?auto_663808 ) ) ( not ( = ?auto_663803 ?auto_663809 ) ) ( not ( = ?auto_663803 ?auto_663810 ) ) ( not ( = ?auto_663803 ?auto_663816 ) ) ( not ( = ?auto_663803 ?auto_663814 ) ) ( not ( = ?auto_663805 ?auto_663804 ) ) ( not ( = ?auto_663805 ?auto_663806 ) ) ( not ( = ?auto_663805 ?auto_663807 ) ) ( not ( = ?auto_663805 ?auto_663808 ) ) ( not ( = ?auto_663805 ?auto_663809 ) ) ( not ( = ?auto_663805 ?auto_663810 ) ) ( not ( = ?auto_663805 ?auto_663816 ) ) ( not ( = ?auto_663805 ?auto_663814 ) ) ( not ( = ?auto_663804 ?auto_663806 ) ) ( not ( = ?auto_663804 ?auto_663807 ) ) ( not ( = ?auto_663804 ?auto_663808 ) ) ( not ( = ?auto_663804 ?auto_663809 ) ) ( not ( = ?auto_663804 ?auto_663810 ) ) ( not ( = ?auto_663804 ?auto_663816 ) ) ( not ( = ?auto_663804 ?auto_663814 ) ) ( not ( = ?auto_663806 ?auto_663807 ) ) ( not ( = ?auto_663806 ?auto_663808 ) ) ( not ( = ?auto_663806 ?auto_663809 ) ) ( not ( = ?auto_663806 ?auto_663810 ) ) ( not ( = ?auto_663806 ?auto_663816 ) ) ( not ( = ?auto_663806 ?auto_663814 ) ) ( not ( = ?auto_663807 ?auto_663808 ) ) ( not ( = ?auto_663807 ?auto_663809 ) ) ( not ( = ?auto_663807 ?auto_663810 ) ) ( not ( = ?auto_663807 ?auto_663816 ) ) ( not ( = ?auto_663807 ?auto_663814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663808 ?auto_663809 ?auto_663810 )
      ( MAKE-9CRATE-VERIFY ?auto_663801 ?auto_663802 ?auto_663803 ?auto_663805 ?auto_663804 ?auto_663806 ?auto_663807 ?auto_663808 ?auto_663809 ?auto_663810 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663818 - SURFACE
      ?auto_663819 - SURFACE
      ?auto_663820 - SURFACE
      ?auto_663822 - SURFACE
      ?auto_663821 - SURFACE
      ?auto_663823 - SURFACE
      ?auto_663824 - SURFACE
      ?auto_663825 - SURFACE
      ?auto_663826 - SURFACE
      ?auto_663827 - SURFACE
      ?auto_663828 - SURFACE
    )
    :vars
    (
      ?auto_663830 - HOIST
      ?auto_663831 - PLACE
      ?auto_663835 - PLACE
      ?auto_663829 - HOIST
      ?auto_663834 - SURFACE
      ?auto_663833 - TRUCK
      ?auto_663832 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663830 ?auto_663831 ) ( IS-CRATE ?auto_663828 ) ( not ( = ?auto_663827 ?auto_663828 ) ) ( not ( = ?auto_663826 ?auto_663827 ) ) ( not ( = ?auto_663826 ?auto_663828 ) ) ( not ( = ?auto_663835 ?auto_663831 ) ) ( HOIST-AT ?auto_663829 ?auto_663835 ) ( not ( = ?auto_663830 ?auto_663829 ) ) ( SURFACE-AT ?auto_663828 ?auto_663835 ) ( ON ?auto_663828 ?auto_663834 ) ( CLEAR ?auto_663828 ) ( not ( = ?auto_663827 ?auto_663834 ) ) ( not ( = ?auto_663828 ?auto_663834 ) ) ( not ( = ?auto_663826 ?auto_663834 ) ) ( SURFACE-AT ?auto_663826 ?auto_663831 ) ( CLEAR ?auto_663826 ) ( IS-CRATE ?auto_663827 ) ( AVAILABLE ?auto_663830 ) ( TRUCK-AT ?auto_663833 ?auto_663835 ) ( AVAILABLE ?auto_663829 ) ( SURFACE-AT ?auto_663827 ?auto_663835 ) ( ON ?auto_663827 ?auto_663832 ) ( CLEAR ?auto_663827 ) ( not ( = ?auto_663827 ?auto_663832 ) ) ( not ( = ?auto_663828 ?auto_663832 ) ) ( not ( = ?auto_663826 ?auto_663832 ) ) ( not ( = ?auto_663834 ?auto_663832 ) ) ( ON ?auto_663819 ?auto_663818 ) ( ON ?auto_663820 ?auto_663819 ) ( ON ?auto_663822 ?auto_663820 ) ( ON ?auto_663821 ?auto_663822 ) ( ON ?auto_663823 ?auto_663821 ) ( ON ?auto_663824 ?auto_663823 ) ( ON ?auto_663825 ?auto_663824 ) ( ON ?auto_663826 ?auto_663825 ) ( not ( = ?auto_663818 ?auto_663819 ) ) ( not ( = ?auto_663818 ?auto_663820 ) ) ( not ( = ?auto_663818 ?auto_663822 ) ) ( not ( = ?auto_663818 ?auto_663821 ) ) ( not ( = ?auto_663818 ?auto_663823 ) ) ( not ( = ?auto_663818 ?auto_663824 ) ) ( not ( = ?auto_663818 ?auto_663825 ) ) ( not ( = ?auto_663818 ?auto_663826 ) ) ( not ( = ?auto_663818 ?auto_663827 ) ) ( not ( = ?auto_663818 ?auto_663828 ) ) ( not ( = ?auto_663818 ?auto_663834 ) ) ( not ( = ?auto_663818 ?auto_663832 ) ) ( not ( = ?auto_663819 ?auto_663820 ) ) ( not ( = ?auto_663819 ?auto_663822 ) ) ( not ( = ?auto_663819 ?auto_663821 ) ) ( not ( = ?auto_663819 ?auto_663823 ) ) ( not ( = ?auto_663819 ?auto_663824 ) ) ( not ( = ?auto_663819 ?auto_663825 ) ) ( not ( = ?auto_663819 ?auto_663826 ) ) ( not ( = ?auto_663819 ?auto_663827 ) ) ( not ( = ?auto_663819 ?auto_663828 ) ) ( not ( = ?auto_663819 ?auto_663834 ) ) ( not ( = ?auto_663819 ?auto_663832 ) ) ( not ( = ?auto_663820 ?auto_663822 ) ) ( not ( = ?auto_663820 ?auto_663821 ) ) ( not ( = ?auto_663820 ?auto_663823 ) ) ( not ( = ?auto_663820 ?auto_663824 ) ) ( not ( = ?auto_663820 ?auto_663825 ) ) ( not ( = ?auto_663820 ?auto_663826 ) ) ( not ( = ?auto_663820 ?auto_663827 ) ) ( not ( = ?auto_663820 ?auto_663828 ) ) ( not ( = ?auto_663820 ?auto_663834 ) ) ( not ( = ?auto_663820 ?auto_663832 ) ) ( not ( = ?auto_663822 ?auto_663821 ) ) ( not ( = ?auto_663822 ?auto_663823 ) ) ( not ( = ?auto_663822 ?auto_663824 ) ) ( not ( = ?auto_663822 ?auto_663825 ) ) ( not ( = ?auto_663822 ?auto_663826 ) ) ( not ( = ?auto_663822 ?auto_663827 ) ) ( not ( = ?auto_663822 ?auto_663828 ) ) ( not ( = ?auto_663822 ?auto_663834 ) ) ( not ( = ?auto_663822 ?auto_663832 ) ) ( not ( = ?auto_663821 ?auto_663823 ) ) ( not ( = ?auto_663821 ?auto_663824 ) ) ( not ( = ?auto_663821 ?auto_663825 ) ) ( not ( = ?auto_663821 ?auto_663826 ) ) ( not ( = ?auto_663821 ?auto_663827 ) ) ( not ( = ?auto_663821 ?auto_663828 ) ) ( not ( = ?auto_663821 ?auto_663834 ) ) ( not ( = ?auto_663821 ?auto_663832 ) ) ( not ( = ?auto_663823 ?auto_663824 ) ) ( not ( = ?auto_663823 ?auto_663825 ) ) ( not ( = ?auto_663823 ?auto_663826 ) ) ( not ( = ?auto_663823 ?auto_663827 ) ) ( not ( = ?auto_663823 ?auto_663828 ) ) ( not ( = ?auto_663823 ?auto_663834 ) ) ( not ( = ?auto_663823 ?auto_663832 ) ) ( not ( = ?auto_663824 ?auto_663825 ) ) ( not ( = ?auto_663824 ?auto_663826 ) ) ( not ( = ?auto_663824 ?auto_663827 ) ) ( not ( = ?auto_663824 ?auto_663828 ) ) ( not ( = ?auto_663824 ?auto_663834 ) ) ( not ( = ?auto_663824 ?auto_663832 ) ) ( not ( = ?auto_663825 ?auto_663826 ) ) ( not ( = ?auto_663825 ?auto_663827 ) ) ( not ( = ?auto_663825 ?auto_663828 ) ) ( not ( = ?auto_663825 ?auto_663834 ) ) ( not ( = ?auto_663825 ?auto_663832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663826 ?auto_663827 ?auto_663828 )
      ( MAKE-10CRATE-VERIFY ?auto_663818 ?auto_663819 ?auto_663820 ?auto_663822 ?auto_663821 ?auto_663823 ?auto_663824 ?auto_663825 ?auto_663826 ?auto_663827 ?auto_663828 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_663856 - SURFACE
      ?auto_663857 - SURFACE
      ?auto_663858 - SURFACE
      ?auto_663859 - SURFACE
    )
    :vars
    (
      ?auto_663863 - HOIST
      ?auto_663864 - PLACE
      ?auto_663865 - PLACE
      ?auto_663866 - HOIST
      ?auto_663862 - SURFACE
      ?auto_663860 - SURFACE
      ?auto_663861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663863 ?auto_663864 ) ( IS-CRATE ?auto_663859 ) ( not ( = ?auto_663858 ?auto_663859 ) ) ( not ( = ?auto_663857 ?auto_663858 ) ) ( not ( = ?auto_663857 ?auto_663859 ) ) ( not ( = ?auto_663865 ?auto_663864 ) ) ( HOIST-AT ?auto_663866 ?auto_663865 ) ( not ( = ?auto_663863 ?auto_663866 ) ) ( SURFACE-AT ?auto_663859 ?auto_663865 ) ( ON ?auto_663859 ?auto_663862 ) ( CLEAR ?auto_663859 ) ( not ( = ?auto_663858 ?auto_663862 ) ) ( not ( = ?auto_663859 ?auto_663862 ) ) ( not ( = ?auto_663857 ?auto_663862 ) ) ( SURFACE-AT ?auto_663857 ?auto_663864 ) ( CLEAR ?auto_663857 ) ( IS-CRATE ?auto_663858 ) ( AVAILABLE ?auto_663863 ) ( AVAILABLE ?auto_663866 ) ( SURFACE-AT ?auto_663858 ?auto_663865 ) ( ON ?auto_663858 ?auto_663860 ) ( CLEAR ?auto_663858 ) ( not ( = ?auto_663858 ?auto_663860 ) ) ( not ( = ?auto_663859 ?auto_663860 ) ) ( not ( = ?auto_663857 ?auto_663860 ) ) ( not ( = ?auto_663862 ?auto_663860 ) ) ( TRUCK-AT ?auto_663861 ?auto_663864 ) ( ON ?auto_663857 ?auto_663856 ) ( not ( = ?auto_663856 ?auto_663857 ) ) ( not ( = ?auto_663856 ?auto_663858 ) ) ( not ( = ?auto_663856 ?auto_663859 ) ) ( not ( = ?auto_663856 ?auto_663862 ) ) ( not ( = ?auto_663856 ?auto_663860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663857 ?auto_663858 ?auto_663859 )
      ( MAKE-3CRATE-VERIFY ?auto_663856 ?auto_663857 ?auto_663858 ?auto_663859 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_663867 - SURFACE
      ?auto_663868 - SURFACE
      ?auto_663869 - SURFACE
      ?auto_663871 - SURFACE
      ?auto_663870 - SURFACE
    )
    :vars
    (
      ?auto_663875 - HOIST
      ?auto_663876 - PLACE
      ?auto_663877 - PLACE
      ?auto_663878 - HOIST
      ?auto_663874 - SURFACE
      ?auto_663872 - SURFACE
      ?auto_663873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663875 ?auto_663876 ) ( IS-CRATE ?auto_663870 ) ( not ( = ?auto_663871 ?auto_663870 ) ) ( not ( = ?auto_663869 ?auto_663871 ) ) ( not ( = ?auto_663869 ?auto_663870 ) ) ( not ( = ?auto_663877 ?auto_663876 ) ) ( HOIST-AT ?auto_663878 ?auto_663877 ) ( not ( = ?auto_663875 ?auto_663878 ) ) ( SURFACE-AT ?auto_663870 ?auto_663877 ) ( ON ?auto_663870 ?auto_663874 ) ( CLEAR ?auto_663870 ) ( not ( = ?auto_663871 ?auto_663874 ) ) ( not ( = ?auto_663870 ?auto_663874 ) ) ( not ( = ?auto_663869 ?auto_663874 ) ) ( SURFACE-AT ?auto_663869 ?auto_663876 ) ( CLEAR ?auto_663869 ) ( IS-CRATE ?auto_663871 ) ( AVAILABLE ?auto_663875 ) ( AVAILABLE ?auto_663878 ) ( SURFACE-AT ?auto_663871 ?auto_663877 ) ( ON ?auto_663871 ?auto_663872 ) ( CLEAR ?auto_663871 ) ( not ( = ?auto_663871 ?auto_663872 ) ) ( not ( = ?auto_663870 ?auto_663872 ) ) ( not ( = ?auto_663869 ?auto_663872 ) ) ( not ( = ?auto_663874 ?auto_663872 ) ) ( TRUCK-AT ?auto_663873 ?auto_663876 ) ( ON ?auto_663868 ?auto_663867 ) ( ON ?auto_663869 ?auto_663868 ) ( not ( = ?auto_663867 ?auto_663868 ) ) ( not ( = ?auto_663867 ?auto_663869 ) ) ( not ( = ?auto_663867 ?auto_663871 ) ) ( not ( = ?auto_663867 ?auto_663870 ) ) ( not ( = ?auto_663867 ?auto_663874 ) ) ( not ( = ?auto_663867 ?auto_663872 ) ) ( not ( = ?auto_663868 ?auto_663869 ) ) ( not ( = ?auto_663868 ?auto_663871 ) ) ( not ( = ?auto_663868 ?auto_663870 ) ) ( not ( = ?auto_663868 ?auto_663874 ) ) ( not ( = ?auto_663868 ?auto_663872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663869 ?auto_663871 ?auto_663870 )
      ( MAKE-4CRATE-VERIFY ?auto_663867 ?auto_663868 ?auto_663869 ?auto_663871 ?auto_663870 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_663879 - SURFACE
      ?auto_663880 - SURFACE
      ?auto_663881 - SURFACE
      ?auto_663883 - SURFACE
      ?auto_663882 - SURFACE
      ?auto_663884 - SURFACE
    )
    :vars
    (
      ?auto_663888 - HOIST
      ?auto_663889 - PLACE
      ?auto_663890 - PLACE
      ?auto_663891 - HOIST
      ?auto_663887 - SURFACE
      ?auto_663885 - SURFACE
      ?auto_663886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663888 ?auto_663889 ) ( IS-CRATE ?auto_663884 ) ( not ( = ?auto_663882 ?auto_663884 ) ) ( not ( = ?auto_663883 ?auto_663882 ) ) ( not ( = ?auto_663883 ?auto_663884 ) ) ( not ( = ?auto_663890 ?auto_663889 ) ) ( HOIST-AT ?auto_663891 ?auto_663890 ) ( not ( = ?auto_663888 ?auto_663891 ) ) ( SURFACE-AT ?auto_663884 ?auto_663890 ) ( ON ?auto_663884 ?auto_663887 ) ( CLEAR ?auto_663884 ) ( not ( = ?auto_663882 ?auto_663887 ) ) ( not ( = ?auto_663884 ?auto_663887 ) ) ( not ( = ?auto_663883 ?auto_663887 ) ) ( SURFACE-AT ?auto_663883 ?auto_663889 ) ( CLEAR ?auto_663883 ) ( IS-CRATE ?auto_663882 ) ( AVAILABLE ?auto_663888 ) ( AVAILABLE ?auto_663891 ) ( SURFACE-AT ?auto_663882 ?auto_663890 ) ( ON ?auto_663882 ?auto_663885 ) ( CLEAR ?auto_663882 ) ( not ( = ?auto_663882 ?auto_663885 ) ) ( not ( = ?auto_663884 ?auto_663885 ) ) ( not ( = ?auto_663883 ?auto_663885 ) ) ( not ( = ?auto_663887 ?auto_663885 ) ) ( TRUCK-AT ?auto_663886 ?auto_663889 ) ( ON ?auto_663880 ?auto_663879 ) ( ON ?auto_663881 ?auto_663880 ) ( ON ?auto_663883 ?auto_663881 ) ( not ( = ?auto_663879 ?auto_663880 ) ) ( not ( = ?auto_663879 ?auto_663881 ) ) ( not ( = ?auto_663879 ?auto_663883 ) ) ( not ( = ?auto_663879 ?auto_663882 ) ) ( not ( = ?auto_663879 ?auto_663884 ) ) ( not ( = ?auto_663879 ?auto_663887 ) ) ( not ( = ?auto_663879 ?auto_663885 ) ) ( not ( = ?auto_663880 ?auto_663881 ) ) ( not ( = ?auto_663880 ?auto_663883 ) ) ( not ( = ?auto_663880 ?auto_663882 ) ) ( not ( = ?auto_663880 ?auto_663884 ) ) ( not ( = ?auto_663880 ?auto_663887 ) ) ( not ( = ?auto_663880 ?auto_663885 ) ) ( not ( = ?auto_663881 ?auto_663883 ) ) ( not ( = ?auto_663881 ?auto_663882 ) ) ( not ( = ?auto_663881 ?auto_663884 ) ) ( not ( = ?auto_663881 ?auto_663887 ) ) ( not ( = ?auto_663881 ?auto_663885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663883 ?auto_663882 ?auto_663884 )
      ( MAKE-5CRATE-VERIFY ?auto_663879 ?auto_663880 ?auto_663881 ?auto_663883 ?auto_663882 ?auto_663884 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_663892 - SURFACE
      ?auto_663893 - SURFACE
      ?auto_663894 - SURFACE
      ?auto_663896 - SURFACE
      ?auto_663895 - SURFACE
      ?auto_663897 - SURFACE
      ?auto_663898 - SURFACE
    )
    :vars
    (
      ?auto_663902 - HOIST
      ?auto_663903 - PLACE
      ?auto_663904 - PLACE
      ?auto_663905 - HOIST
      ?auto_663901 - SURFACE
      ?auto_663899 - SURFACE
      ?auto_663900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663902 ?auto_663903 ) ( IS-CRATE ?auto_663898 ) ( not ( = ?auto_663897 ?auto_663898 ) ) ( not ( = ?auto_663895 ?auto_663897 ) ) ( not ( = ?auto_663895 ?auto_663898 ) ) ( not ( = ?auto_663904 ?auto_663903 ) ) ( HOIST-AT ?auto_663905 ?auto_663904 ) ( not ( = ?auto_663902 ?auto_663905 ) ) ( SURFACE-AT ?auto_663898 ?auto_663904 ) ( ON ?auto_663898 ?auto_663901 ) ( CLEAR ?auto_663898 ) ( not ( = ?auto_663897 ?auto_663901 ) ) ( not ( = ?auto_663898 ?auto_663901 ) ) ( not ( = ?auto_663895 ?auto_663901 ) ) ( SURFACE-AT ?auto_663895 ?auto_663903 ) ( CLEAR ?auto_663895 ) ( IS-CRATE ?auto_663897 ) ( AVAILABLE ?auto_663902 ) ( AVAILABLE ?auto_663905 ) ( SURFACE-AT ?auto_663897 ?auto_663904 ) ( ON ?auto_663897 ?auto_663899 ) ( CLEAR ?auto_663897 ) ( not ( = ?auto_663897 ?auto_663899 ) ) ( not ( = ?auto_663898 ?auto_663899 ) ) ( not ( = ?auto_663895 ?auto_663899 ) ) ( not ( = ?auto_663901 ?auto_663899 ) ) ( TRUCK-AT ?auto_663900 ?auto_663903 ) ( ON ?auto_663893 ?auto_663892 ) ( ON ?auto_663894 ?auto_663893 ) ( ON ?auto_663896 ?auto_663894 ) ( ON ?auto_663895 ?auto_663896 ) ( not ( = ?auto_663892 ?auto_663893 ) ) ( not ( = ?auto_663892 ?auto_663894 ) ) ( not ( = ?auto_663892 ?auto_663896 ) ) ( not ( = ?auto_663892 ?auto_663895 ) ) ( not ( = ?auto_663892 ?auto_663897 ) ) ( not ( = ?auto_663892 ?auto_663898 ) ) ( not ( = ?auto_663892 ?auto_663901 ) ) ( not ( = ?auto_663892 ?auto_663899 ) ) ( not ( = ?auto_663893 ?auto_663894 ) ) ( not ( = ?auto_663893 ?auto_663896 ) ) ( not ( = ?auto_663893 ?auto_663895 ) ) ( not ( = ?auto_663893 ?auto_663897 ) ) ( not ( = ?auto_663893 ?auto_663898 ) ) ( not ( = ?auto_663893 ?auto_663901 ) ) ( not ( = ?auto_663893 ?auto_663899 ) ) ( not ( = ?auto_663894 ?auto_663896 ) ) ( not ( = ?auto_663894 ?auto_663895 ) ) ( not ( = ?auto_663894 ?auto_663897 ) ) ( not ( = ?auto_663894 ?auto_663898 ) ) ( not ( = ?auto_663894 ?auto_663901 ) ) ( not ( = ?auto_663894 ?auto_663899 ) ) ( not ( = ?auto_663896 ?auto_663895 ) ) ( not ( = ?auto_663896 ?auto_663897 ) ) ( not ( = ?auto_663896 ?auto_663898 ) ) ( not ( = ?auto_663896 ?auto_663901 ) ) ( not ( = ?auto_663896 ?auto_663899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663895 ?auto_663897 ?auto_663898 )
      ( MAKE-6CRATE-VERIFY ?auto_663892 ?auto_663893 ?auto_663894 ?auto_663896 ?auto_663895 ?auto_663897 ?auto_663898 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_663906 - SURFACE
      ?auto_663907 - SURFACE
      ?auto_663908 - SURFACE
      ?auto_663910 - SURFACE
      ?auto_663909 - SURFACE
      ?auto_663911 - SURFACE
      ?auto_663912 - SURFACE
      ?auto_663913 - SURFACE
    )
    :vars
    (
      ?auto_663917 - HOIST
      ?auto_663918 - PLACE
      ?auto_663919 - PLACE
      ?auto_663920 - HOIST
      ?auto_663916 - SURFACE
      ?auto_663914 - SURFACE
      ?auto_663915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663917 ?auto_663918 ) ( IS-CRATE ?auto_663913 ) ( not ( = ?auto_663912 ?auto_663913 ) ) ( not ( = ?auto_663911 ?auto_663912 ) ) ( not ( = ?auto_663911 ?auto_663913 ) ) ( not ( = ?auto_663919 ?auto_663918 ) ) ( HOIST-AT ?auto_663920 ?auto_663919 ) ( not ( = ?auto_663917 ?auto_663920 ) ) ( SURFACE-AT ?auto_663913 ?auto_663919 ) ( ON ?auto_663913 ?auto_663916 ) ( CLEAR ?auto_663913 ) ( not ( = ?auto_663912 ?auto_663916 ) ) ( not ( = ?auto_663913 ?auto_663916 ) ) ( not ( = ?auto_663911 ?auto_663916 ) ) ( SURFACE-AT ?auto_663911 ?auto_663918 ) ( CLEAR ?auto_663911 ) ( IS-CRATE ?auto_663912 ) ( AVAILABLE ?auto_663917 ) ( AVAILABLE ?auto_663920 ) ( SURFACE-AT ?auto_663912 ?auto_663919 ) ( ON ?auto_663912 ?auto_663914 ) ( CLEAR ?auto_663912 ) ( not ( = ?auto_663912 ?auto_663914 ) ) ( not ( = ?auto_663913 ?auto_663914 ) ) ( not ( = ?auto_663911 ?auto_663914 ) ) ( not ( = ?auto_663916 ?auto_663914 ) ) ( TRUCK-AT ?auto_663915 ?auto_663918 ) ( ON ?auto_663907 ?auto_663906 ) ( ON ?auto_663908 ?auto_663907 ) ( ON ?auto_663910 ?auto_663908 ) ( ON ?auto_663909 ?auto_663910 ) ( ON ?auto_663911 ?auto_663909 ) ( not ( = ?auto_663906 ?auto_663907 ) ) ( not ( = ?auto_663906 ?auto_663908 ) ) ( not ( = ?auto_663906 ?auto_663910 ) ) ( not ( = ?auto_663906 ?auto_663909 ) ) ( not ( = ?auto_663906 ?auto_663911 ) ) ( not ( = ?auto_663906 ?auto_663912 ) ) ( not ( = ?auto_663906 ?auto_663913 ) ) ( not ( = ?auto_663906 ?auto_663916 ) ) ( not ( = ?auto_663906 ?auto_663914 ) ) ( not ( = ?auto_663907 ?auto_663908 ) ) ( not ( = ?auto_663907 ?auto_663910 ) ) ( not ( = ?auto_663907 ?auto_663909 ) ) ( not ( = ?auto_663907 ?auto_663911 ) ) ( not ( = ?auto_663907 ?auto_663912 ) ) ( not ( = ?auto_663907 ?auto_663913 ) ) ( not ( = ?auto_663907 ?auto_663916 ) ) ( not ( = ?auto_663907 ?auto_663914 ) ) ( not ( = ?auto_663908 ?auto_663910 ) ) ( not ( = ?auto_663908 ?auto_663909 ) ) ( not ( = ?auto_663908 ?auto_663911 ) ) ( not ( = ?auto_663908 ?auto_663912 ) ) ( not ( = ?auto_663908 ?auto_663913 ) ) ( not ( = ?auto_663908 ?auto_663916 ) ) ( not ( = ?auto_663908 ?auto_663914 ) ) ( not ( = ?auto_663910 ?auto_663909 ) ) ( not ( = ?auto_663910 ?auto_663911 ) ) ( not ( = ?auto_663910 ?auto_663912 ) ) ( not ( = ?auto_663910 ?auto_663913 ) ) ( not ( = ?auto_663910 ?auto_663916 ) ) ( not ( = ?auto_663910 ?auto_663914 ) ) ( not ( = ?auto_663909 ?auto_663911 ) ) ( not ( = ?auto_663909 ?auto_663912 ) ) ( not ( = ?auto_663909 ?auto_663913 ) ) ( not ( = ?auto_663909 ?auto_663916 ) ) ( not ( = ?auto_663909 ?auto_663914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663911 ?auto_663912 ?auto_663913 )
      ( MAKE-7CRATE-VERIFY ?auto_663906 ?auto_663907 ?auto_663908 ?auto_663910 ?auto_663909 ?auto_663911 ?auto_663912 ?auto_663913 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_663921 - SURFACE
      ?auto_663922 - SURFACE
      ?auto_663923 - SURFACE
      ?auto_663925 - SURFACE
      ?auto_663924 - SURFACE
      ?auto_663926 - SURFACE
      ?auto_663927 - SURFACE
      ?auto_663928 - SURFACE
      ?auto_663929 - SURFACE
    )
    :vars
    (
      ?auto_663933 - HOIST
      ?auto_663934 - PLACE
      ?auto_663935 - PLACE
      ?auto_663936 - HOIST
      ?auto_663932 - SURFACE
      ?auto_663930 - SURFACE
      ?auto_663931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663933 ?auto_663934 ) ( IS-CRATE ?auto_663929 ) ( not ( = ?auto_663928 ?auto_663929 ) ) ( not ( = ?auto_663927 ?auto_663928 ) ) ( not ( = ?auto_663927 ?auto_663929 ) ) ( not ( = ?auto_663935 ?auto_663934 ) ) ( HOIST-AT ?auto_663936 ?auto_663935 ) ( not ( = ?auto_663933 ?auto_663936 ) ) ( SURFACE-AT ?auto_663929 ?auto_663935 ) ( ON ?auto_663929 ?auto_663932 ) ( CLEAR ?auto_663929 ) ( not ( = ?auto_663928 ?auto_663932 ) ) ( not ( = ?auto_663929 ?auto_663932 ) ) ( not ( = ?auto_663927 ?auto_663932 ) ) ( SURFACE-AT ?auto_663927 ?auto_663934 ) ( CLEAR ?auto_663927 ) ( IS-CRATE ?auto_663928 ) ( AVAILABLE ?auto_663933 ) ( AVAILABLE ?auto_663936 ) ( SURFACE-AT ?auto_663928 ?auto_663935 ) ( ON ?auto_663928 ?auto_663930 ) ( CLEAR ?auto_663928 ) ( not ( = ?auto_663928 ?auto_663930 ) ) ( not ( = ?auto_663929 ?auto_663930 ) ) ( not ( = ?auto_663927 ?auto_663930 ) ) ( not ( = ?auto_663932 ?auto_663930 ) ) ( TRUCK-AT ?auto_663931 ?auto_663934 ) ( ON ?auto_663922 ?auto_663921 ) ( ON ?auto_663923 ?auto_663922 ) ( ON ?auto_663925 ?auto_663923 ) ( ON ?auto_663924 ?auto_663925 ) ( ON ?auto_663926 ?auto_663924 ) ( ON ?auto_663927 ?auto_663926 ) ( not ( = ?auto_663921 ?auto_663922 ) ) ( not ( = ?auto_663921 ?auto_663923 ) ) ( not ( = ?auto_663921 ?auto_663925 ) ) ( not ( = ?auto_663921 ?auto_663924 ) ) ( not ( = ?auto_663921 ?auto_663926 ) ) ( not ( = ?auto_663921 ?auto_663927 ) ) ( not ( = ?auto_663921 ?auto_663928 ) ) ( not ( = ?auto_663921 ?auto_663929 ) ) ( not ( = ?auto_663921 ?auto_663932 ) ) ( not ( = ?auto_663921 ?auto_663930 ) ) ( not ( = ?auto_663922 ?auto_663923 ) ) ( not ( = ?auto_663922 ?auto_663925 ) ) ( not ( = ?auto_663922 ?auto_663924 ) ) ( not ( = ?auto_663922 ?auto_663926 ) ) ( not ( = ?auto_663922 ?auto_663927 ) ) ( not ( = ?auto_663922 ?auto_663928 ) ) ( not ( = ?auto_663922 ?auto_663929 ) ) ( not ( = ?auto_663922 ?auto_663932 ) ) ( not ( = ?auto_663922 ?auto_663930 ) ) ( not ( = ?auto_663923 ?auto_663925 ) ) ( not ( = ?auto_663923 ?auto_663924 ) ) ( not ( = ?auto_663923 ?auto_663926 ) ) ( not ( = ?auto_663923 ?auto_663927 ) ) ( not ( = ?auto_663923 ?auto_663928 ) ) ( not ( = ?auto_663923 ?auto_663929 ) ) ( not ( = ?auto_663923 ?auto_663932 ) ) ( not ( = ?auto_663923 ?auto_663930 ) ) ( not ( = ?auto_663925 ?auto_663924 ) ) ( not ( = ?auto_663925 ?auto_663926 ) ) ( not ( = ?auto_663925 ?auto_663927 ) ) ( not ( = ?auto_663925 ?auto_663928 ) ) ( not ( = ?auto_663925 ?auto_663929 ) ) ( not ( = ?auto_663925 ?auto_663932 ) ) ( not ( = ?auto_663925 ?auto_663930 ) ) ( not ( = ?auto_663924 ?auto_663926 ) ) ( not ( = ?auto_663924 ?auto_663927 ) ) ( not ( = ?auto_663924 ?auto_663928 ) ) ( not ( = ?auto_663924 ?auto_663929 ) ) ( not ( = ?auto_663924 ?auto_663932 ) ) ( not ( = ?auto_663924 ?auto_663930 ) ) ( not ( = ?auto_663926 ?auto_663927 ) ) ( not ( = ?auto_663926 ?auto_663928 ) ) ( not ( = ?auto_663926 ?auto_663929 ) ) ( not ( = ?auto_663926 ?auto_663932 ) ) ( not ( = ?auto_663926 ?auto_663930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663927 ?auto_663928 ?auto_663929 )
      ( MAKE-8CRATE-VERIFY ?auto_663921 ?auto_663922 ?auto_663923 ?auto_663925 ?auto_663924 ?auto_663926 ?auto_663927 ?auto_663928 ?auto_663929 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_663937 - SURFACE
      ?auto_663938 - SURFACE
      ?auto_663939 - SURFACE
      ?auto_663941 - SURFACE
      ?auto_663940 - SURFACE
      ?auto_663942 - SURFACE
      ?auto_663943 - SURFACE
      ?auto_663944 - SURFACE
      ?auto_663945 - SURFACE
      ?auto_663946 - SURFACE
    )
    :vars
    (
      ?auto_663950 - HOIST
      ?auto_663951 - PLACE
      ?auto_663952 - PLACE
      ?auto_663953 - HOIST
      ?auto_663949 - SURFACE
      ?auto_663947 - SURFACE
      ?auto_663948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663950 ?auto_663951 ) ( IS-CRATE ?auto_663946 ) ( not ( = ?auto_663945 ?auto_663946 ) ) ( not ( = ?auto_663944 ?auto_663945 ) ) ( not ( = ?auto_663944 ?auto_663946 ) ) ( not ( = ?auto_663952 ?auto_663951 ) ) ( HOIST-AT ?auto_663953 ?auto_663952 ) ( not ( = ?auto_663950 ?auto_663953 ) ) ( SURFACE-AT ?auto_663946 ?auto_663952 ) ( ON ?auto_663946 ?auto_663949 ) ( CLEAR ?auto_663946 ) ( not ( = ?auto_663945 ?auto_663949 ) ) ( not ( = ?auto_663946 ?auto_663949 ) ) ( not ( = ?auto_663944 ?auto_663949 ) ) ( SURFACE-AT ?auto_663944 ?auto_663951 ) ( CLEAR ?auto_663944 ) ( IS-CRATE ?auto_663945 ) ( AVAILABLE ?auto_663950 ) ( AVAILABLE ?auto_663953 ) ( SURFACE-AT ?auto_663945 ?auto_663952 ) ( ON ?auto_663945 ?auto_663947 ) ( CLEAR ?auto_663945 ) ( not ( = ?auto_663945 ?auto_663947 ) ) ( not ( = ?auto_663946 ?auto_663947 ) ) ( not ( = ?auto_663944 ?auto_663947 ) ) ( not ( = ?auto_663949 ?auto_663947 ) ) ( TRUCK-AT ?auto_663948 ?auto_663951 ) ( ON ?auto_663938 ?auto_663937 ) ( ON ?auto_663939 ?auto_663938 ) ( ON ?auto_663941 ?auto_663939 ) ( ON ?auto_663940 ?auto_663941 ) ( ON ?auto_663942 ?auto_663940 ) ( ON ?auto_663943 ?auto_663942 ) ( ON ?auto_663944 ?auto_663943 ) ( not ( = ?auto_663937 ?auto_663938 ) ) ( not ( = ?auto_663937 ?auto_663939 ) ) ( not ( = ?auto_663937 ?auto_663941 ) ) ( not ( = ?auto_663937 ?auto_663940 ) ) ( not ( = ?auto_663937 ?auto_663942 ) ) ( not ( = ?auto_663937 ?auto_663943 ) ) ( not ( = ?auto_663937 ?auto_663944 ) ) ( not ( = ?auto_663937 ?auto_663945 ) ) ( not ( = ?auto_663937 ?auto_663946 ) ) ( not ( = ?auto_663937 ?auto_663949 ) ) ( not ( = ?auto_663937 ?auto_663947 ) ) ( not ( = ?auto_663938 ?auto_663939 ) ) ( not ( = ?auto_663938 ?auto_663941 ) ) ( not ( = ?auto_663938 ?auto_663940 ) ) ( not ( = ?auto_663938 ?auto_663942 ) ) ( not ( = ?auto_663938 ?auto_663943 ) ) ( not ( = ?auto_663938 ?auto_663944 ) ) ( not ( = ?auto_663938 ?auto_663945 ) ) ( not ( = ?auto_663938 ?auto_663946 ) ) ( not ( = ?auto_663938 ?auto_663949 ) ) ( not ( = ?auto_663938 ?auto_663947 ) ) ( not ( = ?auto_663939 ?auto_663941 ) ) ( not ( = ?auto_663939 ?auto_663940 ) ) ( not ( = ?auto_663939 ?auto_663942 ) ) ( not ( = ?auto_663939 ?auto_663943 ) ) ( not ( = ?auto_663939 ?auto_663944 ) ) ( not ( = ?auto_663939 ?auto_663945 ) ) ( not ( = ?auto_663939 ?auto_663946 ) ) ( not ( = ?auto_663939 ?auto_663949 ) ) ( not ( = ?auto_663939 ?auto_663947 ) ) ( not ( = ?auto_663941 ?auto_663940 ) ) ( not ( = ?auto_663941 ?auto_663942 ) ) ( not ( = ?auto_663941 ?auto_663943 ) ) ( not ( = ?auto_663941 ?auto_663944 ) ) ( not ( = ?auto_663941 ?auto_663945 ) ) ( not ( = ?auto_663941 ?auto_663946 ) ) ( not ( = ?auto_663941 ?auto_663949 ) ) ( not ( = ?auto_663941 ?auto_663947 ) ) ( not ( = ?auto_663940 ?auto_663942 ) ) ( not ( = ?auto_663940 ?auto_663943 ) ) ( not ( = ?auto_663940 ?auto_663944 ) ) ( not ( = ?auto_663940 ?auto_663945 ) ) ( not ( = ?auto_663940 ?auto_663946 ) ) ( not ( = ?auto_663940 ?auto_663949 ) ) ( not ( = ?auto_663940 ?auto_663947 ) ) ( not ( = ?auto_663942 ?auto_663943 ) ) ( not ( = ?auto_663942 ?auto_663944 ) ) ( not ( = ?auto_663942 ?auto_663945 ) ) ( not ( = ?auto_663942 ?auto_663946 ) ) ( not ( = ?auto_663942 ?auto_663949 ) ) ( not ( = ?auto_663942 ?auto_663947 ) ) ( not ( = ?auto_663943 ?auto_663944 ) ) ( not ( = ?auto_663943 ?auto_663945 ) ) ( not ( = ?auto_663943 ?auto_663946 ) ) ( not ( = ?auto_663943 ?auto_663949 ) ) ( not ( = ?auto_663943 ?auto_663947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663944 ?auto_663945 ?auto_663946 )
      ( MAKE-9CRATE-VERIFY ?auto_663937 ?auto_663938 ?auto_663939 ?auto_663941 ?auto_663940 ?auto_663942 ?auto_663943 ?auto_663944 ?auto_663945 ?auto_663946 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_663954 - SURFACE
      ?auto_663955 - SURFACE
      ?auto_663956 - SURFACE
      ?auto_663958 - SURFACE
      ?auto_663957 - SURFACE
      ?auto_663959 - SURFACE
      ?auto_663960 - SURFACE
      ?auto_663961 - SURFACE
      ?auto_663962 - SURFACE
      ?auto_663963 - SURFACE
      ?auto_663964 - SURFACE
    )
    :vars
    (
      ?auto_663968 - HOIST
      ?auto_663969 - PLACE
      ?auto_663970 - PLACE
      ?auto_663971 - HOIST
      ?auto_663967 - SURFACE
      ?auto_663965 - SURFACE
      ?auto_663966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_663968 ?auto_663969 ) ( IS-CRATE ?auto_663964 ) ( not ( = ?auto_663963 ?auto_663964 ) ) ( not ( = ?auto_663962 ?auto_663963 ) ) ( not ( = ?auto_663962 ?auto_663964 ) ) ( not ( = ?auto_663970 ?auto_663969 ) ) ( HOIST-AT ?auto_663971 ?auto_663970 ) ( not ( = ?auto_663968 ?auto_663971 ) ) ( SURFACE-AT ?auto_663964 ?auto_663970 ) ( ON ?auto_663964 ?auto_663967 ) ( CLEAR ?auto_663964 ) ( not ( = ?auto_663963 ?auto_663967 ) ) ( not ( = ?auto_663964 ?auto_663967 ) ) ( not ( = ?auto_663962 ?auto_663967 ) ) ( SURFACE-AT ?auto_663962 ?auto_663969 ) ( CLEAR ?auto_663962 ) ( IS-CRATE ?auto_663963 ) ( AVAILABLE ?auto_663968 ) ( AVAILABLE ?auto_663971 ) ( SURFACE-AT ?auto_663963 ?auto_663970 ) ( ON ?auto_663963 ?auto_663965 ) ( CLEAR ?auto_663963 ) ( not ( = ?auto_663963 ?auto_663965 ) ) ( not ( = ?auto_663964 ?auto_663965 ) ) ( not ( = ?auto_663962 ?auto_663965 ) ) ( not ( = ?auto_663967 ?auto_663965 ) ) ( TRUCK-AT ?auto_663966 ?auto_663969 ) ( ON ?auto_663955 ?auto_663954 ) ( ON ?auto_663956 ?auto_663955 ) ( ON ?auto_663958 ?auto_663956 ) ( ON ?auto_663957 ?auto_663958 ) ( ON ?auto_663959 ?auto_663957 ) ( ON ?auto_663960 ?auto_663959 ) ( ON ?auto_663961 ?auto_663960 ) ( ON ?auto_663962 ?auto_663961 ) ( not ( = ?auto_663954 ?auto_663955 ) ) ( not ( = ?auto_663954 ?auto_663956 ) ) ( not ( = ?auto_663954 ?auto_663958 ) ) ( not ( = ?auto_663954 ?auto_663957 ) ) ( not ( = ?auto_663954 ?auto_663959 ) ) ( not ( = ?auto_663954 ?auto_663960 ) ) ( not ( = ?auto_663954 ?auto_663961 ) ) ( not ( = ?auto_663954 ?auto_663962 ) ) ( not ( = ?auto_663954 ?auto_663963 ) ) ( not ( = ?auto_663954 ?auto_663964 ) ) ( not ( = ?auto_663954 ?auto_663967 ) ) ( not ( = ?auto_663954 ?auto_663965 ) ) ( not ( = ?auto_663955 ?auto_663956 ) ) ( not ( = ?auto_663955 ?auto_663958 ) ) ( not ( = ?auto_663955 ?auto_663957 ) ) ( not ( = ?auto_663955 ?auto_663959 ) ) ( not ( = ?auto_663955 ?auto_663960 ) ) ( not ( = ?auto_663955 ?auto_663961 ) ) ( not ( = ?auto_663955 ?auto_663962 ) ) ( not ( = ?auto_663955 ?auto_663963 ) ) ( not ( = ?auto_663955 ?auto_663964 ) ) ( not ( = ?auto_663955 ?auto_663967 ) ) ( not ( = ?auto_663955 ?auto_663965 ) ) ( not ( = ?auto_663956 ?auto_663958 ) ) ( not ( = ?auto_663956 ?auto_663957 ) ) ( not ( = ?auto_663956 ?auto_663959 ) ) ( not ( = ?auto_663956 ?auto_663960 ) ) ( not ( = ?auto_663956 ?auto_663961 ) ) ( not ( = ?auto_663956 ?auto_663962 ) ) ( not ( = ?auto_663956 ?auto_663963 ) ) ( not ( = ?auto_663956 ?auto_663964 ) ) ( not ( = ?auto_663956 ?auto_663967 ) ) ( not ( = ?auto_663956 ?auto_663965 ) ) ( not ( = ?auto_663958 ?auto_663957 ) ) ( not ( = ?auto_663958 ?auto_663959 ) ) ( not ( = ?auto_663958 ?auto_663960 ) ) ( not ( = ?auto_663958 ?auto_663961 ) ) ( not ( = ?auto_663958 ?auto_663962 ) ) ( not ( = ?auto_663958 ?auto_663963 ) ) ( not ( = ?auto_663958 ?auto_663964 ) ) ( not ( = ?auto_663958 ?auto_663967 ) ) ( not ( = ?auto_663958 ?auto_663965 ) ) ( not ( = ?auto_663957 ?auto_663959 ) ) ( not ( = ?auto_663957 ?auto_663960 ) ) ( not ( = ?auto_663957 ?auto_663961 ) ) ( not ( = ?auto_663957 ?auto_663962 ) ) ( not ( = ?auto_663957 ?auto_663963 ) ) ( not ( = ?auto_663957 ?auto_663964 ) ) ( not ( = ?auto_663957 ?auto_663967 ) ) ( not ( = ?auto_663957 ?auto_663965 ) ) ( not ( = ?auto_663959 ?auto_663960 ) ) ( not ( = ?auto_663959 ?auto_663961 ) ) ( not ( = ?auto_663959 ?auto_663962 ) ) ( not ( = ?auto_663959 ?auto_663963 ) ) ( not ( = ?auto_663959 ?auto_663964 ) ) ( not ( = ?auto_663959 ?auto_663967 ) ) ( not ( = ?auto_663959 ?auto_663965 ) ) ( not ( = ?auto_663960 ?auto_663961 ) ) ( not ( = ?auto_663960 ?auto_663962 ) ) ( not ( = ?auto_663960 ?auto_663963 ) ) ( not ( = ?auto_663960 ?auto_663964 ) ) ( not ( = ?auto_663960 ?auto_663967 ) ) ( not ( = ?auto_663960 ?auto_663965 ) ) ( not ( = ?auto_663961 ?auto_663962 ) ) ( not ( = ?auto_663961 ?auto_663963 ) ) ( not ( = ?auto_663961 ?auto_663964 ) ) ( not ( = ?auto_663961 ?auto_663967 ) ) ( not ( = ?auto_663961 ?auto_663965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663962 ?auto_663963 ?auto_663964 )
      ( MAKE-10CRATE-VERIFY ?auto_663954 ?auto_663955 ?auto_663956 ?auto_663958 ?auto_663957 ?auto_663959 ?auto_663960 ?auto_663961 ?auto_663962 ?auto_663963 ?auto_663964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_663972 - SURFACE
      ?auto_663973 - SURFACE
    )
    :vars
    (
      ?auto_663977 - HOIST
      ?auto_663978 - PLACE
      ?auto_663981 - SURFACE
      ?auto_663979 - PLACE
      ?auto_663980 - HOIST
      ?auto_663976 - SURFACE
      ?auto_663974 - SURFACE
      ?auto_663975 - TRUCK
      ?auto_663982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663977 ?auto_663978 ) ( IS-CRATE ?auto_663973 ) ( not ( = ?auto_663972 ?auto_663973 ) ) ( not ( = ?auto_663981 ?auto_663972 ) ) ( not ( = ?auto_663981 ?auto_663973 ) ) ( not ( = ?auto_663979 ?auto_663978 ) ) ( HOIST-AT ?auto_663980 ?auto_663979 ) ( not ( = ?auto_663977 ?auto_663980 ) ) ( SURFACE-AT ?auto_663973 ?auto_663979 ) ( ON ?auto_663973 ?auto_663976 ) ( CLEAR ?auto_663973 ) ( not ( = ?auto_663972 ?auto_663976 ) ) ( not ( = ?auto_663973 ?auto_663976 ) ) ( not ( = ?auto_663981 ?auto_663976 ) ) ( IS-CRATE ?auto_663972 ) ( AVAILABLE ?auto_663980 ) ( SURFACE-AT ?auto_663972 ?auto_663979 ) ( ON ?auto_663972 ?auto_663974 ) ( CLEAR ?auto_663972 ) ( not ( = ?auto_663972 ?auto_663974 ) ) ( not ( = ?auto_663973 ?auto_663974 ) ) ( not ( = ?auto_663981 ?auto_663974 ) ) ( not ( = ?auto_663976 ?auto_663974 ) ) ( TRUCK-AT ?auto_663975 ?auto_663978 ) ( SURFACE-AT ?auto_663982 ?auto_663978 ) ( CLEAR ?auto_663982 ) ( LIFTING ?auto_663977 ?auto_663981 ) ( IS-CRATE ?auto_663981 ) ( not ( = ?auto_663982 ?auto_663981 ) ) ( not ( = ?auto_663972 ?auto_663982 ) ) ( not ( = ?auto_663973 ?auto_663982 ) ) ( not ( = ?auto_663976 ?auto_663982 ) ) ( not ( = ?auto_663974 ?auto_663982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_663982 ?auto_663981 )
      ( MAKE-2CRATE ?auto_663981 ?auto_663972 ?auto_663973 )
      ( MAKE-1CRATE-VERIFY ?auto_663972 ?auto_663973 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_663983 - SURFACE
      ?auto_663984 - SURFACE
      ?auto_663985 - SURFACE
    )
    :vars
    (
      ?auto_663988 - HOIST
      ?auto_663993 - PLACE
      ?auto_663987 - PLACE
      ?auto_663991 - HOIST
      ?auto_663990 - SURFACE
      ?auto_663992 - SURFACE
      ?auto_663989 - TRUCK
      ?auto_663986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_663988 ?auto_663993 ) ( IS-CRATE ?auto_663985 ) ( not ( = ?auto_663984 ?auto_663985 ) ) ( not ( = ?auto_663983 ?auto_663984 ) ) ( not ( = ?auto_663983 ?auto_663985 ) ) ( not ( = ?auto_663987 ?auto_663993 ) ) ( HOIST-AT ?auto_663991 ?auto_663987 ) ( not ( = ?auto_663988 ?auto_663991 ) ) ( SURFACE-AT ?auto_663985 ?auto_663987 ) ( ON ?auto_663985 ?auto_663990 ) ( CLEAR ?auto_663985 ) ( not ( = ?auto_663984 ?auto_663990 ) ) ( not ( = ?auto_663985 ?auto_663990 ) ) ( not ( = ?auto_663983 ?auto_663990 ) ) ( IS-CRATE ?auto_663984 ) ( AVAILABLE ?auto_663991 ) ( SURFACE-AT ?auto_663984 ?auto_663987 ) ( ON ?auto_663984 ?auto_663992 ) ( CLEAR ?auto_663984 ) ( not ( = ?auto_663984 ?auto_663992 ) ) ( not ( = ?auto_663985 ?auto_663992 ) ) ( not ( = ?auto_663983 ?auto_663992 ) ) ( not ( = ?auto_663990 ?auto_663992 ) ) ( TRUCK-AT ?auto_663989 ?auto_663993 ) ( SURFACE-AT ?auto_663986 ?auto_663993 ) ( CLEAR ?auto_663986 ) ( LIFTING ?auto_663988 ?auto_663983 ) ( IS-CRATE ?auto_663983 ) ( not ( = ?auto_663986 ?auto_663983 ) ) ( not ( = ?auto_663984 ?auto_663986 ) ) ( not ( = ?auto_663985 ?auto_663986 ) ) ( not ( = ?auto_663990 ?auto_663986 ) ) ( not ( = ?auto_663992 ?auto_663986 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_663984 ?auto_663985 )
      ( MAKE-2CRATE-VERIFY ?auto_663983 ?auto_663984 ?auto_663985 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_663994 - SURFACE
      ?auto_663995 - SURFACE
      ?auto_663996 - SURFACE
      ?auto_663997 - SURFACE
    )
    :vars
    (
      ?auto_664003 - HOIST
      ?auto_663999 - PLACE
      ?auto_664004 - PLACE
      ?auto_664001 - HOIST
      ?auto_664002 - SURFACE
      ?auto_664000 - SURFACE
      ?auto_663998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664003 ?auto_663999 ) ( IS-CRATE ?auto_663997 ) ( not ( = ?auto_663996 ?auto_663997 ) ) ( not ( = ?auto_663995 ?auto_663996 ) ) ( not ( = ?auto_663995 ?auto_663997 ) ) ( not ( = ?auto_664004 ?auto_663999 ) ) ( HOIST-AT ?auto_664001 ?auto_664004 ) ( not ( = ?auto_664003 ?auto_664001 ) ) ( SURFACE-AT ?auto_663997 ?auto_664004 ) ( ON ?auto_663997 ?auto_664002 ) ( CLEAR ?auto_663997 ) ( not ( = ?auto_663996 ?auto_664002 ) ) ( not ( = ?auto_663997 ?auto_664002 ) ) ( not ( = ?auto_663995 ?auto_664002 ) ) ( IS-CRATE ?auto_663996 ) ( AVAILABLE ?auto_664001 ) ( SURFACE-AT ?auto_663996 ?auto_664004 ) ( ON ?auto_663996 ?auto_664000 ) ( CLEAR ?auto_663996 ) ( not ( = ?auto_663996 ?auto_664000 ) ) ( not ( = ?auto_663997 ?auto_664000 ) ) ( not ( = ?auto_663995 ?auto_664000 ) ) ( not ( = ?auto_664002 ?auto_664000 ) ) ( TRUCK-AT ?auto_663998 ?auto_663999 ) ( SURFACE-AT ?auto_663994 ?auto_663999 ) ( CLEAR ?auto_663994 ) ( LIFTING ?auto_664003 ?auto_663995 ) ( IS-CRATE ?auto_663995 ) ( not ( = ?auto_663994 ?auto_663995 ) ) ( not ( = ?auto_663996 ?auto_663994 ) ) ( not ( = ?auto_663997 ?auto_663994 ) ) ( not ( = ?auto_664002 ?auto_663994 ) ) ( not ( = ?auto_664000 ?auto_663994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_663995 ?auto_663996 ?auto_663997 )
      ( MAKE-3CRATE-VERIFY ?auto_663994 ?auto_663995 ?auto_663996 ?auto_663997 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_664005 - SURFACE
      ?auto_664006 - SURFACE
      ?auto_664007 - SURFACE
      ?auto_664009 - SURFACE
      ?auto_664008 - SURFACE
    )
    :vars
    (
      ?auto_664015 - HOIST
      ?auto_664011 - PLACE
      ?auto_664016 - PLACE
      ?auto_664013 - HOIST
      ?auto_664014 - SURFACE
      ?auto_664012 - SURFACE
      ?auto_664010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664015 ?auto_664011 ) ( IS-CRATE ?auto_664008 ) ( not ( = ?auto_664009 ?auto_664008 ) ) ( not ( = ?auto_664007 ?auto_664009 ) ) ( not ( = ?auto_664007 ?auto_664008 ) ) ( not ( = ?auto_664016 ?auto_664011 ) ) ( HOIST-AT ?auto_664013 ?auto_664016 ) ( not ( = ?auto_664015 ?auto_664013 ) ) ( SURFACE-AT ?auto_664008 ?auto_664016 ) ( ON ?auto_664008 ?auto_664014 ) ( CLEAR ?auto_664008 ) ( not ( = ?auto_664009 ?auto_664014 ) ) ( not ( = ?auto_664008 ?auto_664014 ) ) ( not ( = ?auto_664007 ?auto_664014 ) ) ( IS-CRATE ?auto_664009 ) ( AVAILABLE ?auto_664013 ) ( SURFACE-AT ?auto_664009 ?auto_664016 ) ( ON ?auto_664009 ?auto_664012 ) ( CLEAR ?auto_664009 ) ( not ( = ?auto_664009 ?auto_664012 ) ) ( not ( = ?auto_664008 ?auto_664012 ) ) ( not ( = ?auto_664007 ?auto_664012 ) ) ( not ( = ?auto_664014 ?auto_664012 ) ) ( TRUCK-AT ?auto_664010 ?auto_664011 ) ( SURFACE-AT ?auto_664006 ?auto_664011 ) ( CLEAR ?auto_664006 ) ( LIFTING ?auto_664015 ?auto_664007 ) ( IS-CRATE ?auto_664007 ) ( not ( = ?auto_664006 ?auto_664007 ) ) ( not ( = ?auto_664009 ?auto_664006 ) ) ( not ( = ?auto_664008 ?auto_664006 ) ) ( not ( = ?auto_664014 ?auto_664006 ) ) ( not ( = ?auto_664012 ?auto_664006 ) ) ( ON ?auto_664006 ?auto_664005 ) ( not ( = ?auto_664005 ?auto_664006 ) ) ( not ( = ?auto_664005 ?auto_664007 ) ) ( not ( = ?auto_664005 ?auto_664009 ) ) ( not ( = ?auto_664005 ?auto_664008 ) ) ( not ( = ?auto_664005 ?auto_664014 ) ) ( not ( = ?auto_664005 ?auto_664012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664007 ?auto_664009 ?auto_664008 )
      ( MAKE-4CRATE-VERIFY ?auto_664005 ?auto_664006 ?auto_664007 ?auto_664009 ?auto_664008 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_664017 - SURFACE
      ?auto_664018 - SURFACE
      ?auto_664019 - SURFACE
      ?auto_664021 - SURFACE
      ?auto_664020 - SURFACE
      ?auto_664022 - SURFACE
    )
    :vars
    (
      ?auto_664028 - HOIST
      ?auto_664024 - PLACE
      ?auto_664029 - PLACE
      ?auto_664026 - HOIST
      ?auto_664027 - SURFACE
      ?auto_664025 - SURFACE
      ?auto_664023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664028 ?auto_664024 ) ( IS-CRATE ?auto_664022 ) ( not ( = ?auto_664020 ?auto_664022 ) ) ( not ( = ?auto_664021 ?auto_664020 ) ) ( not ( = ?auto_664021 ?auto_664022 ) ) ( not ( = ?auto_664029 ?auto_664024 ) ) ( HOIST-AT ?auto_664026 ?auto_664029 ) ( not ( = ?auto_664028 ?auto_664026 ) ) ( SURFACE-AT ?auto_664022 ?auto_664029 ) ( ON ?auto_664022 ?auto_664027 ) ( CLEAR ?auto_664022 ) ( not ( = ?auto_664020 ?auto_664027 ) ) ( not ( = ?auto_664022 ?auto_664027 ) ) ( not ( = ?auto_664021 ?auto_664027 ) ) ( IS-CRATE ?auto_664020 ) ( AVAILABLE ?auto_664026 ) ( SURFACE-AT ?auto_664020 ?auto_664029 ) ( ON ?auto_664020 ?auto_664025 ) ( CLEAR ?auto_664020 ) ( not ( = ?auto_664020 ?auto_664025 ) ) ( not ( = ?auto_664022 ?auto_664025 ) ) ( not ( = ?auto_664021 ?auto_664025 ) ) ( not ( = ?auto_664027 ?auto_664025 ) ) ( TRUCK-AT ?auto_664023 ?auto_664024 ) ( SURFACE-AT ?auto_664019 ?auto_664024 ) ( CLEAR ?auto_664019 ) ( LIFTING ?auto_664028 ?auto_664021 ) ( IS-CRATE ?auto_664021 ) ( not ( = ?auto_664019 ?auto_664021 ) ) ( not ( = ?auto_664020 ?auto_664019 ) ) ( not ( = ?auto_664022 ?auto_664019 ) ) ( not ( = ?auto_664027 ?auto_664019 ) ) ( not ( = ?auto_664025 ?auto_664019 ) ) ( ON ?auto_664018 ?auto_664017 ) ( ON ?auto_664019 ?auto_664018 ) ( not ( = ?auto_664017 ?auto_664018 ) ) ( not ( = ?auto_664017 ?auto_664019 ) ) ( not ( = ?auto_664017 ?auto_664021 ) ) ( not ( = ?auto_664017 ?auto_664020 ) ) ( not ( = ?auto_664017 ?auto_664022 ) ) ( not ( = ?auto_664017 ?auto_664027 ) ) ( not ( = ?auto_664017 ?auto_664025 ) ) ( not ( = ?auto_664018 ?auto_664019 ) ) ( not ( = ?auto_664018 ?auto_664021 ) ) ( not ( = ?auto_664018 ?auto_664020 ) ) ( not ( = ?auto_664018 ?auto_664022 ) ) ( not ( = ?auto_664018 ?auto_664027 ) ) ( not ( = ?auto_664018 ?auto_664025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664021 ?auto_664020 ?auto_664022 )
      ( MAKE-5CRATE-VERIFY ?auto_664017 ?auto_664018 ?auto_664019 ?auto_664021 ?auto_664020 ?auto_664022 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_664030 - SURFACE
      ?auto_664031 - SURFACE
      ?auto_664032 - SURFACE
      ?auto_664034 - SURFACE
      ?auto_664033 - SURFACE
      ?auto_664035 - SURFACE
      ?auto_664036 - SURFACE
    )
    :vars
    (
      ?auto_664042 - HOIST
      ?auto_664038 - PLACE
      ?auto_664043 - PLACE
      ?auto_664040 - HOIST
      ?auto_664041 - SURFACE
      ?auto_664039 - SURFACE
      ?auto_664037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664042 ?auto_664038 ) ( IS-CRATE ?auto_664036 ) ( not ( = ?auto_664035 ?auto_664036 ) ) ( not ( = ?auto_664033 ?auto_664035 ) ) ( not ( = ?auto_664033 ?auto_664036 ) ) ( not ( = ?auto_664043 ?auto_664038 ) ) ( HOIST-AT ?auto_664040 ?auto_664043 ) ( not ( = ?auto_664042 ?auto_664040 ) ) ( SURFACE-AT ?auto_664036 ?auto_664043 ) ( ON ?auto_664036 ?auto_664041 ) ( CLEAR ?auto_664036 ) ( not ( = ?auto_664035 ?auto_664041 ) ) ( not ( = ?auto_664036 ?auto_664041 ) ) ( not ( = ?auto_664033 ?auto_664041 ) ) ( IS-CRATE ?auto_664035 ) ( AVAILABLE ?auto_664040 ) ( SURFACE-AT ?auto_664035 ?auto_664043 ) ( ON ?auto_664035 ?auto_664039 ) ( CLEAR ?auto_664035 ) ( not ( = ?auto_664035 ?auto_664039 ) ) ( not ( = ?auto_664036 ?auto_664039 ) ) ( not ( = ?auto_664033 ?auto_664039 ) ) ( not ( = ?auto_664041 ?auto_664039 ) ) ( TRUCK-AT ?auto_664037 ?auto_664038 ) ( SURFACE-AT ?auto_664034 ?auto_664038 ) ( CLEAR ?auto_664034 ) ( LIFTING ?auto_664042 ?auto_664033 ) ( IS-CRATE ?auto_664033 ) ( not ( = ?auto_664034 ?auto_664033 ) ) ( not ( = ?auto_664035 ?auto_664034 ) ) ( not ( = ?auto_664036 ?auto_664034 ) ) ( not ( = ?auto_664041 ?auto_664034 ) ) ( not ( = ?auto_664039 ?auto_664034 ) ) ( ON ?auto_664031 ?auto_664030 ) ( ON ?auto_664032 ?auto_664031 ) ( ON ?auto_664034 ?auto_664032 ) ( not ( = ?auto_664030 ?auto_664031 ) ) ( not ( = ?auto_664030 ?auto_664032 ) ) ( not ( = ?auto_664030 ?auto_664034 ) ) ( not ( = ?auto_664030 ?auto_664033 ) ) ( not ( = ?auto_664030 ?auto_664035 ) ) ( not ( = ?auto_664030 ?auto_664036 ) ) ( not ( = ?auto_664030 ?auto_664041 ) ) ( not ( = ?auto_664030 ?auto_664039 ) ) ( not ( = ?auto_664031 ?auto_664032 ) ) ( not ( = ?auto_664031 ?auto_664034 ) ) ( not ( = ?auto_664031 ?auto_664033 ) ) ( not ( = ?auto_664031 ?auto_664035 ) ) ( not ( = ?auto_664031 ?auto_664036 ) ) ( not ( = ?auto_664031 ?auto_664041 ) ) ( not ( = ?auto_664031 ?auto_664039 ) ) ( not ( = ?auto_664032 ?auto_664034 ) ) ( not ( = ?auto_664032 ?auto_664033 ) ) ( not ( = ?auto_664032 ?auto_664035 ) ) ( not ( = ?auto_664032 ?auto_664036 ) ) ( not ( = ?auto_664032 ?auto_664041 ) ) ( not ( = ?auto_664032 ?auto_664039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664033 ?auto_664035 ?auto_664036 )
      ( MAKE-6CRATE-VERIFY ?auto_664030 ?auto_664031 ?auto_664032 ?auto_664034 ?auto_664033 ?auto_664035 ?auto_664036 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_664044 - SURFACE
      ?auto_664045 - SURFACE
      ?auto_664046 - SURFACE
      ?auto_664048 - SURFACE
      ?auto_664047 - SURFACE
      ?auto_664049 - SURFACE
      ?auto_664050 - SURFACE
      ?auto_664051 - SURFACE
    )
    :vars
    (
      ?auto_664057 - HOIST
      ?auto_664053 - PLACE
      ?auto_664058 - PLACE
      ?auto_664055 - HOIST
      ?auto_664056 - SURFACE
      ?auto_664054 - SURFACE
      ?auto_664052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664057 ?auto_664053 ) ( IS-CRATE ?auto_664051 ) ( not ( = ?auto_664050 ?auto_664051 ) ) ( not ( = ?auto_664049 ?auto_664050 ) ) ( not ( = ?auto_664049 ?auto_664051 ) ) ( not ( = ?auto_664058 ?auto_664053 ) ) ( HOIST-AT ?auto_664055 ?auto_664058 ) ( not ( = ?auto_664057 ?auto_664055 ) ) ( SURFACE-AT ?auto_664051 ?auto_664058 ) ( ON ?auto_664051 ?auto_664056 ) ( CLEAR ?auto_664051 ) ( not ( = ?auto_664050 ?auto_664056 ) ) ( not ( = ?auto_664051 ?auto_664056 ) ) ( not ( = ?auto_664049 ?auto_664056 ) ) ( IS-CRATE ?auto_664050 ) ( AVAILABLE ?auto_664055 ) ( SURFACE-AT ?auto_664050 ?auto_664058 ) ( ON ?auto_664050 ?auto_664054 ) ( CLEAR ?auto_664050 ) ( not ( = ?auto_664050 ?auto_664054 ) ) ( not ( = ?auto_664051 ?auto_664054 ) ) ( not ( = ?auto_664049 ?auto_664054 ) ) ( not ( = ?auto_664056 ?auto_664054 ) ) ( TRUCK-AT ?auto_664052 ?auto_664053 ) ( SURFACE-AT ?auto_664047 ?auto_664053 ) ( CLEAR ?auto_664047 ) ( LIFTING ?auto_664057 ?auto_664049 ) ( IS-CRATE ?auto_664049 ) ( not ( = ?auto_664047 ?auto_664049 ) ) ( not ( = ?auto_664050 ?auto_664047 ) ) ( not ( = ?auto_664051 ?auto_664047 ) ) ( not ( = ?auto_664056 ?auto_664047 ) ) ( not ( = ?auto_664054 ?auto_664047 ) ) ( ON ?auto_664045 ?auto_664044 ) ( ON ?auto_664046 ?auto_664045 ) ( ON ?auto_664048 ?auto_664046 ) ( ON ?auto_664047 ?auto_664048 ) ( not ( = ?auto_664044 ?auto_664045 ) ) ( not ( = ?auto_664044 ?auto_664046 ) ) ( not ( = ?auto_664044 ?auto_664048 ) ) ( not ( = ?auto_664044 ?auto_664047 ) ) ( not ( = ?auto_664044 ?auto_664049 ) ) ( not ( = ?auto_664044 ?auto_664050 ) ) ( not ( = ?auto_664044 ?auto_664051 ) ) ( not ( = ?auto_664044 ?auto_664056 ) ) ( not ( = ?auto_664044 ?auto_664054 ) ) ( not ( = ?auto_664045 ?auto_664046 ) ) ( not ( = ?auto_664045 ?auto_664048 ) ) ( not ( = ?auto_664045 ?auto_664047 ) ) ( not ( = ?auto_664045 ?auto_664049 ) ) ( not ( = ?auto_664045 ?auto_664050 ) ) ( not ( = ?auto_664045 ?auto_664051 ) ) ( not ( = ?auto_664045 ?auto_664056 ) ) ( not ( = ?auto_664045 ?auto_664054 ) ) ( not ( = ?auto_664046 ?auto_664048 ) ) ( not ( = ?auto_664046 ?auto_664047 ) ) ( not ( = ?auto_664046 ?auto_664049 ) ) ( not ( = ?auto_664046 ?auto_664050 ) ) ( not ( = ?auto_664046 ?auto_664051 ) ) ( not ( = ?auto_664046 ?auto_664056 ) ) ( not ( = ?auto_664046 ?auto_664054 ) ) ( not ( = ?auto_664048 ?auto_664047 ) ) ( not ( = ?auto_664048 ?auto_664049 ) ) ( not ( = ?auto_664048 ?auto_664050 ) ) ( not ( = ?auto_664048 ?auto_664051 ) ) ( not ( = ?auto_664048 ?auto_664056 ) ) ( not ( = ?auto_664048 ?auto_664054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664049 ?auto_664050 ?auto_664051 )
      ( MAKE-7CRATE-VERIFY ?auto_664044 ?auto_664045 ?auto_664046 ?auto_664048 ?auto_664047 ?auto_664049 ?auto_664050 ?auto_664051 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_664059 - SURFACE
      ?auto_664060 - SURFACE
      ?auto_664061 - SURFACE
      ?auto_664063 - SURFACE
      ?auto_664062 - SURFACE
      ?auto_664064 - SURFACE
      ?auto_664065 - SURFACE
      ?auto_664066 - SURFACE
      ?auto_664067 - SURFACE
    )
    :vars
    (
      ?auto_664073 - HOIST
      ?auto_664069 - PLACE
      ?auto_664074 - PLACE
      ?auto_664071 - HOIST
      ?auto_664072 - SURFACE
      ?auto_664070 - SURFACE
      ?auto_664068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664073 ?auto_664069 ) ( IS-CRATE ?auto_664067 ) ( not ( = ?auto_664066 ?auto_664067 ) ) ( not ( = ?auto_664065 ?auto_664066 ) ) ( not ( = ?auto_664065 ?auto_664067 ) ) ( not ( = ?auto_664074 ?auto_664069 ) ) ( HOIST-AT ?auto_664071 ?auto_664074 ) ( not ( = ?auto_664073 ?auto_664071 ) ) ( SURFACE-AT ?auto_664067 ?auto_664074 ) ( ON ?auto_664067 ?auto_664072 ) ( CLEAR ?auto_664067 ) ( not ( = ?auto_664066 ?auto_664072 ) ) ( not ( = ?auto_664067 ?auto_664072 ) ) ( not ( = ?auto_664065 ?auto_664072 ) ) ( IS-CRATE ?auto_664066 ) ( AVAILABLE ?auto_664071 ) ( SURFACE-AT ?auto_664066 ?auto_664074 ) ( ON ?auto_664066 ?auto_664070 ) ( CLEAR ?auto_664066 ) ( not ( = ?auto_664066 ?auto_664070 ) ) ( not ( = ?auto_664067 ?auto_664070 ) ) ( not ( = ?auto_664065 ?auto_664070 ) ) ( not ( = ?auto_664072 ?auto_664070 ) ) ( TRUCK-AT ?auto_664068 ?auto_664069 ) ( SURFACE-AT ?auto_664064 ?auto_664069 ) ( CLEAR ?auto_664064 ) ( LIFTING ?auto_664073 ?auto_664065 ) ( IS-CRATE ?auto_664065 ) ( not ( = ?auto_664064 ?auto_664065 ) ) ( not ( = ?auto_664066 ?auto_664064 ) ) ( not ( = ?auto_664067 ?auto_664064 ) ) ( not ( = ?auto_664072 ?auto_664064 ) ) ( not ( = ?auto_664070 ?auto_664064 ) ) ( ON ?auto_664060 ?auto_664059 ) ( ON ?auto_664061 ?auto_664060 ) ( ON ?auto_664063 ?auto_664061 ) ( ON ?auto_664062 ?auto_664063 ) ( ON ?auto_664064 ?auto_664062 ) ( not ( = ?auto_664059 ?auto_664060 ) ) ( not ( = ?auto_664059 ?auto_664061 ) ) ( not ( = ?auto_664059 ?auto_664063 ) ) ( not ( = ?auto_664059 ?auto_664062 ) ) ( not ( = ?auto_664059 ?auto_664064 ) ) ( not ( = ?auto_664059 ?auto_664065 ) ) ( not ( = ?auto_664059 ?auto_664066 ) ) ( not ( = ?auto_664059 ?auto_664067 ) ) ( not ( = ?auto_664059 ?auto_664072 ) ) ( not ( = ?auto_664059 ?auto_664070 ) ) ( not ( = ?auto_664060 ?auto_664061 ) ) ( not ( = ?auto_664060 ?auto_664063 ) ) ( not ( = ?auto_664060 ?auto_664062 ) ) ( not ( = ?auto_664060 ?auto_664064 ) ) ( not ( = ?auto_664060 ?auto_664065 ) ) ( not ( = ?auto_664060 ?auto_664066 ) ) ( not ( = ?auto_664060 ?auto_664067 ) ) ( not ( = ?auto_664060 ?auto_664072 ) ) ( not ( = ?auto_664060 ?auto_664070 ) ) ( not ( = ?auto_664061 ?auto_664063 ) ) ( not ( = ?auto_664061 ?auto_664062 ) ) ( not ( = ?auto_664061 ?auto_664064 ) ) ( not ( = ?auto_664061 ?auto_664065 ) ) ( not ( = ?auto_664061 ?auto_664066 ) ) ( not ( = ?auto_664061 ?auto_664067 ) ) ( not ( = ?auto_664061 ?auto_664072 ) ) ( not ( = ?auto_664061 ?auto_664070 ) ) ( not ( = ?auto_664063 ?auto_664062 ) ) ( not ( = ?auto_664063 ?auto_664064 ) ) ( not ( = ?auto_664063 ?auto_664065 ) ) ( not ( = ?auto_664063 ?auto_664066 ) ) ( not ( = ?auto_664063 ?auto_664067 ) ) ( not ( = ?auto_664063 ?auto_664072 ) ) ( not ( = ?auto_664063 ?auto_664070 ) ) ( not ( = ?auto_664062 ?auto_664064 ) ) ( not ( = ?auto_664062 ?auto_664065 ) ) ( not ( = ?auto_664062 ?auto_664066 ) ) ( not ( = ?auto_664062 ?auto_664067 ) ) ( not ( = ?auto_664062 ?auto_664072 ) ) ( not ( = ?auto_664062 ?auto_664070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664065 ?auto_664066 ?auto_664067 )
      ( MAKE-8CRATE-VERIFY ?auto_664059 ?auto_664060 ?auto_664061 ?auto_664063 ?auto_664062 ?auto_664064 ?auto_664065 ?auto_664066 ?auto_664067 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_664075 - SURFACE
      ?auto_664076 - SURFACE
      ?auto_664077 - SURFACE
      ?auto_664079 - SURFACE
      ?auto_664078 - SURFACE
      ?auto_664080 - SURFACE
      ?auto_664081 - SURFACE
      ?auto_664082 - SURFACE
      ?auto_664083 - SURFACE
      ?auto_664084 - SURFACE
    )
    :vars
    (
      ?auto_664090 - HOIST
      ?auto_664086 - PLACE
      ?auto_664091 - PLACE
      ?auto_664088 - HOIST
      ?auto_664089 - SURFACE
      ?auto_664087 - SURFACE
      ?auto_664085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664090 ?auto_664086 ) ( IS-CRATE ?auto_664084 ) ( not ( = ?auto_664083 ?auto_664084 ) ) ( not ( = ?auto_664082 ?auto_664083 ) ) ( not ( = ?auto_664082 ?auto_664084 ) ) ( not ( = ?auto_664091 ?auto_664086 ) ) ( HOIST-AT ?auto_664088 ?auto_664091 ) ( not ( = ?auto_664090 ?auto_664088 ) ) ( SURFACE-AT ?auto_664084 ?auto_664091 ) ( ON ?auto_664084 ?auto_664089 ) ( CLEAR ?auto_664084 ) ( not ( = ?auto_664083 ?auto_664089 ) ) ( not ( = ?auto_664084 ?auto_664089 ) ) ( not ( = ?auto_664082 ?auto_664089 ) ) ( IS-CRATE ?auto_664083 ) ( AVAILABLE ?auto_664088 ) ( SURFACE-AT ?auto_664083 ?auto_664091 ) ( ON ?auto_664083 ?auto_664087 ) ( CLEAR ?auto_664083 ) ( not ( = ?auto_664083 ?auto_664087 ) ) ( not ( = ?auto_664084 ?auto_664087 ) ) ( not ( = ?auto_664082 ?auto_664087 ) ) ( not ( = ?auto_664089 ?auto_664087 ) ) ( TRUCK-AT ?auto_664085 ?auto_664086 ) ( SURFACE-AT ?auto_664081 ?auto_664086 ) ( CLEAR ?auto_664081 ) ( LIFTING ?auto_664090 ?auto_664082 ) ( IS-CRATE ?auto_664082 ) ( not ( = ?auto_664081 ?auto_664082 ) ) ( not ( = ?auto_664083 ?auto_664081 ) ) ( not ( = ?auto_664084 ?auto_664081 ) ) ( not ( = ?auto_664089 ?auto_664081 ) ) ( not ( = ?auto_664087 ?auto_664081 ) ) ( ON ?auto_664076 ?auto_664075 ) ( ON ?auto_664077 ?auto_664076 ) ( ON ?auto_664079 ?auto_664077 ) ( ON ?auto_664078 ?auto_664079 ) ( ON ?auto_664080 ?auto_664078 ) ( ON ?auto_664081 ?auto_664080 ) ( not ( = ?auto_664075 ?auto_664076 ) ) ( not ( = ?auto_664075 ?auto_664077 ) ) ( not ( = ?auto_664075 ?auto_664079 ) ) ( not ( = ?auto_664075 ?auto_664078 ) ) ( not ( = ?auto_664075 ?auto_664080 ) ) ( not ( = ?auto_664075 ?auto_664081 ) ) ( not ( = ?auto_664075 ?auto_664082 ) ) ( not ( = ?auto_664075 ?auto_664083 ) ) ( not ( = ?auto_664075 ?auto_664084 ) ) ( not ( = ?auto_664075 ?auto_664089 ) ) ( not ( = ?auto_664075 ?auto_664087 ) ) ( not ( = ?auto_664076 ?auto_664077 ) ) ( not ( = ?auto_664076 ?auto_664079 ) ) ( not ( = ?auto_664076 ?auto_664078 ) ) ( not ( = ?auto_664076 ?auto_664080 ) ) ( not ( = ?auto_664076 ?auto_664081 ) ) ( not ( = ?auto_664076 ?auto_664082 ) ) ( not ( = ?auto_664076 ?auto_664083 ) ) ( not ( = ?auto_664076 ?auto_664084 ) ) ( not ( = ?auto_664076 ?auto_664089 ) ) ( not ( = ?auto_664076 ?auto_664087 ) ) ( not ( = ?auto_664077 ?auto_664079 ) ) ( not ( = ?auto_664077 ?auto_664078 ) ) ( not ( = ?auto_664077 ?auto_664080 ) ) ( not ( = ?auto_664077 ?auto_664081 ) ) ( not ( = ?auto_664077 ?auto_664082 ) ) ( not ( = ?auto_664077 ?auto_664083 ) ) ( not ( = ?auto_664077 ?auto_664084 ) ) ( not ( = ?auto_664077 ?auto_664089 ) ) ( not ( = ?auto_664077 ?auto_664087 ) ) ( not ( = ?auto_664079 ?auto_664078 ) ) ( not ( = ?auto_664079 ?auto_664080 ) ) ( not ( = ?auto_664079 ?auto_664081 ) ) ( not ( = ?auto_664079 ?auto_664082 ) ) ( not ( = ?auto_664079 ?auto_664083 ) ) ( not ( = ?auto_664079 ?auto_664084 ) ) ( not ( = ?auto_664079 ?auto_664089 ) ) ( not ( = ?auto_664079 ?auto_664087 ) ) ( not ( = ?auto_664078 ?auto_664080 ) ) ( not ( = ?auto_664078 ?auto_664081 ) ) ( not ( = ?auto_664078 ?auto_664082 ) ) ( not ( = ?auto_664078 ?auto_664083 ) ) ( not ( = ?auto_664078 ?auto_664084 ) ) ( not ( = ?auto_664078 ?auto_664089 ) ) ( not ( = ?auto_664078 ?auto_664087 ) ) ( not ( = ?auto_664080 ?auto_664081 ) ) ( not ( = ?auto_664080 ?auto_664082 ) ) ( not ( = ?auto_664080 ?auto_664083 ) ) ( not ( = ?auto_664080 ?auto_664084 ) ) ( not ( = ?auto_664080 ?auto_664089 ) ) ( not ( = ?auto_664080 ?auto_664087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664082 ?auto_664083 ?auto_664084 )
      ( MAKE-9CRATE-VERIFY ?auto_664075 ?auto_664076 ?auto_664077 ?auto_664079 ?auto_664078 ?auto_664080 ?auto_664081 ?auto_664082 ?auto_664083 ?auto_664084 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_664092 - SURFACE
      ?auto_664093 - SURFACE
      ?auto_664094 - SURFACE
      ?auto_664096 - SURFACE
      ?auto_664095 - SURFACE
      ?auto_664097 - SURFACE
      ?auto_664098 - SURFACE
      ?auto_664099 - SURFACE
      ?auto_664100 - SURFACE
      ?auto_664101 - SURFACE
      ?auto_664102 - SURFACE
    )
    :vars
    (
      ?auto_664108 - HOIST
      ?auto_664104 - PLACE
      ?auto_664109 - PLACE
      ?auto_664106 - HOIST
      ?auto_664107 - SURFACE
      ?auto_664105 - SURFACE
      ?auto_664103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664108 ?auto_664104 ) ( IS-CRATE ?auto_664102 ) ( not ( = ?auto_664101 ?auto_664102 ) ) ( not ( = ?auto_664100 ?auto_664101 ) ) ( not ( = ?auto_664100 ?auto_664102 ) ) ( not ( = ?auto_664109 ?auto_664104 ) ) ( HOIST-AT ?auto_664106 ?auto_664109 ) ( not ( = ?auto_664108 ?auto_664106 ) ) ( SURFACE-AT ?auto_664102 ?auto_664109 ) ( ON ?auto_664102 ?auto_664107 ) ( CLEAR ?auto_664102 ) ( not ( = ?auto_664101 ?auto_664107 ) ) ( not ( = ?auto_664102 ?auto_664107 ) ) ( not ( = ?auto_664100 ?auto_664107 ) ) ( IS-CRATE ?auto_664101 ) ( AVAILABLE ?auto_664106 ) ( SURFACE-AT ?auto_664101 ?auto_664109 ) ( ON ?auto_664101 ?auto_664105 ) ( CLEAR ?auto_664101 ) ( not ( = ?auto_664101 ?auto_664105 ) ) ( not ( = ?auto_664102 ?auto_664105 ) ) ( not ( = ?auto_664100 ?auto_664105 ) ) ( not ( = ?auto_664107 ?auto_664105 ) ) ( TRUCK-AT ?auto_664103 ?auto_664104 ) ( SURFACE-AT ?auto_664099 ?auto_664104 ) ( CLEAR ?auto_664099 ) ( LIFTING ?auto_664108 ?auto_664100 ) ( IS-CRATE ?auto_664100 ) ( not ( = ?auto_664099 ?auto_664100 ) ) ( not ( = ?auto_664101 ?auto_664099 ) ) ( not ( = ?auto_664102 ?auto_664099 ) ) ( not ( = ?auto_664107 ?auto_664099 ) ) ( not ( = ?auto_664105 ?auto_664099 ) ) ( ON ?auto_664093 ?auto_664092 ) ( ON ?auto_664094 ?auto_664093 ) ( ON ?auto_664096 ?auto_664094 ) ( ON ?auto_664095 ?auto_664096 ) ( ON ?auto_664097 ?auto_664095 ) ( ON ?auto_664098 ?auto_664097 ) ( ON ?auto_664099 ?auto_664098 ) ( not ( = ?auto_664092 ?auto_664093 ) ) ( not ( = ?auto_664092 ?auto_664094 ) ) ( not ( = ?auto_664092 ?auto_664096 ) ) ( not ( = ?auto_664092 ?auto_664095 ) ) ( not ( = ?auto_664092 ?auto_664097 ) ) ( not ( = ?auto_664092 ?auto_664098 ) ) ( not ( = ?auto_664092 ?auto_664099 ) ) ( not ( = ?auto_664092 ?auto_664100 ) ) ( not ( = ?auto_664092 ?auto_664101 ) ) ( not ( = ?auto_664092 ?auto_664102 ) ) ( not ( = ?auto_664092 ?auto_664107 ) ) ( not ( = ?auto_664092 ?auto_664105 ) ) ( not ( = ?auto_664093 ?auto_664094 ) ) ( not ( = ?auto_664093 ?auto_664096 ) ) ( not ( = ?auto_664093 ?auto_664095 ) ) ( not ( = ?auto_664093 ?auto_664097 ) ) ( not ( = ?auto_664093 ?auto_664098 ) ) ( not ( = ?auto_664093 ?auto_664099 ) ) ( not ( = ?auto_664093 ?auto_664100 ) ) ( not ( = ?auto_664093 ?auto_664101 ) ) ( not ( = ?auto_664093 ?auto_664102 ) ) ( not ( = ?auto_664093 ?auto_664107 ) ) ( not ( = ?auto_664093 ?auto_664105 ) ) ( not ( = ?auto_664094 ?auto_664096 ) ) ( not ( = ?auto_664094 ?auto_664095 ) ) ( not ( = ?auto_664094 ?auto_664097 ) ) ( not ( = ?auto_664094 ?auto_664098 ) ) ( not ( = ?auto_664094 ?auto_664099 ) ) ( not ( = ?auto_664094 ?auto_664100 ) ) ( not ( = ?auto_664094 ?auto_664101 ) ) ( not ( = ?auto_664094 ?auto_664102 ) ) ( not ( = ?auto_664094 ?auto_664107 ) ) ( not ( = ?auto_664094 ?auto_664105 ) ) ( not ( = ?auto_664096 ?auto_664095 ) ) ( not ( = ?auto_664096 ?auto_664097 ) ) ( not ( = ?auto_664096 ?auto_664098 ) ) ( not ( = ?auto_664096 ?auto_664099 ) ) ( not ( = ?auto_664096 ?auto_664100 ) ) ( not ( = ?auto_664096 ?auto_664101 ) ) ( not ( = ?auto_664096 ?auto_664102 ) ) ( not ( = ?auto_664096 ?auto_664107 ) ) ( not ( = ?auto_664096 ?auto_664105 ) ) ( not ( = ?auto_664095 ?auto_664097 ) ) ( not ( = ?auto_664095 ?auto_664098 ) ) ( not ( = ?auto_664095 ?auto_664099 ) ) ( not ( = ?auto_664095 ?auto_664100 ) ) ( not ( = ?auto_664095 ?auto_664101 ) ) ( not ( = ?auto_664095 ?auto_664102 ) ) ( not ( = ?auto_664095 ?auto_664107 ) ) ( not ( = ?auto_664095 ?auto_664105 ) ) ( not ( = ?auto_664097 ?auto_664098 ) ) ( not ( = ?auto_664097 ?auto_664099 ) ) ( not ( = ?auto_664097 ?auto_664100 ) ) ( not ( = ?auto_664097 ?auto_664101 ) ) ( not ( = ?auto_664097 ?auto_664102 ) ) ( not ( = ?auto_664097 ?auto_664107 ) ) ( not ( = ?auto_664097 ?auto_664105 ) ) ( not ( = ?auto_664098 ?auto_664099 ) ) ( not ( = ?auto_664098 ?auto_664100 ) ) ( not ( = ?auto_664098 ?auto_664101 ) ) ( not ( = ?auto_664098 ?auto_664102 ) ) ( not ( = ?auto_664098 ?auto_664107 ) ) ( not ( = ?auto_664098 ?auto_664105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_664100 ?auto_664101 ?auto_664102 )
      ( MAKE-10CRATE-VERIFY ?auto_664092 ?auto_664093 ?auto_664094 ?auto_664096 ?auto_664095 ?auto_664097 ?auto_664098 ?auto_664099 ?auto_664100 ?auto_664101 ?auto_664102 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_670591 - SURFACE
      ?auto_670592 - SURFACE
      ?auto_670593 - SURFACE
      ?auto_670595 - SURFACE
      ?auto_670594 - SURFACE
      ?auto_670596 - SURFACE
      ?auto_670597 - SURFACE
      ?auto_670598 - SURFACE
      ?auto_670599 - SURFACE
      ?auto_670600 - SURFACE
      ?auto_670601 - SURFACE
      ?auto_670602 - SURFACE
    )
    :vars
    (
      ?auto_670603 - HOIST
      ?auto_670604 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_670603 ?auto_670604 ) ( SURFACE-AT ?auto_670601 ?auto_670604 ) ( CLEAR ?auto_670601 ) ( LIFTING ?auto_670603 ?auto_670602 ) ( IS-CRATE ?auto_670602 ) ( not ( = ?auto_670601 ?auto_670602 ) ) ( ON ?auto_670592 ?auto_670591 ) ( ON ?auto_670593 ?auto_670592 ) ( ON ?auto_670595 ?auto_670593 ) ( ON ?auto_670594 ?auto_670595 ) ( ON ?auto_670596 ?auto_670594 ) ( ON ?auto_670597 ?auto_670596 ) ( ON ?auto_670598 ?auto_670597 ) ( ON ?auto_670599 ?auto_670598 ) ( ON ?auto_670600 ?auto_670599 ) ( ON ?auto_670601 ?auto_670600 ) ( not ( = ?auto_670591 ?auto_670592 ) ) ( not ( = ?auto_670591 ?auto_670593 ) ) ( not ( = ?auto_670591 ?auto_670595 ) ) ( not ( = ?auto_670591 ?auto_670594 ) ) ( not ( = ?auto_670591 ?auto_670596 ) ) ( not ( = ?auto_670591 ?auto_670597 ) ) ( not ( = ?auto_670591 ?auto_670598 ) ) ( not ( = ?auto_670591 ?auto_670599 ) ) ( not ( = ?auto_670591 ?auto_670600 ) ) ( not ( = ?auto_670591 ?auto_670601 ) ) ( not ( = ?auto_670591 ?auto_670602 ) ) ( not ( = ?auto_670592 ?auto_670593 ) ) ( not ( = ?auto_670592 ?auto_670595 ) ) ( not ( = ?auto_670592 ?auto_670594 ) ) ( not ( = ?auto_670592 ?auto_670596 ) ) ( not ( = ?auto_670592 ?auto_670597 ) ) ( not ( = ?auto_670592 ?auto_670598 ) ) ( not ( = ?auto_670592 ?auto_670599 ) ) ( not ( = ?auto_670592 ?auto_670600 ) ) ( not ( = ?auto_670592 ?auto_670601 ) ) ( not ( = ?auto_670592 ?auto_670602 ) ) ( not ( = ?auto_670593 ?auto_670595 ) ) ( not ( = ?auto_670593 ?auto_670594 ) ) ( not ( = ?auto_670593 ?auto_670596 ) ) ( not ( = ?auto_670593 ?auto_670597 ) ) ( not ( = ?auto_670593 ?auto_670598 ) ) ( not ( = ?auto_670593 ?auto_670599 ) ) ( not ( = ?auto_670593 ?auto_670600 ) ) ( not ( = ?auto_670593 ?auto_670601 ) ) ( not ( = ?auto_670593 ?auto_670602 ) ) ( not ( = ?auto_670595 ?auto_670594 ) ) ( not ( = ?auto_670595 ?auto_670596 ) ) ( not ( = ?auto_670595 ?auto_670597 ) ) ( not ( = ?auto_670595 ?auto_670598 ) ) ( not ( = ?auto_670595 ?auto_670599 ) ) ( not ( = ?auto_670595 ?auto_670600 ) ) ( not ( = ?auto_670595 ?auto_670601 ) ) ( not ( = ?auto_670595 ?auto_670602 ) ) ( not ( = ?auto_670594 ?auto_670596 ) ) ( not ( = ?auto_670594 ?auto_670597 ) ) ( not ( = ?auto_670594 ?auto_670598 ) ) ( not ( = ?auto_670594 ?auto_670599 ) ) ( not ( = ?auto_670594 ?auto_670600 ) ) ( not ( = ?auto_670594 ?auto_670601 ) ) ( not ( = ?auto_670594 ?auto_670602 ) ) ( not ( = ?auto_670596 ?auto_670597 ) ) ( not ( = ?auto_670596 ?auto_670598 ) ) ( not ( = ?auto_670596 ?auto_670599 ) ) ( not ( = ?auto_670596 ?auto_670600 ) ) ( not ( = ?auto_670596 ?auto_670601 ) ) ( not ( = ?auto_670596 ?auto_670602 ) ) ( not ( = ?auto_670597 ?auto_670598 ) ) ( not ( = ?auto_670597 ?auto_670599 ) ) ( not ( = ?auto_670597 ?auto_670600 ) ) ( not ( = ?auto_670597 ?auto_670601 ) ) ( not ( = ?auto_670597 ?auto_670602 ) ) ( not ( = ?auto_670598 ?auto_670599 ) ) ( not ( = ?auto_670598 ?auto_670600 ) ) ( not ( = ?auto_670598 ?auto_670601 ) ) ( not ( = ?auto_670598 ?auto_670602 ) ) ( not ( = ?auto_670599 ?auto_670600 ) ) ( not ( = ?auto_670599 ?auto_670601 ) ) ( not ( = ?auto_670599 ?auto_670602 ) ) ( not ( = ?auto_670600 ?auto_670601 ) ) ( not ( = ?auto_670600 ?auto_670602 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_670601 ?auto_670602 )
      ( MAKE-11CRATE-VERIFY ?auto_670591 ?auto_670592 ?auto_670593 ?auto_670595 ?auto_670594 ?auto_670596 ?auto_670597 ?auto_670598 ?auto_670599 ?auto_670600 ?auto_670601 ?auto_670602 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_670700 - SURFACE
      ?auto_670701 - SURFACE
      ?auto_670702 - SURFACE
      ?auto_670704 - SURFACE
      ?auto_670703 - SURFACE
      ?auto_670705 - SURFACE
      ?auto_670706 - SURFACE
      ?auto_670707 - SURFACE
      ?auto_670708 - SURFACE
      ?auto_670709 - SURFACE
      ?auto_670710 - SURFACE
      ?auto_670711 - SURFACE
    )
    :vars
    (
      ?auto_670713 - HOIST
      ?auto_670714 - PLACE
      ?auto_670712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_670713 ?auto_670714 ) ( SURFACE-AT ?auto_670710 ?auto_670714 ) ( CLEAR ?auto_670710 ) ( IS-CRATE ?auto_670711 ) ( not ( = ?auto_670710 ?auto_670711 ) ) ( TRUCK-AT ?auto_670712 ?auto_670714 ) ( AVAILABLE ?auto_670713 ) ( IN ?auto_670711 ?auto_670712 ) ( ON ?auto_670710 ?auto_670709 ) ( not ( = ?auto_670709 ?auto_670710 ) ) ( not ( = ?auto_670709 ?auto_670711 ) ) ( ON ?auto_670701 ?auto_670700 ) ( ON ?auto_670702 ?auto_670701 ) ( ON ?auto_670704 ?auto_670702 ) ( ON ?auto_670703 ?auto_670704 ) ( ON ?auto_670705 ?auto_670703 ) ( ON ?auto_670706 ?auto_670705 ) ( ON ?auto_670707 ?auto_670706 ) ( ON ?auto_670708 ?auto_670707 ) ( ON ?auto_670709 ?auto_670708 ) ( not ( = ?auto_670700 ?auto_670701 ) ) ( not ( = ?auto_670700 ?auto_670702 ) ) ( not ( = ?auto_670700 ?auto_670704 ) ) ( not ( = ?auto_670700 ?auto_670703 ) ) ( not ( = ?auto_670700 ?auto_670705 ) ) ( not ( = ?auto_670700 ?auto_670706 ) ) ( not ( = ?auto_670700 ?auto_670707 ) ) ( not ( = ?auto_670700 ?auto_670708 ) ) ( not ( = ?auto_670700 ?auto_670709 ) ) ( not ( = ?auto_670700 ?auto_670710 ) ) ( not ( = ?auto_670700 ?auto_670711 ) ) ( not ( = ?auto_670701 ?auto_670702 ) ) ( not ( = ?auto_670701 ?auto_670704 ) ) ( not ( = ?auto_670701 ?auto_670703 ) ) ( not ( = ?auto_670701 ?auto_670705 ) ) ( not ( = ?auto_670701 ?auto_670706 ) ) ( not ( = ?auto_670701 ?auto_670707 ) ) ( not ( = ?auto_670701 ?auto_670708 ) ) ( not ( = ?auto_670701 ?auto_670709 ) ) ( not ( = ?auto_670701 ?auto_670710 ) ) ( not ( = ?auto_670701 ?auto_670711 ) ) ( not ( = ?auto_670702 ?auto_670704 ) ) ( not ( = ?auto_670702 ?auto_670703 ) ) ( not ( = ?auto_670702 ?auto_670705 ) ) ( not ( = ?auto_670702 ?auto_670706 ) ) ( not ( = ?auto_670702 ?auto_670707 ) ) ( not ( = ?auto_670702 ?auto_670708 ) ) ( not ( = ?auto_670702 ?auto_670709 ) ) ( not ( = ?auto_670702 ?auto_670710 ) ) ( not ( = ?auto_670702 ?auto_670711 ) ) ( not ( = ?auto_670704 ?auto_670703 ) ) ( not ( = ?auto_670704 ?auto_670705 ) ) ( not ( = ?auto_670704 ?auto_670706 ) ) ( not ( = ?auto_670704 ?auto_670707 ) ) ( not ( = ?auto_670704 ?auto_670708 ) ) ( not ( = ?auto_670704 ?auto_670709 ) ) ( not ( = ?auto_670704 ?auto_670710 ) ) ( not ( = ?auto_670704 ?auto_670711 ) ) ( not ( = ?auto_670703 ?auto_670705 ) ) ( not ( = ?auto_670703 ?auto_670706 ) ) ( not ( = ?auto_670703 ?auto_670707 ) ) ( not ( = ?auto_670703 ?auto_670708 ) ) ( not ( = ?auto_670703 ?auto_670709 ) ) ( not ( = ?auto_670703 ?auto_670710 ) ) ( not ( = ?auto_670703 ?auto_670711 ) ) ( not ( = ?auto_670705 ?auto_670706 ) ) ( not ( = ?auto_670705 ?auto_670707 ) ) ( not ( = ?auto_670705 ?auto_670708 ) ) ( not ( = ?auto_670705 ?auto_670709 ) ) ( not ( = ?auto_670705 ?auto_670710 ) ) ( not ( = ?auto_670705 ?auto_670711 ) ) ( not ( = ?auto_670706 ?auto_670707 ) ) ( not ( = ?auto_670706 ?auto_670708 ) ) ( not ( = ?auto_670706 ?auto_670709 ) ) ( not ( = ?auto_670706 ?auto_670710 ) ) ( not ( = ?auto_670706 ?auto_670711 ) ) ( not ( = ?auto_670707 ?auto_670708 ) ) ( not ( = ?auto_670707 ?auto_670709 ) ) ( not ( = ?auto_670707 ?auto_670710 ) ) ( not ( = ?auto_670707 ?auto_670711 ) ) ( not ( = ?auto_670708 ?auto_670709 ) ) ( not ( = ?auto_670708 ?auto_670710 ) ) ( not ( = ?auto_670708 ?auto_670711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_670709 ?auto_670710 ?auto_670711 )
      ( MAKE-11CRATE-VERIFY ?auto_670700 ?auto_670701 ?auto_670702 ?auto_670704 ?auto_670703 ?auto_670705 ?auto_670706 ?auto_670707 ?auto_670708 ?auto_670709 ?auto_670710 ?auto_670711 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_670821 - SURFACE
      ?auto_670822 - SURFACE
      ?auto_670823 - SURFACE
      ?auto_670825 - SURFACE
      ?auto_670824 - SURFACE
      ?auto_670826 - SURFACE
      ?auto_670827 - SURFACE
      ?auto_670828 - SURFACE
      ?auto_670829 - SURFACE
      ?auto_670830 - SURFACE
      ?auto_670831 - SURFACE
      ?auto_670832 - SURFACE
    )
    :vars
    (
      ?auto_670836 - HOIST
      ?auto_670834 - PLACE
      ?auto_670833 - TRUCK
      ?auto_670835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_670836 ?auto_670834 ) ( SURFACE-AT ?auto_670831 ?auto_670834 ) ( CLEAR ?auto_670831 ) ( IS-CRATE ?auto_670832 ) ( not ( = ?auto_670831 ?auto_670832 ) ) ( AVAILABLE ?auto_670836 ) ( IN ?auto_670832 ?auto_670833 ) ( ON ?auto_670831 ?auto_670830 ) ( not ( = ?auto_670830 ?auto_670831 ) ) ( not ( = ?auto_670830 ?auto_670832 ) ) ( TRUCK-AT ?auto_670833 ?auto_670835 ) ( not ( = ?auto_670835 ?auto_670834 ) ) ( ON ?auto_670822 ?auto_670821 ) ( ON ?auto_670823 ?auto_670822 ) ( ON ?auto_670825 ?auto_670823 ) ( ON ?auto_670824 ?auto_670825 ) ( ON ?auto_670826 ?auto_670824 ) ( ON ?auto_670827 ?auto_670826 ) ( ON ?auto_670828 ?auto_670827 ) ( ON ?auto_670829 ?auto_670828 ) ( ON ?auto_670830 ?auto_670829 ) ( not ( = ?auto_670821 ?auto_670822 ) ) ( not ( = ?auto_670821 ?auto_670823 ) ) ( not ( = ?auto_670821 ?auto_670825 ) ) ( not ( = ?auto_670821 ?auto_670824 ) ) ( not ( = ?auto_670821 ?auto_670826 ) ) ( not ( = ?auto_670821 ?auto_670827 ) ) ( not ( = ?auto_670821 ?auto_670828 ) ) ( not ( = ?auto_670821 ?auto_670829 ) ) ( not ( = ?auto_670821 ?auto_670830 ) ) ( not ( = ?auto_670821 ?auto_670831 ) ) ( not ( = ?auto_670821 ?auto_670832 ) ) ( not ( = ?auto_670822 ?auto_670823 ) ) ( not ( = ?auto_670822 ?auto_670825 ) ) ( not ( = ?auto_670822 ?auto_670824 ) ) ( not ( = ?auto_670822 ?auto_670826 ) ) ( not ( = ?auto_670822 ?auto_670827 ) ) ( not ( = ?auto_670822 ?auto_670828 ) ) ( not ( = ?auto_670822 ?auto_670829 ) ) ( not ( = ?auto_670822 ?auto_670830 ) ) ( not ( = ?auto_670822 ?auto_670831 ) ) ( not ( = ?auto_670822 ?auto_670832 ) ) ( not ( = ?auto_670823 ?auto_670825 ) ) ( not ( = ?auto_670823 ?auto_670824 ) ) ( not ( = ?auto_670823 ?auto_670826 ) ) ( not ( = ?auto_670823 ?auto_670827 ) ) ( not ( = ?auto_670823 ?auto_670828 ) ) ( not ( = ?auto_670823 ?auto_670829 ) ) ( not ( = ?auto_670823 ?auto_670830 ) ) ( not ( = ?auto_670823 ?auto_670831 ) ) ( not ( = ?auto_670823 ?auto_670832 ) ) ( not ( = ?auto_670825 ?auto_670824 ) ) ( not ( = ?auto_670825 ?auto_670826 ) ) ( not ( = ?auto_670825 ?auto_670827 ) ) ( not ( = ?auto_670825 ?auto_670828 ) ) ( not ( = ?auto_670825 ?auto_670829 ) ) ( not ( = ?auto_670825 ?auto_670830 ) ) ( not ( = ?auto_670825 ?auto_670831 ) ) ( not ( = ?auto_670825 ?auto_670832 ) ) ( not ( = ?auto_670824 ?auto_670826 ) ) ( not ( = ?auto_670824 ?auto_670827 ) ) ( not ( = ?auto_670824 ?auto_670828 ) ) ( not ( = ?auto_670824 ?auto_670829 ) ) ( not ( = ?auto_670824 ?auto_670830 ) ) ( not ( = ?auto_670824 ?auto_670831 ) ) ( not ( = ?auto_670824 ?auto_670832 ) ) ( not ( = ?auto_670826 ?auto_670827 ) ) ( not ( = ?auto_670826 ?auto_670828 ) ) ( not ( = ?auto_670826 ?auto_670829 ) ) ( not ( = ?auto_670826 ?auto_670830 ) ) ( not ( = ?auto_670826 ?auto_670831 ) ) ( not ( = ?auto_670826 ?auto_670832 ) ) ( not ( = ?auto_670827 ?auto_670828 ) ) ( not ( = ?auto_670827 ?auto_670829 ) ) ( not ( = ?auto_670827 ?auto_670830 ) ) ( not ( = ?auto_670827 ?auto_670831 ) ) ( not ( = ?auto_670827 ?auto_670832 ) ) ( not ( = ?auto_670828 ?auto_670829 ) ) ( not ( = ?auto_670828 ?auto_670830 ) ) ( not ( = ?auto_670828 ?auto_670831 ) ) ( not ( = ?auto_670828 ?auto_670832 ) ) ( not ( = ?auto_670829 ?auto_670830 ) ) ( not ( = ?auto_670829 ?auto_670831 ) ) ( not ( = ?auto_670829 ?auto_670832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_670830 ?auto_670831 ?auto_670832 )
      ( MAKE-11CRATE-VERIFY ?auto_670821 ?auto_670822 ?auto_670823 ?auto_670825 ?auto_670824 ?auto_670826 ?auto_670827 ?auto_670828 ?auto_670829 ?auto_670830 ?auto_670831 ?auto_670832 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_670953 - SURFACE
      ?auto_670954 - SURFACE
      ?auto_670955 - SURFACE
      ?auto_670957 - SURFACE
      ?auto_670956 - SURFACE
      ?auto_670958 - SURFACE
      ?auto_670959 - SURFACE
      ?auto_670960 - SURFACE
      ?auto_670961 - SURFACE
      ?auto_670962 - SURFACE
      ?auto_670963 - SURFACE
      ?auto_670964 - SURFACE
    )
    :vars
    (
      ?auto_670966 - HOIST
      ?auto_670968 - PLACE
      ?auto_670965 - TRUCK
      ?auto_670967 - PLACE
      ?auto_670969 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_670966 ?auto_670968 ) ( SURFACE-AT ?auto_670963 ?auto_670968 ) ( CLEAR ?auto_670963 ) ( IS-CRATE ?auto_670964 ) ( not ( = ?auto_670963 ?auto_670964 ) ) ( AVAILABLE ?auto_670966 ) ( ON ?auto_670963 ?auto_670962 ) ( not ( = ?auto_670962 ?auto_670963 ) ) ( not ( = ?auto_670962 ?auto_670964 ) ) ( TRUCK-AT ?auto_670965 ?auto_670967 ) ( not ( = ?auto_670967 ?auto_670968 ) ) ( HOIST-AT ?auto_670969 ?auto_670967 ) ( LIFTING ?auto_670969 ?auto_670964 ) ( not ( = ?auto_670966 ?auto_670969 ) ) ( ON ?auto_670954 ?auto_670953 ) ( ON ?auto_670955 ?auto_670954 ) ( ON ?auto_670957 ?auto_670955 ) ( ON ?auto_670956 ?auto_670957 ) ( ON ?auto_670958 ?auto_670956 ) ( ON ?auto_670959 ?auto_670958 ) ( ON ?auto_670960 ?auto_670959 ) ( ON ?auto_670961 ?auto_670960 ) ( ON ?auto_670962 ?auto_670961 ) ( not ( = ?auto_670953 ?auto_670954 ) ) ( not ( = ?auto_670953 ?auto_670955 ) ) ( not ( = ?auto_670953 ?auto_670957 ) ) ( not ( = ?auto_670953 ?auto_670956 ) ) ( not ( = ?auto_670953 ?auto_670958 ) ) ( not ( = ?auto_670953 ?auto_670959 ) ) ( not ( = ?auto_670953 ?auto_670960 ) ) ( not ( = ?auto_670953 ?auto_670961 ) ) ( not ( = ?auto_670953 ?auto_670962 ) ) ( not ( = ?auto_670953 ?auto_670963 ) ) ( not ( = ?auto_670953 ?auto_670964 ) ) ( not ( = ?auto_670954 ?auto_670955 ) ) ( not ( = ?auto_670954 ?auto_670957 ) ) ( not ( = ?auto_670954 ?auto_670956 ) ) ( not ( = ?auto_670954 ?auto_670958 ) ) ( not ( = ?auto_670954 ?auto_670959 ) ) ( not ( = ?auto_670954 ?auto_670960 ) ) ( not ( = ?auto_670954 ?auto_670961 ) ) ( not ( = ?auto_670954 ?auto_670962 ) ) ( not ( = ?auto_670954 ?auto_670963 ) ) ( not ( = ?auto_670954 ?auto_670964 ) ) ( not ( = ?auto_670955 ?auto_670957 ) ) ( not ( = ?auto_670955 ?auto_670956 ) ) ( not ( = ?auto_670955 ?auto_670958 ) ) ( not ( = ?auto_670955 ?auto_670959 ) ) ( not ( = ?auto_670955 ?auto_670960 ) ) ( not ( = ?auto_670955 ?auto_670961 ) ) ( not ( = ?auto_670955 ?auto_670962 ) ) ( not ( = ?auto_670955 ?auto_670963 ) ) ( not ( = ?auto_670955 ?auto_670964 ) ) ( not ( = ?auto_670957 ?auto_670956 ) ) ( not ( = ?auto_670957 ?auto_670958 ) ) ( not ( = ?auto_670957 ?auto_670959 ) ) ( not ( = ?auto_670957 ?auto_670960 ) ) ( not ( = ?auto_670957 ?auto_670961 ) ) ( not ( = ?auto_670957 ?auto_670962 ) ) ( not ( = ?auto_670957 ?auto_670963 ) ) ( not ( = ?auto_670957 ?auto_670964 ) ) ( not ( = ?auto_670956 ?auto_670958 ) ) ( not ( = ?auto_670956 ?auto_670959 ) ) ( not ( = ?auto_670956 ?auto_670960 ) ) ( not ( = ?auto_670956 ?auto_670961 ) ) ( not ( = ?auto_670956 ?auto_670962 ) ) ( not ( = ?auto_670956 ?auto_670963 ) ) ( not ( = ?auto_670956 ?auto_670964 ) ) ( not ( = ?auto_670958 ?auto_670959 ) ) ( not ( = ?auto_670958 ?auto_670960 ) ) ( not ( = ?auto_670958 ?auto_670961 ) ) ( not ( = ?auto_670958 ?auto_670962 ) ) ( not ( = ?auto_670958 ?auto_670963 ) ) ( not ( = ?auto_670958 ?auto_670964 ) ) ( not ( = ?auto_670959 ?auto_670960 ) ) ( not ( = ?auto_670959 ?auto_670961 ) ) ( not ( = ?auto_670959 ?auto_670962 ) ) ( not ( = ?auto_670959 ?auto_670963 ) ) ( not ( = ?auto_670959 ?auto_670964 ) ) ( not ( = ?auto_670960 ?auto_670961 ) ) ( not ( = ?auto_670960 ?auto_670962 ) ) ( not ( = ?auto_670960 ?auto_670963 ) ) ( not ( = ?auto_670960 ?auto_670964 ) ) ( not ( = ?auto_670961 ?auto_670962 ) ) ( not ( = ?auto_670961 ?auto_670963 ) ) ( not ( = ?auto_670961 ?auto_670964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_670962 ?auto_670963 ?auto_670964 )
      ( MAKE-11CRATE-VERIFY ?auto_670953 ?auto_670954 ?auto_670955 ?auto_670957 ?auto_670956 ?auto_670958 ?auto_670959 ?auto_670960 ?auto_670961 ?auto_670962 ?auto_670963 ?auto_670964 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671096 - SURFACE
      ?auto_671097 - SURFACE
      ?auto_671098 - SURFACE
      ?auto_671100 - SURFACE
      ?auto_671099 - SURFACE
      ?auto_671101 - SURFACE
      ?auto_671102 - SURFACE
      ?auto_671103 - SURFACE
      ?auto_671104 - SURFACE
      ?auto_671105 - SURFACE
      ?auto_671106 - SURFACE
      ?auto_671107 - SURFACE
    )
    :vars
    (
      ?auto_671109 - HOIST
      ?auto_671113 - PLACE
      ?auto_671111 - TRUCK
      ?auto_671112 - PLACE
      ?auto_671108 - HOIST
      ?auto_671110 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_671109 ?auto_671113 ) ( SURFACE-AT ?auto_671106 ?auto_671113 ) ( CLEAR ?auto_671106 ) ( IS-CRATE ?auto_671107 ) ( not ( = ?auto_671106 ?auto_671107 ) ) ( AVAILABLE ?auto_671109 ) ( ON ?auto_671106 ?auto_671105 ) ( not ( = ?auto_671105 ?auto_671106 ) ) ( not ( = ?auto_671105 ?auto_671107 ) ) ( TRUCK-AT ?auto_671111 ?auto_671112 ) ( not ( = ?auto_671112 ?auto_671113 ) ) ( HOIST-AT ?auto_671108 ?auto_671112 ) ( not ( = ?auto_671109 ?auto_671108 ) ) ( AVAILABLE ?auto_671108 ) ( SURFACE-AT ?auto_671107 ?auto_671112 ) ( ON ?auto_671107 ?auto_671110 ) ( CLEAR ?auto_671107 ) ( not ( = ?auto_671106 ?auto_671110 ) ) ( not ( = ?auto_671107 ?auto_671110 ) ) ( not ( = ?auto_671105 ?auto_671110 ) ) ( ON ?auto_671097 ?auto_671096 ) ( ON ?auto_671098 ?auto_671097 ) ( ON ?auto_671100 ?auto_671098 ) ( ON ?auto_671099 ?auto_671100 ) ( ON ?auto_671101 ?auto_671099 ) ( ON ?auto_671102 ?auto_671101 ) ( ON ?auto_671103 ?auto_671102 ) ( ON ?auto_671104 ?auto_671103 ) ( ON ?auto_671105 ?auto_671104 ) ( not ( = ?auto_671096 ?auto_671097 ) ) ( not ( = ?auto_671096 ?auto_671098 ) ) ( not ( = ?auto_671096 ?auto_671100 ) ) ( not ( = ?auto_671096 ?auto_671099 ) ) ( not ( = ?auto_671096 ?auto_671101 ) ) ( not ( = ?auto_671096 ?auto_671102 ) ) ( not ( = ?auto_671096 ?auto_671103 ) ) ( not ( = ?auto_671096 ?auto_671104 ) ) ( not ( = ?auto_671096 ?auto_671105 ) ) ( not ( = ?auto_671096 ?auto_671106 ) ) ( not ( = ?auto_671096 ?auto_671107 ) ) ( not ( = ?auto_671096 ?auto_671110 ) ) ( not ( = ?auto_671097 ?auto_671098 ) ) ( not ( = ?auto_671097 ?auto_671100 ) ) ( not ( = ?auto_671097 ?auto_671099 ) ) ( not ( = ?auto_671097 ?auto_671101 ) ) ( not ( = ?auto_671097 ?auto_671102 ) ) ( not ( = ?auto_671097 ?auto_671103 ) ) ( not ( = ?auto_671097 ?auto_671104 ) ) ( not ( = ?auto_671097 ?auto_671105 ) ) ( not ( = ?auto_671097 ?auto_671106 ) ) ( not ( = ?auto_671097 ?auto_671107 ) ) ( not ( = ?auto_671097 ?auto_671110 ) ) ( not ( = ?auto_671098 ?auto_671100 ) ) ( not ( = ?auto_671098 ?auto_671099 ) ) ( not ( = ?auto_671098 ?auto_671101 ) ) ( not ( = ?auto_671098 ?auto_671102 ) ) ( not ( = ?auto_671098 ?auto_671103 ) ) ( not ( = ?auto_671098 ?auto_671104 ) ) ( not ( = ?auto_671098 ?auto_671105 ) ) ( not ( = ?auto_671098 ?auto_671106 ) ) ( not ( = ?auto_671098 ?auto_671107 ) ) ( not ( = ?auto_671098 ?auto_671110 ) ) ( not ( = ?auto_671100 ?auto_671099 ) ) ( not ( = ?auto_671100 ?auto_671101 ) ) ( not ( = ?auto_671100 ?auto_671102 ) ) ( not ( = ?auto_671100 ?auto_671103 ) ) ( not ( = ?auto_671100 ?auto_671104 ) ) ( not ( = ?auto_671100 ?auto_671105 ) ) ( not ( = ?auto_671100 ?auto_671106 ) ) ( not ( = ?auto_671100 ?auto_671107 ) ) ( not ( = ?auto_671100 ?auto_671110 ) ) ( not ( = ?auto_671099 ?auto_671101 ) ) ( not ( = ?auto_671099 ?auto_671102 ) ) ( not ( = ?auto_671099 ?auto_671103 ) ) ( not ( = ?auto_671099 ?auto_671104 ) ) ( not ( = ?auto_671099 ?auto_671105 ) ) ( not ( = ?auto_671099 ?auto_671106 ) ) ( not ( = ?auto_671099 ?auto_671107 ) ) ( not ( = ?auto_671099 ?auto_671110 ) ) ( not ( = ?auto_671101 ?auto_671102 ) ) ( not ( = ?auto_671101 ?auto_671103 ) ) ( not ( = ?auto_671101 ?auto_671104 ) ) ( not ( = ?auto_671101 ?auto_671105 ) ) ( not ( = ?auto_671101 ?auto_671106 ) ) ( not ( = ?auto_671101 ?auto_671107 ) ) ( not ( = ?auto_671101 ?auto_671110 ) ) ( not ( = ?auto_671102 ?auto_671103 ) ) ( not ( = ?auto_671102 ?auto_671104 ) ) ( not ( = ?auto_671102 ?auto_671105 ) ) ( not ( = ?auto_671102 ?auto_671106 ) ) ( not ( = ?auto_671102 ?auto_671107 ) ) ( not ( = ?auto_671102 ?auto_671110 ) ) ( not ( = ?auto_671103 ?auto_671104 ) ) ( not ( = ?auto_671103 ?auto_671105 ) ) ( not ( = ?auto_671103 ?auto_671106 ) ) ( not ( = ?auto_671103 ?auto_671107 ) ) ( not ( = ?auto_671103 ?auto_671110 ) ) ( not ( = ?auto_671104 ?auto_671105 ) ) ( not ( = ?auto_671104 ?auto_671106 ) ) ( not ( = ?auto_671104 ?auto_671107 ) ) ( not ( = ?auto_671104 ?auto_671110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671105 ?auto_671106 ?auto_671107 )
      ( MAKE-11CRATE-VERIFY ?auto_671096 ?auto_671097 ?auto_671098 ?auto_671100 ?auto_671099 ?auto_671101 ?auto_671102 ?auto_671103 ?auto_671104 ?auto_671105 ?auto_671106 ?auto_671107 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671240 - SURFACE
      ?auto_671241 - SURFACE
      ?auto_671242 - SURFACE
      ?auto_671244 - SURFACE
      ?auto_671243 - SURFACE
      ?auto_671245 - SURFACE
      ?auto_671246 - SURFACE
      ?auto_671247 - SURFACE
      ?auto_671248 - SURFACE
      ?auto_671249 - SURFACE
      ?auto_671250 - SURFACE
      ?auto_671251 - SURFACE
    )
    :vars
    (
      ?auto_671253 - HOIST
      ?auto_671252 - PLACE
      ?auto_671255 - PLACE
      ?auto_671257 - HOIST
      ?auto_671256 - SURFACE
      ?auto_671254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671253 ?auto_671252 ) ( SURFACE-AT ?auto_671250 ?auto_671252 ) ( CLEAR ?auto_671250 ) ( IS-CRATE ?auto_671251 ) ( not ( = ?auto_671250 ?auto_671251 ) ) ( AVAILABLE ?auto_671253 ) ( ON ?auto_671250 ?auto_671249 ) ( not ( = ?auto_671249 ?auto_671250 ) ) ( not ( = ?auto_671249 ?auto_671251 ) ) ( not ( = ?auto_671255 ?auto_671252 ) ) ( HOIST-AT ?auto_671257 ?auto_671255 ) ( not ( = ?auto_671253 ?auto_671257 ) ) ( AVAILABLE ?auto_671257 ) ( SURFACE-AT ?auto_671251 ?auto_671255 ) ( ON ?auto_671251 ?auto_671256 ) ( CLEAR ?auto_671251 ) ( not ( = ?auto_671250 ?auto_671256 ) ) ( not ( = ?auto_671251 ?auto_671256 ) ) ( not ( = ?auto_671249 ?auto_671256 ) ) ( TRUCK-AT ?auto_671254 ?auto_671252 ) ( ON ?auto_671241 ?auto_671240 ) ( ON ?auto_671242 ?auto_671241 ) ( ON ?auto_671244 ?auto_671242 ) ( ON ?auto_671243 ?auto_671244 ) ( ON ?auto_671245 ?auto_671243 ) ( ON ?auto_671246 ?auto_671245 ) ( ON ?auto_671247 ?auto_671246 ) ( ON ?auto_671248 ?auto_671247 ) ( ON ?auto_671249 ?auto_671248 ) ( not ( = ?auto_671240 ?auto_671241 ) ) ( not ( = ?auto_671240 ?auto_671242 ) ) ( not ( = ?auto_671240 ?auto_671244 ) ) ( not ( = ?auto_671240 ?auto_671243 ) ) ( not ( = ?auto_671240 ?auto_671245 ) ) ( not ( = ?auto_671240 ?auto_671246 ) ) ( not ( = ?auto_671240 ?auto_671247 ) ) ( not ( = ?auto_671240 ?auto_671248 ) ) ( not ( = ?auto_671240 ?auto_671249 ) ) ( not ( = ?auto_671240 ?auto_671250 ) ) ( not ( = ?auto_671240 ?auto_671251 ) ) ( not ( = ?auto_671240 ?auto_671256 ) ) ( not ( = ?auto_671241 ?auto_671242 ) ) ( not ( = ?auto_671241 ?auto_671244 ) ) ( not ( = ?auto_671241 ?auto_671243 ) ) ( not ( = ?auto_671241 ?auto_671245 ) ) ( not ( = ?auto_671241 ?auto_671246 ) ) ( not ( = ?auto_671241 ?auto_671247 ) ) ( not ( = ?auto_671241 ?auto_671248 ) ) ( not ( = ?auto_671241 ?auto_671249 ) ) ( not ( = ?auto_671241 ?auto_671250 ) ) ( not ( = ?auto_671241 ?auto_671251 ) ) ( not ( = ?auto_671241 ?auto_671256 ) ) ( not ( = ?auto_671242 ?auto_671244 ) ) ( not ( = ?auto_671242 ?auto_671243 ) ) ( not ( = ?auto_671242 ?auto_671245 ) ) ( not ( = ?auto_671242 ?auto_671246 ) ) ( not ( = ?auto_671242 ?auto_671247 ) ) ( not ( = ?auto_671242 ?auto_671248 ) ) ( not ( = ?auto_671242 ?auto_671249 ) ) ( not ( = ?auto_671242 ?auto_671250 ) ) ( not ( = ?auto_671242 ?auto_671251 ) ) ( not ( = ?auto_671242 ?auto_671256 ) ) ( not ( = ?auto_671244 ?auto_671243 ) ) ( not ( = ?auto_671244 ?auto_671245 ) ) ( not ( = ?auto_671244 ?auto_671246 ) ) ( not ( = ?auto_671244 ?auto_671247 ) ) ( not ( = ?auto_671244 ?auto_671248 ) ) ( not ( = ?auto_671244 ?auto_671249 ) ) ( not ( = ?auto_671244 ?auto_671250 ) ) ( not ( = ?auto_671244 ?auto_671251 ) ) ( not ( = ?auto_671244 ?auto_671256 ) ) ( not ( = ?auto_671243 ?auto_671245 ) ) ( not ( = ?auto_671243 ?auto_671246 ) ) ( not ( = ?auto_671243 ?auto_671247 ) ) ( not ( = ?auto_671243 ?auto_671248 ) ) ( not ( = ?auto_671243 ?auto_671249 ) ) ( not ( = ?auto_671243 ?auto_671250 ) ) ( not ( = ?auto_671243 ?auto_671251 ) ) ( not ( = ?auto_671243 ?auto_671256 ) ) ( not ( = ?auto_671245 ?auto_671246 ) ) ( not ( = ?auto_671245 ?auto_671247 ) ) ( not ( = ?auto_671245 ?auto_671248 ) ) ( not ( = ?auto_671245 ?auto_671249 ) ) ( not ( = ?auto_671245 ?auto_671250 ) ) ( not ( = ?auto_671245 ?auto_671251 ) ) ( not ( = ?auto_671245 ?auto_671256 ) ) ( not ( = ?auto_671246 ?auto_671247 ) ) ( not ( = ?auto_671246 ?auto_671248 ) ) ( not ( = ?auto_671246 ?auto_671249 ) ) ( not ( = ?auto_671246 ?auto_671250 ) ) ( not ( = ?auto_671246 ?auto_671251 ) ) ( not ( = ?auto_671246 ?auto_671256 ) ) ( not ( = ?auto_671247 ?auto_671248 ) ) ( not ( = ?auto_671247 ?auto_671249 ) ) ( not ( = ?auto_671247 ?auto_671250 ) ) ( not ( = ?auto_671247 ?auto_671251 ) ) ( not ( = ?auto_671247 ?auto_671256 ) ) ( not ( = ?auto_671248 ?auto_671249 ) ) ( not ( = ?auto_671248 ?auto_671250 ) ) ( not ( = ?auto_671248 ?auto_671251 ) ) ( not ( = ?auto_671248 ?auto_671256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671249 ?auto_671250 ?auto_671251 )
      ( MAKE-11CRATE-VERIFY ?auto_671240 ?auto_671241 ?auto_671242 ?auto_671244 ?auto_671243 ?auto_671245 ?auto_671246 ?auto_671247 ?auto_671248 ?auto_671249 ?auto_671250 ?auto_671251 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671384 - SURFACE
      ?auto_671385 - SURFACE
      ?auto_671386 - SURFACE
      ?auto_671388 - SURFACE
      ?auto_671387 - SURFACE
      ?auto_671389 - SURFACE
      ?auto_671390 - SURFACE
      ?auto_671391 - SURFACE
      ?auto_671392 - SURFACE
      ?auto_671393 - SURFACE
      ?auto_671394 - SURFACE
      ?auto_671395 - SURFACE
    )
    :vars
    (
      ?auto_671401 - HOIST
      ?auto_671399 - PLACE
      ?auto_671400 - PLACE
      ?auto_671398 - HOIST
      ?auto_671397 - SURFACE
      ?auto_671396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671401 ?auto_671399 ) ( IS-CRATE ?auto_671395 ) ( not ( = ?auto_671394 ?auto_671395 ) ) ( not ( = ?auto_671393 ?auto_671394 ) ) ( not ( = ?auto_671393 ?auto_671395 ) ) ( not ( = ?auto_671400 ?auto_671399 ) ) ( HOIST-AT ?auto_671398 ?auto_671400 ) ( not ( = ?auto_671401 ?auto_671398 ) ) ( AVAILABLE ?auto_671398 ) ( SURFACE-AT ?auto_671395 ?auto_671400 ) ( ON ?auto_671395 ?auto_671397 ) ( CLEAR ?auto_671395 ) ( not ( = ?auto_671394 ?auto_671397 ) ) ( not ( = ?auto_671395 ?auto_671397 ) ) ( not ( = ?auto_671393 ?auto_671397 ) ) ( TRUCK-AT ?auto_671396 ?auto_671399 ) ( SURFACE-AT ?auto_671393 ?auto_671399 ) ( CLEAR ?auto_671393 ) ( LIFTING ?auto_671401 ?auto_671394 ) ( IS-CRATE ?auto_671394 ) ( ON ?auto_671385 ?auto_671384 ) ( ON ?auto_671386 ?auto_671385 ) ( ON ?auto_671388 ?auto_671386 ) ( ON ?auto_671387 ?auto_671388 ) ( ON ?auto_671389 ?auto_671387 ) ( ON ?auto_671390 ?auto_671389 ) ( ON ?auto_671391 ?auto_671390 ) ( ON ?auto_671392 ?auto_671391 ) ( ON ?auto_671393 ?auto_671392 ) ( not ( = ?auto_671384 ?auto_671385 ) ) ( not ( = ?auto_671384 ?auto_671386 ) ) ( not ( = ?auto_671384 ?auto_671388 ) ) ( not ( = ?auto_671384 ?auto_671387 ) ) ( not ( = ?auto_671384 ?auto_671389 ) ) ( not ( = ?auto_671384 ?auto_671390 ) ) ( not ( = ?auto_671384 ?auto_671391 ) ) ( not ( = ?auto_671384 ?auto_671392 ) ) ( not ( = ?auto_671384 ?auto_671393 ) ) ( not ( = ?auto_671384 ?auto_671394 ) ) ( not ( = ?auto_671384 ?auto_671395 ) ) ( not ( = ?auto_671384 ?auto_671397 ) ) ( not ( = ?auto_671385 ?auto_671386 ) ) ( not ( = ?auto_671385 ?auto_671388 ) ) ( not ( = ?auto_671385 ?auto_671387 ) ) ( not ( = ?auto_671385 ?auto_671389 ) ) ( not ( = ?auto_671385 ?auto_671390 ) ) ( not ( = ?auto_671385 ?auto_671391 ) ) ( not ( = ?auto_671385 ?auto_671392 ) ) ( not ( = ?auto_671385 ?auto_671393 ) ) ( not ( = ?auto_671385 ?auto_671394 ) ) ( not ( = ?auto_671385 ?auto_671395 ) ) ( not ( = ?auto_671385 ?auto_671397 ) ) ( not ( = ?auto_671386 ?auto_671388 ) ) ( not ( = ?auto_671386 ?auto_671387 ) ) ( not ( = ?auto_671386 ?auto_671389 ) ) ( not ( = ?auto_671386 ?auto_671390 ) ) ( not ( = ?auto_671386 ?auto_671391 ) ) ( not ( = ?auto_671386 ?auto_671392 ) ) ( not ( = ?auto_671386 ?auto_671393 ) ) ( not ( = ?auto_671386 ?auto_671394 ) ) ( not ( = ?auto_671386 ?auto_671395 ) ) ( not ( = ?auto_671386 ?auto_671397 ) ) ( not ( = ?auto_671388 ?auto_671387 ) ) ( not ( = ?auto_671388 ?auto_671389 ) ) ( not ( = ?auto_671388 ?auto_671390 ) ) ( not ( = ?auto_671388 ?auto_671391 ) ) ( not ( = ?auto_671388 ?auto_671392 ) ) ( not ( = ?auto_671388 ?auto_671393 ) ) ( not ( = ?auto_671388 ?auto_671394 ) ) ( not ( = ?auto_671388 ?auto_671395 ) ) ( not ( = ?auto_671388 ?auto_671397 ) ) ( not ( = ?auto_671387 ?auto_671389 ) ) ( not ( = ?auto_671387 ?auto_671390 ) ) ( not ( = ?auto_671387 ?auto_671391 ) ) ( not ( = ?auto_671387 ?auto_671392 ) ) ( not ( = ?auto_671387 ?auto_671393 ) ) ( not ( = ?auto_671387 ?auto_671394 ) ) ( not ( = ?auto_671387 ?auto_671395 ) ) ( not ( = ?auto_671387 ?auto_671397 ) ) ( not ( = ?auto_671389 ?auto_671390 ) ) ( not ( = ?auto_671389 ?auto_671391 ) ) ( not ( = ?auto_671389 ?auto_671392 ) ) ( not ( = ?auto_671389 ?auto_671393 ) ) ( not ( = ?auto_671389 ?auto_671394 ) ) ( not ( = ?auto_671389 ?auto_671395 ) ) ( not ( = ?auto_671389 ?auto_671397 ) ) ( not ( = ?auto_671390 ?auto_671391 ) ) ( not ( = ?auto_671390 ?auto_671392 ) ) ( not ( = ?auto_671390 ?auto_671393 ) ) ( not ( = ?auto_671390 ?auto_671394 ) ) ( not ( = ?auto_671390 ?auto_671395 ) ) ( not ( = ?auto_671390 ?auto_671397 ) ) ( not ( = ?auto_671391 ?auto_671392 ) ) ( not ( = ?auto_671391 ?auto_671393 ) ) ( not ( = ?auto_671391 ?auto_671394 ) ) ( not ( = ?auto_671391 ?auto_671395 ) ) ( not ( = ?auto_671391 ?auto_671397 ) ) ( not ( = ?auto_671392 ?auto_671393 ) ) ( not ( = ?auto_671392 ?auto_671394 ) ) ( not ( = ?auto_671392 ?auto_671395 ) ) ( not ( = ?auto_671392 ?auto_671397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671393 ?auto_671394 ?auto_671395 )
      ( MAKE-11CRATE-VERIFY ?auto_671384 ?auto_671385 ?auto_671386 ?auto_671388 ?auto_671387 ?auto_671389 ?auto_671390 ?auto_671391 ?auto_671392 ?auto_671393 ?auto_671394 ?auto_671395 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_671528 - SURFACE
      ?auto_671529 - SURFACE
      ?auto_671530 - SURFACE
      ?auto_671532 - SURFACE
      ?auto_671531 - SURFACE
      ?auto_671533 - SURFACE
      ?auto_671534 - SURFACE
      ?auto_671535 - SURFACE
      ?auto_671536 - SURFACE
      ?auto_671537 - SURFACE
      ?auto_671538 - SURFACE
      ?auto_671539 - SURFACE
    )
    :vars
    (
      ?auto_671543 - HOIST
      ?auto_671545 - PLACE
      ?auto_671540 - PLACE
      ?auto_671544 - HOIST
      ?auto_671541 - SURFACE
      ?auto_671542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_671543 ?auto_671545 ) ( IS-CRATE ?auto_671539 ) ( not ( = ?auto_671538 ?auto_671539 ) ) ( not ( = ?auto_671537 ?auto_671538 ) ) ( not ( = ?auto_671537 ?auto_671539 ) ) ( not ( = ?auto_671540 ?auto_671545 ) ) ( HOIST-AT ?auto_671544 ?auto_671540 ) ( not ( = ?auto_671543 ?auto_671544 ) ) ( AVAILABLE ?auto_671544 ) ( SURFACE-AT ?auto_671539 ?auto_671540 ) ( ON ?auto_671539 ?auto_671541 ) ( CLEAR ?auto_671539 ) ( not ( = ?auto_671538 ?auto_671541 ) ) ( not ( = ?auto_671539 ?auto_671541 ) ) ( not ( = ?auto_671537 ?auto_671541 ) ) ( TRUCK-AT ?auto_671542 ?auto_671545 ) ( SURFACE-AT ?auto_671537 ?auto_671545 ) ( CLEAR ?auto_671537 ) ( IS-CRATE ?auto_671538 ) ( AVAILABLE ?auto_671543 ) ( IN ?auto_671538 ?auto_671542 ) ( ON ?auto_671529 ?auto_671528 ) ( ON ?auto_671530 ?auto_671529 ) ( ON ?auto_671532 ?auto_671530 ) ( ON ?auto_671531 ?auto_671532 ) ( ON ?auto_671533 ?auto_671531 ) ( ON ?auto_671534 ?auto_671533 ) ( ON ?auto_671535 ?auto_671534 ) ( ON ?auto_671536 ?auto_671535 ) ( ON ?auto_671537 ?auto_671536 ) ( not ( = ?auto_671528 ?auto_671529 ) ) ( not ( = ?auto_671528 ?auto_671530 ) ) ( not ( = ?auto_671528 ?auto_671532 ) ) ( not ( = ?auto_671528 ?auto_671531 ) ) ( not ( = ?auto_671528 ?auto_671533 ) ) ( not ( = ?auto_671528 ?auto_671534 ) ) ( not ( = ?auto_671528 ?auto_671535 ) ) ( not ( = ?auto_671528 ?auto_671536 ) ) ( not ( = ?auto_671528 ?auto_671537 ) ) ( not ( = ?auto_671528 ?auto_671538 ) ) ( not ( = ?auto_671528 ?auto_671539 ) ) ( not ( = ?auto_671528 ?auto_671541 ) ) ( not ( = ?auto_671529 ?auto_671530 ) ) ( not ( = ?auto_671529 ?auto_671532 ) ) ( not ( = ?auto_671529 ?auto_671531 ) ) ( not ( = ?auto_671529 ?auto_671533 ) ) ( not ( = ?auto_671529 ?auto_671534 ) ) ( not ( = ?auto_671529 ?auto_671535 ) ) ( not ( = ?auto_671529 ?auto_671536 ) ) ( not ( = ?auto_671529 ?auto_671537 ) ) ( not ( = ?auto_671529 ?auto_671538 ) ) ( not ( = ?auto_671529 ?auto_671539 ) ) ( not ( = ?auto_671529 ?auto_671541 ) ) ( not ( = ?auto_671530 ?auto_671532 ) ) ( not ( = ?auto_671530 ?auto_671531 ) ) ( not ( = ?auto_671530 ?auto_671533 ) ) ( not ( = ?auto_671530 ?auto_671534 ) ) ( not ( = ?auto_671530 ?auto_671535 ) ) ( not ( = ?auto_671530 ?auto_671536 ) ) ( not ( = ?auto_671530 ?auto_671537 ) ) ( not ( = ?auto_671530 ?auto_671538 ) ) ( not ( = ?auto_671530 ?auto_671539 ) ) ( not ( = ?auto_671530 ?auto_671541 ) ) ( not ( = ?auto_671532 ?auto_671531 ) ) ( not ( = ?auto_671532 ?auto_671533 ) ) ( not ( = ?auto_671532 ?auto_671534 ) ) ( not ( = ?auto_671532 ?auto_671535 ) ) ( not ( = ?auto_671532 ?auto_671536 ) ) ( not ( = ?auto_671532 ?auto_671537 ) ) ( not ( = ?auto_671532 ?auto_671538 ) ) ( not ( = ?auto_671532 ?auto_671539 ) ) ( not ( = ?auto_671532 ?auto_671541 ) ) ( not ( = ?auto_671531 ?auto_671533 ) ) ( not ( = ?auto_671531 ?auto_671534 ) ) ( not ( = ?auto_671531 ?auto_671535 ) ) ( not ( = ?auto_671531 ?auto_671536 ) ) ( not ( = ?auto_671531 ?auto_671537 ) ) ( not ( = ?auto_671531 ?auto_671538 ) ) ( not ( = ?auto_671531 ?auto_671539 ) ) ( not ( = ?auto_671531 ?auto_671541 ) ) ( not ( = ?auto_671533 ?auto_671534 ) ) ( not ( = ?auto_671533 ?auto_671535 ) ) ( not ( = ?auto_671533 ?auto_671536 ) ) ( not ( = ?auto_671533 ?auto_671537 ) ) ( not ( = ?auto_671533 ?auto_671538 ) ) ( not ( = ?auto_671533 ?auto_671539 ) ) ( not ( = ?auto_671533 ?auto_671541 ) ) ( not ( = ?auto_671534 ?auto_671535 ) ) ( not ( = ?auto_671534 ?auto_671536 ) ) ( not ( = ?auto_671534 ?auto_671537 ) ) ( not ( = ?auto_671534 ?auto_671538 ) ) ( not ( = ?auto_671534 ?auto_671539 ) ) ( not ( = ?auto_671534 ?auto_671541 ) ) ( not ( = ?auto_671535 ?auto_671536 ) ) ( not ( = ?auto_671535 ?auto_671537 ) ) ( not ( = ?auto_671535 ?auto_671538 ) ) ( not ( = ?auto_671535 ?auto_671539 ) ) ( not ( = ?auto_671535 ?auto_671541 ) ) ( not ( = ?auto_671536 ?auto_671537 ) ) ( not ( = ?auto_671536 ?auto_671538 ) ) ( not ( = ?auto_671536 ?auto_671539 ) ) ( not ( = ?auto_671536 ?auto_671541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_671537 ?auto_671538 ?auto_671539 )
      ( MAKE-11CRATE-VERIFY ?auto_671528 ?auto_671529 ?auto_671530 ?auto_671532 ?auto_671531 ?auto_671533 ?auto_671534 ?auto_671535 ?auto_671536 ?auto_671537 ?auto_671538 ?auto_671539 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_680797 - SURFACE
      ?auto_680798 - SURFACE
      ?auto_680799 - SURFACE
      ?auto_680801 - SURFACE
      ?auto_680800 - SURFACE
      ?auto_680802 - SURFACE
      ?auto_680803 - SURFACE
      ?auto_680804 - SURFACE
      ?auto_680805 - SURFACE
      ?auto_680806 - SURFACE
      ?auto_680807 - SURFACE
      ?auto_680808 - SURFACE
      ?auto_680809 - SURFACE
    )
    :vars
    (
      ?auto_680810 - HOIST
      ?auto_680811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_680810 ?auto_680811 ) ( SURFACE-AT ?auto_680808 ?auto_680811 ) ( CLEAR ?auto_680808 ) ( LIFTING ?auto_680810 ?auto_680809 ) ( IS-CRATE ?auto_680809 ) ( not ( = ?auto_680808 ?auto_680809 ) ) ( ON ?auto_680798 ?auto_680797 ) ( ON ?auto_680799 ?auto_680798 ) ( ON ?auto_680801 ?auto_680799 ) ( ON ?auto_680800 ?auto_680801 ) ( ON ?auto_680802 ?auto_680800 ) ( ON ?auto_680803 ?auto_680802 ) ( ON ?auto_680804 ?auto_680803 ) ( ON ?auto_680805 ?auto_680804 ) ( ON ?auto_680806 ?auto_680805 ) ( ON ?auto_680807 ?auto_680806 ) ( ON ?auto_680808 ?auto_680807 ) ( not ( = ?auto_680797 ?auto_680798 ) ) ( not ( = ?auto_680797 ?auto_680799 ) ) ( not ( = ?auto_680797 ?auto_680801 ) ) ( not ( = ?auto_680797 ?auto_680800 ) ) ( not ( = ?auto_680797 ?auto_680802 ) ) ( not ( = ?auto_680797 ?auto_680803 ) ) ( not ( = ?auto_680797 ?auto_680804 ) ) ( not ( = ?auto_680797 ?auto_680805 ) ) ( not ( = ?auto_680797 ?auto_680806 ) ) ( not ( = ?auto_680797 ?auto_680807 ) ) ( not ( = ?auto_680797 ?auto_680808 ) ) ( not ( = ?auto_680797 ?auto_680809 ) ) ( not ( = ?auto_680798 ?auto_680799 ) ) ( not ( = ?auto_680798 ?auto_680801 ) ) ( not ( = ?auto_680798 ?auto_680800 ) ) ( not ( = ?auto_680798 ?auto_680802 ) ) ( not ( = ?auto_680798 ?auto_680803 ) ) ( not ( = ?auto_680798 ?auto_680804 ) ) ( not ( = ?auto_680798 ?auto_680805 ) ) ( not ( = ?auto_680798 ?auto_680806 ) ) ( not ( = ?auto_680798 ?auto_680807 ) ) ( not ( = ?auto_680798 ?auto_680808 ) ) ( not ( = ?auto_680798 ?auto_680809 ) ) ( not ( = ?auto_680799 ?auto_680801 ) ) ( not ( = ?auto_680799 ?auto_680800 ) ) ( not ( = ?auto_680799 ?auto_680802 ) ) ( not ( = ?auto_680799 ?auto_680803 ) ) ( not ( = ?auto_680799 ?auto_680804 ) ) ( not ( = ?auto_680799 ?auto_680805 ) ) ( not ( = ?auto_680799 ?auto_680806 ) ) ( not ( = ?auto_680799 ?auto_680807 ) ) ( not ( = ?auto_680799 ?auto_680808 ) ) ( not ( = ?auto_680799 ?auto_680809 ) ) ( not ( = ?auto_680801 ?auto_680800 ) ) ( not ( = ?auto_680801 ?auto_680802 ) ) ( not ( = ?auto_680801 ?auto_680803 ) ) ( not ( = ?auto_680801 ?auto_680804 ) ) ( not ( = ?auto_680801 ?auto_680805 ) ) ( not ( = ?auto_680801 ?auto_680806 ) ) ( not ( = ?auto_680801 ?auto_680807 ) ) ( not ( = ?auto_680801 ?auto_680808 ) ) ( not ( = ?auto_680801 ?auto_680809 ) ) ( not ( = ?auto_680800 ?auto_680802 ) ) ( not ( = ?auto_680800 ?auto_680803 ) ) ( not ( = ?auto_680800 ?auto_680804 ) ) ( not ( = ?auto_680800 ?auto_680805 ) ) ( not ( = ?auto_680800 ?auto_680806 ) ) ( not ( = ?auto_680800 ?auto_680807 ) ) ( not ( = ?auto_680800 ?auto_680808 ) ) ( not ( = ?auto_680800 ?auto_680809 ) ) ( not ( = ?auto_680802 ?auto_680803 ) ) ( not ( = ?auto_680802 ?auto_680804 ) ) ( not ( = ?auto_680802 ?auto_680805 ) ) ( not ( = ?auto_680802 ?auto_680806 ) ) ( not ( = ?auto_680802 ?auto_680807 ) ) ( not ( = ?auto_680802 ?auto_680808 ) ) ( not ( = ?auto_680802 ?auto_680809 ) ) ( not ( = ?auto_680803 ?auto_680804 ) ) ( not ( = ?auto_680803 ?auto_680805 ) ) ( not ( = ?auto_680803 ?auto_680806 ) ) ( not ( = ?auto_680803 ?auto_680807 ) ) ( not ( = ?auto_680803 ?auto_680808 ) ) ( not ( = ?auto_680803 ?auto_680809 ) ) ( not ( = ?auto_680804 ?auto_680805 ) ) ( not ( = ?auto_680804 ?auto_680806 ) ) ( not ( = ?auto_680804 ?auto_680807 ) ) ( not ( = ?auto_680804 ?auto_680808 ) ) ( not ( = ?auto_680804 ?auto_680809 ) ) ( not ( = ?auto_680805 ?auto_680806 ) ) ( not ( = ?auto_680805 ?auto_680807 ) ) ( not ( = ?auto_680805 ?auto_680808 ) ) ( not ( = ?auto_680805 ?auto_680809 ) ) ( not ( = ?auto_680806 ?auto_680807 ) ) ( not ( = ?auto_680806 ?auto_680808 ) ) ( not ( = ?auto_680806 ?auto_680809 ) ) ( not ( = ?auto_680807 ?auto_680808 ) ) ( not ( = ?auto_680807 ?auto_680809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_680808 ?auto_680809 )
      ( MAKE-12CRATE-VERIFY ?auto_680797 ?auto_680798 ?auto_680799 ?auto_680801 ?auto_680800 ?auto_680802 ?auto_680803 ?auto_680804 ?auto_680805 ?auto_680806 ?auto_680807 ?auto_680808 ?auto_680809 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_680922 - SURFACE
      ?auto_680923 - SURFACE
      ?auto_680924 - SURFACE
      ?auto_680926 - SURFACE
      ?auto_680925 - SURFACE
      ?auto_680927 - SURFACE
      ?auto_680928 - SURFACE
      ?auto_680929 - SURFACE
      ?auto_680930 - SURFACE
      ?auto_680931 - SURFACE
      ?auto_680932 - SURFACE
      ?auto_680933 - SURFACE
      ?auto_680934 - SURFACE
    )
    :vars
    (
      ?auto_680935 - HOIST
      ?auto_680937 - PLACE
      ?auto_680936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_680935 ?auto_680937 ) ( SURFACE-AT ?auto_680933 ?auto_680937 ) ( CLEAR ?auto_680933 ) ( IS-CRATE ?auto_680934 ) ( not ( = ?auto_680933 ?auto_680934 ) ) ( TRUCK-AT ?auto_680936 ?auto_680937 ) ( AVAILABLE ?auto_680935 ) ( IN ?auto_680934 ?auto_680936 ) ( ON ?auto_680933 ?auto_680932 ) ( not ( = ?auto_680932 ?auto_680933 ) ) ( not ( = ?auto_680932 ?auto_680934 ) ) ( ON ?auto_680923 ?auto_680922 ) ( ON ?auto_680924 ?auto_680923 ) ( ON ?auto_680926 ?auto_680924 ) ( ON ?auto_680925 ?auto_680926 ) ( ON ?auto_680927 ?auto_680925 ) ( ON ?auto_680928 ?auto_680927 ) ( ON ?auto_680929 ?auto_680928 ) ( ON ?auto_680930 ?auto_680929 ) ( ON ?auto_680931 ?auto_680930 ) ( ON ?auto_680932 ?auto_680931 ) ( not ( = ?auto_680922 ?auto_680923 ) ) ( not ( = ?auto_680922 ?auto_680924 ) ) ( not ( = ?auto_680922 ?auto_680926 ) ) ( not ( = ?auto_680922 ?auto_680925 ) ) ( not ( = ?auto_680922 ?auto_680927 ) ) ( not ( = ?auto_680922 ?auto_680928 ) ) ( not ( = ?auto_680922 ?auto_680929 ) ) ( not ( = ?auto_680922 ?auto_680930 ) ) ( not ( = ?auto_680922 ?auto_680931 ) ) ( not ( = ?auto_680922 ?auto_680932 ) ) ( not ( = ?auto_680922 ?auto_680933 ) ) ( not ( = ?auto_680922 ?auto_680934 ) ) ( not ( = ?auto_680923 ?auto_680924 ) ) ( not ( = ?auto_680923 ?auto_680926 ) ) ( not ( = ?auto_680923 ?auto_680925 ) ) ( not ( = ?auto_680923 ?auto_680927 ) ) ( not ( = ?auto_680923 ?auto_680928 ) ) ( not ( = ?auto_680923 ?auto_680929 ) ) ( not ( = ?auto_680923 ?auto_680930 ) ) ( not ( = ?auto_680923 ?auto_680931 ) ) ( not ( = ?auto_680923 ?auto_680932 ) ) ( not ( = ?auto_680923 ?auto_680933 ) ) ( not ( = ?auto_680923 ?auto_680934 ) ) ( not ( = ?auto_680924 ?auto_680926 ) ) ( not ( = ?auto_680924 ?auto_680925 ) ) ( not ( = ?auto_680924 ?auto_680927 ) ) ( not ( = ?auto_680924 ?auto_680928 ) ) ( not ( = ?auto_680924 ?auto_680929 ) ) ( not ( = ?auto_680924 ?auto_680930 ) ) ( not ( = ?auto_680924 ?auto_680931 ) ) ( not ( = ?auto_680924 ?auto_680932 ) ) ( not ( = ?auto_680924 ?auto_680933 ) ) ( not ( = ?auto_680924 ?auto_680934 ) ) ( not ( = ?auto_680926 ?auto_680925 ) ) ( not ( = ?auto_680926 ?auto_680927 ) ) ( not ( = ?auto_680926 ?auto_680928 ) ) ( not ( = ?auto_680926 ?auto_680929 ) ) ( not ( = ?auto_680926 ?auto_680930 ) ) ( not ( = ?auto_680926 ?auto_680931 ) ) ( not ( = ?auto_680926 ?auto_680932 ) ) ( not ( = ?auto_680926 ?auto_680933 ) ) ( not ( = ?auto_680926 ?auto_680934 ) ) ( not ( = ?auto_680925 ?auto_680927 ) ) ( not ( = ?auto_680925 ?auto_680928 ) ) ( not ( = ?auto_680925 ?auto_680929 ) ) ( not ( = ?auto_680925 ?auto_680930 ) ) ( not ( = ?auto_680925 ?auto_680931 ) ) ( not ( = ?auto_680925 ?auto_680932 ) ) ( not ( = ?auto_680925 ?auto_680933 ) ) ( not ( = ?auto_680925 ?auto_680934 ) ) ( not ( = ?auto_680927 ?auto_680928 ) ) ( not ( = ?auto_680927 ?auto_680929 ) ) ( not ( = ?auto_680927 ?auto_680930 ) ) ( not ( = ?auto_680927 ?auto_680931 ) ) ( not ( = ?auto_680927 ?auto_680932 ) ) ( not ( = ?auto_680927 ?auto_680933 ) ) ( not ( = ?auto_680927 ?auto_680934 ) ) ( not ( = ?auto_680928 ?auto_680929 ) ) ( not ( = ?auto_680928 ?auto_680930 ) ) ( not ( = ?auto_680928 ?auto_680931 ) ) ( not ( = ?auto_680928 ?auto_680932 ) ) ( not ( = ?auto_680928 ?auto_680933 ) ) ( not ( = ?auto_680928 ?auto_680934 ) ) ( not ( = ?auto_680929 ?auto_680930 ) ) ( not ( = ?auto_680929 ?auto_680931 ) ) ( not ( = ?auto_680929 ?auto_680932 ) ) ( not ( = ?auto_680929 ?auto_680933 ) ) ( not ( = ?auto_680929 ?auto_680934 ) ) ( not ( = ?auto_680930 ?auto_680931 ) ) ( not ( = ?auto_680930 ?auto_680932 ) ) ( not ( = ?auto_680930 ?auto_680933 ) ) ( not ( = ?auto_680930 ?auto_680934 ) ) ( not ( = ?auto_680931 ?auto_680932 ) ) ( not ( = ?auto_680931 ?auto_680933 ) ) ( not ( = ?auto_680931 ?auto_680934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_680932 ?auto_680933 ?auto_680934 )
      ( MAKE-12CRATE-VERIFY ?auto_680922 ?auto_680923 ?auto_680924 ?auto_680926 ?auto_680925 ?auto_680927 ?auto_680928 ?auto_680929 ?auto_680930 ?auto_680931 ?auto_680932 ?auto_680933 ?auto_680934 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681060 - SURFACE
      ?auto_681061 - SURFACE
      ?auto_681062 - SURFACE
      ?auto_681064 - SURFACE
      ?auto_681063 - SURFACE
      ?auto_681065 - SURFACE
      ?auto_681066 - SURFACE
      ?auto_681067 - SURFACE
      ?auto_681068 - SURFACE
      ?auto_681069 - SURFACE
      ?auto_681070 - SURFACE
      ?auto_681071 - SURFACE
      ?auto_681072 - SURFACE
    )
    :vars
    (
      ?auto_681074 - HOIST
      ?auto_681075 - PLACE
      ?auto_681076 - TRUCK
      ?auto_681073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681074 ?auto_681075 ) ( SURFACE-AT ?auto_681071 ?auto_681075 ) ( CLEAR ?auto_681071 ) ( IS-CRATE ?auto_681072 ) ( not ( = ?auto_681071 ?auto_681072 ) ) ( AVAILABLE ?auto_681074 ) ( IN ?auto_681072 ?auto_681076 ) ( ON ?auto_681071 ?auto_681070 ) ( not ( = ?auto_681070 ?auto_681071 ) ) ( not ( = ?auto_681070 ?auto_681072 ) ) ( TRUCK-AT ?auto_681076 ?auto_681073 ) ( not ( = ?auto_681073 ?auto_681075 ) ) ( ON ?auto_681061 ?auto_681060 ) ( ON ?auto_681062 ?auto_681061 ) ( ON ?auto_681064 ?auto_681062 ) ( ON ?auto_681063 ?auto_681064 ) ( ON ?auto_681065 ?auto_681063 ) ( ON ?auto_681066 ?auto_681065 ) ( ON ?auto_681067 ?auto_681066 ) ( ON ?auto_681068 ?auto_681067 ) ( ON ?auto_681069 ?auto_681068 ) ( ON ?auto_681070 ?auto_681069 ) ( not ( = ?auto_681060 ?auto_681061 ) ) ( not ( = ?auto_681060 ?auto_681062 ) ) ( not ( = ?auto_681060 ?auto_681064 ) ) ( not ( = ?auto_681060 ?auto_681063 ) ) ( not ( = ?auto_681060 ?auto_681065 ) ) ( not ( = ?auto_681060 ?auto_681066 ) ) ( not ( = ?auto_681060 ?auto_681067 ) ) ( not ( = ?auto_681060 ?auto_681068 ) ) ( not ( = ?auto_681060 ?auto_681069 ) ) ( not ( = ?auto_681060 ?auto_681070 ) ) ( not ( = ?auto_681060 ?auto_681071 ) ) ( not ( = ?auto_681060 ?auto_681072 ) ) ( not ( = ?auto_681061 ?auto_681062 ) ) ( not ( = ?auto_681061 ?auto_681064 ) ) ( not ( = ?auto_681061 ?auto_681063 ) ) ( not ( = ?auto_681061 ?auto_681065 ) ) ( not ( = ?auto_681061 ?auto_681066 ) ) ( not ( = ?auto_681061 ?auto_681067 ) ) ( not ( = ?auto_681061 ?auto_681068 ) ) ( not ( = ?auto_681061 ?auto_681069 ) ) ( not ( = ?auto_681061 ?auto_681070 ) ) ( not ( = ?auto_681061 ?auto_681071 ) ) ( not ( = ?auto_681061 ?auto_681072 ) ) ( not ( = ?auto_681062 ?auto_681064 ) ) ( not ( = ?auto_681062 ?auto_681063 ) ) ( not ( = ?auto_681062 ?auto_681065 ) ) ( not ( = ?auto_681062 ?auto_681066 ) ) ( not ( = ?auto_681062 ?auto_681067 ) ) ( not ( = ?auto_681062 ?auto_681068 ) ) ( not ( = ?auto_681062 ?auto_681069 ) ) ( not ( = ?auto_681062 ?auto_681070 ) ) ( not ( = ?auto_681062 ?auto_681071 ) ) ( not ( = ?auto_681062 ?auto_681072 ) ) ( not ( = ?auto_681064 ?auto_681063 ) ) ( not ( = ?auto_681064 ?auto_681065 ) ) ( not ( = ?auto_681064 ?auto_681066 ) ) ( not ( = ?auto_681064 ?auto_681067 ) ) ( not ( = ?auto_681064 ?auto_681068 ) ) ( not ( = ?auto_681064 ?auto_681069 ) ) ( not ( = ?auto_681064 ?auto_681070 ) ) ( not ( = ?auto_681064 ?auto_681071 ) ) ( not ( = ?auto_681064 ?auto_681072 ) ) ( not ( = ?auto_681063 ?auto_681065 ) ) ( not ( = ?auto_681063 ?auto_681066 ) ) ( not ( = ?auto_681063 ?auto_681067 ) ) ( not ( = ?auto_681063 ?auto_681068 ) ) ( not ( = ?auto_681063 ?auto_681069 ) ) ( not ( = ?auto_681063 ?auto_681070 ) ) ( not ( = ?auto_681063 ?auto_681071 ) ) ( not ( = ?auto_681063 ?auto_681072 ) ) ( not ( = ?auto_681065 ?auto_681066 ) ) ( not ( = ?auto_681065 ?auto_681067 ) ) ( not ( = ?auto_681065 ?auto_681068 ) ) ( not ( = ?auto_681065 ?auto_681069 ) ) ( not ( = ?auto_681065 ?auto_681070 ) ) ( not ( = ?auto_681065 ?auto_681071 ) ) ( not ( = ?auto_681065 ?auto_681072 ) ) ( not ( = ?auto_681066 ?auto_681067 ) ) ( not ( = ?auto_681066 ?auto_681068 ) ) ( not ( = ?auto_681066 ?auto_681069 ) ) ( not ( = ?auto_681066 ?auto_681070 ) ) ( not ( = ?auto_681066 ?auto_681071 ) ) ( not ( = ?auto_681066 ?auto_681072 ) ) ( not ( = ?auto_681067 ?auto_681068 ) ) ( not ( = ?auto_681067 ?auto_681069 ) ) ( not ( = ?auto_681067 ?auto_681070 ) ) ( not ( = ?auto_681067 ?auto_681071 ) ) ( not ( = ?auto_681067 ?auto_681072 ) ) ( not ( = ?auto_681068 ?auto_681069 ) ) ( not ( = ?auto_681068 ?auto_681070 ) ) ( not ( = ?auto_681068 ?auto_681071 ) ) ( not ( = ?auto_681068 ?auto_681072 ) ) ( not ( = ?auto_681069 ?auto_681070 ) ) ( not ( = ?auto_681069 ?auto_681071 ) ) ( not ( = ?auto_681069 ?auto_681072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681070 ?auto_681071 ?auto_681072 )
      ( MAKE-12CRATE-VERIFY ?auto_681060 ?auto_681061 ?auto_681062 ?auto_681064 ?auto_681063 ?auto_681065 ?auto_681066 ?auto_681067 ?auto_681068 ?auto_681069 ?auto_681070 ?auto_681071 ?auto_681072 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681210 - SURFACE
      ?auto_681211 - SURFACE
      ?auto_681212 - SURFACE
      ?auto_681214 - SURFACE
      ?auto_681213 - SURFACE
      ?auto_681215 - SURFACE
      ?auto_681216 - SURFACE
      ?auto_681217 - SURFACE
      ?auto_681218 - SURFACE
      ?auto_681219 - SURFACE
      ?auto_681220 - SURFACE
      ?auto_681221 - SURFACE
      ?auto_681222 - SURFACE
    )
    :vars
    (
      ?auto_681227 - HOIST
      ?auto_681226 - PLACE
      ?auto_681225 - TRUCK
      ?auto_681224 - PLACE
      ?auto_681223 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_681227 ?auto_681226 ) ( SURFACE-AT ?auto_681221 ?auto_681226 ) ( CLEAR ?auto_681221 ) ( IS-CRATE ?auto_681222 ) ( not ( = ?auto_681221 ?auto_681222 ) ) ( AVAILABLE ?auto_681227 ) ( ON ?auto_681221 ?auto_681220 ) ( not ( = ?auto_681220 ?auto_681221 ) ) ( not ( = ?auto_681220 ?auto_681222 ) ) ( TRUCK-AT ?auto_681225 ?auto_681224 ) ( not ( = ?auto_681224 ?auto_681226 ) ) ( HOIST-AT ?auto_681223 ?auto_681224 ) ( LIFTING ?auto_681223 ?auto_681222 ) ( not ( = ?auto_681227 ?auto_681223 ) ) ( ON ?auto_681211 ?auto_681210 ) ( ON ?auto_681212 ?auto_681211 ) ( ON ?auto_681214 ?auto_681212 ) ( ON ?auto_681213 ?auto_681214 ) ( ON ?auto_681215 ?auto_681213 ) ( ON ?auto_681216 ?auto_681215 ) ( ON ?auto_681217 ?auto_681216 ) ( ON ?auto_681218 ?auto_681217 ) ( ON ?auto_681219 ?auto_681218 ) ( ON ?auto_681220 ?auto_681219 ) ( not ( = ?auto_681210 ?auto_681211 ) ) ( not ( = ?auto_681210 ?auto_681212 ) ) ( not ( = ?auto_681210 ?auto_681214 ) ) ( not ( = ?auto_681210 ?auto_681213 ) ) ( not ( = ?auto_681210 ?auto_681215 ) ) ( not ( = ?auto_681210 ?auto_681216 ) ) ( not ( = ?auto_681210 ?auto_681217 ) ) ( not ( = ?auto_681210 ?auto_681218 ) ) ( not ( = ?auto_681210 ?auto_681219 ) ) ( not ( = ?auto_681210 ?auto_681220 ) ) ( not ( = ?auto_681210 ?auto_681221 ) ) ( not ( = ?auto_681210 ?auto_681222 ) ) ( not ( = ?auto_681211 ?auto_681212 ) ) ( not ( = ?auto_681211 ?auto_681214 ) ) ( not ( = ?auto_681211 ?auto_681213 ) ) ( not ( = ?auto_681211 ?auto_681215 ) ) ( not ( = ?auto_681211 ?auto_681216 ) ) ( not ( = ?auto_681211 ?auto_681217 ) ) ( not ( = ?auto_681211 ?auto_681218 ) ) ( not ( = ?auto_681211 ?auto_681219 ) ) ( not ( = ?auto_681211 ?auto_681220 ) ) ( not ( = ?auto_681211 ?auto_681221 ) ) ( not ( = ?auto_681211 ?auto_681222 ) ) ( not ( = ?auto_681212 ?auto_681214 ) ) ( not ( = ?auto_681212 ?auto_681213 ) ) ( not ( = ?auto_681212 ?auto_681215 ) ) ( not ( = ?auto_681212 ?auto_681216 ) ) ( not ( = ?auto_681212 ?auto_681217 ) ) ( not ( = ?auto_681212 ?auto_681218 ) ) ( not ( = ?auto_681212 ?auto_681219 ) ) ( not ( = ?auto_681212 ?auto_681220 ) ) ( not ( = ?auto_681212 ?auto_681221 ) ) ( not ( = ?auto_681212 ?auto_681222 ) ) ( not ( = ?auto_681214 ?auto_681213 ) ) ( not ( = ?auto_681214 ?auto_681215 ) ) ( not ( = ?auto_681214 ?auto_681216 ) ) ( not ( = ?auto_681214 ?auto_681217 ) ) ( not ( = ?auto_681214 ?auto_681218 ) ) ( not ( = ?auto_681214 ?auto_681219 ) ) ( not ( = ?auto_681214 ?auto_681220 ) ) ( not ( = ?auto_681214 ?auto_681221 ) ) ( not ( = ?auto_681214 ?auto_681222 ) ) ( not ( = ?auto_681213 ?auto_681215 ) ) ( not ( = ?auto_681213 ?auto_681216 ) ) ( not ( = ?auto_681213 ?auto_681217 ) ) ( not ( = ?auto_681213 ?auto_681218 ) ) ( not ( = ?auto_681213 ?auto_681219 ) ) ( not ( = ?auto_681213 ?auto_681220 ) ) ( not ( = ?auto_681213 ?auto_681221 ) ) ( not ( = ?auto_681213 ?auto_681222 ) ) ( not ( = ?auto_681215 ?auto_681216 ) ) ( not ( = ?auto_681215 ?auto_681217 ) ) ( not ( = ?auto_681215 ?auto_681218 ) ) ( not ( = ?auto_681215 ?auto_681219 ) ) ( not ( = ?auto_681215 ?auto_681220 ) ) ( not ( = ?auto_681215 ?auto_681221 ) ) ( not ( = ?auto_681215 ?auto_681222 ) ) ( not ( = ?auto_681216 ?auto_681217 ) ) ( not ( = ?auto_681216 ?auto_681218 ) ) ( not ( = ?auto_681216 ?auto_681219 ) ) ( not ( = ?auto_681216 ?auto_681220 ) ) ( not ( = ?auto_681216 ?auto_681221 ) ) ( not ( = ?auto_681216 ?auto_681222 ) ) ( not ( = ?auto_681217 ?auto_681218 ) ) ( not ( = ?auto_681217 ?auto_681219 ) ) ( not ( = ?auto_681217 ?auto_681220 ) ) ( not ( = ?auto_681217 ?auto_681221 ) ) ( not ( = ?auto_681217 ?auto_681222 ) ) ( not ( = ?auto_681218 ?auto_681219 ) ) ( not ( = ?auto_681218 ?auto_681220 ) ) ( not ( = ?auto_681218 ?auto_681221 ) ) ( not ( = ?auto_681218 ?auto_681222 ) ) ( not ( = ?auto_681219 ?auto_681220 ) ) ( not ( = ?auto_681219 ?auto_681221 ) ) ( not ( = ?auto_681219 ?auto_681222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681220 ?auto_681221 ?auto_681222 )
      ( MAKE-12CRATE-VERIFY ?auto_681210 ?auto_681211 ?auto_681212 ?auto_681214 ?auto_681213 ?auto_681215 ?auto_681216 ?auto_681217 ?auto_681218 ?auto_681219 ?auto_681220 ?auto_681221 ?auto_681222 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681372 - SURFACE
      ?auto_681373 - SURFACE
      ?auto_681374 - SURFACE
      ?auto_681376 - SURFACE
      ?auto_681375 - SURFACE
      ?auto_681377 - SURFACE
      ?auto_681378 - SURFACE
      ?auto_681379 - SURFACE
      ?auto_681380 - SURFACE
      ?auto_681381 - SURFACE
      ?auto_681382 - SURFACE
      ?auto_681383 - SURFACE
      ?auto_681384 - SURFACE
    )
    :vars
    (
      ?auto_681387 - HOIST
      ?auto_681388 - PLACE
      ?auto_681389 - TRUCK
      ?auto_681385 - PLACE
      ?auto_681390 - HOIST
      ?auto_681386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_681387 ?auto_681388 ) ( SURFACE-AT ?auto_681383 ?auto_681388 ) ( CLEAR ?auto_681383 ) ( IS-CRATE ?auto_681384 ) ( not ( = ?auto_681383 ?auto_681384 ) ) ( AVAILABLE ?auto_681387 ) ( ON ?auto_681383 ?auto_681382 ) ( not ( = ?auto_681382 ?auto_681383 ) ) ( not ( = ?auto_681382 ?auto_681384 ) ) ( TRUCK-AT ?auto_681389 ?auto_681385 ) ( not ( = ?auto_681385 ?auto_681388 ) ) ( HOIST-AT ?auto_681390 ?auto_681385 ) ( not ( = ?auto_681387 ?auto_681390 ) ) ( AVAILABLE ?auto_681390 ) ( SURFACE-AT ?auto_681384 ?auto_681385 ) ( ON ?auto_681384 ?auto_681386 ) ( CLEAR ?auto_681384 ) ( not ( = ?auto_681383 ?auto_681386 ) ) ( not ( = ?auto_681384 ?auto_681386 ) ) ( not ( = ?auto_681382 ?auto_681386 ) ) ( ON ?auto_681373 ?auto_681372 ) ( ON ?auto_681374 ?auto_681373 ) ( ON ?auto_681376 ?auto_681374 ) ( ON ?auto_681375 ?auto_681376 ) ( ON ?auto_681377 ?auto_681375 ) ( ON ?auto_681378 ?auto_681377 ) ( ON ?auto_681379 ?auto_681378 ) ( ON ?auto_681380 ?auto_681379 ) ( ON ?auto_681381 ?auto_681380 ) ( ON ?auto_681382 ?auto_681381 ) ( not ( = ?auto_681372 ?auto_681373 ) ) ( not ( = ?auto_681372 ?auto_681374 ) ) ( not ( = ?auto_681372 ?auto_681376 ) ) ( not ( = ?auto_681372 ?auto_681375 ) ) ( not ( = ?auto_681372 ?auto_681377 ) ) ( not ( = ?auto_681372 ?auto_681378 ) ) ( not ( = ?auto_681372 ?auto_681379 ) ) ( not ( = ?auto_681372 ?auto_681380 ) ) ( not ( = ?auto_681372 ?auto_681381 ) ) ( not ( = ?auto_681372 ?auto_681382 ) ) ( not ( = ?auto_681372 ?auto_681383 ) ) ( not ( = ?auto_681372 ?auto_681384 ) ) ( not ( = ?auto_681372 ?auto_681386 ) ) ( not ( = ?auto_681373 ?auto_681374 ) ) ( not ( = ?auto_681373 ?auto_681376 ) ) ( not ( = ?auto_681373 ?auto_681375 ) ) ( not ( = ?auto_681373 ?auto_681377 ) ) ( not ( = ?auto_681373 ?auto_681378 ) ) ( not ( = ?auto_681373 ?auto_681379 ) ) ( not ( = ?auto_681373 ?auto_681380 ) ) ( not ( = ?auto_681373 ?auto_681381 ) ) ( not ( = ?auto_681373 ?auto_681382 ) ) ( not ( = ?auto_681373 ?auto_681383 ) ) ( not ( = ?auto_681373 ?auto_681384 ) ) ( not ( = ?auto_681373 ?auto_681386 ) ) ( not ( = ?auto_681374 ?auto_681376 ) ) ( not ( = ?auto_681374 ?auto_681375 ) ) ( not ( = ?auto_681374 ?auto_681377 ) ) ( not ( = ?auto_681374 ?auto_681378 ) ) ( not ( = ?auto_681374 ?auto_681379 ) ) ( not ( = ?auto_681374 ?auto_681380 ) ) ( not ( = ?auto_681374 ?auto_681381 ) ) ( not ( = ?auto_681374 ?auto_681382 ) ) ( not ( = ?auto_681374 ?auto_681383 ) ) ( not ( = ?auto_681374 ?auto_681384 ) ) ( not ( = ?auto_681374 ?auto_681386 ) ) ( not ( = ?auto_681376 ?auto_681375 ) ) ( not ( = ?auto_681376 ?auto_681377 ) ) ( not ( = ?auto_681376 ?auto_681378 ) ) ( not ( = ?auto_681376 ?auto_681379 ) ) ( not ( = ?auto_681376 ?auto_681380 ) ) ( not ( = ?auto_681376 ?auto_681381 ) ) ( not ( = ?auto_681376 ?auto_681382 ) ) ( not ( = ?auto_681376 ?auto_681383 ) ) ( not ( = ?auto_681376 ?auto_681384 ) ) ( not ( = ?auto_681376 ?auto_681386 ) ) ( not ( = ?auto_681375 ?auto_681377 ) ) ( not ( = ?auto_681375 ?auto_681378 ) ) ( not ( = ?auto_681375 ?auto_681379 ) ) ( not ( = ?auto_681375 ?auto_681380 ) ) ( not ( = ?auto_681375 ?auto_681381 ) ) ( not ( = ?auto_681375 ?auto_681382 ) ) ( not ( = ?auto_681375 ?auto_681383 ) ) ( not ( = ?auto_681375 ?auto_681384 ) ) ( not ( = ?auto_681375 ?auto_681386 ) ) ( not ( = ?auto_681377 ?auto_681378 ) ) ( not ( = ?auto_681377 ?auto_681379 ) ) ( not ( = ?auto_681377 ?auto_681380 ) ) ( not ( = ?auto_681377 ?auto_681381 ) ) ( not ( = ?auto_681377 ?auto_681382 ) ) ( not ( = ?auto_681377 ?auto_681383 ) ) ( not ( = ?auto_681377 ?auto_681384 ) ) ( not ( = ?auto_681377 ?auto_681386 ) ) ( not ( = ?auto_681378 ?auto_681379 ) ) ( not ( = ?auto_681378 ?auto_681380 ) ) ( not ( = ?auto_681378 ?auto_681381 ) ) ( not ( = ?auto_681378 ?auto_681382 ) ) ( not ( = ?auto_681378 ?auto_681383 ) ) ( not ( = ?auto_681378 ?auto_681384 ) ) ( not ( = ?auto_681378 ?auto_681386 ) ) ( not ( = ?auto_681379 ?auto_681380 ) ) ( not ( = ?auto_681379 ?auto_681381 ) ) ( not ( = ?auto_681379 ?auto_681382 ) ) ( not ( = ?auto_681379 ?auto_681383 ) ) ( not ( = ?auto_681379 ?auto_681384 ) ) ( not ( = ?auto_681379 ?auto_681386 ) ) ( not ( = ?auto_681380 ?auto_681381 ) ) ( not ( = ?auto_681380 ?auto_681382 ) ) ( not ( = ?auto_681380 ?auto_681383 ) ) ( not ( = ?auto_681380 ?auto_681384 ) ) ( not ( = ?auto_681380 ?auto_681386 ) ) ( not ( = ?auto_681381 ?auto_681382 ) ) ( not ( = ?auto_681381 ?auto_681383 ) ) ( not ( = ?auto_681381 ?auto_681384 ) ) ( not ( = ?auto_681381 ?auto_681386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681382 ?auto_681383 ?auto_681384 )
      ( MAKE-12CRATE-VERIFY ?auto_681372 ?auto_681373 ?auto_681374 ?auto_681376 ?auto_681375 ?auto_681377 ?auto_681378 ?auto_681379 ?auto_681380 ?auto_681381 ?auto_681382 ?auto_681383 ?auto_681384 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681535 - SURFACE
      ?auto_681536 - SURFACE
      ?auto_681537 - SURFACE
      ?auto_681539 - SURFACE
      ?auto_681538 - SURFACE
      ?auto_681540 - SURFACE
      ?auto_681541 - SURFACE
      ?auto_681542 - SURFACE
      ?auto_681543 - SURFACE
      ?auto_681544 - SURFACE
      ?auto_681545 - SURFACE
      ?auto_681546 - SURFACE
      ?auto_681547 - SURFACE
    )
    :vars
    (
      ?auto_681548 - HOIST
      ?auto_681550 - PLACE
      ?auto_681549 - PLACE
      ?auto_681553 - HOIST
      ?auto_681551 - SURFACE
      ?auto_681552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_681548 ?auto_681550 ) ( SURFACE-AT ?auto_681546 ?auto_681550 ) ( CLEAR ?auto_681546 ) ( IS-CRATE ?auto_681547 ) ( not ( = ?auto_681546 ?auto_681547 ) ) ( AVAILABLE ?auto_681548 ) ( ON ?auto_681546 ?auto_681545 ) ( not ( = ?auto_681545 ?auto_681546 ) ) ( not ( = ?auto_681545 ?auto_681547 ) ) ( not ( = ?auto_681549 ?auto_681550 ) ) ( HOIST-AT ?auto_681553 ?auto_681549 ) ( not ( = ?auto_681548 ?auto_681553 ) ) ( AVAILABLE ?auto_681553 ) ( SURFACE-AT ?auto_681547 ?auto_681549 ) ( ON ?auto_681547 ?auto_681551 ) ( CLEAR ?auto_681547 ) ( not ( = ?auto_681546 ?auto_681551 ) ) ( not ( = ?auto_681547 ?auto_681551 ) ) ( not ( = ?auto_681545 ?auto_681551 ) ) ( TRUCK-AT ?auto_681552 ?auto_681550 ) ( ON ?auto_681536 ?auto_681535 ) ( ON ?auto_681537 ?auto_681536 ) ( ON ?auto_681539 ?auto_681537 ) ( ON ?auto_681538 ?auto_681539 ) ( ON ?auto_681540 ?auto_681538 ) ( ON ?auto_681541 ?auto_681540 ) ( ON ?auto_681542 ?auto_681541 ) ( ON ?auto_681543 ?auto_681542 ) ( ON ?auto_681544 ?auto_681543 ) ( ON ?auto_681545 ?auto_681544 ) ( not ( = ?auto_681535 ?auto_681536 ) ) ( not ( = ?auto_681535 ?auto_681537 ) ) ( not ( = ?auto_681535 ?auto_681539 ) ) ( not ( = ?auto_681535 ?auto_681538 ) ) ( not ( = ?auto_681535 ?auto_681540 ) ) ( not ( = ?auto_681535 ?auto_681541 ) ) ( not ( = ?auto_681535 ?auto_681542 ) ) ( not ( = ?auto_681535 ?auto_681543 ) ) ( not ( = ?auto_681535 ?auto_681544 ) ) ( not ( = ?auto_681535 ?auto_681545 ) ) ( not ( = ?auto_681535 ?auto_681546 ) ) ( not ( = ?auto_681535 ?auto_681547 ) ) ( not ( = ?auto_681535 ?auto_681551 ) ) ( not ( = ?auto_681536 ?auto_681537 ) ) ( not ( = ?auto_681536 ?auto_681539 ) ) ( not ( = ?auto_681536 ?auto_681538 ) ) ( not ( = ?auto_681536 ?auto_681540 ) ) ( not ( = ?auto_681536 ?auto_681541 ) ) ( not ( = ?auto_681536 ?auto_681542 ) ) ( not ( = ?auto_681536 ?auto_681543 ) ) ( not ( = ?auto_681536 ?auto_681544 ) ) ( not ( = ?auto_681536 ?auto_681545 ) ) ( not ( = ?auto_681536 ?auto_681546 ) ) ( not ( = ?auto_681536 ?auto_681547 ) ) ( not ( = ?auto_681536 ?auto_681551 ) ) ( not ( = ?auto_681537 ?auto_681539 ) ) ( not ( = ?auto_681537 ?auto_681538 ) ) ( not ( = ?auto_681537 ?auto_681540 ) ) ( not ( = ?auto_681537 ?auto_681541 ) ) ( not ( = ?auto_681537 ?auto_681542 ) ) ( not ( = ?auto_681537 ?auto_681543 ) ) ( not ( = ?auto_681537 ?auto_681544 ) ) ( not ( = ?auto_681537 ?auto_681545 ) ) ( not ( = ?auto_681537 ?auto_681546 ) ) ( not ( = ?auto_681537 ?auto_681547 ) ) ( not ( = ?auto_681537 ?auto_681551 ) ) ( not ( = ?auto_681539 ?auto_681538 ) ) ( not ( = ?auto_681539 ?auto_681540 ) ) ( not ( = ?auto_681539 ?auto_681541 ) ) ( not ( = ?auto_681539 ?auto_681542 ) ) ( not ( = ?auto_681539 ?auto_681543 ) ) ( not ( = ?auto_681539 ?auto_681544 ) ) ( not ( = ?auto_681539 ?auto_681545 ) ) ( not ( = ?auto_681539 ?auto_681546 ) ) ( not ( = ?auto_681539 ?auto_681547 ) ) ( not ( = ?auto_681539 ?auto_681551 ) ) ( not ( = ?auto_681538 ?auto_681540 ) ) ( not ( = ?auto_681538 ?auto_681541 ) ) ( not ( = ?auto_681538 ?auto_681542 ) ) ( not ( = ?auto_681538 ?auto_681543 ) ) ( not ( = ?auto_681538 ?auto_681544 ) ) ( not ( = ?auto_681538 ?auto_681545 ) ) ( not ( = ?auto_681538 ?auto_681546 ) ) ( not ( = ?auto_681538 ?auto_681547 ) ) ( not ( = ?auto_681538 ?auto_681551 ) ) ( not ( = ?auto_681540 ?auto_681541 ) ) ( not ( = ?auto_681540 ?auto_681542 ) ) ( not ( = ?auto_681540 ?auto_681543 ) ) ( not ( = ?auto_681540 ?auto_681544 ) ) ( not ( = ?auto_681540 ?auto_681545 ) ) ( not ( = ?auto_681540 ?auto_681546 ) ) ( not ( = ?auto_681540 ?auto_681547 ) ) ( not ( = ?auto_681540 ?auto_681551 ) ) ( not ( = ?auto_681541 ?auto_681542 ) ) ( not ( = ?auto_681541 ?auto_681543 ) ) ( not ( = ?auto_681541 ?auto_681544 ) ) ( not ( = ?auto_681541 ?auto_681545 ) ) ( not ( = ?auto_681541 ?auto_681546 ) ) ( not ( = ?auto_681541 ?auto_681547 ) ) ( not ( = ?auto_681541 ?auto_681551 ) ) ( not ( = ?auto_681542 ?auto_681543 ) ) ( not ( = ?auto_681542 ?auto_681544 ) ) ( not ( = ?auto_681542 ?auto_681545 ) ) ( not ( = ?auto_681542 ?auto_681546 ) ) ( not ( = ?auto_681542 ?auto_681547 ) ) ( not ( = ?auto_681542 ?auto_681551 ) ) ( not ( = ?auto_681543 ?auto_681544 ) ) ( not ( = ?auto_681543 ?auto_681545 ) ) ( not ( = ?auto_681543 ?auto_681546 ) ) ( not ( = ?auto_681543 ?auto_681547 ) ) ( not ( = ?auto_681543 ?auto_681551 ) ) ( not ( = ?auto_681544 ?auto_681545 ) ) ( not ( = ?auto_681544 ?auto_681546 ) ) ( not ( = ?auto_681544 ?auto_681547 ) ) ( not ( = ?auto_681544 ?auto_681551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681545 ?auto_681546 ?auto_681547 )
      ( MAKE-12CRATE-VERIFY ?auto_681535 ?auto_681536 ?auto_681537 ?auto_681539 ?auto_681538 ?auto_681540 ?auto_681541 ?auto_681542 ?auto_681543 ?auto_681544 ?auto_681545 ?auto_681546 ?auto_681547 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681698 - SURFACE
      ?auto_681699 - SURFACE
      ?auto_681700 - SURFACE
      ?auto_681702 - SURFACE
      ?auto_681701 - SURFACE
      ?auto_681703 - SURFACE
      ?auto_681704 - SURFACE
      ?auto_681705 - SURFACE
      ?auto_681706 - SURFACE
      ?auto_681707 - SURFACE
      ?auto_681708 - SURFACE
      ?auto_681709 - SURFACE
      ?auto_681710 - SURFACE
    )
    :vars
    (
      ?auto_681712 - HOIST
      ?auto_681715 - PLACE
      ?auto_681716 - PLACE
      ?auto_681714 - HOIST
      ?auto_681711 - SURFACE
      ?auto_681713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_681712 ?auto_681715 ) ( IS-CRATE ?auto_681710 ) ( not ( = ?auto_681709 ?auto_681710 ) ) ( not ( = ?auto_681708 ?auto_681709 ) ) ( not ( = ?auto_681708 ?auto_681710 ) ) ( not ( = ?auto_681716 ?auto_681715 ) ) ( HOIST-AT ?auto_681714 ?auto_681716 ) ( not ( = ?auto_681712 ?auto_681714 ) ) ( AVAILABLE ?auto_681714 ) ( SURFACE-AT ?auto_681710 ?auto_681716 ) ( ON ?auto_681710 ?auto_681711 ) ( CLEAR ?auto_681710 ) ( not ( = ?auto_681709 ?auto_681711 ) ) ( not ( = ?auto_681710 ?auto_681711 ) ) ( not ( = ?auto_681708 ?auto_681711 ) ) ( TRUCK-AT ?auto_681713 ?auto_681715 ) ( SURFACE-AT ?auto_681708 ?auto_681715 ) ( CLEAR ?auto_681708 ) ( LIFTING ?auto_681712 ?auto_681709 ) ( IS-CRATE ?auto_681709 ) ( ON ?auto_681699 ?auto_681698 ) ( ON ?auto_681700 ?auto_681699 ) ( ON ?auto_681702 ?auto_681700 ) ( ON ?auto_681701 ?auto_681702 ) ( ON ?auto_681703 ?auto_681701 ) ( ON ?auto_681704 ?auto_681703 ) ( ON ?auto_681705 ?auto_681704 ) ( ON ?auto_681706 ?auto_681705 ) ( ON ?auto_681707 ?auto_681706 ) ( ON ?auto_681708 ?auto_681707 ) ( not ( = ?auto_681698 ?auto_681699 ) ) ( not ( = ?auto_681698 ?auto_681700 ) ) ( not ( = ?auto_681698 ?auto_681702 ) ) ( not ( = ?auto_681698 ?auto_681701 ) ) ( not ( = ?auto_681698 ?auto_681703 ) ) ( not ( = ?auto_681698 ?auto_681704 ) ) ( not ( = ?auto_681698 ?auto_681705 ) ) ( not ( = ?auto_681698 ?auto_681706 ) ) ( not ( = ?auto_681698 ?auto_681707 ) ) ( not ( = ?auto_681698 ?auto_681708 ) ) ( not ( = ?auto_681698 ?auto_681709 ) ) ( not ( = ?auto_681698 ?auto_681710 ) ) ( not ( = ?auto_681698 ?auto_681711 ) ) ( not ( = ?auto_681699 ?auto_681700 ) ) ( not ( = ?auto_681699 ?auto_681702 ) ) ( not ( = ?auto_681699 ?auto_681701 ) ) ( not ( = ?auto_681699 ?auto_681703 ) ) ( not ( = ?auto_681699 ?auto_681704 ) ) ( not ( = ?auto_681699 ?auto_681705 ) ) ( not ( = ?auto_681699 ?auto_681706 ) ) ( not ( = ?auto_681699 ?auto_681707 ) ) ( not ( = ?auto_681699 ?auto_681708 ) ) ( not ( = ?auto_681699 ?auto_681709 ) ) ( not ( = ?auto_681699 ?auto_681710 ) ) ( not ( = ?auto_681699 ?auto_681711 ) ) ( not ( = ?auto_681700 ?auto_681702 ) ) ( not ( = ?auto_681700 ?auto_681701 ) ) ( not ( = ?auto_681700 ?auto_681703 ) ) ( not ( = ?auto_681700 ?auto_681704 ) ) ( not ( = ?auto_681700 ?auto_681705 ) ) ( not ( = ?auto_681700 ?auto_681706 ) ) ( not ( = ?auto_681700 ?auto_681707 ) ) ( not ( = ?auto_681700 ?auto_681708 ) ) ( not ( = ?auto_681700 ?auto_681709 ) ) ( not ( = ?auto_681700 ?auto_681710 ) ) ( not ( = ?auto_681700 ?auto_681711 ) ) ( not ( = ?auto_681702 ?auto_681701 ) ) ( not ( = ?auto_681702 ?auto_681703 ) ) ( not ( = ?auto_681702 ?auto_681704 ) ) ( not ( = ?auto_681702 ?auto_681705 ) ) ( not ( = ?auto_681702 ?auto_681706 ) ) ( not ( = ?auto_681702 ?auto_681707 ) ) ( not ( = ?auto_681702 ?auto_681708 ) ) ( not ( = ?auto_681702 ?auto_681709 ) ) ( not ( = ?auto_681702 ?auto_681710 ) ) ( not ( = ?auto_681702 ?auto_681711 ) ) ( not ( = ?auto_681701 ?auto_681703 ) ) ( not ( = ?auto_681701 ?auto_681704 ) ) ( not ( = ?auto_681701 ?auto_681705 ) ) ( not ( = ?auto_681701 ?auto_681706 ) ) ( not ( = ?auto_681701 ?auto_681707 ) ) ( not ( = ?auto_681701 ?auto_681708 ) ) ( not ( = ?auto_681701 ?auto_681709 ) ) ( not ( = ?auto_681701 ?auto_681710 ) ) ( not ( = ?auto_681701 ?auto_681711 ) ) ( not ( = ?auto_681703 ?auto_681704 ) ) ( not ( = ?auto_681703 ?auto_681705 ) ) ( not ( = ?auto_681703 ?auto_681706 ) ) ( not ( = ?auto_681703 ?auto_681707 ) ) ( not ( = ?auto_681703 ?auto_681708 ) ) ( not ( = ?auto_681703 ?auto_681709 ) ) ( not ( = ?auto_681703 ?auto_681710 ) ) ( not ( = ?auto_681703 ?auto_681711 ) ) ( not ( = ?auto_681704 ?auto_681705 ) ) ( not ( = ?auto_681704 ?auto_681706 ) ) ( not ( = ?auto_681704 ?auto_681707 ) ) ( not ( = ?auto_681704 ?auto_681708 ) ) ( not ( = ?auto_681704 ?auto_681709 ) ) ( not ( = ?auto_681704 ?auto_681710 ) ) ( not ( = ?auto_681704 ?auto_681711 ) ) ( not ( = ?auto_681705 ?auto_681706 ) ) ( not ( = ?auto_681705 ?auto_681707 ) ) ( not ( = ?auto_681705 ?auto_681708 ) ) ( not ( = ?auto_681705 ?auto_681709 ) ) ( not ( = ?auto_681705 ?auto_681710 ) ) ( not ( = ?auto_681705 ?auto_681711 ) ) ( not ( = ?auto_681706 ?auto_681707 ) ) ( not ( = ?auto_681706 ?auto_681708 ) ) ( not ( = ?auto_681706 ?auto_681709 ) ) ( not ( = ?auto_681706 ?auto_681710 ) ) ( not ( = ?auto_681706 ?auto_681711 ) ) ( not ( = ?auto_681707 ?auto_681708 ) ) ( not ( = ?auto_681707 ?auto_681709 ) ) ( not ( = ?auto_681707 ?auto_681710 ) ) ( not ( = ?auto_681707 ?auto_681711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681708 ?auto_681709 ?auto_681710 )
      ( MAKE-12CRATE-VERIFY ?auto_681698 ?auto_681699 ?auto_681700 ?auto_681702 ?auto_681701 ?auto_681703 ?auto_681704 ?auto_681705 ?auto_681706 ?auto_681707 ?auto_681708 ?auto_681709 ?auto_681710 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_681861 - SURFACE
      ?auto_681862 - SURFACE
      ?auto_681863 - SURFACE
      ?auto_681865 - SURFACE
      ?auto_681864 - SURFACE
      ?auto_681866 - SURFACE
      ?auto_681867 - SURFACE
      ?auto_681868 - SURFACE
      ?auto_681869 - SURFACE
      ?auto_681870 - SURFACE
      ?auto_681871 - SURFACE
      ?auto_681872 - SURFACE
      ?auto_681873 - SURFACE
    )
    :vars
    (
      ?auto_681874 - HOIST
      ?auto_681876 - PLACE
      ?auto_681877 - PLACE
      ?auto_681875 - HOIST
      ?auto_681878 - SURFACE
      ?auto_681879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_681874 ?auto_681876 ) ( IS-CRATE ?auto_681873 ) ( not ( = ?auto_681872 ?auto_681873 ) ) ( not ( = ?auto_681871 ?auto_681872 ) ) ( not ( = ?auto_681871 ?auto_681873 ) ) ( not ( = ?auto_681877 ?auto_681876 ) ) ( HOIST-AT ?auto_681875 ?auto_681877 ) ( not ( = ?auto_681874 ?auto_681875 ) ) ( AVAILABLE ?auto_681875 ) ( SURFACE-AT ?auto_681873 ?auto_681877 ) ( ON ?auto_681873 ?auto_681878 ) ( CLEAR ?auto_681873 ) ( not ( = ?auto_681872 ?auto_681878 ) ) ( not ( = ?auto_681873 ?auto_681878 ) ) ( not ( = ?auto_681871 ?auto_681878 ) ) ( TRUCK-AT ?auto_681879 ?auto_681876 ) ( SURFACE-AT ?auto_681871 ?auto_681876 ) ( CLEAR ?auto_681871 ) ( IS-CRATE ?auto_681872 ) ( AVAILABLE ?auto_681874 ) ( IN ?auto_681872 ?auto_681879 ) ( ON ?auto_681862 ?auto_681861 ) ( ON ?auto_681863 ?auto_681862 ) ( ON ?auto_681865 ?auto_681863 ) ( ON ?auto_681864 ?auto_681865 ) ( ON ?auto_681866 ?auto_681864 ) ( ON ?auto_681867 ?auto_681866 ) ( ON ?auto_681868 ?auto_681867 ) ( ON ?auto_681869 ?auto_681868 ) ( ON ?auto_681870 ?auto_681869 ) ( ON ?auto_681871 ?auto_681870 ) ( not ( = ?auto_681861 ?auto_681862 ) ) ( not ( = ?auto_681861 ?auto_681863 ) ) ( not ( = ?auto_681861 ?auto_681865 ) ) ( not ( = ?auto_681861 ?auto_681864 ) ) ( not ( = ?auto_681861 ?auto_681866 ) ) ( not ( = ?auto_681861 ?auto_681867 ) ) ( not ( = ?auto_681861 ?auto_681868 ) ) ( not ( = ?auto_681861 ?auto_681869 ) ) ( not ( = ?auto_681861 ?auto_681870 ) ) ( not ( = ?auto_681861 ?auto_681871 ) ) ( not ( = ?auto_681861 ?auto_681872 ) ) ( not ( = ?auto_681861 ?auto_681873 ) ) ( not ( = ?auto_681861 ?auto_681878 ) ) ( not ( = ?auto_681862 ?auto_681863 ) ) ( not ( = ?auto_681862 ?auto_681865 ) ) ( not ( = ?auto_681862 ?auto_681864 ) ) ( not ( = ?auto_681862 ?auto_681866 ) ) ( not ( = ?auto_681862 ?auto_681867 ) ) ( not ( = ?auto_681862 ?auto_681868 ) ) ( not ( = ?auto_681862 ?auto_681869 ) ) ( not ( = ?auto_681862 ?auto_681870 ) ) ( not ( = ?auto_681862 ?auto_681871 ) ) ( not ( = ?auto_681862 ?auto_681872 ) ) ( not ( = ?auto_681862 ?auto_681873 ) ) ( not ( = ?auto_681862 ?auto_681878 ) ) ( not ( = ?auto_681863 ?auto_681865 ) ) ( not ( = ?auto_681863 ?auto_681864 ) ) ( not ( = ?auto_681863 ?auto_681866 ) ) ( not ( = ?auto_681863 ?auto_681867 ) ) ( not ( = ?auto_681863 ?auto_681868 ) ) ( not ( = ?auto_681863 ?auto_681869 ) ) ( not ( = ?auto_681863 ?auto_681870 ) ) ( not ( = ?auto_681863 ?auto_681871 ) ) ( not ( = ?auto_681863 ?auto_681872 ) ) ( not ( = ?auto_681863 ?auto_681873 ) ) ( not ( = ?auto_681863 ?auto_681878 ) ) ( not ( = ?auto_681865 ?auto_681864 ) ) ( not ( = ?auto_681865 ?auto_681866 ) ) ( not ( = ?auto_681865 ?auto_681867 ) ) ( not ( = ?auto_681865 ?auto_681868 ) ) ( not ( = ?auto_681865 ?auto_681869 ) ) ( not ( = ?auto_681865 ?auto_681870 ) ) ( not ( = ?auto_681865 ?auto_681871 ) ) ( not ( = ?auto_681865 ?auto_681872 ) ) ( not ( = ?auto_681865 ?auto_681873 ) ) ( not ( = ?auto_681865 ?auto_681878 ) ) ( not ( = ?auto_681864 ?auto_681866 ) ) ( not ( = ?auto_681864 ?auto_681867 ) ) ( not ( = ?auto_681864 ?auto_681868 ) ) ( not ( = ?auto_681864 ?auto_681869 ) ) ( not ( = ?auto_681864 ?auto_681870 ) ) ( not ( = ?auto_681864 ?auto_681871 ) ) ( not ( = ?auto_681864 ?auto_681872 ) ) ( not ( = ?auto_681864 ?auto_681873 ) ) ( not ( = ?auto_681864 ?auto_681878 ) ) ( not ( = ?auto_681866 ?auto_681867 ) ) ( not ( = ?auto_681866 ?auto_681868 ) ) ( not ( = ?auto_681866 ?auto_681869 ) ) ( not ( = ?auto_681866 ?auto_681870 ) ) ( not ( = ?auto_681866 ?auto_681871 ) ) ( not ( = ?auto_681866 ?auto_681872 ) ) ( not ( = ?auto_681866 ?auto_681873 ) ) ( not ( = ?auto_681866 ?auto_681878 ) ) ( not ( = ?auto_681867 ?auto_681868 ) ) ( not ( = ?auto_681867 ?auto_681869 ) ) ( not ( = ?auto_681867 ?auto_681870 ) ) ( not ( = ?auto_681867 ?auto_681871 ) ) ( not ( = ?auto_681867 ?auto_681872 ) ) ( not ( = ?auto_681867 ?auto_681873 ) ) ( not ( = ?auto_681867 ?auto_681878 ) ) ( not ( = ?auto_681868 ?auto_681869 ) ) ( not ( = ?auto_681868 ?auto_681870 ) ) ( not ( = ?auto_681868 ?auto_681871 ) ) ( not ( = ?auto_681868 ?auto_681872 ) ) ( not ( = ?auto_681868 ?auto_681873 ) ) ( not ( = ?auto_681868 ?auto_681878 ) ) ( not ( = ?auto_681869 ?auto_681870 ) ) ( not ( = ?auto_681869 ?auto_681871 ) ) ( not ( = ?auto_681869 ?auto_681872 ) ) ( not ( = ?auto_681869 ?auto_681873 ) ) ( not ( = ?auto_681869 ?auto_681878 ) ) ( not ( = ?auto_681870 ?auto_681871 ) ) ( not ( = ?auto_681870 ?auto_681872 ) ) ( not ( = ?auto_681870 ?auto_681873 ) ) ( not ( = ?auto_681870 ?auto_681878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_681871 ?auto_681872 ?auto_681873 )
      ( MAKE-12CRATE-VERIFY ?auto_681861 ?auto_681862 ?auto_681863 ?auto_681865 ?auto_681864 ?auto_681866 ?auto_681867 ?auto_681868 ?auto_681869 ?auto_681870 ?auto_681871 ?auto_681872 ?auto_681873 ) )
  )

)

