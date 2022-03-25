( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1711 - OBJ
      ?auto_1710 - LOCATION
    )
    :vars
    (
      ?auto_1713 - LOCATION
      ?auto_1714 - CITY
      ?auto_1712 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1713 ?auto_1714 ) ( IN-CITY ?auto_1710 ?auto_1714 ) ( not ( = ?auto_1710 ?auto_1713 ) ) ( OBJ-AT ?auto_1711 ?auto_1713 ) ( TRUCK-AT ?auto_1712 ?auto_1710 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1712 ?auto_1710 ?auto_1713 ?auto_1714 )
      ( !LOAD-TRUCK ?auto_1711 ?auto_1712 ?auto_1713 )
      ( !DRIVE-TRUCK ?auto_1712 ?auto_1713 ?auto_1710 ?auto_1714 )
      ( !UNLOAD-TRUCK ?auto_1711 ?auto_1712 ?auto_1710 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1718 - OBJ
      ?auto_1717 - LOCATION
    )
    :vars
    (
      ?auto_1720 - LOCATION
      ?auto_1721 - CITY
      ?auto_1719 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1720 ?auto_1721 ) ( IN-CITY ?auto_1717 ?auto_1721 ) ( not ( = ?auto_1717 ?auto_1720 ) ) ( OBJ-AT ?auto_1718 ?auto_1720 ) ( TRUCK-AT ?auto_1719 ?auto_1717 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1719 ?auto_1717 ?auto_1720 ?auto_1721 )
      ( !LOAD-TRUCK ?auto_1718 ?auto_1719 ?auto_1720 )
      ( !DRIVE-TRUCK ?auto_1719 ?auto_1720 ?auto_1717 ?auto_1721 )
      ( !UNLOAD-TRUCK ?auto_1718 ?auto_1719 ?auto_1717 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1732 - OBJ
      ?auto_1733 - OBJ
      ?auto_1731 - LOCATION
    )
    :vars
    (
      ?auto_1736 - LOCATION
      ?auto_1735 - CITY
      ?auto_1737 - LOCATION
      ?auto_1734 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1736 ?auto_1735 ) ( IN-CITY ?auto_1731 ?auto_1735 ) ( not ( = ?auto_1731 ?auto_1736 ) ) ( OBJ-AT ?auto_1733 ?auto_1736 ) ( IN-CITY ?auto_1737 ?auto_1735 ) ( not ( = ?auto_1731 ?auto_1737 ) ) ( OBJ-AT ?auto_1732 ?auto_1737 ) ( TRUCK-AT ?auto_1734 ?auto_1731 ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( not ( = ?auto_1736 ?auto_1737 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1732 ?auto_1731 )
      ( DELIVER-1PKG ?auto_1733 ?auto_1731 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1739 - OBJ
      ?auto_1740 - OBJ
      ?auto_1738 - LOCATION
    )
    :vars
    (
      ?auto_1741 - LOCATION
      ?auto_1744 - CITY
      ?auto_1743 - LOCATION
      ?auto_1742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1741 ?auto_1744 ) ( IN-CITY ?auto_1738 ?auto_1744 ) ( not ( = ?auto_1738 ?auto_1741 ) ) ( OBJ-AT ?auto_1739 ?auto_1741 ) ( IN-CITY ?auto_1743 ?auto_1744 ) ( not ( = ?auto_1738 ?auto_1743 ) ) ( OBJ-AT ?auto_1740 ?auto_1743 ) ( TRUCK-AT ?auto_1742 ?auto_1738 ) ( not ( = ?auto_1740 ?auto_1739 ) ) ( not ( = ?auto_1741 ?auto_1743 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1740 ?auto_1739 ?auto_1738 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1756 - OBJ
      ?auto_1755 - LOCATION
    )
    :vars
    (
      ?auto_1758 - LOCATION
      ?auto_1759 - CITY
      ?auto_1757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1758 ?auto_1759 ) ( IN-CITY ?auto_1755 ?auto_1759 ) ( not ( = ?auto_1755 ?auto_1758 ) ) ( OBJ-AT ?auto_1756 ?auto_1758 ) ( TRUCK-AT ?auto_1757 ?auto_1755 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1757 ?auto_1755 ?auto_1758 ?auto_1759 )
      ( !LOAD-TRUCK ?auto_1756 ?auto_1757 ?auto_1758 )
      ( !DRIVE-TRUCK ?auto_1757 ?auto_1758 ?auto_1755 ?auto_1759 )
      ( !UNLOAD-TRUCK ?auto_1756 ?auto_1757 ?auto_1755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1847 - OBJ
      ?auto_1848 - OBJ
      ?auto_1849 - OBJ
      ?auto_1846 - LOCATION
    )
    :vars
    (
      ?auto_1851 - LOCATION
      ?auto_1850 - CITY
      ?auto_1854 - LOCATION
      ?auto_1853 - LOCATION
      ?auto_1852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1851 ?auto_1850 ) ( IN-CITY ?auto_1846 ?auto_1850 ) ( not ( = ?auto_1846 ?auto_1851 ) ) ( OBJ-AT ?auto_1849 ?auto_1851 ) ( IN-CITY ?auto_1854 ?auto_1850 ) ( not ( = ?auto_1846 ?auto_1854 ) ) ( OBJ-AT ?auto_1848 ?auto_1854 ) ( IN-CITY ?auto_1853 ?auto_1850 ) ( not ( = ?auto_1846 ?auto_1853 ) ) ( OBJ-AT ?auto_1847 ?auto_1853 ) ( TRUCK-AT ?auto_1852 ?auto_1846 ) ( not ( = ?auto_1847 ?auto_1848 ) ) ( not ( = ?auto_1854 ?auto_1853 ) ) ( not ( = ?auto_1847 ?auto_1849 ) ) ( not ( = ?auto_1848 ?auto_1849 ) ) ( not ( = ?auto_1851 ?auto_1854 ) ) ( not ( = ?auto_1851 ?auto_1853 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1848 ?auto_1847 ?auto_1846 )
      ( DELIVER-1PKG ?auto_1849 ?auto_1846 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1866 - OBJ
      ?auto_1867 - OBJ
      ?auto_1868 - OBJ
      ?auto_1865 - LOCATION
    )
    :vars
    (
      ?auto_1873 - LOCATION
      ?auto_1871 - CITY
      ?auto_1870 - LOCATION
      ?auto_1869 - LOCATION
      ?auto_1872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1873 ?auto_1871 ) ( IN-CITY ?auto_1865 ?auto_1871 ) ( not ( = ?auto_1865 ?auto_1873 ) ) ( OBJ-AT ?auto_1867 ?auto_1873 ) ( IN-CITY ?auto_1870 ?auto_1871 ) ( not ( = ?auto_1865 ?auto_1870 ) ) ( OBJ-AT ?auto_1868 ?auto_1870 ) ( IN-CITY ?auto_1869 ?auto_1871 ) ( not ( = ?auto_1865 ?auto_1869 ) ) ( OBJ-AT ?auto_1866 ?auto_1869 ) ( TRUCK-AT ?auto_1872 ?auto_1865 ) ( not ( = ?auto_1866 ?auto_1868 ) ) ( not ( = ?auto_1870 ?auto_1869 ) ) ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1868 ?auto_1867 ) ) ( not ( = ?auto_1873 ?auto_1870 ) ) ( not ( = ?auto_1873 ?auto_1869 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1866 ?auto_1868 ?auto_1867 ?auto_1865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1885 - OBJ
      ?auto_1886 - OBJ
      ?auto_1887 - OBJ
      ?auto_1884 - LOCATION
    )
    :vars
    (
      ?auto_1889 - LOCATION
      ?auto_1890 - CITY
      ?auto_1892 - LOCATION
      ?auto_1891 - LOCATION
      ?auto_1888 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1889 ?auto_1890 ) ( IN-CITY ?auto_1884 ?auto_1890 ) ( not ( = ?auto_1884 ?auto_1889 ) ) ( OBJ-AT ?auto_1887 ?auto_1889 ) ( IN-CITY ?auto_1892 ?auto_1890 ) ( not ( = ?auto_1884 ?auto_1892 ) ) ( OBJ-AT ?auto_1885 ?auto_1892 ) ( IN-CITY ?auto_1891 ?auto_1890 ) ( not ( = ?auto_1884 ?auto_1891 ) ) ( OBJ-AT ?auto_1886 ?auto_1891 ) ( TRUCK-AT ?auto_1888 ?auto_1884 ) ( not ( = ?auto_1886 ?auto_1885 ) ) ( not ( = ?auto_1892 ?auto_1891 ) ) ( not ( = ?auto_1886 ?auto_1887 ) ) ( not ( = ?auto_1885 ?auto_1887 ) ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( not ( = ?auto_1889 ?auto_1891 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1886 ?auto_1887 ?auto_1885 ?auto_1884 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1904 - OBJ
      ?auto_1905 - OBJ
      ?auto_1906 - OBJ
      ?auto_1903 - LOCATION
    )
    :vars
    (
      ?auto_1908 - LOCATION
      ?auto_1909 - CITY
      ?auto_1911 - LOCATION
      ?auto_1910 - LOCATION
      ?auto_1907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1908 ?auto_1909 ) ( IN-CITY ?auto_1903 ?auto_1909 ) ( not ( = ?auto_1903 ?auto_1908 ) ) ( OBJ-AT ?auto_1905 ?auto_1908 ) ( IN-CITY ?auto_1911 ?auto_1909 ) ( not ( = ?auto_1903 ?auto_1911 ) ) ( OBJ-AT ?auto_1904 ?auto_1911 ) ( IN-CITY ?auto_1910 ?auto_1909 ) ( not ( = ?auto_1903 ?auto_1910 ) ) ( OBJ-AT ?auto_1906 ?auto_1910 ) ( TRUCK-AT ?auto_1907 ?auto_1903 ) ( not ( = ?auto_1906 ?auto_1904 ) ) ( not ( = ?auto_1911 ?auto_1910 ) ) ( not ( = ?auto_1906 ?auto_1905 ) ) ( not ( = ?auto_1904 ?auto_1905 ) ) ( not ( = ?auto_1908 ?auto_1911 ) ) ( not ( = ?auto_1908 ?auto_1910 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1906 ?auto_1905 ?auto_1904 ?auto_1903 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1943 - OBJ
      ?auto_1944 - OBJ
      ?auto_1945 - OBJ
      ?auto_1942 - LOCATION
    )
    :vars
    (
      ?auto_1947 - LOCATION
      ?auto_1948 - CITY
      ?auto_1950 - LOCATION
      ?auto_1949 - LOCATION
      ?auto_1946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1947 ?auto_1948 ) ( IN-CITY ?auto_1942 ?auto_1948 ) ( not ( = ?auto_1942 ?auto_1947 ) ) ( OBJ-AT ?auto_1943 ?auto_1947 ) ( IN-CITY ?auto_1950 ?auto_1948 ) ( not ( = ?auto_1942 ?auto_1950 ) ) ( OBJ-AT ?auto_1945 ?auto_1950 ) ( IN-CITY ?auto_1949 ?auto_1948 ) ( not ( = ?auto_1942 ?auto_1949 ) ) ( OBJ-AT ?auto_1944 ?auto_1949 ) ( TRUCK-AT ?auto_1946 ?auto_1942 ) ( not ( = ?auto_1944 ?auto_1945 ) ) ( not ( = ?auto_1950 ?auto_1949 ) ) ( not ( = ?auto_1944 ?auto_1943 ) ) ( not ( = ?auto_1945 ?auto_1943 ) ) ( not ( = ?auto_1947 ?auto_1950 ) ) ( not ( = ?auto_1947 ?auto_1949 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1944 ?auto_1943 ?auto_1945 ?auto_1942 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1962 - OBJ
      ?auto_1963 - OBJ
      ?auto_1964 - OBJ
      ?auto_1961 - LOCATION
    )
    :vars
    (
      ?auto_1966 - LOCATION
      ?auto_1967 - CITY
      ?auto_1969 - LOCATION
      ?auto_1968 - LOCATION
      ?auto_1965 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1966 ?auto_1967 ) ( IN-CITY ?auto_1961 ?auto_1967 ) ( not ( = ?auto_1961 ?auto_1966 ) ) ( OBJ-AT ?auto_1962 ?auto_1966 ) ( IN-CITY ?auto_1969 ?auto_1967 ) ( not ( = ?auto_1961 ?auto_1969 ) ) ( OBJ-AT ?auto_1963 ?auto_1969 ) ( IN-CITY ?auto_1968 ?auto_1967 ) ( not ( = ?auto_1961 ?auto_1968 ) ) ( OBJ-AT ?auto_1964 ?auto_1968 ) ( TRUCK-AT ?auto_1965 ?auto_1961 ) ( not ( = ?auto_1964 ?auto_1963 ) ) ( not ( = ?auto_1969 ?auto_1968 ) ) ( not ( = ?auto_1964 ?auto_1962 ) ) ( not ( = ?auto_1963 ?auto_1962 ) ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1964 ?auto_1962 ?auto_1963 ?auto_1961 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2024 - OBJ
      ?auto_2023 - LOCATION
    )
    :vars
    (
      ?auto_2026 - LOCATION
      ?auto_2027 - CITY
      ?auto_2025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2026 ?auto_2027 ) ( IN-CITY ?auto_2023 ?auto_2027 ) ( not ( = ?auto_2023 ?auto_2026 ) ) ( OBJ-AT ?auto_2024 ?auto_2026 ) ( TRUCK-AT ?auto_2025 ?auto_2023 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2025 ?auto_2023 ?auto_2026 ?auto_2027 )
      ( !LOAD-TRUCK ?auto_2024 ?auto_2025 ?auto_2026 )
      ( !DRIVE-TRUCK ?auto_2025 ?auto_2026 ?auto_2023 ?auto_2027 )
      ( !UNLOAD-TRUCK ?auto_2024 ?auto_2025 ?auto_2023 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3006 - OBJ
      ?auto_3007 - OBJ
      ?auto_3008 - OBJ
      ?auto_3009 - OBJ
      ?auto_3005 - LOCATION
    )
    :vars
    (
      ?auto_3010 - LOCATION
      ?auto_3011 - CITY
      ?auto_3014 - LOCATION
      ?auto_3013 - LOCATION
      ?auto_3012 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3010 ?auto_3011 ) ( IN-CITY ?auto_3005 ?auto_3011 ) ( not ( = ?auto_3005 ?auto_3010 ) ) ( OBJ-AT ?auto_3009 ?auto_3010 ) ( OBJ-AT ?auto_3008 ?auto_3010 ) ( IN-CITY ?auto_3014 ?auto_3011 ) ( not ( = ?auto_3005 ?auto_3014 ) ) ( OBJ-AT ?auto_3007 ?auto_3014 ) ( IN-CITY ?auto_3013 ?auto_3011 ) ( not ( = ?auto_3005 ?auto_3013 ) ) ( OBJ-AT ?auto_3006 ?auto_3013 ) ( TRUCK-AT ?auto_3012 ?auto_3005 ) ( not ( = ?auto_3006 ?auto_3007 ) ) ( not ( = ?auto_3014 ?auto_3013 ) ) ( not ( = ?auto_3006 ?auto_3008 ) ) ( not ( = ?auto_3007 ?auto_3008 ) ) ( not ( = ?auto_3010 ?auto_3014 ) ) ( not ( = ?auto_3010 ?auto_3013 ) ) ( not ( = ?auto_3006 ?auto_3009 ) ) ( not ( = ?auto_3007 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3009 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_3006 ?auto_3008 ?auto_3007 ?auto_3005 )
      ( DELIVER-1PKG ?auto_3009 ?auto_3005 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3038 - OBJ
      ?auto_3039 - OBJ
      ?auto_3040 - OBJ
      ?auto_3041 - OBJ
      ?auto_3037 - LOCATION
    )
    :vars
    (
      ?auto_3043 - LOCATION
      ?auto_3044 - CITY
      ?auto_3046 - LOCATION
      ?auto_3045 - LOCATION
      ?auto_3042 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3043 ?auto_3044 ) ( IN-CITY ?auto_3037 ?auto_3044 ) ( not ( = ?auto_3037 ?auto_3043 ) ) ( OBJ-AT ?auto_3040 ?auto_3043 ) ( OBJ-AT ?auto_3041 ?auto_3043 ) ( IN-CITY ?auto_3046 ?auto_3044 ) ( not ( = ?auto_3037 ?auto_3046 ) ) ( OBJ-AT ?auto_3039 ?auto_3046 ) ( IN-CITY ?auto_3045 ?auto_3044 ) ( not ( = ?auto_3037 ?auto_3045 ) ) ( OBJ-AT ?auto_3038 ?auto_3045 ) ( TRUCK-AT ?auto_3042 ?auto_3037 ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( not ( = ?auto_3046 ?auto_3045 ) ) ( not ( = ?auto_3038 ?auto_3041 ) ) ( not ( = ?auto_3039 ?auto_3041 ) ) ( not ( = ?auto_3043 ?auto_3046 ) ) ( not ( = ?auto_3043 ?auto_3045 ) ) ( not ( = ?auto_3038 ?auto_3040 ) ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( not ( = ?auto_3041 ?auto_3040 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3038 ?auto_3039 ?auto_3041 ?auto_3040 ?auto_3037 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3070 - OBJ
      ?auto_3071 - OBJ
      ?auto_3072 - OBJ
      ?auto_3073 - OBJ
      ?auto_3069 - LOCATION
    )
    :vars
    (
      ?auto_3074 - LOCATION
      ?auto_3077 - CITY
      ?auto_3075 - LOCATION
      ?auto_3076 - LOCATION
      ?auto_3078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3074 ?auto_3077 ) ( IN-CITY ?auto_3069 ?auto_3077 ) ( not ( = ?auto_3069 ?auto_3074 ) ) ( OBJ-AT ?auto_3073 ?auto_3074 ) ( OBJ-AT ?auto_3071 ?auto_3074 ) ( IN-CITY ?auto_3075 ?auto_3077 ) ( not ( = ?auto_3069 ?auto_3075 ) ) ( OBJ-AT ?auto_3072 ?auto_3075 ) ( IN-CITY ?auto_3076 ?auto_3077 ) ( not ( = ?auto_3069 ?auto_3076 ) ) ( OBJ-AT ?auto_3070 ?auto_3076 ) ( TRUCK-AT ?auto_3078 ?auto_3069 ) ( not ( = ?auto_3070 ?auto_3072 ) ) ( not ( = ?auto_3075 ?auto_3076 ) ) ( not ( = ?auto_3070 ?auto_3071 ) ) ( not ( = ?auto_3072 ?auto_3071 ) ) ( not ( = ?auto_3074 ?auto_3075 ) ) ( not ( = ?auto_3074 ?auto_3076 ) ) ( not ( = ?auto_3070 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3071 ?auto_3073 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3070 ?auto_3072 ?auto_3073 ?auto_3071 ?auto_3069 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3102 - OBJ
      ?auto_3103 - OBJ
      ?auto_3104 - OBJ
      ?auto_3105 - OBJ
      ?auto_3101 - LOCATION
    )
    :vars
    (
      ?auto_3106 - LOCATION
      ?auto_3109 - CITY
      ?auto_3107 - LOCATION
      ?auto_3108 - LOCATION
      ?auto_3110 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3106 ?auto_3109 ) ( IN-CITY ?auto_3101 ?auto_3109 ) ( not ( = ?auto_3101 ?auto_3106 ) ) ( OBJ-AT ?auto_3104 ?auto_3106 ) ( OBJ-AT ?auto_3103 ?auto_3106 ) ( IN-CITY ?auto_3107 ?auto_3109 ) ( not ( = ?auto_3101 ?auto_3107 ) ) ( OBJ-AT ?auto_3105 ?auto_3107 ) ( IN-CITY ?auto_3108 ?auto_3109 ) ( not ( = ?auto_3101 ?auto_3108 ) ) ( OBJ-AT ?auto_3102 ?auto_3108 ) ( TRUCK-AT ?auto_3110 ?auto_3101 ) ( not ( = ?auto_3102 ?auto_3105 ) ) ( not ( = ?auto_3107 ?auto_3108 ) ) ( not ( = ?auto_3102 ?auto_3103 ) ) ( not ( = ?auto_3105 ?auto_3103 ) ) ( not ( = ?auto_3106 ?auto_3107 ) ) ( not ( = ?auto_3106 ?auto_3108 ) ) ( not ( = ?auto_3102 ?auto_3104 ) ) ( not ( = ?auto_3105 ?auto_3104 ) ) ( not ( = ?auto_3103 ?auto_3104 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3102 ?auto_3105 ?auto_3104 ?auto_3103 ?auto_3101 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3202 - OBJ
      ?auto_3203 - OBJ
      ?auto_3204 - OBJ
      ?auto_3205 - OBJ
      ?auto_3201 - LOCATION
    )
    :vars
    (
      ?auto_3206 - LOCATION
      ?auto_3209 - CITY
      ?auto_3207 - LOCATION
      ?auto_3208 - LOCATION
      ?auto_3210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3206 ?auto_3209 ) ( IN-CITY ?auto_3201 ?auto_3209 ) ( not ( = ?auto_3201 ?auto_3206 ) ) ( OBJ-AT ?auto_3203 ?auto_3206 ) ( OBJ-AT ?auto_3205 ?auto_3206 ) ( IN-CITY ?auto_3207 ?auto_3209 ) ( not ( = ?auto_3201 ?auto_3207 ) ) ( OBJ-AT ?auto_3204 ?auto_3207 ) ( IN-CITY ?auto_3208 ?auto_3209 ) ( not ( = ?auto_3201 ?auto_3208 ) ) ( OBJ-AT ?auto_3202 ?auto_3208 ) ( TRUCK-AT ?auto_3210 ?auto_3201 ) ( not ( = ?auto_3202 ?auto_3204 ) ) ( not ( = ?auto_3207 ?auto_3208 ) ) ( not ( = ?auto_3202 ?auto_3205 ) ) ( not ( = ?auto_3204 ?auto_3205 ) ) ( not ( = ?auto_3206 ?auto_3207 ) ) ( not ( = ?auto_3206 ?auto_3208 ) ) ( not ( = ?auto_3202 ?auto_3203 ) ) ( not ( = ?auto_3204 ?auto_3203 ) ) ( not ( = ?auto_3205 ?auto_3203 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3202 ?auto_3204 ?auto_3203 ?auto_3205 ?auto_3201 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3234 - OBJ
      ?auto_3235 - OBJ
      ?auto_3236 - OBJ
      ?auto_3237 - OBJ
      ?auto_3233 - LOCATION
    )
    :vars
    (
      ?auto_3238 - LOCATION
      ?auto_3241 - CITY
      ?auto_3239 - LOCATION
      ?auto_3240 - LOCATION
      ?auto_3242 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3238 ?auto_3241 ) ( IN-CITY ?auto_3233 ?auto_3241 ) ( not ( = ?auto_3233 ?auto_3238 ) ) ( OBJ-AT ?auto_3235 ?auto_3238 ) ( OBJ-AT ?auto_3236 ?auto_3238 ) ( IN-CITY ?auto_3239 ?auto_3241 ) ( not ( = ?auto_3233 ?auto_3239 ) ) ( OBJ-AT ?auto_3237 ?auto_3239 ) ( IN-CITY ?auto_3240 ?auto_3241 ) ( not ( = ?auto_3233 ?auto_3240 ) ) ( OBJ-AT ?auto_3234 ?auto_3240 ) ( TRUCK-AT ?auto_3242 ?auto_3233 ) ( not ( = ?auto_3234 ?auto_3237 ) ) ( not ( = ?auto_3239 ?auto_3240 ) ) ( not ( = ?auto_3234 ?auto_3236 ) ) ( not ( = ?auto_3237 ?auto_3236 ) ) ( not ( = ?auto_3238 ?auto_3239 ) ) ( not ( = ?auto_3238 ?auto_3240 ) ) ( not ( = ?auto_3234 ?auto_3235 ) ) ( not ( = ?auto_3237 ?auto_3235 ) ) ( not ( = ?auto_3236 ?auto_3235 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3234 ?auto_3237 ?auto_3235 ?auto_3236 ?auto_3233 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3334 - OBJ
      ?auto_3335 - OBJ
      ?auto_3336 - OBJ
      ?auto_3337 - OBJ
      ?auto_3333 - LOCATION
    )
    :vars
    (
      ?auto_3338 - LOCATION
      ?auto_3341 - CITY
      ?auto_3339 - LOCATION
      ?auto_3340 - LOCATION
      ?auto_3342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3338 ?auto_3341 ) ( IN-CITY ?auto_3333 ?auto_3341 ) ( not ( = ?auto_3333 ?auto_3338 ) ) ( OBJ-AT ?auto_3337 ?auto_3338 ) ( OBJ-AT ?auto_3336 ?auto_3338 ) ( IN-CITY ?auto_3339 ?auto_3341 ) ( not ( = ?auto_3333 ?auto_3339 ) ) ( OBJ-AT ?auto_3334 ?auto_3339 ) ( IN-CITY ?auto_3340 ?auto_3341 ) ( not ( = ?auto_3333 ?auto_3340 ) ) ( OBJ-AT ?auto_3335 ?auto_3340 ) ( TRUCK-AT ?auto_3342 ?auto_3333 ) ( not ( = ?auto_3335 ?auto_3334 ) ) ( not ( = ?auto_3339 ?auto_3340 ) ) ( not ( = ?auto_3335 ?auto_3336 ) ) ( not ( = ?auto_3334 ?auto_3336 ) ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( not ( = ?auto_3338 ?auto_3340 ) ) ( not ( = ?auto_3335 ?auto_3337 ) ) ( not ( = ?auto_3334 ?auto_3337 ) ) ( not ( = ?auto_3336 ?auto_3337 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3335 ?auto_3334 ?auto_3337 ?auto_3336 ?auto_3333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3366 - OBJ
      ?auto_3367 - OBJ
      ?auto_3368 - OBJ
      ?auto_3369 - OBJ
      ?auto_3365 - LOCATION
    )
    :vars
    (
      ?auto_3370 - LOCATION
      ?auto_3373 - CITY
      ?auto_3371 - LOCATION
      ?auto_3372 - LOCATION
      ?auto_3374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3370 ?auto_3373 ) ( IN-CITY ?auto_3365 ?auto_3373 ) ( not ( = ?auto_3365 ?auto_3370 ) ) ( OBJ-AT ?auto_3368 ?auto_3370 ) ( OBJ-AT ?auto_3369 ?auto_3370 ) ( IN-CITY ?auto_3371 ?auto_3373 ) ( not ( = ?auto_3365 ?auto_3371 ) ) ( OBJ-AT ?auto_3366 ?auto_3371 ) ( IN-CITY ?auto_3372 ?auto_3373 ) ( not ( = ?auto_3365 ?auto_3372 ) ) ( OBJ-AT ?auto_3367 ?auto_3372 ) ( TRUCK-AT ?auto_3374 ?auto_3365 ) ( not ( = ?auto_3367 ?auto_3366 ) ) ( not ( = ?auto_3371 ?auto_3372 ) ) ( not ( = ?auto_3367 ?auto_3369 ) ) ( not ( = ?auto_3366 ?auto_3369 ) ) ( not ( = ?auto_3370 ?auto_3371 ) ) ( not ( = ?auto_3370 ?auto_3372 ) ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( not ( = ?auto_3366 ?auto_3368 ) ) ( not ( = ?auto_3369 ?auto_3368 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3367 ?auto_3366 ?auto_3368 ?auto_3369 ?auto_3365 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3467 - OBJ
      ?auto_3468 - OBJ
      ?auto_3469 - OBJ
      ?auto_3470 - OBJ
      ?auto_3466 - LOCATION
    )
    :vars
    (
      ?auto_3471 - LOCATION
      ?auto_3474 - CITY
      ?auto_3472 - LOCATION
      ?auto_3473 - LOCATION
      ?auto_3475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3471 ?auto_3474 ) ( IN-CITY ?auto_3466 ?auto_3474 ) ( not ( = ?auto_3466 ?auto_3471 ) ) ( OBJ-AT ?auto_3470 ?auto_3471 ) ( OBJ-AT ?auto_3468 ?auto_3471 ) ( IN-CITY ?auto_3472 ?auto_3474 ) ( not ( = ?auto_3466 ?auto_3472 ) ) ( OBJ-AT ?auto_3467 ?auto_3472 ) ( IN-CITY ?auto_3473 ?auto_3474 ) ( not ( = ?auto_3466 ?auto_3473 ) ) ( OBJ-AT ?auto_3469 ?auto_3473 ) ( TRUCK-AT ?auto_3475 ?auto_3466 ) ( not ( = ?auto_3469 ?auto_3467 ) ) ( not ( = ?auto_3472 ?auto_3473 ) ) ( not ( = ?auto_3469 ?auto_3468 ) ) ( not ( = ?auto_3467 ?auto_3468 ) ) ( not ( = ?auto_3471 ?auto_3472 ) ) ( not ( = ?auto_3471 ?auto_3473 ) ) ( not ( = ?auto_3469 ?auto_3470 ) ) ( not ( = ?auto_3467 ?auto_3470 ) ) ( not ( = ?auto_3468 ?auto_3470 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3469 ?auto_3467 ?auto_3470 ?auto_3468 ?auto_3466 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3499 - OBJ
      ?auto_3500 - OBJ
      ?auto_3501 - OBJ
      ?auto_3502 - OBJ
      ?auto_3498 - LOCATION
    )
    :vars
    (
      ?auto_3503 - LOCATION
      ?auto_3506 - CITY
      ?auto_3504 - LOCATION
      ?auto_3505 - LOCATION
      ?auto_3507 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3503 ?auto_3506 ) ( IN-CITY ?auto_3498 ?auto_3506 ) ( not ( = ?auto_3498 ?auto_3503 ) ) ( OBJ-AT ?auto_3501 ?auto_3503 ) ( OBJ-AT ?auto_3500 ?auto_3503 ) ( IN-CITY ?auto_3504 ?auto_3506 ) ( not ( = ?auto_3498 ?auto_3504 ) ) ( OBJ-AT ?auto_3499 ?auto_3504 ) ( IN-CITY ?auto_3505 ?auto_3506 ) ( not ( = ?auto_3498 ?auto_3505 ) ) ( OBJ-AT ?auto_3502 ?auto_3505 ) ( TRUCK-AT ?auto_3507 ?auto_3498 ) ( not ( = ?auto_3502 ?auto_3499 ) ) ( not ( = ?auto_3504 ?auto_3505 ) ) ( not ( = ?auto_3502 ?auto_3500 ) ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3503 ?auto_3504 ) ) ( not ( = ?auto_3503 ?auto_3505 ) ) ( not ( = ?auto_3502 ?auto_3501 ) ) ( not ( = ?auto_3499 ?auto_3501 ) ) ( not ( = ?auto_3500 ?auto_3501 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3502 ?auto_3499 ?auto_3501 ?auto_3500 ?auto_3498 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3564 - OBJ
      ?auto_3565 - OBJ
      ?auto_3566 - OBJ
      ?auto_3567 - OBJ
      ?auto_3563 - LOCATION
    )
    :vars
    (
      ?auto_3568 - LOCATION
      ?auto_3571 - CITY
      ?auto_3569 - LOCATION
      ?auto_3570 - LOCATION
      ?auto_3572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3568 ?auto_3571 ) ( IN-CITY ?auto_3563 ?auto_3571 ) ( not ( = ?auto_3563 ?auto_3568 ) ) ( OBJ-AT ?auto_3565 ?auto_3568 ) ( OBJ-AT ?auto_3567 ?auto_3568 ) ( IN-CITY ?auto_3569 ?auto_3571 ) ( not ( = ?auto_3563 ?auto_3569 ) ) ( OBJ-AT ?auto_3564 ?auto_3569 ) ( IN-CITY ?auto_3570 ?auto_3571 ) ( not ( = ?auto_3563 ?auto_3570 ) ) ( OBJ-AT ?auto_3566 ?auto_3570 ) ( TRUCK-AT ?auto_3572 ?auto_3563 ) ( not ( = ?auto_3566 ?auto_3564 ) ) ( not ( = ?auto_3569 ?auto_3570 ) ) ( not ( = ?auto_3566 ?auto_3567 ) ) ( not ( = ?auto_3564 ?auto_3567 ) ) ( not ( = ?auto_3568 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3570 ) ) ( not ( = ?auto_3566 ?auto_3565 ) ) ( not ( = ?auto_3564 ?auto_3565 ) ) ( not ( = ?auto_3567 ?auto_3565 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3566 ?auto_3564 ?auto_3565 ?auto_3567 ?auto_3563 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3631 - OBJ
      ?auto_3632 - OBJ
      ?auto_3633 - OBJ
      ?auto_3634 - OBJ
      ?auto_3630 - LOCATION
    )
    :vars
    (
      ?auto_3635 - LOCATION
      ?auto_3638 - CITY
      ?auto_3636 - LOCATION
      ?auto_3637 - LOCATION
      ?auto_3639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3635 ?auto_3638 ) ( IN-CITY ?auto_3630 ?auto_3638 ) ( not ( = ?auto_3630 ?auto_3635 ) ) ( OBJ-AT ?auto_3632 ?auto_3635 ) ( OBJ-AT ?auto_3633 ?auto_3635 ) ( IN-CITY ?auto_3636 ?auto_3638 ) ( not ( = ?auto_3630 ?auto_3636 ) ) ( OBJ-AT ?auto_3631 ?auto_3636 ) ( IN-CITY ?auto_3637 ?auto_3638 ) ( not ( = ?auto_3630 ?auto_3637 ) ) ( OBJ-AT ?auto_3634 ?auto_3637 ) ( TRUCK-AT ?auto_3639 ?auto_3630 ) ( not ( = ?auto_3634 ?auto_3631 ) ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( not ( = ?auto_3634 ?auto_3633 ) ) ( not ( = ?auto_3631 ?auto_3633 ) ) ( not ( = ?auto_3635 ?auto_3636 ) ) ( not ( = ?auto_3635 ?auto_3637 ) ) ( not ( = ?auto_3634 ?auto_3632 ) ) ( not ( = ?auto_3631 ?auto_3632 ) ) ( not ( = ?auto_3633 ?auto_3632 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3634 ?auto_3631 ?auto_3632 ?auto_3633 ?auto_3630 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3731 - OBJ
      ?auto_3732 - OBJ
      ?auto_3733 - OBJ
      ?auto_3734 - OBJ
      ?auto_3730 - LOCATION
    )
    :vars
    (
      ?auto_3735 - LOCATION
      ?auto_3738 - CITY
      ?auto_3736 - LOCATION
      ?auto_3737 - LOCATION
      ?auto_3739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3735 ?auto_3738 ) ( IN-CITY ?auto_3730 ?auto_3738 ) ( not ( = ?auto_3730 ?auto_3735 ) ) ( OBJ-AT ?auto_3734 ?auto_3735 ) ( OBJ-AT ?auto_3731 ?auto_3735 ) ( IN-CITY ?auto_3736 ?auto_3738 ) ( not ( = ?auto_3730 ?auto_3736 ) ) ( OBJ-AT ?auto_3733 ?auto_3736 ) ( IN-CITY ?auto_3737 ?auto_3738 ) ( not ( = ?auto_3730 ?auto_3737 ) ) ( OBJ-AT ?auto_3732 ?auto_3737 ) ( TRUCK-AT ?auto_3739 ?auto_3730 ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( not ( = ?auto_3736 ?auto_3737 ) ) ( not ( = ?auto_3732 ?auto_3731 ) ) ( not ( = ?auto_3733 ?auto_3731 ) ) ( not ( = ?auto_3735 ?auto_3736 ) ) ( not ( = ?auto_3735 ?auto_3737 ) ) ( not ( = ?auto_3732 ?auto_3734 ) ) ( not ( = ?auto_3733 ?auto_3734 ) ) ( not ( = ?auto_3731 ?auto_3734 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3732 ?auto_3733 ?auto_3734 ?auto_3731 ?auto_3730 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3763 - OBJ
      ?auto_3764 - OBJ
      ?auto_3765 - OBJ
      ?auto_3766 - OBJ
      ?auto_3762 - LOCATION
    )
    :vars
    (
      ?auto_3767 - LOCATION
      ?auto_3770 - CITY
      ?auto_3768 - LOCATION
      ?auto_3769 - LOCATION
      ?auto_3771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3767 ?auto_3770 ) ( IN-CITY ?auto_3762 ?auto_3770 ) ( not ( = ?auto_3762 ?auto_3767 ) ) ( OBJ-AT ?auto_3765 ?auto_3767 ) ( OBJ-AT ?auto_3763 ?auto_3767 ) ( IN-CITY ?auto_3768 ?auto_3770 ) ( not ( = ?auto_3762 ?auto_3768 ) ) ( OBJ-AT ?auto_3766 ?auto_3768 ) ( IN-CITY ?auto_3769 ?auto_3770 ) ( not ( = ?auto_3762 ?auto_3769 ) ) ( OBJ-AT ?auto_3764 ?auto_3769 ) ( TRUCK-AT ?auto_3771 ?auto_3762 ) ( not ( = ?auto_3764 ?auto_3766 ) ) ( not ( = ?auto_3768 ?auto_3769 ) ) ( not ( = ?auto_3764 ?auto_3763 ) ) ( not ( = ?auto_3766 ?auto_3763 ) ) ( not ( = ?auto_3767 ?auto_3768 ) ) ( not ( = ?auto_3767 ?auto_3769 ) ) ( not ( = ?auto_3764 ?auto_3765 ) ) ( not ( = ?auto_3766 ?auto_3765 ) ) ( not ( = ?auto_3763 ?auto_3765 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3764 ?auto_3766 ?auto_3765 ?auto_3763 ?auto_3762 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3795 - OBJ
      ?auto_3796 - OBJ
      ?auto_3797 - OBJ
      ?auto_3798 - OBJ
      ?auto_3794 - LOCATION
    )
    :vars
    (
      ?auto_3799 - LOCATION
      ?auto_3802 - CITY
      ?auto_3800 - LOCATION
      ?auto_3801 - LOCATION
      ?auto_3803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3799 ?auto_3802 ) ( IN-CITY ?auto_3794 ?auto_3802 ) ( not ( = ?auto_3794 ?auto_3799 ) ) ( OBJ-AT ?auto_3798 ?auto_3799 ) ( OBJ-AT ?auto_3795 ?auto_3799 ) ( IN-CITY ?auto_3800 ?auto_3802 ) ( not ( = ?auto_3794 ?auto_3800 ) ) ( OBJ-AT ?auto_3796 ?auto_3800 ) ( IN-CITY ?auto_3801 ?auto_3802 ) ( not ( = ?auto_3794 ?auto_3801 ) ) ( OBJ-AT ?auto_3797 ?auto_3801 ) ( TRUCK-AT ?auto_3803 ?auto_3794 ) ( not ( = ?auto_3797 ?auto_3796 ) ) ( not ( = ?auto_3800 ?auto_3801 ) ) ( not ( = ?auto_3797 ?auto_3795 ) ) ( not ( = ?auto_3796 ?auto_3795 ) ) ( not ( = ?auto_3799 ?auto_3800 ) ) ( not ( = ?auto_3799 ?auto_3801 ) ) ( not ( = ?auto_3797 ?auto_3798 ) ) ( not ( = ?auto_3796 ?auto_3798 ) ) ( not ( = ?auto_3795 ?auto_3798 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3797 ?auto_3796 ?auto_3798 ?auto_3795 ?auto_3794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3827 - OBJ
      ?auto_3828 - OBJ
      ?auto_3829 - OBJ
      ?auto_3830 - OBJ
      ?auto_3826 - LOCATION
    )
    :vars
    (
      ?auto_3831 - LOCATION
      ?auto_3834 - CITY
      ?auto_3832 - LOCATION
      ?auto_3833 - LOCATION
      ?auto_3835 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3831 ?auto_3834 ) ( IN-CITY ?auto_3826 ?auto_3834 ) ( not ( = ?auto_3826 ?auto_3831 ) ) ( OBJ-AT ?auto_3829 ?auto_3831 ) ( OBJ-AT ?auto_3827 ?auto_3831 ) ( IN-CITY ?auto_3832 ?auto_3834 ) ( not ( = ?auto_3826 ?auto_3832 ) ) ( OBJ-AT ?auto_3828 ?auto_3832 ) ( IN-CITY ?auto_3833 ?auto_3834 ) ( not ( = ?auto_3826 ?auto_3833 ) ) ( OBJ-AT ?auto_3830 ?auto_3833 ) ( TRUCK-AT ?auto_3835 ?auto_3826 ) ( not ( = ?auto_3830 ?auto_3828 ) ) ( not ( = ?auto_3832 ?auto_3833 ) ) ( not ( = ?auto_3830 ?auto_3827 ) ) ( not ( = ?auto_3828 ?auto_3827 ) ) ( not ( = ?auto_3831 ?auto_3832 ) ) ( not ( = ?auto_3831 ?auto_3833 ) ) ( not ( = ?auto_3830 ?auto_3829 ) ) ( not ( = ?auto_3828 ?auto_3829 ) ) ( not ( = ?auto_3827 ?auto_3829 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3830 ?auto_3828 ?auto_3829 ?auto_3827 ?auto_3826 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3961 - OBJ
      ?auto_3962 - OBJ
      ?auto_3963 - OBJ
      ?auto_3964 - OBJ
      ?auto_3960 - LOCATION
    )
    :vars
    (
      ?auto_3965 - LOCATION
      ?auto_3968 - CITY
      ?auto_3966 - LOCATION
      ?auto_3967 - LOCATION
      ?auto_3969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3965 ?auto_3968 ) ( IN-CITY ?auto_3960 ?auto_3968 ) ( not ( = ?auto_3960 ?auto_3965 ) ) ( OBJ-AT ?auto_3962 ?auto_3965 ) ( OBJ-AT ?auto_3961 ?auto_3965 ) ( IN-CITY ?auto_3966 ?auto_3968 ) ( not ( = ?auto_3960 ?auto_3966 ) ) ( OBJ-AT ?auto_3964 ?auto_3966 ) ( IN-CITY ?auto_3967 ?auto_3968 ) ( not ( = ?auto_3960 ?auto_3967 ) ) ( OBJ-AT ?auto_3963 ?auto_3967 ) ( TRUCK-AT ?auto_3969 ?auto_3960 ) ( not ( = ?auto_3963 ?auto_3964 ) ) ( not ( = ?auto_3966 ?auto_3967 ) ) ( not ( = ?auto_3963 ?auto_3961 ) ) ( not ( = ?auto_3964 ?auto_3961 ) ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3967 ) ) ( not ( = ?auto_3963 ?auto_3962 ) ) ( not ( = ?auto_3964 ?auto_3962 ) ) ( not ( = ?auto_3961 ?auto_3962 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3963 ?auto_3964 ?auto_3962 ?auto_3961 ?auto_3960 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3993 - OBJ
      ?auto_3994 - OBJ
      ?auto_3995 - OBJ
      ?auto_3996 - OBJ
      ?auto_3992 - LOCATION
    )
    :vars
    (
      ?auto_3997 - LOCATION
      ?auto_4000 - CITY
      ?auto_3998 - LOCATION
      ?auto_3999 - LOCATION
      ?auto_4001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3997 ?auto_4000 ) ( IN-CITY ?auto_3992 ?auto_4000 ) ( not ( = ?auto_3992 ?auto_3997 ) ) ( OBJ-AT ?auto_3994 ?auto_3997 ) ( OBJ-AT ?auto_3993 ?auto_3997 ) ( IN-CITY ?auto_3998 ?auto_4000 ) ( not ( = ?auto_3992 ?auto_3998 ) ) ( OBJ-AT ?auto_3995 ?auto_3998 ) ( IN-CITY ?auto_3999 ?auto_4000 ) ( not ( = ?auto_3992 ?auto_3999 ) ) ( OBJ-AT ?auto_3996 ?auto_3999 ) ( TRUCK-AT ?auto_4001 ?auto_3992 ) ( not ( = ?auto_3996 ?auto_3995 ) ) ( not ( = ?auto_3998 ?auto_3999 ) ) ( not ( = ?auto_3996 ?auto_3993 ) ) ( not ( = ?auto_3995 ?auto_3993 ) ) ( not ( = ?auto_3997 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_3999 ) ) ( not ( = ?auto_3996 ?auto_3994 ) ) ( not ( = ?auto_3995 ?auto_3994 ) ) ( not ( = ?auto_3993 ?auto_3994 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3996 ?auto_3995 ?auto_3994 ?auto_3993 ?auto_3992 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4196 - OBJ
      ?auto_4197 - OBJ
      ?auto_4198 - OBJ
      ?auto_4199 - OBJ
      ?auto_4195 - LOCATION
    )
    :vars
    (
      ?auto_4200 - LOCATION
      ?auto_4203 - CITY
      ?auto_4201 - LOCATION
      ?auto_4202 - LOCATION
      ?auto_4204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4200 ?auto_4203 ) ( IN-CITY ?auto_4195 ?auto_4203 ) ( not ( = ?auto_4195 ?auto_4200 ) ) ( OBJ-AT ?auto_4196 ?auto_4200 ) ( OBJ-AT ?auto_4199 ?auto_4200 ) ( IN-CITY ?auto_4201 ?auto_4203 ) ( not ( = ?auto_4195 ?auto_4201 ) ) ( OBJ-AT ?auto_4198 ?auto_4201 ) ( IN-CITY ?auto_4202 ?auto_4203 ) ( not ( = ?auto_4195 ?auto_4202 ) ) ( OBJ-AT ?auto_4197 ?auto_4202 ) ( TRUCK-AT ?auto_4204 ?auto_4195 ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( not ( = ?auto_4201 ?auto_4202 ) ) ( not ( = ?auto_4197 ?auto_4199 ) ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4200 ?auto_4201 ) ) ( not ( = ?auto_4200 ?auto_4202 ) ) ( not ( = ?auto_4197 ?auto_4196 ) ) ( not ( = ?auto_4198 ?auto_4196 ) ) ( not ( = ?auto_4199 ?auto_4196 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4197 ?auto_4198 ?auto_4196 ?auto_4199 ?auto_4195 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4228 - OBJ
      ?auto_4229 - OBJ
      ?auto_4230 - OBJ
      ?auto_4231 - OBJ
      ?auto_4227 - LOCATION
    )
    :vars
    (
      ?auto_4232 - LOCATION
      ?auto_4235 - CITY
      ?auto_4233 - LOCATION
      ?auto_4234 - LOCATION
      ?auto_4236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4232 ?auto_4235 ) ( IN-CITY ?auto_4227 ?auto_4235 ) ( not ( = ?auto_4227 ?auto_4232 ) ) ( OBJ-AT ?auto_4228 ?auto_4232 ) ( OBJ-AT ?auto_4230 ?auto_4232 ) ( IN-CITY ?auto_4233 ?auto_4235 ) ( not ( = ?auto_4227 ?auto_4233 ) ) ( OBJ-AT ?auto_4231 ?auto_4233 ) ( IN-CITY ?auto_4234 ?auto_4235 ) ( not ( = ?auto_4227 ?auto_4234 ) ) ( OBJ-AT ?auto_4229 ?auto_4234 ) ( TRUCK-AT ?auto_4236 ?auto_4227 ) ( not ( = ?auto_4229 ?auto_4231 ) ) ( not ( = ?auto_4233 ?auto_4234 ) ) ( not ( = ?auto_4229 ?auto_4230 ) ) ( not ( = ?auto_4231 ?auto_4230 ) ) ( not ( = ?auto_4232 ?auto_4233 ) ) ( not ( = ?auto_4232 ?auto_4234 ) ) ( not ( = ?auto_4229 ?auto_4228 ) ) ( not ( = ?auto_4231 ?auto_4228 ) ) ( not ( = ?auto_4230 ?auto_4228 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4229 ?auto_4231 ?auto_4228 ?auto_4230 ?auto_4227 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4328 - OBJ
      ?auto_4329 - OBJ
      ?auto_4330 - OBJ
      ?auto_4331 - OBJ
      ?auto_4327 - LOCATION
    )
    :vars
    (
      ?auto_4332 - LOCATION
      ?auto_4335 - CITY
      ?auto_4333 - LOCATION
      ?auto_4334 - LOCATION
      ?auto_4336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4332 ?auto_4335 ) ( IN-CITY ?auto_4327 ?auto_4335 ) ( not ( = ?auto_4327 ?auto_4332 ) ) ( OBJ-AT ?auto_4328 ?auto_4332 ) ( OBJ-AT ?auto_4331 ?auto_4332 ) ( IN-CITY ?auto_4333 ?auto_4335 ) ( not ( = ?auto_4327 ?auto_4333 ) ) ( OBJ-AT ?auto_4329 ?auto_4333 ) ( IN-CITY ?auto_4334 ?auto_4335 ) ( not ( = ?auto_4327 ?auto_4334 ) ) ( OBJ-AT ?auto_4330 ?auto_4334 ) ( TRUCK-AT ?auto_4336 ?auto_4327 ) ( not ( = ?auto_4330 ?auto_4329 ) ) ( not ( = ?auto_4333 ?auto_4334 ) ) ( not ( = ?auto_4330 ?auto_4331 ) ) ( not ( = ?auto_4329 ?auto_4331 ) ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4334 ) ) ( not ( = ?auto_4330 ?auto_4328 ) ) ( not ( = ?auto_4329 ?auto_4328 ) ) ( not ( = ?auto_4331 ?auto_4328 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4330 ?auto_4329 ?auto_4328 ?auto_4331 ?auto_4327 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4395 - OBJ
      ?auto_4396 - OBJ
      ?auto_4397 - OBJ
      ?auto_4398 - OBJ
      ?auto_4394 - LOCATION
    )
    :vars
    (
      ?auto_4399 - LOCATION
      ?auto_4402 - CITY
      ?auto_4400 - LOCATION
      ?auto_4401 - LOCATION
      ?auto_4403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4399 ?auto_4402 ) ( IN-CITY ?auto_4394 ?auto_4402 ) ( not ( = ?auto_4394 ?auto_4399 ) ) ( OBJ-AT ?auto_4395 ?auto_4399 ) ( OBJ-AT ?auto_4397 ?auto_4399 ) ( IN-CITY ?auto_4400 ?auto_4402 ) ( not ( = ?auto_4394 ?auto_4400 ) ) ( OBJ-AT ?auto_4396 ?auto_4400 ) ( IN-CITY ?auto_4401 ?auto_4402 ) ( not ( = ?auto_4394 ?auto_4401 ) ) ( OBJ-AT ?auto_4398 ?auto_4401 ) ( TRUCK-AT ?auto_4403 ?auto_4394 ) ( not ( = ?auto_4398 ?auto_4396 ) ) ( not ( = ?auto_4400 ?auto_4401 ) ) ( not ( = ?auto_4398 ?auto_4397 ) ) ( not ( = ?auto_4396 ?auto_4397 ) ) ( not ( = ?auto_4399 ?auto_4400 ) ) ( not ( = ?auto_4399 ?auto_4401 ) ) ( not ( = ?auto_4398 ?auto_4395 ) ) ( not ( = ?auto_4396 ?auto_4395 ) ) ( not ( = ?auto_4397 ?auto_4395 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4398 ?auto_4396 ?auto_4395 ?auto_4397 ?auto_4394 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4495 - OBJ
      ?auto_4496 - OBJ
      ?auto_4497 - OBJ
      ?auto_4498 - OBJ
      ?auto_4494 - LOCATION
    )
    :vars
    (
      ?auto_4499 - LOCATION
      ?auto_4502 - CITY
      ?auto_4500 - LOCATION
      ?auto_4501 - LOCATION
      ?auto_4503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4499 ?auto_4502 ) ( IN-CITY ?auto_4494 ?auto_4502 ) ( not ( = ?auto_4494 ?auto_4499 ) ) ( OBJ-AT ?auto_4495 ?auto_4499 ) ( OBJ-AT ?auto_4496 ?auto_4499 ) ( IN-CITY ?auto_4500 ?auto_4502 ) ( not ( = ?auto_4494 ?auto_4500 ) ) ( OBJ-AT ?auto_4498 ?auto_4500 ) ( IN-CITY ?auto_4501 ?auto_4502 ) ( not ( = ?auto_4494 ?auto_4501 ) ) ( OBJ-AT ?auto_4497 ?auto_4501 ) ( TRUCK-AT ?auto_4503 ?auto_4494 ) ( not ( = ?auto_4497 ?auto_4498 ) ) ( not ( = ?auto_4500 ?auto_4501 ) ) ( not ( = ?auto_4497 ?auto_4496 ) ) ( not ( = ?auto_4498 ?auto_4496 ) ) ( not ( = ?auto_4499 ?auto_4500 ) ) ( not ( = ?auto_4499 ?auto_4501 ) ) ( not ( = ?auto_4497 ?auto_4495 ) ) ( not ( = ?auto_4498 ?auto_4495 ) ) ( not ( = ?auto_4496 ?auto_4495 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4497 ?auto_4498 ?auto_4495 ?auto_4496 ?auto_4494 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4527 - OBJ
      ?auto_4528 - OBJ
      ?auto_4529 - OBJ
      ?auto_4530 - OBJ
      ?auto_4526 - LOCATION
    )
    :vars
    (
      ?auto_4531 - LOCATION
      ?auto_4534 - CITY
      ?auto_4532 - LOCATION
      ?auto_4533 - LOCATION
      ?auto_4535 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4531 ?auto_4534 ) ( IN-CITY ?auto_4526 ?auto_4534 ) ( not ( = ?auto_4526 ?auto_4531 ) ) ( OBJ-AT ?auto_4527 ?auto_4531 ) ( OBJ-AT ?auto_4528 ?auto_4531 ) ( IN-CITY ?auto_4532 ?auto_4534 ) ( not ( = ?auto_4526 ?auto_4532 ) ) ( OBJ-AT ?auto_4529 ?auto_4532 ) ( IN-CITY ?auto_4533 ?auto_4534 ) ( not ( = ?auto_4526 ?auto_4533 ) ) ( OBJ-AT ?auto_4530 ?auto_4533 ) ( TRUCK-AT ?auto_4535 ?auto_4526 ) ( not ( = ?auto_4530 ?auto_4529 ) ) ( not ( = ?auto_4532 ?auto_4533 ) ) ( not ( = ?auto_4530 ?auto_4528 ) ) ( not ( = ?auto_4529 ?auto_4528 ) ) ( not ( = ?auto_4531 ?auto_4532 ) ) ( not ( = ?auto_4531 ?auto_4533 ) ) ( not ( = ?auto_4530 ?auto_4527 ) ) ( not ( = ?auto_4529 ?auto_4527 ) ) ( not ( = ?auto_4528 ?auto_4527 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4530 ?auto_4529 ?auto_4527 ?auto_4528 ?auto_4526 ) )
  )

)

