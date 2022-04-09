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
      ?auto_1839 - SURFACE
      ?auto_1840 - SURFACE
    )
    :vars
    (
      ?auto_1841 - HOIST
      ?auto_1842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1841 ?auto_1842 ) ( SURFACE-AT ?auto_1839 ?auto_1842 ) ( CLEAR ?auto_1839 ) ( LIFTING ?auto_1841 ?auto_1840 ) ( IS-CRATE ?auto_1840 ) ( not ( = ?auto_1839 ?auto_1840 ) ) )
    :subtasks
    ( ( !DROP ?auto_1841 ?auto_1840 ?auto_1839 ?auto_1842 )
      ( MAKE-1CRATE-VERIFY ?auto_1839 ?auto_1840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1843 - SURFACE
      ?auto_1844 - SURFACE
    )
    :vars
    (
      ?auto_1846 - HOIST
      ?auto_1845 - PLACE
      ?auto_1847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1846 ?auto_1845 ) ( SURFACE-AT ?auto_1843 ?auto_1845 ) ( CLEAR ?auto_1843 ) ( IS-CRATE ?auto_1844 ) ( not ( = ?auto_1843 ?auto_1844 ) ) ( TRUCK-AT ?auto_1847 ?auto_1845 ) ( AVAILABLE ?auto_1846 ) ( IN ?auto_1844 ?auto_1847 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1846 ?auto_1844 ?auto_1847 ?auto_1845 )
      ( MAKE-1CRATE ?auto_1843 ?auto_1844 )
      ( MAKE-1CRATE-VERIFY ?auto_1843 ?auto_1844 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1848 - SURFACE
      ?auto_1849 - SURFACE
    )
    :vars
    (
      ?auto_1851 - HOIST
      ?auto_1852 - PLACE
      ?auto_1850 - TRUCK
      ?auto_1853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1851 ?auto_1852 ) ( SURFACE-AT ?auto_1848 ?auto_1852 ) ( CLEAR ?auto_1848 ) ( IS-CRATE ?auto_1849 ) ( not ( = ?auto_1848 ?auto_1849 ) ) ( AVAILABLE ?auto_1851 ) ( IN ?auto_1849 ?auto_1850 ) ( TRUCK-AT ?auto_1850 ?auto_1853 ) ( not ( = ?auto_1853 ?auto_1852 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1850 ?auto_1853 ?auto_1852 )
      ( MAKE-1CRATE ?auto_1848 ?auto_1849 )
      ( MAKE-1CRATE-VERIFY ?auto_1848 ?auto_1849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1854 - SURFACE
      ?auto_1855 - SURFACE
    )
    :vars
    (
      ?auto_1857 - HOIST
      ?auto_1856 - PLACE
      ?auto_1858 - TRUCK
      ?auto_1859 - PLACE
      ?auto_1860 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1857 ?auto_1856 ) ( SURFACE-AT ?auto_1854 ?auto_1856 ) ( CLEAR ?auto_1854 ) ( IS-CRATE ?auto_1855 ) ( not ( = ?auto_1854 ?auto_1855 ) ) ( AVAILABLE ?auto_1857 ) ( TRUCK-AT ?auto_1858 ?auto_1859 ) ( not ( = ?auto_1859 ?auto_1856 ) ) ( HOIST-AT ?auto_1860 ?auto_1859 ) ( LIFTING ?auto_1860 ?auto_1855 ) ( not ( = ?auto_1857 ?auto_1860 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1860 ?auto_1855 ?auto_1858 ?auto_1859 )
      ( MAKE-1CRATE ?auto_1854 ?auto_1855 )
      ( MAKE-1CRATE-VERIFY ?auto_1854 ?auto_1855 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1861 - SURFACE
      ?auto_1862 - SURFACE
    )
    :vars
    (
      ?auto_1864 - HOIST
      ?auto_1865 - PLACE
      ?auto_1866 - TRUCK
      ?auto_1863 - PLACE
      ?auto_1867 - HOIST
      ?auto_1868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1864 ?auto_1865 ) ( SURFACE-AT ?auto_1861 ?auto_1865 ) ( CLEAR ?auto_1861 ) ( IS-CRATE ?auto_1862 ) ( not ( = ?auto_1861 ?auto_1862 ) ) ( AVAILABLE ?auto_1864 ) ( TRUCK-AT ?auto_1866 ?auto_1863 ) ( not ( = ?auto_1863 ?auto_1865 ) ) ( HOIST-AT ?auto_1867 ?auto_1863 ) ( not ( = ?auto_1864 ?auto_1867 ) ) ( AVAILABLE ?auto_1867 ) ( SURFACE-AT ?auto_1862 ?auto_1863 ) ( ON ?auto_1862 ?auto_1868 ) ( CLEAR ?auto_1862 ) ( not ( = ?auto_1861 ?auto_1868 ) ) ( not ( = ?auto_1862 ?auto_1868 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1867 ?auto_1862 ?auto_1868 ?auto_1863 )
      ( MAKE-1CRATE ?auto_1861 ?auto_1862 )
      ( MAKE-1CRATE-VERIFY ?auto_1861 ?auto_1862 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1869 - SURFACE
      ?auto_1870 - SURFACE
    )
    :vars
    (
      ?auto_1871 - HOIST
      ?auto_1873 - PLACE
      ?auto_1876 - PLACE
      ?auto_1875 - HOIST
      ?auto_1872 - SURFACE
      ?auto_1874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1871 ?auto_1873 ) ( SURFACE-AT ?auto_1869 ?auto_1873 ) ( CLEAR ?auto_1869 ) ( IS-CRATE ?auto_1870 ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( AVAILABLE ?auto_1871 ) ( not ( = ?auto_1876 ?auto_1873 ) ) ( HOIST-AT ?auto_1875 ?auto_1876 ) ( not ( = ?auto_1871 ?auto_1875 ) ) ( AVAILABLE ?auto_1875 ) ( SURFACE-AT ?auto_1870 ?auto_1876 ) ( ON ?auto_1870 ?auto_1872 ) ( CLEAR ?auto_1870 ) ( not ( = ?auto_1869 ?auto_1872 ) ) ( not ( = ?auto_1870 ?auto_1872 ) ) ( TRUCK-AT ?auto_1874 ?auto_1873 ) )
    :subtasks
    ( ( !DRIVE ?auto_1874 ?auto_1873 ?auto_1876 )
      ( MAKE-1CRATE ?auto_1869 ?auto_1870 )
      ( MAKE-1CRATE-VERIFY ?auto_1869 ?auto_1870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1886 - SURFACE
      ?auto_1887 - SURFACE
      ?auto_1888 - SURFACE
    )
    :vars
    (
      ?auto_1890 - HOIST
      ?auto_1889 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1890 ?auto_1889 ) ( SURFACE-AT ?auto_1887 ?auto_1889 ) ( CLEAR ?auto_1887 ) ( LIFTING ?auto_1890 ?auto_1888 ) ( IS-CRATE ?auto_1888 ) ( not ( = ?auto_1887 ?auto_1888 ) ) ( ON ?auto_1887 ?auto_1886 ) ( not ( = ?auto_1886 ?auto_1887 ) ) ( not ( = ?auto_1886 ?auto_1888 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1887 ?auto_1888 )
      ( MAKE-2CRATE-VERIFY ?auto_1886 ?auto_1887 ?auto_1888 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1896 - SURFACE
      ?auto_1897 - SURFACE
      ?auto_1898 - SURFACE
    )
    :vars
    (
      ?auto_1901 - HOIST
      ?auto_1900 - PLACE
      ?auto_1899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1901 ?auto_1900 ) ( SURFACE-AT ?auto_1897 ?auto_1900 ) ( CLEAR ?auto_1897 ) ( IS-CRATE ?auto_1898 ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( TRUCK-AT ?auto_1899 ?auto_1900 ) ( AVAILABLE ?auto_1901 ) ( IN ?auto_1898 ?auto_1899 ) ( ON ?auto_1897 ?auto_1896 ) ( not ( = ?auto_1896 ?auto_1897 ) ) ( not ( = ?auto_1896 ?auto_1898 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1897 ?auto_1898 )
      ( MAKE-2CRATE-VERIFY ?auto_1896 ?auto_1897 ?auto_1898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1902 - SURFACE
      ?auto_1903 - SURFACE
    )
    :vars
    (
      ?auto_1905 - HOIST
      ?auto_1907 - PLACE
      ?auto_1904 - TRUCK
      ?auto_1906 - SURFACE
      ?auto_1908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1905 ?auto_1907 ) ( SURFACE-AT ?auto_1902 ?auto_1907 ) ( CLEAR ?auto_1902 ) ( IS-CRATE ?auto_1903 ) ( not ( = ?auto_1902 ?auto_1903 ) ) ( AVAILABLE ?auto_1905 ) ( IN ?auto_1903 ?auto_1904 ) ( ON ?auto_1902 ?auto_1906 ) ( not ( = ?auto_1906 ?auto_1902 ) ) ( not ( = ?auto_1906 ?auto_1903 ) ) ( TRUCK-AT ?auto_1904 ?auto_1908 ) ( not ( = ?auto_1908 ?auto_1907 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1904 ?auto_1908 ?auto_1907 )
      ( MAKE-2CRATE ?auto_1906 ?auto_1902 ?auto_1903 )
      ( MAKE-1CRATE-VERIFY ?auto_1902 ?auto_1903 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1909 - SURFACE
      ?auto_1910 - SURFACE
      ?auto_1911 - SURFACE
    )
    :vars
    (
      ?auto_1914 - HOIST
      ?auto_1915 - PLACE
      ?auto_1913 - TRUCK
      ?auto_1912 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1914 ?auto_1915 ) ( SURFACE-AT ?auto_1910 ?auto_1915 ) ( CLEAR ?auto_1910 ) ( IS-CRATE ?auto_1911 ) ( not ( = ?auto_1910 ?auto_1911 ) ) ( AVAILABLE ?auto_1914 ) ( IN ?auto_1911 ?auto_1913 ) ( ON ?auto_1910 ?auto_1909 ) ( not ( = ?auto_1909 ?auto_1910 ) ) ( not ( = ?auto_1909 ?auto_1911 ) ) ( TRUCK-AT ?auto_1913 ?auto_1912 ) ( not ( = ?auto_1912 ?auto_1915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1910 ?auto_1911 )
      ( MAKE-2CRATE-VERIFY ?auto_1909 ?auto_1910 ?auto_1911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1916 - SURFACE
      ?auto_1917 - SURFACE
    )
    :vars
    (
      ?auto_1922 - HOIST
      ?auto_1919 - PLACE
      ?auto_1921 - SURFACE
      ?auto_1918 - TRUCK
      ?auto_1920 - PLACE
      ?auto_1923 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1922 ?auto_1919 ) ( SURFACE-AT ?auto_1916 ?auto_1919 ) ( CLEAR ?auto_1916 ) ( IS-CRATE ?auto_1917 ) ( not ( = ?auto_1916 ?auto_1917 ) ) ( AVAILABLE ?auto_1922 ) ( ON ?auto_1916 ?auto_1921 ) ( not ( = ?auto_1921 ?auto_1916 ) ) ( not ( = ?auto_1921 ?auto_1917 ) ) ( TRUCK-AT ?auto_1918 ?auto_1920 ) ( not ( = ?auto_1920 ?auto_1919 ) ) ( HOIST-AT ?auto_1923 ?auto_1920 ) ( LIFTING ?auto_1923 ?auto_1917 ) ( not ( = ?auto_1922 ?auto_1923 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1923 ?auto_1917 ?auto_1918 ?auto_1920 )
      ( MAKE-2CRATE ?auto_1921 ?auto_1916 ?auto_1917 )
      ( MAKE-1CRATE-VERIFY ?auto_1916 ?auto_1917 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1924 - SURFACE
      ?auto_1925 - SURFACE
      ?auto_1926 - SURFACE
    )
    :vars
    (
      ?auto_1930 - HOIST
      ?auto_1929 - PLACE
      ?auto_1928 - TRUCK
      ?auto_1927 - PLACE
      ?auto_1931 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1930 ?auto_1929 ) ( SURFACE-AT ?auto_1925 ?auto_1929 ) ( CLEAR ?auto_1925 ) ( IS-CRATE ?auto_1926 ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( AVAILABLE ?auto_1930 ) ( ON ?auto_1925 ?auto_1924 ) ( not ( = ?auto_1924 ?auto_1925 ) ) ( not ( = ?auto_1924 ?auto_1926 ) ) ( TRUCK-AT ?auto_1928 ?auto_1927 ) ( not ( = ?auto_1927 ?auto_1929 ) ) ( HOIST-AT ?auto_1931 ?auto_1927 ) ( LIFTING ?auto_1931 ?auto_1926 ) ( not ( = ?auto_1930 ?auto_1931 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1925 ?auto_1926 )
      ( MAKE-2CRATE-VERIFY ?auto_1924 ?auto_1925 ?auto_1926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
    )
    :vars
    (
      ?auto_1939 - HOIST
      ?auto_1937 - PLACE
      ?auto_1936 - SURFACE
      ?auto_1938 - TRUCK
      ?auto_1935 - PLACE
      ?auto_1934 - HOIST
      ?auto_1940 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1939 ?auto_1937 ) ( SURFACE-AT ?auto_1932 ?auto_1937 ) ( CLEAR ?auto_1932 ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( AVAILABLE ?auto_1939 ) ( ON ?auto_1932 ?auto_1936 ) ( not ( = ?auto_1936 ?auto_1932 ) ) ( not ( = ?auto_1936 ?auto_1933 ) ) ( TRUCK-AT ?auto_1938 ?auto_1935 ) ( not ( = ?auto_1935 ?auto_1937 ) ) ( HOIST-AT ?auto_1934 ?auto_1935 ) ( not ( = ?auto_1939 ?auto_1934 ) ) ( AVAILABLE ?auto_1934 ) ( SURFACE-AT ?auto_1933 ?auto_1935 ) ( ON ?auto_1933 ?auto_1940 ) ( CLEAR ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1940 ) ) ( not ( = ?auto_1933 ?auto_1940 ) ) ( not ( = ?auto_1936 ?auto_1940 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1934 ?auto_1933 ?auto_1940 ?auto_1935 )
      ( MAKE-2CRATE ?auto_1936 ?auto_1932 ?auto_1933 )
      ( MAKE-1CRATE-VERIFY ?auto_1932 ?auto_1933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1941 - SURFACE
      ?auto_1942 - SURFACE
      ?auto_1943 - SURFACE
    )
    :vars
    (
      ?auto_1946 - HOIST
      ?auto_1944 - PLACE
      ?auto_1945 - TRUCK
      ?auto_1949 - PLACE
      ?auto_1948 - HOIST
      ?auto_1947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1946 ?auto_1944 ) ( SURFACE-AT ?auto_1942 ?auto_1944 ) ( CLEAR ?auto_1942 ) ( IS-CRATE ?auto_1943 ) ( not ( = ?auto_1942 ?auto_1943 ) ) ( AVAILABLE ?auto_1946 ) ( ON ?auto_1942 ?auto_1941 ) ( not ( = ?auto_1941 ?auto_1942 ) ) ( not ( = ?auto_1941 ?auto_1943 ) ) ( TRUCK-AT ?auto_1945 ?auto_1949 ) ( not ( = ?auto_1949 ?auto_1944 ) ) ( HOIST-AT ?auto_1948 ?auto_1949 ) ( not ( = ?auto_1946 ?auto_1948 ) ) ( AVAILABLE ?auto_1948 ) ( SURFACE-AT ?auto_1943 ?auto_1949 ) ( ON ?auto_1943 ?auto_1947 ) ( CLEAR ?auto_1943 ) ( not ( = ?auto_1942 ?auto_1947 ) ) ( not ( = ?auto_1943 ?auto_1947 ) ) ( not ( = ?auto_1941 ?auto_1947 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1942 ?auto_1943 )
      ( MAKE-2CRATE-VERIFY ?auto_1941 ?auto_1942 ?auto_1943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1950 - SURFACE
      ?auto_1951 - SURFACE
    )
    :vars
    (
      ?auto_1957 - HOIST
      ?auto_1952 - PLACE
      ?auto_1956 - SURFACE
      ?auto_1958 - PLACE
      ?auto_1953 - HOIST
      ?auto_1955 - SURFACE
      ?auto_1954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1957 ?auto_1952 ) ( SURFACE-AT ?auto_1950 ?auto_1952 ) ( CLEAR ?auto_1950 ) ( IS-CRATE ?auto_1951 ) ( not ( = ?auto_1950 ?auto_1951 ) ) ( AVAILABLE ?auto_1957 ) ( ON ?auto_1950 ?auto_1956 ) ( not ( = ?auto_1956 ?auto_1950 ) ) ( not ( = ?auto_1956 ?auto_1951 ) ) ( not ( = ?auto_1958 ?auto_1952 ) ) ( HOIST-AT ?auto_1953 ?auto_1958 ) ( not ( = ?auto_1957 ?auto_1953 ) ) ( AVAILABLE ?auto_1953 ) ( SURFACE-AT ?auto_1951 ?auto_1958 ) ( ON ?auto_1951 ?auto_1955 ) ( CLEAR ?auto_1951 ) ( not ( = ?auto_1950 ?auto_1955 ) ) ( not ( = ?auto_1951 ?auto_1955 ) ) ( not ( = ?auto_1956 ?auto_1955 ) ) ( TRUCK-AT ?auto_1954 ?auto_1952 ) )
    :subtasks
    ( ( !DRIVE ?auto_1954 ?auto_1952 ?auto_1958 )
      ( MAKE-2CRATE ?auto_1956 ?auto_1950 ?auto_1951 )
      ( MAKE-1CRATE-VERIFY ?auto_1950 ?auto_1951 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1959 - SURFACE
      ?auto_1960 - SURFACE
      ?auto_1961 - SURFACE
    )
    :vars
    (
      ?auto_1967 - HOIST
      ?auto_1963 - PLACE
      ?auto_1962 - PLACE
      ?auto_1965 - HOIST
      ?auto_1966 - SURFACE
      ?auto_1964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967 ?auto_1963 ) ( SURFACE-AT ?auto_1960 ?auto_1963 ) ( CLEAR ?auto_1960 ) ( IS-CRATE ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1961 ) ) ( AVAILABLE ?auto_1967 ) ( ON ?auto_1960 ?auto_1959 ) ( not ( = ?auto_1959 ?auto_1960 ) ) ( not ( = ?auto_1959 ?auto_1961 ) ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( HOIST-AT ?auto_1965 ?auto_1962 ) ( not ( = ?auto_1967 ?auto_1965 ) ) ( AVAILABLE ?auto_1965 ) ( SURFACE-AT ?auto_1961 ?auto_1962 ) ( ON ?auto_1961 ?auto_1966 ) ( CLEAR ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1966 ) ) ( not ( = ?auto_1961 ?auto_1966 ) ) ( not ( = ?auto_1959 ?auto_1966 ) ) ( TRUCK-AT ?auto_1964 ?auto_1963 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1960 ?auto_1961 )
      ( MAKE-2CRATE-VERIFY ?auto_1959 ?auto_1960 ?auto_1961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1968 - SURFACE
      ?auto_1969 - SURFACE
    )
    :vars
    (
      ?auto_1975 - HOIST
      ?auto_1971 - PLACE
      ?auto_1974 - SURFACE
      ?auto_1970 - PLACE
      ?auto_1973 - HOIST
      ?auto_1976 - SURFACE
      ?auto_1972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1975 ?auto_1971 ) ( IS-CRATE ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1969 ) ) ( not ( = ?auto_1974 ?auto_1968 ) ) ( not ( = ?auto_1974 ?auto_1969 ) ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( HOIST-AT ?auto_1973 ?auto_1970 ) ( not ( = ?auto_1975 ?auto_1973 ) ) ( AVAILABLE ?auto_1973 ) ( SURFACE-AT ?auto_1969 ?auto_1970 ) ( ON ?auto_1969 ?auto_1976 ) ( CLEAR ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1976 ) ) ( not ( = ?auto_1969 ?auto_1976 ) ) ( not ( = ?auto_1974 ?auto_1976 ) ) ( TRUCK-AT ?auto_1972 ?auto_1971 ) ( SURFACE-AT ?auto_1974 ?auto_1971 ) ( CLEAR ?auto_1974 ) ( LIFTING ?auto_1975 ?auto_1968 ) ( IS-CRATE ?auto_1968 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1974 ?auto_1968 )
      ( MAKE-2CRATE ?auto_1974 ?auto_1968 ?auto_1969 )
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
      ?auto_1983 - HOIST
      ?auto_1984 - PLACE
      ?auto_1985 - PLACE
      ?auto_1982 - HOIST
      ?auto_1980 - SURFACE
      ?auto_1981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1983 ?auto_1984 ) ( IS-CRATE ?auto_1979 ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1979 ) ) ( not ( = ?auto_1985 ?auto_1984 ) ) ( HOIST-AT ?auto_1982 ?auto_1985 ) ( not ( = ?auto_1983 ?auto_1982 ) ) ( AVAILABLE ?auto_1982 ) ( SURFACE-AT ?auto_1979 ?auto_1985 ) ( ON ?auto_1979 ?auto_1980 ) ( CLEAR ?auto_1979 ) ( not ( = ?auto_1978 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( TRUCK-AT ?auto_1981 ?auto_1984 ) ( SURFACE-AT ?auto_1977 ?auto_1984 ) ( CLEAR ?auto_1977 ) ( LIFTING ?auto_1983 ?auto_1978 ) ( IS-CRATE ?auto_1978 ) )
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
      ?auto_1991 - HOIST
      ?auto_1989 - PLACE
      ?auto_1990 - SURFACE
      ?auto_1988 - PLACE
      ?auto_1992 - HOIST
      ?auto_1993 - SURFACE
      ?auto_1994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1991 ?auto_1989 ) ( IS-CRATE ?auto_1987 ) ( not ( = ?auto_1986 ?auto_1987 ) ) ( not ( = ?auto_1990 ?auto_1986 ) ) ( not ( = ?auto_1990 ?auto_1987 ) ) ( not ( = ?auto_1988 ?auto_1989 ) ) ( HOIST-AT ?auto_1992 ?auto_1988 ) ( not ( = ?auto_1991 ?auto_1992 ) ) ( AVAILABLE ?auto_1992 ) ( SURFACE-AT ?auto_1987 ?auto_1988 ) ( ON ?auto_1987 ?auto_1993 ) ( CLEAR ?auto_1987 ) ( not ( = ?auto_1986 ?auto_1993 ) ) ( not ( = ?auto_1987 ?auto_1993 ) ) ( not ( = ?auto_1990 ?auto_1993 ) ) ( TRUCK-AT ?auto_1994 ?auto_1989 ) ( SURFACE-AT ?auto_1990 ?auto_1989 ) ( CLEAR ?auto_1990 ) ( IS-CRATE ?auto_1986 ) ( AVAILABLE ?auto_1991 ) ( IN ?auto_1986 ?auto_1994 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1991 ?auto_1986 ?auto_1994 ?auto_1989 )
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
      ?auto_2002 - PLACE
      ?auto_1998 - PLACE
      ?auto_1999 - HOIST
      ?auto_2000 - SURFACE
      ?auto_2003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001 ?auto_2002 ) ( IS-CRATE ?auto_1997 ) ( not ( = ?auto_1996 ?auto_1997 ) ) ( not ( = ?auto_1995 ?auto_1996 ) ) ( not ( = ?auto_1995 ?auto_1997 ) ) ( not ( = ?auto_1998 ?auto_2002 ) ) ( HOIST-AT ?auto_1999 ?auto_1998 ) ( not ( = ?auto_2001 ?auto_1999 ) ) ( AVAILABLE ?auto_1999 ) ( SURFACE-AT ?auto_1997 ?auto_1998 ) ( ON ?auto_1997 ?auto_2000 ) ( CLEAR ?auto_1997 ) ( not ( = ?auto_1996 ?auto_2000 ) ) ( not ( = ?auto_1997 ?auto_2000 ) ) ( not ( = ?auto_1995 ?auto_2000 ) ) ( TRUCK-AT ?auto_2003 ?auto_2002 ) ( SURFACE-AT ?auto_1995 ?auto_2002 ) ( CLEAR ?auto_1995 ) ( IS-CRATE ?auto_1996 ) ( AVAILABLE ?auto_2001 ) ( IN ?auto_1996 ?auto_2003 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1996 ?auto_1997 )
      ( MAKE-2CRATE-VERIFY ?auto_1995 ?auto_1996 ?auto_1997 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2040 - SURFACE
      ?auto_2041 - SURFACE
    )
    :vars
    (
      ?auto_2048 - HOIST
      ?auto_2044 - PLACE
      ?auto_2046 - SURFACE
      ?auto_2043 - PLACE
      ?auto_2047 - HOIST
      ?auto_2045 - SURFACE
      ?auto_2042 - TRUCK
      ?auto_2049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2048 ?auto_2044 ) ( SURFACE-AT ?auto_2040 ?auto_2044 ) ( CLEAR ?auto_2040 ) ( IS-CRATE ?auto_2041 ) ( not ( = ?auto_2040 ?auto_2041 ) ) ( AVAILABLE ?auto_2048 ) ( ON ?auto_2040 ?auto_2046 ) ( not ( = ?auto_2046 ?auto_2040 ) ) ( not ( = ?auto_2046 ?auto_2041 ) ) ( not ( = ?auto_2043 ?auto_2044 ) ) ( HOIST-AT ?auto_2047 ?auto_2043 ) ( not ( = ?auto_2048 ?auto_2047 ) ) ( AVAILABLE ?auto_2047 ) ( SURFACE-AT ?auto_2041 ?auto_2043 ) ( ON ?auto_2041 ?auto_2045 ) ( CLEAR ?auto_2041 ) ( not ( = ?auto_2040 ?auto_2045 ) ) ( not ( = ?auto_2041 ?auto_2045 ) ) ( not ( = ?auto_2046 ?auto_2045 ) ) ( TRUCK-AT ?auto_2042 ?auto_2049 ) ( not ( = ?auto_2049 ?auto_2044 ) ) ( not ( = ?auto_2043 ?auto_2049 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2042 ?auto_2049 ?auto_2044 )
      ( MAKE-1CRATE ?auto_2040 ?auto_2041 )
      ( MAKE-1CRATE-VERIFY ?auto_2040 ?auto_2041 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2079 - SURFACE
      ?auto_2080 - SURFACE
      ?auto_2081 - SURFACE
      ?auto_2082 - SURFACE
    )
    :vars
    (
      ?auto_2084 - HOIST
      ?auto_2083 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2084 ?auto_2083 ) ( SURFACE-AT ?auto_2081 ?auto_2083 ) ( CLEAR ?auto_2081 ) ( LIFTING ?auto_2084 ?auto_2082 ) ( IS-CRATE ?auto_2082 ) ( not ( = ?auto_2081 ?auto_2082 ) ) ( ON ?auto_2080 ?auto_2079 ) ( ON ?auto_2081 ?auto_2080 ) ( not ( = ?auto_2079 ?auto_2080 ) ) ( not ( = ?auto_2079 ?auto_2081 ) ) ( not ( = ?auto_2079 ?auto_2082 ) ) ( not ( = ?auto_2080 ?auto_2081 ) ) ( not ( = ?auto_2080 ?auto_2082 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2081 ?auto_2082 )
      ( MAKE-3CRATE-VERIFY ?auto_2079 ?auto_2080 ?auto_2081 ?auto_2082 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2096 - SURFACE
      ?auto_2097 - SURFACE
      ?auto_2098 - SURFACE
      ?auto_2099 - SURFACE
    )
    :vars
    (
      ?auto_2102 - HOIST
      ?auto_2101 - PLACE
      ?auto_2100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2102 ?auto_2101 ) ( SURFACE-AT ?auto_2098 ?auto_2101 ) ( CLEAR ?auto_2098 ) ( IS-CRATE ?auto_2099 ) ( not ( = ?auto_2098 ?auto_2099 ) ) ( TRUCK-AT ?auto_2100 ?auto_2101 ) ( AVAILABLE ?auto_2102 ) ( IN ?auto_2099 ?auto_2100 ) ( ON ?auto_2098 ?auto_2097 ) ( not ( = ?auto_2097 ?auto_2098 ) ) ( not ( = ?auto_2097 ?auto_2099 ) ) ( ON ?auto_2097 ?auto_2096 ) ( not ( = ?auto_2096 ?auto_2097 ) ) ( not ( = ?auto_2096 ?auto_2098 ) ) ( not ( = ?auto_2096 ?auto_2099 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2097 ?auto_2098 ?auto_2099 )
      ( MAKE-3CRATE-VERIFY ?auto_2096 ?auto_2097 ?auto_2098 ?auto_2099 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2117 - SURFACE
      ?auto_2118 - SURFACE
      ?auto_2119 - SURFACE
      ?auto_2120 - SURFACE
    )
    :vars
    (
      ?auto_2121 - HOIST
      ?auto_2124 - PLACE
      ?auto_2122 - TRUCK
      ?auto_2123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2121 ?auto_2124 ) ( SURFACE-AT ?auto_2119 ?auto_2124 ) ( CLEAR ?auto_2119 ) ( IS-CRATE ?auto_2120 ) ( not ( = ?auto_2119 ?auto_2120 ) ) ( AVAILABLE ?auto_2121 ) ( IN ?auto_2120 ?auto_2122 ) ( ON ?auto_2119 ?auto_2118 ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( not ( = ?auto_2118 ?auto_2120 ) ) ( TRUCK-AT ?auto_2122 ?auto_2123 ) ( not ( = ?auto_2123 ?auto_2124 ) ) ( ON ?auto_2118 ?auto_2117 ) ( not ( = ?auto_2117 ?auto_2118 ) ) ( not ( = ?auto_2117 ?auto_2119 ) ) ( not ( = ?auto_2117 ?auto_2120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2118 ?auto_2119 ?auto_2120 )
      ( MAKE-3CRATE-VERIFY ?auto_2117 ?auto_2118 ?auto_2119 ?auto_2120 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2141 - SURFACE
      ?auto_2142 - SURFACE
      ?auto_2143 - SURFACE
      ?auto_2144 - SURFACE
    )
    :vars
    (
      ?auto_2147 - HOIST
      ?auto_2146 - PLACE
      ?auto_2149 - TRUCK
      ?auto_2145 - PLACE
      ?auto_2148 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147 ?auto_2146 ) ( SURFACE-AT ?auto_2143 ?auto_2146 ) ( CLEAR ?auto_2143 ) ( IS-CRATE ?auto_2144 ) ( not ( = ?auto_2143 ?auto_2144 ) ) ( AVAILABLE ?auto_2147 ) ( ON ?auto_2143 ?auto_2142 ) ( not ( = ?auto_2142 ?auto_2143 ) ) ( not ( = ?auto_2142 ?auto_2144 ) ) ( TRUCK-AT ?auto_2149 ?auto_2145 ) ( not ( = ?auto_2145 ?auto_2146 ) ) ( HOIST-AT ?auto_2148 ?auto_2145 ) ( LIFTING ?auto_2148 ?auto_2144 ) ( not ( = ?auto_2147 ?auto_2148 ) ) ( ON ?auto_2142 ?auto_2141 ) ( not ( = ?auto_2141 ?auto_2142 ) ) ( not ( = ?auto_2141 ?auto_2143 ) ) ( not ( = ?auto_2141 ?auto_2144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142 ?auto_2143 ?auto_2144 )
      ( MAKE-3CRATE-VERIFY ?auto_2141 ?auto_2142 ?auto_2143 ?auto_2144 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2168 - SURFACE
      ?auto_2169 - SURFACE
      ?auto_2170 - SURFACE
      ?auto_2171 - SURFACE
    )
    :vars
    (
      ?auto_2176 - HOIST
      ?auto_2175 - PLACE
      ?auto_2173 - TRUCK
      ?auto_2172 - PLACE
      ?auto_2174 - HOIST
      ?auto_2177 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2176 ?auto_2175 ) ( SURFACE-AT ?auto_2170 ?auto_2175 ) ( CLEAR ?auto_2170 ) ( IS-CRATE ?auto_2171 ) ( not ( = ?auto_2170 ?auto_2171 ) ) ( AVAILABLE ?auto_2176 ) ( ON ?auto_2170 ?auto_2169 ) ( not ( = ?auto_2169 ?auto_2170 ) ) ( not ( = ?auto_2169 ?auto_2171 ) ) ( TRUCK-AT ?auto_2173 ?auto_2172 ) ( not ( = ?auto_2172 ?auto_2175 ) ) ( HOIST-AT ?auto_2174 ?auto_2172 ) ( not ( = ?auto_2176 ?auto_2174 ) ) ( AVAILABLE ?auto_2174 ) ( SURFACE-AT ?auto_2171 ?auto_2172 ) ( ON ?auto_2171 ?auto_2177 ) ( CLEAR ?auto_2171 ) ( not ( = ?auto_2170 ?auto_2177 ) ) ( not ( = ?auto_2171 ?auto_2177 ) ) ( not ( = ?auto_2169 ?auto_2177 ) ) ( ON ?auto_2169 ?auto_2168 ) ( not ( = ?auto_2168 ?auto_2169 ) ) ( not ( = ?auto_2168 ?auto_2170 ) ) ( not ( = ?auto_2168 ?auto_2171 ) ) ( not ( = ?auto_2168 ?auto_2177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2169 ?auto_2170 ?auto_2171 )
      ( MAKE-3CRATE-VERIFY ?auto_2168 ?auto_2169 ?auto_2170 ?auto_2171 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2196 - SURFACE
      ?auto_2197 - SURFACE
      ?auto_2198 - SURFACE
      ?auto_2199 - SURFACE
    )
    :vars
    (
      ?auto_2204 - HOIST
      ?auto_2202 - PLACE
      ?auto_2203 - PLACE
      ?auto_2205 - HOIST
      ?auto_2200 - SURFACE
      ?auto_2201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2204 ?auto_2202 ) ( SURFACE-AT ?auto_2198 ?auto_2202 ) ( CLEAR ?auto_2198 ) ( IS-CRATE ?auto_2199 ) ( not ( = ?auto_2198 ?auto_2199 ) ) ( AVAILABLE ?auto_2204 ) ( ON ?auto_2198 ?auto_2197 ) ( not ( = ?auto_2197 ?auto_2198 ) ) ( not ( = ?auto_2197 ?auto_2199 ) ) ( not ( = ?auto_2203 ?auto_2202 ) ) ( HOIST-AT ?auto_2205 ?auto_2203 ) ( not ( = ?auto_2204 ?auto_2205 ) ) ( AVAILABLE ?auto_2205 ) ( SURFACE-AT ?auto_2199 ?auto_2203 ) ( ON ?auto_2199 ?auto_2200 ) ( CLEAR ?auto_2199 ) ( not ( = ?auto_2198 ?auto_2200 ) ) ( not ( = ?auto_2199 ?auto_2200 ) ) ( not ( = ?auto_2197 ?auto_2200 ) ) ( TRUCK-AT ?auto_2201 ?auto_2202 ) ( ON ?auto_2197 ?auto_2196 ) ( not ( = ?auto_2196 ?auto_2197 ) ) ( not ( = ?auto_2196 ?auto_2198 ) ) ( not ( = ?auto_2196 ?auto_2199 ) ) ( not ( = ?auto_2196 ?auto_2200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2197 ?auto_2198 ?auto_2199 )
      ( MAKE-3CRATE-VERIFY ?auto_2196 ?auto_2197 ?auto_2198 ?auto_2199 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2224 - SURFACE
      ?auto_2225 - SURFACE
      ?auto_2226 - SURFACE
      ?auto_2227 - SURFACE
    )
    :vars
    (
      ?auto_2229 - HOIST
      ?auto_2232 - PLACE
      ?auto_2231 - PLACE
      ?auto_2230 - HOIST
      ?auto_2228 - SURFACE
      ?auto_2233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2229 ?auto_2232 ) ( IS-CRATE ?auto_2227 ) ( not ( = ?auto_2226 ?auto_2227 ) ) ( not ( = ?auto_2225 ?auto_2226 ) ) ( not ( = ?auto_2225 ?auto_2227 ) ) ( not ( = ?auto_2231 ?auto_2232 ) ) ( HOIST-AT ?auto_2230 ?auto_2231 ) ( not ( = ?auto_2229 ?auto_2230 ) ) ( AVAILABLE ?auto_2230 ) ( SURFACE-AT ?auto_2227 ?auto_2231 ) ( ON ?auto_2227 ?auto_2228 ) ( CLEAR ?auto_2227 ) ( not ( = ?auto_2226 ?auto_2228 ) ) ( not ( = ?auto_2227 ?auto_2228 ) ) ( not ( = ?auto_2225 ?auto_2228 ) ) ( TRUCK-AT ?auto_2233 ?auto_2232 ) ( SURFACE-AT ?auto_2225 ?auto_2232 ) ( CLEAR ?auto_2225 ) ( LIFTING ?auto_2229 ?auto_2226 ) ( IS-CRATE ?auto_2226 ) ( ON ?auto_2225 ?auto_2224 ) ( not ( = ?auto_2224 ?auto_2225 ) ) ( not ( = ?auto_2224 ?auto_2226 ) ) ( not ( = ?auto_2224 ?auto_2227 ) ) ( not ( = ?auto_2224 ?auto_2228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2225 ?auto_2226 ?auto_2227 )
      ( MAKE-3CRATE-VERIFY ?auto_2224 ?auto_2225 ?auto_2226 ?auto_2227 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2252 - SURFACE
      ?auto_2253 - SURFACE
      ?auto_2254 - SURFACE
      ?auto_2255 - SURFACE
    )
    :vars
    (
      ?auto_2257 - HOIST
      ?auto_2259 - PLACE
      ?auto_2260 - PLACE
      ?auto_2258 - HOIST
      ?auto_2261 - SURFACE
      ?auto_2256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2257 ?auto_2259 ) ( IS-CRATE ?auto_2255 ) ( not ( = ?auto_2254 ?auto_2255 ) ) ( not ( = ?auto_2253 ?auto_2254 ) ) ( not ( = ?auto_2253 ?auto_2255 ) ) ( not ( = ?auto_2260 ?auto_2259 ) ) ( HOIST-AT ?auto_2258 ?auto_2260 ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( AVAILABLE ?auto_2258 ) ( SURFACE-AT ?auto_2255 ?auto_2260 ) ( ON ?auto_2255 ?auto_2261 ) ( CLEAR ?auto_2255 ) ( not ( = ?auto_2254 ?auto_2261 ) ) ( not ( = ?auto_2255 ?auto_2261 ) ) ( not ( = ?auto_2253 ?auto_2261 ) ) ( TRUCK-AT ?auto_2256 ?auto_2259 ) ( SURFACE-AT ?auto_2253 ?auto_2259 ) ( CLEAR ?auto_2253 ) ( IS-CRATE ?auto_2254 ) ( AVAILABLE ?auto_2257 ) ( IN ?auto_2254 ?auto_2256 ) ( ON ?auto_2253 ?auto_2252 ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( not ( = ?auto_2252 ?auto_2254 ) ) ( not ( = ?auto_2252 ?auto_2255 ) ) ( not ( = ?auto_2252 ?auto_2261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2253 ?auto_2254 ?auto_2255 )
      ( MAKE-3CRATE-VERIFY ?auto_2252 ?auto_2253 ?auto_2254 ?auto_2255 ) )
  )

)

