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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_759 - SURFACE
      ?auto_760 - SURFACE
    )
    :vars
    (
      ?auto_761 - HOIST
      ?auto_762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_761 ?auto_762 ) ( SURFACE-AT ?auto_759 ?auto_762 ) ( CLEAR ?auto_759 ) ( LIFTING ?auto_761 ?auto_760 ) ( IS-CRATE ?auto_760 ) ( not ( = ?auto_759 ?auto_760 ) ) )
    :subtasks
    ( ( !DROP ?auto_761 ?auto_760 ?auto_759 ?auto_762 )
      ( MAKE-1CRATE-VERIFY ?auto_759 ?auto_760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_763 - SURFACE
      ?auto_764 - SURFACE
    )
    :vars
    (
      ?auto_766 - HOIST
      ?auto_765 - PLACE
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_766 ?auto_765 ) ( SURFACE-AT ?auto_763 ?auto_765 ) ( CLEAR ?auto_763 ) ( IS-CRATE ?auto_764 ) ( not ( = ?auto_763 ?auto_764 ) ) ( TRUCK-AT ?auto_767 ?auto_765 ) ( AVAILABLE ?auto_766 ) ( IN ?auto_764 ?auto_767 ) )
    :subtasks
    ( ( !UNLOAD ?auto_766 ?auto_764 ?auto_767 ?auto_765 )
      ( MAKE-1CRATE ?auto_763 ?auto_764 )
      ( MAKE-1CRATE-VERIFY ?auto_763 ?auto_764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_768 - SURFACE
      ?auto_769 - SURFACE
    )
    :vars
    (
      ?auto_771 - HOIST
      ?auto_770 - PLACE
      ?auto_772 - TRUCK
      ?auto_773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_771 ?auto_770 ) ( SURFACE-AT ?auto_768 ?auto_770 ) ( CLEAR ?auto_768 ) ( IS-CRATE ?auto_769 ) ( not ( = ?auto_768 ?auto_769 ) ) ( AVAILABLE ?auto_771 ) ( IN ?auto_769 ?auto_772 ) ( TRUCK-AT ?auto_772 ?auto_773 ) ( not ( = ?auto_773 ?auto_770 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_772 ?auto_773 ?auto_770 )
      ( MAKE-1CRATE ?auto_768 ?auto_769 )
      ( MAKE-1CRATE-VERIFY ?auto_768 ?auto_769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_774 - SURFACE
      ?auto_775 - SURFACE
    )
    :vars
    (
      ?auto_777 - HOIST
      ?auto_779 - PLACE
      ?auto_778 - TRUCK
      ?auto_776 - PLACE
      ?auto_780 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_777 ?auto_779 ) ( SURFACE-AT ?auto_774 ?auto_779 ) ( CLEAR ?auto_774 ) ( IS-CRATE ?auto_775 ) ( not ( = ?auto_774 ?auto_775 ) ) ( AVAILABLE ?auto_777 ) ( TRUCK-AT ?auto_778 ?auto_776 ) ( not ( = ?auto_776 ?auto_779 ) ) ( HOIST-AT ?auto_780 ?auto_776 ) ( LIFTING ?auto_780 ?auto_775 ) ( not ( = ?auto_777 ?auto_780 ) ) )
    :subtasks
    ( ( !LOAD ?auto_780 ?auto_775 ?auto_778 ?auto_776 )
      ( MAKE-1CRATE ?auto_774 ?auto_775 )
      ( MAKE-1CRATE-VERIFY ?auto_774 ?auto_775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_781 - SURFACE
      ?auto_782 - SURFACE
    )
    :vars
    (
      ?auto_784 - HOIST
      ?auto_783 - PLACE
      ?auto_785 - TRUCK
      ?auto_786 - PLACE
      ?auto_787 - HOIST
      ?auto_788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_784 ?auto_783 ) ( SURFACE-AT ?auto_781 ?auto_783 ) ( CLEAR ?auto_781 ) ( IS-CRATE ?auto_782 ) ( not ( = ?auto_781 ?auto_782 ) ) ( AVAILABLE ?auto_784 ) ( TRUCK-AT ?auto_785 ?auto_786 ) ( not ( = ?auto_786 ?auto_783 ) ) ( HOIST-AT ?auto_787 ?auto_786 ) ( not ( = ?auto_784 ?auto_787 ) ) ( AVAILABLE ?auto_787 ) ( SURFACE-AT ?auto_782 ?auto_786 ) ( ON ?auto_782 ?auto_788 ) ( CLEAR ?auto_782 ) ( not ( = ?auto_781 ?auto_788 ) ) ( not ( = ?auto_782 ?auto_788 ) ) )
    :subtasks
    ( ( !LIFT ?auto_787 ?auto_782 ?auto_788 ?auto_786 )
      ( MAKE-1CRATE ?auto_781 ?auto_782 )
      ( MAKE-1CRATE-VERIFY ?auto_781 ?auto_782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_789 - SURFACE
      ?auto_790 - SURFACE
    )
    :vars
    (
      ?auto_796 - HOIST
      ?auto_792 - PLACE
      ?auto_795 - PLACE
      ?auto_794 - HOIST
      ?auto_791 - SURFACE
      ?auto_793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796 ?auto_792 ) ( SURFACE-AT ?auto_789 ?auto_792 ) ( CLEAR ?auto_789 ) ( IS-CRATE ?auto_790 ) ( not ( = ?auto_789 ?auto_790 ) ) ( AVAILABLE ?auto_796 ) ( not ( = ?auto_795 ?auto_792 ) ) ( HOIST-AT ?auto_794 ?auto_795 ) ( not ( = ?auto_796 ?auto_794 ) ) ( AVAILABLE ?auto_794 ) ( SURFACE-AT ?auto_790 ?auto_795 ) ( ON ?auto_790 ?auto_791 ) ( CLEAR ?auto_790 ) ( not ( = ?auto_789 ?auto_791 ) ) ( not ( = ?auto_790 ?auto_791 ) ) ( TRUCK-AT ?auto_793 ?auto_792 ) )
    :subtasks
    ( ( !DRIVE ?auto_793 ?auto_792 ?auto_795 )
      ( MAKE-1CRATE ?auto_789 ?auto_790 )
      ( MAKE-1CRATE-VERIFY ?auto_789 ?auto_790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_802 - SURFACE
      ?auto_803 - SURFACE
    )
    :vars
    (
      ?auto_804 - HOIST
      ?auto_805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_804 ?auto_805 ) ( SURFACE-AT ?auto_802 ?auto_805 ) ( CLEAR ?auto_802 ) ( LIFTING ?auto_804 ?auto_803 ) ( IS-CRATE ?auto_803 ) ( not ( = ?auto_802 ?auto_803 ) ) )
    :subtasks
    ( ( !DROP ?auto_804 ?auto_803 ?auto_802 ?auto_805 )
      ( MAKE-1CRATE-VERIFY ?auto_802 ?auto_803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_806 - SURFACE
      ?auto_807 - SURFACE
      ?auto_808 - SURFACE
    )
    :vars
    (
      ?auto_810 - HOIST
      ?auto_809 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_810 ?auto_809 ) ( SURFACE-AT ?auto_807 ?auto_809 ) ( CLEAR ?auto_807 ) ( LIFTING ?auto_810 ?auto_808 ) ( IS-CRATE ?auto_808 ) ( not ( = ?auto_807 ?auto_808 ) ) ( ON ?auto_807 ?auto_806 ) ( not ( = ?auto_806 ?auto_807 ) ) ( not ( = ?auto_806 ?auto_808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_807 ?auto_808 )
      ( MAKE-2CRATE-VERIFY ?auto_806 ?auto_807 ?auto_808 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_811 - SURFACE
      ?auto_812 - SURFACE
    )
    :vars
    (
      ?auto_814 - HOIST
      ?auto_813 - PLACE
      ?auto_815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814 ?auto_813 ) ( SURFACE-AT ?auto_811 ?auto_813 ) ( CLEAR ?auto_811 ) ( IS-CRATE ?auto_812 ) ( not ( = ?auto_811 ?auto_812 ) ) ( TRUCK-AT ?auto_815 ?auto_813 ) ( AVAILABLE ?auto_814 ) ( IN ?auto_812 ?auto_815 ) )
    :subtasks
    ( ( !UNLOAD ?auto_814 ?auto_812 ?auto_815 ?auto_813 )
      ( MAKE-1CRATE ?auto_811 ?auto_812 )
      ( MAKE-1CRATE-VERIFY ?auto_811 ?auto_812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_816 - SURFACE
      ?auto_817 - SURFACE
      ?auto_818 - SURFACE
    )
    :vars
    (
      ?auto_820 - HOIST
      ?auto_819 - PLACE
      ?auto_821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_820 ?auto_819 ) ( SURFACE-AT ?auto_817 ?auto_819 ) ( CLEAR ?auto_817 ) ( IS-CRATE ?auto_818 ) ( not ( = ?auto_817 ?auto_818 ) ) ( TRUCK-AT ?auto_821 ?auto_819 ) ( AVAILABLE ?auto_820 ) ( IN ?auto_818 ?auto_821 ) ( ON ?auto_817 ?auto_816 ) ( not ( = ?auto_816 ?auto_817 ) ) ( not ( = ?auto_816 ?auto_818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_817 ?auto_818 )
      ( MAKE-2CRATE-VERIFY ?auto_816 ?auto_817 ?auto_818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
    )
    :vars
    (
      ?auto_825 - HOIST
      ?auto_824 - PLACE
      ?auto_827 - TRUCK
      ?auto_826 - SURFACE
      ?auto_828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_825 ?auto_824 ) ( SURFACE-AT ?auto_822 ?auto_824 ) ( CLEAR ?auto_822 ) ( IS-CRATE ?auto_823 ) ( not ( = ?auto_822 ?auto_823 ) ) ( AVAILABLE ?auto_825 ) ( IN ?auto_823 ?auto_827 ) ( ON ?auto_822 ?auto_826 ) ( not ( = ?auto_826 ?auto_822 ) ) ( not ( = ?auto_826 ?auto_823 ) ) ( TRUCK-AT ?auto_827 ?auto_828 ) ( not ( = ?auto_828 ?auto_824 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_827 ?auto_828 ?auto_824 )
      ( MAKE-2CRATE ?auto_826 ?auto_822 ?auto_823 )
      ( MAKE-1CRATE-VERIFY ?auto_822 ?auto_823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_829 - SURFACE
      ?auto_830 - SURFACE
      ?auto_831 - SURFACE
    )
    :vars
    (
      ?auto_834 - HOIST
      ?auto_832 - PLACE
      ?auto_833 - TRUCK
      ?auto_835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_834 ?auto_832 ) ( SURFACE-AT ?auto_830 ?auto_832 ) ( CLEAR ?auto_830 ) ( IS-CRATE ?auto_831 ) ( not ( = ?auto_830 ?auto_831 ) ) ( AVAILABLE ?auto_834 ) ( IN ?auto_831 ?auto_833 ) ( ON ?auto_830 ?auto_829 ) ( not ( = ?auto_829 ?auto_830 ) ) ( not ( = ?auto_829 ?auto_831 ) ) ( TRUCK-AT ?auto_833 ?auto_835 ) ( not ( = ?auto_835 ?auto_832 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_830 ?auto_831 )
      ( MAKE-2CRATE-VERIFY ?auto_829 ?auto_830 ?auto_831 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_836 - SURFACE
      ?auto_837 - SURFACE
    )
    :vars
    (
      ?auto_839 - HOIST
      ?auto_842 - PLACE
      ?auto_840 - SURFACE
      ?auto_841 - TRUCK
      ?auto_838 - PLACE
      ?auto_843 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_839 ?auto_842 ) ( SURFACE-AT ?auto_836 ?auto_842 ) ( CLEAR ?auto_836 ) ( IS-CRATE ?auto_837 ) ( not ( = ?auto_836 ?auto_837 ) ) ( AVAILABLE ?auto_839 ) ( ON ?auto_836 ?auto_840 ) ( not ( = ?auto_840 ?auto_836 ) ) ( not ( = ?auto_840 ?auto_837 ) ) ( TRUCK-AT ?auto_841 ?auto_838 ) ( not ( = ?auto_838 ?auto_842 ) ) ( HOIST-AT ?auto_843 ?auto_838 ) ( LIFTING ?auto_843 ?auto_837 ) ( not ( = ?auto_839 ?auto_843 ) ) )
    :subtasks
    ( ( !LOAD ?auto_843 ?auto_837 ?auto_841 ?auto_838 )
      ( MAKE-2CRATE ?auto_840 ?auto_836 ?auto_837 )
      ( MAKE-1CRATE-VERIFY ?auto_836 ?auto_837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844 - SURFACE
      ?auto_845 - SURFACE
      ?auto_846 - SURFACE
    )
    :vars
    (
      ?auto_849 - HOIST
      ?auto_848 - PLACE
      ?auto_851 - TRUCK
      ?auto_850 - PLACE
      ?auto_847 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_849 ?auto_848 ) ( SURFACE-AT ?auto_845 ?auto_848 ) ( CLEAR ?auto_845 ) ( IS-CRATE ?auto_846 ) ( not ( = ?auto_845 ?auto_846 ) ) ( AVAILABLE ?auto_849 ) ( ON ?auto_845 ?auto_844 ) ( not ( = ?auto_844 ?auto_845 ) ) ( not ( = ?auto_844 ?auto_846 ) ) ( TRUCK-AT ?auto_851 ?auto_850 ) ( not ( = ?auto_850 ?auto_848 ) ) ( HOIST-AT ?auto_847 ?auto_850 ) ( LIFTING ?auto_847 ?auto_846 ) ( not ( = ?auto_849 ?auto_847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845 ?auto_846 )
      ( MAKE-2CRATE-VERIFY ?auto_844 ?auto_845 ?auto_846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_852 - SURFACE
      ?auto_853 - SURFACE
    )
    :vars
    (
      ?auto_859 - HOIST
      ?auto_858 - PLACE
      ?auto_854 - SURFACE
      ?auto_857 - TRUCK
      ?auto_855 - PLACE
      ?auto_856 - HOIST
      ?auto_860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859 ?auto_858 ) ( SURFACE-AT ?auto_852 ?auto_858 ) ( CLEAR ?auto_852 ) ( IS-CRATE ?auto_853 ) ( not ( = ?auto_852 ?auto_853 ) ) ( AVAILABLE ?auto_859 ) ( ON ?auto_852 ?auto_854 ) ( not ( = ?auto_854 ?auto_852 ) ) ( not ( = ?auto_854 ?auto_853 ) ) ( TRUCK-AT ?auto_857 ?auto_855 ) ( not ( = ?auto_855 ?auto_858 ) ) ( HOIST-AT ?auto_856 ?auto_855 ) ( not ( = ?auto_859 ?auto_856 ) ) ( AVAILABLE ?auto_856 ) ( SURFACE-AT ?auto_853 ?auto_855 ) ( ON ?auto_853 ?auto_860 ) ( CLEAR ?auto_853 ) ( not ( = ?auto_852 ?auto_860 ) ) ( not ( = ?auto_853 ?auto_860 ) ) ( not ( = ?auto_854 ?auto_860 ) ) )
    :subtasks
    ( ( !LIFT ?auto_856 ?auto_853 ?auto_860 ?auto_855 )
      ( MAKE-2CRATE ?auto_854 ?auto_852 ?auto_853 )
      ( MAKE-1CRATE-VERIFY ?auto_852 ?auto_853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_861 - SURFACE
      ?auto_862 - SURFACE
      ?auto_863 - SURFACE
    )
    :vars
    (
      ?auto_869 - HOIST
      ?auto_865 - PLACE
      ?auto_864 - TRUCK
      ?auto_867 - PLACE
      ?auto_868 - HOIST
      ?auto_866 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_869 ?auto_865 ) ( SURFACE-AT ?auto_862 ?auto_865 ) ( CLEAR ?auto_862 ) ( IS-CRATE ?auto_863 ) ( not ( = ?auto_862 ?auto_863 ) ) ( AVAILABLE ?auto_869 ) ( ON ?auto_862 ?auto_861 ) ( not ( = ?auto_861 ?auto_862 ) ) ( not ( = ?auto_861 ?auto_863 ) ) ( TRUCK-AT ?auto_864 ?auto_867 ) ( not ( = ?auto_867 ?auto_865 ) ) ( HOIST-AT ?auto_868 ?auto_867 ) ( not ( = ?auto_869 ?auto_868 ) ) ( AVAILABLE ?auto_868 ) ( SURFACE-AT ?auto_863 ?auto_867 ) ( ON ?auto_863 ?auto_866 ) ( CLEAR ?auto_863 ) ( not ( = ?auto_862 ?auto_866 ) ) ( not ( = ?auto_863 ?auto_866 ) ) ( not ( = ?auto_861 ?auto_866 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_862 ?auto_863 )
      ( MAKE-2CRATE-VERIFY ?auto_861 ?auto_862 ?auto_863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_870 - SURFACE
      ?auto_871 - SURFACE
    )
    :vars
    (
      ?auto_878 - HOIST
      ?auto_872 - PLACE
      ?auto_875 - SURFACE
      ?auto_874 - PLACE
      ?auto_876 - HOIST
      ?auto_877 - SURFACE
      ?auto_873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_878 ?auto_872 ) ( SURFACE-AT ?auto_870 ?auto_872 ) ( CLEAR ?auto_870 ) ( IS-CRATE ?auto_871 ) ( not ( = ?auto_870 ?auto_871 ) ) ( AVAILABLE ?auto_878 ) ( ON ?auto_870 ?auto_875 ) ( not ( = ?auto_875 ?auto_870 ) ) ( not ( = ?auto_875 ?auto_871 ) ) ( not ( = ?auto_874 ?auto_872 ) ) ( HOIST-AT ?auto_876 ?auto_874 ) ( not ( = ?auto_878 ?auto_876 ) ) ( AVAILABLE ?auto_876 ) ( SURFACE-AT ?auto_871 ?auto_874 ) ( ON ?auto_871 ?auto_877 ) ( CLEAR ?auto_871 ) ( not ( = ?auto_870 ?auto_877 ) ) ( not ( = ?auto_871 ?auto_877 ) ) ( not ( = ?auto_875 ?auto_877 ) ) ( TRUCK-AT ?auto_873 ?auto_872 ) )
    :subtasks
    ( ( !DRIVE ?auto_873 ?auto_872 ?auto_874 )
      ( MAKE-2CRATE ?auto_875 ?auto_870 ?auto_871 )
      ( MAKE-1CRATE-VERIFY ?auto_870 ?auto_871 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_879 - SURFACE
      ?auto_880 - SURFACE
      ?auto_881 - SURFACE
    )
    :vars
    (
      ?auto_884 - HOIST
      ?auto_886 - PLACE
      ?auto_883 - PLACE
      ?auto_885 - HOIST
      ?auto_887 - SURFACE
      ?auto_882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884 ?auto_886 ) ( SURFACE-AT ?auto_880 ?auto_886 ) ( CLEAR ?auto_880 ) ( IS-CRATE ?auto_881 ) ( not ( = ?auto_880 ?auto_881 ) ) ( AVAILABLE ?auto_884 ) ( ON ?auto_880 ?auto_879 ) ( not ( = ?auto_879 ?auto_880 ) ) ( not ( = ?auto_879 ?auto_881 ) ) ( not ( = ?auto_883 ?auto_886 ) ) ( HOIST-AT ?auto_885 ?auto_883 ) ( not ( = ?auto_884 ?auto_885 ) ) ( AVAILABLE ?auto_885 ) ( SURFACE-AT ?auto_881 ?auto_883 ) ( ON ?auto_881 ?auto_887 ) ( CLEAR ?auto_881 ) ( not ( = ?auto_880 ?auto_887 ) ) ( not ( = ?auto_881 ?auto_887 ) ) ( not ( = ?auto_879 ?auto_887 ) ) ( TRUCK-AT ?auto_882 ?auto_886 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_880 ?auto_881 )
      ( MAKE-2CRATE-VERIFY ?auto_879 ?auto_880 ?auto_881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_888 - SURFACE
      ?auto_889 - SURFACE
    )
    :vars
    (
      ?auto_891 - HOIST
      ?auto_896 - PLACE
      ?auto_890 - SURFACE
      ?auto_893 - PLACE
      ?auto_895 - HOIST
      ?auto_892 - SURFACE
      ?auto_894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_891 ?auto_896 ) ( IS-CRATE ?auto_889 ) ( not ( = ?auto_888 ?auto_889 ) ) ( not ( = ?auto_890 ?auto_888 ) ) ( not ( = ?auto_890 ?auto_889 ) ) ( not ( = ?auto_893 ?auto_896 ) ) ( HOIST-AT ?auto_895 ?auto_893 ) ( not ( = ?auto_891 ?auto_895 ) ) ( AVAILABLE ?auto_895 ) ( SURFACE-AT ?auto_889 ?auto_893 ) ( ON ?auto_889 ?auto_892 ) ( CLEAR ?auto_889 ) ( not ( = ?auto_888 ?auto_892 ) ) ( not ( = ?auto_889 ?auto_892 ) ) ( not ( = ?auto_890 ?auto_892 ) ) ( TRUCK-AT ?auto_894 ?auto_896 ) ( SURFACE-AT ?auto_890 ?auto_896 ) ( CLEAR ?auto_890 ) ( LIFTING ?auto_891 ?auto_888 ) ( IS-CRATE ?auto_888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_890 ?auto_888 )
      ( MAKE-2CRATE ?auto_890 ?auto_888 ?auto_889 )
      ( MAKE-1CRATE-VERIFY ?auto_888 ?auto_889 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_897 - SURFACE
      ?auto_898 - SURFACE
      ?auto_899 - SURFACE
    )
    :vars
    (
      ?auto_900 - HOIST
      ?auto_904 - PLACE
      ?auto_902 - PLACE
      ?auto_903 - HOIST
      ?auto_901 - SURFACE
      ?auto_905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_900 ?auto_904 ) ( IS-CRATE ?auto_899 ) ( not ( = ?auto_898 ?auto_899 ) ) ( not ( = ?auto_897 ?auto_898 ) ) ( not ( = ?auto_897 ?auto_899 ) ) ( not ( = ?auto_902 ?auto_904 ) ) ( HOIST-AT ?auto_903 ?auto_902 ) ( not ( = ?auto_900 ?auto_903 ) ) ( AVAILABLE ?auto_903 ) ( SURFACE-AT ?auto_899 ?auto_902 ) ( ON ?auto_899 ?auto_901 ) ( CLEAR ?auto_899 ) ( not ( = ?auto_898 ?auto_901 ) ) ( not ( = ?auto_899 ?auto_901 ) ) ( not ( = ?auto_897 ?auto_901 ) ) ( TRUCK-AT ?auto_905 ?auto_904 ) ( SURFACE-AT ?auto_897 ?auto_904 ) ( CLEAR ?auto_897 ) ( LIFTING ?auto_900 ?auto_898 ) ( IS-CRATE ?auto_898 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_898 ?auto_899 )
      ( MAKE-2CRATE-VERIFY ?auto_897 ?auto_898 ?auto_899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_906 - SURFACE
      ?auto_907 - SURFACE
    )
    :vars
    (
      ?auto_913 - HOIST
      ?auto_914 - PLACE
      ?auto_909 - SURFACE
      ?auto_908 - PLACE
      ?auto_911 - HOIST
      ?auto_912 - SURFACE
      ?auto_910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913 ?auto_914 ) ( IS-CRATE ?auto_907 ) ( not ( = ?auto_906 ?auto_907 ) ) ( not ( = ?auto_909 ?auto_906 ) ) ( not ( = ?auto_909 ?auto_907 ) ) ( not ( = ?auto_908 ?auto_914 ) ) ( HOIST-AT ?auto_911 ?auto_908 ) ( not ( = ?auto_913 ?auto_911 ) ) ( AVAILABLE ?auto_911 ) ( SURFACE-AT ?auto_907 ?auto_908 ) ( ON ?auto_907 ?auto_912 ) ( CLEAR ?auto_907 ) ( not ( = ?auto_906 ?auto_912 ) ) ( not ( = ?auto_907 ?auto_912 ) ) ( not ( = ?auto_909 ?auto_912 ) ) ( TRUCK-AT ?auto_910 ?auto_914 ) ( SURFACE-AT ?auto_909 ?auto_914 ) ( CLEAR ?auto_909 ) ( IS-CRATE ?auto_906 ) ( AVAILABLE ?auto_913 ) ( IN ?auto_906 ?auto_910 ) )
    :subtasks
    ( ( !UNLOAD ?auto_913 ?auto_906 ?auto_910 ?auto_914 )
      ( MAKE-2CRATE ?auto_909 ?auto_906 ?auto_907 )
      ( MAKE-1CRATE-VERIFY ?auto_906 ?auto_907 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_915 - SURFACE
      ?auto_916 - SURFACE
      ?auto_917 - SURFACE
    )
    :vars
    (
      ?auto_922 - HOIST
      ?auto_923 - PLACE
      ?auto_920 - PLACE
      ?auto_918 - HOIST
      ?auto_919 - SURFACE
      ?auto_921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_922 ?auto_923 ) ( IS-CRATE ?auto_917 ) ( not ( = ?auto_916 ?auto_917 ) ) ( not ( = ?auto_915 ?auto_916 ) ) ( not ( = ?auto_915 ?auto_917 ) ) ( not ( = ?auto_920 ?auto_923 ) ) ( HOIST-AT ?auto_918 ?auto_920 ) ( not ( = ?auto_922 ?auto_918 ) ) ( AVAILABLE ?auto_918 ) ( SURFACE-AT ?auto_917 ?auto_920 ) ( ON ?auto_917 ?auto_919 ) ( CLEAR ?auto_917 ) ( not ( = ?auto_916 ?auto_919 ) ) ( not ( = ?auto_917 ?auto_919 ) ) ( not ( = ?auto_915 ?auto_919 ) ) ( TRUCK-AT ?auto_921 ?auto_923 ) ( SURFACE-AT ?auto_915 ?auto_923 ) ( CLEAR ?auto_915 ) ( IS-CRATE ?auto_916 ) ( AVAILABLE ?auto_922 ) ( IN ?auto_916 ?auto_921 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_916 ?auto_917 )
      ( MAKE-2CRATE-VERIFY ?auto_915 ?auto_916 ?auto_917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_924 - SURFACE
      ?auto_925 - SURFACE
    )
    :vars
    (
      ?auto_932 - HOIST
      ?auto_930 - PLACE
      ?auto_928 - SURFACE
      ?auto_931 - PLACE
      ?auto_929 - HOIST
      ?auto_927 - SURFACE
      ?auto_926 - TRUCK
      ?auto_933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_932 ?auto_930 ) ( IS-CRATE ?auto_925 ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_928 ?auto_924 ) ) ( not ( = ?auto_928 ?auto_925 ) ) ( not ( = ?auto_931 ?auto_930 ) ) ( HOIST-AT ?auto_929 ?auto_931 ) ( not ( = ?auto_932 ?auto_929 ) ) ( AVAILABLE ?auto_929 ) ( SURFACE-AT ?auto_925 ?auto_931 ) ( ON ?auto_925 ?auto_927 ) ( CLEAR ?auto_925 ) ( not ( = ?auto_924 ?auto_927 ) ) ( not ( = ?auto_925 ?auto_927 ) ) ( not ( = ?auto_928 ?auto_927 ) ) ( SURFACE-AT ?auto_928 ?auto_930 ) ( CLEAR ?auto_928 ) ( IS-CRATE ?auto_924 ) ( AVAILABLE ?auto_932 ) ( IN ?auto_924 ?auto_926 ) ( TRUCK-AT ?auto_926 ?auto_933 ) ( not ( = ?auto_933 ?auto_930 ) ) ( not ( = ?auto_931 ?auto_933 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_926 ?auto_933 ?auto_930 )
      ( MAKE-2CRATE ?auto_928 ?auto_924 ?auto_925 )
      ( MAKE-1CRATE-VERIFY ?auto_924 ?auto_925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_934 - SURFACE
      ?auto_935 - SURFACE
      ?auto_936 - SURFACE
    )
    :vars
    (
      ?auto_939 - HOIST
      ?auto_938 - PLACE
      ?auto_940 - PLACE
      ?auto_937 - HOIST
      ?auto_941 - SURFACE
      ?auto_942 - TRUCK
      ?auto_943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939 ?auto_938 ) ( IS-CRATE ?auto_936 ) ( not ( = ?auto_935 ?auto_936 ) ) ( not ( = ?auto_934 ?auto_935 ) ) ( not ( = ?auto_934 ?auto_936 ) ) ( not ( = ?auto_940 ?auto_938 ) ) ( HOIST-AT ?auto_937 ?auto_940 ) ( not ( = ?auto_939 ?auto_937 ) ) ( AVAILABLE ?auto_937 ) ( SURFACE-AT ?auto_936 ?auto_940 ) ( ON ?auto_936 ?auto_941 ) ( CLEAR ?auto_936 ) ( not ( = ?auto_935 ?auto_941 ) ) ( not ( = ?auto_936 ?auto_941 ) ) ( not ( = ?auto_934 ?auto_941 ) ) ( SURFACE-AT ?auto_934 ?auto_938 ) ( CLEAR ?auto_934 ) ( IS-CRATE ?auto_935 ) ( AVAILABLE ?auto_939 ) ( IN ?auto_935 ?auto_942 ) ( TRUCK-AT ?auto_942 ?auto_943 ) ( not ( = ?auto_943 ?auto_938 ) ) ( not ( = ?auto_940 ?auto_943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_935 ?auto_936 )
      ( MAKE-2CRATE-VERIFY ?auto_934 ?auto_935 ?auto_936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_944 - SURFACE
      ?auto_945 - SURFACE
    )
    :vars
    (
      ?auto_948 - HOIST
      ?auto_951 - PLACE
      ?auto_953 - SURFACE
      ?auto_947 - PLACE
      ?auto_950 - HOIST
      ?auto_952 - SURFACE
      ?auto_946 - TRUCK
      ?auto_949 - PLACE
      ?auto_954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_948 ?auto_951 ) ( IS-CRATE ?auto_945 ) ( not ( = ?auto_944 ?auto_945 ) ) ( not ( = ?auto_953 ?auto_944 ) ) ( not ( = ?auto_953 ?auto_945 ) ) ( not ( = ?auto_947 ?auto_951 ) ) ( HOIST-AT ?auto_950 ?auto_947 ) ( not ( = ?auto_948 ?auto_950 ) ) ( AVAILABLE ?auto_950 ) ( SURFACE-AT ?auto_945 ?auto_947 ) ( ON ?auto_945 ?auto_952 ) ( CLEAR ?auto_945 ) ( not ( = ?auto_944 ?auto_952 ) ) ( not ( = ?auto_945 ?auto_952 ) ) ( not ( = ?auto_953 ?auto_952 ) ) ( SURFACE-AT ?auto_953 ?auto_951 ) ( CLEAR ?auto_953 ) ( IS-CRATE ?auto_944 ) ( AVAILABLE ?auto_948 ) ( TRUCK-AT ?auto_946 ?auto_949 ) ( not ( = ?auto_949 ?auto_951 ) ) ( not ( = ?auto_947 ?auto_949 ) ) ( HOIST-AT ?auto_954 ?auto_949 ) ( LIFTING ?auto_954 ?auto_944 ) ( not ( = ?auto_948 ?auto_954 ) ) ( not ( = ?auto_950 ?auto_954 ) ) )
    :subtasks
    ( ( !LOAD ?auto_954 ?auto_944 ?auto_946 ?auto_949 )
      ( MAKE-2CRATE ?auto_953 ?auto_944 ?auto_945 )
      ( MAKE-1CRATE-VERIFY ?auto_944 ?auto_945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_955 - SURFACE
      ?auto_956 - SURFACE
      ?auto_957 - SURFACE
    )
    :vars
    (
      ?auto_962 - HOIST
      ?auto_958 - PLACE
      ?auto_964 - PLACE
      ?auto_959 - HOIST
      ?auto_961 - SURFACE
      ?auto_965 - TRUCK
      ?auto_960 - PLACE
      ?auto_963 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_962 ?auto_958 ) ( IS-CRATE ?auto_957 ) ( not ( = ?auto_956 ?auto_957 ) ) ( not ( = ?auto_955 ?auto_956 ) ) ( not ( = ?auto_955 ?auto_957 ) ) ( not ( = ?auto_964 ?auto_958 ) ) ( HOIST-AT ?auto_959 ?auto_964 ) ( not ( = ?auto_962 ?auto_959 ) ) ( AVAILABLE ?auto_959 ) ( SURFACE-AT ?auto_957 ?auto_964 ) ( ON ?auto_957 ?auto_961 ) ( CLEAR ?auto_957 ) ( not ( = ?auto_956 ?auto_961 ) ) ( not ( = ?auto_957 ?auto_961 ) ) ( not ( = ?auto_955 ?auto_961 ) ) ( SURFACE-AT ?auto_955 ?auto_958 ) ( CLEAR ?auto_955 ) ( IS-CRATE ?auto_956 ) ( AVAILABLE ?auto_962 ) ( TRUCK-AT ?auto_965 ?auto_960 ) ( not ( = ?auto_960 ?auto_958 ) ) ( not ( = ?auto_964 ?auto_960 ) ) ( HOIST-AT ?auto_963 ?auto_960 ) ( LIFTING ?auto_963 ?auto_956 ) ( not ( = ?auto_962 ?auto_963 ) ) ( not ( = ?auto_959 ?auto_963 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_956 ?auto_957 )
      ( MAKE-2CRATE-VERIFY ?auto_955 ?auto_956 ?auto_957 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_966 - SURFACE
      ?auto_967 - SURFACE
    )
    :vars
    (
      ?auto_969 - HOIST
      ?auto_970 - PLACE
      ?auto_976 - SURFACE
      ?auto_973 - PLACE
      ?auto_971 - HOIST
      ?auto_975 - SURFACE
      ?auto_968 - TRUCK
      ?auto_972 - PLACE
      ?auto_974 - HOIST
      ?auto_977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_969 ?auto_970 ) ( IS-CRATE ?auto_967 ) ( not ( = ?auto_966 ?auto_967 ) ) ( not ( = ?auto_976 ?auto_966 ) ) ( not ( = ?auto_976 ?auto_967 ) ) ( not ( = ?auto_973 ?auto_970 ) ) ( HOIST-AT ?auto_971 ?auto_973 ) ( not ( = ?auto_969 ?auto_971 ) ) ( AVAILABLE ?auto_971 ) ( SURFACE-AT ?auto_967 ?auto_973 ) ( ON ?auto_967 ?auto_975 ) ( CLEAR ?auto_967 ) ( not ( = ?auto_966 ?auto_975 ) ) ( not ( = ?auto_967 ?auto_975 ) ) ( not ( = ?auto_976 ?auto_975 ) ) ( SURFACE-AT ?auto_976 ?auto_970 ) ( CLEAR ?auto_976 ) ( IS-CRATE ?auto_966 ) ( AVAILABLE ?auto_969 ) ( TRUCK-AT ?auto_968 ?auto_972 ) ( not ( = ?auto_972 ?auto_970 ) ) ( not ( = ?auto_973 ?auto_972 ) ) ( HOIST-AT ?auto_974 ?auto_972 ) ( not ( = ?auto_969 ?auto_974 ) ) ( not ( = ?auto_971 ?auto_974 ) ) ( AVAILABLE ?auto_974 ) ( SURFACE-AT ?auto_966 ?auto_972 ) ( ON ?auto_966 ?auto_977 ) ( CLEAR ?auto_966 ) ( not ( = ?auto_966 ?auto_977 ) ) ( not ( = ?auto_967 ?auto_977 ) ) ( not ( = ?auto_976 ?auto_977 ) ) ( not ( = ?auto_975 ?auto_977 ) ) )
    :subtasks
    ( ( !LIFT ?auto_974 ?auto_966 ?auto_977 ?auto_972 )
      ( MAKE-2CRATE ?auto_976 ?auto_966 ?auto_967 )
      ( MAKE-1CRATE-VERIFY ?auto_966 ?auto_967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_978 - SURFACE
      ?auto_979 - SURFACE
      ?auto_980 - SURFACE
    )
    :vars
    (
      ?auto_983 - HOIST
      ?auto_985 - PLACE
      ?auto_984 - PLACE
      ?auto_986 - HOIST
      ?auto_987 - SURFACE
      ?auto_981 - TRUCK
      ?auto_988 - PLACE
      ?auto_989 - HOIST
      ?auto_982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_983 ?auto_985 ) ( IS-CRATE ?auto_980 ) ( not ( = ?auto_979 ?auto_980 ) ) ( not ( = ?auto_978 ?auto_979 ) ) ( not ( = ?auto_978 ?auto_980 ) ) ( not ( = ?auto_984 ?auto_985 ) ) ( HOIST-AT ?auto_986 ?auto_984 ) ( not ( = ?auto_983 ?auto_986 ) ) ( AVAILABLE ?auto_986 ) ( SURFACE-AT ?auto_980 ?auto_984 ) ( ON ?auto_980 ?auto_987 ) ( CLEAR ?auto_980 ) ( not ( = ?auto_979 ?auto_987 ) ) ( not ( = ?auto_980 ?auto_987 ) ) ( not ( = ?auto_978 ?auto_987 ) ) ( SURFACE-AT ?auto_978 ?auto_985 ) ( CLEAR ?auto_978 ) ( IS-CRATE ?auto_979 ) ( AVAILABLE ?auto_983 ) ( TRUCK-AT ?auto_981 ?auto_988 ) ( not ( = ?auto_988 ?auto_985 ) ) ( not ( = ?auto_984 ?auto_988 ) ) ( HOIST-AT ?auto_989 ?auto_988 ) ( not ( = ?auto_983 ?auto_989 ) ) ( not ( = ?auto_986 ?auto_989 ) ) ( AVAILABLE ?auto_989 ) ( SURFACE-AT ?auto_979 ?auto_988 ) ( ON ?auto_979 ?auto_982 ) ( CLEAR ?auto_979 ) ( not ( = ?auto_979 ?auto_982 ) ) ( not ( = ?auto_980 ?auto_982 ) ) ( not ( = ?auto_978 ?auto_982 ) ) ( not ( = ?auto_987 ?auto_982 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_979 ?auto_980 )
      ( MAKE-2CRATE-VERIFY ?auto_978 ?auto_979 ?auto_980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_990 - SURFACE
      ?auto_991 - SURFACE
    )
    :vars
    (
      ?auto_1000 - HOIST
      ?auto_995 - PLACE
      ?auto_1001 - SURFACE
      ?auto_997 - PLACE
      ?auto_993 - HOIST
      ?auto_992 - SURFACE
      ?auto_999 - PLACE
      ?auto_994 - HOIST
      ?auto_998 - SURFACE
      ?auto_996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1000 ?auto_995 ) ( IS-CRATE ?auto_991 ) ( not ( = ?auto_990 ?auto_991 ) ) ( not ( = ?auto_1001 ?auto_990 ) ) ( not ( = ?auto_1001 ?auto_991 ) ) ( not ( = ?auto_997 ?auto_995 ) ) ( HOIST-AT ?auto_993 ?auto_997 ) ( not ( = ?auto_1000 ?auto_993 ) ) ( AVAILABLE ?auto_993 ) ( SURFACE-AT ?auto_991 ?auto_997 ) ( ON ?auto_991 ?auto_992 ) ( CLEAR ?auto_991 ) ( not ( = ?auto_990 ?auto_992 ) ) ( not ( = ?auto_991 ?auto_992 ) ) ( not ( = ?auto_1001 ?auto_992 ) ) ( SURFACE-AT ?auto_1001 ?auto_995 ) ( CLEAR ?auto_1001 ) ( IS-CRATE ?auto_990 ) ( AVAILABLE ?auto_1000 ) ( not ( = ?auto_999 ?auto_995 ) ) ( not ( = ?auto_997 ?auto_999 ) ) ( HOIST-AT ?auto_994 ?auto_999 ) ( not ( = ?auto_1000 ?auto_994 ) ) ( not ( = ?auto_993 ?auto_994 ) ) ( AVAILABLE ?auto_994 ) ( SURFACE-AT ?auto_990 ?auto_999 ) ( ON ?auto_990 ?auto_998 ) ( CLEAR ?auto_990 ) ( not ( = ?auto_990 ?auto_998 ) ) ( not ( = ?auto_991 ?auto_998 ) ) ( not ( = ?auto_1001 ?auto_998 ) ) ( not ( = ?auto_992 ?auto_998 ) ) ( TRUCK-AT ?auto_996 ?auto_995 ) )
    :subtasks
    ( ( !DRIVE ?auto_996 ?auto_995 ?auto_999 )
      ( MAKE-2CRATE ?auto_1001 ?auto_990 ?auto_991 )
      ( MAKE-1CRATE-VERIFY ?auto_990 ?auto_991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
    )
    :vars
    (
      ?auto_1010 - HOIST
      ?auto_1007 - PLACE
      ?auto_1013 - PLACE
      ?auto_1006 - HOIST
      ?auto_1005 - SURFACE
      ?auto_1008 - PLACE
      ?auto_1012 - HOIST
      ?auto_1009 - SURFACE
      ?auto_1011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1010 ?auto_1007 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1004 ) ) ( not ( = ?auto_1013 ?auto_1007 ) ) ( HOIST-AT ?auto_1006 ?auto_1013 ) ( not ( = ?auto_1010 ?auto_1006 ) ) ( AVAILABLE ?auto_1006 ) ( SURFACE-AT ?auto_1004 ?auto_1013 ) ( ON ?auto_1004 ?auto_1005 ) ( CLEAR ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1005 ) ) ( not ( = ?auto_1004 ?auto_1005 ) ) ( not ( = ?auto_1002 ?auto_1005 ) ) ( SURFACE-AT ?auto_1002 ?auto_1007 ) ( CLEAR ?auto_1002 ) ( IS-CRATE ?auto_1003 ) ( AVAILABLE ?auto_1010 ) ( not ( = ?auto_1008 ?auto_1007 ) ) ( not ( = ?auto_1013 ?auto_1008 ) ) ( HOIST-AT ?auto_1012 ?auto_1008 ) ( not ( = ?auto_1010 ?auto_1012 ) ) ( not ( = ?auto_1006 ?auto_1012 ) ) ( AVAILABLE ?auto_1012 ) ( SURFACE-AT ?auto_1003 ?auto_1008 ) ( ON ?auto_1003 ?auto_1009 ) ( CLEAR ?auto_1003 ) ( not ( = ?auto_1003 ?auto_1009 ) ) ( not ( = ?auto_1004 ?auto_1009 ) ) ( not ( = ?auto_1002 ?auto_1009 ) ) ( not ( = ?auto_1005 ?auto_1009 ) ) ( TRUCK-AT ?auto_1011 ?auto_1007 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1003 ?auto_1004 )
      ( MAKE-2CRATE-VERIFY ?auto_1002 ?auto_1003 ?auto_1004 ) )
  )

)

