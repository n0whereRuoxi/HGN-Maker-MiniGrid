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
      ?auto_1978 - SURFACE
      ?auto_1979 - SURFACE
    )
    :vars
    (
      ?auto_1980 - HOIST
      ?auto_1981 - PLACE
      ?auto_1983 - PLACE
      ?auto_1984 - HOIST
      ?auto_1985 - SURFACE
      ?auto_1982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1980 ?auto_1981 ) ( SURFACE-AT ?auto_1978 ?auto_1981 ) ( CLEAR ?auto_1978 ) ( IS-CRATE ?auto_1979 ) ( AVAILABLE ?auto_1980 ) ( not ( = ?auto_1983 ?auto_1981 ) ) ( HOIST-AT ?auto_1984 ?auto_1983 ) ( AVAILABLE ?auto_1984 ) ( SURFACE-AT ?auto_1979 ?auto_1983 ) ( ON ?auto_1979 ?auto_1985 ) ( CLEAR ?auto_1979 ) ( TRUCK-AT ?auto_1982 ?auto_1981 ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( not ( = ?auto_1978 ?auto_1985 ) ) ( not ( = ?auto_1979 ?auto_1985 ) ) ( not ( = ?auto_1980 ?auto_1984 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1982 ?auto_1981 ?auto_1983 )
      ( !LIFT ?auto_1984 ?auto_1979 ?auto_1985 ?auto_1983 )
      ( !LOAD ?auto_1984 ?auto_1979 ?auto_1982 ?auto_1983 )
      ( !DRIVE ?auto_1982 ?auto_1983 ?auto_1981 )
      ( !UNLOAD ?auto_1980 ?auto_1979 ?auto_1982 ?auto_1981 )
      ( !DROP ?auto_1980 ?auto_1979 ?auto_1978 ?auto_1981 )
      ( MAKE-1CRATE-VERIFY ?auto_1978 ?auto_1979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1999 - SURFACE
      ?auto_2000 - SURFACE
      ?auto_2001 - SURFACE
    )
    :vars
    (
      ?auto_2006 - HOIST
      ?auto_2005 - PLACE
      ?auto_2004 - PLACE
      ?auto_2002 - HOIST
      ?auto_2003 - SURFACE
      ?auto_2009 - PLACE
      ?auto_2010 - HOIST
      ?auto_2008 - SURFACE
      ?auto_2007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2006 ?auto_2005 ) ( IS-CRATE ?auto_2001 ) ( not ( = ?auto_2004 ?auto_2005 ) ) ( HOIST-AT ?auto_2002 ?auto_2004 ) ( AVAILABLE ?auto_2002 ) ( SURFACE-AT ?auto_2001 ?auto_2004 ) ( ON ?auto_2001 ?auto_2003 ) ( CLEAR ?auto_2001 ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( not ( = ?auto_2000 ?auto_2003 ) ) ( not ( = ?auto_2001 ?auto_2003 ) ) ( not ( = ?auto_2006 ?auto_2002 ) ) ( SURFACE-AT ?auto_1999 ?auto_2005 ) ( CLEAR ?auto_1999 ) ( IS-CRATE ?auto_2000 ) ( AVAILABLE ?auto_2006 ) ( not ( = ?auto_2009 ?auto_2005 ) ) ( HOIST-AT ?auto_2010 ?auto_2009 ) ( AVAILABLE ?auto_2010 ) ( SURFACE-AT ?auto_2000 ?auto_2009 ) ( ON ?auto_2000 ?auto_2008 ) ( CLEAR ?auto_2000 ) ( TRUCK-AT ?auto_2007 ?auto_2005 ) ( not ( = ?auto_1999 ?auto_2000 ) ) ( not ( = ?auto_1999 ?auto_2008 ) ) ( not ( = ?auto_2000 ?auto_2008 ) ) ( not ( = ?auto_2006 ?auto_2010 ) ) ( not ( = ?auto_1999 ?auto_2001 ) ) ( not ( = ?auto_1999 ?auto_2003 ) ) ( not ( = ?auto_2001 ?auto_2008 ) ) ( not ( = ?auto_2004 ?auto_2009 ) ) ( not ( = ?auto_2002 ?auto_2010 ) ) ( not ( = ?auto_2003 ?auto_2008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1999 ?auto_2000 )
      ( MAKE-1CRATE ?auto_2000 ?auto_2001 )
      ( MAKE-2CRATE-VERIFY ?auto_1999 ?auto_2000 ?auto_2001 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2025 - SURFACE
      ?auto_2026 - SURFACE
      ?auto_2027 - SURFACE
      ?auto_2028 - SURFACE
    )
    :vars
    (
      ?auto_2033 - HOIST
      ?auto_2032 - PLACE
      ?auto_2034 - PLACE
      ?auto_2030 - HOIST
      ?auto_2029 - SURFACE
      ?auto_2036 - PLACE
      ?auto_2035 - HOIST
      ?auto_2037 - SURFACE
      ?auto_2039 - PLACE
      ?auto_2040 - HOIST
      ?auto_2038 - SURFACE
      ?auto_2031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2033 ?auto_2032 ) ( IS-CRATE ?auto_2028 ) ( not ( = ?auto_2034 ?auto_2032 ) ) ( HOIST-AT ?auto_2030 ?auto_2034 ) ( AVAILABLE ?auto_2030 ) ( SURFACE-AT ?auto_2028 ?auto_2034 ) ( ON ?auto_2028 ?auto_2029 ) ( CLEAR ?auto_2028 ) ( not ( = ?auto_2027 ?auto_2028 ) ) ( not ( = ?auto_2027 ?auto_2029 ) ) ( not ( = ?auto_2028 ?auto_2029 ) ) ( not ( = ?auto_2033 ?auto_2030 ) ) ( IS-CRATE ?auto_2027 ) ( not ( = ?auto_2036 ?auto_2032 ) ) ( HOIST-AT ?auto_2035 ?auto_2036 ) ( AVAILABLE ?auto_2035 ) ( SURFACE-AT ?auto_2027 ?auto_2036 ) ( ON ?auto_2027 ?auto_2037 ) ( CLEAR ?auto_2027 ) ( not ( = ?auto_2026 ?auto_2027 ) ) ( not ( = ?auto_2026 ?auto_2037 ) ) ( not ( = ?auto_2027 ?auto_2037 ) ) ( not ( = ?auto_2033 ?auto_2035 ) ) ( SURFACE-AT ?auto_2025 ?auto_2032 ) ( CLEAR ?auto_2025 ) ( IS-CRATE ?auto_2026 ) ( AVAILABLE ?auto_2033 ) ( not ( = ?auto_2039 ?auto_2032 ) ) ( HOIST-AT ?auto_2040 ?auto_2039 ) ( AVAILABLE ?auto_2040 ) ( SURFACE-AT ?auto_2026 ?auto_2039 ) ( ON ?auto_2026 ?auto_2038 ) ( CLEAR ?auto_2026 ) ( TRUCK-AT ?auto_2031 ?auto_2032 ) ( not ( = ?auto_2025 ?auto_2026 ) ) ( not ( = ?auto_2025 ?auto_2038 ) ) ( not ( = ?auto_2026 ?auto_2038 ) ) ( not ( = ?auto_2033 ?auto_2040 ) ) ( not ( = ?auto_2025 ?auto_2027 ) ) ( not ( = ?auto_2025 ?auto_2037 ) ) ( not ( = ?auto_2027 ?auto_2038 ) ) ( not ( = ?auto_2036 ?auto_2039 ) ) ( not ( = ?auto_2035 ?auto_2040 ) ) ( not ( = ?auto_2037 ?auto_2038 ) ) ( not ( = ?auto_2025 ?auto_2028 ) ) ( not ( = ?auto_2025 ?auto_2029 ) ) ( not ( = ?auto_2026 ?auto_2028 ) ) ( not ( = ?auto_2026 ?auto_2029 ) ) ( not ( = ?auto_2028 ?auto_2037 ) ) ( not ( = ?auto_2028 ?auto_2038 ) ) ( not ( = ?auto_2034 ?auto_2036 ) ) ( not ( = ?auto_2034 ?auto_2039 ) ) ( not ( = ?auto_2030 ?auto_2035 ) ) ( not ( = ?auto_2030 ?auto_2040 ) ) ( not ( = ?auto_2029 ?auto_2037 ) ) ( not ( = ?auto_2029 ?auto_2038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025 ?auto_2026 ?auto_2027 )
      ( MAKE-1CRATE ?auto_2027 ?auto_2028 )
      ( MAKE-3CRATE-VERIFY ?auto_2025 ?auto_2026 ?auto_2027 ?auto_2028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2056 - SURFACE
      ?auto_2057 - SURFACE
      ?auto_2058 - SURFACE
      ?auto_2059 - SURFACE
      ?auto_2060 - SURFACE
    )
    :vars
    (
      ?auto_2064 - HOIST
      ?auto_2062 - PLACE
      ?auto_2061 - PLACE
      ?auto_2063 - HOIST
      ?auto_2066 - SURFACE
      ?auto_2068 - PLACE
      ?auto_2067 - HOIST
      ?auto_2072 - SURFACE
      ?auto_2070 - PLACE
      ?auto_2069 - HOIST
      ?auto_2073 - SURFACE
      ?auto_2074 - PLACE
      ?auto_2071 - HOIST
      ?auto_2075 - SURFACE
      ?auto_2065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2064 ?auto_2062 ) ( IS-CRATE ?auto_2060 ) ( not ( = ?auto_2061 ?auto_2062 ) ) ( HOIST-AT ?auto_2063 ?auto_2061 ) ( AVAILABLE ?auto_2063 ) ( SURFACE-AT ?auto_2060 ?auto_2061 ) ( ON ?auto_2060 ?auto_2066 ) ( CLEAR ?auto_2060 ) ( not ( = ?auto_2059 ?auto_2060 ) ) ( not ( = ?auto_2059 ?auto_2066 ) ) ( not ( = ?auto_2060 ?auto_2066 ) ) ( not ( = ?auto_2064 ?auto_2063 ) ) ( IS-CRATE ?auto_2059 ) ( not ( = ?auto_2068 ?auto_2062 ) ) ( HOIST-AT ?auto_2067 ?auto_2068 ) ( AVAILABLE ?auto_2067 ) ( SURFACE-AT ?auto_2059 ?auto_2068 ) ( ON ?auto_2059 ?auto_2072 ) ( CLEAR ?auto_2059 ) ( not ( = ?auto_2058 ?auto_2059 ) ) ( not ( = ?auto_2058 ?auto_2072 ) ) ( not ( = ?auto_2059 ?auto_2072 ) ) ( not ( = ?auto_2064 ?auto_2067 ) ) ( IS-CRATE ?auto_2058 ) ( not ( = ?auto_2070 ?auto_2062 ) ) ( HOIST-AT ?auto_2069 ?auto_2070 ) ( AVAILABLE ?auto_2069 ) ( SURFACE-AT ?auto_2058 ?auto_2070 ) ( ON ?auto_2058 ?auto_2073 ) ( CLEAR ?auto_2058 ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( not ( = ?auto_2057 ?auto_2073 ) ) ( not ( = ?auto_2058 ?auto_2073 ) ) ( not ( = ?auto_2064 ?auto_2069 ) ) ( SURFACE-AT ?auto_2056 ?auto_2062 ) ( CLEAR ?auto_2056 ) ( IS-CRATE ?auto_2057 ) ( AVAILABLE ?auto_2064 ) ( not ( = ?auto_2074 ?auto_2062 ) ) ( HOIST-AT ?auto_2071 ?auto_2074 ) ( AVAILABLE ?auto_2071 ) ( SURFACE-AT ?auto_2057 ?auto_2074 ) ( ON ?auto_2057 ?auto_2075 ) ( CLEAR ?auto_2057 ) ( TRUCK-AT ?auto_2065 ?auto_2062 ) ( not ( = ?auto_2056 ?auto_2057 ) ) ( not ( = ?auto_2056 ?auto_2075 ) ) ( not ( = ?auto_2057 ?auto_2075 ) ) ( not ( = ?auto_2064 ?auto_2071 ) ) ( not ( = ?auto_2056 ?auto_2058 ) ) ( not ( = ?auto_2056 ?auto_2073 ) ) ( not ( = ?auto_2058 ?auto_2075 ) ) ( not ( = ?auto_2070 ?auto_2074 ) ) ( not ( = ?auto_2069 ?auto_2071 ) ) ( not ( = ?auto_2073 ?auto_2075 ) ) ( not ( = ?auto_2056 ?auto_2059 ) ) ( not ( = ?auto_2056 ?auto_2072 ) ) ( not ( = ?auto_2057 ?auto_2059 ) ) ( not ( = ?auto_2057 ?auto_2072 ) ) ( not ( = ?auto_2059 ?auto_2073 ) ) ( not ( = ?auto_2059 ?auto_2075 ) ) ( not ( = ?auto_2068 ?auto_2070 ) ) ( not ( = ?auto_2068 ?auto_2074 ) ) ( not ( = ?auto_2067 ?auto_2069 ) ) ( not ( = ?auto_2067 ?auto_2071 ) ) ( not ( = ?auto_2072 ?auto_2073 ) ) ( not ( = ?auto_2072 ?auto_2075 ) ) ( not ( = ?auto_2056 ?auto_2060 ) ) ( not ( = ?auto_2056 ?auto_2066 ) ) ( not ( = ?auto_2057 ?auto_2060 ) ) ( not ( = ?auto_2057 ?auto_2066 ) ) ( not ( = ?auto_2058 ?auto_2060 ) ) ( not ( = ?auto_2058 ?auto_2066 ) ) ( not ( = ?auto_2060 ?auto_2072 ) ) ( not ( = ?auto_2060 ?auto_2073 ) ) ( not ( = ?auto_2060 ?auto_2075 ) ) ( not ( = ?auto_2061 ?auto_2068 ) ) ( not ( = ?auto_2061 ?auto_2070 ) ) ( not ( = ?auto_2061 ?auto_2074 ) ) ( not ( = ?auto_2063 ?auto_2067 ) ) ( not ( = ?auto_2063 ?auto_2069 ) ) ( not ( = ?auto_2063 ?auto_2071 ) ) ( not ( = ?auto_2066 ?auto_2072 ) ) ( not ( = ?auto_2066 ?auto_2073 ) ) ( not ( = ?auto_2066 ?auto_2075 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2056 ?auto_2057 ?auto_2058 ?auto_2059 )
      ( MAKE-1CRATE ?auto_2059 ?auto_2060 )
      ( MAKE-4CRATE-VERIFY ?auto_2056 ?auto_2057 ?auto_2058 ?auto_2059 ?auto_2060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2092 - SURFACE
      ?auto_2093 - SURFACE
      ?auto_2094 - SURFACE
      ?auto_2095 - SURFACE
      ?auto_2096 - SURFACE
      ?auto_2097 - SURFACE
    )
    :vars
    (
      ?auto_2103 - HOIST
      ?auto_2102 - PLACE
      ?auto_2101 - PLACE
      ?auto_2098 - HOIST
      ?auto_2099 - SURFACE
      ?auto_2107 - PLACE
      ?auto_2106 - HOIST
      ?auto_2105 - SURFACE
      ?auto_2110 - SURFACE
      ?auto_2104 - PLACE
      ?auto_2111 - HOIST
      ?auto_2108 - SURFACE
      ?auto_2113 - PLACE
      ?auto_2109 - HOIST
      ?auto_2112 - SURFACE
      ?auto_2100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2103 ?auto_2102 ) ( IS-CRATE ?auto_2097 ) ( not ( = ?auto_2101 ?auto_2102 ) ) ( HOIST-AT ?auto_2098 ?auto_2101 ) ( SURFACE-AT ?auto_2097 ?auto_2101 ) ( ON ?auto_2097 ?auto_2099 ) ( CLEAR ?auto_2097 ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2099 ) ) ( not ( = ?auto_2097 ?auto_2099 ) ) ( not ( = ?auto_2103 ?auto_2098 ) ) ( IS-CRATE ?auto_2096 ) ( not ( = ?auto_2107 ?auto_2102 ) ) ( HOIST-AT ?auto_2106 ?auto_2107 ) ( AVAILABLE ?auto_2106 ) ( SURFACE-AT ?auto_2096 ?auto_2107 ) ( ON ?auto_2096 ?auto_2105 ) ( CLEAR ?auto_2096 ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( not ( = ?auto_2095 ?auto_2105 ) ) ( not ( = ?auto_2096 ?auto_2105 ) ) ( not ( = ?auto_2103 ?auto_2106 ) ) ( IS-CRATE ?auto_2095 ) ( AVAILABLE ?auto_2098 ) ( SURFACE-AT ?auto_2095 ?auto_2101 ) ( ON ?auto_2095 ?auto_2110 ) ( CLEAR ?auto_2095 ) ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2094 ?auto_2110 ) ) ( not ( = ?auto_2095 ?auto_2110 ) ) ( IS-CRATE ?auto_2094 ) ( not ( = ?auto_2104 ?auto_2102 ) ) ( HOIST-AT ?auto_2111 ?auto_2104 ) ( AVAILABLE ?auto_2111 ) ( SURFACE-AT ?auto_2094 ?auto_2104 ) ( ON ?auto_2094 ?auto_2108 ) ( CLEAR ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( not ( = ?auto_2093 ?auto_2108 ) ) ( not ( = ?auto_2094 ?auto_2108 ) ) ( not ( = ?auto_2103 ?auto_2111 ) ) ( SURFACE-AT ?auto_2092 ?auto_2102 ) ( CLEAR ?auto_2092 ) ( IS-CRATE ?auto_2093 ) ( AVAILABLE ?auto_2103 ) ( not ( = ?auto_2113 ?auto_2102 ) ) ( HOIST-AT ?auto_2109 ?auto_2113 ) ( AVAILABLE ?auto_2109 ) ( SURFACE-AT ?auto_2093 ?auto_2113 ) ( ON ?auto_2093 ?auto_2112 ) ( CLEAR ?auto_2093 ) ( TRUCK-AT ?auto_2100 ?auto_2102 ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( not ( = ?auto_2092 ?auto_2112 ) ) ( not ( = ?auto_2093 ?auto_2112 ) ) ( not ( = ?auto_2103 ?auto_2109 ) ) ( not ( = ?auto_2092 ?auto_2094 ) ) ( not ( = ?auto_2092 ?auto_2108 ) ) ( not ( = ?auto_2094 ?auto_2112 ) ) ( not ( = ?auto_2104 ?auto_2113 ) ) ( not ( = ?auto_2111 ?auto_2109 ) ) ( not ( = ?auto_2108 ?auto_2112 ) ) ( not ( = ?auto_2092 ?auto_2095 ) ) ( not ( = ?auto_2092 ?auto_2110 ) ) ( not ( = ?auto_2093 ?auto_2095 ) ) ( not ( = ?auto_2093 ?auto_2110 ) ) ( not ( = ?auto_2095 ?auto_2108 ) ) ( not ( = ?auto_2095 ?auto_2112 ) ) ( not ( = ?auto_2101 ?auto_2104 ) ) ( not ( = ?auto_2101 ?auto_2113 ) ) ( not ( = ?auto_2098 ?auto_2111 ) ) ( not ( = ?auto_2098 ?auto_2109 ) ) ( not ( = ?auto_2110 ?auto_2108 ) ) ( not ( = ?auto_2110 ?auto_2112 ) ) ( not ( = ?auto_2092 ?auto_2096 ) ) ( not ( = ?auto_2092 ?auto_2105 ) ) ( not ( = ?auto_2093 ?auto_2096 ) ) ( not ( = ?auto_2093 ?auto_2105 ) ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( not ( = ?auto_2094 ?auto_2105 ) ) ( not ( = ?auto_2096 ?auto_2110 ) ) ( not ( = ?auto_2096 ?auto_2108 ) ) ( not ( = ?auto_2096 ?auto_2112 ) ) ( not ( = ?auto_2107 ?auto_2101 ) ) ( not ( = ?auto_2107 ?auto_2104 ) ) ( not ( = ?auto_2107 ?auto_2113 ) ) ( not ( = ?auto_2106 ?auto_2098 ) ) ( not ( = ?auto_2106 ?auto_2111 ) ) ( not ( = ?auto_2106 ?auto_2109 ) ) ( not ( = ?auto_2105 ?auto_2110 ) ) ( not ( = ?auto_2105 ?auto_2108 ) ) ( not ( = ?auto_2105 ?auto_2112 ) ) ( not ( = ?auto_2092 ?auto_2097 ) ) ( not ( = ?auto_2092 ?auto_2099 ) ) ( not ( = ?auto_2093 ?auto_2097 ) ) ( not ( = ?auto_2093 ?auto_2099 ) ) ( not ( = ?auto_2094 ?auto_2097 ) ) ( not ( = ?auto_2094 ?auto_2099 ) ) ( not ( = ?auto_2095 ?auto_2097 ) ) ( not ( = ?auto_2095 ?auto_2099 ) ) ( not ( = ?auto_2097 ?auto_2105 ) ) ( not ( = ?auto_2097 ?auto_2110 ) ) ( not ( = ?auto_2097 ?auto_2108 ) ) ( not ( = ?auto_2097 ?auto_2112 ) ) ( not ( = ?auto_2099 ?auto_2105 ) ) ( not ( = ?auto_2099 ?auto_2110 ) ) ( not ( = ?auto_2099 ?auto_2108 ) ) ( not ( = ?auto_2099 ?auto_2112 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2092 ?auto_2093 ?auto_2094 ?auto_2095 ?auto_2096 )
      ( MAKE-1CRATE ?auto_2096 ?auto_2097 )
      ( MAKE-5CRATE-VERIFY ?auto_2092 ?auto_2093 ?auto_2094 ?auto_2095 ?auto_2096 ?auto_2097 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131 - SURFACE
      ?auto_2132 - SURFACE
      ?auto_2133 - SURFACE
      ?auto_2134 - SURFACE
      ?auto_2135 - SURFACE
      ?auto_2136 - SURFACE
      ?auto_2137 - SURFACE
    )
    :vars
    (
      ?auto_2142 - HOIST
      ?auto_2139 - PLACE
      ?auto_2140 - PLACE
      ?auto_2138 - HOIST
      ?auto_2143 - SURFACE
      ?auto_2153 - PLACE
      ?auto_2154 - HOIST
      ?auto_2144 - SURFACE
      ?auto_2146 - PLACE
      ?auto_2152 - HOIST
      ?auto_2149 - SURFACE
      ?auto_2145 - SURFACE
      ?auto_2148 - SURFACE
      ?auto_2147 - PLACE
      ?auto_2151 - HOIST
      ?auto_2150 - SURFACE
      ?auto_2141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142 ?auto_2139 ) ( IS-CRATE ?auto_2137 ) ( not ( = ?auto_2140 ?auto_2139 ) ) ( HOIST-AT ?auto_2138 ?auto_2140 ) ( SURFACE-AT ?auto_2137 ?auto_2140 ) ( ON ?auto_2137 ?auto_2143 ) ( CLEAR ?auto_2137 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2143 ) ) ( not ( = ?auto_2137 ?auto_2143 ) ) ( not ( = ?auto_2142 ?auto_2138 ) ) ( IS-CRATE ?auto_2136 ) ( not ( = ?auto_2153 ?auto_2139 ) ) ( HOIST-AT ?auto_2154 ?auto_2153 ) ( SURFACE-AT ?auto_2136 ?auto_2153 ) ( ON ?auto_2136 ?auto_2144 ) ( CLEAR ?auto_2136 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2144 ) ) ( not ( = ?auto_2136 ?auto_2144 ) ) ( not ( = ?auto_2142 ?auto_2154 ) ) ( IS-CRATE ?auto_2135 ) ( not ( = ?auto_2146 ?auto_2139 ) ) ( HOIST-AT ?auto_2152 ?auto_2146 ) ( AVAILABLE ?auto_2152 ) ( SURFACE-AT ?auto_2135 ?auto_2146 ) ( ON ?auto_2135 ?auto_2149 ) ( CLEAR ?auto_2135 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2149 ) ) ( not ( = ?auto_2135 ?auto_2149 ) ) ( not ( = ?auto_2142 ?auto_2152 ) ) ( IS-CRATE ?auto_2134 ) ( AVAILABLE ?auto_2154 ) ( SURFACE-AT ?auto_2134 ?auto_2153 ) ( ON ?auto_2134 ?auto_2145 ) ( CLEAR ?auto_2134 ) ( not ( = ?auto_2133 ?auto_2134 ) ) ( not ( = ?auto_2133 ?auto_2145 ) ) ( not ( = ?auto_2134 ?auto_2145 ) ) ( IS-CRATE ?auto_2133 ) ( AVAILABLE ?auto_2138 ) ( SURFACE-AT ?auto_2133 ?auto_2140 ) ( ON ?auto_2133 ?auto_2148 ) ( CLEAR ?auto_2133 ) ( not ( = ?auto_2132 ?auto_2133 ) ) ( not ( = ?auto_2132 ?auto_2148 ) ) ( not ( = ?auto_2133 ?auto_2148 ) ) ( SURFACE-AT ?auto_2131 ?auto_2139 ) ( CLEAR ?auto_2131 ) ( IS-CRATE ?auto_2132 ) ( AVAILABLE ?auto_2142 ) ( not ( = ?auto_2147 ?auto_2139 ) ) ( HOIST-AT ?auto_2151 ?auto_2147 ) ( AVAILABLE ?auto_2151 ) ( SURFACE-AT ?auto_2132 ?auto_2147 ) ( ON ?auto_2132 ?auto_2150 ) ( CLEAR ?auto_2132 ) ( TRUCK-AT ?auto_2141 ?auto_2139 ) ( not ( = ?auto_2131 ?auto_2132 ) ) ( not ( = ?auto_2131 ?auto_2150 ) ) ( not ( = ?auto_2132 ?auto_2150 ) ) ( not ( = ?auto_2142 ?auto_2151 ) ) ( not ( = ?auto_2131 ?auto_2133 ) ) ( not ( = ?auto_2131 ?auto_2148 ) ) ( not ( = ?auto_2133 ?auto_2150 ) ) ( not ( = ?auto_2140 ?auto_2147 ) ) ( not ( = ?auto_2138 ?auto_2151 ) ) ( not ( = ?auto_2148 ?auto_2150 ) ) ( not ( = ?auto_2131 ?auto_2134 ) ) ( not ( = ?auto_2131 ?auto_2145 ) ) ( not ( = ?auto_2132 ?auto_2134 ) ) ( not ( = ?auto_2132 ?auto_2145 ) ) ( not ( = ?auto_2134 ?auto_2148 ) ) ( not ( = ?auto_2134 ?auto_2150 ) ) ( not ( = ?auto_2153 ?auto_2140 ) ) ( not ( = ?auto_2153 ?auto_2147 ) ) ( not ( = ?auto_2154 ?auto_2138 ) ) ( not ( = ?auto_2154 ?auto_2151 ) ) ( not ( = ?auto_2145 ?auto_2148 ) ) ( not ( = ?auto_2145 ?auto_2150 ) ) ( not ( = ?auto_2131 ?auto_2135 ) ) ( not ( = ?auto_2131 ?auto_2149 ) ) ( not ( = ?auto_2132 ?auto_2135 ) ) ( not ( = ?auto_2132 ?auto_2149 ) ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( not ( = ?auto_2133 ?auto_2149 ) ) ( not ( = ?auto_2135 ?auto_2145 ) ) ( not ( = ?auto_2135 ?auto_2148 ) ) ( not ( = ?auto_2135 ?auto_2150 ) ) ( not ( = ?auto_2146 ?auto_2153 ) ) ( not ( = ?auto_2146 ?auto_2140 ) ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( not ( = ?auto_2152 ?auto_2154 ) ) ( not ( = ?auto_2152 ?auto_2138 ) ) ( not ( = ?auto_2152 ?auto_2151 ) ) ( not ( = ?auto_2149 ?auto_2145 ) ) ( not ( = ?auto_2149 ?auto_2148 ) ) ( not ( = ?auto_2149 ?auto_2150 ) ) ( not ( = ?auto_2131 ?auto_2136 ) ) ( not ( = ?auto_2131 ?auto_2144 ) ) ( not ( = ?auto_2132 ?auto_2136 ) ) ( not ( = ?auto_2132 ?auto_2144 ) ) ( not ( = ?auto_2133 ?auto_2136 ) ) ( not ( = ?auto_2133 ?auto_2144 ) ) ( not ( = ?auto_2134 ?auto_2136 ) ) ( not ( = ?auto_2134 ?auto_2144 ) ) ( not ( = ?auto_2136 ?auto_2149 ) ) ( not ( = ?auto_2136 ?auto_2145 ) ) ( not ( = ?auto_2136 ?auto_2148 ) ) ( not ( = ?auto_2136 ?auto_2150 ) ) ( not ( = ?auto_2144 ?auto_2149 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( not ( = ?auto_2144 ?auto_2148 ) ) ( not ( = ?auto_2144 ?auto_2150 ) ) ( not ( = ?auto_2131 ?auto_2137 ) ) ( not ( = ?auto_2131 ?auto_2143 ) ) ( not ( = ?auto_2132 ?auto_2137 ) ) ( not ( = ?auto_2132 ?auto_2143 ) ) ( not ( = ?auto_2133 ?auto_2137 ) ) ( not ( = ?auto_2133 ?auto_2143 ) ) ( not ( = ?auto_2134 ?auto_2137 ) ) ( not ( = ?auto_2134 ?auto_2143 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2143 ) ) ( not ( = ?auto_2137 ?auto_2144 ) ) ( not ( = ?auto_2137 ?auto_2149 ) ) ( not ( = ?auto_2137 ?auto_2145 ) ) ( not ( = ?auto_2137 ?auto_2148 ) ) ( not ( = ?auto_2137 ?auto_2150 ) ) ( not ( = ?auto_2143 ?auto_2144 ) ) ( not ( = ?auto_2143 ?auto_2149 ) ) ( not ( = ?auto_2143 ?auto_2145 ) ) ( not ( = ?auto_2143 ?auto_2148 ) ) ( not ( = ?auto_2143 ?auto_2150 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2131 ?auto_2132 ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 )
      ( MAKE-1CRATE ?auto_2136 ?auto_2137 )
      ( MAKE-6CRATE-VERIFY ?auto_2131 ?auto_2132 ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2137 ) )
  )

)

