( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b549 - block
    b801 - block
    b685 - block
    b945 - block
    b860 - block
    b278 - block
    b941 - block
    b428 - block
    b367 - block
    b635 - block
    b112 - block
    b816 - block
    b501 - block
    b296 - block
    b127 - block
    b937 - block
    b615 - block
    b390 - block
    b520 - block
    b82 - block
    b710 - block
    b947 - block
    b154 - block
    b81 - block
    b881 - block
    b687 - block
    b434 - block
    b376 - block
    b508 - block
    b132 - block
    b979 - block
    b793 - block
    b451 - block
    b607 - block
    b378 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b549 )
    ( on b801 b549 )
    ( on b685 b801 )
    ( on b945 b685 )
    ( on b860 b945 )
    ( on b278 b860 )
    ( on b941 b278 )
    ( on b428 b941 )
    ( on b367 b428 )
    ( on b635 b367 )
    ( on b112 b635 )
    ( on b816 b112 )
    ( on b501 b816 )
    ( on b296 b501 )
    ( on b127 b296 )
    ( on b937 b127 )
    ( on b615 b937 )
    ( on b390 b615 )
    ( on b520 b390 )
    ( on b82 b520 )
    ( on b710 b82 )
    ( on b947 b710 )
    ( on b154 b947 )
    ( on b81 b154 )
    ( on b881 b81 )
    ( on b687 b881 )
    ( on b434 b687 )
    ( on b376 b434 )
    ( on b508 b376 )
    ( on b132 b508 )
    ( on b979 b132 )
    ( on b793 b979 )
    ( on b451 b793 )
    ( on b607 b451 )
    ( on b378 b607 )
    ( clear b378 )
  )
  ( :goal
    ( and
      ( clear b549 )
    )
  )
)
