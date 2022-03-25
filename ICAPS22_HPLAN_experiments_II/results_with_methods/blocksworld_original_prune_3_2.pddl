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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1927 - BLOCK
      ?auto_1928 - BLOCK
      ?auto_1929 - BLOCK
    )
    :vars
    (
      ?auto_1930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1930 ?auto_1929 ) ( CLEAR ?auto_1930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1927 ) ( ON ?auto_1928 ?auto_1927 ) ( ON ?auto_1929 ?auto_1928 ) ( not ( = ?auto_1927 ?auto_1928 ) ) ( not ( = ?auto_1927 ?auto_1929 ) ) ( not ( = ?auto_1927 ?auto_1930 ) ) ( not ( = ?auto_1928 ?auto_1929 ) ) ( not ( = ?auto_1928 ?auto_1930 ) ) ( not ( = ?auto_1929 ?auto_1930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1930 ?auto_1929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1932 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1933 - BLOCK
    )
    :vars
    (
      ?auto_1934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1933 ?auto_1934 ) ( CLEAR ?auto_1933 ) ( HAND-EMPTY ) ( not ( = ?auto_1933 ?auto_1934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1933 ?auto_1934 )
      ( MAKE-1PILE ?auto_1933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1937 - BLOCK
      ?auto_1938 - BLOCK
    )
    :vars
    (
      ?auto_1939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1939 ?auto_1938 ) ( CLEAR ?auto_1939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1937 ) ( ON ?auto_1938 ?auto_1937 ) ( not ( = ?auto_1937 ?auto_1938 ) ) ( not ( = ?auto_1937 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1939 ?auto_1938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1940 - BLOCK
      ?auto_1941 - BLOCK
    )
    :vars
    (
      ?auto_1942 - BLOCK
      ?auto_1943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1942 ?auto_1941 ) ( CLEAR ?auto_1942 ) ( ON-TABLE ?auto_1940 ) ( ON ?auto_1941 ?auto_1940 ) ( not ( = ?auto_1940 ?auto_1941 ) ) ( not ( = ?auto_1940 ?auto_1942 ) ) ( not ( = ?auto_1941 ?auto_1942 ) ) ( HOLDING ?auto_1943 ) ( not ( = ?auto_1940 ?auto_1943 ) ) ( not ( = ?auto_1941 ?auto_1943 ) ) ( not ( = ?auto_1942 ?auto_1943 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1943 )
      ( MAKE-2PILE ?auto_1940 ?auto_1941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1944 - BLOCK
      ?auto_1945 - BLOCK
    )
    :vars
    (
      ?auto_1947 - BLOCK
      ?auto_1946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1947 ?auto_1945 ) ( ON-TABLE ?auto_1944 ) ( ON ?auto_1945 ?auto_1944 ) ( not ( = ?auto_1944 ?auto_1945 ) ) ( not ( = ?auto_1944 ?auto_1947 ) ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( not ( = ?auto_1944 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( not ( = ?auto_1947 ?auto_1946 ) ) ( ON ?auto_1946 ?auto_1947 ) ( CLEAR ?auto_1946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1944 ?auto_1945 ?auto_1947 )
      ( MAKE-2PILE ?auto_1944 ?auto_1945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1950 - BLOCK
      ?auto_1951 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1951 ) ( CLEAR ?auto_1950 ) ( ON-TABLE ?auto_1950 ) ( not ( = ?auto_1950 ?auto_1951 ) ) )
    :subtasks
    ( ( !STACK ?auto_1951 ?auto_1950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1952 - BLOCK
      ?auto_1953 - BLOCK
    )
    :vars
    (
      ?auto_1954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1952 ) ( ON-TABLE ?auto_1952 ) ( not ( = ?auto_1952 ?auto_1953 ) ) ( ON ?auto_1953 ?auto_1954 ) ( CLEAR ?auto_1953 ) ( HAND-EMPTY ) ( not ( = ?auto_1952 ?auto_1954 ) ) ( not ( = ?auto_1953 ?auto_1954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1953 ?auto_1954 )
      ( MAKE-2PILE ?auto_1952 ?auto_1953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1955 - BLOCK
      ?auto_1956 - BLOCK
    )
    :vars
    (
      ?auto_1957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1955 ?auto_1956 ) ) ( ON ?auto_1956 ?auto_1957 ) ( CLEAR ?auto_1956 ) ( not ( = ?auto_1955 ?auto_1957 ) ) ( not ( = ?auto_1956 ?auto_1957 ) ) ( HOLDING ?auto_1955 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1955 )
      ( MAKE-2PILE ?auto_1955 ?auto_1956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1958 - BLOCK
      ?auto_1959 - BLOCK
    )
    :vars
    (
      ?auto_1960 - BLOCK
      ?auto_1961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1958 ?auto_1959 ) ) ( ON ?auto_1959 ?auto_1960 ) ( not ( = ?auto_1958 ?auto_1960 ) ) ( not ( = ?auto_1959 ?auto_1960 ) ) ( ON ?auto_1958 ?auto_1959 ) ( CLEAR ?auto_1958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1961 ) ( ON ?auto_1960 ?auto_1961 ) ( not ( = ?auto_1961 ?auto_1960 ) ) ( not ( = ?auto_1961 ?auto_1959 ) ) ( not ( = ?auto_1961 ?auto_1958 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1961 ?auto_1960 ?auto_1959 )
      ( MAKE-2PILE ?auto_1958 ?auto_1959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1963 - BLOCK
    )
    :vars
    (
      ?auto_1964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1964 ?auto_1963 ) ( CLEAR ?auto_1964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1963 ) ( not ( = ?auto_1963 ?auto_1964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1964 ?auto_1963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1965 - BLOCK
    )
    :vars
    (
      ?auto_1966 - BLOCK
      ?auto_1967 - BLOCK
      ?auto_1968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1966 ?auto_1965 ) ( CLEAR ?auto_1966 ) ( ON-TABLE ?auto_1965 ) ( not ( = ?auto_1965 ?auto_1966 ) ) ( HOLDING ?auto_1967 ) ( CLEAR ?auto_1968 ) ( not ( = ?auto_1965 ?auto_1967 ) ) ( not ( = ?auto_1965 ?auto_1968 ) ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1967 ?auto_1968 ) ) )
    :subtasks
    ( ( !STACK ?auto_1967 ?auto_1968 )
      ( MAKE-1PILE ?auto_1965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2055 - BLOCK
    )
    :vars
    (
      ?auto_2057 - BLOCK
      ?auto_2056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2057 ?auto_2055 ) ( ON-TABLE ?auto_2055 ) ( not ( = ?auto_2055 ?auto_2057 ) ) ( not ( = ?auto_2055 ?auto_2056 ) ) ( not ( = ?auto_2057 ?auto_2056 ) ) ( ON ?auto_2056 ?auto_2057 ) ( CLEAR ?auto_2056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2055 ?auto_2057 )
      ( MAKE-1PILE ?auto_2055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1973 - BLOCK
    )
    :vars
    (
      ?auto_1976 - BLOCK
      ?auto_1974 - BLOCK
      ?auto_1975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1976 ?auto_1973 ) ( ON-TABLE ?auto_1973 ) ( not ( = ?auto_1973 ?auto_1976 ) ) ( not ( = ?auto_1973 ?auto_1974 ) ) ( not ( = ?auto_1973 ?auto_1975 ) ) ( not ( = ?auto_1976 ?auto_1974 ) ) ( not ( = ?auto_1976 ?auto_1975 ) ) ( not ( = ?auto_1974 ?auto_1975 ) ) ( ON ?auto_1974 ?auto_1976 ) ( CLEAR ?auto_1974 ) ( HOLDING ?auto_1975 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1975 )
      ( MAKE-1PILE ?auto_1973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1977 - BLOCK
    )
    :vars
    (
      ?auto_1979 - BLOCK
      ?auto_1980 - BLOCK
      ?auto_1978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1979 ?auto_1977 ) ( ON-TABLE ?auto_1977 ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1978 ) ) ( not ( = ?auto_1980 ?auto_1978 ) ) ( ON ?auto_1980 ?auto_1979 ) ( ON ?auto_1978 ?auto_1980 ) ( CLEAR ?auto_1978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1977 ?auto_1979 ?auto_1980 )
      ( MAKE-1PILE ?auto_1977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1984 - BLOCK
      ?auto_1985 - BLOCK
      ?auto_1986 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1986 ) ( CLEAR ?auto_1985 ) ( ON-TABLE ?auto_1984 ) ( ON ?auto_1985 ?auto_1984 ) ( not ( = ?auto_1984 ?auto_1985 ) ) ( not ( = ?auto_1984 ?auto_1986 ) ) ( not ( = ?auto_1985 ?auto_1986 ) ) )
    :subtasks
    ( ( !STACK ?auto_1986 ?auto_1985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1987 - BLOCK
      ?auto_1988 - BLOCK
      ?auto_1989 - BLOCK
    )
    :vars
    (
      ?auto_1990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1988 ) ( ON-TABLE ?auto_1987 ) ( ON ?auto_1988 ?auto_1987 ) ( not ( = ?auto_1987 ?auto_1988 ) ) ( not ( = ?auto_1987 ?auto_1989 ) ) ( not ( = ?auto_1988 ?auto_1989 ) ) ( ON ?auto_1989 ?auto_1990 ) ( CLEAR ?auto_1989 ) ( HAND-EMPTY ) ( not ( = ?auto_1987 ?auto_1990 ) ) ( not ( = ?auto_1988 ?auto_1990 ) ) ( not ( = ?auto_1989 ?auto_1990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1989 ?auto_1990 )
      ( MAKE-3PILE ?auto_1987 ?auto_1988 ?auto_1989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1991 - BLOCK
      ?auto_1992 - BLOCK
      ?auto_1993 - BLOCK
    )
    :vars
    (
      ?auto_1994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1991 ) ( not ( = ?auto_1991 ?auto_1992 ) ) ( not ( = ?auto_1991 ?auto_1993 ) ) ( not ( = ?auto_1992 ?auto_1993 ) ) ( ON ?auto_1993 ?auto_1994 ) ( CLEAR ?auto_1993 ) ( not ( = ?auto_1991 ?auto_1994 ) ) ( not ( = ?auto_1992 ?auto_1994 ) ) ( not ( = ?auto_1993 ?auto_1994 ) ) ( HOLDING ?auto_1992 ) ( CLEAR ?auto_1991 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1991 ?auto_1992 )
      ( MAKE-3PILE ?auto_1991 ?auto_1992 ?auto_1993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1995 - BLOCK
      ?auto_1996 - BLOCK
      ?auto_1997 - BLOCK
    )
    :vars
    (
      ?auto_1998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1995 ) ( not ( = ?auto_1995 ?auto_1996 ) ) ( not ( = ?auto_1995 ?auto_1997 ) ) ( not ( = ?auto_1996 ?auto_1997 ) ) ( ON ?auto_1997 ?auto_1998 ) ( not ( = ?auto_1995 ?auto_1998 ) ) ( not ( = ?auto_1996 ?auto_1998 ) ) ( not ( = ?auto_1997 ?auto_1998 ) ) ( CLEAR ?auto_1995 ) ( ON ?auto_1996 ?auto_1997 ) ( CLEAR ?auto_1996 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1998 ?auto_1997 )
      ( MAKE-3PILE ?auto_1995 ?auto_1996 ?auto_1997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1999 - BLOCK
      ?auto_2000 - BLOCK
      ?auto_2001 - BLOCK
    )
    :vars
    (
      ?auto_2002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1999 ?auto_2000 ) ) ( not ( = ?auto_1999 ?auto_2001 ) ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( ON ?auto_2001 ?auto_2002 ) ( not ( = ?auto_1999 ?auto_2002 ) ) ( not ( = ?auto_2000 ?auto_2002 ) ) ( not ( = ?auto_2001 ?auto_2002 ) ) ( ON ?auto_2000 ?auto_2001 ) ( CLEAR ?auto_2000 ) ( ON-TABLE ?auto_2002 ) ( HOLDING ?auto_1999 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1999 )
      ( MAKE-3PILE ?auto_1999 ?auto_2000 ?auto_2001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2003 - BLOCK
      ?auto_2004 - BLOCK
      ?auto_2005 - BLOCK
    )
    :vars
    (
      ?auto_2006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2003 ?auto_2004 ) ) ( not ( = ?auto_2003 ?auto_2005 ) ) ( not ( = ?auto_2004 ?auto_2005 ) ) ( ON ?auto_2005 ?auto_2006 ) ( not ( = ?auto_2003 ?auto_2006 ) ) ( not ( = ?auto_2004 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( ON ?auto_2004 ?auto_2005 ) ( ON-TABLE ?auto_2006 ) ( ON ?auto_2003 ?auto_2004 ) ( CLEAR ?auto_2003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2006 ?auto_2005 ?auto_2004 )
      ( MAKE-3PILE ?auto_2003 ?auto_2004 ?auto_2005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2033 - BLOCK
    )
    :vars
    (
      ?auto_2034 - BLOCK
      ?auto_2035 - BLOCK
      ?auto_2036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2033 ?auto_2034 ) ( CLEAR ?auto_2033 ) ( not ( = ?auto_2033 ?auto_2034 ) ) ( HOLDING ?auto_2035 ) ( CLEAR ?auto_2036 ) ( not ( = ?auto_2033 ?auto_2035 ) ) ( not ( = ?auto_2033 ?auto_2036 ) ) ( not ( = ?auto_2034 ?auto_2035 ) ) ( not ( = ?auto_2034 ?auto_2036 ) ) ( not ( = ?auto_2035 ?auto_2036 ) ) )
    :subtasks
    ( ( !STACK ?auto_2035 ?auto_2036 )
      ( MAKE-1PILE ?auto_2033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2037 - BLOCK
    )
    :vars
    (
      ?auto_2038 - BLOCK
      ?auto_2039 - BLOCK
      ?auto_2040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2037 ?auto_2038 ) ( not ( = ?auto_2037 ?auto_2038 ) ) ( CLEAR ?auto_2039 ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( not ( = ?auto_2037 ?auto_2039 ) ) ( not ( = ?auto_2038 ?auto_2040 ) ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( not ( = ?auto_2040 ?auto_2039 ) ) ( ON ?auto_2040 ?auto_2037 ) ( CLEAR ?auto_2040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2038 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2038 ?auto_2037 )
      ( MAKE-1PILE ?auto_2037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2041 - BLOCK
    )
    :vars
    (
      ?auto_2044 - BLOCK
      ?auto_2042 - BLOCK
      ?auto_2043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2041 ?auto_2044 ) ( not ( = ?auto_2041 ?auto_2044 ) ) ( not ( = ?auto_2041 ?auto_2042 ) ) ( not ( = ?auto_2041 ?auto_2043 ) ) ( not ( = ?auto_2044 ?auto_2042 ) ) ( not ( = ?auto_2044 ?auto_2043 ) ) ( not ( = ?auto_2042 ?auto_2043 ) ) ( ON ?auto_2042 ?auto_2041 ) ( CLEAR ?auto_2042 ) ( ON-TABLE ?auto_2044 ) ( HOLDING ?auto_2043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2043 )
      ( MAKE-1PILE ?auto_2041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2045 - BLOCK
    )
    :vars
    (
      ?auto_2048 - BLOCK
      ?auto_2046 - BLOCK
      ?auto_2047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2045 ?auto_2048 ) ( not ( = ?auto_2045 ?auto_2048 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( not ( = ?auto_2045 ?auto_2047 ) ) ( not ( = ?auto_2048 ?auto_2046 ) ) ( not ( = ?auto_2048 ?auto_2047 ) ) ( not ( = ?auto_2046 ?auto_2047 ) ) ( ON ?auto_2046 ?auto_2045 ) ( ON-TABLE ?auto_2048 ) ( ON ?auto_2047 ?auto_2046 ) ( CLEAR ?auto_2047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2048 ?auto_2045 ?auto_2046 )
      ( MAKE-1PILE ?auto_2045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2052 - BLOCK
    )
    :vars
    (
      ?auto_2053 - BLOCK
      ?auto_2054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2053 ?auto_2052 ) ( CLEAR ?auto_2053 ) ( ON-TABLE ?auto_2052 ) ( not ( = ?auto_2052 ?auto_2053 ) ) ( HOLDING ?auto_2054 ) ( not ( = ?auto_2052 ?auto_2054 ) ) ( not ( = ?auto_2053 ?auto_2054 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2054 )
      ( MAKE-1PILE ?auto_2052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2077 - BLOCK
      ?auto_2078 - BLOCK
    )
    :vars
    (
      ?auto_2079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2077 ?auto_2078 ) ) ( ON ?auto_2078 ?auto_2079 ) ( not ( = ?auto_2077 ?auto_2079 ) ) ( not ( = ?auto_2078 ?auto_2079 ) ) ( ON ?auto_2077 ?auto_2078 ) ( CLEAR ?auto_2077 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2079 ?auto_2078 )
      ( MAKE-2PILE ?auto_2077 ?auto_2078 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2082 - BLOCK
      ?auto_2083 - BLOCK
    )
    :vars
    (
      ?auto_2084 - BLOCK
      ?auto_2085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2082 ?auto_2083 ) ) ( ON ?auto_2083 ?auto_2084 ) ( CLEAR ?auto_2083 ) ( not ( = ?auto_2082 ?auto_2084 ) ) ( not ( = ?auto_2083 ?auto_2084 ) ) ( ON ?auto_2082 ?auto_2085 ) ( CLEAR ?auto_2082 ) ( HAND-EMPTY ) ( not ( = ?auto_2082 ?auto_2085 ) ) ( not ( = ?auto_2083 ?auto_2085 ) ) ( not ( = ?auto_2084 ?auto_2085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2082 ?auto_2085 )
      ( MAKE-2PILE ?auto_2082 ?auto_2083 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2086 - BLOCK
      ?auto_2087 - BLOCK
    )
    :vars
    (
      ?auto_2089 - BLOCK
      ?auto_2088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2086 ?auto_2087 ) ) ( not ( = ?auto_2086 ?auto_2089 ) ) ( not ( = ?auto_2087 ?auto_2089 ) ) ( ON ?auto_2086 ?auto_2088 ) ( CLEAR ?auto_2086 ) ( not ( = ?auto_2086 ?auto_2088 ) ) ( not ( = ?auto_2087 ?auto_2088 ) ) ( not ( = ?auto_2089 ?auto_2088 ) ) ( HOLDING ?auto_2087 ) ( CLEAR ?auto_2089 ) ( ON-TABLE ?auto_2089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2089 ?auto_2087 )
      ( MAKE-2PILE ?auto_2086 ?auto_2087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2090 - BLOCK
      ?auto_2091 - BLOCK
    )
    :vars
    (
      ?auto_2092 - BLOCK
      ?auto_2093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2090 ?auto_2091 ) ) ( not ( = ?auto_2090 ?auto_2092 ) ) ( not ( = ?auto_2091 ?auto_2092 ) ) ( ON ?auto_2090 ?auto_2093 ) ( not ( = ?auto_2090 ?auto_2093 ) ) ( not ( = ?auto_2091 ?auto_2093 ) ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( CLEAR ?auto_2092 ) ( ON-TABLE ?auto_2092 ) ( ON ?auto_2091 ?auto_2090 ) ( CLEAR ?auto_2091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2093 ?auto_2090 )
      ( MAKE-2PILE ?auto_2090 ?auto_2091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2094 - BLOCK
      ?auto_2095 - BLOCK
    )
    :vars
    (
      ?auto_2097 - BLOCK
      ?auto_2096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2094 ?auto_2097 ) ) ( not ( = ?auto_2095 ?auto_2097 ) ) ( ON ?auto_2094 ?auto_2096 ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( not ( = ?auto_2097 ?auto_2096 ) ) ( ON ?auto_2095 ?auto_2094 ) ( CLEAR ?auto_2095 ) ( ON-TABLE ?auto_2096 ) ( HOLDING ?auto_2097 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2097 )
      ( MAKE-2PILE ?auto_2094 ?auto_2095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2098 - BLOCK
      ?auto_2099 - BLOCK
    )
    :vars
    (
      ?auto_2100 - BLOCK
      ?auto_2101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2098 ?auto_2099 ) ) ( not ( = ?auto_2098 ?auto_2100 ) ) ( not ( = ?auto_2099 ?auto_2100 ) ) ( ON ?auto_2098 ?auto_2101 ) ( not ( = ?auto_2098 ?auto_2101 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2101 ) ) ( ON ?auto_2099 ?auto_2098 ) ( ON-TABLE ?auto_2101 ) ( ON ?auto_2100 ?auto_2099 ) ( CLEAR ?auto_2100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2101 ?auto_2098 ?auto_2099 )
      ( MAKE-2PILE ?auto_2098 ?auto_2099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2108 - BLOCK
      ?auto_2109 - BLOCK
      ?auto_2110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2109 ) ( ON-TABLE ?auto_2108 ) ( ON ?auto_2109 ?auto_2108 ) ( not ( = ?auto_2108 ?auto_2109 ) ) ( not ( = ?auto_2108 ?auto_2110 ) ) ( not ( = ?auto_2109 ?auto_2110 ) ) ( ON-TABLE ?auto_2110 ) ( CLEAR ?auto_2110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2110 )
      ( MAKE-3PILE ?auto_2108 ?auto_2109 ?auto_2110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2111 - BLOCK
      ?auto_2112 - BLOCK
      ?auto_2113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2111 ) ( not ( = ?auto_2111 ?auto_2112 ) ) ( not ( = ?auto_2111 ?auto_2113 ) ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( ON-TABLE ?auto_2113 ) ( CLEAR ?auto_2113 ) ( HOLDING ?auto_2112 ) ( CLEAR ?auto_2111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2111 ?auto_2112 )
      ( MAKE-3PILE ?auto_2111 ?auto_2112 ?auto_2113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2114 - BLOCK
      ?auto_2115 - BLOCK
      ?auto_2116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2114 ) ( not ( = ?auto_2114 ?auto_2115 ) ) ( not ( = ?auto_2114 ?auto_2116 ) ) ( not ( = ?auto_2115 ?auto_2116 ) ) ( ON-TABLE ?auto_2116 ) ( CLEAR ?auto_2114 ) ( ON ?auto_2115 ?auto_2116 ) ( CLEAR ?auto_2115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2116 )
      ( MAKE-3PILE ?auto_2114 ?auto_2115 ?auto_2116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2117 - BLOCK
      ?auto_2118 - BLOCK
      ?auto_2119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2117 ?auto_2118 ) ) ( not ( = ?auto_2117 ?auto_2119 ) ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( ON-TABLE ?auto_2119 ) ( ON ?auto_2118 ?auto_2119 ) ( CLEAR ?auto_2118 ) ( HOLDING ?auto_2117 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2117 )
      ( MAKE-3PILE ?auto_2117 ?auto_2118 ?auto_2119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2120 - BLOCK
      ?auto_2121 - BLOCK
      ?auto_2122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2120 ?auto_2121 ) ) ( not ( = ?auto_2120 ?auto_2122 ) ) ( not ( = ?auto_2121 ?auto_2122 ) ) ( ON-TABLE ?auto_2122 ) ( ON ?auto_2121 ?auto_2122 ) ( ON ?auto_2120 ?auto_2121 ) ( CLEAR ?auto_2120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2122 ?auto_2121 )
      ( MAKE-3PILE ?auto_2120 ?auto_2121 ?auto_2122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2126 - BLOCK
      ?auto_2127 - BLOCK
      ?auto_2128 - BLOCK
    )
    :vars
    (
      ?auto_2129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2126 ?auto_2127 ) ) ( not ( = ?auto_2126 ?auto_2128 ) ) ( not ( = ?auto_2127 ?auto_2128 ) ) ( ON-TABLE ?auto_2128 ) ( ON ?auto_2127 ?auto_2128 ) ( CLEAR ?auto_2127 ) ( ON ?auto_2126 ?auto_2129 ) ( CLEAR ?auto_2126 ) ( HAND-EMPTY ) ( not ( = ?auto_2126 ?auto_2129 ) ) ( not ( = ?auto_2127 ?auto_2129 ) ) ( not ( = ?auto_2128 ?auto_2129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2126 ?auto_2129 )
      ( MAKE-3PILE ?auto_2126 ?auto_2127 ?auto_2128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2130 - BLOCK
      ?auto_2131 - BLOCK
      ?auto_2132 - BLOCK
    )
    :vars
    (
      ?auto_2133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2130 ?auto_2131 ) ) ( not ( = ?auto_2130 ?auto_2132 ) ) ( not ( = ?auto_2131 ?auto_2132 ) ) ( ON-TABLE ?auto_2132 ) ( ON ?auto_2130 ?auto_2133 ) ( CLEAR ?auto_2130 ) ( not ( = ?auto_2130 ?auto_2133 ) ) ( not ( = ?auto_2131 ?auto_2133 ) ) ( not ( = ?auto_2132 ?auto_2133 ) ) ( HOLDING ?auto_2131 ) ( CLEAR ?auto_2132 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2132 ?auto_2131 )
      ( MAKE-3PILE ?auto_2130 ?auto_2131 ?auto_2132 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2134 - BLOCK
      ?auto_2135 - BLOCK
      ?auto_2136 - BLOCK
    )
    :vars
    (
      ?auto_2137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2134 ?auto_2135 ) ) ( not ( = ?auto_2134 ?auto_2136 ) ) ( not ( = ?auto_2135 ?auto_2136 ) ) ( ON-TABLE ?auto_2136 ) ( ON ?auto_2134 ?auto_2137 ) ( not ( = ?auto_2134 ?auto_2137 ) ) ( not ( = ?auto_2135 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( CLEAR ?auto_2136 ) ( ON ?auto_2135 ?auto_2134 ) ( CLEAR ?auto_2135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2137 ?auto_2134 )
      ( MAKE-3PILE ?auto_2134 ?auto_2135 ?auto_2136 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2138 - BLOCK
      ?auto_2139 - BLOCK
      ?auto_2140 - BLOCK
    )
    :vars
    (
      ?auto_2141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2138 ?auto_2139 ) ) ( not ( = ?auto_2138 ?auto_2140 ) ) ( not ( = ?auto_2139 ?auto_2140 ) ) ( ON ?auto_2138 ?auto_2141 ) ( not ( = ?auto_2138 ?auto_2141 ) ) ( not ( = ?auto_2139 ?auto_2141 ) ) ( not ( = ?auto_2140 ?auto_2141 ) ) ( ON ?auto_2139 ?auto_2138 ) ( CLEAR ?auto_2139 ) ( ON-TABLE ?auto_2141 ) ( HOLDING ?auto_2140 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2140 )
      ( MAKE-3PILE ?auto_2138 ?auto_2139 ?auto_2140 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2142 - BLOCK
      ?auto_2143 - BLOCK
      ?auto_2144 - BLOCK
    )
    :vars
    (
      ?auto_2145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2142 ?auto_2143 ) ) ( not ( = ?auto_2142 ?auto_2144 ) ) ( not ( = ?auto_2143 ?auto_2144 ) ) ( ON ?auto_2142 ?auto_2145 ) ( not ( = ?auto_2142 ?auto_2145 ) ) ( not ( = ?auto_2143 ?auto_2145 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( ON ?auto_2143 ?auto_2142 ) ( ON-TABLE ?auto_2145 ) ( ON ?auto_2144 ?auto_2143 ) ( CLEAR ?auto_2144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2145 ?auto_2142 ?auto_2143 )
      ( MAKE-3PILE ?auto_2142 ?auto_2143 ?auto_2144 ) )
  )

)

