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
      ?auto_1797 - SURFACE
      ?auto_1798 - SURFACE
    )
    :vars
    (
      ?auto_1799 - HOIST
      ?auto_1800 - PLACE
      ?auto_1802 - PLACE
      ?auto_1803 - HOIST
      ?auto_1804 - SURFACE
      ?auto_1801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1799 ?auto_1800 ) ( SURFACE-AT ?auto_1797 ?auto_1800 ) ( CLEAR ?auto_1797 ) ( IS-CRATE ?auto_1798 ) ( AVAILABLE ?auto_1799 ) ( not ( = ?auto_1802 ?auto_1800 ) ) ( HOIST-AT ?auto_1803 ?auto_1802 ) ( AVAILABLE ?auto_1803 ) ( SURFACE-AT ?auto_1798 ?auto_1802 ) ( ON ?auto_1798 ?auto_1804 ) ( CLEAR ?auto_1798 ) ( TRUCK-AT ?auto_1801 ?auto_1800 ) ( not ( = ?auto_1797 ?auto_1798 ) ) ( not ( = ?auto_1797 ?auto_1804 ) ) ( not ( = ?auto_1798 ?auto_1804 ) ) ( not ( = ?auto_1799 ?auto_1803 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1801 ?auto_1800 ?auto_1802 )
      ( !LIFT ?auto_1803 ?auto_1798 ?auto_1804 ?auto_1802 )
      ( !LOAD ?auto_1803 ?auto_1798 ?auto_1801 ?auto_1802 )
      ( !DRIVE ?auto_1801 ?auto_1802 ?auto_1800 )
      ( !UNLOAD ?auto_1799 ?auto_1798 ?auto_1801 ?auto_1800 )
      ( !DROP ?auto_1799 ?auto_1798 ?auto_1797 ?auto_1800 )
      ( MAKE-1CRATE-VERIFY ?auto_1797 ?auto_1798 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1818 - SURFACE
      ?auto_1819 - SURFACE
      ?auto_1820 - SURFACE
    )
    :vars
    (
      ?auto_1825 - HOIST
      ?auto_1824 - PLACE
      ?auto_1821 - PLACE
      ?auto_1826 - HOIST
      ?auto_1822 - SURFACE
      ?auto_1828 - PLACE
      ?auto_1829 - HOIST
      ?auto_1827 - SURFACE
      ?auto_1823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1825 ?auto_1824 ) ( IS-CRATE ?auto_1820 ) ( not ( = ?auto_1821 ?auto_1824 ) ) ( HOIST-AT ?auto_1826 ?auto_1821 ) ( AVAILABLE ?auto_1826 ) ( SURFACE-AT ?auto_1820 ?auto_1821 ) ( ON ?auto_1820 ?auto_1822 ) ( CLEAR ?auto_1820 ) ( not ( = ?auto_1819 ?auto_1820 ) ) ( not ( = ?auto_1819 ?auto_1822 ) ) ( not ( = ?auto_1820 ?auto_1822 ) ) ( not ( = ?auto_1825 ?auto_1826 ) ) ( SURFACE-AT ?auto_1818 ?auto_1824 ) ( CLEAR ?auto_1818 ) ( IS-CRATE ?auto_1819 ) ( AVAILABLE ?auto_1825 ) ( not ( = ?auto_1828 ?auto_1824 ) ) ( HOIST-AT ?auto_1829 ?auto_1828 ) ( AVAILABLE ?auto_1829 ) ( SURFACE-AT ?auto_1819 ?auto_1828 ) ( ON ?auto_1819 ?auto_1827 ) ( CLEAR ?auto_1819 ) ( TRUCK-AT ?auto_1823 ?auto_1824 ) ( not ( = ?auto_1818 ?auto_1819 ) ) ( not ( = ?auto_1818 ?auto_1827 ) ) ( not ( = ?auto_1819 ?auto_1827 ) ) ( not ( = ?auto_1825 ?auto_1829 ) ) ( not ( = ?auto_1818 ?auto_1820 ) ) ( not ( = ?auto_1818 ?auto_1822 ) ) ( not ( = ?auto_1820 ?auto_1827 ) ) ( not ( = ?auto_1821 ?auto_1828 ) ) ( not ( = ?auto_1826 ?auto_1829 ) ) ( not ( = ?auto_1822 ?auto_1827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1818 ?auto_1819 )
      ( MAKE-1CRATE ?auto_1819 ?auto_1820 )
      ( MAKE-2CRATE-VERIFY ?auto_1818 ?auto_1819 ?auto_1820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1844 - SURFACE
      ?auto_1845 - SURFACE
      ?auto_1846 - SURFACE
      ?auto_1847 - SURFACE
    )
    :vars
    (
      ?auto_1849 - HOIST
      ?auto_1848 - PLACE
      ?auto_1853 - PLACE
      ?auto_1850 - HOIST
      ?auto_1851 - SURFACE
      ?auto_1857 - PLACE
      ?auto_1858 - HOIST
      ?auto_1859 - SURFACE
      ?auto_1855 - PLACE
      ?auto_1854 - HOIST
      ?auto_1856 - SURFACE
      ?auto_1852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1849 ?auto_1848 ) ( IS-CRATE ?auto_1847 ) ( not ( = ?auto_1853 ?auto_1848 ) ) ( HOIST-AT ?auto_1850 ?auto_1853 ) ( AVAILABLE ?auto_1850 ) ( SURFACE-AT ?auto_1847 ?auto_1853 ) ( ON ?auto_1847 ?auto_1851 ) ( CLEAR ?auto_1847 ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( not ( = ?auto_1846 ?auto_1851 ) ) ( not ( = ?auto_1847 ?auto_1851 ) ) ( not ( = ?auto_1849 ?auto_1850 ) ) ( IS-CRATE ?auto_1846 ) ( not ( = ?auto_1857 ?auto_1848 ) ) ( HOIST-AT ?auto_1858 ?auto_1857 ) ( AVAILABLE ?auto_1858 ) ( SURFACE-AT ?auto_1846 ?auto_1857 ) ( ON ?auto_1846 ?auto_1859 ) ( CLEAR ?auto_1846 ) ( not ( = ?auto_1845 ?auto_1846 ) ) ( not ( = ?auto_1845 ?auto_1859 ) ) ( not ( = ?auto_1846 ?auto_1859 ) ) ( not ( = ?auto_1849 ?auto_1858 ) ) ( SURFACE-AT ?auto_1844 ?auto_1848 ) ( CLEAR ?auto_1844 ) ( IS-CRATE ?auto_1845 ) ( AVAILABLE ?auto_1849 ) ( not ( = ?auto_1855 ?auto_1848 ) ) ( HOIST-AT ?auto_1854 ?auto_1855 ) ( AVAILABLE ?auto_1854 ) ( SURFACE-AT ?auto_1845 ?auto_1855 ) ( ON ?auto_1845 ?auto_1856 ) ( CLEAR ?auto_1845 ) ( TRUCK-AT ?auto_1852 ?auto_1848 ) ( not ( = ?auto_1844 ?auto_1845 ) ) ( not ( = ?auto_1844 ?auto_1856 ) ) ( not ( = ?auto_1845 ?auto_1856 ) ) ( not ( = ?auto_1849 ?auto_1854 ) ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1859 ) ) ( not ( = ?auto_1846 ?auto_1856 ) ) ( not ( = ?auto_1857 ?auto_1855 ) ) ( not ( = ?auto_1858 ?auto_1854 ) ) ( not ( = ?auto_1859 ?auto_1856 ) ) ( not ( = ?auto_1844 ?auto_1847 ) ) ( not ( = ?auto_1844 ?auto_1851 ) ) ( not ( = ?auto_1845 ?auto_1847 ) ) ( not ( = ?auto_1845 ?auto_1851 ) ) ( not ( = ?auto_1847 ?auto_1859 ) ) ( not ( = ?auto_1847 ?auto_1856 ) ) ( not ( = ?auto_1853 ?auto_1857 ) ) ( not ( = ?auto_1853 ?auto_1855 ) ) ( not ( = ?auto_1850 ?auto_1858 ) ) ( not ( = ?auto_1850 ?auto_1854 ) ) ( not ( = ?auto_1851 ?auto_1859 ) ) ( not ( = ?auto_1851 ?auto_1856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1844 ?auto_1845 ?auto_1846 )
      ( MAKE-1CRATE ?auto_1846 ?auto_1847 )
      ( MAKE-3CRATE-VERIFY ?auto_1844 ?auto_1845 ?auto_1846 ?auto_1847 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1875 - SURFACE
      ?auto_1876 - SURFACE
      ?auto_1877 - SURFACE
      ?auto_1878 - SURFACE
      ?auto_1879 - SURFACE
    )
    :vars
    (
      ?auto_1885 - HOIST
      ?auto_1880 - PLACE
      ?auto_1881 - PLACE
      ?auto_1884 - HOIST
      ?auto_1883 - SURFACE
      ?auto_1889 - PLACE
      ?auto_1888 - HOIST
      ?auto_1893 - SURFACE
      ?auto_1892 - PLACE
      ?auto_1887 - HOIST
      ?auto_1894 - SURFACE
      ?auto_1890 - PLACE
      ?auto_1891 - HOIST
      ?auto_1886 - SURFACE
      ?auto_1882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1885 ?auto_1880 ) ( IS-CRATE ?auto_1879 ) ( not ( = ?auto_1881 ?auto_1880 ) ) ( HOIST-AT ?auto_1884 ?auto_1881 ) ( AVAILABLE ?auto_1884 ) ( SURFACE-AT ?auto_1879 ?auto_1881 ) ( ON ?auto_1879 ?auto_1883 ) ( CLEAR ?auto_1879 ) ( not ( = ?auto_1878 ?auto_1879 ) ) ( not ( = ?auto_1878 ?auto_1883 ) ) ( not ( = ?auto_1879 ?auto_1883 ) ) ( not ( = ?auto_1885 ?auto_1884 ) ) ( IS-CRATE ?auto_1878 ) ( not ( = ?auto_1889 ?auto_1880 ) ) ( HOIST-AT ?auto_1888 ?auto_1889 ) ( AVAILABLE ?auto_1888 ) ( SURFACE-AT ?auto_1878 ?auto_1889 ) ( ON ?auto_1878 ?auto_1893 ) ( CLEAR ?auto_1878 ) ( not ( = ?auto_1877 ?auto_1878 ) ) ( not ( = ?auto_1877 ?auto_1893 ) ) ( not ( = ?auto_1878 ?auto_1893 ) ) ( not ( = ?auto_1885 ?auto_1888 ) ) ( IS-CRATE ?auto_1877 ) ( not ( = ?auto_1892 ?auto_1880 ) ) ( HOIST-AT ?auto_1887 ?auto_1892 ) ( AVAILABLE ?auto_1887 ) ( SURFACE-AT ?auto_1877 ?auto_1892 ) ( ON ?auto_1877 ?auto_1894 ) ( CLEAR ?auto_1877 ) ( not ( = ?auto_1876 ?auto_1877 ) ) ( not ( = ?auto_1876 ?auto_1894 ) ) ( not ( = ?auto_1877 ?auto_1894 ) ) ( not ( = ?auto_1885 ?auto_1887 ) ) ( SURFACE-AT ?auto_1875 ?auto_1880 ) ( CLEAR ?auto_1875 ) ( IS-CRATE ?auto_1876 ) ( AVAILABLE ?auto_1885 ) ( not ( = ?auto_1890 ?auto_1880 ) ) ( HOIST-AT ?auto_1891 ?auto_1890 ) ( AVAILABLE ?auto_1891 ) ( SURFACE-AT ?auto_1876 ?auto_1890 ) ( ON ?auto_1876 ?auto_1886 ) ( CLEAR ?auto_1876 ) ( TRUCK-AT ?auto_1882 ?auto_1880 ) ( not ( = ?auto_1875 ?auto_1876 ) ) ( not ( = ?auto_1875 ?auto_1886 ) ) ( not ( = ?auto_1876 ?auto_1886 ) ) ( not ( = ?auto_1885 ?auto_1891 ) ) ( not ( = ?auto_1875 ?auto_1877 ) ) ( not ( = ?auto_1875 ?auto_1894 ) ) ( not ( = ?auto_1877 ?auto_1886 ) ) ( not ( = ?auto_1892 ?auto_1890 ) ) ( not ( = ?auto_1887 ?auto_1891 ) ) ( not ( = ?auto_1894 ?auto_1886 ) ) ( not ( = ?auto_1875 ?auto_1878 ) ) ( not ( = ?auto_1875 ?auto_1893 ) ) ( not ( = ?auto_1876 ?auto_1878 ) ) ( not ( = ?auto_1876 ?auto_1893 ) ) ( not ( = ?auto_1878 ?auto_1894 ) ) ( not ( = ?auto_1878 ?auto_1886 ) ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1888 ?auto_1887 ) ) ( not ( = ?auto_1888 ?auto_1891 ) ) ( not ( = ?auto_1893 ?auto_1894 ) ) ( not ( = ?auto_1893 ?auto_1886 ) ) ( not ( = ?auto_1875 ?auto_1879 ) ) ( not ( = ?auto_1875 ?auto_1883 ) ) ( not ( = ?auto_1876 ?auto_1879 ) ) ( not ( = ?auto_1876 ?auto_1883 ) ) ( not ( = ?auto_1877 ?auto_1879 ) ) ( not ( = ?auto_1877 ?auto_1883 ) ) ( not ( = ?auto_1879 ?auto_1893 ) ) ( not ( = ?auto_1879 ?auto_1894 ) ) ( not ( = ?auto_1879 ?auto_1886 ) ) ( not ( = ?auto_1881 ?auto_1889 ) ) ( not ( = ?auto_1881 ?auto_1892 ) ) ( not ( = ?auto_1881 ?auto_1890 ) ) ( not ( = ?auto_1884 ?auto_1888 ) ) ( not ( = ?auto_1884 ?auto_1887 ) ) ( not ( = ?auto_1884 ?auto_1891 ) ) ( not ( = ?auto_1883 ?auto_1893 ) ) ( not ( = ?auto_1883 ?auto_1894 ) ) ( not ( = ?auto_1883 ?auto_1886 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1875 ?auto_1876 ?auto_1877 ?auto_1878 )
      ( MAKE-1CRATE ?auto_1878 ?auto_1879 )
      ( MAKE-4CRATE-VERIFY ?auto_1875 ?auto_1876 ?auto_1877 ?auto_1878 ?auto_1879 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1911 - SURFACE
      ?auto_1912 - SURFACE
      ?auto_1913 - SURFACE
      ?auto_1914 - SURFACE
      ?auto_1915 - SURFACE
      ?auto_1916 - SURFACE
    )
    :vars
    (
      ?auto_1922 - HOIST
      ?auto_1919 - PLACE
      ?auto_1921 - PLACE
      ?auto_1918 - HOIST
      ?auto_1917 - SURFACE
      ?auto_1932 - PLACE
      ?auto_1930 - HOIST
      ?auto_1926 - SURFACE
      ?auto_1929 - SURFACE
      ?auto_1928 - PLACE
      ?auto_1923 - HOIST
      ?auto_1924 - SURFACE
      ?auto_1931 - PLACE
      ?auto_1927 - HOIST
      ?auto_1925 - SURFACE
      ?auto_1920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1922 ?auto_1919 ) ( IS-CRATE ?auto_1916 ) ( not ( = ?auto_1921 ?auto_1919 ) ) ( HOIST-AT ?auto_1918 ?auto_1921 ) ( SURFACE-AT ?auto_1916 ?auto_1921 ) ( ON ?auto_1916 ?auto_1917 ) ( CLEAR ?auto_1916 ) ( not ( = ?auto_1915 ?auto_1916 ) ) ( not ( = ?auto_1915 ?auto_1917 ) ) ( not ( = ?auto_1916 ?auto_1917 ) ) ( not ( = ?auto_1922 ?auto_1918 ) ) ( IS-CRATE ?auto_1915 ) ( not ( = ?auto_1932 ?auto_1919 ) ) ( HOIST-AT ?auto_1930 ?auto_1932 ) ( AVAILABLE ?auto_1930 ) ( SURFACE-AT ?auto_1915 ?auto_1932 ) ( ON ?auto_1915 ?auto_1926 ) ( CLEAR ?auto_1915 ) ( not ( = ?auto_1914 ?auto_1915 ) ) ( not ( = ?auto_1914 ?auto_1926 ) ) ( not ( = ?auto_1915 ?auto_1926 ) ) ( not ( = ?auto_1922 ?auto_1930 ) ) ( IS-CRATE ?auto_1914 ) ( AVAILABLE ?auto_1918 ) ( SURFACE-AT ?auto_1914 ?auto_1921 ) ( ON ?auto_1914 ?auto_1929 ) ( CLEAR ?auto_1914 ) ( not ( = ?auto_1913 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1929 ) ) ( not ( = ?auto_1914 ?auto_1929 ) ) ( IS-CRATE ?auto_1913 ) ( not ( = ?auto_1928 ?auto_1919 ) ) ( HOIST-AT ?auto_1923 ?auto_1928 ) ( AVAILABLE ?auto_1923 ) ( SURFACE-AT ?auto_1913 ?auto_1928 ) ( ON ?auto_1913 ?auto_1924 ) ( CLEAR ?auto_1913 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1924 ) ) ( not ( = ?auto_1913 ?auto_1924 ) ) ( not ( = ?auto_1922 ?auto_1923 ) ) ( SURFACE-AT ?auto_1911 ?auto_1919 ) ( CLEAR ?auto_1911 ) ( IS-CRATE ?auto_1912 ) ( AVAILABLE ?auto_1922 ) ( not ( = ?auto_1931 ?auto_1919 ) ) ( HOIST-AT ?auto_1927 ?auto_1931 ) ( AVAILABLE ?auto_1927 ) ( SURFACE-AT ?auto_1912 ?auto_1931 ) ( ON ?auto_1912 ?auto_1925 ) ( CLEAR ?auto_1912 ) ( TRUCK-AT ?auto_1920 ?auto_1919 ) ( not ( = ?auto_1911 ?auto_1912 ) ) ( not ( = ?auto_1911 ?auto_1925 ) ) ( not ( = ?auto_1912 ?auto_1925 ) ) ( not ( = ?auto_1922 ?auto_1927 ) ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1924 ) ) ( not ( = ?auto_1913 ?auto_1925 ) ) ( not ( = ?auto_1928 ?auto_1931 ) ) ( not ( = ?auto_1923 ?auto_1927 ) ) ( not ( = ?auto_1924 ?auto_1925 ) ) ( not ( = ?auto_1911 ?auto_1914 ) ) ( not ( = ?auto_1911 ?auto_1929 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1912 ?auto_1929 ) ) ( not ( = ?auto_1914 ?auto_1924 ) ) ( not ( = ?auto_1914 ?auto_1925 ) ) ( not ( = ?auto_1921 ?auto_1928 ) ) ( not ( = ?auto_1921 ?auto_1931 ) ) ( not ( = ?auto_1918 ?auto_1923 ) ) ( not ( = ?auto_1918 ?auto_1927 ) ) ( not ( = ?auto_1929 ?auto_1924 ) ) ( not ( = ?auto_1929 ?auto_1925 ) ) ( not ( = ?auto_1911 ?auto_1915 ) ) ( not ( = ?auto_1911 ?auto_1926 ) ) ( not ( = ?auto_1912 ?auto_1915 ) ) ( not ( = ?auto_1912 ?auto_1926 ) ) ( not ( = ?auto_1913 ?auto_1915 ) ) ( not ( = ?auto_1913 ?auto_1926 ) ) ( not ( = ?auto_1915 ?auto_1929 ) ) ( not ( = ?auto_1915 ?auto_1924 ) ) ( not ( = ?auto_1915 ?auto_1925 ) ) ( not ( = ?auto_1932 ?auto_1921 ) ) ( not ( = ?auto_1932 ?auto_1928 ) ) ( not ( = ?auto_1932 ?auto_1931 ) ) ( not ( = ?auto_1930 ?auto_1918 ) ) ( not ( = ?auto_1930 ?auto_1923 ) ) ( not ( = ?auto_1930 ?auto_1927 ) ) ( not ( = ?auto_1926 ?auto_1929 ) ) ( not ( = ?auto_1926 ?auto_1924 ) ) ( not ( = ?auto_1926 ?auto_1925 ) ) ( not ( = ?auto_1911 ?auto_1916 ) ) ( not ( = ?auto_1911 ?auto_1917 ) ) ( not ( = ?auto_1912 ?auto_1916 ) ) ( not ( = ?auto_1912 ?auto_1917 ) ) ( not ( = ?auto_1913 ?auto_1916 ) ) ( not ( = ?auto_1913 ?auto_1917 ) ) ( not ( = ?auto_1914 ?auto_1916 ) ) ( not ( = ?auto_1914 ?auto_1917 ) ) ( not ( = ?auto_1916 ?auto_1926 ) ) ( not ( = ?auto_1916 ?auto_1929 ) ) ( not ( = ?auto_1916 ?auto_1924 ) ) ( not ( = ?auto_1916 ?auto_1925 ) ) ( not ( = ?auto_1917 ?auto_1926 ) ) ( not ( = ?auto_1917 ?auto_1929 ) ) ( not ( = ?auto_1917 ?auto_1924 ) ) ( not ( = ?auto_1917 ?auto_1925 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1911 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1915 )
      ( MAKE-1CRATE ?auto_1915 ?auto_1916 )
      ( MAKE-5CRATE-VERIFY ?auto_1911 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1915 ?auto_1916 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1950 - SURFACE
      ?auto_1951 - SURFACE
      ?auto_1952 - SURFACE
      ?auto_1953 - SURFACE
      ?auto_1954 - SURFACE
      ?auto_1955 - SURFACE
      ?auto_1956 - SURFACE
    )
    :vars
    (
      ?auto_1962 - HOIST
      ?auto_1961 - PLACE
      ?auto_1957 - PLACE
      ?auto_1958 - HOIST
      ?auto_1959 - SURFACE
      ?auto_1972 - PLACE
      ?auto_1964 - HOIST
      ?auto_1971 - SURFACE
      ?auto_1973 - PLACE
      ?auto_1968 - HOIST
      ?auto_1970 - SURFACE
      ?auto_1967 - SURFACE
      ?auto_1965 - PLACE
      ?auto_1969 - HOIST
      ?auto_1975 - SURFACE
      ?auto_1966 - PLACE
      ?auto_1963 - HOIST
      ?auto_1974 - SURFACE
      ?auto_1960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1962 ?auto_1961 ) ( IS-CRATE ?auto_1956 ) ( not ( = ?auto_1957 ?auto_1961 ) ) ( HOIST-AT ?auto_1958 ?auto_1957 ) ( AVAILABLE ?auto_1958 ) ( SURFACE-AT ?auto_1956 ?auto_1957 ) ( ON ?auto_1956 ?auto_1959 ) ( CLEAR ?auto_1956 ) ( not ( = ?auto_1955 ?auto_1956 ) ) ( not ( = ?auto_1955 ?auto_1959 ) ) ( not ( = ?auto_1956 ?auto_1959 ) ) ( not ( = ?auto_1962 ?auto_1958 ) ) ( IS-CRATE ?auto_1955 ) ( not ( = ?auto_1972 ?auto_1961 ) ) ( HOIST-AT ?auto_1964 ?auto_1972 ) ( SURFACE-AT ?auto_1955 ?auto_1972 ) ( ON ?auto_1955 ?auto_1971 ) ( CLEAR ?auto_1955 ) ( not ( = ?auto_1954 ?auto_1955 ) ) ( not ( = ?auto_1954 ?auto_1971 ) ) ( not ( = ?auto_1955 ?auto_1971 ) ) ( not ( = ?auto_1962 ?auto_1964 ) ) ( IS-CRATE ?auto_1954 ) ( not ( = ?auto_1973 ?auto_1961 ) ) ( HOIST-AT ?auto_1968 ?auto_1973 ) ( AVAILABLE ?auto_1968 ) ( SURFACE-AT ?auto_1954 ?auto_1973 ) ( ON ?auto_1954 ?auto_1970 ) ( CLEAR ?auto_1954 ) ( not ( = ?auto_1953 ?auto_1954 ) ) ( not ( = ?auto_1953 ?auto_1970 ) ) ( not ( = ?auto_1954 ?auto_1970 ) ) ( not ( = ?auto_1962 ?auto_1968 ) ) ( IS-CRATE ?auto_1953 ) ( AVAILABLE ?auto_1964 ) ( SURFACE-AT ?auto_1953 ?auto_1972 ) ( ON ?auto_1953 ?auto_1967 ) ( CLEAR ?auto_1953 ) ( not ( = ?auto_1952 ?auto_1953 ) ) ( not ( = ?auto_1952 ?auto_1967 ) ) ( not ( = ?auto_1953 ?auto_1967 ) ) ( IS-CRATE ?auto_1952 ) ( not ( = ?auto_1965 ?auto_1961 ) ) ( HOIST-AT ?auto_1969 ?auto_1965 ) ( AVAILABLE ?auto_1969 ) ( SURFACE-AT ?auto_1952 ?auto_1965 ) ( ON ?auto_1952 ?auto_1975 ) ( CLEAR ?auto_1952 ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1975 ) ) ( not ( = ?auto_1952 ?auto_1975 ) ) ( not ( = ?auto_1962 ?auto_1969 ) ) ( SURFACE-AT ?auto_1950 ?auto_1961 ) ( CLEAR ?auto_1950 ) ( IS-CRATE ?auto_1951 ) ( AVAILABLE ?auto_1962 ) ( not ( = ?auto_1966 ?auto_1961 ) ) ( HOIST-AT ?auto_1963 ?auto_1966 ) ( AVAILABLE ?auto_1963 ) ( SURFACE-AT ?auto_1951 ?auto_1966 ) ( ON ?auto_1951 ?auto_1974 ) ( CLEAR ?auto_1951 ) ( TRUCK-AT ?auto_1960 ?auto_1961 ) ( not ( = ?auto_1950 ?auto_1951 ) ) ( not ( = ?auto_1950 ?auto_1974 ) ) ( not ( = ?auto_1951 ?auto_1974 ) ) ( not ( = ?auto_1962 ?auto_1963 ) ) ( not ( = ?auto_1950 ?auto_1952 ) ) ( not ( = ?auto_1950 ?auto_1975 ) ) ( not ( = ?auto_1952 ?auto_1974 ) ) ( not ( = ?auto_1965 ?auto_1966 ) ) ( not ( = ?auto_1969 ?auto_1963 ) ) ( not ( = ?auto_1975 ?auto_1974 ) ) ( not ( = ?auto_1950 ?auto_1953 ) ) ( not ( = ?auto_1950 ?auto_1967 ) ) ( not ( = ?auto_1951 ?auto_1953 ) ) ( not ( = ?auto_1951 ?auto_1967 ) ) ( not ( = ?auto_1953 ?auto_1975 ) ) ( not ( = ?auto_1953 ?auto_1974 ) ) ( not ( = ?auto_1972 ?auto_1965 ) ) ( not ( = ?auto_1972 ?auto_1966 ) ) ( not ( = ?auto_1964 ?auto_1969 ) ) ( not ( = ?auto_1964 ?auto_1963 ) ) ( not ( = ?auto_1967 ?auto_1975 ) ) ( not ( = ?auto_1967 ?auto_1974 ) ) ( not ( = ?auto_1950 ?auto_1954 ) ) ( not ( = ?auto_1950 ?auto_1970 ) ) ( not ( = ?auto_1951 ?auto_1954 ) ) ( not ( = ?auto_1951 ?auto_1970 ) ) ( not ( = ?auto_1952 ?auto_1954 ) ) ( not ( = ?auto_1952 ?auto_1970 ) ) ( not ( = ?auto_1954 ?auto_1967 ) ) ( not ( = ?auto_1954 ?auto_1975 ) ) ( not ( = ?auto_1954 ?auto_1974 ) ) ( not ( = ?auto_1973 ?auto_1972 ) ) ( not ( = ?auto_1973 ?auto_1965 ) ) ( not ( = ?auto_1973 ?auto_1966 ) ) ( not ( = ?auto_1968 ?auto_1964 ) ) ( not ( = ?auto_1968 ?auto_1969 ) ) ( not ( = ?auto_1968 ?auto_1963 ) ) ( not ( = ?auto_1970 ?auto_1967 ) ) ( not ( = ?auto_1970 ?auto_1975 ) ) ( not ( = ?auto_1970 ?auto_1974 ) ) ( not ( = ?auto_1950 ?auto_1955 ) ) ( not ( = ?auto_1950 ?auto_1971 ) ) ( not ( = ?auto_1951 ?auto_1955 ) ) ( not ( = ?auto_1951 ?auto_1971 ) ) ( not ( = ?auto_1952 ?auto_1955 ) ) ( not ( = ?auto_1952 ?auto_1971 ) ) ( not ( = ?auto_1953 ?auto_1955 ) ) ( not ( = ?auto_1953 ?auto_1971 ) ) ( not ( = ?auto_1955 ?auto_1970 ) ) ( not ( = ?auto_1955 ?auto_1967 ) ) ( not ( = ?auto_1955 ?auto_1975 ) ) ( not ( = ?auto_1955 ?auto_1974 ) ) ( not ( = ?auto_1971 ?auto_1970 ) ) ( not ( = ?auto_1971 ?auto_1967 ) ) ( not ( = ?auto_1971 ?auto_1975 ) ) ( not ( = ?auto_1971 ?auto_1974 ) ) ( not ( = ?auto_1950 ?auto_1956 ) ) ( not ( = ?auto_1950 ?auto_1959 ) ) ( not ( = ?auto_1951 ?auto_1956 ) ) ( not ( = ?auto_1951 ?auto_1959 ) ) ( not ( = ?auto_1952 ?auto_1956 ) ) ( not ( = ?auto_1952 ?auto_1959 ) ) ( not ( = ?auto_1953 ?auto_1956 ) ) ( not ( = ?auto_1953 ?auto_1959 ) ) ( not ( = ?auto_1954 ?auto_1956 ) ) ( not ( = ?auto_1954 ?auto_1959 ) ) ( not ( = ?auto_1956 ?auto_1971 ) ) ( not ( = ?auto_1956 ?auto_1970 ) ) ( not ( = ?auto_1956 ?auto_1967 ) ) ( not ( = ?auto_1956 ?auto_1975 ) ) ( not ( = ?auto_1956 ?auto_1974 ) ) ( not ( = ?auto_1957 ?auto_1972 ) ) ( not ( = ?auto_1957 ?auto_1973 ) ) ( not ( = ?auto_1957 ?auto_1965 ) ) ( not ( = ?auto_1957 ?auto_1966 ) ) ( not ( = ?auto_1958 ?auto_1964 ) ) ( not ( = ?auto_1958 ?auto_1968 ) ) ( not ( = ?auto_1958 ?auto_1969 ) ) ( not ( = ?auto_1958 ?auto_1963 ) ) ( not ( = ?auto_1959 ?auto_1971 ) ) ( not ( = ?auto_1959 ?auto_1970 ) ) ( not ( = ?auto_1959 ?auto_1967 ) ) ( not ( = ?auto_1959 ?auto_1975 ) ) ( not ( = ?auto_1959 ?auto_1974 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1950 ?auto_1951 ?auto_1952 ?auto_1953 ?auto_1954 ?auto_1955 )
      ( MAKE-1CRATE ?auto_1955 ?auto_1956 )
      ( MAKE-6CRATE-VERIFY ?auto_1950 ?auto_1951 ?auto_1952 ?auto_1953 ?auto_1954 ?auto_1955 ?auto_1956 ) )
  )

)

