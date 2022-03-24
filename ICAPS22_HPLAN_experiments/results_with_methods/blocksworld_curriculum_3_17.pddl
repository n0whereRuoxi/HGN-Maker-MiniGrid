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
      ?auto_1805 - BLOCK
    )
    :vars
    (
      ?auto_1806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1805 ?auto_1806 ) ( CLEAR ?auto_1805 ) ( HAND-EMPTY ) ( not ( = ?auto_1805 ?auto_1806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1805 ?auto_1806 )
      ( !PUTDOWN ?auto_1805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1808 - BLOCK
    )
    :vars
    (
      ?auto_1809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1808 ?auto_1809 ) ( CLEAR ?auto_1808 ) ( HAND-EMPTY ) ( not ( = ?auto_1808 ?auto_1809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1808 ?auto_1809 )
      ( !PUTDOWN ?auto_1808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1812 - BLOCK
      ?auto_1813 - BLOCK
    )
    :vars
    (
      ?auto_1814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1812 ) ( ON ?auto_1813 ?auto_1814 ) ( CLEAR ?auto_1813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1812 ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1814 ) ) ( not ( = ?auto_1813 ?auto_1814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1813 ?auto_1814 )
      ( !STACK ?auto_1813 ?auto_1812 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1817 - BLOCK
      ?auto_1818 - BLOCK
    )
    :vars
    (
      ?auto_1819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1817 ) ( ON ?auto_1818 ?auto_1819 ) ( CLEAR ?auto_1818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1817 ) ( not ( = ?auto_1817 ?auto_1818 ) ) ( not ( = ?auto_1817 ?auto_1819 ) ) ( not ( = ?auto_1818 ?auto_1819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1818 ?auto_1819 )
      ( !STACK ?auto_1818 ?auto_1817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1822 - BLOCK
      ?auto_1823 - BLOCK
    )
    :vars
    (
      ?auto_1824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1823 ?auto_1824 ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1824 ) ) ( not ( = ?auto_1823 ?auto_1824 ) ) ( ON ?auto_1822 ?auto_1823 ) ( CLEAR ?auto_1822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1822 )
      ( MAKE-2PILE ?auto_1822 ?auto_1823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1827 - BLOCK
      ?auto_1828 - BLOCK
    )
    :vars
    (
      ?auto_1829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1828 ?auto_1829 ) ( not ( = ?auto_1827 ?auto_1828 ) ) ( not ( = ?auto_1827 ?auto_1829 ) ) ( not ( = ?auto_1828 ?auto_1829 ) ) ( ON ?auto_1827 ?auto_1828 ) ( CLEAR ?auto_1827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1827 )
      ( MAKE-2PILE ?auto_1827 ?auto_1828 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1833 - BLOCK
      ?auto_1834 - BLOCK
      ?auto_1835 - BLOCK
    )
    :vars
    (
      ?auto_1836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1834 ) ( ON ?auto_1835 ?auto_1836 ) ( CLEAR ?auto_1835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1833 ) ( ON ?auto_1834 ?auto_1833 ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( not ( = ?auto_1833 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1836 ) ) ( not ( = ?auto_1834 ?auto_1835 ) ) ( not ( = ?auto_1834 ?auto_1836 ) ) ( not ( = ?auto_1835 ?auto_1836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1835 ?auto_1836 )
      ( !STACK ?auto_1835 ?auto_1834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1840 - BLOCK
      ?auto_1841 - BLOCK
      ?auto_1842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1841 ) ( ON-TABLE ?auto_1842 ) ( CLEAR ?auto_1842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1840 ) ( ON ?auto_1841 ?auto_1840 ) ( not ( = ?auto_1840 ?auto_1841 ) ) ( not ( = ?auto_1840 ?auto_1842 ) ) ( not ( = ?auto_1841 ?auto_1842 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1842 )
      ( !STACK ?auto_1842 ?auto_1841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1846 - BLOCK
      ?auto_1847 - BLOCK
      ?auto_1848 - BLOCK
    )
    :vars
    (
      ?auto_1849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1848 ?auto_1849 ) ( ON-TABLE ?auto_1846 ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( not ( = ?auto_1846 ?auto_1848 ) ) ( not ( = ?auto_1846 ?auto_1849 ) ) ( not ( = ?auto_1847 ?auto_1848 ) ) ( not ( = ?auto_1847 ?auto_1849 ) ) ( not ( = ?auto_1848 ?auto_1849 ) ) ( CLEAR ?auto_1846 ) ( ON ?auto_1847 ?auto_1848 ) ( CLEAR ?auto_1847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1846 ?auto_1847 )
      ( MAKE-3PILE ?auto_1846 ?auto_1847 ?auto_1848 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1853 - BLOCK
      ?auto_1854 - BLOCK
      ?auto_1855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1855 ) ( ON-TABLE ?auto_1853 ) ( not ( = ?auto_1853 ?auto_1854 ) ) ( not ( = ?auto_1853 ?auto_1855 ) ) ( not ( = ?auto_1854 ?auto_1855 ) ) ( CLEAR ?auto_1853 ) ( ON ?auto_1854 ?auto_1855 ) ( CLEAR ?auto_1854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1853 ?auto_1854 )
      ( MAKE-3PILE ?auto_1853 ?auto_1854 ?auto_1855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1859 - BLOCK
      ?auto_1860 - BLOCK
      ?auto_1861 - BLOCK
    )
    :vars
    (
      ?auto_1862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1861 ?auto_1862 ) ( not ( = ?auto_1859 ?auto_1860 ) ) ( not ( = ?auto_1859 ?auto_1861 ) ) ( not ( = ?auto_1859 ?auto_1862 ) ) ( not ( = ?auto_1860 ?auto_1861 ) ) ( not ( = ?auto_1860 ?auto_1862 ) ) ( not ( = ?auto_1861 ?auto_1862 ) ) ( ON ?auto_1860 ?auto_1861 ) ( ON ?auto_1859 ?auto_1860 ) ( CLEAR ?auto_1859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1859 )
      ( MAKE-3PILE ?auto_1859 ?auto_1860 ?auto_1861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1866 - BLOCK
      ?auto_1867 - BLOCK
      ?auto_1868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1868 ) ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1866 ?auto_1868 ) ) ( not ( = ?auto_1867 ?auto_1868 ) ) ( ON ?auto_1867 ?auto_1868 ) ( ON ?auto_1866 ?auto_1867 ) ( CLEAR ?auto_1866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1866 )
      ( MAKE-3PILE ?auto_1866 ?auto_1867 ?auto_1868 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1872 - BLOCK
      ?auto_1873 - BLOCK
      ?auto_1874 - BLOCK
    )
    :vars
    (
      ?auto_1875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1872 ?auto_1873 ) ) ( not ( = ?auto_1872 ?auto_1874 ) ) ( not ( = ?auto_1873 ?auto_1874 ) ) ( ON ?auto_1872 ?auto_1875 ) ( not ( = ?auto_1874 ?auto_1875 ) ) ( not ( = ?auto_1873 ?auto_1875 ) ) ( not ( = ?auto_1872 ?auto_1875 ) ) ( ON ?auto_1873 ?auto_1872 ) ( ON ?auto_1874 ?auto_1873 ) ( CLEAR ?auto_1874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1874 ?auto_1873 ?auto_1872 )
      ( MAKE-3PILE ?auto_1872 ?auto_1873 ?auto_1874 ) )
  )

)

