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
      ?auto_1877 - BLOCK
    )
    :vars
    (
      ?auto_1878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1877 ?auto_1878 ) ( CLEAR ?auto_1877 ) ( HAND-EMPTY ) ( not ( = ?auto_1877 ?auto_1878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1877 ?auto_1878 )
      ( !PUTDOWN ?auto_1877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1884 - BLOCK
      ?auto_1885 - BLOCK
    )
    :vars
    (
      ?auto_1886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1884 ) ( ON ?auto_1885 ?auto_1886 ) ( CLEAR ?auto_1885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1884 ) ( not ( = ?auto_1884 ?auto_1885 ) ) ( not ( = ?auto_1884 ?auto_1886 ) ) ( not ( = ?auto_1885 ?auto_1886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1885 ?auto_1886 )
      ( !STACK ?auto_1885 ?auto_1884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1894 - BLOCK
      ?auto_1895 - BLOCK
    )
    :vars
    (
      ?auto_1896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1895 ?auto_1896 ) ( not ( = ?auto_1894 ?auto_1895 ) ) ( not ( = ?auto_1894 ?auto_1896 ) ) ( not ( = ?auto_1895 ?auto_1896 ) ) ( ON ?auto_1894 ?auto_1895 ) ( CLEAR ?auto_1894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1894 )
      ( MAKE-2PILE ?auto_1894 ?auto_1895 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1905 - BLOCK
      ?auto_1906 - BLOCK
      ?auto_1907 - BLOCK
    )
    :vars
    (
      ?auto_1908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1906 ) ( ON ?auto_1907 ?auto_1908 ) ( CLEAR ?auto_1907 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1905 ) ( ON ?auto_1906 ?auto_1905 ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( not ( = ?auto_1905 ?auto_1907 ) ) ( not ( = ?auto_1905 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1907 ) ) ( not ( = ?auto_1906 ?auto_1908 ) ) ( not ( = ?auto_1907 ?auto_1908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1907 ?auto_1908 )
      ( !STACK ?auto_1907 ?auto_1906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1912 - BLOCK
      ?auto_1913 - BLOCK
      ?auto_1914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1913 ) ( ON-TABLE ?auto_1914 ) ( CLEAR ?auto_1914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1912 ) ( ON ?auto_1913 ?auto_1912 ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1914 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1914 )
      ( !STACK ?auto_1914 ?auto_1913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1918 - BLOCK
      ?auto_1919 - BLOCK
      ?auto_1920 - BLOCK
    )
    :vars
    (
      ?auto_1921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1920 ?auto_1921 ) ( ON-TABLE ?auto_1918 ) ( not ( = ?auto_1918 ?auto_1919 ) ) ( not ( = ?auto_1918 ?auto_1920 ) ) ( not ( = ?auto_1918 ?auto_1921 ) ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1919 ?auto_1921 ) ) ( not ( = ?auto_1920 ?auto_1921 ) ) ( CLEAR ?auto_1918 ) ( ON ?auto_1919 ?auto_1920 ) ( CLEAR ?auto_1919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1918 ?auto_1919 )
      ( MAKE-3PILE ?auto_1918 ?auto_1919 ?auto_1920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1925 - BLOCK
      ?auto_1926 - BLOCK
      ?auto_1927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1927 ) ( ON-TABLE ?auto_1925 ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( not ( = ?auto_1925 ?auto_1927 ) ) ( not ( = ?auto_1926 ?auto_1927 ) ) ( CLEAR ?auto_1925 ) ( ON ?auto_1926 ?auto_1927 ) ( CLEAR ?auto_1926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1925 ?auto_1926 )
      ( MAKE-3PILE ?auto_1925 ?auto_1926 ?auto_1927 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1931 - BLOCK
      ?auto_1932 - BLOCK
      ?auto_1933 - BLOCK
    )
    :vars
    (
      ?auto_1934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1933 ?auto_1934 ) ( not ( = ?auto_1931 ?auto_1932 ) ) ( not ( = ?auto_1931 ?auto_1933 ) ) ( not ( = ?auto_1931 ?auto_1934 ) ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( not ( = ?auto_1932 ?auto_1934 ) ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( ON ?auto_1932 ?auto_1933 ) ( ON ?auto_1931 ?auto_1932 ) ( CLEAR ?auto_1931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1931 )
      ( MAKE-3PILE ?auto_1931 ?auto_1932 ?auto_1933 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1938 - BLOCK
      ?auto_1939 - BLOCK
      ?auto_1940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1940 ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1940 ) ) ( not ( = ?auto_1939 ?auto_1940 ) ) ( ON ?auto_1939 ?auto_1940 ) ( ON ?auto_1938 ?auto_1939 ) ( CLEAR ?auto_1938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1938 )
      ( MAKE-3PILE ?auto_1938 ?auto_1939 ?auto_1940 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1944 - BLOCK
      ?auto_1945 - BLOCK
      ?auto_1946 - BLOCK
    )
    :vars
    (
      ?auto_1947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1944 ?auto_1945 ) ) ( not ( = ?auto_1944 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( ON ?auto_1944 ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( not ( = ?auto_1944 ?auto_1947 ) ) ( ON ?auto_1945 ?auto_1944 ) ( ON ?auto_1946 ?auto_1945 ) ( CLEAR ?auto_1946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1946 ?auto_1945 ?auto_1944 )
      ( MAKE-3PILE ?auto_1944 ?auto_1945 ?auto_1946 ) )
  )

)

