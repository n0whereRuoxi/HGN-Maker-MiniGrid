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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1949 - BLOCK
    )
    :vars
    (
      ?auto_1950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1949 ?auto_1950 ) ( CLEAR ?auto_1949 ) ( HAND-EMPTY ) ( not ( = ?auto_1949 ?auto_1950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1949 ?auto_1950 )
      ( !PUTDOWN ?auto_1949 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1952 - BLOCK
    )
    :vars
    (
      ?auto_1953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1952 ?auto_1953 ) ( CLEAR ?auto_1952 ) ( HAND-EMPTY ) ( not ( = ?auto_1952 ?auto_1953 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1952 ?auto_1953 )
      ( !PUTDOWN ?auto_1952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1956 - BLOCK
      ?auto_1957 - BLOCK
    )
    :vars
    (
      ?auto_1958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1956 ) ( ON ?auto_1957 ?auto_1958 ) ( CLEAR ?auto_1957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1956 ) ( not ( = ?auto_1956 ?auto_1957 ) ) ( not ( = ?auto_1956 ?auto_1958 ) ) ( not ( = ?auto_1957 ?auto_1958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1957 ?auto_1958 )
      ( !STACK ?auto_1957 ?auto_1956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1961 - BLOCK
      ?auto_1962 - BLOCK
    )
    :vars
    (
      ?auto_1963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1961 ) ( ON ?auto_1962 ?auto_1963 ) ( CLEAR ?auto_1962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1961 ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( not ( = ?auto_1961 ?auto_1963 ) ) ( not ( = ?auto_1962 ?auto_1963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1962 ?auto_1963 )
      ( !STACK ?auto_1962 ?auto_1961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1966 - BLOCK
      ?auto_1967 - BLOCK
    )
    :vars
    (
      ?auto_1968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1967 ?auto_1968 ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1967 ?auto_1968 ) ) ( ON ?auto_1966 ?auto_1967 ) ( CLEAR ?auto_1966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1966 )
      ( MAKE-2PILE ?auto_1966 ?auto_1967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1971 - BLOCK
      ?auto_1972 - BLOCK
    )
    :vars
    (
      ?auto_1973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1972 ?auto_1973 ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1971 ?auto_1973 ) ) ( not ( = ?auto_1972 ?auto_1973 ) ) ( ON ?auto_1971 ?auto_1972 ) ( CLEAR ?auto_1971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1971 )
      ( MAKE-2PILE ?auto_1971 ?auto_1972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1977 - BLOCK
      ?auto_1978 - BLOCK
      ?auto_1979 - BLOCK
    )
    :vars
    (
      ?auto_1980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1978 ) ( ON ?auto_1979 ?auto_1980 ) ( CLEAR ?auto_1979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1977 ) ( ON ?auto_1978 ?auto_1977 ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( not ( = ?auto_1978 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1979 ?auto_1980 )
      ( !STACK ?auto_1979 ?auto_1978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1984 - BLOCK
      ?auto_1985 - BLOCK
      ?auto_1986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1985 ) ( ON-TABLE ?auto_1986 ) ( CLEAR ?auto_1986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1984 ) ( ON ?auto_1985 ?auto_1984 ) ( not ( = ?auto_1984 ?auto_1985 ) ) ( not ( = ?auto_1984 ?auto_1986 ) ) ( not ( = ?auto_1985 ?auto_1986 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1986 )
      ( !STACK ?auto_1986 ?auto_1985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1990 - BLOCK
      ?auto_1991 - BLOCK
      ?auto_1992 - BLOCK
    )
    :vars
    (
      ?auto_1993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1992 ?auto_1993 ) ( ON-TABLE ?auto_1990 ) ( not ( = ?auto_1990 ?auto_1991 ) ) ( not ( = ?auto_1990 ?auto_1992 ) ) ( not ( = ?auto_1990 ?auto_1993 ) ) ( not ( = ?auto_1991 ?auto_1992 ) ) ( not ( = ?auto_1991 ?auto_1993 ) ) ( not ( = ?auto_1992 ?auto_1993 ) ) ( CLEAR ?auto_1990 ) ( ON ?auto_1991 ?auto_1992 ) ( CLEAR ?auto_1991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1990 ?auto_1991 )
      ( MAKE-3PILE ?auto_1990 ?auto_1991 ?auto_1992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1997 - BLOCK
      ?auto_1998 - BLOCK
      ?auto_1999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1999 ) ( ON-TABLE ?auto_1997 ) ( not ( = ?auto_1997 ?auto_1998 ) ) ( not ( = ?auto_1997 ?auto_1999 ) ) ( not ( = ?auto_1998 ?auto_1999 ) ) ( CLEAR ?auto_1997 ) ( ON ?auto_1998 ?auto_1999 ) ( CLEAR ?auto_1998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1997 ?auto_1998 )
      ( MAKE-3PILE ?auto_1997 ?auto_1998 ?auto_1999 ) )
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
    ( and ( ON ?auto_2005 ?auto_2006 ) ( not ( = ?auto_2003 ?auto_2004 ) ) ( not ( = ?auto_2003 ?auto_2005 ) ) ( not ( = ?auto_2003 ?auto_2006 ) ) ( not ( = ?auto_2004 ?auto_2005 ) ) ( not ( = ?auto_2004 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( ON ?auto_2004 ?auto_2005 ) ( ON ?auto_2003 ?auto_2004 ) ( CLEAR ?auto_2003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2003 )
      ( MAKE-3PILE ?auto_2003 ?auto_2004 ?auto_2005 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2010 - BLOCK
      ?auto_2011 - BLOCK
      ?auto_2012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2012 ) ( not ( = ?auto_2010 ?auto_2011 ) ) ( not ( = ?auto_2010 ?auto_2012 ) ) ( not ( = ?auto_2011 ?auto_2012 ) ) ( ON ?auto_2011 ?auto_2012 ) ( ON ?auto_2010 ?auto_2011 ) ( CLEAR ?auto_2010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2010 )
      ( MAKE-3PILE ?auto_2010 ?auto_2011 ?auto_2012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2016 - BLOCK
      ?auto_2017 - BLOCK
      ?auto_2018 - BLOCK
    )
    :vars
    (
      ?auto_2019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2016 ?auto_2017 ) ) ( not ( = ?auto_2016 ?auto_2018 ) ) ( not ( = ?auto_2017 ?auto_2018 ) ) ( ON ?auto_2016 ?auto_2019 ) ( not ( = ?auto_2018 ?auto_2019 ) ) ( not ( = ?auto_2017 ?auto_2019 ) ) ( not ( = ?auto_2016 ?auto_2019 ) ) ( ON ?auto_2017 ?auto_2016 ) ( ON ?auto_2018 ?auto_2017 ) ( CLEAR ?auto_2018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2018 ?auto_2017 ?auto_2016 )
      ( MAKE-3PILE ?auto_2016 ?auto_2017 ?auto_2018 ) )
  )

)

