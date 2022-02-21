( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b978 - block
    b916 - block
    b894 - block
    b462 - block
    b541 - block
    b643 - block
    b127 - block
    b997 - block
    b975 - block
    b395 - block
    b715 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b978 )
    ( on b916 b978 )
    ( on b894 b916 )
    ( on b462 b894 )
    ( on b541 b462 )
    ( on b643 b541 )
    ( on b127 b643 )
    ( on b997 b127 )
    ( on b975 b997 )
    ( on b395 b975 )
    ( on b715 b395 )
    ( clear b715 )
  )
  ( :goal
    ( and
      ( clear b978 )
    )
  )
)
