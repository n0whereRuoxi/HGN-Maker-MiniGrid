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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1807 - SURFACE
      ?auto_1808 - SURFACE
    )
    :vars
    (
      ?auto_1809 - HOIST
      ?auto_1810 - PLACE
      ?auto_1812 - PLACE
      ?auto_1813 - HOIST
      ?auto_1814 - SURFACE
      ?auto_1811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809 ?auto_1810 ) ( SURFACE-AT ?auto_1807 ?auto_1810 ) ( CLEAR ?auto_1807 ) ( IS-CRATE ?auto_1808 ) ( AVAILABLE ?auto_1809 ) ( not ( = ?auto_1812 ?auto_1810 ) ) ( HOIST-AT ?auto_1813 ?auto_1812 ) ( AVAILABLE ?auto_1813 ) ( SURFACE-AT ?auto_1808 ?auto_1812 ) ( ON ?auto_1808 ?auto_1814 ) ( CLEAR ?auto_1808 ) ( TRUCK-AT ?auto_1811 ?auto_1810 ) ( not ( = ?auto_1807 ?auto_1808 ) ) ( not ( = ?auto_1807 ?auto_1814 ) ) ( not ( = ?auto_1808 ?auto_1814 ) ) ( not ( = ?auto_1809 ?auto_1813 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1811 ?auto_1810 ?auto_1812 )
      ( !LIFT ?auto_1813 ?auto_1808 ?auto_1814 ?auto_1812 )
      ( !LOAD ?auto_1813 ?auto_1808 ?auto_1811 ?auto_1812 )
      ( !DRIVE ?auto_1811 ?auto_1812 ?auto_1810 )
      ( !UNLOAD ?auto_1809 ?auto_1808 ?auto_1811 ?auto_1810 )
      ( !DROP ?auto_1809 ?auto_1808 ?auto_1807 ?auto_1810 )
      ( MAKE-1CRATE-VERIFY ?auto_1807 ?auto_1808 ) )
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
      ?auto_1824 - HOIST
      ?auto_1823 - PLACE
      ?auto_1822 - PLACE
      ?auto_1821 - HOIST
      ?auto_1825 - SURFACE
      ?auto_1828 - PLACE
      ?auto_1827 - HOIST
      ?auto_1829 - SURFACE
      ?auto_1826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1824 ?auto_1823 ) ( IS-CRATE ?auto_1820 ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( HOIST-AT ?auto_1821 ?auto_1822 ) ( AVAILABLE ?auto_1821 ) ( SURFACE-AT ?auto_1820 ?auto_1822 ) ( ON ?auto_1820 ?auto_1825 ) ( CLEAR ?auto_1820 ) ( not ( = ?auto_1819 ?auto_1820 ) ) ( not ( = ?auto_1819 ?auto_1825 ) ) ( not ( = ?auto_1820 ?auto_1825 ) ) ( not ( = ?auto_1824 ?auto_1821 ) ) ( SURFACE-AT ?auto_1818 ?auto_1823 ) ( CLEAR ?auto_1818 ) ( IS-CRATE ?auto_1819 ) ( AVAILABLE ?auto_1824 ) ( not ( = ?auto_1828 ?auto_1823 ) ) ( HOIST-AT ?auto_1827 ?auto_1828 ) ( AVAILABLE ?auto_1827 ) ( SURFACE-AT ?auto_1819 ?auto_1828 ) ( ON ?auto_1819 ?auto_1829 ) ( CLEAR ?auto_1819 ) ( TRUCK-AT ?auto_1826 ?auto_1823 ) ( not ( = ?auto_1818 ?auto_1819 ) ) ( not ( = ?auto_1818 ?auto_1829 ) ) ( not ( = ?auto_1819 ?auto_1829 ) ) ( not ( = ?auto_1824 ?auto_1827 ) ) ( not ( = ?auto_1818 ?auto_1820 ) ) ( not ( = ?auto_1818 ?auto_1825 ) ) ( not ( = ?auto_1820 ?auto_1829 ) ) ( not ( = ?auto_1822 ?auto_1828 ) ) ( not ( = ?auto_1821 ?auto_1827 ) ) ( not ( = ?auto_1825 ?auto_1829 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1818 ?auto_1819 )
      ( MAKE-1CRATE ?auto_1819 ?auto_1820 )
      ( MAKE-2CRATE-VERIFY ?auto_1818 ?auto_1819 ?auto_1820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1832 - SURFACE
      ?auto_1833 - SURFACE
    )
    :vars
    (
      ?auto_1834 - HOIST
      ?auto_1835 - PLACE
      ?auto_1837 - PLACE
      ?auto_1838 - HOIST
      ?auto_1839 - SURFACE
      ?auto_1836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1834 ?auto_1835 ) ( SURFACE-AT ?auto_1832 ?auto_1835 ) ( CLEAR ?auto_1832 ) ( IS-CRATE ?auto_1833 ) ( AVAILABLE ?auto_1834 ) ( not ( = ?auto_1837 ?auto_1835 ) ) ( HOIST-AT ?auto_1838 ?auto_1837 ) ( AVAILABLE ?auto_1838 ) ( SURFACE-AT ?auto_1833 ?auto_1837 ) ( ON ?auto_1833 ?auto_1839 ) ( CLEAR ?auto_1833 ) ( TRUCK-AT ?auto_1836 ?auto_1835 ) ( not ( = ?auto_1832 ?auto_1833 ) ) ( not ( = ?auto_1832 ?auto_1839 ) ) ( not ( = ?auto_1833 ?auto_1839 ) ) ( not ( = ?auto_1834 ?auto_1838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1836 ?auto_1835 ?auto_1837 )
      ( !LIFT ?auto_1838 ?auto_1833 ?auto_1839 ?auto_1837 )
      ( !LOAD ?auto_1838 ?auto_1833 ?auto_1836 ?auto_1837 )
      ( !DRIVE ?auto_1836 ?auto_1837 ?auto_1835 )
      ( !UNLOAD ?auto_1834 ?auto_1833 ?auto_1836 ?auto_1835 )
      ( !DROP ?auto_1834 ?auto_1833 ?auto_1832 ?auto_1835 )
      ( MAKE-1CRATE-VERIFY ?auto_1832 ?auto_1833 ) )
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
      ?auto_1853 - HOIST
      ?auto_1850 - PLACE
      ?auto_1851 - PLACE
      ?auto_1849 - HOIST
      ?auto_1848 - SURFACE
      ?auto_1859 - PLACE
      ?auto_1854 - HOIST
      ?auto_1857 - SURFACE
      ?auto_1855 - PLACE
      ?auto_1856 - HOIST
      ?auto_1858 - SURFACE
      ?auto_1852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1853 ?auto_1850 ) ( IS-CRATE ?auto_1847 ) ( not ( = ?auto_1851 ?auto_1850 ) ) ( HOIST-AT ?auto_1849 ?auto_1851 ) ( AVAILABLE ?auto_1849 ) ( SURFACE-AT ?auto_1847 ?auto_1851 ) ( ON ?auto_1847 ?auto_1848 ) ( CLEAR ?auto_1847 ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( not ( = ?auto_1846 ?auto_1848 ) ) ( not ( = ?auto_1847 ?auto_1848 ) ) ( not ( = ?auto_1853 ?auto_1849 ) ) ( IS-CRATE ?auto_1846 ) ( not ( = ?auto_1859 ?auto_1850 ) ) ( HOIST-AT ?auto_1854 ?auto_1859 ) ( AVAILABLE ?auto_1854 ) ( SURFACE-AT ?auto_1846 ?auto_1859 ) ( ON ?auto_1846 ?auto_1857 ) ( CLEAR ?auto_1846 ) ( not ( = ?auto_1845 ?auto_1846 ) ) ( not ( = ?auto_1845 ?auto_1857 ) ) ( not ( = ?auto_1846 ?auto_1857 ) ) ( not ( = ?auto_1853 ?auto_1854 ) ) ( SURFACE-AT ?auto_1844 ?auto_1850 ) ( CLEAR ?auto_1844 ) ( IS-CRATE ?auto_1845 ) ( AVAILABLE ?auto_1853 ) ( not ( = ?auto_1855 ?auto_1850 ) ) ( HOIST-AT ?auto_1856 ?auto_1855 ) ( AVAILABLE ?auto_1856 ) ( SURFACE-AT ?auto_1845 ?auto_1855 ) ( ON ?auto_1845 ?auto_1858 ) ( CLEAR ?auto_1845 ) ( TRUCK-AT ?auto_1852 ?auto_1850 ) ( not ( = ?auto_1844 ?auto_1845 ) ) ( not ( = ?auto_1844 ?auto_1858 ) ) ( not ( = ?auto_1845 ?auto_1858 ) ) ( not ( = ?auto_1853 ?auto_1856 ) ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1857 ) ) ( not ( = ?auto_1846 ?auto_1858 ) ) ( not ( = ?auto_1859 ?auto_1855 ) ) ( not ( = ?auto_1854 ?auto_1856 ) ) ( not ( = ?auto_1857 ?auto_1858 ) ) ( not ( = ?auto_1844 ?auto_1847 ) ) ( not ( = ?auto_1844 ?auto_1848 ) ) ( not ( = ?auto_1845 ?auto_1847 ) ) ( not ( = ?auto_1845 ?auto_1848 ) ) ( not ( = ?auto_1847 ?auto_1857 ) ) ( not ( = ?auto_1847 ?auto_1858 ) ) ( not ( = ?auto_1851 ?auto_1859 ) ) ( not ( = ?auto_1851 ?auto_1855 ) ) ( not ( = ?auto_1849 ?auto_1854 ) ) ( not ( = ?auto_1849 ?auto_1856 ) ) ( not ( = ?auto_1848 ?auto_1857 ) ) ( not ( = ?auto_1848 ?auto_1858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1844 ?auto_1845 ?auto_1846 )
      ( MAKE-1CRATE ?auto_1846 ?auto_1847 )
      ( MAKE-3CRATE-VERIFY ?auto_1844 ?auto_1845 ?auto_1846 ?auto_1847 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1862 - SURFACE
      ?auto_1863 - SURFACE
    )
    :vars
    (
      ?auto_1864 - HOIST
      ?auto_1865 - PLACE
      ?auto_1867 - PLACE
      ?auto_1868 - HOIST
      ?auto_1869 - SURFACE
      ?auto_1866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1864 ?auto_1865 ) ( SURFACE-AT ?auto_1862 ?auto_1865 ) ( CLEAR ?auto_1862 ) ( IS-CRATE ?auto_1863 ) ( AVAILABLE ?auto_1864 ) ( not ( = ?auto_1867 ?auto_1865 ) ) ( HOIST-AT ?auto_1868 ?auto_1867 ) ( AVAILABLE ?auto_1868 ) ( SURFACE-AT ?auto_1863 ?auto_1867 ) ( ON ?auto_1863 ?auto_1869 ) ( CLEAR ?auto_1863 ) ( TRUCK-AT ?auto_1866 ?auto_1865 ) ( not ( = ?auto_1862 ?auto_1863 ) ) ( not ( = ?auto_1862 ?auto_1869 ) ) ( not ( = ?auto_1863 ?auto_1869 ) ) ( not ( = ?auto_1864 ?auto_1868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1866 ?auto_1865 ?auto_1867 )
      ( !LIFT ?auto_1868 ?auto_1863 ?auto_1869 ?auto_1867 )
      ( !LOAD ?auto_1868 ?auto_1863 ?auto_1866 ?auto_1867 )
      ( !DRIVE ?auto_1866 ?auto_1867 ?auto_1865 )
      ( !UNLOAD ?auto_1864 ?auto_1863 ?auto_1866 ?auto_1865 )
      ( !DROP ?auto_1864 ?auto_1863 ?auto_1862 ?auto_1865 )
      ( MAKE-1CRATE-VERIFY ?auto_1862 ?auto_1863 ) )
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
      ?auto_1880 - HOIST
      ?auto_1883 - PLACE
      ?auto_1884 - PLACE
      ?auto_1882 - HOIST
      ?auto_1881 - SURFACE
      ?auto_1894 - PLACE
      ?auto_1889 - HOIST
      ?auto_1890 - SURFACE
      ?auto_1891 - PLACE
      ?auto_1887 - HOIST
      ?auto_1888 - SURFACE
      ?auto_1886 - PLACE
      ?auto_1892 - HOIST
      ?auto_1893 - SURFACE
      ?auto_1885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1880 ?auto_1883 ) ( IS-CRATE ?auto_1879 ) ( not ( = ?auto_1884 ?auto_1883 ) ) ( HOIST-AT ?auto_1882 ?auto_1884 ) ( AVAILABLE ?auto_1882 ) ( SURFACE-AT ?auto_1879 ?auto_1884 ) ( ON ?auto_1879 ?auto_1881 ) ( CLEAR ?auto_1879 ) ( not ( = ?auto_1878 ?auto_1879 ) ) ( not ( = ?auto_1878 ?auto_1881 ) ) ( not ( = ?auto_1879 ?auto_1881 ) ) ( not ( = ?auto_1880 ?auto_1882 ) ) ( IS-CRATE ?auto_1878 ) ( not ( = ?auto_1894 ?auto_1883 ) ) ( HOIST-AT ?auto_1889 ?auto_1894 ) ( AVAILABLE ?auto_1889 ) ( SURFACE-AT ?auto_1878 ?auto_1894 ) ( ON ?auto_1878 ?auto_1890 ) ( CLEAR ?auto_1878 ) ( not ( = ?auto_1877 ?auto_1878 ) ) ( not ( = ?auto_1877 ?auto_1890 ) ) ( not ( = ?auto_1878 ?auto_1890 ) ) ( not ( = ?auto_1880 ?auto_1889 ) ) ( IS-CRATE ?auto_1877 ) ( not ( = ?auto_1891 ?auto_1883 ) ) ( HOIST-AT ?auto_1887 ?auto_1891 ) ( AVAILABLE ?auto_1887 ) ( SURFACE-AT ?auto_1877 ?auto_1891 ) ( ON ?auto_1877 ?auto_1888 ) ( CLEAR ?auto_1877 ) ( not ( = ?auto_1876 ?auto_1877 ) ) ( not ( = ?auto_1876 ?auto_1888 ) ) ( not ( = ?auto_1877 ?auto_1888 ) ) ( not ( = ?auto_1880 ?auto_1887 ) ) ( SURFACE-AT ?auto_1875 ?auto_1883 ) ( CLEAR ?auto_1875 ) ( IS-CRATE ?auto_1876 ) ( AVAILABLE ?auto_1880 ) ( not ( = ?auto_1886 ?auto_1883 ) ) ( HOIST-AT ?auto_1892 ?auto_1886 ) ( AVAILABLE ?auto_1892 ) ( SURFACE-AT ?auto_1876 ?auto_1886 ) ( ON ?auto_1876 ?auto_1893 ) ( CLEAR ?auto_1876 ) ( TRUCK-AT ?auto_1885 ?auto_1883 ) ( not ( = ?auto_1875 ?auto_1876 ) ) ( not ( = ?auto_1875 ?auto_1893 ) ) ( not ( = ?auto_1876 ?auto_1893 ) ) ( not ( = ?auto_1880 ?auto_1892 ) ) ( not ( = ?auto_1875 ?auto_1877 ) ) ( not ( = ?auto_1875 ?auto_1888 ) ) ( not ( = ?auto_1877 ?auto_1893 ) ) ( not ( = ?auto_1891 ?auto_1886 ) ) ( not ( = ?auto_1887 ?auto_1892 ) ) ( not ( = ?auto_1888 ?auto_1893 ) ) ( not ( = ?auto_1875 ?auto_1878 ) ) ( not ( = ?auto_1875 ?auto_1890 ) ) ( not ( = ?auto_1876 ?auto_1878 ) ) ( not ( = ?auto_1876 ?auto_1890 ) ) ( not ( = ?auto_1878 ?auto_1888 ) ) ( not ( = ?auto_1878 ?auto_1893 ) ) ( not ( = ?auto_1894 ?auto_1891 ) ) ( not ( = ?auto_1894 ?auto_1886 ) ) ( not ( = ?auto_1889 ?auto_1887 ) ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( not ( = ?auto_1890 ?auto_1888 ) ) ( not ( = ?auto_1890 ?auto_1893 ) ) ( not ( = ?auto_1875 ?auto_1879 ) ) ( not ( = ?auto_1875 ?auto_1881 ) ) ( not ( = ?auto_1876 ?auto_1879 ) ) ( not ( = ?auto_1876 ?auto_1881 ) ) ( not ( = ?auto_1877 ?auto_1879 ) ) ( not ( = ?auto_1877 ?auto_1881 ) ) ( not ( = ?auto_1879 ?auto_1890 ) ) ( not ( = ?auto_1879 ?auto_1888 ) ) ( not ( = ?auto_1879 ?auto_1893 ) ) ( not ( = ?auto_1884 ?auto_1894 ) ) ( not ( = ?auto_1884 ?auto_1891 ) ) ( not ( = ?auto_1884 ?auto_1886 ) ) ( not ( = ?auto_1882 ?auto_1889 ) ) ( not ( = ?auto_1882 ?auto_1887 ) ) ( not ( = ?auto_1882 ?auto_1892 ) ) ( not ( = ?auto_1881 ?auto_1890 ) ) ( not ( = ?auto_1881 ?auto_1888 ) ) ( not ( = ?auto_1881 ?auto_1893 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1875 ?auto_1876 ?auto_1877 ?auto_1878 )
      ( MAKE-1CRATE ?auto_1878 ?auto_1879 )
      ( MAKE-4CRATE-VERIFY ?auto_1875 ?auto_1876 ?auto_1877 ?auto_1878 ?auto_1879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1897 - SURFACE
      ?auto_1898 - SURFACE
    )
    :vars
    (
      ?auto_1899 - HOIST
      ?auto_1900 - PLACE
      ?auto_1902 - PLACE
      ?auto_1903 - HOIST
      ?auto_1904 - SURFACE
      ?auto_1901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1899 ?auto_1900 ) ( SURFACE-AT ?auto_1897 ?auto_1900 ) ( CLEAR ?auto_1897 ) ( IS-CRATE ?auto_1898 ) ( AVAILABLE ?auto_1899 ) ( not ( = ?auto_1902 ?auto_1900 ) ) ( HOIST-AT ?auto_1903 ?auto_1902 ) ( AVAILABLE ?auto_1903 ) ( SURFACE-AT ?auto_1898 ?auto_1902 ) ( ON ?auto_1898 ?auto_1904 ) ( CLEAR ?auto_1898 ) ( TRUCK-AT ?auto_1901 ?auto_1900 ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( not ( = ?auto_1897 ?auto_1904 ) ) ( not ( = ?auto_1898 ?auto_1904 ) ) ( not ( = ?auto_1899 ?auto_1903 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1901 ?auto_1900 ?auto_1902 )
      ( !LIFT ?auto_1903 ?auto_1898 ?auto_1904 ?auto_1902 )
      ( !LOAD ?auto_1903 ?auto_1898 ?auto_1901 ?auto_1902 )
      ( !DRIVE ?auto_1901 ?auto_1902 ?auto_1900 )
      ( !UNLOAD ?auto_1899 ?auto_1898 ?auto_1901 ?auto_1900 )
      ( !DROP ?auto_1899 ?auto_1898 ?auto_1897 ?auto_1900 )
      ( MAKE-1CRATE-VERIFY ?auto_1897 ?auto_1898 ) )
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
      ?auto_1917 - HOIST
      ?auto_1921 - PLACE
      ?auto_1922 - PLACE
      ?auto_1920 - HOIST
      ?auto_1919 - SURFACE
      ?auto_1926 - PLACE
      ?auto_1930 - HOIST
      ?auto_1929 - SURFACE
      ?auto_1927 - SURFACE
      ?auto_1928 - PLACE
      ?auto_1931 - HOIST
      ?auto_1924 - SURFACE
      ?auto_1925 - PLACE
      ?auto_1923 - HOIST
      ?auto_1932 - SURFACE
      ?auto_1918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917 ?auto_1921 ) ( IS-CRATE ?auto_1916 ) ( not ( = ?auto_1922 ?auto_1921 ) ) ( HOIST-AT ?auto_1920 ?auto_1922 ) ( SURFACE-AT ?auto_1916 ?auto_1922 ) ( ON ?auto_1916 ?auto_1919 ) ( CLEAR ?auto_1916 ) ( not ( = ?auto_1915 ?auto_1916 ) ) ( not ( = ?auto_1915 ?auto_1919 ) ) ( not ( = ?auto_1916 ?auto_1919 ) ) ( not ( = ?auto_1917 ?auto_1920 ) ) ( IS-CRATE ?auto_1915 ) ( not ( = ?auto_1926 ?auto_1921 ) ) ( HOIST-AT ?auto_1930 ?auto_1926 ) ( AVAILABLE ?auto_1930 ) ( SURFACE-AT ?auto_1915 ?auto_1926 ) ( ON ?auto_1915 ?auto_1929 ) ( CLEAR ?auto_1915 ) ( not ( = ?auto_1914 ?auto_1915 ) ) ( not ( = ?auto_1914 ?auto_1929 ) ) ( not ( = ?auto_1915 ?auto_1929 ) ) ( not ( = ?auto_1917 ?auto_1930 ) ) ( IS-CRATE ?auto_1914 ) ( AVAILABLE ?auto_1920 ) ( SURFACE-AT ?auto_1914 ?auto_1922 ) ( ON ?auto_1914 ?auto_1927 ) ( CLEAR ?auto_1914 ) ( not ( = ?auto_1913 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1927 ) ) ( not ( = ?auto_1914 ?auto_1927 ) ) ( IS-CRATE ?auto_1913 ) ( not ( = ?auto_1928 ?auto_1921 ) ) ( HOIST-AT ?auto_1931 ?auto_1928 ) ( AVAILABLE ?auto_1931 ) ( SURFACE-AT ?auto_1913 ?auto_1928 ) ( ON ?auto_1913 ?auto_1924 ) ( CLEAR ?auto_1913 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1924 ) ) ( not ( = ?auto_1913 ?auto_1924 ) ) ( not ( = ?auto_1917 ?auto_1931 ) ) ( SURFACE-AT ?auto_1911 ?auto_1921 ) ( CLEAR ?auto_1911 ) ( IS-CRATE ?auto_1912 ) ( AVAILABLE ?auto_1917 ) ( not ( = ?auto_1925 ?auto_1921 ) ) ( HOIST-AT ?auto_1923 ?auto_1925 ) ( AVAILABLE ?auto_1923 ) ( SURFACE-AT ?auto_1912 ?auto_1925 ) ( ON ?auto_1912 ?auto_1932 ) ( CLEAR ?auto_1912 ) ( TRUCK-AT ?auto_1918 ?auto_1921 ) ( not ( = ?auto_1911 ?auto_1912 ) ) ( not ( = ?auto_1911 ?auto_1932 ) ) ( not ( = ?auto_1912 ?auto_1932 ) ) ( not ( = ?auto_1917 ?auto_1923 ) ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1924 ) ) ( not ( = ?auto_1913 ?auto_1932 ) ) ( not ( = ?auto_1928 ?auto_1925 ) ) ( not ( = ?auto_1931 ?auto_1923 ) ) ( not ( = ?auto_1924 ?auto_1932 ) ) ( not ( = ?auto_1911 ?auto_1914 ) ) ( not ( = ?auto_1911 ?auto_1927 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1912 ?auto_1927 ) ) ( not ( = ?auto_1914 ?auto_1924 ) ) ( not ( = ?auto_1914 ?auto_1932 ) ) ( not ( = ?auto_1922 ?auto_1928 ) ) ( not ( = ?auto_1922 ?auto_1925 ) ) ( not ( = ?auto_1920 ?auto_1931 ) ) ( not ( = ?auto_1920 ?auto_1923 ) ) ( not ( = ?auto_1927 ?auto_1924 ) ) ( not ( = ?auto_1927 ?auto_1932 ) ) ( not ( = ?auto_1911 ?auto_1915 ) ) ( not ( = ?auto_1911 ?auto_1929 ) ) ( not ( = ?auto_1912 ?auto_1915 ) ) ( not ( = ?auto_1912 ?auto_1929 ) ) ( not ( = ?auto_1913 ?auto_1915 ) ) ( not ( = ?auto_1913 ?auto_1929 ) ) ( not ( = ?auto_1915 ?auto_1927 ) ) ( not ( = ?auto_1915 ?auto_1924 ) ) ( not ( = ?auto_1915 ?auto_1932 ) ) ( not ( = ?auto_1926 ?auto_1922 ) ) ( not ( = ?auto_1926 ?auto_1928 ) ) ( not ( = ?auto_1926 ?auto_1925 ) ) ( not ( = ?auto_1930 ?auto_1920 ) ) ( not ( = ?auto_1930 ?auto_1931 ) ) ( not ( = ?auto_1930 ?auto_1923 ) ) ( not ( = ?auto_1929 ?auto_1927 ) ) ( not ( = ?auto_1929 ?auto_1924 ) ) ( not ( = ?auto_1929 ?auto_1932 ) ) ( not ( = ?auto_1911 ?auto_1916 ) ) ( not ( = ?auto_1911 ?auto_1919 ) ) ( not ( = ?auto_1912 ?auto_1916 ) ) ( not ( = ?auto_1912 ?auto_1919 ) ) ( not ( = ?auto_1913 ?auto_1916 ) ) ( not ( = ?auto_1913 ?auto_1919 ) ) ( not ( = ?auto_1914 ?auto_1916 ) ) ( not ( = ?auto_1914 ?auto_1919 ) ) ( not ( = ?auto_1916 ?auto_1929 ) ) ( not ( = ?auto_1916 ?auto_1927 ) ) ( not ( = ?auto_1916 ?auto_1924 ) ) ( not ( = ?auto_1916 ?auto_1932 ) ) ( not ( = ?auto_1919 ?auto_1929 ) ) ( not ( = ?auto_1919 ?auto_1927 ) ) ( not ( = ?auto_1919 ?auto_1924 ) ) ( not ( = ?auto_1919 ?auto_1932 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1911 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1915 )
      ( MAKE-1CRATE ?auto_1915 ?auto_1916 )
      ( MAKE-5CRATE-VERIFY ?auto_1911 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1915 ?auto_1916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1935 - SURFACE
      ?auto_1936 - SURFACE
    )
    :vars
    (
      ?auto_1937 - HOIST
      ?auto_1938 - PLACE
      ?auto_1940 - PLACE
      ?auto_1941 - HOIST
      ?auto_1942 - SURFACE
      ?auto_1939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1937 ?auto_1938 ) ( SURFACE-AT ?auto_1935 ?auto_1938 ) ( CLEAR ?auto_1935 ) ( IS-CRATE ?auto_1936 ) ( AVAILABLE ?auto_1937 ) ( not ( = ?auto_1940 ?auto_1938 ) ) ( HOIST-AT ?auto_1941 ?auto_1940 ) ( AVAILABLE ?auto_1941 ) ( SURFACE-AT ?auto_1936 ?auto_1940 ) ( ON ?auto_1936 ?auto_1942 ) ( CLEAR ?auto_1936 ) ( TRUCK-AT ?auto_1939 ?auto_1938 ) ( not ( = ?auto_1935 ?auto_1936 ) ) ( not ( = ?auto_1935 ?auto_1942 ) ) ( not ( = ?auto_1936 ?auto_1942 ) ) ( not ( = ?auto_1937 ?auto_1941 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1939 ?auto_1938 ?auto_1940 )
      ( !LIFT ?auto_1941 ?auto_1936 ?auto_1942 ?auto_1940 )
      ( !LOAD ?auto_1941 ?auto_1936 ?auto_1939 ?auto_1940 )
      ( !DRIVE ?auto_1939 ?auto_1940 ?auto_1938 )
      ( !UNLOAD ?auto_1937 ?auto_1936 ?auto_1939 ?auto_1938 )
      ( !DROP ?auto_1937 ?auto_1936 ?auto_1935 ?auto_1938 )
      ( MAKE-1CRATE-VERIFY ?auto_1935 ?auto_1936 ) )
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
      ?auto_1959 - HOIST
      ?auto_1957 - PLACE
      ?auto_1958 - PLACE
      ?auto_1961 - HOIST
      ?auto_1960 - SURFACE
      ?auto_1967 - PLACE
      ?auto_1969 - HOIST
      ?auto_1975 - SURFACE
      ?auto_1973 - PLACE
      ?auto_1964 - HOIST
      ?auto_1963 - SURFACE
      ?auto_1970 - SURFACE
      ?auto_1974 - PLACE
      ?auto_1966 - HOIST
      ?auto_1968 - SURFACE
      ?auto_1972 - PLACE
      ?auto_1971 - HOIST
      ?auto_1965 - SURFACE
      ?auto_1962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1959 ?auto_1957 ) ( IS-CRATE ?auto_1956 ) ( not ( = ?auto_1958 ?auto_1957 ) ) ( HOIST-AT ?auto_1961 ?auto_1958 ) ( AVAILABLE ?auto_1961 ) ( SURFACE-AT ?auto_1956 ?auto_1958 ) ( ON ?auto_1956 ?auto_1960 ) ( CLEAR ?auto_1956 ) ( not ( = ?auto_1955 ?auto_1956 ) ) ( not ( = ?auto_1955 ?auto_1960 ) ) ( not ( = ?auto_1956 ?auto_1960 ) ) ( not ( = ?auto_1959 ?auto_1961 ) ) ( IS-CRATE ?auto_1955 ) ( not ( = ?auto_1967 ?auto_1957 ) ) ( HOIST-AT ?auto_1969 ?auto_1967 ) ( SURFACE-AT ?auto_1955 ?auto_1967 ) ( ON ?auto_1955 ?auto_1975 ) ( CLEAR ?auto_1955 ) ( not ( = ?auto_1954 ?auto_1955 ) ) ( not ( = ?auto_1954 ?auto_1975 ) ) ( not ( = ?auto_1955 ?auto_1975 ) ) ( not ( = ?auto_1959 ?auto_1969 ) ) ( IS-CRATE ?auto_1954 ) ( not ( = ?auto_1973 ?auto_1957 ) ) ( HOIST-AT ?auto_1964 ?auto_1973 ) ( AVAILABLE ?auto_1964 ) ( SURFACE-AT ?auto_1954 ?auto_1973 ) ( ON ?auto_1954 ?auto_1963 ) ( CLEAR ?auto_1954 ) ( not ( = ?auto_1953 ?auto_1954 ) ) ( not ( = ?auto_1953 ?auto_1963 ) ) ( not ( = ?auto_1954 ?auto_1963 ) ) ( not ( = ?auto_1959 ?auto_1964 ) ) ( IS-CRATE ?auto_1953 ) ( AVAILABLE ?auto_1969 ) ( SURFACE-AT ?auto_1953 ?auto_1967 ) ( ON ?auto_1953 ?auto_1970 ) ( CLEAR ?auto_1953 ) ( not ( = ?auto_1952 ?auto_1953 ) ) ( not ( = ?auto_1952 ?auto_1970 ) ) ( not ( = ?auto_1953 ?auto_1970 ) ) ( IS-CRATE ?auto_1952 ) ( not ( = ?auto_1974 ?auto_1957 ) ) ( HOIST-AT ?auto_1966 ?auto_1974 ) ( AVAILABLE ?auto_1966 ) ( SURFACE-AT ?auto_1952 ?auto_1974 ) ( ON ?auto_1952 ?auto_1968 ) ( CLEAR ?auto_1952 ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1968 ) ) ( not ( = ?auto_1952 ?auto_1968 ) ) ( not ( = ?auto_1959 ?auto_1966 ) ) ( SURFACE-AT ?auto_1950 ?auto_1957 ) ( CLEAR ?auto_1950 ) ( IS-CRATE ?auto_1951 ) ( AVAILABLE ?auto_1959 ) ( not ( = ?auto_1972 ?auto_1957 ) ) ( HOIST-AT ?auto_1971 ?auto_1972 ) ( AVAILABLE ?auto_1971 ) ( SURFACE-AT ?auto_1951 ?auto_1972 ) ( ON ?auto_1951 ?auto_1965 ) ( CLEAR ?auto_1951 ) ( TRUCK-AT ?auto_1962 ?auto_1957 ) ( not ( = ?auto_1950 ?auto_1951 ) ) ( not ( = ?auto_1950 ?auto_1965 ) ) ( not ( = ?auto_1951 ?auto_1965 ) ) ( not ( = ?auto_1959 ?auto_1971 ) ) ( not ( = ?auto_1950 ?auto_1952 ) ) ( not ( = ?auto_1950 ?auto_1968 ) ) ( not ( = ?auto_1952 ?auto_1965 ) ) ( not ( = ?auto_1974 ?auto_1972 ) ) ( not ( = ?auto_1966 ?auto_1971 ) ) ( not ( = ?auto_1968 ?auto_1965 ) ) ( not ( = ?auto_1950 ?auto_1953 ) ) ( not ( = ?auto_1950 ?auto_1970 ) ) ( not ( = ?auto_1951 ?auto_1953 ) ) ( not ( = ?auto_1951 ?auto_1970 ) ) ( not ( = ?auto_1953 ?auto_1968 ) ) ( not ( = ?auto_1953 ?auto_1965 ) ) ( not ( = ?auto_1967 ?auto_1974 ) ) ( not ( = ?auto_1967 ?auto_1972 ) ) ( not ( = ?auto_1969 ?auto_1966 ) ) ( not ( = ?auto_1969 ?auto_1971 ) ) ( not ( = ?auto_1970 ?auto_1968 ) ) ( not ( = ?auto_1970 ?auto_1965 ) ) ( not ( = ?auto_1950 ?auto_1954 ) ) ( not ( = ?auto_1950 ?auto_1963 ) ) ( not ( = ?auto_1951 ?auto_1954 ) ) ( not ( = ?auto_1951 ?auto_1963 ) ) ( not ( = ?auto_1952 ?auto_1954 ) ) ( not ( = ?auto_1952 ?auto_1963 ) ) ( not ( = ?auto_1954 ?auto_1970 ) ) ( not ( = ?auto_1954 ?auto_1968 ) ) ( not ( = ?auto_1954 ?auto_1965 ) ) ( not ( = ?auto_1973 ?auto_1967 ) ) ( not ( = ?auto_1973 ?auto_1974 ) ) ( not ( = ?auto_1973 ?auto_1972 ) ) ( not ( = ?auto_1964 ?auto_1969 ) ) ( not ( = ?auto_1964 ?auto_1966 ) ) ( not ( = ?auto_1964 ?auto_1971 ) ) ( not ( = ?auto_1963 ?auto_1970 ) ) ( not ( = ?auto_1963 ?auto_1968 ) ) ( not ( = ?auto_1963 ?auto_1965 ) ) ( not ( = ?auto_1950 ?auto_1955 ) ) ( not ( = ?auto_1950 ?auto_1975 ) ) ( not ( = ?auto_1951 ?auto_1955 ) ) ( not ( = ?auto_1951 ?auto_1975 ) ) ( not ( = ?auto_1952 ?auto_1955 ) ) ( not ( = ?auto_1952 ?auto_1975 ) ) ( not ( = ?auto_1953 ?auto_1955 ) ) ( not ( = ?auto_1953 ?auto_1975 ) ) ( not ( = ?auto_1955 ?auto_1963 ) ) ( not ( = ?auto_1955 ?auto_1970 ) ) ( not ( = ?auto_1955 ?auto_1968 ) ) ( not ( = ?auto_1955 ?auto_1965 ) ) ( not ( = ?auto_1975 ?auto_1963 ) ) ( not ( = ?auto_1975 ?auto_1970 ) ) ( not ( = ?auto_1975 ?auto_1968 ) ) ( not ( = ?auto_1975 ?auto_1965 ) ) ( not ( = ?auto_1950 ?auto_1956 ) ) ( not ( = ?auto_1950 ?auto_1960 ) ) ( not ( = ?auto_1951 ?auto_1956 ) ) ( not ( = ?auto_1951 ?auto_1960 ) ) ( not ( = ?auto_1952 ?auto_1956 ) ) ( not ( = ?auto_1952 ?auto_1960 ) ) ( not ( = ?auto_1953 ?auto_1956 ) ) ( not ( = ?auto_1953 ?auto_1960 ) ) ( not ( = ?auto_1954 ?auto_1956 ) ) ( not ( = ?auto_1954 ?auto_1960 ) ) ( not ( = ?auto_1956 ?auto_1975 ) ) ( not ( = ?auto_1956 ?auto_1963 ) ) ( not ( = ?auto_1956 ?auto_1970 ) ) ( not ( = ?auto_1956 ?auto_1968 ) ) ( not ( = ?auto_1956 ?auto_1965 ) ) ( not ( = ?auto_1958 ?auto_1967 ) ) ( not ( = ?auto_1958 ?auto_1973 ) ) ( not ( = ?auto_1958 ?auto_1974 ) ) ( not ( = ?auto_1958 ?auto_1972 ) ) ( not ( = ?auto_1961 ?auto_1969 ) ) ( not ( = ?auto_1961 ?auto_1964 ) ) ( not ( = ?auto_1961 ?auto_1966 ) ) ( not ( = ?auto_1961 ?auto_1971 ) ) ( not ( = ?auto_1960 ?auto_1975 ) ) ( not ( = ?auto_1960 ?auto_1963 ) ) ( not ( = ?auto_1960 ?auto_1970 ) ) ( not ( = ?auto_1960 ?auto_1968 ) ) ( not ( = ?auto_1960 ?auto_1965 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1950 ?auto_1951 ?auto_1952 ?auto_1953 ?auto_1954 ?auto_1955 )
      ( MAKE-1CRATE ?auto_1955 ?auto_1956 )
      ( MAKE-6CRATE-VERIFY ?auto_1950 ?auto_1951 ?auto_1952 ?auto_1953 ?auto_1954 ?auto_1955 ?auto_1956 ) )
  )

)

