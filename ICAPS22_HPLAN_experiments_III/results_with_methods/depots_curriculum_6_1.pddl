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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1831 - SURFACE
      ?auto_1832 - SURFACE
    )
    :vars
    (
      ?auto_1833 - HOIST
      ?auto_1834 - PLACE
      ?auto_1836 - PLACE
      ?auto_1837 - HOIST
      ?auto_1838 - SURFACE
      ?auto_1835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1833 ?auto_1834 ) ( SURFACE-AT ?auto_1831 ?auto_1834 ) ( CLEAR ?auto_1831 ) ( IS-CRATE ?auto_1832 ) ( AVAILABLE ?auto_1833 ) ( not ( = ?auto_1836 ?auto_1834 ) ) ( HOIST-AT ?auto_1837 ?auto_1836 ) ( AVAILABLE ?auto_1837 ) ( SURFACE-AT ?auto_1832 ?auto_1836 ) ( ON ?auto_1832 ?auto_1838 ) ( CLEAR ?auto_1832 ) ( TRUCK-AT ?auto_1835 ?auto_1834 ) ( not ( = ?auto_1831 ?auto_1832 ) ) ( not ( = ?auto_1831 ?auto_1838 ) ) ( not ( = ?auto_1832 ?auto_1838 ) ) ( not ( = ?auto_1833 ?auto_1837 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1835 ?auto_1834 ?auto_1836 )
      ( !LIFT ?auto_1837 ?auto_1832 ?auto_1838 ?auto_1836 )
      ( !LOAD ?auto_1837 ?auto_1832 ?auto_1835 ?auto_1836 )
      ( !DRIVE ?auto_1835 ?auto_1836 ?auto_1834 )
      ( !UNLOAD ?auto_1833 ?auto_1832 ?auto_1835 ?auto_1834 )
      ( !DROP ?auto_1833 ?auto_1832 ?auto_1831 ?auto_1834 )
      ( MAKE-1CRATE-VERIFY ?auto_1831 ?auto_1832 ) )
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
      ?auto_1847 - HOIST
      ?auto_1849 - PLACE
      ?auto_1845 - PLACE
      ?auto_1850 - HOIST
      ?auto_1846 - SURFACE
      ?auto_1853 - PLACE
      ?auto_1851 - HOIST
      ?auto_1852 - SURFACE
      ?auto_1848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847 ?auto_1849 ) ( IS-CRATE ?auto_1844 ) ( not ( = ?auto_1845 ?auto_1849 ) ) ( HOIST-AT ?auto_1850 ?auto_1845 ) ( AVAILABLE ?auto_1850 ) ( SURFACE-AT ?auto_1844 ?auto_1845 ) ( ON ?auto_1844 ?auto_1846 ) ( CLEAR ?auto_1844 ) ( not ( = ?auto_1843 ?auto_1844 ) ) ( not ( = ?auto_1843 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( not ( = ?auto_1847 ?auto_1850 ) ) ( SURFACE-AT ?auto_1842 ?auto_1849 ) ( CLEAR ?auto_1842 ) ( IS-CRATE ?auto_1843 ) ( AVAILABLE ?auto_1847 ) ( not ( = ?auto_1853 ?auto_1849 ) ) ( HOIST-AT ?auto_1851 ?auto_1853 ) ( AVAILABLE ?auto_1851 ) ( SURFACE-AT ?auto_1843 ?auto_1853 ) ( ON ?auto_1843 ?auto_1852 ) ( CLEAR ?auto_1843 ) ( TRUCK-AT ?auto_1848 ?auto_1849 ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1852 ) ) ( not ( = ?auto_1843 ?auto_1852 ) ) ( not ( = ?auto_1847 ?auto_1851 ) ) ( not ( = ?auto_1842 ?auto_1844 ) ) ( not ( = ?auto_1842 ?auto_1846 ) ) ( not ( = ?auto_1844 ?auto_1852 ) ) ( not ( = ?auto_1845 ?auto_1853 ) ) ( not ( = ?auto_1850 ?auto_1851 ) ) ( not ( = ?auto_1846 ?auto_1852 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1842 ?auto_1843 )
      ( MAKE-1CRATE ?auto_1843 ?auto_1844 )
      ( MAKE-2CRATE-VERIFY ?auto_1842 ?auto_1843 ?auto_1844 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1856 - SURFACE
      ?auto_1857 - SURFACE
    )
    :vars
    (
      ?auto_1858 - HOIST
      ?auto_1859 - PLACE
      ?auto_1861 - PLACE
      ?auto_1862 - HOIST
      ?auto_1863 - SURFACE
      ?auto_1860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1858 ?auto_1859 ) ( SURFACE-AT ?auto_1856 ?auto_1859 ) ( CLEAR ?auto_1856 ) ( IS-CRATE ?auto_1857 ) ( AVAILABLE ?auto_1858 ) ( not ( = ?auto_1861 ?auto_1859 ) ) ( HOIST-AT ?auto_1862 ?auto_1861 ) ( AVAILABLE ?auto_1862 ) ( SURFACE-AT ?auto_1857 ?auto_1861 ) ( ON ?auto_1857 ?auto_1863 ) ( CLEAR ?auto_1857 ) ( TRUCK-AT ?auto_1860 ?auto_1859 ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( not ( = ?auto_1856 ?auto_1863 ) ) ( not ( = ?auto_1857 ?auto_1863 ) ) ( not ( = ?auto_1858 ?auto_1862 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1860 ?auto_1859 ?auto_1861 )
      ( !LIFT ?auto_1862 ?auto_1857 ?auto_1863 ?auto_1861 )
      ( !LOAD ?auto_1862 ?auto_1857 ?auto_1860 ?auto_1861 )
      ( !DRIVE ?auto_1860 ?auto_1861 ?auto_1859 )
      ( !UNLOAD ?auto_1858 ?auto_1857 ?auto_1860 ?auto_1859 )
      ( !DROP ?auto_1858 ?auto_1857 ?auto_1856 ?auto_1859 )
      ( MAKE-1CRATE-VERIFY ?auto_1856 ?auto_1857 ) )
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
      ?auto_1872 - HOIST
      ?auto_1875 - PLACE
      ?auto_1873 - PLACE
      ?auto_1876 - HOIST
      ?auto_1877 - SURFACE
      ?auto_1878 - PLACE
      ?auto_1879 - HOIST
      ?auto_1880 - SURFACE
      ?auto_1881 - SURFACE
      ?auto_1874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1872 ?auto_1875 ) ( IS-CRATE ?auto_1871 ) ( not ( = ?auto_1873 ?auto_1875 ) ) ( HOIST-AT ?auto_1876 ?auto_1873 ) ( SURFACE-AT ?auto_1871 ?auto_1873 ) ( ON ?auto_1871 ?auto_1877 ) ( CLEAR ?auto_1871 ) ( not ( = ?auto_1870 ?auto_1871 ) ) ( not ( = ?auto_1870 ?auto_1877 ) ) ( not ( = ?auto_1871 ?auto_1877 ) ) ( not ( = ?auto_1872 ?auto_1876 ) ) ( IS-CRATE ?auto_1870 ) ( not ( = ?auto_1878 ?auto_1875 ) ) ( HOIST-AT ?auto_1879 ?auto_1878 ) ( AVAILABLE ?auto_1879 ) ( SURFACE-AT ?auto_1870 ?auto_1878 ) ( ON ?auto_1870 ?auto_1880 ) ( CLEAR ?auto_1870 ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( not ( = ?auto_1869 ?auto_1880 ) ) ( not ( = ?auto_1870 ?auto_1880 ) ) ( not ( = ?auto_1872 ?auto_1879 ) ) ( SURFACE-AT ?auto_1868 ?auto_1875 ) ( CLEAR ?auto_1868 ) ( IS-CRATE ?auto_1869 ) ( AVAILABLE ?auto_1872 ) ( AVAILABLE ?auto_1876 ) ( SURFACE-AT ?auto_1869 ?auto_1873 ) ( ON ?auto_1869 ?auto_1881 ) ( CLEAR ?auto_1869 ) ( TRUCK-AT ?auto_1874 ?auto_1875 ) ( not ( = ?auto_1868 ?auto_1869 ) ) ( not ( = ?auto_1868 ?auto_1881 ) ) ( not ( = ?auto_1869 ?auto_1881 ) ) ( not ( = ?auto_1868 ?auto_1870 ) ) ( not ( = ?auto_1868 ?auto_1880 ) ) ( not ( = ?auto_1870 ?auto_1881 ) ) ( not ( = ?auto_1878 ?auto_1873 ) ) ( not ( = ?auto_1879 ?auto_1876 ) ) ( not ( = ?auto_1880 ?auto_1881 ) ) ( not ( = ?auto_1868 ?auto_1871 ) ) ( not ( = ?auto_1868 ?auto_1877 ) ) ( not ( = ?auto_1869 ?auto_1871 ) ) ( not ( = ?auto_1869 ?auto_1877 ) ) ( not ( = ?auto_1871 ?auto_1880 ) ) ( not ( = ?auto_1871 ?auto_1881 ) ) ( not ( = ?auto_1877 ?auto_1880 ) ) ( not ( = ?auto_1877 ?auto_1881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1868 ?auto_1869 ?auto_1870 )
      ( MAKE-1CRATE ?auto_1870 ?auto_1871 )
      ( MAKE-3CRATE-VERIFY ?auto_1868 ?auto_1869 ?auto_1870 ?auto_1871 ) )
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
      ?auto_1889 - PLACE
      ?auto_1890 - HOIST
      ?auto_1891 - SURFACE
      ?auto_1888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1886 ?auto_1887 ) ( SURFACE-AT ?auto_1884 ?auto_1887 ) ( CLEAR ?auto_1884 ) ( IS-CRATE ?auto_1885 ) ( AVAILABLE ?auto_1886 ) ( not ( = ?auto_1889 ?auto_1887 ) ) ( HOIST-AT ?auto_1890 ?auto_1889 ) ( AVAILABLE ?auto_1890 ) ( SURFACE-AT ?auto_1885 ?auto_1889 ) ( ON ?auto_1885 ?auto_1891 ) ( CLEAR ?auto_1885 ) ( TRUCK-AT ?auto_1888 ?auto_1887 ) ( not ( = ?auto_1884 ?auto_1885 ) ) ( not ( = ?auto_1884 ?auto_1891 ) ) ( not ( = ?auto_1885 ?auto_1891 ) ) ( not ( = ?auto_1886 ?auto_1890 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1888 ?auto_1887 ?auto_1889 )
      ( !LIFT ?auto_1890 ?auto_1885 ?auto_1891 ?auto_1889 )
      ( !LOAD ?auto_1890 ?auto_1885 ?auto_1888 ?auto_1889 )
      ( !DRIVE ?auto_1888 ?auto_1889 ?auto_1887 )
      ( !UNLOAD ?auto_1886 ?auto_1885 ?auto_1888 ?auto_1887 )
      ( !DROP ?auto_1886 ?auto_1885 ?auto_1884 ?auto_1887 )
      ( MAKE-1CRATE-VERIFY ?auto_1884 ?auto_1885 ) )
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
      ?auto_1902 - HOIST
      ?auto_1907 - PLACE
      ?auto_1906 - PLACE
      ?auto_1905 - HOIST
      ?auto_1904 - SURFACE
      ?auto_1909 - PLACE
      ?auto_1912 - HOIST
      ?auto_1911 - SURFACE
      ?auto_1910 - SURFACE
      ?auto_1908 - SURFACE
      ?auto_1903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1902 ?auto_1907 ) ( IS-CRATE ?auto_1901 ) ( not ( = ?auto_1906 ?auto_1907 ) ) ( HOIST-AT ?auto_1905 ?auto_1906 ) ( SURFACE-AT ?auto_1901 ?auto_1906 ) ( ON ?auto_1901 ?auto_1904 ) ( CLEAR ?auto_1901 ) ( not ( = ?auto_1900 ?auto_1901 ) ) ( not ( = ?auto_1900 ?auto_1904 ) ) ( not ( = ?auto_1901 ?auto_1904 ) ) ( not ( = ?auto_1902 ?auto_1905 ) ) ( IS-CRATE ?auto_1900 ) ( not ( = ?auto_1909 ?auto_1907 ) ) ( HOIST-AT ?auto_1912 ?auto_1909 ) ( SURFACE-AT ?auto_1900 ?auto_1909 ) ( ON ?auto_1900 ?auto_1911 ) ( CLEAR ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1900 ) ) ( not ( = ?auto_1899 ?auto_1911 ) ) ( not ( = ?auto_1900 ?auto_1911 ) ) ( not ( = ?auto_1902 ?auto_1912 ) ) ( IS-CRATE ?auto_1899 ) ( AVAILABLE ?auto_1905 ) ( SURFACE-AT ?auto_1899 ?auto_1906 ) ( ON ?auto_1899 ?auto_1910 ) ( CLEAR ?auto_1899 ) ( not ( = ?auto_1898 ?auto_1899 ) ) ( not ( = ?auto_1898 ?auto_1910 ) ) ( not ( = ?auto_1899 ?auto_1910 ) ) ( SURFACE-AT ?auto_1897 ?auto_1907 ) ( CLEAR ?auto_1897 ) ( IS-CRATE ?auto_1898 ) ( AVAILABLE ?auto_1902 ) ( AVAILABLE ?auto_1912 ) ( SURFACE-AT ?auto_1898 ?auto_1909 ) ( ON ?auto_1898 ?auto_1908 ) ( CLEAR ?auto_1898 ) ( TRUCK-AT ?auto_1903 ?auto_1907 ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( not ( = ?auto_1897 ?auto_1908 ) ) ( not ( = ?auto_1898 ?auto_1908 ) ) ( not ( = ?auto_1897 ?auto_1899 ) ) ( not ( = ?auto_1897 ?auto_1910 ) ) ( not ( = ?auto_1899 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1909 ) ) ( not ( = ?auto_1905 ?auto_1912 ) ) ( not ( = ?auto_1910 ?auto_1908 ) ) ( not ( = ?auto_1897 ?auto_1900 ) ) ( not ( = ?auto_1897 ?auto_1911 ) ) ( not ( = ?auto_1898 ?auto_1900 ) ) ( not ( = ?auto_1898 ?auto_1911 ) ) ( not ( = ?auto_1900 ?auto_1910 ) ) ( not ( = ?auto_1900 ?auto_1908 ) ) ( not ( = ?auto_1911 ?auto_1910 ) ) ( not ( = ?auto_1911 ?auto_1908 ) ) ( not ( = ?auto_1897 ?auto_1901 ) ) ( not ( = ?auto_1897 ?auto_1904 ) ) ( not ( = ?auto_1898 ?auto_1901 ) ) ( not ( = ?auto_1898 ?auto_1904 ) ) ( not ( = ?auto_1899 ?auto_1901 ) ) ( not ( = ?auto_1899 ?auto_1904 ) ) ( not ( = ?auto_1901 ?auto_1911 ) ) ( not ( = ?auto_1901 ?auto_1910 ) ) ( not ( = ?auto_1901 ?auto_1908 ) ) ( not ( = ?auto_1904 ?auto_1911 ) ) ( not ( = ?auto_1904 ?auto_1910 ) ) ( not ( = ?auto_1904 ?auto_1908 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1897 ?auto_1898 ?auto_1899 ?auto_1900 )
      ( MAKE-1CRATE ?auto_1900 ?auto_1901 )
      ( MAKE-4CRATE-VERIFY ?auto_1897 ?auto_1898 ?auto_1899 ?auto_1900 ?auto_1901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915 - SURFACE
      ?auto_1916 - SURFACE
    )
    :vars
    (
      ?auto_1917 - HOIST
      ?auto_1918 - PLACE
      ?auto_1920 - PLACE
      ?auto_1921 - HOIST
      ?auto_1922 - SURFACE
      ?auto_1919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917 ?auto_1918 ) ( SURFACE-AT ?auto_1915 ?auto_1918 ) ( CLEAR ?auto_1915 ) ( IS-CRATE ?auto_1916 ) ( AVAILABLE ?auto_1917 ) ( not ( = ?auto_1920 ?auto_1918 ) ) ( HOIST-AT ?auto_1921 ?auto_1920 ) ( AVAILABLE ?auto_1921 ) ( SURFACE-AT ?auto_1916 ?auto_1920 ) ( ON ?auto_1916 ?auto_1922 ) ( CLEAR ?auto_1916 ) ( TRUCK-AT ?auto_1919 ?auto_1918 ) ( not ( = ?auto_1915 ?auto_1916 ) ) ( not ( = ?auto_1915 ?auto_1922 ) ) ( not ( = ?auto_1916 ?auto_1922 ) ) ( not ( = ?auto_1917 ?auto_1921 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1919 ?auto_1918 ?auto_1920 )
      ( !LIFT ?auto_1921 ?auto_1916 ?auto_1922 ?auto_1920 )
      ( !LOAD ?auto_1921 ?auto_1916 ?auto_1919 ?auto_1920 )
      ( !DRIVE ?auto_1919 ?auto_1920 ?auto_1918 )
      ( !UNLOAD ?auto_1917 ?auto_1916 ?auto_1919 ?auto_1918 )
      ( !DROP ?auto_1917 ?auto_1916 ?auto_1915 ?auto_1918 )
      ( MAKE-1CRATE-VERIFY ?auto_1915 ?auto_1916 ) )
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
      ?auto_1938 - PLACE
      ?auto_1939 - PLACE
      ?auto_1935 - HOIST
      ?auto_1940 - SURFACE
      ?auto_1946 - PLACE
      ?auto_1948 - HOIST
      ?auto_1944 - SURFACE
      ?auto_1942 - PLACE
      ?auto_1947 - HOIST
      ?auto_1941 - SURFACE
      ?auto_1945 - SURFACE
      ?auto_1943 - SURFACE
      ?auto_1937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1936 ?auto_1938 ) ( IS-CRATE ?auto_1934 ) ( not ( = ?auto_1939 ?auto_1938 ) ) ( HOIST-AT ?auto_1935 ?auto_1939 ) ( AVAILABLE ?auto_1935 ) ( SURFACE-AT ?auto_1934 ?auto_1939 ) ( ON ?auto_1934 ?auto_1940 ) ( CLEAR ?auto_1934 ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1933 ?auto_1940 ) ) ( not ( = ?auto_1934 ?auto_1940 ) ) ( not ( = ?auto_1936 ?auto_1935 ) ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1946 ?auto_1938 ) ) ( HOIST-AT ?auto_1948 ?auto_1946 ) ( SURFACE-AT ?auto_1933 ?auto_1946 ) ( ON ?auto_1933 ?auto_1944 ) ( CLEAR ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1932 ?auto_1944 ) ) ( not ( = ?auto_1933 ?auto_1944 ) ) ( not ( = ?auto_1936 ?auto_1948 ) ) ( IS-CRATE ?auto_1932 ) ( not ( = ?auto_1942 ?auto_1938 ) ) ( HOIST-AT ?auto_1947 ?auto_1942 ) ( SURFACE-AT ?auto_1932 ?auto_1942 ) ( ON ?auto_1932 ?auto_1941 ) ( CLEAR ?auto_1932 ) ( not ( = ?auto_1931 ?auto_1932 ) ) ( not ( = ?auto_1931 ?auto_1941 ) ) ( not ( = ?auto_1932 ?auto_1941 ) ) ( not ( = ?auto_1936 ?auto_1947 ) ) ( IS-CRATE ?auto_1931 ) ( AVAILABLE ?auto_1948 ) ( SURFACE-AT ?auto_1931 ?auto_1946 ) ( ON ?auto_1931 ?auto_1945 ) ( CLEAR ?auto_1931 ) ( not ( = ?auto_1930 ?auto_1931 ) ) ( not ( = ?auto_1930 ?auto_1945 ) ) ( not ( = ?auto_1931 ?auto_1945 ) ) ( SURFACE-AT ?auto_1929 ?auto_1938 ) ( CLEAR ?auto_1929 ) ( IS-CRATE ?auto_1930 ) ( AVAILABLE ?auto_1936 ) ( AVAILABLE ?auto_1947 ) ( SURFACE-AT ?auto_1930 ?auto_1942 ) ( ON ?auto_1930 ?auto_1943 ) ( CLEAR ?auto_1930 ) ( TRUCK-AT ?auto_1937 ?auto_1938 ) ( not ( = ?auto_1929 ?auto_1930 ) ) ( not ( = ?auto_1929 ?auto_1943 ) ) ( not ( = ?auto_1930 ?auto_1943 ) ) ( not ( = ?auto_1929 ?auto_1931 ) ) ( not ( = ?auto_1929 ?auto_1945 ) ) ( not ( = ?auto_1931 ?auto_1943 ) ) ( not ( = ?auto_1946 ?auto_1942 ) ) ( not ( = ?auto_1948 ?auto_1947 ) ) ( not ( = ?auto_1945 ?auto_1943 ) ) ( not ( = ?auto_1929 ?auto_1932 ) ) ( not ( = ?auto_1929 ?auto_1941 ) ) ( not ( = ?auto_1930 ?auto_1932 ) ) ( not ( = ?auto_1930 ?auto_1941 ) ) ( not ( = ?auto_1932 ?auto_1945 ) ) ( not ( = ?auto_1932 ?auto_1943 ) ) ( not ( = ?auto_1941 ?auto_1945 ) ) ( not ( = ?auto_1941 ?auto_1943 ) ) ( not ( = ?auto_1929 ?auto_1933 ) ) ( not ( = ?auto_1929 ?auto_1944 ) ) ( not ( = ?auto_1930 ?auto_1933 ) ) ( not ( = ?auto_1930 ?auto_1944 ) ) ( not ( = ?auto_1931 ?auto_1933 ) ) ( not ( = ?auto_1931 ?auto_1944 ) ) ( not ( = ?auto_1933 ?auto_1941 ) ) ( not ( = ?auto_1933 ?auto_1945 ) ) ( not ( = ?auto_1933 ?auto_1943 ) ) ( not ( = ?auto_1944 ?auto_1941 ) ) ( not ( = ?auto_1944 ?auto_1945 ) ) ( not ( = ?auto_1944 ?auto_1943 ) ) ( not ( = ?auto_1929 ?auto_1934 ) ) ( not ( = ?auto_1929 ?auto_1940 ) ) ( not ( = ?auto_1930 ?auto_1934 ) ) ( not ( = ?auto_1930 ?auto_1940 ) ) ( not ( = ?auto_1931 ?auto_1934 ) ) ( not ( = ?auto_1931 ?auto_1940 ) ) ( not ( = ?auto_1932 ?auto_1934 ) ) ( not ( = ?auto_1932 ?auto_1940 ) ) ( not ( = ?auto_1934 ?auto_1944 ) ) ( not ( = ?auto_1934 ?auto_1941 ) ) ( not ( = ?auto_1934 ?auto_1945 ) ) ( not ( = ?auto_1934 ?auto_1943 ) ) ( not ( = ?auto_1939 ?auto_1946 ) ) ( not ( = ?auto_1939 ?auto_1942 ) ) ( not ( = ?auto_1935 ?auto_1948 ) ) ( not ( = ?auto_1935 ?auto_1947 ) ) ( not ( = ?auto_1940 ?auto_1944 ) ) ( not ( = ?auto_1940 ?auto_1941 ) ) ( not ( = ?auto_1940 ?auto_1945 ) ) ( not ( = ?auto_1940 ?auto_1943 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1929 ?auto_1930 ?auto_1931 ?auto_1932 ?auto_1933 )
      ( MAKE-1CRATE ?auto_1933 ?auto_1934 )
      ( MAKE-5CRATE-VERIFY ?auto_1929 ?auto_1930 ?auto_1931 ?auto_1932 ?auto_1933 ?auto_1934 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1951 - SURFACE
      ?auto_1952 - SURFACE
    )
    :vars
    (
      ?auto_1953 - HOIST
      ?auto_1954 - PLACE
      ?auto_1956 - PLACE
      ?auto_1957 - HOIST
      ?auto_1958 - SURFACE
      ?auto_1955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953 ?auto_1954 ) ( SURFACE-AT ?auto_1951 ?auto_1954 ) ( CLEAR ?auto_1951 ) ( IS-CRATE ?auto_1952 ) ( AVAILABLE ?auto_1953 ) ( not ( = ?auto_1956 ?auto_1954 ) ) ( HOIST-AT ?auto_1957 ?auto_1956 ) ( AVAILABLE ?auto_1957 ) ( SURFACE-AT ?auto_1952 ?auto_1956 ) ( ON ?auto_1952 ?auto_1958 ) ( CLEAR ?auto_1952 ) ( TRUCK-AT ?auto_1955 ?auto_1954 ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1958 ) ) ( not ( = ?auto_1952 ?auto_1958 ) ) ( not ( = ?auto_1953 ?auto_1957 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1955 ?auto_1954 ?auto_1956 )
      ( !LIFT ?auto_1957 ?auto_1952 ?auto_1958 ?auto_1956 )
      ( !LOAD ?auto_1957 ?auto_1952 ?auto_1955 ?auto_1956 )
      ( !DRIVE ?auto_1955 ?auto_1956 ?auto_1954 )
      ( !UNLOAD ?auto_1953 ?auto_1952 ?auto_1955 ?auto_1954 )
      ( !DROP ?auto_1953 ?auto_1952 ?auto_1951 ?auto_1954 )
      ( MAKE-1CRATE-VERIFY ?auto_1951 ?auto_1952 ) )
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
      ?auto_1976 - HOIST
      ?auto_1975 - PLACE
      ?auto_1977 - PLACE
      ?auto_1973 - HOIST
      ?auto_1978 - SURFACE
      ?auto_1982 - PLACE
      ?auto_1981 - HOIST
      ?auto_1980 - SURFACE
      ?auto_1987 - PLACE
      ?auto_1985 - HOIST
      ?auto_1983 - SURFACE
      ?auto_1979 - SURFACE
      ?auto_1986 - SURFACE
      ?auto_1984 - SURFACE
      ?auto_1974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1976 ?auto_1975 ) ( IS-CRATE ?auto_1972 ) ( not ( = ?auto_1977 ?auto_1975 ) ) ( HOIST-AT ?auto_1973 ?auto_1977 ) ( SURFACE-AT ?auto_1972 ?auto_1977 ) ( ON ?auto_1972 ?auto_1978 ) ( CLEAR ?auto_1972 ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1971 ?auto_1978 ) ) ( not ( = ?auto_1972 ?auto_1978 ) ) ( not ( = ?auto_1976 ?auto_1973 ) ) ( IS-CRATE ?auto_1971 ) ( not ( = ?auto_1982 ?auto_1975 ) ) ( HOIST-AT ?auto_1981 ?auto_1982 ) ( AVAILABLE ?auto_1981 ) ( SURFACE-AT ?auto_1971 ?auto_1982 ) ( ON ?auto_1971 ?auto_1980 ) ( CLEAR ?auto_1971 ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( not ( = ?auto_1970 ?auto_1980 ) ) ( not ( = ?auto_1971 ?auto_1980 ) ) ( not ( = ?auto_1976 ?auto_1981 ) ) ( IS-CRATE ?auto_1970 ) ( not ( = ?auto_1987 ?auto_1975 ) ) ( HOIST-AT ?auto_1985 ?auto_1987 ) ( SURFACE-AT ?auto_1970 ?auto_1987 ) ( ON ?auto_1970 ?auto_1983 ) ( CLEAR ?auto_1970 ) ( not ( = ?auto_1969 ?auto_1970 ) ) ( not ( = ?auto_1969 ?auto_1983 ) ) ( not ( = ?auto_1970 ?auto_1983 ) ) ( not ( = ?auto_1976 ?auto_1985 ) ) ( IS-CRATE ?auto_1969 ) ( SURFACE-AT ?auto_1969 ?auto_1977 ) ( ON ?auto_1969 ?auto_1979 ) ( CLEAR ?auto_1969 ) ( not ( = ?auto_1968 ?auto_1969 ) ) ( not ( = ?auto_1968 ?auto_1979 ) ) ( not ( = ?auto_1969 ?auto_1979 ) ) ( IS-CRATE ?auto_1968 ) ( AVAILABLE ?auto_1985 ) ( SURFACE-AT ?auto_1968 ?auto_1987 ) ( ON ?auto_1968 ?auto_1986 ) ( CLEAR ?auto_1968 ) ( not ( = ?auto_1967 ?auto_1968 ) ) ( not ( = ?auto_1967 ?auto_1986 ) ) ( not ( = ?auto_1968 ?auto_1986 ) ) ( SURFACE-AT ?auto_1966 ?auto_1975 ) ( CLEAR ?auto_1966 ) ( IS-CRATE ?auto_1967 ) ( AVAILABLE ?auto_1976 ) ( AVAILABLE ?auto_1973 ) ( SURFACE-AT ?auto_1967 ?auto_1977 ) ( ON ?auto_1967 ?auto_1984 ) ( CLEAR ?auto_1967 ) ( TRUCK-AT ?auto_1974 ?auto_1975 ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1984 ) ) ( not ( = ?auto_1967 ?auto_1984 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1966 ?auto_1986 ) ) ( not ( = ?auto_1968 ?auto_1984 ) ) ( not ( = ?auto_1987 ?auto_1977 ) ) ( not ( = ?auto_1985 ?auto_1973 ) ) ( not ( = ?auto_1986 ?auto_1984 ) ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( not ( = ?auto_1966 ?auto_1979 ) ) ( not ( = ?auto_1967 ?auto_1969 ) ) ( not ( = ?auto_1967 ?auto_1979 ) ) ( not ( = ?auto_1969 ?auto_1986 ) ) ( not ( = ?auto_1969 ?auto_1984 ) ) ( not ( = ?auto_1979 ?auto_1986 ) ) ( not ( = ?auto_1979 ?auto_1984 ) ) ( not ( = ?auto_1966 ?auto_1970 ) ) ( not ( = ?auto_1966 ?auto_1983 ) ) ( not ( = ?auto_1967 ?auto_1970 ) ) ( not ( = ?auto_1967 ?auto_1983 ) ) ( not ( = ?auto_1968 ?auto_1970 ) ) ( not ( = ?auto_1968 ?auto_1983 ) ) ( not ( = ?auto_1970 ?auto_1979 ) ) ( not ( = ?auto_1970 ?auto_1986 ) ) ( not ( = ?auto_1970 ?auto_1984 ) ) ( not ( = ?auto_1983 ?auto_1979 ) ) ( not ( = ?auto_1983 ?auto_1986 ) ) ( not ( = ?auto_1983 ?auto_1984 ) ) ( not ( = ?auto_1966 ?auto_1971 ) ) ( not ( = ?auto_1966 ?auto_1980 ) ) ( not ( = ?auto_1967 ?auto_1971 ) ) ( not ( = ?auto_1967 ?auto_1980 ) ) ( not ( = ?auto_1968 ?auto_1971 ) ) ( not ( = ?auto_1968 ?auto_1980 ) ) ( not ( = ?auto_1969 ?auto_1971 ) ) ( not ( = ?auto_1969 ?auto_1980 ) ) ( not ( = ?auto_1971 ?auto_1983 ) ) ( not ( = ?auto_1971 ?auto_1979 ) ) ( not ( = ?auto_1971 ?auto_1986 ) ) ( not ( = ?auto_1971 ?auto_1984 ) ) ( not ( = ?auto_1982 ?auto_1987 ) ) ( not ( = ?auto_1982 ?auto_1977 ) ) ( not ( = ?auto_1981 ?auto_1985 ) ) ( not ( = ?auto_1981 ?auto_1973 ) ) ( not ( = ?auto_1980 ?auto_1983 ) ) ( not ( = ?auto_1980 ?auto_1979 ) ) ( not ( = ?auto_1980 ?auto_1986 ) ) ( not ( = ?auto_1980 ?auto_1984 ) ) ( not ( = ?auto_1966 ?auto_1972 ) ) ( not ( = ?auto_1966 ?auto_1978 ) ) ( not ( = ?auto_1967 ?auto_1972 ) ) ( not ( = ?auto_1967 ?auto_1978 ) ) ( not ( = ?auto_1968 ?auto_1972 ) ) ( not ( = ?auto_1968 ?auto_1978 ) ) ( not ( = ?auto_1969 ?auto_1972 ) ) ( not ( = ?auto_1969 ?auto_1978 ) ) ( not ( = ?auto_1970 ?auto_1972 ) ) ( not ( = ?auto_1970 ?auto_1978 ) ) ( not ( = ?auto_1972 ?auto_1980 ) ) ( not ( = ?auto_1972 ?auto_1983 ) ) ( not ( = ?auto_1972 ?auto_1979 ) ) ( not ( = ?auto_1972 ?auto_1986 ) ) ( not ( = ?auto_1972 ?auto_1984 ) ) ( not ( = ?auto_1978 ?auto_1980 ) ) ( not ( = ?auto_1978 ?auto_1983 ) ) ( not ( = ?auto_1978 ?auto_1979 ) ) ( not ( = ?auto_1978 ?auto_1986 ) ) ( not ( = ?auto_1978 ?auto_1984 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1966 ?auto_1967 ?auto_1968 ?auto_1969 ?auto_1970 ?auto_1971 )
      ( MAKE-1CRATE ?auto_1971 ?auto_1972 )
      ( MAKE-6CRATE-VERIFY ?auto_1966 ?auto_1967 ?auto_1968 ?auto_1969 ?auto_1970 ?auto_1971 ?auto_1972 ) )
  )

)

