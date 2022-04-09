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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10868 - SURFACE
      ?auto_10869 - SURFACE
    )
    :vars
    (
      ?auto_10870 - HOIST
      ?auto_10871 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10870 ?auto_10871 ) ( SURFACE-AT ?auto_10868 ?auto_10871 ) ( CLEAR ?auto_10868 ) ( LIFTING ?auto_10870 ?auto_10869 ) ( IS-CRATE ?auto_10869 ) ( not ( = ?auto_10868 ?auto_10869 ) ) )
    :subtasks
    ( ( !DROP ?auto_10870 ?auto_10869 ?auto_10868 ?auto_10871 )
      ( MAKE-1CRATE-VERIFY ?auto_10868 ?auto_10869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10872 - SURFACE
      ?auto_10873 - SURFACE
    )
    :vars
    (
      ?auto_10875 - HOIST
      ?auto_10874 - PLACE
      ?auto_10876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10875 ?auto_10874 ) ( SURFACE-AT ?auto_10872 ?auto_10874 ) ( CLEAR ?auto_10872 ) ( IS-CRATE ?auto_10873 ) ( not ( = ?auto_10872 ?auto_10873 ) ) ( TRUCK-AT ?auto_10876 ?auto_10874 ) ( AVAILABLE ?auto_10875 ) ( IN ?auto_10873 ?auto_10876 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10875 ?auto_10873 ?auto_10876 ?auto_10874 )
      ( MAKE-1CRATE ?auto_10872 ?auto_10873 )
      ( MAKE-1CRATE-VERIFY ?auto_10872 ?auto_10873 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10877 - SURFACE
      ?auto_10878 - SURFACE
    )
    :vars
    (
      ?auto_10879 - HOIST
      ?auto_10880 - PLACE
      ?auto_10881 - TRUCK
      ?auto_10882 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10879 ?auto_10880 ) ( SURFACE-AT ?auto_10877 ?auto_10880 ) ( CLEAR ?auto_10877 ) ( IS-CRATE ?auto_10878 ) ( not ( = ?auto_10877 ?auto_10878 ) ) ( AVAILABLE ?auto_10879 ) ( IN ?auto_10878 ?auto_10881 ) ( TRUCK-AT ?auto_10881 ?auto_10882 ) ( not ( = ?auto_10882 ?auto_10880 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10881 ?auto_10882 ?auto_10880 )
      ( MAKE-1CRATE ?auto_10877 ?auto_10878 )
      ( MAKE-1CRATE-VERIFY ?auto_10877 ?auto_10878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10883 - SURFACE
      ?auto_10884 - SURFACE
    )
    :vars
    (
      ?auto_10886 - HOIST
      ?auto_10887 - PLACE
      ?auto_10885 - TRUCK
      ?auto_10888 - PLACE
      ?auto_10889 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10886 ?auto_10887 ) ( SURFACE-AT ?auto_10883 ?auto_10887 ) ( CLEAR ?auto_10883 ) ( IS-CRATE ?auto_10884 ) ( not ( = ?auto_10883 ?auto_10884 ) ) ( AVAILABLE ?auto_10886 ) ( TRUCK-AT ?auto_10885 ?auto_10888 ) ( not ( = ?auto_10888 ?auto_10887 ) ) ( HOIST-AT ?auto_10889 ?auto_10888 ) ( LIFTING ?auto_10889 ?auto_10884 ) ( not ( = ?auto_10886 ?auto_10889 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10889 ?auto_10884 ?auto_10885 ?auto_10888 )
      ( MAKE-1CRATE ?auto_10883 ?auto_10884 )
      ( MAKE-1CRATE-VERIFY ?auto_10883 ?auto_10884 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10890 - SURFACE
      ?auto_10891 - SURFACE
    )
    :vars
    (
      ?auto_10895 - HOIST
      ?auto_10894 - PLACE
      ?auto_10896 - TRUCK
      ?auto_10892 - PLACE
      ?auto_10893 - HOIST
      ?auto_10897 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10895 ?auto_10894 ) ( SURFACE-AT ?auto_10890 ?auto_10894 ) ( CLEAR ?auto_10890 ) ( IS-CRATE ?auto_10891 ) ( not ( = ?auto_10890 ?auto_10891 ) ) ( AVAILABLE ?auto_10895 ) ( TRUCK-AT ?auto_10896 ?auto_10892 ) ( not ( = ?auto_10892 ?auto_10894 ) ) ( HOIST-AT ?auto_10893 ?auto_10892 ) ( not ( = ?auto_10895 ?auto_10893 ) ) ( AVAILABLE ?auto_10893 ) ( SURFACE-AT ?auto_10891 ?auto_10892 ) ( ON ?auto_10891 ?auto_10897 ) ( CLEAR ?auto_10891 ) ( not ( = ?auto_10890 ?auto_10897 ) ) ( not ( = ?auto_10891 ?auto_10897 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10893 ?auto_10891 ?auto_10897 ?auto_10892 )
      ( MAKE-1CRATE ?auto_10890 ?auto_10891 )
      ( MAKE-1CRATE-VERIFY ?auto_10890 ?auto_10891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10898 - SURFACE
      ?auto_10899 - SURFACE
    )
    :vars
    (
      ?auto_10904 - HOIST
      ?auto_10901 - PLACE
      ?auto_10900 - PLACE
      ?auto_10905 - HOIST
      ?auto_10902 - SURFACE
      ?auto_10903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10904 ?auto_10901 ) ( SURFACE-AT ?auto_10898 ?auto_10901 ) ( CLEAR ?auto_10898 ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( AVAILABLE ?auto_10904 ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( HOIST-AT ?auto_10905 ?auto_10900 ) ( not ( = ?auto_10904 ?auto_10905 ) ) ( AVAILABLE ?auto_10905 ) ( SURFACE-AT ?auto_10899 ?auto_10900 ) ( ON ?auto_10899 ?auto_10902 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10902 ) ) ( not ( = ?auto_10899 ?auto_10902 ) ) ( TRUCK-AT ?auto_10903 ?auto_10901 ) )
    :subtasks
    ( ( !DRIVE ?auto_10903 ?auto_10901 ?auto_10900 )
      ( MAKE-1CRATE ?auto_10898 ?auto_10899 )
      ( MAKE-1CRATE-VERIFY ?auto_10898 ?auto_10899 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10915 - SURFACE
      ?auto_10916 - SURFACE
      ?auto_10917 - SURFACE
    )
    :vars
    (
      ?auto_10919 - HOIST
      ?auto_10918 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10919 ?auto_10918 ) ( SURFACE-AT ?auto_10916 ?auto_10918 ) ( CLEAR ?auto_10916 ) ( LIFTING ?auto_10919 ?auto_10917 ) ( IS-CRATE ?auto_10917 ) ( not ( = ?auto_10916 ?auto_10917 ) ) ( ON ?auto_10916 ?auto_10915 ) ( not ( = ?auto_10915 ?auto_10916 ) ) ( not ( = ?auto_10915 ?auto_10917 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10916 ?auto_10917 )
      ( MAKE-2CRATE-VERIFY ?auto_10915 ?auto_10916 ?auto_10917 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10925 - SURFACE
      ?auto_10926 - SURFACE
      ?auto_10927 - SURFACE
    )
    :vars
    (
      ?auto_10928 - HOIST
      ?auto_10929 - PLACE
      ?auto_10930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10928 ?auto_10929 ) ( SURFACE-AT ?auto_10926 ?auto_10929 ) ( CLEAR ?auto_10926 ) ( IS-CRATE ?auto_10927 ) ( not ( = ?auto_10926 ?auto_10927 ) ) ( TRUCK-AT ?auto_10930 ?auto_10929 ) ( AVAILABLE ?auto_10928 ) ( IN ?auto_10927 ?auto_10930 ) ( ON ?auto_10926 ?auto_10925 ) ( not ( = ?auto_10925 ?auto_10926 ) ) ( not ( = ?auto_10925 ?auto_10927 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10926 ?auto_10927 )
      ( MAKE-2CRATE-VERIFY ?auto_10925 ?auto_10926 ?auto_10927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10931 - SURFACE
      ?auto_10932 - SURFACE
    )
    :vars
    (
      ?auto_10936 - HOIST
      ?auto_10935 - PLACE
      ?auto_10934 - TRUCK
      ?auto_10933 - SURFACE
      ?auto_10937 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10936 ?auto_10935 ) ( SURFACE-AT ?auto_10931 ?auto_10935 ) ( CLEAR ?auto_10931 ) ( IS-CRATE ?auto_10932 ) ( not ( = ?auto_10931 ?auto_10932 ) ) ( AVAILABLE ?auto_10936 ) ( IN ?auto_10932 ?auto_10934 ) ( ON ?auto_10931 ?auto_10933 ) ( not ( = ?auto_10933 ?auto_10931 ) ) ( not ( = ?auto_10933 ?auto_10932 ) ) ( TRUCK-AT ?auto_10934 ?auto_10937 ) ( not ( = ?auto_10937 ?auto_10935 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10934 ?auto_10937 ?auto_10935 )
      ( MAKE-2CRATE ?auto_10933 ?auto_10931 ?auto_10932 )
      ( MAKE-1CRATE-VERIFY ?auto_10931 ?auto_10932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10938 - SURFACE
      ?auto_10939 - SURFACE
      ?auto_10940 - SURFACE
    )
    :vars
    (
      ?auto_10941 - HOIST
      ?auto_10942 - PLACE
      ?auto_10944 - TRUCK
      ?auto_10943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10941 ?auto_10942 ) ( SURFACE-AT ?auto_10939 ?auto_10942 ) ( CLEAR ?auto_10939 ) ( IS-CRATE ?auto_10940 ) ( not ( = ?auto_10939 ?auto_10940 ) ) ( AVAILABLE ?auto_10941 ) ( IN ?auto_10940 ?auto_10944 ) ( ON ?auto_10939 ?auto_10938 ) ( not ( = ?auto_10938 ?auto_10939 ) ) ( not ( = ?auto_10938 ?auto_10940 ) ) ( TRUCK-AT ?auto_10944 ?auto_10943 ) ( not ( = ?auto_10943 ?auto_10942 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10939 ?auto_10940 )
      ( MAKE-2CRATE-VERIFY ?auto_10938 ?auto_10939 ?auto_10940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10945 - SURFACE
      ?auto_10946 - SURFACE
    )
    :vars
    (
      ?auto_10951 - HOIST
      ?auto_10948 - PLACE
      ?auto_10949 - SURFACE
      ?auto_10947 - TRUCK
      ?auto_10950 - PLACE
      ?auto_10952 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10951 ?auto_10948 ) ( SURFACE-AT ?auto_10945 ?auto_10948 ) ( CLEAR ?auto_10945 ) ( IS-CRATE ?auto_10946 ) ( not ( = ?auto_10945 ?auto_10946 ) ) ( AVAILABLE ?auto_10951 ) ( ON ?auto_10945 ?auto_10949 ) ( not ( = ?auto_10949 ?auto_10945 ) ) ( not ( = ?auto_10949 ?auto_10946 ) ) ( TRUCK-AT ?auto_10947 ?auto_10950 ) ( not ( = ?auto_10950 ?auto_10948 ) ) ( HOIST-AT ?auto_10952 ?auto_10950 ) ( LIFTING ?auto_10952 ?auto_10946 ) ( not ( = ?auto_10951 ?auto_10952 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10952 ?auto_10946 ?auto_10947 ?auto_10950 )
      ( MAKE-2CRATE ?auto_10949 ?auto_10945 ?auto_10946 )
      ( MAKE-1CRATE-VERIFY ?auto_10945 ?auto_10946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10953 - SURFACE
      ?auto_10954 - SURFACE
      ?auto_10955 - SURFACE
    )
    :vars
    (
      ?auto_10956 - HOIST
      ?auto_10958 - PLACE
      ?auto_10957 - TRUCK
      ?auto_10959 - PLACE
      ?auto_10960 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10956 ?auto_10958 ) ( SURFACE-AT ?auto_10954 ?auto_10958 ) ( CLEAR ?auto_10954 ) ( IS-CRATE ?auto_10955 ) ( not ( = ?auto_10954 ?auto_10955 ) ) ( AVAILABLE ?auto_10956 ) ( ON ?auto_10954 ?auto_10953 ) ( not ( = ?auto_10953 ?auto_10954 ) ) ( not ( = ?auto_10953 ?auto_10955 ) ) ( TRUCK-AT ?auto_10957 ?auto_10959 ) ( not ( = ?auto_10959 ?auto_10958 ) ) ( HOIST-AT ?auto_10960 ?auto_10959 ) ( LIFTING ?auto_10960 ?auto_10955 ) ( not ( = ?auto_10956 ?auto_10960 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10954 ?auto_10955 )
      ( MAKE-2CRATE-VERIFY ?auto_10953 ?auto_10954 ?auto_10955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10961 - SURFACE
      ?auto_10962 - SURFACE
    )
    :vars
    (
      ?auto_10968 - HOIST
      ?auto_10966 - PLACE
      ?auto_10965 - SURFACE
      ?auto_10967 - TRUCK
      ?auto_10964 - PLACE
      ?auto_10963 - HOIST
      ?auto_10969 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10968 ?auto_10966 ) ( SURFACE-AT ?auto_10961 ?auto_10966 ) ( CLEAR ?auto_10961 ) ( IS-CRATE ?auto_10962 ) ( not ( = ?auto_10961 ?auto_10962 ) ) ( AVAILABLE ?auto_10968 ) ( ON ?auto_10961 ?auto_10965 ) ( not ( = ?auto_10965 ?auto_10961 ) ) ( not ( = ?auto_10965 ?auto_10962 ) ) ( TRUCK-AT ?auto_10967 ?auto_10964 ) ( not ( = ?auto_10964 ?auto_10966 ) ) ( HOIST-AT ?auto_10963 ?auto_10964 ) ( not ( = ?auto_10968 ?auto_10963 ) ) ( AVAILABLE ?auto_10963 ) ( SURFACE-AT ?auto_10962 ?auto_10964 ) ( ON ?auto_10962 ?auto_10969 ) ( CLEAR ?auto_10962 ) ( not ( = ?auto_10961 ?auto_10969 ) ) ( not ( = ?auto_10962 ?auto_10969 ) ) ( not ( = ?auto_10965 ?auto_10969 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10963 ?auto_10962 ?auto_10969 ?auto_10964 )
      ( MAKE-2CRATE ?auto_10965 ?auto_10961 ?auto_10962 )
      ( MAKE-1CRATE-VERIFY ?auto_10961 ?auto_10962 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10970 - SURFACE
      ?auto_10971 - SURFACE
      ?auto_10972 - SURFACE
    )
    :vars
    (
      ?auto_10977 - HOIST
      ?auto_10975 - PLACE
      ?auto_10978 - TRUCK
      ?auto_10973 - PLACE
      ?auto_10974 - HOIST
      ?auto_10976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10977 ?auto_10975 ) ( SURFACE-AT ?auto_10971 ?auto_10975 ) ( CLEAR ?auto_10971 ) ( IS-CRATE ?auto_10972 ) ( not ( = ?auto_10971 ?auto_10972 ) ) ( AVAILABLE ?auto_10977 ) ( ON ?auto_10971 ?auto_10970 ) ( not ( = ?auto_10970 ?auto_10971 ) ) ( not ( = ?auto_10970 ?auto_10972 ) ) ( TRUCK-AT ?auto_10978 ?auto_10973 ) ( not ( = ?auto_10973 ?auto_10975 ) ) ( HOIST-AT ?auto_10974 ?auto_10973 ) ( not ( = ?auto_10977 ?auto_10974 ) ) ( AVAILABLE ?auto_10974 ) ( SURFACE-AT ?auto_10972 ?auto_10973 ) ( ON ?auto_10972 ?auto_10976 ) ( CLEAR ?auto_10972 ) ( not ( = ?auto_10971 ?auto_10976 ) ) ( not ( = ?auto_10972 ?auto_10976 ) ) ( not ( = ?auto_10970 ?auto_10976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10971 ?auto_10972 )
      ( MAKE-2CRATE-VERIFY ?auto_10970 ?auto_10971 ?auto_10972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10979 - SURFACE
      ?auto_10980 - SURFACE
    )
    :vars
    (
      ?auto_10986 - HOIST
      ?auto_10984 - PLACE
      ?auto_10987 - SURFACE
      ?auto_10981 - PLACE
      ?auto_10983 - HOIST
      ?auto_10982 - SURFACE
      ?auto_10985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10986 ?auto_10984 ) ( SURFACE-AT ?auto_10979 ?auto_10984 ) ( CLEAR ?auto_10979 ) ( IS-CRATE ?auto_10980 ) ( not ( = ?auto_10979 ?auto_10980 ) ) ( AVAILABLE ?auto_10986 ) ( ON ?auto_10979 ?auto_10987 ) ( not ( = ?auto_10987 ?auto_10979 ) ) ( not ( = ?auto_10987 ?auto_10980 ) ) ( not ( = ?auto_10981 ?auto_10984 ) ) ( HOIST-AT ?auto_10983 ?auto_10981 ) ( not ( = ?auto_10986 ?auto_10983 ) ) ( AVAILABLE ?auto_10983 ) ( SURFACE-AT ?auto_10980 ?auto_10981 ) ( ON ?auto_10980 ?auto_10982 ) ( CLEAR ?auto_10980 ) ( not ( = ?auto_10979 ?auto_10982 ) ) ( not ( = ?auto_10980 ?auto_10982 ) ) ( not ( = ?auto_10987 ?auto_10982 ) ) ( TRUCK-AT ?auto_10985 ?auto_10984 ) )
    :subtasks
    ( ( !DRIVE ?auto_10985 ?auto_10984 ?auto_10981 )
      ( MAKE-2CRATE ?auto_10987 ?auto_10979 ?auto_10980 )
      ( MAKE-1CRATE-VERIFY ?auto_10979 ?auto_10980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10988 - SURFACE
      ?auto_10989 - SURFACE
      ?auto_10990 - SURFACE
    )
    :vars
    (
      ?auto_10994 - HOIST
      ?auto_10992 - PLACE
      ?auto_10995 - PLACE
      ?auto_10993 - HOIST
      ?auto_10991 - SURFACE
      ?auto_10996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10994 ?auto_10992 ) ( SURFACE-AT ?auto_10989 ?auto_10992 ) ( CLEAR ?auto_10989 ) ( IS-CRATE ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( AVAILABLE ?auto_10994 ) ( ON ?auto_10989 ?auto_10988 ) ( not ( = ?auto_10988 ?auto_10989 ) ) ( not ( = ?auto_10988 ?auto_10990 ) ) ( not ( = ?auto_10995 ?auto_10992 ) ) ( HOIST-AT ?auto_10993 ?auto_10995 ) ( not ( = ?auto_10994 ?auto_10993 ) ) ( AVAILABLE ?auto_10993 ) ( SURFACE-AT ?auto_10990 ?auto_10995 ) ( ON ?auto_10990 ?auto_10991 ) ( CLEAR ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( TRUCK-AT ?auto_10996 ?auto_10992 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10989 ?auto_10990 )
      ( MAKE-2CRATE-VERIFY ?auto_10988 ?auto_10989 ?auto_10990 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10997 - SURFACE
      ?auto_10998 - SURFACE
    )
    :vars
    (
      ?auto_11001 - HOIST
      ?auto_11002 - PLACE
      ?auto_11003 - SURFACE
      ?auto_11005 - PLACE
      ?auto_10999 - HOIST
      ?auto_11000 - SURFACE
      ?auto_11004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11001 ?auto_11002 ) ( IS-CRATE ?auto_10998 ) ( not ( = ?auto_10997 ?auto_10998 ) ) ( not ( = ?auto_11003 ?auto_10997 ) ) ( not ( = ?auto_11003 ?auto_10998 ) ) ( not ( = ?auto_11005 ?auto_11002 ) ) ( HOIST-AT ?auto_10999 ?auto_11005 ) ( not ( = ?auto_11001 ?auto_10999 ) ) ( AVAILABLE ?auto_10999 ) ( SURFACE-AT ?auto_10998 ?auto_11005 ) ( ON ?auto_10998 ?auto_11000 ) ( CLEAR ?auto_10998 ) ( not ( = ?auto_10997 ?auto_11000 ) ) ( not ( = ?auto_10998 ?auto_11000 ) ) ( not ( = ?auto_11003 ?auto_11000 ) ) ( TRUCK-AT ?auto_11004 ?auto_11002 ) ( SURFACE-AT ?auto_11003 ?auto_11002 ) ( CLEAR ?auto_11003 ) ( LIFTING ?auto_11001 ?auto_10997 ) ( IS-CRATE ?auto_10997 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11003 ?auto_10997 )
      ( MAKE-2CRATE ?auto_11003 ?auto_10997 ?auto_10998 )
      ( MAKE-1CRATE-VERIFY ?auto_10997 ?auto_10998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11006 - SURFACE
      ?auto_11007 - SURFACE
      ?auto_11008 - SURFACE
    )
    :vars
    (
      ?auto_11013 - HOIST
      ?auto_11012 - PLACE
      ?auto_11010 - PLACE
      ?auto_11014 - HOIST
      ?auto_11011 - SURFACE
      ?auto_11009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11013 ?auto_11012 ) ( IS-CRATE ?auto_11008 ) ( not ( = ?auto_11007 ?auto_11008 ) ) ( not ( = ?auto_11006 ?auto_11007 ) ) ( not ( = ?auto_11006 ?auto_11008 ) ) ( not ( = ?auto_11010 ?auto_11012 ) ) ( HOIST-AT ?auto_11014 ?auto_11010 ) ( not ( = ?auto_11013 ?auto_11014 ) ) ( AVAILABLE ?auto_11014 ) ( SURFACE-AT ?auto_11008 ?auto_11010 ) ( ON ?auto_11008 ?auto_11011 ) ( CLEAR ?auto_11008 ) ( not ( = ?auto_11007 ?auto_11011 ) ) ( not ( = ?auto_11008 ?auto_11011 ) ) ( not ( = ?auto_11006 ?auto_11011 ) ) ( TRUCK-AT ?auto_11009 ?auto_11012 ) ( SURFACE-AT ?auto_11006 ?auto_11012 ) ( CLEAR ?auto_11006 ) ( LIFTING ?auto_11013 ?auto_11007 ) ( IS-CRATE ?auto_11007 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11007 ?auto_11008 )
      ( MAKE-2CRATE-VERIFY ?auto_11006 ?auto_11007 ?auto_11008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11015 - SURFACE
      ?auto_11016 - SURFACE
    )
    :vars
    (
      ?auto_11021 - HOIST
      ?auto_11018 - PLACE
      ?auto_11020 - SURFACE
      ?auto_11017 - PLACE
      ?auto_11019 - HOIST
      ?auto_11022 - SURFACE
      ?auto_11023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11021 ?auto_11018 ) ( IS-CRATE ?auto_11016 ) ( not ( = ?auto_11015 ?auto_11016 ) ) ( not ( = ?auto_11020 ?auto_11015 ) ) ( not ( = ?auto_11020 ?auto_11016 ) ) ( not ( = ?auto_11017 ?auto_11018 ) ) ( HOIST-AT ?auto_11019 ?auto_11017 ) ( not ( = ?auto_11021 ?auto_11019 ) ) ( AVAILABLE ?auto_11019 ) ( SURFACE-AT ?auto_11016 ?auto_11017 ) ( ON ?auto_11016 ?auto_11022 ) ( CLEAR ?auto_11016 ) ( not ( = ?auto_11015 ?auto_11022 ) ) ( not ( = ?auto_11016 ?auto_11022 ) ) ( not ( = ?auto_11020 ?auto_11022 ) ) ( TRUCK-AT ?auto_11023 ?auto_11018 ) ( SURFACE-AT ?auto_11020 ?auto_11018 ) ( CLEAR ?auto_11020 ) ( IS-CRATE ?auto_11015 ) ( AVAILABLE ?auto_11021 ) ( IN ?auto_11015 ?auto_11023 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11021 ?auto_11015 ?auto_11023 ?auto_11018 )
      ( MAKE-2CRATE ?auto_11020 ?auto_11015 ?auto_11016 )
      ( MAKE-1CRATE-VERIFY ?auto_11015 ?auto_11016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11024 - SURFACE
      ?auto_11025 - SURFACE
      ?auto_11026 - SURFACE
    )
    :vars
    (
      ?auto_11027 - HOIST
      ?auto_11030 - PLACE
      ?auto_11031 - PLACE
      ?auto_11032 - HOIST
      ?auto_11029 - SURFACE
      ?auto_11028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11027 ?auto_11030 ) ( IS-CRATE ?auto_11026 ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11024 ?auto_11025 ) ) ( not ( = ?auto_11024 ?auto_11026 ) ) ( not ( = ?auto_11031 ?auto_11030 ) ) ( HOIST-AT ?auto_11032 ?auto_11031 ) ( not ( = ?auto_11027 ?auto_11032 ) ) ( AVAILABLE ?auto_11032 ) ( SURFACE-AT ?auto_11026 ?auto_11031 ) ( ON ?auto_11026 ?auto_11029 ) ( CLEAR ?auto_11026 ) ( not ( = ?auto_11025 ?auto_11029 ) ) ( not ( = ?auto_11026 ?auto_11029 ) ) ( not ( = ?auto_11024 ?auto_11029 ) ) ( TRUCK-AT ?auto_11028 ?auto_11030 ) ( SURFACE-AT ?auto_11024 ?auto_11030 ) ( CLEAR ?auto_11024 ) ( IS-CRATE ?auto_11025 ) ( AVAILABLE ?auto_11027 ) ( IN ?auto_11025 ?auto_11028 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11025 ?auto_11026 )
      ( MAKE-2CRATE-VERIFY ?auto_11024 ?auto_11025 ?auto_11026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11069 - SURFACE
      ?auto_11070 - SURFACE
    )
    :vars
    (
      ?auto_11072 - HOIST
      ?auto_11073 - PLACE
      ?auto_11074 - SURFACE
      ?auto_11071 - PLACE
      ?auto_11075 - HOIST
      ?auto_11076 - SURFACE
      ?auto_11077 - TRUCK
      ?auto_11078 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11072 ?auto_11073 ) ( SURFACE-AT ?auto_11069 ?auto_11073 ) ( CLEAR ?auto_11069 ) ( IS-CRATE ?auto_11070 ) ( not ( = ?auto_11069 ?auto_11070 ) ) ( AVAILABLE ?auto_11072 ) ( ON ?auto_11069 ?auto_11074 ) ( not ( = ?auto_11074 ?auto_11069 ) ) ( not ( = ?auto_11074 ?auto_11070 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( HOIST-AT ?auto_11075 ?auto_11071 ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( AVAILABLE ?auto_11075 ) ( SURFACE-AT ?auto_11070 ?auto_11071 ) ( ON ?auto_11070 ?auto_11076 ) ( CLEAR ?auto_11070 ) ( not ( = ?auto_11069 ?auto_11076 ) ) ( not ( = ?auto_11070 ?auto_11076 ) ) ( not ( = ?auto_11074 ?auto_11076 ) ) ( TRUCK-AT ?auto_11077 ?auto_11078 ) ( not ( = ?auto_11078 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11077 ?auto_11078 ?auto_11073 )
      ( MAKE-1CRATE ?auto_11069 ?auto_11070 )
      ( MAKE-1CRATE-VERIFY ?auto_11069 ?auto_11070 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11108 - SURFACE
      ?auto_11109 - SURFACE
      ?auto_11110 - SURFACE
      ?auto_11111 - SURFACE
    )
    :vars
    (
      ?auto_11113 - HOIST
      ?auto_11112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11113 ?auto_11112 ) ( SURFACE-AT ?auto_11110 ?auto_11112 ) ( CLEAR ?auto_11110 ) ( LIFTING ?auto_11113 ?auto_11111 ) ( IS-CRATE ?auto_11111 ) ( not ( = ?auto_11110 ?auto_11111 ) ) ( ON ?auto_11109 ?auto_11108 ) ( ON ?auto_11110 ?auto_11109 ) ( not ( = ?auto_11108 ?auto_11109 ) ) ( not ( = ?auto_11108 ?auto_11110 ) ) ( not ( = ?auto_11108 ?auto_11111 ) ) ( not ( = ?auto_11109 ?auto_11110 ) ) ( not ( = ?auto_11109 ?auto_11111 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11110 ?auto_11111 )
      ( MAKE-3CRATE-VERIFY ?auto_11108 ?auto_11109 ?auto_11110 ?auto_11111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11125 - SURFACE
      ?auto_11126 - SURFACE
      ?auto_11127 - SURFACE
      ?auto_11128 - SURFACE
    )
    :vars
    (
      ?auto_11129 - HOIST
      ?auto_11131 - PLACE
      ?auto_11130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11129 ?auto_11131 ) ( SURFACE-AT ?auto_11127 ?auto_11131 ) ( CLEAR ?auto_11127 ) ( IS-CRATE ?auto_11128 ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( TRUCK-AT ?auto_11130 ?auto_11131 ) ( AVAILABLE ?auto_11129 ) ( IN ?auto_11128 ?auto_11130 ) ( ON ?auto_11127 ?auto_11126 ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( ON ?auto_11126 ?auto_11125 ) ( not ( = ?auto_11125 ?auto_11126 ) ) ( not ( = ?auto_11125 ?auto_11127 ) ) ( not ( = ?auto_11125 ?auto_11128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11126 ?auto_11127 ?auto_11128 )
      ( MAKE-3CRATE-VERIFY ?auto_11125 ?auto_11126 ?auto_11127 ?auto_11128 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11146 - SURFACE
      ?auto_11147 - SURFACE
      ?auto_11148 - SURFACE
      ?auto_11149 - SURFACE
    )
    :vars
    (
      ?auto_11152 - HOIST
      ?auto_11151 - PLACE
      ?auto_11153 - TRUCK
      ?auto_11150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11152 ?auto_11151 ) ( SURFACE-AT ?auto_11148 ?auto_11151 ) ( CLEAR ?auto_11148 ) ( IS-CRATE ?auto_11149 ) ( not ( = ?auto_11148 ?auto_11149 ) ) ( AVAILABLE ?auto_11152 ) ( IN ?auto_11149 ?auto_11153 ) ( ON ?auto_11148 ?auto_11147 ) ( not ( = ?auto_11147 ?auto_11148 ) ) ( not ( = ?auto_11147 ?auto_11149 ) ) ( TRUCK-AT ?auto_11153 ?auto_11150 ) ( not ( = ?auto_11150 ?auto_11151 ) ) ( ON ?auto_11147 ?auto_11146 ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( not ( = ?auto_11146 ?auto_11149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11147 ?auto_11148 ?auto_11149 )
      ( MAKE-3CRATE-VERIFY ?auto_11146 ?auto_11147 ?auto_11148 ?auto_11149 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11170 - SURFACE
      ?auto_11171 - SURFACE
      ?auto_11172 - SURFACE
      ?auto_11173 - SURFACE
    )
    :vars
    (
      ?auto_11174 - HOIST
      ?auto_11176 - PLACE
      ?auto_11175 - TRUCK
      ?auto_11178 - PLACE
      ?auto_11177 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11174 ?auto_11176 ) ( SURFACE-AT ?auto_11172 ?auto_11176 ) ( CLEAR ?auto_11172 ) ( IS-CRATE ?auto_11173 ) ( not ( = ?auto_11172 ?auto_11173 ) ) ( AVAILABLE ?auto_11174 ) ( ON ?auto_11172 ?auto_11171 ) ( not ( = ?auto_11171 ?auto_11172 ) ) ( not ( = ?auto_11171 ?auto_11173 ) ) ( TRUCK-AT ?auto_11175 ?auto_11178 ) ( not ( = ?auto_11178 ?auto_11176 ) ) ( HOIST-AT ?auto_11177 ?auto_11178 ) ( LIFTING ?auto_11177 ?auto_11173 ) ( not ( = ?auto_11174 ?auto_11177 ) ) ( ON ?auto_11171 ?auto_11170 ) ( not ( = ?auto_11170 ?auto_11171 ) ) ( not ( = ?auto_11170 ?auto_11172 ) ) ( not ( = ?auto_11170 ?auto_11173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11171 ?auto_11172 ?auto_11173 )
      ( MAKE-3CRATE-VERIFY ?auto_11170 ?auto_11171 ?auto_11172 ?auto_11173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11197 - SURFACE
      ?auto_11198 - SURFACE
      ?auto_11199 - SURFACE
      ?auto_11200 - SURFACE
    )
    :vars
    (
      ?auto_11203 - HOIST
      ?auto_11205 - PLACE
      ?auto_11204 - TRUCK
      ?auto_11206 - PLACE
      ?auto_11201 - HOIST
      ?auto_11202 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11203 ?auto_11205 ) ( SURFACE-AT ?auto_11199 ?auto_11205 ) ( CLEAR ?auto_11199 ) ( IS-CRATE ?auto_11200 ) ( not ( = ?auto_11199 ?auto_11200 ) ) ( AVAILABLE ?auto_11203 ) ( ON ?auto_11199 ?auto_11198 ) ( not ( = ?auto_11198 ?auto_11199 ) ) ( not ( = ?auto_11198 ?auto_11200 ) ) ( TRUCK-AT ?auto_11204 ?auto_11206 ) ( not ( = ?auto_11206 ?auto_11205 ) ) ( HOIST-AT ?auto_11201 ?auto_11206 ) ( not ( = ?auto_11203 ?auto_11201 ) ) ( AVAILABLE ?auto_11201 ) ( SURFACE-AT ?auto_11200 ?auto_11206 ) ( ON ?auto_11200 ?auto_11202 ) ( CLEAR ?auto_11200 ) ( not ( = ?auto_11199 ?auto_11202 ) ) ( not ( = ?auto_11200 ?auto_11202 ) ) ( not ( = ?auto_11198 ?auto_11202 ) ) ( ON ?auto_11198 ?auto_11197 ) ( not ( = ?auto_11197 ?auto_11198 ) ) ( not ( = ?auto_11197 ?auto_11199 ) ) ( not ( = ?auto_11197 ?auto_11200 ) ) ( not ( = ?auto_11197 ?auto_11202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11198 ?auto_11199 ?auto_11200 )
      ( MAKE-3CRATE-VERIFY ?auto_11197 ?auto_11198 ?auto_11199 ?auto_11200 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11225 - SURFACE
      ?auto_11226 - SURFACE
      ?auto_11227 - SURFACE
      ?auto_11228 - SURFACE
    )
    :vars
    (
      ?auto_11232 - HOIST
      ?auto_11231 - PLACE
      ?auto_11229 - PLACE
      ?auto_11233 - HOIST
      ?auto_11234 - SURFACE
      ?auto_11230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11232 ?auto_11231 ) ( SURFACE-AT ?auto_11227 ?auto_11231 ) ( CLEAR ?auto_11227 ) ( IS-CRATE ?auto_11228 ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( AVAILABLE ?auto_11232 ) ( ON ?auto_11227 ?auto_11226 ) ( not ( = ?auto_11226 ?auto_11227 ) ) ( not ( = ?auto_11226 ?auto_11228 ) ) ( not ( = ?auto_11229 ?auto_11231 ) ) ( HOIST-AT ?auto_11233 ?auto_11229 ) ( not ( = ?auto_11232 ?auto_11233 ) ) ( AVAILABLE ?auto_11233 ) ( SURFACE-AT ?auto_11228 ?auto_11229 ) ( ON ?auto_11228 ?auto_11234 ) ( CLEAR ?auto_11228 ) ( not ( = ?auto_11227 ?auto_11234 ) ) ( not ( = ?auto_11228 ?auto_11234 ) ) ( not ( = ?auto_11226 ?auto_11234 ) ) ( TRUCK-AT ?auto_11230 ?auto_11231 ) ( ON ?auto_11226 ?auto_11225 ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11227 ) ) ( not ( = ?auto_11225 ?auto_11228 ) ) ( not ( = ?auto_11225 ?auto_11234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11226 ?auto_11227 ?auto_11228 )
      ( MAKE-3CRATE-VERIFY ?auto_11225 ?auto_11226 ?auto_11227 ?auto_11228 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11253 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11255 - SURFACE
      ?auto_11256 - SURFACE
    )
    :vars
    (
      ?auto_11262 - HOIST
      ?auto_11261 - PLACE
      ?auto_11260 - PLACE
      ?auto_11257 - HOIST
      ?auto_11258 - SURFACE
      ?auto_11259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11262 ?auto_11261 ) ( IS-CRATE ?auto_11256 ) ( not ( = ?auto_11255 ?auto_11256 ) ) ( not ( = ?auto_11254 ?auto_11255 ) ) ( not ( = ?auto_11254 ?auto_11256 ) ) ( not ( = ?auto_11260 ?auto_11261 ) ) ( HOIST-AT ?auto_11257 ?auto_11260 ) ( not ( = ?auto_11262 ?auto_11257 ) ) ( AVAILABLE ?auto_11257 ) ( SURFACE-AT ?auto_11256 ?auto_11260 ) ( ON ?auto_11256 ?auto_11258 ) ( CLEAR ?auto_11256 ) ( not ( = ?auto_11255 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( not ( = ?auto_11254 ?auto_11258 ) ) ( TRUCK-AT ?auto_11259 ?auto_11261 ) ( SURFACE-AT ?auto_11254 ?auto_11261 ) ( CLEAR ?auto_11254 ) ( LIFTING ?auto_11262 ?auto_11255 ) ( IS-CRATE ?auto_11255 ) ( ON ?auto_11254 ?auto_11253 ) ( not ( = ?auto_11253 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11255 ) ) ( not ( = ?auto_11253 ?auto_11256 ) ) ( not ( = ?auto_11253 ?auto_11258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11254 ?auto_11255 ?auto_11256 )
      ( MAKE-3CRATE-VERIFY ?auto_11253 ?auto_11254 ?auto_11255 ?auto_11256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11281 - SURFACE
      ?auto_11282 - SURFACE
      ?auto_11283 - SURFACE
      ?auto_11284 - SURFACE
    )
    :vars
    (
      ?auto_11288 - HOIST
      ?auto_11289 - PLACE
      ?auto_11286 - PLACE
      ?auto_11290 - HOIST
      ?auto_11285 - SURFACE
      ?auto_11287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11288 ?auto_11289 ) ( IS-CRATE ?auto_11284 ) ( not ( = ?auto_11283 ?auto_11284 ) ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11282 ?auto_11284 ) ) ( not ( = ?auto_11286 ?auto_11289 ) ) ( HOIST-AT ?auto_11290 ?auto_11286 ) ( not ( = ?auto_11288 ?auto_11290 ) ) ( AVAILABLE ?auto_11290 ) ( SURFACE-AT ?auto_11284 ?auto_11286 ) ( ON ?auto_11284 ?auto_11285 ) ( CLEAR ?auto_11284 ) ( not ( = ?auto_11283 ?auto_11285 ) ) ( not ( = ?auto_11284 ?auto_11285 ) ) ( not ( = ?auto_11282 ?auto_11285 ) ) ( TRUCK-AT ?auto_11287 ?auto_11289 ) ( SURFACE-AT ?auto_11282 ?auto_11289 ) ( CLEAR ?auto_11282 ) ( IS-CRATE ?auto_11283 ) ( AVAILABLE ?auto_11288 ) ( IN ?auto_11283 ?auto_11287 ) ( ON ?auto_11282 ?auto_11281 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11283 ) ) ( not ( = ?auto_11281 ?auto_11284 ) ) ( not ( = ?auto_11281 ?auto_11285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11282 ?auto_11283 ?auto_11284 )
      ( MAKE-3CRATE-VERIFY ?auto_11281 ?auto_11282 ?auto_11283 ?auto_11284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11572 - SURFACE
      ?auto_11573 - SURFACE
      ?auto_11574 - SURFACE
      ?auto_11576 - SURFACE
      ?auto_11575 - SURFACE
    )
    :vars
    (
      ?auto_11578 - HOIST
      ?auto_11577 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11578 ?auto_11577 ) ( SURFACE-AT ?auto_11576 ?auto_11577 ) ( CLEAR ?auto_11576 ) ( LIFTING ?auto_11578 ?auto_11575 ) ( IS-CRATE ?auto_11575 ) ( not ( = ?auto_11576 ?auto_11575 ) ) ( ON ?auto_11573 ?auto_11572 ) ( ON ?auto_11574 ?auto_11573 ) ( ON ?auto_11576 ?auto_11574 ) ( not ( = ?auto_11572 ?auto_11573 ) ) ( not ( = ?auto_11572 ?auto_11574 ) ) ( not ( = ?auto_11572 ?auto_11576 ) ) ( not ( = ?auto_11572 ?auto_11575 ) ) ( not ( = ?auto_11573 ?auto_11574 ) ) ( not ( = ?auto_11573 ?auto_11576 ) ) ( not ( = ?auto_11573 ?auto_11575 ) ) ( not ( = ?auto_11574 ?auto_11576 ) ) ( not ( = ?auto_11574 ?auto_11575 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11576 ?auto_11575 )
      ( MAKE-4CRATE-VERIFY ?auto_11572 ?auto_11573 ?auto_11574 ?auto_11576 ?auto_11575 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11597 - SURFACE
      ?auto_11598 - SURFACE
      ?auto_11599 - SURFACE
      ?auto_11601 - SURFACE
      ?auto_11600 - SURFACE
    )
    :vars
    (
      ?auto_11602 - HOIST
      ?auto_11603 - PLACE
      ?auto_11604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11602 ?auto_11603 ) ( SURFACE-AT ?auto_11601 ?auto_11603 ) ( CLEAR ?auto_11601 ) ( IS-CRATE ?auto_11600 ) ( not ( = ?auto_11601 ?auto_11600 ) ) ( TRUCK-AT ?auto_11604 ?auto_11603 ) ( AVAILABLE ?auto_11602 ) ( IN ?auto_11600 ?auto_11604 ) ( ON ?auto_11601 ?auto_11599 ) ( not ( = ?auto_11599 ?auto_11601 ) ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( ON ?auto_11598 ?auto_11597 ) ( ON ?auto_11599 ?auto_11598 ) ( not ( = ?auto_11597 ?auto_11598 ) ) ( not ( = ?auto_11597 ?auto_11599 ) ) ( not ( = ?auto_11597 ?auto_11601 ) ) ( not ( = ?auto_11597 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11601 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11599 ?auto_11601 ?auto_11600 )
      ( MAKE-4CRATE-VERIFY ?auto_11597 ?auto_11598 ?auto_11599 ?auto_11601 ?auto_11600 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11627 - SURFACE
      ?auto_11628 - SURFACE
      ?auto_11629 - SURFACE
      ?auto_11631 - SURFACE
      ?auto_11630 - SURFACE
    )
    :vars
    (
      ?auto_11633 - HOIST
      ?auto_11635 - PLACE
      ?auto_11634 - TRUCK
      ?auto_11632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11633 ?auto_11635 ) ( SURFACE-AT ?auto_11631 ?auto_11635 ) ( CLEAR ?auto_11631 ) ( IS-CRATE ?auto_11630 ) ( not ( = ?auto_11631 ?auto_11630 ) ) ( AVAILABLE ?auto_11633 ) ( IN ?auto_11630 ?auto_11634 ) ( ON ?auto_11631 ?auto_11629 ) ( not ( = ?auto_11629 ?auto_11631 ) ) ( not ( = ?auto_11629 ?auto_11630 ) ) ( TRUCK-AT ?auto_11634 ?auto_11632 ) ( not ( = ?auto_11632 ?auto_11635 ) ) ( ON ?auto_11628 ?auto_11627 ) ( ON ?auto_11629 ?auto_11628 ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( not ( = ?auto_11627 ?auto_11629 ) ) ( not ( = ?auto_11627 ?auto_11631 ) ) ( not ( = ?auto_11627 ?auto_11630 ) ) ( not ( = ?auto_11628 ?auto_11629 ) ) ( not ( = ?auto_11628 ?auto_11631 ) ) ( not ( = ?auto_11628 ?auto_11630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11629 ?auto_11631 ?auto_11630 )
      ( MAKE-4CRATE-VERIFY ?auto_11627 ?auto_11628 ?auto_11629 ?auto_11631 ?auto_11630 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11661 - SURFACE
      ?auto_11662 - SURFACE
      ?auto_11663 - SURFACE
      ?auto_11665 - SURFACE
      ?auto_11664 - SURFACE
    )
    :vars
    (
      ?auto_11667 - HOIST
      ?auto_11666 - PLACE
      ?auto_11670 - TRUCK
      ?auto_11669 - PLACE
      ?auto_11668 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11667 ?auto_11666 ) ( SURFACE-AT ?auto_11665 ?auto_11666 ) ( CLEAR ?auto_11665 ) ( IS-CRATE ?auto_11664 ) ( not ( = ?auto_11665 ?auto_11664 ) ) ( AVAILABLE ?auto_11667 ) ( ON ?auto_11665 ?auto_11663 ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( TRUCK-AT ?auto_11670 ?auto_11669 ) ( not ( = ?auto_11669 ?auto_11666 ) ) ( HOIST-AT ?auto_11668 ?auto_11669 ) ( LIFTING ?auto_11668 ?auto_11664 ) ( not ( = ?auto_11667 ?auto_11668 ) ) ( ON ?auto_11662 ?auto_11661 ) ( ON ?auto_11663 ?auto_11662 ) ( not ( = ?auto_11661 ?auto_11662 ) ) ( not ( = ?auto_11661 ?auto_11663 ) ) ( not ( = ?auto_11661 ?auto_11665 ) ) ( not ( = ?auto_11661 ?auto_11664 ) ) ( not ( = ?auto_11662 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11665 ) ) ( not ( = ?auto_11662 ?auto_11664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11663 ?auto_11665 ?auto_11664 )
      ( MAKE-4CRATE-VERIFY ?auto_11661 ?auto_11662 ?auto_11663 ?auto_11665 ?auto_11664 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11699 - SURFACE
      ?auto_11700 - SURFACE
      ?auto_11701 - SURFACE
      ?auto_11703 - SURFACE
      ?auto_11702 - SURFACE
    )
    :vars
    (
      ?auto_11708 - HOIST
      ?auto_11705 - PLACE
      ?auto_11704 - TRUCK
      ?auto_11707 - PLACE
      ?auto_11709 - HOIST
      ?auto_11706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11708 ?auto_11705 ) ( SURFACE-AT ?auto_11703 ?auto_11705 ) ( CLEAR ?auto_11703 ) ( IS-CRATE ?auto_11702 ) ( not ( = ?auto_11703 ?auto_11702 ) ) ( AVAILABLE ?auto_11708 ) ( ON ?auto_11703 ?auto_11701 ) ( not ( = ?auto_11701 ?auto_11703 ) ) ( not ( = ?auto_11701 ?auto_11702 ) ) ( TRUCK-AT ?auto_11704 ?auto_11707 ) ( not ( = ?auto_11707 ?auto_11705 ) ) ( HOIST-AT ?auto_11709 ?auto_11707 ) ( not ( = ?auto_11708 ?auto_11709 ) ) ( AVAILABLE ?auto_11709 ) ( SURFACE-AT ?auto_11702 ?auto_11707 ) ( ON ?auto_11702 ?auto_11706 ) ( CLEAR ?auto_11702 ) ( not ( = ?auto_11703 ?auto_11706 ) ) ( not ( = ?auto_11702 ?auto_11706 ) ) ( not ( = ?auto_11701 ?auto_11706 ) ) ( ON ?auto_11700 ?auto_11699 ) ( ON ?auto_11701 ?auto_11700 ) ( not ( = ?auto_11699 ?auto_11700 ) ) ( not ( = ?auto_11699 ?auto_11701 ) ) ( not ( = ?auto_11699 ?auto_11703 ) ) ( not ( = ?auto_11699 ?auto_11702 ) ) ( not ( = ?auto_11699 ?auto_11706 ) ) ( not ( = ?auto_11700 ?auto_11701 ) ) ( not ( = ?auto_11700 ?auto_11703 ) ) ( not ( = ?auto_11700 ?auto_11702 ) ) ( not ( = ?auto_11700 ?auto_11706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11701 ?auto_11703 ?auto_11702 )
      ( MAKE-4CRATE-VERIFY ?auto_11699 ?auto_11700 ?auto_11701 ?auto_11703 ?auto_11702 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11738 - SURFACE
      ?auto_11739 - SURFACE
      ?auto_11740 - SURFACE
      ?auto_11742 - SURFACE
      ?auto_11741 - SURFACE
    )
    :vars
    (
      ?auto_11747 - HOIST
      ?auto_11746 - PLACE
      ?auto_11743 - PLACE
      ?auto_11744 - HOIST
      ?auto_11745 - SURFACE
      ?auto_11748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11747 ?auto_11746 ) ( SURFACE-AT ?auto_11742 ?auto_11746 ) ( CLEAR ?auto_11742 ) ( IS-CRATE ?auto_11741 ) ( not ( = ?auto_11742 ?auto_11741 ) ) ( AVAILABLE ?auto_11747 ) ( ON ?auto_11742 ?auto_11740 ) ( not ( = ?auto_11740 ?auto_11742 ) ) ( not ( = ?auto_11740 ?auto_11741 ) ) ( not ( = ?auto_11743 ?auto_11746 ) ) ( HOIST-AT ?auto_11744 ?auto_11743 ) ( not ( = ?auto_11747 ?auto_11744 ) ) ( AVAILABLE ?auto_11744 ) ( SURFACE-AT ?auto_11741 ?auto_11743 ) ( ON ?auto_11741 ?auto_11745 ) ( CLEAR ?auto_11741 ) ( not ( = ?auto_11742 ?auto_11745 ) ) ( not ( = ?auto_11741 ?auto_11745 ) ) ( not ( = ?auto_11740 ?auto_11745 ) ) ( TRUCK-AT ?auto_11748 ?auto_11746 ) ( ON ?auto_11739 ?auto_11738 ) ( ON ?auto_11740 ?auto_11739 ) ( not ( = ?auto_11738 ?auto_11739 ) ) ( not ( = ?auto_11738 ?auto_11740 ) ) ( not ( = ?auto_11738 ?auto_11742 ) ) ( not ( = ?auto_11738 ?auto_11741 ) ) ( not ( = ?auto_11738 ?auto_11745 ) ) ( not ( = ?auto_11739 ?auto_11740 ) ) ( not ( = ?auto_11739 ?auto_11742 ) ) ( not ( = ?auto_11739 ?auto_11741 ) ) ( not ( = ?auto_11739 ?auto_11745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11740 ?auto_11742 ?auto_11741 )
      ( MAKE-4CRATE-VERIFY ?auto_11738 ?auto_11739 ?auto_11740 ?auto_11742 ?auto_11741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11777 - SURFACE
      ?auto_11778 - SURFACE
      ?auto_11779 - SURFACE
      ?auto_11781 - SURFACE
      ?auto_11780 - SURFACE
    )
    :vars
    (
      ?auto_11784 - HOIST
      ?auto_11783 - PLACE
      ?auto_11782 - PLACE
      ?auto_11786 - HOIST
      ?auto_11787 - SURFACE
      ?auto_11785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11784 ?auto_11783 ) ( IS-CRATE ?auto_11780 ) ( not ( = ?auto_11781 ?auto_11780 ) ) ( not ( = ?auto_11779 ?auto_11781 ) ) ( not ( = ?auto_11779 ?auto_11780 ) ) ( not ( = ?auto_11782 ?auto_11783 ) ) ( HOIST-AT ?auto_11786 ?auto_11782 ) ( not ( = ?auto_11784 ?auto_11786 ) ) ( AVAILABLE ?auto_11786 ) ( SURFACE-AT ?auto_11780 ?auto_11782 ) ( ON ?auto_11780 ?auto_11787 ) ( CLEAR ?auto_11780 ) ( not ( = ?auto_11781 ?auto_11787 ) ) ( not ( = ?auto_11780 ?auto_11787 ) ) ( not ( = ?auto_11779 ?auto_11787 ) ) ( TRUCK-AT ?auto_11785 ?auto_11783 ) ( SURFACE-AT ?auto_11779 ?auto_11783 ) ( CLEAR ?auto_11779 ) ( LIFTING ?auto_11784 ?auto_11781 ) ( IS-CRATE ?auto_11781 ) ( ON ?auto_11778 ?auto_11777 ) ( ON ?auto_11779 ?auto_11778 ) ( not ( = ?auto_11777 ?auto_11778 ) ) ( not ( = ?auto_11777 ?auto_11779 ) ) ( not ( = ?auto_11777 ?auto_11781 ) ) ( not ( = ?auto_11777 ?auto_11780 ) ) ( not ( = ?auto_11777 ?auto_11787 ) ) ( not ( = ?auto_11778 ?auto_11779 ) ) ( not ( = ?auto_11778 ?auto_11781 ) ) ( not ( = ?auto_11778 ?auto_11780 ) ) ( not ( = ?auto_11778 ?auto_11787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11779 ?auto_11781 ?auto_11780 )
      ( MAKE-4CRATE-VERIFY ?auto_11777 ?auto_11778 ?auto_11779 ?auto_11781 ?auto_11780 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11816 - SURFACE
      ?auto_11817 - SURFACE
      ?auto_11818 - SURFACE
      ?auto_11820 - SURFACE
      ?auto_11819 - SURFACE
    )
    :vars
    (
      ?auto_11825 - HOIST
      ?auto_11822 - PLACE
      ?auto_11823 - PLACE
      ?auto_11821 - HOIST
      ?auto_11826 - SURFACE
      ?auto_11824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11825 ?auto_11822 ) ( IS-CRATE ?auto_11819 ) ( not ( = ?auto_11820 ?auto_11819 ) ) ( not ( = ?auto_11818 ?auto_11820 ) ) ( not ( = ?auto_11818 ?auto_11819 ) ) ( not ( = ?auto_11823 ?auto_11822 ) ) ( HOIST-AT ?auto_11821 ?auto_11823 ) ( not ( = ?auto_11825 ?auto_11821 ) ) ( AVAILABLE ?auto_11821 ) ( SURFACE-AT ?auto_11819 ?auto_11823 ) ( ON ?auto_11819 ?auto_11826 ) ( CLEAR ?auto_11819 ) ( not ( = ?auto_11820 ?auto_11826 ) ) ( not ( = ?auto_11819 ?auto_11826 ) ) ( not ( = ?auto_11818 ?auto_11826 ) ) ( TRUCK-AT ?auto_11824 ?auto_11822 ) ( SURFACE-AT ?auto_11818 ?auto_11822 ) ( CLEAR ?auto_11818 ) ( IS-CRATE ?auto_11820 ) ( AVAILABLE ?auto_11825 ) ( IN ?auto_11820 ?auto_11824 ) ( ON ?auto_11817 ?auto_11816 ) ( ON ?auto_11818 ?auto_11817 ) ( not ( = ?auto_11816 ?auto_11817 ) ) ( not ( = ?auto_11816 ?auto_11818 ) ) ( not ( = ?auto_11816 ?auto_11820 ) ) ( not ( = ?auto_11816 ?auto_11819 ) ) ( not ( = ?auto_11816 ?auto_11826 ) ) ( not ( = ?auto_11817 ?auto_11818 ) ) ( not ( = ?auto_11817 ?auto_11820 ) ) ( not ( = ?auto_11817 ?auto_11819 ) ) ( not ( = ?auto_11817 ?auto_11826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11818 ?auto_11820 ?auto_11819 )
      ( MAKE-4CRATE-VERIFY ?auto_11816 ?auto_11817 ?auto_11818 ?auto_11820 ?auto_11819 ) )
  )

)

