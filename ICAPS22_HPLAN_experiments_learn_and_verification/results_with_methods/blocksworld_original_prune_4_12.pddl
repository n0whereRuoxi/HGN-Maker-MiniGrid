( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11828 - BLOCK
      ?auto_11829 - BLOCK
      ?auto_11830 - BLOCK
      ?auto_11831 - BLOCK
    )
    :vars
    (
      ?auto_11832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11832 ?auto_11831 ) ( CLEAR ?auto_11832 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11828 ) ( ON ?auto_11829 ?auto_11828 ) ( ON ?auto_11830 ?auto_11829 ) ( ON ?auto_11831 ?auto_11830 ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( not ( = ?auto_11828 ?auto_11830 ) ) ( not ( = ?auto_11828 ?auto_11831 ) ) ( not ( = ?auto_11828 ?auto_11832 ) ) ( not ( = ?auto_11829 ?auto_11830 ) ) ( not ( = ?auto_11829 ?auto_11831 ) ) ( not ( = ?auto_11829 ?auto_11832 ) ) ( not ( = ?auto_11830 ?auto_11831 ) ) ( not ( = ?auto_11830 ?auto_11832 ) ) ( not ( = ?auto_11831 ?auto_11832 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11832 ?auto_11831 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11834 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11834 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11834 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11835 - BLOCK
    )
    :vars
    (
      ?auto_11836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11835 ?auto_11836 ) ( CLEAR ?auto_11835 ) ( HAND-EMPTY ) ( not ( = ?auto_11835 ?auto_11836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11835 ?auto_11836 )
      ( MAKE-1PILE ?auto_11835 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11840 - BLOCK
      ?auto_11841 - BLOCK
      ?auto_11842 - BLOCK
    )
    :vars
    (
      ?auto_11843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11843 ?auto_11842 ) ( CLEAR ?auto_11843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11840 ) ( ON ?auto_11841 ?auto_11840 ) ( ON ?auto_11842 ?auto_11841 ) ( not ( = ?auto_11840 ?auto_11841 ) ) ( not ( = ?auto_11840 ?auto_11842 ) ) ( not ( = ?auto_11840 ?auto_11843 ) ) ( not ( = ?auto_11841 ?auto_11842 ) ) ( not ( = ?auto_11841 ?auto_11843 ) ) ( not ( = ?auto_11842 ?auto_11843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11843 ?auto_11842 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11844 - BLOCK
      ?auto_11845 - BLOCK
      ?auto_11846 - BLOCK
    )
    :vars
    (
      ?auto_11847 - BLOCK
      ?auto_11848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11847 ?auto_11846 ) ( CLEAR ?auto_11847 ) ( ON-TABLE ?auto_11844 ) ( ON ?auto_11845 ?auto_11844 ) ( ON ?auto_11846 ?auto_11845 ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11847 ) ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( not ( = ?auto_11845 ?auto_11847 ) ) ( not ( = ?auto_11846 ?auto_11847 ) ) ( HOLDING ?auto_11848 ) ( not ( = ?auto_11844 ?auto_11848 ) ) ( not ( = ?auto_11845 ?auto_11848 ) ) ( not ( = ?auto_11846 ?auto_11848 ) ) ( not ( = ?auto_11847 ?auto_11848 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11848 )
      ( MAKE-3PILE ?auto_11844 ?auto_11845 ?auto_11846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11849 - BLOCK
      ?auto_11850 - BLOCK
      ?auto_11851 - BLOCK
    )
    :vars
    (
      ?auto_11853 - BLOCK
      ?auto_11852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11853 ?auto_11851 ) ( ON-TABLE ?auto_11849 ) ( ON ?auto_11850 ?auto_11849 ) ( ON ?auto_11851 ?auto_11850 ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11851 ) ) ( not ( = ?auto_11849 ?auto_11853 ) ) ( not ( = ?auto_11850 ?auto_11851 ) ) ( not ( = ?auto_11850 ?auto_11853 ) ) ( not ( = ?auto_11851 ?auto_11853 ) ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( not ( = ?auto_11853 ?auto_11852 ) ) ( ON ?auto_11852 ?auto_11853 ) ( CLEAR ?auto_11852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11849 ?auto_11850 ?auto_11851 ?auto_11853 )
      ( MAKE-3PILE ?auto_11849 ?auto_11850 ?auto_11851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11856 - BLOCK
      ?auto_11857 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11857 ) ( CLEAR ?auto_11856 ) ( ON-TABLE ?auto_11856 ) ( not ( = ?auto_11856 ?auto_11857 ) ) )
    :subtasks
    ( ( !STACK ?auto_11857 ?auto_11856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11858 - BLOCK
      ?auto_11859 - BLOCK
    )
    :vars
    (
      ?auto_11860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11858 ) ( ON-TABLE ?auto_11858 ) ( not ( = ?auto_11858 ?auto_11859 ) ) ( ON ?auto_11859 ?auto_11860 ) ( CLEAR ?auto_11859 ) ( HAND-EMPTY ) ( not ( = ?auto_11858 ?auto_11860 ) ) ( not ( = ?auto_11859 ?auto_11860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11859 ?auto_11860 )
      ( MAKE-2PILE ?auto_11858 ?auto_11859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11861 - BLOCK
      ?auto_11862 - BLOCK
    )
    :vars
    (
      ?auto_11863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11861 ?auto_11862 ) ) ( ON ?auto_11862 ?auto_11863 ) ( CLEAR ?auto_11862 ) ( not ( = ?auto_11861 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11863 ) ) ( HOLDING ?auto_11861 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11861 )
      ( MAKE-2PILE ?auto_11861 ?auto_11862 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11864 - BLOCK
      ?auto_11865 - BLOCK
    )
    :vars
    (
      ?auto_11866 - BLOCK
      ?auto_11867 - BLOCK
      ?auto_11868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11864 ?auto_11865 ) ) ( ON ?auto_11865 ?auto_11866 ) ( not ( = ?auto_11864 ?auto_11866 ) ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( ON ?auto_11864 ?auto_11865 ) ( CLEAR ?auto_11864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11867 ) ( ON ?auto_11868 ?auto_11867 ) ( ON ?auto_11866 ?auto_11868 ) ( not ( = ?auto_11867 ?auto_11868 ) ) ( not ( = ?auto_11867 ?auto_11866 ) ) ( not ( = ?auto_11867 ?auto_11865 ) ) ( not ( = ?auto_11867 ?auto_11864 ) ) ( not ( = ?auto_11868 ?auto_11866 ) ) ( not ( = ?auto_11868 ?auto_11865 ) ) ( not ( = ?auto_11868 ?auto_11864 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11867 ?auto_11868 ?auto_11866 ?auto_11865 )
      ( MAKE-2PILE ?auto_11864 ?auto_11865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11871 - BLOCK
      ?auto_11872 - BLOCK
    )
    :vars
    (
      ?auto_11873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11873 ?auto_11872 ) ( CLEAR ?auto_11873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11871 ) ( ON ?auto_11872 ?auto_11871 ) ( not ( = ?auto_11871 ?auto_11872 ) ) ( not ( = ?auto_11871 ?auto_11873 ) ) ( not ( = ?auto_11872 ?auto_11873 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11873 ?auto_11872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11874 - BLOCK
      ?auto_11875 - BLOCK
    )
    :vars
    (
      ?auto_11876 - BLOCK
      ?auto_11877 - BLOCK
      ?auto_11878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11876 ?auto_11875 ) ( CLEAR ?auto_11876 ) ( ON-TABLE ?auto_11874 ) ( ON ?auto_11875 ?auto_11874 ) ( not ( = ?auto_11874 ?auto_11875 ) ) ( not ( = ?auto_11874 ?auto_11876 ) ) ( not ( = ?auto_11875 ?auto_11876 ) ) ( HOLDING ?auto_11877 ) ( CLEAR ?auto_11878 ) ( not ( = ?auto_11874 ?auto_11877 ) ) ( not ( = ?auto_11874 ?auto_11878 ) ) ( not ( = ?auto_11875 ?auto_11877 ) ) ( not ( = ?auto_11875 ?auto_11878 ) ) ( not ( = ?auto_11876 ?auto_11877 ) ) ( not ( = ?auto_11876 ?auto_11878 ) ) ( not ( = ?auto_11877 ?auto_11878 ) ) )
    :subtasks
    ( ( !STACK ?auto_11877 ?auto_11878 )
      ( MAKE-2PILE ?auto_11874 ?auto_11875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12074 - BLOCK
      ?auto_12075 - BLOCK
    )
    :vars
    (
      ?auto_12076 - BLOCK
      ?auto_12077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12076 ?auto_12075 ) ( ON-TABLE ?auto_12074 ) ( ON ?auto_12075 ?auto_12074 ) ( not ( = ?auto_12074 ?auto_12075 ) ) ( not ( = ?auto_12074 ?auto_12076 ) ) ( not ( = ?auto_12075 ?auto_12076 ) ) ( not ( = ?auto_12074 ?auto_12077 ) ) ( not ( = ?auto_12075 ?auto_12077 ) ) ( not ( = ?auto_12076 ?auto_12077 ) ) ( ON ?auto_12077 ?auto_12076 ) ( CLEAR ?auto_12077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12074 ?auto_12075 ?auto_12076 )
      ( MAKE-2PILE ?auto_12074 ?auto_12075 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11884 - BLOCK
      ?auto_11885 - BLOCK
    )
    :vars
    (
      ?auto_11887 - BLOCK
      ?auto_11886 - BLOCK
      ?auto_11888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11887 ?auto_11885 ) ( ON-TABLE ?auto_11884 ) ( ON ?auto_11885 ?auto_11884 ) ( not ( = ?auto_11884 ?auto_11885 ) ) ( not ( = ?auto_11884 ?auto_11887 ) ) ( not ( = ?auto_11885 ?auto_11887 ) ) ( not ( = ?auto_11884 ?auto_11886 ) ) ( not ( = ?auto_11884 ?auto_11888 ) ) ( not ( = ?auto_11885 ?auto_11886 ) ) ( not ( = ?auto_11885 ?auto_11888 ) ) ( not ( = ?auto_11887 ?auto_11886 ) ) ( not ( = ?auto_11887 ?auto_11888 ) ) ( not ( = ?auto_11886 ?auto_11888 ) ) ( ON ?auto_11886 ?auto_11887 ) ( CLEAR ?auto_11886 ) ( HOLDING ?auto_11888 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11888 )
      ( MAKE-2PILE ?auto_11884 ?auto_11885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11889 - BLOCK
      ?auto_11890 - BLOCK
    )
    :vars
    (
      ?auto_11893 - BLOCK
      ?auto_11891 - BLOCK
      ?auto_11892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11893 ?auto_11890 ) ( ON-TABLE ?auto_11889 ) ( ON ?auto_11890 ?auto_11889 ) ( not ( = ?auto_11889 ?auto_11890 ) ) ( not ( = ?auto_11889 ?auto_11893 ) ) ( not ( = ?auto_11890 ?auto_11893 ) ) ( not ( = ?auto_11889 ?auto_11891 ) ) ( not ( = ?auto_11889 ?auto_11892 ) ) ( not ( = ?auto_11890 ?auto_11891 ) ) ( not ( = ?auto_11890 ?auto_11892 ) ) ( not ( = ?auto_11893 ?auto_11891 ) ) ( not ( = ?auto_11893 ?auto_11892 ) ) ( not ( = ?auto_11891 ?auto_11892 ) ) ( ON ?auto_11891 ?auto_11893 ) ( ON ?auto_11892 ?auto_11891 ) ( CLEAR ?auto_11892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11889 ?auto_11890 ?auto_11893 ?auto_11891 )
      ( MAKE-2PILE ?auto_11889 ?auto_11890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11897 - BLOCK
      ?auto_11898 - BLOCK
      ?auto_11899 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11899 ) ( CLEAR ?auto_11898 ) ( ON-TABLE ?auto_11897 ) ( ON ?auto_11898 ?auto_11897 ) ( not ( = ?auto_11897 ?auto_11898 ) ) ( not ( = ?auto_11897 ?auto_11899 ) ) ( not ( = ?auto_11898 ?auto_11899 ) ) )
    :subtasks
    ( ( !STACK ?auto_11899 ?auto_11898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11900 - BLOCK
      ?auto_11901 - BLOCK
      ?auto_11902 - BLOCK
    )
    :vars
    (
      ?auto_11903 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11901 ) ( ON-TABLE ?auto_11900 ) ( ON ?auto_11901 ?auto_11900 ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11902 ) ) ( not ( = ?auto_11901 ?auto_11902 ) ) ( ON ?auto_11902 ?auto_11903 ) ( CLEAR ?auto_11902 ) ( HAND-EMPTY ) ( not ( = ?auto_11900 ?auto_11903 ) ) ( not ( = ?auto_11901 ?auto_11903 ) ) ( not ( = ?auto_11902 ?auto_11903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11902 ?auto_11903 )
      ( MAKE-3PILE ?auto_11900 ?auto_11901 ?auto_11902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11904 - BLOCK
      ?auto_11905 - BLOCK
      ?auto_11906 - BLOCK
    )
    :vars
    (
      ?auto_11907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11904 ) ( not ( = ?auto_11904 ?auto_11905 ) ) ( not ( = ?auto_11904 ?auto_11906 ) ) ( not ( = ?auto_11905 ?auto_11906 ) ) ( ON ?auto_11906 ?auto_11907 ) ( CLEAR ?auto_11906 ) ( not ( = ?auto_11904 ?auto_11907 ) ) ( not ( = ?auto_11905 ?auto_11907 ) ) ( not ( = ?auto_11906 ?auto_11907 ) ) ( HOLDING ?auto_11905 ) ( CLEAR ?auto_11904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11904 ?auto_11905 )
      ( MAKE-3PILE ?auto_11904 ?auto_11905 ?auto_11906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11908 - BLOCK
      ?auto_11909 - BLOCK
      ?auto_11910 - BLOCK
    )
    :vars
    (
      ?auto_11911 - BLOCK
      ?auto_11912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11908 ) ( not ( = ?auto_11908 ?auto_11909 ) ) ( not ( = ?auto_11908 ?auto_11910 ) ) ( not ( = ?auto_11909 ?auto_11910 ) ) ( ON ?auto_11910 ?auto_11911 ) ( not ( = ?auto_11908 ?auto_11911 ) ) ( not ( = ?auto_11909 ?auto_11911 ) ) ( not ( = ?auto_11910 ?auto_11911 ) ) ( CLEAR ?auto_11908 ) ( ON ?auto_11909 ?auto_11910 ) ( CLEAR ?auto_11909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11912 ) ( ON ?auto_11911 ?auto_11912 ) ( not ( = ?auto_11912 ?auto_11911 ) ) ( not ( = ?auto_11912 ?auto_11910 ) ) ( not ( = ?auto_11912 ?auto_11909 ) ) ( not ( = ?auto_11908 ?auto_11912 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11912 ?auto_11911 ?auto_11910 )
      ( MAKE-3PILE ?auto_11908 ?auto_11909 ?auto_11910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11913 - BLOCK
      ?auto_11914 - BLOCK
      ?auto_11915 - BLOCK
    )
    :vars
    (
      ?auto_11917 - BLOCK
      ?auto_11916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11913 ?auto_11914 ) ) ( not ( = ?auto_11913 ?auto_11915 ) ) ( not ( = ?auto_11914 ?auto_11915 ) ) ( ON ?auto_11915 ?auto_11917 ) ( not ( = ?auto_11913 ?auto_11917 ) ) ( not ( = ?auto_11914 ?auto_11917 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) ( ON ?auto_11914 ?auto_11915 ) ( CLEAR ?auto_11914 ) ( ON-TABLE ?auto_11916 ) ( ON ?auto_11917 ?auto_11916 ) ( not ( = ?auto_11916 ?auto_11917 ) ) ( not ( = ?auto_11916 ?auto_11915 ) ) ( not ( = ?auto_11916 ?auto_11914 ) ) ( not ( = ?auto_11913 ?auto_11916 ) ) ( HOLDING ?auto_11913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11913 )
      ( MAKE-3PILE ?auto_11913 ?auto_11914 ?auto_11915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11918 - BLOCK
      ?auto_11919 - BLOCK
      ?auto_11920 - BLOCK
    )
    :vars
    (
      ?auto_11921 - BLOCK
      ?auto_11922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11918 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11920 ) ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( ON ?auto_11920 ?auto_11921 ) ( not ( = ?auto_11918 ?auto_11921 ) ) ( not ( = ?auto_11919 ?auto_11921 ) ) ( not ( = ?auto_11920 ?auto_11921 ) ) ( ON ?auto_11919 ?auto_11920 ) ( ON-TABLE ?auto_11922 ) ( ON ?auto_11921 ?auto_11922 ) ( not ( = ?auto_11922 ?auto_11921 ) ) ( not ( = ?auto_11922 ?auto_11920 ) ) ( not ( = ?auto_11922 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11922 ) ) ( ON ?auto_11918 ?auto_11919 ) ( CLEAR ?auto_11918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11922 ?auto_11921 ?auto_11920 ?auto_11919 )
      ( MAKE-3PILE ?auto_11918 ?auto_11919 ?auto_11920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11924 - BLOCK
    )
    :vars
    (
      ?auto_11925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11925 ?auto_11924 ) ( CLEAR ?auto_11925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11924 ) ( not ( = ?auto_11924 ?auto_11925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11925 ?auto_11924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11926 - BLOCK
    )
    :vars
    (
      ?auto_11927 - BLOCK
      ?auto_11928 - BLOCK
      ?auto_11929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11927 ?auto_11926 ) ( CLEAR ?auto_11927 ) ( ON-TABLE ?auto_11926 ) ( not ( = ?auto_11926 ?auto_11927 ) ) ( HOLDING ?auto_11928 ) ( CLEAR ?auto_11929 ) ( not ( = ?auto_11926 ?auto_11928 ) ) ( not ( = ?auto_11926 ?auto_11929 ) ) ( not ( = ?auto_11927 ?auto_11928 ) ) ( not ( = ?auto_11927 ?auto_11929 ) ) ( not ( = ?auto_11928 ?auto_11929 ) ) )
    :subtasks
    ( ( !STACK ?auto_11928 ?auto_11929 )
      ( MAKE-1PILE ?auto_11926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11930 - BLOCK
    )
    :vars
    (
      ?auto_11933 - BLOCK
      ?auto_11932 - BLOCK
      ?auto_11931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11933 ?auto_11930 ) ( ON-TABLE ?auto_11930 ) ( not ( = ?auto_11930 ?auto_11933 ) ) ( CLEAR ?auto_11932 ) ( not ( = ?auto_11930 ?auto_11931 ) ) ( not ( = ?auto_11930 ?auto_11932 ) ) ( not ( = ?auto_11933 ?auto_11931 ) ) ( not ( = ?auto_11933 ?auto_11932 ) ) ( not ( = ?auto_11931 ?auto_11932 ) ) ( ON ?auto_11931 ?auto_11933 ) ( CLEAR ?auto_11931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11930 ?auto_11933 )
      ( MAKE-1PILE ?auto_11930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11934 - BLOCK
    )
    :vars
    (
      ?auto_11935 - BLOCK
      ?auto_11936 - BLOCK
      ?auto_11937 - BLOCK
      ?auto_11938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11935 ?auto_11934 ) ( ON-TABLE ?auto_11934 ) ( not ( = ?auto_11934 ?auto_11935 ) ) ( not ( = ?auto_11934 ?auto_11936 ) ) ( not ( = ?auto_11934 ?auto_11937 ) ) ( not ( = ?auto_11935 ?auto_11936 ) ) ( not ( = ?auto_11935 ?auto_11937 ) ) ( not ( = ?auto_11936 ?auto_11937 ) ) ( ON ?auto_11936 ?auto_11935 ) ( CLEAR ?auto_11936 ) ( HOLDING ?auto_11937 ) ( CLEAR ?auto_11938 ) ( ON-TABLE ?auto_11938 ) ( not ( = ?auto_11938 ?auto_11937 ) ) ( not ( = ?auto_11934 ?auto_11938 ) ) ( not ( = ?auto_11935 ?auto_11938 ) ) ( not ( = ?auto_11936 ?auto_11938 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11938 ?auto_11937 )
      ( MAKE-1PILE ?auto_11934 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12162 - BLOCK
    )
    :vars
    (
      ?auto_12165 - BLOCK
      ?auto_12163 - BLOCK
      ?auto_12164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12165 ?auto_12162 ) ( ON-TABLE ?auto_12162 ) ( not ( = ?auto_12162 ?auto_12165 ) ) ( not ( = ?auto_12162 ?auto_12163 ) ) ( not ( = ?auto_12162 ?auto_12164 ) ) ( not ( = ?auto_12165 ?auto_12163 ) ) ( not ( = ?auto_12165 ?auto_12164 ) ) ( not ( = ?auto_12163 ?auto_12164 ) ) ( ON ?auto_12163 ?auto_12165 ) ( ON ?auto_12164 ?auto_12163 ) ( CLEAR ?auto_12164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12162 ?auto_12165 ?auto_12163 )
      ( MAKE-1PILE ?auto_12162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11944 - BLOCK
    )
    :vars
    (
      ?auto_11946 - BLOCK
      ?auto_11945 - BLOCK
      ?auto_11947 - BLOCK
      ?auto_11948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11946 ?auto_11944 ) ( ON-TABLE ?auto_11944 ) ( not ( = ?auto_11944 ?auto_11946 ) ) ( not ( = ?auto_11944 ?auto_11945 ) ) ( not ( = ?auto_11944 ?auto_11947 ) ) ( not ( = ?auto_11946 ?auto_11945 ) ) ( not ( = ?auto_11946 ?auto_11947 ) ) ( not ( = ?auto_11945 ?auto_11947 ) ) ( ON ?auto_11945 ?auto_11946 ) ( not ( = ?auto_11948 ?auto_11947 ) ) ( not ( = ?auto_11944 ?auto_11948 ) ) ( not ( = ?auto_11946 ?auto_11948 ) ) ( not ( = ?auto_11945 ?auto_11948 ) ) ( ON ?auto_11947 ?auto_11945 ) ( CLEAR ?auto_11947 ) ( HOLDING ?auto_11948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11948 )
      ( MAKE-1PILE ?auto_11944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11949 - BLOCK
    )
    :vars
    (
      ?auto_11953 - BLOCK
      ?auto_11950 - BLOCK
      ?auto_11951 - BLOCK
      ?auto_11952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11953 ?auto_11949 ) ( ON-TABLE ?auto_11949 ) ( not ( = ?auto_11949 ?auto_11953 ) ) ( not ( = ?auto_11949 ?auto_11950 ) ) ( not ( = ?auto_11949 ?auto_11951 ) ) ( not ( = ?auto_11953 ?auto_11950 ) ) ( not ( = ?auto_11953 ?auto_11951 ) ) ( not ( = ?auto_11950 ?auto_11951 ) ) ( ON ?auto_11950 ?auto_11953 ) ( not ( = ?auto_11952 ?auto_11951 ) ) ( not ( = ?auto_11949 ?auto_11952 ) ) ( not ( = ?auto_11953 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11952 ) ) ( ON ?auto_11951 ?auto_11950 ) ( ON ?auto_11952 ?auto_11951 ) ( CLEAR ?auto_11952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11949 ?auto_11953 ?auto_11950 ?auto_11951 )
      ( MAKE-1PILE ?auto_11949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11958 - BLOCK
      ?auto_11959 - BLOCK
      ?auto_11960 - BLOCK
      ?auto_11961 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11961 ) ( CLEAR ?auto_11960 ) ( ON-TABLE ?auto_11958 ) ( ON ?auto_11959 ?auto_11958 ) ( ON ?auto_11960 ?auto_11959 ) ( not ( = ?auto_11958 ?auto_11959 ) ) ( not ( = ?auto_11958 ?auto_11960 ) ) ( not ( = ?auto_11958 ?auto_11961 ) ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( not ( = ?auto_11959 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11961 ) ) )
    :subtasks
    ( ( !STACK ?auto_11961 ?auto_11960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11962 - BLOCK
      ?auto_11963 - BLOCK
      ?auto_11964 - BLOCK
      ?auto_11965 - BLOCK
    )
    :vars
    (
      ?auto_11966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11964 ) ( ON-TABLE ?auto_11962 ) ( ON ?auto_11963 ?auto_11962 ) ( ON ?auto_11964 ?auto_11963 ) ( not ( = ?auto_11962 ?auto_11963 ) ) ( not ( = ?auto_11962 ?auto_11964 ) ) ( not ( = ?auto_11962 ?auto_11965 ) ) ( not ( = ?auto_11963 ?auto_11964 ) ) ( not ( = ?auto_11963 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11965 ) ) ( ON ?auto_11965 ?auto_11966 ) ( CLEAR ?auto_11965 ) ( HAND-EMPTY ) ( not ( = ?auto_11962 ?auto_11966 ) ) ( not ( = ?auto_11963 ?auto_11966 ) ) ( not ( = ?auto_11964 ?auto_11966 ) ) ( not ( = ?auto_11965 ?auto_11966 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11965 ?auto_11966 )
      ( MAKE-4PILE ?auto_11962 ?auto_11963 ?auto_11964 ?auto_11965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11967 - BLOCK
      ?auto_11968 - BLOCK
      ?auto_11969 - BLOCK
      ?auto_11970 - BLOCK
    )
    :vars
    (
      ?auto_11971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11967 ) ( ON ?auto_11968 ?auto_11967 ) ( not ( = ?auto_11967 ?auto_11968 ) ) ( not ( = ?auto_11967 ?auto_11969 ) ) ( not ( = ?auto_11967 ?auto_11970 ) ) ( not ( = ?auto_11968 ?auto_11969 ) ) ( not ( = ?auto_11968 ?auto_11970 ) ) ( not ( = ?auto_11969 ?auto_11970 ) ) ( ON ?auto_11970 ?auto_11971 ) ( CLEAR ?auto_11970 ) ( not ( = ?auto_11967 ?auto_11971 ) ) ( not ( = ?auto_11968 ?auto_11971 ) ) ( not ( = ?auto_11969 ?auto_11971 ) ) ( not ( = ?auto_11970 ?auto_11971 ) ) ( HOLDING ?auto_11969 ) ( CLEAR ?auto_11968 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11967 ?auto_11968 ?auto_11969 )
      ( MAKE-4PILE ?auto_11967 ?auto_11968 ?auto_11969 ?auto_11970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11972 - BLOCK
      ?auto_11973 - BLOCK
      ?auto_11974 - BLOCK
      ?auto_11975 - BLOCK
    )
    :vars
    (
      ?auto_11976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11972 ) ( ON ?auto_11973 ?auto_11972 ) ( not ( = ?auto_11972 ?auto_11973 ) ) ( not ( = ?auto_11972 ?auto_11974 ) ) ( not ( = ?auto_11972 ?auto_11975 ) ) ( not ( = ?auto_11973 ?auto_11974 ) ) ( not ( = ?auto_11973 ?auto_11975 ) ) ( not ( = ?auto_11974 ?auto_11975 ) ) ( ON ?auto_11975 ?auto_11976 ) ( not ( = ?auto_11972 ?auto_11976 ) ) ( not ( = ?auto_11973 ?auto_11976 ) ) ( not ( = ?auto_11974 ?auto_11976 ) ) ( not ( = ?auto_11975 ?auto_11976 ) ) ( CLEAR ?auto_11973 ) ( ON ?auto_11974 ?auto_11975 ) ( CLEAR ?auto_11974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11976 ?auto_11975 )
      ( MAKE-4PILE ?auto_11972 ?auto_11973 ?auto_11974 ?auto_11975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11977 - BLOCK
      ?auto_11978 - BLOCK
      ?auto_11979 - BLOCK
      ?auto_11980 - BLOCK
    )
    :vars
    (
      ?auto_11981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11977 ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( not ( = ?auto_11977 ?auto_11979 ) ) ( not ( = ?auto_11977 ?auto_11980 ) ) ( not ( = ?auto_11978 ?auto_11979 ) ) ( not ( = ?auto_11978 ?auto_11980 ) ) ( not ( = ?auto_11979 ?auto_11980 ) ) ( ON ?auto_11980 ?auto_11981 ) ( not ( = ?auto_11977 ?auto_11981 ) ) ( not ( = ?auto_11978 ?auto_11981 ) ) ( not ( = ?auto_11979 ?auto_11981 ) ) ( not ( = ?auto_11980 ?auto_11981 ) ) ( ON ?auto_11979 ?auto_11980 ) ( CLEAR ?auto_11979 ) ( ON-TABLE ?auto_11981 ) ( HOLDING ?auto_11978 ) ( CLEAR ?auto_11977 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11977 ?auto_11978 )
      ( MAKE-4PILE ?auto_11977 ?auto_11978 ?auto_11979 ?auto_11980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11982 - BLOCK
      ?auto_11983 - BLOCK
      ?auto_11984 - BLOCK
      ?auto_11985 - BLOCK
    )
    :vars
    (
      ?auto_11986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11982 ) ( not ( = ?auto_11982 ?auto_11983 ) ) ( not ( = ?auto_11982 ?auto_11984 ) ) ( not ( = ?auto_11982 ?auto_11985 ) ) ( not ( = ?auto_11983 ?auto_11984 ) ) ( not ( = ?auto_11983 ?auto_11985 ) ) ( not ( = ?auto_11984 ?auto_11985 ) ) ( ON ?auto_11985 ?auto_11986 ) ( not ( = ?auto_11982 ?auto_11986 ) ) ( not ( = ?auto_11983 ?auto_11986 ) ) ( not ( = ?auto_11984 ?auto_11986 ) ) ( not ( = ?auto_11985 ?auto_11986 ) ) ( ON ?auto_11984 ?auto_11985 ) ( ON-TABLE ?auto_11986 ) ( CLEAR ?auto_11982 ) ( ON ?auto_11983 ?auto_11984 ) ( CLEAR ?auto_11983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11986 ?auto_11985 ?auto_11984 )
      ( MAKE-4PILE ?auto_11982 ?auto_11983 ?auto_11984 ?auto_11985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11987 - BLOCK
      ?auto_11988 - BLOCK
      ?auto_11989 - BLOCK
      ?auto_11990 - BLOCK
    )
    :vars
    (
      ?auto_11991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11987 ?auto_11988 ) ) ( not ( = ?auto_11987 ?auto_11989 ) ) ( not ( = ?auto_11987 ?auto_11990 ) ) ( not ( = ?auto_11988 ?auto_11989 ) ) ( not ( = ?auto_11988 ?auto_11990 ) ) ( not ( = ?auto_11989 ?auto_11990 ) ) ( ON ?auto_11990 ?auto_11991 ) ( not ( = ?auto_11987 ?auto_11991 ) ) ( not ( = ?auto_11988 ?auto_11991 ) ) ( not ( = ?auto_11989 ?auto_11991 ) ) ( not ( = ?auto_11990 ?auto_11991 ) ) ( ON ?auto_11989 ?auto_11990 ) ( ON-TABLE ?auto_11991 ) ( ON ?auto_11988 ?auto_11989 ) ( CLEAR ?auto_11988 ) ( HOLDING ?auto_11987 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11987 )
      ( MAKE-4PILE ?auto_11987 ?auto_11988 ?auto_11989 ?auto_11990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11992 - BLOCK
      ?auto_11993 - BLOCK
      ?auto_11994 - BLOCK
      ?auto_11995 - BLOCK
    )
    :vars
    (
      ?auto_11996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11992 ?auto_11993 ) ) ( not ( = ?auto_11992 ?auto_11994 ) ) ( not ( = ?auto_11992 ?auto_11995 ) ) ( not ( = ?auto_11993 ?auto_11994 ) ) ( not ( = ?auto_11993 ?auto_11995 ) ) ( not ( = ?auto_11994 ?auto_11995 ) ) ( ON ?auto_11995 ?auto_11996 ) ( not ( = ?auto_11992 ?auto_11996 ) ) ( not ( = ?auto_11993 ?auto_11996 ) ) ( not ( = ?auto_11994 ?auto_11996 ) ) ( not ( = ?auto_11995 ?auto_11996 ) ) ( ON ?auto_11994 ?auto_11995 ) ( ON-TABLE ?auto_11996 ) ( ON ?auto_11993 ?auto_11994 ) ( ON ?auto_11992 ?auto_11993 ) ( CLEAR ?auto_11992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11996 ?auto_11995 ?auto_11994 ?auto_11993 )
      ( MAKE-4PILE ?auto_11992 ?auto_11993 ?auto_11994 ?auto_11995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12037 - BLOCK
    )
    :vars
    (
      ?auto_12038 - BLOCK
      ?auto_12039 - BLOCK
      ?auto_12040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12037 ?auto_12038 ) ( CLEAR ?auto_12037 ) ( not ( = ?auto_12037 ?auto_12038 ) ) ( HOLDING ?auto_12039 ) ( CLEAR ?auto_12040 ) ( not ( = ?auto_12037 ?auto_12039 ) ) ( not ( = ?auto_12037 ?auto_12040 ) ) ( not ( = ?auto_12038 ?auto_12039 ) ) ( not ( = ?auto_12038 ?auto_12040 ) ) ( not ( = ?auto_12039 ?auto_12040 ) ) )
    :subtasks
    ( ( !STACK ?auto_12039 ?auto_12040 )
      ( MAKE-1PILE ?auto_12037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12041 - BLOCK
    )
    :vars
    (
      ?auto_12042 - BLOCK
      ?auto_12043 - BLOCK
      ?auto_12044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12041 ?auto_12042 ) ( not ( = ?auto_12041 ?auto_12042 ) ) ( CLEAR ?auto_12043 ) ( not ( = ?auto_12041 ?auto_12044 ) ) ( not ( = ?auto_12041 ?auto_12043 ) ) ( not ( = ?auto_12042 ?auto_12044 ) ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12044 ?auto_12043 ) ) ( ON ?auto_12044 ?auto_12041 ) ( CLEAR ?auto_12044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12042 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12042 ?auto_12041 )
      ( MAKE-1PILE ?auto_12041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12045 - BLOCK
    )
    :vars
    (
      ?auto_12048 - BLOCK
      ?auto_12046 - BLOCK
      ?auto_12047 - BLOCK
      ?auto_12049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12045 ?auto_12048 ) ( not ( = ?auto_12045 ?auto_12048 ) ) ( not ( = ?auto_12045 ?auto_12046 ) ) ( not ( = ?auto_12045 ?auto_12047 ) ) ( not ( = ?auto_12048 ?auto_12046 ) ) ( not ( = ?auto_12048 ?auto_12047 ) ) ( not ( = ?auto_12046 ?auto_12047 ) ) ( ON ?auto_12046 ?auto_12045 ) ( CLEAR ?auto_12046 ) ( ON-TABLE ?auto_12048 ) ( HOLDING ?auto_12047 ) ( CLEAR ?auto_12049 ) ( ON-TABLE ?auto_12049 ) ( not ( = ?auto_12049 ?auto_12047 ) ) ( not ( = ?auto_12045 ?auto_12049 ) ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( not ( = ?auto_12046 ?auto_12049 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12049 ?auto_12047 )
      ( MAKE-1PILE ?auto_12045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12050 - BLOCK
    )
    :vars
    (
      ?auto_12052 - BLOCK
      ?auto_12054 - BLOCK
      ?auto_12051 - BLOCK
      ?auto_12053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12050 ?auto_12052 ) ( not ( = ?auto_12050 ?auto_12052 ) ) ( not ( = ?auto_12050 ?auto_12054 ) ) ( not ( = ?auto_12050 ?auto_12051 ) ) ( not ( = ?auto_12052 ?auto_12054 ) ) ( not ( = ?auto_12052 ?auto_12051 ) ) ( not ( = ?auto_12054 ?auto_12051 ) ) ( ON ?auto_12054 ?auto_12050 ) ( ON-TABLE ?auto_12052 ) ( CLEAR ?auto_12053 ) ( ON-TABLE ?auto_12053 ) ( not ( = ?auto_12053 ?auto_12051 ) ) ( not ( = ?auto_12050 ?auto_12053 ) ) ( not ( = ?auto_12052 ?auto_12053 ) ) ( not ( = ?auto_12054 ?auto_12053 ) ) ( ON ?auto_12051 ?auto_12054 ) ( CLEAR ?auto_12051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12052 ?auto_12050 ?auto_12054 )
      ( MAKE-1PILE ?auto_12050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12055 - BLOCK
    )
    :vars
    (
      ?auto_12059 - BLOCK
      ?auto_12056 - BLOCK
      ?auto_12057 - BLOCK
      ?auto_12058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12055 ?auto_12059 ) ( not ( = ?auto_12055 ?auto_12059 ) ) ( not ( = ?auto_12055 ?auto_12056 ) ) ( not ( = ?auto_12055 ?auto_12057 ) ) ( not ( = ?auto_12059 ?auto_12056 ) ) ( not ( = ?auto_12059 ?auto_12057 ) ) ( not ( = ?auto_12056 ?auto_12057 ) ) ( ON ?auto_12056 ?auto_12055 ) ( ON-TABLE ?auto_12059 ) ( not ( = ?auto_12058 ?auto_12057 ) ) ( not ( = ?auto_12055 ?auto_12058 ) ) ( not ( = ?auto_12059 ?auto_12058 ) ) ( not ( = ?auto_12056 ?auto_12058 ) ) ( ON ?auto_12057 ?auto_12056 ) ( CLEAR ?auto_12057 ) ( HOLDING ?auto_12058 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12058 )
      ( MAKE-1PILE ?auto_12055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12060 - BLOCK
    )
    :vars
    (
      ?auto_12061 - BLOCK
      ?auto_12062 - BLOCK
      ?auto_12063 - BLOCK
      ?auto_12064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12060 ?auto_12061 ) ( not ( = ?auto_12060 ?auto_12061 ) ) ( not ( = ?auto_12060 ?auto_12062 ) ) ( not ( = ?auto_12060 ?auto_12063 ) ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( not ( = ?auto_12061 ?auto_12063 ) ) ( not ( = ?auto_12062 ?auto_12063 ) ) ( ON ?auto_12062 ?auto_12060 ) ( ON-TABLE ?auto_12061 ) ( not ( = ?auto_12064 ?auto_12063 ) ) ( not ( = ?auto_12060 ?auto_12064 ) ) ( not ( = ?auto_12061 ?auto_12064 ) ) ( not ( = ?auto_12062 ?auto_12064 ) ) ( ON ?auto_12063 ?auto_12062 ) ( ON ?auto_12064 ?auto_12063 ) ( CLEAR ?auto_12064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12061 ?auto_12060 ?auto_12062 ?auto_12063 )
      ( MAKE-1PILE ?auto_12060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12070 - BLOCK
      ?auto_12071 - BLOCK
    )
    :vars
    (
      ?auto_12072 - BLOCK
      ?auto_12073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12072 ?auto_12071 ) ( CLEAR ?auto_12072 ) ( ON-TABLE ?auto_12070 ) ( ON ?auto_12071 ?auto_12070 ) ( not ( = ?auto_12070 ?auto_12071 ) ) ( not ( = ?auto_12070 ?auto_12072 ) ) ( not ( = ?auto_12071 ?auto_12072 ) ) ( HOLDING ?auto_12073 ) ( not ( = ?auto_12070 ?auto_12073 ) ) ( not ( = ?auto_12071 ?auto_12073 ) ) ( not ( = ?auto_12072 ?auto_12073 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12073 )
      ( MAKE-2PILE ?auto_12070 ?auto_12071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12107 - BLOCK
      ?auto_12108 - BLOCK
    )
    :vars
    (
      ?auto_12109 - BLOCK
      ?auto_12110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12107 ?auto_12108 ) ) ( ON ?auto_12108 ?auto_12109 ) ( not ( = ?auto_12107 ?auto_12109 ) ) ( not ( = ?auto_12108 ?auto_12109 ) ) ( ON ?auto_12107 ?auto_12108 ) ( CLEAR ?auto_12107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12110 ) ( ON ?auto_12109 ?auto_12110 ) ( not ( = ?auto_12110 ?auto_12109 ) ) ( not ( = ?auto_12110 ?auto_12108 ) ) ( not ( = ?auto_12110 ?auto_12107 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12110 ?auto_12109 ?auto_12108 )
      ( MAKE-2PILE ?auto_12107 ?auto_12108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12113 - BLOCK
      ?auto_12114 - BLOCK
    )
    :vars
    (
      ?auto_12115 - BLOCK
      ?auto_12116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12113 ?auto_12114 ) ) ( ON ?auto_12114 ?auto_12115 ) ( CLEAR ?auto_12114 ) ( not ( = ?auto_12113 ?auto_12115 ) ) ( not ( = ?auto_12114 ?auto_12115 ) ) ( ON ?auto_12113 ?auto_12116 ) ( CLEAR ?auto_12113 ) ( HAND-EMPTY ) ( not ( = ?auto_12113 ?auto_12116 ) ) ( not ( = ?auto_12114 ?auto_12116 ) ) ( not ( = ?auto_12115 ?auto_12116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12113 ?auto_12116 )
      ( MAKE-2PILE ?auto_12113 ?auto_12114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12117 - BLOCK
      ?auto_12118 - BLOCK
    )
    :vars
    (
      ?auto_12120 - BLOCK
      ?auto_12119 - BLOCK
      ?auto_12121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12117 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12120 ) ) ( not ( = ?auto_12118 ?auto_12120 ) ) ( ON ?auto_12117 ?auto_12119 ) ( CLEAR ?auto_12117 ) ( not ( = ?auto_12117 ?auto_12119 ) ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12120 ?auto_12119 ) ) ( HOLDING ?auto_12118 ) ( CLEAR ?auto_12120 ) ( ON-TABLE ?auto_12121 ) ( ON ?auto_12120 ?auto_12121 ) ( not ( = ?auto_12121 ?auto_12120 ) ) ( not ( = ?auto_12121 ?auto_12118 ) ) ( not ( = ?auto_12117 ?auto_12121 ) ) ( not ( = ?auto_12119 ?auto_12121 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12121 ?auto_12120 ?auto_12118 )
      ( MAKE-2PILE ?auto_12117 ?auto_12118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12122 - BLOCK
      ?auto_12123 - BLOCK
    )
    :vars
    (
      ?auto_12126 - BLOCK
      ?auto_12124 - BLOCK
      ?auto_12125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12122 ?auto_12123 ) ) ( not ( = ?auto_12122 ?auto_12126 ) ) ( not ( = ?auto_12123 ?auto_12126 ) ) ( ON ?auto_12122 ?auto_12124 ) ( not ( = ?auto_12122 ?auto_12124 ) ) ( not ( = ?auto_12123 ?auto_12124 ) ) ( not ( = ?auto_12126 ?auto_12124 ) ) ( CLEAR ?auto_12126 ) ( ON-TABLE ?auto_12125 ) ( ON ?auto_12126 ?auto_12125 ) ( not ( = ?auto_12125 ?auto_12126 ) ) ( not ( = ?auto_12125 ?auto_12123 ) ) ( not ( = ?auto_12122 ?auto_12125 ) ) ( not ( = ?auto_12124 ?auto_12125 ) ) ( ON ?auto_12123 ?auto_12122 ) ( CLEAR ?auto_12123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12124 ?auto_12122 )
      ( MAKE-2PILE ?auto_12122 ?auto_12123 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12127 - BLOCK
      ?auto_12128 - BLOCK
    )
    :vars
    (
      ?auto_12129 - BLOCK
      ?auto_12130 - BLOCK
      ?auto_12131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12127 ?auto_12128 ) ) ( not ( = ?auto_12127 ?auto_12129 ) ) ( not ( = ?auto_12128 ?auto_12129 ) ) ( ON ?auto_12127 ?auto_12130 ) ( not ( = ?auto_12127 ?auto_12130 ) ) ( not ( = ?auto_12128 ?auto_12130 ) ) ( not ( = ?auto_12129 ?auto_12130 ) ) ( ON-TABLE ?auto_12131 ) ( not ( = ?auto_12131 ?auto_12129 ) ) ( not ( = ?auto_12131 ?auto_12128 ) ) ( not ( = ?auto_12127 ?auto_12131 ) ) ( not ( = ?auto_12130 ?auto_12131 ) ) ( ON ?auto_12128 ?auto_12127 ) ( CLEAR ?auto_12128 ) ( ON-TABLE ?auto_12130 ) ( HOLDING ?auto_12129 ) ( CLEAR ?auto_12131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12131 ?auto_12129 )
      ( MAKE-2PILE ?auto_12127 ?auto_12128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12132 - BLOCK
      ?auto_12133 - BLOCK
    )
    :vars
    (
      ?auto_12136 - BLOCK
      ?auto_12135 - BLOCK
      ?auto_12134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12132 ?auto_12133 ) ) ( not ( = ?auto_12132 ?auto_12136 ) ) ( not ( = ?auto_12133 ?auto_12136 ) ) ( ON ?auto_12132 ?auto_12135 ) ( not ( = ?auto_12132 ?auto_12135 ) ) ( not ( = ?auto_12133 ?auto_12135 ) ) ( not ( = ?auto_12136 ?auto_12135 ) ) ( ON-TABLE ?auto_12134 ) ( not ( = ?auto_12134 ?auto_12136 ) ) ( not ( = ?auto_12134 ?auto_12133 ) ) ( not ( = ?auto_12132 ?auto_12134 ) ) ( not ( = ?auto_12135 ?auto_12134 ) ) ( ON ?auto_12133 ?auto_12132 ) ( ON-TABLE ?auto_12135 ) ( CLEAR ?auto_12134 ) ( ON ?auto_12136 ?auto_12133 ) ( CLEAR ?auto_12136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12135 ?auto_12132 ?auto_12133 )
      ( MAKE-2PILE ?auto_12132 ?auto_12133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12137 - BLOCK
      ?auto_12138 - BLOCK
    )
    :vars
    (
      ?auto_12139 - BLOCK
      ?auto_12141 - BLOCK
      ?auto_12140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12137 ?auto_12138 ) ) ( not ( = ?auto_12137 ?auto_12139 ) ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( ON ?auto_12137 ?auto_12141 ) ( not ( = ?auto_12137 ?auto_12141 ) ) ( not ( = ?auto_12138 ?auto_12141 ) ) ( not ( = ?auto_12139 ?auto_12141 ) ) ( not ( = ?auto_12140 ?auto_12139 ) ) ( not ( = ?auto_12140 ?auto_12138 ) ) ( not ( = ?auto_12137 ?auto_12140 ) ) ( not ( = ?auto_12141 ?auto_12140 ) ) ( ON ?auto_12138 ?auto_12137 ) ( ON-TABLE ?auto_12141 ) ( ON ?auto_12139 ?auto_12138 ) ( CLEAR ?auto_12139 ) ( HOLDING ?auto_12140 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12140 )
      ( MAKE-2PILE ?auto_12137 ?auto_12138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12142 - BLOCK
      ?auto_12143 - BLOCK
    )
    :vars
    (
      ?auto_12145 - BLOCK
      ?auto_12146 - BLOCK
      ?auto_12144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12142 ?auto_12143 ) ) ( not ( = ?auto_12142 ?auto_12145 ) ) ( not ( = ?auto_12143 ?auto_12145 ) ) ( ON ?auto_12142 ?auto_12146 ) ( not ( = ?auto_12142 ?auto_12146 ) ) ( not ( = ?auto_12143 ?auto_12146 ) ) ( not ( = ?auto_12145 ?auto_12146 ) ) ( not ( = ?auto_12144 ?auto_12145 ) ) ( not ( = ?auto_12144 ?auto_12143 ) ) ( not ( = ?auto_12142 ?auto_12144 ) ) ( not ( = ?auto_12146 ?auto_12144 ) ) ( ON ?auto_12143 ?auto_12142 ) ( ON-TABLE ?auto_12146 ) ( ON ?auto_12145 ?auto_12143 ) ( ON ?auto_12144 ?auto_12145 ) ( CLEAR ?auto_12144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12146 ?auto_12142 ?auto_12143 ?auto_12145 )
      ( MAKE-2PILE ?auto_12142 ?auto_12143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12158 - BLOCK
    )
    :vars
    (
      ?auto_12160 - BLOCK
      ?auto_12161 - BLOCK
      ?auto_12159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12160 ?auto_12158 ) ( ON-TABLE ?auto_12158 ) ( not ( = ?auto_12158 ?auto_12160 ) ) ( not ( = ?auto_12158 ?auto_12161 ) ) ( not ( = ?auto_12158 ?auto_12159 ) ) ( not ( = ?auto_12160 ?auto_12161 ) ) ( not ( = ?auto_12160 ?auto_12159 ) ) ( not ( = ?auto_12161 ?auto_12159 ) ) ( ON ?auto_12161 ?auto_12160 ) ( CLEAR ?auto_12161 ) ( HOLDING ?auto_12159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12159 )
      ( MAKE-1PILE ?auto_12158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12191 - BLOCK
      ?auto_12192 - BLOCK
      ?auto_12193 - BLOCK
    )
    :vars
    (
      ?auto_12194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12191 ) ( not ( = ?auto_12191 ?auto_12192 ) ) ( not ( = ?auto_12191 ?auto_12193 ) ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( ON ?auto_12193 ?auto_12194 ) ( not ( = ?auto_12191 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12194 ) ) ( not ( = ?auto_12193 ?auto_12194 ) ) ( CLEAR ?auto_12191 ) ( ON ?auto_12192 ?auto_12193 ) ( CLEAR ?auto_12192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12194 ?auto_12193 )
      ( MAKE-3PILE ?auto_12191 ?auto_12192 ?auto_12193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12195 - BLOCK
      ?auto_12196 - BLOCK
      ?auto_12197 - BLOCK
    )
    :vars
    (
      ?auto_12198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12195 ?auto_12196 ) ) ( not ( = ?auto_12195 ?auto_12197 ) ) ( not ( = ?auto_12196 ?auto_12197 ) ) ( ON ?auto_12197 ?auto_12198 ) ( not ( = ?auto_12195 ?auto_12198 ) ) ( not ( = ?auto_12196 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( ON ?auto_12196 ?auto_12197 ) ( CLEAR ?auto_12196 ) ( ON-TABLE ?auto_12198 ) ( HOLDING ?auto_12195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12195 )
      ( MAKE-3PILE ?auto_12195 ?auto_12196 ?auto_12197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12199 - BLOCK
      ?auto_12200 - BLOCK
      ?auto_12201 - BLOCK
    )
    :vars
    (
      ?auto_12202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12199 ?auto_12200 ) ) ( not ( = ?auto_12199 ?auto_12201 ) ) ( not ( = ?auto_12200 ?auto_12201 ) ) ( ON ?auto_12201 ?auto_12202 ) ( not ( = ?auto_12199 ?auto_12202 ) ) ( not ( = ?auto_12200 ?auto_12202 ) ) ( not ( = ?auto_12201 ?auto_12202 ) ) ( ON ?auto_12200 ?auto_12201 ) ( ON-TABLE ?auto_12202 ) ( ON ?auto_12199 ?auto_12200 ) ( CLEAR ?auto_12199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12202 ?auto_12201 ?auto_12200 )
      ( MAKE-3PILE ?auto_12199 ?auto_12200 ?auto_12201 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12206 - BLOCK
      ?auto_12207 - BLOCK
      ?auto_12208 - BLOCK
    )
    :vars
    (
      ?auto_12209 - BLOCK
      ?auto_12210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12206 ?auto_12207 ) ) ( not ( = ?auto_12206 ?auto_12208 ) ) ( not ( = ?auto_12207 ?auto_12208 ) ) ( ON ?auto_12208 ?auto_12209 ) ( not ( = ?auto_12206 ?auto_12209 ) ) ( not ( = ?auto_12207 ?auto_12209 ) ) ( not ( = ?auto_12208 ?auto_12209 ) ) ( ON ?auto_12207 ?auto_12208 ) ( CLEAR ?auto_12207 ) ( ON-TABLE ?auto_12209 ) ( ON ?auto_12206 ?auto_12210 ) ( CLEAR ?auto_12206 ) ( HAND-EMPTY ) ( not ( = ?auto_12206 ?auto_12210 ) ) ( not ( = ?auto_12207 ?auto_12210 ) ) ( not ( = ?auto_12208 ?auto_12210 ) ) ( not ( = ?auto_12209 ?auto_12210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12206 ?auto_12210 )
      ( MAKE-3PILE ?auto_12206 ?auto_12207 ?auto_12208 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12211 - BLOCK
      ?auto_12212 - BLOCK
      ?auto_12213 - BLOCK
    )
    :vars
    (
      ?auto_12215 - BLOCK
      ?auto_12214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12211 ?auto_12212 ) ) ( not ( = ?auto_12211 ?auto_12213 ) ) ( not ( = ?auto_12212 ?auto_12213 ) ) ( ON ?auto_12213 ?auto_12215 ) ( not ( = ?auto_12211 ?auto_12215 ) ) ( not ( = ?auto_12212 ?auto_12215 ) ) ( not ( = ?auto_12213 ?auto_12215 ) ) ( ON-TABLE ?auto_12215 ) ( ON ?auto_12211 ?auto_12214 ) ( CLEAR ?auto_12211 ) ( not ( = ?auto_12211 ?auto_12214 ) ) ( not ( = ?auto_12212 ?auto_12214 ) ) ( not ( = ?auto_12213 ?auto_12214 ) ) ( not ( = ?auto_12215 ?auto_12214 ) ) ( HOLDING ?auto_12212 ) ( CLEAR ?auto_12213 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12215 ?auto_12213 ?auto_12212 )
      ( MAKE-3PILE ?auto_12211 ?auto_12212 ?auto_12213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12216 - BLOCK
      ?auto_12217 - BLOCK
      ?auto_12218 - BLOCK
    )
    :vars
    (
      ?auto_12220 - BLOCK
      ?auto_12219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12216 ?auto_12217 ) ) ( not ( = ?auto_12216 ?auto_12218 ) ) ( not ( = ?auto_12217 ?auto_12218 ) ) ( ON ?auto_12218 ?auto_12220 ) ( not ( = ?auto_12216 ?auto_12220 ) ) ( not ( = ?auto_12217 ?auto_12220 ) ) ( not ( = ?auto_12218 ?auto_12220 ) ) ( ON-TABLE ?auto_12220 ) ( ON ?auto_12216 ?auto_12219 ) ( not ( = ?auto_12216 ?auto_12219 ) ) ( not ( = ?auto_12217 ?auto_12219 ) ) ( not ( = ?auto_12218 ?auto_12219 ) ) ( not ( = ?auto_12220 ?auto_12219 ) ) ( CLEAR ?auto_12218 ) ( ON ?auto_12217 ?auto_12216 ) ( CLEAR ?auto_12217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12219 ?auto_12216 )
      ( MAKE-3PILE ?auto_12216 ?auto_12217 ?auto_12218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12221 - BLOCK
      ?auto_12222 - BLOCK
      ?auto_12223 - BLOCK
    )
    :vars
    (
      ?auto_12224 - BLOCK
      ?auto_12225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12221 ?auto_12222 ) ) ( not ( = ?auto_12221 ?auto_12223 ) ) ( not ( = ?auto_12222 ?auto_12223 ) ) ( not ( = ?auto_12221 ?auto_12224 ) ) ( not ( = ?auto_12222 ?auto_12224 ) ) ( not ( = ?auto_12223 ?auto_12224 ) ) ( ON-TABLE ?auto_12224 ) ( ON ?auto_12221 ?auto_12225 ) ( not ( = ?auto_12221 ?auto_12225 ) ) ( not ( = ?auto_12222 ?auto_12225 ) ) ( not ( = ?auto_12223 ?auto_12225 ) ) ( not ( = ?auto_12224 ?auto_12225 ) ) ( ON ?auto_12222 ?auto_12221 ) ( CLEAR ?auto_12222 ) ( ON-TABLE ?auto_12225 ) ( HOLDING ?auto_12223 ) ( CLEAR ?auto_12224 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12224 ?auto_12223 )
      ( MAKE-3PILE ?auto_12221 ?auto_12222 ?auto_12223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12226 - BLOCK
      ?auto_12227 - BLOCK
      ?auto_12228 - BLOCK
    )
    :vars
    (
      ?auto_12229 - BLOCK
      ?auto_12230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12226 ?auto_12227 ) ) ( not ( = ?auto_12226 ?auto_12228 ) ) ( not ( = ?auto_12227 ?auto_12228 ) ) ( not ( = ?auto_12226 ?auto_12229 ) ) ( not ( = ?auto_12227 ?auto_12229 ) ) ( not ( = ?auto_12228 ?auto_12229 ) ) ( ON-TABLE ?auto_12229 ) ( ON ?auto_12226 ?auto_12230 ) ( not ( = ?auto_12226 ?auto_12230 ) ) ( not ( = ?auto_12227 ?auto_12230 ) ) ( not ( = ?auto_12228 ?auto_12230 ) ) ( not ( = ?auto_12229 ?auto_12230 ) ) ( ON ?auto_12227 ?auto_12226 ) ( ON-TABLE ?auto_12230 ) ( CLEAR ?auto_12229 ) ( ON ?auto_12228 ?auto_12227 ) ( CLEAR ?auto_12228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12230 ?auto_12226 ?auto_12227 )
      ( MAKE-3PILE ?auto_12226 ?auto_12227 ?auto_12228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12231 - BLOCK
      ?auto_12232 - BLOCK
      ?auto_12233 - BLOCK
    )
    :vars
    (
      ?auto_12234 - BLOCK
      ?auto_12235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12231 ?auto_12232 ) ) ( not ( = ?auto_12231 ?auto_12233 ) ) ( not ( = ?auto_12232 ?auto_12233 ) ) ( not ( = ?auto_12231 ?auto_12234 ) ) ( not ( = ?auto_12232 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( ON ?auto_12231 ?auto_12235 ) ( not ( = ?auto_12231 ?auto_12235 ) ) ( not ( = ?auto_12232 ?auto_12235 ) ) ( not ( = ?auto_12233 ?auto_12235 ) ) ( not ( = ?auto_12234 ?auto_12235 ) ) ( ON ?auto_12232 ?auto_12231 ) ( ON-TABLE ?auto_12235 ) ( ON ?auto_12233 ?auto_12232 ) ( CLEAR ?auto_12233 ) ( HOLDING ?auto_12234 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12234 )
      ( MAKE-3PILE ?auto_12231 ?auto_12232 ?auto_12233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12236 - BLOCK
      ?auto_12237 - BLOCK
      ?auto_12238 - BLOCK
    )
    :vars
    (
      ?auto_12239 - BLOCK
      ?auto_12240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12236 ?auto_12237 ) ) ( not ( = ?auto_12236 ?auto_12238 ) ) ( not ( = ?auto_12237 ?auto_12238 ) ) ( not ( = ?auto_12236 ?auto_12239 ) ) ( not ( = ?auto_12237 ?auto_12239 ) ) ( not ( = ?auto_12238 ?auto_12239 ) ) ( ON ?auto_12236 ?auto_12240 ) ( not ( = ?auto_12236 ?auto_12240 ) ) ( not ( = ?auto_12237 ?auto_12240 ) ) ( not ( = ?auto_12238 ?auto_12240 ) ) ( not ( = ?auto_12239 ?auto_12240 ) ) ( ON ?auto_12237 ?auto_12236 ) ( ON-TABLE ?auto_12240 ) ( ON ?auto_12238 ?auto_12237 ) ( ON ?auto_12239 ?auto_12238 ) ( CLEAR ?auto_12239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12240 ?auto_12236 ?auto_12237 ?auto_12238 )
      ( MAKE-3PILE ?auto_12236 ?auto_12237 ?auto_12238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12249 - BLOCK
      ?auto_12250 - BLOCK
      ?auto_12251 - BLOCK
      ?auto_12252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12251 ) ( ON-TABLE ?auto_12249 ) ( ON ?auto_12250 ?auto_12249 ) ( ON ?auto_12251 ?auto_12250 ) ( not ( = ?auto_12249 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12251 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( ON-TABLE ?auto_12252 ) ( CLEAR ?auto_12252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_12252 )
      ( MAKE-4PILE ?auto_12249 ?auto_12250 ?auto_12251 ?auto_12252 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12253 - BLOCK
      ?auto_12254 - BLOCK
      ?auto_12255 - BLOCK
      ?auto_12256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12253 ) ( ON ?auto_12254 ?auto_12253 ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12255 ) ) ( not ( = ?auto_12253 ?auto_12256 ) ) ( not ( = ?auto_12254 ?auto_12255 ) ) ( not ( = ?auto_12254 ?auto_12256 ) ) ( not ( = ?auto_12255 ?auto_12256 ) ) ( ON-TABLE ?auto_12256 ) ( CLEAR ?auto_12256 ) ( HOLDING ?auto_12255 ) ( CLEAR ?auto_12254 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12253 ?auto_12254 ?auto_12255 )
      ( MAKE-4PILE ?auto_12253 ?auto_12254 ?auto_12255 ?auto_12256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12257 - BLOCK
      ?auto_12258 - BLOCK
      ?auto_12259 - BLOCK
      ?auto_12260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12257 ) ( ON ?auto_12258 ?auto_12257 ) ( not ( = ?auto_12257 ?auto_12258 ) ) ( not ( = ?auto_12257 ?auto_12259 ) ) ( not ( = ?auto_12257 ?auto_12260 ) ) ( not ( = ?auto_12258 ?auto_12259 ) ) ( not ( = ?auto_12258 ?auto_12260 ) ) ( not ( = ?auto_12259 ?auto_12260 ) ) ( ON-TABLE ?auto_12260 ) ( CLEAR ?auto_12258 ) ( ON ?auto_12259 ?auto_12260 ) ( CLEAR ?auto_12259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12260 )
      ( MAKE-4PILE ?auto_12257 ?auto_12258 ?auto_12259 ?auto_12260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12261 - BLOCK
      ?auto_12262 - BLOCK
      ?auto_12263 - BLOCK
      ?auto_12264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12261 ) ( not ( = ?auto_12261 ?auto_12262 ) ) ( not ( = ?auto_12261 ?auto_12263 ) ) ( not ( = ?auto_12261 ?auto_12264 ) ) ( not ( = ?auto_12262 ?auto_12263 ) ) ( not ( = ?auto_12262 ?auto_12264 ) ) ( not ( = ?auto_12263 ?auto_12264 ) ) ( ON-TABLE ?auto_12264 ) ( ON ?auto_12263 ?auto_12264 ) ( CLEAR ?auto_12263 ) ( HOLDING ?auto_12262 ) ( CLEAR ?auto_12261 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12261 ?auto_12262 )
      ( MAKE-4PILE ?auto_12261 ?auto_12262 ?auto_12263 ?auto_12264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12265 - BLOCK
      ?auto_12266 - BLOCK
      ?auto_12267 - BLOCK
      ?auto_12268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12265 ) ( not ( = ?auto_12265 ?auto_12266 ) ) ( not ( = ?auto_12265 ?auto_12267 ) ) ( not ( = ?auto_12265 ?auto_12268 ) ) ( not ( = ?auto_12266 ?auto_12267 ) ) ( not ( = ?auto_12266 ?auto_12268 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( ON-TABLE ?auto_12268 ) ( ON ?auto_12267 ?auto_12268 ) ( CLEAR ?auto_12265 ) ( ON ?auto_12266 ?auto_12267 ) ( CLEAR ?auto_12266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12268 ?auto_12267 )
      ( MAKE-4PILE ?auto_12265 ?auto_12266 ?auto_12267 ?auto_12268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12269 - BLOCK
      ?auto_12270 - BLOCK
      ?auto_12271 - BLOCK
      ?auto_12272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12269 ?auto_12270 ) ) ( not ( = ?auto_12269 ?auto_12271 ) ) ( not ( = ?auto_12269 ?auto_12272 ) ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( not ( = ?auto_12270 ?auto_12272 ) ) ( not ( = ?auto_12271 ?auto_12272 ) ) ( ON-TABLE ?auto_12272 ) ( ON ?auto_12271 ?auto_12272 ) ( ON ?auto_12270 ?auto_12271 ) ( CLEAR ?auto_12270 ) ( HOLDING ?auto_12269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12269 )
      ( MAKE-4PILE ?auto_12269 ?auto_12270 ?auto_12271 ?auto_12272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12273 - BLOCK
      ?auto_12274 - BLOCK
      ?auto_12275 - BLOCK
      ?auto_12276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12273 ?auto_12274 ) ) ( not ( = ?auto_12273 ?auto_12275 ) ) ( not ( = ?auto_12273 ?auto_12276 ) ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12274 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( ON-TABLE ?auto_12276 ) ( ON ?auto_12275 ?auto_12276 ) ( ON ?auto_12274 ?auto_12275 ) ( ON ?auto_12273 ?auto_12274 ) ( CLEAR ?auto_12273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12276 ?auto_12275 ?auto_12274 )
      ( MAKE-4PILE ?auto_12273 ?auto_12274 ?auto_12275 ?auto_12276 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12281 - BLOCK
      ?auto_12282 - BLOCK
      ?auto_12283 - BLOCK
      ?auto_12284 - BLOCK
    )
    :vars
    (
      ?auto_12285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12281 ?auto_12282 ) ) ( not ( = ?auto_12281 ?auto_12283 ) ) ( not ( = ?auto_12281 ?auto_12284 ) ) ( not ( = ?auto_12282 ?auto_12283 ) ) ( not ( = ?auto_12282 ?auto_12284 ) ) ( not ( = ?auto_12283 ?auto_12284 ) ) ( ON-TABLE ?auto_12284 ) ( ON ?auto_12283 ?auto_12284 ) ( ON ?auto_12282 ?auto_12283 ) ( CLEAR ?auto_12282 ) ( ON ?auto_12281 ?auto_12285 ) ( CLEAR ?auto_12281 ) ( HAND-EMPTY ) ( not ( = ?auto_12281 ?auto_12285 ) ) ( not ( = ?auto_12282 ?auto_12285 ) ) ( not ( = ?auto_12283 ?auto_12285 ) ) ( not ( = ?auto_12284 ?auto_12285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12281 ?auto_12285 )
      ( MAKE-4PILE ?auto_12281 ?auto_12282 ?auto_12283 ?auto_12284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12286 - BLOCK
      ?auto_12287 - BLOCK
      ?auto_12288 - BLOCK
      ?auto_12289 - BLOCK
    )
    :vars
    (
      ?auto_12290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12286 ?auto_12287 ) ) ( not ( = ?auto_12286 ?auto_12288 ) ) ( not ( = ?auto_12286 ?auto_12289 ) ) ( not ( = ?auto_12287 ?auto_12288 ) ) ( not ( = ?auto_12287 ?auto_12289 ) ) ( not ( = ?auto_12288 ?auto_12289 ) ) ( ON-TABLE ?auto_12289 ) ( ON ?auto_12288 ?auto_12289 ) ( ON ?auto_12286 ?auto_12290 ) ( CLEAR ?auto_12286 ) ( not ( = ?auto_12286 ?auto_12290 ) ) ( not ( = ?auto_12287 ?auto_12290 ) ) ( not ( = ?auto_12288 ?auto_12290 ) ) ( not ( = ?auto_12289 ?auto_12290 ) ) ( HOLDING ?auto_12287 ) ( CLEAR ?auto_12288 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12289 ?auto_12288 ?auto_12287 )
      ( MAKE-4PILE ?auto_12286 ?auto_12287 ?auto_12288 ?auto_12289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12291 - BLOCK
      ?auto_12292 - BLOCK
      ?auto_12293 - BLOCK
      ?auto_12294 - BLOCK
    )
    :vars
    (
      ?auto_12295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12291 ?auto_12292 ) ) ( not ( = ?auto_12291 ?auto_12293 ) ) ( not ( = ?auto_12291 ?auto_12294 ) ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( not ( = ?auto_12292 ?auto_12294 ) ) ( not ( = ?auto_12293 ?auto_12294 ) ) ( ON-TABLE ?auto_12294 ) ( ON ?auto_12293 ?auto_12294 ) ( ON ?auto_12291 ?auto_12295 ) ( not ( = ?auto_12291 ?auto_12295 ) ) ( not ( = ?auto_12292 ?auto_12295 ) ) ( not ( = ?auto_12293 ?auto_12295 ) ) ( not ( = ?auto_12294 ?auto_12295 ) ) ( CLEAR ?auto_12293 ) ( ON ?auto_12292 ?auto_12291 ) ( CLEAR ?auto_12292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12295 ?auto_12291 )
      ( MAKE-4PILE ?auto_12291 ?auto_12292 ?auto_12293 ?auto_12294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12296 - BLOCK
      ?auto_12297 - BLOCK
      ?auto_12298 - BLOCK
      ?auto_12299 - BLOCK
    )
    :vars
    (
      ?auto_12300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12296 ?auto_12297 ) ) ( not ( = ?auto_12296 ?auto_12298 ) ) ( not ( = ?auto_12296 ?auto_12299 ) ) ( not ( = ?auto_12297 ?auto_12298 ) ) ( not ( = ?auto_12297 ?auto_12299 ) ) ( not ( = ?auto_12298 ?auto_12299 ) ) ( ON-TABLE ?auto_12299 ) ( ON ?auto_12296 ?auto_12300 ) ( not ( = ?auto_12296 ?auto_12300 ) ) ( not ( = ?auto_12297 ?auto_12300 ) ) ( not ( = ?auto_12298 ?auto_12300 ) ) ( not ( = ?auto_12299 ?auto_12300 ) ) ( ON ?auto_12297 ?auto_12296 ) ( CLEAR ?auto_12297 ) ( ON-TABLE ?auto_12300 ) ( HOLDING ?auto_12298 ) ( CLEAR ?auto_12299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12299 ?auto_12298 )
      ( MAKE-4PILE ?auto_12296 ?auto_12297 ?auto_12298 ?auto_12299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12301 - BLOCK
      ?auto_12302 - BLOCK
      ?auto_12303 - BLOCK
      ?auto_12304 - BLOCK
    )
    :vars
    (
      ?auto_12305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12301 ?auto_12302 ) ) ( not ( = ?auto_12301 ?auto_12303 ) ) ( not ( = ?auto_12301 ?auto_12304 ) ) ( not ( = ?auto_12302 ?auto_12303 ) ) ( not ( = ?auto_12302 ?auto_12304 ) ) ( not ( = ?auto_12303 ?auto_12304 ) ) ( ON-TABLE ?auto_12304 ) ( ON ?auto_12301 ?auto_12305 ) ( not ( = ?auto_12301 ?auto_12305 ) ) ( not ( = ?auto_12302 ?auto_12305 ) ) ( not ( = ?auto_12303 ?auto_12305 ) ) ( not ( = ?auto_12304 ?auto_12305 ) ) ( ON ?auto_12302 ?auto_12301 ) ( ON-TABLE ?auto_12305 ) ( CLEAR ?auto_12304 ) ( ON ?auto_12303 ?auto_12302 ) ( CLEAR ?auto_12303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12305 ?auto_12301 ?auto_12302 )
      ( MAKE-4PILE ?auto_12301 ?auto_12302 ?auto_12303 ?auto_12304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12306 - BLOCK
      ?auto_12307 - BLOCK
      ?auto_12308 - BLOCK
      ?auto_12309 - BLOCK
    )
    :vars
    (
      ?auto_12310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12306 ?auto_12307 ) ) ( not ( = ?auto_12306 ?auto_12308 ) ) ( not ( = ?auto_12306 ?auto_12309 ) ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( not ( = ?auto_12307 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( ON ?auto_12306 ?auto_12310 ) ( not ( = ?auto_12306 ?auto_12310 ) ) ( not ( = ?auto_12307 ?auto_12310 ) ) ( not ( = ?auto_12308 ?auto_12310 ) ) ( not ( = ?auto_12309 ?auto_12310 ) ) ( ON ?auto_12307 ?auto_12306 ) ( ON-TABLE ?auto_12310 ) ( ON ?auto_12308 ?auto_12307 ) ( CLEAR ?auto_12308 ) ( HOLDING ?auto_12309 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12309 )
      ( MAKE-4PILE ?auto_12306 ?auto_12307 ?auto_12308 ?auto_12309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12311 - BLOCK
      ?auto_12312 - BLOCK
      ?auto_12313 - BLOCK
      ?auto_12314 - BLOCK
    )
    :vars
    (
      ?auto_12315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12311 ?auto_12312 ) ) ( not ( = ?auto_12311 ?auto_12313 ) ) ( not ( = ?auto_12311 ?auto_12314 ) ) ( not ( = ?auto_12312 ?auto_12313 ) ) ( not ( = ?auto_12312 ?auto_12314 ) ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( ON ?auto_12311 ?auto_12315 ) ( not ( = ?auto_12311 ?auto_12315 ) ) ( not ( = ?auto_12312 ?auto_12315 ) ) ( not ( = ?auto_12313 ?auto_12315 ) ) ( not ( = ?auto_12314 ?auto_12315 ) ) ( ON ?auto_12312 ?auto_12311 ) ( ON-TABLE ?auto_12315 ) ( ON ?auto_12313 ?auto_12312 ) ( ON ?auto_12314 ?auto_12313 ) ( CLEAR ?auto_12314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12315 ?auto_12311 ?auto_12312 ?auto_12313 )
      ( MAKE-4PILE ?auto_12311 ?auto_12312 ?auto_12313 ?auto_12314 ) )
  )

)

