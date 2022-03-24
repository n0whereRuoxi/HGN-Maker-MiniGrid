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
      ?auto_1734 - CITY
      ?auto_1737 - LOCATION
      ?auto_1735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1736 ?auto_1734 ) ( IN-CITY ?auto_1731 ?auto_1734 ) ( not ( = ?auto_1731 ?auto_1736 ) ) ( OBJ-AT ?auto_1733 ?auto_1736 ) ( IN-CITY ?auto_1737 ?auto_1734 ) ( not ( = ?auto_1731 ?auto_1737 ) ) ( OBJ-AT ?auto_1732 ?auto_1737 ) ( TRUCK-AT ?auto_1735 ?auto_1731 ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( not ( = ?auto_1736 ?auto_1737 ) ) )
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
      ?auto_1742 - LOCATION
      ?auto_1743 - CITY
      ?auto_1744 - LOCATION
      ?auto_1741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1742 ?auto_1743 ) ( IN-CITY ?auto_1738 ?auto_1743 ) ( not ( = ?auto_1738 ?auto_1742 ) ) ( OBJ-AT ?auto_1739 ?auto_1742 ) ( IN-CITY ?auto_1744 ?auto_1743 ) ( not ( = ?auto_1738 ?auto_1744 ) ) ( OBJ-AT ?auto_1740 ?auto_1744 ) ( TRUCK-AT ?auto_1741 ?auto_1738 ) ( not ( = ?auto_1740 ?auto_1739 ) ) ( not ( = ?auto_1742 ?auto_1744 ) ) )
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
      ?auto_1846 - OBJ
      ?auto_1847 - OBJ
      ?auto_1848 - OBJ
      ?auto_1845 - LOCATION
    )
    :vars
    (
      ?auto_1850 - LOCATION
      ?auto_1851 - CITY
      ?auto_1852 - LOCATION
      ?auto_1849 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1850 ?auto_1851 ) ( IN-CITY ?auto_1845 ?auto_1851 ) ( not ( = ?auto_1845 ?auto_1850 ) ) ( OBJ-AT ?auto_1848 ?auto_1850 ) ( OBJ-AT ?auto_1847 ?auto_1850 ) ( IN-CITY ?auto_1852 ?auto_1851 ) ( not ( = ?auto_1845 ?auto_1852 ) ) ( OBJ-AT ?auto_1846 ?auto_1852 ) ( TRUCK-AT ?auto_1849 ?auto_1845 ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( not ( = ?auto_1850 ?auto_1852 ) ) ( not ( = ?auto_1846 ?auto_1848 ) ) ( not ( = ?auto_1847 ?auto_1848 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1847 ?auto_1846 ?auto_1845 )
      ( DELIVER-1PKG ?auto_1848 ?auto_1845 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1863 - OBJ
      ?auto_1864 - OBJ
      ?auto_1865 - OBJ
      ?auto_1862 - LOCATION
    )
    :vars
    (
      ?auto_1866 - LOCATION
      ?auto_1868 - CITY
      ?auto_1867 - LOCATION
      ?auto_1869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1866 ?auto_1868 ) ( IN-CITY ?auto_1862 ?auto_1868 ) ( not ( = ?auto_1862 ?auto_1866 ) ) ( OBJ-AT ?auto_1864 ?auto_1866 ) ( OBJ-AT ?auto_1865 ?auto_1866 ) ( IN-CITY ?auto_1867 ?auto_1868 ) ( not ( = ?auto_1862 ?auto_1867 ) ) ( OBJ-AT ?auto_1863 ?auto_1867 ) ( TRUCK-AT ?auto_1869 ?auto_1862 ) ( not ( = ?auto_1863 ?auto_1865 ) ) ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1863 ?auto_1864 ) ) ( not ( = ?auto_1865 ?auto_1864 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1863 ?auto_1865 ?auto_1864 ?auto_1862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1880 - OBJ
      ?auto_1881 - OBJ
      ?auto_1882 - OBJ
      ?auto_1879 - LOCATION
    )
    :vars
    (
      ?auto_1886 - LOCATION
      ?auto_1885 - CITY
      ?auto_1883 - LOCATION
      ?auto_1884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1886 ?auto_1885 ) ( IN-CITY ?auto_1879 ?auto_1885 ) ( not ( = ?auto_1879 ?auto_1886 ) ) ( OBJ-AT ?auto_1882 ?auto_1886 ) ( OBJ-AT ?auto_1880 ?auto_1886 ) ( IN-CITY ?auto_1883 ?auto_1885 ) ( not ( = ?auto_1879 ?auto_1883 ) ) ( OBJ-AT ?auto_1881 ?auto_1883 ) ( TRUCK-AT ?auto_1884 ?auto_1879 ) ( not ( = ?auto_1881 ?auto_1880 ) ) ( not ( = ?auto_1886 ?auto_1883 ) ) ( not ( = ?auto_1881 ?auto_1882 ) ) ( not ( = ?auto_1880 ?auto_1882 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1881 ?auto_1882 ?auto_1880 ?auto_1879 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1897 - OBJ
      ?auto_1898 - OBJ
      ?auto_1899 - OBJ
      ?auto_1896 - LOCATION
    )
    :vars
    (
      ?auto_1903 - LOCATION
      ?auto_1902 - CITY
      ?auto_1900 - LOCATION
      ?auto_1901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1903 ?auto_1902 ) ( IN-CITY ?auto_1896 ?auto_1902 ) ( not ( = ?auto_1896 ?auto_1903 ) ) ( OBJ-AT ?auto_1898 ?auto_1903 ) ( OBJ-AT ?auto_1897 ?auto_1903 ) ( IN-CITY ?auto_1900 ?auto_1902 ) ( not ( = ?auto_1896 ?auto_1900 ) ) ( OBJ-AT ?auto_1899 ?auto_1900 ) ( TRUCK-AT ?auto_1901 ?auto_1896 ) ( not ( = ?auto_1899 ?auto_1897 ) ) ( not ( = ?auto_1903 ?auto_1900 ) ) ( not ( = ?auto_1899 ?auto_1898 ) ) ( not ( = ?auto_1897 ?auto_1898 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1899 ?auto_1898 ?auto_1897 ?auto_1896 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1932 - OBJ
      ?auto_1933 - OBJ
      ?auto_1934 - OBJ
      ?auto_1931 - LOCATION
    )
    :vars
    (
      ?auto_1938 - LOCATION
      ?auto_1937 - CITY
      ?auto_1935 - LOCATION
      ?auto_1936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1938 ?auto_1937 ) ( IN-CITY ?auto_1931 ?auto_1937 ) ( not ( = ?auto_1931 ?auto_1938 ) ) ( OBJ-AT ?auto_1932 ?auto_1938 ) ( OBJ-AT ?auto_1934 ?auto_1938 ) ( IN-CITY ?auto_1935 ?auto_1937 ) ( not ( = ?auto_1931 ?auto_1935 ) ) ( OBJ-AT ?auto_1933 ?auto_1935 ) ( TRUCK-AT ?auto_1936 ?auto_1931 ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1938 ?auto_1935 ) ) ( not ( = ?auto_1933 ?auto_1932 ) ) ( not ( = ?auto_1934 ?auto_1932 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1933 ?auto_1932 ?auto_1934 ?auto_1931 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1949 - OBJ
      ?auto_1950 - OBJ
      ?auto_1951 - OBJ
      ?auto_1948 - LOCATION
    )
    :vars
    (
      ?auto_1955 - LOCATION
      ?auto_1954 - CITY
      ?auto_1952 - LOCATION
      ?auto_1953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1955 ?auto_1954 ) ( IN-CITY ?auto_1948 ?auto_1954 ) ( not ( = ?auto_1948 ?auto_1955 ) ) ( OBJ-AT ?auto_1949 ?auto_1955 ) ( OBJ-AT ?auto_1950 ?auto_1955 ) ( IN-CITY ?auto_1952 ?auto_1954 ) ( not ( = ?auto_1948 ?auto_1952 ) ) ( OBJ-AT ?auto_1951 ?auto_1952 ) ( TRUCK-AT ?auto_1953 ?auto_1948 ) ( not ( = ?auto_1951 ?auto_1950 ) ) ( not ( = ?auto_1955 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1949 ) ) ( not ( = ?auto_1950 ?auto_1949 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1951 ?auto_1949 ?auto_1950 ?auto_1948 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2005 - OBJ
      ?auto_2004 - LOCATION
    )
    :vars
    (
      ?auto_2007 - LOCATION
      ?auto_2008 - CITY
      ?auto_2006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2007 ?auto_2008 ) ( IN-CITY ?auto_2004 ?auto_2008 ) ( not ( = ?auto_2004 ?auto_2007 ) ) ( OBJ-AT ?auto_2005 ?auto_2007 ) ( TRUCK-AT ?auto_2006 ?auto_2004 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2006 ?auto_2004 ?auto_2007 ?auto_2008 )
      ( !LOAD-TRUCK ?auto_2005 ?auto_2006 ?auto_2007 )
      ( !DRIVE-TRUCK ?auto_2006 ?auto_2007 ?auto_2004 ?auto_2008 )
      ( !UNLOAD-TRUCK ?auto_2005 ?auto_2006 ?auto_2004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2987 - OBJ
      ?auto_2988 - OBJ
      ?auto_2989 - OBJ
      ?auto_2990 - OBJ
      ?auto_2986 - LOCATION
    )
    :vars
    (
      ?auto_2992 - LOCATION
      ?auto_2993 - CITY
      ?auto_2995 - LOCATION
      ?auto_2994 - LOCATION
      ?auto_2991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2992 ?auto_2993 ) ( IN-CITY ?auto_2986 ?auto_2993 ) ( not ( = ?auto_2986 ?auto_2992 ) ) ( OBJ-AT ?auto_2990 ?auto_2992 ) ( IN-CITY ?auto_2995 ?auto_2993 ) ( not ( = ?auto_2986 ?auto_2995 ) ) ( OBJ-AT ?auto_2989 ?auto_2995 ) ( OBJ-AT ?auto_2988 ?auto_2995 ) ( IN-CITY ?auto_2994 ?auto_2993 ) ( not ( = ?auto_2986 ?auto_2994 ) ) ( OBJ-AT ?auto_2987 ?auto_2994 ) ( TRUCK-AT ?auto_2991 ?auto_2986 ) ( not ( = ?auto_2987 ?auto_2988 ) ) ( not ( = ?auto_2995 ?auto_2994 ) ) ( not ( = ?auto_2987 ?auto_2989 ) ) ( not ( = ?auto_2988 ?auto_2989 ) ) ( not ( = ?auto_2987 ?auto_2990 ) ) ( not ( = ?auto_2988 ?auto_2990 ) ) ( not ( = ?auto_2989 ?auto_2990 ) ) ( not ( = ?auto_2992 ?auto_2995 ) ) ( not ( = ?auto_2992 ?auto_2994 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2987 ?auto_2989 ?auto_2988 ?auto_2986 )
      ( DELIVER-1PKG ?auto_2990 ?auto_2986 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3019 - OBJ
      ?auto_3020 - OBJ
      ?auto_3021 - OBJ
      ?auto_3022 - OBJ
      ?auto_3018 - LOCATION
    )
    :vars
    (
      ?auto_3024 - LOCATION
      ?auto_3025 - CITY
      ?auto_3023 - LOCATION
      ?auto_3026 - LOCATION
      ?auto_3027 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3024 ?auto_3025 ) ( IN-CITY ?auto_3018 ?auto_3025 ) ( not ( = ?auto_3018 ?auto_3024 ) ) ( OBJ-AT ?auto_3021 ?auto_3024 ) ( IN-CITY ?auto_3023 ?auto_3025 ) ( not ( = ?auto_3018 ?auto_3023 ) ) ( OBJ-AT ?auto_3022 ?auto_3023 ) ( OBJ-AT ?auto_3020 ?auto_3023 ) ( IN-CITY ?auto_3026 ?auto_3025 ) ( not ( = ?auto_3018 ?auto_3026 ) ) ( OBJ-AT ?auto_3019 ?auto_3026 ) ( TRUCK-AT ?auto_3027 ?auto_3018 ) ( not ( = ?auto_3019 ?auto_3020 ) ) ( not ( = ?auto_3023 ?auto_3026 ) ) ( not ( = ?auto_3019 ?auto_3022 ) ) ( not ( = ?auto_3020 ?auto_3022 ) ) ( not ( = ?auto_3019 ?auto_3021 ) ) ( not ( = ?auto_3020 ?auto_3021 ) ) ( not ( = ?auto_3022 ?auto_3021 ) ) ( not ( = ?auto_3024 ?auto_3023 ) ) ( not ( = ?auto_3024 ?auto_3026 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3019 ?auto_3020 ?auto_3022 ?auto_3021 ?auto_3018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3051 - OBJ
      ?auto_3052 - OBJ
      ?auto_3053 - OBJ
      ?auto_3054 - OBJ
      ?auto_3050 - LOCATION
    )
    :vars
    (
      ?auto_3058 - LOCATION
      ?auto_3059 - CITY
      ?auto_3056 - LOCATION
      ?auto_3057 - LOCATION
      ?auto_3055 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3058 ?auto_3059 ) ( IN-CITY ?auto_3050 ?auto_3059 ) ( not ( = ?auto_3050 ?auto_3058 ) ) ( OBJ-AT ?auto_3054 ?auto_3058 ) ( IN-CITY ?auto_3056 ?auto_3059 ) ( not ( = ?auto_3050 ?auto_3056 ) ) ( OBJ-AT ?auto_3052 ?auto_3056 ) ( OBJ-AT ?auto_3053 ?auto_3056 ) ( IN-CITY ?auto_3057 ?auto_3059 ) ( not ( = ?auto_3050 ?auto_3057 ) ) ( OBJ-AT ?auto_3051 ?auto_3057 ) ( TRUCK-AT ?auto_3055 ?auto_3050 ) ( not ( = ?auto_3051 ?auto_3053 ) ) ( not ( = ?auto_3056 ?auto_3057 ) ) ( not ( = ?auto_3051 ?auto_3052 ) ) ( not ( = ?auto_3053 ?auto_3052 ) ) ( not ( = ?auto_3051 ?auto_3054 ) ) ( not ( = ?auto_3053 ?auto_3054 ) ) ( not ( = ?auto_3052 ?auto_3054 ) ) ( not ( = ?auto_3058 ?auto_3056 ) ) ( not ( = ?auto_3058 ?auto_3057 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3051 ?auto_3053 ?auto_3054 ?auto_3052 ?auto_3050 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3083 - OBJ
      ?auto_3084 - OBJ
      ?auto_3085 - OBJ
      ?auto_3086 - OBJ
      ?auto_3082 - LOCATION
    )
    :vars
    (
      ?auto_3090 - LOCATION
      ?auto_3091 - CITY
      ?auto_3088 - LOCATION
      ?auto_3089 - LOCATION
      ?auto_3087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3090 ?auto_3091 ) ( IN-CITY ?auto_3082 ?auto_3091 ) ( not ( = ?auto_3082 ?auto_3090 ) ) ( OBJ-AT ?auto_3085 ?auto_3090 ) ( IN-CITY ?auto_3088 ?auto_3091 ) ( not ( = ?auto_3082 ?auto_3088 ) ) ( OBJ-AT ?auto_3084 ?auto_3088 ) ( OBJ-AT ?auto_3086 ?auto_3088 ) ( IN-CITY ?auto_3089 ?auto_3091 ) ( not ( = ?auto_3082 ?auto_3089 ) ) ( OBJ-AT ?auto_3083 ?auto_3089 ) ( TRUCK-AT ?auto_3087 ?auto_3082 ) ( not ( = ?auto_3083 ?auto_3086 ) ) ( not ( = ?auto_3088 ?auto_3089 ) ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( not ( = ?auto_3086 ?auto_3084 ) ) ( not ( = ?auto_3083 ?auto_3085 ) ) ( not ( = ?auto_3086 ?auto_3085 ) ) ( not ( = ?auto_3084 ?auto_3085 ) ) ( not ( = ?auto_3090 ?auto_3088 ) ) ( not ( = ?auto_3090 ?auto_3089 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3083 ?auto_3086 ?auto_3085 ?auto_3084 ?auto_3082 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3183 - OBJ
      ?auto_3184 - OBJ
      ?auto_3185 - OBJ
      ?auto_3186 - OBJ
      ?auto_3182 - LOCATION
    )
    :vars
    (
      ?auto_3190 - LOCATION
      ?auto_3191 - CITY
      ?auto_3188 - LOCATION
      ?auto_3189 - LOCATION
      ?auto_3187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3190 ?auto_3191 ) ( IN-CITY ?auto_3182 ?auto_3191 ) ( not ( = ?auto_3182 ?auto_3190 ) ) ( OBJ-AT ?auto_3184 ?auto_3190 ) ( IN-CITY ?auto_3188 ?auto_3191 ) ( not ( = ?auto_3182 ?auto_3188 ) ) ( OBJ-AT ?auto_3186 ?auto_3188 ) ( OBJ-AT ?auto_3185 ?auto_3188 ) ( IN-CITY ?auto_3189 ?auto_3191 ) ( not ( = ?auto_3182 ?auto_3189 ) ) ( OBJ-AT ?auto_3183 ?auto_3189 ) ( TRUCK-AT ?auto_3187 ?auto_3182 ) ( not ( = ?auto_3183 ?auto_3185 ) ) ( not ( = ?auto_3188 ?auto_3189 ) ) ( not ( = ?auto_3183 ?auto_3186 ) ) ( not ( = ?auto_3185 ?auto_3186 ) ) ( not ( = ?auto_3183 ?auto_3184 ) ) ( not ( = ?auto_3185 ?auto_3184 ) ) ( not ( = ?auto_3186 ?auto_3184 ) ) ( not ( = ?auto_3190 ?auto_3188 ) ) ( not ( = ?auto_3190 ?auto_3189 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3183 ?auto_3185 ?auto_3184 ?auto_3186 ?auto_3182 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3215 - OBJ
      ?auto_3216 - OBJ
      ?auto_3217 - OBJ
      ?auto_3218 - OBJ
      ?auto_3214 - LOCATION
    )
    :vars
    (
      ?auto_3222 - LOCATION
      ?auto_3223 - CITY
      ?auto_3220 - LOCATION
      ?auto_3221 - LOCATION
      ?auto_3219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3222 ?auto_3223 ) ( IN-CITY ?auto_3214 ?auto_3223 ) ( not ( = ?auto_3214 ?auto_3222 ) ) ( OBJ-AT ?auto_3216 ?auto_3222 ) ( IN-CITY ?auto_3220 ?auto_3223 ) ( not ( = ?auto_3214 ?auto_3220 ) ) ( OBJ-AT ?auto_3217 ?auto_3220 ) ( OBJ-AT ?auto_3218 ?auto_3220 ) ( IN-CITY ?auto_3221 ?auto_3223 ) ( not ( = ?auto_3214 ?auto_3221 ) ) ( OBJ-AT ?auto_3215 ?auto_3221 ) ( TRUCK-AT ?auto_3219 ?auto_3214 ) ( not ( = ?auto_3215 ?auto_3218 ) ) ( not ( = ?auto_3220 ?auto_3221 ) ) ( not ( = ?auto_3215 ?auto_3217 ) ) ( not ( = ?auto_3218 ?auto_3217 ) ) ( not ( = ?auto_3215 ?auto_3216 ) ) ( not ( = ?auto_3218 ?auto_3216 ) ) ( not ( = ?auto_3217 ?auto_3216 ) ) ( not ( = ?auto_3222 ?auto_3220 ) ) ( not ( = ?auto_3222 ?auto_3221 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3215 ?auto_3218 ?auto_3216 ?auto_3217 ?auto_3214 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3315 - OBJ
      ?auto_3316 - OBJ
      ?auto_3317 - OBJ
      ?auto_3318 - OBJ
      ?auto_3314 - LOCATION
    )
    :vars
    (
      ?auto_3322 - LOCATION
      ?auto_3323 - CITY
      ?auto_3320 - LOCATION
      ?auto_3321 - LOCATION
      ?auto_3319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3322 ?auto_3323 ) ( IN-CITY ?auto_3314 ?auto_3323 ) ( not ( = ?auto_3314 ?auto_3322 ) ) ( OBJ-AT ?auto_3318 ?auto_3322 ) ( IN-CITY ?auto_3320 ?auto_3323 ) ( not ( = ?auto_3314 ?auto_3320 ) ) ( OBJ-AT ?auto_3317 ?auto_3320 ) ( OBJ-AT ?auto_3315 ?auto_3320 ) ( IN-CITY ?auto_3321 ?auto_3323 ) ( not ( = ?auto_3314 ?auto_3321 ) ) ( OBJ-AT ?auto_3316 ?auto_3321 ) ( TRUCK-AT ?auto_3319 ?auto_3314 ) ( not ( = ?auto_3316 ?auto_3315 ) ) ( not ( = ?auto_3320 ?auto_3321 ) ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3315 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3318 ) ) ( not ( = ?auto_3315 ?auto_3318 ) ) ( not ( = ?auto_3317 ?auto_3318 ) ) ( not ( = ?auto_3322 ?auto_3320 ) ) ( not ( = ?auto_3322 ?auto_3321 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3316 ?auto_3315 ?auto_3318 ?auto_3317 ?auto_3314 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3347 - OBJ
      ?auto_3348 - OBJ
      ?auto_3349 - OBJ
      ?auto_3350 - OBJ
      ?auto_3346 - LOCATION
    )
    :vars
    (
      ?auto_3354 - LOCATION
      ?auto_3355 - CITY
      ?auto_3352 - LOCATION
      ?auto_3353 - LOCATION
      ?auto_3351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3354 ?auto_3355 ) ( IN-CITY ?auto_3346 ?auto_3355 ) ( not ( = ?auto_3346 ?auto_3354 ) ) ( OBJ-AT ?auto_3349 ?auto_3354 ) ( IN-CITY ?auto_3352 ?auto_3355 ) ( not ( = ?auto_3346 ?auto_3352 ) ) ( OBJ-AT ?auto_3350 ?auto_3352 ) ( OBJ-AT ?auto_3347 ?auto_3352 ) ( IN-CITY ?auto_3353 ?auto_3355 ) ( not ( = ?auto_3346 ?auto_3353 ) ) ( OBJ-AT ?auto_3348 ?auto_3353 ) ( TRUCK-AT ?auto_3351 ?auto_3346 ) ( not ( = ?auto_3348 ?auto_3347 ) ) ( not ( = ?auto_3352 ?auto_3353 ) ) ( not ( = ?auto_3348 ?auto_3350 ) ) ( not ( = ?auto_3347 ?auto_3350 ) ) ( not ( = ?auto_3348 ?auto_3349 ) ) ( not ( = ?auto_3347 ?auto_3349 ) ) ( not ( = ?auto_3350 ?auto_3349 ) ) ( not ( = ?auto_3354 ?auto_3352 ) ) ( not ( = ?auto_3354 ?auto_3353 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3348 ?auto_3347 ?auto_3349 ?auto_3350 ?auto_3346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3448 - OBJ
      ?auto_3449 - OBJ
      ?auto_3450 - OBJ
      ?auto_3451 - OBJ
      ?auto_3447 - LOCATION
    )
    :vars
    (
      ?auto_3455 - LOCATION
      ?auto_3456 - CITY
      ?auto_3453 - LOCATION
      ?auto_3454 - LOCATION
      ?auto_3452 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3455 ?auto_3456 ) ( IN-CITY ?auto_3447 ?auto_3456 ) ( not ( = ?auto_3447 ?auto_3455 ) ) ( OBJ-AT ?auto_3451 ?auto_3455 ) ( IN-CITY ?auto_3453 ?auto_3456 ) ( not ( = ?auto_3447 ?auto_3453 ) ) ( OBJ-AT ?auto_3449 ?auto_3453 ) ( OBJ-AT ?auto_3448 ?auto_3453 ) ( IN-CITY ?auto_3454 ?auto_3456 ) ( not ( = ?auto_3447 ?auto_3454 ) ) ( OBJ-AT ?auto_3450 ?auto_3454 ) ( TRUCK-AT ?auto_3452 ?auto_3447 ) ( not ( = ?auto_3450 ?auto_3448 ) ) ( not ( = ?auto_3453 ?auto_3454 ) ) ( not ( = ?auto_3450 ?auto_3449 ) ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( not ( = ?auto_3448 ?auto_3451 ) ) ( not ( = ?auto_3449 ?auto_3451 ) ) ( not ( = ?auto_3455 ?auto_3453 ) ) ( not ( = ?auto_3455 ?auto_3454 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3450 ?auto_3448 ?auto_3451 ?auto_3449 ?auto_3447 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3480 - OBJ
      ?auto_3481 - OBJ
      ?auto_3482 - OBJ
      ?auto_3483 - OBJ
      ?auto_3479 - LOCATION
    )
    :vars
    (
      ?auto_3487 - LOCATION
      ?auto_3488 - CITY
      ?auto_3485 - LOCATION
      ?auto_3486 - LOCATION
      ?auto_3484 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3487 ?auto_3488 ) ( IN-CITY ?auto_3479 ?auto_3488 ) ( not ( = ?auto_3479 ?auto_3487 ) ) ( OBJ-AT ?auto_3482 ?auto_3487 ) ( IN-CITY ?auto_3485 ?auto_3488 ) ( not ( = ?auto_3479 ?auto_3485 ) ) ( OBJ-AT ?auto_3481 ?auto_3485 ) ( OBJ-AT ?auto_3480 ?auto_3485 ) ( IN-CITY ?auto_3486 ?auto_3488 ) ( not ( = ?auto_3479 ?auto_3486 ) ) ( OBJ-AT ?auto_3483 ?auto_3486 ) ( TRUCK-AT ?auto_3484 ?auto_3479 ) ( not ( = ?auto_3483 ?auto_3480 ) ) ( not ( = ?auto_3485 ?auto_3486 ) ) ( not ( = ?auto_3483 ?auto_3481 ) ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( not ( = ?auto_3483 ?auto_3482 ) ) ( not ( = ?auto_3480 ?auto_3482 ) ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3487 ?auto_3485 ) ) ( not ( = ?auto_3487 ?auto_3486 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3483 ?auto_3480 ?auto_3482 ?auto_3481 ?auto_3479 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3545 - OBJ
      ?auto_3546 - OBJ
      ?auto_3547 - OBJ
      ?auto_3548 - OBJ
      ?auto_3544 - LOCATION
    )
    :vars
    (
      ?auto_3552 - LOCATION
      ?auto_3553 - CITY
      ?auto_3550 - LOCATION
      ?auto_3551 - LOCATION
      ?auto_3549 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3552 ?auto_3553 ) ( IN-CITY ?auto_3544 ?auto_3553 ) ( not ( = ?auto_3544 ?auto_3552 ) ) ( OBJ-AT ?auto_3546 ?auto_3552 ) ( IN-CITY ?auto_3550 ?auto_3553 ) ( not ( = ?auto_3544 ?auto_3550 ) ) ( OBJ-AT ?auto_3548 ?auto_3550 ) ( OBJ-AT ?auto_3545 ?auto_3550 ) ( IN-CITY ?auto_3551 ?auto_3553 ) ( not ( = ?auto_3544 ?auto_3551 ) ) ( OBJ-AT ?auto_3547 ?auto_3551 ) ( TRUCK-AT ?auto_3549 ?auto_3544 ) ( not ( = ?auto_3547 ?auto_3545 ) ) ( not ( = ?auto_3550 ?auto_3551 ) ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( not ( = ?auto_3545 ?auto_3548 ) ) ( not ( = ?auto_3547 ?auto_3546 ) ) ( not ( = ?auto_3545 ?auto_3546 ) ) ( not ( = ?auto_3548 ?auto_3546 ) ) ( not ( = ?auto_3552 ?auto_3550 ) ) ( not ( = ?auto_3552 ?auto_3551 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3547 ?auto_3545 ?auto_3546 ?auto_3548 ?auto_3544 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3612 - OBJ
      ?auto_3613 - OBJ
      ?auto_3614 - OBJ
      ?auto_3615 - OBJ
      ?auto_3611 - LOCATION
    )
    :vars
    (
      ?auto_3619 - LOCATION
      ?auto_3620 - CITY
      ?auto_3617 - LOCATION
      ?auto_3618 - LOCATION
      ?auto_3616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3619 ?auto_3620 ) ( IN-CITY ?auto_3611 ?auto_3620 ) ( not ( = ?auto_3611 ?auto_3619 ) ) ( OBJ-AT ?auto_3613 ?auto_3619 ) ( IN-CITY ?auto_3617 ?auto_3620 ) ( not ( = ?auto_3611 ?auto_3617 ) ) ( OBJ-AT ?auto_3614 ?auto_3617 ) ( OBJ-AT ?auto_3612 ?auto_3617 ) ( IN-CITY ?auto_3618 ?auto_3620 ) ( not ( = ?auto_3611 ?auto_3618 ) ) ( OBJ-AT ?auto_3615 ?auto_3618 ) ( TRUCK-AT ?auto_3616 ?auto_3611 ) ( not ( = ?auto_3615 ?auto_3612 ) ) ( not ( = ?auto_3617 ?auto_3618 ) ) ( not ( = ?auto_3615 ?auto_3614 ) ) ( not ( = ?auto_3612 ?auto_3614 ) ) ( not ( = ?auto_3615 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3614 ?auto_3613 ) ) ( not ( = ?auto_3619 ?auto_3617 ) ) ( not ( = ?auto_3619 ?auto_3618 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3615 ?auto_3612 ?auto_3613 ?auto_3614 ?auto_3611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3712 - OBJ
      ?auto_3713 - OBJ
      ?auto_3714 - OBJ
      ?auto_3715 - OBJ
      ?auto_3711 - LOCATION
    )
    :vars
    (
      ?auto_3719 - LOCATION
      ?auto_3720 - CITY
      ?auto_3717 - LOCATION
      ?auto_3718 - LOCATION
      ?auto_3716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3719 ?auto_3720 ) ( IN-CITY ?auto_3711 ?auto_3720 ) ( not ( = ?auto_3711 ?auto_3719 ) ) ( OBJ-AT ?auto_3715 ?auto_3719 ) ( IN-CITY ?auto_3717 ?auto_3720 ) ( not ( = ?auto_3711 ?auto_3717 ) ) ( OBJ-AT ?auto_3712 ?auto_3717 ) ( OBJ-AT ?auto_3714 ?auto_3717 ) ( IN-CITY ?auto_3718 ?auto_3720 ) ( not ( = ?auto_3711 ?auto_3718 ) ) ( OBJ-AT ?auto_3713 ?auto_3718 ) ( TRUCK-AT ?auto_3716 ?auto_3711 ) ( not ( = ?auto_3713 ?auto_3714 ) ) ( not ( = ?auto_3717 ?auto_3718 ) ) ( not ( = ?auto_3713 ?auto_3712 ) ) ( not ( = ?auto_3714 ?auto_3712 ) ) ( not ( = ?auto_3713 ?auto_3715 ) ) ( not ( = ?auto_3714 ?auto_3715 ) ) ( not ( = ?auto_3712 ?auto_3715 ) ) ( not ( = ?auto_3719 ?auto_3717 ) ) ( not ( = ?auto_3719 ?auto_3718 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3713 ?auto_3714 ?auto_3715 ?auto_3712 ?auto_3711 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3744 - OBJ
      ?auto_3745 - OBJ
      ?auto_3746 - OBJ
      ?auto_3747 - OBJ
      ?auto_3743 - LOCATION
    )
    :vars
    (
      ?auto_3751 - LOCATION
      ?auto_3752 - CITY
      ?auto_3749 - LOCATION
      ?auto_3750 - LOCATION
      ?auto_3748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3751 ?auto_3752 ) ( IN-CITY ?auto_3743 ?auto_3752 ) ( not ( = ?auto_3743 ?auto_3751 ) ) ( OBJ-AT ?auto_3746 ?auto_3751 ) ( IN-CITY ?auto_3749 ?auto_3752 ) ( not ( = ?auto_3743 ?auto_3749 ) ) ( OBJ-AT ?auto_3744 ?auto_3749 ) ( OBJ-AT ?auto_3747 ?auto_3749 ) ( IN-CITY ?auto_3750 ?auto_3752 ) ( not ( = ?auto_3743 ?auto_3750 ) ) ( OBJ-AT ?auto_3745 ?auto_3750 ) ( TRUCK-AT ?auto_3748 ?auto_3743 ) ( not ( = ?auto_3745 ?auto_3747 ) ) ( not ( = ?auto_3749 ?auto_3750 ) ) ( not ( = ?auto_3745 ?auto_3744 ) ) ( not ( = ?auto_3747 ?auto_3744 ) ) ( not ( = ?auto_3745 ?auto_3746 ) ) ( not ( = ?auto_3747 ?auto_3746 ) ) ( not ( = ?auto_3744 ?auto_3746 ) ) ( not ( = ?auto_3751 ?auto_3749 ) ) ( not ( = ?auto_3751 ?auto_3750 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3745 ?auto_3747 ?auto_3746 ?auto_3744 ?auto_3743 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3776 - OBJ
      ?auto_3777 - OBJ
      ?auto_3778 - OBJ
      ?auto_3779 - OBJ
      ?auto_3775 - LOCATION
    )
    :vars
    (
      ?auto_3783 - LOCATION
      ?auto_3784 - CITY
      ?auto_3781 - LOCATION
      ?auto_3782 - LOCATION
      ?auto_3780 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3783 ?auto_3784 ) ( IN-CITY ?auto_3775 ?auto_3784 ) ( not ( = ?auto_3775 ?auto_3783 ) ) ( OBJ-AT ?auto_3779 ?auto_3783 ) ( IN-CITY ?auto_3781 ?auto_3784 ) ( not ( = ?auto_3775 ?auto_3781 ) ) ( OBJ-AT ?auto_3776 ?auto_3781 ) ( OBJ-AT ?auto_3777 ?auto_3781 ) ( IN-CITY ?auto_3782 ?auto_3784 ) ( not ( = ?auto_3775 ?auto_3782 ) ) ( OBJ-AT ?auto_3778 ?auto_3782 ) ( TRUCK-AT ?auto_3780 ?auto_3775 ) ( not ( = ?auto_3778 ?auto_3777 ) ) ( not ( = ?auto_3781 ?auto_3782 ) ) ( not ( = ?auto_3778 ?auto_3776 ) ) ( not ( = ?auto_3777 ?auto_3776 ) ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( not ( = ?auto_3777 ?auto_3779 ) ) ( not ( = ?auto_3776 ?auto_3779 ) ) ( not ( = ?auto_3783 ?auto_3781 ) ) ( not ( = ?auto_3783 ?auto_3782 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3778 ?auto_3777 ?auto_3779 ?auto_3776 ?auto_3775 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3808 - OBJ
      ?auto_3809 - OBJ
      ?auto_3810 - OBJ
      ?auto_3811 - OBJ
      ?auto_3807 - LOCATION
    )
    :vars
    (
      ?auto_3815 - LOCATION
      ?auto_3816 - CITY
      ?auto_3813 - LOCATION
      ?auto_3814 - LOCATION
      ?auto_3812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3815 ?auto_3816 ) ( IN-CITY ?auto_3807 ?auto_3816 ) ( not ( = ?auto_3807 ?auto_3815 ) ) ( OBJ-AT ?auto_3810 ?auto_3815 ) ( IN-CITY ?auto_3813 ?auto_3816 ) ( not ( = ?auto_3807 ?auto_3813 ) ) ( OBJ-AT ?auto_3808 ?auto_3813 ) ( OBJ-AT ?auto_3809 ?auto_3813 ) ( IN-CITY ?auto_3814 ?auto_3816 ) ( not ( = ?auto_3807 ?auto_3814 ) ) ( OBJ-AT ?auto_3811 ?auto_3814 ) ( TRUCK-AT ?auto_3812 ?auto_3807 ) ( not ( = ?auto_3811 ?auto_3809 ) ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( not ( = ?auto_3811 ?auto_3808 ) ) ( not ( = ?auto_3809 ?auto_3808 ) ) ( not ( = ?auto_3811 ?auto_3810 ) ) ( not ( = ?auto_3809 ?auto_3810 ) ) ( not ( = ?auto_3808 ?auto_3810 ) ) ( not ( = ?auto_3815 ?auto_3813 ) ) ( not ( = ?auto_3815 ?auto_3814 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3811 ?auto_3809 ?auto_3810 ?auto_3808 ?auto_3807 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3942 - OBJ
      ?auto_3943 - OBJ
      ?auto_3944 - OBJ
      ?auto_3945 - OBJ
      ?auto_3941 - LOCATION
    )
    :vars
    (
      ?auto_3949 - LOCATION
      ?auto_3950 - CITY
      ?auto_3947 - LOCATION
      ?auto_3948 - LOCATION
      ?auto_3946 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3949 ?auto_3950 ) ( IN-CITY ?auto_3941 ?auto_3950 ) ( not ( = ?auto_3941 ?auto_3949 ) ) ( OBJ-AT ?auto_3943 ?auto_3949 ) ( IN-CITY ?auto_3947 ?auto_3950 ) ( not ( = ?auto_3941 ?auto_3947 ) ) ( OBJ-AT ?auto_3942 ?auto_3947 ) ( OBJ-AT ?auto_3945 ?auto_3947 ) ( IN-CITY ?auto_3948 ?auto_3950 ) ( not ( = ?auto_3941 ?auto_3948 ) ) ( OBJ-AT ?auto_3944 ?auto_3948 ) ( TRUCK-AT ?auto_3946 ?auto_3941 ) ( not ( = ?auto_3944 ?auto_3945 ) ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( not ( = ?auto_3944 ?auto_3942 ) ) ( not ( = ?auto_3945 ?auto_3942 ) ) ( not ( = ?auto_3944 ?auto_3943 ) ) ( not ( = ?auto_3945 ?auto_3943 ) ) ( not ( = ?auto_3942 ?auto_3943 ) ) ( not ( = ?auto_3949 ?auto_3947 ) ) ( not ( = ?auto_3949 ?auto_3948 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3944 ?auto_3945 ?auto_3943 ?auto_3942 ?auto_3941 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3974 - OBJ
      ?auto_3975 - OBJ
      ?auto_3976 - OBJ
      ?auto_3977 - OBJ
      ?auto_3973 - LOCATION
    )
    :vars
    (
      ?auto_3981 - LOCATION
      ?auto_3982 - CITY
      ?auto_3979 - LOCATION
      ?auto_3980 - LOCATION
      ?auto_3978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3981 ?auto_3982 ) ( IN-CITY ?auto_3973 ?auto_3982 ) ( not ( = ?auto_3973 ?auto_3981 ) ) ( OBJ-AT ?auto_3975 ?auto_3981 ) ( IN-CITY ?auto_3979 ?auto_3982 ) ( not ( = ?auto_3973 ?auto_3979 ) ) ( OBJ-AT ?auto_3974 ?auto_3979 ) ( OBJ-AT ?auto_3976 ?auto_3979 ) ( IN-CITY ?auto_3980 ?auto_3982 ) ( not ( = ?auto_3973 ?auto_3980 ) ) ( OBJ-AT ?auto_3977 ?auto_3980 ) ( TRUCK-AT ?auto_3978 ?auto_3973 ) ( not ( = ?auto_3977 ?auto_3976 ) ) ( not ( = ?auto_3979 ?auto_3980 ) ) ( not ( = ?auto_3977 ?auto_3974 ) ) ( not ( = ?auto_3976 ?auto_3974 ) ) ( not ( = ?auto_3977 ?auto_3975 ) ) ( not ( = ?auto_3976 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( not ( = ?auto_3981 ?auto_3979 ) ) ( not ( = ?auto_3981 ?auto_3980 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3977 ?auto_3976 ?auto_3975 ?auto_3974 ?auto_3973 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4177 - OBJ
      ?auto_4178 - OBJ
      ?auto_4179 - OBJ
      ?auto_4180 - OBJ
      ?auto_4176 - LOCATION
    )
    :vars
    (
      ?auto_4184 - LOCATION
      ?auto_4185 - CITY
      ?auto_4182 - LOCATION
      ?auto_4183 - LOCATION
      ?auto_4181 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4184 ?auto_4185 ) ( IN-CITY ?auto_4176 ?auto_4185 ) ( not ( = ?auto_4176 ?auto_4184 ) ) ( OBJ-AT ?auto_4177 ?auto_4184 ) ( IN-CITY ?auto_4182 ?auto_4185 ) ( not ( = ?auto_4176 ?auto_4182 ) ) ( OBJ-AT ?auto_4180 ?auto_4182 ) ( OBJ-AT ?auto_4179 ?auto_4182 ) ( IN-CITY ?auto_4183 ?auto_4185 ) ( not ( = ?auto_4176 ?auto_4183 ) ) ( OBJ-AT ?auto_4178 ?auto_4183 ) ( TRUCK-AT ?auto_4181 ?auto_4176 ) ( not ( = ?auto_4178 ?auto_4179 ) ) ( not ( = ?auto_4182 ?auto_4183 ) ) ( not ( = ?auto_4178 ?auto_4180 ) ) ( not ( = ?auto_4179 ?auto_4180 ) ) ( not ( = ?auto_4178 ?auto_4177 ) ) ( not ( = ?auto_4179 ?auto_4177 ) ) ( not ( = ?auto_4180 ?auto_4177 ) ) ( not ( = ?auto_4184 ?auto_4182 ) ) ( not ( = ?auto_4184 ?auto_4183 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4178 ?auto_4179 ?auto_4177 ?auto_4180 ?auto_4176 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4209 - OBJ
      ?auto_4210 - OBJ
      ?auto_4211 - OBJ
      ?auto_4212 - OBJ
      ?auto_4208 - LOCATION
    )
    :vars
    (
      ?auto_4216 - LOCATION
      ?auto_4217 - CITY
      ?auto_4214 - LOCATION
      ?auto_4215 - LOCATION
      ?auto_4213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4216 ?auto_4217 ) ( IN-CITY ?auto_4208 ?auto_4217 ) ( not ( = ?auto_4208 ?auto_4216 ) ) ( OBJ-AT ?auto_4209 ?auto_4216 ) ( IN-CITY ?auto_4214 ?auto_4217 ) ( not ( = ?auto_4208 ?auto_4214 ) ) ( OBJ-AT ?auto_4211 ?auto_4214 ) ( OBJ-AT ?auto_4212 ?auto_4214 ) ( IN-CITY ?auto_4215 ?auto_4217 ) ( not ( = ?auto_4208 ?auto_4215 ) ) ( OBJ-AT ?auto_4210 ?auto_4215 ) ( TRUCK-AT ?auto_4213 ?auto_4208 ) ( not ( = ?auto_4210 ?auto_4212 ) ) ( not ( = ?auto_4214 ?auto_4215 ) ) ( not ( = ?auto_4210 ?auto_4211 ) ) ( not ( = ?auto_4212 ?auto_4211 ) ) ( not ( = ?auto_4210 ?auto_4209 ) ) ( not ( = ?auto_4212 ?auto_4209 ) ) ( not ( = ?auto_4211 ?auto_4209 ) ) ( not ( = ?auto_4216 ?auto_4214 ) ) ( not ( = ?auto_4216 ?auto_4215 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4210 ?auto_4212 ?auto_4209 ?auto_4211 ?auto_4208 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4309 - OBJ
      ?auto_4310 - OBJ
      ?auto_4311 - OBJ
      ?auto_4312 - OBJ
      ?auto_4308 - LOCATION
    )
    :vars
    (
      ?auto_4316 - LOCATION
      ?auto_4317 - CITY
      ?auto_4314 - LOCATION
      ?auto_4315 - LOCATION
      ?auto_4313 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4316 ?auto_4317 ) ( IN-CITY ?auto_4308 ?auto_4317 ) ( not ( = ?auto_4308 ?auto_4316 ) ) ( OBJ-AT ?auto_4309 ?auto_4316 ) ( IN-CITY ?auto_4314 ?auto_4317 ) ( not ( = ?auto_4308 ?auto_4314 ) ) ( OBJ-AT ?auto_4312 ?auto_4314 ) ( OBJ-AT ?auto_4310 ?auto_4314 ) ( IN-CITY ?auto_4315 ?auto_4317 ) ( not ( = ?auto_4308 ?auto_4315 ) ) ( OBJ-AT ?auto_4311 ?auto_4315 ) ( TRUCK-AT ?auto_4313 ?auto_4308 ) ( not ( = ?auto_4311 ?auto_4310 ) ) ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4309 ) ) ( not ( = ?auto_4310 ?auto_4309 ) ) ( not ( = ?auto_4312 ?auto_4309 ) ) ( not ( = ?auto_4316 ?auto_4314 ) ) ( not ( = ?auto_4316 ?auto_4315 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4311 ?auto_4310 ?auto_4309 ?auto_4312 ?auto_4308 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4376 - OBJ
      ?auto_4377 - OBJ
      ?auto_4378 - OBJ
      ?auto_4379 - OBJ
      ?auto_4375 - LOCATION
    )
    :vars
    (
      ?auto_4383 - LOCATION
      ?auto_4384 - CITY
      ?auto_4381 - LOCATION
      ?auto_4382 - LOCATION
      ?auto_4380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4383 ?auto_4384 ) ( IN-CITY ?auto_4375 ?auto_4384 ) ( not ( = ?auto_4375 ?auto_4383 ) ) ( OBJ-AT ?auto_4376 ?auto_4383 ) ( IN-CITY ?auto_4381 ?auto_4384 ) ( not ( = ?auto_4375 ?auto_4381 ) ) ( OBJ-AT ?auto_4378 ?auto_4381 ) ( OBJ-AT ?auto_4377 ?auto_4381 ) ( IN-CITY ?auto_4382 ?auto_4384 ) ( not ( = ?auto_4375 ?auto_4382 ) ) ( OBJ-AT ?auto_4379 ?auto_4382 ) ( TRUCK-AT ?auto_4380 ?auto_4375 ) ( not ( = ?auto_4379 ?auto_4377 ) ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( not ( = ?auto_4379 ?auto_4378 ) ) ( not ( = ?auto_4377 ?auto_4378 ) ) ( not ( = ?auto_4379 ?auto_4376 ) ) ( not ( = ?auto_4377 ?auto_4376 ) ) ( not ( = ?auto_4378 ?auto_4376 ) ) ( not ( = ?auto_4383 ?auto_4381 ) ) ( not ( = ?auto_4383 ?auto_4382 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4379 ?auto_4377 ?auto_4376 ?auto_4378 ?auto_4375 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4476 - OBJ
      ?auto_4477 - OBJ
      ?auto_4478 - OBJ
      ?auto_4479 - OBJ
      ?auto_4475 - LOCATION
    )
    :vars
    (
      ?auto_4483 - LOCATION
      ?auto_4484 - CITY
      ?auto_4481 - LOCATION
      ?auto_4482 - LOCATION
      ?auto_4480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4483 ?auto_4484 ) ( IN-CITY ?auto_4475 ?auto_4484 ) ( not ( = ?auto_4475 ?auto_4483 ) ) ( OBJ-AT ?auto_4476 ?auto_4483 ) ( IN-CITY ?auto_4481 ?auto_4484 ) ( not ( = ?auto_4475 ?auto_4481 ) ) ( OBJ-AT ?auto_4477 ?auto_4481 ) ( OBJ-AT ?auto_4479 ?auto_4481 ) ( IN-CITY ?auto_4482 ?auto_4484 ) ( not ( = ?auto_4475 ?auto_4482 ) ) ( OBJ-AT ?auto_4478 ?auto_4482 ) ( TRUCK-AT ?auto_4480 ?auto_4475 ) ( not ( = ?auto_4478 ?auto_4479 ) ) ( not ( = ?auto_4481 ?auto_4482 ) ) ( not ( = ?auto_4478 ?auto_4477 ) ) ( not ( = ?auto_4479 ?auto_4477 ) ) ( not ( = ?auto_4478 ?auto_4476 ) ) ( not ( = ?auto_4479 ?auto_4476 ) ) ( not ( = ?auto_4477 ?auto_4476 ) ) ( not ( = ?auto_4483 ?auto_4481 ) ) ( not ( = ?auto_4483 ?auto_4482 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4478 ?auto_4479 ?auto_4476 ?auto_4477 ?auto_4475 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4508 - OBJ
      ?auto_4509 - OBJ
      ?auto_4510 - OBJ
      ?auto_4511 - OBJ
      ?auto_4507 - LOCATION
    )
    :vars
    (
      ?auto_4515 - LOCATION
      ?auto_4516 - CITY
      ?auto_4513 - LOCATION
      ?auto_4514 - LOCATION
      ?auto_4512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4515 ?auto_4516 ) ( IN-CITY ?auto_4507 ?auto_4516 ) ( not ( = ?auto_4507 ?auto_4515 ) ) ( OBJ-AT ?auto_4508 ?auto_4515 ) ( IN-CITY ?auto_4513 ?auto_4516 ) ( not ( = ?auto_4507 ?auto_4513 ) ) ( OBJ-AT ?auto_4509 ?auto_4513 ) ( OBJ-AT ?auto_4510 ?auto_4513 ) ( IN-CITY ?auto_4514 ?auto_4516 ) ( not ( = ?auto_4507 ?auto_4514 ) ) ( OBJ-AT ?auto_4511 ?auto_4514 ) ( TRUCK-AT ?auto_4512 ?auto_4507 ) ( not ( = ?auto_4511 ?auto_4510 ) ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4511 ?auto_4509 ) ) ( not ( = ?auto_4510 ?auto_4509 ) ) ( not ( = ?auto_4511 ?auto_4508 ) ) ( not ( = ?auto_4510 ?auto_4508 ) ) ( not ( = ?auto_4509 ?auto_4508 ) ) ( not ( = ?auto_4515 ?auto_4513 ) ) ( not ( = ?auto_4515 ?auto_4514 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4511 ?auto_4510 ?auto_4508 ?auto_4509 ?auto_4507 ) )
  )

)

