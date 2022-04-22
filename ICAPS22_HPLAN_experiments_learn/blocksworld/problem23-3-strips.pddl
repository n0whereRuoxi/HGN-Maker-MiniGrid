( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b876 - block
    b646 - block
    b768 - block
    b812 - block
    b338 - block
    b420 - block
    b498 - block
    b683 - block
    b390 - block
    b346 - block
    b817 - block
    b662 - block
    b892 - block
    b422 - block
    b589 - block
    b661 - block
    b996 - block
    b593 - block
    b239 - block
    b625 - block
    b169 - block
    b875 - block
    b638 - block
    b299 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b876 )
    ( on b646 b876 )
    ( on b768 b646 )
    ( on b812 b768 )
    ( on b338 b812 )
    ( on b420 b338 )
    ( on b498 b420 )
    ( on b683 b498 )
    ( on b390 b683 )
    ( on b346 b390 )
    ( on b817 b346 )
    ( on b662 b817 )
    ( on b892 b662 )
    ( on b422 b892 )
    ( on b589 b422 )
    ( on b661 b589 )
    ( on b996 b661 )
    ( on b593 b996 )
    ( on b239 b593 )
    ( on b625 b239 )
    ( on b169 b625 )
    ( on b875 b169 )
    ( on b638 b875 )
    ( on b299 b638 )
    ( clear b299 )
  )
  ( :goal
    ( and
      ( clear b876 )
    )
  )
)
