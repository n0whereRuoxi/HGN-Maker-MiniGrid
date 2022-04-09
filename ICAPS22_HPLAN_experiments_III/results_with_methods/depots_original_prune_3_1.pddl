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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1875 - SURFACE
      ?auto_1876 - SURFACE
    )
    :vars
    (
      ?auto_1877 - HOIST
      ?auto_1878 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1877 ?auto_1878 ) ( SURFACE-AT ?auto_1875 ?auto_1878 ) ( CLEAR ?auto_1875 ) ( LIFTING ?auto_1877 ?auto_1876 ) ( IS-CRATE ?auto_1876 ) ( not ( = ?auto_1875 ?auto_1876 ) ) )
    :subtasks
    ( ( !DROP ?auto_1877 ?auto_1876 ?auto_1875 ?auto_1878 )
      ( MAKE-1CRATE-VERIFY ?auto_1875 ?auto_1876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1879 - SURFACE
      ?auto_1880 - SURFACE
    )
    :vars
    (
      ?auto_1881 - HOIST
      ?auto_1882 - PLACE
      ?auto_1883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1881 ?auto_1882 ) ( SURFACE-AT ?auto_1879 ?auto_1882 ) ( CLEAR ?auto_1879 ) ( IS-CRATE ?auto_1880 ) ( not ( = ?auto_1879 ?auto_1880 ) ) ( TRUCK-AT ?auto_1883 ?auto_1882 ) ( AVAILABLE ?auto_1881 ) ( IN ?auto_1880 ?auto_1883 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1881 ?auto_1880 ?auto_1883 ?auto_1882 )
      ( MAKE-1CRATE ?auto_1879 ?auto_1880 )
      ( MAKE-1CRATE-VERIFY ?auto_1879 ?auto_1880 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1884 - SURFACE
      ?auto_1885 - SURFACE
    )
    :vars
    (
      ?auto_1886 - HOIST
      ?auto_1887 - PLACE
      ?auto_1888 - TRUCK
      ?auto_1889 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1886 ?auto_1887 ) ( SURFACE-AT ?auto_1884 ?auto_1887 ) ( CLEAR ?auto_1884 ) ( IS-CRATE ?auto_1885 ) ( not ( = ?auto_1884 ?auto_1885 ) ) ( AVAILABLE ?auto_1886 ) ( IN ?auto_1885 ?auto_1888 ) ( TRUCK-AT ?auto_1888 ?auto_1889 ) ( not ( = ?auto_1889 ?auto_1887 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1888 ?auto_1889 ?auto_1887 )
      ( MAKE-1CRATE ?auto_1884 ?auto_1885 )
      ( MAKE-1CRATE-VERIFY ?auto_1884 ?auto_1885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1890 - SURFACE
      ?auto_1891 - SURFACE
    )
    :vars
    (
      ?auto_1893 - HOIST
      ?auto_1894 - PLACE
      ?auto_1895 - TRUCK
      ?auto_1892 - PLACE
      ?auto_1896 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893 ?auto_1894 ) ( SURFACE-AT ?auto_1890 ?auto_1894 ) ( CLEAR ?auto_1890 ) ( IS-CRATE ?auto_1891 ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( AVAILABLE ?auto_1893 ) ( TRUCK-AT ?auto_1895 ?auto_1892 ) ( not ( = ?auto_1892 ?auto_1894 ) ) ( HOIST-AT ?auto_1896 ?auto_1892 ) ( LIFTING ?auto_1896 ?auto_1891 ) ( not ( = ?auto_1893 ?auto_1896 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1896 ?auto_1891 ?auto_1895 ?auto_1892 )
      ( MAKE-1CRATE ?auto_1890 ?auto_1891 )
      ( MAKE-1CRATE-VERIFY ?auto_1890 ?auto_1891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1897 - SURFACE
      ?auto_1898 - SURFACE
    )
    :vars
    (
      ?auto_1900 - HOIST
      ?auto_1902 - PLACE
      ?auto_1903 - TRUCK
      ?auto_1899 - PLACE
      ?auto_1901 - HOIST
      ?auto_1904 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1900 ?auto_1902 ) ( SURFACE-AT ?auto_1897 ?auto_1902 ) ( CLEAR ?auto_1897 ) ( IS-CRATE ?auto_1898 ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( AVAILABLE ?auto_1900 ) ( TRUCK-AT ?auto_1903 ?auto_1899 ) ( not ( = ?auto_1899 ?auto_1902 ) ) ( HOIST-AT ?auto_1901 ?auto_1899 ) ( not ( = ?auto_1900 ?auto_1901 ) ) ( AVAILABLE ?auto_1901 ) ( SURFACE-AT ?auto_1898 ?auto_1899 ) ( ON ?auto_1898 ?auto_1904 ) ( CLEAR ?auto_1898 ) ( not ( = ?auto_1897 ?auto_1904 ) ) ( not ( = ?auto_1898 ?auto_1904 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1901 ?auto_1898 ?auto_1904 ?auto_1899 )
      ( MAKE-1CRATE ?auto_1897 ?auto_1898 )
      ( MAKE-1CRATE-VERIFY ?auto_1897 ?auto_1898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1905 - SURFACE
      ?auto_1906 - SURFACE
    )
    :vars
    (
      ?auto_1912 - HOIST
      ?auto_1909 - PLACE
      ?auto_1910 - PLACE
      ?auto_1911 - HOIST
      ?auto_1907 - SURFACE
      ?auto_1908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1912 ?auto_1909 ) ( SURFACE-AT ?auto_1905 ?auto_1909 ) ( CLEAR ?auto_1905 ) ( IS-CRATE ?auto_1906 ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( AVAILABLE ?auto_1912 ) ( not ( = ?auto_1910 ?auto_1909 ) ) ( HOIST-AT ?auto_1911 ?auto_1910 ) ( not ( = ?auto_1912 ?auto_1911 ) ) ( AVAILABLE ?auto_1911 ) ( SURFACE-AT ?auto_1906 ?auto_1910 ) ( ON ?auto_1906 ?auto_1907 ) ( CLEAR ?auto_1906 ) ( not ( = ?auto_1905 ?auto_1907 ) ) ( not ( = ?auto_1906 ?auto_1907 ) ) ( TRUCK-AT ?auto_1908 ?auto_1909 ) )
    :subtasks
    ( ( !DRIVE ?auto_1908 ?auto_1909 ?auto_1910 )
      ( MAKE-1CRATE ?auto_1905 ?auto_1906 )
      ( MAKE-1CRATE-VERIFY ?auto_1905 ?auto_1906 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1922 - SURFACE
      ?auto_1923 - SURFACE
      ?auto_1924 - SURFACE
    )
    :vars
    (
      ?auto_1925 - HOIST
      ?auto_1926 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1925 ?auto_1926 ) ( SURFACE-AT ?auto_1923 ?auto_1926 ) ( CLEAR ?auto_1923 ) ( LIFTING ?auto_1925 ?auto_1924 ) ( IS-CRATE ?auto_1924 ) ( not ( = ?auto_1923 ?auto_1924 ) ) ( ON ?auto_1923 ?auto_1922 ) ( not ( = ?auto_1922 ?auto_1923 ) ) ( not ( = ?auto_1922 ?auto_1924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1923 ?auto_1924 )
      ( MAKE-2CRATE-VERIFY ?auto_1922 ?auto_1923 ?auto_1924 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
      ?auto_1934 - SURFACE
    )
    :vars
    (
      ?auto_1937 - HOIST
      ?auto_1935 - PLACE
      ?auto_1936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1937 ?auto_1935 ) ( SURFACE-AT ?auto_1933 ?auto_1935 ) ( CLEAR ?auto_1933 ) ( IS-CRATE ?auto_1934 ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( TRUCK-AT ?auto_1936 ?auto_1935 ) ( AVAILABLE ?auto_1937 ) ( IN ?auto_1934 ?auto_1936 ) ( ON ?auto_1933 ?auto_1932 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1932 ?auto_1934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1933 ?auto_1934 )
      ( MAKE-2CRATE-VERIFY ?auto_1932 ?auto_1933 ?auto_1934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1938 - SURFACE
      ?auto_1939 - SURFACE
    )
    :vars
    (
      ?auto_1942 - HOIST
      ?auto_1940 - PLACE
      ?auto_1943 - TRUCK
      ?auto_1941 - SURFACE
      ?auto_1944 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1942 ?auto_1940 ) ( SURFACE-AT ?auto_1938 ?auto_1940 ) ( CLEAR ?auto_1938 ) ( IS-CRATE ?auto_1939 ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( AVAILABLE ?auto_1942 ) ( IN ?auto_1939 ?auto_1943 ) ( ON ?auto_1938 ?auto_1941 ) ( not ( = ?auto_1941 ?auto_1938 ) ) ( not ( = ?auto_1941 ?auto_1939 ) ) ( TRUCK-AT ?auto_1943 ?auto_1944 ) ( not ( = ?auto_1944 ?auto_1940 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1943 ?auto_1944 ?auto_1940 )
      ( MAKE-2CRATE ?auto_1941 ?auto_1938 ?auto_1939 )
      ( MAKE-1CRATE-VERIFY ?auto_1938 ?auto_1939 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1945 - SURFACE
      ?auto_1946 - SURFACE
      ?auto_1947 - SURFACE
    )
    :vars
    (
      ?auto_1948 - HOIST
      ?auto_1949 - PLACE
      ?auto_1950 - TRUCK
      ?auto_1951 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1948 ?auto_1949 ) ( SURFACE-AT ?auto_1946 ?auto_1949 ) ( CLEAR ?auto_1946 ) ( IS-CRATE ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( AVAILABLE ?auto_1948 ) ( IN ?auto_1947 ?auto_1950 ) ( ON ?auto_1946 ?auto_1945 ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( TRUCK-AT ?auto_1950 ?auto_1951 ) ( not ( = ?auto_1951 ?auto_1949 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1946 ?auto_1947 )
      ( MAKE-2CRATE-VERIFY ?auto_1945 ?auto_1946 ?auto_1947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1952 - SURFACE
      ?auto_1953 - SURFACE
    )
    :vars
    (
      ?auto_1954 - HOIST
      ?auto_1957 - PLACE
      ?auto_1955 - SURFACE
      ?auto_1958 - TRUCK
      ?auto_1956 - PLACE
      ?auto_1959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954 ?auto_1957 ) ( SURFACE-AT ?auto_1952 ?auto_1957 ) ( CLEAR ?auto_1952 ) ( IS-CRATE ?auto_1953 ) ( not ( = ?auto_1952 ?auto_1953 ) ) ( AVAILABLE ?auto_1954 ) ( ON ?auto_1952 ?auto_1955 ) ( not ( = ?auto_1955 ?auto_1952 ) ) ( not ( = ?auto_1955 ?auto_1953 ) ) ( TRUCK-AT ?auto_1958 ?auto_1956 ) ( not ( = ?auto_1956 ?auto_1957 ) ) ( HOIST-AT ?auto_1959 ?auto_1956 ) ( LIFTING ?auto_1959 ?auto_1953 ) ( not ( = ?auto_1954 ?auto_1959 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1959 ?auto_1953 ?auto_1958 ?auto_1956 )
      ( MAKE-2CRATE ?auto_1955 ?auto_1952 ?auto_1953 )
      ( MAKE-1CRATE-VERIFY ?auto_1952 ?auto_1953 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1960 - SURFACE
      ?auto_1961 - SURFACE
      ?auto_1962 - SURFACE
    )
    :vars
    (
      ?auto_1964 - HOIST
      ?auto_1966 - PLACE
      ?auto_1963 - TRUCK
      ?auto_1967 - PLACE
      ?auto_1965 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1964 ?auto_1966 ) ( SURFACE-AT ?auto_1961 ?auto_1966 ) ( CLEAR ?auto_1961 ) ( IS-CRATE ?auto_1962 ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( AVAILABLE ?auto_1964 ) ( ON ?auto_1961 ?auto_1960 ) ( not ( = ?auto_1960 ?auto_1961 ) ) ( not ( = ?auto_1960 ?auto_1962 ) ) ( TRUCK-AT ?auto_1963 ?auto_1967 ) ( not ( = ?auto_1967 ?auto_1966 ) ) ( HOIST-AT ?auto_1965 ?auto_1967 ) ( LIFTING ?auto_1965 ?auto_1962 ) ( not ( = ?auto_1964 ?auto_1965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1961 ?auto_1962 )
      ( MAKE-2CRATE-VERIFY ?auto_1960 ?auto_1961 ?auto_1962 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1968 - SURFACE
      ?auto_1969 - SURFACE
    )
    :vars
    (
      ?auto_1971 - HOIST
      ?auto_1972 - PLACE
      ?auto_1970 - SURFACE
      ?auto_1974 - TRUCK
      ?auto_1973 - PLACE
      ?auto_1975 - HOIST
      ?auto_1976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1971 ?auto_1972 ) ( SURFACE-AT ?auto_1968 ?auto_1972 ) ( CLEAR ?auto_1968 ) ( IS-CRATE ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1969 ) ) ( AVAILABLE ?auto_1971 ) ( ON ?auto_1968 ?auto_1970 ) ( not ( = ?auto_1970 ?auto_1968 ) ) ( not ( = ?auto_1970 ?auto_1969 ) ) ( TRUCK-AT ?auto_1974 ?auto_1973 ) ( not ( = ?auto_1973 ?auto_1972 ) ) ( HOIST-AT ?auto_1975 ?auto_1973 ) ( not ( = ?auto_1971 ?auto_1975 ) ) ( AVAILABLE ?auto_1975 ) ( SURFACE-AT ?auto_1969 ?auto_1973 ) ( ON ?auto_1969 ?auto_1976 ) ( CLEAR ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1976 ) ) ( not ( = ?auto_1969 ?auto_1976 ) ) ( not ( = ?auto_1970 ?auto_1976 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1975 ?auto_1969 ?auto_1976 ?auto_1973 )
      ( MAKE-2CRATE ?auto_1970 ?auto_1968 ?auto_1969 )
      ( MAKE-1CRATE-VERIFY ?auto_1968 ?auto_1969 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1977 - SURFACE
      ?auto_1978 - SURFACE
      ?auto_1979 - SURFACE
    )
    :vars
    (
      ?auto_1982 - HOIST
      ?auto_1985 - PLACE
      ?auto_1983 - TRUCK
      ?auto_1981 - PLACE
      ?auto_1984 - HOIST
      ?auto_1980 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982 ?auto_1985 ) ( SURFACE-AT ?auto_1978 ?auto_1985 ) ( CLEAR ?auto_1978 ) ( IS-CRATE ?auto_1979 ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( AVAILABLE ?auto_1982 ) ( ON ?auto_1978 ?auto_1977 ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( TRUCK-AT ?auto_1983 ?auto_1981 ) ( not ( = ?auto_1981 ?auto_1985 ) ) ( HOIST-AT ?auto_1984 ?auto_1981 ) ( not ( = ?auto_1982 ?auto_1984 ) ) ( AVAILABLE ?auto_1984 ) ( SURFACE-AT ?auto_1979 ?auto_1981 ) ( ON ?auto_1979 ?auto_1980 ) ( CLEAR ?auto_1979 ) ( not ( = ?auto_1978 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( not ( = ?auto_1977 ?auto_1980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1978 ?auto_1979 )
      ( MAKE-2CRATE-VERIFY ?auto_1977 ?auto_1978 ?auto_1979 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1986 - SURFACE
      ?auto_1987 - SURFACE
    )
    :vars
    (
      ?auto_1992 - HOIST
      ?auto_1993 - PLACE
      ?auto_1990 - SURFACE
      ?auto_1988 - PLACE
      ?auto_1991 - HOIST
      ?auto_1994 - SURFACE
      ?auto_1989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1992 ?auto_1993 ) ( SURFACE-AT ?auto_1986 ?auto_1993 ) ( CLEAR ?auto_1986 ) ( IS-CRATE ?auto_1987 ) ( not ( = ?auto_1986 ?auto_1987 ) ) ( AVAILABLE ?auto_1992 ) ( ON ?auto_1986 ?auto_1990 ) ( not ( = ?auto_1990 ?auto_1986 ) ) ( not ( = ?auto_1990 ?auto_1987 ) ) ( not ( = ?auto_1988 ?auto_1993 ) ) ( HOIST-AT ?auto_1991 ?auto_1988 ) ( not ( = ?auto_1992 ?auto_1991 ) ) ( AVAILABLE ?auto_1991 ) ( SURFACE-AT ?auto_1987 ?auto_1988 ) ( ON ?auto_1987 ?auto_1994 ) ( CLEAR ?auto_1987 ) ( not ( = ?auto_1986 ?auto_1994 ) ) ( not ( = ?auto_1987 ?auto_1994 ) ) ( not ( = ?auto_1990 ?auto_1994 ) ) ( TRUCK-AT ?auto_1989 ?auto_1993 ) )
    :subtasks
    ( ( !DRIVE ?auto_1989 ?auto_1993 ?auto_1988 )
      ( MAKE-2CRATE ?auto_1990 ?auto_1986 ?auto_1987 )
      ( MAKE-1CRATE-VERIFY ?auto_1986 ?auto_1987 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1995 - SURFACE
      ?auto_1996 - SURFACE
      ?auto_1997 - SURFACE
    )
    :vars
    (
      ?auto_2001 - HOIST
      ?auto_2003 - PLACE
      ?auto_1999 - PLACE
      ?auto_2000 - HOIST
      ?auto_1998 - SURFACE
      ?auto_2002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001 ?auto_2003 ) ( SURFACE-AT ?auto_1996 ?auto_2003 ) ( CLEAR ?auto_1996 ) ( IS-CRATE ?auto_1997 ) ( not ( = ?auto_1996 ?auto_1997 ) ) ( AVAILABLE ?auto_2001 ) ( ON ?auto_1996 ?auto_1995 ) ( not ( = ?auto_1995 ?auto_1996 ) ) ( not ( = ?auto_1995 ?auto_1997 ) ) ( not ( = ?auto_1999 ?auto_2003 ) ) ( HOIST-AT ?auto_2000 ?auto_1999 ) ( not ( = ?auto_2001 ?auto_2000 ) ) ( AVAILABLE ?auto_2000 ) ( SURFACE-AT ?auto_1997 ?auto_1999 ) ( ON ?auto_1997 ?auto_1998 ) ( CLEAR ?auto_1997 ) ( not ( = ?auto_1996 ?auto_1998 ) ) ( not ( = ?auto_1997 ?auto_1998 ) ) ( not ( = ?auto_1995 ?auto_1998 ) ) ( TRUCK-AT ?auto_2002 ?auto_2003 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1996 ?auto_1997 )
      ( MAKE-2CRATE-VERIFY ?auto_1995 ?auto_1996 ?auto_1997 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2004 - SURFACE
      ?auto_2005 - SURFACE
    )
    :vars
    (
      ?auto_2007 - HOIST
      ?auto_2010 - PLACE
      ?auto_2008 - SURFACE
      ?auto_2011 - PLACE
      ?auto_2012 - HOIST
      ?auto_2009 - SURFACE
      ?auto_2006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2007 ?auto_2010 ) ( IS-CRATE ?auto_2005 ) ( not ( = ?auto_2004 ?auto_2005 ) ) ( not ( = ?auto_2008 ?auto_2004 ) ) ( not ( = ?auto_2008 ?auto_2005 ) ) ( not ( = ?auto_2011 ?auto_2010 ) ) ( HOIST-AT ?auto_2012 ?auto_2011 ) ( not ( = ?auto_2007 ?auto_2012 ) ) ( AVAILABLE ?auto_2012 ) ( SURFACE-AT ?auto_2005 ?auto_2011 ) ( ON ?auto_2005 ?auto_2009 ) ( CLEAR ?auto_2005 ) ( not ( = ?auto_2004 ?auto_2009 ) ) ( not ( = ?auto_2005 ?auto_2009 ) ) ( not ( = ?auto_2008 ?auto_2009 ) ) ( TRUCK-AT ?auto_2006 ?auto_2010 ) ( SURFACE-AT ?auto_2008 ?auto_2010 ) ( CLEAR ?auto_2008 ) ( LIFTING ?auto_2007 ?auto_2004 ) ( IS-CRATE ?auto_2004 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2008 ?auto_2004 )
      ( MAKE-2CRATE ?auto_2008 ?auto_2004 ?auto_2005 )
      ( MAKE-1CRATE-VERIFY ?auto_2004 ?auto_2005 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2013 - SURFACE
      ?auto_2014 - SURFACE
      ?auto_2015 - SURFACE
    )
    :vars
    (
      ?auto_2019 - HOIST
      ?auto_2017 - PLACE
      ?auto_2020 - PLACE
      ?auto_2018 - HOIST
      ?auto_2021 - SURFACE
      ?auto_2016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2019 ?auto_2017 ) ( IS-CRATE ?auto_2015 ) ( not ( = ?auto_2014 ?auto_2015 ) ) ( not ( = ?auto_2013 ?auto_2014 ) ) ( not ( = ?auto_2013 ?auto_2015 ) ) ( not ( = ?auto_2020 ?auto_2017 ) ) ( HOIST-AT ?auto_2018 ?auto_2020 ) ( not ( = ?auto_2019 ?auto_2018 ) ) ( AVAILABLE ?auto_2018 ) ( SURFACE-AT ?auto_2015 ?auto_2020 ) ( ON ?auto_2015 ?auto_2021 ) ( CLEAR ?auto_2015 ) ( not ( = ?auto_2014 ?auto_2021 ) ) ( not ( = ?auto_2015 ?auto_2021 ) ) ( not ( = ?auto_2013 ?auto_2021 ) ) ( TRUCK-AT ?auto_2016 ?auto_2017 ) ( SURFACE-AT ?auto_2013 ?auto_2017 ) ( CLEAR ?auto_2013 ) ( LIFTING ?auto_2019 ?auto_2014 ) ( IS-CRATE ?auto_2014 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2014 ?auto_2015 )
      ( MAKE-2CRATE-VERIFY ?auto_2013 ?auto_2014 ?auto_2015 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2022 - SURFACE
      ?auto_2023 - SURFACE
    )
    :vars
    (
      ?auto_2029 - HOIST
      ?auto_2025 - PLACE
      ?auto_2030 - SURFACE
      ?auto_2026 - PLACE
      ?auto_2024 - HOIST
      ?auto_2028 - SURFACE
      ?auto_2027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2029 ?auto_2025 ) ( IS-CRATE ?auto_2023 ) ( not ( = ?auto_2022 ?auto_2023 ) ) ( not ( = ?auto_2030 ?auto_2022 ) ) ( not ( = ?auto_2030 ?auto_2023 ) ) ( not ( = ?auto_2026 ?auto_2025 ) ) ( HOIST-AT ?auto_2024 ?auto_2026 ) ( not ( = ?auto_2029 ?auto_2024 ) ) ( AVAILABLE ?auto_2024 ) ( SURFACE-AT ?auto_2023 ?auto_2026 ) ( ON ?auto_2023 ?auto_2028 ) ( CLEAR ?auto_2023 ) ( not ( = ?auto_2022 ?auto_2028 ) ) ( not ( = ?auto_2023 ?auto_2028 ) ) ( not ( = ?auto_2030 ?auto_2028 ) ) ( TRUCK-AT ?auto_2027 ?auto_2025 ) ( SURFACE-AT ?auto_2030 ?auto_2025 ) ( CLEAR ?auto_2030 ) ( IS-CRATE ?auto_2022 ) ( AVAILABLE ?auto_2029 ) ( IN ?auto_2022 ?auto_2027 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2029 ?auto_2022 ?auto_2027 ?auto_2025 )
      ( MAKE-2CRATE ?auto_2030 ?auto_2022 ?auto_2023 )
      ( MAKE-1CRATE-VERIFY ?auto_2022 ?auto_2023 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2031 - SURFACE
      ?auto_2032 - SURFACE
      ?auto_2033 - SURFACE
    )
    :vars
    (
      ?auto_2035 - HOIST
      ?auto_2038 - PLACE
      ?auto_2037 - PLACE
      ?auto_2034 - HOIST
      ?auto_2036 - SURFACE
      ?auto_2039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2035 ?auto_2038 ) ( IS-CRATE ?auto_2033 ) ( not ( = ?auto_2032 ?auto_2033 ) ) ( not ( = ?auto_2031 ?auto_2032 ) ) ( not ( = ?auto_2031 ?auto_2033 ) ) ( not ( = ?auto_2037 ?auto_2038 ) ) ( HOIST-AT ?auto_2034 ?auto_2037 ) ( not ( = ?auto_2035 ?auto_2034 ) ) ( AVAILABLE ?auto_2034 ) ( SURFACE-AT ?auto_2033 ?auto_2037 ) ( ON ?auto_2033 ?auto_2036 ) ( CLEAR ?auto_2033 ) ( not ( = ?auto_2032 ?auto_2036 ) ) ( not ( = ?auto_2033 ?auto_2036 ) ) ( not ( = ?auto_2031 ?auto_2036 ) ) ( TRUCK-AT ?auto_2039 ?auto_2038 ) ( SURFACE-AT ?auto_2031 ?auto_2038 ) ( CLEAR ?auto_2031 ) ( IS-CRATE ?auto_2032 ) ( AVAILABLE ?auto_2035 ) ( IN ?auto_2032 ?auto_2039 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2032 ?auto_2033 )
      ( MAKE-2CRATE-VERIFY ?auto_2031 ?auto_2032 ?auto_2033 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2076 - SURFACE
      ?auto_2077 - SURFACE
    )
    :vars
    (
      ?auto_2078 - HOIST
      ?auto_2083 - PLACE
      ?auto_2084 - SURFACE
      ?auto_2079 - PLACE
      ?auto_2080 - HOIST
      ?auto_2081 - SURFACE
      ?auto_2082 - TRUCK
      ?auto_2085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2078 ?auto_2083 ) ( SURFACE-AT ?auto_2076 ?auto_2083 ) ( CLEAR ?auto_2076 ) ( IS-CRATE ?auto_2077 ) ( not ( = ?auto_2076 ?auto_2077 ) ) ( AVAILABLE ?auto_2078 ) ( ON ?auto_2076 ?auto_2084 ) ( not ( = ?auto_2084 ?auto_2076 ) ) ( not ( = ?auto_2084 ?auto_2077 ) ) ( not ( = ?auto_2079 ?auto_2083 ) ) ( HOIST-AT ?auto_2080 ?auto_2079 ) ( not ( = ?auto_2078 ?auto_2080 ) ) ( AVAILABLE ?auto_2080 ) ( SURFACE-AT ?auto_2077 ?auto_2079 ) ( ON ?auto_2077 ?auto_2081 ) ( CLEAR ?auto_2077 ) ( not ( = ?auto_2076 ?auto_2081 ) ) ( not ( = ?auto_2077 ?auto_2081 ) ) ( not ( = ?auto_2084 ?auto_2081 ) ) ( TRUCK-AT ?auto_2082 ?auto_2085 ) ( not ( = ?auto_2085 ?auto_2083 ) ) ( not ( = ?auto_2079 ?auto_2085 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2082 ?auto_2085 ?auto_2083 )
      ( MAKE-1CRATE ?auto_2076 ?auto_2077 )
      ( MAKE-1CRATE-VERIFY ?auto_2076 ?auto_2077 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2115 - SURFACE
      ?auto_2116 - SURFACE
      ?auto_2117 - SURFACE
      ?auto_2118 - SURFACE
    )
    :vars
    (
      ?auto_2119 - HOIST
      ?auto_2120 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2119 ?auto_2120 ) ( SURFACE-AT ?auto_2117 ?auto_2120 ) ( CLEAR ?auto_2117 ) ( LIFTING ?auto_2119 ?auto_2118 ) ( IS-CRATE ?auto_2118 ) ( not ( = ?auto_2117 ?auto_2118 ) ) ( ON ?auto_2116 ?auto_2115 ) ( ON ?auto_2117 ?auto_2116 ) ( not ( = ?auto_2115 ?auto_2116 ) ) ( not ( = ?auto_2115 ?auto_2117 ) ) ( not ( = ?auto_2115 ?auto_2118 ) ) ( not ( = ?auto_2116 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2118 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2117 ?auto_2118 )
      ( MAKE-3CRATE-VERIFY ?auto_2115 ?auto_2116 ?auto_2117 ?auto_2118 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2132 - SURFACE
      ?auto_2133 - SURFACE
      ?auto_2134 - SURFACE
      ?auto_2135 - SURFACE
    )
    :vars
    (
      ?auto_2138 - HOIST
      ?auto_2137 - PLACE
      ?auto_2136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2138 ?auto_2137 ) ( SURFACE-AT ?auto_2134 ?auto_2137 ) ( CLEAR ?auto_2134 ) ( IS-CRATE ?auto_2135 ) ( not ( = ?auto_2134 ?auto_2135 ) ) ( TRUCK-AT ?auto_2136 ?auto_2137 ) ( AVAILABLE ?auto_2138 ) ( IN ?auto_2135 ?auto_2136 ) ( ON ?auto_2134 ?auto_2133 ) ( not ( = ?auto_2133 ?auto_2134 ) ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( ON ?auto_2133 ?auto_2132 ) ( not ( = ?auto_2132 ?auto_2133 ) ) ( not ( = ?auto_2132 ?auto_2134 ) ) ( not ( = ?auto_2132 ?auto_2135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133 ?auto_2134 ?auto_2135 )
      ( MAKE-3CRATE-VERIFY ?auto_2132 ?auto_2133 ?auto_2134 ?auto_2135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2153 - SURFACE
      ?auto_2154 - SURFACE
      ?auto_2155 - SURFACE
      ?auto_2156 - SURFACE
    )
    :vars
    (
      ?auto_2158 - HOIST
      ?auto_2157 - PLACE
      ?auto_2159 - TRUCK
      ?auto_2160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2158 ?auto_2157 ) ( SURFACE-AT ?auto_2155 ?auto_2157 ) ( CLEAR ?auto_2155 ) ( IS-CRATE ?auto_2156 ) ( not ( = ?auto_2155 ?auto_2156 ) ) ( AVAILABLE ?auto_2158 ) ( IN ?auto_2156 ?auto_2159 ) ( ON ?auto_2155 ?auto_2154 ) ( not ( = ?auto_2154 ?auto_2155 ) ) ( not ( = ?auto_2154 ?auto_2156 ) ) ( TRUCK-AT ?auto_2159 ?auto_2160 ) ( not ( = ?auto_2160 ?auto_2157 ) ) ( ON ?auto_2154 ?auto_2153 ) ( not ( = ?auto_2153 ?auto_2154 ) ) ( not ( = ?auto_2153 ?auto_2155 ) ) ( not ( = ?auto_2153 ?auto_2156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2154 ?auto_2155 ?auto_2156 )
      ( MAKE-3CRATE-VERIFY ?auto_2153 ?auto_2154 ?auto_2155 ?auto_2156 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2177 - SURFACE
      ?auto_2178 - SURFACE
      ?auto_2179 - SURFACE
      ?auto_2180 - SURFACE
    )
    :vars
    (
      ?auto_2185 - HOIST
      ?auto_2181 - PLACE
      ?auto_2183 - TRUCK
      ?auto_2182 - PLACE
      ?auto_2184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2185 ?auto_2181 ) ( SURFACE-AT ?auto_2179 ?auto_2181 ) ( CLEAR ?auto_2179 ) ( IS-CRATE ?auto_2180 ) ( not ( = ?auto_2179 ?auto_2180 ) ) ( AVAILABLE ?auto_2185 ) ( ON ?auto_2179 ?auto_2178 ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( not ( = ?auto_2178 ?auto_2180 ) ) ( TRUCK-AT ?auto_2183 ?auto_2182 ) ( not ( = ?auto_2182 ?auto_2181 ) ) ( HOIST-AT ?auto_2184 ?auto_2182 ) ( LIFTING ?auto_2184 ?auto_2180 ) ( not ( = ?auto_2185 ?auto_2184 ) ) ( ON ?auto_2178 ?auto_2177 ) ( not ( = ?auto_2177 ?auto_2178 ) ) ( not ( = ?auto_2177 ?auto_2179 ) ) ( not ( = ?auto_2177 ?auto_2180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178 ?auto_2179 ?auto_2180 )
      ( MAKE-3CRATE-VERIFY ?auto_2177 ?auto_2178 ?auto_2179 ?auto_2180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2204 - SURFACE
      ?auto_2205 - SURFACE
      ?auto_2206 - SURFACE
      ?auto_2207 - SURFACE
    )
    :vars
    (
      ?auto_2208 - HOIST
      ?auto_2209 - PLACE
      ?auto_2211 - TRUCK
      ?auto_2212 - PLACE
      ?auto_2213 - HOIST
      ?auto_2210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2208 ?auto_2209 ) ( SURFACE-AT ?auto_2206 ?auto_2209 ) ( CLEAR ?auto_2206 ) ( IS-CRATE ?auto_2207 ) ( not ( = ?auto_2206 ?auto_2207 ) ) ( AVAILABLE ?auto_2208 ) ( ON ?auto_2206 ?auto_2205 ) ( not ( = ?auto_2205 ?auto_2206 ) ) ( not ( = ?auto_2205 ?auto_2207 ) ) ( TRUCK-AT ?auto_2211 ?auto_2212 ) ( not ( = ?auto_2212 ?auto_2209 ) ) ( HOIST-AT ?auto_2213 ?auto_2212 ) ( not ( = ?auto_2208 ?auto_2213 ) ) ( AVAILABLE ?auto_2213 ) ( SURFACE-AT ?auto_2207 ?auto_2212 ) ( ON ?auto_2207 ?auto_2210 ) ( CLEAR ?auto_2207 ) ( not ( = ?auto_2206 ?auto_2210 ) ) ( not ( = ?auto_2207 ?auto_2210 ) ) ( not ( = ?auto_2205 ?auto_2210 ) ) ( ON ?auto_2205 ?auto_2204 ) ( not ( = ?auto_2204 ?auto_2205 ) ) ( not ( = ?auto_2204 ?auto_2206 ) ) ( not ( = ?auto_2204 ?auto_2207 ) ) ( not ( = ?auto_2204 ?auto_2210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2205 ?auto_2206 ?auto_2207 )
      ( MAKE-3CRATE-VERIFY ?auto_2204 ?auto_2205 ?auto_2206 ?auto_2207 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2232 - SURFACE
      ?auto_2233 - SURFACE
      ?auto_2234 - SURFACE
      ?auto_2235 - SURFACE
    )
    :vars
    (
      ?auto_2241 - HOIST
      ?auto_2236 - PLACE
      ?auto_2240 - PLACE
      ?auto_2237 - HOIST
      ?auto_2238 - SURFACE
      ?auto_2239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2241 ?auto_2236 ) ( SURFACE-AT ?auto_2234 ?auto_2236 ) ( CLEAR ?auto_2234 ) ( IS-CRATE ?auto_2235 ) ( not ( = ?auto_2234 ?auto_2235 ) ) ( AVAILABLE ?auto_2241 ) ( ON ?auto_2234 ?auto_2233 ) ( not ( = ?auto_2233 ?auto_2234 ) ) ( not ( = ?auto_2233 ?auto_2235 ) ) ( not ( = ?auto_2240 ?auto_2236 ) ) ( HOIST-AT ?auto_2237 ?auto_2240 ) ( not ( = ?auto_2241 ?auto_2237 ) ) ( AVAILABLE ?auto_2237 ) ( SURFACE-AT ?auto_2235 ?auto_2240 ) ( ON ?auto_2235 ?auto_2238 ) ( CLEAR ?auto_2235 ) ( not ( = ?auto_2234 ?auto_2238 ) ) ( not ( = ?auto_2235 ?auto_2238 ) ) ( not ( = ?auto_2233 ?auto_2238 ) ) ( TRUCK-AT ?auto_2239 ?auto_2236 ) ( ON ?auto_2233 ?auto_2232 ) ( not ( = ?auto_2232 ?auto_2233 ) ) ( not ( = ?auto_2232 ?auto_2234 ) ) ( not ( = ?auto_2232 ?auto_2235 ) ) ( not ( = ?auto_2232 ?auto_2238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2233 ?auto_2234 ?auto_2235 )
      ( MAKE-3CRATE-VERIFY ?auto_2232 ?auto_2233 ?auto_2234 ?auto_2235 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2260 - SURFACE
      ?auto_2261 - SURFACE
      ?auto_2262 - SURFACE
      ?auto_2263 - SURFACE
    )
    :vars
    (
      ?auto_2266 - HOIST
      ?auto_2268 - PLACE
      ?auto_2265 - PLACE
      ?auto_2267 - HOIST
      ?auto_2264 - SURFACE
      ?auto_2269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266 ?auto_2268 ) ( IS-CRATE ?auto_2263 ) ( not ( = ?auto_2262 ?auto_2263 ) ) ( not ( = ?auto_2261 ?auto_2262 ) ) ( not ( = ?auto_2261 ?auto_2263 ) ) ( not ( = ?auto_2265 ?auto_2268 ) ) ( HOIST-AT ?auto_2267 ?auto_2265 ) ( not ( = ?auto_2266 ?auto_2267 ) ) ( AVAILABLE ?auto_2267 ) ( SURFACE-AT ?auto_2263 ?auto_2265 ) ( ON ?auto_2263 ?auto_2264 ) ( CLEAR ?auto_2263 ) ( not ( = ?auto_2262 ?auto_2264 ) ) ( not ( = ?auto_2263 ?auto_2264 ) ) ( not ( = ?auto_2261 ?auto_2264 ) ) ( TRUCK-AT ?auto_2269 ?auto_2268 ) ( SURFACE-AT ?auto_2261 ?auto_2268 ) ( CLEAR ?auto_2261 ) ( LIFTING ?auto_2266 ?auto_2262 ) ( IS-CRATE ?auto_2262 ) ( ON ?auto_2261 ?auto_2260 ) ( not ( = ?auto_2260 ?auto_2261 ) ) ( not ( = ?auto_2260 ?auto_2262 ) ) ( not ( = ?auto_2260 ?auto_2263 ) ) ( not ( = ?auto_2260 ?auto_2264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2261 ?auto_2262 ?auto_2263 )
      ( MAKE-3CRATE-VERIFY ?auto_2260 ?auto_2261 ?auto_2262 ?auto_2263 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2288 - SURFACE
      ?auto_2289 - SURFACE
      ?auto_2290 - SURFACE
      ?auto_2291 - SURFACE
    )
    :vars
    (
      ?auto_2293 - HOIST
      ?auto_2294 - PLACE
      ?auto_2292 - PLACE
      ?auto_2296 - HOIST
      ?auto_2295 - SURFACE
      ?auto_2297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2293 ?auto_2294 ) ( IS-CRATE ?auto_2291 ) ( not ( = ?auto_2290 ?auto_2291 ) ) ( not ( = ?auto_2289 ?auto_2290 ) ) ( not ( = ?auto_2289 ?auto_2291 ) ) ( not ( = ?auto_2292 ?auto_2294 ) ) ( HOIST-AT ?auto_2296 ?auto_2292 ) ( not ( = ?auto_2293 ?auto_2296 ) ) ( AVAILABLE ?auto_2296 ) ( SURFACE-AT ?auto_2291 ?auto_2292 ) ( ON ?auto_2291 ?auto_2295 ) ( CLEAR ?auto_2291 ) ( not ( = ?auto_2290 ?auto_2295 ) ) ( not ( = ?auto_2291 ?auto_2295 ) ) ( not ( = ?auto_2289 ?auto_2295 ) ) ( TRUCK-AT ?auto_2297 ?auto_2294 ) ( SURFACE-AT ?auto_2289 ?auto_2294 ) ( CLEAR ?auto_2289 ) ( IS-CRATE ?auto_2290 ) ( AVAILABLE ?auto_2293 ) ( IN ?auto_2290 ?auto_2297 ) ( ON ?auto_2289 ?auto_2288 ) ( not ( = ?auto_2288 ?auto_2289 ) ) ( not ( = ?auto_2288 ?auto_2290 ) ) ( not ( = ?auto_2288 ?auto_2291 ) ) ( not ( = ?auto_2288 ?auto_2295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2289 ?auto_2290 ?auto_2291 )
      ( MAKE-3CRATE-VERIFY ?auto_2288 ?auto_2289 ?auto_2290 ?auto_2291 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2298 - SURFACE
      ?auto_2299 - SURFACE
    )
    :vars
    (
      ?auto_2301 - HOIST
      ?auto_2302 - PLACE
      ?auto_2306 - SURFACE
      ?auto_2300 - PLACE
      ?auto_2304 - HOIST
      ?auto_2303 - SURFACE
      ?auto_2305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2301 ?auto_2302 ) ( IS-CRATE ?auto_2299 ) ( not ( = ?auto_2298 ?auto_2299 ) ) ( not ( = ?auto_2306 ?auto_2298 ) ) ( not ( = ?auto_2306 ?auto_2299 ) ) ( not ( = ?auto_2300 ?auto_2302 ) ) ( HOIST-AT ?auto_2304 ?auto_2300 ) ( not ( = ?auto_2301 ?auto_2304 ) ) ( AVAILABLE ?auto_2304 ) ( SURFACE-AT ?auto_2299 ?auto_2300 ) ( ON ?auto_2299 ?auto_2303 ) ( CLEAR ?auto_2299 ) ( not ( = ?auto_2298 ?auto_2303 ) ) ( not ( = ?auto_2299 ?auto_2303 ) ) ( not ( = ?auto_2306 ?auto_2303 ) ) ( SURFACE-AT ?auto_2306 ?auto_2302 ) ( CLEAR ?auto_2306 ) ( IS-CRATE ?auto_2298 ) ( AVAILABLE ?auto_2301 ) ( IN ?auto_2298 ?auto_2305 ) ( TRUCK-AT ?auto_2305 ?auto_2300 ) )
    :subtasks
    ( ( !DRIVE ?auto_2305 ?auto_2300 ?auto_2302 )
      ( MAKE-2CRATE ?auto_2306 ?auto_2298 ?auto_2299 )
      ( MAKE-1CRATE-VERIFY ?auto_2298 ?auto_2299 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2307 - SURFACE
      ?auto_2308 - SURFACE
      ?auto_2309 - SURFACE
    )
    :vars
    (
      ?auto_2314 - HOIST
      ?auto_2311 - PLACE
      ?auto_2312 - PLACE
      ?auto_2315 - HOIST
      ?auto_2313 - SURFACE
      ?auto_2310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2314 ?auto_2311 ) ( IS-CRATE ?auto_2309 ) ( not ( = ?auto_2308 ?auto_2309 ) ) ( not ( = ?auto_2307 ?auto_2308 ) ) ( not ( = ?auto_2307 ?auto_2309 ) ) ( not ( = ?auto_2312 ?auto_2311 ) ) ( HOIST-AT ?auto_2315 ?auto_2312 ) ( not ( = ?auto_2314 ?auto_2315 ) ) ( AVAILABLE ?auto_2315 ) ( SURFACE-AT ?auto_2309 ?auto_2312 ) ( ON ?auto_2309 ?auto_2313 ) ( CLEAR ?auto_2309 ) ( not ( = ?auto_2308 ?auto_2313 ) ) ( not ( = ?auto_2309 ?auto_2313 ) ) ( not ( = ?auto_2307 ?auto_2313 ) ) ( SURFACE-AT ?auto_2307 ?auto_2311 ) ( CLEAR ?auto_2307 ) ( IS-CRATE ?auto_2308 ) ( AVAILABLE ?auto_2314 ) ( IN ?auto_2308 ?auto_2310 ) ( TRUCK-AT ?auto_2310 ?auto_2312 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2308 ?auto_2309 )
      ( MAKE-2CRATE-VERIFY ?auto_2307 ?auto_2308 ?auto_2309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2316 - SURFACE
      ?auto_2317 - SURFACE
      ?auto_2318 - SURFACE
      ?auto_2319 - SURFACE
    )
    :vars
    (
      ?auto_2322 - HOIST
      ?auto_2321 - PLACE
      ?auto_2323 - PLACE
      ?auto_2324 - HOIST
      ?auto_2325 - SURFACE
      ?auto_2320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2322 ?auto_2321 ) ( IS-CRATE ?auto_2319 ) ( not ( = ?auto_2318 ?auto_2319 ) ) ( not ( = ?auto_2317 ?auto_2318 ) ) ( not ( = ?auto_2317 ?auto_2319 ) ) ( not ( = ?auto_2323 ?auto_2321 ) ) ( HOIST-AT ?auto_2324 ?auto_2323 ) ( not ( = ?auto_2322 ?auto_2324 ) ) ( AVAILABLE ?auto_2324 ) ( SURFACE-AT ?auto_2319 ?auto_2323 ) ( ON ?auto_2319 ?auto_2325 ) ( CLEAR ?auto_2319 ) ( not ( = ?auto_2318 ?auto_2325 ) ) ( not ( = ?auto_2319 ?auto_2325 ) ) ( not ( = ?auto_2317 ?auto_2325 ) ) ( SURFACE-AT ?auto_2317 ?auto_2321 ) ( CLEAR ?auto_2317 ) ( IS-CRATE ?auto_2318 ) ( AVAILABLE ?auto_2322 ) ( IN ?auto_2318 ?auto_2320 ) ( TRUCK-AT ?auto_2320 ?auto_2323 ) ( ON ?auto_2317 ?auto_2316 ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2318 ) ) ( not ( = ?auto_2316 ?auto_2319 ) ) ( not ( = ?auto_2316 ?auto_2325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2317 ?auto_2318 ?auto_2319 )
      ( MAKE-3CRATE-VERIFY ?auto_2316 ?auto_2317 ?auto_2318 ?auto_2319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2326 - SURFACE
      ?auto_2327 - SURFACE
    )
    :vars
    (
      ?auto_2331 - HOIST
      ?auto_2329 - PLACE
      ?auto_2330 - SURFACE
      ?auto_2332 - PLACE
      ?auto_2333 - HOIST
      ?auto_2334 - SURFACE
      ?auto_2328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2331 ?auto_2329 ) ( IS-CRATE ?auto_2327 ) ( not ( = ?auto_2326 ?auto_2327 ) ) ( not ( = ?auto_2330 ?auto_2326 ) ) ( not ( = ?auto_2330 ?auto_2327 ) ) ( not ( = ?auto_2332 ?auto_2329 ) ) ( HOIST-AT ?auto_2333 ?auto_2332 ) ( not ( = ?auto_2331 ?auto_2333 ) ) ( SURFACE-AT ?auto_2327 ?auto_2332 ) ( ON ?auto_2327 ?auto_2334 ) ( CLEAR ?auto_2327 ) ( not ( = ?auto_2326 ?auto_2334 ) ) ( not ( = ?auto_2327 ?auto_2334 ) ) ( not ( = ?auto_2330 ?auto_2334 ) ) ( SURFACE-AT ?auto_2330 ?auto_2329 ) ( CLEAR ?auto_2330 ) ( IS-CRATE ?auto_2326 ) ( AVAILABLE ?auto_2331 ) ( TRUCK-AT ?auto_2328 ?auto_2332 ) ( LIFTING ?auto_2333 ?auto_2326 ) )
    :subtasks
    ( ( !LOAD ?auto_2333 ?auto_2326 ?auto_2328 ?auto_2332 )
      ( MAKE-2CRATE ?auto_2330 ?auto_2326 ?auto_2327 )
      ( MAKE-1CRATE-VERIFY ?auto_2326 ?auto_2327 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2335 - SURFACE
      ?auto_2336 - SURFACE
      ?auto_2337 - SURFACE
    )
    :vars
    (
      ?auto_2340 - HOIST
      ?auto_2338 - PLACE
      ?auto_2343 - PLACE
      ?auto_2341 - HOIST
      ?auto_2339 - SURFACE
      ?auto_2342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2340 ?auto_2338 ) ( IS-CRATE ?auto_2337 ) ( not ( = ?auto_2336 ?auto_2337 ) ) ( not ( = ?auto_2335 ?auto_2336 ) ) ( not ( = ?auto_2335 ?auto_2337 ) ) ( not ( = ?auto_2343 ?auto_2338 ) ) ( HOIST-AT ?auto_2341 ?auto_2343 ) ( not ( = ?auto_2340 ?auto_2341 ) ) ( SURFACE-AT ?auto_2337 ?auto_2343 ) ( ON ?auto_2337 ?auto_2339 ) ( CLEAR ?auto_2337 ) ( not ( = ?auto_2336 ?auto_2339 ) ) ( not ( = ?auto_2337 ?auto_2339 ) ) ( not ( = ?auto_2335 ?auto_2339 ) ) ( SURFACE-AT ?auto_2335 ?auto_2338 ) ( CLEAR ?auto_2335 ) ( IS-CRATE ?auto_2336 ) ( AVAILABLE ?auto_2340 ) ( TRUCK-AT ?auto_2342 ?auto_2343 ) ( LIFTING ?auto_2341 ?auto_2336 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2336 ?auto_2337 )
      ( MAKE-2CRATE-VERIFY ?auto_2335 ?auto_2336 ?auto_2337 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2344 - SURFACE
      ?auto_2345 - SURFACE
      ?auto_2346 - SURFACE
      ?auto_2347 - SURFACE
    )
    :vars
    (
      ?auto_2350 - HOIST
      ?auto_2348 - PLACE
      ?auto_2349 - PLACE
      ?auto_2352 - HOIST
      ?auto_2351 - SURFACE
      ?auto_2353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2350 ?auto_2348 ) ( IS-CRATE ?auto_2347 ) ( not ( = ?auto_2346 ?auto_2347 ) ) ( not ( = ?auto_2345 ?auto_2346 ) ) ( not ( = ?auto_2345 ?auto_2347 ) ) ( not ( = ?auto_2349 ?auto_2348 ) ) ( HOIST-AT ?auto_2352 ?auto_2349 ) ( not ( = ?auto_2350 ?auto_2352 ) ) ( SURFACE-AT ?auto_2347 ?auto_2349 ) ( ON ?auto_2347 ?auto_2351 ) ( CLEAR ?auto_2347 ) ( not ( = ?auto_2346 ?auto_2351 ) ) ( not ( = ?auto_2347 ?auto_2351 ) ) ( not ( = ?auto_2345 ?auto_2351 ) ) ( SURFACE-AT ?auto_2345 ?auto_2348 ) ( CLEAR ?auto_2345 ) ( IS-CRATE ?auto_2346 ) ( AVAILABLE ?auto_2350 ) ( TRUCK-AT ?auto_2353 ?auto_2349 ) ( LIFTING ?auto_2352 ?auto_2346 ) ( ON ?auto_2345 ?auto_2344 ) ( not ( = ?auto_2344 ?auto_2345 ) ) ( not ( = ?auto_2344 ?auto_2346 ) ) ( not ( = ?auto_2344 ?auto_2347 ) ) ( not ( = ?auto_2344 ?auto_2351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2345 ?auto_2346 ?auto_2347 )
      ( MAKE-3CRATE-VERIFY ?auto_2344 ?auto_2345 ?auto_2346 ?auto_2347 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2354 - SURFACE
      ?auto_2355 - SURFACE
    )
    :vars
    (
      ?auto_2358 - HOIST
      ?auto_2356 - PLACE
      ?auto_2362 - SURFACE
      ?auto_2357 - PLACE
      ?auto_2360 - HOIST
      ?auto_2359 - SURFACE
      ?auto_2361 - TRUCK
      ?auto_2363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2358 ?auto_2356 ) ( IS-CRATE ?auto_2355 ) ( not ( = ?auto_2354 ?auto_2355 ) ) ( not ( = ?auto_2362 ?auto_2354 ) ) ( not ( = ?auto_2362 ?auto_2355 ) ) ( not ( = ?auto_2357 ?auto_2356 ) ) ( HOIST-AT ?auto_2360 ?auto_2357 ) ( not ( = ?auto_2358 ?auto_2360 ) ) ( SURFACE-AT ?auto_2355 ?auto_2357 ) ( ON ?auto_2355 ?auto_2359 ) ( CLEAR ?auto_2355 ) ( not ( = ?auto_2354 ?auto_2359 ) ) ( not ( = ?auto_2355 ?auto_2359 ) ) ( not ( = ?auto_2362 ?auto_2359 ) ) ( SURFACE-AT ?auto_2362 ?auto_2356 ) ( CLEAR ?auto_2362 ) ( IS-CRATE ?auto_2354 ) ( AVAILABLE ?auto_2358 ) ( TRUCK-AT ?auto_2361 ?auto_2357 ) ( AVAILABLE ?auto_2360 ) ( SURFACE-AT ?auto_2354 ?auto_2357 ) ( ON ?auto_2354 ?auto_2363 ) ( CLEAR ?auto_2354 ) ( not ( = ?auto_2354 ?auto_2363 ) ) ( not ( = ?auto_2355 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( not ( = ?auto_2359 ?auto_2363 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2360 ?auto_2354 ?auto_2363 ?auto_2357 )
      ( MAKE-2CRATE ?auto_2362 ?auto_2354 ?auto_2355 )
      ( MAKE-1CRATE-VERIFY ?auto_2354 ?auto_2355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2364 - SURFACE
      ?auto_2365 - SURFACE
      ?auto_2366 - SURFACE
    )
    :vars
    (
      ?auto_2370 - HOIST
      ?auto_2372 - PLACE
      ?auto_2373 - PLACE
      ?auto_2368 - HOIST
      ?auto_2367 - SURFACE
      ?auto_2371 - TRUCK
      ?auto_2369 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2370 ?auto_2372 ) ( IS-CRATE ?auto_2366 ) ( not ( = ?auto_2365 ?auto_2366 ) ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2366 ) ) ( not ( = ?auto_2373 ?auto_2372 ) ) ( HOIST-AT ?auto_2368 ?auto_2373 ) ( not ( = ?auto_2370 ?auto_2368 ) ) ( SURFACE-AT ?auto_2366 ?auto_2373 ) ( ON ?auto_2366 ?auto_2367 ) ( CLEAR ?auto_2366 ) ( not ( = ?auto_2365 ?auto_2367 ) ) ( not ( = ?auto_2366 ?auto_2367 ) ) ( not ( = ?auto_2364 ?auto_2367 ) ) ( SURFACE-AT ?auto_2364 ?auto_2372 ) ( CLEAR ?auto_2364 ) ( IS-CRATE ?auto_2365 ) ( AVAILABLE ?auto_2370 ) ( TRUCK-AT ?auto_2371 ?auto_2373 ) ( AVAILABLE ?auto_2368 ) ( SURFACE-AT ?auto_2365 ?auto_2373 ) ( ON ?auto_2365 ?auto_2369 ) ( CLEAR ?auto_2365 ) ( not ( = ?auto_2365 ?auto_2369 ) ) ( not ( = ?auto_2366 ?auto_2369 ) ) ( not ( = ?auto_2364 ?auto_2369 ) ) ( not ( = ?auto_2367 ?auto_2369 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2365 ?auto_2366 )
      ( MAKE-2CRATE-VERIFY ?auto_2364 ?auto_2365 ?auto_2366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2374 - SURFACE
      ?auto_2375 - SURFACE
      ?auto_2376 - SURFACE
      ?auto_2377 - SURFACE
    )
    :vars
    (
      ?auto_2383 - HOIST
      ?auto_2384 - PLACE
      ?auto_2382 - PLACE
      ?auto_2379 - HOIST
      ?auto_2378 - SURFACE
      ?auto_2381 - TRUCK
      ?auto_2380 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2383 ?auto_2384 ) ( IS-CRATE ?auto_2377 ) ( not ( = ?auto_2376 ?auto_2377 ) ) ( not ( = ?auto_2375 ?auto_2376 ) ) ( not ( = ?auto_2375 ?auto_2377 ) ) ( not ( = ?auto_2382 ?auto_2384 ) ) ( HOIST-AT ?auto_2379 ?auto_2382 ) ( not ( = ?auto_2383 ?auto_2379 ) ) ( SURFACE-AT ?auto_2377 ?auto_2382 ) ( ON ?auto_2377 ?auto_2378 ) ( CLEAR ?auto_2377 ) ( not ( = ?auto_2376 ?auto_2378 ) ) ( not ( = ?auto_2377 ?auto_2378 ) ) ( not ( = ?auto_2375 ?auto_2378 ) ) ( SURFACE-AT ?auto_2375 ?auto_2384 ) ( CLEAR ?auto_2375 ) ( IS-CRATE ?auto_2376 ) ( AVAILABLE ?auto_2383 ) ( TRUCK-AT ?auto_2381 ?auto_2382 ) ( AVAILABLE ?auto_2379 ) ( SURFACE-AT ?auto_2376 ?auto_2382 ) ( ON ?auto_2376 ?auto_2380 ) ( CLEAR ?auto_2376 ) ( not ( = ?auto_2376 ?auto_2380 ) ) ( not ( = ?auto_2377 ?auto_2380 ) ) ( not ( = ?auto_2375 ?auto_2380 ) ) ( not ( = ?auto_2378 ?auto_2380 ) ) ( ON ?auto_2375 ?auto_2374 ) ( not ( = ?auto_2374 ?auto_2375 ) ) ( not ( = ?auto_2374 ?auto_2376 ) ) ( not ( = ?auto_2374 ?auto_2377 ) ) ( not ( = ?auto_2374 ?auto_2378 ) ) ( not ( = ?auto_2374 ?auto_2380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2375 ?auto_2376 ?auto_2377 )
      ( MAKE-3CRATE-VERIFY ?auto_2374 ?auto_2375 ?auto_2376 ?auto_2377 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2385 - SURFACE
      ?auto_2386 - SURFACE
    )
    :vars
    (
      ?auto_2392 - HOIST
      ?auto_2393 - PLACE
      ?auto_2394 - SURFACE
      ?auto_2391 - PLACE
      ?auto_2388 - HOIST
      ?auto_2387 - SURFACE
      ?auto_2389 - SURFACE
      ?auto_2390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392 ?auto_2393 ) ( IS-CRATE ?auto_2386 ) ( not ( = ?auto_2385 ?auto_2386 ) ) ( not ( = ?auto_2394 ?auto_2385 ) ) ( not ( = ?auto_2394 ?auto_2386 ) ) ( not ( = ?auto_2391 ?auto_2393 ) ) ( HOIST-AT ?auto_2388 ?auto_2391 ) ( not ( = ?auto_2392 ?auto_2388 ) ) ( SURFACE-AT ?auto_2386 ?auto_2391 ) ( ON ?auto_2386 ?auto_2387 ) ( CLEAR ?auto_2386 ) ( not ( = ?auto_2385 ?auto_2387 ) ) ( not ( = ?auto_2386 ?auto_2387 ) ) ( not ( = ?auto_2394 ?auto_2387 ) ) ( SURFACE-AT ?auto_2394 ?auto_2393 ) ( CLEAR ?auto_2394 ) ( IS-CRATE ?auto_2385 ) ( AVAILABLE ?auto_2392 ) ( AVAILABLE ?auto_2388 ) ( SURFACE-AT ?auto_2385 ?auto_2391 ) ( ON ?auto_2385 ?auto_2389 ) ( CLEAR ?auto_2385 ) ( not ( = ?auto_2385 ?auto_2389 ) ) ( not ( = ?auto_2386 ?auto_2389 ) ) ( not ( = ?auto_2394 ?auto_2389 ) ) ( not ( = ?auto_2387 ?auto_2389 ) ) ( TRUCK-AT ?auto_2390 ?auto_2393 ) )
    :subtasks
    ( ( !DRIVE ?auto_2390 ?auto_2393 ?auto_2391 )
      ( MAKE-2CRATE ?auto_2394 ?auto_2385 ?auto_2386 )
      ( MAKE-1CRATE-VERIFY ?auto_2385 ?auto_2386 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2395 - SURFACE
      ?auto_2396 - SURFACE
      ?auto_2397 - SURFACE
    )
    :vars
    (
      ?auto_2404 - HOIST
      ?auto_2402 - PLACE
      ?auto_2401 - PLACE
      ?auto_2403 - HOIST
      ?auto_2398 - SURFACE
      ?auto_2399 - SURFACE
      ?auto_2400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404 ?auto_2402 ) ( IS-CRATE ?auto_2397 ) ( not ( = ?auto_2396 ?auto_2397 ) ) ( not ( = ?auto_2395 ?auto_2396 ) ) ( not ( = ?auto_2395 ?auto_2397 ) ) ( not ( = ?auto_2401 ?auto_2402 ) ) ( HOIST-AT ?auto_2403 ?auto_2401 ) ( not ( = ?auto_2404 ?auto_2403 ) ) ( SURFACE-AT ?auto_2397 ?auto_2401 ) ( ON ?auto_2397 ?auto_2398 ) ( CLEAR ?auto_2397 ) ( not ( = ?auto_2396 ?auto_2398 ) ) ( not ( = ?auto_2397 ?auto_2398 ) ) ( not ( = ?auto_2395 ?auto_2398 ) ) ( SURFACE-AT ?auto_2395 ?auto_2402 ) ( CLEAR ?auto_2395 ) ( IS-CRATE ?auto_2396 ) ( AVAILABLE ?auto_2404 ) ( AVAILABLE ?auto_2403 ) ( SURFACE-AT ?auto_2396 ?auto_2401 ) ( ON ?auto_2396 ?auto_2399 ) ( CLEAR ?auto_2396 ) ( not ( = ?auto_2396 ?auto_2399 ) ) ( not ( = ?auto_2397 ?auto_2399 ) ) ( not ( = ?auto_2395 ?auto_2399 ) ) ( not ( = ?auto_2398 ?auto_2399 ) ) ( TRUCK-AT ?auto_2400 ?auto_2402 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2396 ?auto_2397 )
      ( MAKE-2CRATE-VERIFY ?auto_2395 ?auto_2396 ?auto_2397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2405 - SURFACE
      ?auto_2406 - SURFACE
      ?auto_2407 - SURFACE
      ?auto_2408 - SURFACE
    )
    :vars
    (
      ?auto_2415 - HOIST
      ?auto_2413 - PLACE
      ?auto_2414 - PLACE
      ?auto_2410 - HOIST
      ?auto_2411 - SURFACE
      ?auto_2412 - SURFACE
      ?auto_2409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2415 ?auto_2413 ) ( IS-CRATE ?auto_2408 ) ( not ( = ?auto_2407 ?auto_2408 ) ) ( not ( = ?auto_2406 ?auto_2407 ) ) ( not ( = ?auto_2406 ?auto_2408 ) ) ( not ( = ?auto_2414 ?auto_2413 ) ) ( HOIST-AT ?auto_2410 ?auto_2414 ) ( not ( = ?auto_2415 ?auto_2410 ) ) ( SURFACE-AT ?auto_2408 ?auto_2414 ) ( ON ?auto_2408 ?auto_2411 ) ( CLEAR ?auto_2408 ) ( not ( = ?auto_2407 ?auto_2411 ) ) ( not ( = ?auto_2408 ?auto_2411 ) ) ( not ( = ?auto_2406 ?auto_2411 ) ) ( SURFACE-AT ?auto_2406 ?auto_2413 ) ( CLEAR ?auto_2406 ) ( IS-CRATE ?auto_2407 ) ( AVAILABLE ?auto_2415 ) ( AVAILABLE ?auto_2410 ) ( SURFACE-AT ?auto_2407 ?auto_2414 ) ( ON ?auto_2407 ?auto_2412 ) ( CLEAR ?auto_2407 ) ( not ( = ?auto_2407 ?auto_2412 ) ) ( not ( = ?auto_2408 ?auto_2412 ) ) ( not ( = ?auto_2406 ?auto_2412 ) ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( TRUCK-AT ?auto_2409 ?auto_2413 ) ( ON ?auto_2406 ?auto_2405 ) ( not ( = ?auto_2405 ?auto_2406 ) ) ( not ( = ?auto_2405 ?auto_2407 ) ) ( not ( = ?auto_2405 ?auto_2408 ) ) ( not ( = ?auto_2405 ?auto_2411 ) ) ( not ( = ?auto_2405 ?auto_2412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2406 ?auto_2407 ?auto_2408 )
      ( MAKE-3CRATE-VERIFY ?auto_2405 ?auto_2406 ?auto_2407 ?auto_2408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2416 - SURFACE
      ?auto_2417 - SURFACE
    )
    :vars
    (
      ?auto_2425 - HOIST
      ?auto_2423 - PLACE
      ?auto_2418 - SURFACE
      ?auto_2424 - PLACE
      ?auto_2420 - HOIST
      ?auto_2421 - SURFACE
      ?auto_2422 - SURFACE
      ?auto_2419 - TRUCK
      ?auto_2426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2425 ?auto_2423 ) ( IS-CRATE ?auto_2417 ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( not ( = ?auto_2418 ?auto_2416 ) ) ( not ( = ?auto_2418 ?auto_2417 ) ) ( not ( = ?auto_2424 ?auto_2423 ) ) ( HOIST-AT ?auto_2420 ?auto_2424 ) ( not ( = ?auto_2425 ?auto_2420 ) ) ( SURFACE-AT ?auto_2417 ?auto_2424 ) ( ON ?auto_2417 ?auto_2421 ) ( CLEAR ?auto_2417 ) ( not ( = ?auto_2416 ?auto_2421 ) ) ( not ( = ?auto_2417 ?auto_2421 ) ) ( not ( = ?auto_2418 ?auto_2421 ) ) ( IS-CRATE ?auto_2416 ) ( AVAILABLE ?auto_2420 ) ( SURFACE-AT ?auto_2416 ?auto_2424 ) ( ON ?auto_2416 ?auto_2422 ) ( CLEAR ?auto_2416 ) ( not ( = ?auto_2416 ?auto_2422 ) ) ( not ( = ?auto_2417 ?auto_2422 ) ) ( not ( = ?auto_2418 ?auto_2422 ) ) ( not ( = ?auto_2421 ?auto_2422 ) ) ( TRUCK-AT ?auto_2419 ?auto_2423 ) ( SURFACE-AT ?auto_2426 ?auto_2423 ) ( CLEAR ?auto_2426 ) ( LIFTING ?auto_2425 ?auto_2418 ) ( IS-CRATE ?auto_2418 ) ( not ( = ?auto_2426 ?auto_2418 ) ) ( not ( = ?auto_2416 ?auto_2426 ) ) ( not ( = ?auto_2417 ?auto_2426 ) ) ( not ( = ?auto_2421 ?auto_2426 ) ) ( not ( = ?auto_2422 ?auto_2426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2426 ?auto_2418 )
      ( MAKE-2CRATE ?auto_2418 ?auto_2416 ?auto_2417 )
      ( MAKE-1CRATE-VERIFY ?auto_2416 ?auto_2417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2427 - SURFACE
      ?auto_2428 - SURFACE
      ?auto_2429 - SURFACE
    )
    :vars
    (
      ?auto_2433 - HOIST
      ?auto_2434 - PLACE
      ?auto_2432 - PLACE
      ?auto_2430 - HOIST
      ?auto_2431 - SURFACE
      ?auto_2435 - SURFACE
      ?auto_2436 - TRUCK
      ?auto_2437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2433 ?auto_2434 ) ( IS-CRATE ?auto_2429 ) ( not ( = ?auto_2428 ?auto_2429 ) ) ( not ( = ?auto_2427 ?auto_2428 ) ) ( not ( = ?auto_2427 ?auto_2429 ) ) ( not ( = ?auto_2432 ?auto_2434 ) ) ( HOIST-AT ?auto_2430 ?auto_2432 ) ( not ( = ?auto_2433 ?auto_2430 ) ) ( SURFACE-AT ?auto_2429 ?auto_2432 ) ( ON ?auto_2429 ?auto_2431 ) ( CLEAR ?auto_2429 ) ( not ( = ?auto_2428 ?auto_2431 ) ) ( not ( = ?auto_2429 ?auto_2431 ) ) ( not ( = ?auto_2427 ?auto_2431 ) ) ( IS-CRATE ?auto_2428 ) ( AVAILABLE ?auto_2430 ) ( SURFACE-AT ?auto_2428 ?auto_2432 ) ( ON ?auto_2428 ?auto_2435 ) ( CLEAR ?auto_2428 ) ( not ( = ?auto_2428 ?auto_2435 ) ) ( not ( = ?auto_2429 ?auto_2435 ) ) ( not ( = ?auto_2427 ?auto_2435 ) ) ( not ( = ?auto_2431 ?auto_2435 ) ) ( TRUCK-AT ?auto_2436 ?auto_2434 ) ( SURFACE-AT ?auto_2437 ?auto_2434 ) ( CLEAR ?auto_2437 ) ( LIFTING ?auto_2433 ?auto_2427 ) ( IS-CRATE ?auto_2427 ) ( not ( = ?auto_2437 ?auto_2427 ) ) ( not ( = ?auto_2428 ?auto_2437 ) ) ( not ( = ?auto_2429 ?auto_2437 ) ) ( not ( = ?auto_2431 ?auto_2437 ) ) ( not ( = ?auto_2435 ?auto_2437 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2428 ?auto_2429 )
      ( MAKE-2CRATE-VERIFY ?auto_2427 ?auto_2428 ?auto_2429 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2438 - SURFACE
      ?auto_2439 - SURFACE
      ?auto_2440 - SURFACE
      ?auto_2441 - SURFACE
    )
    :vars
    (
      ?auto_2448 - HOIST
      ?auto_2443 - PLACE
      ?auto_2447 - PLACE
      ?auto_2442 - HOIST
      ?auto_2446 - SURFACE
      ?auto_2445 - SURFACE
      ?auto_2444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2448 ?auto_2443 ) ( IS-CRATE ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2441 ) ) ( not ( = ?auto_2439 ?auto_2440 ) ) ( not ( = ?auto_2439 ?auto_2441 ) ) ( not ( = ?auto_2447 ?auto_2443 ) ) ( HOIST-AT ?auto_2442 ?auto_2447 ) ( not ( = ?auto_2448 ?auto_2442 ) ) ( SURFACE-AT ?auto_2441 ?auto_2447 ) ( ON ?auto_2441 ?auto_2446 ) ( CLEAR ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2446 ) ) ( not ( = ?auto_2441 ?auto_2446 ) ) ( not ( = ?auto_2439 ?auto_2446 ) ) ( IS-CRATE ?auto_2440 ) ( AVAILABLE ?auto_2442 ) ( SURFACE-AT ?auto_2440 ?auto_2447 ) ( ON ?auto_2440 ?auto_2445 ) ( CLEAR ?auto_2440 ) ( not ( = ?auto_2440 ?auto_2445 ) ) ( not ( = ?auto_2441 ?auto_2445 ) ) ( not ( = ?auto_2439 ?auto_2445 ) ) ( not ( = ?auto_2446 ?auto_2445 ) ) ( TRUCK-AT ?auto_2444 ?auto_2443 ) ( SURFACE-AT ?auto_2438 ?auto_2443 ) ( CLEAR ?auto_2438 ) ( LIFTING ?auto_2448 ?auto_2439 ) ( IS-CRATE ?auto_2439 ) ( not ( = ?auto_2438 ?auto_2439 ) ) ( not ( = ?auto_2440 ?auto_2438 ) ) ( not ( = ?auto_2441 ?auto_2438 ) ) ( not ( = ?auto_2446 ?auto_2438 ) ) ( not ( = ?auto_2445 ?auto_2438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2439 ?auto_2440 ?auto_2441 )
      ( MAKE-3CRATE-VERIFY ?auto_2438 ?auto_2439 ?auto_2440 ?auto_2441 ) )
  )

)

