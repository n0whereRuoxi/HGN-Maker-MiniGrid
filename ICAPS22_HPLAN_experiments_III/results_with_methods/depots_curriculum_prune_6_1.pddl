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
      ?auto_1821 - SURFACE
      ?auto_1822 - SURFACE
    )
    :vars
    (
      ?auto_1823 - HOIST
      ?auto_1824 - PLACE
      ?auto_1826 - PLACE
      ?auto_1827 - HOIST
      ?auto_1828 - SURFACE
      ?auto_1825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823 ?auto_1824 ) ( SURFACE-AT ?auto_1821 ?auto_1824 ) ( CLEAR ?auto_1821 ) ( IS-CRATE ?auto_1822 ) ( AVAILABLE ?auto_1823 ) ( not ( = ?auto_1826 ?auto_1824 ) ) ( HOIST-AT ?auto_1827 ?auto_1826 ) ( AVAILABLE ?auto_1827 ) ( SURFACE-AT ?auto_1822 ?auto_1826 ) ( ON ?auto_1822 ?auto_1828 ) ( CLEAR ?auto_1822 ) ( TRUCK-AT ?auto_1825 ?auto_1824 ) ( not ( = ?auto_1821 ?auto_1822 ) ) ( not ( = ?auto_1821 ?auto_1828 ) ) ( not ( = ?auto_1822 ?auto_1828 ) ) ( not ( = ?auto_1823 ?auto_1827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1825 ?auto_1824 ?auto_1826 )
      ( !LIFT ?auto_1827 ?auto_1822 ?auto_1828 ?auto_1826 )
      ( !LOAD ?auto_1827 ?auto_1822 ?auto_1825 ?auto_1826 )
      ( !DRIVE ?auto_1825 ?auto_1826 ?auto_1824 )
      ( !UNLOAD ?auto_1823 ?auto_1822 ?auto_1825 ?auto_1824 )
      ( !DROP ?auto_1823 ?auto_1822 ?auto_1821 ?auto_1824 )
      ( MAKE-1CRATE-VERIFY ?auto_1821 ?auto_1822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1842 - SURFACE
      ?auto_1843 - SURFACE
      ?auto_1844 - SURFACE
    )
    :vars
    (
      ?auto_1848 - HOIST
      ?auto_1847 - PLACE
      ?auto_1850 - PLACE
      ?auto_1849 - HOIST
      ?auto_1846 - SURFACE
      ?auto_1853 - PLACE
      ?auto_1851 - HOIST
      ?auto_1852 - SURFACE
      ?auto_1845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1848 ?auto_1847 ) ( IS-CRATE ?auto_1844 ) ( not ( = ?auto_1850 ?auto_1847 ) ) ( HOIST-AT ?auto_1849 ?auto_1850 ) ( AVAILABLE ?auto_1849 ) ( SURFACE-AT ?auto_1844 ?auto_1850 ) ( ON ?auto_1844 ?auto_1846 ) ( CLEAR ?auto_1844 ) ( not ( = ?auto_1843 ?auto_1844 ) ) ( not ( = ?auto_1843 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( not ( = ?auto_1848 ?auto_1849 ) ) ( SURFACE-AT ?auto_1842 ?auto_1847 ) ( CLEAR ?auto_1842 ) ( IS-CRATE ?auto_1843 ) ( AVAILABLE ?auto_1848 ) ( not ( = ?auto_1853 ?auto_1847 ) ) ( HOIST-AT ?auto_1851 ?auto_1853 ) ( AVAILABLE ?auto_1851 ) ( SURFACE-AT ?auto_1843 ?auto_1853 ) ( ON ?auto_1843 ?auto_1852 ) ( CLEAR ?auto_1843 ) ( TRUCK-AT ?auto_1845 ?auto_1847 ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1852 ) ) ( not ( = ?auto_1843 ?auto_1852 ) ) ( not ( = ?auto_1848 ?auto_1851 ) ) ( not ( = ?auto_1842 ?auto_1844 ) ) ( not ( = ?auto_1842 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1852 ) ) ( not ( = ?auto_1850 ?auto_1853 ) ) ( not ( = ?auto_1849 ?auto_1851 ) ) ( not ( = ?auto_1846 ?auto_1852 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1842 ?auto_1843 )
      ( MAKE-1CRATE ?auto_1843 ?auto_1844 )
      ( MAKE-2CRATE-VERIFY ?auto_1842 ?auto_1843 ?auto_1844 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1868 - SURFACE
      ?auto_1869 - SURFACE
      ?auto_1870 - SURFACE
      ?auto_1871 - SURFACE
    )
    :vars
    (
      ?auto_1876 - HOIST
      ?auto_1875 - PLACE
      ?auto_1877 - PLACE
      ?auto_1873 - HOIST
      ?auto_1872 - SURFACE
      ?auto_1880 - PLACE
      ?auto_1879 - HOIST
      ?auto_1878 - SURFACE
      ?auto_1881 - SURFACE
      ?auto_1874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876 ?auto_1875 ) ( IS-CRATE ?auto_1871 ) ( not ( = ?auto_1877 ?auto_1875 ) ) ( HOIST-AT ?auto_1873 ?auto_1877 ) ( SURFACE-AT ?auto_1871 ?auto_1877 ) ( ON ?auto_1871 ?auto_1872 ) ( CLEAR ?auto_1871 ) ( not ( = ?auto_1870 ?auto_1871 ) ) ( not ( = ?auto_1870 ?auto_1872 ) ) ( not ( = ?auto_1871 ?auto_1872 ) ) ( not ( = ?auto_1876 ?auto_1873 ) ) ( IS-CRATE ?auto_1870 ) ( not ( = ?auto_1880 ?auto_1875 ) ) ( HOIST-AT ?auto_1879 ?auto_1880 ) ( AVAILABLE ?auto_1879 ) ( SURFACE-AT ?auto_1870 ?auto_1880 ) ( ON ?auto_1870 ?auto_1878 ) ( CLEAR ?auto_1870 ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( not ( = ?auto_1869 ?auto_1878 ) ) ( not ( = ?auto_1870 ?auto_1878 ) ) ( not ( = ?auto_1876 ?auto_1879 ) ) ( SURFACE-AT ?auto_1868 ?auto_1875 ) ( CLEAR ?auto_1868 ) ( IS-CRATE ?auto_1869 ) ( AVAILABLE ?auto_1876 ) ( AVAILABLE ?auto_1873 ) ( SURFACE-AT ?auto_1869 ?auto_1877 ) ( ON ?auto_1869 ?auto_1881 ) ( CLEAR ?auto_1869 ) ( TRUCK-AT ?auto_1874 ?auto_1875 ) ( not ( = ?auto_1868 ?auto_1869 ) ) ( not ( = ?auto_1868 ?auto_1881 ) ) ( not ( = ?auto_1869 ?auto_1881 ) ) ( not ( = ?auto_1868 ?auto_1870 ) ) ( not ( = ?auto_1868 ?auto_1878 ) ) ( not ( = ?auto_1870 ?auto_1881 ) ) ( not ( = ?auto_1880 ?auto_1877 ) ) ( not ( = ?auto_1879 ?auto_1873 ) ) ( not ( = ?auto_1878 ?auto_1881 ) ) ( not ( = ?auto_1868 ?auto_1871 ) ) ( not ( = ?auto_1868 ?auto_1872 ) ) ( not ( = ?auto_1869 ?auto_1871 ) ) ( not ( = ?auto_1869 ?auto_1872 ) ) ( not ( = ?auto_1871 ?auto_1878 ) ) ( not ( = ?auto_1871 ?auto_1881 ) ) ( not ( = ?auto_1872 ?auto_1878 ) ) ( not ( = ?auto_1872 ?auto_1881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1868 ?auto_1869 ?auto_1870 )
      ( MAKE-1CRATE ?auto_1870 ?auto_1871 )
      ( MAKE-3CRATE-VERIFY ?auto_1868 ?auto_1869 ?auto_1870 ?auto_1871 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1897 - SURFACE
      ?auto_1898 - SURFACE
      ?auto_1899 - SURFACE
      ?auto_1900 - SURFACE
      ?auto_1901 - SURFACE
    )
    :vars
    (
      ?auto_1906 - HOIST
      ?auto_1907 - PLACE
      ?auto_1905 - PLACE
      ?auto_1904 - HOIST
      ?auto_1902 - SURFACE
      ?auto_1912 - PLACE
      ?auto_1909 - HOIST
      ?auto_1910 - SURFACE
      ?auto_1911 - SURFACE
      ?auto_1908 - SURFACE
      ?auto_1903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1906 ?auto_1907 ) ( IS-CRATE ?auto_1901 ) ( not ( = ?auto_1905 ?auto_1907 ) ) ( HOIST-AT ?auto_1904 ?auto_1905 ) ( SURFACE-AT ?auto_1901 ?auto_1905 ) ( ON ?auto_1901 ?auto_1902 ) ( CLEAR ?auto_1901 ) ( not ( = ?auto_1900 ?auto_1901 ) ) ( not ( = ?auto_1900 ?auto_1902 ) ) ( not ( = ?auto_1901 ?auto_1902 ) ) ( not ( = ?auto_1906 ?auto_1904 ) ) ( IS-CRATE ?auto_1900 ) ( not ( = ?auto_1912 ?auto_1907 ) ) ( HOIST-AT ?auto_1909 ?auto_1912 ) ( SURFACE-AT ?auto_1900 ?auto_1912 ) ( ON ?auto_1900 ?auto_1910 ) ( CLEAR ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1900 ) ) ( not ( = ?auto_1899 ?auto_1910 ) ) ( not ( = ?auto_1900 ?auto_1910 ) ) ( not ( = ?auto_1906 ?auto_1909 ) ) ( IS-CRATE ?auto_1899 ) ( AVAILABLE ?auto_1904 ) ( SURFACE-AT ?auto_1899 ?auto_1905 ) ( ON ?auto_1899 ?auto_1911 ) ( CLEAR ?auto_1899 ) ( not ( = ?auto_1898 ?auto_1899 ) ) ( not ( = ?auto_1898 ?auto_1911 ) ) ( not ( = ?auto_1899 ?auto_1911 ) ) ( SURFACE-AT ?auto_1897 ?auto_1907 ) ( CLEAR ?auto_1897 ) ( IS-CRATE ?auto_1898 ) ( AVAILABLE ?auto_1906 ) ( AVAILABLE ?auto_1909 ) ( SURFACE-AT ?auto_1898 ?auto_1912 ) ( ON ?auto_1898 ?auto_1908 ) ( CLEAR ?auto_1898 ) ( TRUCK-AT ?auto_1903 ?auto_1907 ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( not ( = ?auto_1897 ?auto_1908 ) ) ( not ( = ?auto_1898 ?auto_1908 ) ) ( not ( = ?auto_1897 ?auto_1899 ) ) ( not ( = ?auto_1897 ?auto_1911 ) ) ( not ( = ?auto_1899 ?auto_1908 ) ) ( not ( = ?auto_1905 ?auto_1912 ) ) ( not ( = ?auto_1904 ?auto_1909 ) ) ( not ( = ?auto_1911 ?auto_1908 ) ) ( not ( = ?auto_1897 ?auto_1900 ) ) ( not ( = ?auto_1897 ?auto_1910 ) ) ( not ( = ?auto_1898 ?auto_1900 ) ) ( not ( = ?auto_1898 ?auto_1910 ) ) ( not ( = ?auto_1900 ?auto_1911 ) ) ( not ( = ?auto_1900 ?auto_1908 ) ) ( not ( = ?auto_1910 ?auto_1911 ) ) ( not ( = ?auto_1910 ?auto_1908 ) ) ( not ( = ?auto_1897 ?auto_1901 ) ) ( not ( = ?auto_1897 ?auto_1902 ) ) ( not ( = ?auto_1898 ?auto_1901 ) ) ( not ( = ?auto_1898 ?auto_1902 ) ) ( not ( = ?auto_1899 ?auto_1901 ) ) ( not ( = ?auto_1899 ?auto_1902 ) ) ( not ( = ?auto_1901 ?auto_1910 ) ) ( not ( = ?auto_1901 ?auto_1911 ) ) ( not ( = ?auto_1901 ?auto_1908 ) ) ( not ( = ?auto_1902 ?auto_1910 ) ) ( not ( = ?auto_1902 ?auto_1911 ) ) ( not ( = ?auto_1902 ?auto_1908 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1897 ?auto_1898 ?auto_1899 ?auto_1900 )
      ( MAKE-1CRATE ?auto_1900 ?auto_1901 )
      ( MAKE-4CRATE-VERIFY ?auto_1897 ?auto_1898 ?auto_1899 ?auto_1900 ?auto_1901 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1929 - SURFACE
      ?auto_1930 - SURFACE
      ?auto_1931 - SURFACE
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
      ?auto_1934 - SURFACE
    )
    :vars
    (
      ?auto_1936 - HOIST
      ?auto_1937 - PLACE
      ?auto_1935 - PLACE
      ?auto_1938 - HOIST
      ?auto_1939 - SURFACE
      ?auto_1942 - PLACE
      ?auto_1943 - HOIST
      ?auto_1947 - SURFACE
      ?auto_1948 - PLACE
      ?auto_1941 - HOIST
      ?auto_1945 - SURFACE
      ?auto_1946 - SURFACE
      ?auto_1944 - SURFACE
      ?auto_1940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1936 ?auto_1937 ) ( IS-CRATE ?auto_1934 ) ( not ( = ?auto_1935 ?auto_1937 ) ) ( HOIST-AT ?auto_1938 ?auto_1935 ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1934 ?auto_1935 ) ( ON ?auto_1934 ?auto_1939 ) ( CLEAR ?auto_1934 ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1933 ?auto_1939 ) ) ( not ( = ?auto_1934 ?auto_1939 ) ) ( not ( = ?auto_1936 ?auto_1938 ) ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1942 ?auto_1937 ) ) ( HOIST-AT ?auto_1943 ?auto_1942 ) ( SURFACE-AT ?auto_1933 ?auto_1942 ) ( ON ?auto_1933 ?auto_1947 ) ( CLEAR ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1932 ?auto_1947 ) ) ( not ( = ?auto_1933 ?auto_1947 ) ) ( not ( = ?auto_1936 ?auto_1943 ) ) ( IS-CRATE ?auto_1932 ) ( not ( = ?auto_1948 ?auto_1937 ) ) ( HOIST-AT ?auto_1941 ?auto_1948 ) ( SURFACE-AT ?auto_1932 ?auto_1948 ) ( ON ?auto_1932 ?auto_1945 ) ( CLEAR ?auto_1932 ) ( not ( = ?auto_1931 ?auto_1932 ) ) ( not ( = ?auto_1931 ?auto_1945 ) ) ( not ( = ?auto_1932 ?auto_1945 ) ) ( not ( = ?auto_1936 ?auto_1941 ) ) ( IS-CRATE ?auto_1931 ) ( AVAILABLE ?auto_1943 ) ( SURFACE-AT ?auto_1931 ?auto_1942 ) ( ON ?auto_1931 ?auto_1946 ) ( CLEAR ?auto_1931 ) ( not ( = ?auto_1930 ?auto_1931 ) ) ( not ( = ?auto_1930 ?auto_1946 ) ) ( not ( = ?auto_1931 ?auto_1946 ) ) ( SURFACE-AT ?auto_1929 ?auto_1937 ) ( CLEAR ?auto_1929 ) ( IS-CRATE ?auto_1930 ) ( AVAILABLE ?auto_1936 ) ( AVAILABLE ?auto_1941 ) ( SURFACE-AT ?auto_1930 ?auto_1948 ) ( ON ?auto_1930 ?auto_1944 ) ( CLEAR ?auto_1930 ) ( TRUCK-AT ?auto_1940 ?auto_1937 ) ( not ( = ?auto_1929 ?auto_1930 ) ) ( not ( = ?auto_1929 ?auto_1944 ) ) ( not ( = ?auto_1930 ?auto_1944 ) ) ( not ( = ?auto_1929 ?auto_1931 ) ) ( not ( = ?auto_1929 ?auto_1946 ) ) ( not ( = ?auto_1931 ?auto_1944 ) ) ( not ( = ?auto_1942 ?auto_1948 ) ) ( not ( = ?auto_1943 ?auto_1941 ) ) ( not ( = ?auto_1946 ?auto_1944 ) ) ( not ( = ?auto_1929 ?auto_1932 ) ) ( not ( = ?auto_1929 ?auto_1945 ) ) ( not ( = ?auto_1930 ?auto_1932 ) ) ( not ( = ?auto_1930 ?auto_1945 ) ) ( not ( = ?auto_1932 ?auto_1946 ) ) ( not ( = ?auto_1932 ?auto_1944 ) ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1944 ) ) ( not ( = ?auto_1929 ?auto_1933 ) ) ( not ( = ?auto_1929 ?auto_1947 ) ) ( not ( = ?auto_1930 ?auto_1933 ) ) ( not ( = ?auto_1930 ?auto_1947 ) ) ( not ( = ?auto_1931 ?auto_1933 ) ) ( not ( = ?auto_1931 ?auto_1947 ) ) ( not ( = ?auto_1933 ?auto_1945 ) ) ( not ( = ?auto_1933 ?auto_1946 ) ) ( not ( = ?auto_1933 ?auto_1944 ) ) ( not ( = ?auto_1947 ?auto_1945 ) ) ( not ( = ?auto_1947 ?auto_1946 ) ) ( not ( = ?auto_1947 ?auto_1944 ) ) ( not ( = ?auto_1929 ?auto_1934 ) ) ( not ( = ?auto_1929 ?auto_1939 ) ) ( not ( = ?auto_1930 ?auto_1934 ) ) ( not ( = ?auto_1930 ?auto_1939 ) ) ( not ( = ?auto_1931 ?auto_1934 ) ) ( not ( = ?auto_1931 ?auto_1939 ) ) ( not ( = ?auto_1932 ?auto_1934 ) ) ( not ( = ?auto_1932 ?auto_1939 ) ) ( not ( = ?auto_1934 ?auto_1947 ) ) ( not ( = ?auto_1934 ?auto_1945 ) ) ( not ( = ?auto_1934 ?auto_1946 ) ) ( not ( = ?auto_1934 ?auto_1944 ) ) ( not ( = ?auto_1935 ?auto_1942 ) ) ( not ( = ?auto_1935 ?auto_1948 ) ) ( not ( = ?auto_1938 ?auto_1943 ) ) ( not ( = ?auto_1938 ?auto_1941 ) ) ( not ( = ?auto_1939 ?auto_1947 ) ) ( not ( = ?auto_1939 ?auto_1945 ) ) ( not ( = ?auto_1939 ?auto_1946 ) ) ( not ( = ?auto_1939 ?auto_1944 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1929 ?auto_1930 ?auto_1931 ?auto_1932 ?auto_1933 )
      ( MAKE-1CRATE ?auto_1933 ?auto_1934 )
      ( MAKE-5CRATE-VERIFY ?auto_1929 ?auto_1930 ?auto_1931 ?auto_1932 ?auto_1933 ?auto_1934 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1966 - SURFACE
      ?auto_1967 - SURFACE
      ?auto_1968 - SURFACE
      ?auto_1969 - SURFACE
      ?auto_1970 - SURFACE
      ?auto_1971 - SURFACE
      ?auto_1972 - SURFACE
    )
    :vars
    (
      ?auto_1973 - HOIST
      ?auto_1974 - PLACE
      ?auto_1977 - PLACE
      ?auto_1975 - HOIST
      ?auto_1978 - SURFACE
      ?auto_1986 - PLACE
      ?auto_1982 - HOIST
      ?auto_1987 - SURFACE
      ?auto_1979 - PLACE
      ?auto_1981 - HOIST
      ?auto_1985 - SURFACE
      ?auto_1980 - SURFACE
      ?auto_1984 - SURFACE
      ?auto_1983 - SURFACE
      ?auto_1976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1973 ?auto_1974 ) ( IS-CRATE ?auto_1972 ) ( not ( = ?auto_1977 ?auto_1974 ) ) ( HOIST-AT ?auto_1975 ?auto_1977 ) ( SURFACE-AT ?auto_1972 ?auto_1977 ) ( ON ?auto_1972 ?auto_1978 ) ( CLEAR ?auto_1972 ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1971 ?auto_1978 ) ) ( not ( = ?auto_1972 ?auto_1978 ) ) ( not ( = ?auto_1973 ?auto_1975 ) ) ( IS-CRATE ?auto_1971 ) ( not ( = ?auto_1986 ?auto_1974 ) ) ( HOIST-AT ?auto_1982 ?auto_1986 ) ( AVAILABLE ?auto_1982 ) ( SURFACE-AT ?auto_1971 ?auto_1986 ) ( ON ?auto_1971 ?auto_1987 ) ( CLEAR ?auto_1971 ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( not ( = ?auto_1970 ?auto_1987 ) ) ( not ( = ?auto_1971 ?auto_1987 ) ) ( not ( = ?auto_1973 ?auto_1982 ) ) ( IS-CRATE ?auto_1970 ) ( not ( = ?auto_1979 ?auto_1974 ) ) ( HOIST-AT ?auto_1981 ?auto_1979 ) ( SURFACE-AT ?auto_1970 ?auto_1979 ) ( ON ?auto_1970 ?auto_1985 ) ( CLEAR ?auto_1970 ) ( not ( = ?auto_1969 ?auto_1970 ) ) ( not ( = ?auto_1969 ?auto_1985 ) ) ( not ( = ?auto_1970 ?auto_1985 ) ) ( not ( = ?auto_1973 ?auto_1981 ) ) ( IS-CRATE ?auto_1969 ) ( SURFACE-AT ?auto_1969 ?auto_1977 ) ( ON ?auto_1969 ?auto_1980 ) ( CLEAR ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1969 ) ) ( not ( = ?auto_1968 ?auto_1980 ) ) ( not ( = ?auto_1969 ?auto_1980 ) ) ( IS-CRATE ?auto_1968 ) ( AVAILABLE ?auto_1981 ) ( SURFACE-AT ?auto_1968 ?auto_1979 ) ( ON ?auto_1968 ?auto_1984 ) ( CLEAR ?auto_1968 ) ( not ( = ?auto_1967 ?auto_1968 ) ) ( not ( = ?auto_1967 ?auto_1984 ) ) ( not ( = ?auto_1968 ?auto_1984 ) ) ( SURFACE-AT ?auto_1966 ?auto_1974 ) ( CLEAR ?auto_1966 ) ( IS-CRATE ?auto_1967 ) ( AVAILABLE ?auto_1973 ) ( AVAILABLE ?auto_1975 ) ( SURFACE-AT ?auto_1967 ?auto_1977 ) ( ON ?auto_1967 ?auto_1983 ) ( CLEAR ?auto_1967 ) ( TRUCK-AT ?auto_1976 ?auto_1974 ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1983 ) ) ( not ( = ?auto_1967 ?auto_1983 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1966 ?auto_1984 ) ) ( not ( = ?auto_1968 ?auto_1983 ) ) ( not ( = ?auto_1979 ?auto_1977 ) ) ( not ( = ?auto_1981 ?auto_1975 ) ) ( not ( = ?auto_1984 ?auto_1983 ) ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( not ( = ?auto_1966 ?auto_1980 ) ) ( not ( = ?auto_1967 ?auto_1969 ) ) ( not ( = ?auto_1967 ?auto_1980 ) ) ( not ( = ?auto_1969 ?auto_1984 ) ) ( not ( = ?auto_1969 ?auto_1983 ) ) ( not ( = ?auto_1980 ?auto_1984 ) ) ( not ( = ?auto_1980 ?auto_1983 ) ) ( not ( = ?auto_1966 ?auto_1970 ) ) ( not ( = ?auto_1966 ?auto_1985 ) ) ( not ( = ?auto_1967 ?auto_1970 ) ) ( not ( = ?auto_1967 ?auto_1985 ) ) ( not ( = ?auto_1968 ?auto_1970 ) ) ( not ( = ?auto_1968 ?auto_1985 ) ) ( not ( = ?auto_1970 ?auto_1980 ) ) ( not ( = ?auto_1970 ?auto_1984 ) ) ( not ( = ?auto_1970 ?auto_1983 ) ) ( not ( = ?auto_1985 ?auto_1980 ) ) ( not ( = ?auto_1985 ?auto_1984 ) ) ( not ( = ?auto_1985 ?auto_1983 ) ) ( not ( = ?auto_1966 ?auto_1971 ) ) ( not ( = ?auto_1966 ?auto_1987 ) ) ( not ( = ?auto_1967 ?auto_1971 ) ) ( not ( = ?auto_1967 ?auto_1987 ) ) ( not ( = ?auto_1968 ?auto_1971 ) ) ( not ( = ?auto_1968 ?auto_1987 ) ) ( not ( = ?auto_1969 ?auto_1971 ) ) ( not ( = ?auto_1969 ?auto_1987 ) ) ( not ( = ?auto_1971 ?auto_1985 ) ) ( not ( = ?auto_1971 ?auto_1980 ) ) ( not ( = ?auto_1971 ?auto_1984 ) ) ( not ( = ?auto_1971 ?auto_1983 ) ) ( not ( = ?auto_1986 ?auto_1979 ) ) ( not ( = ?auto_1986 ?auto_1977 ) ) ( not ( = ?auto_1982 ?auto_1981 ) ) ( not ( = ?auto_1982 ?auto_1975 ) ) ( not ( = ?auto_1987 ?auto_1985 ) ) ( not ( = ?auto_1987 ?auto_1980 ) ) ( not ( = ?auto_1987 ?auto_1984 ) ) ( not ( = ?auto_1987 ?auto_1983 ) ) ( not ( = ?auto_1966 ?auto_1972 ) ) ( not ( = ?auto_1966 ?auto_1978 ) ) ( not ( = ?auto_1967 ?auto_1972 ) ) ( not ( = ?auto_1967 ?auto_1978 ) ) ( not ( = ?auto_1968 ?auto_1972 ) ) ( not ( = ?auto_1968 ?auto_1978 ) ) ( not ( = ?auto_1969 ?auto_1972 ) ) ( not ( = ?auto_1969 ?auto_1978 ) ) ( not ( = ?auto_1970 ?auto_1972 ) ) ( not ( = ?auto_1970 ?auto_1978 ) ) ( not ( = ?auto_1972 ?auto_1987 ) ) ( not ( = ?auto_1972 ?auto_1985 ) ) ( not ( = ?auto_1972 ?auto_1980 ) ) ( not ( = ?auto_1972 ?auto_1984 ) ) ( not ( = ?auto_1972 ?auto_1983 ) ) ( not ( = ?auto_1978 ?auto_1987 ) ) ( not ( = ?auto_1978 ?auto_1985 ) ) ( not ( = ?auto_1978 ?auto_1980 ) ) ( not ( = ?auto_1978 ?auto_1984 ) ) ( not ( = ?auto_1978 ?auto_1983 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1966 ?auto_1967 ?auto_1968 ?auto_1969 ?auto_1970 ?auto_1971 )
      ( MAKE-1CRATE ?auto_1971 ?auto_1972 )
      ( MAKE-6CRATE-VERIFY ?auto_1966 ?auto_1967 ?auto_1968 ?auto_1969 ?auto_1970 ?auto_1971 ?auto_1972 ) )
  )

)

