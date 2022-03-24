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
      ?auto_1873 - BLOCK
      ?auto_1874 - BLOCK
      ?auto_1875 - BLOCK
    )
    :vars
    (
      ?auto_1876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1876 ?auto_1875 ) ( CLEAR ?auto_1876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1873 ) ( ON ?auto_1874 ?auto_1873 ) ( ON ?auto_1875 ?auto_1874 ) ( not ( = ?auto_1873 ?auto_1874 ) ) ( not ( = ?auto_1873 ?auto_1875 ) ) ( not ( = ?auto_1873 ?auto_1876 ) ) ( not ( = ?auto_1874 ?auto_1875 ) ) ( not ( = ?auto_1874 ?auto_1876 ) ) ( not ( = ?auto_1875 ?auto_1876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1876 ?auto_1875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1878 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1879 - BLOCK
    )
    :vars
    (
      ?auto_1880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1879 ?auto_1880 ) ( CLEAR ?auto_1879 ) ( HAND-EMPTY ) ( not ( = ?auto_1879 ?auto_1880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1879 ?auto_1880 )
      ( MAKE-1PILE ?auto_1879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1883 - BLOCK
      ?auto_1884 - BLOCK
    )
    :vars
    (
      ?auto_1885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1885 ?auto_1884 ) ( CLEAR ?auto_1885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1883 ) ( ON ?auto_1884 ?auto_1883 ) ( not ( = ?auto_1883 ?auto_1884 ) ) ( not ( = ?auto_1883 ?auto_1885 ) ) ( not ( = ?auto_1884 ?auto_1885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1885 ?auto_1884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1886 - BLOCK
      ?auto_1887 - BLOCK
    )
    :vars
    (
      ?auto_1888 - BLOCK
      ?auto_1889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1888 ?auto_1887 ) ( CLEAR ?auto_1888 ) ( ON-TABLE ?auto_1886 ) ( ON ?auto_1887 ?auto_1886 ) ( not ( = ?auto_1886 ?auto_1887 ) ) ( not ( = ?auto_1886 ?auto_1888 ) ) ( not ( = ?auto_1887 ?auto_1888 ) ) ( HOLDING ?auto_1889 ) ( not ( = ?auto_1886 ?auto_1889 ) ) ( not ( = ?auto_1887 ?auto_1889 ) ) ( not ( = ?auto_1888 ?auto_1889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1889 )
      ( MAKE-2PILE ?auto_1886 ?auto_1887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1890 - BLOCK
      ?auto_1891 - BLOCK
    )
    :vars
    (
      ?auto_1892 - BLOCK
      ?auto_1893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1892 ?auto_1891 ) ( ON-TABLE ?auto_1890 ) ( ON ?auto_1891 ?auto_1890 ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( not ( = ?auto_1890 ?auto_1892 ) ) ( not ( = ?auto_1891 ?auto_1892 ) ) ( not ( = ?auto_1890 ?auto_1893 ) ) ( not ( = ?auto_1891 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1893 ) ) ( ON ?auto_1893 ?auto_1892 ) ( CLEAR ?auto_1893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1890 ?auto_1891 ?auto_1892 )
      ( MAKE-2PILE ?auto_1890 ?auto_1891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1896 - BLOCK
      ?auto_1897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1897 ) ( CLEAR ?auto_1896 ) ( ON-TABLE ?auto_1896 ) ( not ( = ?auto_1896 ?auto_1897 ) ) )
    :subtasks
    ( ( !STACK ?auto_1897 ?auto_1896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1898 - BLOCK
      ?auto_1899 - BLOCK
    )
    :vars
    (
      ?auto_1900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1898 ) ( ON-TABLE ?auto_1898 ) ( not ( = ?auto_1898 ?auto_1899 ) ) ( ON ?auto_1899 ?auto_1900 ) ( CLEAR ?auto_1899 ) ( HAND-EMPTY ) ( not ( = ?auto_1898 ?auto_1900 ) ) ( not ( = ?auto_1899 ?auto_1900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1899 ?auto_1900 )
      ( MAKE-2PILE ?auto_1898 ?auto_1899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1901 - BLOCK
      ?auto_1902 - BLOCK
    )
    :vars
    (
      ?auto_1903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1901 ?auto_1902 ) ) ( ON ?auto_1902 ?auto_1903 ) ( CLEAR ?auto_1902 ) ( not ( = ?auto_1901 ?auto_1903 ) ) ( not ( = ?auto_1902 ?auto_1903 ) ) ( HOLDING ?auto_1901 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1901 )
      ( MAKE-2PILE ?auto_1901 ?auto_1902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1904 - BLOCK
      ?auto_1905 - BLOCK
    )
    :vars
    (
      ?auto_1906 - BLOCK
      ?auto_1907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1904 ?auto_1905 ) ) ( ON ?auto_1905 ?auto_1906 ) ( not ( = ?auto_1904 ?auto_1906 ) ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( ON ?auto_1904 ?auto_1905 ) ( CLEAR ?auto_1904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1907 ) ( ON ?auto_1906 ?auto_1907 ) ( not ( = ?auto_1907 ?auto_1906 ) ) ( not ( = ?auto_1907 ?auto_1905 ) ) ( not ( = ?auto_1907 ?auto_1904 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1907 ?auto_1906 ?auto_1905 )
      ( MAKE-2PILE ?auto_1904 ?auto_1905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1909 - BLOCK
    )
    :vars
    (
      ?auto_1910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1910 ?auto_1909 ) ( CLEAR ?auto_1910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1909 ) ( not ( = ?auto_1909 ?auto_1910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1910 ?auto_1909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1911 - BLOCK
    )
    :vars
    (
      ?auto_1912 - BLOCK
      ?auto_1913 - BLOCK
      ?auto_1914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1912 ?auto_1911 ) ( CLEAR ?auto_1912 ) ( ON-TABLE ?auto_1911 ) ( not ( = ?auto_1911 ?auto_1912 ) ) ( HOLDING ?auto_1913 ) ( CLEAR ?auto_1914 ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1914 ) ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1914 ) ) )
    :subtasks
    ( ( !STACK ?auto_1913 ?auto_1914 )
      ( MAKE-1PILE ?auto_1911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1915 - BLOCK
    )
    :vars
    (
      ?auto_1918 - BLOCK
      ?auto_1916 - BLOCK
      ?auto_1917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1918 ?auto_1915 ) ( ON-TABLE ?auto_1915 ) ( not ( = ?auto_1915 ?auto_1918 ) ) ( CLEAR ?auto_1916 ) ( not ( = ?auto_1915 ?auto_1917 ) ) ( not ( = ?auto_1915 ?auto_1916 ) ) ( not ( = ?auto_1918 ?auto_1917 ) ) ( not ( = ?auto_1918 ?auto_1916 ) ) ( not ( = ?auto_1917 ?auto_1916 ) ) ( ON ?auto_1917 ?auto_1918 ) ( CLEAR ?auto_1917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1915 ?auto_1918 )
      ( MAKE-1PILE ?auto_1915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1919 - BLOCK
    )
    :vars
    (
      ?auto_1921 - BLOCK
      ?auto_1920 - BLOCK
      ?auto_1922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1921 ?auto_1919 ) ( ON-TABLE ?auto_1919 ) ( not ( = ?auto_1919 ?auto_1921 ) ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1919 ?auto_1922 ) ) ( not ( = ?auto_1921 ?auto_1920 ) ) ( not ( = ?auto_1921 ?auto_1922 ) ) ( not ( = ?auto_1920 ?auto_1922 ) ) ( ON ?auto_1920 ?auto_1921 ) ( CLEAR ?auto_1920 ) ( HOLDING ?auto_1922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1922 )
      ( MAKE-1PILE ?auto_1919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1923 - BLOCK
    )
    :vars
    (
      ?auto_1925 - BLOCK
      ?auto_1924 - BLOCK
      ?auto_1926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1925 ?auto_1923 ) ( ON-TABLE ?auto_1923 ) ( not ( = ?auto_1923 ?auto_1925 ) ) ( not ( = ?auto_1923 ?auto_1924 ) ) ( not ( = ?auto_1923 ?auto_1926 ) ) ( not ( = ?auto_1925 ?auto_1924 ) ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( not ( = ?auto_1924 ?auto_1926 ) ) ( ON ?auto_1924 ?auto_1925 ) ( ON ?auto_1926 ?auto_1924 ) ( CLEAR ?auto_1926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1923 ?auto_1925 ?auto_1924 )
      ( MAKE-1PILE ?auto_1923 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1930 - BLOCK
      ?auto_1931 - BLOCK
      ?auto_1932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1932 ) ( CLEAR ?auto_1931 ) ( ON-TABLE ?auto_1930 ) ( ON ?auto_1931 ?auto_1930 ) ( not ( = ?auto_1930 ?auto_1931 ) ) ( not ( = ?auto_1930 ?auto_1932 ) ) ( not ( = ?auto_1931 ?auto_1932 ) ) )
    :subtasks
    ( ( !STACK ?auto_1932 ?auto_1931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1933 - BLOCK
      ?auto_1934 - BLOCK
      ?auto_1935 - BLOCK
    )
    :vars
    (
      ?auto_1936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1934 ) ( ON-TABLE ?auto_1933 ) ( ON ?auto_1934 ?auto_1933 ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1933 ?auto_1935 ) ) ( not ( = ?auto_1934 ?auto_1935 ) ) ( ON ?auto_1935 ?auto_1936 ) ( CLEAR ?auto_1935 ) ( HAND-EMPTY ) ( not ( = ?auto_1933 ?auto_1936 ) ) ( not ( = ?auto_1934 ?auto_1936 ) ) ( not ( = ?auto_1935 ?auto_1936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1935 ?auto_1936 )
      ( MAKE-3PILE ?auto_1933 ?auto_1934 ?auto_1935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1937 - BLOCK
      ?auto_1938 - BLOCK
      ?auto_1939 - BLOCK
    )
    :vars
    (
      ?auto_1940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1937 ) ( not ( = ?auto_1937 ?auto_1938 ) ) ( not ( = ?auto_1937 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( ON ?auto_1939 ?auto_1940 ) ( CLEAR ?auto_1939 ) ( not ( = ?auto_1937 ?auto_1940 ) ) ( not ( = ?auto_1938 ?auto_1940 ) ) ( not ( = ?auto_1939 ?auto_1940 ) ) ( HOLDING ?auto_1938 ) ( CLEAR ?auto_1937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1937 ?auto_1938 )
      ( MAKE-3PILE ?auto_1937 ?auto_1938 ?auto_1939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1941 - BLOCK
      ?auto_1942 - BLOCK
      ?auto_1943 - BLOCK
    )
    :vars
    (
      ?auto_1944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1941 ) ( not ( = ?auto_1941 ?auto_1942 ) ) ( not ( = ?auto_1941 ?auto_1943 ) ) ( not ( = ?auto_1942 ?auto_1943 ) ) ( ON ?auto_1943 ?auto_1944 ) ( not ( = ?auto_1941 ?auto_1944 ) ) ( not ( = ?auto_1942 ?auto_1944 ) ) ( not ( = ?auto_1943 ?auto_1944 ) ) ( CLEAR ?auto_1941 ) ( ON ?auto_1942 ?auto_1943 ) ( CLEAR ?auto_1942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1944 ?auto_1943 )
      ( MAKE-3PILE ?auto_1941 ?auto_1942 ?auto_1943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1945 - BLOCK
      ?auto_1946 - BLOCK
      ?auto_1947 - BLOCK
    )
    :vars
    (
      ?auto_1948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1945 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( ON ?auto_1947 ?auto_1948 ) ( not ( = ?auto_1945 ?auto_1948 ) ) ( not ( = ?auto_1946 ?auto_1948 ) ) ( not ( = ?auto_1947 ?auto_1948 ) ) ( ON ?auto_1946 ?auto_1947 ) ( CLEAR ?auto_1946 ) ( ON-TABLE ?auto_1948 ) ( HOLDING ?auto_1945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1945 )
      ( MAKE-3PILE ?auto_1945 ?auto_1946 ?auto_1947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1949 - BLOCK
      ?auto_1950 - BLOCK
      ?auto_1951 - BLOCK
    )
    :vars
    (
      ?auto_1952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1949 ?auto_1950 ) ) ( not ( = ?auto_1949 ?auto_1951 ) ) ( not ( = ?auto_1950 ?auto_1951 ) ) ( ON ?auto_1951 ?auto_1952 ) ( not ( = ?auto_1949 ?auto_1952 ) ) ( not ( = ?auto_1950 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( ON ?auto_1950 ?auto_1951 ) ( ON-TABLE ?auto_1952 ) ( ON ?auto_1949 ?auto_1950 ) ( CLEAR ?auto_1949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1952 ?auto_1951 ?auto_1950 )
      ( MAKE-3PILE ?auto_1949 ?auto_1950 ?auto_1951 ) )
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
    ( and ( ON ?auto_1957 ?auto_1956 ) ( CLEAR ?auto_1957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1955 ) ( ON ?auto_1956 ?auto_1955 ) ( not ( = ?auto_1955 ?auto_1956 ) ) ( not ( = ?auto_1955 ?auto_1957 ) ) ( not ( = ?auto_1956 ?auto_1957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1957 ?auto_1956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1965 - BLOCK
      ?auto_1966 - BLOCK
    )
    :vars
    (
      ?auto_1967 - BLOCK
      ?auto_1968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1965 ) ( not ( = ?auto_1965 ?auto_1966 ) ) ( not ( = ?auto_1965 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( ON ?auto_1967 ?auto_1968 ) ( CLEAR ?auto_1967 ) ( not ( = ?auto_1965 ?auto_1968 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1967 ?auto_1968 ) ) ( HOLDING ?auto_1966 ) ( CLEAR ?auto_1965 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1965 ?auto_1966 ?auto_1967 )
      ( MAKE-2PILE ?auto_1965 ?auto_1966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1969 - BLOCK
      ?auto_1970 - BLOCK
    )
    :vars
    (
      ?auto_1972 - BLOCK
      ?auto_1971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1969 ) ( not ( = ?auto_1969 ?auto_1970 ) ) ( not ( = ?auto_1969 ?auto_1972 ) ) ( not ( = ?auto_1970 ?auto_1972 ) ) ( ON ?auto_1972 ?auto_1971 ) ( not ( = ?auto_1969 ?auto_1971 ) ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( not ( = ?auto_1972 ?auto_1971 ) ) ( CLEAR ?auto_1969 ) ( ON ?auto_1970 ?auto_1972 ) ( CLEAR ?auto_1970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1971 ?auto_1972 )
      ( MAKE-2PILE ?auto_1969 ?auto_1970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1973 - BLOCK
      ?auto_1974 - BLOCK
    )
    :vars
    (
      ?auto_1975 - BLOCK
      ?auto_1976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1973 ?auto_1974 ) ) ( not ( = ?auto_1973 ?auto_1975 ) ) ( not ( = ?auto_1974 ?auto_1975 ) ) ( ON ?auto_1975 ?auto_1976 ) ( not ( = ?auto_1973 ?auto_1976 ) ) ( not ( = ?auto_1974 ?auto_1976 ) ) ( not ( = ?auto_1975 ?auto_1976 ) ) ( ON ?auto_1974 ?auto_1975 ) ( CLEAR ?auto_1974 ) ( ON-TABLE ?auto_1976 ) ( HOLDING ?auto_1973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1973 )
      ( MAKE-2PILE ?auto_1973 ?auto_1974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1977 - BLOCK
      ?auto_1978 - BLOCK
    )
    :vars
    (
      ?auto_1979 - BLOCK
      ?auto_1980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( ON ?auto_1979 ?auto_1980 ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( not ( = ?auto_1978 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( ON ?auto_1978 ?auto_1979 ) ( ON-TABLE ?auto_1980 ) ( ON ?auto_1977 ?auto_1978 ) ( CLEAR ?auto_1977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1980 ?auto_1979 ?auto_1978 )
      ( MAKE-2PILE ?auto_1977 ?auto_1978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1982 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1983 - BLOCK
    )
    :vars
    (
      ?auto_1984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1983 ?auto_1984 ) ( CLEAR ?auto_1983 ) ( HAND-EMPTY ) ( not ( = ?auto_1983 ?auto_1984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1983 ?auto_1984 )
      ( MAKE-1PILE ?auto_1983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1985 - BLOCK
    )
    :vars
    (
      ?auto_1986 - BLOCK
      ?auto_1987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1985 ?auto_1986 ) ) ( HOLDING ?auto_1985 ) ( CLEAR ?auto_1986 ) ( ON-TABLE ?auto_1987 ) ( ON ?auto_1986 ?auto_1987 ) ( not ( = ?auto_1987 ?auto_1986 ) ) ( not ( = ?auto_1987 ?auto_1985 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1987 ?auto_1986 ?auto_1985 )
      ( MAKE-1PILE ?auto_1985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1988 - BLOCK
    )
    :vars
    (
      ?auto_1989 - BLOCK
      ?auto_1990 - BLOCK
      ?auto_1991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1988 ?auto_1989 ) ) ( CLEAR ?auto_1989 ) ( ON-TABLE ?auto_1990 ) ( ON ?auto_1989 ?auto_1990 ) ( not ( = ?auto_1990 ?auto_1989 ) ) ( not ( = ?auto_1990 ?auto_1988 ) ) ( ON ?auto_1988 ?auto_1991 ) ( CLEAR ?auto_1988 ) ( HAND-EMPTY ) ( not ( = ?auto_1988 ?auto_1991 ) ) ( not ( = ?auto_1989 ?auto_1991 ) ) ( not ( = ?auto_1990 ?auto_1991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1988 ?auto_1991 )
      ( MAKE-1PILE ?auto_1988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1992 - BLOCK
    )
    :vars
    (
      ?auto_1994 - BLOCK
      ?auto_1993 - BLOCK
      ?auto_1995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1992 ?auto_1994 ) ) ( ON-TABLE ?auto_1993 ) ( not ( = ?auto_1993 ?auto_1994 ) ) ( not ( = ?auto_1993 ?auto_1992 ) ) ( ON ?auto_1992 ?auto_1995 ) ( CLEAR ?auto_1992 ) ( not ( = ?auto_1992 ?auto_1995 ) ) ( not ( = ?auto_1994 ?auto_1995 ) ) ( not ( = ?auto_1993 ?auto_1995 ) ) ( HOLDING ?auto_1994 ) ( CLEAR ?auto_1993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1993 ?auto_1994 )
      ( MAKE-1PILE ?auto_1992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1996 - BLOCK
    )
    :vars
    (
      ?auto_1998 - BLOCK
      ?auto_1997 - BLOCK
      ?auto_1999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1996 ?auto_1998 ) ) ( ON-TABLE ?auto_1997 ) ( not ( = ?auto_1997 ?auto_1998 ) ) ( not ( = ?auto_1997 ?auto_1996 ) ) ( ON ?auto_1996 ?auto_1999 ) ( not ( = ?auto_1996 ?auto_1999 ) ) ( not ( = ?auto_1998 ?auto_1999 ) ) ( not ( = ?auto_1997 ?auto_1999 ) ) ( CLEAR ?auto_1997 ) ( ON ?auto_1998 ?auto_1996 ) ( CLEAR ?auto_1998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1999 ?auto_1996 )
      ( MAKE-1PILE ?auto_1996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2000 - BLOCK
    )
    :vars
    (
      ?auto_2003 - BLOCK
      ?auto_2002 - BLOCK
      ?auto_2001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2000 ?auto_2003 ) ) ( not ( = ?auto_2002 ?auto_2003 ) ) ( not ( = ?auto_2002 ?auto_2000 ) ) ( ON ?auto_2000 ?auto_2001 ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( not ( = ?auto_2003 ?auto_2001 ) ) ( not ( = ?auto_2002 ?auto_2001 ) ) ( ON ?auto_2003 ?auto_2000 ) ( CLEAR ?auto_2003 ) ( ON-TABLE ?auto_2001 ) ( HOLDING ?auto_2002 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2002 )
      ( MAKE-1PILE ?auto_2000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2004 - BLOCK
    )
    :vars
    (
      ?auto_2007 - BLOCK
      ?auto_2005 - BLOCK
      ?auto_2006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2004 ?auto_2007 ) ) ( not ( = ?auto_2005 ?auto_2007 ) ) ( not ( = ?auto_2005 ?auto_2004 ) ) ( ON ?auto_2004 ?auto_2006 ) ( not ( = ?auto_2004 ?auto_2006 ) ) ( not ( = ?auto_2007 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( ON ?auto_2007 ?auto_2004 ) ( ON-TABLE ?auto_2006 ) ( ON ?auto_2005 ?auto_2007 ) ( CLEAR ?auto_2005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2006 ?auto_2004 ?auto_2007 )
      ( MAKE-1PILE ?auto_2004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2009 - BLOCK
    )
    :vars
    (
      ?auto_2010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2010 ?auto_2009 ) ( CLEAR ?auto_2010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2009 ) ( not ( = ?auto_2009 ?auto_2010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2010 ?auto_2009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2011 - BLOCK
    )
    :vars
    (
      ?auto_2012 - BLOCK
      ?auto_2013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2012 ?auto_2011 ) ( CLEAR ?auto_2012 ) ( ON-TABLE ?auto_2011 ) ( not ( = ?auto_2011 ?auto_2012 ) ) ( HOLDING ?auto_2013 ) ( not ( = ?auto_2011 ?auto_2013 ) ) ( not ( = ?auto_2012 ?auto_2013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2013 )
      ( MAKE-1PILE ?auto_2011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2014 - BLOCK
    )
    :vars
    (
      ?auto_2016 - BLOCK
      ?auto_2015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2016 ?auto_2014 ) ( ON-TABLE ?auto_2014 ) ( not ( = ?auto_2014 ?auto_2016 ) ) ( not ( = ?auto_2014 ?auto_2015 ) ) ( not ( = ?auto_2016 ?auto_2015 ) ) ( ON ?auto_2015 ?auto_2016 ) ( CLEAR ?auto_2015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2014 ?auto_2016 )
      ( MAKE-1PILE ?auto_2014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2017 - BLOCK
    )
    :vars
    (
      ?auto_2019 - BLOCK
      ?auto_2018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2019 ?auto_2017 ) ( ON-TABLE ?auto_2017 ) ( not ( = ?auto_2017 ?auto_2019 ) ) ( not ( = ?auto_2017 ?auto_2018 ) ) ( not ( = ?auto_2019 ?auto_2018 ) ) ( HOLDING ?auto_2018 ) ( CLEAR ?auto_2019 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2017 ?auto_2019 ?auto_2018 )
      ( MAKE-1PILE ?auto_2017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2020 - BLOCK
    )
    :vars
    (
      ?auto_2021 - BLOCK
      ?auto_2022 - BLOCK
      ?auto_2023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2021 ?auto_2020 ) ( ON-TABLE ?auto_2020 ) ( not ( = ?auto_2020 ?auto_2021 ) ) ( not ( = ?auto_2020 ?auto_2022 ) ) ( not ( = ?auto_2021 ?auto_2022 ) ) ( CLEAR ?auto_2021 ) ( ON ?auto_2022 ?auto_2023 ) ( CLEAR ?auto_2022 ) ( HAND-EMPTY ) ( not ( = ?auto_2020 ?auto_2023 ) ) ( not ( = ?auto_2021 ?auto_2023 ) ) ( not ( = ?auto_2022 ?auto_2023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2022 ?auto_2023 )
      ( MAKE-1PILE ?auto_2020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2032 - BLOCK
    )
    :vars
    (
      ?auto_2034 - BLOCK
      ?auto_2035 - BLOCK
      ?auto_2033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2032 ?auto_2034 ) ) ( not ( = ?auto_2032 ?auto_2035 ) ) ( not ( = ?auto_2034 ?auto_2035 ) ) ( ON ?auto_2035 ?auto_2033 ) ( not ( = ?auto_2032 ?auto_2033 ) ) ( not ( = ?auto_2034 ?auto_2033 ) ) ( not ( = ?auto_2035 ?auto_2033 ) ) ( ON ?auto_2034 ?auto_2035 ) ( CLEAR ?auto_2034 ) ( HOLDING ?auto_2032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2032 ?auto_2034 )
      ( MAKE-1PILE ?auto_2032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2036 - BLOCK
    )
    :vars
    (
      ?auto_2038 - BLOCK
      ?auto_2039 - BLOCK
      ?auto_2037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2036 ?auto_2038 ) ) ( not ( = ?auto_2036 ?auto_2039 ) ) ( not ( = ?auto_2038 ?auto_2039 ) ) ( ON ?auto_2039 ?auto_2037 ) ( not ( = ?auto_2036 ?auto_2037 ) ) ( not ( = ?auto_2038 ?auto_2037 ) ) ( not ( = ?auto_2039 ?auto_2037 ) ) ( ON ?auto_2038 ?auto_2039 ) ( ON ?auto_2036 ?auto_2038 ) ( CLEAR ?auto_2036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2037 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2037 ?auto_2039 ?auto_2038 )
      ( MAKE-1PILE ?auto_2036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2042 - BLOCK
      ?auto_2043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2043 ) ( CLEAR ?auto_2042 ) ( ON-TABLE ?auto_2042 ) ( not ( = ?auto_2042 ?auto_2043 ) ) )
    :subtasks
    ( ( !STACK ?auto_2043 ?auto_2042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2044 - BLOCK
      ?auto_2045 - BLOCK
    )
    :vars
    (
      ?auto_2046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2044 ) ( ON-TABLE ?auto_2044 ) ( not ( = ?auto_2044 ?auto_2045 ) ) ( ON ?auto_2045 ?auto_2046 ) ( CLEAR ?auto_2045 ) ( HAND-EMPTY ) ( not ( = ?auto_2044 ?auto_2046 ) ) ( not ( = ?auto_2045 ?auto_2046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2045 ?auto_2046 )
      ( MAKE-2PILE ?auto_2044 ?auto_2045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2047 - BLOCK
      ?auto_2048 - BLOCK
    )
    :vars
    (
      ?auto_2049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2047 ?auto_2048 ) ) ( ON ?auto_2048 ?auto_2049 ) ( CLEAR ?auto_2048 ) ( not ( = ?auto_2047 ?auto_2049 ) ) ( not ( = ?auto_2048 ?auto_2049 ) ) ( HOLDING ?auto_2047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2047 )
      ( MAKE-2PILE ?auto_2047 ?auto_2048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2050 - BLOCK
      ?auto_2051 - BLOCK
    )
    :vars
    (
      ?auto_2052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2050 ?auto_2051 ) ) ( ON ?auto_2051 ?auto_2052 ) ( not ( = ?auto_2050 ?auto_2052 ) ) ( not ( = ?auto_2051 ?auto_2052 ) ) ( ON ?auto_2050 ?auto_2051 ) ( CLEAR ?auto_2050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2052 ?auto_2051 )
      ( MAKE-2PILE ?auto_2050 ?auto_2051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2053 - BLOCK
      ?auto_2054 - BLOCK
    )
    :vars
    (
      ?auto_2055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2053 ?auto_2054 ) ) ( ON ?auto_2054 ?auto_2055 ) ( not ( = ?auto_2053 ?auto_2055 ) ) ( not ( = ?auto_2054 ?auto_2055 ) ) ( ON-TABLE ?auto_2055 ) ( HOLDING ?auto_2053 ) ( CLEAR ?auto_2054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2055 ?auto_2054 ?auto_2053 )
      ( MAKE-2PILE ?auto_2053 ?auto_2054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2056 - BLOCK
      ?auto_2057 - BLOCK
    )
    :vars
    (
      ?auto_2058 - BLOCK
      ?auto_2059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2056 ?auto_2057 ) ) ( ON ?auto_2057 ?auto_2058 ) ( not ( = ?auto_2056 ?auto_2058 ) ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( ON-TABLE ?auto_2058 ) ( CLEAR ?auto_2057 ) ( ON ?auto_2056 ?auto_2059 ) ( CLEAR ?auto_2056 ) ( HAND-EMPTY ) ( not ( = ?auto_2056 ?auto_2059 ) ) ( not ( = ?auto_2057 ?auto_2059 ) ) ( not ( = ?auto_2058 ?auto_2059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2056 ?auto_2059 )
      ( MAKE-2PILE ?auto_2056 ?auto_2057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2060 - BLOCK
      ?auto_2061 - BLOCK
    )
    :vars
    (
      ?auto_2063 - BLOCK
      ?auto_2062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2060 ?auto_2061 ) ) ( not ( = ?auto_2060 ?auto_2063 ) ) ( not ( = ?auto_2061 ?auto_2063 ) ) ( ON-TABLE ?auto_2063 ) ( ON ?auto_2060 ?auto_2062 ) ( CLEAR ?auto_2060 ) ( not ( = ?auto_2060 ?auto_2062 ) ) ( not ( = ?auto_2061 ?auto_2062 ) ) ( not ( = ?auto_2063 ?auto_2062 ) ) ( HOLDING ?auto_2061 ) ( CLEAR ?auto_2063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2063 ?auto_2061 )
      ( MAKE-2PILE ?auto_2060 ?auto_2061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2064 - BLOCK
      ?auto_2065 - BLOCK
    )
    :vars
    (
      ?auto_2067 - BLOCK
      ?auto_2066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2064 ?auto_2065 ) ) ( not ( = ?auto_2064 ?auto_2067 ) ) ( not ( = ?auto_2065 ?auto_2067 ) ) ( ON-TABLE ?auto_2067 ) ( ON ?auto_2064 ?auto_2066 ) ( not ( = ?auto_2064 ?auto_2066 ) ) ( not ( = ?auto_2065 ?auto_2066 ) ) ( not ( = ?auto_2067 ?auto_2066 ) ) ( CLEAR ?auto_2067 ) ( ON ?auto_2065 ?auto_2064 ) ( CLEAR ?auto_2065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2066 ?auto_2064 )
      ( MAKE-2PILE ?auto_2064 ?auto_2065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2068 - BLOCK
      ?auto_2069 - BLOCK
    )
    :vars
    (
      ?auto_2071 - BLOCK
      ?auto_2070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2068 ?auto_2069 ) ) ( not ( = ?auto_2068 ?auto_2071 ) ) ( not ( = ?auto_2069 ?auto_2071 ) ) ( ON ?auto_2068 ?auto_2070 ) ( not ( = ?auto_2068 ?auto_2070 ) ) ( not ( = ?auto_2069 ?auto_2070 ) ) ( not ( = ?auto_2071 ?auto_2070 ) ) ( ON ?auto_2069 ?auto_2068 ) ( CLEAR ?auto_2069 ) ( ON-TABLE ?auto_2070 ) ( HOLDING ?auto_2071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2071 )
      ( MAKE-2PILE ?auto_2068 ?auto_2069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2072 - BLOCK
      ?auto_2073 - BLOCK
    )
    :vars
    (
      ?auto_2075 - BLOCK
      ?auto_2074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2072 ?auto_2073 ) ) ( not ( = ?auto_2072 ?auto_2075 ) ) ( not ( = ?auto_2073 ?auto_2075 ) ) ( ON ?auto_2072 ?auto_2074 ) ( not ( = ?auto_2072 ?auto_2074 ) ) ( not ( = ?auto_2073 ?auto_2074 ) ) ( not ( = ?auto_2075 ?auto_2074 ) ) ( ON ?auto_2073 ?auto_2072 ) ( ON-TABLE ?auto_2074 ) ( ON ?auto_2075 ?auto_2073 ) ( CLEAR ?auto_2075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2074 ?auto_2072 ?auto_2073 )
      ( MAKE-2PILE ?auto_2072 ?auto_2073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2079 - BLOCK
      ?auto_2080 - BLOCK
      ?auto_2081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2081 ) ( CLEAR ?auto_2080 ) ( ON-TABLE ?auto_2079 ) ( ON ?auto_2080 ?auto_2079 ) ( not ( = ?auto_2079 ?auto_2080 ) ) ( not ( = ?auto_2079 ?auto_2081 ) ) ( not ( = ?auto_2080 ?auto_2081 ) ) )
    :subtasks
    ( ( !STACK ?auto_2081 ?auto_2080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2082 - BLOCK
      ?auto_2083 - BLOCK
      ?auto_2084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2083 ) ( ON-TABLE ?auto_2082 ) ( ON ?auto_2083 ?auto_2082 ) ( not ( = ?auto_2082 ?auto_2083 ) ) ( not ( = ?auto_2082 ?auto_2084 ) ) ( not ( = ?auto_2083 ?auto_2084 ) ) ( ON-TABLE ?auto_2084 ) ( CLEAR ?auto_2084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2084 )
      ( MAKE-3PILE ?auto_2082 ?auto_2083 ?auto_2084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2085 - BLOCK
      ?auto_2086 - BLOCK
      ?auto_2087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2085 ) ( not ( = ?auto_2085 ?auto_2086 ) ) ( not ( = ?auto_2085 ?auto_2087 ) ) ( not ( = ?auto_2086 ?auto_2087 ) ) ( ON-TABLE ?auto_2087 ) ( CLEAR ?auto_2087 ) ( HOLDING ?auto_2086 ) ( CLEAR ?auto_2085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2085 ?auto_2086 )
      ( MAKE-3PILE ?auto_2085 ?auto_2086 ?auto_2087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2088 - BLOCK
      ?auto_2089 - BLOCK
      ?auto_2090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2088 ) ( not ( = ?auto_2088 ?auto_2089 ) ) ( not ( = ?auto_2088 ?auto_2090 ) ) ( not ( = ?auto_2089 ?auto_2090 ) ) ( ON-TABLE ?auto_2090 ) ( CLEAR ?auto_2088 ) ( ON ?auto_2089 ?auto_2090 ) ( CLEAR ?auto_2089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2090 )
      ( MAKE-3PILE ?auto_2088 ?auto_2089 ?auto_2090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2091 - BLOCK
      ?auto_2092 - BLOCK
      ?auto_2093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2091 ?auto_2092 ) ) ( not ( = ?auto_2091 ?auto_2093 ) ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( ON-TABLE ?auto_2093 ) ( ON ?auto_2092 ?auto_2093 ) ( CLEAR ?auto_2092 ) ( HOLDING ?auto_2091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2091 )
      ( MAKE-3PILE ?auto_2091 ?auto_2092 ?auto_2093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2094 - BLOCK
      ?auto_2095 - BLOCK
      ?auto_2096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( ON-TABLE ?auto_2096 ) ( ON ?auto_2095 ?auto_2096 ) ( ON ?auto_2094 ?auto_2095 ) ( CLEAR ?auto_2094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2096 ?auto_2095 )
      ( MAKE-3PILE ?auto_2094 ?auto_2095 ?auto_2096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2097 - BLOCK
      ?auto_2098 - BLOCK
      ?auto_2099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2097 ?auto_2098 ) ) ( not ( = ?auto_2097 ?auto_2099 ) ) ( not ( = ?auto_2098 ?auto_2099 ) ) ( ON-TABLE ?auto_2099 ) ( ON ?auto_2098 ?auto_2099 ) ( HOLDING ?auto_2097 ) ( CLEAR ?auto_2098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2099 ?auto_2098 ?auto_2097 )
      ( MAKE-3PILE ?auto_2097 ?auto_2098 ?auto_2099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2100 - BLOCK
      ?auto_2101 - BLOCK
      ?auto_2102 - BLOCK
    )
    :vars
    (
      ?auto_2103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2100 ?auto_2101 ) ) ( not ( = ?auto_2100 ?auto_2102 ) ) ( not ( = ?auto_2101 ?auto_2102 ) ) ( ON-TABLE ?auto_2102 ) ( ON ?auto_2101 ?auto_2102 ) ( CLEAR ?auto_2101 ) ( ON ?auto_2100 ?auto_2103 ) ( CLEAR ?auto_2100 ) ( HAND-EMPTY ) ( not ( = ?auto_2100 ?auto_2103 ) ) ( not ( = ?auto_2101 ?auto_2103 ) ) ( not ( = ?auto_2102 ?auto_2103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2100 ?auto_2103 )
      ( MAKE-3PILE ?auto_2100 ?auto_2101 ?auto_2102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2104 - BLOCK
      ?auto_2105 - BLOCK
      ?auto_2106 - BLOCK
    )
    :vars
    (
      ?auto_2107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2104 ?auto_2105 ) ) ( not ( = ?auto_2104 ?auto_2106 ) ) ( not ( = ?auto_2105 ?auto_2106 ) ) ( ON-TABLE ?auto_2106 ) ( ON ?auto_2104 ?auto_2107 ) ( CLEAR ?auto_2104 ) ( not ( = ?auto_2104 ?auto_2107 ) ) ( not ( = ?auto_2105 ?auto_2107 ) ) ( not ( = ?auto_2106 ?auto_2107 ) ) ( HOLDING ?auto_2105 ) ( CLEAR ?auto_2106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2106 ?auto_2105 )
      ( MAKE-3PILE ?auto_2104 ?auto_2105 ?auto_2106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2108 - BLOCK
      ?auto_2109 - BLOCK
      ?auto_2110 - BLOCK
    )
    :vars
    (
      ?auto_2111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2108 ?auto_2109 ) ) ( not ( = ?auto_2108 ?auto_2110 ) ) ( not ( = ?auto_2109 ?auto_2110 ) ) ( ON-TABLE ?auto_2110 ) ( ON ?auto_2108 ?auto_2111 ) ( not ( = ?auto_2108 ?auto_2111 ) ) ( not ( = ?auto_2109 ?auto_2111 ) ) ( not ( = ?auto_2110 ?auto_2111 ) ) ( CLEAR ?auto_2110 ) ( ON ?auto_2109 ?auto_2108 ) ( CLEAR ?auto_2109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2111 ?auto_2108 )
      ( MAKE-3PILE ?auto_2108 ?auto_2109 ?auto_2110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2112 - BLOCK
      ?auto_2113 - BLOCK
      ?auto_2114 - BLOCK
    )
    :vars
    (
      ?auto_2115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2112 ?auto_2114 ) ) ( not ( = ?auto_2113 ?auto_2114 ) ) ( ON ?auto_2112 ?auto_2115 ) ( not ( = ?auto_2112 ?auto_2115 ) ) ( not ( = ?auto_2113 ?auto_2115 ) ) ( not ( = ?auto_2114 ?auto_2115 ) ) ( ON ?auto_2113 ?auto_2112 ) ( CLEAR ?auto_2113 ) ( ON-TABLE ?auto_2115 ) ( HOLDING ?auto_2114 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2114 )
      ( MAKE-3PILE ?auto_2112 ?auto_2113 ?auto_2114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2116 - BLOCK
      ?auto_2117 - BLOCK
      ?auto_2118 - BLOCK
    )
    :vars
    (
      ?auto_2119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2116 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2118 ) ) ( not ( = ?auto_2117 ?auto_2118 ) ) ( ON ?auto_2116 ?auto_2119 ) ( not ( = ?auto_2116 ?auto_2119 ) ) ( not ( = ?auto_2117 ?auto_2119 ) ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( ON ?auto_2117 ?auto_2116 ) ( ON-TABLE ?auto_2119 ) ( ON ?auto_2118 ?auto_2117 ) ( CLEAR ?auto_2118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2119 ?auto_2116 ?auto_2117 )
      ( MAKE-3PILE ?auto_2116 ?auto_2117 ?auto_2118 ) )
  )

)

