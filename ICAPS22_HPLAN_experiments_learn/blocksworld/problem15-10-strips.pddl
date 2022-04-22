( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b627 - block
    b78 - block
    b826 - block
    b353 - block
    b773 - block
    b48 - block
    b748 - block
    b825 - block
    b190 - block
    b687 - block
    b399 - block
    b857 - block
    b209 - block
    b581 - block
    b331 - block
    b518 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b627 )
    ( on b78 b627 )
    ( on b826 b78 )
    ( on b353 b826 )
    ( on b773 b353 )
    ( on b48 b773 )
    ( on b748 b48 )
    ( on b825 b748 )
    ( on b190 b825 )
    ( on b687 b190 )
    ( on b399 b687 )
    ( on b857 b399 )
    ( on b209 b857 )
    ( on b581 b209 )
    ( on b331 b581 )
    ( on b518 b331 )
    ( clear b518 )
  )
  ( :goal
    ( and
      ( clear b627 )
    )
  )
)
