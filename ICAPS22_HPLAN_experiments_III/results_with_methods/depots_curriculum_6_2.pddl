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
      ?auto_1990 - SURFACE
      ?auto_1991 - SURFACE
    )
    :vars
    (
      ?auto_1992 - HOIST
      ?auto_1993 - PLACE
      ?auto_1995 - PLACE
      ?auto_1996 - HOIST
      ?auto_1997 - SURFACE
      ?auto_1994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1992 ?auto_1993 ) ( SURFACE-AT ?auto_1990 ?auto_1993 ) ( CLEAR ?auto_1990 ) ( IS-CRATE ?auto_1991 ) ( AVAILABLE ?auto_1992 ) ( not ( = ?auto_1995 ?auto_1993 ) ) ( HOIST-AT ?auto_1996 ?auto_1995 ) ( AVAILABLE ?auto_1996 ) ( SURFACE-AT ?auto_1991 ?auto_1995 ) ( ON ?auto_1991 ?auto_1997 ) ( CLEAR ?auto_1991 ) ( TRUCK-AT ?auto_1994 ?auto_1993 ) ( not ( = ?auto_1990 ?auto_1991 ) ) ( not ( = ?auto_1990 ?auto_1997 ) ) ( not ( = ?auto_1991 ?auto_1997 ) ) ( not ( = ?auto_1992 ?auto_1996 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1994 ?auto_1993 ?auto_1995 )
      ( !LIFT ?auto_1996 ?auto_1991 ?auto_1997 ?auto_1995 )
      ( !LOAD ?auto_1996 ?auto_1991 ?auto_1994 ?auto_1995 )
      ( !DRIVE ?auto_1994 ?auto_1995 ?auto_1993 )
      ( !UNLOAD ?auto_1992 ?auto_1991 ?auto_1994 ?auto_1993 )
      ( !DROP ?auto_1992 ?auto_1991 ?auto_1990 ?auto_1993 )
      ( MAKE-1CRATE-VERIFY ?auto_1990 ?auto_1991 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2000 - SURFACE
      ?auto_2001 - SURFACE
    )
    :vars
    (
      ?auto_2002 - HOIST
      ?auto_2003 - PLACE
      ?auto_2005 - PLACE
      ?auto_2006 - HOIST
      ?auto_2007 - SURFACE
      ?auto_2004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2002 ?auto_2003 ) ( SURFACE-AT ?auto_2000 ?auto_2003 ) ( CLEAR ?auto_2000 ) ( IS-CRATE ?auto_2001 ) ( AVAILABLE ?auto_2002 ) ( not ( = ?auto_2005 ?auto_2003 ) ) ( HOIST-AT ?auto_2006 ?auto_2005 ) ( AVAILABLE ?auto_2006 ) ( SURFACE-AT ?auto_2001 ?auto_2005 ) ( ON ?auto_2001 ?auto_2007 ) ( CLEAR ?auto_2001 ) ( TRUCK-AT ?auto_2004 ?auto_2003 ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( not ( = ?auto_2000 ?auto_2007 ) ) ( not ( = ?auto_2001 ?auto_2007 ) ) ( not ( = ?auto_2002 ?auto_2006 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2004 ?auto_2003 ?auto_2005 )
      ( !LIFT ?auto_2006 ?auto_2001 ?auto_2007 ?auto_2005 )
      ( !LOAD ?auto_2006 ?auto_2001 ?auto_2004 ?auto_2005 )
      ( !DRIVE ?auto_2004 ?auto_2005 ?auto_2003 )
      ( !UNLOAD ?auto_2002 ?auto_2001 ?auto_2004 ?auto_2003 )
      ( !DROP ?auto_2002 ?auto_2001 ?auto_2000 ?auto_2003 )
      ( MAKE-1CRATE-VERIFY ?auto_2000 ?auto_2001 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2011 - SURFACE
      ?auto_2012 - SURFACE
      ?auto_2013 - SURFACE
    )
    :vars
    (
      ?auto_2019 - HOIST
      ?auto_2014 - PLACE
      ?auto_2016 - PLACE
      ?auto_2018 - HOIST
      ?auto_2015 - SURFACE
      ?auto_2021 - PLACE
      ?auto_2022 - HOIST
      ?auto_2020 - SURFACE
      ?auto_2017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2019 ?auto_2014 ) ( IS-CRATE ?auto_2013 ) ( not ( = ?auto_2016 ?auto_2014 ) ) ( HOIST-AT ?auto_2018 ?auto_2016 ) ( AVAILABLE ?auto_2018 ) ( SURFACE-AT ?auto_2013 ?auto_2016 ) ( ON ?auto_2013 ?auto_2015 ) ( CLEAR ?auto_2013 ) ( not ( = ?auto_2012 ?auto_2013 ) ) ( not ( = ?auto_2012 ?auto_2015 ) ) ( not ( = ?auto_2013 ?auto_2015 ) ) ( not ( = ?auto_2019 ?auto_2018 ) ) ( SURFACE-AT ?auto_2011 ?auto_2014 ) ( CLEAR ?auto_2011 ) ( IS-CRATE ?auto_2012 ) ( AVAILABLE ?auto_2019 ) ( not ( = ?auto_2021 ?auto_2014 ) ) ( HOIST-AT ?auto_2022 ?auto_2021 ) ( AVAILABLE ?auto_2022 ) ( SURFACE-AT ?auto_2012 ?auto_2021 ) ( ON ?auto_2012 ?auto_2020 ) ( CLEAR ?auto_2012 ) ( TRUCK-AT ?auto_2017 ?auto_2014 ) ( not ( = ?auto_2011 ?auto_2012 ) ) ( not ( = ?auto_2011 ?auto_2020 ) ) ( not ( = ?auto_2012 ?auto_2020 ) ) ( not ( = ?auto_2019 ?auto_2022 ) ) ( not ( = ?auto_2011 ?auto_2013 ) ) ( not ( = ?auto_2011 ?auto_2015 ) ) ( not ( = ?auto_2013 ?auto_2020 ) ) ( not ( = ?auto_2016 ?auto_2021 ) ) ( not ( = ?auto_2018 ?auto_2022 ) ) ( not ( = ?auto_2015 ?auto_2020 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2011 ?auto_2012 )
      ( MAKE-1CRATE ?auto_2012 ?auto_2013 )
      ( MAKE-2CRATE-VERIFY ?auto_2011 ?auto_2012 ?auto_2013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2025 - SURFACE
      ?auto_2026 - SURFACE
    )
    :vars
    (
      ?auto_2027 - HOIST
      ?auto_2028 - PLACE
      ?auto_2030 - PLACE
      ?auto_2031 - HOIST
      ?auto_2032 - SURFACE
      ?auto_2029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027 ?auto_2028 ) ( SURFACE-AT ?auto_2025 ?auto_2028 ) ( CLEAR ?auto_2025 ) ( IS-CRATE ?auto_2026 ) ( AVAILABLE ?auto_2027 ) ( not ( = ?auto_2030 ?auto_2028 ) ) ( HOIST-AT ?auto_2031 ?auto_2030 ) ( AVAILABLE ?auto_2031 ) ( SURFACE-AT ?auto_2026 ?auto_2030 ) ( ON ?auto_2026 ?auto_2032 ) ( CLEAR ?auto_2026 ) ( TRUCK-AT ?auto_2029 ?auto_2028 ) ( not ( = ?auto_2025 ?auto_2026 ) ) ( not ( = ?auto_2025 ?auto_2032 ) ) ( not ( = ?auto_2026 ?auto_2032 ) ) ( not ( = ?auto_2027 ?auto_2031 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2029 ?auto_2028 ?auto_2030 )
      ( !LIFT ?auto_2031 ?auto_2026 ?auto_2032 ?auto_2030 )
      ( !LOAD ?auto_2031 ?auto_2026 ?auto_2029 ?auto_2030 )
      ( !DRIVE ?auto_2029 ?auto_2030 ?auto_2028 )
      ( !UNLOAD ?auto_2027 ?auto_2026 ?auto_2029 ?auto_2028 )
      ( !DROP ?auto_2027 ?auto_2026 ?auto_2025 ?auto_2028 )
      ( MAKE-1CRATE-VERIFY ?auto_2025 ?auto_2026 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2037 - SURFACE
      ?auto_2038 - SURFACE
      ?auto_2039 - SURFACE
      ?auto_2040 - SURFACE
    )
    :vars
    (
      ?auto_2045 - HOIST
      ?auto_2043 - PLACE
      ?auto_2044 - PLACE
      ?auto_2046 - HOIST
      ?auto_2042 - SURFACE
      ?auto_2047 - PLACE
      ?auto_2050 - HOIST
      ?auto_2048 - SURFACE
      ?auto_2049 - SURFACE
      ?auto_2041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2045 ?auto_2043 ) ( IS-CRATE ?auto_2040 ) ( not ( = ?auto_2044 ?auto_2043 ) ) ( HOIST-AT ?auto_2046 ?auto_2044 ) ( SURFACE-AT ?auto_2040 ?auto_2044 ) ( ON ?auto_2040 ?auto_2042 ) ( CLEAR ?auto_2040 ) ( not ( = ?auto_2039 ?auto_2040 ) ) ( not ( = ?auto_2039 ?auto_2042 ) ) ( not ( = ?auto_2040 ?auto_2042 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( IS-CRATE ?auto_2039 ) ( not ( = ?auto_2047 ?auto_2043 ) ) ( HOIST-AT ?auto_2050 ?auto_2047 ) ( AVAILABLE ?auto_2050 ) ( SURFACE-AT ?auto_2039 ?auto_2047 ) ( ON ?auto_2039 ?auto_2048 ) ( CLEAR ?auto_2039 ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( not ( = ?auto_2038 ?auto_2048 ) ) ( not ( = ?auto_2039 ?auto_2048 ) ) ( not ( = ?auto_2045 ?auto_2050 ) ) ( SURFACE-AT ?auto_2037 ?auto_2043 ) ( CLEAR ?auto_2037 ) ( IS-CRATE ?auto_2038 ) ( AVAILABLE ?auto_2045 ) ( AVAILABLE ?auto_2046 ) ( SURFACE-AT ?auto_2038 ?auto_2044 ) ( ON ?auto_2038 ?auto_2049 ) ( CLEAR ?auto_2038 ) ( TRUCK-AT ?auto_2041 ?auto_2043 ) ( not ( = ?auto_2037 ?auto_2038 ) ) ( not ( = ?auto_2037 ?auto_2049 ) ) ( not ( = ?auto_2038 ?auto_2049 ) ) ( not ( = ?auto_2037 ?auto_2039 ) ) ( not ( = ?auto_2037 ?auto_2048 ) ) ( not ( = ?auto_2039 ?auto_2049 ) ) ( not ( = ?auto_2047 ?auto_2044 ) ) ( not ( = ?auto_2050 ?auto_2046 ) ) ( not ( = ?auto_2048 ?auto_2049 ) ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( not ( = ?auto_2037 ?auto_2042 ) ) ( not ( = ?auto_2038 ?auto_2040 ) ) ( not ( = ?auto_2038 ?auto_2042 ) ) ( not ( = ?auto_2040 ?auto_2048 ) ) ( not ( = ?auto_2040 ?auto_2049 ) ) ( not ( = ?auto_2042 ?auto_2048 ) ) ( not ( = ?auto_2042 ?auto_2049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2037 ?auto_2038 ?auto_2039 )
      ( MAKE-1CRATE ?auto_2039 ?auto_2040 )
      ( MAKE-3CRATE-VERIFY ?auto_2037 ?auto_2038 ?auto_2039 ?auto_2040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2053 - SURFACE
      ?auto_2054 - SURFACE
    )
    :vars
    (
      ?auto_2055 - HOIST
      ?auto_2056 - PLACE
      ?auto_2058 - PLACE
      ?auto_2059 - HOIST
      ?auto_2060 - SURFACE
      ?auto_2057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2055 ?auto_2056 ) ( SURFACE-AT ?auto_2053 ?auto_2056 ) ( CLEAR ?auto_2053 ) ( IS-CRATE ?auto_2054 ) ( AVAILABLE ?auto_2055 ) ( not ( = ?auto_2058 ?auto_2056 ) ) ( HOIST-AT ?auto_2059 ?auto_2058 ) ( AVAILABLE ?auto_2059 ) ( SURFACE-AT ?auto_2054 ?auto_2058 ) ( ON ?auto_2054 ?auto_2060 ) ( CLEAR ?auto_2054 ) ( TRUCK-AT ?auto_2057 ?auto_2056 ) ( not ( = ?auto_2053 ?auto_2054 ) ) ( not ( = ?auto_2053 ?auto_2060 ) ) ( not ( = ?auto_2054 ?auto_2060 ) ) ( not ( = ?auto_2055 ?auto_2059 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2057 ?auto_2056 ?auto_2058 )
      ( !LIFT ?auto_2059 ?auto_2054 ?auto_2060 ?auto_2058 )
      ( !LOAD ?auto_2059 ?auto_2054 ?auto_2057 ?auto_2058 )
      ( !DRIVE ?auto_2057 ?auto_2058 ?auto_2056 )
      ( !UNLOAD ?auto_2055 ?auto_2054 ?auto_2057 ?auto_2056 )
      ( !DROP ?auto_2055 ?auto_2054 ?auto_2053 ?auto_2056 )
      ( MAKE-1CRATE-VERIFY ?auto_2053 ?auto_2054 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2066 - SURFACE
      ?auto_2067 - SURFACE
      ?auto_2068 - SURFACE
      ?auto_2069 - SURFACE
      ?auto_2070 - SURFACE
    )
    :vars
    (
      ?auto_2074 - HOIST
      ?auto_2071 - PLACE
      ?auto_2075 - PLACE
      ?auto_2073 - HOIST
      ?auto_2072 - SURFACE
      ?auto_2080 - PLACE
      ?auto_2077 - HOIST
      ?auto_2078 - SURFACE
      ?auto_2081 - SURFACE
      ?auto_2079 - SURFACE
      ?auto_2076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074 ?auto_2071 ) ( IS-CRATE ?auto_2070 ) ( not ( = ?auto_2075 ?auto_2071 ) ) ( HOIST-AT ?auto_2073 ?auto_2075 ) ( SURFACE-AT ?auto_2070 ?auto_2075 ) ( ON ?auto_2070 ?auto_2072 ) ( CLEAR ?auto_2070 ) ( not ( = ?auto_2069 ?auto_2070 ) ) ( not ( = ?auto_2069 ?auto_2072 ) ) ( not ( = ?auto_2070 ?auto_2072 ) ) ( not ( = ?auto_2074 ?auto_2073 ) ) ( IS-CRATE ?auto_2069 ) ( not ( = ?auto_2080 ?auto_2071 ) ) ( HOIST-AT ?auto_2077 ?auto_2080 ) ( SURFACE-AT ?auto_2069 ?auto_2080 ) ( ON ?auto_2069 ?auto_2078 ) ( CLEAR ?auto_2069 ) ( not ( = ?auto_2068 ?auto_2069 ) ) ( not ( = ?auto_2068 ?auto_2078 ) ) ( not ( = ?auto_2069 ?auto_2078 ) ) ( not ( = ?auto_2074 ?auto_2077 ) ) ( IS-CRATE ?auto_2068 ) ( AVAILABLE ?auto_2073 ) ( SURFACE-AT ?auto_2068 ?auto_2075 ) ( ON ?auto_2068 ?auto_2081 ) ( CLEAR ?auto_2068 ) ( not ( = ?auto_2067 ?auto_2068 ) ) ( not ( = ?auto_2067 ?auto_2081 ) ) ( not ( = ?auto_2068 ?auto_2081 ) ) ( SURFACE-AT ?auto_2066 ?auto_2071 ) ( CLEAR ?auto_2066 ) ( IS-CRATE ?auto_2067 ) ( AVAILABLE ?auto_2074 ) ( AVAILABLE ?auto_2077 ) ( SURFACE-AT ?auto_2067 ?auto_2080 ) ( ON ?auto_2067 ?auto_2079 ) ( CLEAR ?auto_2067 ) ( TRUCK-AT ?auto_2076 ?auto_2071 ) ( not ( = ?auto_2066 ?auto_2067 ) ) ( not ( = ?auto_2066 ?auto_2079 ) ) ( not ( = ?auto_2067 ?auto_2079 ) ) ( not ( = ?auto_2066 ?auto_2068 ) ) ( not ( = ?auto_2066 ?auto_2081 ) ) ( not ( = ?auto_2068 ?auto_2079 ) ) ( not ( = ?auto_2075 ?auto_2080 ) ) ( not ( = ?auto_2073 ?auto_2077 ) ) ( not ( = ?auto_2081 ?auto_2079 ) ) ( not ( = ?auto_2066 ?auto_2069 ) ) ( not ( = ?auto_2066 ?auto_2078 ) ) ( not ( = ?auto_2067 ?auto_2069 ) ) ( not ( = ?auto_2067 ?auto_2078 ) ) ( not ( = ?auto_2069 ?auto_2081 ) ) ( not ( = ?auto_2069 ?auto_2079 ) ) ( not ( = ?auto_2078 ?auto_2081 ) ) ( not ( = ?auto_2078 ?auto_2079 ) ) ( not ( = ?auto_2066 ?auto_2070 ) ) ( not ( = ?auto_2066 ?auto_2072 ) ) ( not ( = ?auto_2067 ?auto_2070 ) ) ( not ( = ?auto_2067 ?auto_2072 ) ) ( not ( = ?auto_2068 ?auto_2070 ) ) ( not ( = ?auto_2068 ?auto_2072 ) ) ( not ( = ?auto_2070 ?auto_2078 ) ) ( not ( = ?auto_2070 ?auto_2081 ) ) ( not ( = ?auto_2070 ?auto_2079 ) ) ( not ( = ?auto_2072 ?auto_2078 ) ) ( not ( = ?auto_2072 ?auto_2081 ) ) ( not ( = ?auto_2072 ?auto_2079 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2066 ?auto_2067 ?auto_2068 ?auto_2069 )
      ( MAKE-1CRATE ?auto_2069 ?auto_2070 )
      ( MAKE-4CRATE-VERIFY ?auto_2066 ?auto_2067 ?auto_2068 ?auto_2069 ?auto_2070 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2084 - SURFACE
      ?auto_2085 - SURFACE
    )
    :vars
    (
      ?auto_2086 - HOIST
      ?auto_2087 - PLACE
      ?auto_2089 - PLACE
      ?auto_2090 - HOIST
      ?auto_2091 - SURFACE
      ?auto_2088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2086 ?auto_2087 ) ( SURFACE-AT ?auto_2084 ?auto_2087 ) ( CLEAR ?auto_2084 ) ( IS-CRATE ?auto_2085 ) ( AVAILABLE ?auto_2086 ) ( not ( = ?auto_2089 ?auto_2087 ) ) ( HOIST-AT ?auto_2090 ?auto_2089 ) ( AVAILABLE ?auto_2090 ) ( SURFACE-AT ?auto_2085 ?auto_2089 ) ( ON ?auto_2085 ?auto_2091 ) ( CLEAR ?auto_2085 ) ( TRUCK-AT ?auto_2088 ?auto_2087 ) ( not ( = ?auto_2084 ?auto_2085 ) ) ( not ( = ?auto_2084 ?auto_2091 ) ) ( not ( = ?auto_2085 ?auto_2091 ) ) ( not ( = ?auto_2086 ?auto_2090 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2088 ?auto_2087 ?auto_2089 )
      ( !LIFT ?auto_2090 ?auto_2085 ?auto_2091 ?auto_2089 )
      ( !LOAD ?auto_2090 ?auto_2085 ?auto_2088 ?auto_2089 )
      ( !DRIVE ?auto_2088 ?auto_2089 ?auto_2087 )
      ( !UNLOAD ?auto_2086 ?auto_2085 ?auto_2088 ?auto_2087 )
      ( !DROP ?auto_2086 ?auto_2085 ?auto_2084 ?auto_2087 )
      ( MAKE-1CRATE-VERIFY ?auto_2084 ?auto_2085 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2098 - SURFACE
      ?auto_2099 - SURFACE
      ?auto_2100 - SURFACE
      ?auto_2101 - SURFACE
      ?auto_2102 - SURFACE
      ?auto_2103 - SURFACE
    )
    :vars
    (
      ?auto_2106 - HOIST
      ?auto_2104 - PLACE
      ?auto_2105 - PLACE
      ?auto_2108 - HOIST
      ?auto_2107 - SURFACE
      ?auto_2112 - PLACE
      ?auto_2110 - HOIST
      ?auto_2116 - SURFACE
      ?auto_2115 - PLACE
      ?auto_2113 - HOIST
      ?auto_2117 - SURFACE
      ?auto_2114 - SURFACE
      ?auto_2111 - SURFACE
      ?auto_2109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2106 ?auto_2104 ) ( IS-CRATE ?auto_2103 ) ( not ( = ?auto_2105 ?auto_2104 ) ) ( HOIST-AT ?auto_2108 ?auto_2105 ) ( AVAILABLE ?auto_2108 ) ( SURFACE-AT ?auto_2103 ?auto_2105 ) ( ON ?auto_2103 ?auto_2107 ) ( CLEAR ?auto_2103 ) ( not ( = ?auto_2102 ?auto_2103 ) ) ( not ( = ?auto_2102 ?auto_2107 ) ) ( not ( = ?auto_2103 ?auto_2107 ) ) ( not ( = ?auto_2106 ?auto_2108 ) ) ( IS-CRATE ?auto_2102 ) ( not ( = ?auto_2112 ?auto_2104 ) ) ( HOIST-AT ?auto_2110 ?auto_2112 ) ( SURFACE-AT ?auto_2102 ?auto_2112 ) ( ON ?auto_2102 ?auto_2116 ) ( CLEAR ?auto_2102 ) ( not ( = ?auto_2101 ?auto_2102 ) ) ( not ( = ?auto_2101 ?auto_2116 ) ) ( not ( = ?auto_2102 ?auto_2116 ) ) ( not ( = ?auto_2106 ?auto_2110 ) ) ( IS-CRATE ?auto_2101 ) ( not ( = ?auto_2115 ?auto_2104 ) ) ( HOIST-AT ?auto_2113 ?auto_2115 ) ( SURFACE-AT ?auto_2101 ?auto_2115 ) ( ON ?auto_2101 ?auto_2117 ) ( CLEAR ?auto_2101 ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2117 ) ) ( not ( = ?auto_2101 ?auto_2117 ) ) ( not ( = ?auto_2106 ?auto_2113 ) ) ( IS-CRATE ?auto_2100 ) ( AVAILABLE ?auto_2110 ) ( SURFACE-AT ?auto_2100 ?auto_2112 ) ( ON ?auto_2100 ?auto_2114 ) ( CLEAR ?auto_2100 ) ( not ( = ?auto_2099 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2114 ) ) ( not ( = ?auto_2100 ?auto_2114 ) ) ( SURFACE-AT ?auto_2098 ?auto_2104 ) ( CLEAR ?auto_2098 ) ( IS-CRATE ?auto_2099 ) ( AVAILABLE ?auto_2106 ) ( AVAILABLE ?auto_2113 ) ( SURFACE-AT ?auto_2099 ?auto_2115 ) ( ON ?auto_2099 ?auto_2111 ) ( CLEAR ?auto_2099 ) ( TRUCK-AT ?auto_2109 ?auto_2104 ) ( not ( = ?auto_2098 ?auto_2099 ) ) ( not ( = ?auto_2098 ?auto_2111 ) ) ( not ( = ?auto_2099 ?auto_2111 ) ) ( not ( = ?auto_2098 ?auto_2100 ) ) ( not ( = ?auto_2098 ?auto_2114 ) ) ( not ( = ?auto_2100 ?auto_2111 ) ) ( not ( = ?auto_2112 ?auto_2115 ) ) ( not ( = ?auto_2110 ?auto_2113 ) ) ( not ( = ?auto_2114 ?auto_2111 ) ) ( not ( = ?auto_2098 ?auto_2101 ) ) ( not ( = ?auto_2098 ?auto_2117 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( not ( = ?auto_2099 ?auto_2117 ) ) ( not ( = ?auto_2101 ?auto_2114 ) ) ( not ( = ?auto_2101 ?auto_2111 ) ) ( not ( = ?auto_2117 ?auto_2114 ) ) ( not ( = ?auto_2117 ?auto_2111 ) ) ( not ( = ?auto_2098 ?auto_2102 ) ) ( not ( = ?auto_2098 ?auto_2116 ) ) ( not ( = ?auto_2099 ?auto_2102 ) ) ( not ( = ?auto_2099 ?auto_2116 ) ) ( not ( = ?auto_2100 ?auto_2102 ) ) ( not ( = ?auto_2100 ?auto_2116 ) ) ( not ( = ?auto_2102 ?auto_2117 ) ) ( not ( = ?auto_2102 ?auto_2114 ) ) ( not ( = ?auto_2102 ?auto_2111 ) ) ( not ( = ?auto_2116 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2114 ) ) ( not ( = ?auto_2116 ?auto_2111 ) ) ( not ( = ?auto_2098 ?auto_2103 ) ) ( not ( = ?auto_2098 ?auto_2107 ) ) ( not ( = ?auto_2099 ?auto_2103 ) ) ( not ( = ?auto_2099 ?auto_2107 ) ) ( not ( = ?auto_2100 ?auto_2103 ) ) ( not ( = ?auto_2100 ?auto_2107 ) ) ( not ( = ?auto_2101 ?auto_2103 ) ) ( not ( = ?auto_2101 ?auto_2107 ) ) ( not ( = ?auto_2103 ?auto_2116 ) ) ( not ( = ?auto_2103 ?auto_2117 ) ) ( not ( = ?auto_2103 ?auto_2114 ) ) ( not ( = ?auto_2103 ?auto_2111 ) ) ( not ( = ?auto_2105 ?auto_2112 ) ) ( not ( = ?auto_2105 ?auto_2115 ) ) ( not ( = ?auto_2108 ?auto_2110 ) ) ( not ( = ?auto_2108 ?auto_2113 ) ) ( not ( = ?auto_2107 ?auto_2116 ) ) ( not ( = ?auto_2107 ?auto_2117 ) ) ( not ( = ?auto_2107 ?auto_2114 ) ) ( not ( = ?auto_2107 ?auto_2111 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2098 ?auto_2099 ?auto_2100 ?auto_2101 ?auto_2102 )
      ( MAKE-1CRATE ?auto_2102 ?auto_2103 )
      ( MAKE-5CRATE-VERIFY ?auto_2098 ?auto_2099 ?auto_2100 ?auto_2101 ?auto_2102 ?auto_2103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2120 - SURFACE
      ?auto_2121 - SURFACE
    )
    :vars
    (
      ?auto_2122 - HOIST
      ?auto_2123 - PLACE
      ?auto_2125 - PLACE
      ?auto_2126 - HOIST
      ?auto_2127 - SURFACE
      ?auto_2124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2122 ?auto_2123 ) ( SURFACE-AT ?auto_2120 ?auto_2123 ) ( CLEAR ?auto_2120 ) ( IS-CRATE ?auto_2121 ) ( AVAILABLE ?auto_2122 ) ( not ( = ?auto_2125 ?auto_2123 ) ) ( HOIST-AT ?auto_2126 ?auto_2125 ) ( AVAILABLE ?auto_2126 ) ( SURFACE-AT ?auto_2121 ?auto_2125 ) ( ON ?auto_2121 ?auto_2127 ) ( CLEAR ?auto_2121 ) ( TRUCK-AT ?auto_2124 ?auto_2123 ) ( not ( = ?auto_2120 ?auto_2121 ) ) ( not ( = ?auto_2120 ?auto_2127 ) ) ( not ( = ?auto_2121 ?auto_2127 ) ) ( not ( = ?auto_2122 ?auto_2126 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2124 ?auto_2123 ?auto_2125 )
      ( !LIFT ?auto_2126 ?auto_2121 ?auto_2127 ?auto_2125 )
      ( !LOAD ?auto_2126 ?auto_2121 ?auto_2124 ?auto_2125 )
      ( !DRIVE ?auto_2124 ?auto_2125 ?auto_2123 )
      ( !UNLOAD ?auto_2122 ?auto_2121 ?auto_2124 ?auto_2123 )
      ( !DROP ?auto_2122 ?auto_2121 ?auto_2120 ?auto_2123 )
      ( MAKE-1CRATE-VERIFY ?auto_2120 ?auto_2121 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2135 - SURFACE
      ?auto_2136 - SURFACE
      ?auto_2137 - SURFACE
      ?auto_2138 - SURFACE
      ?auto_2139 - SURFACE
      ?auto_2140 - SURFACE
      ?auto_2141 - SURFACE
    )
    :vars
    (
      ?auto_2142 - HOIST
      ?auto_2147 - PLACE
      ?auto_2143 - PLACE
      ?auto_2146 - HOIST
      ?auto_2145 - SURFACE
      ?auto_2149 - PLACE
      ?auto_2148 - HOIST
      ?auto_2153 - SURFACE
      ?auto_2156 - PLACE
      ?auto_2154 - HOIST
      ?auto_2151 - SURFACE
      ?auto_2152 - SURFACE
      ?auto_2150 - SURFACE
      ?auto_2155 - SURFACE
      ?auto_2144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142 ?auto_2147 ) ( IS-CRATE ?auto_2141 ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( HOIST-AT ?auto_2146 ?auto_2143 ) ( SURFACE-AT ?auto_2141 ?auto_2143 ) ( ON ?auto_2141 ?auto_2145 ) ( CLEAR ?auto_2141 ) ( not ( = ?auto_2140 ?auto_2141 ) ) ( not ( = ?auto_2140 ?auto_2145 ) ) ( not ( = ?auto_2141 ?auto_2145 ) ) ( not ( = ?auto_2142 ?auto_2146 ) ) ( IS-CRATE ?auto_2140 ) ( not ( = ?auto_2149 ?auto_2147 ) ) ( HOIST-AT ?auto_2148 ?auto_2149 ) ( AVAILABLE ?auto_2148 ) ( SURFACE-AT ?auto_2140 ?auto_2149 ) ( ON ?auto_2140 ?auto_2153 ) ( CLEAR ?auto_2140 ) ( not ( = ?auto_2139 ?auto_2140 ) ) ( not ( = ?auto_2139 ?auto_2153 ) ) ( not ( = ?auto_2140 ?auto_2153 ) ) ( not ( = ?auto_2142 ?auto_2148 ) ) ( IS-CRATE ?auto_2139 ) ( not ( = ?auto_2156 ?auto_2147 ) ) ( HOIST-AT ?auto_2154 ?auto_2156 ) ( SURFACE-AT ?auto_2139 ?auto_2156 ) ( ON ?auto_2139 ?auto_2151 ) ( CLEAR ?auto_2139 ) ( not ( = ?auto_2138 ?auto_2139 ) ) ( not ( = ?auto_2138 ?auto_2151 ) ) ( not ( = ?auto_2139 ?auto_2151 ) ) ( not ( = ?auto_2142 ?auto_2154 ) ) ( IS-CRATE ?auto_2138 ) ( SURFACE-AT ?auto_2138 ?auto_2143 ) ( ON ?auto_2138 ?auto_2152 ) ( CLEAR ?auto_2138 ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( not ( = ?auto_2137 ?auto_2152 ) ) ( not ( = ?auto_2138 ?auto_2152 ) ) ( IS-CRATE ?auto_2137 ) ( AVAILABLE ?auto_2154 ) ( SURFACE-AT ?auto_2137 ?auto_2156 ) ( ON ?auto_2137 ?auto_2150 ) ( CLEAR ?auto_2137 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2150 ) ) ( not ( = ?auto_2137 ?auto_2150 ) ) ( SURFACE-AT ?auto_2135 ?auto_2147 ) ( CLEAR ?auto_2135 ) ( IS-CRATE ?auto_2136 ) ( AVAILABLE ?auto_2142 ) ( AVAILABLE ?auto_2146 ) ( SURFACE-AT ?auto_2136 ?auto_2143 ) ( ON ?auto_2136 ?auto_2155 ) ( CLEAR ?auto_2136 ) ( TRUCK-AT ?auto_2144 ?auto_2147 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2155 ) ) ( not ( = ?auto_2136 ?auto_2155 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2150 ) ) ( not ( = ?auto_2137 ?auto_2155 ) ) ( not ( = ?auto_2156 ?auto_2143 ) ) ( not ( = ?auto_2154 ?auto_2146 ) ) ( not ( = ?auto_2150 ?auto_2155 ) ) ( not ( = ?auto_2135 ?auto_2138 ) ) ( not ( = ?auto_2135 ?auto_2152 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2136 ?auto_2152 ) ) ( not ( = ?auto_2138 ?auto_2150 ) ) ( not ( = ?auto_2138 ?auto_2155 ) ) ( not ( = ?auto_2152 ?auto_2150 ) ) ( not ( = ?auto_2152 ?auto_2155 ) ) ( not ( = ?auto_2135 ?auto_2139 ) ) ( not ( = ?auto_2135 ?auto_2151 ) ) ( not ( = ?auto_2136 ?auto_2139 ) ) ( not ( = ?auto_2136 ?auto_2151 ) ) ( not ( = ?auto_2137 ?auto_2139 ) ) ( not ( = ?auto_2137 ?auto_2151 ) ) ( not ( = ?auto_2139 ?auto_2152 ) ) ( not ( = ?auto_2139 ?auto_2150 ) ) ( not ( = ?auto_2139 ?auto_2155 ) ) ( not ( = ?auto_2151 ?auto_2152 ) ) ( not ( = ?auto_2151 ?auto_2150 ) ) ( not ( = ?auto_2151 ?auto_2155 ) ) ( not ( = ?auto_2135 ?auto_2140 ) ) ( not ( = ?auto_2135 ?auto_2153 ) ) ( not ( = ?auto_2136 ?auto_2140 ) ) ( not ( = ?auto_2136 ?auto_2153 ) ) ( not ( = ?auto_2137 ?auto_2140 ) ) ( not ( = ?auto_2137 ?auto_2153 ) ) ( not ( = ?auto_2138 ?auto_2140 ) ) ( not ( = ?auto_2138 ?auto_2153 ) ) ( not ( = ?auto_2140 ?auto_2151 ) ) ( not ( = ?auto_2140 ?auto_2152 ) ) ( not ( = ?auto_2140 ?auto_2150 ) ) ( not ( = ?auto_2140 ?auto_2155 ) ) ( not ( = ?auto_2149 ?auto_2156 ) ) ( not ( = ?auto_2149 ?auto_2143 ) ) ( not ( = ?auto_2148 ?auto_2154 ) ) ( not ( = ?auto_2148 ?auto_2146 ) ) ( not ( = ?auto_2153 ?auto_2151 ) ) ( not ( = ?auto_2153 ?auto_2152 ) ) ( not ( = ?auto_2153 ?auto_2150 ) ) ( not ( = ?auto_2153 ?auto_2155 ) ) ( not ( = ?auto_2135 ?auto_2141 ) ) ( not ( = ?auto_2135 ?auto_2145 ) ) ( not ( = ?auto_2136 ?auto_2141 ) ) ( not ( = ?auto_2136 ?auto_2145 ) ) ( not ( = ?auto_2137 ?auto_2141 ) ) ( not ( = ?auto_2137 ?auto_2145 ) ) ( not ( = ?auto_2138 ?auto_2141 ) ) ( not ( = ?auto_2138 ?auto_2145 ) ) ( not ( = ?auto_2139 ?auto_2141 ) ) ( not ( = ?auto_2139 ?auto_2145 ) ) ( not ( = ?auto_2141 ?auto_2153 ) ) ( not ( = ?auto_2141 ?auto_2151 ) ) ( not ( = ?auto_2141 ?auto_2152 ) ) ( not ( = ?auto_2141 ?auto_2150 ) ) ( not ( = ?auto_2141 ?auto_2155 ) ) ( not ( = ?auto_2145 ?auto_2153 ) ) ( not ( = ?auto_2145 ?auto_2151 ) ) ( not ( = ?auto_2145 ?auto_2152 ) ) ( not ( = ?auto_2145 ?auto_2150 ) ) ( not ( = ?auto_2145 ?auto_2155 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2138 ?auto_2139 ?auto_2140 )
      ( MAKE-1CRATE ?auto_2140 ?auto_2141 )
      ( MAKE-6CRATE-VERIFY ?auto_2135 ?auto_2136 ?auto_2137 ?auto_2138 ?auto_2139 ?auto_2140 ?auto_2141 ) )
  )

)

