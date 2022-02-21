( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b986 - block
    b252 - block
    b493 - block
    b730 - block
    b410 - block
    b780 - block
    b662 - block
    b339 - block
    b30 - block
    b619 - block
    b834 - block
    b976 - block
    b594 - block
    b735 - block
    b391 - block
    b936 - block
    b781 - block
    b35 - block
    b831 - block
    b891 - block
    b458 - block
    b824 - block
    b77 - block
    b512 - block
    b842 - block
    b363 - block
    b191 - block
    b801 - block
    b299 - block
    b649 - block
    b459 - block
    b770 - block
    b241 - block
    b889 - block
    b371 - block
    b49 - block
    b253 - block
    b989 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b986 )
    ( on b252 b986 )
    ( on b493 b252 )
    ( on b730 b493 )
    ( on b410 b730 )
    ( on b780 b410 )
    ( on b662 b780 )
    ( on b339 b662 )
    ( on b30 b339 )
    ( on b619 b30 )
    ( on b834 b619 )
    ( on b976 b834 )
    ( on b594 b976 )
    ( on b735 b594 )
    ( on b391 b735 )
    ( on b936 b391 )
    ( on b781 b936 )
    ( on b35 b781 )
    ( on b831 b35 )
    ( on b891 b831 )
    ( on b458 b891 )
    ( on b824 b458 )
    ( on b77 b824 )
    ( on b512 b77 )
    ( on b842 b512 )
    ( on b363 b842 )
    ( on b191 b363 )
    ( on b801 b191 )
    ( on b299 b801 )
    ( on b649 b299 )
    ( on b459 b649 )
    ( on b770 b459 )
    ( on b241 b770 )
    ( on b889 b241 )
    ( on b371 b889 )
    ( on b49 b371 )
    ( on b253 b49 )
    ( on b989 b253 )
    ( clear b989 )
  )
  ( :goal
    ( and
      ( clear b986 )
    )
  )
)
