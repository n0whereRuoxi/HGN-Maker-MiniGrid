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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1988 - SURFACE
      ?auto_1989 - SURFACE
    )
    :vars
    (
      ?auto_1990 - HOIST
      ?auto_1991 - PLACE
      ?auto_1993 - PLACE
      ?auto_1994 - HOIST
      ?auto_1995 - SURFACE
      ?auto_1992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1990 ?auto_1991 ) ( SURFACE-AT ?auto_1988 ?auto_1991 ) ( CLEAR ?auto_1988 ) ( IS-CRATE ?auto_1989 ) ( AVAILABLE ?auto_1990 ) ( not ( = ?auto_1993 ?auto_1991 ) ) ( HOIST-AT ?auto_1994 ?auto_1993 ) ( AVAILABLE ?auto_1994 ) ( SURFACE-AT ?auto_1989 ?auto_1993 ) ( ON ?auto_1989 ?auto_1995 ) ( CLEAR ?auto_1989 ) ( TRUCK-AT ?auto_1992 ?auto_1991 ) ( not ( = ?auto_1988 ?auto_1989 ) ) ( not ( = ?auto_1988 ?auto_1995 ) ) ( not ( = ?auto_1989 ?auto_1995 ) ) ( not ( = ?auto_1990 ?auto_1994 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1992 ?auto_1991 ?auto_1993 )
      ( !LIFT ?auto_1994 ?auto_1989 ?auto_1995 ?auto_1993 )
      ( !LOAD ?auto_1994 ?auto_1989 ?auto_1992 ?auto_1993 )
      ( !DRIVE ?auto_1992 ?auto_1993 ?auto_1991 )
      ( !UNLOAD ?auto_1990 ?auto_1989 ?auto_1992 ?auto_1991 )
      ( !DROP ?auto_1990 ?auto_1989 ?auto_1988 ?auto_1991 )
      ( MAKE-1CRATE-VERIFY ?auto_1988 ?auto_1989 ) )
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
      ?auto_2003 - HOIST
      ?auto_2002 - PLACE
      ?auto_2006 - PLACE
      ?auto_2007 - HOIST
      ?auto_2005 - SURFACE
      ?auto_2008 - PLACE
      ?auto_2010 - HOIST
      ?auto_2009 - SURFACE
      ?auto_2004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2003 ?auto_2002 ) ( IS-CRATE ?auto_2001 ) ( not ( = ?auto_2006 ?auto_2002 ) ) ( HOIST-AT ?auto_2007 ?auto_2006 ) ( AVAILABLE ?auto_2007 ) ( SURFACE-AT ?auto_2001 ?auto_2006 ) ( ON ?auto_2001 ?auto_2005 ) ( CLEAR ?auto_2001 ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( not ( = ?auto_2000 ?auto_2005 ) ) ( not ( = ?auto_2001 ?auto_2005 ) ) ( not ( = ?auto_2003 ?auto_2007 ) ) ( SURFACE-AT ?auto_1999 ?auto_2002 ) ( CLEAR ?auto_1999 ) ( IS-CRATE ?auto_2000 ) ( AVAILABLE ?auto_2003 ) ( not ( = ?auto_2008 ?auto_2002 ) ) ( HOIST-AT ?auto_2010 ?auto_2008 ) ( AVAILABLE ?auto_2010 ) ( SURFACE-AT ?auto_2000 ?auto_2008 ) ( ON ?auto_2000 ?auto_2009 ) ( CLEAR ?auto_2000 ) ( TRUCK-AT ?auto_2004 ?auto_2002 ) ( not ( = ?auto_1999 ?auto_2000 ) ) ( not ( = ?auto_1999 ?auto_2009 ) ) ( not ( = ?auto_2000 ?auto_2009 ) ) ( not ( = ?auto_2003 ?auto_2010 ) ) ( not ( = ?auto_1999 ?auto_2001 ) ) ( not ( = ?auto_1999 ?auto_2005 ) ) ( not ( = ?auto_2001 ?auto_2009 ) ) ( not ( = ?auto_2006 ?auto_2008 ) ) ( not ( = ?auto_2007 ?auto_2010 ) ) ( not ( = ?auto_2005 ?auto_2009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1999 ?auto_2000 )
      ( MAKE-1CRATE ?auto_2000 ?auto_2001 )
      ( MAKE-2CRATE-VERIFY ?auto_1999 ?auto_2000 ?auto_2001 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2013 - SURFACE
      ?auto_2014 - SURFACE
    )
    :vars
    (
      ?auto_2015 - HOIST
      ?auto_2016 - PLACE
      ?auto_2018 - PLACE
      ?auto_2019 - HOIST
      ?auto_2020 - SURFACE
      ?auto_2017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2015 ?auto_2016 ) ( SURFACE-AT ?auto_2013 ?auto_2016 ) ( CLEAR ?auto_2013 ) ( IS-CRATE ?auto_2014 ) ( AVAILABLE ?auto_2015 ) ( not ( = ?auto_2018 ?auto_2016 ) ) ( HOIST-AT ?auto_2019 ?auto_2018 ) ( AVAILABLE ?auto_2019 ) ( SURFACE-AT ?auto_2014 ?auto_2018 ) ( ON ?auto_2014 ?auto_2020 ) ( CLEAR ?auto_2014 ) ( TRUCK-AT ?auto_2017 ?auto_2016 ) ( not ( = ?auto_2013 ?auto_2014 ) ) ( not ( = ?auto_2013 ?auto_2020 ) ) ( not ( = ?auto_2014 ?auto_2020 ) ) ( not ( = ?auto_2015 ?auto_2019 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2017 ?auto_2016 ?auto_2018 )
      ( !LIFT ?auto_2019 ?auto_2014 ?auto_2020 ?auto_2018 )
      ( !LOAD ?auto_2019 ?auto_2014 ?auto_2017 ?auto_2018 )
      ( !DRIVE ?auto_2017 ?auto_2018 ?auto_2016 )
      ( !UNLOAD ?auto_2015 ?auto_2014 ?auto_2017 ?auto_2016 )
      ( !DROP ?auto_2015 ?auto_2014 ?auto_2013 ?auto_2016 )
      ( MAKE-1CRATE-VERIFY ?auto_2013 ?auto_2014 ) )
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
      ?auto_2029 - HOIST
      ?auto_2034 - PLACE
      ?auto_2030 - PLACE
      ?auto_2033 - HOIST
      ?auto_2031 - SURFACE
      ?auto_2039 - PLACE
      ?auto_2037 - HOIST
      ?auto_2038 - SURFACE
      ?auto_2035 - PLACE
      ?auto_2040 - HOIST
      ?auto_2036 - SURFACE
      ?auto_2032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2029 ?auto_2034 ) ( IS-CRATE ?auto_2028 ) ( not ( = ?auto_2030 ?auto_2034 ) ) ( HOIST-AT ?auto_2033 ?auto_2030 ) ( AVAILABLE ?auto_2033 ) ( SURFACE-AT ?auto_2028 ?auto_2030 ) ( ON ?auto_2028 ?auto_2031 ) ( CLEAR ?auto_2028 ) ( not ( = ?auto_2027 ?auto_2028 ) ) ( not ( = ?auto_2027 ?auto_2031 ) ) ( not ( = ?auto_2028 ?auto_2031 ) ) ( not ( = ?auto_2029 ?auto_2033 ) ) ( IS-CRATE ?auto_2027 ) ( not ( = ?auto_2039 ?auto_2034 ) ) ( HOIST-AT ?auto_2037 ?auto_2039 ) ( AVAILABLE ?auto_2037 ) ( SURFACE-AT ?auto_2027 ?auto_2039 ) ( ON ?auto_2027 ?auto_2038 ) ( CLEAR ?auto_2027 ) ( not ( = ?auto_2026 ?auto_2027 ) ) ( not ( = ?auto_2026 ?auto_2038 ) ) ( not ( = ?auto_2027 ?auto_2038 ) ) ( not ( = ?auto_2029 ?auto_2037 ) ) ( SURFACE-AT ?auto_2025 ?auto_2034 ) ( CLEAR ?auto_2025 ) ( IS-CRATE ?auto_2026 ) ( AVAILABLE ?auto_2029 ) ( not ( = ?auto_2035 ?auto_2034 ) ) ( HOIST-AT ?auto_2040 ?auto_2035 ) ( AVAILABLE ?auto_2040 ) ( SURFACE-AT ?auto_2026 ?auto_2035 ) ( ON ?auto_2026 ?auto_2036 ) ( CLEAR ?auto_2026 ) ( TRUCK-AT ?auto_2032 ?auto_2034 ) ( not ( = ?auto_2025 ?auto_2026 ) ) ( not ( = ?auto_2025 ?auto_2036 ) ) ( not ( = ?auto_2026 ?auto_2036 ) ) ( not ( = ?auto_2029 ?auto_2040 ) ) ( not ( = ?auto_2025 ?auto_2027 ) ) ( not ( = ?auto_2025 ?auto_2038 ) ) ( not ( = ?auto_2027 ?auto_2036 ) ) ( not ( = ?auto_2039 ?auto_2035 ) ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( not ( = ?auto_2038 ?auto_2036 ) ) ( not ( = ?auto_2025 ?auto_2028 ) ) ( not ( = ?auto_2025 ?auto_2031 ) ) ( not ( = ?auto_2026 ?auto_2028 ) ) ( not ( = ?auto_2026 ?auto_2031 ) ) ( not ( = ?auto_2028 ?auto_2038 ) ) ( not ( = ?auto_2028 ?auto_2036 ) ) ( not ( = ?auto_2030 ?auto_2039 ) ) ( not ( = ?auto_2030 ?auto_2035 ) ) ( not ( = ?auto_2033 ?auto_2037 ) ) ( not ( = ?auto_2033 ?auto_2040 ) ) ( not ( = ?auto_2031 ?auto_2038 ) ) ( not ( = ?auto_2031 ?auto_2036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2025 ?auto_2026 ?auto_2027 )
      ( MAKE-1CRATE ?auto_2027 ?auto_2028 )
      ( MAKE-3CRATE-VERIFY ?auto_2025 ?auto_2026 ?auto_2027 ?auto_2028 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2043 - SURFACE
      ?auto_2044 - SURFACE
    )
    :vars
    (
      ?auto_2045 - HOIST
      ?auto_2046 - PLACE
      ?auto_2048 - PLACE
      ?auto_2049 - HOIST
      ?auto_2050 - SURFACE
      ?auto_2047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2045 ?auto_2046 ) ( SURFACE-AT ?auto_2043 ?auto_2046 ) ( CLEAR ?auto_2043 ) ( IS-CRATE ?auto_2044 ) ( AVAILABLE ?auto_2045 ) ( not ( = ?auto_2048 ?auto_2046 ) ) ( HOIST-AT ?auto_2049 ?auto_2048 ) ( AVAILABLE ?auto_2049 ) ( SURFACE-AT ?auto_2044 ?auto_2048 ) ( ON ?auto_2044 ?auto_2050 ) ( CLEAR ?auto_2044 ) ( TRUCK-AT ?auto_2047 ?auto_2046 ) ( not ( = ?auto_2043 ?auto_2044 ) ) ( not ( = ?auto_2043 ?auto_2050 ) ) ( not ( = ?auto_2044 ?auto_2050 ) ) ( not ( = ?auto_2045 ?auto_2049 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2047 ?auto_2046 ?auto_2048 )
      ( !LIFT ?auto_2049 ?auto_2044 ?auto_2050 ?auto_2048 )
      ( !LOAD ?auto_2049 ?auto_2044 ?auto_2047 ?auto_2048 )
      ( !DRIVE ?auto_2047 ?auto_2048 ?auto_2046 )
      ( !UNLOAD ?auto_2045 ?auto_2044 ?auto_2047 ?auto_2046 )
      ( !DROP ?auto_2045 ?auto_2044 ?auto_2043 ?auto_2046 )
      ( MAKE-1CRATE-VERIFY ?auto_2043 ?auto_2044 ) )
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
      ?auto_2066 - HOIST
      ?auto_2063 - PLACE
      ?auto_2062 - PLACE
      ?auto_2061 - HOIST
      ?auto_2065 - SURFACE
      ?auto_2070 - PLACE
      ?auto_2073 - HOIST
      ?auto_2069 - SURFACE
      ?auto_2072 - PLACE
      ?auto_2071 - HOIST
      ?auto_2067 - SURFACE
      ?auto_2074 - PLACE
      ?auto_2068 - HOIST
      ?auto_2075 - SURFACE
      ?auto_2064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2066 ?auto_2063 ) ( IS-CRATE ?auto_2060 ) ( not ( = ?auto_2062 ?auto_2063 ) ) ( HOIST-AT ?auto_2061 ?auto_2062 ) ( AVAILABLE ?auto_2061 ) ( SURFACE-AT ?auto_2060 ?auto_2062 ) ( ON ?auto_2060 ?auto_2065 ) ( CLEAR ?auto_2060 ) ( not ( = ?auto_2059 ?auto_2060 ) ) ( not ( = ?auto_2059 ?auto_2065 ) ) ( not ( = ?auto_2060 ?auto_2065 ) ) ( not ( = ?auto_2066 ?auto_2061 ) ) ( IS-CRATE ?auto_2059 ) ( not ( = ?auto_2070 ?auto_2063 ) ) ( HOIST-AT ?auto_2073 ?auto_2070 ) ( AVAILABLE ?auto_2073 ) ( SURFACE-AT ?auto_2059 ?auto_2070 ) ( ON ?auto_2059 ?auto_2069 ) ( CLEAR ?auto_2059 ) ( not ( = ?auto_2058 ?auto_2059 ) ) ( not ( = ?auto_2058 ?auto_2069 ) ) ( not ( = ?auto_2059 ?auto_2069 ) ) ( not ( = ?auto_2066 ?auto_2073 ) ) ( IS-CRATE ?auto_2058 ) ( not ( = ?auto_2072 ?auto_2063 ) ) ( HOIST-AT ?auto_2071 ?auto_2072 ) ( AVAILABLE ?auto_2071 ) ( SURFACE-AT ?auto_2058 ?auto_2072 ) ( ON ?auto_2058 ?auto_2067 ) ( CLEAR ?auto_2058 ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( not ( = ?auto_2057 ?auto_2067 ) ) ( not ( = ?auto_2058 ?auto_2067 ) ) ( not ( = ?auto_2066 ?auto_2071 ) ) ( SURFACE-AT ?auto_2056 ?auto_2063 ) ( CLEAR ?auto_2056 ) ( IS-CRATE ?auto_2057 ) ( AVAILABLE ?auto_2066 ) ( not ( = ?auto_2074 ?auto_2063 ) ) ( HOIST-AT ?auto_2068 ?auto_2074 ) ( AVAILABLE ?auto_2068 ) ( SURFACE-AT ?auto_2057 ?auto_2074 ) ( ON ?auto_2057 ?auto_2075 ) ( CLEAR ?auto_2057 ) ( TRUCK-AT ?auto_2064 ?auto_2063 ) ( not ( = ?auto_2056 ?auto_2057 ) ) ( not ( = ?auto_2056 ?auto_2075 ) ) ( not ( = ?auto_2057 ?auto_2075 ) ) ( not ( = ?auto_2066 ?auto_2068 ) ) ( not ( = ?auto_2056 ?auto_2058 ) ) ( not ( = ?auto_2056 ?auto_2067 ) ) ( not ( = ?auto_2058 ?auto_2075 ) ) ( not ( = ?auto_2072 ?auto_2074 ) ) ( not ( = ?auto_2071 ?auto_2068 ) ) ( not ( = ?auto_2067 ?auto_2075 ) ) ( not ( = ?auto_2056 ?auto_2059 ) ) ( not ( = ?auto_2056 ?auto_2069 ) ) ( not ( = ?auto_2057 ?auto_2059 ) ) ( not ( = ?auto_2057 ?auto_2069 ) ) ( not ( = ?auto_2059 ?auto_2067 ) ) ( not ( = ?auto_2059 ?auto_2075 ) ) ( not ( = ?auto_2070 ?auto_2072 ) ) ( not ( = ?auto_2070 ?auto_2074 ) ) ( not ( = ?auto_2073 ?auto_2071 ) ) ( not ( = ?auto_2073 ?auto_2068 ) ) ( not ( = ?auto_2069 ?auto_2067 ) ) ( not ( = ?auto_2069 ?auto_2075 ) ) ( not ( = ?auto_2056 ?auto_2060 ) ) ( not ( = ?auto_2056 ?auto_2065 ) ) ( not ( = ?auto_2057 ?auto_2060 ) ) ( not ( = ?auto_2057 ?auto_2065 ) ) ( not ( = ?auto_2058 ?auto_2060 ) ) ( not ( = ?auto_2058 ?auto_2065 ) ) ( not ( = ?auto_2060 ?auto_2069 ) ) ( not ( = ?auto_2060 ?auto_2067 ) ) ( not ( = ?auto_2060 ?auto_2075 ) ) ( not ( = ?auto_2062 ?auto_2070 ) ) ( not ( = ?auto_2062 ?auto_2072 ) ) ( not ( = ?auto_2062 ?auto_2074 ) ) ( not ( = ?auto_2061 ?auto_2073 ) ) ( not ( = ?auto_2061 ?auto_2071 ) ) ( not ( = ?auto_2061 ?auto_2068 ) ) ( not ( = ?auto_2065 ?auto_2069 ) ) ( not ( = ?auto_2065 ?auto_2067 ) ) ( not ( = ?auto_2065 ?auto_2075 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2056 ?auto_2057 ?auto_2058 ?auto_2059 )
      ( MAKE-1CRATE ?auto_2059 ?auto_2060 )
      ( MAKE-4CRATE-VERIFY ?auto_2056 ?auto_2057 ?auto_2058 ?auto_2059 ?auto_2060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2078 - SURFACE
      ?auto_2079 - SURFACE
    )
    :vars
    (
      ?auto_2080 - HOIST
      ?auto_2081 - PLACE
      ?auto_2083 - PLACE
      ?auto_2084 - HOIST
      ?auto_2085 - SURFACE
      ?auto_2082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2080 ?auto_2081 ) ( SURFACE-AT ?auto_2078 ?auto_2081 ) ( CLEAR ?auto_2078 ) ( IS-CRATE ?auto_2079 ) ( AVAILABLE ?auto_2080 ) ( not ( = ?auto_2083 ?auto_2081 ) ) ( HOIST-AT ?auto_2084 ?auto_2083 ) ( AVAILABLE ?auto_2084 ) ( SURFACE-AT ?auto_2079 ?auto_2083 ) ( ON ?auto_2079 ?auto_2085 ) ( CLEAR ?auto_2079 ) ( TRUCK-AT ?auto_2082 ?auto_2081 ) ( not ( = ?auto_2078 ?auto_2079 ) ) ( not ( = ?auto_2078 ?auto_2085 ) ) ( not ( = ?auto_2079 ?auto_2085 ) ) ( not ( = ?auto_2080 ?auto_2084 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2082 ?auto_2081 ?auto_2083 )
      ( !LIFT ?auto_2084 ?auto_2079 ?auto_2085 ?auto_2083 )
      ( !LOAD ?auto_2084 ?auto_2079 ?auto_2082 ?auto_2083 )
      ( !DRIVE ?auto_2082 ?auto_2083 ?auto_2081 )
      ( !UNLOAD ?auto_2080 ?auto_2079 ?auto_2082 ?auto_2081 )
      ( !DROP ?auto_2080 ?auto_2079 ?auto_2078 ?auto_2081 )
      ( MAKE-1CRATE-VERIFY ?auto_2078 ?auto_2079 ) )
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
      ?auto_2100 - HOIST
      ?auto_2102 - PLACE
      ?auto_2103 - PLACE
      ?auto_2101 - HOIST
      ?auto_2099 - SURFACE
      ?auto_2112 - PLACE
      ?auto_2104 - HOIST
      ?auto_2106 - SURFACE
      ?auto_2109 - SURFACE
      ?auto_2107 - PLACE
      ?auto_2105 - HOIST
      ?auto_2108 - SURFACE
      ?auto_2113 - PLACE
      ?auto_2110 - HOIST
      ?auto_2111 - SURFACE
      ?auto_2098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2100 ?auto_2102 ) ( IS-CRATE ?auto_2097 ) ( not ( = ?auto_2103 ?auto_2102 ) ) ( HOIST-AT ?auto_2101 ?auto_2103 ) ( SURFACE-AT ?auto_2097 ?auto_2103 ) ( ON ?auto_2097 ?auto_2099 ) ( CLEAR ?auto_2097 ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2099 ) ) ( not ( = ?auto_2097 ?auto_2099 ) ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( IS-CRATE ?auto_2096 ) ( not ( = ?auto_2112 ?auto_2102 ) ) ( HOIST-AT ?auto_2104 ?auto_2112 ) ( AVAILABLE ?auto_2104 ) ( SURFACE-AT ?auto_2096 ?auto_2112 ) ( ON ?auto_2096 ?auto_2106 ) ( CLEAR ?auto_2096 ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( not ( = ?auto_2095 ?auto_2106 ) ) ( not ( = ?auto_2096 ?auto_2106 ) ) ( not ( = ?auto_2100 ?auto_2104 ) ) ( IS-CRATE ?auto_2095 ) ( AVAILABLE ?auto_2101 ) ( SURFACE-AT ?auto_2095 ?auto_2103 ) ( ON ?auto_2095 ?auto_2109 ) ( CLEAR ?auto_2095 ) ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2094 ?auto_2109 ) ) ( not ( = ?auto_2095 ?auto_2109 ) ) ( IS-CRATE ?auto_2094 ) ( not ( = ?auto_2107 ?auto_2102 ) ) ( HOIST-AT ?auto_2105 ?auto_2107 ) ( AVAILABLE ?auto_2105 ) ( SURFACE-AT ?auto_2094 ?auto_2107 ) ( ON ?auto_2094 ?auto_2108 ) ( CLEAR ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( not ( = ?auto_2093 ?auto_2108 ) ) ( not ( = ?auto_2094 ?auto_2108 ) ) ( not ( = ?auto_2100 ?auto_2105 ) ) ( SURFACE-AT ?auto_2092 ?auto_2102 ) ( CLEAR ?auto_2092 ) ( IS-CRATE ?auto_2093 ) ( AVAILABLE ?auto_2100 ) ( not ( = ?auto_2113 ?auto_2102 ) ) ( HOIST-AT ?auto_2110 ?auto_2113 ) ( AVAILABLE ?auto_2110 ) ( SURFACE-AT ?auto_2093 ?auto_2113 ) ( ON ?auto_2093 ?auto_2111 ) ( CLEAR ?auto_2093 ) ( TRUCK-AT ?auto_2098 ?auto_2102 ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( not ( = ?auto_2092 ?auto_2111 ) ) ( not ( = ?auto_2093 ?auto_2111 ) ) ( not ( = ?auto_2100 ?auto_2110 ) ) ( not ( = ?auto_2092 ?auto_2094 ) ) ( not ( = ?auto_2092 ?auto_2108 ) ) ( not ( = ?auto_2094 ?auto_2111 ) ) ( not ( = ?auto_2107 ?auto_2113 ) ) ( not ( = ?auto_2105 ?auto_2110 ) ) ( not ( = ?auto_2108 ?auto_2111 ) ) ( not ( = ?auto_2092 ?auto_2095 ) ) ( not ( = ?auto_2092 ?auto_2109 ) ) ( not ( = ?auto_2093 ?auto_2095 ) ) ( not ( = ?auto_2093 ?auto_2109 ) ) ( not ( = ?auto_2095 ?auto_2108 ) ) ( not ( = ?auto_2095 ?auto_2111 ) ) ( not ( = ?auto_2103 ?auto_2107 ) ) ( not ( = ?auto_2103 ?auto_2113 ) ) ( not ( = ?auto_2101 ?auto_2105 ) ) ( not ( = ?auto_2101 ?auto_2110 ) ) ( not ( = ?auto_2109 ?auto_2108 ) ) ( not ( = ?auto_2109 ?auto_2111 ) ) ( not ( = ?auto_2092 ?auto_2096 ) ) ( not ( = ?auto_2092 ?auto_2106 ) ) ( not ( = ?auto_2093 ?auto_2096 ) ) ( not ( = ?auto_2093 ?auto_2106 ) ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( not ( = ?auto_2094 ?auto_2106 ) ) ( not ( = ?auto_2096 ?auto_2109 ) ) ( not ( = ?auto_2096 ?auto_2108 ) ) ( not ( = ?auto_2096 ?auto_2111 ) ) ( not ( = ?auto_2112 ?auto_2103 ) ) ( not ( = ?auto_2112 ?auto_2107 ) ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2104 ?auto_2101 ) ) ( not ( = ?auto_2104 ?auto_2105 ) ) ( not ( = ?auto_2104 ?auto_2110 ) ) ( not ( = ?auto_2106 ?auto_2109 ) ) ( not ( = ?auto_2106 ?auto_2108 ) ) ( not ( = ?auto_2106 ?auto_2111 ) ) ( not ( = ?auto_2092 ?auto_2097 ) ) ( not ( = ?auto_2092 ?auto_2099 ) ) ( not ( = ?auto_2093 ?auto_2097 ) ) ( not ( = ?auto_2093 ?auto_2099 ) ) ( not ( = ?auto_2094 ?auto_2097 ) ) ( not ( = ?auto_2094 ?auto_2099 ) ) ( not ( = ?auto_2095 ?auto_2097 ) ) ( not ( = ?auto_2095 ?auto_2099 ) ) ( not ( = ?auto_2097 ?auto_2106 ) ) ( not ( = ?auto_2097 ?auto_2109 ) ) ( not ( = ?auto_2097 ?auto_2108 ) ) ( not ( = ?auto_2097 ?auto_2111 ) ) ( not ( = ?auto_2099 ?auto_2106 ) ) ( not ( = ?auto_2099 ?auto_2109 ) ) ( not ( = ?auto_2099 ?auto_2108 ) ) ( not ( = ?auto_2099 ?auto_2111 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2092 ?auto_2093 ?auto_2094 ?auto_2095 ?auto_2096 )
      ( MAKE-1CRATE ?auto_2096 ?auto_2097 )
      ( MAKE-5CRATE-VERIFY ?auto_2092 ?auto_2093 ?auto_2094 ?auto_2095 ?auto_2096 ?auto_2097 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2116 - SURFACE
      ?auto_2117 - SURFACE
    )
    :vars
    (
      ?auto_2118 - HOIST
      ?auto_2119 - PLACE
      ?auto_2121 - PLACE
      ?auto_2122 - HOIST
      ?auto_2123 - SURFACE
      ?auto_2120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2118 ?auto_2119 ) ( SURFACE-AT ?auto_2116 ?auto_2119 ) ( CLEAR ?auto_2116 ) ( IS-CRATE ?auto_2117 ) ( AVAILABLE ?auto_2118 ) ( not ( = ?auto_2121 ?auto_2119 ) ) ( HOIST-AT ?auto_2122 ?auto_2121 ) ( AVAILABLE ?auto_2122 ) ( SURFACE-AT ?auto_2117 ?auto_2121 ) ( ON ?auto_2117 ?auto_2123 ) ( CLEAR ?auto_2117 ) ( TRUCK-AT ?auto_2120 ?auto_2119 ) ( not ( = ?auto_2116 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2123 ) ) ( not ( = ?auto_2117 ?auto_2123 ) ) ( not ( = ?auto_2118 ?auto_2122 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2120 ?auto_2119 ?auto_2121 )
      ( !LIFT ?auto_2122 ?auto_2117 ?auto_2123 ?auto_2121 )
      ( !LOAD ?auto_2122 ?auto_2117 ?auto_2120 ?auto_2121 )
      ( !DRIVE ?auto_2120 ?auto_2121 ?auto_2119 )
      ( !UNLOAD ?auto_2118 ?auto_2117 ?auto_2120 ?auto_2119 )
      ( !DROP ?auto_2118 ?auto_2117 ?auto_2116 ?auto_2119 )
      ( MAKE-1CRATE-VERIFY ?auto_2116 ?auto_2117 ) )
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
      ?auto_2139 - HOIST
      ?auto_2140 - PLACE
      ?auto_2138 - PLACE
      ?auto_2141 - HOIST
      ?auto_2142 - SURFACE
      ?auto_2150 - PLACE
      ?auto_2146 - HOIST
      ?auto_2152 - SURFACE
      ?auto_2154 - PLACE
      ?auto_2148 - HOIST
      ?auto_2145 - SURFACE
      ?auto_2147 - SURFACE
      ?auto_2151 - SURFACE
      ?auto_2144 - PLACE
      ?auto_2149 - HOIST
      ?auto_2153 - SURFACE
      ?auto_2143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2139 ?auto_2140 ) ( IS-CRATE ?auto_2137 ) ( not ( = ?auto_2138 ?auto_2140 ) ) ( HOIST-AT ?auto_2141 ?auto_2138 ) ( SURFACE-AT ?auto_2137 ?auto_2138 ) ( ON ?auto_2137 ?auto_2142 ) ( CLEAR ?auto_2137 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2142 ) ) ( not ( = ?auto_2137 ?auto_2142 ) ) ( not ( = ?auto_2139 ?auto_2141 ) ) ( IS-CRATE ?auto_2136 ) ( not ( = ?auto_2150 ?auto_2140 ) ) ( HOIST-AT ?auto_2146 ?auto_2150 ) ( SURFACE-AT ?auto_2136 ?auto_2150 ) ( ON ?auto_2136 ?auto_2152 ) ( CLEAR ?auto_2136 ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2152 ) ) ( not ( = ?auto_2136 ?auto_2152 ) ) ( not ( = ?auto_2139 ?auto_2146 ) ) ( IS-CRATE ?auto_2135 ) ( not ( = ?auto_2154 ?auto_2140 ) ) ( HOIST-AT ?auto_2148 ?auto_2154 ) ( AVAILABLE ?auto_2148 ) ( SURFACE-AT ?auto_2135 ?auto_2154 ) ( ON ?auto_2135 ?auto_2145 ) ( CLEAR ?auto_2135 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2145 ) ) ( not ( = ?auto_2135 ?auto_2145 ) ) ( not ( = ?auto_2139 ?auto_2148 ) ) ( IS-CRATE ?auto_2134 ) ( AVAILABLE ?auto_2146 ) ( SURFACE-AT ?auto_2134 ?auto_2150 ) ( ON ?auto_2134 ?auto_2147 ) ( CLEAR ?auto_2134 ) ( not ( = ?auto_2133 ?auto_2134 ) ) ( not ( = ?auto_2133 ?auto_2147 ) ) ( not ( = ?auto_2134 ?auto_2147 ) ) ( IS-CRATE ?auto_2133 ) ( AVAILABLE ?auto_2141 ) ( SURFACE-AT ?auto_2133 ?auto_2138 ) ( ON ?auto_2133 ?auto_2151 ) ( CLEAR ?auto_2133 ) ( not ( = ?auto_2132 ?auto_2133 ) ) ( not ( = ?auto_2132 ?auto_2151 ) ) ( not ( = ?auto_2133 ?auto_2151 ) ) ( SURFACE-AT ?auto_2131 ?auto_2140 ) ( CLEAR ?auto_2131 ) ( IS-CRATE ?auto_2132 ) ( AVAILABLE ?auto_2139 ) ( not ( = ?auto_2144 ?auto_2140 ) ) ( HOIST-AT ?auto_2149 ?auto_2144 ) ( AVAILABLE ?auto_2149 ) ( SURFACE-AT ?auto_2132 ?auto_2144 ) ( ON ?auto_2132 ?auto_2153 ) ( CLEAR ?auto_2132 ) ( TRUCK-AT ?auto_2143 ?auto_2140 ) ( not ( = ?auto_2131 ?auto_2132 ) ) ( not ( = ?auto_2131 ?auto_2153 ) ) ( not ( = ?auto_2132 ?auto_2153 ) ) ( not ( = ?auto_2139 ?auto_2149 ) ) ( not ( = ?auto_2131 ?auto_2133 ) ) ( not ( = ?auto_2131 ?auto_2151 ) ) ( not ( = ?auto_2133 ?auto_2153 ) ) ( not ( = ?auto_2138 ?auto_2144 ) ) ( not ( = ?auto_2141 ?auto_2149 ) ) ( not ( = ?auto_2151 ?auto_2153 ) ) ( not ( = ?auto_2131 ?auto_2134 ) ) ( not ( = ?auto_2131 ?auto_2147 ) ) ( not ( = ?auto_2132 ?auto_2134 ) ) ( not ( = ?auto_2132 ?auto_2147 ) ) ( not ( = ?auto_2134 ?auto_2151 ) ) ( not ( = ?auto_2134 ?auto_2153 ) ) ( not ( = ?auto_2150 ?auto_2138 ) ) ( not ( = ?auto_2150 ?auto_2144 ) ) ( not ( = ?auto_2146 ?auto_2141 ) ) ( not ( = ?auto_2146 ?auto_2149 ) ) ( not ( = ?auto_2147 ?auto_2151 ) ) ( not ( = ?auto_2147 ?auto_2153 ) ) ( not ( = ?auto_2131 ?auto_2135 ) ) ( not ( = ?auto_2131 ?auto_2145 ) ) ( not ( = ?auto_2132 ?auto_2135 ) ) ( not ( = ?auto_2132 ?auto_2145 ) ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( not ( = ?auto_2133 ?auto_2145 ) ) ( not ( = ?auto_2135 ?auto_2147 ) ) ( not ( = ?auto_2135 ?auto_2151 ) ) ( not ( = ?auto_2135 ?auto_2153 ) ) ( not ( = ?auto_2154 ?auto_2150 ) ) ( not ( = ?auto_2154 ?auto_2138 ) ) ( not ( = ?auto_2154 ?auto_2144 ) ) ( not ( = ?auto_2148 ?auto_2146 ) ) ( not ( = ?auto_2148 ?auto_2141 ) ) ( not ( = ?auto_2148 ?auto_2149 ) ) ( not ( = ?auto_2145 ?auto_2147 ) ) ( not ( = ?auto_2145 ?auto_2151 ) ) ( not ( = ?auto_2145 ?auto_2153 ) ) ( not ( = ?auto_2131 ?auto_2136 ) ) ( not ( = ?auto_2131 ?auto_2152 ) ) ( not ( = ?auto_2132 ?auto_2136 ) ) ( not ( = ?auto_2132 ?auto_2152 ) ) ( not ( = ?auto_2133 ?auto_2136 ) ) ( not ( = ?auto_2133 ?auto_2152 ) ) ( not ( = ?auto_2134 ?auto_2136 ) ) ( not ( = ?auto_2134 ?auto_2152 ) ) ( not ( = ?auto_2136 ?auto_2145 ) ) ( not ( = ?auto_2136 ?auto_2147 ) ) ( not ( = ?auto_2136 ?auto_2151 ) ) ( not ( = ?auto_2136 ?auto_2153 ) ) ( not ( = ?auto_2152 ?auto_2145 ) ) ( not ( = ?auto_2152 ?auto_2147 ) ) ( not ( = ?auto_2152 ?auto_2151 ) ) ( not ( = ?auto_2152 ?auto_2153 ) ) ( not ( = ?auto_2131 ?auto_2137 ) ) ( not ( = ?auto_2131 ?auto_2142 ) ) ( not ( = ?auto_2132 ?auto_2137 ) ) ( not ( = ?auto_2132 ?auto_2142 ) ) ( not ( = ?auto_2133 ?auto_2137 ) ) ( not ( = ?auto_2133 ?auto_2142 ) ) ( not ( = ?auto_2134 ?auto_2137 ) ) ( not ( = ?auto_2134 ?auto_2142 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2142 ) ) ( not ( = ?auto_2137 ?auto_2152 ) ) ( not ( = ?auto_2137 ?auto_2145 ) ) ( not ( = ?auto_2137 ?auto_2147 ) ) ( not ( = ?auto_2137 ?auto_2151 ) ) ( not ( = ?auto_2137 ?auto_2153 ) ) ( not ( = ?auto_2142 ?auto_2152 ) ) ( not ( = ?auto_2142 ?auto_2145 ) ) ( not ( = ?auto_2142 ?auto_2147 ) ) ( not ( = ?auto_2142 ?auto_2151 ) ) ( not ( = ?auto_2142 ?auto_2153 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2131 ?auto_2132 ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 )
      ( MAKE-1CRATE ?auto_2136 ?auto_2137 )
      ( MAKE-6CRATE-VERIFY ?auto_2131 ?auto_2132 ?auto_2133 ?auto_2134 ?auto_2135 ?auto_2136 ?auto_2137 ) )
  )

)

